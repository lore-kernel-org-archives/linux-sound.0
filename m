Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11C013D289
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715244977; cv=none; b=lXx/g45zWpfKdmrmwAu0nhDZNDl5tlFAhZIngwNBsxA9W/GhnaQ21ilf2ugYQwfTH6v5otYUxsHYGJk/9wuscsJJTl714OZUtxsCGLD9Z354saGfgfbsssyYSpOM2fmdRA2uvhXSZrmA9VB/8txbK89GEwjyBAu9CwlgIXcUD/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715244977; c=relaxed/simple;
	bh=9r9aRPIA1iUn5FuzJXS3c8MvmE/isInCkahcUkIdeDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jWZBb9dv22EQMr1ll44yfTf7egaja2fYAV4piWjsOErdMVvxwOOJbHnJFOLNP9oEFanRZCvn95ufsHLGV9WhaHcrVNXyP81zzLGaL+HmiXovOhzY/9aWa7trCXoRn2L5mBpwP2yTxy+2vYfd9dRernoC+YaD/qEu3fg8mqdQq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbDmYc9Q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbDmYc9Q"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34de22deac9so36665f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 09 May 2024 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715244974; x=1715849774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkVApnHnFJeyRYA+9uvoXILH0SyZb42FlpVdJsQIvzk=;
        b=nbDmYc9QCCOmWW9RREByJuCDrFPif3JeLadsDr8vG1TZLXmY/bJc4Xz6Frg4t8US2Q
         vGO8dOT2i/fEPAEOFr8DJ9Vjqvw9ox15QorNv1sx0klzncdT78bGHWtqrGcHMHW97v3s
         GOLsIKwvwWMxqoWEzWj3BR6+JdebcCRp4iBt+iyrjmJEJhWK5SlulOCi/i+mnGltjcEN
         1CUobGo4cL3mTeDjtSY9aiNOLmIRWW/Hi7th4o0lc9hsYnR1FMCd3GFZVJNnKoC+iI5m
         rqYeV+RLNlF8somWnhYagoCQsGE2h2jjHvGe0e+8FVPhons8dX3jkIz0/8TYK2pYqdGj
         9JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715244974; x=1715849774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkVApnHnFJeyRYA+9uvoXILH0SyZb42FlpVdJsQIvzk=;
        b=dHoBIdTSuRsU4m5sEySYf9diNk/Lu0JGSQxZ6L6MOYdyxK7VIZn+8t9X9/49KYG7RX
         CGka0z6BzsinJRknZf4JzuW3Al3+GwL1XU5UrO9ec1RpOHgQjI0L7TbZ7JjJxHAw3kaX
         GXShK5/cNQ5dfet+zVBwo4uABDaSLr9k7POYpwaeOkdbYC0i+l/T19jqsYWsl+GpIbmr
         Qnuz+GkvZkNeuLj2oMg4TPI0dzkWYT/Z4VMOL9jhcu1KJ/2M0Xuse3iwk9pJp/s7F4gy
         cusKzQQJiS5smYEE/SKa86P9/IqlqaJaeECiK36Mcx7mBhu5yvVp4qf+vHi4EsJ8D2YA
         3yww==
X-Forwarded-Encrypted: i=1; AJvYcCXFRFMNjDbRCxM9inbDAVVMl+I4XaDd2DakRr7qCtJ9Qz8fQKzlZcUMygoby1yFHlupCgYyZFT2sH+wD6o7LJV9nMfipw33tpnHQYg=
X-Gm-Message-State: AOJu0Yxz6CyW1skxVXxYm2JzghKTAx1GDVlGYiQ7aoRgfqw0fNGBiCGL
	0/2JNbwTV6QPuLj11gS0wYrD8nHhJ+fYIkQY5aZSuSg5cT76ySff
X-Google-Smtp-Source: AGHT+IGsor45MFYW7KvnK1x6nJ3danBqtsnKoHtqsMWY1zoGwOX98YmBNejpBAZsd/C4TeJSBqE+LA==
X-Received: by 2002:a05:600c:4f49:b0:41b:e58c:e007 with SMTP id 5b1f17b1804b1-41f71cbf49dmr36510955e9.4.1715244973901;
        Thu, 09 May 2024 01:56:13 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:d20e:7300:e3bb:8444:4138:914c? ([2a01:4b00:d20e:7300:e3bb:8444:4138:914c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacfffsm1114319f8f.75.2024.05.09.01.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 01:56:13 -0700 (PDT)
Message-ID: <74b12ff3-ad65-4db8-881f-98dc9369e2d4@gmail.com>
Date: Thu, 9 May 2024 09:56:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] ALSA: pcmtest: Add missing module descriptions
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20240508091128.25274-1-tiwai@suse.de>
 <20240508091128.25274-6-tiwai@suse.de>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20240508091128.25274-6-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/24 10:11, Takashi Iwai wrote:
> Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
> let's add the missing information.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/drivers/pcmtest.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
> index b8bff5522bce..21cefaf5419a 100644
> --- a/sound/drivers/pcmtest.c
> +++ b/sound/drivers/pcmtest.c
> @@ -772,6 +772,7 @@ static void __exit mod_exit(void)
>   	platform_device_unregister(&pcmtst_pdev);
>   }
>   
> +MODULE_DESCRIPTION("Virtual ALSA driver for PCM testing/fuzzing");
>   MODULE_LICENSE("GPL");
>   MODULE_AUTHOR("Ivan Orlov");
>   module_init(mod_init);

Hi Takashi,

Thank you for doing this.

Acked-by: Ivan Orlov <ivan.orlov0322@gmail.com>

-- 
Kind regards,
Ivan Orlov

