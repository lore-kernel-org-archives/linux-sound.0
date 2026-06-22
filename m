Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117FD32ED5C;
	Mon, 22 Jun 2026 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146542; cv=none; b=I7Fsn64MkwQyvkBWRaxOWpDkOuWPLru5N2YmK8HOXDL5taeTbzSk78tN0THKSP8PqyxFRAF+jz7yKVQwjd/iHus5ED6BkEYurmQv2GWY9ImbnxCSjz/RrBQh9n8qXh0BQf5hv3/ZzxiiFkgMdpr7cFAarYrk9qGItO3+jQ4DPdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146542; c=relaxed/simple;
	bh=YoCLaAIn64P8kxNvU0Nmzi5GrvPkhA8S7hulII5ovus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohCIfshelM7UWiDPvlfvnAfvcr8qCCl1FLje5yZMgwvAiBsBTXzEKad8Up5FIyIprd1MfZ1PJJ8W9QyLlKGUFqU7dn7JilnQOD8ZtyEtBv8qAA6s3KhnwKcrp6uUikUmjUgXffGRceDg/plL4hDRMIpA8RG+H/1RkhWM92jPXqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRmwA6d/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRmwA6d/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A271F000E9;
	Mon, 22 Jun 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146541;
	bh=Tcl+lBB80ygwJN1TYkxKsg3n+rTrZKuwSDTG4/iIRvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aRmwA6d/sm2UEl+wxeU/6dSYKysT+ezYpQsiDNkP0xRC72MmDqAwUHCprCl54tnHQ
	 48dxLDUJhGD/f7yeI5yLWDcOeGaEctl6136WSyZOsE77jrKKsdNI5Picd83htPVqxb
	 V3/OS7opDl/HqCE1/fHoiscbQwd0uJVDEoKXyQAD66Dc8/sRnK+exyNtMkPSI1JMtk
	 TMeXJD5HwqHa9qitx0m+ZAeKuTqxPwsAuPJa7kUMxU3oEb5/nw8iGJ/aQmY4x9HZNc
	 cL9cql3HqzKRlutgnmuppxdRuSArS9uaisNw65N+oq2sYZcB/0xVXH0jBH6ovQc5Eb
	 G1Ob96RwpfH2Q==
Date: Mon, 22 Jun 2026 17:42:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add MDSP carveout memory
 and update APM DAIs memory regions
Message-ID: <d8c8d731-e3da-4d90-a3a8-21e3bc7b04f5@sirena.org.uk>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
 <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
 <20260622-defiant-warthog-of-authority-d9d1ba@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dd2C0YazAE3J90fn"
Content-Disposition: inline
In-Reply-To: <20260622-defiant-warthog-of-authority-d9d1ba@quoll>
X-Cookie: Now I am depressed ...


--dd2C0YazAE3J90fn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 22, 2026 at 03:42:15PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 18, 2026 at 05:05:09PM +0530, Ajay Kumar Nandam wrote:

> >  						q6apmdai: dais {
> >  							compatible = "qcom,q6apm-dais";
> > -							qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;

> There is no such line in next-20260619, which means this is some wrong
> base.

There's a pile of in flight stuff listed in the cover letter as
dependencies, likely it's one of those.

--dd2C0YazAE3J90fn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5ZecACgkQJNaLcl1U
h9Czswf/UMhrbKAiRZGA8hlnA90KkOPXDbYLtPFzrtlvDBa5I/ZY/r6J8Irs6+4e
hmZFH9EZsNTg0sw4yw2vl2zlm7BFftrkTKO6Qg0zjtewj7ecaEBPdZfx5hY7S4gw
Gi76hK5JQ0v1CF2B0hRGNSctC8DYaLdN1wO7ZpClkP23k3gMc14MkaveRHOMzX5i
nafAQTB7DTTO5Z12mV3lvCYb5cCXpaBIC5kkAQ7HgGJasQShYnkt/+0hsmlEINi6
XZ1FDsgl4O5iHPlnXZm5Mv6yrLgih3Jt9/SkGsXg3aW9Eai6tGvu+3JOF9F6CnCr
Tq+Cq5n6mpOpFBOoJSyFW8o7BdJK5w==
=8Rv1
-----END PGP SIGNATURE-----

--dd2C0YazAE3J90fn--
