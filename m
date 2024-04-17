Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A152913FD6B
	for <linux-sound@vger.kernel.org>; Wed, 17 Apr 2024 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713362192; cv=none; b=ukeiOrG/U+OuaJxt8GbvKyLOXeqf/RUk7BG9NLw+ql+64yL71H0IU5hhLRt0MIAYzIHVSReFj0aMTrOL1SSBUO8QPxV0aCoi2z2CH8IbanBq1gugbiw1u9cXRaOLDbav4BmLLpJV/feWCbuwMk59ykMnJHOGk5KcCItlGucLbKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713362192; c=relaxed/simple;
	bh=nh8ImX4uidNb2h49IqFiuw3hfZBwhc+BJcS+t5FzWm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osqeyYwhnfzdk7rkBKU9Fbcbyj4KVcDqQpJoIkds4gvxs9PKlGepi2R79397lHa1nVtIgye1pjnlEWJcokMaf38ugiZYZq7DVAgO4/RjnYsWEwjWMPbISYB2ofLbjAenJDfw6qsCNE1UsCtRtbsma3mrldW/Ixj0mf0m2WCL2N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2pp7UKp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2pp7UKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1DAC072AA;
	Wed, 17 Apr 2024 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713362192;
	bh=nh8ImX4uidNb2h49IqFiuw3hfZBwhc+BJcS+t5FzWm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d2pp7UKpseYnSfUakhvh1VGZs9eZwoccFcadPkpxf4AIWwUf/tAhKEoNqCVsBrsuZ
	 O++ylcdj2jmSCJGymEk5WuKtsm+rzKGLcQHhjICefUV40pXTL8rfbDfhlyKoDcv7ci
	 6qlH37MuvHj78ZR/12hVuBOudyL6SiqrMcLNgFwZG0dYLbvsndc1NwrnZ6msy46BfG
	 RnztVFpPta244fFjHCVe90syR4A4YJ6LFeEmf/B5WeRj9bnzU8u53yc0jYo4YQ+/PJ
	 e793NjCKx6GdnByzTJvVjFJ6PBo1OwJ9ilbcQuhmeIk+q9aBvjPz3BQNBrcSHD5WGg
	 0Cnwym7oKV2nw==
Date: Wed, 17 Apr 2024 22:56:29 +0900
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, chaitanya.kumar.borah@intel.com,
	yung-chuan.liao@linux.intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH] ASoC: SOF: Core: Handle error returned by
 sof_select_ipc_and_paths
Message-ID: <Zh_VDVHrk-dzPSDg@finisterre.sirena.org.uk>
References: <20240417075804.10829-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zxda82PG0sNg8IQF"
Content-Disposition: inline
In-Reply-To: <20240417075804.10829-1-peter.ujfalusi@linux.intel.com>
X-Cookie: TANSTAAFL


--Zxda82PG0sNg8IQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 17, 2024 at 10:58:04AM +0300, Peter Ujfalusi wrote:

> Can you queue this as a fix for 6.9 cycle as 90f8917e7a15 already present
> in 6.9-rc3

When I apply fixes my scripting tends to work this out from a fixes tag,
though if something fails to apply I will tend to just bump it to -next
and let stable figure it out.

--Zxda82PG0sNg8IQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYf1QwACgkQJNaLcl1U
h9DeRwf/Sbhpuc5S7+ymnMzayxbUoBa0Go2sJLALIAOw6X8Zr9KKO9DNtOUDjMO6
5YHHGwzB8d3eWHJ/y1EU5v7Xv+2J0yfupvEsHoVA5MHlYJizSAzCTAUZJuZ8F0KH
hvTesK7ZEp50UXnLyiKTP73gpgERqM/+fQQ+8MeOb0Kcj2bIUIhuka9CW6GW775+
E6HzfsckWwCGqlgcmgtrG6fLhWFa2V1IcVeXpqPrQa4fc5ag1HYkb+9tArRb29Rp
39F3DDwXVlqAWbHLZy0ouB+fh2OXMIghI/LIGWy6m3gYrqahFSALOAkxN7hIpS/T
7RtcKnMeQGpqqE2tB0dQ7cbSDZJMbQ==
=vWD2
-----END PGP SIGNATURE-----

--Zxda82PG0sNg8IQF--
