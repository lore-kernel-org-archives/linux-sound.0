From: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Date: Fri, 01 Aug 2003 00:48:32 +0000
Subject: [TRIVIAL][2.6.0-test2] move "config SOUND" to sound/Kconfig
Message-Id: <marc-linux-sound-105969900601314@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Hi,

http://home.elka.pw.edu.pl/~bzolnier/sound-Kconfig.patch
[ I think there is no need to increase traffic... ]

move "config SOUND" to sound/Kconfig

Allows all architectures to simply include the sound/Kconfig file.
Now somebody can finally update comment for CONFIG_SOUND ;-).

 arch/alpha/Kconfig     |   34 ----------------------------------
 arch/arm/Kconfig       |   35 ++---------------------------------
 arch/arm26/Kconfig     |   35 ++---------------------------------
 arch/cris/Kconfig      |   35 -----------------------------------
 arch/i386/Kconfig      |   34 ----------------------------------
 arch/ia64/Kconfig      |   19 -------------------
 arch/m68k/Kconfig      |   10 +---------
 arch/m68knommu/Kconfig |   34 ----------------------------------
 arch/parisc/Kconfig    |   34 ----------------------------------
 arch/ppc/Kconfig       |   37 -------------------------------------
 arch/ppc64/Kconfig     |   34 ----------------------------------
 arch/sh/Kconfig        |   34 ----------------------------------
 arch/sparc/Kconfig     |   35 -----------------------------------
 arch/sparc64/Kconfig   |   35 -----------------------------------
 arch/v850/Kconfig      |   34 ----------------------------------
 arch/x86_64/Kconfig    |   35 -----------------------------------
 sound/Kconfig          |   41 +++++++++++++++++++++++++++++++++++++++++
 17 files changed, 46 insertions(+), 509 deletions(-)

--
Bartlomiej

