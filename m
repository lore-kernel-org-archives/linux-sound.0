Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5pLd39D"
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70960CD
	for <linux-sound@vger.kernel.org>; Tue, 12 Dec 2023 03:47:39 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54c77e0835bso7926119a12.2
        for <linux-sound@vger.kernel.org>; Tue, 12 Dec 2023 03:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702381658; x=1702986458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeJt1SlvJ2BjVo+T8o9WuujZC5zAwSMZRcDz9J4jRUA=;
        b=t5pLd39D1tYIG6PWp0XUaG3NAnrL3dNKizMtgTSts6mOHbgFeGoax3xr8MCRgJ+Fz1
         /kosS3OAbOeHW4hCdBMn3C/6fL/o9DF8WDX7rFZauR5jgyotXsBGYdhSQHpTPE0b6u2B
         rfgv4t3ZnUSVffmeeYQV0CwTEWREzBA+kouKpwvboF5g2m2AzdhBni3E3gdvAA+Pv1TU
         5WecKjPjKKaUE7RrMcAziZkJ4dRinErJhN1MVV5Ob/u0VTFTpz8rnQsT4TDPh3+9pTAr
         8BMxC5s4+wv964lI4k1j238HzUka9/b6YtOUMvS9c1kGWasaDuJILxBXSHq1DYfidFH3
         DbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702381658; x=1702986458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeJt1SlvJ2BjVo+T8o9WuujZC5zAwSMZRcDz9J4jRUA=;
        b=o6eoJYCWH9BBx/eG00rVWTuZT6YgRB7pdA4OClk3+gB6CVBKIlF2vK5Hp2Nw3eKMvB
         9JPCz8bsOTeO/KtoZjSiVSaBKch3SGO1Gh1TthP+jhLDVaYczJB/JW50ij699PdaM5c9
         6v/J6Q3DaQv0PkOLgXMXycXbdZbJH+tglc4Y1OyG+4C/Y72D7TuUcnqpMlFWCvm98gzW
         bFyk7n1F9br7aU2cLTjqpKVl54Yiryhtt/pqhCGBQvn6xGDjbQBQT6RZypIErY5/OtjA
         JHGgHcDWEIdzUQsMYN2+aVnDEP/f1RlAX1jeWP1l1fCZOH8LZTJETVH7+Da2NnO9UIJX
         SO1g==
X-Gm-Message-State: AOJu0Yw+UBnNSWLFK9Iwp3YSDWCKCvEzlQ4yCVNF5dwyPkNy0hyxKP79
	CgDtE/TYlH9Xm3nUD+qmAHAl9Q==
X-Google-Smtp-Source: AGHT+IFjELsRWgldVYuEXuwAZ8zX+ftLOkWb54t7FJjL6MAEhFL8aAHQRMir0ZoV8uzFjZ7aN4mCxw==
X-Received: by 2002:aa7:cc86:0:b0:54c:c464:5b5 with SMTP id p6-20020aa7cc86000000b0054cc46405b5mr3354740edt.46.1702381657928;
        Tue, 12 Dec 2023 03:47:37 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id k13-20020a50cb8d000000b0054cc7a4dc4csm4521908edi.13.2023.12.12.03.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 03:47:37 -0800 (PST)
Message-ID: <c43c4303-ed59-49e7-940a-62df6ad1b575@linaro.org>
Date: Tue, 12 Dec 2023 11:47:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC, PATCH v2 1/2] ASoC: qcom: sdw: Add TDM support
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231212095850.26482-1-lujianhua000@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231212095850.26482-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thankyou for the patch,


On 12/12/2023 09:58, Jianhua Lu wrote:
> Add qcom TDM setup function to support TDM ports for qcom platform.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>    1. remove EXPORT_SYMBOL_GPL
>    2. remove static modifier
> 
>   sound/soc/qcom/sdw.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 77dbe0c28b29..948abbd2e0e3 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
> @@ -4,6 +4,7 @@
>   
>   #include <dt-bindings/sound/qcom,q6afe.h>
>   #include <linux/module.h>
> +#include <sound/pcm_params.h>
>   #include <sound/soc.h>
>   #include "sdw.h"
>   
> @@ -101,6 +102,65 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
>   }
>   EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
>   
> +int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params)
> +{

TBH, this should not be part of sdw.c file, its intended for more of 
soundwire specific helpers, pl consider moving this to common.c for now.
Because, Not all old qcom platforms have soundwire controllers.

> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	unsigned int tdm_slot_offset[8] = { 0, 4, 8, 12, 16, 20, 24, 28 };
> +	int channels, slot_width;
> +	int ret;
> +
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		slot_width = 16;
> +		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		slot_width = 24;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		slot_width = 32;
> +		break;
> +	default:
> +		dev_err(rtd->dev, "%s: invalid param format 0x%x\n", __func__,
> +			params_format(params));
> +		return -EINVAL;
> +	}
> +
> +	channels = params_channels(params);
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3, 8, slot_width);

slot mask is always set to 2 channels in this case, should you not check 
the number of channels to determine the correct one?


These magic number 0, 0x3, 8 seems to make the code unreadable, can you 
do something like this:
snd_soc_dai_set_tdm_slot(cpu_dai, tx_mask, rx_mask, 
ARRAY_SIZE(tdm_slot_offset), slot_width);


> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
> +				__func__, ret);
> +			return ret;
> +		}
> +
> +		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL, channels,
> +						  tdm_slot_offset);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
> +				__func__, ret);
> +			return ret;
> +		}
> +	} else {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0, 8, slot_width);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
> +				__func__, ret);
> +			return ret;
> +		}
> +
> +		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
> +						  tdm_slot_offset, 0, NULL);
> +		if (ret < 0) {
> +			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
> +				__func__, ret);
> +			return ret;
> +		}
> +	}
Finally  ./sound/soc/qcom/sdm845.c does have exactly same code, can you 
consider removing this and make use of this new helper in that file too.


> +}
> +
>   int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
>   			   struct snd_pcm_hw_params *params,
>   			   struct sdw_stream_runtime **psruntime)
> @@ -125,6 +185,9 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
>   				*psruntime = sruntime;
>   		}
>   		break;
> +	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
> +		qcom_snd_tdm_hw_params(substream, params);
> +		break;
>   	}
>   
>   	return 0;
