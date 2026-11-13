Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582629;
	b=O45l87ukWW0wdmsmPASb4TdeNug3iu3RiDwvf5aKyDh1tX68wV5faIt+GO4D3pdqXFhu
	 u/qhNjt+ahIqOD2AUHI1YVkSM4bcz3g3xCzE9H8Z44EinOu2LCu64IS6NXQ4in+xuZThG
	 X//zcu+nAekS0nbH6bwWRDfnHD14kIVmGgxpoukeypUluNsG920zRyDvMaRhMfZPWuhnE
	 ir8gMDhLSlfRvXjx+drpR7n9JX0rJDbtCPmV0q2A6sioH7rZS1xX1MU5TvaBfb7/zSFwe
	 wNn2yUoFcZvXamsxHRQ4xDHNKvHsZRg1/Ymk4U1hhKmIxryzRj8eoKKZHgv+hGFBftw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
	b=hw3jezkWgh444DLR3nK14+8yQkVIIiNrsy3k8l8wDUXuBvkvR0HWKlvoWmmXEO0er1Rf
	 2BRli+i3uHHX1tVk1P54Nq50Rjx/hzViplCpr1roVh1gupVdn/Rj6HhEWBJmfTg+HZqD0
	 xpxcD7+VFXiWq9WuH86PH/hGmrTLH05p5mezNamcfnry7kMHfwEOehwbkOmLH696bmh5B
	 AKaDncpsAauYXLOeFJlHni2r0Oky+LjgBpsengC27TMyEKaWoK2Ht8FJQi/2FbMHYCVu0
	 7GGS0P9KDrxgq8NzpJCI+vzRtLjBzbODGy7xYFYZ9T5diAmwuR1Txbhuks6Z27/t90Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="aI9uD/VL";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28111606A331
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 15:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28111606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aI9uD/VL
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490f38e9688so766049f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 07:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794582627; x=1795187427; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
        b=aI9uD/VL3MFl/YTVFubfpHc2gfhbaGha11xUKjpX78I3nhL8QQ0L33UQ8NLfTFQChN
         /akBeYMMP8N+/hOod74W5o2ZulzkVlbzN6CJZrYgpRqpm5n3Y7kQ6otNETxOr/WI5B5E
         XSIuCLVEY+Q1FevbN8CS6dDtFGysIJiv3tiXK0cvRDnJlM9Cmt7uS99Y6rm34ynNlaNZ
         G+MPdTtTqM6XPsWU/UoVDtkFP6lDXbGCLcN4qXfHh23sEyUei8IJoY3YOfc2jA4uv8AP
         IVGDcfvEUaIookJwPZ3uFWqxuwVnEaRdNZPg+bt3YdWyFIObxT2Wa9L7lVnEpE0Gjs9y
         AQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582627; x=1795187427;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
        b=DRml4Fh7Vi2vuj/i1dnlHmNMKkoPwfG6dqif1F39xRv7IfrxUY8tNt8sXBj4A8w7xX
         0hXrzVdzWzvhGQLwX9fhut1hKz8o91s/DEqQVQEzFoAx8l02ObSDlfl8x5E6TLjlgC+S
         MvFdj5AvBJ+/JPW+9LOsMt1J0xgTKB7OuEV77y3T3eaX2WEy2TKosncOsI9NZli4LG4Z
         0UM7GrXokCklH2rIvy1AfceklE+qWBvhynK1bNY1C0mxlH4DgJPb/y1YvZFuwRKM7aQj
         cj5hQBuE3eB17z2nUDr3vpYSdWtfoKAdWWT8AtBqNcNj1Z04TmkuT9TcPtfCuLlyWM09
         opRA==
X-Gm-Message-State: APuU4Z8mSTBjz/9lVUl1hPej4wcrEgOROuEhaxq4So8K6chU7ATRRmcW
	3Jy93bKV2Y/fUPpt5sEbqkbAYrGaytxe965dzhxH8UkOg6Phg1LmBw4OVbKMBi80Qio=
X-Gm-Gg: AYBFou0ia57Bb5SPWDKSyZUcAit+pvrHWCnipdxgq+9FAMw8kT4XdRgbCkdY4S01qLf
	hWQmj45FXm1H/zrV5rlnP/iCVkZC8rPoeq8HumkKL3GUbMpwuZSlgq8eGaaft61tQ6RQmzPJJfZ
	EyHNzoQtZCaGIyNSZiWq/5jjEbzfcKVpfPa21MDAz9g/j8pHQCVN7CshC43lXH7rijeKAGMOv0Z
	xXaaZdKoaNOzaw2L0X6CgWbLlJ3h20xGr8a+PFJB/03kks3lZERk0Bc1CCOsrZNEdj1/vLsR52b
	v8YAXy/eG0Gh4677hkI0K1ZyNNN7yV7YwOrsR5u3SfXOg1sokULqMGsorUMwE5jsH1mKv7ivmyQ
	BS7zYUwujv4EUXf0dZxvcq4ahSTlMKz2Mo3z4Pl2L1NFEeoqrDnGSs7T5qCJSjZyEY2vsQBkSKa
	KFodzLlSNCTDGHaH51jdlkSGmLSUMjzAPLgDo+EM7D86v0IcRpkhJI+WjkW3Tni23pPTZQZw96a
	w4tnKMbLz7ojY/1yD50ENgGvcUYyBBVSuQzaZwFvVWQCB9kElHZDLFov2pp/5Faw5qkfP93eiaD
	VUUy961T3rX9Fn/l6QXnAWAGiivFhjJ+30/qGPHiGulmRN7A
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-49b01cf341fmr9163986f8f.13.1794582627273;
        Fri, 13 Nov 2026 07:10:27 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm5879282f8f.56.2026.11.13.07.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:10:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Valerio
 Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock
 from mutex to spinlock
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
Date: Fri, 13 Nov 2026 16:10:26 +0100
Message-ID: <1jzevczs0t.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On mer. 11 nov. 2026 at 11:12, Valerio Setti <vsetti@baylibre.com> wrote:

> Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
> Sashiko [1] while reviewing the series adding I2S input support for
> Amlogic GX SoCs [2].
> [2] depends on patch 1 to address Sashiko's comment.
>
> Patch 2 adds a hardening check suggested by Martin while reviewing v1.
>
> [1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
> [2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
