Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1031C7E56C
	for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213144; cv=none; b=nGReFEHyGWe6oqNo1dYi8LixYR//nKELRTNdeg4u8BaF8zKfkbU2bueVXLKAC9EgJOx9wfc1IAn6n+ahFr2FpDlTtK/JksZ+cSrkN/vh+E+/7JP5nLpQGJ8CtTO9RYNZvEntyodV7CDPuOSPo6DHi/zwgqEx3tfyvM/uNIkIfYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213144; c=relaxed/simple;
	bh=47902Agb+o7OU9tVAh9wEpUgHCy4GoimO++RFGUGc5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LJM55oxrGZsTL2B3rjdIyQMi1qlq4L3o4MlxubzoJVvYH+NNmUYj6RD9V7+f9OB7ZFeD43HritlacgBeGltE+2V9X5wJubbP2I14hgtsCQn20QRtSvwxwkf07KpOvyZApd7GbSH8OPqYL7ndsCF/vAKm2MU7yrzCXobi4RVcuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbBA8uIU; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbBA8uIU"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33db19538d0so154870f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Feb 2024 05:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709213141; x=1709817941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3e5vUFAkBoEFioLbyBAB4Ly+coy7PI9GjR9aaf5+AzI=;
        b=CbBA8uIUp+DA4ZSR3ZmfxDc4X7+W6iuQ/UzYCk0y7nV469N+GYc7++mmV9RBkLztPT
         0jp0gfuT3ju8idpwuLjs9yw3CG2qgX7m0IAmjlzvLiYS8m/u9Z/DdApdCZMgtwYHml3h
         u+pH+IX73BMwslF/1Ll+VUozdPWT7GBEok8tbpfFJ5k8PAOTSk76ZhKBR0Lkx3PBPTJ0
         Y97tVgR08SF6nUPG9JsyGPS0/6udW3sW5MCvDc4oCO64xbUrqJxubV2iKCFmh88Awxxd
         hTsCqSwHf9SlsXX9YxjXlD/6ulYJ7ZJUhb1m+aKpcl5daMZpQvSl91tmEyQvepBLM4iR
         8YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213141; x=1709817941;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3e5vUFAkBoEFioLbyBAB4Ly+coy7PI9GjR9aaf5+AzI=;
        b=H1DEsCMNh/Q37I5FbWOYNl95ljQkMHVU+6yhTmAeSe8L6Y71hAzFlUlszxyKj0dPdg
         zWyDdiezp56mZJQ60wIt/PoK33vmlFGQC+2OxV1B5gcU3so47Nglyx28wjfdHSuXQrfT
         /9ZaouZAnRYMlGiMNy4k/r7ajHtAW00xZhNdSD7tyKrHtotRcW8UfXDK1NJCS4ifaqVt
         bbJ4ZYmIVnNOtCG5FIM/8efNk5NkA5kso4d9NAkes42cK3UUdbpImUc5Qrc2hvkGcAZQ
         SJFquFgI5yT6AXyn6G89+QK+jQO64jDBYVTPf5cbrUeF0WhZGbijKa/YCZ9TRZ/yT9/z
         Nu6g==
X-Forwarded-Encrypted: i=1; AJvYcCVdWNFlungi+UEj0sY56YYnSJ9BrhW7FN/CXI08gKYQMSO+Uc4RdUSDKfuWlaziY4ZH9mIvZQK032+mmuBavAoaxX7EQ/Wa3vdtlWw=
X-Gm-Message-State: AOJu0YyK03ESdSZCIpABbSBOtU3zP9tlWH0Vln/+/G5bbaeGBJdf+jvF
	0Nefo4m8QHgA0So+sxxfsQzfC0S3tiIRIaHen7OxGDq0RsiQEJEjt7uK8iyo
X-Google-Smtp-Source: AGHT+IGUUv9AO6lpENlFEy0ikTmPeNMdpNZcPFRrLUOPZse8svYTSjxGeDLtOwxy44JFeK8clfqIxQ==
X-Received: by 2002:a5d:4b91:0:b0:33e:cdb:e041 with SMTP id b17-20020a5d4b91000000b0033e0cdbe041mr1429511wrt.2.1709213141075;
        Thu, 29 Feb 2024 05:25:41 -0800 (PST)
Received: from [172.16.100.85] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033e052be14fsm1743209wrw.98.2024.02.29.05.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 05:25:40 -0800 (PST)
Message-ID: <7d2d2309-6538-40fc-a363-842a95ea57f0@gmail.com>
Date: Thu, 29 Feb 2024 13:25:38 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: kunit: Fix sparse warnings
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
References: <20240227104912.18921-1-tiwai@suse.de>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20240227104912.18921-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/24 10:49, Takashi Iwai wrote:
> There were a few sparse warnings about the cast of strong-typed
> snd_pcm_format_t.  Fix them with cast with __force.
> 
> For spreading the ugly mess, put them in the definitions
> WRONG_FORMAT_1 and WRONG_FORMAT_2 and use them in the callers.
> 
> Fixes: 3e39acf56ede ("ALSA: core: Add sound core KUnit test")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202402270303.PmvmQrJV-lkp@intel.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/core/sound_kunit.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/core/sound_kunit.c b/sound/core/sound_kunit.c
> index 4212c4a20697..eb90f62228c0 100644
> --- a/sound/core/sound_kunit.c
> +++ b/sound/core/sound_kunit.c
> @@ -17,7 +17,8 @@
>   	.name = #fmt,								\
>   }
>   
> -#define WRONG_FORMAT (SNDRV_PCM_FORMAT_LAST + 1)
> +#define WRONG_FORMAT_1 (__force snd_pcm_format_t)((__force int)SNDRV_PCM_FORMAT_LAST + 1)
> +#define WRONG_FORMAT_2 (__force snd_pcm_format_t)-1
>   
>   #define VALID_NAME "ValidName"
>   #define NAME_W_SPEC_CHARS "In%v@1id name"
> @@ -104,8 +105,8 @@ static void test_phys_format_size(struct kunit *test)
>   				valid_fmt[i].physical_bits);
>   	}
>   
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(WRONG_FORMAT), -EINVAL);
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(-1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(WRONG_FORMAT_1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(WRONG_FORMAT_2), -EINVAL);
>   }
>   
>   static void test_format_width(struct kunit *test)
> @@ -117,8 +118,8 @@ static void test_format_width(struct kunit *test)
>   				valid_fmt[i].width);
>   	}
>   
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT), -EINVAL);
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(-1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT_1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT_2), -EINVAL);
>   }
>   
>   static void test_format_signed(struct kunit *test)
> @@ -132,8 +133,8 @@ static void test_format_signed(struct kunit *test)
>   				valid_fmt[i].sd < 0 ? -EINVAL : 1 - valid_fmt[i].sd);
>   	}
>   
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT), -EINVAL);
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(-1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT_1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_width(WRONG_FORMAT_2), -EINVAL);
>   }
>   
>   static void test_format_endianness(struct kunit *test)
> @@ -147,10 +148,10 @@ static void test_format_endianness(struct kunit *test)
>   				valid_fmt[i].le < 0 ? -EINVAL : 1 - valid_fmt[i].le);
>   	}
>   
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_little_endian(WRONG_FORMAT), -EINVAL);
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_little_endian(-1), -EINVAL);
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(WRONG_FORMAT), -EINVAL);
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(-1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_little_endian(WRONG_FORMAT_1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_little_endian(WRONG_FORMAT_2), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(WRONG_FORMAT_1), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_big_endian(WRONG_FORMAT_2), -EINVAL);
>   }
>   
>   static void _test_fill_silence(struct kunit *test, struct snd_format_test_data *data,
> @@ -177,7 +178,7 @@ static void test_format_fill_silence(struct kunit *test)
>   			_test_fill_silence(test, &valid_fmt[j], buffer, buf_samples[i]);
>   	}
>   
> -	KUNIT_EXPECT_EQ(test, snd_pcm_format_set_silence(WRONG_FORMAT, buffer, 20), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, snd_pcm_format_set_silence(WRONG_FORMAT_1, buffer, 20), -EINVAL);
>   	KUNIT_EXPECT_EQ(test, snd_pcm_format_set_silence(SNDRV_PCM_FORMAT_LAST, buffer, 0), 0);
>   }
>   
> @@ -272,8 +273,8 @@ static void test_pcm_format_name(struct kunit *test)
>   		KUNIT_EXPECT_STREQ(test, name, valid_fmt[i].name);
>   	}
>   
> -	KUNIT_ASSERT_STREQ(test, snd_pcm_format_name(WRONG_FORMAT), "Unknown");
> -	KUNIT_ASSERT_STREQ(test, snd_pcm_format_name(-1), "Unknown");
> +	KUNIT_ASSERT_STREQ(test, snd_pcm_format_name(WRONG_FORMAT_1), "Unknown");
> +	KUNIT_ASSERT_STREQ(test, snd_pcm_format_name(WRONG_FORMAT_2), "Unknown");
>   }
>   
>   static void test_card_add_component(struct kunit *test)

Acked-by: Ivan Orlov <ivan.orlov0322@gmail.com>
-- 
Kind regards,
Ivan Orlov

