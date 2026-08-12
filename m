Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4BA4B04B7
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 18:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559840; cv=none; b=URNeyATE9r0sq0v6hFPEEXr+gl7SUpVMwLP6jprD5r5NefCoNaogBzF3DYe5EEL4WMLVn21ZxIAZ8N6nZ1wi77e8B83BHX727y/GVei24cE9RWVPm+f+uiLJXxRQqFtFiUc2jPDDaBgSUknsg1NnB7xyXMqMr1cU7xou3k99LbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559840; c=relaxed/simple;
	bh=NvIK1vI4CVXUr7HNAmgd5S7wqXa02G4/Y8EUyb0BT9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGZjUH8AJk5tMke9lLLR6fK4G3sOxcjhLS9zEFvbt0HU3lbeu1U6vXq+OcBpRslo2RLPCMYXYK5gi/m26ETuFOOIxRXHlkj8VCbADqIqcn1Fe1m3+i+F+KZF5d5xsYQgEQ23mvTAiqpTcs/71QiAyTDPZ9Z5Kxl3ik7gsXQQw/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeIs8r/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeIs8r/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597B31F000E9;
	Wed, 12 Aug 2026 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786559839;
	bh=POFoboQbQWhtlajDyN2kTchmLbpNE7e2LqceOhyEGuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MeIs8r/A4SM+FsnBHpte8mlxRH6b5UUBg2LoULVK3Nqz5tiEmDbUfNl8S8CrHPF8Z
	 KFBGmtQuw1gYfI9/hMJZyHVPFHAhq0OdtQmwBzBqS5b1oAhSi+Fe4eFiqRkuA/IQNg
	 MZp10q5FYK/CG0CFh23u6kd7RD5XEY9VLbPSTXK6/am71LK/8b8UJDNHHbfNHu2/pg
	 IqzgO/YagVA11mwdCF4yjIPOY9/U7kdswIU11SeW7BvEzwvW01Pji7xFb4L1TvfHSc
	 f0FDWbByq6RJulrEgekgR26KAsLIvzMO1NUWqnbxGT2jY+DtaRmBUSeifhmJtnqv9Z
	 79/vgTMwTZBGA==
Date: Wed, 12 Aug 2026 19:37:14 +0100
From: Mark Brown <broonie@kernel.org>
To: qianghua wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com, liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com, kai.vehmanen@linux.intel.com,
	cezary.rojewski@intel.com, bo.liu@senarytech.com
Subject: Re: [PATCH 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Message-ID: <2d46a294-b7e9-4be4-bbec-a44b056d9776@sirena.org.uk>
References: <cover.1786511177.git.qianghua.wang@senarytech.com>
 <98f27d5c85ab435aba519ce5d86fdafe793a1968.1786511177.git.qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jSrYnW9No26rs7zK"
Content-Disposition: inline
In-Reply-To: <98f27d5c85ab435aba519ce5d86fdafe793a1968.1786511177.git.qianghua.wang@senarytech.com>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--jSrYnW9No26rs7zK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 02:59:42PM +0800, qianghua wang wrote:

> Add SoundWire SDCA driver for Senary SN624x multi-function codecs
> (jack, speaker amp, and DMIC). Extend the Senary MAINTAINERS entry
> for the new codec files only; Intel ACPI match tables remain under
> INTEL ASoC DRIVERS.

This changelog describes the series, not this patch which only adds the
CODEC driver.

> @@ -238,6 +238,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_RT715_SDCA_SDW
>  	imply SND_SOC_RT721_SDCA_SDW
>  	imply SND_SOC_RT722_SDCA_SDW
> +	imply SND_SOC_SN624X_SDCA_SDW
>  	imply SND_SOC_RT1308_SDW
>  	imply SND_SOC_RT1316_SDW
>  	imply SND_SOC_RT1318

Please keep this, the Makefile and the Kconfig lexically sorted.

> +config SND_SOC_SN624X_SDCA_SDW
> +       tristate "Senary SN624x SDCA Codec - SDW"
> +       depends on SOUNDWIRE
> +       select REGMAP_SOUNDWIRE
> +       select REGMAP_SOUNDWIRE_MBQ
> +       help

This also depends on SDCA.

> +/*
> + * Trace helper: load with trace=1 or:
> + *   echo 1 > /sys/module/snd_soc_sn624x_sdca/parameters/trace
> + * For finer logs without trace=1, enable dynamic_debug on this file.
> + */
> +static bool sn624x_trace;
> +module_param_named(trace, sn624x_trace, bool, 0644);
> +MODULE_PARM_DESC(trace,
> +                "extra dev_dbg for probe, jack, SDW status (default off)");

You probably want to look at tracepoints and trace_printk() here, these
are much more flexible features and can be easily tweaked at runtime.
In general it's probably better to skip all these module parameters for
upstream, they all look like debugging stuff which should hopefully not
be needed.

> +static void sn624x_log_power_mode_once(struct device *dev,
> +				       struct sn624x_sdca_priv *sn624x)
> +{
> +	unsigned int pm;
> +	int ret;
> +
> +	if (!sn624x || !sn624x->regmap)
> +		return;
> +	if (atomic_xchg(&sn624x_power_mode_logged, 1) != 0)
> +		return;

There doesn't seem to be any way to set this?  Also consider
printk_once().

> +static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{

> +	stream_config.frame_rate = params_rate(params);
> +	stream_config.ch_count = ch;

Do we need to configure SDCA clocking as well?

> +static int sn624x_sdca_dev_system_suspend(struct device *dev)
> +{
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
> +
> +	if (!sn624x->first_hw_init)
> +		return 0;
> +
> +	cancel_delayed_work_sync(&sn624x->jack_detect_work);
> +
> +	mutex_lock(&sn624x->disable_irq_lock);
> +	sn624x->disable_irq = true;
> +	sn624x_sdca_jack_irq_mask(sn624x);
> +	mutex_unlock(&sn624x->disable_irq_lock);
> +
> +	return sn624x_sdca_dev_suspend(dev);
> +}

I'd expect the work to be cancelled after disabling the interrupt,
otherwise the interrupt could schedule more work between the
cancellation and the disable.

--jSrYnW9No26rs7zK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8vVoACgkQJNaLcl1U
h9CGXgf/b0VEBXdPhiR41eu0qasJ2z22SNQGfGnYvBV1t1RaPberVCBXgTIIsJ2p
M7FFTmnGUEDZYFxbQCD1P7hBC0dLfHA8zS42VJpYifkK4VrYVWDvJ1TyFC9PeVO5
weQMUVTLkDy+Vu/g7MmvujIH/U/urBY1ZqfGj6+Urymd3BdGw6yCKi/NigpGkHLM
WRKsT7CfaISMImP39PMHryKVSuMWYc0aoMFdUVGQeBcCv7a+buXcfm09twdl/IUD
KBNVOG/c7Rfas6k5XPpb+0b0QQylk/CoQ4aCLqToELJ6eRDNozJpZrcp+QUX2piO
cDK++5NoCOTx9q9uqPsmiNn5VWE1rQ==
=/tgb
-----END PGP SIGNATURE-----

--jSrYnW9No26rs7zK--
