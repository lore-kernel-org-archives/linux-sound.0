Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09427E1DC;
	Tue, 28 Apr 2026 00:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777337563; cv=none; b=HclYqiy71o5Vy+0XveFt4x8AwNnQSgXBuRs3uh6tnQpfYzb6/5ck0aVNumoGLV6SFLupBITrrkRLEmXjLuT1UzCTbDEeaJYDR9XK/EIxZVe48t13U4ROhj7WcFuEq40frS1uS+TbnmSy+ya/AQADpbGQ02WFamo0Q9Aoqg5ZzvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777337563; c=relaxed/simple;
	bh=INAf2+d9NePEX2JaAeX+w57D5WMqdcJj8Xpl+jfQhwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqONc7945xxAzBcgpwwh9UrN4aNR5/FUlDYVqWTg8hPV1WsDKocuZlXcZMsonFiu4YfJG+oV+vrCxoSaW3rf5zeaEAbYirn0QnHqNN5JodSZa2aCjUSKGXBpRbh6WfECYV666IqyrUuv8Ey+PITjXJKCK6n4twznmFP6lMllKDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fl4Jxe/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fl4Jxe/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEF0C19425;
	Tue, 28 Apr 2026 00:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777337563;
	bh=INAf2+d9NePEX2JaAeX+w57D5WMqdcJj8Xpl+jfQhwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fl4Jxe/tc02YAjA2cJcOfQ73t6BNvPh8r9dmhLRocriC/PAMwkPy8jsh4edoDUdLc
	 p0kruuYMHW/H9DeKKRGiYxbnTEAmyxLSEHrV2IniIjd1+1R5SWU4wp88s7yb1UVuZ3
	 XaoZ/2CG5orsIRy7+06fOVASK6506krxLDfxmg6ZtV6GJM6rV/UfQaVPa9KMvK/tSJ
	 1G4BiBWrd0/YJdibXro63c+Wg6FCBuzVI1DU3IRrNBfrEEHW5IC7DvNBjFAaQOiwMm
	 zjdZ/WkgXeO/JK/lB68635jB9RcHGo23nNkaE9ATEIW4fYOAEd991Qk/o3qiIapiyk
	 SwOf6Y0a9p/QQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6D7FC1AC583F; Tue, 28 Apr 2026 01:52:40 +0100 (BST)
Date: Tue, 28 Apr 2026 09:52:40 +0900
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v11 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <afAE2GAgMahJaxkq@sirena.co.uk>
References: <20260427082401.2118-1-niranjan.hy@ti.com>
 <20260427082401.2118-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iqcATWuFFE84eLVs"
Content-Disposition: inline
In-Reply-To: <20260427082401.2118-2-niranjan.hy@ti.com>
X-Cookie: Victory uber allies!


--iqcATWuFFE84eLVs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 01:53:59PM +0530, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.

> +	switch (dai->id) {
> +	case TAC5XX2_DMIC:
> +		pde_entity = TAC_SDCA_ENT_PDE11;
> +		function_id = TAC_FUNCTION_ID_SM;
> +		break;
> +	case TAC5XX2_UAJ:
> +		function_id = TAC_FUNCTION_ID_UAJ;
> +		pde_entity = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
> +				TAC_SDCA_ENT_PDE47 : TAC_SDCA_ENT_PDE34;
> +		break;
> +	default:
> +		function_id = TAC_FUNCTION_ID_SA;
> +		pde_entity = TAC_SDCA_ENT_PDE23;
> +		break;
> +	}

Shouldn't the default case be to print a warning or something and have
an explicit case for what's there now?  It seems weird that we just
silently handle one ID by mapping any old number that gets passed in to
it.

> +static int tac5xx2_set_jack(struct snd_soc_component *component,
> +			    struct snd_soc_jack *hs_jack, void *data)
> +{

> +	tac_dev->hs_jack = hs_jack;
> +	if (!tac_dev->hw_init) {
> +		dev_err(tac_dev->dev, "jack init failed, hw not initialized");
> +		return 0;
> +	}

I'm not seeing anything that does the jack setup when the hw_init
happens?

> +static int tac_update_status(struct sdw_slave *slave,
> +			     enum sdw_slave_status status)
> +{

> +	if (!tac_dev->first_hw_init) {
> +		pm_runtime_set_autosuspend_delay(tac_dev->dev, 3000);
> +		pm_runtime_use_autosuspend(tac_dev->dev);
> +		pm_runtime_mark_last_busy(tac_dev->dev);
> +		pm_runtime_set_active(tac_dev->dev);
> +		pm_runtime_enable(tac_dev->dev);
> +		tac_dev->first_hw_init = true;
> +		first = true;
> +	}

Does anything ever actually undo this pm_runtime_enable()?

--iqcATWuFFE84eLVs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwBNcACgkQJNaLcl1U
h9A3zwf/cl0ZPuLeyYhkgrCcnhrgoHHJO4OiZyEbBDVIseQLfieOfv6Dq+b+Go62
z4N30yvA+cF/qM0pO3vws3aNfHlHauXANXdLss/K+/VJY6lRsT+A2CmE71+O6gfG
rCCEqUAdsypb3g9EzeZUQCCTIu/l1eQOgS6FoDPeEUjHmK4lmKdjHnlcEX7Zx+tj
OFYs3NGAwJprNr+EBX5p63oYTUTfByQlHgCUn7Yle3TNpWdx5A0KsZxQct1XWLuX
wN+AQ3NZCNuYnN/fsAQaeNHIeA+OfbFVd4n5nqyhjpFm4EjHnNYfFOZZIgSAP3V8
dA7CnpiAJZ0pvQwqEdjBDf97tynWSQ==
=Dnp4
-----END PGP SIGNATURE-----

--iqcATWuFFE84eLVs--
