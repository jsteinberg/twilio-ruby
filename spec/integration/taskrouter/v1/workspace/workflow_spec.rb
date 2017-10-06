##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Workflow' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .workflows("WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "assignment_callback_url": "http://example.com",
          "configuration": "task-routing:\\n  - filter: \\n      - 1 == 1\\n    target:\\n      - queue: WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\\n        set-priority: 0\\n",
          "date_created": "2014-05-14T10:50:02Z",
          "date_updated": "2014-05-14T23:26:06Z",
          "document_content_type": "application/json",
          "fallback_assignment_callback_url": null,
          "friendly_name": "Default Fifo Workflow",
          "sid": "WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_reservation_timeout": 120,
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
              "real_time_statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RealTimeStatistics",
              "cumulative_statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CumulativeStatistics"
          }
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .workflows("WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .workflows("WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "assignment_callback_url": "http://example.com",
          "configuration": "task-routing:\\n  - filter: \\n      - 1 == 1\\n    target:\\n      - queue: WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\\n        set-priority: 0\\n",
          "date_created": "2014-05-14T10:50:02Z",
          "date_updated": "2014-05-14T23:26:06Z",
          "document_content_type": "application/json",
          "fallback_assignment_callback_url": null,
          "friendly_name": "Default Fifo Workflow",
          "sid": "WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_reservation_timeout": 120,
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
              "real_time_statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RealTimeStatistics",
              "cumulative_statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CumulativeStatistics"
          },
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .workflows("WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .workflows("WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .workflows("WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").delete()

    expect(actual).to eq(true)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .workflows.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows?PageSize=50&Page=0",
              "key": "workflows",
              "last_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows?PageSize=50&Page=0",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows?PageSize=50&Page=0"
          },
          "workflows": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "assignment_callback_url": "http://example.com",
                  "configuration": "task-routing:\\n  - filter: \\n      - 1 == 1\\n    target:\\n      - queue: WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\\n        set-priority: 0\\n",
                  "date_created": "2014-05-14T10:50:02Z",
                  "date_updated": "2014-05-15T16:47:51Z",
                  "document_content_type": "application/json",
                  "fallback_assignment_callback_url": null,
                  "friendly_name": "Default Fifo Workflow",
                  "sid": "WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "task_reservation_timeout": 120,
                  "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
                      "real_time_statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RealTimeStatistics",
                      "cumulative_statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CumulativeStatistics"
                  },
                  "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
              }
          ]
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .workflows.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows?PageSize=50&Page=0",
              "key": "workflows",
              "last_page_url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows?PageSize=50&Page=0",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows?PageSize=50&Page=0"
          },
          "workflows": []
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .workflows.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .workflows.create(friendly_name: "friendly_name", configuration: "configuration")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'FriendlyName' => "friendly_name",
        'Configuration' => "configuration",
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "assignment_callback_url": "http://example.com",
          "configuration": "task-routing:\\n  - filter: \\n      - 1 == 1\\n    target:\\n      - queue: WQaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\\n        set-priority: 0\\n",
          "date_created": "2014-05-14T10:50:02Z",
          "date_updated": "2014-05-14T23:26:06Z",
          "document_content_type": "application/json",
          "fallback_assignment_callback_url": null,
          "friendly_name": "Default Fifo Workflow",
          "sid": "WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "task_reservation_timeout": 120,
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
              "real_time_statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/RealTimeStatistics",
              "cumulative_statistics": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CumulativeStatistics"
          }
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .workflows.create(friendly_name: "friendly_name", configuration: "configuration")

    expect(actual).to_not eq(nil)
  end
end