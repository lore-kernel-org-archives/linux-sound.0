Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BEA634;
	Sat, 11 Jan 2025 01:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736557834; cv=none; b=pWcVvahG5aW+AMzGAxBmGBCW2wPu5g5BAwAV0qreEDY1jp3nAmqCvM2bysEVgybgzt9xuTWUlbNRR3CgFaCf2FDVCEko2X+YqxDMGYdnmvKDxcb6r2uGKHpU28dkzL7QAAONkvUZWPhNSpfNTvtqD69o8dsxvzgWHQevkttcUZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736557834; c=relaxed/simple;
	bh=WOhjy1t8ZqxA7xnVFSL8BgssK5ED808jruF04JJpGQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBb2EhsnOPnf5t3F6UQs//RCRXPpRndxbn7Esf2T8KrgE28m2UoMmv1Uushznu2mimwEpJIsOaCeVpwNyh7zQ1pgbxx/9DEMcUe64Z0eGvd0sfjsK7zcXnvWlZ6bwKRgYvyU77ivbSfghVgYqny/rzH8/S8CrDH7LiSDBwo3lAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUgza7db; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUgza7db"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso27819195e9.2;
        Fri, 10 Jan 2025 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736557831; x=1737162631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCIY2IdhFEaOEDZ2LVLaVqgAjNcdGgTUE0ZB1OTGAFg=;
        b=GUgza7dbzUbm2OFjzAU8FwTz6Blxdxg/cUGs6YJidzX+qtvM8GW8lE/yfHlbck6Nvk
         Lk1LXHUiJ91THrNU/n+UcAGXGkFGKCiE3DDn/jJqaCak2q3uwwX0FaSylhiHMAiBaOKv
         H2AP7EZ1XDTtT7OeMM15sB8iNX/U/PrFKO1er2FVqPsR5liMcuIEAYnELmNUuE0/g1pr
         4aoKI92IJEhH2Ean9PJkXYEOolD6QUG9OHFYmdpcnumvbZlB5Sj3vaFT8Xb69XW+AsS/
         fHiWkvnPjGqvKUCXQayDboV3oVfd6z7O76oq4/vZJ2ETREKjrl3z92Ux8RmWLy/hTYyl
         tCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736557831; x=1737162631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TCIY2IdhFEaOEDZ2LVLaVqgAjNcdGgTUE0ZB1OTGAFg=;
        b=aL/gj2PScJUYJGKX8UJZH44fTEzcIEtXOT4hkXQif1LNVZeMCDmyQ3j4bboyKQXoqH
         q29kX9ByqtKbmBxKPZQuowIvDzcS9wxOEABONwWBNPjZAz1liCVjOwcCLKtSRxaiSyGf
         g5+nBkQ3c04qnKABMQDy/Xpng9jRdoQRvj32FwV/or6tIz4l328ZR2HH7y6qLfJWIzg8
         o98TIpm6GnRuK9TebdX6yYiTl6uzbX0UXMXMrShqBXr72wFYdHsS+fJZ1wcIzrhTGJTS
         VB7whTX1DJddYOVRaD3wMiokPMKHOIVGpZ86LsNJpIqGLXwc+dvJpMKOFYo2EKwXZNqd
         dLlA==
X-Forwarded-Encrypted: i=1; AJvYcCVG6lKR9nRT7ULkop8wz68QtlgmsBHUQua9d5F0NLF9vsvHD9WroaIb0+4J2Z0Ar/BSAMDDn3THBgpPXRE=@vger.kernel.org, AJvYcCWvZbGUWaRr//TnhPJojFH2eAl1LInoFzDNAaFuu6C3xRHpRGrxPKmHu6c+WJaFKCNNhKPNtMtkIMaC1wk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wZUHAF+BP6Ju5TGUz7RGPzcPPaPaf8L/xIy9akJ1wEzpvGBl
	zyfwOwMMPPrVz8+lK1B60saVy9xeyDBqNAA0tBN8pgzsAkmzgfdz
X-Gm-Gg: ASbGnct3HzwNfIC+9Qn1IxxyHkCuNLvFcoeV7+1NEMcDU1swcag1POdBWz9fze+1OUc
	6sMUZitZFXv/uNp/tM5ek7vGy4i6gIVKXu/i8itzx7MYLf87GVQe5oFv26y/vYvympv8T9kIUsU
	uJlC1snUcK0nogmtAHrl5Qa356Uk9o7pdy5lB9EpU7fzoTTm6pdbaqQmj/woDMLENfQxPgHkprh
	YDRADnucrgCsGkEXo4XvcUdxIjpTWec4rr27X4ndK7hj0a3l5FpoF15/BbvpuPDvQEG8KOV7jWC
	KcrwIcg7EA==
X-Google-Smtp-Source: AGHT+IGHVIyHcuZIwndnW2bJivKBpG3Hyfmut05YyWRJl0Bt6wOc3xHmWiR13F4ISD8QNAjR/ade5g==
X-Received: by 2002:a05:600c:1c84:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-436e26e2725mr104468985e9.26.1736557830528;
        Fri, 10 Jan 2025 17:10:30 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1d13sm5923108f8f.91.2025.01.10.17.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 17:10:29 -0800 (PST)
Message-ID: <709f3aba-b681-4b43-947a-770227cf0afa@gmail.com>
Date: Sat, 11 Jan 2025 03:10:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] ASoC: simple-card-utils: fix priv->dai_props indexing
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241220151213.2462-1-laurentiumihalcea111@gmail.com>
 <87h66v8bsc.wl-kuninori.morimoto.gx@renesas.com>
 <197add46-752d-4779-98ff-1cde2543dd63@gmail.com>
 <87y0zk26ko.wl-kuninori.morimoto.gx@renesas.com>
 <146532e5-1329-433e-852b-e6d400eb5347@gmail.com>
 <87cygvwgks.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <87cygvwgks.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




On 1/10/2025 4:25 AM, Kuninori Morimoto wrote:
> Hi Laurentiu
>
> Thank you for your reply
>
>>> -	simple_priv_to_props(priv, rtd->id);
>>> +	simple_priv_to_props(priv, rtd);
>> ah, thanks for the clarification! correct me if I'm wrong here but the issue
>> that I see with the suggested approach is that we have some places in which
>> simple_priv_to_props() is used before the RTD is created.
>>
>> Example scenario: in audio-graph-card2 we call graph_link_init() (which uses simple_priv_to_props)
>> before the card is registered (during which the RTD is created).
> Do you mean like this ?
>
> Before created RTD: ID is not yet updated : use         simple_priv_to_props()
> After  created RTD: ID is         updated : use runtime_simple_priv_to_props()
>
> Is this correct ?

yep, pretty much.

> If so, do we need to use them differently ?
> In the end, it end up doing the same thing, I think.

yep, they do the exact same thing. The only difference is the way they do it. As for the usage, the "rule" would be:

if you have an RTD structure =>
    use runtime_simple_priv_to_props(priv, rtd) if simple_priv_to_props(priv, rtd->id) might be invalid

otherwise =>
    use simple_priv_to_props()

>
> If my understanding was correct, it will just makes people confuse, and I
> don't want to makes code complex. I think just adding comment why it
> don't/can't use rtd->id directly is simple and enough (almost all user
> don't care small detail of macros :) but what do you think ?

i agree, no need to overly-complicate things. Will just add a comment in code as you suggested.

Thanks for the input!

>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

