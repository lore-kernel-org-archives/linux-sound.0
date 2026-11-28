Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886443;
	b=M0uVJyAPsDIqznJf/fmJtukdGpV/GasjZppuso2GiG2UDriu6uppbsj3h3hlWCFz4TDV
	 F5O962s3M4nVx4Nfs+Ab275ItZMwMyQr/E+lnm+YSAhSKWFLLsdM3ZuplvYc6fenNyfvN
	 5bbbnvqlCrkX7YEW9YosGPxzHJ8Y7XZRkukIXXcSVOCEa4pH/0TsfIMkN001h51QmAtpQ
	 x+eJTe6nhsTT/iGuTfc+XU3NMjYGo643dfoJSsJd0AYIXNEbOCqfWUHqqLscIpe5sRX6c
	 4fwHftgDTECsJjMVnVrx+RPV3sPTrs9a0z38b56tqsSrx1FoOaIpfVM6Hw5i3ckvqZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=11Mi+fL3w0fj7mLlPaCOBuZ2CzRrFt6hh9UvAMZZPmY=;
	b=fxsql4uZSmvhx+Z6JszFBQxJYcR5/unXLhwp2SPXIlsrn6cqdQ+Tze2etM6QTWhcUSUZ
	 QPM/xSXYptgY6L4rpNQ6wJ1RGVjSG7SQKoWnd2E4rrX+8RFbbSH/3i0EBcrrxmwnSinvV
	 40JTX5YDorrVKQ30CIZPduizBKa4I4+K9BeEITt/+891IbcTHEiL7P0/9KteO8mAIzSyD
	 klJdRBANgfW0HvhOBMDMD7jxGJdN1776CvR+8e7JhGcVbKJz1JkyoZzxQ+TGjbn/Iysk8
	 owVxK2NsRDvaU08pJ1AsDdynlcM+M5XbJoc9jq0zs2/c2aHNxVBClWzCbrIVk96VBHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JfntTNM6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE84606A321
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 17:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EE84606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JfntTNM6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so92828385e9.3
        for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886442; x=1796491242; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=11Mi+fL3w0fj7mLlPaCOBuZ2CzRrFt6hh9UvAMZZPmY=;
        b=JfntTNM62puMyg6/XYZzBfDuAjSkuaXjKxTE/mByM1mnr2A0KnPQSKInEg7/8aHGM4
         Kh+CUsToOTu2/M4U1TO8nWMOhLDy1bsCcCGBavU36PlsuAf+tBd1bqdKkgTBoK1DxwMH
         32nBsxu8mXlodve6muMSyE50UBYIPwVQZLJkilTgWGaSTagTo9THm6iEh+WC4y+7e0rE
         9qkUdzjXoOeJDujMOpuVnIz3vKun+dbqjq7oORBjuWUMV8iWvz4bX4lt7BUxk2bZ+0yw
         mtFr+DoKQVVJO60LmymiIkHhPBihusRgjEVzr0MAMs7Mbuh6QOBE8AqH3g9YImxOTO4p
         Wvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886442; x=1796491242;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11Mi+fL3w0fj7mLlPaCOBuZ2CzRrFt6hh9UvAMZZPmY=;
        b=SFDqyJmz76tM5cmfqX8Ygq2DDIPytGKQOKKC7Lptcf9qJIANyUpZJpQywuu54eWGl5
         8+EIt0jSBJLKRd2pLhx10FqgB5s7fjD8bzoK+L+sGLV6gHltazvzQlj1gCrkSzD9VCe8
         DkquSWKy7IVI/X7jdIR3+hRWSn7P6epfgat78XpebkRqs9SOHQgB436rh5NNn4DfCoD/
         Nbx7a59R9+ReFwq1XCnEG+H/TlMRuAt4ce/XeYmZOIl47tkvkyyrnV+KGBFmk/jfIQ/W
         CDQap9+54d4CFYEQ4JM+7L1/1bAsdL6taMFuIJD/GrpFoYO98UfyaQ583swUSaWq15xO
         fxIg==
X-Forwarded-Encrypted: i=1; AL+hErFuZQhQbT5SG8Lxphc8kIxQhPQbYa4et76YeyxnrmbACJ25PfwRJm0ltRj1iOq7aoB6WkpCIba5e1XzXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ijYEdBKQeBviH/4y5d8jLlHjSF6h0ca4vpChmOC18nfsl/BRJ
	J33eRcRoKqkKyycpPFWu8WWx00JlVS5DMFqYMbvX/6+NASooRVmxnG1N
X-Gm-Gg: AZFdTZc1TImXNI+Wx8YHs2wuNipRKyz9dlcxmgYRs9c1/cC9aEzUc5bLTEUft6MxrQC
	oRlvYlOmPZ7YDRp8bt+I8pNOZOllF9TIxF0JN6r6u5YmWNLVZBUgXDOEQdbAceEqbjDM7yO4pwm
	LClvnYQ0pDQXIcqrqZOL8MICm+CrKH7GzW0XOTSz0KIqDNdGz+js5fNh/F4CKRsHx3GaJeuydzc
	Uloa7CpGVMm7DBcJYT6vDAYPd2XoqnOHoirkhHzDS1NMzDyxHaRNcK4FY6mLfL5M1EArcPyWQpi
	Z//zRi1ecf+PyCUjiM6nGNOrdpi5BEe/vyLpcsSg4dVQBiQYN05vV86jnfeBHwCw5dFYvZqD0hr
	2zxxsH5Fs1SVq9+BY4Dj/cwsYzUqdpzPaYSE9AqpSpu5eph+gJ0whkLYTdH7E2K+lrqyS7J+o+Y
	iZg6nSIbkKVzFcPk+9Tz8Tdy1p+UWYJqO6QtRJNxE2t8Ad2KG5ocAiEirpC9VdfpIHJH0wpPTEN
	OSTNmh5VXj2ZcOFdjRh5prTG2uh/+FVvLkoQ+eIyHyU/K3xmRnlNl0GUsAje13bbw2JGRnEI1aF
	4NuawdYBVLBfN5rz5MiJhNHjOxqp/Sd1utramBok+SLjGuH3ZEEF7yN41DRH6rtS0eHi9LEWQcD
	NtZo5y52flxdAX++mpLDKTsuYqLoKfpxsGteyYKnQMSy+gu9AzoAmKsbXhzeSR1CvLympXvPaWx
	mJXeaaNAZb4EYGlqb34XLt6QUXTrie9XoLgNq5kD841ul+zyy7TMun3l63utELiKt2ZsRL5maIP
	8hLd46H5Z1/U9SMHa36IO/IcA==
X-Received: by 2002:a05:600c:1d03:b0:4bb:6118:4f57 with SMTP id 5b1f17b1804b1-4bb888130cfmr647905425e9.18.1795886441600;
        Sat, 28 Nov 2026 09:20:41 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbb97e5356sm113082735e9.4.2026.11.28.09.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:20:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Kees Cook <kees+treewide@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
 Ryan Walklin <ryan@testtoast.com>, Andre Przywara <andre.przywara@arm.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>
Cc: stable@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject:
 Re: [PATCH 1/1] clk: sunxi-ng: h616: fix audio PLL and codec clock rates
Date: Sat, 28 Nov 2026 18:20:38 +0100
Message-ID: <hJTjmTRiQyqIclDed76TBQ@gmail.com>
In-Reply-To:
 <9b134cf8ba90d4524188d4b5977fd1d8335dc751.1795815223.git.daniel@makrotopia.org>
References:
 <cover.1795815223.git.daniel@makrotopia.org>
 <9b134cf8ba90d4524188d4b5977fd1d8335dc751.1795815223.git.daniel@makrotopia.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. november 2026 ob 22:42:44 Srednjeevropski standardni =C4=8Da=
s je Daniel Golle napisal(a):
> The sigma-delta table of the H616 audio PLL holds the PLL_AUDIO(4X)
> rates of 90.3168 and 98.304 MHz, which already include the M0 output
> divider of 2, and ccu_nm divides the table rate by fixed_post_div once
> more. The PLL and the 4x, 2x and 1x clocks derived from it are therefore
> reported at half their real frequency: N =3D 40, P =3D 5, M0 =3D 2 and
> pattern 0xc001eb85 (a fractional N of 40.96) give 24 MHz * 40.96 / 5 /
> 2 =3D 98.304 MHz for PLL_AUDIO(4X). Store the rates in front of the post
> divider.
>=20
> The H616 codec only played at the right speed because of this: its DAC
> needs a module clock of 49.152 MHz for the 48 kHz family and 45.1584 MHz
> for the 44.1 kHz family, and the 24.576 MHz requested by the sun4i-codec
> rate table landed on pll-audio-2x running at 49.152 MHz. Request twice
> the table rate on the H616, in the same change, as either half on its
> own leaves the codec playing at the wrong speed.
>=20
> Fixes: d0c322b6e4bf ("clk: sunxi-ng: h616: Add sigma-delta modulation set=
tings for audio PLL")
> Fixes: 9155c321a1d0 ("ASoC: sun4i-codec: support allwinner H616 codec")

This patch is correct. However, split it to two different patches, one
for clock and one for audio codec.

Best regards,
Jernej

> Cc: stable@vger.kernel.org
> Cc: Ryan Walklin <ryan@testtoast.com>
> Cc: Andre Przywara <andre.przywara@arm.com>
> Cc: Marcus Cooper <codekipper@gmail.com>
> Cc: Philippe Simons <simons.philippe@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Measurements on an H618 (X98H TV box), DAC drain rate from AC_DAC_CNT
> and aplay run time of a 4 s 48 kHz stereo file:
>=20
>   kernel           CODEC_1X_CLK  real module clock  drain    run time
>   unpatched        mux 2X        49.152 MHz         96360/s  4.06 s
>   CCU fix only     mux 1X        24.576 MHz         48160/s  8.03 s
>   CCU fix, 2X mux  mux 2X        49.152 MHz         96360/s  real time
>   this patch       mux 2X        49.152 MHz         -        4.06 s
>=20
> With this patch the 44.1 kHz family runs at 45.1584 MHz and also plays
> in real time. Codec streams of either family keep their rate when they
> alternate with streams of the out-of-tree Audio Hub HDMI driver, which
> retunes the PLL between the two settings. A guitar tuner held to
> headphones on the line out read 440 Hz for 60 s sines of 440 Hz at 48
> and at 44.1 kHz, and 880 Hz on the right channel only for a 60 s 880 Hz
> right-channel sine at 48 kHz.
>=20
> The real rates follow the PLL_AUDIO_CTRL formula of the H616 manual
> (3.3.5.12) from the register contents (0xb9042701 with pattern
> 0xc001eb85 for the 48 kHz family, 0xb9021501 with 0xc001288d for 44.1
> kHz). The same halving made sun4i-spdif run at twice its rate whenever
> the codec had moved the PLL to its sigma-delta setting first (a 4 s
> file played in 2.01 s). With the fix it plays in real time whenever the
> PLL already runs in the rate family of the stream; the spdif clock
> cannot retune the PLL itself, which is a separate problem.
>=20
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 4 ++--
>  sound/soc/sunxi/sun4i-codec.c          | 8 ++++++++
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 955c614830fae..6af0c1318ccf2 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -223,8 +223,8 @@ static struct ccu_nkmp pll_de_clk =3D {
>   * frequencies with less error.
>   */
>  static struct ccu_sdm_setting pll_audio_sdm_table[] =3D {
> -	{ .rate =3D 90316800, .pattern =3D 0xc001288d, .m =3D 3, .n =3D 22 },
> -	{ .rate =3D 98304000, .pattern =3D 0xc001eb85, .m =3D 5, .n =3D 40 },
> +	{ .rate =3D 180633600, .pattern =3D 0xc001288d, .m =3D 3, .n =3D 22 },
> +	{ .rate =3D 196608000, .pattern =3D 0xc001eb85, .m =3D 5, .n =3D 40 },
>  };
> =20
>  #define SUN50I_H616_PLL_AUDIO_REG	0x078
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 9d5bc3d7b4dfa..759343bec42a8 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -333,6 +333,7 @@ struct sun4i_codec {
>  	struct reset_control *rst;
>  	struct gpio_desc *gpio_pa;
>  	struct gpio_desc *gpio_hp;
> +	bool double_mod_freq;
> =20
>  	/* ADC_FIFOC register is at different offset on different SoCs */
>  	struct regmap_field *reg_adc_fifoc;
> @@ -661,6 +662,9 @@ static int sun4i_codec_hw_params(struct snd_pcm_subst=
ream *substream,
>  	if (!clk_freq)
>  		return -EINVAL;
> =20
> +	if (scodec->double_mod_freq)
> +		clk_freq *=3D 2;
> +
>  	ret =3D clk_set_rate(scodec->clk_module, clk_freq);
>  	if (ret)
>  		return ret;
> @@ -2147,6 +2151,7 @@ struct sun4i_codec_quirks {
>  	unsigned int reg_adc_rxdata;	/* RX FIFO offset for DMA config */
>  	bool has_reset;
>  	bool playback_only;
> +	bool double_mod_freq;
>  	u32 dma_max_burst;
>  };
> =20
> @@ -2237,6 +2242,7 @@ static const struct sun4i_codec_quirks sun50i_h616_=
codec_quirks =3D {
>  	.reg_dac_txdata	=3D SUN8I_H3_CODEC_DAC_TXDATA,
>  	.has_reset	=3D true,
>  	.playback_only	=3D true,
> +	.double_mod_freq =3D true,
>  	.dma_max_burst	=3D SUN4I_DMA_MAX_BURST,
>  };
> =20
> @@ -2365,6 +2371,8 @@ static int sun4i_codec_probe(struct platform_device=
 *pdev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(scodec->reg_dac_fifoc),
>  				     "Failed to create regmap fields\n");
> =20
> +	scodec->double_mod_freq =3D quirks->double_mod_freq;
> +
>  	/* DMA configuration for TX FIFO */
>  	scodec->playback_dma_data.addr =3D res->start + quirks->reg_dac_txdata;
>  	scodec->playback_dma_data.maxburst =3D quirks->dma_max_burst;
>=20




