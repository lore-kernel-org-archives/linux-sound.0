From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Dec 2013 16:58:53 +0000
Subject: Re: [Patch v2 2/2] ASoC: atmel: sam9x5_wm8731: remove platform_set_drvdata
Message-Id: <20131209165853.GS29268@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="yrPCcEe+QcWQl/Hn"
List-Id: <linux-sound.vger.kernel.org>
References: <1385546710-11308-1-git-send-email-voice.shen@atmel.com>
 <1385546710-11308-2-git-send-email-voice.shen@atmel.com>
 <52A59955.8000100@atmel.com>
In-Reply-To: <52A59955.8000100@atmel.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: alsa-devel@alsa-project.org, richard.genoud@gmail.com, linux-sound@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org


--yrPCcEe+QcWQl/Hn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2013 at 11:20:05AM +0100, Nicolas Ferre wrote:

> It seems that this patch has not been applied to your "next" branch
> (aka ping)...

If you think something has been forgotten please resend.  If it's
genuinely been lost it's going to need resending and the mail just leads
to more mails, a resend can be directly applied.  I had thought I'd
replied to this at the time but it seems I didn't, or at least I can't
see my reply on the list...  sorry about that.

The question was if we should change this or if we should change the
core to not overwrite something that probably ought to be the driver's
domain?  Looking at the code I think we're probably doing the right
thing but it'd be good to consider.

--yrPCcEe+QcWQl/Hn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSpfbKAAoJELSic+t+oim9fysP/RcMEu29YxgmTY5nSFiDvDbP
WN7iEKDsJL4evG7Z+/CwQCoNzY6Lx0decA3xGSUMWJsK/JGHJ62Ei4a7Umy1g+8x
VTN2hkWrVEK9emldFTrf0hUmAZE7fJ4EUl6tf9RquQpfHBaWuH99TI5ZkQHe0g2k
JpFVimVNuRVe4bx+5gKmI74LIGQRZP0KnyuCXiJt4CxWW3jkw+CnOfjEw9BNXh/N
Vp+EYo8PPPqWxJ6+4l4zeuyppKzMdO4a+X8IIcKvNK/rpsOTJP1jrM0FCh+xemzG
P2EIcNZeUAFwnD/QfCeMKHictEBmOcyQiNbGJReIcnRWf6uweWce960cm4JZ4LAc
uE5gDd5XGE8EyMLUUeprkQYzhqV682E/PWM6eVKozrjXlUvDVou1Iurt6QYqRJns
OLF/4PAoBODl98wa69EbXJUuZc+w68JfksJDCuv8PC3Cyd/5hfVuadcvVP4DKDi/
aUb5p8DhSqLK/4+c0rXowvWQbQBcCDk7ul3lxiNrA+pE8sVxT4ecURiOOrHJAdOc
erNUIhSeVKGi2bkDpgVcx+nbzesbk/bfEQ4iyjohrqo7yUzbGJXARiXE6FJzhCpH
r5LgGJN8UAJv9Idk2Zq1Oo7I6m/C1HOwqKWTpFHK1o3g/eO6Gzwxjwx8Wcs+tcNs
+AMvGP3kjJ+7c8Yy7GvD
=odN4
-----END PGP SIGNATURE-----

--yrPCcEe+QcWQl/Hn--
