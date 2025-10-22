Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C1169AD2
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147414; cv=none; b=qIYvbgYZjaiXMjRwtlSFwByp4FGi0Nn8zyprmrZEqxQPCt8f38bZfOdRhI8wVnz5NfB4ESrqyiTmF/hbDkipgFhNDDX54FyfmZlio3VjtWkBMRmimEXIh/+ozseAbCQggg5V6O6CvXyqecJG3xbYIacY63g/VqoTdIfMdNnvjC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147414; c=relaxed/simple;
	bh=voJSs7Hw3Wl/EZaQou3RkTgu4VdQyS/EVwb9Mp9QVNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mz07klFj5Ck86ujm1F293XsKOIJDmLcldAtjQUUKRV4lyjgDx/5lFgBqqi3QJZh83hsA178kvdocOzpgesJaZO1k9FIrQR2HunLxYuZ6hvLQngDueL5Z+4BglXnx0gB6hmh9D+jB1bo3hQE9zM2gqbawDMxaBzSq5D/OWlXpbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=L12t+1rE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="L12t+1rE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59054fc6a45so8065036e87.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761147406; x=1761752206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=;
        b=L12t+1rE+8f9f2Pii8C/PIdRs9UoviXh9nOuNQfciu+K6ySdJHYZaubI8Ar0qund4h
         87cLYIm2isV0LihywDTjrUE33d2U+F+uSNel4OMVteAUWqf0NhsWuZGk//KVBBzthMBJ
         W4fB8wRsqMKZBHbuNv4Rq3PwYFsdylxTWDHSw9FcnkCog+tqej7kEXIUGk9df1LSVmCO
         srJ/y9tNCneiHfOQ4AUrXz6ZT4gF/cjiyLsErvxX4C2dZlZ/o3e9gTtiaz2Nyi7iuszQ
         VuSLCt8QoP762tAXBhLqvElEO/Tszi67Dds/nmxWBVMdZeiozzYZ7buez5BkpisZTuFA
         9tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761147406; x=1761752206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRzlJtgmeKcllMySQlFgaimNGUEcv2R+GqjiMHEJzN4=;
        b=dNBKPGvzVOJOKDZosvfLGrGj8rj8bBL4G0OR/X+jHA19AAlZ9H5Dmi+taNNIgOd9RR
         4IORH5tu3MAG+5IaxFCPOV0b7bA98J2E1fBM8hvFAZ74o3ABXet3Sy3Z42sPBzjJiiBY
         SWykwBrErPRWBcZpcSgYFrjgPp3pbHO7PqQyJLg4VNCvKcq1qu+hE8zzei65jzHDrh4P
         PtodT+MSf4nYQ+Gzv18vcGbydITeEnLa+AVg8GAhTOp6fNmhSwm0/AEi/fhYKHQEqSlg
         luaNHFmWgEwB2OQj+CevHcK5LDrnev2u7xHtlzynbvk4RuytrT1mKDZFJqCZbibKKuX2
         RSdg==
X-Forwarded-Encrypted: i=1; AJvYcCXUDbpCpkHvfZkHmLQfNVeER1+ZVNk5yX3+e7qnB0k4Cyt8zgU7mqMoSWsjYFAujS4wVysPZib2DK6WzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVoGR4cylqGAl5+YV1arOWxyve37J4WsGrvbkZ3VTzD3pTpMVQ
	8TbJ2FW1OVgck5D4Qm/A/W53iD3jA1Ib1/xNLc0EInpbk5TH4Hl5mpQDn6lqOmnHqNCovNJ+tF7
	JbO78XWzEnJLqSCixvM0dxJqPurekz4G5MoOOUiLQww==
X-Gm-Gg: ASbGnctCGI4J3md8rJXeVhcllKd296kxadKtj6mMU2LtF8GJiOP5F431UUTRiow4GAC
	gqFhjzqcxNHI5+8aprDqC2qnTQpJdv02D+XukOrcnLNo1wRZ2lRrg8FGoLArEDZPK6MNrp+zj6P
	QU2+VhO+kNhjWRQ9kzpgGzZ+gRxBjPZqaw61Vsr/cQK0DuXEvOT42mYz8J0oZ7Fh9kx2LhnwnVh
	BJqdYBkcjvtJ9UBUU83wJkGRGMyap0Az6xkm8VKvHGwg/FSTUgMDYaQu84ngvFwQgKy7EDhNY8a
	s5V8oYCLuMdwN+xR7QdSzk5eFUQ=
X-Google-Smtp-Source: AGHT+IEi/irswdy4VVxLlO1hAN0Zsc9fjvuDKRe+i2ePli5jYREx+Bc29gt/0YVceCmzNFvpblDZjtrVlJp1Cz69730=
X-Received: by 2002:a05:6512:33d5:b0:58b:151:bc12 with SMTP id
 2adb3069b0e04-591d85a4b54mr8169026e87.51.1761147405947; Wed, 22 Oct 2025
 08:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
In-Reply-To: <aPj3fCYj-NQdDSQT@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 17:36:33 +0200
X-Gm-Features: AS18NWDr85-ZpXwSC6o2WrSo4j9nQyRJc99PDFWHduyckze-ToGPJ6wk6IRJ840
Message-ID: <CAMRc=MeSFKRo1rHq5ENzKqws+gOAX=-nCsGtw5MXvsOwJr=XpQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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

On Wed, Oct 22, 2025 at 5:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 22, 2025 at 03:10:40PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > +static void string_test_strends(struct kunit *test)
> > +{
> > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "bar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foo-bar", "-bar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foobar", "foobar"));
> > +     KUNIT_EXPECT_TRUE(test, strends("foobar", ""));
> > +     KUNIT_EXPECT_FALSE(test, strends("bar", "foobar"));
> > +     KUNIT_EXPECT_FALSE(test, strends("", "foo"));
> > +     KUNIT_EXPECT_FALSE(test, strends("foobar", "ba"));
> > +     KUNIT_EXPECT_TRUE(test, strends("", ""));
> > +}
>
> Have you checked the binary file? If you want this to be properly impleme=
nted,
> generate the suffix. (Actually making the function static inline makes my=
 point
> really visible)
>

Andy, this is bikeshedding. This is literally the least important
piece of this series. It doesn't matter for the big picture whether
this is inlined or not.

Bartosz
