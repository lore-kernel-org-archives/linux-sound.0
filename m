Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7E91A2C0C
	for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726066576; cv=none; b=R4naDmfHjII7KBC4hGaZUsnd78dTsU/imaallmLnNczfgTbVNU59UGyxBYrtB3+c42/ASXk2ScbsCyp4JECTlM6FX8KNW0DucG6TIzkr8UQGKofGxHZLu8pCdPmCmH+ljiKeKzSOY+EBAEGCuQm3JaVhOF4i2vr3w9k+lvcp7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726066576; c=relaxed/simple;
	bh=5y6hlVFNZ9ghFAZ/dOgsxCt/q59tWWK+iBtItb690SU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DkKodpp1l7jIUEEb2toj3Z4+Ri8TL9La0sl4FreC+a17hNcCTXXeQb4Upd2zAstTO8PC7M4PjbITqnEjlGWMqS2IHKdDQelOpxklG9p8kgUL0Xlqyl379dwkRC+QRAnPxJT5Aibaf4cqz25/H7xnqEy71eHgyshChLgviIouE04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CUDBZQdb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CUDBZQdb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so3621425e9.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726066571; x=1726671371; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5y6hlVFNZ9ghFAZ/dOgsxCt/q59tWWK+iBtItb690SU=;
        b=CUDBZQdbJSXU5H0c05OvytdyQG2ctYFHXVJyWto0hYCduHRsYVfC1cbZ6pRidEOzaU
         4AARucgZIX6HyXXc12JKac97DUvf01IGFbySFISs2sLOkeakv614aql3PoKoOzkX7rxI
         hiVYGG81JAg6iGq/IEd2tlsHK/9BoPH+8r0v2zT0gyAoQLrJiAdP55J1NX0Fl8D6uqrk
         5hCwvseiZZ2BNDWfg7Z+TPdCSLjarUKdI/gKk/elB+NZGSl645ALbiQ6kMPVaJk0JEyA
         roaeqlQ4Uqg/rUg39A3ZJsXCz1kRMgLV37n2FwypSfRRmddNnmEM7H/aUxBmZ56uW4i7
         fFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726066571; x=1726671371;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5y6hlVFNZ9ghFAZ/dOgsxCt/q59tWWK+iBtItb690SU=;
        b=LP+kUQmGM6TINDoMZcKrg9ry/Y01Tsrqzj1ZtuNQSLBjuIT5R6YgipWOOagvgZPUUg
         CV6NOb54ljp174YyIo/ISaO+YGKjcsr4gqJeQ9wgvy4YgyR/mBXlriC3JXDtV5cqCRHs
         IMGLp/wA2STDL3npPGptUzXb2SnVnJtAPPqp3bPdTWUrT7H8epd+6zwr8koyo08GS/g7
         kp15ozWd+Vd1t0j4IK1KcPjH0IswhEiEqipbvk7EAmS3XmOhXxxibdo+SQn3Zu+qYYzT
         mytSyWblUpjCOPLBryVq+DcRu1rBBJEpbORdbdN8nU97whHT4dFzMY8oqAtqB29XXGuV
         YV+A==
X-Forwarded-Encrypted: i=1; AJvYcCVFcskyhbUrJnVWGCwdC4l0QDJZx8zxjiL/ZjUyuvnnJtbVOUR4J53GryroXtCPG9m0rcKESYnDAuaTVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZF39oJfhGh0skJJWOfRxpHmfEHXwgRWlvC287D3fjAUF8tOb
	yYAHdMgKa2bI5pgcsPehsDlkVisOrGRN2Yhm8HjnOuqPmNjLLqyn/CjKR9hXmL4=
X-Google-Smtp-Source: AGHT+IGXbGreRimd0uqLh23FCjFV/446HYpWf16uni3SRkxonRMyp0eon2FdyilvNaU/tKo5u9ETgQ==
X-Received: by 2002:a05:600c:3b9a:b0:42c:aef3:4388 with SMTP id 5b1f17b1804b1-42caef34492mr123874855e9.6.1726066570926;
        Wed, 11 Sep 2024 07:56:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7388:2adc:a5d5:ff63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb77afd5asm105511255e9.17.2024.09.11.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:56:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  "Takashi Iwai" <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  "Kevin Hilman"
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  <alsa-devel@alsa-project.org>,
  <linux-sound@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel@sberdevices.ru>,  <oxffffaa@gmail.com>,  <Stable@vger.kernel.org>
Subject: Re: [PATCH v1] ASoC: meson: axg-card: fix 'use-after-free'
In-Reply-To: <20240911142425.598631-1-avkrasnov@salutedevices.com> (Arseniy
	Krasnov's message of "Wed, 11 Sep 2024 17:24:25 +0300")
References: <20240911142425.598631-1-avkrasnov@salutedevices.com>
Date: Wed, 11 Sep 2024 16:56:09 +0200
Message-ID: <1jo74uqlx2.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 11 Sep 2024 at 17:24, Arseniy Krasnov <avkrasnov@salutedevices.com> wrote:

> Buffer 'card->dai_link' is reallocated in 'meson_card_reallocate_links()',
> so move 'pad' pointer initialization after this function when memory is
> already reallocated.
>

The title could have been a little more specific.
Anyway

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

