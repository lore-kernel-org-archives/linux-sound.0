Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254420;
	b=VlidJAfir+VCgv359C6EKQjTFCcqeYCLAKdHb+HWwM0mcg2z/M+RD3Sjzn9sVWhe+ztG
	 ePbXtqSsDkE0D3RT1c0hyrnQmFY7Mc4VTvXLCfy+3WxzeeUAr2t3ifKYRiowkzRFHvRfk
	 5hHw6bNAEpF3l6fBeoqHEJFTf+7ElZ7XCXdFZPecGZ+2TJmvlLhGWjLw2LrTH7/3Sx8xF
	 J3jFZFOr3w9YO6/S5skgGdewQwhbRnalmu2my3zggMI4p73Lr3h2h1vrYv/2UcI1KwkMc
	 eiTY53sKOeNcdCNur+lY1aefxyvSx5qQeJHUYMy4FBLmloKCAGZ0fEaxL6guAu4Sppw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254420;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RroH69GceP9fj9wa6qMYmOzji+UQOV45gjiVhQ1D7JA=;
	b=pzvjB9Tn07VTEBqFdpDwX51ZYThcxK+UYGrixzEdnHlI7nLG4SPdt8kdjmtj27udICcw
	 +DBtqkRF6dw9rWl/zfkQNDxS0zNzZRE6ASNrh+caJMuEkUBSDJO6khcJg3M9LH/JFIuR6
	 oC6Taxx+zESxX2OlW68NfAEtArvR8bU69eUlADXYl4JsbDbGRl7LpuM7qx0ECVmkAbRNz
	 ZFKJHEwnUBd3j7VlMAU8GpxE4Df5gGwA9kO2+gtNU0pD4saALHmcKLEcM8uRjTAj6wxax
	 rmvW/E3xyDzPSt94a6Y77LN0Y99DNF/UM5RSTU8otE3/tH6zcZUqFqJ0B409z/Dx+fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MSVuWo1P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD5C606A31A
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 06:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MSVuWo1P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1452B1F01825;
	Thu, 29 Oct 2026 06:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793254420;
	bh=RroH69GceP9fj9wa6qMYmOzji+UQOV45gjiVhQ1D7JA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MSVuWo1PGkDRJFCuZtWLOyE/S2f9WAX/jlo2CVxmykmLYgdXgIhAH9MqLXoMxVsBK
	 5mU8hnsvRJY5tFZcvig19KJERAu/Xjt+BLCVWo81en4wJtlR2nYtNmd7HPHT7eV7h6
	 qZ320bnLrkktt3Gr6zu0Q2ZOUC6VoiSQzLQ4L2ICa41FVvo4xrrxjLt2VBRBd5+0Hl
	 gUi07dSAmSsgLlTTAh4gDguXCIx0GHkFjgi5wp3cUU/3+AzaTkeDUufcoZimEGUJ44
	 K185TrRJQJ7UaICiiWRhmTckVNSLlYyeDxsU6hDUzuleL4WB0PiMajZFg9ZEv1uiY6
	 zb6ifPdiX0vzA==
Message-ID: <sashiko-outbox-188798@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda/realtek: Convert HP AIO SPK fixup to
 INIT-stage depop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Heng" <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261029055945.188723-2-zhangheng@kylinos.cn>
References: <20261029055945.188723-1-zhangheng@kylinos.cn>
 <20261029055945.188723-2-zhangheng@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 06:13:39 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ALSA: hda/realtek: unconditional unmute in alc225_fixup_hp_aio_s=
pk()
- [Low] ALSA: hda/realtek: duplicate 103c:84ee quirk entry in alc269_fixup_=
tbl
--

commit 2bd7f803bf3acde738482eabfd02d74f96a4d957
Author: Zhang Heng <zhangheng@kylinos.cn>

ALSA: hda/realtek: Convert HP AIO SPK fixup to INIT-stage depop

This commit replaces the static coef 0x10 verb table for
ALC225_FIXUP_HP_AIO_SPK with an init-stage fixup function that mutes pin 0x=
1b,
writes coef 0x10, sleeps 75 ms, and unmutes pin 0x1b. It also adds a quirk
entry for SSID 103c:84ee in alc269_fixup_tbl.

> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 67ce5b130f81f..3a1b664fca0ef 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -2902,6 +2902,20 @@ static void alc225_fixup_s3_pop_noise(struct hda_c=
odec *codec,
>  	codec->power_save_node =3D 1;
>  }
> =20
> +static void alc225_fixup_hp_aio_spk(struct hda_codec *codec,
> +				    const struct hda_fixup *fix, int action)
> +{
> +	if (action !=3D HDA_FIXUP_ACT_INIT)
> +		return;
> +
> +	snd_hda_codec_write(codec, 0x1b, 0,
> +			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_MUTE);
> +	alc_write_coef_idx(codec, 0x10, 0x0220);
> +	msleep(75);
> +	snd_hda_codec_write(codec, 0x1b, 0,
> +			    AC_VERB_SET_AMP_GAIN_MUTE, AMP_OUT_UNMUTE);
> +}

[Severity: Medium]
Does unconditionally writing AMP_OUT_UNMUTE via snd_hda_codec_write() here
override the mixer or headphone auto-mute state and desynchronize
codec->core.regmap on init and resume?

During codec initialization in sound/hda/codecs/realtek/realtek.c:alc_init(=
),
snd_hda_gen_init() runs before HDA_FIXUP_ACT_INIT fixups are applied:

sound/hda/codecs/realtek/realtek.c:alc_init() {
	...
	snd_hda_gen_init(codec);
	alc_fix_pll(codec);
	alc_auto_init_amp(codec, spec->init_amp);
	snd_hda_apply_verbs(codec); /* apply verbs here after own init */

	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
	...
}

Inside sound/hda/codecs/generic.c:snd_hda_gen_init(), the output paths and
auto-mute state are initialized in codec->core.regmap and flushed to hardwa=
re:

sound/hda/codecs/generic.c:snd_hda_gen_init() {
	...
	/* call init functions of standard auto-mute helpers */
	update_automute_all(codec);

	snd_hda_regmap_sync(codec);
}

When alc225_fixup_hp_aio_spk() then runs at HDA_FIXUP_ACT_INIT, calling
snd_hda_codec_write() sends raw verbs via snd_hdac_codec_write(), bypassing
codec->core.regmap. If the Speaker or Master Playback Switch was muted (or
auto-muted by headphones), hardware pin 0x1b is left unmuted while regmap
still caches HDA_AMP_MUTE. Because snd_hda_gen_init() already cleared the
regmap dirty state, the trailing snd_hda_regmap_sync() in alc269_resume() is
a no-op, and subsequent userspace attempts to mute via
snd_hda_mixer_amp_switch_put() -> snd_hda_codec_amp_update() see no change
against the cached value and suppress the hardware write.

Should alc225_fixup_hp_aio_spk() restore pin 0x1b to its cached regmap amp
state instead of unconditionally writing AMP_OUT_UNMUTE?

[ ... ]

> @@ -7737,6 +7747,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>  	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GP=
IO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x854d, "HP EliteBook 840 G6", ALC285_FIXUP_HP_GP=
IO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x856a, "HP Pavilion 15-cs1xxx", ALC295_FIXUP_HP_=
PAVILION_MUTE_LED_1B),
> +	HDA_CODEC_QUIRK(0x103c, 0x84ee, "HP Pavilion AiO 24", ALC225_FIXUP_HP_A=
IO_SPK),

[Severity: Low]
Doesn't this add a duplicate quirk entry to alc269_fixup_tbl[]?

Commit fd47de58575a ("ALSA: hda/realtek: Add quirk for HP Pavilion AiO 24
(ALC225)") already added an identical entry further down in
alc269_fixup_tbl[]:

	SND_PCI_QUIRK(0x103c, 0x8e43, "HP Laptop 15-fd2xxx", ALC236_FIXUP_HP_MUTE_=
LED_MICMUTE_GPIO),
	HDA_CODEC_QUIRK(0x103c, 0x84ee, "HP Pavilion AiO 24", ALC225_FIXUP_HP_AIO_=
SPK),
	SND_PCI_QUIRK(0x103c, 0x8e60, "HP OmniBook 7 Laptop 16-bh0xxx", ALC245_FIX=
UP_CS35L41_I2C_2_MUTE_LED),

In addition, placing 0x84ee after 0x856a leaves it out of ascending subdevi=
ce
ID order (right after 0x84e7). Should the pre-existing misplaced entry be
removed when moving it to its sorted position?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029055945.1887=
23-1-zhangheng@kylinos.cn?part=3D2
