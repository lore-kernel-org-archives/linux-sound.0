Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15519389E13;
	Wed,  1 Jul 2026 18:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782930069; cv=none; b=VF9dBFMvgbjwX3LFcw9mrYR5MoDjyLW4c7VZw81vPph5owNJah4RqVpLLtZj7TNiG6SfndWS7YtezknhzQ3F2NSCgU1PdOz7kNtpkghSX456D3cQCT6vG+uwsws5vhflGfDNKbgodLyiDQAdJdJITzIN/rxKakqWBM1NfIUBCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782930069; c=relaxed/simple;
	bh=SPJjNBOdLnus/niDqbSYCMhD49X0R1V2BT2ev1PNCQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOQSEW3AS0uO4jWMXOBr5qIzR/FwNVHPBbO4SYSbkCUOEcZlH63/Q1RsVMh0EGtcXJW1EZbYZp+3POaKTi3HI/M24Bm+752YkzA5ZA7lIeEFEq3FeY3ExA2ptnUK4VI932j7FAm31iYqx8MdTVbH6LdrZb5wyWStyXHGFF0abdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2Y6UDHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2Y6UDHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799901F000E9;
	Wed,  1 Jul 2026 18:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782930068;
	bh=dWESgHXPzQP1SIE7M5Gl/JtaO4ZOYr1I0S/sGw6JZds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I2Y6UDHBBPAWJzdFSiHKVo42ZtGN7Dj6eTqY6yd41MJaorf0eleDYx9qh7wSPN54P
	 jPUbV6mktiDEoLlUSfP2DjDziBK/30/kJ+mKpLp/rCNB25vm3QwY3uaMNHJjDJvZdM
	 iglv6F9fs9h4MmTv7/4FdG5+arO/RMRtjQLgMNsVk6hGG2EHYHfPrw76lIp+SBoGb8
	 yiacv8vr1ENWJguzXcf2rmeJ7UR/vcqkxjEY0IIKsIga0cqcmFOhY+Zrlq5umsSc3a
	 xjXznETunk8Lo9Eb/AGzhh59uE8CEO4NSu6MWy8nAAs/7RqPYRHH9m2iJQ4yBWarNn
	 VQEbxfBPlstNw==
Date: Wed, 1 Jul 2026 19:21:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com
Subject: Re: [PATCH v2] ASoC: amd: acp: amd-acp70-acpi-match: Add tas2783
 support
Message-ID: <d0f4beec-1092-482f-b214-2749c87d7be4@sirena.org.uk>
References: <20260630144904.865-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v74EOz3zzM3IS2EN"
Content-Disposition: inline
In-Reply-To: <20260630144904.865-1-baojun.xu@ti.com>
X-Cookie: Do unto others before they undo you.


--v74EOz3zzM3IS2EN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2026 at 10:49:04PM +0800, Baojun Xu wrote:
> Add driver data and ACPI match table entries for the TAS2783 on ACP7.0 and
> ACP7.1 platforms using SoundWire link 0.

> +static const struct snd_soc_acpi_link_adr tas2783_l0[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(tas2783_0_adr),
> +		.adr_d = tas2783_0_adr,
> +	},
> +	{}
> +};

This doesn't seem to be referenced anywhere?

--v74EOz3zzM3IS2EN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFWo4ACgkQJNaLcl1U
h9AflQf+L1NQ2Nzaa3JVlIDDZYpbVQfz9ZfIWOfjbJARTKWQJoJYFdWFWDPsk7Qt
w4x7My0W5aov1hd92ggE/RUbRam1k0qOg5yth8JZxqS8kjObtE99h3EjglWtoqf2
oPNjmL+sZHbG8VelAjIhGGFTQtQ058rlO9K525XD090xlW01RXIBMne6KnakpbBB
LemQYNu5xZ95kOuQHesTmPiaGGVIOHGAoVrd4F+17isYJV8/cNCvcztMFOHKFrCy
YyiTtCoVtIgT8Q5W0OCRKHZtWbGrcjVhn+YafP9BiKBSgdWdyNxKPs/a9T2KK8CY
rGEgZ8x5UEFR4k5C2ADrwSMDIzVTDQ==
=cI/m
-----END PGP SIGNATURE-----

--v74EOz3zzM3IS2EN--
