import UIKit

final class MovieQuizViewController: UIViewController {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet private var noButton: UIButton!
    @IBOutlet private var yesButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var alertPresenter: AlertPresenter?
    
    private var presenter: MovieQuizPresenter!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MovieQuizPresenter(viewController: self)
        
        imageView.layer.cornerRadius = 20
        
        alertPresenter = AlertPresenterImpl(viewController: self)
        
        showLoadingIndicator()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Private functions
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.noButtonClicked()
        //        yesButton.isEnabled = false
        //        noButton.isEnabled = false
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        presenter.yesButtonClicked()
        //        yesButton.isEnabled = false
        //        noButton.isEnabled = false
    }
    
    func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    func showAnswerResult(isCorrect: Bool) {
        presenter.didAnswer(isCorrectAnswer: isCorrect)
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.presenter.showNextQuestionOrResults()
        }
    }
    
    //    private func showNextQuestionOrResults() {
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
    //            guard let self = self else { return }
    //            self.imageView.layer.borderWidth = 0
    //            self.yesButton.isEnabled = true
    //            self.noButton.isEnabled = true
    //        }
    //    }
    
    func showFinalResults() {
        let message = presenter.makeResultMessage()
        
        let alertModel = AlertModel(
            title: "Этот раунд окончен!",
            message: message,
            buttonText: "Сыграть еще раз",
            completion: { [weak self] in
                guard let self = self else { return }
                
                self.presenter.restartGame()
            }
        )
        alertPresenter?.show(alertModel: alertModel)
    }
    
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }
    
    func showNetworkError(message: String) {
        hideLoadingIndicator()
        
        let alertModel = AlertModel(
            title: "Ошибка",
            message: message,
            buttonText: "Попробовать еще раз",
            completion: { [weak self] in
                guard let self = self else { return }
                
                self.presenter.restartGame()
            }
        )
        alertPresenter?.show(alertModel: alertModel)
    }
}
//
//// MARK: QuestionFactoryDelegate
//
//extension MovieQuizViewController: QuestionFactoryDelegate {
//
//     func didLoadDataFromServer() {
//         activityIndicator.isHidden = true
//         questionFactory?.requestNextQuestion()
//     }
//
//     func didFailToLoadData(with error: Error) {
//         showNetworkError(message: error.localizedDescription)
//     }
//
//    func didRecieveNextQuestion(question: QuizQuestion?) {
//        presenter.didRecieveNextQuestion(question: question)
//    }
//
//}
