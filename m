Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F820E6F1
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996615; cv=none; b=VsmBIp9+WQ+SHzNPFr8VwPwpANz6O8ngG7S4sKy7GJid//lGnRR2RoiPsgY+FxoEy86Gt+hEXEfNhplP7WXT9qb4TGZQ+V6Bsz80o7LG6LoML5F142xvLGCQM5Fji8ISpVPmyL8K8HrcG4cz386E3oJHbIiBAYQdbnaAHfRyH5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996615; c=relaxed/simple;
	bh=a5VnO8KRSNtKXsUaLq1kyDXl79T5kQLGZPp1CCrnsO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fM6/PoiDUn7VIztK/MzsV+xDc5ewV+k+fHK3fEXDdDpwRCFabyMaIORVB2OmNlCbcwhTspmADjh3lbM+OujAVRr6UwRRxZhLF2Ef4rFaU1cpPLwH4tUVZxvx7POUY0fRW6SlvyLN+BoTwOrxqxN8GNN9BvqVnS5fgIXUZcrCYN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=El3MQNPS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="El3MQNPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733996612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4onINFWg8AMnVkN1h9pYQA0tiFgFaRlFgexYcBkU7c=;
	b=El3MQNPSqcSPCIQ/PXoL9DtuFIkTwfQQ2j97LEG9ECbV3xQh45RY/rhDetASxyKJrpqNTf
	PYT1fBYTv7pGUO+3A4Ni0x7QvTGKSXrpEDCY2CkCCHj/D7lut2nHwDE67afcewkNFC5DcJ
	d/e4VkMfyQ+O72HuIuBjngk2Ml6Tpw8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-uGsZM_bCNqShIORznl8sLA-1; Thu, 12 Dec 2024 04:43:30 -0500
X-MC-Unique: uGsZM_bCNqShIORznl8sLA-1
X-Mimecast-MFC-AGG-ID: uGsZM_bCNqShIORznl8sLA
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa6a7bea04cso29252366b.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 01:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733996609; x=1734601409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4onINFWg8AMnVkN1h9pYQA0tiFgFaRlFgexYcBkU7c=;
        b=KbZUFvOkIGZkry6noc8WBOUaH5UdsN6UTQF0EqIlk42nPIJBTrijO/HB+G4NlRcale
         j9AiIdwAbQi68Nz9x7IC924Rm72lmXf89eFRPUGnhrYJiVeLXz52oBfN3taKtRLreRuB
         MdDS1em4AsQBcsCUu08bcKoW7R2OIwdhldBvDs1XGFjy4WBWD2sLX/roQv0fp1cMAzth
         4hwAb7lzAy82Z8cMKj08l1CVNAaIsswcdD5T6x9JcL+ZNoy3tEYeioFPWyccD0U61JOT
         o7x2FDoGIVz2GoLavkTGXjf4teMDZo4BIqIxFcG7Zktokn7jAApjohXvwF+yAAovhtiF
         ylEg==
X-Gm-Message-State: AOJu0Ywh7ANFHVfdyvn32LoWso9LzBTgB5lwYCJaXPCu3yN6+5tbHlPx
	HiMGLHrcV6u9VvRmYdfB9LKX+Uli6Eca7l36mv658PYEMO8n624NLUcN7uea65U3kDQy0SfSLH5
	fIIU8L0GtTPuMCzNT+7/xOpq+bG99wMZOuUNoQwzaIs2fUHpHgfP+ZfGx0h63
X-Gm-Gg: ASbGncuIyK3+2nRNVftk9ckb5ay1HUxkmnEAEc3RajWFIaY1hadBAPOUiVCkp+nfNvR
	WxQ3DYGmARuyfUVUHZq+dxUGa+a/K763otWdcMVuvGuPdBlyqe2KAm489m8XdanWd2sg2JZ2KqI
	zysUatzfEo8P3UGhmhIhDDYQHScBJyTMjzqrWB5UisznKhwxtPjUFuAu7CU9QbLlH5S3L8WqLVd
	oetMkhew28X9S2JUtSa4H0Gr0t1XE5mKA+Hrx+VLHDWEYVDVcQMPXgUCf6RkzHEtYJ6MQ1lW2gw
	XsjtrXxjd2UDMmjNQYfl0PyPPCGW1g27scMvisZbArE2cHDxIzMuGRzi5BWSjQ43us0b1oE5qsc
	KMAgXAxfA/xE7slnfNQAE0M55G71Eit4=
X-Received: by 2002:a17:906:4c1:b0:aa6:832b:8d76 with SMTP id a640c23a62f3a-aa6c1ab652bmr301457966b.12.1733996609542;
        Thu, 12 Dec 2024 01:43:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHscnzqgwauRzSC9/Nk74hZmd94XluzPGHinYbP6afGVVW8cg1EpoNAHI4DQRpXeizWBAlk8Q==
X-Received: by 2002:a17:906:4c1:b0:aa6:832b:8d76 with SMTP id a640c23a62f3a-aa6c1ab652bmr301456366b.12.1733996609189;
        Thu, 12 Dec 2024 01:43:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa667843413sm764875566b.24.2024.12.12.01.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 01:43:28 -0800 (PST)
Message-ID: <8ba4dbc0-323e-47cf-9d74-88495f4c40a2@redhat.com>
Date: Thu, 12 Dec 2024 10:43:28 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-pcm: don't ignore -EINVAL on soc_pcm_ret()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
References: <87v7vptzap.wl-kuninori.morimoto.gx@renesas.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87v7vptzap.wl-kuninori.morimoto.gx@renesas.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aF-bQnle_dJbWdFhQAuebQEHZY4LyKku3XRjVMWT2dY_1733996610
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12-Dec-24 3:23 AM, Kuninori Morimoto wrote:
> commit 1f5664351410 ("ASoC: lower "no backend DAIs enabled for ... Port"
> log severity") ignores -EINVAL error message on common soc_pcm_ret().
> It is used from many functions, ignoring -EINVAL is not good idea.
> 
> The reason why -EINVAL was ignored is only for ignoring
> dpcm_fe_dai_prepare() error flood.
> It should be handled at dpcm_fe_dai_prepare() side, not soc_pcm_ret()
> side.

-EINVAL really should only be used upon invalid parameters coming from
userspace and in that case we don't want to log an error since we do
not want to give userspace a way to do a denial-of-service attack
on the syslog / diskspace.

I'm not convinced that this change is a good idea, but I also
have no strong objections.

There also is a bug in this patch which needs to be fixed before this
can be accepted, see my inline comment below.

> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 1150455619aa4..7ea580f0a6f7f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -38,7 +38,6 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
>  	switch (ret) {
>  	case -EPROBE_DEFER:
>  	case -ENOTSUPP:
> -	case -EINVAL:
>  		break;
>  	default:
>  		dev_err(rtd->dev,
> @@ -2560,8 +2559,8 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
>  			     fe->dai_link->name);
>  		dev_dbg(fe->dev, "ASoC: no backend DAIs enabled for %s\n",
>  			fe->dai_link->name);
> -		ret = -EINVAL;
> -		goto out;
> +		/* don't use soc_pcm_ret() to lower error log severity */
> +		return -EINVAL;

You cannot just do a return here, you are now missing these 2 lines from
the "goto out" path:

        dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
        snd_soc_dpcm_mutex_unlock(fe);


>  	}
>  
>  	ret = dpcm_be_dai_prepare(fe, stream);

Regards,

Hans




