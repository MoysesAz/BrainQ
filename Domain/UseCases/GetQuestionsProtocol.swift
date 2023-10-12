import Foundation

protocol GetQuestionsProtocol {
    func getQuestions(trivialModel: TrivialModel, completion: @escaping (Result<TrivialModel, DomainErros>) -> Void)
}
