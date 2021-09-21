# M3U

M3U (MP3 URL[1][2] or Moving Picture Experts Group Audio Layer 3 Uniform Resource Locator[3] in full) is a computer file format for a multimedia playlist. One common use of the M3U file format is creating a single-entry playlist file pointing to a stream on the Internet. The created file provides easy access to that stream and is often used in downloads from a website, for emailing, and for listening to Internet radio.

Although originally designed for audio files, such as MP3, it is commonly used to point media players to audio and video sources, including online sources. M3U was originally developed by Fraunhofer for use with their Winplay3 software,[4] but numerous media players and software applications now support the format.

# EXTINF
EXTINF: A record marker that describes the media file identified by the URL that follows it. Each media file URL must be preceded by an EXTINF tag. This tag contains a duration attribute that's an integer or floating-point number in decimal positional notation that specifies the duration of the media segment in seconds. This value must be less than or equal to the target duration.
