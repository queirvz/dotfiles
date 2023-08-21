#! /bin/zsh

echo <<EOL
direction: right
git_repo: Git Repository

create: Producer Flow {
    edit_page: Edit Page
    edit_page.shape: page

    publish_worker: Publisher

    edit_page -> publish_worker -> _.consume.topic_pubreq
}

consume: Consumer Flow {
     topic_pubreq: Publish Request Topic
     topic_pubreq.shape: queue

     topic_pubreq -> publisher_logic

     publisher_logic: Processes To Publish Or Defer {
              process_worker_1: Process Worker 1
              process_worker_2: Process_Worker 2

              process_worker_1 --> _.topic_pubreq: If draft or delayed
              process_worker_2 --> _._.git_repo: Publish to git repository

              explanation: |md
              These will either
              * publish now
              * ignore based on if it is a draft,
              * or put back into queue if it needs to be delayed.

              Multiple processes handle imaginary needs for scale, something
              that would make Kafka shine here. :)
              |
     }
}
EOL > input.d2

d2 -w input_02.d2 out_02.svg

