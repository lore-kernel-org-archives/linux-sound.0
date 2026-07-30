Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC0C3B7B76;
	Thu, 30 Jul 2026 22:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785451794; cv=none; b=Q0vkjAe4qkgYqrn8y8cch0suZOW4nrV88xNEzeIs8c3jpVuv3c2PNJz/8nDvtR7U8SCcnihh/pcAOH34+PNLljIvN5cs1PspzDRO+S3rBzqn60XAmHohEVRWW5Oo9k+EqhuXEwwcXy0hlOOs0yM6eF/Zv6be6cL1rFor1iHuXmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785451794; c=relaxed/simple;
	bh=PTHD2EIFL6L3fxpsX+fHxZGgeHkQlXah541cDfDPNdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pnRZEkX47qoijdGKwSIUG7yBStjXhUEkQeL9oE6J8cHSNY5s71Jm3QV/3JK/gKmgy/lMyQUvxX/pbrKlHgOD13cQr+56nAJKZj5GgBC04pn16fVAc6rD7VWO9xXIcSWi0u8Wd02iKZN9D5m915AGwZOb9CAjkmaVMh0InuRNT+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nd5WrjY8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nd5WrjY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007681F000E9;
	Thu, 30 Jul 2026 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785451793;
	bh=y5+M8B6HuViIcfsnjkByyhH7wa6zj0sSQL3epy/oKtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nd5WrjY8/vJmcmG8c6sn3EZoNPcuF/0j5DD974qQBFICN+Nh1iFltUhS6WeCvJtI/
	 zavpEzgh3fuYnBnbzXsq+grf0K0htnw6sA3meehZttYUkpVoIdKw1uhJmxp/wEWXmD
	 k8eEbxB2prO+KGU9XCCpZrISJcbplR2UsWsXWRglTJf4gTIfwhIZGXLAQGuALQqJUJ
	 uIKWRz6Z8UNpDW10SCkzuxGSXeu2KNdNxZQ7oLeYPGS9MiMG3pxswPMBPUoBlpmaju
	 bY0leKuGChSSJncPDqZ04oSsiy911aJrjBHKMiT/AWSnYqSblGuf09GbKBlPT097RD
	 0GGoG3VqSk34g==
Message-ID: <754a4914-4371-4f4f-b41e-440c73f7fb6e@kernel.org>
Date: Thu, 30 Jul 2026 23:49:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add support for
 lpi mi2s ports 5-6
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
 <20260730174353.108023-7-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260730174353.108023-7-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/30/26 6:43 PM, Richard Acayan wrote:
> Add the extra LPI MI2S ports used for internal MI2S on SDM660.
> 
> Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/common.h                  | 2 +-
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
> index ee6662885593..48b114eb46a5 100644
> --- a/sound/soc/qcom/common.h
> +++ b/sound/soc/qcom/common.h
> @@ -7,7 +7,7 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <sound/soc.h>
>  
> -#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
> +#define LPASS_MAX_PORT			(LPI_MI2S_TX_6 + 1)
>  
>  int qcom_snd_parse_of(struct snd_soc_card *card);
>  int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> index e5cd82f77b55..c3d8116ad503 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> @@ -553,11 +553,15 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>  	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
>  	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
>  	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
> +	Q6AFE_MI2S_RX_DAI("LPI RX5", LPI_MI2S_RX_5),
> +	Q6AFE_MI2S_RX_DAI("LPI RX6", LPI_MI2S_RX_6),
>  	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
>  	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
>  	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
>  	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
>  	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
> +	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
> +	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),
>  	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
>  	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
>  	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
> @@ -712,6 +716,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> +		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
>  			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
>  			break;
>  		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:

