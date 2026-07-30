Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E083B6C1E;
	Thu, 30 Jul 2026 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785452119; cv=none; b=G0SIQQUhSTrrVTDcTC+sWSHeNf0CwoKzvthbp8ntehRKu8lghvkYGwHJHLzD4jqK3WT/57G5K2zcUtcmgvfA62Aj7/gc4Tpx14UOIIMUsDaDMB45MMYd0vSyUWX81J1PykEZOsZ0WsItn22K7itGb7QcEev6LdiYQldfTdfzT6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785452119; c=relaxed/simple;
	bh=9+dzL1lfdELc64z30DFpqf8koJ3+Few0YN/M+bKcERU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvjNy5NGTbBEzrYaoiMVV2IsJE63mKYeaEpSk4DIVvZnaRQfwBSZEkF8VttVvDnksFnv6CmRYhuLYB7v0L5CevtcQdq9Y14b/iLPQD6CbB/wYcLHvdZ2/b3cEM8Akw2GZEm1/1xrb0GslfwBz2T6mhWECjeBbK1/bF89NIPd7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jj0d29U4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jj0d29U4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7912E1F000E9;
	Thu, 30 Jul 2026 22:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785452118;
	bh=8n6EZsu6zxAP8hs+Er60xjQBLbhJq/AwGa+qOiGSm9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jj0d29U48RyU7uU6uFtekFtpZcNTVxIgH7/pml9vxIKxwE3F46aQcV0FGxijiaeq0
	 jlXAR7WJa6e78WcPlV0ZeOUp7IJZ+fZbIutoCVfUvxdkNuJeVE2FuTBshrbzQkk6Vs
	 yVvkEBhp181cjEVGf7A080RIK6d9bUJtbH0SsoSquFGJGs7eZXZDRg628FdGg4hFak
	 mlg91EOcuoGIRGRZ0d3yfdibc5wRLV0qbBd848WuirVSwCdtQAw4Mz9quB+8FTRsqQ
	 nMzz1pr4Akve3WjOZhu6oXSsC1mFE/XHxBjma9vcAA3eTa4ahB5KylE+FO+2DEQZDH
	 RBhp09GeL/wug==
Message-ID: <58fa6d76-b61f-4f8c-8b89-56fe103495ce@kernel.org>
Date: Thu, 30 Jul 2026 23:55:13 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s
 support
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
 <20260730174353.108023-9-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260730174353.108023-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/30/26 6:43 PM, Richard Acayan wrote:
> The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
> used for internal MI2S ports on q6afe. Add the internal MI2S ports found
> on the SDM660 internal sound card using the LPI MI2S bindings.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/qcom/qdsp6/q6afe-dai.c | 48 ++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index a0d21034a626..920345609d2c 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -412,6 +412,8 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
>  	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>  	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> +	case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
>  		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
>  			       &dai_data->port_config[dai->id].i2s_cfg);
>  		if (rc < 0) {
> @@ -665,6 +667,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
>  
>  	/* USB playback AFE port receives data for playback, hence use the RX port */
>  	{"USB Playback", NULL, "USB_RX"},
> +
> +	{"LPI RX0 MI2S Playback", NULL, "LPI_MI2S_RX_0"},
> +	{"LPI_MI2S_TX_0", NULL, "LPI TX0 MI2S Capture"},
> +	{"LPI RX1 MI2S Playback", NULL, "LPI_MI2S_RX_1"},
> +	{"LPI_MI2S_TX_1", NULL, "LPI TX1 MI2S Capture"},
> +	{"LPI RX2 MI2S Playback", NULL, "LPI_MI2S_RX_2"},
> +	{"LPI_MI2S_TX_2", NULL, "LPI TX2 MI2S Capture"},
> +	{"LPI RX3 MI2S Playback", NULL, "LPI_MI2S_RX_3"},
> +	{"LPI_MI2S_TX_3", NULL, "LPI TX3 MI2S Capture"},
> +	{"LPI RX4 MI2S Playback", NULL, "LPI_MI2S_RX_4"},
> +	{"LPI_MI2S_TX_4", NULL, "LPI TX4 MI2S Capture"},
> +	{"LPI RX5 MI2S Playback", NULL, "LPI_MI2S_RX_5"},
> +	{"LPI_MI2S_TX_5", NULL, "LPI TX5 MI2S Capture"},
> +	{"LPI RX6 MI2S Playback", NULL, "LPI_MI2S_RX_6"},
> +	{"LPI_MI2S_TX_6", NULL, "LPI TX6 MI2S Capture"},
>  };
>  
>  static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
> @@ -1011,6 +1028,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
>  		0, SND_SOC_NOPM, 0, 0),
>  
>  	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
> +
> +	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_0", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_0", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_1", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_1", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_2", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_2", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_3", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_3", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_4", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_4", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_5", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_5", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("LPI_MI2S_RX_6", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_OUT("LPI_MI2S_TX_6", NULL,
> +		0, SND_SOC_NOPM, 0, 0),
>  };
>  
>  static const struct snd_soc_component_driver q6afe_dai_component = {
> @@ -1045,6 +1091,8 @@ static void of_q6afe_parse_dai_data(struct device *dev,
>  		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> +		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
>  			priv = &data->priv[id];
>  			ret = of_property_read_variable_u32_array(node,
>  							"qcom,sd-lines",

