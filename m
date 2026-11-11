Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366440;
	b=IWSTpu+vewEBU5ZXZpAHi6dUOvnN6DERE9CaSI3CXHGIO/29vs/P/ij/Tl/2jTwfLhEG
	 9rQhOPamuxRLy7WaPcnPBRkq6I2LqHIqGCdr9pYJgl5dupUsnjZuK5dFuw2zFBi4V+xRu
	 YuwWGZAXCtEKKRUSGcnVJ6OicemacDGceBXt2fQ7AfAp+C7LFWYHU4vL4Ks0b+wiDEJU7
	 9vdqmqBQrnBZDxtVERijQro1JdQJEEQAk4VSyUS+Km7A3Q7bBbW8gpQtm5DhS1aON2w9B
	 GK3PWMfBdcR/8999rJTBejrk6xA7RoT6ejMNdjzIbeaRD/aaDSR1r15Rk7Y3Auq48fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5QQB/zl+ns/aEZiAq2k5y3MnGVp0J7ISkxT4POasMWE=;
	b=qWKwxbWYv06uVApHFLT7nj/wXkso+JexysFhTL1LA1ZyZ6fVaoz+utBlXIbXBj+WUb9u
	 7vwfaPL6cWui5S+UEVQeHWf5iUbpw9P1KpQUheIuzAd3USTi1VrLBZiu49G0/EWYoCIyp
	 VeJEN1DZ8s4Jli2yrTs+xmqHbcsdolRcioN5MAjYIVeI/yus7hZrcMGDqRLFfVk+2WnkW
	 ce12vJjk1tE+SWbepBsQiaguR7F4+/c4l4R9NcQHTOZZef0v8uUT7U7qI9iImNhK88JAi
	 kpEPT6uMTTqlDQTuLjU+vmx5ZQeK2FPBdtR3yOY0KHX/rAOgk9pYXkOQiH10/GlQvLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e56FUdgG;
	arc=none smtp.remote-ip=74.125.231.72
Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F058D606A320
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 03:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F058D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e56FUdgG
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-4ad827109b4so535435fac.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 19:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366439; x=1794971239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QQB/zl+ns/aEZiAq2k5y3MnGVp0J7ISkxT4POasMWE=;
        b=e56FUdgGsEKYl1Kqx3ObrvBbDAlwQ9Q8aHhTrJnGOs5DLITNBVk36Z3HCbLnRtlb7M
         Dd6N3liklod9yAVSXLbogiHPSve8y9RroeL/QI2pHn+wsaeOLUY8hZkezNbl5NBGrSsW
         ZkSfjcFfi6QbLafbCEgd9qLWyufAVsdbRpJbM0MqAzCvGaMp1rJ7RkaaivL7i8dfJO3J
         q+FFivwf7ffqFtCYbrkBeXcEs4iSR9OSzmELX/2e5DoRDLhqCtcM9/TS3R1CMmj2JhwY
         mGaODyeZKs5Q4XuDrVzfDtTtMNQqs+2I3usFFbJdeB5DZukcSsNABr7sNykk04R2/Nba
         m/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366439; x=1794971239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QQB/zl+ns/aEZiAq2k5y3MnGVp0J7ISkxT4POasMWE=;
        b=OG8GqOEMmYNPezH4iI8hX29M3PasstHBRtgRtS1+2X49sOvKJuq/YQ+VE8xp8YoejY
         FV7CULux9oPo+tuq5JCwgknZ+fZtXBTxtE0F8rsz0W0KE4Hddy2I58kzQf0feR4eHNy2
         kpeu3Zbv2ENwk6BI+7fDoJWBLiBaU9UwRvaGT2Zva1UtTWPYoqsmJAp2W0rh51dpLY3f
         7MUHmxclMLQOp8CPfV9gtMjbzic4ptGIVOx04/mLpR8D63P1BWdWLBkgshWqJBS9Xm1a
         /xGkWz751/Ft09TkfkoQMvxDJI48OBb+kMgArHR5y8W8nFi+pKS51ai5Ef0AP0DwvyJ4
         NxMg==
X-Forwarded-Encrypted: i=1; AL+hErHeLHtl5OeI2ggWEvXJX9q04rJUfnYUlZObfV62bLzoBXUxISwItnWMFe18PfDr3VBWU64QXwCw1M8DMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8NYiIhCwcgQRR1U0KNTb9w2DPNpPSWHGu0It6Odo0T8FWXAs3
	Wu0apjqT8KxuMiZtriuP/yO7H9g4ilCyO0gs282Ojr/DfHJE+vmPN3R5Rg/D+4pOfnQe3w==
X-Gm-Gg: AYBFou16/z/eoBkjrcUARL/m7FibFCgS6ZBk2PLPmevBCA6nH7numffmeGZ7nns25pp
	jZLdG2jlTrwFPO3/aTMfufJGnU5dkdfVoeuVCu9qH4JO1cHa/PR2M14ey7b6yyiFa8ogoCJNbJX
	Y/36rTVYnlRZ/HQ4e95O8X+5In/miu13VornYrTXAGCweQ9KSLkci86ce25L4CYxKRIHFsBFpQD
	VE3ck6wi0/X/Jlh+Z8opp0lefZVjsbgNBbeM8AghThSeKAjdqE1/r+7KzEwaRBqmp7MUP1sg2Ez
	tQQHBbctutzwsaM/eG/YDMYusOj0OIAVKAl0YNgj5+vA74tiIKTWeJKsHr29Z0+T4d2DPRIsHrg
	XzA2CJSXgwzjeHyvAv6LueW4cdlYLu58WcYR44ahfkfaxyvnZA0w6+XSSTPhHvOd7mLkbyq2WE7
	wIfe+KGvbqQGRclsFLRKNYtc7uvhIqVlmpZfq8hU+r73NECL9mdeJqTQEmCRyYVB1IZedjpoIm3
	9T7TRESMF+0iJOfwfQ14A2pIDZrUWBC3wOsPXmGqhSGFzXdtodI17nqhtKKn8R3rQTWrZy5cyWD
	xLVbIppdT7z1j6hTNtdkJumJkAog4W6wmnym+X9KWiMlk3J9Vby9lHbboGBfKMyawMM=
X-Received: by 2002:a05:6871:e406:b0:4ad:9471:aaf9 with SMTP id 586e51a60fabf-4ae46d0a820mr1035744fac.62.1794366438834;
        Tue, 10 Nov 2026 19:07:18 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c5csm2712810fac.16.2026.11.10.19.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 19:07:17 -0800 (PST)
Message-ID: <2eb7d236-5fc8-4a38-9a30-d45e6cb1c1ef@gmail.com>
Date: Tue, 10 Nov 2026 21:07:15 -0600
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: soc-core: start the runtime's component count at
 zero
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20261110-rbrue-asoc-rtd-num-components-v1-1-fa0c9e0cb361@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261110-rbrue-asoc-rtd-num-components-v1-1-fa0c9e0cb361@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 7:18 PM, Ryan Brue wrote:
> Since commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
> the devm_kmalloc_obj() family"), soc_new_pcm_runtime() allocates the
> runtime with devm_kzalloc_flex(). Since components[] is
> __counted_by(num_components), that also sets num_components to the array's
> capacity, but snd_soc_rtd_add_component() treats num_components as the
> number of components added so far and appends after it.
>
> Every component is therefore written past the end of the allocation, and
> for_each_rtd_components() stops at the first, still NULL, entry, so a
> link's components are never found. On an MT8173 board the RT5514 link's
> init can no longer route to the codec's AMICL widget and the card fails
> to register:
>
>    mt8173-mt6391 sound: ASoC: Failed to add route Int Mic -> AMICL(*)
>    RT5514 Codec: ASoC error (-19): at snd_soc_link_init() on RT5514 Codec
>
> Reset the count after the allocation.

Please disregard this, I didn't see Emanuele's fix for the same bug in 
for-7.4 as d00ba321499c ("ASoC: soc-core: reset rtd->num_components 
after allocation").

Apologies,
Ryan
