Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD5A1EB1A7
	for <linux-sound@vger.kernel.org>; Fri,  7 Feb 2025 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941797; cv=none; b=jLEJ/KimfYY90f7o7mPwUZeDkcwGcWgURz8HXleddJHI/0kkDM8C/CzEZDUz+umqfAB/JAJODiEUDeVSs3roJ8u1vU5VtyzjmGOe8uHxTYuVK3onOP+QIie/4U1b1E0BV4D//q0bxlsZgloS9q+cy8XgIWo+NC/aRSOwZ8iqTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941797; c=relaxed/simple;
	bh=JDDbmK++u5Zrrl9i4wETB+fZ6+WtylkQrpDbOxAMbWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/YXVOAJP9Fi3PuVpwcgsDCZ3Rk5hxGjUb9jkHAEKK8R09lBNmWvTEE+hzI1UFO4Aqgi35dr4DZ3191+M56OzkI74Ql2eh/yZmO7jiuRmVOcNxYGts+hSddIDJr9Tttu6x4aVrtSEmhzrKGq8L6fSvBO/zSng0SF59KX1BCocp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dL5tXQN9; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dL5tXQN9"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2b806ee0fd1so1030582fac.2
        for <linux-sound@vger.kernel.org>; Fri, 07 Feb 2025 07:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738941795; x=1739546595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKN8sjRb3wgYxS8vD82nCdPhJYpZegmXytH3ZuvLDaU=;
        b=dL5tXQN99tpWF8iJr8PDD/x7JBvxCw1n0YxRCcqPSFnvPpC7pz3PL/hYn91vWQB0Lt
         PZ+YGjJPRvMOtCt8XuOsWuFMiBIr2RD5IvXR6mjqKscso6rFMGbhNJ1G5MGrXATFbpfa
         VRbiSVly/+dXXwGwD1F+9fcauRK/lcPtiyKuMiFGHGzuW5dhBj3e3WC6bCiqAoyuOliI
         TzBamMlWWZOQmTpDeCDQ2jegAqduAHVG1KqRiD/u6gqi6cFOo8bwhGGFnLZUJxCbVubd
         OMzJuQnB26STASsbn1P2y5yqqihWcI+LVXiQ57JzNDbcJB8FV+q3D1HXZajrsTQxKz0A
         d1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738941795; x=1739546595;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKN8sjRb3wgYxS8vD82nCdPhJYpZegmXytH3ZuvLDaU=;
        b=ksWG23ky0MQSAcArnYLnb+mGiCpG7FrteSpbwHPPMNRlxJ+vlDUyz/Y7mNSejn0lOZ
         w7Pftq8HNW5SLavurk/wGE545m9kxa9v5mFyDv5KAsTKhttVz0ySBIsLAoLmuKewhhY2
         sNmakmaDKJ5rCzHslMMoc3g0x31bvIS4ZPoh2E8s3YYlpfH249RCWNbJ++fAKYfdYmg7
         1LA2SZ4VIR96fwsyZUFPpQpxN3yqXqHFcvfvLNVuRD4g9lC2L4o1KmYpeFekhyPrMOrV
         YrhiQ3BQVdZe+cBwTg4Uvb5nqOnZFF3bGmunIO0pUZFGzO5VA6a3l/BzziDiaC6C4wHE
         zkhg==
X-Forwarded-Encrypted: i=1; AJvYcCVvmrgIL+oxb0tFu2FzOcHWSGC5fqWcTZHoRLDGspMq4Xwz7SaDPeXS91g+WO9oLQ+AysRHngy6DG9laA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJpPRqginE4JNzHFa1TQlsp19d0MNrK9JEh4x/oJ+15z58Pfa
	DY5nodQZ+ZovWtXNoS4fcGJ0AImJm8gNjE22/NWtu94O6GhjJwLrUz8YgPl36dQ=
X-Gm-Gg: ASbGncvuqgwya1kLJgk5QwNeL21t/Ic0F2FPD9RO7KWLMtoPU8KcBldFjDlUlcbbKhK
	MKrtNZL7wh4kmSjOgDewJsP3nag+OCCKzz/XfigmYmSe6WndhGznKbZnvJUb9bR5WdNTPvV/qxb
	o6Ew84mP7nk1diB8NeiJLLduYf7su4zJLX/Y3x24sqMXryMbjbGG13PlBAbhhSQ5seoTPh0mIsz
	6qXzSQDPeaddk83SSv+VVsqX7CVsxl0FBCH9mKZdV7f7zGJO1vEclGxGtuHOndAqJJtBYEnmL5Y
	BPQW1PYokZvxyBDMj0vy2tB3zrwQrp4qAMJ98hD2FU4JivQF9uNU
X-Google-Smtp-Source: AGHT+IEEGiDMzanhY46VT0zPfUJ5PNu5OgiAyh3A5rsLRVIHkXKzWkfKjdhXcmoVPsTyGbzMvvecNA==
X-Received: by 2002:a05:6870:169d:b0:29e:4340:b1b with SMTP id 586e51a60fabf-2b83ed06682mr2385084fac.9.1738941794664;
        Fri, 07 Feb 2025 07:23:14 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b826261c16sm829675fac.40.2025.02.07.07.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 07:23:13 -0800 (PST)
Message-ID: <945b338c-8fe1-4082-a20f-57f8152e8f80@baylibre.com>
Date: Fri, 7 Feb 2025 09:23:11 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/13] gpio: max3191x: use
 gpiod_multi_set_value_cansleep
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
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
 <20250206-gpio-set-array-helper-v2-5-1c5f048f79c3@baylibre.com>
 <CAHp75VcNJzPH8to1Y6NzPMXnH48Ve4LJ7oid7_wEHtwhO82Fmw@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAHp75VcNJzPH8to1Y6NzPMXnH48Ve4LJ7oid7_wEHtwhO82Fmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/7/25 4:34 AM, Andy Shevchenko wrote:
> On Fri, Feb 7, 2025 at 12:48 AM David Lechner <dlechner@baylibre.com> wrote:
>>
>> Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
>> gpiod_set_array_value_cansleep().
> 
> It seems you missed my comment.

Yes, I must have been sleeping on the job. :-/

> 
>> +static void gpiod_set_array_single_value_cansleep(struct gpio_descs *descs,
>>                                                   int value)
> 
> This is not good namespacing. Can we change this while at it?

sure

> 
> max3191x_...
> 
> (I would go with max3191x_set_modesel_pins() to make it shorter. I
> have no clue why the function repeats so much from gpiod API naming.
> Is there anything else which is named in a similar way? Perhaps fix it
> by a separate patch?)
> 

