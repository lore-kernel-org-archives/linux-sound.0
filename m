From: Jia-Huang Chen <jiachen@indiana.edu>
Date: Thu, 13 May 1999 21:42:27 +0000
Subject: Another SB16
Message-Id: <marc-linux-sound-92668919603329@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----

Hi,

I'm going to replace my original setting in /etc/conf.modules :

alias synth0 adlib_card
options adlib_card io=0x388

with

alias midi opl3
options opl3 io=0x388

Will the new setup (opl3) work ?  And how to test it ?
If both the setttings work, which one is better and why ?
thanks,

ps. My card is soundblaster 16 pnp.

Jia

-----BEGIN PGP SIGNATURE-----
Version: 2.6.2

iQCVAwUBNztHRIZ0EtYwdSKhAQERQwP/RPJOyt7YJjfSprq9Dq3y9BX5s0tAHhUm
OYMV1WeiT0G54kqyU+S2EuaFCJ0LhHCabkpKMcT02HA/SaDDcVg89NX9eMJkAxbb
f/Vo1dnh3Hm8XgfpyPuh/78obWOi26F7JQ4x48L0AesanzyRyKIURycgA/exThiT
3HD0UlVsQx8=CioT
-----END PGP SIGNATURE-----
