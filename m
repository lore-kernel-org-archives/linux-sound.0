Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300EA1EF1D
	for <linux-sound@vger.kernel.org>; Thu, 19 Sep 2024 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726760439; cv=none; b=YaYvSqXyGSxZyk80I6YAZBTACTk1Wbs66y+lMapGj4CVjpJocrmwRl1kTJCjaYdFY5Pj0XQY3/I1HsPK67Hs/p240PENCeYgXMEnvYOic1J3SqeB8unfqUh1UMnR5ANzKLu+z0BWSWFqX9aZaw9fWiGwCCb1Fnzw4wrIYEJeR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726760439; c=relaxed/simple;
	bh=S3jjB0JagbvuniWc1hw9aCEL9jm9m5aL8JTzByVY7z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZmivB7tlMC4MCUs9/9aTznP6d81t66FkJilqyxi2BlvCTqPV2r8p+tEsFi1TxggcpmvBJUxkZMIZWzg/uSGGsTLWKItRRsZSmB7VD2f+DIZlnH4wnrWAXI4EX1huz43/ni8E96SEPmBa9ndgtv1HbLHFyhTDUF8X875ww1g/Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gmVUCZL/; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gmVUCZL/"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-39f54079599so3486725ab.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Sep 2024 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726760436; x=1727365236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6IkoMJd+OMOnoOk1pWpZJ8ZHHOuA8WqT9BG/0ux6KK0=;
        b=gmVUCZL/6+73L7V9VMmIqtpNHYjVSPZV4wdorlblu/MZBA5URCV3046xqheT467Tp6
         m9T2v3P/JDx6lf8YR6NWue4ayCEEWZUKCudkflaW/L2xWjGWqYaGIp/rb7Kv0rRsrZpC
         KFozYHbUDt7L7nKVY+9IzyhrTXTqYWLX9pQA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726760436; x=1727365236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IkoMJd+OMOnoOk1pWpZJ8ZHHOuA8WqT9BG/0ux6KK0=;
        b=rgJsa5DCWt5dJW0VsL/FiFA3jkD5jGCYaSQumrhEgYv6opHbDICCJ/R8edYDga53oI
         vl0NH98gyWDW9j1syFvnHNelJJ0maTEWmVxf0vHO8UyWMDxePOJkrNPGxQ8Bop8ZVUU/
         V0/26Fcz/vEu0jjb8T/7n8XC7/qRQZnGtnE/DEDY81SuadlZvEGde8loBuP/rA9xgUlI
         uShScwMXXlNMVkLG7FWjvofFRJlO4g/pIfCVAqdTneQwxUkMZ3xkzekAnGTCOe+NSZGI
         SrSMOZlFhaozwktlfb9BZIha+F5d4cAxsk8UyHIlT7sPRT/LzK1bHYtQvGNXXK/YSCih
         7QoA==
X-Gm-Message-State: AOJu0Yxdwcbbyd94zVGjKZPZeBokNPFrq+yPKcp/ZV70Z4MQvMjobBc4
	GkhbFLBvzJiuzWgpbH9lwf0IDpXtN0Ih6eKJ4C6pQ6GSJqoQ0I/s9QzJzrfrfoc=
X-Google-Smtp-Source: AGHT+IEruDLQIz1NbajtnHH4BV/rIOv+kAftxwqCcOt/bshhGMnNettNJhh5yGcETaa2+wV+mG0peQ==
X-Received: by 2002:a05:6e02:1a4a:b0:39d:3c87:1435 with SMTP id e9e14a558f8ab-3a0bef3865dmr30043455ab.1.1726760436231;
        Thu, 19 Sep 2024 08:40:36 -0700 (PDT)
Received: from [10.212.145.178] ([12.216.155.19])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d37ed1904dsm3089529173.108.2024.09.19.08.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 08:40:35 -0700 (PDT)
Message-ID: <7caf7242-1ca4-462a-b3d0-627258df3f1b@linuxfoundation.org>
Date: Thu, 19 Sep 2024 09:40:34 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest/alsa: add silent flag to reduce noise
To: Abdul Rahim <abdul.rahim@myyahoo.com>, perex@perex.cz, tiwai@suse.com,
 broonie@kernel.org, shuah@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240915234131.61962-2-abdul.rahim.ref@myyahoo.com>
 <20240915234131.61962-2-abdul.rahim@myyahoo.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240915234131.61962-2-abdul.rahim@myyahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/24 17:41, Abdul Rahim wrote:
> When ALSA is not installed on the users system, the error:
> 
> "Package alsa was not found in the pkg-config search path.
> Perhaps you should add the directory containing `alsa.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'alsa', required by 'virtual:world', not found"
> 

extra line?

> is printed 3 times, which generates unnecessary noise.
> Hence, Remove unnecessary noise using `--silence-errors` on LDLIBS
> assignment, so the message is printed only once.

I would say this message is alerting the user that the package is missing.
Why would you want to delete it?

> 
> Signed-off-by: Abdul Rahim <abdul.rahim@myyahoo.com>
> ---
>   tools/testing/selftests/alsa/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
> index 25be68025290..cd022fc869fb 100644
> --- a/tools/testing/selftests/alsa/Makefile
> +++ b/tools/testing/selftests/alsa/Makefile
> @@ -2,7 +2,7 @@
>   #
>   
>   CFLAGS += $(shell pkg-config --cflags alsa) $(KHDR_INCLUDES)
> -LDLIBS += $(shell pkg-config --libs alsa)
> +LDLIBS += $(shell pkg-config --silence-errors --libs alsa)
>   ifeq ($(LDLIBS),)
>   LDLIBS += -lasound
>   endif


thanks,
-- Shuah
