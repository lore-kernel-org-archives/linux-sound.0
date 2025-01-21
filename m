Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BD585931;
	Tue, 21 Jan 2025 06:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737440634; cv=none; b=fez4TG4+eK6dsyqIi6PiITpAhY0QGn3dFk19YuYmmtre4E19rKtNhzq/BBrUmmHjGOaU9C1YsyCMvXmm2nJMAyAvGeDNzzoBOf30HEuRr38296YgeBTbvsWdgykXtmPsGcm5BEbkTtpZqLBWTfFWfSVl176NPd5PIzv5/DyyQy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737440634; c=relaxed/simple;
	bh=jIpR/vwLUH7GhqjXvSoKpEPevqujnZ+IiyfOUBSfc3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrT5WvjJ4YCEl0B3IXunfbpl58xTOt0eyAT/ffq16SyvOngoyQFxLPGumRj7EIguICBPlz3FeveUZ04eObjaTaiFT1Mxz9lKWLaMgIzgiV7TEvw3m0+x+6z4k/L929UBcvAGGKHT2CgV+v695G12uEIqTOne8yizXbNW6cBfNyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecN/Nt+t; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecN/Nt+t"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385eed29d17so2773868f8f.0;
        Mon, 20 Jan 2025 22:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737440631; x=1738045431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6S4UKOPoyb2aIycOizwVn5NzVA06zQZrJsvKe0zeAmU=;
        b=ecN/Nt+t5p3Fm1WtNhbmaMNxG0Mgrz6PwljWr0eMWeW+6GNSfX5+7WZifDDeWTkx1n
         jEv73nTkWeff2MPAqD6jZzrGPEJHuzcuUAnVTRerlwu1lqQwMbttA3vSJcJHscZcs34V
         CovpsJgR1j5fG83uzYsWW6/aLHcjobIbMsSCPxs9S39X8nJ1PrLIQubPAxzcf/kMBsFi
         E2Ut04c5AWgNZ1/8BBDCiSitzJIVoJT+9Bn8VdAjLwFNv2uAvFbvAgA5FcZM8qLuofZD
         VnQrtqaAL/MWZc6oo3pvf1nWHtWqxXPDws8bYk+osme/P/6zDXX47HLQoe924GLJ9DxT
         JgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737440631; x=1738045431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6S4UKOPoyb2aIycOizwVn5NzVA06zQZrJsvKe0zeAmU=;
        b=GfefBPYdtDAPtDQ7Wp84q4+z6ceLyN8x243CyLm05BnHik9KlCPhZiBpCtzS3xz+f8
         kF62qHIFO5QQ7yzv+1qg0UW1xfiA/EvJypBWwx1E7fm+hMDxrSqn4WWKpl252syJfSq0
         0zjxK6Z1Vih9WpnpyKaJUWCTRz8HMYQx1fgUBMUZnrq3KnIRE2IRrgJWkOSkhDm39jR7
         LzKF3tJ3v/lHNi7BMQ/T5l0Yf9bpDaLAc58hwygoix6nguqbKEjzppeV8min/m3W57YT
         zc4NdsrT6mYtpmzeizxA0Q/L7B00FM3y9XEV24eUB/yT1n/+mhVNZrWWA9ENmXVuAQru
         YJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWoPw+oGdCQgLSHpa8496ur0Vb+DqkoqDe3W+fHKt7MjjsI1PenWZb2s0zWdAgCu5rzi220bHIuVmRagw=@vger.kernel.org, AJvYcCWynaOLmTMW0ynvwuodci95fV+ueOKb8aFTU1dgzrExqYFafCUD1Q9AAng52P8nR5lrK70PxNhGZHyVn1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/gidWNZvtqCx74rb4MIqhDr/MxMIC6EBjxfjl7PlAna4XeZe
	xA42isw+iL9F6CI1hHzP1JLkQ9X0KT2vFCrn2xh6AXGc90j9dPvi
X-Gm-Gg: ASbGncuGmpN2F+zAER98/BvN3+NLXhjqN+jCMojltn2Z9LrnTFgKsx5ahS428chXoe/
	/o71YstSMF9t+cGiIeB+DyFHBshQ/5R1krPvP7o4JwYETi8mqEccjW9JT4dq61sVg3/cpl67ZlC
	w38ycooG9Y0TbhNUTJU8lZNVSr5CltE8bIqPLFxU2qqcL1PhYmA7s68oGs0a4xQxRR0NEGgZilT
	/f2OjmB37oaVUkwS2LenTm707t5V0kXsfGHKCALTY2hq7TnIq52OogPVnzd4G6fxv2YOrlicFYU
	WpmAGUk=
X-Google-Smtp-Source: AGHT+IE8gxX7hW3ZDGky9N9XMmH26+4h66TIAkbaJJcWMW/BFBtZ9oZ0Cxg4Ttue5lICffb+bECOkw==
X-Received: by 2002:a5d:6da1:0:b0:385:e411:c894 with SMTP id ffacd0b85a97d-38bf57a6844mr14309662f8f.43.1737440631023;
        Mon, 20 Jan 2025 22:23:51 -0800 (PST)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438904131easm162757275e9.12.2025.01.20.22.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 22:23:50 -0800 (PST)
Message-ID: <cb602ae2-dd56-4f38-95be-c855afe6b9e4@gmail.com>
Date: Tue, 21 Jan 2025 08:23:49 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: audio-graph-card2: use correct endpoint when
 getting link parameters
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <875xmhj6s0.wl-kuninori.morimoto.gx@renesas.com>
 <20250120162723.702701-1-ivo.g.dimitrov.75@gmail.com>
 <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <87h65t3voj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Morimoto-san,

On 21.01.25 г. 1:35 ч., Kuninori Morimoto wrote:
> 
> Hi Ivaylo
> 
> Thank you for the patch
> 
>> When link DT nodes are parsed, most functions get port as a parameter,
>> which results in port endpoint@0 always being used. However, each endpoint
>> might have different settings, but those are currently ignored.
>>
>> Fix that by passing endpoint instead of port when parsing link parameters.
>>
>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> ---
> (snip)
>> @@ -831,9 +830,8 @@ int audio_graph2_link_normal(struct simple_util_priv *priv,
>>   			     struct device_node *lnk,
>>   			     struct link_info *li)
>>   {
>> -	struct device_node *cpu_port = lnk;
>> -	struct device_node *cpu_ep	__free(device_node) = of_graph_get_next_port_endpoint(cpu_port, NULL);
>> -	struct device_node *codec_port	__free(device_node) = of_graph_get_remote_port(cpu_ep);
>> +	struct device_node *cpu_ep __free(device_node) = of_graph_get_next_port_endpoint(lnk, NULL);
>> +	struct device_node *codec_ep __free(device_node) = of_graph_get_remote_endpoint(cpu_ep);
>>   	int ret;
> 
> You don't need to change cpu_port/cpu_ep here ?
> And, I would like to keep "cpu_port = lnk" here.
> 

cpu_port will be used on the next line only, but ok, will send v2 with 
the above changes.

Thanks,
Ivo

> Except above
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
