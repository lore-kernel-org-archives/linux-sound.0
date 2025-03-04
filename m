Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50139298CB4
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741108347; cv=none; b=uBhAu+f0JN5iXWTv+1ZZmj7oRZy3TEaaPgTHdnqNauhs931/ElXc7QkesEDJS4uFYFUUMEnFithq8uGGiMbPPpcREaACGlx9sTxkEbMZf1KeBOARujhitMH7WcoIV6TjtfjF4Q9E5GeuJf/1adJYGzt/H3JA/nGyJYULKpA5vR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741108347; c=relaxed/simple;
	bh=tK7rBHUGh88Jv85U3Obnwi/LSusFZfvVT+DZtwysNBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFQayn27u2nWg0ySgLX8Z/l6Gus5mimE2Ni1d/XXiGgj6ikiFFEscTuFXR/53GedG7FRrkL5z1k3rhz4sZWFrCkT0v3dAKSp62a/QyBx2sRjCdtHmUl9LPbnhW6eELDNv1llcTP1xCAIXUFUaV29kOZKe7gMF7bLTpH3dGrcTVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SgJgYQu+; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SgJgYQu+"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6dd15d03eacso124746d6.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 09:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741108344; x=1741713144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huCv0mb4ZOJJrK8J1aZdeB4j1q2c+FJIRS5JdUarnXk=;
        b=SgJgYQu+2UAm9iJIvCNO8UzFEzypayzj6iM3eEGAbcJKJAG44aIrwCfutRhnxKJB2m
         SvDXcT2ATCz9xBOnllCSE/6kGCsvi3uvKTMnen4cPV0939r1rt/joMkJ3QkQhyLOorPc
         5ewPuCrkbkgeFHFMrcUrjctpSNW2RlKuBA1gg6dyUHn+NEdnUR8WWb7lcfNAW8y5jQIP
         gE9bmHZBCGTnaX56Vk3lm2IugCyHLpDPp8KjJA7bMifR1MfQPY0kIpfh5hktFe/AvWAC
         0KqY4QxfuDYUm3fHtJPFt6mAK1Wox7oTy18Lstigv5/7sk+4VwJfi7HCVLzZVQJ4QQpC
         0gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741108344; x=1741713144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huCv0mb4ZOJJrK8J1aZdeB4j1q2c+FJIRS5JdUarnXk=;
        b=etC2nwop08nU1pKjWCEv9bxzDNH8eAgYPTlG3IH1uVEgp7KpDyVM3D1Rgo5awUJ2T2
         Ylk4XioWTYOSp2AliBSLB5o2QmhlpsudAfopnfglAXOCxifhXxkYGydaXiS+0JqE1Fy0
         4mMDIoiAInZ+24O4FYn3m9PiS4Nao/XffahMtvWLPrQmU2gSYd1ABO414QeiJWGldC4D
         CiuBWlWJj9z33gy6KYNOgDZPXLGxJajc48cYJeVDjNmfupO0g+e6QmuBDkH0/pWUz2px
         XTN0Hz1oayBl63GriJ1sKovXQIDD9XR70LYy+jiKBh6ewTA0JmGaSEu63bIuOwOt2gnh
         sFtw==
X-Forwarded-Encrypted: i=1; AJvYcCWqj0gLzPwPU8lOQfF2usZ2pyJn+pA9Chv1SJMQpZIZHrCWNzU+Dt/60mi5RjmpPPHV1VkdtdfwjiSsjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+LDQiKHcHLDEyURMMedCSoI6Q5u8Ga0RAqgkNN0YmiVZmnMU
	MCJBdZO97o1Rj+n7c+1z5UW1drAxnWL0ptngZNuG9VElGW1rycyFSeKa5zUi6kQ=
X-Gm-Gg: ASbGncvyNXL2aw5NyWRMuyYpvOV8+yi99UNud6DkN8+QGTsYMx7/FYiiMYit3obICn4
	rYgY7hNYbLf0z416E9pHdcfaXDmZWjc9/A4Y8+9bx7Y0gATyiEur5cZx+Kvi4CEczuVop6fBNEf
	ZiapvLhRcz6ZpMmSQvL7Ohth/7glppM1Lep3zchRWcF9Xy2x0B+kcM1ov01Bl58zQTXIJJuZdEa
	GrUSt8qFgKX3I7oBgOCI3exqc1d+f2/Gq2hEUodcfiBTqqSFsbO3bJzGZcalmJoGZOIOHYQLD0E
	8GuYaVb+wDMpRPyvHuZvdeFnr04Yv8h1yxvbicQV+RLrSj+o+fduM7gLlIPAmkI=
X-Google-Smtp-Source: AGHT+IHfPOMGCbV4hkPXelv9oZ/KI5jlSwi7fgElY8sgzLskKKZnKJpWwLFxwJldwCE+ZDN8gBZpKA==
X-Received: by 2002:ad4:5fc9:0:b0:6e1:715f:cdf5 with SMTP id 6a1803df08f44-6e8da892b1emr57409106d6.15.1741108344085;
        Tue, 04 Mar 2025 09:12:24 -0800 (PST)
Received: from [192.168.68.113] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6e8bf2c3ed0sm37973426d6.11.2025.03.04.09.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 09:12:23 -0800 (PST)
Message-ID: <5831d9b1-4a05-4a7b-8733-5050588b4e59@linaro.org>
Date: Tue, 4 Mar 2025 17:12:20 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
 <Z8cyt2n7qj4GkcJC@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z8cyt2n7qj4GkcJC@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/03/2025 17:04, Johan Hovold wrote:
> On Tue, Mar 04, 2025 at 10:57:17AM +0000, Srinivas Kandagatla wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
>> both recording and playback. These patches fix issues by
>> 1. Adjusting the fragment size that dsp can service.
>> 2. schedule available playback buffers in time for dsp to not hit under runs
>> 3. remove some of the manual calculations done to get hardware pointer.
>>
>> With these patches, am able to see Audio quality improvements.
>>
>> Any testing would be appreciated.
> 
> This fixes the playback and capture issues with Pipewire, including the
> heavily distorted, choppy playback when pavucontrol is open. Turns out
> that the pavucontrol volume meters reduces the output sink quantum size
> from the default 1024 to 256, which was too low with v2 but now seems to
> work.
> 
> Unfortunately, this series still regresses Pulseaudio as capture is now
> choppy (e.g. when recording using parecord).

> 
> During our off-list debugging sessions you suggested reducing the max
> capture period size (that this series increases) to 6144 (same as min)
> and that fixed the Pulseaudio capture issue. In v3 the, the max period
> is again increased to 65536 which appears to break Pulseaudio capture.

I have verified pulseaudio on my side as well, the 64 byte alignment 
should have fixed the issue on the pulseaudio side.

Did you pick up the [PATCH v3 4/6] ASoC: qdsp6: q6apm-dai: set correct 
period and buffer alignment. patch in your tests?

thanks,
Srini
> 
>> Changes since v2:
>> 	- dropped patch which is causing regression with pluseaudio.
>> 	- setup period sizes only for capture path
>> 	- fix underruns/overruns in dsp pipelines.
>> 	- add fixes tag
>> 	- add patch to fix buffer alignment
> 
> Johan
