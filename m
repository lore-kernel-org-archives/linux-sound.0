Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA6F25FA05;
	Thu,  9 Apr 2026 20:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775766941; cv=none; b=kXKES6DMUVnozUnOCneQz4Wz5Ao1MsDiHm4JaJUNryEjI1jsoR60gn4wHwF0ddDfPzwbz6KTKvxEbl5qG3WpUSo8uKkH+B5ob6wSJnTMpnu+Sga+t6ECxBeYr9cjOLByZGqJmnMrYySve3iZXMdsyBDM5nE+1WiaCyo2N2FpiNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775766941; c=relaxed/simple;
	bh=QLd+Pdg+WN7Q6ZVI5ZG9GIlBlYTp2v+lv92C51J41uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9pxQndo58ns95rbhYidJ9kWQAH3XB/jy0XByXnI81c0gtcqwYnWtfrL5kYx2sYZK0H2zgKxJf/oKtcZ+ozdIHlid8uxIU0ub+MfgVFIrkNmkCWAsqN40EVc/ai6rNAwmVh5jRFFThP5ETPrBWuS+4BnKHp0pi4+TjjcNa6aMaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQp3ch+e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQp3ch+e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DBDC4CEF7;
	Thu,  9 Apr 2026 20:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775766940;
	bh=QLd+Pdg+WN7Q6ZVI5ZG9GIlBlYTp2v+lv92C51J41uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQp3ch+eNSpQ9GudsEJJ1S1QnjJXTb+LQzXguo5CSYhSSDsYKJjR41i/aacSXdAax
	 NHkmeSFPZVi804pc5dP3b486RwxqlV2TPOV8ysvoNjc9qHprAFtAUdChlyYhdifdyw
	 KfIEsFS4io/9oZ34NlPze56VaisoypE2WRigdbb80PmbzB4bz0JBqoE5Q4c0tqWvYk
	 oDQjVzUHVw3P6BeB37FQn/jBYqqUGVxs8vpa9XQPZ6kGC8ZAKK0qX9iGZrnwymbpHx
	 E0yxjOjsFs9D2GJgtLNamQDPH2MKPY2gTQZGipDCZRuPr/ehsSxseTQY8YUMyxfr5s
	 wJyXQApEb7B7w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0166A1AC58A7; Thu, 09 Apr 2026 21:35:35 +0100 (BST)
Date: Thu, 9 Apr 2026 21:35:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v6 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <adgNl2yLkAqmj8NT@sirena.co.uk>
References: <20260408185212.4605-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zZMkXvPa4yHgbDyY"
Content-Disposition: inline
In-Reply-To: <20260408185212.4605-1-niranjan.hy@ti.com>
X-Cookie: You will be divorced within a year.


--zZMkXvPa4yHgbDyY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2026 at 12:22:09AM +0530, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.

Only a couple of very minor additional issues:

> This includes the support for

>   4. tac5682 - Similar to tac5672 with Amplifier DSP.

> +config SND_SOC_TAC5XX2_SDW
> +	tristate "Texas Instruments TAC5XX2 SoundWire Smart Amplifier"
> +	depends on SOUNDWIRE
> +	depends on SND_SOC_SDCA
> +	help
> +	  This option enables support for Texas Instruments TAC5XX2 family
> +	  of SoundWire Smart Amplifiers. This includes TAC5572, TAC5672,
> +	  TAC568 and TAS2883. To compile this driver as a module, choose
> +	  M here: the module will be called snd-soc-tac5xx2.

TAC568 is a typo isn't it?

> +static int tac5xx2_set_jack(struct snd_soc_component *component,
> +			    struct snd_soc_jack *hs_jack, void *data)
> +{

> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
> +			   SDW_SCP_SDCA_INTMASK_SDCA_11);
> +	if (ret)
> +		dev_warn(tac_dev->dev,
> +			 "Failed to register jack detection interrupt");
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
> +			   SDW_SCP_SDCA_INTMASK_SDCA_16);
> +	if (ret)
> +		dev_warn(tac_dev->dev,
> +			 "Failed to register for button detect interrupt");
> +
> +	return ret;
> +}

It's a bit odd that we log but don't return the error from the first
write failure but do return the second one.  Really we ought to do
return both, and unwind the first enable if the second write fails.
Probably not that important though.

--zZMkXvPa4yHgbDyY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnYDZcACgkQJNaLcl1U
h9Dssgf/Ul8RcJc58phmjjcqXXuDR6LYeRsj5g4IvDSuk1dznmrNjQQ7ZbhgQ2Ab
tiKP7c54dBuLLkan65ZibefkJYxxEkvWQcnFOjw/PfvT4+XYYIEn88DVjE4UGzb6
XdrFpHEClj2eOJze2usgXycra/VFbKcjJNZV/xZhZ96rdSNK9mix3Er4vSGD/ha3
lFxlurN1qcy7oGerFL+P40LDvt3VrxUUdV0RHPMeZ75DnC4CKDP43Vcdfo28AX7H
Q72YTYtXfuLbDblXkr3++Jl068ylnPtkRHvga0MhYbeVZdxGA8277xqC6Y0xx18Z
hdrTaKiyOhLr9KXX/GMDhL28mVwmLg==
=m+t7
-----END PGP SIGNATURE-----

--zZMkXvPa4yHgbDyY--
