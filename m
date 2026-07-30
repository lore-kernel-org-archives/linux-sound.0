Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2294380FCE;
	Thu, 30 Jul 2026 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785452241; cv=none; b=LRu/n6d8Pqnv6j1sueWRtjzs70/P13puQoWNxcdn1vwzt7Nn4HGcJmP7VwvgfA+WUKUckYiYBspmKSOPGkooRrXhmmMlSodkhawlOLjYZ4EIoPKR85XK31o9jGVcT+y8isTF9BnxHX8g9GaAEuamEZfiyVzPdajMsJeAm7ytxN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785452241; c=relaxed/simple;
	bh=04yRypIic3tMjSDgtkWNMlday7T9q7RLsqGwHo9AqXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KHR35ksqRVWETtwWol+Mz+EzQPtebFCFMDFm0rsJri1onOoBqyFGTMHxp4yad+brv+T512ZYIgVg42PTRxk61D399lrAFbocvHbSeddHb+T2AVEbxWyx2wb0gqGid9iRi/Mr4mJQ9To4E1BOcXUieTcQN5VlB56lVpXE3wShymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BI/9cD7P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BI/9cD7P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71CA1F000E9;
	Thu, 30 Jul 2026 22:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785452239;
	bh=hOx53i9I4pikbrlM/FXtKvP7n7XH3U1JMpKqRd0ce7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BI/9cD7PUoPhpX18clNdnBGpGEWZxg8fO1La6yfZ4XkupVd1EgiDWEKHvIzX/opCF
	 DnJZbod4ir9tEruK3CQZ2xzJ8+iv089klGYHnn4tPDfqWYkefuCt/8VKdPWz8SFW5R
	 lRgk/bWDnpq18csf+hxHVsSqx8Y8jqXMKKwuKNVvKbrH5oiXYpC+1LVkZEzU5gPQeM
	 S8P5NrCCtrofTKiRbEKj2QiF9RHejZLqkc9YRv1rii4qW8kQV0yjlEkapUqSyH8OHB
	 50uXsJOhjpFoCTZ4uI11JvFQT+VL3VPmi00VXsG1LurH44mp/ZfFB5AhQ/ugRE3vDt
	 ucxQbQ8ScGp2Q==
Message-ID: <9eb319b1-22e7-499d-9ae0-5ee3c8480f9d@kernel.org>
Date: Thu, 30 Jul 2026 23:57:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] ASoC: qdsp6: q6routing: add lpi mi2s support
To: Richard Acayan <mailingradian@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
 Adam Skladowski <a39.skl@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-10-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260730174353.108023-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/30/26 6:43 PM, Richard Acayan wrote:
> Add the ASM-AFE routing for LPI MI2S ports which represent internal MI2S
> ports on SDM660.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/qdsp6/q6routing.c | 78 +++++++++++++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index 7386226046fa..d076c99f197f 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -127,7 +127,14 @@
>  	{ mix_name, "TX_CODEC_DMA_TX_2", "TX_CODEC_DMA_TX_2"},	\
>  	{ mix_name, "TX_CODEC_DMA_TX_3", "TX_CODEC_DMA_TX_3"},	\
>  	{ mix_name, "TX_CODEC_DMA_TX_4", "TX_CODEC_DMA_TX_4"},	\
> -	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"}
> +	{ mix_name, "TX_CODEC_DMA_TX_5", "TX_CODEC_DMA_TX_5"},	\
> +	{ mix_name, "LPI_MI2S_TX_0", "LPI_MI2S_TX_0" },		\
> +	{ mix_name, "LPI_MI2S_TX_1", "LPI_MI2S_TX_1" },		\
> +	{ mix_name, "LPI_MI2S_TX_2", "LPI_MI2S_TX_2" },		\
> +	{ mix_name, "LPI_MI2S_TX_3", "LPI_MI2S_TX_3" },		\
> +	{ mix_name, "LPI_MI2S_TX_4", "LPI_MI2S_TX_4" },		\
> +	{ mix_name, "LPI_MI2S_TX_5", "LPI_MI2S_TX_5" },		\
> +	{ mix_name, "LPI_MI2S_TX_6", "LPI_MI2S_TX_6" }
>  
>  #define Q6ROUTING_TX_MIXERS(id)						\
>  	SOC_SINGLE_EXT("PRI_MI2S_TX", PRIMARY_MI2S_TX,			\
> @@ -320,6 +327,27 @@
>  		id, 1, 0, msm_routing_get_audio_mixer,			\
>  		msm_routing_put_audio_mixer),				\
>  	SOC_SINGLE_EXT("TX_CODEC_DMA_TX_5", TX_CODEC_DMA_TX_5,		\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("LPI_MI2S_TX_0", LPI_MI2S_TX_0,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("LPI_MI2S_TX_1", LPI_MI2S_TX_1,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("LPI_MI2S_TX_2", LPI_MI2S_TX_2,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("LPI_MI2S_TX_3", LPI_MI2S_TX_3,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("LPI_MI2S_TX_4", LPI_MI2S_TX_4,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("LPI_MI2S_TX_5", LPI_MI2S_TX_5,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("LPI_MI2S_TX_6", LPI_MI2S_TX_6,			\
>  		id, 1, 0, msm_routing_get_audio_mixer,			\
>  		msm_routing_put_audio_mixer),
>  
> @@ -709,6 +737,26 @@ static const struct snd_kcontrol_new rxcodec_dma_rx_6_mixer_controls[] = {
>  static const struct snd_kcontrol_new rx_codec_dma_rx_7_mixer_controls[] = {
>  	Q6ROUTING_RX_MIXERS(RX_CODEC_DMA_RX_7) };
>  
> +static const struct snd_kcontrol_new lpi_mi2s_rx_0_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_0) };
> +
> +static const struct snd_kcontrol_new lpi_mi2s_rx_1_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_1) };
> +
> +static const struct snd_kcontrol_new lpi_mi2s_rx_2_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_2) };
> +
> +static const struct snd_kcontrol_new lpi_mi2s_rx_3_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_3) };
> +
> +static const struct snd_kcontrol_new lpi_mi2s_rx_4_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_4) };
> +
> +static const struct snd_kcontrol_new lpi_mi2s_rx_5_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_5) };
> +
> +static const struct snd_kcontrol_new lpi_mi2s_rx_6_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(LPI_MI2S_RX_6) };
>  
>  static const struct snd_kcontrol_new mmul1_mixer_controls[] = {
>  	Q6ROUTING_TX_MIXERS(MSM_FRONTEND_DAI_MULTIMEDIA1) };
> @@ -938,6 +986,27 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>  	SND_SOC_DAPM_MIXER("USB_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>  			   usb_rx_mixer_controls,
>  			   ARRAY_SIZE(usb_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
> +		lpi_mi2s_rx_0_mixer_controls,
> +		ARRAY_SIZE(lpi_mi2s_rx_0_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_1 Audio Mixer", SND_SOC_NOPM, 0, 0,
> +		lpi_mi2s_rx_1_mixer_controls,
> +		ARRAY_SIZE(lpi_mi2s_rx_1_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_2 Audio Mixer", SND_SOC_NOPM, 0, 0,
> +		lpi_mi2s_rx_2_mixer_controls,
> +		ARRAY_SIZE(lpi_mi2s_rx_2_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_3 Audio Mixer", SND_SOC_NOPM, 0, 0,
> +		lpi_mi2s_rx_3_mixer_controls,
> +		ARRAY_SIZE(lpi_mi2s_rx_3_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_4 Audio Mixer", SND_SOC_NOPM, 0, 0,
> +		lpi_mi2s_rx_4_mixer_controls,
> +		ARRAY_SIZE(lpi_mi2s_rx_4_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_5 Audio Mixer", SND_SOC_NOPM, 0, 0,
> +		lpi_mi2s_rx_5_mixer_controls,
> +		ARRAY_SIZE(lpi_mi2s_rx_5_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("LPI_MI2S_RX_6 Audio Mixer", SND_SOC_NOPM, 0, 0,
> +		lpi_mi2s_rx_6_mixer_controls,
> +		ARRAY_SIZE(lpi_mi2s_rx_6_mixer_controls)),
>  	SND_SOC_DAPM_MIXER("MultiMedia1 Mixer", SND_SOC_NOPM, 0, 0,
>  		mmul1_mixer_controls, ARRAY_SIZE(mmul1_mixer_controls)),
>  	SND_SOC_DAPM_MIXER("MultiMedia2 Mixer", SND_SOC_NOPM, 0, 0,
> @@ -1031,6 +1100,13 @@ static const struct snd_soc_dapm_route intercon[] = {
>  	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_6 Audio Mixer", "RX_CODEC_DMA_RX_6"),
>  	Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_7 Audio Mixer", "RX_CODEC_DMA_RX_7"),
>  	Q6ROUTING_RX_DAPM_ROUTE("USB_RX Audio Mixer", "USB_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_0 Audio Mixer", "LPI_MI2S_RX_0"),
> +	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_1 Audio Mixer", "LPI_MI2S_RX_1"),
> +	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_2 Audio Mixer", "LPI_MI2S_RX_2"),
> +	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_3 Audio Mixer", "LPI_MI2S_RX_3"),
> +	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_4 Audio Mixer", "LPI_MI2S_RX_4"),
> +	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_5 Audio Mixer", "LPI_MI2S_RX_5"),
> +	Q6ROUTING_RX_DAPM_ROUTE("LPI_MI2S_RX_6 Audio Mixer", "LPI_MI2S_RX_6"),
>  	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia1 Mixer"),
>  	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia2 Mixer"),
>  	Q6ROUTING_TX_DAPM_ROUTE("MultiMedia3 Mixer"),

