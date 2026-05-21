Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B869B33F584;
	Thu, 21 May 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363267; cv=none; b=e3lqug9xCGxxIxXtbZ//rzoHnSIb2o3mJkG2BMIDLU+DMP8UyKMe1IMJs0Ip7aKUkzLoTFqX3qT1JbMItlYbs3k74ngbLvzxOgG8qxSQ0DTGJJ3yj0bvPhwqMFx3w7QzSvzO7f3vGuWxRtacRVLP+bEymEzUakKpIrMoLG64ZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363267; c=relaxed/simple;
	bh=tYouBRlDDxoBacqg61uRAmC24F+aU8P/+/zOo+fJ4/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns+YUlpG+OIELpph94EhSesUXV/iw0WGu6MKhUQcAWfUshsPZBvzpVuMhGmRqkQTmXH6giFCrxEwG6iZKJQiHGpwe/zk60bTm4votC0BVUUSu9ARvs8pbs+dcstxG6WBn5QgMmPR8EaRwK/GtVOVzRZVtZmGoq5kVcPJOIk0abM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZPylxQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZPylxQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401661F000E9;
	Thu, 21 May 2026 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779363266;
	bh=u4L0vkFGR060ckdfUCAcTgtv+O7QylwEkQhg2saZvEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aZPylxQ3dPMAM3kKQPotMm4S2tnZpRpDN1hLXToDDyuVssYyCx0rv95yUAZGMFxv4
	 I5o3XT+yBCuGNSXNU2cDLqL3Bb247k7JPI3X38630LmLTMevwaNhMGTnktwHcJ9/3q
	 47smZ/93Sn8v5RLjPyc7ljJyeb2k6HEg36Xd6mh+ez+6Z9CVwYuXJZMiiA2PiJj1Gj
	 ZQ1MkV0Egb6x2AGhQzyx4of23UOqySUEBMDoUvkFMizq4uLpeZUz+id26ATL0fvgT1
	 dEGXNWydq/lhZE+Z3gjXwvwLPPHVjD1DNukehZUYEJYV25IFY1Lix+2ae88hwGIHbz
	 KpS8Mea8XJV5A==
Date: Thu, 21 May 2026 12:34:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] ASoC: amd: acp7x: add system and runtime PM ops
Message-ID: <346949dc-d4f9-420b-b208-65a02c4657a1@sirena.org.uk>
References: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
 <20260507181251.20594-6-Vijendar.Mukunda@amd.com>
 <905bfeff-ab78-4299-a2a4-45fb8f05e716@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="etEcZ4fPKLR4ZqCJ"
Content-Disposition: inline
In-Reply-To: <905bfeff-ab78-4299-a2a4-45fb8f05e716@amd.com>
X-Cookie: Words are the voice of the heart.


--etEcZ4fPKLR4ZqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2026 at 02:33:47PM -0500, Mario Limonciello wrote:
> On 5/7/26 13:11, Vijendar Mukunda wrote:

> > +static int __maybe_unused snd_acp7x_resume(struct device *dev)
> > +{
> > +	struct acp7x_dev_data *adata;
> > +	int ret;
> > +
> > +	adata = dev_get_drvdata(dev);
> > +	ret = acp_hw_init(adata, dev);
> > +	if (ret)
> > +		dev_err(dev, "ACP init failed\n");
> > +
> > +	return ret;
> > +}

> Both of snd_acp7x_runtime_resume and snd_acp7x_resume look identical. Will
> there be later code (when machine driver and IO enablement come) that makes
> them different?

> If not; then I think you can drop snd_acp7x_runtime_resume().

> If so; this makes sense to keep separately.

Not seeing any response to this question from Mario?

--etEcZ4fPKLR4ZqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO7bwACgkQJNaLcl1U
h9BJFwf/TgWuvQ/NFuu19UEQCRcFImz0ttnm4CtFkgiEfYTwIuwp+BnZ/yPUW5Vk
ZSOnwFeKQ6X8AITokenw8Au7xhfYuz+2tsK0RDEO8qOgqEeaSCuIBB2B9frAkU1c
VLasKfi2O4/IGjCsXosWwaIhtLG4ciZNb5xYWn/6pxw5Bvz58AXKs+asR+yoNOdG
+zO0BebJy+BwIbifbcSBPl0Uue52eq1/us328JjNxEdqctTw2hYz3XjnpH5GMnxX
eeo7odR4KyEETTXfUB0Mvv3kQ/NjJI2h5lBmX50BTAEAzBKRKqFGJp/ZG8kc7K8S
uCdfJebvBsPeyei/Uln49JKc6m3etg==
=/UjV
-----END PGP SIGNATURE-----

--etEcZ4fPKLR4ZqCJ--
