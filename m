Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED543FBED2;
	Tue, 24 Mar 2026 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359203; cv=none; b=NZe1BZo+vidKgwJofReII/a6fhkkg3YN9Mh2IIQi3f2gJ3A95X6XGC61GHg2j4FvPTDel07JY0L6Q9szTYB6eSvDCBDxYYVcMgRHLfGphRFYpuv3nnfGKvAlqS4ou1883TUeODPid7yGNXIhI+bfs9w0Wh63Mf5sLR60lGkHycw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359203; c=relaxed/simple;
	bh=b4Fwdvdyts85PAc+vUA9SPWws4818WTQttH3SzgtbAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0VxzwhWfjZWGlTu1vN0+D5Jjw0+6Jbhhw34YZQvwpqKvbT1pO7i3qYgYA9JpZemAvoueXAuOKWO9CjaZozc6ncm4ltWG55oDMK01NWaXqhORqHE3LjGt2fAzGjx1Mv3OGmCu1IsWEJcBD7RrDCOIQPhX0fjoJJC8sVKiggwEH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPu9qOKG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPu9qOKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E356C19424;
	Tue, 24 Mar 2026 13:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774359202;
	bh=b4Fwdvdyts85PAc+vUA9SPWws4818WTQttH3SzgtbAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPu9qOKGIZ/8O4xL298ETx47Zc1hDZSWW5T67rMvl31lolKX7yFBWWyBZvQbi/lMg
	 VZ7pvuiSs+p4A4d2xBLJKGbJrjoI/FEHDoBKzc+pKlsQePSlPC0twO1GVsVbZ+x0+e
	 1sDjkxcisty/zGfMIRUhLvDQI3nTZTVq6i0+iUR+CiWoPeK/IDOULp7c306Ht/1Xtu
	 po3/sG/EdFMmEH0hJXXaFOjXpxfwHqRm8DNs7zDUPekciVTzMYSPZgXoglHE8+BwQA
	 Q49tl1CoVboT5nLJfCrJZSITnfSjSGbXEV6QfRq+tOnc+d07O26hb9mdXIrR9+3LOv
	 psJswYE7n0+jQ==
Date: Tue, 24 Mar 2026 13:33:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND v4] ASoC: SOF: sof-audio: pcm_id is __le32
Message-ID: <9ac16808-4036-487e-9152-8dd40ab6e5a1@sirena.org.uk>
References: <20260324105027.99586-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4NCq+nFW4UoZERBP"
Content-Disposition: inline
In-Reply-To: <20260324105027.99586-1-ben.dooks@codethink.co.uk>
X-Cookie: Forest fires cause Smokey Bears.


--4NCq+nFW4UoZERBP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 10:50:27AM +0000, Ben Dooks wrote:
> The pcm_id value is __le32 so convert it before passing to the dev_dbg
> function to be printed. Also fixup some other uses of __le32 data and
> a couple of places where %u should have been used instead of %d

Please rebase rather than resending this (if this is actually a rebase
please send it as a v5 so the tooling doesn't get confused).

--4NCq+nFW4UoZERBP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnCkpwACgkQJNaLcl1U
h9C0lgf/bglWpMrABleb5KJyYlqukdMY7GqMRpZ8WusxbBFMitp1bT4ARYxDv23R
JKWc/J+GeHmvHVl9v6gmqjsH2MGfoLjYkUSEAN/LjlOszOLf+trVfC1nZfTG0yaj
HnMAmzUyYDZM41+mavsNNuZAcuyFvAZ+8V5tpzUHzfktHkdnlSHF+U1dTSzQzXab
pJlqL42Sy+BhRJcDic1WJxbApEf3H28cJmRS31pcmIwLGbk/zTJtiK9DhYU5HD/k
6BaxFntx+TVx7hZrSLkPhKXQweekYRdm4nmSrbRFDec5Yeg3oaexGinjEWzq9NnA
16AqEr6xYQdhskN51QFkig9CkIJxEg==
=l/NL
-----END PGP SIGNATURE-----

--4NCq+nFW4UoZERBP--
