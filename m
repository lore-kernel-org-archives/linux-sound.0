Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EA015A8
	for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753789677; cv=none; b=R2Z6ZTk8WISeNZNUKJYnC4l6nIotnQ4GMNEBCnMjtR8/AvO/od+VNnRmUrBhBLL86IEfCK0bJUAEDA7WqQPw5m4pYYfPcgETkqjWmewzWyfhf1EFYc9O+tKKhgVv7C6amuru1VdUU89symUmiwGmTu3IOuQChs/Uhn7s0QGqGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753789677; c=relaxed/simple;
	bh=WfnCwjYKidpMylbHN4o/wUeBHgNQQP9VfgbRZwm9oNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tavv6RSp30TF9zOYyrLGBqhlmcbuj4kGTnkarnHvbhreiFLkzag9+GlRgzMN7AkqA9YWpjtqWDxHupdAuXHzYb5kZxiRiuHa1E73IljfnjHgw05yNtQVUF+ce8PZU9nzC1vyP0WG3aQebmDGCHhzTiNt5dWIt+X5XhlZB72DdSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sU3e2XLB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sU3e2XLB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BB6C4CEEF;
	Tue, 29 Jul 2025 11:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753789676;
	bh=WfnCwjYKidpMylbHN4o/wUeBHgNQQP9VfgbRZwm9oNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sU3e2XLB7y6gftDQS0+ZCWwPFHDULtoVo81gSLvoOP8wGQ58JbGE+xkbz9+zgAA+e
	 iBPtA1YXIngV8pcNCWLp0QqLmHpqhylUwANqLmEi3Bec6m3a4NWdfrd3dcfk3PRFn9
	 BuKDo4Ew2od/qFWWhsOGr7zQpsqVkmHn/KPB1VMmnjZ/axGjWjkSiJgp+B+Og3UdC5
	 3wYrYVSFqUOvpgnG1BtF5/BfcRMe8sHuVsNjH97nRntv71i6IC4NlKU4dOMrltRLPj
	 6LLGkck9zZF8bfcGzQ7C7OTDOEHxdwJGu0PXkw7mGuMvn5U4JTtVeENrTcicCZablT
	 nUJr0K+x0Dnlw==
Date: Tue, 29 Jul 2025 12:47:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Synchronize happy and error paths
 in PCI probe
Message-ID: <9af2c2ca-103f-4f2e-afab-1fea5a2160a5@sirena.org.uk>
References: <20250729114229.309472-1-cezary.rojewski@intel.com>
 <20250729114229.309472-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BV/dNBg3d2xNj5Nn"
Content-Disposition: inline
In-Reply-To: <20250729114229.309472-2-cezary.rojewski@intel.com>
X-Cookie: Short people get rained on last.


--BV/dNBg3d2xNj5Nn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 29, 2025 at 01:42:28PM +0200, Cezary Rojewski wrote:

>  err_i915_init:
> -	pci_free_irq(pci, 0, adev);
> -	pci_free_irq(pci, 0, bus);
> -	pci_free_irq_vectors(pci);
> -	pci_clear_master(pci);
>  	pci_set_drvdata(pci, NULL);
> +	pci_clear_master(pci);
> +	pci_free_irq(pci, 0, adev);
> +	pci_free_irq(pci, 0, bus);
> +	pci_free_irq_vectors(pci);

The ordering before clearing the driver data actually looks sensible
there, though looking at the interrupt handlers quickly they don't seem
to pay attention to driver data.  Really you could just delete the
pci_set_drvdata(), it should be redundant (and IIRC the driver core does
that anyway).

--BV/dNBg3d2xNj5Nn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiItOcACgkQJNaLcl1U
h9BK7Af9F0JlwvkYI4nVGco7RyQOuDDHVhPdRrvb+K0lEzcbagMq5moknYXaYZiy
o7HfAV97Ae8sPkC2QKZrak5ZQZOIt60qPimZjWv4BmEX4797vxmXxsSB2OTlgYUr
BkjFTbuabNNdgGEyJ0aVzzyaMgqIxJgBsMjKYiN7ohwN1Lb76SIbXC2YULxKUka2
aH917GwCpu0mPKo7aF+W0OskVT9x4VSEZG9yEnj91wtv4PIsn8dSFkhc/pNBamws
8BF9Dt3KdKCvuTbcN7ZkYlsKRL+u8mSONM3XqtRIcCvF0POd5OMPJM0ZU3EZrPkc
kmNkTCGN/lpf2WKFWHoqEquAhBvB1A==
=X9C9
-----END PGP SIGNATURE-----

--BV/dNBg3d2xNj5Nn--
