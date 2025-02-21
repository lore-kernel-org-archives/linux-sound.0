Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3461205ADD
	for <linux-sound@vger.kernel.org>; Fri, 21 Feb 2025 10:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740132916; cv=none; b=jZy2DsDCp4ORki3//L4Zsmi86HAc0NUMsZIedEZpqnd2Xme2xvoGYChEDigzV58GaV7j5myrci2JQbBf+TlVPILJ8ymhd1xWiSFN1zgzu1976V3jOSdqjxbXljP45bunuJLvKc+A24KUgSKnpgMxfHBUr7R7HjDHhOusFXUODk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740132916; c=relaxed/simple;
	bh=UdcYjV22LJAtanzSNBkgkEhCCbJV4PqgUmZbYYZfH78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7fqRmMz2Ley/rtj5w4VIWGarg7QUZe/I93ivkavsl19BnxK5v4+nT5KMHqUKB6gtQ3iSCQJnaNk4gZdmX1ddfp1gpJejyXUEj0n0mV8mabAmBH4CafiiKfjy8anLQNmhy+W6hOdQ3FCSSc8WKrC97Aj3N8TeOEpRREqKz9qxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wlY7dJEi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wlY7dJEi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso11914555e9.3
        for <linux-sound@vger.kernel.org>; Fri, 21 Feb 2025 02:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740132913; x=1740737713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i87rotjO6zoXIGEp7j7IctCY9/qoavWizZ0RPKxAJoU=;
        b=wlY7dJEiFC1MWUMWTeI/GakHlLPoYi6H8wd85GepYwm7fR7lbDBP91KzJCH78jAK3D
         JDKHptco5BlagjdDG9jSo0lkXRniiPjt4RSXhW3Xv1WSXnR6rPWJ76Z8cXpcl446yby+
         7vUh5jEG/PdRd9A49/FC/yeNYY0np24sLUCeg6Aduolu9qStfW+7bwxBTwOOzxtKr+C7
         RB2MqrcKtlDdYBfjV17Byz9g7NRykTn6Zcj5MJYCseGrsQqUbyGbLUkIimRGwb8V0lOs
         x21wTF9trSNAtSnHjVqDhP5OyzvJbWpBFLwXdo/lT4zHUbGafGwOWf49KlQWTCBRXTP4
         NIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740132913; x=1740737713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i87rotjO6zoXIGEp7j7IctCY9/qoavWizZ0RPKxAJoU=;
        b=vFl0AgcYtTz4zrWZd1XO2dVUkOSRIq1JRSr4ek/mFr/PNoyraI4SjjtSicY1PEI+lQ
         m/B97zaiCxlHfTdyfTdXGIpAqYrnNHPdmnrlfrEDac6Uzdx/pZ36tbnaU9BPcGf3sRiw
         lP9pF6E7cbSMOF7GrkNyb3tRHFW9dOrVz6FMm8BKbzRVP47JJReKgA8/MNsQM449xo74
         tWFO83MNG0GbTco75QVt7ineiNvaQOUYxjfsfC8kld2bjZ/rnoyw8eHxXjJa7JNxBXfh
         8Hq++1OqZpScPkXe1dH6d9C3U21PXk4RwwRw5KViFfbj5gTnhekEIhmb5c14SLa4X2QJ
         qX1A==
X-Forwarded-Encrypted: i=1; AJvYcCWuk+wlEmopz8owHW911b75AULdY9lbDwrMRL0b9Hy8NMms1t5gMuAuB4SwXjhpM1PMvJCreE7/h/GccQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJI+wz6t0gmaMGWKtenqJZvLyusiAF8xANzllHXPAYeq5t8Lp
	h7vviHQqaQeEeoz3icjqXdtHuV6ndzivZ4H3I1k5OQQleZgO2mDVgTlrGy+lIiE=
X-Gm-Gg: ASbGncsGx0yZv4PnTqOwpVIuoH+besnUBtMD2ir96mK1Q0BVyKA44W8xRu2soC6I0H6
	UFlTH3WBjOpg5yo+MVCn59wMl8ZOlI4wWK1ne2Cb3z95tVlhuJt6nRrnTnsBDeYIZZbCHovvOic
	N/DU/cWsufMznbOs9CXnnyemm1QAUmkydE1qSUBMc2Ofy1YHtUBUlzKfHMOBF796lZU87k6oUhE
	v3HGF/Px3EsSRSj+PwgpxF+TFuz5NZkNKCJyIqXTG76BxtRiEVIXFx4DQ3mce1xCeqBwUxvrEkB
	f+VXiOAnUoduECoQYPMCJ1TxoqSwyAZBpWec/2aSSiFY
X-Google-Smtp-Source: AGHT+IGs9NvKFIrKnXrzHMSGbBJ0oy+uXlJm086a7XejqQUgpF1zmN5RxP381nbAlt43bqejwAwrgQ==
X-Received: by 2002:a05:600c:354f:b0:439:6ab6:5d46 with SMTP id 5b1f17b1804b1-439ae21d210mr20795145e9.27.1740132913197;
        Fri, 21 Feb 2025 02:15:13 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f64b0f565sm4215318f8f.51.2025.02.21.02.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 02:15:12 -0800 (PST)
Message-ID: <b359e44c-fb9f-412c-bc3b-f0a129d0c34e@linaro.org>
Date: Fri, 21 Feb 2025 10:15:12 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ASoC: q6apm: fix under runs and fragment sizes
To: Johan Hovold <johan@kernel.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
 <Z7dog3cWe4BroZdT@hovoldconsulting.com>
 <Z7g5c0_vJNpN9fI4@hovoldconsulting.com>
 <Z7hAfGHvdeWpZ4Y3@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z7hAfGHvdeWpZ4Y3@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/02/2025 08:59, Johan Hovold wrote:
> On Fri, Feb 21, 2025 at 09:29:39AM +0100, Johan Hovold wrote:
>> On Thu, Feb 20, 2025 at 06:38:11PM +0100, Johan Hovold wrote:
>>> On Thu, Feb 20, 2025 at 04:28:42PM +0000, Srinivas Kandagatla wrote:
>>
>>>> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
>>>> both recording and playback. These patches fix issues by
>>>> 1. Adjusting the fragment size that dsp can service.
>>>> 2. schedule available playback buffers in time for dsp to not hit under runs
>>>> 3. remove some of the manual calculations done to get hardware pointer.
>>>>
>>>> With these patches, am able to see Audio quality improvements.
>>>>
>>>> Any testing would be appreciated.
>>>
>>> With this series, the choppy (robotic) capture when using pipewire
>>> appears to be fixed (pulseaudio worked before).
>>>
>>> Playback is still choppy (heavily distorted), though, and now it also
>>> appears to be too slow.
>>>
>>> I tested using pw-record and pw-play (and mpv) on the T14s (6.14-rc3).
>>
>> Retested this morning and realised that playback is only choppy (and too
>> slow) while I have pavucontrol open. That would be nice to fix if
>> possible, but this is still a great improvement since pipewire was not
>> usable at all before these changes.
>>
>> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Hmm... Scratch that.
> 
> This series apparently breaks pulseaudio instead.
> 
Thanks for trying out pulseaudio, I will try to reproduce this with my t14.
--srini
> Too fast playback on the T14s with mpv, and after I stopped it I wasn't
> able too play any audio anymore. And systemd complains about a stop job
> running for long when rebooting. Similar issues on the X13s.
> 
> Johan
