From: Keith Owens <kaos@ocs.com.au>
Date: Thu, 09 Aug 2001 23:58:52 +0000
Subject: kbuild 2.5 sound testing required
Message-Id: <marc-linux-sound-99740155926233@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Kernel build 2.5 has been released.

http://marc.theaimsgroup.com/?l=3Dlinux-kernel&m=99725412902968&w=3D2

I have tested this on the full kernel, with a few exceptions where I do
not have the required files or hardware.  I could not test these sound
options.

# I don't have the required input files to build the sound firmware.
# If anybody has them and can test, go for it.
CONFIG_PSS_HAVE_BOOT=3Dn
CONFIG_MAUI_HAVE_BOOT=3Dn
CONFIG_TRIX_HAVE_BOOT=3Dn

# _SOUND_MSNDCLAS=3Dy and _SOUND_MSNDPIN=3Dy insist on having firmware that
# I don't have.
CONFIG_SOUND_MSNDCLAS=3Dm
CONFIG_SOUND_MSNDPIN=3Dm

I would appreciate somebody testing kbuild 2.5 with these options, and
letting me know if it works or not.  cc me please, I am not on the list.

CONFIG_PSS_HAVE_BOOT=3Dn
CONFIG_MAUI_HAVE_BOOT=3Dy
CONFIG_TRIX_HAVE_BOOT=3Dy
ONFIG_SOUND_MSNDCLAS=3Dy
CONFIG_SOUND_MSNDPIN=3Dy

