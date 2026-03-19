Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4922832470F
	for <linux-sound@vger.kernel.org>; Thu, 19 Mar 2026 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931789; cv=none; b=VsualXBcM4YcADPdmNDuteV9WZtNQlYm5nHyrgTZ4lt8ZOWOl/2n6lmRCPQVix1h+A3iGUCyYLwLlbdJ54C+s42vuL9dJgzP7AM8uVvWjHIUxdepFStf0F+rbrjwRb9srms+wM5swgtPfumbH5ln46ZexP7Y7PGxpu2oB4FHdpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931789; c=relaxed/simple;
	bh=KMA5og7tsS6CEy9onUH6h8bRG7L1m+1wrhG1Pg1vbZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPKOYfe1Rf8I/ORGJ62U7OtLW1irbxuwzTkpehWB8FA6f3VV1ENeqQIGcOMPrLU5Kwm+4rDZp9Ak2Wjx5eDg+mxtcIziyL4IDOsZnhyyksXzNRPkt+ecP8o+Xkg20rnQJ6f/8V1IlQCnRbySe+ybUVYx/551rQNiOhprDXjxCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eELRL7t9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eELRL7t9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77320C19424;
	Thu, 19 Mar 2026 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773931789;
	bh=KMA5og7tsS6CEy9onUH6h8bRG7L1m+1wrhG1Pg1vbZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eELRL7t9GwQxAxDslgiPo+9+Sv3JXpd3TWnNuQ+mlSgVrUU6yHTEbK+2V0jExlTfn
	 gSJ75jYkCStLZRvIoaNCAXU+WcJKYffLCfM0syHRRYenTPysXyvOKG0+Qc1/o5eetb
	 2Odopohh0KP86OTEKfB8w+gsaM3NKzOYBPGvDBjPTxGge412tZJjbnw3V8Ve7BQ5Ai
	 Foallhur7bcaT/wSsyUG8P6a3O2Y4W4JoeAKj/kVIn50wNmqxRvqYPwbXJ7xhwKEhA
	 4upRYc85DVk2GPFWEempWccT6LhB3jsytrE7jo2/eiEstNP7WOiOdB01oMCQf79iB5
	 jjb7jgTdKZFNw==
Date: Thu, 19 Mar 2026 14:49:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: Re: [PATCH v3 4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <28cb311a-3a99-45bf-bad4-093a33d9ee3c@sirena.org.uk>
References: <20260319053959.9151-1-zhangyi@everest-semi.com>
 <20260319053959.9151-5-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wcm3OSaCxei3tNfL"
Content-Disposition: inline
In-Reply-To: <20260319053959.9151-5-zhangyi@everest-semi.com>
X-Cookie: Given my druthers, I'd druther not.


--Wcm3OSaCxei3tNfL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 01:39:57PM +0800, Zhang Yi wrote:

> +config SND_SOC_ES9356
> +        tristate "Everest Semi ES9356 CODEC SDW"
> +        depends on SOUNDWIRE
> +        select REGMAP_SOUNDWIRE
> +

Shouldn't this be REGMAP_SOUNDWIRE_MBQ?

> +	SOC_SINGLE_EXT_TLV("FU33 Capture Gain Volume",
> +		SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_FU33,
> +			ES9356_SDCA_CTL_FU_CH_GAIN, 0), 0, 0x0a, 0,
> +		es9356_sdca_set_gain_get, es9356_sdca_set_gain_put, amic_gain_tlv),

Drop the "Gain", it's redundant.

> +static const char *const es9356_left_mux_txt[] = {
> +	"From Left",
> +	"From Right",
> +};
> +
> +static const char *const es9356_right_mux_txt[] = {
> +	"From Right",
> +	"From Left",
> +};

Usually these would just say "Left" and "Right", the "From" is kind of
redundant.

> +static void es9356_register_init(struct es9356_sdw_priv *es9356)
> +{
> +	regmap_write(es9356->regmap, ES9356_STATE, 0x02);
> +	regmap_write(es9356->regmap, ES9356_ENDPOINT_MODE, 0x24);
> +	regmap_write(es9356->regmap, ES9356_PRE_DIV_CTL, 0x00);

> +static int es9356_sdca_dev_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +	unsigned long time;

> +regmap_sync:
> +	slave->unattach_request = 0;
> +	regcache_cache_only(es9356->regmap, false);
> +	es9356_regcache_sync_volume(dev, es9356->regmap);
> +	return 0;
> +}

There's a bunch of other non-volume registers which get written to (eg,
the big list in _register_init()) or have userspace controls - how are
those restored?

--Wcm3OSaCxei3tNfL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm8DQcACgkQJNaLcl1U
h9BTdAf+M4BDWWomWgqk8VZ45MJTW7TJJ+jJJ2Ae/kHFsCmtFSonP4wiR9UtaWfu
HENVvPVwVuaqiquxIQejdgJD8+YPdUxc3Veumxxjdcck0dL0SGaLgBvftCzj6/Hj
UnSi0DFZToskRE8J9hTQDerQmkoYXegFjyUYdiZZ5NzQqAgV0Srq3JN10IAjFIBD
4drSrRNIr0+J3WawjaG8SnPwHMFA4zfdd+T8anIZm0/y3oPPxyDHtmlaOcrv3bxh
f5gDDRV2D707Hqo8ZK8VtBWdtqkUBhskfhrMsC+KcxESKge8KN1wghyt8m0ovUYo
kX+88duCroc6bfjmvjR6rSeT/tOzvA==
=HZVb
-----END PGP SIGNATURE-----

--Wcm3OSaCxei3tNfL--
