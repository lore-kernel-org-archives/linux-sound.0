From: Mark Brown <broonie@kernel.org>
Date: Mon, 27 Jun 2022 16:52:13 +0000
Subject: Re: Sound not working after commit bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Message-Id: <YrngPdWIqxlRm4mf@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iCWEXegB00IRjxh9"
List-Id: <linux-sound.vger.kernel.org>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
In-Reply-To: <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>, Alex Natalsson <harmoniesworlds@gmail.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, linux-sound@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>


--iCWEXegB00IRjxh9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 10:12:37AM -0500, Pierre-Louis Bossart wrote:
> On 6/26/22 04:29, Alex Natalsson wrote:
> > Hello friends.

> > The log after alsamixer launch:
> > [  103.786358] Internal error: Oops: 96000004 [#1] SMP
> > [  103.786509] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq

> Any chance you could try with an updated kernel? It's not clear to me if
> this is a real issue or just a warning that's been fixed since by commit.

That's an oops, and the userspace applications are hanging...

--iCWEXegB00IRjxh9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK54D0ACgkQJNaLcl1U
h9AgTAf9F9YhMFMh9cpDNSKY0sdfPXft9AwZSujKrtwHe+eu7BPuyXlJkTO4iE2t
2Ons/0jrkx15WElROLZac5ulsKE4iYORATeNhiFUCrmE7giG/GMPCRKOVhYDoP+F
O/0rKksU/Gu3zyEEMROTh+vJbcFEq43RDXq2DDHLIrQgSdudNwiaaRP6jy0V2bRy
OCArvQWe/8doB22q27JgwQ9tDEB25MFzd1tJ5AVZjWzZcMFiRN3foRpMhNejgF0W
GvI6KjvZ4eBu1H9YEbn7doyZKNKwApOjqWmXO2Rm8bRrcnnNfEbEdjgEzunFBOoF
NZVhl8uYkT3BFv7zAy7nl73RvtPy4g==
=ER5V
-----END PGP SIGNATURE-----

--iCWEXegB00IRjxh9--
