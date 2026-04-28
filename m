Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D412206A7;
	Tue, 28 Apr 2026 00:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777337155; cv=none; b=qOC0DcKAdF3SQvh7A0OfxFrzUJiNTg5yrDuaxlXMFwEg5dBCiWPORu8/NV9fWPdj2Z3YcaNsdMuoZLniWcFXqhqXPFZW9KOUZLLBXMfGwm0ESedfUF5EBdMeGsMes4wReSxN3WxoKmhEbKo+A+AWVP+DkdzFcbD9f97DYhoOCk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777337155; c=relaxed/simple;
	bh=EFPfRrSmdVq90rjqZHBVH96x2gucqh/e1Ft/hO96PIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPs8gxltfVftBRwc97LhzD1p1U8dbejwrTWl28FrdBiscH0oJvqqG34KlNFPToPXKhFJYwJnfyg1fugm413QGJ2BHuY29Gx9PYskCIAMKTbHIJx0UtAXx0krI0b0/gut59RWvLnPqQorXEIjTo6dmbbTeFGRdVrlAo+fUEpXPFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrtbA37u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrtbA37u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3E7C19425;
	Tue, 28 Apr 2026 00:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777337154;
	bh=EFPfRrSmdVq90rjqZHBVH96x2gucqh/e1Ft/hO96PIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrtbA37uPlYnqd9ehUAAeioI3s7BmGuojuna003Zm26irTjr3gDYR0SNLLmedobM9
	 ZTiLold3Ocf45pV2JQw44IQExJYx/K4ttuF0Sb72cdswWMkhOUAaG/73RBHJExZ5FX
	 VoqiceFIc5nmP/HbTnjtLvoOEzXv4zLaJqfeIkvyBjM1vlGjHHyYdoc2rF4JWzYZLB
	 adkQWVw7DHoz7DHt/s3v0mcbGFaPQ8HpTXpJyklVhIoKsmnYVWYPa6ouKdODLCOvRJ
	 XktZPcaPCq9cdW1AXufXYlULWhOZKmLIfp0iD1nZ3/E6PYOnMJmbvwx6qbstKQ5wO6
	 Mf+xTp85jEPXg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 131841AC583F; Tue, 28 Apr 2026 01:45:52 +0100 (BST)
Date: Tue, 28 Apr 2026 09:45:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v11 1/4] ASoC: SDCA: Add PDE verification reusable helper
Message-ID: <afADP5lPtcG13RTr@sirena.co.uk>
References: <20260427082401.2118-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nat5SNHhR9VJzBmb"
Content-Disposition: inline
In-Reply-To: <20260427082401.2118-1-niranjan.hy@ti.com>
X-Cookie: Victory uber allies!


--nat5SNHhR9VJzBmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 01:53:58PM +0530, Niranjan H Y wrote:

> +	dev_err(dev, "PDE power transition failed: expected 0x%x, got 0x%x\n", to_ps, val);

The old code included entity->label, I guess for disambiguation?

> +	return -ETIMEDOUT;
> +}
> +EXPORT_SYMBOL(sdca_asoc_pde_poll_actual_ps);

All the other SDCA stuff seems to use EXPORT_SYMBOL_NS() or
EXPORT_SYMBOL_NS_GPL()?

--nat5SNHhR9VJzBmb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwAz8ACgkQJNaLcl1U
h9DMzAf/W3RHDdCvsl7LajngGyqSSdJve6odpTzyinSsdU3GDcNDYfPFahPT7aEa
ojALzAb6aIRD5S3Z3dkCUAoX9Q0lbNJC7Xeesx0wXQB/2EgQ+RMLUb5/ClT9wEcw
l7K+DXpiBRQzrb7ooM3jwT7v8k0Pv8hqFNrgxNk+Rs8b9558sLUzU0YfI/xHKDlx
hm5/vxHIVTyziNlmFQllABHCY/BmnD+W1a0qvId9gCZGktw2wFF75DAOCk/6kucN
2ilGRDn4cbij9cKSkmLwlJdczQkBqIrm5JHNRJHSmTCd7lukCibpCOCuqy7GU9Xv
RylVemt/F9AkuXthLbGIYFyRWHC9yA==
=Qak1
-----END PGP SIGNATURE-----

--nat5SNHhR9VJzBmb--
