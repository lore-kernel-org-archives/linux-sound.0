Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3E20B806
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602299; cv=none; b=M937265KdJ6wBzNLtedgYOTkJ4Xyh3Sx+S1INZtvCcdEfCOdhkZr8bzxr1mTuW7qXkTxsyOJijEqZrY/t3MifLBlikRP+cgOwBqsKoUPB7cfp2NzcjhDnUAf1Vtm/hra0ci+yyRyZf3PlU+tfLbX4WQ/zGo/FT5ooUatiZ2ZqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602299; c=relaxed/simple;
	bh=k+4NjqDATI0U8bN3dLAciAEBVOadw2UR8Z2JdKAVccA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCFAIC7Rf4Ni6aicncuMNuvqR5fKoJAjlUYtznccxzof+lIgKQvPdRFec7QGgVQEahhy9dqJqALV0fdqFe6ljuLHlaB9Ld4X5e9QnpIbOdB7LYoq8E33e9xI4BHIQrNZkhdb1KXebmFd87svUePTDDZ25mLwgUeYZvh9g4luPsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYNLD2QS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYNLD2QS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436a39e4891so32047205e9.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Feb 2025 09:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738602296; x=1739207096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IeAKHkbKI0d+HFqcA1QbgNc0PHZKpaqw+IxJ2Pt3KrI=;
        b=cYNLD2QSSgQi7h/liSDv7EsJbF8aOjW6vSZcAcjQVOotEoT6PLPLdohwA79zdKpnEP
         c5nuMFX6yucvauCT2FRxPbgxPGHEs3A92slKD9DKVar/mClVEEiwHjQ+5E+fd1Y6F30d
         juqR2/gVcVcbC6HFAvxJ3vPrDKQ83o9amxCQX8Tam9TSbZciO9zsuNeXNNJ4R+sYPzeA
         ls8MvFitR/RT0Aw4GMvC+1S+fjZezm6TvfP16O5LZKm91++Doka5c7WV7QPipCZWWp07
         GkszcB9koZkOGV2js2gdXa8SEspwLs03hY6X28e2aNeN4c4w6BrjMkfLcXwd6GmNMe1F
         1YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602296; x=1739207096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeAKHkbKI0d+HFqcA1QbgNc0PHZKpaqw+IxJ2Pt3KrI=;
        b=UPz6PPcF87zer7UWlqnxi3F3Ki9nKHMt9xubgQ3Baaonhr9vkvVXp+PnLhcBmGXyYo
         UfuEWxei/X1svcqc5qWIvWveyXa8Pd3Uqa99AlLohnoORtYY4K/rjmAPzQfBr/ILu350
         pZQL/nx4HnDyJupUnfEn5ZaFUH4CgzJSbMJGn3eEYK0F7H1SpjXT/uAkfnD+i488jVNo
         nyKSOmT1Of6gnLqOuWqZBv4H6RVkf9Yo/tyMiJcLFpOQUF4Vr6ZgJTmtyHMk3/ie/jvy
         jDFec2320rDzequTmJdJpzJSTJHN84v0+Cc/K/rXaV7iXYT/3t98APeZBsTEQDnf5kfR
         vpqg==
X-Forwarded-Encrypted: i=1; AJvYcCWHC4Vt74gqlOcfMA2Qb/MJKKjP/nbocEVAK/63Lna45mlo9OCPYD+M4GX+/mZqQxxy03Spziqv9k3GyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfoOa35NAnvnrzO4BU8/k3RUk5zgT371ssx5uQNeb1KtNGe8Ab
	8dIvWWlpp9tcwnDRD160qmJgNX0I298zqCFBbfTMrJ9z0HGNCmbDI/8sXd5tkfQ=
X-Gm-Gg: ASbGncuN44xSqbJyJTZQJgbduVTvzaLGpuKqwbCmVJSAxSnZox9vKrT/QBw8v7vmIGc
	piBZgpRwnhmgOATHr/uH1QgVzPnuP8SbyiApui2PJwE7trrPyQedRZlrAZFf1W7AhpM1ZukYXzJ
	T0ATpYgOSwOxI40ELiclqCO9udQZ9eQG26QuoYNxWoNs6bHYtRo1mQ+Cm7FFvFtj0woNHhqf5rW
	IQ/ymlAkuFXDUj0CooioAjh8pCOKqTSrUQdBL9i82l9QQVsg+2/bq+zu6m9Q8HcF1tB/enVv8R8
	Qoqmp0Afkwu3fSa/kbWW059qpv1OjfVsAw==
X-Google-Smtp-Source: AGHT+IF00AdeVSwhqI4DYXX6YY6GZEPGGjTf8EIYSLIpae6mTJ38NVob4I51jvELhrmPQOnQvXZr1w==
X-Received: by 2002:a05:600c:3b94:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-438dc3cc3b1mr206167275e9.15.1738602295518;
        Mon, 03 Feb 2025 09:04:55 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf571sm13099525f8f.82.2025.02.03.09.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 09:04:54 -0800 (PST)
Message-ID: <05263a45-5faf-47c7-9a32-eb8e5114e286@linaro.org>
Date: Mon, 3 Feb 2025 17:04:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start
 streaming
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
 <35cf66a2-05ef-4e49-a146-ca96ab19fcf8@linaro.org>
 <4678ae0d-434e-4e04-bd77-abae1969ff6c@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <4678ae0d-434e-4e04-bd77-abae1969ff6c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2025 15:07, Mark Brown wrote:
> On Mon, Feb 03, 2025 at 02:30:26PM +0000, Srinivas Kandagatla wrote:
>> On 03/02/2025 14:17, Mark Brown wrote:
>>> On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:
> 
>>>> Fix this by scheduling all the periods, this will ensure that the dsp
>>>> has enough buffer feed and ultimatley fixing the underruns and audio
>>>> distortion.
> 
>>> Should we be writing all periods or just the minimum number of periods
>>> that's configured?  Userspace might not have filled the whole buffer
>>> yet.
> 
>> Just minimum number of periods or 1 period. We are queuing up all the
>> periods to the DSP, so that we do not have to wait for period interrupt to
>> queue the next one. This significantly reduces the latency in queuing the
>> periods to dsp.
> 
> What guarantee do you have that the data isn't garbage?

Yes, its possible that some of the last periods might be not be written 
yet by userspace.

We can always add some checks on the available periods to queue to dsp 
something like:

----------------->cut<----------------
avail_periods = (runtime->buffer_size  - 
snd_pcm_playback_avail(runtime))/runtime->period_size;
if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
	for (i = 0; i < avail_periods; i++)
		ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
		if (ret)
			break;
}
----------------->cut<----------------


--srini
