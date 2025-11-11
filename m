Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C0634F468
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 10:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857807; cv=none; b=JDfqzSs3h+nQrgYzN9qfp1bnaRba0jMbAOpx0VdfQ9brbBNIqcRXW4uVEgusWpFU7a1tNrLDqurCwJCnTqIA5MAZtYssmxWXKGkEx/GfzvABwgfCVf5AEnrijvECFlvQoBiCyn+97tHQbn0QK4zjER82bpOlpamtvUcJx8wG6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857807; c=relaxed/simple;
	bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmXMV2E65jRi3aMNiknDDAblBXrMYqGGQZ7vGpmpdD9OzFJkQdWyUKZq0ZBNHQs2G4M5Myumt4MapujF8BrbSjg3FuKlsj031rHjQJSrwAcO7o+bWRFvoLB915HbDryTVmHaD5ityBYNYyaQn9AEWJ+5q8IwAeIojjQn72EFLh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C53NiIEy; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C53NiIEy"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-787f586532bso20735447b3.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 02:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857804; x=1763462604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=;
        b=C53NiIEy6+OE3sWwhigESKCaB9aZBDoeFlaqT3RMCLORlSpkHTg50jTkTRl6nYW3gx
         rYKSJxcfLXfuk8ySghcQ7PG63/fJiRXSmd1ClPhya/uEkS0AgsGl023phv2FQXgaAFgs
         t3+IXo3rxBYryZBq76ax77QYYLOI507Uy0Ryuoa73+4rSRaPLUYrVqZZIRfChidxc1XR
         FWOh4ThDObYIEU4GdruMOoI9cS5q5Ht/x5lKKW2yebjNyGEHmI+Zrgn5EMF8m96v+dFl
         J7aM7/HCNdg+5yYDEsy8eZjpiH7QpLdERyPeBAp94FFeLB+8YeceYl8aydSYC72BJNT9
         nG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857804; x=1763462604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ui5TMnYOVOvWRbaK5ZQq5BRT+yh6rrNReDDZ55MO/g=;
        b=GSv1pWOGwKViObE09fAK8JFjwe2oUH7mt08o+hfufkSLFEZqBY3ZyIsfLHIkSpqPgu
         80bgQKg/87B+WRkHOXij5DtGU2NGt+MfAI685uXi529bsKn8q44nLgkPIDZeI3XaW5QD
         aqGjnQAu6Sxj8yRrVNjBS+uVF+nVT22Wha5A07tP2Q1hFjDdANORzF+9z6tLC3yUxdso
         C5mxDw+IZiwqt3I2xjr6zbxUPszOuH54A4IOJjnwtCuLt46rLvVTMQy9I7XyqOhJ7rwr
         HUZruYfD0tpBW4/cQmQrLFADIgoW4EjrvumOxgd6S7JqSDGSFcYp1uWEi7Ul7ohu88M/
         EBgg==
X-Forwarded-Encrypted: i=1; AJvYcCWehfZ/02CyYsPJP7QJrhndlnVzlaMaIdelcz2mCXiPSTTdW90gvg9nxqKp3r40hQW60tixikSCsGq7Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBq5eCoVUSksSuseJV5aNvkWTM+hFHAffjhxC60XT95UgeRqAz
	Gx9QKXCxv/BVcIdLB6W1N/wAlQvBdGk4/088K7BCsMiiefNAFJFnl9G9iEUC9S9gcnpXGXcBHjL
	wVTuOKXnHHQgtPw0DLZg5htC6aupedPymTr0FLMrQQQ==
X-Gm-Gg: ASbGnct5MYS2kMrgMrULXSnIxSHTLDm650jfPLQ6XmEOUOJ0P55Jus5JFlvUtJ0u2nX
	POOVDYjGJsVg/bDjR+Cn3sRRb4wZCTBUH9pnswE+kP1oNR+0lHSo1aAoa8nNFV4N0fKUbIKHv5z
	EnywP5yve0ToC8gL0VUGZvf2nsklzuF6d9wXKTL9OhH6Ky4VZGYE5EkqNSvKrMwre0tpFpge9Io
	/AtuX1utkvG2U9IQbudBtAl6HZuSJwO3hMQv62aXM88Unc5q40P1bGcORkcEFkLt4wlGmU=
X-Google-Smtp-Source: AGHT+IEzf7RfCe+CUiwe51rQWA4HYxWkXb8u+xLvSy8sgIDasS0jY0uVlkjQd1JySagC9Zi6HIYv6L+HM/XcKpRnSaA=
X-Received: by 2002:a05:690c:3341:b0:785:c08c:d39d with SMTP id
 00721157ae682-787d54504b5mr104136687b3.57.1762857803858; Tue, 11 Nov 2025
 02:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-4-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-4-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:43:07 +0100
X-Gm-Features: AWmQ_blT5oSFL37n1q5J1-YrABo5OT0VdTa69W3o0jcai3WIlfGp5Mqx5NECKoo
Message-ID: <CACRpkdYH01pOnXs-jH5mzfT+THtHcQDoCKB02hkGaxf02nm96g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] gpio: shared-proxy: implement the shared GPIO
 proxy driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add a virtual GPIO proxy driver which arbitrates access to a single
> shared GPIO by multiple users. It works together with the core shared
> GPIO support from GPIOLIB and functions by acquiring a reference to a
> shared GPIO descriptor exposed by gpiolib-shared and making sure that
> the state of the GPIO stays consistent.
>
> In general: if there's only one user at the moment: allow it to do
> anything as if this was a normal GPIO (in essence: just propagate calls
> to the underlying real hardware driver). If there are more users: don't
> allow to change the direction set by the initial user, allow to change
> configuration options but warn about possible conflicts and finally:
> treat the output-high value as a reference counted, logical "GPIO
> enabled" setting, meaning: the GPIO value is set to high when the first
> user requests it to be high and back to low once the last user stops
> "voting" for high.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With same reasoning as for 3/10:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
