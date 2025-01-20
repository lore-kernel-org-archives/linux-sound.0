Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA841E5706;
	Mon, 20 Jan 2025 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737398393; cv=none; b=AfIYUuNdsHfw4nx+T9eC26N3jRi4Opqes5TusigKe39+TkFAnKw19qv5V2F0EVBNRK1uYEgGKBaoXNzUou3PTWsDTqyo8gpw/YjxuFJCUL2ZhGMnP/wGbhAm3kazI2gKI9yJ7cLMDFijKGL35RvEgXx4He8mw56TL1za5DxZi6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737398393; c=relaxed/simple;
	bh=+MudjSmF7fW+w06pV5PazmgiC6VurOyNw9MTfBu0/cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nN8JUl+0+sR94d2vAsaaa6UYsYjJK6g/yl7C7e2n0BJ+abWxwTowUAca/D3F5eN1XhPOCwSHXM+nYOOPxZ8sXYTlvQx16nToKk1gSCmIf5fyDNQa4ZRJQwkrWW3miXHb64EQJeJJqfzaL0zI4uerAMmmCopj1kofkmmvoHXTsH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCR+YyLS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCR+YyLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C52C4CEDD;
	Mon, 20 Jan 2025 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737398393;
	bh=+MudjSmF7fW+w06pV5PazmgiC6VurOyNw9MTfBu0/cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rCR+YyLSUSKqx1PIuBuTlcB3h09CHQ8rJ0C1n8wa+P9W0t72D3L6+J7jgPTPLTFzp
	 fRXUiJ1YoNCrkKpRlvaMqBvXOD1bYdieJdZoGUxDoYhOxZ9lLXsUT9ctknSOkwePZL
	 VpniPz+LTMFtavvpxy9bAmPKI0syASZzx4t7IXfRZoGjx/qswg1ieTN7CAHgvg06Iz
	 5FaC2N+5UBSzQqj5EyZMkTg/EoPu1ZlsAHlvLFPri3QzTCFf4JgtV4Q7Ui0SxcYLUH
	 mKIgHb7TRHW5sS+rbkk9apVqRwUQKmQqTCxTZbWWPWoyYE+SbS7kwv6nxjGQbhkmBC
	 ygBM46yiZlpjg==
Date: Mon, 20 Jan 2025 18:39:48 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
Message-ID: <208098f6-1022-437e-9ae2-964e9bc89942@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
 <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
 <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="66qPjD8/FQ1KJfYC"
Content-Disposition: inline
In-Reply-To: <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
X-Cookie: No lifeguard on duty.


--66qPjD8/FQ1KJfYC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2025 at 11:48:00PM +0530, Mukunda,Vijendar wrote:
> On 20/01/25 23:25, Mark Brown wrote:

> >> +static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
> >> +{

> > This really does seem *very* similar to the acp63 code...

> Compared to PS, in ACP70 wake interrupt logic added.
> New register fields got introduced inACP70 compared to PS.
> Please refer below patch.
> https://lore.kernel.org/lkml/20250120100130.3710412-18-Vijendar.Mukunda@amd.com/
> Let this patch series go as initial version for ACP70 platform.
> We will revisit the code and implement common helper functions in the next cycle.

That does feel like quirks and new features rather than a completely
distinct IP.

--66qPjD8/FQ1KJfYC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeOmHMACgkQJNaLcl1U
h9DMUAf/Xh1HKTAdPM+MavYeHWvsGnoD8fqMZ7XKQq56riuHNPZKEFzM1EunMlhg
B12EM9ki0gfT53xEC/3o0aDGs3CNcfIvxtiaEqBjyc1Px9PfKe8NdC47TMneo2us
Ig8XqPInr+Zvpb6Hv8Pq7QxvmgVD7ygC3CgLCgXdsVqxwUsTp82tFAVdjbpkEB2P
2rJ2+9ZTOi7rw5uKhuqoAo/zBFCcMwpR/lGE6HHPSZEaTC/Eo0TbsadUqesk279t
aZzreBA1zO/PhAKRgp6Jq42FU+Hlv6pM5oQ0Fme2wkcEz93tiawZ1DxVbz6tZQi2
uml9vJL3xUamrpQnz301crEBrHbMlg==
=WilK
-----END PGP SIGNATURE-----

--66qPjD8/FQ1KJfYC--
