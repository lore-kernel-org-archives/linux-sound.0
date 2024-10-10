Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980781CC16C
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728572940; cv=none; b=D/rFpehYGxY6l0QFSw+lA+Vzm5DuQl+Vj8bttwVBf29ceDSpoVOFfjtqzqFwYEVbkU8TiMY3CzMe9zZ3s0l8JhrbQwB/opGW6Old1M0xR959konVMVrUbepzMq741CPLSEOVnFBEPvMrITwKj6YG9LG65Add7IxFdcmu0Mo/6kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728572940; c=relaxed/simple;
	bh=re8B3h/H8vFcHw1pRsstqY/4kJcouThAZOKm6C5wvDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1fyzvwohBXQaiOPTMxYvHoiTROqyHAVZLcG+2NaXQyDzRRjlG2NZewJDeQQRfZyHBRhEG3K1Q1nEBd3ObDFk+Y+JtneHuQCKkcjCSsCfDIj6T39nLwEEgcUKFOoniVGTgMx3eddYJt2W9ZBweuL93mnh2tUwhC66MqAAjWwFds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ux03A54M; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ux03A54M"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a367da1f8cso3951635ab.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728572937; x=1729177737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1OeAK/S0DDD0sB2cslV1aKUTfEhLWliOpkHnue8Kakw=;
        b=Ux03A54MufDQlntI2F9Rdo9s/4tWYJATjI6Tw9wNtxzwy4BALWMusSNp59FvUpnBLQ
         2X0kHv6ZWVCFxEfioDg55gbA1+WA/+6F9l0PjY252HLB5eTeMRBwZFtqeHFqmji/O9Mg
         PCg0QmFRZ5VAoXXm9vnSWzxBkbzzKsKwHurTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728572937; x=1729177737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OeAK/S0DDD0sB2cslV1aKUTfEhLWliOpkHnue8Kakw=;
        b=O+/V8vR3H8je/Rol5HWcKz+LeTc/qq4p+4OwogFu97b5iH46XqIIZUL3EZFLtgCY5t
         2yEO3ev+FUEX4ib8814YSHaAabqGvLgSuawCMXwF4qpY/HJNgpRx8iW2ky1oQZXBiDzu
         EKJk+UDBd7Co/XFHrjrBU1wh4HkWtlXNNBAc/udMOl5Z2hEgyUcvNdW3c/7KjmIw7aV8
         Kwp/6dKVvl3D5l6Y6B+sePNmYiHG+E+KOiyfvOKYD/kSkQWnDLCDmSELpxhUuZywBLbh
         h8ez3NeTETVoRQtqeB4y/1fqB2LVSLg311RnA5wUSWdS0C3X4gvwkcq+8Cb/PSBpLcQ/
         28MA==
X-Gm-Message-State: AOJu0YxrI72ZQleMk4M97RBdyZcd1jonAA+ZmHEofMOeOZafx7O9KeFP
	sevbdpbCv6xqzWoXgVqwW44CcBh3T1KxpcDZKFPrV97QuHFtMSJYFyA+QA7lvJI=
X-Google-Smtp-Source: AGHT+IF/YFch+FuI6hF1QYufR1Nw3E8maa4x6ZomIfSTsL5GK4U6VyY878xnwVPnu1VbxY9IMgvlNQ==
X-Received: by 2002:a05:6e02:1445:b0:3a0:985b:ddb4 with SMTP id e9e14a558f8ab-3a397cd8b87mr55731195ab.2.1728572936492;
        Thu, 10 Oct 2024 08:08:56 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a3afdb3444sm3040575ab.34.2024.10.10.08.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:08:55 -0700 (PDT)
Message-ID: <e44527e8-b7c6-4712-97a6-d54f02ad2dc9@linuxfoundation.org>
Date: Thu, 10 Oct 2024 09:08:54 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next V2] ASoC: rt721-sdca: Clean logically deadcode in
 rt721-sdca.c
To: "Everest K.C." <everestkc@everestkc.com.np>, oder_chiou@realtek.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241008234422.5274-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241008234422.5274-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/24 17:44, Everest K.C. wrote:
> As the same condition was checked in inner and outer if
> statements. The code never reaches the inner else statement.
> 
> This issue was reported by Coverity Scan with CID = 1600271.
> 
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
> V1 -> V2: - Updated the patch prefix to PATCH-next
> 	  - Added how the issue was discovered
> 
>   sound/soc/codecs/rt721-sdca.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
> index 36056cb7a3ca..4fd26e490610 100644
> --- a/sound/soc/codecs/rt721-sdca.c
> +++ b/sound/soc/codecs/rt721-sdca.c
> @@ -611,13 +611,9 @@ static int rt721_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
>   
>   		if (!adc_vol_flag) /* boost gain */
>   			ctl = regvalue / boost_step;
> -		else { /* ADC gain */
> -			if (adc_vol_flag)
> -				ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
> -			else
> -				ctl = p->max - (((0 - regvalue) & 0xffff) / interval_offset);
> -		}
> -
> +		else /* ADC gain */
> +			ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
> +
>   		ucontrol->value.integer.value[i] = ctl;
>   	}
>   


Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

As mentioned in my review for v1 of this patch, the exact same problem
exists in sound/soc/codecs/rt722-sdca.c as well, in case you want to send
patch to fix that one.

thanks,
-- Shuah
