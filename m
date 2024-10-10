Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7CD1E231A
	for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 19:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728589217; cv=none; b=g2XM6hb8lY44n4QyGN4Wka3/CFwMJuGNFUXXgmPA1UdOsX/lglgWCgX/6MPtWf/yQZcZHOy0c2AJHUdEM9JJN7GQbuL/aMuLRlBqgRCK74IMdG3iJgczCu5kEoS45/DTZ+fbTnJ/opMqe2Q2W01g3OI3pcPiqohkfJ2SsUdr1l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728589217; c=relaxed/simple;
	bh=Hye3nDw1jtttwUJ61jl/l6DlLdBPK7kOiF/J4KWyD9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQVlDAuvksqeVPYw1jxRzpDFwA8RzhmtPQ05nBO6aZH8Zc7GRsce9XycLLY+6euXMFmx93qIMcgNBdXsQiSSbXpk4sPQoqGTGUJF3IGMZa/g41nW57CKHkpu6YU+UQkBmO8uN3g5bWqQtlo8LPE9YqdtdI0bm/DktHximSWYf5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WOre5BX3; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WOre5BX3"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5e800d4e462so789080eaf.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Oct 2024 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728589214; x=1729194014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/u7TPy5BjZaLYfGD4gZfyIHgo+2O/eJCYK+pY/z7ufQ=;
        b=WOre5BX3Di+fnG+00STkOp/wdHfEQazyrCJwW4LjY2nTXkSojCe1Hn5LopaO+MkOVt
         75cxJARXLi1EhT1BUhHH2w64OxwzUA3rjLvWhZgdMAQwUZYegbzOtoMHT1NnA8eg657u
         Um0QieeBlZ5HfrXulOAG5sMZtQ0CwDhefP7SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589214; x=1729194014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/u7TPy5BjZaLYfGD4gZfyIHgo+2O/eJCYK+pY/z7ufQ=;
        b=Fd/2pIq2+QuVv6+wdvku5atoBwAjTBohM0lJXq5YazBhXgbmECOjTm9wZIdTYXhekG
         7RXRcAbIr+u0yBiz0v4/7TbdUHt7AC4qyTYhpufM3eECzU2Ar7qCW+UjaLBoYlFwwJNo
         UTkGGO0D/9JJYS2SMcDJTkHKCHp9vsQTmKUjCKXlWcSii62UkZZMR44/92O4piPxymEU
         UmnEICDTKE/CvSStn6e/vuc7uP5tiktBfysSQpp64MF+xeBrmt41rD9vrxqHHtr4W506
         ZoF4b9M5mwImaAV9gOMhnSKXsaV3mYN/9EcKEN1/S4tpUyVugeK4qNOJYKo+vNt9JYlF
         XXGA==
X-Gm-Message-State: AOJu0YwXWiSudDRRnaV9yD4ftmWgQ34J7R/nSZHgyn2KsNvBIIZ3KBbW
	XRs7qURbEyKLovU0qHRqlKIzYA9hyiBEs9820rW+dj+2GC5bkghfKi6w4+DPMrg=
X-Google-Smtp-Source: AGHT+IHlBobIPH5lVju0BNVN+E124W/gKsWFcN4eUt66eehOQvTq1gxcMAnYFl6zGQ+E3sp69IN1ng==
X-Received: by 2002:a05:6820:615:b0:5e7:c925:b05 with SMTP id 006d021491bc7-5e98ff49e48mr3664116eaf.2.1728589214486;
        Thu, 10 Oct 2024 12:40:14 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-717cfed5f6asm304143a34.10.2024.10.10.12.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 12:40:14 -0700 (PDT)
Message-ID: <5f174552-a21c-4b87-bc9b-59956edecf69@linuxfoundation.org>
Date: Thu, 10 Oct 2024 13:40:12 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt722-sdca: Remove logically deadcode in
 rt722-sdca.c
To: "Everest K.C." <everestkc@everestkc.com.np>, oder_chiou@realtek.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241010175017.5215-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241010175017.5215-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/24 11:50, Everest K.C. wrote:
> As the same condition was checked in inner and outer if statements.
> The code never reaches the inner else statement.
> Fix this by removing the logically dead inner else statement.
> 
> Fixes: 7f5d6036ca00 ("ASoC: rt722-sdca: Add RT722 SDCA driver")
> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
> Closes: https://lore.kernel.org/all/e44527e8-b7c6-4712-97a6-d54f02ad2dc9@linuxfoundation.org/
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
>   sound/soc/codecs/rt722-sdca.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
> index e5bd9ef812de..f9f7512ca360 100644
> --- a/sound/soc/codecs/rt722-sdca.c
> +++ b/sound/soc/codecs/rt722-sdca.c
> @@ -607,12 +607,8 @@ static int rt722_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
>   
>   		if (!adc_vol_flag) /* boost gain */
>   			ctl = regvalue / boost_step;
> -		else { /* ADC gain */
> -			if (adc_vol_flag)
> -				ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
> -			else
> -				ctl = p->max - (((0 - regvalue) & 0xffff) / interval_offset);
> -		}
> +		else /* ADC gain */
> +			ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
>   
>   		ucontrol->value.integer.value[i] = ctl;
>   	}

Thank you.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
