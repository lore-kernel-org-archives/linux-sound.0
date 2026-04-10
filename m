Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065BF1DE2D8;
	Fri, 10 Apr 2026 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825045; cv=none; b=toPyq+n36VnJPOw+EZiZIOS4IUuQ0t29tcpPHrruhaDGl3dblc8/Lu2lW9BgVDhYt9CPKeARaEPQPIzYZzim9tI+DKWoYk91ARil5G6wXAJWBgNo+61tbiJrFVVwel3WwMntIpgkta4Po+88z3DmTnwTLuMxe0OqN6GbyXYYhAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825045; c=relaxed/simple;
	bh=bLGENswSoyoqCqYQD9JxUMUmEfn/D7fePyXXBUxLS64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1HefD0S8W5iuQCe6OjYfHElZnbjsk+BvoE8jzFg/NOl674nhAuxg7IewOp9D0xUvfyWbF+IkPkxh/oGViUILXdGVw/U8ZjXtyOVibOMmRAeAeGBNe5hQDnfsp1ZCpmaYLqJnauNGAsm53M1jMqMZlX6TDlGYWMQxuaqU7d15iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qo6GcAVn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qo6GcAVn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72413C19425;
	Fri, 10 Apr 2026 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775825044;
	bh=bLGENswSoyoqCqYQD9JxUMUmEfn/D7fePyXXBUxLS64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qo6GcAVnkICW1CcUMix3fvG8r8kOcfryWryG8aLASxIJM/3RXaYRAhSZ1VlUBosXb
	 Pz3EIBrGKt6W5/eIflPHJ3Pdia7GeTM9FyK3fSowm0zQ4pUrMBfqGDXryHguRE8+gG
	 5c++FN1JeFCqYXiVa0WR4GH4ttazSxDL6PUZ85wBUYBbl9X0xCyY9zue4HAxVwtRLn
	 e165N/SnvlUEi2UAroWs2aJoTW3NAjWwX5WplZsLkokcqRtvckk7CALzBzjFuylw7R
	 XzKRV1heJEOFwP1uvi+eeeJZjP7QcAjxEsam8lhP38nDsjKVGcMt8iFqYI2olptXoT
	 cH1Hjr+a689IA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CA9121AC58B5; Fri, 10 Apr 2026 13:44:01 +0100 (BST)
Date: Fri, 10 Apr 2026 13:44:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v7 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <adjwkfUKuAFeveWB@sirena.co.uk>
References: <20260410092536.5521-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SsOdXeJhe+av1pz9"
Content-Disposition: inline
In-Reply-To: <20260410092536.5521-1-niranjan.hy@ti.com>
X-Cookie: You will be divorced within a year.


--SsOdXeJhe+av1pz9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 10, 2026 at 02:55:34PM +0530, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.

> +
> +static int tac5xx2_set_jack(struct snd_soc_component *component,
> +			    struct snd_soc_jack *hs_jack, void *data)
> +{

> +	tac_dev->hs_jack = hs_jack;
> +	if (!tac_dev->hw_init) {
> +		dev_err(tac_dev->dev, "jack init failed, hw not initialized");
> +		return 0;
> +	}
> +
> +	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
> +			   SDW_SCP_SDCA_INTMASK_SDCA_11);
> +	if (ret) {
> +		dev_warn(tac_dev->dev,
> +			 "Failed to register jack detection interrupt");
> +		goto disable_interrupts;
> +	}

Fairly minor since I'm not sure anything will actually do this but if
jack is set to NULL to disable the jack this will still leave the
interrupts enabled - the driver should turn them off.  Probably also a
good idea to lock in case there's jack detection going on during a
disable.

--SsOdXeJhe+av1pz9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY8JAACgkQJNaLcl1U
h9Bf3wf/U0ni8Jxv9qY8Sxed9jZCksz/n3Y2tiYQY5iG8W9ZMdNBRCl0TVyg/k2V
aSNoO8am5gu0OD517vaOuRVuoZ9m5Sxso/OUam7cB2DRH+/paSJXHT/EI91AmsgU
Ceyk9f+ex2H7iyexVRwLjC7dIhqeiSXOCkBl2rdBfvuOd7G6p6aVvZirJ4CntG90
AhHScvBROiPwgh05Iv16PzFuYhSX0DeXgoO1ldfEP6NosnpZTeOGKP7s/c6KBEnP
XelDBTZSs3xUjv1TDaA9BQhmj+i+TIFKzU658k3o70Ok+7IG1h1vP0uw4Yn8i59Y
EIiUBppO6L2nJnTUWJBXUYNUMV8nDQ==
=2fDf
-----END PGP SIGNATURE-----

--SsOdXeJhe+av1pz9--
