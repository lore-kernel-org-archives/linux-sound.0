Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624534C809
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140417; cv=none; b=IhugT2KeXPlz84H+Q9EpP2PIpfoMtDPZZ6CtapnPABq0XKQAORjUCrySXrp3bftJQiIXI378amG85MmTJ4KoW7hkjePcagyCZEnySNmZOWQPzcNM8zy3qg7QZ7cYtt63GsRwr+04wjzkNrKqCkqc00h5cdcs12Chh5dZYrCSMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140417; c=relaxed/simple;
	bh=orIYgaMNJClTUKA2Pj42SRVGg9kx4atmkKO79VfJkGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eYlhHGKSIVq6W8Xhe7Y3osGXy955ZK5hnjYzXVbfgy71WSYBZRSAhq0M/5/bx0YgAjOWUP8EQj+j84uRLRg9Znep0HgaYsa897apgTQNcTiAR5HkWKP9QlXPIbEE+jlDgeN02fAIw24nx4Yv0loRPuD1gPnCYDj9+a/t/282XCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vrD7MCFR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vrD7MCFR"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-591c9934e0cso7694331e87.0
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140412; x=1761745212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=;
        b=vrD7MCFR5TiQfiyQ4b02oUQqocgr2+soVZ1doqOvsLFk21dlz6ansHvxpg/DOmiPM0
         Ts1epqVzsKPTxIZEgTAPG9E2iwlz02J7DaqDODW1db/2njFkQJbarS6Levwn4DB2q6gi
         ohXRYq70x90qVfc11r+1GmB1lxZfg+Ml8RL/1e+MdroVDnsqQDagTA7w4x/luiWwUnb6
         Kb7fsbnaZGMqIEhPMYWYXn3oxcCxsfcUswJGBDLQkWp63WfpuWv1mjLkguanLZJD6xVq
         x7Q3AK/upmP1LgDrkGUPeyKJLmxAtJs6N38B9cckdbfVEdtCoqnHqdg6YYIUcJ+3qH+O
         t6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140412; x=1761745212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=;
        b=YFdUz/AFFBkUWsTImaNT4AIwjipHxo8FyBwz0p8EA7HeZoqmoIxcEGJLTd/BShT9bV
         azwqTuyFHRDKuTcD2FSZkVGnGQzar4D74WyMnYqF9o8qTFQtIP1NG/5l6nPKtKTuyHlE
         5udh72DvN5i2yBJE9UqU6qV498LBor/qXhNHlXESyGLhxRR2bTWttE8WyzIe6YRvxFZ7
         +PGIfoBcPpyYf/uzyK0UA9/3VV6s7XOSRYBVVmM8FUNyk61GQ6F8yWspJvQgs8zf/bb6
         hvH9fqm0T3s/gOBajxgLgIeeUu6dds1+uOsnp3GUtBdQ3V1jW8RzYNV6P4eTyLMXf255
         d+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX258J/yak+hqeFjgxMzT6TkIZegTED3f+64x02gGHZIZ+S0+gXvmRgYqSfeGYrhWzlyzwa8iRCaCpGNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9N/Or9aw17QCDAUDD/Ai9mEkv9l0tUT4jZCdVTMxWe7TBH6bi
	TWLMqNwBuTOklJjWJLMg3lm2PQBoSPOw1MI/AwIx8004NcG+LAoiWt4GznMNNhdCXv1b7u5SqHL
	xQCQZj17CurPtKy6XJyML6VwnUMyeuOQF6weEoOYVDQ==
X-Gm-Gg: ASbGncu5v7eByRHP5XtSrbDY+Fg+lahimZnJ/0/L7D1GVpxkDjATjjZNRfncJzmbEfW
	UigiRACf0jqt88j8mXnlWJbgOVCILydnhpGilmZA1AHE5TNvQhPNpGTMyfSEan370cv28qCxIiL
	GmK3pGYUqyIYIt2QnLqY5QTG1XMpFk4sZV3IIXn/DaxahHYPOWmZ9fa1UtdFoHf15atg2OKC0+D
	OYzomnuQfVL8T32E6YPVPMbrr7p3h+RKF63cwMM0fi5x8ZZJCoMSL8hY8cL8viifQQQyCeGDpBJ
	kiMpc7rrwvVlTTTyHo4MFMqEVGg=
X-Google-Smtp-Source: AGHT+IEKqm8lYyfETbDHoX6GlVAlvBKAEAKibR9/ZUGF9ZkgmvVU7aDY+sPQ7pncE4VQkSkH1+uh5CHDb76NK4aZXko=
X-Received: by 2002:a05:6512:694:b0:57a:1846:df77 with SMTP id
 2adb3069b0e04-591d8550fa0mr6598936e87.40.1761140412394; Wed, 22 Oct 2025
 06:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
In-Reply-To: <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:40:00 +0200
X-Gm-Features: AS18NWC2AFr1HYLKJbD6SJ_gfPPZz3lolA3TRfFJfK8fopnOG8MhqaQPJHZTguM
Message-ID: <CAMRc=Mf_qfFzWqy6ND+YDuXcv5NOYiRTo9QY76V719PqJBMxPA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 3:34=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Oct 22, 2025 at 4:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const=
 char *prefix)
> >         return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> >  }
> >
> > +bool strends(const char *str, const char *suffix);
>
> Why not static inline as strstarts()?
>

Because it's not a oneliner.

Bartosz
