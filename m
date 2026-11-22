Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373710;
	b=xU7IH7DETrUDi0Rbvdd7tGOrbGkYTgphxkUVDlhm/oQsK3Oxxzuob+DMThHQ1P7GuM5p
	 Ogr1Je23MI7HkT2MYGzswkiDv0t7uEtHOrNxYcilVVSZdH2P1rkrej0DnM1nyKMd0apJY
	 dEgYIl4NUl/8SKLpvwZA1tVW8K20vDHVv4/N3JQ1TtjdCKPeKTBmTor1e8V+H53In1nFy
	 9gXfNvlnX55eH0y+HF7tDJxRnrVJPk9F6N0PPIbr7qj5o14V85FkgMUw5/+7dYp2MQ/6g
	 5YXF7I/Yk1+iN41Lf05nLTG5paedG/zf45eLLQrOjoc3C6Xt31hF+Qc/5jRDwqS9UxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Aovxc5dC+lR16isdk9O4n4VlgAuF5hG7BYT0Gzrios8=;
	b=zxCyaH50+NtiO7bTRMWAMKDZz+VhxKT/fACwGhTuhgQDXBFFjXGztQ8ATrs16ooZ4lia
	 KNUOQ6qUEA/OlYBgmniPyxNmzCF+xsVynMuASvt75CJb+L7qbUXcqQHUhPh2vBPa0Jpm7
	 YwGH/NrUMPKIsoXN9Ild7tZISJDHNtSumHrDOpzHwQuE+EVrHxFmEfYL1YKPzOqu8KVrI
	 WxPyE6FUqI1oYHzkmbzbprPDRrydfkOFNt4Rvbvb3U7P18/phnlc3gkRybMvSGYCQR3dR
	 0Ilvq6caUhCxJo7USHPYbDUGE+gVV5g+Xp6XhsQ029/RYmsu4cgfNtBQ0/l51ySxPhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFKrLAjG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D18606A331;
	Sun, 22 Nov 2026 18:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFKrLAjG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365281F000C4;
	Sun, 22 Nov 2026 18:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795373710;
	bh=Aovxc5dC+lR16isdk9O4n4VlgAuF5hG7BYT0Gzrios8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eFKrLAjGinAUQ+4zMO3k+Ey4VCmyMBLWNeqZcFDUR+qFehU/zHbxHp1nt9k15z2FT
	 s414/Zd1mkgPMDOdvz1gPtk/tdpjIX09BY4Ea75e6Q9OSo8SjuygSni1nhOaQxSiNz
	 41ZMP1st7Fc9zRYNSGYLPG2f0DV9kfhmUd7+NdwZSjUuuWqGyPLtfmngf5t0hfxNuA
	 shu50PI//FsNHk/H08iF9JGG9m7YJ0Lk6KKYtGtFh217AmwF5KrQDUUhrwl+xZ9t/e
	 TJgI2AA4tfj8gIc6jtUTmlGLy02HompnKURtyXxp+gTEwaq3Q7Yh0NF7/ww8punLgD
	 N9aBXZG1AQQAw==
Message-ID: <sashiko-outbox-228210@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/9] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-add_shikra_support-v7-5-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
 <20261123-add_shikra_support-v7-5-7bf3aa089fc6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 18:55:08 +0000
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
- [Medium] ASoC: qcom: lpass-va-macro: stale ADC_DMIC_SEL on live VA
  DECn MUX switch
--

commit 06032519fa34bd074b11bdad3a1dc60749b48edd
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

ASoC: qcom: lpass-va-macro: Add SoundWire microphone support

This commit adds DAPM mux widgets, routes, and decimator configuration logic
to allow VA decimators to capture audio from SoundWire microphone inputs in
addition to DMIC inputs.

> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index 2401006387445..8ed8420d7185b 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
[ ... ]
> @@ -843,10 +859,24 @@ static int va_macro_put_dec_enum(struct snd_kcontro=
l *kcontrol,
>  		return -EINVAL;
>  	}
> =20
> -	if (val !=3D 0)
> +	/*
> +	 * SMIC enums use shift 0 (lower nibble of CFG0), DMIC enums use
> +	 * shift 4 (upper nibble of CFG0). Use e->shift_l to distinguish them
> +	 * without relying on widget name comparisons.
> +	 */
> +	smic_mux =3D (e->shift_l =3D=3D 0);
> +
> +	/*
> +	 * Both muxes feed the same decimator and share ADC_DMIC_SEL, so only
> +	 * the one the decimator is routed through may program it. A write to
> +	 * the mux that is not part of the active path would otherwise switch
> +	 * the input domain of a running capture.
> +	 */
> +	if (val !=3D 0 && smic_mux =3D=3D is_amic_enabled(component, decimator))
>  		snd_soc_component_update_bits(component, mic_sel_reg,
>  					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> -					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> +					      smic_mux ? CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
> +							 CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);
> =20
>  	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
>  }
> @@ -1036,7 +1066,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_=
widget *w,
>  	u16 tx_gain_ctl_reg;
>  	u16 adpt_ctrl_reg;
>  	u8 hpf_cut_off_freq;
> -
>  	struct va_macro *va =3D snd_soc_component_get_drvdata(comp);
> =20
>  	decimator =3D w->shift;
> @@ -1053,6 +1082,18 @@ static int va_macro_enable_dec(struct snd_soc_dapm=
_widget *w,
> =20
>  	switch (event) {
>  	case SND_SOC_DAPM_PRE_PMU:
> +		/*
> +		 * ADC_DMIC_SEL is shared by the DMIC and the SoundWire mic
> +		 * mux, so its value depends on the order in which userspace
> +		 * restores the two controls. Program it from the resolved
> +		 * mux state of this decimator, which is what selects the
> +		 * input domain.
> +		 */
> +		snd_soc_component_update_bits(comp, dec_cfg_reg,
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK,
> +					      is_amic_enabled(comp, decimator) ?
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC :
> +					      CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC);

[Severity: Medium]
Can switching VA DEC0 MUX..VA DEC3 MUX between VA_DMIC and SWR_MIC during an
active capture leave CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK stale?

If both VA DMIC MUXn and VA SMIC MUXn already have non-ZERO inputs selected
(for example, when userspace pre-configures the target sub-mux before
switching VA DECn MUX), va_macro_put_dec_enum() skips updating ADC_DMIC_SEL
for the inactive sub-mux because smic_mux !=3D is_amic_enabled().  When VA =
DECn
MUX is then switched to that sub-mux while capture is running, both the old
and new upstream paths have connected input endpoints, so VA DECn MUX stays
powered and does not re-run SND_SOC_DAPM_PRE_PMU in va_macro_enable_dec().
Because va_dec0_mux..va_dec3_mux use plain SOC_DAPM_ENUM() without a put
callback or SND_SOC_DAPM_POST_REG event, ADC_DMIC_SEL remains stuck on the
previous input domain until the stream restarts or the active sub-mux is
written again.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-add_shikra=
_support-v7-0-7bf3aa089fc6@oss.qualcomm.com?part=3D5
