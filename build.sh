#!/bin/bash
echo "MKDocs Build Utility"

PS3="Please select which site to build: "
options=("resume.sayaji.dev" "blog.sayaji.dev" "sayaji.dev" "quit")
select opt in "${options[@]}"; do
    case $opt in

        "resume.sayaji.dev")
            rm -rf resume.sayaji.dev
            mkdocs build -f mkdocs-resume.yml -d resume.sayaji.dev

            if [ -d "resume.sayaji.dev" ] && [ "$(ls -A resume.sayaji.dev)" ]; then
                echo "✔ Build successful: resume.sayaji.dev generated."
            else
                echo "❌ Build failed — directory missing or empty."
                exit 1
            fi
            ;;

        "blog.sayaji.dev")
            rm -rf blog.sayaji.dev
            mkdocs build -f mkdocs-blog.yml -d blog.sayaji.dev

            if [ -d "blog.sayaji.dev" ] && [ "$(ls -A blog.sayaji.dev)" ]; then
                echo "✔ Build successful: blog.sayaji.dev generated."
            else
                echo "❌ Build failed — directory missing or empty."
                exit 1
            fi
            ;;

        "sayaji.dev")
            rm -rf sayaji.dev
            mkdocs build -f mkdocs-main.yml -d sayaji.dev

            if [ -d "sayaji.dev" ] && [ "$(ls -A sayaji.dev)" ]; then
                echo "✔ Build successful: sayaji.dev generated."
            else
                echo "❌ Build failed — directory missing or empty."
                exit 1
            fi
            ;;

        "quit")
            echo "Goodbye."
            break
            ;;

        *)
            echo "Invalid option — try again."
            ;;
    esac
done

