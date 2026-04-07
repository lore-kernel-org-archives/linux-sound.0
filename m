Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE61316902
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575837; cv=none; b=bHZL9uujvXu//5LIdxbYjDIv6ISCop3DJ8EfW28ORhqFMn42iFoztkW/9aruk37Nrt/OIiFCk07MI0ovKuAs6E2UvRKDm/SWAZnr04fsLTUXoTJlEDbcDnbieXMZNSmcY2Qcu+njdLmQ4MDJdHyEuuYSv+DgQvhMSylnB4j9W4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575837; c=relaxed/simple;
	bh=+t+gmnmuuB0KdLtJsgXZ9Ykoy6XYk3XWx17tsXMtNhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gg7N192MOlGF1ql+EdX8LEzpl6+KmTow3230PVadvYL0kUfSq9O8ciAOP0ru3yesN93GVwg8xZtYPY+lab8HtardBEt77L1DndWwAi6UZKEFR0jqfBxj2pfOqYVeg1O507hUoKle1kL7woJiTqXxsHz1ZomfcLUE4tmXmLQiToI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaFVxgYb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaFVxgYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815E7C116C6;
	Tue,  7 Apr 2026 15:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775575836;
	bh=+t+gmnmuuB0KdLtJsgXZ9Ykoy6XYk3XWx17tsXMtNhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eaFVxgYb+DlGzEsRZAPeK3NhOgR+frCxFL0dYjrnSqfBIqeyuz+dU3/cuXbyAGjyt
	 eu1mExujDO36PBZDf/2irLRFGm80JXaqtakv1zs7wDH6SuE3dQuI7/lymeiWgc/vJQ
	 veW7I6dud/AiuNmIVdlD2yPzC9RulPfGwLDu1aMJCotkounZpqFpNOmlrjBr1whvpD
	 OZMm3IpHZ6qUWUqTvUjaKGL2YQEzBqTGpH1rs0+pmc+dyBJtGGH0zxLfvAxc2cQzdG
	 N/oa20FChauvBxQ8kwqyxQITzYIanWRp9motx30vWPRR0lO6Q+5yOopRGKEL+S8Mbs
	 ePWIZca7e35Ag==
Date: Tue, 7 Apr 2026 16:30:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v5 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <7371761f-7262-49da-b4d9-94ea7f38696c@sirena.org.uk>
References: <20260407100105.123041-1-zhangyi@everest-semi.com>
 <20260407100105.123041-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tSvU6CP4kuORYREr"
Content-Disposition: inline
In-Reply-To: <20260407100105.123041-4-zhangyi@everest-semi.com>
X-Cookie: Now, let's SEND OUT for QUICHE!!


--tSvU6CP4kuORYREr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2026 at 06:01:03PM +0800, Zhang Yi wrote:

> +static int es9356_sdca_button(unsigned int *buffer)
> +{
> +	static int cur_button;
> +
> +	switch (*buffer) {

> +	default:
> +		break;
> +	}
> +
> +	return cur_button;

It's weird that this is a static and that we just silently carry on with
the last report if we failed to decode the report, I'd expect something
more like not reporting.

> +static int es9356_sdca_headset_detect(struct es9356_sdw_priv *es9356)
> +{
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0), &reg);
> +
> +	if (ret < 0)
> +		goto io_error;
> +
> +	switch (reg) {
> +	case 0x00:
> +		es9356->jack_type = 0;
> +		break;
> +	case 0x03:
> +		es9356->jack_type = SND_JACK_HEADPHONE;
> +		break;
> +	case 0x04:
> +		es9356->jack_type = SND_JACK_HEADSET;
> +		break;
> +	}

This has the same thing where we silently ignore unknown values from the
hardware.

> +static int es9356_sdca_dev_suspend(struct device *dev)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +
> +	cancel_delayed_work_sync(&es9356->jack_detect_work);
> +	cancel_delayed_work_sync(&es9356->button_detect_work);
> +
> +	return 0;
> +}

> +static int es9356_sdca_dev_system_suspend(struct device *dev)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +
> +	regmap_write(es9356->regmap, SDW_SCP_SYSTEMCTRL, SDW_SCP_SYSTEMCTRL_WAKE_UP_EN | SDW_SCP_SYSTEMCTRL_CLK_STP_PREP);
> +
> +	return es9356_sdca_dev_suspend(dev);
> +}

I'm not seeing anything that stops interrupts being delivered after or
in parallel with this running so the delayed work could get rescheduled
after the cancellation.

> +static int es9356_sdca_dev_resume(struct device *dev)
> +{

> +regmap_sync:
> +	slave->unattach_request = 0;
> +	regcache_cache_only(es9356->regmap, false);
> +	es9356_regcache_sync_volume(dev, es9356->regmap);
> +	return 0;
> +}

Don't we need to sync anything else?

--tSvU6CP4kuORYREr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnVIxYACgkQJNaLcl1U
h9Ck5wf+L4ckYzHu/EN9QlMuGpAu7MPYeaRWnzYWYyR2ytpgTD4Oi5p5sdnhMXr2
/i1TMbJkxfg1rVNteJtvEs0rh5sFY2WkFs/Yu1PvFG1ZeD/2mpdsc0IEY/Q1t8Tw
+OGjqNYbEbsDysEzJwUGnndXcNpJle8fZsaU3lccTTbyym6Q/7UbBwPp6jlUUlRt
TfNdMCT56/mhTeKAJR+NHQl6glU5Ve7NSkyU3xkHs38yYes1+I5LCobKOLbGTUsQ
jWineSeAFfu0Mg60JHgv68/xvnMP7F5PoGomra39e6TfELwboJlu//vpp+JgxR/n
gVW+gajXAR/t19jSIPNGjRaJTpatNA==
=dE4P
-----END PGP SIGNATURE-----

--tSvU6CP4kuORYREr--
