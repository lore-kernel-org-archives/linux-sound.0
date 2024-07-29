Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC3015624D
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722265616; cv=none; b=HgZlCifMrVfvyVR1PrnmogGfd4mPAWOzCHtCErQn7sK2FDhWIyP80Gt7UTbUOPchOpfWRFhKoE0VVvOPbUZWwJdL8MZsL4ocSbfmd/weTcrETa8tX4wJjHpfUKES/Iw0IWj49pKitzB8zDipSR8W6YCWxTMpDr7SapDwFc+/Kcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722265616; c=relaxed/simple;
	bh=v+fA2sL8PT2aaem3wZ1F4FcLGMckWT4YxfNzqDv1uMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UT1q7Cdifa5HnxNBKn7zkrazsg7PI+Iq3RYLoeYQ5y1bgAWeMcq/pJXr21y+Cjl8Nfm8+hHMspquFLiOa6y9fCfMOULog71YBT0YRA02SmmOd9Twko1X1BUVU8nHhzSedgzWB3pav1wZA7+LhnccpnTqrfdViWiSwjP60BlW1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=beeS/0AH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="beeS/0AH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428178fc07eso15096945e9.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722265612; x=1722870412; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=orECJ2OhLH097DTMjvI6rJNFg6vz3nlf5Yl6sqJTBIE=;
        b=beeS/0AHgHWiuF54U2Rgz2lh8sjYO1folj+E8zHeDu0pSEwrLEh1dV2briXJ3Jve9h
         zU+cDmJQzsTyaUJ28JKGde29vJ10WYuazMyuzCQbpaCNHCB/RH2w9fbjNEXgckj2atYI
         zSjzNCrsTUahtB3ykUG9NezbMOUysodnoaWU6ISwCL58As50aiekRBteY0Ai1lZ9+FGv
         hGA6JkofM9r/ChKva2+LjzylQfeto4DsWgdZj1Ek5fes6LWr6MNIoV6zzEXen3dquQOI
         HiMA0NMS/nZJJLdtgcc/Tu+kw1qwBymg8pUpIRJan0qtnrVws5xebQ0YBLTxVy8YIV6D
         5klQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265612; x=1722870412;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orECJ2OhLH097DTMjvI6rJNFg6vz3nlf5Yl6sqJTBIE=;
        b=wmZhtKd2WF6GBML0HbCyJtM5j8MjRZD+gI3q+R1uvJGvwVOQ47QI6fjWXq8HohGG58
         7cDzfP69slneF2JZbKMVGip9grEBraPktOwZTZrfYgYmuvRlDRPcz/titjRUNw8JEn4R
         n+xboSqmr9Q8SppKwrgA+M9gLCAOl0QpOSgdQjcekIIrQ5T72CXXECSTjPE7/qxHIuu8
         WX0WOLX+USRb/YdedY/fyYwMwCOaQjhgjznJDk4l6v6DDkaRvzMXDgMaXXBvplKifAiQ
         nNc8msXZFz87yFm+fpwk5MPoK+RTH050xxQUfFm/Tr7GigDsISELea3suNQRBvjc1dcX
         jq9A==
X-Forwarded-Encrypted: i=1; AJvYcCWnS0pxKo9PS0e6FDYu12dIT47M0SaMwr+NYX2PnAuznSTTsoKaXhSaCOsKR+/oJwGBfSdqzWoa3h/NGuCnWcFf/t7oPwu9yMHenvs=
X-Gm-Message-State: AOJu0YxKAN3/rDqbiXCHK4VG0gKKGd1DGcUSs009gj9/FR3ngvzQGNrp
	2Oivy50OxZswoxPvVXHvJOy0OLggJwtTOK9IhkOHTzqKXqVxRhf39ExTMl+/pyQ=
X-Google-Smtp-Source: AGHT+IFOpQKJrPEBTB7GUU+M3eQUukpjNflQqjbfqksXjQSALpbGkhpQ80Fn1dUw9m4ErxOkFf+giQ==
X-Received: by 2002:a05:600c:4706:b0:427:d8f7:b718 with SMTP id 5b1f17b1804b1-42811dd19f0mr51394475e9.24.1722265611970;
        Mon, 29 Jul 2024 08:06:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c067esm12408017f8f.20.2024.07.29.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:06:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk> (Mark
	Brown's message of "Mon, 29 Jul 2024 15:44:38 +0100")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
Date: Mon, 29 Jul 2024 17:06:50 +0200
Message-ID: <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 29 Jul 2024 at 15:44, Mark Brown <broonie@kernel.org> wrote:

> On Mon, Jul 29, 2024 at 04:15:31PM +0200, Jerome Brunet wrote:
>
>> Maybe mmio regmap should '.use_raw_spinlock = true' by default when
>> '.fast_io' is set ?
>
>> Mark, what is your opinion on this ? I guess it is not the first time
>> this occurs ?
>
> I don't recall this coming up much TBH.  It may be that people just set
> raw spinlocks when they need it, or that there's not many people using
> relevant devices with RT kernels.

I have not been playing much with RT TBH, but AFAIK, with RT irq
handlers are threaded unless IRQF_NO_THREAD is set. In this case,
something preemptible in the handler should not be a problem.

The axg-fifo drivers do not have IRQF_NO_THREAD so something is a bit
unclear here.

-- 
Jerome
