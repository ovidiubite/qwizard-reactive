class BookPage::Component < ApplicationViewComponent
  option :basic, default: proc { true }
  option :logo, default: proc { false }
end