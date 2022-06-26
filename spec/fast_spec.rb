require_relative "setup"

RSpec.describe Fast do
  let(:array) { [2, 1, 3] }

  describe "#map" do
    let(:array) { [3, 2, 1] }

    context do
      subject { fast(array).map { _1 * 2 } }
      it { is_expected.to eq([6, 4, 2]) }
      it { is_expected.to eq(array.map { _1 * 2 }) }
    end
  end

  describe "#select" do
    let(:array) { [3, 1, 2, 5, 1, 1] }

    context do
      subject { fast(array).select { _1 == 1 } }
      it { is_expected.to eq([1, 1, 1]) }
      it { is_expected.to eq(array.select { _1 == 1 }) }
    end
  end

  describe "#reject" do
    context do
      subject { fast(array).reject { _1 != 1 } }
      it { is_expected.to eq([1]) }
      it { is_expected.to eq(array.reject { _1 != 1 }) }
    end
  end

  describe "#find" do
    context do
      subject { fast(array).find { _1 == 1 } }
      it { is_expected.to eq(1) }
      it { is_expected.to eq(array.find { _1 == 1 }) }
    end
  end

  describe "#count" do
    context do
      subject { fast(array).count { _1 == 1 } }
      it { is_expected.to eq(1) }
      it { is_expected.to eq(array.count { _1 == 1 }) }
    end
  end

  describe "#any?" do
    context do
      subject { fast(array).any? { _1 == 1 } }
      it { is_expected.to be(true) }
      it { is_expected.to eq(array.any? { _1 == 1 }) }
    end
  end

  describe "#sum" do
    context do
      subject { fast(array).sum { _1 } }
      it { is_expected.to eq(6) }
      it { is_expected.to eq(array.sum { _1 }) }
    end
  end
end
