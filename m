From: Torsten Werner <twerner@intercomm.de>
Date: Mon, 10 Apr 2000 20:46:09 +0000
Subject: Re: Soundblaster driver
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Message-Id: <marc-linux-sound-95540038226444@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Mon, Apr 10, 2000 at 02:05:32AM -0700, Paul Laufer wrote:
> Please test this if you use the Soundblaster driver. This is a rather
> large patch that touches most of sb_card.c. If there are no problems I
> will submit this to Linus.

There are two problems:

+       {"Diamond DT0197H",
+               ISAPNP_VENDOR('R','W','B'), ISAPNP_DEVICE(0x1688),
+               ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001),
+               ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001),
+               0,-1,0,-1},

should really be:

+       {"Diamond DT0197H",
+               ISAPNP_VENDOR('R','W','B'), ISAPNP_DEVICE(0x1688),
+               ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001),
+               ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001),
+               0,-1,0,0},

note the last 0 like in the ALS007 entry. The opl3 driver does not work
anymore because it is not activated. What is the reason for that?

Torsten
--=20
Torsten Werner                          Dresden University of Technology
email: twerner@intercomm.de                phone/fax: +49 3501 530061/11
Homepage:                              http://www.phy.tu-dresden.de/apg/

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEXAwUBOPI9kFSruDOULKbyFAGDKwP/ejF48AWeTfJXuZ0du75x7uoRZRBQtsUf
pOqs8KKuoGWfbHAvBj9Pa8Ak9L8M+HFzq2xmGW7VYsCwYItvuH7FJrIVI4eXjLBz
tlGh82h+2U5UyXJpWmPrz73LnfZO6oNN9u+ztZJ/9A1f8Hn+PNXClov1jqHP2Yd3
wd6fkKkANbwD/iUTfBc48uo7FYVwSklqfBJZMkI8zOdzIBI8ymcrHHuIVqn0A/ij
pFoMW52rSpTyYgMu44KxNKE145rQGKALKyz3/LYnrgpdGE+Yv9yowXqS6u7lyAY2
ur53cGlD85eJIApurTLRXcjCHxR08olxnaOJ+7KCD7w1STMJsf2v5v4Z
=25ox
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
