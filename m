Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC6C19DF41
	for <linux-sound@vger.kernel.org>; Tue, 30 Jul 2024 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350669; cv=none; b=bWmfKMAgib6GwZZY3n8+MfejhGm4cBxBDaJNZh1Vb8MnZupE8RspfY5A7fBHUmONytt+aTNPtDj/5HbzizLfgN/OpJadMJ5HQM4/SlDjBhMG5mn8pia5ym0ZqvfdFiB+J8wyiquAh6XCdCj/komIlJqtA101CMfXiTnPQ0Z/ATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350669; c=relaxed/simple;
	bh=QxbZIWrg6o1IrnrY9hoHKyv42XxaojzQ8n9wFvRNqBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3KEsh4Pz6BLvNLrX5Z7kF8288Ul/LIPVjoaUW3gocKi2rCQdGo0qm2wAlv6r8XX39f2Z1FdsDpncrCQ4DvwHF687QKjUSqpaCm8t6YrOcF3cbT3wXq6o0QSswghZYCapRbxE2FTke2/unvpQuTRaNWWRR70Q9ypXIdteZoLbx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLr5eptu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLr5eptu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E203C32782;
	Tue, 30 Jul 2024 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722350668;
	bh=QxbZIWrg6o1IrnrY9hoHKyv42XxaojzQ8n9wFvRNqBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLr5eptuQandSChXQW/aeVXDp18GTGE3Zu3X55hAzb9fQqoPb7Uk23M9EulBLpks2
	 2l11zgDrmaT9edZUAljB6HszRYmuuyIsvj5wu0s0rD7npDc7J2n7WnCw/Jn6iDBqNB
	 8TeEnK40sG22/YYU1FY4sqJInVqR8wxrTVm5cZ+Hp0B/quLKqqY6Gcj2QxQ8GZHl6K
	 nC0jJC6bwq7FxEDowREITJp6k7WX4QNEUzafVrLtHW7gUHq/SX0aw5bpU25QdJag89
	 zSGHiz2MASdyjnaIuwvLWLBgAogk305VFqN62MWLvkh7XKv0ppRNNcCA4uEUcTWP+Y
	 czMHLsHq405Iw==
Date: Tue, 30 Jul 2024 15:44:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker
 thread
Message-ID: <f7503750-d751-42e7-88de-061f6263e4b6@sirena.org.uk>
References: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
 <87plqw9no5.wl-tiwai@suse.de>
 <ZqfHC7IodobTlVT4@opensource.cirrus.com>
 <87ikwo9etj.wl-tiwai@suse.de>
 <ZqinleaAqikxdQGr@opensource.cirrus.com>
 <87ikwn3vqf.wl-tiwai@suse.de>
 <81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NWNPN4YhXig7sWuI"
Content-Disposition: inline
In-Reply-To: <81eb73d0-60e6-4a77-a3c6-f9d7355119d0@perex.cz>
X-Cookie: Don't SANFORIZE me!!


--NWNPN4YhXig7sWuI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2024 at 04:13:33PM +0200, Jaroslav Kysela wrote:
> On 30. 07. 24 14:33, Takashi Iwai wrote:

> > OK, now it's clearer.  I think we can change snd_ctl_find_*() rather
> > to take rwlock instead of rwsem.  It's only a quick look-up, hence
> > rwlock can work well.

> > Totally untested patch set is below.

> But why the interrupt routine does not use the cached kcontrol pointer? It
> looks like a bad driver design when you need to do such name (string based)
> lookups from the interrupt routine.

With some of these slower buses it's not immediately obvious that it's
worth the bother of caching - the overhead of doing the lookup is
negligable in the overall context of handling the interrupt.

--NWNPN4YhXig7sWuI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmao/EcACgkQJNaLcl1U
h9CrVAf9FQV2TrPsDcedRs6Xqpkqi4QwEHrl1/K2iNj0RD3vPPIUJ/JHeSAuWnjQ
0Q2VG96Y9mwNW/ixUBRUvnx7ikXKrBgqaqr3eHRZDIHYgzKl1oQ3IBOSluYGZdVt
eRLT8ptGLO5zOeHookOsAGPa4frcFZvBEEgnRWoUtHOAuHkrzQet+/HYtXK/Qsa8
Jt+ypfU9g8Ghavgc5lm81BpiGhPcHezmuBzz+dO/OkqeanH/eoeOkqCSfO00i6b2
XssTg3lHWRlZGGGJu3VPbsfbw40qQ5S7PQTz32f1KLx3xTXbiexX+r3qVplJ7q0P
PCFVgkFE+lJg74oMFeP2rkXbKDEcng==
=cRKJ
-----END PGP SIGNATURE-----

--NWNPN4YhXig7sWuI--
