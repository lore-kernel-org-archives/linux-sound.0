From: Dave Mielke <dave@mielke.cc>
Date: Wed, 12 Apr 2000 20:46:39 +0000
Subject: ALSA
Message-Id: <marc-linux-sound-95557469806551@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

The INSTALL file for the ALSA driver describes a special control file named
"/proc/asound/0/pcmD0o". It says that a line like the following can be written
to this file:

    Playback <app_name> <fragments> <fragment_size> [<options>]

The description of the <app_name> parameter says:

    <app_name> - name of application with (higher priority) or without path

Does anyone know what the phrase "higher priority" here actually means? Also,
what is the syntax for assigning a priority to an application?

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
