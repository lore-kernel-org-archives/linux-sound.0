Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE8731196D
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251901; cv=none; b=n6FCFlNLHnZdziG8pwlqntKL/1a5K/Q0hWAfo4QttQueQ7X82RVST4komrYAneN6BjxIeam786fWNZp7RbZUZQttFEoSO82sroJOjjfxgNbbH/DpBxRSoJOxzmomJ/DfNvPcpKo+0p/tyM7K3q7SXdP+I1hYz6h22P56ikSJ0Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251901; c=relaxed/simple;
	bh=+gdfOs22C1HlhYzm8g+hfa+HH8oPT+RSiB+vCUuW1tY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YJuOtiOTjQICPBBPPgB4sMJ0akYS5cgn1TKM/rN8WEDFcxmBhP0mc2fMDRg4jDNBYgisVZKnx/J+iad5jWI+ZRT+w7q2iyMBF8t6b0dnjtrzgoUVuQ+C8zsa22XAGhV6O9gTSRTqnPMOVcyEAuwPhfp33QesqFzcF8+XAwTTcHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=Z0tHCNNk; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="Z0tHCNNk"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b1f2fbaed7so77617785a.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 05:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764251898; x=1764856698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB5l1g0gWdjw9WGa87kNU8ZATb8WzLJUTgvTih8Ggpg=;
        b=Z0tHCNNkLys0KA2TSIIFTD6EcH3J3bS99cdusQ0EfBgatgH+5CZYytiVMyYQ3f2BJH
         9nge7oGpTi9nT3D8aa3BesUZwgthgnpvSc+GWE8s9v/qtj86Tf96za82bSNVKj8i5K1h
         zIefVVBv0QFIeeEUR9Nfn1zMoPbIvARkJ5gzYGIpnXH/T8kVql9NO9j5vUFQWlHDLI+R
         siXn9qTmSUVrPHw7Zi1WjbpT6y7ilFehkSVfdid+81gGBdjr0rkgOjSPPZtF08jJULgK
         iXvPTPOa9AaEUFeNj41rbkLCKoZbH9w71+oLHLm9/EDFUFR7TWtfTRI3sjf1yLrsYsXb
         eV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251898; x=1764856698;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rB5l1g0gWdjw9WGa87kNU8ZATb8WzLJUTgvTih8Ggpg=;
        b=bkmk/w+2+ECMitANz/xX+jXm2Z0wbRP3GhfXd58lDh8ci+EI0hJjalSJkhVhXqSJdJ
         co1XsYmNGWuhPkPOlb8f39vlBTSPSO601M+mT9FK1OKGYCmMNIQXE0PY1Tl3UlbAiCE5
         z72+qTEMoi7PyBw2wbqmV4pZ4+YuaN2arceSxoU1nkgElERFL4uHpY2hfW2CTQUFeDDP
         Xo/w7+0wh6lcWmtCjUVopvT2frAxMWhaiuaf/v+64ZyBFUpsTZ5gCUz0EBIgltwlTW7N
         b1lA2YBYiOMwJnSoSO08pJ+JnVM3fvCwG03Ip5upV3lj0zAsqSOe/oe4wdSheyTdv6b9
         K80A==
X-Forwarded-Encrypted: i=1; AJvYcCW8iGQBRQIAW+VgzIAe9BC+d9Ct9MsCqm5cJJsxTyXTQK4Msyqw+QEQjP/0FlKqWuR51JS5aQkrzm1jig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDriYx/WrgQu2rS61Hkt2tvqlk6dWGYqpNZNYXEc/mw/ycjZeQ
	AldDe8QaaC6aEtuYzqyPnxiLD4d/Z8kL5vuPycDpEjkdW0ZVhFAu2Hkt1Fhq5HNO5UWWn0FyliA
	sKzs/
X-Gm-Gg: ASbGncuuri4akLqM6qZYt9RdQXdiIm8q5DojOETRI07xMZLfjgx44UFN4wa7OzL1jsG
	3WAZf40f5AUWbycJOqfbgQYH89qE7eQN5ROO/U7axnPjT/VovGaEzTBZZvRUbcouO92XTbvKdH1
	I2X4CDQwQQnWia7RKTzBvXdYPZemm50CUneAZSnUZ1PT/nlwPirdsOWYwKpf2A8gOMCmHhGfeDm
	wvm7TUA2Uj9PkQMWlSFP2l757Xg28XTgPrezYMvysbMVa9ZoQUvFufZqPJS4udy8ItmQIp/cl0s
	eDcU7cUS//UFVKkS6qf6vqEsJO4LIqhhfN24E53EavOEx3UOCAnImhrxiZjJ5Q5eiJ/HMk+95u3
	oP0DGIrDSUWX0ar243DUm9MGbYXSq0pmMko9F1QFxRCujdx7CPfajFZVp9jvXZ+k5UWJNH8AKt8
	OYUZV/DIhh69e9d5jfbxDNpgME77uHJri41SUqEuVVnH17YoNN+3UK1qN9YM0HOxVVrr19
X-Google-Smtp-Source: AGHT+IG2ePsHplqf7Mn9IMAX6R8N8JBcC8y8n1aUFt0jI2DCV5W/+7scoFZVOdSIm1Wcikw5ZHW6eg==
X-Received: by 2002:a05:620a:7114:b0:8b2:33f5:fa49 with SMTP id af79cd13be357-8b33d23c372mr3173241985a.14.1764251898524;
        Thu, 27 Nov 2025 05:58:18 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5304c960asm32868585a.19.2025.11.27.05.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:58:17 -0800 (PST)
Subject: Re: [PATCH 1/6] ASoC: codecs: wsa884x: remove mute_unmute_on_trigger
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251124064850.15419-1-jonathan@marek.ca>
 <20251124064850.15419-2-jonathan@marek.ca>
 <2758401b-e9b5-4f10-bb01-0a1fe4e09430@oss.qualcomm.com>
 <5f15fc5b-375a-1e75-b32d-0d543fa1014d@marek.ca>
 <fafe5de2-f682-4769-bb1f-166858808746@oss.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <c4004024-2f06-bcc3-353a-d432f7586b10@marek.ca>
Date: Thu, 27 Nov 2025 08:57:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fafe5de2-f682-4769-bb1f-166858808746@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/27/25 5:14 AM, Srinivas Kandagatla wrote:

> 
> 
> Interesting, I guess this is not an upstream driver. The change and log
> itself does not make any sense on upstream. pl correct me otherwise.
> 

> That is true, The issue that enable stream happens at machine driver
> prepare and disable happens in hw_params_free.
> We have window of opportunity for click and pop between the mute and
> enable and in reverse direction.
> 
> Am not sure this patch is improving or fixing anything on this side.
> 

This patch isn't improving or fixing anything (at least upstream),
its removing a hidden (and unnecessary) nonatomic dependency. It 
shouldn't change anything with the pop/click situation. Without 
mute_unmute_on_trigger the mute/unmute still happens inside that "window 
of opportunity".

My driver is not upstream but it could be, and I need atomic trigger. 
You can imagine that I am using the lpass-cpu driver (which is similar 
and upstream), which also does not want nonatomic trigger.

note:
- the common qcom sndcard parsing only sets nonatomic if a "platform" is 
set, which the lpass-cpu dts don't have
- none of the upstream dts that use lpass-cpu use wsa884x/wsa883x, but 
its possible to use these parts with sc7280
- upstream sc7280 uses wcd9385, so using mute_unmute_on_trigger in that 
driver would break upstream sc7280 audio

> Also I noticed during testing on T14s one of the speakers (left) went
> into mute, not sure if this is something which is an existing issue but
> reverting the patch made it work again.. Need more testing and debugging
> to understand what could be going wrong.
> 

This workaround might be relevant:

https://github.com/flto/linux/commit/83b6c10d7c6248b9633a1516b816f211607d4eca

