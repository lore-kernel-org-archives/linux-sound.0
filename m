Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81FF34DB54
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857590; cv=none; b=KimD5kOCWDG80gjzUwBaAOWRZMHH1B1Wq0jTjadls+riBC1DrW6Kea83e2KySuA6ETUeWpuHk8HMEhkObPGmZJYk+Ocu9O8TvjZ9FqVxBIz1oE6WSs412ZIPxAHvVxn78swwtPTVCQ0Nq12BmwWjEZ4dGHvAg/Ej7Oy+mj3hQis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857590; c=relaxed/simple;
	bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNyu7dgjgnXKg16Y0cRDLWs4TYFvFi7x50wnx6AMbfmS+bisgL+1Qh7ghmwsfGRK/7niKJNGZez9PQtbtV4afoZBfr7OunDL5vgV/hmgTHv34OC3fbXVbNk4e+94Jtd61ThaAhQmWbAkJxBOD0DkrvkyfNxw03ul5CQMzCf/22M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rX39NeN2; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rX39NeN2"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-780fe76f457so40040937b3.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857588; x=1763462388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=;
        b=rX39NeN2PL/TgYFEBoIA2sPMSLu4q60y1Sa+C9R/8ZPxW6qJe0Dzx95viWXQz7cGgr
         PH0grH2HrymuRTq8svDjQdovq93ZJ4mLlaKgcSTll7KfAhiiROr2GfO1+b7/MxlRgnT/
         5YYNdrwHyqf9vhIur4rcrsQGCfCUZtDfSce/YCJs1a00tA3kOprneBPS8RHUzjtOc9JR
         cbyc3eGbrRXkS8Pm716k0+wpv7u5F7YYgh0Wt+QbcWACSlaIIGEVZEEkS3sG8fQ8I96V
         awB/NynSphoHhND6wLUZqoKVhqOJexO9Wq0NCuwitk89qlEDHzJLxIpdBsDcwTaHYejd
         Y+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857588; x=1763462388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=;
        b=nEzZ4mG040ejvYpYG/wnExiLklIOQQXQm46miJY7ekXop8ToDwQoECSKHrPby1cIHP
         1HmyfBCWpQnFxgoUI3V4Xv12TxKipzyjJhBngo/b8VxSGiam2VokSO0rRTUgc1r1ReYk
         +F7mBk9ukkFNiARoEVHuGXKKtLjmttt1SiwOovJ5/VPRBKNWpaG5Abj8Nvj91SIICDbF
         zgYtTauvU9BOYWElQVLuiZvLQoi+hhib/gHgwjL1gtHixC5ajN/hOlSfW0vZHLriUN8L
         PCU+lQbyP3Bfc5m0DPJbePwtHQVORdiDtH48Pm/SwIHrwQYz0/+mMjHJ2KE4YjIjA2xe
         YnOA==
X-Forwarded-Encrypted: i=1; AJvYcCXg4V8m5FgRelsbduqSGI3RO0OHLlK+lnwMnk77/M1sPeV9XbQFtZELPhadK+1EZJIGjTamcaRMrUXtcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6K+MJFMFbcZOI5g/7v3RDduDuBjLeKmxR3tqAk1Lr7VUhLNDG
	YiTOoYvzo2PXP8I9HQhop7P8zSfo6pcj5UXjvhq88js3LHUMR8BKcksaiQeAvB0f0Nz3GTybONb
	VyX19Q6KnJ7EuuAWLwjs5lCWW6VjrxcsYiyrUnTflbw==
X-Gm-Gg: ASbGnctkEAv3PkvWw0S+NpPQHzVfuoggRjpYqbRASP4ySM51ep1SCtpi5pBT0sLYaE0
	3eyVjJGhFlCgRUBMx+EgpykroQL1jG/aT3N2gqTRz+NVWXXk4GJRjB3PN0gRavwp/LePeFjp9Bx
	hcI8tqkO3qP0wwTFKZXpVz0qegX1bZqicS5Bd6GBQlr/jaxAETy7EvMmqlv9ciQbE92G1fgdLOM
	xyReH8tqFLJtjuQE0ET4SMTiarTgztKMH9w/0O7ABopAaodEXmWW2wkeXp05yslkmNmXZrLoyhl
	R3zmXg==
X-Google-Smtp-Source: AGHT+IGdKr3biW2aMZhYy7DvL1RF+7Uz2kpvCtGXfJ2OgvOVwI6zfxqRAu2DSnJi2xHuqa0EQrFVKg9nUpOsh5XjgKI=
X-Received: by 2002:a05:690c:55c2:10b0:787:deea:1ba8 with SMTP id
 00721157ae682-787deea2334mr150764527b3.50.1762857587612; Tue, 11 Nov 2025
 02:39:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-2-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-2-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:39:30 +0100
X-Gm-Features: AWmQ_bk198TBC3PdqVd9Oowwqb_fFWVruyMz7Lubn4P_lvSkb0elFliKm8IlGq8
Message-ID: <CACRpkdYRzuumaCv=a5UL_G8StQj10kBiRfkfrpWCk05zVfGYsA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] gpiolib: define GPIOD_FLAG_SHARED
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
> Define a new GPIO descriptor flag for marking pins that are shared by
> multiple consumer. This flag will be used in several places so we need
> to do it in advance and separately from other changes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
