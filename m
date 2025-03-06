Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340620E6F2
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266948; cv=none; b=jaRgsfmZtiQdTDNN2wtl2IWRSeFL/udOQOa8yZF8jWzUdKtwZ80gTGSRnPmxpoZnnvx9pCtBxNvfmg+lytlFg6J5Eq4DJxa7LFzAXtO4usD5C4yskWd4T2lAS0NpjobfeFyauzcmdHQX8S/T2W5mG30X0MFsksHIBUWqxc40d+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266948; c=relaxed/simple;
	bh=iCLwruORYDxCtsWv+hcP88C3gvbW1fbzcoS5L/5ij9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LN5UJH8eyYkTbVhrsbo2acwse7REdZ1aqTVx48eeSZVoX9d7bRMBKCEG2uWVAhp3Ll58pDR9+HYoJTmsHlxpk6MX1UYjG4zp48V+fgU+9Sap1p049Z12hVcvDszPsrRZnjS3knafX/08MHVjMxkSyut0vFC99L+syZ0SSzgIM6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LDGW3yh7; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LDGW3yh7"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaeec07b705so99151866b.2
        for <linux-sound@vger.kernel.org>; Thu, 06 Mar 2025 05:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741266944; x=1741871744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odFKhUpOD0oBGtCw0Lzrsic1VmySccICXYvC2207ePM=;
        b=LDGW3yh7Szy45/wsV/IUGCy955wA2YdwhlkObqZXBdaFySMt+6CxeTpxiKstDcZCZI
         AY3D+v9gSjK9h80eTPYUtwL9wLJUKC9/LFX0w/I6Zj7HO/1ia3R+Etrw4PCbBP0Bfm4c
         +ymNGYklrLlgrqYXIaLJqwba2yFWTMaSfks0mUIDPLqgj/8t2nSt+Fr9bN01T0J5/3f6
         g0dpGSF1Sc8BqUkmP2Fixw/mvwGixhdZmm7MJ9sQMGV/LITE3mCm5wBcTiJxMu3AsLUE
         xu72cyYprwaDj5bAXMvh2QyzBEMEftvj3cWObJai4GBLchItmKjt2/2DMfUc5S/e6D2g
         V1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266944; x=1741871744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odFKhUpOD0oBGtCw0Lzrsic1VmySccICXYvC2207ePM=;
        b=Z7hIarzKaF1mdmK/ZpYvqCuu3e1LFl+UHoV0j8ZWam4J2MSulvsUs21VpaS+CQ8LDp
         4XMoAJqq0+WQLM4U66ypQzXBzPdEzUauFQI3FGXy1pL6B3O0FWZA2wZ8j179WIy837ed
         eFmVOPKJERo1x6ZHuz+Wmj0plAm1SJk6tWgjFwMFWUxgskYMMbZiKREdqE7Bt3K5qke6
         gXa6qeCmB+S8JyTbpKIFAZnOPZq/VZIPVWA5pGaH114tAu+tJHPtnnhhoFbdW0uhItwi
         CLGXv2BhHbDi8qAiM4OsGJLxSFMoBnZckYW/8JcVAa+TO2qtfsa4xdxyfdoDuaiKb8UT
         gcAA==
X-Forwarded-Encrypted: i=1; AJvYcCVO+SiuojQ1pn63cxZBeQJwUnFVEVsXx60+dqcd/gDri/uow5Er/CnzNE5PN2kP2x27qrRL8NiBJIZYPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzubx+L1YaWw8wPWE7npb+5LnALBIwmLQPgIOJ9x33mB2w0zDFG
	lNzzSXcLZHSo/3m4MXNDnkrBujXTjYZxnMnYtUdpZRkNdEX2dAtriqT6fnikDF8=
X-Gm-Gg: ASbGncv4yNkjVt+o3mvtdUuGHMlCeGSUPN8SdhvHhzJpaYQhrXXtEfLeu1UmzDQUeEZ
	UlQRWFB2nPG3QPm9UbvQDmI6QzWPzraWpaYUVqIKGrTpg6XCK3PJwVG1sbdG5JNpKM9q9VIL2mw
	SYTTbnHn3yu0d+znp1tACiZDunUduC7qgtbPUGhW0CoFGfnsTrQVCLR3ZG2BAEvceIiuIxr2KlK
	KtsBrjAszHsH3ih0+8kI5n013p0mJLfAYbSnnypROr0UR57QpsbVjT1STpCSpMwjePsLHVzxB1F
	nW6pw0j4T0n+c0d/Xt5TpgBN9x6i5ortxYI9xoc2lu6P/UH4VNv1m3Lm2ZlmrCY=
X-Google-Smtp-Source: AGHT+IHMPmbTge6zDjHa6859H1+k4sdDZ/gMAiX6FUPawQ8PGqqQPLxpyvCVwbjTBKNQwMK3CnzSHA==
X-Received: by 2002:a17:907:72d6:b0:ac1:daba:c6c with SMTP id a640c23a62f3a-ac20d8bf12dmr589079966b.24.1741266944582;
        Thu, 06 Mar 2025 05:15:44 -0800 (PST)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac2394fd578sm94632366b.81.2025.03.06.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:15:44 -0800 (PST)
Message-ID: <9b4fd423-a463-4d50-a597-dbda532b6b61@linaro.org>
Date: Thu, 6 Mar 2025 13:15:43 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
To: Caleb Connolly <caleb.connolly@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
 <ea047098-2baf-456a-a57f-b698c0ce1b6e@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ea047098-2baf-456a-a57f-b698c0ce1b6e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/03/2025 22:17, Caleb Connolly wrote:
> Hi Srini,
> 
> On 3/4/25 10:57, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
>> both recording and playback. These patches fix issues by
>> 1. Adjusting the fragment size that dsp can service.
>> 2. schedule available playback buffers in time for dsp to not hit 
>> under runs
>> 3. remove some of the manual calculations done to get hardware pointer.
>>
>> With these patches, am able to see Audio quality improvements.
>>
>> Any testing would be appreciated.
> 
> This totally breaks audio on SDM845, and often results in a hard-crash 
> to crashdump mode on my OnePlus 6.

Its not possible.. as SDM845 is Elite DSP architecture, all of these 
patches changes are very specific to Audioreach DSP architecture.

Could you please share the crash logs if you have any. It highly likely 
that something else is triggering the hard-crash that you reported.

thanks,
Srini
> 
> Unfortunately I can't get UART logs right now. But I imagine this is 
> reproducible on RB3.
> 
> Kind regards,
>>
>> thanks,
>> Srini
>>
>> Changes since v2:
>>     - dropped patch which is causing regression with pluseaudio.
>>     - setup period sizes only for capture path
>>     - fix underruns/overruns in dsp pipelines.
>>     - add fixes tag
>>     - add patch to fix buffer alignment
>>
>> Changes since v1:
>>     - added new patches to fix the fragment size, pointer
>>       calculations
>>     - updated to schedule only available buffers.
>>
>> Srinivas Kandagatla (6):
>>    ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
>>    ASoC: q6apm: add q6apm_get_hw_pointer helper
>>    ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
>>    ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
>>    ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
>>    ASoC: qdsp6: q6apm-dai: fix playback dsp pipeline underruns
>>
>>   sound/soc/qcom/qdsp6/q6apm-dai.c | 63 +++++++++++++++++---------------
>>   sound/soc/qcom/qdsp6/q6apm.c     | 18 ++++++++-
>>   sound/soc/qcom/qdsp6/q6apm.h     |  3 ++
>>   3 files changed, 53 insertions(+), 31 deletions(-)
>>
> 
