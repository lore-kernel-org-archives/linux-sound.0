Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7528506F
	for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248368; cv=none; b=XF/tscVOMoEfyXc4s2BmFd0MB+tX0fezO3H+5S4/nTrjeFFFbrqIrOcBP9dLwQBmjstvu96sOVSMarp9HE+uI31eq9XcnV8pGAkrc07UrxqpgchC+NdHZH7KfS/Prp69uG2/teaIpe3Gd5Bc8QYydl2q35nsiKyXemEaLH5BCPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248368; c=relaxed/simple;
	bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAzA5XG03MY2hj3s+Ku23+GB2ue2b+TQ+jTr4t9fao1aB53TWG733J+z79kL1QYYxbAk0ZPN66AE6l8msxTOCfphOTpC0LA/kGLigwa3KBL9aI6d+vZlEWk94RV5VqtwHqllaIiA1Ceszpm3E6ARr9TNNQvkWab1y3gGxn1yDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dFYZfJnz; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dFYZfJnz"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b50f357ecso35126491fa.2
        for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248365; x=1750853165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
        b=dFYZfJnzz8WZOjQ/jVt0NBm7oCvXgNJpqC6Eca3/ascBl+JThXhTFViuYhiznoXNLE
         Xa8TqHpgO7noOG9A3zQOm+SRM+g3JkOKOkUQ56D2VRt0jYksEpwV/xK53bkqbRitt3Th
         3i0H+cVTIDz0xL6lhK4WyISjLVxCUAnySDaga/Xt+pdcYQixylz0XLReerhnWkLg7pRZ
         V4VY83xJcf92V517g2PZvHdRP+pcvjNWXWOm6aIDGnMXRsOYRdpy0JEbKTkEBdplGBu5
         t+5kVbsSFGQCA/TPHnGaUYoX1HWMyPQ9sWmkFkx1rOrJur7S4TrdCJ/3xRsbOms6qgCz
         Ph5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248365; x=1750853165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waDBNAdNXxdqcgqHzDMNkvJU4Fw+VGcJ8hQzEddJRYM=;
        b=Pe+7aQq7/7EU1tAT4VrRlLYVjF00sP7Hd5uSc2hhtNmnqoylx1C8KSHPO6HV87/zF7
         TZDJv0o49uUQuxtfV/jWS+RwfPZ82D1Eb16FRTg1V26XkfTVug6zfImRiwXBgQbLJwE6
         DsEYzTRoLulTPUcrgEQSFIRYK4znZuz4pqA8bWkpnC0eZLV169vDEzWHKx1KUrlheTiJ
         UEJX0SURh4bsUesraxPcUEYRYgmzoKh2y1AstA3ihy+MzOZVKQ5y1JPoTju8FoOFjpck
         H/5zjcmq47RbxVEflVPTlFAPrm2fu7Rm0/X+5Xaetcz6v6SF45qQETIoLySHuKsxw2Aa
         z7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWQnGcZqpDpiGcQvGCPkh9FUZX1m8CXERwaNoq0gMIv/rqaslBi/y4zJuhAnBKIaEgleYP9CSDaKGbiVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzw1SQNJx3Kuz9KTh8jwQGqQnYnxuMhYtyNfw1lF7jQCTqGIiA
	R7T15N23tsPjsnlREfzT3+706NQY/Q3Ka6vufBSD7H0t2aqVfh+o8l4iUgmfY6SxWT3KGO2Od9n
	zHjAqjnaUK6NkUqULhbjgg/bVYmk0SzjHYbSD96paCA==
X-Gm-Gg: ASbGnctKabTkrDEdnozLs3Zpc55zJEHQHNTzmWBmg1PmTQdoR0NB/eCG8UEy0GwgApC
	+GTsCVOXlx1DfudBUJl/mYBy2YpAPumV65DnxtC8LdCkmYYL9FObXe8V8RhLC4VpkIEycEyDuA5
	uHAHdyWKkjLapTgxVMH4THxix/JCrGIwqnKWE0WtU2VNQTNVKN5SQO3Q==
X-Google-Smtp-Source: AGHT+IHX45QNOrSIJj3G2Buvowk5UVZrkDeOZZtLRBUP3Ikuxx6tV96sZ9aCvKwmf2GYXljpSaZA+m97MagLrCE4y7U=
X-Received: by 2002:a05:651c:544:b0:32a:81a2:ebb with SMTP id
 38308e7fff4ca-32b4a2d8910mr59681261fa.1.1750248363616; Wed, 18 Jun 2025
 05:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:05:51 +0200
X-Gm-Features: AX0GCFuR6ywo5MMooqLH6lBxOOHtdfd0tMD2FLmLdxJO_FPZD6GVp0IlKcei7Uc
Message-ID: <CACRpkdakPywi9=wwMNREZWbT5=VrJP=vzZVuyE0S+FCDX0-mEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: cirrus: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 2:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in cirrus pin control drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
