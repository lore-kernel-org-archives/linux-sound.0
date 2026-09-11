Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD53E49FD
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 02:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094159; cv=none; b=rHMWiXHZLUIF8EUYsLt6khhIEZf6EEvSgojtx6hC9DquPwvrUwAXmGUs9ItTw93EU8hi8yAsErjuIna78roi7wLDLtZofZJbU2Ws35eqNX0VfuttdGLNWzaQUMTCELuvpWTCOP86DiX2YTIxiFjKkOf6BichWX87oxx4gDBnDzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094159; c=relaxed/simple;
	bh=aGG9GySrHo3aT729lj4kupW+yah0H41IU1upRHxXT6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WSf38/y9WVV/taVNg51VEMTBgjj4Fn6EC60dTb19cpql4YgRG0votXKneotsiNVOxw2pKPnEaM+FujxKUPu3lTJozY6+mUsJuITvQHiQszK6TJw00PlgJxCipM/JvLIfJN5fyOj7nAPY+iBx28ETYAbElL6BA6Ph6s30nbDRpJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcaKzGCJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcaKzGCJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so3797565ad.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 19:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789094158; x=1789698958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBqtsP/CWLSVd4X3g+IUHWQOXUwsfrAeb1YA314853Q=;
        b=BcaKzGCJJxBVJi2N6/ZlOEwsq8mWT/aE2uun3ZPGK9qgJLCXH7kCzD6Ud0Zs/SDH/K
         p8E1s4NOb2r7KbPc1lbTlKQ7p4SvMAU8NCbehgb7FYRQPaDIr0V/dg6PDKu8atr3Sn8l
         ZfG0uuMXkHjGVI6zKQe9KJzQGJu8z0MHVSl1uN3JWqBTZfJmuk3MRSd2ipDDG+xOOSE1
         p2TDEB/W38zhN3VYPGVP8w5I99d1B4iWIHHMk8vEki/3KKABOoFxNiz/7JiiMuLlPV+t
         POcsPLQtbukQPg/KV+QGxCwDzUOP/dGp6h4Y6GIG+920prhCLDkxydRd02h2wUTN5BxJ
         tWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094158; x=1789698958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBqtsP/CWLSVd4X3g+IUHWQOXUwsfrAeb1YA314853Q=;
        b=PlvZSX9/9d0YDJnbgt57WW+tFrxltCr7N1H9DZJ5iQht1YDrNGp7H5E1MCzh2dOPeV
         DrSI3wrP7+hdRuzmooIJQS6yrxNIF20AhPHs4/JrtSO1uMDM64il53DQ1Gd8dRlIKz2u
         JYLmemvj+KhnfzCuvxzp3+YkQI/1kCaKTUOWt3BY/UnCWXwj7nHJDcAvq0Of5gS+eKPN
         5Y5Ha0sW/BYgK2OzyKP8Rt9/om5+894q4RQohmkRwotevO7xwfddcAza05r/iRkyRTtE
         GdtiGBqaPmejb1lG1xJhBrO/k0FLWeavWxfDEWbtAyEron3OKHmKldvniE9wOI/CJAFe
         Y7sg==
X-Forwarded-Encrypted: i=1; AKwUvBxV4D8mTap9bnoS0lst/bV9kIM2dnB1TMFUZYocko9pWtSg84jud+jCMtwe/OWXAHj5T9L04fwBor25NQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mDWcphHY3JVlMxng5qgnexfE/NWIgTt1sFDDzO76XifL2Qa8HC
	hrVx3q/odxPHW2fyuc5SGrxhxNVo+1RXOTptaU0368iEDjL4teL3S3GI
X-Gm-Gg: AYBFou3WZF4SFOaRP1LmXJRgy2BE70du4eod2pCNvwHL7p53uxe53YKx5ehE5wWP7rt
	5OEeP0IQFZnvIujOKnezvTCaF+7l9WByyd603S9s9muBP7ZerrFZ37Wp0VRL3EUMkeji8fzdB92
	QFccaMeisjvy5MW6S/Tz7pbIxmJBHBRfgzVmf58fU/qbjtEfKtfmAIr0xIG8llroKBJeBaPlv9M
	Tp0J5Lg35ZuEKpd2NxIAOw77W5poknHLz0HxxTxRicdqVdVLGUV2mYi3pkM7bzNvWvsRDHP0sbN
	a8qaM75NQ8LHLYWyci8ow/8ugBH65BHGlZGFTksfHlL5m0O1oWCr6gvhCharBsDbOZaXLtN1vpu
	YkqCY9M5tDfgz45RL0iUkaup0aSnhkm0M730V6i/bEylwiRH5RySDc4nA9u63/8J+ThIwaMMhDz
	b2ujG1ShAYNTEqVpyXORWfzEb4GWaeKy/mSxzXEGwRUKhWBLlyDYUTCZ0/mPND97Cy/ZU8ggP0D
	OLdssF8b2FFkZ2ZLXOk8PxlatBDOW75ax8=
X-Received: by 2002:a17:903:388c:b0:2d9:14e8:bcb7 with SMTP id d9443c01a7336-2dd0e8a213dmr85013585ad.3.1789094157678;
        Thu, 10 Sep 2026 19:35:57 -0700 (PDT)
Received: from [172.20.10.2] (114-137-148-9.emome-ip.hinet.net. [114.137.148.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6550bbasm397520a12.17.2026.09.10.19.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 19:35:56 -0700 (PDT)
Message-ID: <cc7de691-0b64-462d-9fba-9d8ed000a222@gmail.com>
Date: Fri, 11 Sep 2026 10:33:39 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
To: Dan Carpenter <error27@gmail.com>, Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
 krzk+dt@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kchsu0@nuvoton.com, sjlin0@nuvoton.com
References: <20260825021644.1203076-1-YLCHANG2@nuvoton.com>
 <20260825021644.1203076-3-YLCHANG2@nuvoton.com>
 <aqK_oOpMAXVhxkHJ@stanley.mountain>
Content-Language: en-US
From: YLCHANG2 <neo.chang70@gmail.com>
In-Reply-To: <aqK_oOpMAXVhxkHJ@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/10/26 22:33, Dan Carpenter wrote:
> On Tue, Aug 25, 2026 at 10:16:44AM +0800, Neo Chang wrote:
>> +static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
>> +	struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
>> +	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
>> +	struct nau8360 *nau8360 = snd_soc_component_get_drvdata(component);
>> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>> +	unsigned int *item = ucontrol->value.enumerated.item;
>> +	int ret = 0;
>> +
>> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
>> +		dev_warn(nau8360->dev, "changing path is not allowed during playback");
>> +		return ret;
> This is another case where I would prefer return 0 or return -EINVAL.
>
>> +	}
>> +
>> +	mutex_lock(&nau8360->lock);
>> +
>> +	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
> Not related to your patch but the comments to snd_soc_dapm_put_enum_double()
> say "Returns 0 for success." when really it returns true/false on success
> where true means it changed something and false means nothing changed.
>
> regards,
> dan carpenter
Hi Dan,

Got it. I will change return ret; to return -EBUSY; for the playback 
check condition in the next patch.
Also, thanks for the heads-up regarding snd_soc_dapm_put_enum_double(). 
I'll keep that in mind.
>
>> +	if (ret <= 0)
>> +		goto unlock;
>> +
>> +	nau8360_dsp_switch(component, snd_soc_enum_item_to_val(e, item[0]));
>> +
>> +unlock:
>> +	mutex_unlock(&nau8360->lock);
>> +
>> +	return ret;
>> +}
