Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D52626E16A
	for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459246; cv=none; b=Y71En/KnMZDtwYhdCIrXkCjjWNOZoqWiH+U7A0/2J0XEBrNdlc0uzsqknNwlJsOVJ1Oo8Xi32qoHsXTSZUKNfmty/2uxozje/gdwUbx+lW0g28/L7o1aXqMd2oWloROO+5PdYRG7cCybNBwNP1KutcyRUcOJ9R8v8ZzLHrYCAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459246; c=relaxed/simple;
	bh=NSDit/mHJlhkuZyhSitu2JvNgHl8gNj+Tf2PzvgTGRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhkow72RlDRwFO2BncQ0DdPRoxv5zdr9547AVdkoBuAR/6Y5A2/01opuLHuPzg5zu8QNUqlkpokZvOKDNtD7V3ExdB+FYMwfoqc+JnxntcioZOUssngLoUxVOb2ktvqFs5UpONb6uhDER5DPqS64G7hIie6TiWq8cqeggFp2oaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=opnsJPdm; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="opnsJPdm"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59582673e15so4270631e87.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Nov 2025 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763459242; x=1764064042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=;
        b=opnsJPdmzhM5tdnQJbfSjsg0bFk0p8LPV66XHrp6enVsUH8qX6ziRRQl7HuZ92SzsV
         V/RUf32TQuAJbpZ5fhfkKphvbG2g3OT0c06HLydsLCwXxcd/8FC4NxesAVTAIYjHGe11
         57p4nQ3sLfAWX6HBI0Vkq5KTlgAr0UbhEMyCNX1EQby8Hp4xGr0eNHRkiGMv9yaXUx9+
         Z9Yl7FuxTHEcbFZcSIENmFvabrxplOyodborRcWFDhwD0urfYzmT5/crdFlR4nUSI9ik
         aKdnDFv6fx59R0jWhxbE+a8a6JFT8efPEANJeSUgRuEYs81jZ4KfWpJVZyfXGj+fHB0X
         kEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459242; x=1764064042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMVWh4fXZBKxZ6isW9HD5sLU8SwmoT7bOn5vyBPfKmg=;
        b=bbvfGgVzzDf1gTsxcEanJXaFeZteMV4HbnB7/68ung4jafIZ6KegzINfcTnPem2VXP
         jPI+5MnpU46dApdcEXbsn9bqdnWOmToDXzREALtFkyznAj1wWNnlARj9C5FG6vE39JTw
         siCqHpug5eQh5SqrxFPcnbMZsIOTRijAGAwNLys0ZBkEezBovio058bKvOGpHPXJuXoc
         iBwA3x8ugqWLcP1Cc3yOYSD4aVtzSYbRvycCHwItKipNPFGZdRZ4cSI6qnNjmXux9ddk
         2MmYGbFbI4jpRKvWEhlC6k9zhRGGxMr8lat+rUYsFj/5Tk1Jxpz90XWm9u4TKU6OdkF9
         vdgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXsqviDl6rIwYeu1/LDi/qkXPtl/5UPX+eMu2dVrbkSkRGCf9wZ8uLiYx+TFxKSD0BWjh7Ww3iMKpHUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcRWvVYn9hztCIZ4SwaUsXtSLf5pL9A/LFT6r3H2BuD5HCLKe3
	oHU7A/LNTblEYd6+sOmrmJc2N9HvYOodKGIvVdywB6PDoMjhYtByj7fHTNjf48uZcuqB91AlTQe
	7pKO3jqYthN0FkxOTY8EOc3AHAstKTKqhI6js0ycbWQ==
X-Gm-Gg: ASbGncsEwsrWksyiEV4B2HB0uaIXrX6DT9U5JvEnJuhwQaNzyEl7ZW4I35j1Yps1T1c
	E9nWTztm6M7g1U31a6xFFL1c2wIYxq4uIO+Zbbk0P9hk2RLQoI3eJZ6uYBz0JwmHR9In2QjlnUZ
	piwhZT6cOJs/egDFDoh5kn0NQ5OmqK0yYLZnoSI3wWk9fxzlkeKYzWpmrzbUQiicAbX23VZdzDr
	iQHB1g1t+ytektG3Laj3fYvK/PhZo6pSLimf+ZzLrgd7OqFw3U1yJ5R2Tqvw3hDhUOza8bAnveW
	R5NqRD4XK4PVkthr8LzEF4uiGNPGkL5w4NOg
X-Google-Smtp-Source: AGHT+IEKSj2qpQvKe0IfkTOGZF1jV6/WKVJLO2A/Txv4rPC3yDvwMdMydDTZhNC5mLXfB6q+qgnbPN4NmYCtJAA3Qgk=
X-Received: by 2002:a05:6512:39cd:b0:594:4b55:d2dc with SMTP id
 2adb3069b0e04-59584217be0mr5314684e87.47.1763459241858; Tue, 18 Nov 2025
 01:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-1-b51f97b1abd8@linaro.org> <202511171230.F83EE85D0@keescook>
In-Reply-To: <202511171230.F83EE85D0@keescook>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 10:47:09 +0100
X-Gm-Features: AWmQ_bkhi1H3-46xEmuP3pqCgeKjE8VDjqsBb0GhCZL7ntExaLQpYRSDFU-8VEY
Message-ID: <CAMRc=Mekr=xcGbSBD583nUqR43aLYO9iGakbOSSFEWYdbXW73Q@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] string: provide strends()
To: Kees Cook <kees@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:33=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Nov 12, 2025 at 02:55:30PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---

Hi Kees!

Thanks for the review. I already queued this for v6.19, so let me
address the issues in a follow-up.

> >  include/linux/string.h   | 18 ++++++++++++++++++
> >  lib/tests/string_kunit.c | 13 +++++++++++++
> >  2 files changed, 31 insertions(+)
> >
> > diff --git a/include/linux/string.h b/include/linux/string.h
> > index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..929d05d1247c76eb9011fe3=
4250b487834b2d3c9 100644
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -562,4 +562,22 @@ static inline bool strstarts(const char *str, cons=
t char *prefix)
> >       return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> >  }
> >
> > +/**
> > + * strends - Check if a string ends with another string.
> > + * @str - NULL-terminated string to check against @suffix
> > + * @suffix - NULL-terminated string defining the suffix to look for in=
 @str
> > + *
> > + * Returns:
> > + * True if @str ends with @suffix. False in all other cases.
>
> Maybe added "empty strings never match"?
>

But they do, please see the test.

> > + */
> > +static inline bool strends(const char *str, const char *suffix)
>
> These are required to be non-NULL, so we might want to consider marking
> them as such with the "nonnull" attribute. We don't use it much in Linux
> yet, but I do see a few places.
>
> e.g.:
>
> static inline bool __attribute__((nonnull(1,2)))
> strends(const char *str, const char *suffix)
>

Ok.

> > +{
> > +     unsigned int str_len =3D strlen(str), suffix_len =3D strlen(suffi=
x);
> > +
> > +     if (str_len < suffix_len)
> > +             return false;
> > +
> > +     return !(strcmp(str + str_len - suffix_len, suffix));
> > +}
>
> We should probably add it to strlen and strcmp as well. :)
>

Sure but that's outside of the scope of this.

Bart
