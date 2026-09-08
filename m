Received: from mta1.migadu.com (out-132.mta1.migadu.com [95.215.58.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377834CA77E
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858727; cv=none; b=Xa4d/yYvd/vy2AgR7FI43UCj91LmPt1atdA7NOM5TUQXBHSeQRe+czTMn9xZStcMLzpv3vYFO2+giWE1QWNiZrOWbtSi6TX6dqCRGOH8ze+L/glgWdHgcgAuoQUbYK7i+9rsR9zav+9bltLBppYuGv3SKfqG+2iGoR26eXx4kDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858727; c=relaxed/simple;
	bh=BtgLhY8Gg+G0Ww36E3CW/0PZbBudzuQoD6MENa3r00A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Of8rBO42mMfVnDFboNHxDczlfeVDo+1D5j/UoiS5xd3Lu3DnCTQAzBdctier5SJ8HAB/rN1cIl+255thOsUkocNgazDBiYlf10B1yf+RpgeKn+13yBkOMPvzu46R4Ue+mXkMNL+dpV1d/e4zep8dkSPITkpJJQS6g7SfRW+5JVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=aTNkd7SU; arc=none smtp.client-ip=95.215.58.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="aTNkd7SU"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BtgLhY8Gg+G0Ww36E3CW/0PZbBudzuQoD6MENa3r00A=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788858723; v=1; x=1789463523;
 b=aTNkd7SUDb/sd/uq27oHvqQgqHAGmFZstKlQiB6e0G57vjemRzckXR5c8BoBeYaH+0HwFNe8
 pHr7VpNlXIarPXvPG5F0N/uYmyvQCZWaHKe1aF4LNA5kVKfIt6qRAseMd1inQ6ZW0u8Bbtky4GJ
 VrWMnqDH5tHAh3aWQIRrW0kvIXMj154j+B0DaebWBcE5D6JhnmZkF7y0chrXf6VBejPDAg0yfd+
 XV0V/acTJj6SNIFvKcAdDsn8hqvmLKGzpY5Js+I/rf/W7JoSjg2K7/cad6WRXI4UEkQtqwk8JtN
 KXiLDkcAzfYjknXOYDoBwf8N8w9FcQzylu63UFqKuqTiw==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 34eb8cfa9cff89a1;
	Tue, 08 Sep 2026 09:11:53 +0000
X-Mizu-Trace-ID: 34eb8cfa9cff89a1
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 11:11:50 +0200
Message-Id: <DL9THMPHYI9G.4JZF02QB3950@cknow-tech.com>
Subject: Re: [PATCH] ASoC: codecs: ES8389: Prevent enable_count underflow in
 clk_core_disable
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <linux-sound@vger.kernel.org>, <broonie@kernel.org>
Cc: <tiwai@suse.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260904104141.3885-1-zhangyi@everest-semi.com>
In-Reply-To: <20260904104141.3885-1-zhangyi@everest-semi.com>

On Fri Sep 4, 2026 at 12:41 PM CEST, Zhang Yi wrote:
> To prevent enable_count underflow in clk_core_disable,
> I replaced the direct call to `es8389_set_bias_level(component, SND_SOC_B=
IAS_STANDBY);`
> in the code with a helper function.

Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Closes: https://lore.kernel.org/linux-sound/DJIUWLPIHZ48.5H5T2EI2YI8D@cknow=
-tech.com/
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 Plus

Thanks!

> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  sound/soc/codecs/es8389.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
> index 80efce3e0..2ea0c4052 100644
> --- a/sound/soc/codecs/es8389.c
> +++ b/sound/soc/codecs/es8389.c
> @@ -812,6 +812,23 @@ static int es8389_pcm_hw_free(struct snd_pcm_substre=
am *substream,
>  	return 0;
>  }
> =20
> +static void es8389_standby(struct snd_soc_component *component)
> +{
> +	struct es8389_private *es8389 =3D snd_soc_component_get_drvdata(compone=
nt);
> +
> +	regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x04);
> +	regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x04);
> +	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xD4);
> +	usleep_range(70000, 72000);
> +	regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x59);
> +	regmap_write(es8389->regmap, ES8389_ADC_EN, 0x00);
> +	regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0x00);
> +	regmap_write(es8389->regmap, ES8389_RESET, 0x3E);
> +	regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x80);
> +	usleep_range(8000, 8500);
> +	regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x00);
> +}
> +
>  static int es8389_set_bias_level(struct snd_soc_component *component,
>  			enum snd_soc_bias_level level)
>  {
> @@ -834,18 +851,7 @@ static int es8389_set_bias_level(struct snd_soc_comp=
onent *component,
>  	case SND_SOC_BIAS_PREPARE:
>  		break;
>  	case SND_SOC_BIAS_STANDBY:
> -		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF1, 0x0f, 0x04);
> -		regmap_update_bits(es8389->regmap, ES8389_ADC_HPF2, 0x0f, 0x04);
> -		regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xD4);
> -		usleep_range(70000, 72000);
> -		regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x59);
> -		regmap_write(es8389->regmap, ES8389_ADC_EN, 0x00);
> -		regmap_write(es8389->regmap, ES8389_CLK_OFF1, 0x00);
> -		regmap_write(es8389->regmap, ES8389_RESET, 0x3E);
> -		regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x80);
> -		usleep_range(8000, 8500);
> -		regmap_update_bits(es8389->regmap, ES8389_DAC_INV, 0x80, 0x00);
> -
> +		es8389_standby(component);
>  		clk_disable_unprepare(es8389->mclk);
>  		break;
>  	case SND_SOC_BIAS_OFF:
> @@ -1015,7 +1021,7 @@ static int es8389_suspend(struct snd_soc_component =
*component)
>  {
>  	struct es8389_private *es8389 =3D snd_soc_component_get_drvdata(compone=
nt);
> =20
> -	es8389_set_bias_level(component, SND_SOC_BIAS_STANDBY);
> +	es8389_standby(component);
>  	regcache_cache_only(es8389->regmap, true);
>  	regcache_mark_dirty(es8389->regmap);
> =20
> @@ -1084,7 +1090,7 @@ static int es8389_probe(struct snd_soc_component *c=
omponent)
> =20
>  	es8389->hpf_freq =3D ES8389_HPF_DEFAULT;
>  	es8389_init(component);
> -	es8389_set_bias_level(component, SND_SOC_BIAS_STANDBY);
> +	es8389_standby(component);
> =20
>  	return 0;
>  }


