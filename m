Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A793932DA
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096052; cv=none; b=pmdeWmigU0tYINz7JSQs70ukh24Dwq16PxatSHtMmBLvxQthWFV6RCknHwh7xzWVoR6/lxWc1KVcoiK9u/B5ue8vQS2QI498AnXRkjKhDR33wex7nxe6kQNpUbEmV5DQM569cRx06XglJF19B8igHBh5G8dzmDrvE7mWZeEU2vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096052; c=relaxed/simple;
	bh=1tvo4XgBRSYrcTdKwD2gHBeJTIo6MRtVa5EWFdqM8VM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mrrdThP57zhTOaAum4nEaGr1sykXtG8fnEkNIv+ZvDeal0YYYHagw7mcsnQNSYrBu7uPdkAtAo1thhEpAp6HXlPHUl6n84aJIvke0J+9zkmmzfQKv2kC+L5Q5dvvT3Mblv4ykMOfvAXa3PTGZWYY30ALHc0ulYm6vqSsGHuuyvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=V7N0obFH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="V7N0obFH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490e1904089so912085e9.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781096050; x=1781700850; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdNmA7Q456iosyYRzPrqg00tebsLAHHTciT1QX6nIpA=;
        b=V7N0obFHR4lqk9o6kuaaL7qv11uJvP12zLMHnAWgAhTBsQsAAjjix+Tf1PcbXr4/1D
         4e+iSx6+x/UVgUbkVBR0I9RurFdtPdYpA4HMQJjBJISi0gg1a5AmeNNJbFhL0mndD2RG
         wsCyraR2Ouh31TgbfOhe9QB6NbZcCJdun4VJJHAvdZZuyi0fpnd2Mnmet0cPHHnjSrKx
         7vePx7nqb6h/J7QUh+HHHbq6uZEtcC2ZH119AWORuOH2iPZmjIqq4oxQ9u4TOFZhd59F
         lQ+lhOvM/R9mSmmQOTTfjJSp8cQQJFHq0uZj8y4JJRe1cGnU3HIrC7UiyTY0gHIDQktV
         aAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096050; x=1781700850;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OdNmA7Q456iosyYRzPrqg00tebsLAHHTciT1QX6nIpA=;
        b=GIvXJH4Ieqi3DCNjK1Az0M+PgmBjtaPcu4dmRomejhFLZ/BBGadX0dOiTfUdjB9jES
         AHHd0LORK+D7pZ+HmA1kW2lENeTPwZUA/ipht9RY36KVDuQV5JJaolPY6Vlx5Vd1554U
         OykqVG1Yvbm89BZmp3tGyID74wRzj2bGjkKK+ZMisSEsdUHj5cIHMBirRebuBR0Dn0qb
         GfIpi4Nb0zD07pfOGgxs6Ba7NWgcRnbdu/PCJyNPfT1A6x4lsi2DJR6SeDuF65iy2OtY
         1A/XMZ8sYDwwz/x86gkJ+tMqbjwZ/+QHM/ScF9n7exn81+J0k3OZH0dQdgsf8jZMrBWy
         YF1A==
X-Forwarded-Encrypted: i=1; AFNElJ/HptJl9qc5X/js9NqOeJVwXk3Ku0hdLAJUg9CAJaHRhQXQWlzTzXcBIXTIp2WAlkQVWMEUhLKm5mXh6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxReTDVyEL+U6ESdOR/kxrSHv+KbZJRUHqsffEO+Kw5YRXw4+uo
	Mh8vHOxqxf588z0/29t8WmC51pYTGz+ah+uAocv9atybIh95zBCiY8l1TEwazoqmJ0M=
X-Gm-Gg: Acq92OGO3x9l1iIJ8Q+ol7q9gp8DS53pMCZ8EzqyGPyuXDpN57Bp6EFvY0ZHmJxF43e
	uz+HhomSU5aXXorQaDHFlUxHee623e96a3HwK/N6ytz2JckYAE7cdAIp6miMAO+6Bjcqqr+R/fH
	XhhlOlmk7WxH+xM8stwPnlVPZVQ9FHJ8FPnrRWNspMn956BupfLF+qZQgkMCd6au3OG+xERrq1X
	jKVl4MtmuFmap7s2h4cYw9XbervqSppg6mlA17UEPlF9F10jpXSzO8HyNECZfbTX8FRDyPKeNFB
	BlYOXbSl+ZOo7n1FXEkod7PigJ8eSI51yGfCC95UQJ80V45BUdB8xrCCS4cOX/jyMmMIH2WYs1j
	i9/p7NqQ8FiA/bHQIpDAOFEQoTaNR1A62oY0IBcN9205dkBzwSaElAUWQ4PBsxZ9Erviym4OIZZ
	PbygULJKd1R2WRqda3Bbt36FAEleP4VXrY
X-Received: by 2002:a05:600c:37c9:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-490c262dcb5mr391675255e9.33.1781096050039;
        Wed, 10 Jun 2026 05:54:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc3fd502sm562365245e9.11.2026.06.10.05.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:54:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: Use guard() for mutex
 locks
In-Reply-To: <20260610102153.83367-1-phucduc.bui@gmail.com> (phucduc bui's
	message of "Wed, 10 Jun 2026 17:21:53 +0700")
References: <20260610102153.83367-1-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 14:54:08 +0200
Message-ID: <1j8q8mfte7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 10 juin 2026 at 17:21, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.

I suppose it is OK but it does not seem to really clean anything and
make the code easier to follow in that instance, from my perspective at
least.

If there is policy to systematically use guard() whenever
possible then OK, otherwise it seems unnecessary.

>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/meson/axg-tdm-formatter.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
> index f451e4dce442..a6ba401104d5 100644
> --- a/sound/soc/meson/axg-tdm-formatter.c
> +++ b/sound/soc/meson/axg-tdm-formatter.c
> @@ -157,20 +157,19 @@ static int axg_tdm_formatter_attach(struct axg_tdm_formatter *formatter)
>  	struct axg_tdm_stream *ts = formatter->stream;
>  	int ret = 0;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  
>  	/* Catch up if the stream is already running when we attach */
>  	if (ts->ready) {
>  		ret = axg_tdm_formatter_enable(formatter);
>  		if (ret) {
>  			pr_err("failed to enable formatter\n");
> -			goto out;
> +			return ret;
>  		}
>  	}
>  
>  	list_add_tail(&formatter->list, &ts->formatter_list);
> -out:
> -	mutex_unlock(&ts->lock);
> +
>  	return ret;
>  }
>  
> @@ -178,9 +177,8 @@ static void axg_tdm_formatter_dettach(struct axg_tdm_formatter *formatter)
>  {
>  	struct axg_tdm_stream *ts = formatter->stream;
>  
> -	mutex_lock(&ts->lock);
> -	list_del(&formatter->list);
> -	mutex_unlock(&ts->lock);
> +	scoped_guard(mutex, &ts->lock)
> +		list_del(&formatter->list);
>  
>  	axg_tdm_formatter_disable(formatter);
>  }
> @@ -330,7 +328,7 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>  	struct axg_tdm_formatter *formatter;
>  	int ret = 0;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  	ts->ready = true;
>  
>  	/* Start all the formatters attached to the stream */
> @@ -338,12 +336,10 @@ int axg_tdm_stream_start(struct axg_tdm_stream *ts)
>  		ret = axg_tdm_formatter_enable(formatter);
>  		if (ret) {
>  			pr_err("failed to start tdm stream\n");
> -			goto out;
> +			return ret;
>  		}
>  	}
>  
> -out:
> -	mutex_unlock(&ts->lock);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(axg_tdm_stream_start);
> @@ -352,15 +348,13 @@ void axg_tdm_stream_stop(struct axg_tdm_stream *ts)
>  {
>  	struct axg_tdm_formatter *formatter;
>  
> -	mutex_lock(&ts->lock);
> +	guard(mutex)(&ts->lock);
>  	ts->ready = false;
>  
>  	/* Stop all the formatters attached to the stream */
>  	list_for_each_entry(formatter, &ts->formatter_list, list) {
>  		axg_tdm_formatter_disable(formatter);
>  	}
> -
> -	mutex_unlock(&ts->lock);
>  }
>  EXPORT_SYMBOL_GPL(axg_tdm_stream_stop);

-- 
Jerome
