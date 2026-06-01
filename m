Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4CF374728
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316017; cv=none; b=Mz84IojcYtRSxNexCTKWLf5ArIG4aw/3P1bo+cmUAbvFa0X8FcB7QqH98rDtCICAMnyUUUhjfOzf4JWcwElZOH+b6sJAgnOLdkLupJr2QL4ndnI2EXv5tnJRnoL9Km+7y6Sstqb0DOFPRCLLbUM+ax00/RNeLAMdWRViVnyRK6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316017; c=relaxed/simple;
	bh=As4IhlTkHzht0ipouBcBzn1PJhawFHWcssbDznCoNto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eclgV6Jx3O8f7+HYikRD148kSzMC4EBni3mxg0FOQyCPCvbieOLf9Fa0HFFz2evLrF7lE28z/d9i/rzLWBaxyFLN5azPK6BUzoJIdYde9PTNBwNEFwbkUDkHo7apknKYPJgbGZr1gIBaL0aMy3ISzALn6u/9zRPVwbfMbT59xCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKbgOYWH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKbgOYWH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD111F00893;
	Mon,  1 Jun 2026 12:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780316016;
	bh=5odaHMpErCi5LLH+boTirItk7Vq6qoWS8MfNrwjnRKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UKbgOYWHthHx4Ehu83UWzlyutWAxsuGF4qN8WuSxAWa7vlcchPRbamo6G657u9dut
	 XV/1RjsM+sreFecbf1cIYAOjWb6RfruClFTkLeDRnPlW97s/2Is0QQ4hX8OrVlkHwc
	 NI5JN//KQBiewH6PzmTdiqMC2szj3Mf3wEy+ISBQDky0Can5GmkQPA2D5sKMvV3ZgO
	 d7rIp76lx6udFwIgXKy0jzFMex5eYtL6V1RlUBkCPrJOV2WFxkgATlXDYp7bHolHqy
	 nLrshUP/MsAo5gjt4cU32R1UedLmySvpzXsVkQ0EIKrdy5ariD7lkAV8SHCDn1mQEz
	 QserNsvcDH+fw==
Date: Mon, 1 Jun 2026 13:13:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/83] ASoC: use .auto_selectable_formats
Message-ID: <0cdf8ff7-6069-497b-80a2-394dc4822374@sirena.org.uk>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
 <878q8zb030.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bJFkWlupolXotxxW"
Content-Disposition: inline
In-Reply-To: <878q8zb030.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Have a nice day!


--bJFkWlupolXotxxW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2026 at 09:01:23AM +0900, Kuninori Morimoto wrote:

> Its first 7 patches are for updating existing .auto_selectable_formats
> user/driver. So, we can separate it into ...

> (A)	- update existing .auto_selectable_formats + update method
> 	- Switch to use .auto_selectable_formats format for other drivers
> (B) 	  - The patch which got Reviewed-by, etc
> (C)	  - THe patch which not yet reviewed

> I will post (A) first, after that (B) -> (C).
> I think I will post v2 next week.

Sure.

--bJFkWlupolXotxxW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodd2wACgkQJNaLcl1U
h9AAEgf+NudjlRP3a1rW8lpqbAITfYXLixrWLP4iyFOjkEUv8U0IZVvNHsvkpIuU
RrS5LgrEElLE7/4KpgTxNL1H+g8+r/962A11OJv7iqim1fo+EaaLIEjIWVHx34H2
fTqX0aX4/RolBs3vsXnuzCEr8gBFkndTnJALgJ9xyd7st4SsYR5pzhScGC6QeE6t
3th/+Emj/w1yekj77rF3r0b9JzGwNAwdmLTgWPOPpLSBsmN7UgU4ZsTqFO5ovBOX
+45kHMGV2+U07Lg6Mg4VCYf0CcRG3htkmcB/ATs8KTN+naKVoy7PAahyh8bNah90
We5VgkieqjGzk8UQgEbEB3fgFTQX8Q==
=GIXS
-----END PGP SIGNATURE-----

--bJFkWlupolXotxxW--
