Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3469734DB48
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741687; cv=none; b=I6y4dzL/UFV86xrvi7nGqSfWeMmcwN9hgg9eB7WbQWbH4kF0nU9PNK+twq1hVOOouRWGPPe3dJngIssRBMDWiBZmgU1/C5mGsPycO4z4Nr2nwIE2lad5z4yOenq1TXtLiLD2XmeSJndczk3WMoEM7nTqPe/4gLJdYWd/nMHgtjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741687; c=relaxed/simple;
	bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuojMdUBJOdNGzGdwpSAykN71vZwQtHbjLOXC3O5I3Og8xZoVAX6LxSgv9NO2Whk753Mi7VeQ2uFvR+Wz247/ru96ta2+65oRXtEGbqlHZTQz+R2y5uaNZhCsUDsRmPDwmObPSfL6Qp8eq7hRuqH2EJ9pKnYuFqCUWSb9AHLdKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hyjqqwMK; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hyjqqwMK"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-57992ba129eso3800985e87.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761741684; x=1762346484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=;
        b=hyjqqwMKlVbrsrlesNjru6EvotES6SrhMga7FgYCG0XewJxKvoiDPxx2ycrLRo3Lqe
         IW40iMZQYr0LfAf6nSu/98u2A1l1wfVszqz7PPr1Z3SmTtUoBpSnRXdGf3L8Trs8SzPD
         vSqunM7aZBP6O0ZpRLA36J4FFq+lBhpESQ8xn4Phlbf/BjTrcsYvHHRjczJAuzdWVTT0
         xSMl4FkByJ2JulSrmfkn07inXE4sk5ineQaXOonfrrO/3dkTSmjfUTcG5xEWCCdY30RK
         DJEm2NqnOzr8JM2CVjlNuf8s0E1aPlCyxoHfRPqXH+JJjhF6DdrwcpoC3rzKbnA9pIeU
         wenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741684; x=1762346484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GfXeQTTcxSpcQZ8VLho/amPI/XMfZn1ZR5wbT6W4Qw=;
        b=iz9mdwUbXEILtDfTyov99ijayV4otjVaTbOLClk+0yZ1q5Wke6RRdc+sD5Wx2EWy2P
         zFBTb1qicqrk4/GvZ8JSeKlRrQqCA/FlEAj7y8jlrL3KeQ82W0eNAkiviTP+zg6g1A7y
         u3g7Q7jjCGkAMbN5kU1FSJ6gU3XsWgvRf+NwlD/CFLgV0KzcRkkONy/flWlJAh+iMg9Z
         4i1Q9CX3ODmjNi9kbk2rlM/KUB6yHhpoBFlFGuA7OhuerRXwx/70qaTrr1W51Z1TvFrU
         /rtLKltmzks0/5n1b/5XZAyXYERhTlR3e0pp6xB9NCjEDQ97ivo5+P0f9ufzJF4V+rL3
         efyA==
X-Forwarded-Encrypted: i=1; AJvYcCW93/fAhRJokOAtZm2nweEE288uhkbOv0uJkBA2Hyh9MuxRoy5Wflfb2Vb5enTeJzb31l+xSH02KFR5hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNrGh88FMz29eqVEIdUyDhZHJYMQdjkFVZXu7RrzAUaS2VoMA
	ubeayyuoMk7O/o3KtPfU7g+RJZGrIagge6BuNq0EAt2rhLtcDCwGN12KpEO2UEWmvmPsgFobmUX
	wbnWb8/nTm1XJkElQgMiGqTEL+TnfCl8L6V5hmlQPaQ==
X-Gm-Gg: ASbGnctVg2l3XwLrWNL8qJ3D2fwmHQ3/G0P9qJot3MsLXx2+GkzGO1GzSZamjhqi9oi
	FuqLdPYDx117ZjiVDMG2GRAh9tdW8rbwud2Wux3Ulmnp0PKt0iRKGnQyILxZ7o+YwQzWxQskz31
	3Nv49SXPI1zn2fgywBusYmhw2132ZvsJHcg3x9pF+OXF/eo0td5RbXzuTkGKifhM7DtDzeg8bOo
	W2BxBC6dV1g2yfBT5Dk/al8lpXqeubm97dGE9QtLU1GLlU7ZmrcXGCmnEiUhataX3MXZBb0q/gM
	rGSx6pSA4LaNUCqS
X-Google-Smtp-Source: AGHT+IHlRZvbfo/SYNZZ4o30tnBaAGKMcvTAo3NYRcGh1EJ9OHd3AuMhXHkwK8JOue6As+3lLZ2qXnJTw5y6BaOTrIQ=
X-Received: by 2002:a05:6512:3d05:b0:580:dda2:5318 with SMTP id
 2adb3069b0e04-59412a36b93mr989969e87.8.1761741684202; Wed, 29 Oct 2025
 05:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
 <20251029-gpio-shared-v3-10-71c568acf47c@linaro.org> <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
In-Reply-To: <aQIAXO1hUrw4Yp9V@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 13:41:10 +0100
X-Gm-Features: AWmQ_blYolUjn6HNVFswcXKBY7oowKsMMcCgguiaK5B1Up7lgJHjEAFObXA-S34
Message-ID: <CAMRc=McT+HinKvajHmBYPcQKoboapAf2E3ErJSP=2jXW9B0omA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] regulator: make the subsystem aware of shared GPIOs
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Wed, Oct 29, 2025 at 12:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Oct 29, 2025 at 12:20:46PM +0100, Bartosz Golaszewski wrote:
> >
> > GPIOLIB is now aware of shared GPIOs and - for platforms where access t=
o
> > such pins is managed internally - we don't need to keep track of the
> > enable count.
> >
> > Once all users in the kernel switch to using the new mechanism, we'll b=
e
> > able to drop the internal counting of users from the regulator code.
>
> I am wondering if you took into account the layering violation (or others
> put it as "transferring of ownership") in the regulator core for the plat=
form
> based GPIO regulators? This popped up during the discussion of
> https://lore.kernel.org/platform-driver-x86/20251024050537.92440-1-qiuwen=
bo@gnome.org/
>

I am aware of this weird ownership transfer in regulator but these
changes don't affect it. The layering is still being violated though.

This should be fixed and I've looked into it but it's not trivial so
it's another big rework for the future.

Bart
