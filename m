Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B697713AC3
	for <linux-sound@vger.kernel.org>; Tue, 16 Jan 2024 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mxo/VPcv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e857ce803so4638645e9.0
        for <linux-sound@vger.kernel.org>; Tue, 16 Jan 2024 04:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705408389; x=1706013189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhwDIlaEEN6IPWd1oZ/unSnl3T485q1gaJvRsEwi2vU=;
        b=mxo/VPcv9Ze9RQggQ9I99Ox+u2jh/Jye1O9yGDmvkEWHU9UNuo4QH5EKwX89DKmxLW
         ZFDuwEGTz1iJiCx3ODv6oeaD4G7unkZkG86hrdHNOCm6FJ/jtJn8qHO2kshWjNcQxueI
         9QMOuLOKqjptvFSpN1YgHLd54PYmW09W85OVs72ta7pV2SPkExBUKA6UsQ+Q7o9k1d+K
         hdwB420AuiYlwNpjcgswD9jNX6zFYWX/M+xL60Whx4gNuPNYulWsjHo/kRJN89PTyYEL
         CrPX3pbuIB6gPWQZ5sbveL3KBqC6XEgV+8JmhrJzykDTM1LpvSfVwhNpGGwZIhDEsmQp
         DTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705408389; x=1706013189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhwDIlaEEN6IPWd1oZ/unSnl3T485q1gaJvRsEwi2vU=;
        b=eixdD0Wrn7MZcp3H0mORwDUID151Zb97Rv1XpJgOyXqnjjDy6hDSr96W5OsBCyjUGd
         JY5Bh6Lz6tjTQ01Q8WzjH2173qb1+HptgYyX/4CSeKmR+wQLQygShVdJP0rJtsVwJAZ1
         vzYFheMmcMBhShJ+n6wooXmxU9e2zD2qVZUd7Nqwi1BiA0z/Vn0aCOTG+blqcafLkHcb
         6bRr5HsxfbR7g5u+8ce7Y8Gr6tNEJyaE6pVknw/NbssX4OpYIEOfNaG7k/E1QxH3ln/X
         MQOswuYqhnagipdAfl04l1kO3IfK6k7uYf4QzNWSbMQTtSs9jC/zQdPfFkg1MK2Ifd4j
         DBeA==
X-Gm-Message-State: AOJu0YxSzxb4U+x3U127aeb2RClbrAgKucrab13Xj0DiRSTQ2KrDuS18
	uHBcd6SrgTPOmi+YvTDeB5xkYxwzJeSkDDBrvE/x8alS/k0=
X-Google-Smtp-Source: AGHT+IFgwZ7izOeDPTthu6pYyW2p4PI/uPvVFhtOSZUOvCWzjb3MxbacVOYISzw2xSeZlOWjyex6jA==
X-Received: by 2002:a05:600c:45d0:b0:40e:6ee8:c13e with SMTP id s16-20020a05600c45d000b0040e6ee8c13emr2391947wmo.197.1705408388946;
        Tue, 16 Jan 2024 04:33:08 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p12-20020a05600c430c00b0040e596320bfsm6855662wme.0.2024.01.16.04.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 04:33:08 -0800 (PST)
Message-ID: <dda000cb-9d3d-40d8-9a6c-170d491f48f1@linaro.org>
Date: Tue, 16 Jan 2024 12:33:07 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ASoC: codecs: msm8916-wcd-digital: drop dead gain
 hacks
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240116093903.19403-1-johan+linaro@kernel.org>
 <20240116093903.19403-8-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240116093903.19403-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,

did you see any issue with this codec?

These are not really hacks, to make the gains effective it has to be 
applied in a particular order.


On 16/01/2024 09:39, Johan Hovold wrote:
> -		/* apply the digital gain after the interpolator is enabled */

As you noticed in the comments, the gains have to be reprogrammed after 
interpolator and its clks are enabled.


> -		usleep_range(10000, 10100);
> -		snd_soc_component_write(component, rx_gain_reg[w->shift],
> -			      snd_soc_component_read(component, rx_gain_reg[w->shift]));
> -		break;
>   	case SND_SOC_DAPM_POST_PMD:
>   		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
>   					      1 << w->shift, 1 << w->shift);
> @@ -630,9 +613,6 @@ static int msm8916_wcd_digital_enable_dec(struct snd_soc_dapm_widget *w,
>   		snd_soc_component_update_bits(component, tx_mux_ctl_reg,
>   				    TX_MUX_CTL_HPF_BP_SEL_MASK,
>   				    TX_MUX_CTL_HPF_BP_SEL_NO_BYPASS);
> -		/* apply the digital gain after the decimator is enabled */
same here.

> -		snd_soc_component_write(component, tx_gain_reg[w->shift],
> -			      snd_soc_component_read(component, tx_gain_reg[w->shift]));
