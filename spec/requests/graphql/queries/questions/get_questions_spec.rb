require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'onboarding questions' do
    it 'can query all onboarding questions' do

      Question.create!(name: 'Question 1', question: 'What is your favorite color?', onboarding: true)
      Question.create!(name: 'Question 2', question: 'What is your favorite animal?', onboarding: true)
      Question.create!(name: 'Question 3', question: 'What is your favorite food?', onboarding: false)

      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)

      expect(result['data']['getOnboardingQuestions'].count).to eq(2)
      
      onboarding_questions = Question.where(onboarding: true)
      expect(result.dig('data', 'getOnboardingQuestions')).to match_array(
        onboarding_questions.map do |question|
          {
            'id' => question.id.to_s,
            'name' => question.name,
            'question' => question.question,
            'onboarding' => question.onboarding
          }
        end
      )
    end
  end

  def query
    <<~GQL
      {
        getOnboardingQuestions {
          id
          name
          question
          onboarding
        }
      }
    GQL
  end
end
