From: Michal Semler <cijoml@volny.cz>
Date: Wed, 09 Apr 2003 21:55:32 +0000
Subject: Can't compile 2.4.21-pre7
Message-Id: <marc-linux-sound-104992539430128@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

Hello,

I have problem compiling 2.4.21-pre7 with gcc-3.0.4

gcc -D__KERNEL__ -I/usr/src/linux-2.4.20/include -Wall -Wstrict-prototypes =

-Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer=20
-pipe -mpreferred-stack-boundary=3D2 -march=3Di686 -DMODULE -DMODVERSIONS=20
-include /usr/src/linux-2.4.20/include/linux/modversions.h  -nostdinc=20
-iwithprefix include -DKBUILD_BASENAME=AC97_codec  -DEXPORT_SYMTAB -c=20
ac97_codec.c
ac97_codec.c:131: `AC97_NO_PCM_VOLUME' undeclared here (not in a function)
ac97_codec.c:131: initializer element is not constant
ac97_codec.c:131: (near initialization for `ac97_codec_ids[12].flags')
ac97_codec.c:131: initializer element is not constant
ac97_codec.c:131: (near initialization for `ac97_codec_ids[12]')
ac97_codec.c:132: `AC97_NO_PCM_VOLUME' undeclared here (not in a function)
ac97_codec.c:132: initializer element is not constant
ac97_codec.c:132: (near initialization for `ac97_codec_ids[13].flags')
ac97_codec.c:132: initializer element is not constant
ac97_codec.c:132: (near initialization for `ac97_codec_ids[13]')
ac97_codec.c:133: `AC97_NO_PCM_VOLUME' undeclared here (not in a function)
ac97_codec.c:133: initializer element is not constant
ac97_codec.c:133: (near initialization for `ac97_codec_ids[14].flags')
ac97_codec.c:133: initializer element is not constant
ac97_codec.c:133: (near initialization for `ac97_codec_ids[14]')
ac97_codec.c:134: initializer element is not constant
ac97_codec.c:134: (near initialization for `ac97_codec_ids[15]')
ac97_codec.c:135: initializer element is not constant
ac97_codec.c:135: (near initialization for `ac97_codec_ids[16]')
ac97_codec.c:136: initializer element is not constant
ac97_codec.c:136: (near initialization for `ac97_codec_ids[17]')
ac97_codec.c:137: initializer element is not constant
ac97_codec.c:137: (near initialization for `ac97_codec_ids[18]')
ac97_codec.c:138: initializer element is not constant
ac97_codec.c:138: (near initialization for `ac97_codec_ids[19]')
ac97_codec.c:139: initializer element is not constant
ac97_codec.c:139: (near initialization for `ac97_codec_ids[20]')
ac97_codec.c:140: initializer element is not constant
ac97_codec.c:140: (near initialization for `ac97_codec_ids[21]')
ac97_codec.c:141: initializer element is not constant
ac97_codec.c:141: (near initialization for `ac97_codec_ids[22]')
ac97_codec.c:142: initializer element is not constant
ac97_codec.c:142: (near initialization for `ac97_codec_ids[23]')
ac97_codec.c:143: initializer element is not constant
ac97_codec.c:143: (near initialization for `ac97_codec_ids[24]')
ac97_codec.c:144: `AC97_DELUDED_MODEM' undeclared here (not in a function)
ac97_codec.c:144: initializer element is not constant
ac97_codec.c:144: (near initialization for `ac97_codec_ids[25].flags')
ac97_codec.c:144: initializer element is not constant
ac97_codec.c:144: (near initialization for `ac97_codec_ids[25]')
ac97_codec.c:145: initializer element is not constant
ac97_codec.c:145: (near initialization for `ac97_codec_ids[26]')
ac97_codec.c:146: initializer element is not constant
ac97_codec.c:146: (near initialization for `ac97_codec_ids[27]')
ac97_codec.c:147: initializer element is not constant
ac97_codec.c:147: (near initialization for `ac97_codec_ids[28]')
ac97_codec.c:148: initializer element is not constant
ac97_codec.c:148: (near initialization for `ac97_codec_ids[29]')
ac97_codec.c:149: initializer element is not constant
ac97_codec.c:149: (near initialization for `ac97_codec_ids[30]')
ac97_codec.c:150: initializer element is not constant
ac97_codec.c:150: (near initialization for `ac97_codec_ids[31]')
ac97_codec.c:151: initializer element is not constant
ac97_codec.c:151: (near initialization for `ac97_codec_ids[32]')
ac97_codec.c:152: initializer element is not constant
ac97_codec.c:152: (near initialization for `ac97_codec_ids[33]')
ac97_codec.c:153: initializer element is not constant
ac97_codec.c:153: (near initialization for `ac97_codec_ids[34]')
ac97_codec.c:154: initializer element is not constant
ac97_codec.c:154: (near initialization for `ac97_codec_ids[35]')
ac97_codec.c:155: initializer element is not constant
ac97_codec.c:155: (near initialization for `ac97_codec_ids[36]')
ac97_codec.c:156: initializer element is not constant
ac97_codec.c:156: (near initialization for `ac97_codec_ids[37]')
ac97_codec.c:157: initializer element is not constant
ac97_codec.c:157: (near initialization for `ac97_codec_ids[38]')
ac97_codec.c:158: initializer element is not constant
ac97_codec.c:158: (near initialization for `ac97_codec_ids[39]')
ac97_codec.c:159: initializer element is not constant
ac97_codec.c:159: (near initialization for `ac97_codec_ids[40]')
ac97_codec.c:160: initializer element is not constant
ac97_codec.c:160: (near initialization for `ac97_codec_ids[41]')
ac97_codec.c:161: initializer element is not constant
ac97_codec.c:161: (near initialization for `ac97_codec_ids[42]')
ac97_codec.c:162: initializer element is not constant
ac97_codec.c:162: (near initialization for `ac97_codec_ids[43]')
ac97_codec.c:163: initializer element is not constant
ac97_codec.c:163: (near initialization for `ac97_codec_ids[44]')
ac97_codec.c:164: initializer element is not constant
ac97_codec.c:164: (near initialization for `ac97_codec_ids[45]')
ac97_codec.c:165: initializer element is not constant
ac97_codec.c:165: (near initialization for `ac97_codec_ids[46]')
ac97_codec.c:166: initializer element is not constant
ac97_codec.c:166: (near initialization for `ac97_codec_ids[47]')
ac97_codec.c:167: initializer element is not constant
ac97_codec.c:167: (near initialization for `ac97_codec_ids[48]')
ac97_codec.c:168: initializer element is not constant
ac97_codec.c:168: (near initialization for `ac97_codec_ids[49]')
ac97_codec.c:169: initializer element is not constant
ac97_codec.c:169: (near initialization for `ac97_codec_ids[50]')
ac97_codec.c: In function `ac97_probe_codec_R84601c2b':
ac97_codec.c:763: structure has no member named `modem'
ac97_codec.c:774: structure has no member named `flags'
ac97_codec.c:780: structure has no member named `flags'
ac97_codec.c:780: `AC97_DELUDED_MODEM' undeclared (first use in this functi=
on)
ac97_codec.c:780: (Each undeclared identifier is reported only once
ac97_codec.c:780: for each function it appears in.)
ac97_codec.c:781: structure has no member named `modem'
ac97_codec.c:786: structure has no member named `modem'
ac97_codec.c: In function `ac97_init_mixer':
ac97_codec.c:808: structure has no member named `flags'
ac97_codec.c:808: `AC97_NO_PCM_VOLUME' undeclared (first use in this functi=
on)
ac97_codec.c:839: structure has no member named `flags'
make[2]: *** [ac97_codec.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.20/drivers/sound'
make[1]: *** [_modsubdir_sound] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20/drivers'
make: *** [_mod_drivers] Error 2
