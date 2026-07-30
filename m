Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DEC3A83BF;
	Thu, 30 Jul 2026 22:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785451922; cv=none; b=izgnVIWGu1siX+WRTX0MG7XFmR6P3t1fORDZFofwc1M7RGgwbpy5kQ3aW+v0DgT3MF/8g5Qd3vwDUC0jgiZ+yHdnzt5R9ZvDSWbhPqk3HYnK6AoqH9+daTjuP7OjdWZPNhtY5VkqQH+2ZSR0Ahn8iYe5gNP9Xm8ve/IO5yTg6ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785451922; c=relaxed/simple;
	bh=TYRbN4fFLN3mtfgwIfEq5/qI5/6LEyAMIn4WFIux+O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkJTbUivKpINkRyDbyt1F8uqsjna9D8a9E+ZqGnA4W/oDBDlUw4/HaoeMQWTb4fBIl+4zfuKV8s2EOT4nNzo90YXpoL+bcD10ZLbH6HHk4VkYM6PkPsQ2BDD+22rUP86kmH4Idym69qcBUVt6uXA0hT3ERZTNxFrC4G57PYv/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvBQJfUk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvBQJfUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BBA1F000E9;
	Thu, 30 Jul 2026 22:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785451920;
	bh=QZLKsuWseBiTqeWD2kxHNjOltfDm4lmKoUuAbHhZzbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DvBQJfUkAEGNO0vdhaHDgPgWdzeuKA59S1dNafNlHAFIkRxMC1iuc5synK8W5HXQq
	 bjEx5VOvB+zBZ/1aG1qC+cwAAAR6k2IXotDQhIwplnhP28Z/R6iuidkEE3IRfewD2p
	 yByqxOqBS+wabtGxfeBd8BdoOnCHrnyCC8diNvnSUJ4RSQrPvuEhwVW7Lv2+/8zDGZ
	 5uKlGduWd/IxEPJvliTYlE8dxaQ+fuipLTx4kjPqpn916NT/2ddHyIZWLKQ9qv64Ch
	 OsGsxutp1FqU8i0m47HBSL2UhuRYo+lZb04V0zCIJn6uN8AtL7AQ9Ir9rRe5x4sPgh
	 /bg9BkL9dL0/w==
Message-ID: <27f61470-349a-4166-aac9-64f33f1b9dc7@kernel.org>
Date: Thu, 30 Jul 2026 23:51:55 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] ASoC: qdsp6: q6afe: add internal mi2s support
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
 <20260730174353.108023-8-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260730174353.108023-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/30/26 6:43 PM, Richard Acayan wrote:
> The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
> used for internal MI2S ports on q6afe. Add the port mappings for
> internal MI2S, found on the Snapdragon 660 internal sound card.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/qcom/qdsp6/q6afe.c | 56 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 40237267fda0..1d68a80e8e0c 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -132,6 +132,20 @@
>  #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
>  #define AFE_PORT_ID_SENARY_MI2S_RX          0x1018
>  #define AFE_PORT_ID_SENARY_MI2S_TX          0x1019
> +#define AFE_PORT_ID_INT0_MI2S_RX	    0x102e
> +#define AFE_PORT_ID_INT0_MI2S_TX	    0x102f
> +#define AFE_PORT_ID_INT1_MI2S_RX	    0x1030
> +#define AFE_PORT_ID_INT1_MI2S_TX	    0x1031
> +#define AFE_PORT_ID_INT2_MI2S_RX	    0x1032
> +#define AFE_PORT_ID_INT2_MI2S_TX	    0x1033
> +#define AFE_PORT_ID_INT3_MI2S_RX	    0x1034
> +#define AFE_PORT_ID_INT3_MI2S_TX	    0x1035
> +#define AFE_PORT_ID_INT4_MI2S_RX	    0x1036
> +#define AFE_PORT_ID_INT4_MI2S_TX	    0x1037
> +#define AFE_PORT_ID_INT5_MI2S_RX	    0x1038
> +#define AFE_PORT_ID_INT5_MI2S_TX	    0x1039
> +#define AFE_PORT_ID_INT6_MI2S_RX	    0x103a
> +#define AFE_PORT_ID_INT6_MI2S_TX	    0x103b
>  
>  /* Start of the range of port IDs for TDM devices. */
>  #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
> @@ -931,6 +945,34 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
>  	[RX_CODEC_DMA_RX_7] = { AFE_PORT_ID_RX_CODEC_DMA_RX_7,
>  				RX_CODEC_DMA_RX_7, 1, 1},
>  	[USB_RX] = { AFE_PORT_ID_USB_RX, USB_RX, 1, 1},
> +	[LPI_MI2S_RX_0] = { AFE_PORT_ID_INT0_MI2S_RX,
> +				LPI_MI2S_RX_0, 1, 1},
> +	[LPI_MI2S_TX_0] = { AFE_PORT_ID_INT0_MI2S_TX,
> +				LPI_MI2S_TX_0, 0, 1},
> +	[LPI_MI2S_RX_1] = { AFE_PORT_ID_INT1_MI2S_RX,
> +				LPI_MI2S_RX_1, 1, 1},
> +	[LPI_MI2S_TX_1] = { AFE_PORT_ID_INT1_MI2S_TX,
> +				LPI_MI2S_TX_1, 0, 1},
> +	[LPI_MI2S_RX_2] = { AFE_PORT_ID_INT2_MI2S_RX,
> +				LPI_MI2S_RX_2, 1, 1},
> +	[LPI_MI2S_TX_2] = { AFE_PORT_ID_INT2_MI2S_TX,
> +				LPI_MI2S_TX_2, 0, 1},
> +	[LPI_MI2S_RX_3] = { AFE_PORT_ID_INT3_MI2S_RX,
> +				LPI_MI2S_RX_3, 1, 1},
> +	[LPI_MI2S_TX_3] = { AFE_PORT_ID_INT3_MI2S_TX,
> +				LPI_MI2S_TX_3, 0, 1},
> +	[LPI_MI2S_RX_4] = { AFE_PORT_ID_INT4_MI2S_RX,
> +				LPI_MI2S_RX_4, 1, 1},
> +	[LPI_MI2S_TX_4] = { AFE_PORT_ID_INT4_MI2S_TX,
> +				LPI_MI2S_TX_4, 0, 1},
> +	[LPI_MI2S_RX_5] = { AFE_PORT_ID_INT5_MI2S_RX,
> +				LPI_MI2S_RX_5, 1, 1},
> +	[LPI_MI2S_TX_5] = { AFE_PORT_ID_INT5_MI2S_TX,
> +				LPI_MI2S_TX_5, 0, 1},
> +	[LPI_MI2S_RX_6] = { AFE_PORT_ID_INT6_MI2S_RX,
> +				LPI_MI2S_RX_6, 1, 1},
> +	[LPI_MI2S_TX_6] = { AFE_PORT_ID_INT6_MI2S_TX,
> +				LPI_MI2S_TX_6, 0, 1},
>  };
>  
>  static void q6afe_port_free(struct kref *ref)
> @@ -1785,6 +1827,20 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
>  	case AFE_PORT_ID_QUINARY_MI2S_TX:
>  	case AFE_PORT_ID_SENARY_MI2S_RX:
>  	case AFE_PORT_ID_SENARY_MI2S_TX:
> +	case AFE_PORT_ID_INT0_MI2S_RX:
> +	case AFE_PORT_ID_INT0_MI2S_TX:
> +	case AFE_PORT_ID_INT1_MI2S_RX:
> +	case AFE_PORT_ID_INT1_MI2S_TX:
> +	case AFE_PORT_ID_INT2_MI2S_RX:
> +	case AFE_PORT_ID_INT2_MI2S_TX:
> +	case AFE_PORT_ID_INT3_MI2S_RX:
> +	case AFE_PORT_ID_INT3_MI2S_TX:
> +	case AFE_PORT_ID_INT4_MI2S_RX:
> +	case AFE_PORT_ID_INT4_MI2S_TX:
> +	case AFE_PORT_ID_INT5_MI2S_RX:
> +	case AFE_PORT_ID_INT5_MI2S_TX:
> +	case AFE_PORT_ID_INT6_MI2S_RX:
> +	case AFE_PORT_ID_INT6_MI2S_TX:
>  		cfg_type = AFE_PARAM_ID_I2S_CONFIG;
>  		break;
>  	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:

