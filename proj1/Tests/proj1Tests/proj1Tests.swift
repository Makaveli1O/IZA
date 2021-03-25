import XCTest
import class Foundation.Bundle

import MyFiniteAutomatas

@available(macOS 10.13, *)
final class proj1Tests: XCTestCase {

    var directory: URL = { () -> URL in
        let folderName = ProcessInfo.processInfo.globallyUniqueString
        let url = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent(folderName)
        try! FileManager.default.createDirectory(at: url, withIntermediateDirectories: false)
        return url
    }()


    deinit {
        try? FileManager.default.removeItem(at: directory)
    }

    func createFile(content: String, dir: URL) -> URL {
        let fileName = UUID().uuidString
        let fileURL = dir.appendingPathComponent(fileName)
        try! content.write(to: fileURL, atomically: true, encoding: .utf8)
        return fileURL
    }

    func removeFile(url: URL) {
        try? FileManager.default.removeItem(at: url)
    }

    func testAstarC2Bstar() throws {
        runProcess(automata: AstarC2Bstar.self, testValidClosure: { (res, arg1) in
            let (input, states) = arg1
            XCTAssertNil(res.asFailure)
            XCTAssertTrue(res.isSuccess)
            let out = res.asSuccess?.description ?? "nil"
            let expected = states.joined(separator: "\n") + "\n"
            let outDesc = out.replacingOccurrences(of: "\n", with: "\\n")
            let expDesc = expected.replacingOccurrences(of: "\n", with: "\\n")
            XCTAssertEqual(out, expected)
            XCTAssertEqual(outDesc, expDesc, "Output '\(outDesc)' for input string '\(input)' is not equal to expected '\(expDesc)'")
        }, testInvalidClosure: { (res, input) in
            XCTAssertNil(res.asSuccess)
            XCTAssertTrue(res.isFailure)
            XCTAssertEqual(res.asFailure?.type, .notAccepted)
        })
    }

    func testCIdentifierAutomata() throws {
        runProcess(automata: CIdentifierAutomata.self, testValidClosure: { (res, arg1) in
            let (input, states) = arg1
            XCTAssertNil(res.asFailure)
            XCTAssertTrue(res.isSuccess)
            let out = res.asSuccess?.description ?? "nil"
            let expected = states.joined(separator: "\n") + "\n"
            let outDesc = out.replacingOccurrences(of: "\n", with: "\\n")
            let expDesc = expected.replacingOccurrences(of: "\n", with: "\\n")
            XCTAssertEqual(out, expected)
            XCTAssertEqual(outDesc, expDesc, "Output '\(outDesc)' for input string '\(input)' is not equal to expected '\(expDesc)'")
        }, testInvalidClosure: { (res, input) in
            XCTAssertNil(res.asSuccess)
            XCTAssertTrue(res.isFailure)
            XCTAssertEqual(res.asFailure?.type, .notAccepted)
        })
    }

    func testAstar_Cstar_Bstar() throws {
        runProcess(automata: Astar_Bstar_Cstar.self, testValidClosure: { (res, arg1) in
            let (input, states) = arg1
            XCTAssertNil(res.asFailure)
            XCTAssertTrue(res.isSuccess)
            let out = res.asSuccess?.description ?? "nil"
            let expected = states.joined(separator: "\n") + "\n"
            let outDesc = out.replacingOccurrences(of: "\n", with: "\\n")
            let expDesc = expected.replacingOccurrences(of: "\n", with: "\\n")
            XCTAssertEqual(out, expected)
            XCTAssertEqual(outDesc, expDesc, "Output '\(outDesc)' for input string '\(input)' is not equal to expected '\(expDesc)'")
        }, testInvalidClosure: { (res, input) in
            XCTAssertNil(res.asSuccess)
            XCTAssertTrue(res.isFailure)
            XCTAssertEqual(res.asFailure?.type, .notAccepted)
        })
    }

    struct ProcessError: Error {
        let type: ProcessErrorType
        let stderr: String?
        

        init(_ type: ProcessErrorType, stderr: String? = nil) {
            self.type = type
            self.stderr = stderr
        }

        enum ProcessErrorType: Error {
            case runError
            case invalidOutputEncoding
            case unknownError
            case notAccepted
            case missingSymbol
            case missingState
        }
    }

    func runFailingProcess<T>(automata: T.Type = T.self, input: String = "", testClosure: (Result<String, ProcessError>) -> Void) where T: ExampleStringAutomata {

        let process = Process()
        let fooBinary = productsDirectory.appendingPathComponent("proj1")
        process.executableURL = fooBinary
        process.currentDirectoryURL = productsDirectory

        let url = createFile(content: T.description.description, dir: productsDirectory)
        defer { removeFile(url: url) }

        let args = [input, url.lastPathComponent]
        let runResult = runProcess(arguments: args)
        testClosure(runResult)
    }

    func runProcess<T>(automata: T.Type = T.self, testValidClosure: (Result<String, ProcessError>, (String, [String])) -> Void, testInvalidClosure: (Result<String, ProcessError>, String) -> Void) where T: ExampleStringAutomata & ExampleAutomataInputs {
        print(automata)
        print(productsDirectory.absoluteString)
        let process = Process()
        let fooBinary = productsDirectory.appendingPathComponent("proj1")
        process.executableURL = fooBinary
        process.currentDirectoryURL = productsDirectory

        let url = createFile(content: T.description.description, dir: productsDirectory)
        defer { removeFile(url: url) }
        T.valid.forEach { input, states in
            let args = [input, url.lastPathComponent]
            let runResult = runProcess(arguments: args)
            testValidClosure(runResult, (input, states))
        }

        T.invalid.forEach { input in
            let args = [input, url.lastPathComponent]
            let runResult = runProcess(arguments: args)
            testInvalidClosure(runResult, input)
        }
    }

    func runProcess(arguments: [String]) -> Result<String, ProcessError> {
        let process = Process()
        let fooBinary = productsDirectory.appendingPathComponent("proj1")
        process.executableURL = fooBinary
        process.currentDirectoryURL = productsDirectory

        let pipe = Pipe()
        process.standardOutput = pipe
        let stderrPipe = Pipe()
        process.standardError = stderrPipe
        process.arguments = arguments
        do {
            try process.run()
        } catch {
            return .failure(.init(.runError))
        }
        process.waitUntilExit()
        let code = process.terminationStatus
        switch code {
        case 0:
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            guard let output = String(data: data, encoding: .utf8) else {
                return .failure(.init(.invalidOutputEncoding))
            }
            return .success(output)
        case 6:
            return .failure(.init(.notAccepted))
        case 21:
            return .failure(.init(.missingState))
        case 22:
            return .failure(.init(.missingSymbol))
        default:
            let data = stderrPipe.fileHandleForReading.readDataToEndOfFile()
            let output = String(data: data, encoding: .utf8)
            return .failure(.init(.unknownError, stderr: output))
        }
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testAstarC2Bstar", testAstarC2Bstar),
        ("testCIdentifierAutomata", testCIdentifierAutomata),
        ("testAstar_Cstar_Bstar", testAstar_Cstar_Bstar)
    ]
}

extension Result {
    var asFailure: Failure? {
        switch self {
        case .failure(let err):
            return err
        case .success:
            return nil
        }
    }
    var asSuccess: Success? {
        switch self {
        case .failure:
            return nil
        case .success(let s):
            return s
        }
    }

    var isSuccess: Bool {
        return asFailure == nil
    }
    var isFailure: Bool {
        return !isSuccess
    }
}
