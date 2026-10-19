import os
from pathlib import Path

# --- CONFIGURATION ---
# Define the absolute or relative paths to your source folders inside your dotfiles
DOTFILES_DIR = Path(__file__).parent.resolve()  # Assumes script is inside your dotfiles folder

CONFIG = {
    # "source_folder_name": Path("target_destination_directory")
    "fonts": Path.home() / ".local/share/fonts",
    "themes": Path.home() / ".themes",
    "icons": Path.home() / ".icons"
}

def create_symlink(source_dir: Path, target_parent: Path):
    if not source_dir.exists():
        print(f"⚠️ Source directory not found: {source_dir}, skipping.")
        return

    # Ensure the destination parent folder (like ~/.local/share/fonts) exists
    target_parent.mkdir(parents=True, exist_ok=True)

    # Name of the symlink inside the target directory (e.g., ~/.local/share/fonts/dotfiles-fonts)
    link_name = f"dotfiles-{source_dir.name}"
    target_link = target_parent / link_name

    # Handle existing files/links safely
    if target_link.exists() or target_link.is_symlink():
        if target_link.is_symlink() and target_link.readlink() == source_dir:
            print(f"✅ Already linked: {target_link} -> {source_dir}")
            return
        else:
            print(f"🔄 Replacing existing item at {target_link}...")
            if target_link.is_dir() and not target_link.is_symlink():
                import shutil
                shutil.rmtree(target_link)
            else:
                target_link.unlink()

    # Create the symbolic link
    try:
        target_link.symlink_to(source_dir, target_is_directory=True)
        print(f"🔗 Created link: {target_link} -> {source_dir}")
    except OSError as e:
        print(f"❌ Failed to create symlink for {source_dir.name}: {e}")

def main():
    print("🚀 Starting dotfiles assets installation...")
    
    # Iterate through each defined asset type
    for folder_name, target_path in CONFIG.items():
        source_folder = DOTFILES_DIR / folder_name
        create_symlink(source_folder, target_path)

    # Refresh the system font cache automatically
    print("\n🔄 Refreshing font cache...")
    os.system("fc-cache -fv > /dev/null 2>&1")
    print("✨ Installation complete!")

if __name__ == "__main__":
    main()
