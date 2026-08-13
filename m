Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1E53EB0F0
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632230; cv=none; b=P4Y1+uAAOPS5PkocB46sISi9Qx8Oy9nGjoN0oS4xIOau4qmTi+ze6Pe7QMs0Rf1r1f0TJLaoDmaTkW8D0XU4U6aDsbPnQo4y3hHI/X/hLCTozSTloIhTjzbIjEjX47NxP+tEi1XUMCOgPZ5iK40ZOWod7DepdbCNXafwEsghjMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632230; c=relaxed/simple;
	bh=1hiTl7N6P/Py8qMXjsuALy8vPXUM6OcUFd014KI8Jco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHbQKnMZvApOamDKLVn04ONy5RWQ3dFfo7pjUhZVj+qL0a+ZG1DWAoyfZHvNu2Bhz+Pt7ONQEEZwTpegY26EAzZNsvH8rjGbzlTNFiD+XSrfoiPeTs8s2IYgdj7fxU9iyzoPnBVLwcknVcSqXH8yItUTpJQB8Ip8kcqmYItZGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDWo/Vqm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDWo/Vqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081841F000E9;
	Thu, 13 Aug 2026 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786632228;
	bh=lLbgNjkwlSpOKB5GXgGA43We9oP2pA0V6o3oQj7uGzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VDWo/VqmXzBvIn/6WB8XODwmPNZbleERZp1YrqJSWnkUcOe8muBeKapSsf+KRCCyV
	 NBjq/smTDeEUMcRN7wYsNhGqK59Coy/RR0YmcDcuJhnrHRJ6zsfUryMQTR+yWGbqfA
	 S1cnAGudlVXui8KoO1XTvK4PQVRU6sdcBWvHwNHedCMvxdARmfAM065Vm2XRKVo/gd
	 SgwCRRt/dmvcDHkK1PJ1bhU60YWJoXwQSjLY2DRPvyEo+LlE2vOk/GsG9XIX7Qa8Bb
	 O4JFi1L79j2MzXToDR7wawtRCEk609LMd/xo/tGWVlHV/XJv9TBIr3CzfJbtSYffRJ
	 kjtKff8spPfkA==
Date: Thu, 13 Aug 2026 15:43:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH v2 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Message-ID: <e7c1f952-f7aa-4d3e-ac3f-7160ecb41e65@sirena.org.uk>
References: <20260813024527.42294-1-qianghua.wang@senarytech.com>
 <20260813024527.42294-2-qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="31FW+osFI9wQVZN9"
Content-Disposition: inline
In-Reply-To: <20260813024527.42294-2-qianghua.wang@senarytech.com>
X-Cookie: Immanuel doesn't pun, he Kant.


--31FW+osFI9wQVZN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2026 at 10:45:25AM +0800, Qianghua Wang wrote:
> Add a SoundWire SDCA driver for Senary SN624x multi-function codecs
> (jack, speaker amp, and DMIC). Program SDCA SampleFreqIndex in
> hw_params, keep SDCA jack IRQs masked with poll-based detection, and
> extend the Senary MAINTAINERS entry for the new codec files only.

> +static void sn624x_jack_schedule_poll(struct sn624x_sdca_priv *sn624x)
> +{
> +	if (!sn624x || !sn624x->hs_jack || !sn624x->slave)
> +		return;
> +
> +	mod_delayed_work(system_power_efficient_wq, &sn624x->jack_detect_work,
> +			 msecs_to_jiffies(SN624X_JACK_POLL_MS));
> +
> +	/* Keep poll alive across autosuspend (3s default) when idle */
> +	if (sn624x->component)
> +		pm_runtime_mark_last_busy(sn624x->component->dev);
> +}

This works but it feels like it'd be easier to just hold a runtime PM
reference so long as jack detection is active, the net effect would be
the same.

> +static int sn624x_sdca_set_jack_detect(struct snd_soc_component *component,
> +				       struct snd_soc_jack *hs_jack, void *data)
> +{
> +	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	sn624x->hs_jack = hs_jack;

There's a bunch of error paths that could leave us with remembering the
jack is set.

> +static int sn624x_sdca_io_init(struct device *dev, struct sdw_slave *slave)
> +{
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
> +	int ret;
> +	unsigned int jack_func_status, dmic_func_status;
> +
> +	if (sn624x->hw_init) {
> +		SN624X_DBG(dev, "io_init: skip (hw_init already true)\n");
> +		return 0;
> +	}

> +io_init_next:
> +	ret = regmap_read_bypassed(sn624x->regmap,
> +					SN624X_REG_DMIC_FUN_STATUS_CTL,
> +					&dmic_func_status);
> +	if (ret < 0) {
> +		dev_dbg(dev,
> +			"sn624x: io_init: DMIC FUN STATUS read failed (%d)\n",
> +			ret);
> +		goto io_init_end;
> +	}

These errors...

> +io_init_end:
> +	pm_runtime_set_active(dev);
> +
> +	sn624x->hw_init = true;
> +	sn624x->first_hw_init = true;
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	SN624X_DBG(dev, "io_init: complete (hw_init set), jack %s\n",
> +		   sn624x->hs_jack ? "registered" : "not registered yet");
> +	return 0;
> +}

...all end up reporting success after skipping some init?  That doesn't
seem right.

> +static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config;
> +	struct sdw_port_config port_config;

Are all the fields in these initialized?

> +	if (dai->id == SN624X_DAI_JACK) {
> +		regmap_write(sn624x->regmap, SN624X_REG_JACK_OUT_RATE_SEL,
> +			     sampling_rate);
> +		regmap_write(sn624x->regmap, SN624X_REG_JACK_CAP_RATE_SEL,
> +			     sampling_rate);

That seems to require symmetric rates?

> +regmap_sync:
> +	slave->unattach_request = 0;
> +	regcache_cache_only(sn624x->regmap, false);
> +	regcache_sync(sn624x->regmap);
> +
> +	return 0;
> +}

I'm not seeing anything that marks the cache as dirty in the event of a
power loss or reset (eg, over suspend).

--31FW+osFI9wQVZN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp92B8ACgkQJNaLcl1U
h9Ct4wf9FonXGxQXjHDiyQqxPgdRgUqEnZTolRbmo1YABMKsp5247pAQ0AB0znJs
48XkG2CxPXyvob4RCo8sHELOMAwWopMB8OOaVjFsTCTc6aLV5dME5cGWnC5Fy2u6
xjvXFbnykqlT0qTjr5kpmSAVb+3pGI4Wpnd5EU/PD4GqZEewqbYJmkI1q2bz7K9F
OsawX+1WH1C9SCnELBNNKoXYNQamPVMJBAm4SNDfAG6cV3lqaG+QO35aYEkj2MQg
699J7VCmldmXEUJ5hi0OPknyr6ev2WDIvA1JkOCX0f8nzlSIMMsCQITU80r1Vg2c
s7Dgfx+J4b9LCCGE/VY5+RUOw7Gtdg==
=5+dU
-----END PGP SIGNATURE-----

--31FW+osFI9wQVZN9--
