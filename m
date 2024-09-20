Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF4F17E008
	for <linux-sound@vger.kernel.org>; Fri, 20 Sep 2024 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849500; cv=none; b=LEtKHSnkwZcT3Lk6qiP+tteQ3Z5fl5YAPV316Aq2EF3QZec9Duv2OnH/isxODT7pZ/Cn7dROlU/49Nb5T0Lzv28yBTNgecjjWsVR0pBfM3KamN4c/CcyvNFg/E9lrcb2IKsYDNYBdlxD9UL5ygwBnMSTgdZ/8p1LvgKfnXeQ0Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849500; c=relaxed/simple;
	bh=Lo57eX2x9k6yvg2bMfey2e8hVztipaeaZ3SiF94jyDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+MK3vq+TDVg8FVF73bEjoNDawaBU/WfGqjKA9SSBrPD1nFX3n2rbFzKn15ax5LMuZHMf14+Ek0lk8EQaslWf0PiLbdilMeeBH7g0DpetjPFnLQihVIWcBACJYP97Vlu0X9eq2sU5qnnRBc/vB7AuJSLijnT+uU4mmr5N5qdCm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bfO3RnVz; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bfO3RnVz"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a0c870ff25so5707475ab.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Sep 2024 09:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726849498; x=1727454298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETzjk99HfOyExYviklOPPMMoaRaeOvjJU32oW0oE2qo=;
        b=bfO3RnVznDtz0ni9kvewetWodGbOSrjXOLLlnJPxKYj3FQ4O7yOXVN+S0gVwR2yVRg
         cAg+gu0JaQulpamAdwqjPoGqn2bRfWHLgJl4t+c69HHl0sW77Bh/8kDx02hUVYrrGRHI
         8iLsrgZOmrP6DICh8O48eOKVYBkt4cVB/kyQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726849498; x=1727454298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETzjk99HfOyExYviklOPPMMoaRaeOvjJU32oW0oE2qo=;
        b=FvJG+HRtBPbUtrIMsAaW9l5gPsVnuo4JdAbZuiDQEkCg0BfMIN0/3mpz1l54ZWB+sQ
         RKWXjf5P58KJOWUTZyS+xY3NqoL4unbOldIMobLi9BJosjuHPe8REfrHEEIoHZH+87uO
         KaFooVBZ08Xy+JakzCEAe2MmMhmYaGDUu+I4iP65ue+bEOTAwIuNtXU1t9vMypKP1v0H
         zBzVeidqB33csYGdgl8N1wRd2HauWeTyvu+NPNv6SZl6ZWbpkysHFP12NmWg8LwAb5Ev
         fA+MoowCTUzUbiidGvWHi65dM3lGp2Xe594j1PiEPuK8csTdFeaQQ7uRCpjzHbv6p5ML
         rM+g==
X-Forwarded-Encrypted: i=1; AJvYcCUREYcJpk19/Jenrpo4chqQOiRYJyV7KR/QlOL3WbtIqWUZd+zGzX6y4Dc7iMdWMODRKBa3B+cXtdMPmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhl4ympCbWaZd4c/1Ce3k/AL1usQiiqEYYmtWY35dnrccYDczv
	8kRFszpJygmTZGVFa/62ZDiXO6tD8WaGj/N3yB1sJ/2MvF2Ww/oyEuihjzx/qGQ=
X-Google-Smtp-Source: AGHT+IE2uigUmVj+vxJgtES2OgC740iUyQL252JUzMrivDAeT+DIiYvxOM1axog1ETSGFzr32I8+EQ==
X-Received: by 2002:a05:6e02:1e03:b0:39f:6f8c:45f3 with SMTP id e9e14a558f8ab-3a0c8d25d74mr32825515ab.16.1726849497965;
        Fri, 20 Sep 2024 09:24:57 -0700 (PDT)
Received: from [10.212.145.178] ([12.216.155.19])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a092e1b608sm42277985ab.38.2024.09.20.09.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 09:24:57 -0700 (PDT)
Message-ID: <62c6883c-19ca-4ccb-ae78-dd3e665fca08@linuxfoundation.org>
Date: Fri, 20 Sep 2024 10:24:56 -0600
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
 <087c4ef0-5718-48d3-9367-1d79a255fab1@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <087c4ef0-5718-48d3-9367-1d79a255fab1@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/20/24 09:27, Shuah Khan wrote:
> On 9/19/24 15:49, Abdul Rahim wrote:
>> On Thu, Sep 19, 2024 at 09:40:34AM GMT, Shuah Khan wrote:
>>> On 9/15/24 17:41, Abdul Rahim wrote:
>>>> When ALSA is not installed on the users system, the error:
>>>>
>>>> "Package alsa was not found in the pkg-config search path.
>>>> Perhaps you should add the directory containing `alsa.pc'
>>>> to the PKG_CONFIG_PATH environment variable
>>>> Package 'alsa', required by 'virtual:world', not found"
>>>>
>>>
>>> extra line?
>>>
>>>> is printed 3 times, which generates unnecessary noise.
>>>> Hence, Remove unnecessary noise using `--silence-errors` on LDLIBS
>>>> assignment, so the message is printed only once.
>>>
>>> I would say this message is alerting the user that the package is missing.
>>> Why would you want to delete it?
>>>
>>>>
>>>> Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
>>>> ---
>>>>    tools/testing/selftests/alsa/Makefile | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
>>>> index 25be68025290..cd022fc869fb 100644
>>>> --- a/tools/testing/selftests/alsa/Makefile
>>>> +++ b/tools/testing/selftests/alsa/Makefile
>>>> @@ -2,7 +2,7 @@
>>>>    #
>>>>    CFLAGS += $(shell pkg-config --cflags alsa) $(KHDR_INCLUDES)
>>>> -LDLIBS += $(shell pkg-config --libs alsa)
>>>> +LDLIBS += $(shell pkg-config --silence-errors --libs alsa)
>>>>    ifeq ($(LDLIBS),)
>>>>    LDLIBS += -lasound
>>>>    endif
>>>
>>>
>>> thanks,
>>> -- Shuah
>>>
>>
>> This can also be handled like this:
>> ---
>> CHECK := $(shell pkg-config --exists alsa; echo $?)
>> ifneq ($(CHECK),0)
>> $(error Package alsa not found! Add directory containing alsa.pc in PKG_CONFIG_PATH)
>> endif
>> ---
>>
> 
> This is a better solution than suppressing errors.
> 

One more thing. "make kselftest-all" has to continue even if this error causes alsa
compile to fail.

thanks,
-- Shuah

