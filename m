Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832E32010FD
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591961; cv=none; b=g+OpanDpONrZ8iu7+c24YxzbFaC6m1yUiPwyz24yuosyYi7Pz4vmgyOOe2lL7Uft3FrDKhOSh01N5aN4H3KU3/48877lNRhigM02Iq9vU3Ncdd9X2hIj4CJ/5BjIEEh1FvQQg8uDyce6AKpy5QT+DnvLWjxuCegxvWphhUJ9vDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591961; c=relaxed/simple;
	bh=tsZxVi3hWnfSgdTZWSolIwnNneopaRWe39nLdwQMAoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sCmSbSivbJmH8+9Lrp1VwygJ4IEraS/nZkbOBG5KV5xw/My/XLfCv9dliP88Mi6z5y2MR6lRAAgpP09tboSm7APy0TsMRX3v/BkUHZgxxEQ0QJ1K5voWpt3SNYB1IVu1tPtx2UmDYxuhk8Oagizdeon62AorpHaIhPqY6VeioMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IvgVrmch; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvgVrmch"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3863703258fso3353633f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Feb 2025 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591958; x=1739196758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUjPahpJZ490tF5nS7xvrKmwqtWzzB567d1rXxR9fdw=;
        b=IvgVrmch1fV5tP63yh0ZqdFO5wOkKsKd2FurqHJDCZCXuljPMJFqUg+6sBYrQQMOVx
         o9guUFbL1qVl3cckmizrHh1MPwZ0uYN4yh16XU1IhdrkrXwS6ZETQcu8LbkAUcrCyGiM
         y7xKUdvr5jjHMwozoH6w7NKGX+ZQjIuELGM/O80Ce2Zz3WviHOac60MWjyE7yIK+KDyo
         f4oXHJZk6hhgwKQaM6SLtdCo6d6dv20CJXVW4jyswRHebiw/6rHV32uOYWSRipJ07NOm
         qvxitPmU4OkLfhGKmXGDlKScielOeEX6AgfxjkpDHOdxV3PppNMeyhdHv65VcX46eJyi
         VBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591958; x=1739196758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUjPahpJZ490tF5nS7xvrKmwqtWzzB567d1rXxR9fdw=;
        b=rjWJLa8P2Ko9qU3x1OEPCGOh6hWbeXDj8Cv2AdfJnEQWTod6P6lshlApO0s9rAjWS0
         UjhosrEHIwzZ7DPWcgBXbBbKFG1dtZZN8oSwVxcFfnypuSI07P4VOWfLHhco/iQBbqij
         7HSTf+Pl5oNzAHJZAFj90437WdL5HlCMlRlcsb4I5tdNAy8nQbGvS9OF7olZDbC4NOH8
         7jjP8CDENUdTPxopDNIHirf+EQddNUgdG+BQETt+wAe/jnVfRkKVVBxUOeB0HYzGuzUH
         Iz5vWqFytS3wzVmh+806SFDIyo1/vzoYlrLftqur4Nw5GKB30ItH2+T3ieJJ68LjexSA
         7rnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0rk3w39shbVvyjwrPSyA+ErKXgisfQYNUWU7jDfeZGyaC3lF41ewPokVgHjDwYIZ//jjHSi1z35Sx/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrUen7Be+/0OH4fRexM2SIKKoz5ghdNAzRtsDCG5GIAb5YXVn
	exsjZjJdWzCilwg2yZqQUPA6Vvdvu73fGNv86XYHjbbp7KEM5U6OaT/N6IdqjeU=
X-Gm-Gg: ASbGncteB6VX2QiATRq7NBSGyLmuySvHFlO+q75mcBVjZBFzts25zD03WU2uBG8tRkk
	EMVc1o3K65WG+4C4ikxXLUWMg+FsKmclAq1RG8Y/mIRFBtXNNjxghrjWwKJdH8zzYfESU24zoTN
	3k24voWoqzktpPzI9XWomNT1STBOAkvVSeVOmLTNwbWoBLnUCi3Kva+k+t/rt51KuLd53rTPbLW
	xKY8nPt8SaKlA1Kx1BDfPzOf+/65MDoIFrYYIUpeXA5tE0dVm/bnLER+oj7bLfTiWuC89nLWDVR
	rCacLT18SIsoPJQfl4D0QsLk53rZ0XZWVw==
X-Google-Smtp-Source: AGHT+IFA8mWEpLmmdVcjuR4koqsoB3sj55W01B83hJSvs3SAyixdmRXxMrYb2kLmMpISqzfZlvuUaw==
X-Received: by 2002:a05:6000:2a5:b0:38b:f3f4:5812 with SMTP id ffacd0b85a97d-38c5a9a62damr16085238f8f.21.1738591957643;
        Mon, 03 Feb 2025 06:12:37 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa2fsm13136123f8f.91.2025.02.03.06.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:12:37 -0800 (PST)
Message-ID: <14f167e6-ea2f-401a-87e9-2722929bd9a2@linaro.org>
Date: Mon, 3 Feb 2025 14:12:36 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start
 streaming
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <za6jydjpvhz77h22qvssjxv2vrh6g637ctgfndqavoxo7pnqel@vcalzbkbfoss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 14:09, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> With the existing code, we are only setting up one period at a time, in a
>> ping-pong buffer style. This tiggers lot of underruns in the dsp
>> leading to jitter noise during audio playback.
>>
>> Fix this by scheduling all the periods, this will ensure that the dsp
>> has enough buffer feed and ultimatley fixing the underruns and audio
>> distortion.
>>
>> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/q6apm-dai.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> index c9404b5934c7..148c3fb77168 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> @@ -299,15 +299,17 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
>>   {
>>   	struct snd_pcm_runtime *runtime = substream->runtime;
>>   	struct q6apm_dai_rtd *prtd = runtime->private_data;
>> -	int ret = 0;
>> +	int ret = 0, i;
>>   
>>   	switch (cmd) {
>>   	case SNDRV_PCM_TRIGGER_START:
>>   	case SNDRV_PCM_TRIGGER_RESUME:
>>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>   		 /* start writing buffers for playback only as we already queued capture buffers */
>> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> -			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
>> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +			for (i = 0; i < runtime->periods; i++)
>> +				ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
> 
> So, all errors except the last one are ignored now?

this needs fixing,

thanks for review
--srini
> 
>> +		}
>>   		break;
>>   	case SNDRV_PCM_TRIGGER_STOP:
>>   		/* TODO support be handled via SoftPause Module */
>> -- 
>> 2.39.5
>>
> 
