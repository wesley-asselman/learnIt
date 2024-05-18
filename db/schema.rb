# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_05_13_114947) do

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.integer "amount"
    t.integer "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_assignments_on_subject_id"
  end

  create_table "concepts", force: :cascade do |t|
    t.string "title"
    t.text "explanation"
    t.integer "page"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "glossary_id"
    t.text "note"
  end

  create_table "enemies", force: :cascade do |t|
    t.string "name"
    t.boolean "has_killed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "explanation"
    t.integer "year"
    t.integer "timeline_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["timeline_id"], name: "index_events_on_timeline_id"
  end

  create_table "glossaries", force: :cascade do |t|
    t.string "title"
    t.integer "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "index_glossaries_on_subject_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "test_id"
    t.integer "concept_id"
    t.string "answers"
    t.integer "selected_answer"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["concept_id"], name: "index_questions_on_concept_id"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "glossary_id"
    t.integer "question_amount"
    t.integer "last_answered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_finished"
    t.index ["glossary_id"], name: "index_tests_on_glossary_id"
    t.index ["subject_id"], name: "index_tests_on_subject_id"
  end

  create_table "timelines", force: :cascade do |t|
    t.integer "glossary_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["glossary_id"], name: "index_timelines_on_glossary_id"
  end

end
