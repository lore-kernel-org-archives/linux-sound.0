Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E54908B3
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727727; cv=none; b=hfLpogXKCAQ6qdnHgZcMC/+xNUTxqhRM52nXytPV+3nLE7sEjfEIwPtW/QH4a5otW/oBOW8S+RZBTNFSPn4kzlFUtBEfiKNhG1+0SB4AfcbynEAYU23YF+v4ouP53lB8NFrr0Lw74s3NNiEZJ663U7YCgao3G1uJbLs1Rn9Cs10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727727; c=relaxed/simple;
	bh=IWixYzehzPBCeyJBtSVmUN2Hy/+L8JxUsTM9k70Erwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQpSprr0MQbg7pvkrim+SFM4ku7LYPgsXDEnMgkJXRrmjVks/cy08iW9KAj6ojXWQ7acIy0Bw7k/1KjDFnD4EUKtLFhkFjVu3oD9bAijtDhkv5FtEJIyINCPXZsKZ/ZK+PQNNRjXmoXKLJiV1OjlJiIbII9uI7hDRSeIvB0SHVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnKM6a7E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnKM6a7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39731F000E9;
	Fri, 14 Aug 2026 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786727725;
	bh=kUPRbnKCmcdGMTtyeLumrKkCdz6vh5NM/5XfvDrPuGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnKM6a7EP3DumYujAvI4FvttSqHwZLrHeQDenZOaikuYrRqHImi8dOVMYtHmEmTZ9
	 RtXVei011DcwVeEI5j95Zl+nZnwJyle1TWe2mk9xpOGol9AfwX7Fvuwl5+sBARjvCn
	 7m4ufbZWbRwlDIZDdz/5gqqXbdO2V5VVMaxsGjV/PEEt65YMtUs/+6wnxOyM2vGg86
	 muX1CUO+cR8wspHb9dekFLgi2lz5/A4Wxz6KTyX0qJ+KCf2Y6XPOi4eAiLZDxNghra
	 TUKOebzIge65Bf9x964dnpFykjhS82F33Lex4KSFJ+Wx3TrFrsl0MWwFiXgMHMsZEE
	 A57RySXrsCx7g==
Date: Fri, 14 Aug 2026 18:15:21 +0100
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
Subject: Re: [PATCH v3 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Message-ID: <4b1dedc3-91b4-4905-a402-d67e41bddfd5@sirena.org.uk>
References: <20260814025653.5484-1-qianghua.wang@senarytech.com>
 <20260814025653.5484-2-qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mfHIbkthboM1N328"
Content-Disposition: inline
In-Reply-To: <20260814025653.5484-2-qianghua.wang@senarytech.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--mfHIbkthboM1N328
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2026 at 10:56:48AM +0800, Qianghua Wang wrote:
> Add a SoundWire SDCA driver for Senary SN624x multi-function codecs
> (jack, speaker amp, and DMIC). Program SDCA SampleFreqIndex in
> hw_params, keep SDCA jack IRQs masked with poll-based detection, and
> extend the Senary MAINTAINERS entry for the new codec files only.

This looks mostly fine but you have some issues around when runtime PM
is enabled.

> +	ret = devm_snd_soc_register_component(dev,
> +					      &soc_sdca_dev_sn624x, sn624x_sdca_dai,
> +					      ARRAY_SIZE(sn624x_sdca_dai));
> +	if (ret < 0)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_enable(dev);

The component is registered before we enable runtime PM, this means that
things like jack detection that try to use runtime PM could get run
before it gets enabled which will result in bugs with mismatched counts
or missing references.

> +static void sn624x_sdca_sdw_remove(struct sdw_slave *slave)
> +{
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(&slave->dev);
> +
> +	SN624X_DBG(&slave->dev, "SoundWire driver remove\n");
> +	cancel_delayed_work_sync(&sn624x->jack_detect_work);
> +	sn624x_jack_rpm_put(sn624x);
> +	if (sn624x->first_hw_init)
> +		pm_runtime_disable(&slave->dev);
> +	mutex_destroy(&sn624x->disable_irq_lock);
> +}

The runtime PM enable is unconditional in the probe.

Since fixing these would be relatively small changes code wise I'll push
this into CI, assuming it goes OK there I'll apply so the driver makes
the merge window - please send incremental fixes for this and anything
else that gets noticed.

--mfHIbkthboM1N328
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/TSgACgkQJNaLcl1U
h9D/fgf+JvcFq3Yv0DNKW90Gf+ob0drv5OEs91KNgaJnwVxLEPkKg0rzQl9kD5KJ
rwomcq3KFoWlf+8+lO46361x1xwh5k4ErY+SBHQJYZUX49fcsT8+6aiNXs8mSjPz
hRvuUVxVmAEbBhL9cn/F7tC6zYbbP7BbD3ZP5KIzkIhhzrrplgSUOovrQ3qJIrvn
CfiOTuzN7YIf3QvRPEaGl5weMNIHy87YbgA1tuxYT4HQAnOcivCEZc7MparF4YW0
gsighsa1U+n7/deRlq+2O29RFbKjmo1gYJLnuLTZ1dU09QQwJpOnk8XB6yEs6oW2
Lr5EYFSMhf2cgH7031s+QNyxMq4E+w==
=Pndl
-----END PGP SIGNATURE-----

--mfHIbkthboM1N328--
