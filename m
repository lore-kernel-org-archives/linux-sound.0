Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793506397;
	b=4DYqOhCb9cQRliMxarwvabJdcn9eSVXze+1+cAslvJFu0z9/NsHg/pQnNmvOJZYPBu85
	 18ZTS5j/e3IWGpazA7UMEYgFLxA3JaZWhvO7WP9E/McnO1ashVVfsUSYo9kHTy0cxWiWR
	 K57wbSaG0jECUWNVUKRJ2zVp8V8f2+NAvBI70xcUQBCWidMiHy+NGNuw4SGOyrHAKMeoQ
	 SuTy1AoYNS7vo+Z+8OLZG+1pzABnkr9+CyHq6nSijDIPY1b8dl/YsOEt/B9jiAObAKvkR
	 ypcvx8OjMfjdcWkGm7PSejZ6tnrcEGYkwmgvui3f4ALWOJfWSw/m5wS+NZVTK7Dn0UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793506397;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=z2Cg74g46KG3N6ht9Q03662+u2VBApNKiCoPDwxUhGE=;
	b=ApDChws5xP2egJB2xFY6pC3mWJUIG6EFxn0lBUoLnpcD+4EcNBIj7BzGnk7d/7+ECA5N
	 1bbk4AKAv9tdg+WMgeWDdCnt2WwDVTWZ7SO3KCNMnXV5ASTaGQuvEI7pDuFOLxQzzTZJL
	 R0Vp7krf1NxcJGdH1Au1jjhdwvQIPFQlfPPMPb2TnjUI9PKgjIRZ0hX8IXDuMcgH/YkJI
	 lU/AuNMAS5bMTGnV7VptwLhdUf/CBycamMYI4QRMQpiy836S1/YxvrXL/mW7STVicJK6j
	 qbz8+NiNepJMnGgClqNrzPzCsQAezEzhJodT+9cBmhi8MQ83PNVg5lDaYW/v0/KO4hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=az+AjlIC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876C4606A324;
	Sun,  1 Nov 2026 04:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=az+AjlIC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21A41F000C1;
	Sun,  1 Nov 2026 04:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793506397;
	bh=z2Cg74g46KG3N6ht9Q03662+u2VBApNKiCoPDwxUhGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=az+AjlIC0CR7zhehcAHBHDMQ0yFhQ9hlA3uNgXBx6L8iyAFgeMMvb1+5tQ6hmvTeb
	 7UmH2TWI/TU0pYOxmrHinGEVx2mfevVLkLE0zKAIlNLF0jdPfXOxTS89fOcUHWm0Rb
	 KQBvuJyFEgZy/RxwK9jjf4VJTXdac9kd9BlWp67onqBRzomLBfiDaKQlCgfak5CabO
	 zLG0bodB9qUZdat4chRS8yGkQ4f7rCfFF8c1Y8/bRYlII7pEdlLytdVeJb+TYvf/nr
	 Y7o5cxQr75BnES3J6S+5W3i48io68thW5b8BADJtxwqMhnCK9uQHS/vr2QEpIwUHzT
	 m1M3iTswRW7fw==
Message-ID: <sashiko-outbox-192271@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/6] ASoC: codecs: rk3308: expose per-channel
 microphone boost
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xing Zheng" <zhengxing@rock-chips.com>, linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101040125.1864141-3-zhengxing@rock-chips.com>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101040125.1864141-3-zhengxing@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 04:13:16 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: codecs: rk3308: non-contiguous mic boost range on rev A
--

commit eb32aeb2bd3d3cce70cc5e7d254a08bf85314017
Author: Xing Zheng <zhengxing@rock-chips.com>

ASoC: codecs: rk3308: expose per-channel microphone boost

This commit adds per-channel microphone boost controls for all eight ADC
inputs on the RK3308 codec, using revision-specific TLV dB scales and
rejecting intermediate gain settings on revision A.

> diff --git a/sound/soc/codecs/rk3308_codec.c b/sound/soc/codecs/rk3308_co=
dec.c
> index 7a18ff45e391b..fc7e20e82700b 100644
> --- a/sound/soc/codecs/rk3308_codec.c
> +++ b/sound/soc/codecs/rk3308_codec.c
> @@ -66,6 +66,84 @@ static const DECLARE_TLV_DB_RANGE(rk3308_codec_dac_lin=
eout_gain_tlv,
>  	3, 3, TLV_DB_SCALE_ITEM(0,    0, 0),
>  );
> =20
> +static const DECLARE_TLV_DB_RANGE(rk3308_codec_adc_mic_gain_tlv_a,
> +	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
> +	3, 3, TLV_DB_SCALE_ITEM(2000, 0, 0),
> +);
> +
> +static const DECLARE_TLV_DB_RANGE(rk3308_codec_adc_mic_gain_tlv_b,
> +	0, 0, TLV_DB_SCALE_ITEM(0, 0, 0),
> +	1, 1, TLV_DB_SCALE_ITEM(660, 0, 0),
> +	2, 2, TLV_DB_SCALE_ITEM(1300, 0, 0),
> +	3, 3, TLV_DB_SCALE_ITEM(2000, 0, 0),
> +);
> +
> +static int rk3308_codec_mic_boost_put(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct rk3308_codec_priv *rk3308 =3D snd_soc_component_get_drvdata(comp=
onent);
> +	long gain =3D ucontrol->value.integer.value[0];
> +
> +	if (rk3308->codec_ver =3D=3D ACODEC_VERSION_A && gain !=3D 0 && gain !=
=3D 3)
> +		return -EINVAL;
> +
> +	return snd_soc_put_volsw(kcontrol, ucontrol);
> +}
> +
> +static const struct snd_kcontrol_new rk3308_codec_mic_boost_controls[] =
=3D {
> +	SOC_SINGLE_EXT_TLV("MIC1 Boost Volume", RK3308_ADC_ANA_CON01(0),
> +			   RK3308_ADC_CH1_MIC_GAIN_SFT, RK3308_ADC_CH1_MIC_GAIN_MAX, 0,
> +			   snd_soc_get_volsw, rk3308_codec_mic_boost_put,
> +			   rk3308_codec_adc_mic_gain_tlv_b),

[Severity: Medium]
On codec revision A (ACODEC_VERSION_A), rk3308_codec_probe() ->
rk3308_codec_add_mic_boost_controls() in sound/soc/codecs/rk3308_codec.c
registers the controls in rk3308_codec_mic_boost_controls[] using
SOC_SINGLE_EXT_TLV() with RK3308_ADC_CH1_MIC_GAIN_MAX (3) and
snd_soc_info_volsw().

When userspace queries SNDRV_CTL_IOCTL_ELEM_INFO on ACODEC_VERSION_A,
snd_soc_info_volsw() advertises an integer control with min =3D 0 and max =
=3D 3,
indicating that integer steps 0, 1, 2, and 3 are all valid. However, writing
intermediate steps 1 or 2 via SNDRV_CTL_IOCTL_ELEM_WRITE ->
rk3308_codec_mic_boost_put() returns -EINVAL, and
rk3308_codec_adc_mic_gain_tlv_a leaves control values 1 and 2 unmapped in t=
he
TLV dB range.

In ALSA, integer controls are expected to expose a contiguous range of valid
steps from min to max without holes, as verified by
test_ctl_write_valid_integer() in tools/testing/selftests/alsa/mixer-test.c:

	for (i =3D 0; i < snd_ctl_elem_info_get_count(ctl->info); i++) {
		for (j =3D snd_ctl_elem_info_get_min(ctl->info);
		     j <=3D snd_ctl_elem_info_get_max(ctl->info); j +=3D step) {

			snd_ctl_elem_value_set_integer(val, i, j);
			err =3D write_and_verify(ctl, val, NULL);
			if (err !=3D 0)
				fail =3D true;
		}
	}

Wouldn't advertising 0..3 on ACODEC_VERSION_A while rejecting values 1 and 2
cause single-step mixer adjustments (such as incrementing from 0 to 1), TLV
dB lookups on intermediate values, and the ALSA mixer kselftest to fail? Co=
uld
revision A expose a contiguous 0..1 control range (mapping 0 -> 0 and 1 -> 3
in the register) instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101040125.1864=
141-1-zhengxing@rock-chips.com?part=3D2
