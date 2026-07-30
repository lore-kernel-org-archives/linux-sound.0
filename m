Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94A235E950
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 02:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379541; cv=pass; b=p0uzpb+zEIp+v4uMb8dJGU3j2FAoFC51sh8EtgfkPzcb2hDS4xwf+bMMrhzLQxfWEEJ3eZ9hwHTsrZU1Qe+4gLaAa2/06Tf/BefWjd6+7/ZgVUDFt3eGzpP3a3wovcMGBuKXjIs5jzzbqDANRhRfsjaiNo82uKnhV53zeVBbS10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379541; c=relaxed/simple;
	bh=kRArQHYjNIM/tb3Bh3o6NO8/9PpQ5oRwZh4ZjJKawz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJE8RYX6KDTXSD7V/Pa69lQRO4GtuT55zRBdJ1IX0rtWbiht6hZ1/0jB8rHcsn+C/+u5MvCJWgPvey5PbyZdwqdotVexLZ0IF6qogGytCMGzV48dHYcDCshIUV8NF9XrgXG80BN6sYoMuRAF7tn95FgjS/6gt0b+pqtZ3JpGxrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuwVQ00/; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuwVQ00/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cace91f112so19282615ad.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 19:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785379540; cv=none;
        d=google.com; s=arc-20260327;
        b=j1xUOJsk7x+WAEnj9pzLXYQJw8xYG3+knoGiFpf0juo75ctcaujyglKNxrP7wxgM+d
         c3fx9ybwk0btgtmYBV37yGbeu2aeDFtHJPF6ztXKjBVJsTuwqyeZWvltz0Uh02EFYSwK
         gWRp4QSqkg99vvAH74E0r3N18g11oOJj49P6kzywAAqxflKm1Qd45PoJG+j3k0iyWARd
         nGgD8oGaS3zUcDEkvvAXjyA13mlBG/aqZGKTSOmc8EPVdEU55uTVNQa9Wg3MA1KjXd/i
         pFykyRnvPmotda0clTKmewhN1/w5L9bVMDBEykO8Wd82m6e5U7p0qXedojlrkb8Uf8a0
         L0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uzAsR/idHenwBSxzwkgn005nJFfaNaoVoja/AStNgb0=;
        fh=GQxMh7ZSKJRa8qYjcEI92fLZ+pi5npUdIgsL5hOUbws=;
        b=hmthR0RBt6vM2VXy8//njzvH4kCDvSzUa4nrKArrt61qOVfqLEuIqQJiMtxJYJKwfX
         mG/UfxRcTCnb/KquIl/xIYrLriW1OUFDSpjtDAG/a7yRa2kkRERzfYM8dc4CwgPof62J
         P1YNxctKWU7VDJmmEzHZFZuqyy1VSL5LqF3hAlQ+/m3dvD/VkVgGDP54+52uoVJMeXHT
         +0D6rwz4cBl8dmyx3SFEvadcZSC8ATRiSb4PnV5Ua+ReEoov5HUaLBcicHF2d5t/a50R
         Xb2z5tKw0TBCwuqkXDr5+Y+eawCnw+JoaW/GJlAEXwfXzukO+rY7kOK5n9sWOR5rn4dq
         taOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785379540; x=1785984340; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzAsR/idHenwBSxzwkgn005nJFfaNaoVoja/AStNgb0=;
        b=UuwVQ00//mPfUeqzPvcQlgrnm/6LNknWgJdPen/iMdioWq3GmqEo+vccajDvsd5Yw+
         nfGDSgvj6+hrq6N9PHos0xB05GbKENdCceRiDmJIhBgDCpOUEEEmLtMJB9TNB2igfNpM
         GMrLT3Rc3a8GIFDIk0QPh8fcauTvsZ4qhZrviN0fvJgSoi6WYr1ZPhR2iKYG5oRnq+T0
         PXXwzhk7v94c6BM4yAo8scpMtbB5l56ogALPSrVaxTKb56NWQGYVfB9tq9gXNo3K2DRZ
         qdUjFUX5UrL+14hyxt8OBNs39aXrWgPQOpJlIwr0xIphatYWUcGdV5FQ/ozdv7r61Fsp
         /NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785379540; x=1785984340;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzAsR/idHenwBSxzwkgn005nJFfaNaoVoja/AStNgb0=;
        b=OwepExUpfB0Ofm3aBn2Te7U2fK9Zhv0wu2MKNbrhagoXK3XqcdwL30UKOGRkswDqKI
         lqZZWNUieB00t7M4C9ig8FXAn+ssJANuHu5mks9pWSatQeB3QL1TSltt6au/NPV8sich
         /l7WhYtTnfk4l5OH6fRxpNlW2IUro8YO0Ct7f9Vk32MaPX7bKdwEOKMz6DekBTaR9nuC
         7wfLeOVmkdYeli0o11B1CqJzI1dOcjksNCt3NVXIH5HAQ58PnCfpmIsqueJCZXjnUb37
         ejBwXl8kWlDaIuOp9go3PhPUALhgbKTNiSqlOKnK9YwLtJ8chDQKm3hE3yNAB7RUNuBX
         X1Ww==
X-Forwarded-Encrypted: i=1; AHgh+RrYIsUZK/sBQ8xKvJMAnvqnfeqlnNDgM0q7ejrb38Gyy4Ok4rWYHcRoOapxPuZHvVe/V/dokGKBkjAbig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL8pzKyqBzdF8KwgIuvfr5O5Q6qiSNf5UWDUjUI+3dLMaYzwNn
	QFm7Bg6sZ0UqoJaR0jYVQMbhZzsED6CEkkZBdulai02BKdyg0t3CSmThpPFXywqRhA1abAkErQo
	l6E6A8Bjjix5VyBr0nlluxLo3Q7hKrJs=
X-Gm-Gg: AR+sD12HEjwCsdGu69CDX6pYTVGCRwtnWwiGK7mqV+09wA/iZxTIg2/Z5XWyKGvgUNX
	iGf0QvJNH8ogJ2Zc8iZTQwJcm5e6lunmIQMgSrSiW+wWEInUTjRDIophjklTNRYcx1dhfm8FShO
	HSb9XGWUPb+U4mQiXKBq8Vpmf0HDNrmWxojLIEjahZrlYRsnLHkDVbZXFiQzYCEhzp2QnfCWi9g
	fNNTaEwAxU0gPIJfqwnbbypaA6eOu3ogrohaazvpJz+XTJvnerWyuHRklQ08DzntiyKw8cmM3V/
	jmsRyjKCgtKLj1t0NWDZvIDFfaJkuxjhk+FLki8GLZyZ2j1WGaRn4bR7Dp6joWbNdduavhxvW/k
	84xUMLuVeNf229hh+fGVOulXHypUyfWXkKTVoPfFW82MKGEsC0ynupWj1
X-Received: by 2002:a17:902:e551:b0:2c7:ebfb:618f with SMTP id
 d9443c01a7336-2d035c4b525mr9152555ad.14.1785379539888; Wed, 29 Jul 2026
 19:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716080428.57979-1-phucduc.bui@gmail.com> <7a49d38f-4e71-48c5-bc15-6d449cfa4c7c@sirena.org.uk>
In-Reply-To: <7a49d38f-4e71-48c5-bc15-6d449cfa4c7c@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 30 Jul 2026 09:45:28 +0700
X-Gm-Features: AUfX_mz0tgPl30mvdu0uDVESsMyn2wpcTC08XqzKNftlZAvnSAWlsirav7xfr_4
Message-ID: <CAABR9nFZhuz4dsMoy_wk_tf4CS1SDAyfaJHba=vbhfJyLJT=pw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine: report DMA channel request
 failures more clearly
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for you review.

> > +                     if (device_property_match_string(dev, "dma-names", name) >= 0)
> > +                             dev_warn(dev, "dma-names has '%s' but request failed (%ld)\n",
> > +                                      name, PTR_ERR(chan));
> > +
>
> This is going to generate warnings for unidirectional PCMs, if we don't
> pass a name for a direction then a default will be provided and we'll
> try to look it up even if it shouldn't exist.

In my understanding device_property_match_string() will return a
negative error code
if the missing direction's default name isn't listed in "dma-names".
Since dev_warn() only triggers on >=0, it shouldn't produce false warnings for
unidirectional PCMs.
I may be missing something here. Could you help clarify if there's a
specific case
where this would still trigger?

I had already sent v3 before seeing your review.
https://lore.kernel.org/all/20260720064131.75156-1-phucduc.bui@gmail.com/
If my understanding is incorrect, I'll address this in the next revision.

Best regards,
Phuc
