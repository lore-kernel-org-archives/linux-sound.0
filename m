Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543017;
	b=NdwP1+FoaoKuumdGOt5Fds3HGOLoJLUPGsafz1EI3ms2yTPSo1Nrffix8s5+4guK1DLu
	 uNIv3nRi59JKFA2k1D/utzDSoshZWWlaLxAvM1kpHRrTQRZyUMa8ovg8vVfiROsNzC9/6
	 /p5TVKEFz6dxWbGtskt1D59KMZitsxGVCtbNOSFjuJimGho0JZip2aOw6718HGZHlutVO
	 EMesspkFm++4DXlH4mooweGAZkb7VhfbiszV2k3W9ewnVJfZoubUmTjDXiY95HTu4i/SL
	 l2IXe2SMjMCl50dAjZI/RZizwJGIr3aNOg5zY8T73QEv2LIVJYKlsy+gVMA6FXTTi+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543017;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=974w/PlNab1Z0DeWPcHuJZCtEC/8w2imrmo4h6na3WA=;
	b=Yufg6BKyrqMvpzoyAX958HHnOucbpcACtWq+fIhix8YGMxEeTFLMg4E1vZEHDfIsgCno
	 9Ro4CK3dPGmqdh+wDv308E0GEVChC8ZKx3JlM2vx1oMlq+mgNF69DqAVRnt7LZkCnvB+b
	 +eZNWi1p5wP5K8OQLfcmaEbV/f+SZzLnyOpxLixjrIQj2eRfma0kH7n/CGQqyfALSMXHg
	 jkA6EVNgj6xc62pZx/mCV6xSyPlfVWhEXxQwa1XlWGEbxIFP/d7/FzwfpGtU0TiYPy89b
	 h9KVbWuqcu2XWLL3hLd3qLEmNUhgbNnQDlbxwJurUJfFjrWyMlcEf6chC09DORTxBNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KtLZoHc/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69472606A31E;
	Tue, 24 Nov 2026 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KtLZoHc/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EAA1F000D8;
	Tue, 24 Nov 2026 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543016;
	bh=974w/PlNab1Z0DeWPcHuJZCtEC/8w2imrmo4h6na3WA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KtLZoHc/3xLej6J9Wo6JCqwbvXydExUj72yz68/ZPuNUQpeWcZZmcATub3FpPiQCx
	 R3/qs+MZ88X3/ON3E8zFH4AK4c1qle5lHQ1hfXsOzOIsmTyIVeV+hSrQyOQyt14sYb
	 a8DUAV5H2Tx6S086W20uoDpJ/p0szjnw8I36XuZ8DhEx0t7UouNbvQ4eNjP3S9Xamq
	 iDx4GwFLjtAj0uKWVNcAklx2rV7ir9UFzlj+MhY5uaA/ef/cVC0uLDSyQYXGj0cYFJ
	 Yxo8VNxOBiiPyY1fPyk+130o0nSS72Cnw1GXPDAEkVLfi1NvOTADZNhq4nYIFNFsen
	 JACMvl0AOmMPQ==
Message-ID: <sashiko-outbox-231759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/19] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-topic-sm8650-el2-v2-19-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-19-174e159f0f69@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:56:55 +0000
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
- [Medium] ASoC: qcom: sc8280xp: missing jack cleanup and link exit on
  DSP Bypass links
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] ASoC: qcom: sc8280xp: missing WCD jack cleanup in
  sc8280xp_snd_exit() [1]
--

commit 30357a271c5bc6a19f163b41e5ab561af21084a8
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu

This commit adds init and ops callbacks for DSP Bypass DAI links in the
sc8280xp machine driver and attaches the WCD jack to LPASS CPU TX codec DMA
DAIs in qcom_snd_wcd_jack_setup().

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index ac4dfb2c2182c..4fcccf7ec4965 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c

[ ... ]

> @@ -377,6 +378,37 @@ static int nord_snd_init(struct snd_soc_pcm_runtime =
*rtd)
>  	return 0;
>  }
> =20
> +static int sc8280xp_lpass_snd_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct sc8280xp_snd_data *data =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_card *card =3D rtd->card;
> +
> +	switch (cpu_dai->id) {
> +	case LPASS_CDC_DMA_WSA_RX0:
> +	case LPASS_CDC_DMA_WSA_RX1:
> +		/*
> +		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
> +		 * to reduce the risk of speaker damage until we have active
> +		 * speaker protection in place.
> +		 */
> +		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
> +		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
> +		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
> +		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
> +		break;
> +	case LPASS_DP_RX:
> +		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack[0], 0);
> +	default:
> +		break;
> +	}
> +
> +	if (data->priv->wcd_jack)
> +		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
> +
> +	return 0;
> +}

[Severity: High]
This problem wasn't introduced by this patch, but sc8280xp_snd_exit() skips
headset jack cleanup for WCD jack configurations [1].

Both sc8280xp_snd_init() and sc8280xp_lpass_snd_init() initialize data->jack
and set data->jack_setup =3D true for WCD jack configurations, whereas
sc8280xp_snd_exit() only calls qcom_snd_headset_jack_cleanup() and clears
data->jack_setup when dai_data->jack_setup is SC8280XP_JACK_SETUP_CODEC:

sound/soc/qcom/sc8280xp.c:sc8280xp_snd_exit() {
	...
	dai_data =3D sc8280xp_get_dai_data(data->priv, cpu_dai->id);
	if (dai_data && dai_data->jack_setup =3D=3D SC8280XP_JACK_SETUP_CODEC) {
		qcom_snd_headset_jack_cleanup(rtd);
		data->jack_setup =3D false;
	}
}

When a card with a WCD jack unbinds, snd_card_free() frees data->jack.jack
while codec components retain &data->jack and data->jack_setup remains true.
On rebind, qcom_snd_headset_jack_init() skips creating a new jack and
re-registers the dangling data->jack with the codec components, causing a
use-after-free on the next headset jack event.

[ ... ]

> @@ -549,6 +633,10 @@ static void sc8280xp_add_be_ops(struct snd_soc_card =
*card)
>  			link->exit =3D sc8280xp_snd_exit;
>  			link->be_hw_params_fixup =3D sc8280xp_be_hw_params_fixup;
>  			link->ops =3D &sc8280xp_be_ops;
> +		} else if (!link->dynamic) {
> +			/* DSP Bypass link, neither a DPCM frontend nor a backend */
> +			link->init =3D sc8280xp_lpass_snd_init;
> +			link->ops =3D &sc8280xp_lpass_ops;
>  		}
>  	}
>  }

[Severity: Medium]
Should DSP Bypass links also wire a link->exit callback to call
qcom_snd_headset_jack_cleanup() and reset data->jack_setup =3D false?

Without an exit callback to pair with sc8280xp_lpass_snd_init(), unbinding =
and
rebinding a component on a DSP Bypass card with data->priv->wcd_jack set le=
aves
data->jack_setup true after snd_card_free() frees data->jack.jack, leading =
to
a use-after-free in snd_soc_jack_report() when a jack event is reported.

[1] https://sashiko.dev/#/bug/linux-70cecd60-74fd-40f1-95c8-8dc260e646ac

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-topic-sm86=
50-el2-v2-0-174e159f0f69@linaro.org?part=3D19
