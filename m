Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364B20C029;
	Thu, 15 Jan 2026 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768484123; cv=none; b=jX/jQwqplNkT0R5/uLi1tKSm5aS4LVNpl4ddGU0GOOaNAGYW7d4ouSICNtDF0RKLK0kiDAnzTMgETg9Hl3OFwEn/MNdihPPRTinHGc2KRkG8m0x+HBkRz+vGe/4+lBjs7fR89h/jBHKEt544kExer1J90VJLK0fdrWvcxPu9qEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768484123; c=relaxed/simple;
	bh=a3SlvvjrKSfBG+irl29R81Hq//pY03hNYixJWCTAFm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6F1wBw7/n94MfLMXGJYhPKWcnsKwigqQcqqFSZK+Hck+WGqv0lIbt32AgS/nEtPARJ/RQARiSOZOnl/aIPjb9Y6g3Ky1ZC7xAMOQStR+b9XdrpWVkzRzDjNmforchFAkjOvh0WV6YwUBlegLg4URnuu9oB5GMhyNKMgkky35PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+ysnnhw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+ysnnhw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E01C116D0;
	Thu, 15 Jan 2026 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768484122;
	bh=a3SlvvjrKSfBG+irl29R81Hq//pY03hNYixJWCTAFm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+ysnnhwsjFg0arGOMFOhGlEqq9GuJ7rzhbGky+oeZsOVi7wELVrBVxcOpuHkkGtQ
	 qOLaDXNkqXvWJcKEVAKBc0FqvtUyN5b+tB7NHbguZ5NuBwPM7k5PcMG1/hypLtkHKR
	 xQX9MQ9pKBCsIhgP6MJEWrwlQtUDzcbh2Rcl0qucEWcyG/YwCdeLwpWFb/V0qA5szc
	 jzK6bCb8/dGpqCnBFIW3v0TeD9x41kI+C34pKfFKQdyYvrfI/oQCvCt0/UtJKJLI+K
	 u5Pxd7n8LhSU4comyqdmRbA1QaKzwVeCNTZBWjTTNJWJqrxru74cd/CO4zwhqzbzNj
	 HOFsLgYsCmxSQ==
Date: Thu, 15 Jan 2026 13:35:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jon Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5640: Fix duplicate clock properties in DT
 binding
Message-ID: <1199975e-cfd8-4a97-b7c6-0e0b9e7abef2@sirena.org.uk>
References: <20260114-asoc-fix-rt5640-dt-clocks-v1-1-421d438673c2@kernel.org>
 <176848231789.253446.13860422269412592694.b4-ty@kernel.org>
 <aWjsPfGO75DzjWhb@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JEYIukm5XNCHAKG2"
Content-Disposition: inline
In-Reply-To: <aWjsPfGO75DzjWhb@black.igk.intel.com>
X-Cookie: Are you sure the back door is locked?


--JEYIukm5XNCHAKG2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 15, 2026 at 02:31:41PM +0100, Andy Shevchenko wrote:
> On Thu, Jan 15, 2026 at 01:05:17PM +0000, Mark Brown wrote:

> > [1/1] ASoC: rt5640: Fix duplicate clock properties in DT binding
> >       commit: be5a39e7994ec9f003c8569b670c794a4e5d1551

> Note, in the repository the change has duplicate SoB tag. IIRC Linux Next validation
> complains (used to complain?) about inconsistencies or this kind of issues with tags.

I'll be sure to tell me if it turns out to be a problem :)

--JEYIukm5XNCHAKG2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlo7RUACgkQJNaLcl1U
h9DaDQf+KUN7uP8md260mrSiZFwJUGS+S+Jv8/OaNXTDfwvPCMvHM11iZstPxyBN
JtHsVny6vckxkKKwTTmeD1vE59wFnvAiWsLSaCm7BLKugD1wzpaVo7qk8eJAFQ7h
azPrrN4EyHcEucgrz2f2aY6d6r1dIEopQHpiLMFn7gZ5P6mrNP7Tcu8BYIOKlUS2
+NiRDlunm2DNubvxlvnQ0Wfcj0ONlR9QCj9Tjnw1X2vtQR/xlXG6noeUnzp9AN7C
WxvdEbKFxWIyvrXu7x8SN/H7McxQeClqvdzRsisgF6RwDetIivjw0Vaw5KIvonuP
/7/yT0iUymWwvSufVl87iv09zNeNDw==
=LaVi
-----END PGP SIGNATURE-----

--JEYIukm5XNCHAKG2--
