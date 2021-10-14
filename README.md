
This started as a narration for memory/refference of what I considered and used to choose and configured a PC for myself.

Then it evolved as I passed everything onto a pen to configure several PCs. And now it got into a remote repo.

As I chose Ubuntu Unity 20.04.2 (@ year 2021) expect to find this project suiting that flavour - but any Ubuntu flavour should work without issues and most debian based using gtk should beave fairly well.

# Running the Program
1. Install git with:

    ```bash
    sudo apt install git
    ```
2. Clone this repo to your machine with:

    ```bash
    git clone 
    ```
3. (optional) Change the configurations to be used (or don't!) - instructions [here](#change-your-config-file-or-dont)
4. Run the Program

    ```bash
    ./configure-my-ubuntu.sh
    ```

**Congratulations!** You have replicated the configuration I use! (not sure that is congratulable though... [nor that the word congratulable exists {aaanywayss!!...}]). 



---

# What does the default configuration do?

---

# Change your Config File (or don't!)
There is a `defaul-config.conf` file. In there all the possibly used parameters are set - so that you may just run the program and not care about a thing!

If you wish to override any of the defaults, copy the line form `defaul.conf`, and paste it into `custom.conf` before running the program. As the program load the first the defaults and only then the custons, the values present in `custom.conf` will always override the defaults.

The details to change each value follow:

## Date Format

## Wallpaper



---



# Some Insight
## Aptitude, Snap, repos PPAs and all that... 

## GSettings
GSettings is an API that allows you to access key/value pairs (e.g., persistent application settings) without directly talking to the actual backend that stores that data (config files, gconf, dconf).

Key pairs which are set in a dconf profile will override the default settings unless there is a problem with the value that you have set.

You can browse this pairs using the `gsettings` command or in a GUI using `dconf-editor`. To install 'dconf-editor' use:
```bash
sudo apt install dconf-editor
```
or
```bash
sudo apt install dconf-tools
```