Received: from mail-m49205.qiye.163.com (mail-m49205.qiye.163.com [45.254.49.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E141BA99;
	Thu, 16 Jul 2026 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201917; cv=none; b=cqtkR+358Dpjqi2rivsMBqOexE5Vb2sukka9JbhS+bfpftfLG/LSuSfKtEex0IAPyNSo/TKrSiL/G99T04gbeufU1SBjh++SBdzEbTMOiqhjYdJZyi6tRkfKjJsPSYxTp8pZLRuQbPYc6RG+WnQ05bLN29CVumeK9S5zfNNZj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201917; c=relaxed/simple;
	bh=NSSbjOJArliCkaBo8gNxUgoRpFPjYh8M/g5jlxQNKwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQnQZSY4CRXlnpVU90+GNRHTjaURjFk9hbSAJR9Kb2VRdX2o5h6px+6wEfODeGtV4n88ewM6tbTO6y10YPYTCBy5d6qfW9bGG6TIOQSCqnixnCRJR4jAdt8U/z88N/crIVSNqoD09nuGfN6pvNQwmDobHjNW8/oFgiKiigAR5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=XyDsH925; arc=none smtp.client-ip=45.254.49.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="XyDsH925"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 466dc86e3;
	Thu, 16 Jul 2026 17:15:53 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: mohammad.rafi.shaik@oss.qualcomm.com
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	neil.armstrong@linaro.org,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v2 5/6] ASoC: qcom: sc8280xp: Add RubikPi 3 sound card support
Date: Thu, 16 Jul 2026 17:15:48 +0800
Message-ID: <20260716091548.2844369-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <847396bb-2cc1-4f45-bd81-33ab55d3af6f@oss.qualcomm.com>
References: <847396bb-2cc1-4f45-bd81-33ab55d3af6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f6a36054f09d5kunm310692a7996b5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRpCVktCGkkaGE4aQ04eGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=XyDsH925Au7I7JxnQvdmNAv/rf+TB8LDsDhcBn5hy6tsal9wJ5gsiUnW8yyaF7BcGHCbXAVe/jmM8TSIsuOuF1lParHqoVsnwWBTuo2XYn6xoFCevGdA6dxT9GAQ6xBxJK0+gCh1HlqaRvOBFScoKf7O85H9N4LpYwq6JxrXHLQ=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=Eb18BN/yHG243dJ2m5Qb3w7CIglh4wqlllocwyASBAI=;
	h=date:mime-version:subject:message-id:from;

Hi Rafi,

Thank you for the review.

> On 7/15/2026 7:32 PM, Hongyang Zhao wrote:
> > RubikPi 3 connects an ES8316 codec to the primary MI2S interface for
> > headset playback and capture, and an LT9611 bridge to the quaternary
> > MI2S interface for HDMI audio.
> >
> > Add board-specific DAI data for these links. Configure both directions
> > of the primary interface for I2S with normal clock polarity and the
> > codec as bit and frame clock consumer. Program the LPASS MCLK and BCLK,
> > drive the ES8316 with its required 19.2 MHz MCLK, and enable the generic
> > codec jack-detection setup on the playback link.
> >
> > Configure the quaternary playback link with the same I2S clock format.
> > Do not request a codec sysclk for this link because the LT9611 HDMI
> > codec DAI does not implement set_sysclk().
> >
> > Select this configuration through the RubikPi 3 sound-card compatible.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >   sound/soc/qcom/sc8280xp.c | 39 +++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 39 insertions(+)
> >
> > diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> > index 885ec1e3e575..1354eecb56c9 100644
> > --- a/sound/soc/qcom/sc8280xp.c
> > +++ b/sound/soc/qcom/sc8280xp.c
> > @@ -410,6 +410,41 @@ static const struct snd_soc_common qcs6490_priv_data = {
> >   	}),
> >   };
> >
> > +static const struct snd_soc_common qcs6490_rubikpi3_priv_data = {
> > +	.driver_name = "qcs6490",
> > +	.dapm_widgets = sc8280xp_dapm_widgets,
> > +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> > +	SC8280XP_DAI_DATA(
>
> Where is SC8280XP_DAI_DATA() defined?

It is introduced by the preceding patch 4/6.

https://lore.kernel.org/linux-arm-msm/20260715-rubikpi-next-20260605-v2-4-67601d7a8581@thundersoft.com/

It initializes snd_soc_common::dai_data with an array of
struct sc8280xp_dai_data and sets num_dai_data.

Patch 4/6 reached the mailing list after your reply, so the definition
was not visible when you reviewed this patch.

>
> > +		{
> > +			.id = PRIMARY_MI2S_RX,
> > +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> > +					 SND_SOC_DAIFMT_NB_NF |
> > +					 SND_SOC_DAIFMT_BC_FC,
>
> codec_dai_fmt appears to be identical for all MI2S DAIs. Can this be
> moved into the common initialization path instead of being specified per
> DAI.
>
> > +			.mclk_rate = 19200000,
>
> Is this mclk frequency fixed ?
>
> Typically, audio MCLK is expected to be 12.288 MHz or 24.576 MHz.

Yes. The RubikPi 3 machine configuration intentionally sets the ES8316
sysclk to 19.2 MHz. At the fixed 48 kHz backend rate this gives an
MCLK/LRCK ratio of 400, which is explicitly supported and documented by
the ES8316 driver.

>
> > +			.codec_sysclk_set = true,
> > +			.mi2s_mclk_enable = true,
>
> Drop this mclk_enable flag; your already enabled from the codec node.
>
> is not ?

Agreed. The ES8316 codec node is now the only MCLK consumer. The Primary
MI2S RX and TX CPU backends only configure BCLK. The machine driver
still calls the ES8316 set_sysclk() operation with 19.2 MHz to set the
clock rate and sample-rate constraints, but it no longer enables MCLK
through the CPU DAI.

>
> +&i2c0 {
> +	status = "okay";
> +
> +	es8316: audio-codec@11 {
> +		compatible = "everest,es8316";
> +		reg = <0x11>;
> +		#sound-dai-cells = <0>;
> +
> +		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		clock-names = "mclk";
> +
>
> > +			.mi2s_bclk_enable = true,
> > +			.jack_setup = SC8280XP_JACK_SETUP_CODEC,
>
> .jack_setup is not part of snd_soc_common

jack_setup is a member of struct sc8280xp_dai_data, introduced in 4/6.
SC8280XP_DAI_DATA() places these entries in snd_soc_common::dai_data.
This was also obscured by patch 4/6 arriving after your review.

>
> Best regards,
> Rafi
>
> > +		},
> > +		{
> > +			.id = PRIMARY_MI2S_TX,
> > +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> > +					 SND_SOC_DAIFMT_NB_NF |
> > +					 SND_SOC_DAIFMT_BC_FC,
> > +			.mclk_rate = 19200000,
> > +			.codec_sysclk_set = true,
> > +			.mi2s_mclk_enable = true,
> > +			.mi2s_bclk_enable = true,
> > +		},
> > +		{
> > +			.id = QUATERNARY_MI2S_RX,
> > +			.codec_dai_fmt = SND_SOC_DAIFMT_I2S |
> > +					 SND_SOC_DAIFMT_NB_NF |
> > +					 SND_SOC_DAIFMT_BC_FC,
> > +		}
> > +	),
> > +};
> > +
> >   static const struct snd_soc_common qcs8275_priv_data = {
> >   	.driver_name = "qcs8300",
> >   	.dapm_widgets = sc8280xp_dapm_widgets,
> > @@ -480,6 +515,10 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
> >   	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
> >   	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
> >   	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
> > +	{
> > +		.compatible = "thundercomm,qcs6490-rubikpi3-sndcard",
> > +		.data = &qcs6490_rubikpi3_priv_data,
> > +	},
> >   	{}
> >   };
> >
> >

Best regards,
Hongyang
