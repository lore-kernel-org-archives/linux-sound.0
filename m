From: Jonathan Oppenheim <jono@Phys.UAlberta.CA>
Date: Wed, 12 Apr 2000 00:35:56 +0000
Subject: Re: no recording w/ emu10k1 (SBLive! and SBPCI512)
Message-Id: <marc-linux-sound-95550481610388@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95495756630733@msgid-missing>
In-Reply-To: <marc-linux-sound-95495756630733@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

just an update on the SBLive driver, since a number of
people emailed me and had similar problems.

It seems to record fine now with the CVS driver (available
at www.opensource.com)

recording with SLab works (if you run SLab as root!)

i have not yet got kvoice to work, but understand that
other people (with different soundcards) get similar error
messages, so it may just be a bad program (i heard that it is
no longer supported).

if anyone knows what permissions to change to get SLab to
work without being root, please let me know.

thanks for the help,
jonathan









On Wed, 5 Apr 2000, Paco wrote:

Hello...

I've spoken with the CEO of 4front technologies about my recording
problems using OSS/Commercial with the SBPCI512 card.  (Some one else
posted recoding problems with the Live! yesterday, too.)

He has informed me that there *is* a bug in the recording code for these
two cards, and recording is absolutely not possible unless you download
the emo10k1 driver from creative labs' website.

They have no plans to fix this bug until sometime in the summer.

peace,
-Paco



-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: 2.6.2

mQCNAzc5/rwAAAEEALGi/cKupURWMeRs3xKx7+3PHi1hqfswOuM5suJhTEJZiR+p
xYsVYB/B/uNwrr+m+Rzd8sEJlB2D/JkkCHMUplDR2OC0hfUYmQGIXEg9kShudRsO
E+1oVFFevj6MTgIY6c5nSWvz3n+zLHrcHk/k8pLDpI6qcIGqrAEcX2GVzVwNAAUR
tARqb25vtBU8am9ub0BwaHlzaWNzLnViYy5jYT4=FDxR
-----END PGP PUBLIC KEY BLOCK-----
