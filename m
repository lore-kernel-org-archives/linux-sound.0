Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC0274B2A;
	Mon, 22 Jun 2026 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129499; cv=none; b=rxBY5Q98PPLhSNdMZJ9v704iYx3Gz7vRnbQTISzN2XdPV6TOcBT4wEvKXOnGnhFXkvbprnzCg5p+YlJWiT95qp62MZ401SCR1M4Excpc4uNTRHfhix8zrT4Fj0Zt6n84r633RiWzBKrS25zl2G9IiVDSR3ZVhrY05BwcOmddUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129499; c=relaxed/simple;
	bh=rVH3ig1TpmixAODkax/YfQBEo/kBpfmtGiIN0bk81gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5M4cpMHRtgDrfCgogoXKY5B2B3R1Np9Avl6wRTJZQzsar3FYZHyBtrOpvk6l3NrH96UYVZf6uD+aa2A8Eut8B+eZLAJ9nixYoj56GN7uXdc1Ga5XdGjPc3VJudGfIFtogZ0CjZcKay8IrZ2afpKx77JvNsIL7YhnucsrCsepKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQZl02+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQZl02+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875BD1F000E9;
	Mon, 22 Jun 2026 11:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782129498;
	bh=x2dyoHJcG5UVVFYKxXyu1rcfblSKMNx8TbYfl6VgW5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQZl02+nfxYwatZtHKtqBK9eYD2AD5SBr7de6D4u47ry8yevB7vB1UBbteiyIVbEU
	 4lI1W+2kkRKX7a2cp/GOeYYoTC/E2AqCa/QA+U65Ks3xLHUsZfRPCNZHAp7dIs4CB5
	 1BBNXYze79QKWZRvN2ubsKcsjEzY6K5YE3qEOXXojwr5GpRasaF4tgs+sWEm76y6fr
	 UjkkTA0JY4+YjTBfSMDt8vm+9JxkwkmjQrmde2fS0J24C3xCQZqz9hLf6pvCJohtvY
	 67+0W1/23epU7S6kBEAIdVANkBvyrtd4zdOJjT1q5c0PIwwm3Fk/HIThbYz7YCBada
	 Lcnr1YHpPyZ7w==
Date: Mon, 22 Jun 2026 12:58:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Juraszewski <bjuraszewski@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: tas2783: Update loaded firmware names to
 linux-firmware 20260519
Message-ID: <7c3d5b30-a415-48e5-a0e6-8d910424f0fe@sirena.org.uk>
References: <d2558567-67b9-4fca-b170-c6ece9f8cf23@sirena.org.uk>
 <20260621140001.63829-1-bjuraszewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Na7jCVgmpDsS3nZ6"
Content-Disposition: inline
In-Reply-To: <20260621140001.63829-1-bjuraszewski@gmail.com>
X-Cookie: Now I am depressed ...


--Na7jCVgmpDsS3nZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 21, 2026 at 04:00:01PM +0200, Bartosz Juraszewski wrote:
> In linux-firmware commit from 2026-05-19 `2f90f4fe5c67f51a8410907a...`
> `ASoC: tas2783: Add Firmware files for tas2783A projects` by Baojun Xu
> 138 new firmware files for tas2783 were added, none of which are loaded

> +{
> +	s32 ret;
> +	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
> +
> +	tas_generate_fw_name(slave, tas_dev->rca_binaryname,
> +			     sizeof(tas_dev->rca_binaryname));
> +
> +	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> +				      tas_dev->rca_binaryname, tas_dev->dev,
> +				      GFP_KERNEL, tas_dev, tas2783_fw_ready);
> +	if (ret) {
> +		dev_err(tas_dev->dev,
> +			"firmware request failed for uid=%d, ret=%d\n",
> +			unique_id, ret);
> +		return ret;
> +	}
> +
> +	ret = wait_event_timeout(tas_dev->fw_wait, tas_dev->fw_dl_task_done,
> +				 msecs_to_jiffies(TIMEOUT_FW_DL_MS));

You need to reset fw_dl_task_done for each run through this, _fw_ready()
will set it unconditionally so if the first attempt to load fails the
second attempt will see the flag already set and not actually need to
wait.

--Na7jCVgmpDsS3nZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5I1UACgkQJNaLcl1U
h9AaXgf+IcirFW2oSwph5eI+PmUHutnVxfLdgDcejjjrzl04V6zpHYZMCkSnsuZu
3k5mGr+sV+vYRQgWPsoPDXb/P2VGwXao6+Uyo8sYIWmJjgoJQTtFDcvCbyEXfQPp
95Wiqba0ozWRhs+n3/WygiyUgY8xoeWlDQB6931HPjRguecmXY+ji/f3P6/eVTUE
blI05HYsl/3qmYemMrHPUwVkwrAtK7SMiBhyLtd6KDpktv0cZq4DxF59rkbVDLNQ
EZbZty9tVtuYqIP9ghPZVXvwnf585rWxWgggVLoo5ckWW8gAs5xIxKsmOy3DQqMF
CRTD1zos0NVIHN2jWCBwwJkw4+6wsg==
=g/1s
-----END PGP SIGNATURE-----

--Na7jCVgmpDsS3nZ6--
