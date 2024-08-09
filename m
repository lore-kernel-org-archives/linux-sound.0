Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25342F2A
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723189612; cv=none; b=ACrd6Z/jjnqQomBj8bChZ9WbxXqIo34WJPZh0a4xKQF4Rt5tEujhj3NBq92g3jlwohKoHi6ivqaYHI8DY8vcDEC04apnkRdoh2HFYdQSMVhiI7SsPleIhyaIHQIwTeXEpOiyWSds8EU+W2N+SAPo/zTwWg2XBbsdbwW9bLESteU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723189612; c=relaxed/simple;
	bh=yE/j6LwbATd3WDdJI5LQMHP4eVu5OlIY1oGiBy7ivI8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sQSxbXHunZJX4eEvgVXuK9FaRFes+QEKf0spe1EY2qoUDA7JDaJxWhqt3fsXRUhgzRATw+IpJZMnR0oPqG8hpbxCyNxyGW5uD2D/8YVeFYF+D6NJ4MP68y89srA+BF9G8bODoHrf1PuxRNMJFRRtcvtcSBXh2yFO5+S2SuZ1djE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oMKzhsOa; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oMKzhsOa"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso2490812e87.2
        for <linux-sound@vger.kernel.org>; Fri, 09 Aug 2024 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723189607; x=1723794407; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXOZbpBdtAtASbi5mwiMcBD80AMiez6TY4CZLJc+Zgk=;
        b=oMKzhsOa7rsccyZ/jiBI1M1FsF4GaEJKZFfxPQKvVQLtFYx3LnDZXQz8IkDM+odJME
         /Jdjj3r6Vz508HFw6dBviL4OdSIaTm/Ty/ndd0S9FVLZUcFNT5/93kSZEZgkpFiHiLxA
         YyA+D74HflkoxtGyohejSd1Zfrbi7oZwrrxclkR//4e0YZEtjwmOE6IwkTvtLkGjl+bg
         c+z0yBoJ1lx1ZtvsQoGjX1w2sBYYNQHHQ+v8i6ChHWPPHE2wXpTnmiclkDui+P+kSMS0
         yuxnQBCZnWW+E1XgnMbDX/E1Rs7PWTkrzEYxz6n9T7g7+AGwUInv408JTpvMJgo7LH3u
         9l6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723189607; x=1723794407;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXOZbpBdtAtASbi5mwiMcBD80AMiez6TY4CZLJc+Zgk=;
        b=LEpKnv365QUGN31JFwtyfzDUspTfTdBSXJcdY9hVjSNy4Le6UGOEr22Aj1/5Eul0eJ
         25Btzo156VFdsMYUcM6Rxclc8Ro9M8uT+MRdlqLbtJ0Z9IXcfr2BXIC8lka71nqWjNn1
         YghX+2MUTcc16jEnu/TX+Q+Qk5V3XSa19uwdumJC3KMGb9CwZiSSOJ8AhNeppvhX+F0p
         3mHrxwltkbSABoGs0SaoIbuZXrihAibC3+KU6aaTEqNa1Yn/WI9wegtqM8zEDFuBdl6F
         PlKvZLf9TbKxj8ZsyvFZubkED1LOUEeDeBtUVEaxLjUqRWiLn5f1PigRt+JZCkjh7QPO
         NmxA==
X-Gm-Message-State: AOJu0Yz56Xa/OrE8fvZvmbzocWEvw0hpQSnyd+96WnaDpGtY8un+/4x5
	QN/wsiqe8Jn9jbrFTaDgkPu4KGwyoYhPOfd1hPNQSscMIypdxwphzCbqio5TU/tkiPDXy85fY7D
	t
X-Google-Smtp-Source: AGHT+IHGDOhn6GL00I9MsL6+ajMXfYmWpgD+pLaKwS8k8pw2adPNJimpdh8Z0WZVyOX//c2+COOJlQ==
X-Received: by 2002:a05:6512:ac6:b0:530:ae4f:337a with SMTP id 2adb3069b0e04-530ee96f414mr548027e87.3.1723189606284;
        Fri, 09 Aug 2024 00:46:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f0cb:cecc:348d:4d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c72d551sm64038395e9.2.2024.08.09.00.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 00:46:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: caiaq: Fix unused variable warning
In-Reply-To: <20240809074254.5290-1-tiwai@suse.de> (Takashi Iwai's message of
	"Fri, 9 Aug 2024 09:42:51 +0200")
References: <20240809074254.5290-1-tiwai@suse.de>
Date: Fri, 09 Aug 2024 09:46:45 +0200
Message-ID: <1jh6buxhne.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 09 Aug 2024 at 09:42, Takashi Iwai <tiwai@suse.de> wrote:

> The recent cleanup of caiaq driver forgot to remove the unused loop
> variable:
> sound/usb/caiaq/audio.c: In function 'snd_usb_caiaq_pcm_prepare':
> sound/usb/caiaq/audio.c:179:41: error: unused variable 'i' [-Werror=unused-variable]
>
> Fixes: e95b9f7f2ee0 ("ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/20240809112252.5af8025f@canb.auug.org.au
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Urgh, sorry about that. Thanks for taking care of it.

> ---
>  sound/usb/caiaq/audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
> index e62a4ea1d19c..772c0ecb7077 100644
> --- a/sound/usb/caiaq/audio.c
> +++ b/sound/usb/caiaq/audio.c
> @@ -176,7 +176,7 @@ static int snd_usb_caiaq_pcm_hw_free(struct snd_pcm_substream *sub)
>  
>  static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
>  {
> -	int bytes_per_sample, bpp, ret, i;
> +	int bytes_per_sample, bpp, ret;
>  	int index = substream->number;
>  	struct snd_usb_caiaqdev *cdev = snd_pcm_substream_chip(substream);
>  	struct snd_pcm_runtime *runtime = substream->runtime;

-- 
Jerome
