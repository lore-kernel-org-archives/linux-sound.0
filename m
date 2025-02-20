Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90092135A4
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740073454; cv=none; b=h1NBnpX8fKSWcSINA4InqRlVmz6tN/H/roqGpmDoqNCQv77gzlOohP2e78ciMXTRwyREo8lddEyRo3ViJwpSY/eiH/i/+czVTL8cseQay/O/iagtetocjkOgN54DpriQcz3p6rcRE4grBruaOd3lUfQVfED9XDpotZ7dbUQbAIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740073454; c=relaxed/simple;
	bh=DneaOLbAQ7VQD+JuzmSchiqjCJyQCKdlD8hIDvj4wBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLtNK+lJCqaAotTKr2OUG5tJRg3w6lKktMyefrwn4P2X7Erbci5Hs3pb+oqz5pxrPRJyWEKpHcXVlIBD5TLCF2eAFsTQKIdNWotrlbjKZzP9LqXL736IbJUOY8wz8kvWKrGC9PZsFru1vFIIgJ3VV8At5Skhd/OdGMMyJZTvlh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tpY863UG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tpY863UG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-438a39e659cso8398075e9.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 09:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740073451; x=1740678251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZRZWiGBAfgL83TcOf96tTHitqDUChal+U/SH39N6Mw=;
        b=tpY863UGoj83sF0rTFvH60dFd8TQ00iFmPXsbTcOiIL+CE2+xmlJJQZzdCvErBURvw
         u75HcNB2/5sS2mQgL0OkBlVVdVWmiTCBOwH5SqYy/irLqsgZZ3JDiCeQzbIpA0/5qAhz
         2cpXdqtE/rEuabyum3+3HAq27URYX5hHKwy2eMcdOTlPbYz4MPWVVz9TF+8zZY3SVb6V
         tiLPXnFGtyWzYfkM/2HPCOG7NxWHIIlLKDqecI4RxVsam0OebuyxaveMjIE9J0u1N+rE
         ss/Zs3x4gizRfdaSz4MQXD87nXcJg1zHKMJqcfK6qaOrHhCQTp9+UbFnYN/gXzW5JDfH
         iuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073451; x=1740678251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZRZWiGBAfgL83TcOf96tTHitqDUChal+U/SH39N6Mw=;
        b=YiB6pD4hFX56Nw3gbrEvyjeSeZcmU3Sxg3qcvHQ1nMbwz+dN8WSjMkxTLltdID/kD+
         y3whsGd1xlT3qsfwCJzXEpKKsjUwhRL7M3L3JXyg3yUIsgD/wqXKUKHGz6h/Lo2kza0X
         RbKWM6dumeCk37VfkRhX/oN2caCS1gAhISGo82uj5HuFfRysSplBHcX35ge+fj4rb5tL
         dADsrT1mTrl/lOiGzMQdeg/uMP5D7CFvy23uhD7pX7cTnh9CVL/N6PmUP4ZwqNil65qM
         ytzgfhRtdd4Aasb/H7l+pwRl2y5cGVBt4floRXOyu+8tSb9VjgLZPTTDvaKTliin/fK1
         nPWw==
X-Forwarded-Encrypted: i=1; AJvYcCUKB8lshJ0S/HOL9qkH+xNeOQO1QH4xdJs9ERFejlZgQoJYAluumuKWQ/0S8d53mW8o0GXANAwnxPibyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWQOhLk6U8+IJlxdOdOpyFafwfABGjgSIHIsRt+Da0Vx4geMY
	uok+HvIpM5iSf3j5w41fUXfflx86pNIlWtfQ3bOxTSqj9OO6oaC7i2cKES1yh2E=
X-Gm-Gg: ASbGnctUCdQA1yFxMGp4mxCTeAKa3oncg2Wn5gKMoa0FOJWqvKy1tZKUN37BEd8+S/F
	J1EqjsgoLPTxwxmuc66VxIdV0ViIcemqttumg41lpPwN86WDKFZ35JTkXixyNWJGdoKW5o9AaC9
	llVStSgNFnnML31GIkLsyV7jJwOurBmIF5crtpbUY504fNkHP4SWgZMc88pGkMzBpvDj/NA235Q
	20DpWyOBsGmzzifNUX6xstADTkXUrZqRg4KJVkOYNo4AFlwUT6c6lkRSiIT7XPfbBlIcB2IRzVR
	v3EVapK+nBt83vniVqHheDvHEm0UKEJsDQ==
X-Google-Smtp-Source: AGHT+IFe6CdnY0iTDDh64olzUg8kY4wR9n3edQZV0kmbJbpdhL+rgUP7hqGBidLPFVQcmbfkko7vlg==
X-Received: by 2002:a05:600c:3b8f:b0:439:9c0e:3709 with SMTP id 5b1f17b1804b1-439ae1e858dmr1240095e9.8.1740073451357;
        Thu, 20 Feb 2025 09:44:11 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43984dd042fsm123446215e9.12.2025.02.20.09.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:44:10 -0800 (PST)
Message-ID: <2f8a46a5-80f4-4c79-9493-6137e1f4940e@linaro.org>
Date: Thu, 20 Feb 2025 17:44:10 +0000
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Z7dog3cWe4BroZdT@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Johan,
thanks for testing.
On 20/02/2025 17:38, Johan Hovold wrote:
> Hi Srini,
> 
> On Thu, Feb 20, 2025 at 04:28:42PM +0000, Srinivas Kandagatla wrote:
> 
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
> With this series, the choppy (robotic) capture when using pipewire
> appears to be fixed (pulseaudio worked before).
> 

> Playback is still choppy (heavily distorted), though, and now it also
> appears to be too slow.

Interesting, Am running 6.14-rc2 aswell on t14
Both pw-play and youtube, it seems to be fine.
Let me check my pipewire config if I had disabled the tsched.



--srini

> 
> I tested using pw-record and pw-play (and mpv) on the T14s (6.14-rc3).
> 
> Johan
