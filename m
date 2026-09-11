Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A90830ACF2
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133031; cv=none; b=Apw6Dwm6NF+tDFkJaBUOnJ4PVI933HiQBzFlJjA2VKcUwg1Io18Lwp2vP/aDrenU0wiT+2HYVUIesuEv7+9lr4ctBaPPuyvNgJhvANW6JjPM6/DvRLwPsGrhLbMReraXeosdr1UxPE4yZoimV1y2DG9UXin+Fxl7ybi4lscopqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133031; c=relaxed/simple;
	bh=eKZKdcqY+WTmNoIBMBHFPERM+LRw386SnrWDaWpuCks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiQi//wofjBnekq2fJTDpCz8E4kPuVDX6YuGx10X7dEU8d49o5jSHhrJtYoPB84aMv+Scgwjux9WxUtlPqNTy1SE13JOOBZIPgtyWagvcHPD3MOvxXb51EKFsRXPxzEhl3QoI0MKh19thNquwMWBa/M26/9mTBlK9RjM6CYjI08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZlytRii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZlytRii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353871F000FF;
	Fri, 11 Sep 2026 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789133030;
	bh=u1D6QoM5XpHsmr2Z2iKB0985vwLHWWCHIeJiHDEhFaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LZlytRii7f1ncuN5QaJIkq50/MXjOLht/wBK1g4U7l0TN133HCN5vzmGLV2YXYvSg
	 8uAnw1sTHpaZJITdnYxEL/RwkXIXqm6BmRFPnp170ftABAO71UIg/M1AVYU6J+0agq
	 QQ8aVscTQJ8wsr5hLn21HDwmNVaishU3ZliBJK6Q7XXgJFEDCxfLdMG17PN8SG5/dR
	 ZzNAe6W+foJ2vCrKu0T0swaU7X2ICeXql8eAp9fVsYHmbYFsXq8h0etIuYfuOLLYoV
	 YWqoMnwwdtWQb7qsYoWNEJSTiGoGwEAzViYO1sVhep4L3bSPRsQYOjzpGoyPO8QCY5
	 k2cV3Opiltd/g==
Date: Fri, 11 Sep 2026 14:23:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/2] ASoC: codecs: ES8326: Modify the configuration
 and add kcontrol
Message-ID: <bf0bf794-4791-4192-926c-bd839447d947@sirena.org.uk>
References: <2b3120aa-faff-4dea-965f-d00e84aa2607@sirena.org.uk>
 <20260911131241.4188-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G+TdLzt8v8UUUJaV"
Content-Disposition: inline
In-Reply-To: <20260911131241.4188-1-zhangyi@everest-semi.com>
X-Cookie: Piece of cake!


--G+TdLzt8v8UUUJaV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 09:12:41PM +0800, Zhang Yi wrote:
> > > v1 -> v0:
> > > 	- Modify the parameters of 'find_best_hpf_freq'
> > > 	- Modify debug information in kcontrol
> > > 	- Fix the issue with the incorrect removal of the jack report
> >=20
> > The versioning is confused here and will mess up tooling - your subject
> > says this is v1 when it's at least v2, and the changelog says you're
> > moving from v1 to v0 which is a step back.
>=20
> Was the first version I submitted v1 instead of v0?

Yes, that's the normal thing.

> In that case, should I resubmit a v3 version to update the version number?

Yes, please.

--G+TdLzt8v8UUUJaV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkAOEACgkQJNaLcl1U
h9CekAf/fF3xIxMWB/LmtZkj2qxBBPb++zYhsxOjKtz0jg6Vi3k4jxfvmmklYPRv
a1g0a1rTQhz64N7WZCplPC37VmP/9scypQ1pjrSAEi2p9i10Xn5ajno9azLR1J5L
E+hGPf1Lg+Ft0jN1IZEamjivZpJ4nOhAqvgnVC2kUyg0Ellawomq5w86F0jgwHhK
tXBU4dciTtYsjuvHuSErdJX5Wy3MntSlbw+F0NIBw+L8Ao+1yOYBoR70IGFAi4iG
n4LiYdiMRcZoNOJYeecXP5QVM0sgR/sgEtTh70OQXp5nnjTt3mZHyYPfDaKj3k8a
5R5gAP9fXetCMoth1V+sm2SF+9o1Vw==
=Fdvm
-----END PGP SIGNATURE-----

--G+TdLzt8v8UUUJaV--
