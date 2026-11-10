Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309268;
	b=vt9N7z8DXrFziMY/Gqi0Jqbyou6p0dOymWuaAgcJ1533M4FNvHKEvwiNV5MXB1ZFTWYM
	 m+EWcWL7I/4t3ljoWbuRrb+QafXMWvJ7Mz4iCZBrxlROTKLbb8tw2GJP2WcCikvmKalZY
	 JpCtzemzMCCaEpfgwC0PNuqq7zWEktLOAmKZXqL9vH4bHc08GusLDIaGHWiZfp5628bv9
	 UCagN8a6LBkMfiyizMp/u+WB6pAXQfbTzW5Q8V8J66WjfMnnoIhX9oTbXjNPTzVZ0NbEX
	 DFj1+KeUnl5qmjtBe6bfg5Dc8/szO/WraGqu0tic8q/G0DoVuO5mDGO6I0XrGk5TMdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
	b=2xLhLyk/wS8tdeGnzvE8bZcIiG4YtCESJKWCUzmXPujdzZt3J0aQGACaaLkJyblUQjl7
	 KLlKy/+Yfkb5E1I/YcSOAsTdZEkOMWEILPiVayTQ40sPCshEzOiFZtZefBuFeMpoI2b0Q
	 mJbP/B5r5C2s9y4kfurOH1whCePKFjfrPx8ZKYydwDEq98o0paotx7CdUNjqghO8q7egW
	 52+u7rgMSyghfhyypLLUVFF/Qt8dUnFLjIWZ4XldH/5/Iu/XujHC2R060WNoIg8OaFSdk
	 rXrc/NCNloYhoGWeTQOVXrMm1GxjjkKLXsUuDiapqA4fPkQ/lUhfnwNuXTU5Xyyb4Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hGfUAKuo;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B72606A331
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 11:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B72606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hGfUAKuo
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so1137293f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794309266; x=1794914066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
        b=hGfUAKuoU8WVVrATySszgzvOyBQWURQjoxAYcusqxr00mbG9lLJ5YurmZyaZAXWbrs
         O400VeVYivYCW8fyu6+Dvqp5OaVfYP3myT2OpkOoGR0u3aFVFEoZGejFSmaCwvEiIQkZ
         roI6fjGYDwpgzcuTHJ7Las8b62EneeV9ghLyUXE6VEZXXKGvWoPQdPnLXNTH0Hpp8Jk6
         5/pklK9B1N9VubIaExX3gN+ZT0YRWjBR3/6srd/2UZT8+0xNEoLQH8Gc1AeBou7Thu17
         iUhGpyGKF4A8m4u7sMhEu8srrwTsUDIKh0rNLG9LyufE47ann7PBBKyDs9e0T8GyxFiH
         VSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309266; x=1794914066;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pjqL8lgJ5H5rEEpJ/FLBjpoQyXvjDN5uURvtTrdJq0=;
        b=w5+3vfTNSHLnhF57hTaS8A2J9Aib6qzs3uceXPZREdCTI/wCtEiinpBMRLvb8OzMb7
         Wd/ln9I36xuc/8Y2FB5Rd9rjnOJDKdbiaX5FRzQRWrU+WFuXuTEN5L3YB2aF2pEq07no
         sdbzWanL5KSvkRqScn/3YjbFEq0jGX0moOysnMZigOQ3IPZ2KITD6xqjgofvt2GiQNEl
         zdiF7MudfLxd1WXLaLOzuUVMsn8akA95vvBZ/bfkVqhljk8gOTMg94YbCrA2qNoXCEnl
         CKBtqagixH8posGVldrCzEg6Xntzs8oUCg3IBN5qD+jBxGtJU3GU6eXMcMraakkVuyxR
         7Prg==
X-Forwarded-Encrypted: i=1; AL+hErGSHHD+3/3r+04uLdWNKbb8HOCKr/SQCKVmfQhTFaLBUnFXNt9j/2Tpy60HB5wT9rmZ8K8uWzQ0mMMR1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NqG0ImLYhRgrbsiT1KKcF71Y9+NlSTXvOQL/dn5fD3gljR2yT
	G+RaKze5ain/MwM+wgP2fwmkFwbFLuO0lp+76Aboa0e+TYb7sr/yEte+u/8irbWy8JQ=
X-Gm-Gg: AYBFou12bqG4SXGtGITnVYMyC4MQFPAw4/RFCnxZNwBxpZ/IzZLZBRxfv2UJN+j4E5J
	5GfGbSy7hSoneQMXXtszd5Ueu4xNcH3p/KVmfmx8sFJrXJGu2w+vckczZmkcV2+y4JP8pBGP01T
	+TF0RGQk6OkpqIYpxXrSklbM7M59fe/Y5CWvg5vSL+9+uE2dY8TlIRDaRV1TWh6JoFuLtIjQZhc
	+tMlXiJ7x9d2TglsFbqz5pLXhGQgoHnGwXfm8H2L4BiOIxxCdpQgW9E3EML8/my9mdUnCcDoiYq
	BF9VlBQIL3ih/LR3QAwKm7NZ1DfrnVw0y8Wa37a9lUskaLLy+ZKF5AUR3etke4x3W8imFR5wt/V
	iX0w/KvUK+Y9ZCkNVO42wcDo87WLsGdo68jNI7hQmDPzZaLBRkVGUEYaRGD7oZIGuEvyNKO+u/X
	C8sHT9+4cijvCUb6DK6U1Wtv66skfX+YjZA9EFLwt+miT+nRc/UVkWoXnHryvKom5ice9nUodZ1
	lci+RCBek8QjxbDTIWXePSW40MUGD2GIqi2ZZ9sVFGYtUZKMgY+6Hb689IUVi8igJ8YlNR0n1SA
	vuVYrQaEJDh8q4xQ4nH7lfvjK2ZE8TCQ
X-Received: by 2002:a05:600c:c16f:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4ba0234e2e5mr35596445e9.26.1794309265823;
        Tue, 10 Nov 2026 03:14:25 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm4366683f8f.44.2026.11.10.03.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:14:25 -0800 (PST)
Message-ID: <ca4c9e4e-80bf-435d-9f55-18f1a38c4472@baylibre.com>
Date: Tue, 10 Nov 2026 12:14:24 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
 <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/8/26 10:01 PM, Martin Blumenstingl wrote:
> Hi Valerio,
> 
> On Wed, Oct 21, 2026 at 11:52 PM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> @@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
>>          if (!ts)
>>                  return;
>>
>> -       mutex_lock(&ts->lock);
>> +       spin_lock_irq(&ts->lock);
>>          list_del(&formatter->list);
>> -       mutex_unlock(&ts->lock);
>> +       spin_unlock_irq(&ts->lock);
>>
>>          gx_formatter_disable(formatter);
> The documentation below states that ->ops->disable is called with the lock held.
> gx_stream_stop() does call it with the locks held but
> gx_formatter_detach here doesn't.
> 
> It doesn't seem to be problematic yet because aiu-formatter-i2s.c
> doesn't register a ->disable callback.
> Can you please still look into whether this is a problem?
> 
> Also for a future patch (not this bugfix anymore) it would be great to
> have lockdep_assert_held validate that the lock has been taken (inside
> ->enable, ->disable and ->prepare).
> 
> [...]
>>   struct gx_formatter_ops {
>>          struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
>> +       /*
>> +        * Following functions are called with gx_stream->lock held and local
>> +        * IRQs disabled so they must not sleep.
>> +        */
>>          void (*enable)(struct regmap *map);
>>          void (*disable)(struct regmap *map);
>>          int (*prepare)(struct regmap *map,

Hi Martin.

Oh, good catch indeed.

As you correctly pointed out that's not a problem today because the only 
formatter currently present in the tree doesn't implement the 
'disable()' callback. However the upcoming AUDIN support [1] will use 
that callback, so the question might remain.

Technically in 'gx_formatter_detach' the formatter is first removed from 
the formatter list (with spinlock held) before being disabled. This 
means that other start/stop actions cannot be called on that formatter.

So even though this is ideally safe, I think that moving 
'gx_formatter_disable' under the spinlock guard is better: all the 
register access are MMIO (not sleeping) and then the behavior would be 
symmetrical with 'gx_formatter_attach'.

Thanks also for the suggestion about 'lockdep_assert_held'.

I will send an updated version with these problem fixed.

Thanks for the review!

-- 
Valerio

