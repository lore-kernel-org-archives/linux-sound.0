Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE117799F
	for <linux-sound@vger.kernel.org>; Tue, 10 Sep 2024 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725973599; cv=none; b=paamOlwoOfddCAw9vGjMkLbaTfSvE/nccfoUM+bG/NphoOUomurSRgTLHFkojIkubi2BjVWLBBm0guvzRPXFodVdS066YRUEjer3lwkBpxItd6Yb56Qb2FiT5JfrE/WciRei6QWey4SOKu/KVKe6DvXxrxLksuJ8TNoDvH0e5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725973599; c=relaxed/simple;
	bh=L4w2KpX0OwLdqZm75spLd0tlnevJN69EafpQUiyDOMQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jSQqInGV6pds/RWbX3OdxxHgPqOdn7EaBjrMMHb6xsg1en2Ej7ws6jklcuQrDynbyU0O5KPuPDnlCnn7zmnAw+U5PobQMsem6WMKrK02C2fXM5Oh7k8RVj4I8afDb8bwoCFd7gLBMDCkdpbBs9pFx661vFNvZGWoJSK2Luthqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vNnBK7kT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vNnBK7kT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so19386495e9.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Sep 2024 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725973593; x=1726578393; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xcYrlgt+xKQpMzidUvbTcdlU3FHUxKEyZowbKiZEEDs=;
        b=vNnBK7kTnQwnjKcfl+LUmWzlWhRsSQS1g+b+fKmW92H2ww/zWU/rjRJHbRSqw+nc4R
         1PYC0aPYgcQ7hcr378SVJbWjF7+uucCQK2e3r/WW/uvAnjztK81OKhWbOzYjnIxWs3Ys
         NS+4+ban75K/8i/zTZtdT01cMAlAWyX0XKT9lucu4/rOmUJtsfIn6aAzzIWXlBYS5IUc
         8IdSXTHpOT1/871kpvPQOi93LeI1+SOMuF1vok3H1bM/nLwfrAQM8Vt+TW+f+CHPHb+f
         H7zKJ54EH3eJxBRaziT9nGycD9cCqLPYaa/5GS8woBOGG1O3n6FzHFBXkq65rCXINXWp
         CESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725973593; x=1726578393;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcYrlgt+xKQpMzidUvbTcdlU3FHUxKEyZowbKiZEEDs=;
        b=VelrWhF+mFC9abk2KLAXG1EjJwo1IymNolxrzq3Fka1wIRExK+72vr3OFcpb4LR/ny
         OApwUjKV69MsQBz7fpL8eH/J4DVOwTpwrxVh6Jd00bPQ+Z0bDg84ST0W+TNW8/eud7OC
         r91ULittC5gY1pOJ1/3W1tYLAAjLRbDcq83/6cbxI5erm6A5cEw4/diSykeHTKEjNnXE
         RNYMIjt3pNbFy5i2HdGWjBu8wM2K9w1P1Ww5E0aq1tkPbg8NjQdhXRK9f2nr8zv+PRJE
         VYytE8ovrJDs1i0N6ePxivO0QTUe6x2f6xRuha/uQsGFf2U25WoeWmqQchqMS37geiet
         QbDA==
X-Forwarded-Encrypted: i=1; AJvYcCVIpg09fM2QfnMivXTVVE0elxjPtsL5PFUh/OfTpjAKCxavF0KeZkRAvrfwRdmGYmKFoZPXpPXnZ4YhOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaf9HS/s7QDCnd+/OyfLe3mEey4tEzbPUIittUbuMw20VTufbo
	wp+otPdq9BAJ41jk/4aQB4gbqXbNIBACDU+4J/Z78lzmlWHZkyxjCvVcRweQwik=
X-Google-Smtp-Source: AGHT+IFfw9hsEkrZwin+dmsjt5+DUkenuM16kva0iZ/RqRt8dh6foDFqpFTzSlnmIntan7ubEc7M4Q==
X-Received: by 2002:a05:600c:1e04:b0:42c:b8da:c791 with SMTP id 5b1f17b1804b1-42cb8daca53mr52475705e9.1.1725973592730;
        Tue, 10 Sep 2024 06:06:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cbc419014sm39753015e9.36.2024.09.10.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 06:06:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: <lgirdwood@gmail.com>,  <broonie@kernel.org>,  <perex@perex.cz>,
  <tiwai@suse.com>,  <linux-sound@vger.kernel.org>,
  <chenjun102@huawei.com>
Subject: Re: [PATCH] ASoC: meson: Remove unused declartion in header file
In-Reply-To: <20240910122330.70684-1-zhangzekun11@huawei.com> (Zhang Zekun's
	message of "Tue, 10 Sep 2024 20:23:30 +0800")
References: <20240910122330.70684-1-zhangzekun11@huawei.com>
Date: Tue, 10 Sep 2024 15:06:31 +0200
Message-ID: <1jv7z3slns.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 10 Sep 2024 at 20:23, Zhang Zekun <zhangzekun11@huawei.com> wrote:

> The declaration of aiu_fifo_hw_free() has been removed since
> commit e05cde84eabc ("ASoC: meson: Use managed DMA buffer allocation").

Missing the fixes tag then:
Fixes: e05cde84eabc ("ASoC: meson: Use managed DMA buffer allocation")

> Let's remove the unused declaration.

With the tag
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> ---
>  sound/soc/meson/aiu-fifo.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-fifo.h b/sound/soc/meson/aiu-fifo.h
> index 84ab4577815a..b02cfcc4de7f 100644
> --- a/sound/soc/meson/aiu-fifo.h
> +++ b/sound/soc/meson/aiu-fifo.h
> @@ -38,8 +38,6 @@ int aiu_fifo_prepare(struct snd_pcm_substream *substream,
>  int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>  		       struct snd_pcm_hw_params *params,
>  		       struct snd_soc_dai *dai);
> -int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
> -		     struct snd_soc_dai *dai);
>  int aiu_fifo_startup(struct snd_pcm_substream *substream,
>  		     struct snd_soc_dai *dai);
>  void aiu_fifo_shutdown(struct snd_pcm_substream *substream,

-- 
Jerome
