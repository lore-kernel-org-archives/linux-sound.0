Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652661E9B3A
	for <linux-sound@vger.kernel.org>; Wed,  1 Oct 2025 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759323897; cv=none; b=NGHz2pwXYoEPRQbhVOA+XlY5tXo7dwaIDjSkmdh1SAQq46Wz7XNne51xe2tkq9DC6cFS7/7uG89lC3EGmkodemSZwAIOMd+pNioMES4c8QJ/2s/g9sNWKlm5/V1h9t5ae7501WbBSeITY1LNPiCAL+Ytb5eRviZ7xvpBD1osfuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759323897; c=relaxed/simple;
	bh=Sd6yCdxS3n5TE903KsbIcaO2lzqa35LHjefQZurCtJE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gbf0cRCmqB9ElbG1LcyekUuNDIvQ056DgOuMSzNID4TSZtjUp40kp1Kf7GFXl6j9Coo84ZILmP9pFYsuG0hnvc3QVQTV1IZf7GpjcAvAeOjtL6KOIJYb6VJ9ZO+hKwZ5csdBGLYFuFmQCFbLBz6RxqbDL+QKO4s1dkaM4S5b1Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YUX3EtsG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YUX3EtsG"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77f605f22easo6599476b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 01 Oct 2025 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759323895; x=1759928695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHbqmA3oKpic6IfyRvOOe8x31ZYEYEaGDwcq5aemMoY=;
        b=YUX3EtsGULfgO3jbr/yyY0xXUjnKvm9KSHwMEvLR29i5AfD8NVcNmxHTaeoWkXqDa2
         +fz7+eZhD0b7REf1FTf57q0trH7Fvmn8i+Xz00LgxDJXUuhmAld99SIhADKnl6XNvefv
         foMuvVWk25cc3qnCJUKOBHJbQXYj0+SFsQipoCqOHKAr6HEpG3RkjEyS0jPcF8Aj77/v
         fUgqNyEzFEiNyF3LKX2KgK10Eq3WxKqM++EwxhtZlYWYCh7/vpK8faKdCXEQTy++eMKW
         IrRhfYSTq2wcv9ODuCIAawLGSAt/tVpfJzXdlo+mJpRjJHQrJpKKvgZ151CeiY0k0Lkg
         jpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759323895; x=1759928695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FHbqmA3oKpic6IfyRvOOe8x31ZYEYEaGDwcq5aemMoY=;
        b=MhOx+kZio1hU0uMG9SXoHwcAy83uzmBKMPxIqiwEYhsv9zZlVha0aV8wC0In2h9ogC
         aBaDOGffE2eMS4maQ1ip7rFHc9Rk4uiVz6tPM8kGzyyB0hGwxVWEDEsLfwSkiXz9ViZV
         SNo2pTVC0dpsLxpIlBwgxhuThes0uvcx3RywgWoz/tK5W5a4oboDKrdLoNLciy4ifYTq
         K4XuzojN/ge3KQfSWdD5rGrSWG/q2cQJcIf224xPmEY9/piGdyLkDGYQ/RM0Igw8191r
         mnJWcY9macHVbwkeGYy5wP4Xh2WoAc/pc3uqyMt1XmhXLU5h2dBd8AvjqLv3lX5zqXnw
         Eb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVflS5Sy7C7W5hJtyYWRxywLQf6/tzWL+X24/KjNIL6UBKLUjo+OT4wxErWSawhtxudN4epBOzD4M0/Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYwX+puP5l+byLp2yiOIkikLtNcbNkbcYl3KxExDLzRvOHeA5M
	FvEsHwczd6U3Gm8ZGWbiDH2e+9PW+FdRpSCHv88jEwHvjGeVnD7JOIVPPGojT8el/+nepVk1J2p
	PXp7bQ59JoAeBb3u1kSOdxSQLA7Fw6E7uj+cH2FoA6w==
X-Gm-Gg: ASbGnct6oOR8d8e+XW8QtUMumR4TDasGWQVT+SuSjU7CIPza4YN5M36ks75e0FP/epN
	S2fRIxQRPHZTQoCa23lTcNip4znFJzPAQAh3MyKfMkE1v0HsrtTdsuc0RcBKDjblJCe4vMsM5NG
	O6DMCIfkqg/15+LNBDRTwc7QP3qr5OMJtt4++257HY64EtagMUEmW39m9B1AtHIizoPubf3uEf/
	fHppM3/MoU285pAgnPwTNYBjKMuU2iuoeO3qHe45Bt0qidrdxjGLqLez9pSnNU=
X-Google-Smtp-Source: AGHT+IHIX0BnzV5QR3ZUNafIRXxWw+fJ+TE74iOPYTO055yiV9YQx881LMKJ8ntEhbIPyMH/yj9fWYf3xbX9jssRLhM=
X-Received: by 2002:a17:903:15cc:b0:26c:e270:6dad with SMTP id
 d9443c01a7336-28e7f43f288mr40560635ad.60.1759323893974; Wed, 01 Oct 2025
 06:04:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Oct 2025 06:04:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Oct 2025 06:04:51 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CACRpkda-ZvrAC4bNLnA+ao0Y8-Nd_-b89N6HU10hhEdaOUYAjw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CACRpkdYcVtJjRHRJ8GgeU7rZDuyaJKu0vgcknb7DsHPjZGKGuA@mail.gmail.com> <CACRpkda-ZvrAC4bNLnA+ao0Y8-Nd_-b89N6HU10hhEdaOUYAjw@mail.gmail.com>
Date: Wed, 1 Oct 2025 06:04:51 -0700
X-Gm-Features: AS18NWB4-ek2de5G39SVs91_zyxyHsKkPvhufhJXGysoQ2YUW53Yv6YTbFeN0M4
Message-ID: <CAMRc=Mdb_cUG+hKq8GyfUP1SYBh0p19J+4dFG7G3JSuZTr4n8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Oct 2025 12:53:07 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> Replying to self so Bartosz don't have to tell me off...
>
> On Wed, Oct 1, 2025 at 10:49=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
>
>> and every GPIO access on every system will be proxied
>> and then this better be fast.
>
> What about I read the code before I talk :/
>
> Inspecting patch 4/9 it is clear that only GPIOs that actually
> need to be proxied are proxied.
>
>> Two things come to mind, and I bet you have thought of
>> them already:
>>
>> 1. Footprint: all systems using regulators will now have
>>    to compile in all this code as well.
>
> This still holds. It could be a concern if it's a lot of code.

It depends on how we implement this. If we just rip out the enable counting
from regulator core entirely, then it would be transparent from the
regulator's point of view and each platform could still select the new opti=
on
as required.

However there's the issue of regulator consumers who need to know when
something changes on a regulator and to that end subscribe to the regulator
notifer. Regulator core knows then it actually changes the GPIO so it emits
the event. There are several ways to approach it but the best one seems to
be: allow to subscribe for a per-descriptor event notifier (implementation
details may include: only actually creating the notifier for shared GPIOs),
and be notified about an actual change in value and then propagate it to
regulator users. This would still be transparent and allow us to select
HAVE_SHARED_GPIOS on a per-arch basis.

Bartosz

>
>> 2. Performance, I didn't quite get it if every GPIO on the
>>   system will be proxied through a layer of indirection
>>   if you select HAVE_SHARED_GPIOS
>>   but that would not be good, since some users are in
>>   fastpath such as IRQ handlers, and the old way of
>>   sharing GPIOs would just affect pins that are actually
>>   shared.
>
> It is clear from patch 4/9 that this only affects GPIOs
> that are actually shared, and those tend to not be
> performance-critical so this concern is moot.
>
> Yours,
> Linus Walleij
>
