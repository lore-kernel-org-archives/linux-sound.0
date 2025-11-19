Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD373624D5
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563560; cv=none; b=hwy1kImbLvN4/eciotyXj1jazOa5TTa/+FrstJ4+dCUfsekoP4Ymxvy3K24eIttETwNfFNCETrPX5GEjPQvMKcK149JK5JP8MbwCa2+L2WHh+uK5g8W6UrD+79KMZsLfB8w6Ss3jfjzLJFxc/c/irxpVxFzsTRc9MCUzMoRw9rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563560; c=relaxed/simple;
	bh=NJMGAa2+Lu+uUZPIeeGfyW1+Aax12kFvvU8qnzPSJ5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+6VGgZmoDEJd+xA/rrg+Y/nMyyv/ei48BwKHP9Jud5Bijl4YMLCpGjv5rJ8Q0l/aTIMNXDuI8OaZ3O3cdbh8udNLFQUKHsv1N1lzcL7CIaVdLVg2Gefc8GS+gYEN1J4wyMLzV4xKXf5LlH5WMcuPgLB+vZqtNTeu6/63Roe8Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iMx7M03g; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iMx7M03g"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-591c98ebe90so7722179e87.3
        for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763563556; x=1764168356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJMGAa2+Lu+uUZPIeeGfyW1+Aax12kFvvU8qnzPSJ5o=;
        b=iMx7M03gmpDLZLoEVU9Ol22z/K39j3uqzqHp81ut5UYoAWnypTFIclI6SLz0pdCirP
         OJLaGotZxDd4osuVqeNm+DxtnQ7uI+E8sZ9raXE8UEzsXeYfC7I5VwKJeJurEzbNFVu4
         qrC6LHxdFJ8roychbd3mfof4k7FB4FSyv7Xe3ylNSxd1JF4EWxIo+2Q4lt0m3ToGvfmJ
         Mxt6ZJLZDOxLOG8PI44RpS6qSClbeh4vlAdfouF8ANBb9jQEsIIOs5gIK9a3Sm08lIrF
         eo/03v4X9POGYe7DciOx20ifQG0IcKm8y+Uh6Eix4q7l2XxNxAaMvQy2EQCuMRqjzXfo
         ZZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563556; x=1764168356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJMGAa2+Lu+uUZPIeeGfyW1+Aax12kFvvU8qnzPSJ5o=;
        b=EYAbp6HeTGTwXTs5rI1U6jIPFpM3eonh4PlLkg0AUJ3VmdgukigmXOYmt6kEYtuVyd
         3iq8Ckqd3ioyxMgH1i4gDWdR65zyamW0f5sejV/yu2VN4vZ0MSHoKBnX0iP4hw9soLNP
         BLLqlRNeUxLnWhwcK5SRMvIkjnEQQq0AussIFIzlnsCDzo2KYrM1Tiw6ElS0FBbk6w73
         JDf1oSjGqiWnyFGos50I0UKzX0JXKZdUtfkfKwoRqQ0RnfEEbaMr+hYcHn0MzaHpkxom
         Dv/7GoMasj+7xl/0zVKiEnqgAK+MU5wi6LTDmbUZUbtmnetlJ5/K1vu2rP+i3rtyNtiA
         lW8g==
X-Forwarded-Encrypted: i=1; AJvYcCUyyYAFFcr60gxyXyNUCQF5chiar6QTmrG8tgjAkbEm/FERiPjf8g4fRIvmZN8Z15XMtAVrc6N8WKHyGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwxXLH0VdyUq7rXU76YeVTfdCU1rYMwv/YQdTOMoipkIw41kz9
	lycPdOmxFCP+cyZSuNs5m21cFWAqA9qQ3/jvGIP2sDLydyuAbY3ph36Jjnx/I0/wXDL2wHN4GWj
	2vy1FAnpmOxBx1p9HqTPnCLFqLaRgHnRV5RBoXUowcg==
X-Gm-Gg: ASbGncuygJNY1Pfr/rQCE/swJ7iXxiLvkn3qnvn8VRWG0iu98ynGhADkCHszDQsE0cm
	pg2hqCAOmB73scWDfaedWcdG9pkk7RRSVsJ+Aio1lz6wUg08/UOWLMHgR4ImUFbR4MtDj7cXFfx
	CssWdoCI2d5YtGG4VU4/VbNHXbRD8Xg/oPJWI3w3PVgy+zX8u4f5kKXRXgoFzV7B/EtNINY9pUG
	UTm+EDsURK/EmH/Ch0kX5W5i57kdghiGYs6LN5zqxVao4Li9Avqr4dMWCPylKIRjGyL9VbLGbBS
	xq2cqJnHD/so4tfS7hb0OnFcEGY=
X-Google-Smtp-Source: AGHT+IFNbY7iWhq4KbUbMnlS79MQcbD6GBMPJY08+mTEGSXDShLEyEtovu6G5tHIiB5Xtpsj0T0pgNCduWGlE2Qn0mQ=
X-Received: by 2002:ac2:4e08:0:b0:595:9d86:2cc7 with SMTP id
 2adb3069b0e04-5959d863118mr1368283e87.39.1763563556244; Wed, 19 Nov 2025
 06:45:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aR2Uo++k1NKkk2sj@opensource.cirrus.com> <CAMRc=MdFDAmqcJ3PMsTbeZUb9imM+fzHzQ_9mQ1T=syDoCcQJw@mail.gmail.com>
 <aR2gVzKhfN38MHAR@opensource.cirrus.com> <CAMRc=Mck8MiAm_nxY_L6Zw4cH-vYf24zSkPp=bhnUw68Q6FV=g@mail.gmail.com>
 <aR2i6lNNWEbQk0fx@smile.fi.intel.com> <CAMRc=MdYcdrQSDWKDHrx4-Y4-y92AQqr73MoRC3ws-X==SL0MA@mail.gmail.com>
 <aR2o2R30TbVOcqZe@opensource.cirrus.com> <CAMRc=MciO0WYejOYZduqE73U4OVTxcaMfe6Sv1VXWJWL2FFNmw@mail.gmail.com>
 <aR29uKW7yLxws9jA@opensource.cirrus.com> <CAMRc=MdXNXQhE9zi=i0x0yGCi0fKQNU8_tn2_Uy24TAhxG7BRA@mail.gmail.com>
 <aR3FnUNO4DyCdiLD@opensource.cirrus.com> <CAMRc=MebbjT7QAn8M0q0MsbRhTA-CUNKmo4nUPgXBXrmU-4D6g@mail.gmail.com>
In-Reply-To: <CAMRc=MebbjT7QAn8M0q0MsbRhTA-CUNKmo4nUPgXBXrmU-4D6g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Nov 2025 15:45:43 +0100
X-Gm-Features: AWmQ_bnZtTgzygHBpR-X6aXdiOQHeNYcXbyzkWVCiy1Jv8qXBxuj7-eVz3Hr9dE
Message-ID: <CAMRc=Mfo_0reVCxZrBNr0YA1mvUOH9M3bLD6mfCwBgObvV74qQ@mail.gmail.com>
Subject: Re: [PATCH RFT/RFC] mfd: cs42l43: setup true links with software nodes
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 3:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Nov 19, 2025 at 2:27=E2=80=AFPM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > I think as Andy pointed out though the first 4 patches in your
> > chain do loosely want we want. Previously, we used the name to
> > point to the actual pinctrl driver, your patches should let us
> > do that properly through the fwnode. So we can drop the pinctrl
> > swnode and just have the cs-gpios bit point at the actual fwnode
> > instead. I am trying to hack together a strawman but its failing
> > in a lightly odd way. Hopefully I can get that sorted fairly
> > soon and post, or I guess I could post a version earlier if you
> > wanted a look in the knowledge it still doesn't work?
> >
>
> If your solution won't work after all, we can try using machine lookup
> instead. We have all the blocks except for support for the "undefined"
> GPIO in machine lookup. That would need to be added.
>

Just noting an idea: we could set the key field in the lookup entry to
"ERR_PTR(-ENOENT)" and use it to signal that we should return -ENOENT
from gpiod_find() if it matches the consumer device.

Bart
