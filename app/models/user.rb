class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :age, numericality: { greater_than_or_equal_to: 0 }

  def experience
    self.work_experience
  end
  
  def experience=(experience_params)
    self.work_experience = markdown(experience_params)
  end

  def user_skill
    self.skill
  end

  def user_skill=(skill_params)
    self.skill = markdown(skill_params)
  end

  def markdown(text)
    markdown_render = Redcarpet::Render::HTML.new(hard_wrap: true, no_styles: true)
    markdown = Redcarpet::Markdown.new(markdown_render, autolink: true, no_intro_emphasis: true) 
    markdown.render(text).html_safe
  end
end
