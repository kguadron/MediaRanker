require "test_helper"

describe Work do
  let(:work) { Work.new(category: "book", title: 'test book', creator: "author", publication_year: 2019) }

  it "must be valid with good data" do
    value(work).must_be :valid?
  end

  it "fails without a category" do
    work.category = nil

    result = work.valid?

    expect(result).must_equal false
    expect(work.errors.messages).must_include :category
  end

  it "fails without a title" do
    work.title = nil

    result = work.valid?

    expect(result).must_equal false
    expect(work.errors.messages).must_include :title
  end

  it "fails without a creator" do
    work.creator = nil

    result = work.valid?

    expect(result).must_equal false
    expect(work.errors.messages).must_include :creator
  end

  it "fails without a publication year" do
    work.publication_year = nil

    result = work.valid?

    expect(result).must_equal false
    expect(work.errors.messages).must_include :publication_year
  end

  it "fails if the publication year isn't an integer" do
    work.publication_year = "year"

    result = work.valid?

    expect(result).must_equal false
    expect(work.errors.messages).must_include :publication_year
  end

end
