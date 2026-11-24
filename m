Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542860;
	b=3ucGoPO24hXh40uidZmOP88ohOQZTD3H8CUB4qZhV2ddhR8ljEP1XSPwwjOaWTh/JuDa
	 tkBwpT8iQvGe5a8Cl38ws2fzwFA+QJEy+r4hJrD7wQ5Qe/LnvZi1Cx+Fkx+uhUikQKOB+
	 AyWYLutfRbR+7RvYDTNgmGVkT8Lo5MZ3XPGIggbqXqM7OBS8Xq7Q9Q9MttWoGhX3wJTqy
	 5bGHua4m0dfkiyYMlUIS6CTUnXVgCpqlvVMs2XwGzpMSGDrnGVlPsksQReV/x5NFPZM7R
	 N2LxZ4zwqhP+waKzwE4j4PtDcJ80jhebIGFe/aLgU8ShhN0kW3WUBw3jxsP/TzRO9tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542860;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0pm3p5mEPLCoZfLFF7fAcuqY+wadphrVFEOwjav6RCM=;
	b=cfIG7mgVG/MrdT9u46aglqiyme8GOkr5BKVjxDvnqhqYOStvz51MDJsjBex0HnJs9iCE
	 lwuqYqJGf3HJly+mCEgG5rySRO6ZDQr9LCtRcct+sD4XtfMFsCkYWirny6VEh8Ggnt3PU
	 DIl/9+ycJtCFhs+nlzmI9SKnlAXueMGSDj8qvN14Ir/7KrkZ7s6mo67BU0PeS43e8nS/P
	 AGeHbuazVWUSTKfhP746eHAyjpVER56D7Y6ro1lPjm1BcbQOga/kPGZ9lqLfm7WqmZamF
	 qW677em9rdUuALbIJyxxlgzH6yb88S/SqgKKN88byAEOQ5QlYlhIedJYh5r2Bhaning==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhw7M9A3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F9606A31E;
	Tue, 24 Nov 2026 17:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mhw7M9A3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4741F000C6;
	Tue, 24 Nov 2026 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542860;
	bh=0pm3p5mEPLCoZfLFF7fAcuqY+wadphrVFEOwjav6RCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mhw7M9A3n9JTDWTVFn59r2zyeEq8+s0J7CUnsxpW5OYARdIc1S9hxIWcd8TlHi+5V
	 EsDZPsBIWNuJcd9sUgHUPMtjkwuBF3Bgy+N+ve0lMcSmH2osQYnTEmZnGo+lbgd9s7
	 4XxtS13pTiYjqitTS0DHdv4zXXQ42tntftnc7YTTatmpzMEoT6WRfzd7JLXUMQKpiF
	 rRyuclZao9tDNnZ6IFx56yJsd9iXZXyeC7ZVY/s0kcl6GSMxhuS/Z9EmfNOXwf2iMJ
	 sAz8KMAAwynBTsX4RDyT+dpjsRlPGBMm3M2ztqxAFALiZCJTrgqKLjJUMV4xiY4Jlj
	 U/dFc0NdPoEKg==
Message-ID: <sashiko-outbox-231757@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/19] ASoC: qcom: lpass: add support for optional
 WSA interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-topic-sm8650-el2-v2-9-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-9-174e159f0f69@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:54:19 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: qcom: lpass: missing wsa_lpaif_map handling in suspend
  and resume
It also noticed 2 related pre-existing issues this patch does not
introduce:
- [Critical] ASoC: qcom: out-of-bounds array writes in
  of_lpass_cpu_parse_dai_data() [1]
- [High] ASoC: qcom: lpass: unchecked memremap() and missing unmap on
  PCM free [2]
--

commit af2e24041ddb606a271caf973ca3eb7d9100c98e
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: lpass: add support for optional WSA interface

This commit adds regmap, DMA control, IRQ, and buffer management support for
the optional WSA LPAIF interface used by the speaker SoundWire bus.

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 3089107442231..db7a0752edb2f 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
[ ... ]
> @@ -984,6 +1076,16 @@ static struct regmap_config lpass_va_regmap_config =
=3D {
>  	.cache_type =3D REGCACHE_FLAT,
>  };
> =20
> +static struct regmap_config lpass_wsa_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.writeable_reg =3D lpass_wsa_regmap_writeable,
> +	.readable_reg =3D lpass_wsa_regmap_readable,
> +	.volatile_reg =3D lpass_wsa_regmap_volatile,
> +	.cache_type =3D REGCACHE_FLAT,
> +};

[Severity: Medium]
Should lpass_platform_pcmops_suspend() and lpass_platform_pcmops_resume()
also manage drvdata->wsa_lpaif_map when drvdata->wsa_enable is set?

lpass_wsa_regmap_config uses REGCACHE_FLAT and lpass_platform_wsa_hardware
advertises SNDRV_PCM_INFO_RESUME, but suspend and resume only handle
hdmiif_map and lpaif_map.  If the WSA LPAIF block loses register state acro=
ss
system suspend, resuming a stream via SNDRV_PCM_TRIGGER_RESUME skips
lpass_platform_pcmops_prepare() and never syncs the cached DMA base, buffer,
and period registers back to hardware, while later regmap_update_bits() and
regmap_fields_write() calls can skip hardware writes when the new value
matches the stale flat cache.  Note that later commits in this series
("ASoC: qcom: lpass: support mapping I2S ports to multiple LPAIFs" and
"ASoC: qcom: add SM8650 LPASS CPU driver") do sync the same lpass-wsa-lpaif
regmap across suspend and resume when it is used for MI2S.

> @@ -1046,6 +1148,8 @@ static void of_lpass_cpu_parse_dai_data(struct devi=
ce *dev,
>  			data->hdmi_port_enable =3D 1;
>  		} else if (is_cdc_dma_port(id)) {
>  			data->codec_dma_enable =3D 1;
> +			if (is_wsa_cdc_dma_port(id))
> +				data->wsa_enable =3D 1;
>  		} else {
>  			data->mi2s_playback_sd_mode[id] =3D
>  				of_lpass_cpu_parse_sd_lines(dev, node,

[Severity: Critical]
This problem wasn't introduced by this patch, but can
of_lpass_cpu_parse_dai_data() write out of bounds on
data->mi2s_playback_sd_mode[] and data->mi2s_capture_sd_mode[] [1]?

Both arrays are sized to LPASS_MAX_MI2S_PORTS (8), yet the initialization
loop at the top of of_lpass_cpu_parse_dai_data() indexes them by
data->variant->dai_driver[i].id without checking whether the DAI is an MI2S
port (CDC DMA DAI IDs start at 19), and the else branch above indexes them
with an unchecked id read from the Device Tree "reg" property, overwriting
adjacent fields in struct lpass_data.

> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platf=
orm.c
> index 9666049ae51b6..99a7ce9ed7695 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
[ ... ]
> @@ -1148,6 +1295,14 @@ static int lpass_platform_prealloc_cdc_dma_buffer(=
struct snd_soc_component *comp
>  		buf->bytes =3D lpass_platform_va_hardware.buffer_bytes_max;
>  		buf->addr =3D drvdata->va_cdc_dma_lpm_buf;
>  		break;
> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
> +		buf->bytes =3D lpass_platform_wsa_hardware.buffer_bytes_max;
> +		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_B=
UFF_SIZE * 2;
> +		break;
> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
> +		buf->bytes =3D lpass_platform_wsa_hardware.buffer_bytes_max;
> +		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_B=
UFF_SIZE * 3;
> +		break;
>  	default:
>  		break;
>  	}

[Severity: High]
This problem wasn't introduced by this patch, but
lpass_platform_prealloc_cdc_dma_buffer() does not check the memremap() retu=
rn
value on buf->area and leaves buf->dev.type set to SNDRV_DMA_TYPE_CONTINUOUS
with no .pcm_free callback to unmap it [2]:

sound/soc/qcom/lpass-platform.c:lpass_platform_prealloc_cdc_dma_buffer() {
	...
	buf->dev.type =3D SNDRV_DMA_TYPE_CONTINUOUS;
	...
	buf->area =3D (unsigned char * __force)memremap(buf->addr, buf->bytes, MEM=
REMAP_WC);

	return 0;
}

If memremap() returns NULL, a subsequent PCM transfer in
lpass_platform_copy() dereferences rt->dma_area.  When the sound card is
unbound, snd_pcm_lib_preallocate_free_for_all() -> do_free_pages() treats t=
he
non-NULL buf->area as SNDRV_DMA_TYPE_CONTINUOUS memory, warns in
decrease_allocated_size(), leaks the mapping, and passes the remapped addre=
ss
to free_pages_exact().

[1] https://sashiko.dev/#/bug/linux-ac3b3436-c7ff-4bc4-ac2f-8d1aa0b6ad52
[2] https://sashiko.dev/#/bug/linux-c4c01ba7-4086-4d0d-b8e1-8b417f2486e3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-topic-sm86=
50-el2-v2-0-174e159f0f69@linaro.org?part=3D9
