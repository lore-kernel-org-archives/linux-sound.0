Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0B347FC4
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140049; cv=none; b=fVCBTIPQ1WdqhOOUYxGW+5l9qb2yPiKl+HRqJ+rP5k/oG6OkEGFnKlh0OiVcPqh0MtduB4KgRelhBcbxunoJvnQ99V8z6P8qSdj/4jDgiCE+X8nizHECmh8Q7VEfion20SQqMmJe61bin1uVzlVw0Uy9FY1X5sKi+EPEUZO4RZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140049; c=relaxed/simple;
	bh=gWtnyZCMZ79lGvtHTyeCn/sxtckldijN3FKie7XpzK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKgbLI1w79ss/+0/gBTEimd8kcgL1GHORDFDdEOz2Hihd7ZPGmnNtugFcCSfl2xK52PrupbCZ5f6wrB442t7sAemgPs56ih9wKxICfQpNy0lLJ7Yvz+QtKliHS75Oq18MI2pAfK4m9QlCETPoTf4F1XO1kPDEd5rFhOzBHvI1/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDVnjz5j; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDVnjz5j"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63e11cfb4a9so2833965a12.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 06:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761140046; x=1761744846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=;
        b=CDVnjz5jqOsaNOGf/xUBqTdky530gFLOTueh497tFpB3jkwYJP28o/3s45BjwsT3qr
         lxtZZfaUu9NuRQXrZQus0kZ+fVkvLKEZlTTPAjnn8L1AK83eyuMn7Wafr0Zx2aPo2m7B
         fOksJ515XZEh3M9ikP0Zi6ABQa5qKlirVffuN9zigqowVSbr8nMHixoqdkvTuY6pM1iV
         fQGnCgY4EBxF4s+0B7aI6fKEQq3+tw0kG1+xMoUyanJoZ+Fu6ARAN4wIWfTxh39VwOFr
         Wx5ZbOHMR6GU5w6ATE1Pq8Wi+CVOQETUwWCPGLKBJ6FEJg3fmGgB3Tv6eWF5BzUXgSL9
         dcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140046; x=1761744846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=;
        b=bfg1UrGXAQz/P74CO4kRfwtWyybE5SHjMIw6Po7inNpPsTZUxBBy/gdbxhzqylfp2H
         JnyorL0MGW/EZtpA24+EYtErDqumIPJ6vxDQ98ujeVWusm6+vwox9byPeceRSVqAKQ85
         Qob6n3cyV8GHyQjYSNdf46kaDI5PwGvfYQPiYlneXiHnGTuuwdu60dHQUR6quXojqMdh
         q+roWb2u2iYRIO/0HLP7Ze46xPuNgNTxJTRq+eX5y4C4MtAwzX3F/2vTYlfIf4qVdQqP
         zug0Gn/5naTfKSYh92CV8ijOtq5PuAIJ5VeRu6oo72LfcLaW44uJsvS5sMICam7Mcg1f
         mc1g==
X-Forwarded-Encrypted: i=1; AJvYcCXfSgQ+MvklaTUH3zlALaQtKGqAciC8iXX21li3pY6ZfDbBJIU8OAzpJsjPmMdW9VZdQfF+8FEXVHU1Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/XqQYh5+p2lIvAv8SFKPlGYkaPv2jqOQi2CafMLZjXsDJlgot
	lI+OPMFURGg3kDtYmNZHwaueGZZ2aQSCk7mA7h7pv1yl7TaNHsecjuDKPNPbRk9fx9uuaFJRs+r
	6rLd7ehQrr1MbwfUdYBZYsFYj3vgFIsg=
X-Gm-Gg: ASbGnctYWQHAfwKGx1cJaUPVGkStqwSGP1wYhfLjtCizX+DfJnnweRkXfmLaj5yjd6m
	OVQwR7OkrrtOHiDhW364WRYr1/0fSrwnkO5vrVaIGKo2EMwi6hydTB6wOLeHSDNFtywzgnm+J8t
	slgU6zPO88dAVq63apIKb//j46GwpawUzy4Onf/Gs/kWXZgvO5Qof6QS0sDkzBRJIham7V+fvw7
	tU/ESxEvBXG/IbF7V+PauWC3GXFiOFerZohfttJ4CvA1Sx1ffZbg+45i9b5AfOCRMK4Bvup
X-Google-Smtp-Source: AGHT+IF+bGnEQc856DkdZpIAOaRV7nKVJQZfv8gn2VCNIJnjHmyCsahfWQqIidtzCF/ZoRQsNWSOtm7llM7J7h8TBP8=
X-Received: by 2002:a17:906:7314:b0:b45:420c:81c0 with SMTP id
 a640c23a62f3a-b6474b36a46mr2340985466b.36.1761140045360; Wed, 22 Oct 2025
 06:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Oct 2025 16:33:29 +0300
X-Gm-Features: AS18NWD8eeQXjXIPK4eXDVlSVPojwJxWfrcwXD-jC0yt5VNiNWjvrq9EAmjuWt4
Message-ID: <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

On Wed, Oct 22, 2025 at 4:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.

...

> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const c=
har *prefix)
>         return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
>  }
>
> +bool strends(const char *str, const char *suffix);

Why not static inline as strstarts()?

--=20
With Best Regards,
Andy Shevchenko
