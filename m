Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3354E189BAC
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945759; cv=none; b=RI7u1UZ6FnbP17EeEjhnKeiZFdSiRA7PJi0zsxQInxXvURQEP+m3ks744xjD5MksNDBMttv1i6xBJHht2u9rFm6N9xijBoonJ55iqMKKaZhHLdf3+mAvdRFqbUdEGajs69mM4Jx97OQ7OMXRA2CCN8eQ9EL8cCiyJ6xvqpbAbwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945759; c=relaxed/simple;
	bh=57uHeJssUhSTwboeRjLbjHP/8gebXbxQ08iLQ68S9QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSJp/p6Tt01lvSQyP7bgQsY8JTMHj6jcWSoxNwF73k8wZUWxVxJChM+3Qujj/M+n9ppbRKoVxvQ37S9v3fAzNUxlzg6CceHfSr/4QOJPEEEUT5r0CG5A3cPxU5HfmRbqyfxMouUeS260s69ZKqUiCM2qcmZtm36sLOeraavXe+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mtEJ1Sr2; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mtEJ1Sr2"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3eba583fbe8so632334b6e.3
        for <linux-sound@vger.kernel.org>; Fri, 07 Feb 2025 08:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738945755; x=1739550555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5z98lSfe6WwRG+wC0Tg6PRqMgic/o2qF3h3J+ulLEk=;
        b=mtEJ1Sr2l7/lIK8nvmtXf2sOSfDvQGnL/msUKLZ4fK99Rd4clSOcYOIj0eFfGaLOdX
         PhbPZ29bbmJC0xUP5e0yRlFjkXShnUq/dnZ/WcJcZ9M7t7eYficY5G1lTOMk0+/DyFz7
         e7suiMpue9zPF6ivH9gxewbO9CUN2xj5AcJLrNAWv/c297UzMkAI7UiZLl1csBec2nzX
         TKEh6k+Px2lri8jnJt3ooEj+r4MH63cF5+lZ0wLdUaKwV8lZvZ4i9cjd0QcxPZu2haAn
         qI9z/jykdLqcHLrqXuxBKAy1uKVNi2IOwAJY0Rl1NN0AWeZ68C+NE4/maNTj/grV7fSA
         H/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945755; x=1739550555;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5z98lSfe6WwRG+wC0Tg6PRqMgic/o2qF3h3J+ulLEk=;
        b=tCMf/wrx6J5HIHTsdtNOszh1MDeoUPFprN//DDinDxp5hNRv/NuM2G/tPie+GfrAob
         oTMovrpd1pAdAwnjEwJQq1qnuHjbs8/GWjlXBUW/1+LKuPrvVEFvqNV9DC3EF402Vg68
         8W5w4PHT97hAgkuVAS8Zki1wkfKj+OTfy0MJm/KSFlOewAGMfKUMiWROUBOQRTbeGyTH
         dmIHrdF1Z18b/8ys4kr3r8yX9IQw6mUJaDm+l5GRpxZX7d22QNKQtkiOTv0CSvdLEpWl
         vkYbaaM4/LsF7u3PbIR10XGhNV4rAKKVsgSTZryPgbsk2oEw8PU51UoV0Q3moUPNrYAL
         9e2A==
X-Forwarded-Encrypted: i=1; AJvYcCWLm0w+oyrq/ghcaBHQkxMZI2d57qViSsWjHMeXf2eVu+YP74C+jYBj/X2q5SImRrWWhr+YsQtEPIgO/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5LZLfltN7K8zsCUdhtbRSX26nvTw6nHoeqr8c2Yuew3nVHk2M
	qgsa3mhiV+H9SmFbe4c9/2uatyllciri/+PkgCVDt+STaaBFJ8Etx2nBP5wV1lo=
X-Gm-Gg: ASbGncsCUz3Or3nRnuIzff0dD00prJChOcymA2usEJOP0xqrmE2O0s+aU4SHxYZ53vM
	BQoDYlHdcjHEqTTswEx9GHLqWSEsTMep5UQq7AjQakR2puovSxviYvT8voSdHyHJh8JdMLcF9E2
	pkgK3tIcwq9yiI1W9vzDhniBX1ZiFl9SkJNCh3ChndUqKIxKg1LNz2tO6GZ61ICBMEiaGccSoE+
	BUrPHtNqRSlq/AntDxsLkwF00k0369xrcRciyQTqCAhtJX04mTZbhmpFX6JlimodOtEvCi9Pn8Z
	HpRAa56ynR/Jc9N7fNEY2eJgFlXrbkXx5eAQLaSYDksKFKdpmVW3
X-Google-Smtp-Source: AGHT+IG7StedQ5Vnf2T8W9EtvcPrRVDItpyl7T3DBHEMIV0RzDgNrv3XTiomaadolzmBwJACvP6VXg==
X-Received: by 2002:a05:6808:30a3:b0:3e3:bd1c:d584 with SMTP id 5614622812f47-3f3922d9a38mr2709674b6e.9.1738945755147;
        Fri, 07 Feb 2025 08:29:15 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed6220sm756084b6e.15.2025.02.07.08.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:29:13 -0800 (PST)
Message-ID: <74ec33db-6721-4b86-86a6-e18b0a01fc47@baylibre.com>
Date: Fri, 7 Feb 2025 10:29:11 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] gpiolib: add gpiod_multi_set_value_cansleep()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-sound@vger.kernel.org
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
 <20250206-gpio-set-array-helper-v2-1-1c5f048f79c3@baylibre.com>
 <CAMuHMdU5tt5_t2SfYO3OUsHenu_0PhpKeLHktNdCx-W6zCEymw@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdU5tt5_t2SfYO3OUsHenu_0PhpKeLHktNdCx-W6zCEymw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 3:10 AM, Geert Uytterhoeven wrote:
> Hi David,
> 
> On Thu, 6 Feb 2025 at 23:48, David Lechner <dlechner@baylibre.com> wrote:
>> Add a new gpiod_multi_set_value_cansleep() helper function with fewer
>> parameters than gpiod_set_array_value_cansleep().
>>
>> Calling gpiod_set_array_value_cansleep() can get quite verbose. In many
>> cases, the first arguments all come from the same struct gpio_descs, so
>> having a separate function where we can just pass that cuts down on the
>> boilerplate.
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
> 
> Thanks for your patch!
> 
>> --- a/include/linux/gpio/consumer.h
>> +++ b/include/linux/gpio/consumer.h
>> @@ -655,4 +655,11 @@ static inline void gpiod_unexport(struct gpio_desc *desc)
>>
>>  #endif /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
>>
>> +static inline int gpiod_multi_set_value_cansleep(struct gpio_descs *descs,
>> +                                                unsigned long *value_bitmap)
>> +{
>> +       return gpiod_set_array_value_cansleep(descs->ndescs, descs->desc,
>> +                                             descs->info, value_bitmap);
> 
> I am wondering whether this needs a check for !IS_ERR_OR_NULL(descs),
> to handle the !CONFIG_GPIOLIB and gpiod_get_array_optional() cases?

I don't think it is strictly needed, but could be convenient for future use
cases. If we add it, should it be:

	if (IS_ERR_OR_NULL(descs))
		return PTR_ERR(descs);

or:

	if (!descs)
		return -EINVAL;

	if (IS_ERR(descs))
		return PTR_ERR(descs);

?

For comparison, gpiod_set_array_value_cansleep() will return -EINVAL if the
first argument is NULL.

> 
> Slightly related: shouldn't gpiod_put_array() (both the implementation
> and the !CONFIG_GPIOLIB dummy) allow the caller to pass NULL, to
> streamline the gpiod_get_array_optional() case?
> 
>> +}
>> +
>>  #endif
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

