Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9F92C190
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778565; cv=none; b=GMijBuDEeyFCCSqRl35VFwOOMU99+LFKpHEqc2WhHaIY67uxPGbbUrZ+JRthAHFFW8OxxLqC5xr1eBHg5vqWYopamDUwxG2iSGhrdLY/zuYP7bedMSSnx0eDnPNVMMZXJI57pGYbEVVq94yelzUzyRDec+rwklCGgqWxJW4oluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778565; c=relaxed/simple;
	bh=Mngr5OSeCetNARziogWiGPrfeL9EFrmN69AsHpetBC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWqUulJSBGqktssz4P5sEna8Isw+CTdtgR3C8R4KbRjoaA+Tlyl6WJOyClfEvK6sNWyBzfZbb0fK873xb3B5QyE5BwG/QSkxyGYUjQcTnbpboINCv/YjIUU14xis0yzG5GV8unQzQCG9y/siloMDc9UyosuCtpxp3qt+3Fs56rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lSYhq1DS; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lSYhq1DS"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfca745c7so46623551fa.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 04:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778561; x=1742383361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mngr5OSeCetNARziogWiGPrfeL9EFrmN69AsHpetBC0=;
        b=lSYhq1DS2IV4QCOe9/50dac6FnuThdHquYQM0UFdB+63l32orp05DG6wrpKuUx4ySQ
         y2pPjJGSvIGmknC2Qp1/F8Fi1TNXQes34VBO3zRxArvHr7FYfM0biyvymqKYyEfnLDW5
         pGatK1FQEqEg+qB/wduCGbLNjDtruaDBEg1m0zFmvVw3W+SCcgKQsfP6mfX2jomPNQ8t
         ySZ/HMXV3EsjWbSmGN0fTH+Wk0T1FQ4gddEHGI12YVUVPIg5ymshVl80M884gZUmyKPD
         EJTOzEht1X/hIqCGktpY1mBBR2iorm5CYmWUXlLc9Ref+Mpgn/pCF6n/RmACBWi808hi
         42nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778561; x=1742383361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mngr5OSeCetNARziogWiGPrfeL9EFrmN69AsHpetBC0=;
        b=evMIuyFZr9cs9HCMg+QvQIHfLjUuCTgDQvjy0cswja1epJ7quurB0mqihOZS0JNy0a
         8BJBk3f1Y7qwhG6TS5lb8VjXznrsDVAivjEVS1S0KJfCA1Fztv0BXvYoX4tX9vyLvtet
         Sthjylt6QtUXCQFaE83LygEYVScKQW3/cqSOzmHatXCeZfsTJdeOg6+9UBuSJz1LUooj
         ycy+X6pPkAPbU97dOLnEnJoy73aZkyF9PyD0Duix+5Xw92wN6S0NnESORoArFiF5WQ7P
         MNfqTTC2Vn2qPSsdQeVZo9I4891Bd1mmmyMXdPTwE6n4ofrMRy96L0l+Mrp1/uUZL4X9
         ff8A==
X-Forwarded-Encrypted: i=1; AJvYcCWKjkriCS/wj8zMxXDZkD0DpnwbhLS/ROYIox/d3u6GowVyhEt92A0jHGiessdKvdrSszJykQAwAfuYZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrhIhuZaT0X68WcrS6leA4ozPX+6QfTDY498s232BjNxkqskFR
	+fnvvPcyrH6zR7IIh5lmbdIJxaaH+MNqcBBbYfStr53h6oC3RfeypRMRt5Y6lh8nI7BniuFsaZG
	DocMzKLG2oTz5bhjCvBKerB/wCUBTECwWzkuGSQ==
X-Gm-Gg: ASbGncvMAKRdn9gcZkmIzOKdpus8U3ckz0aolB2sdyNOqYBfsYDY42g/6xAr1NBgblQ
	SfElOVNzUfPHuPkI5VrckhKz2yF/gNkKjwiwj4lcuLfeOXkUo3RrcxQ3yOYjjnVTHUfmdUb7ZLC
	cEsXl074ncG2Wec4grRFx0TGypRA==
X-Google-Smtp-Source: AGHT+IHNnFkEjpvfHiJdO+e9mMjncNuV+ITYeWKG0Vc/AcqQM3ZCLOEGxVsMPJRTHknrl6hQ3B7ngk/iZV54xUtIebQ=
X-Received: by 2002:a05:6512:281b:b0:549:8eea:b1f8 with SMTP id
 2adb3069b0e04-54990e5e0ecmr7764360e87.22.1741778561141; Wed, 12 Mar 2025
 04:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312-cleanup-table-v1-1-1d9a14464482@linaro.org> <Z9Fsqa9O4Z9qPWFc@smile.fi.intel.com>
In-Reply-To: <Z9Fsqa9O4Z9qPWFc@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Mar 2025 12:22:30 +0100
X-Gm-Features: AQ5f1JoNPim0CAgQf5Z0hPZ9oOqoYE8TnjyhiW1OiB_2ipzHQHx9rSNG19tk5wI
Message-ID: <CACRpkdYZmFkfC9E9tVb-RZJw-atBXrvP2k6quQ44HhpotGmnRQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: samsung: speyside: Free gpiod table
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 12:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Mar 12, 2025 at 11:02:25AM +0100, Linus Walleij wrote:
> > We create a gpio descriptor table but it needs to be free:ed
> > when the module is removed. Add a devm_ action to do the job.
>
> As the fix this is fine, but I'm wondering if we want to have
> devm_gpiod_add_lookup_table() in the GPIO devres,c/h?

A lot of the tables are added statically from board files and the
like, i.e. there is no device to associate them with, but I don't know
how many could actually use devres?

Yours,
Linus Walleij
