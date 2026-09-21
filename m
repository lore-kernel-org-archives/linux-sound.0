Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2563C1991;
	Mon, 21 Sep 2026 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996230; cv=none; b=GjjwqpHoQX+852d3CI9aDNkuAzl+/aYfzY4G6T8f4OxnMYGUhCdwMAHv0DW8kf7UTqYOlFeYt3bLNRkN2L3DlD3WCfrfDTRctYK9DnV+AEDpuNgU3GTf5zdA89XsVgbQG4g0mG4evN1s99mS2i/XD6IE5LInLVa9HvvMd+dZxdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996230; c=relaxed/simple;
	bh=6FWwFfRDQ1RulapnrpL2jZwRh2Ic/DqFJ6v1PlZV+f8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCchKNC1lmxAvbfQFRK8UOsSDTJZURu2zRTz6VcSeGmSw0ws44JFm7WAdfwr5ACkDA4g8+K7DqHcw+5Nj3VEyxre0m5uSvwxBZd4fPeuSJaVvg6ufOMROKFFmc6YsD8QNkglqZuBm+eiqQkHMgliSkfyxoSuEvRt9oihWPCjDjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpFLik1c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpFLik1c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAFF1F000FF;
	Mon, 21 Sep 2026 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789996229;
	bh=6FWwFfRDQ1RulapnrpL2jZwRh2Ic/DqFJ6v1PlZV+f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XpFLik1cEP/K3G5UFUq46PPlMePLcOPQU4WZjKpWBxWD/S+rJM/zja9rh8rczrr0F
	 jk+grOJKmTwOxJNp/zGYiJ2u5hq4QJIYee3VAqD9ZyGhNyrNt7TFUuiKjXnanUUb/F
	 XDBfiVPMHgQUubnx8v3jhEoyLNxkcB8LDKYihzdlrHZ1oeYmTbS56jbnAF1S4UBj1G
	 s/3PlYUDgODEjA/egRIRNIGl66DPqXLS6DYQKWMkc86e8LdaUMKBry+24XMizlCYNJ
	 15C1OiP3QYjLxuN6Rpe7jU+5eC3jc4HIkFR5GEQQfp8pVneE/x/OCKt/tKcpKL9obz
	 9yVVSapkBlrJQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A26841AC55A7; Mon, 21 Sep 2026 14:10:18 +0100 (BST)
Date: Mon, 21 Sep 2026 15:10:18 +0200
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Zimeng Li <me@lizi.moe>, srini@kernel.org, lgirdwood@gmail.com,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: use DAI table index for playback
 constraints
Message-ID: <arEsulS3bXMh43og@sirena.co.uk>
References: <20260920145848.44521-1-me@lizi.moe>
 <393a1343-cef7-4fe2-8236-8946185bb394@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4jhua4iUUZegOUT4"
Content-Disposition: inline
In-Reply-To: <393a1343-cef7-4fe2-8236-8946185bb394@oss.qualcomm.com>
X-Cookie: Too clever is dumb.


--4jhua4iUUZegOUT4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 20, 2026 at 05:05:48PM +0100, Srinivas Kandagatla wrote:
> On 9/20/26 3:58 PM, Zimeng Li wrote:

> > Assisted-by: LLM

> Can you please add the actual model name as others do.

The latest standard for the tag is to list what was done, not the model.
Which model isn't really the point, and people felt it was more being
used for advertising than anything else.

--4jhua4iUUZegOUT4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqxLLkACgkQJNaLcl1U
h9DN2gf/X+k1ZVTNVDKZxGtEwf0XknBWd3KiGcIIp1XjIn6oluo11gdVs6ZF1lur
oRsIokClpv7NETSQrkJlG2sm9i1Jw05MgdbfEIcKbaCNzrMVB8hm92x9cL3Dsf2v
h8CgRiOtJSNNDKcOEYVUsIikF4MdLXSMKXN+uRiJjNGY2YT7rDPLPafXry5oyYHO
FqQj6zzl/IFfMbvLHFZFeLkTBLhkvNE5u35Owj38pKKch34kzMUMLS+pEM1aidW1
eetRl2ylcoW28nKVJcCVgaDv1irIjHCikTTJ/PqGa7pN//RIpzv+00oCazph0JL4
aBqe+flqlvsa33uW+XB6Sc5EsUBILg==
=RSQt
-----END PGP SIGNATURE-----

--4jhua4iUUZegOUT4--
