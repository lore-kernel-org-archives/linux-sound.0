Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567934EF04
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857697; cv=none; b=SmsYMehSCsetILzeJDXDgHnSkjJi6xOUwXieYveTZo1Sk6wZDI08HXYDdjRuQVZbrwBZuDH24mzgLfhuJNzzCMC0kNeA8jVFWdpTsumkZABxE4V9CeBX5OnoMrLWEEFpMh7SdaWku5VC1I45qPd2kr+Olphr+L4/eUqi6K8c5/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857697; c=relaxed/simple;
	bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBkaSPMA423fnhhnO9xSRi2dVUH2sVhWJKflO3hrqH9ZKPA1rOXJ4qQRiprRoLLjHNPgz/FPN2wMY973SimeQqbYhyip56zb6gjiKYXMwxsJhj/C8IKBLCz2W3aK8ZB1+k05M+3RaeKoJo09pwgJhDj9Am6qDJ27r5+T8e7r7UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BsBzDYgd; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BsBzDYgd"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-786a822e73aso43785917b3.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 02:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857695; x=1763462495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
        b=BsBzDYgdLq5JYwIPqSNeLozEHIi9qdflkd/j+ui5ZkmusTeSLTraVh0m1pdGS7gOCV
         64pTgt6ji6t0/RlTTav+AJBDlWDXohuCpjSaYCqbZZMCQXwfYjDLgsAje2blEWsbDPza
         ZLkyEtyiLklNhaHYyqwFdzZrtH+Zp4Bbqerbkrwr7weYuMQmI1CQUNcfE9lrJSBzCuRy
         Sk6lKnxRtyVwNdW8vfFhBIVU71FHD+tbM4GY6sacppRZUjIG2NJuiwAkbcSiml8mD1ah
         eSJXv/ko8om9hSU1bk0k35hMHNajUUhmz8o8BDZozzGF1fXDgHO5xFoiTGcSjcqgd5Q4
         Lz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857695; x=1763462495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0cCxQ4zVWtY3CYLsY1wEHVW86S85uWrXzNYWN3lThqE=;
        b=dWD/y6yRzkC/ypzstvUKhPVZBRvgomQtjC2DUgVI3YLB4iFQJ4x8g6IKOTZ1Yu5cX4
         la5dZt7rYMAlW6tAuljGOjyDFHmRbZHBJVnqSVQ09M1pp4JcgEdduEQy3IT7mDxmmVI0
         pRkH97kwAR0//dWrNvc2zEfvU4nE8ZULfRvlYKtpbZsmMf6mZrc0ggu7NtEgWcFG0pMG
         gihvfSctRO8fYppZIECYHL/rPbjEVvBi4143iIS8oRbHrtWzkHnbM9Db/ZIAuoxvaWRR
         6aYrTJ4lPxogUgw0V7q+o57EhNu6/fLv/eq9i0VlKVEG3cK5I38q6+ljnd9kFUkj76o+
         ywhA==
X-Forwarded-Encrypted: i=1; AJvYcCXBknZ8eOporOXemzI2oIJzeRLWmBLY+Wjsm3mT0HWATVwveTNPJEF4+FEPUODVnCp+qRmcAWf8DVNADw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5sDy97f23f4VvB2odVEPt2Wcxjdw5zqGohdNCOcjG2zOLmn/a
	ZP3lU/8lHuWzsIDrmdtwI61t7yWQk6jMvJY7mAeZwSLjKgStF0z3S0nEcOeXZ8/hZae+C2fvYzC
	iaY9C/GF37GcjCoCaYYD6PnEO7twdEVUIVbRE4srOfA==
X-Gm-Gg: ASbGnctkE/K47ZR8CSgOvtfJMTN4/IMVsywCzuidVnI/li+4wgmpkXcnsztcS1KiABn
	1QKW4BegQqmsDSBSAsEt/v42UwIR/PV8aNP0AQFcEBHCbYB5ci/asyRq03GnnoiHxv9uisw4Igu
	tyGNiIFpxGNKKXED9PeABICfsGnEI3Ngf8ce6JVEWbEbV3Y50YBrYktZTkgzRPDcK2MjKnO4FUn
	9/AX2bsIQvEFybjCorWlZf4+hxdH1ezUWT1TZTx8kSKc05EMEZJZMK7o2t0
X-Google-Smtp-Source: AGHT+IHoTEqTIMeK7JCIYihCqYCVhAe4gzTa4C+3j+k47suT30AzzIQmG9wEWL0FkhepDKD6CvXqSafZZ1SR1+atEmQ=
X-Received: by 2002:a05:690c:8687:10b0:787:cab5:79a1 with SMTP id
 00721157ae682-787d543ce2dmr101353817b3.32.1762857694963; Tue, 11 Nov 2025
 02:41:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-3-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:41:17 +0100
X-Gm-Features: AWmQ_bn0WFQEeQmuj7iPjvAHMQKL1gkynLIxqjiJlR4NSYtZ2qnuSvoaANZDav4
Message-ID: <CACRpkdZwO8mXvjwS7xgVvHmcpF+_pgKYsj3c3QRUcYWPdCt5ng@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] gpiolib: implement low-level, shared GPIO support
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
> This module scans the device tree (for now only OF nodes are supported
> but care is taken to make other fwnode implementations easy to
> integrate) and determines which GPIO lines are shared by multiple users.
> It stores that information in memory. When the GPIO chip exposing shared
> lines is registered, the shared GPIO descriptors it exposes are marked
> as shared and virtual "proxy" devices that mediate access to the shared
> lines are created. When a consumer of a shared GPIO looks it up, its
> fwnode lookup is redirected to a just-in-time machine lookup that points
> to this proxy device.
>
> This code can be compiled out on platforms which don't use shared GPIOs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The concept is sound and we have to begin somewhere, optimizations
for code reuse and cleanups can be done in-tree.

So:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
