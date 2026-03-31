Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3533D5669;
	Tue, 31 Mar 2026 11:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956420; cv=none; b=q9O5qj9aX58yuJxubdqUsbLN7Y4i8MuQxTG9b7z0qd5D685tGwH6nkXQi8t2oN+3XNck197cVMFhL8pWJJkLpp5mExTSljdtOadwmBujkWJ57Y2YdCJjHhF2DWHvCDLZ2S+TepQ1UqDKTAEWlm/W9f2CmgRVc2pCkjhpzim1OXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956420; c=relaxed/simple;
	bh=CVkNZi7O+wfvlBnNZAjEjyFuNR4ogmt8gBWAWZAh9h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYzd4BYc5HPt8azivejMF3+VtP7NVxBSUvuepbA9cCVWOxJC3jSMHWbcSIoPTutUFD3E+RnYWyp7G+NO6DxKRUxTeDr6Pv/Pad//kWYVm/g8qTg9stWFh5z+sC8V/W6I84UiGUe6rHAbs8fWV3zcl5PhKRyUeedQ458efWtm9KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9S//+CI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9S//+CI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31868C19423;
	Tue, 31 Mar 2026 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774956420;
	bh=CVkNZi7O+wfvlBnNZAjEjyFuNR4ogmt8gBWAWZAh9h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9S//+CIyNZLQuMlWGdSlexurAWga48eFOr1kBQjNHtiN9eKkU7auXR7G39bA207n
	 g/1H36hG3ONZ8PN8ZUsNw2ePdxxmMd/ydcsoiVVD2CWYLUBn110WIHkLIJlXPGrOF5
	 NWveqikut66UDe4QcgsqM2Oa4zDnOlk5nTUZMpAgihdb2OseXrlZQOMFGWcy2x+JIK
	 hHfXHy7GwclaVyIWltncsphPBheM8PcLu5Zwv3+/2tXrp20N1cW6ANxXy1Ja0lgfKU
	 okYCZvGyENjiRsXpWitDZ2Me9rKu7WogjOrvioVasIHc5qio9nFNMGowIM4huvgA5G
	 /tdkUi1AomCQQ==
Date: Tue, 31 Mar 2026 12:26:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com
Subject: Re: [PATCH] ASoC: amd: ps: Fix missing leading zeros in
 subsystem_device SSID log
Message-ID: <3d2bde4e-fb69-4e94-b83f-119f073aba95@sirena.org.uk>
References: <20260331104116.16417-1-simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5e5gLdiDkcSNQBN"
Content-Disposition: inline
In-Reply-To: <20260331104116.16417-1-simont@opensource.cirrus.com>
X-Cookie: I just had a NOSE JOB!!


--z5e5gLdiDkcSNQBN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 10:41:16AM +0000, Simon Trimmer wrote:
> Ensure that subsystem_device is printed with leading zeros when combined
> with subsystem_vendor to form the SSID. Without this, devices with upper
> bits unset may appear to have an incorrect SSID in the debug output.

> Fixes: aab1301cfde344 ("ASoC: amd: ps: Propagate the PCI subsystem Vendor and Device IDs")

Fixes?

> -			dev_dbg(dev, "SSID %x%x\n", mach->mach_params.subsystem_vendor,
> +			dev_dbg(dev, "SSID %x%0x\n", mach->mach_params.subsystem_vendor,

This doesn't specify a width so how would printk know how much to zero
pad?

--z5e5gLdiDkcSNQBN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnLr38ACgkQJNaLcl1U
h9BlLAf/YHI/is9nd0G8TfncZWDB16o2i2Go1tpbh2XnCq51ToAa5UqiWK6SUjL4
1+Ef2U4XOqkdDMUmIAfpVwDXnHWKxD0qdRtPFko9Du95WBVMFjBSRQZMe10sGF0s
yhsGgUpjcuOng5RP65HC22vNrOngTUt0LwQDA7SauFtJW4+mvkfaSE/MjAU2Y8iC
kBFlgm3cGk65N+xtJ7TGv2lPPGroIWefoxRRMfMLiizwE/Qr6pw7X4Xgi6NWhrwK
WdiVUu/nzXckhjs2rMK7YLteyj4279tBCi7eGT/ecmxxwNtoGBrmPjI3ux/umM2L
lQnlzogM7wEPnVGExG8+1rWBdLzfMw==
=ufMo
-----END PGP SIGNATURE-----

--z5e5gLdiDkcSNQBN--
