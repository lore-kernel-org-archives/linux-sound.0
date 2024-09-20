Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF2DC13B
	for <linux-sound@vger.kernel.org>; Fri, 20 Sep 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846028; cv=none; b=i5JtuY9qFE382hz9YiBkOj0ITkO13sDDjlRiihA2lON1NtYWR6i61h8XsEUa+cR7cqI8C92VV66IYnQ3KEaGDE4YrtHlNPubHpd/McTRc3XTm7xM2gWrNZkiyhN5axkQp0vT/e6L5cAppSEyiMZ9smeyMNL+DOabYTpHi2BW3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846028; c=relaxed/simple;
	bh=xz0x9175WZBvHTtcLhiapEi3wXQUgGnXMz1S0gzyDIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mTt/FdxxZsv6qYr0NeyhRwdcAzgY1gwc5qF8fIy63FqrzL00Vw3n3dSL+QjYzD6RsEpEkBHTSOaaytd1Uze6Z53c6T16HyhYFX1eTOxBFrltgKQmBszmw0nxUW0T8MY8v9WJ+PQKplBfelFzS2TlvDTtmJTGzskRAgTu7DFnIQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gtG2y6+t; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gtG2y6+t"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-82aa3f65864so81247439f.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Sep 2024 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726846025; x=1727450825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQqtLqg7w2nloL0eri0bb/8RhGQn9bvBMsHqsJUuOcU=;
        b=gtG2y6+tFpHN7RFjNfcfzOVeVjxdRAlWhM+ez8pz3fr/WOyQjesRG+t2liks3TLrbC
         jsmLPDpHc1e+QD1n6QfyVRF9gaPiY4O15ldct0pCmzyG2E02V2Vq2x6SwhLCaEv/3fIh
         4EZGTH84744foic55+3mLlmkUn7zQDkdhMvM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846025; x=1727450825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQqtLqg7w2nloL0eri0bb/8RhGQn9bvBMsHqsJUuOcU=;
        b=fUuhgM9V2B7t+2Cew1eSG1yl9XfRa8di5v650yrKwhB97Ii+FAro+gkfmPfWXbXGeR
         Jkvlnbtew72D8X78bw2k9fsb2wHzy36LQPybD+ahJhY1yUc1rURw1n5QkGw9IV6wPai0
         EeYE8/1x4sroNCIqFd2jNjiaOpFenC+XtE7Dct5r7MEmu8olhRIfTCSE6eKtQFBvJYDe
         ZyIufveyGPAEbFXIeJyyHkGKwHYK538zzpOAyii25PQZdP5tsNfk12Ri5htgjJ5GTlWb
         zirEL3LBt+KlcO3E/f3QDoLiNWmG59rUuVjuglaya47I9EalBPSEt8qXtnTiLujjgZW0
         T7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWOOri/zFzBsV2H0ripIur1NHBRq9RB3cS0/KKFy6wIg0jUwRDsX3iYAGuEWLp0RpbXIZvILrLJ/nrH0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIDDExIiv2KtcfmdpnBE4E7WYNQNWlPK2b2X5hf7ZaLhX9Kdb
	BaH8UCWl1p5z2BpZuT1RjjVnphQVda1ZWYLS/aQ1f50rtvRXKsdW7pC8wP2KbGk=
X-Google-Smtp-Source: AGHT+IHnnbUTaat78VyVNLDYZw22fhZWAPFLJavTXG4fNQ9OcHYOZJZIjrH3uBDqYdvOIn4S00vmew==
X-Received: by 2002:a05:6602:2dc9:b0:82d:f4f:f49b with SMTP id ca18e2360f4ac-83209ed375bmr335337939f.16.1726846025576;
        Fri, 20 Sep 2024 08:27:05 -0700 (PDT)
Received: from [10.212.145.178] ([12.216.155.19])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-82d492694a5sm379110639f.11.2024.09.20.08.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 08:27:04 -0700 (PDT)
Message-ID: <087c4ef0-5718-48d3-9367-1d79a255fab1@linuxfoundation.org>
Date: Fri, 20 Sep 2024 09:27:03 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest/alsa: add silent flag to reduce noise
To: Abdul Rahim <abdul.rahim@myyahoo.com>
Cc: perex@perex.cz, tiwai@suse.com, broonie@kernel.org, shuah@kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240915234131.61962-2-abdul.rahim.ref@myyahoo.com>
 <20240915234131.61962-2-abdul.rahim@myyahoo.com>
 <7caf7242-1ca4-462a-b3d0-627258df3f1b@linuxfoundation.org>
 <vzrosmbs5x5mmnxwubwljjqxo4m4eih35z26cudshpbr3uue7j@k3v65fkr24rz>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <vzrosmbs5x5mmnxwubwljjqxo4m4eih35z26cudshpbr3uue7j@k3v65fkr24rz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/24 15:49, Abdul Rahim wrote:
> On Thu, Sep 19, 2024 at 09:40:34AM GMT, Shuah Khan wrote:
>> On 9/15/24 17:41, Abdul Rahim wrote:
>>> When ALSA is not installed on the users system, the error:
>>>
>>> "Package alsa was not found in the pkg-config search path.
>>> Perhaps you should add the directory containing `alsa.pc'
>>> to the PKG_CONFIG_PATH environment variable
>>> Package 'alsa', required by 'virtual:world', not found"
>>>
>>
>> extra line?
>>
>>> is printed 3 times, which generates unnecessary noise.
>>> Hence, Remove unnecessary noise using `--silence-errors` on LDLIBS
>>> assignment, so the message is printed only once.
>>
>> I would say this message is alerting the user that the package is missing.
>> Why would you want to delete it?
>>
>>>
>>> Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
>>> ---
>>>    tools/testing/selftests/alsa/Makefile | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
>>> index 25be68025290..cd022fc869fb 100644
>>> --- a/tools/testing/selftests/alsa/Makefile
>>> +++ b/tools/testing/selftests/alsa/Makefile
>>> @@ -2,7 +2,7 @@
>>>    #
>>>    CFLAGS += $(shell pkg-config --cflags alsa) $(KHDR_INCLUDES)
>>> -LDLIBS += $(shell pkg-config --libs alsa)
>>> +LDLIBS += $(shell pkg-config --silence-errors --libs alsa)
>>>    ifeq ($(LDLIBS),)
>>>    LDLIBS += -lasound
>>>    endif
>>
>>
>> thanks,
>> -- Shuah
>>
> 
> This can also be handled like this:
> ---
> CHECK := $(shell pkg-config --exists alsa; echo $?)
> ifneq ($(CHECK),0)
> $(error Package alsa not found! Add directory containing alsa.pc in PKG_CONFIG_PATH)
> endif
> ---
> 

This is a better solution than suppressing errors.

thanks,
-- Shuah

