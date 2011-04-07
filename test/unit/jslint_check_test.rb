require 'minitest/autorun'
require 'pre-commit/checks/jslint_check'

# TODO remove this #ugly
require 'pre-commit/checks'

class JslintCheckTest < MiniTest::Unit::TestCase

  def test_should_not_run_if_therubyracer_is_not_installed
    check = PreCommit::JslintCheck.new
    check.therubyracer_installed = false
    assert !check.should_run?
  end

  def test_should_run_all_by_default
    check = PreCommit::JslintCheck.new
    assert_equal(PreCommit::JSLintAll, check.check_to_run)
  end

  def test_should_run_new_if_specified
    check = PreCommit::JslintCheck.new(:new)
    assert_equal(PreCommit::JSLintNew, check.check_to_run)
  end

end