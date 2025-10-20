Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167942F691B
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760953329; cv=none; b=lmnUa+BjF5YUkXJxObNGBxd0h31GukTc1fFQSijFHPJTyNAr6DZz8IkNAzwnnLYoByNvZ5lIAXtFlW1qA55ud8UdC1MJeK0f9SwMg+ZZDDDCR20n2BLbmhATItiO41n964fIKuZFjl3jwBlapKrOKNhjtwswWVdoH0npUqLL3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760953329; c=relaxed/simple;
	bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSv8jzKLYksjAT0KlnJT1PuQNeK3BVqQJFIkgmLp3jGdpLLm58bzdXcPW1GkPrWcAYK9EC8PnKi4W8kEC6AN/uQKsPtrkmaimGvLOEzV1mMfIHN3n6bCX3D1ZmCutw68efUR6CUj3RNCU5B3cWU6DgDrBfTx3ECEXNeeIZ2IFOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IcO943AZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IcO943AZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59054fc6a45so4666111e87.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760953326; x=1761558126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=;
        b=IcO943AZ4slbeY23j1wnDAiVcwPBPLOz6p7nwR3LnKZ0EWyuxZ1NV7vh4gmJ/DIdyO
         6NBnVnJLgA6olIiUyrFMdxASrH1QtEFiA7r/E1llGQVLoET/fsgSRnAyAnwR8NcWStjO
         FuT2KFRZGMEzwuOaEhqAI6OZQRNQgcs9YKKrdrTKxlFK2oJm2XQIc6nDLunQhkol1mbb
         d70GOBwY51A3Hb51gRUwQxAzlPvGos30Z0gp/Sy15aqIdUTTrOReoH1dy+wfcjOsfgCW
         7aj159DIeTlPLFh0St4Zk1tpfonVqFPLXNmWZp8b1j/WnRZHVRVzd4hwU/lmZADNgoht
         oLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760953326; x=1761558126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=;
        b=lrgdRrEjLaF0FXjhdnLrdKdQ8PN5rtAeuhaEbBQz9y2jxHk2aPVwyCM0l7POmUdAej
         G8xl+UXScz6ULczeRq4a9vlo0182ZkDGIpPYShwSu61rnvlJCxZThU2NMStQe4ndGAUE
         3Uzk023ltxAJgzjh6lPyIgmEZcZuqh/Dx+ShCOU+Xsq/P+eOITTJHchZsfZWRXnCbb9a
         1ov7JWLHFw0ue+1mMdmjYHaCKzKKrm3bxbTzBbZieaRBfHgvQfhCaHb6E/wv1a56xzKw
         J9E7VyYHhlMu/rgUyXTpvAX2HTQVxlpyK/jFogNt/phwhucLqMCt0Oj/fyLKmisVukdg
         GYAw==
X-Forwarded-Encrypted: i=1; AJvYcCVfHV2gx4ht12olyL8pLdlau7DHzksfZXklZhunDnfx+Kyszd0biuw1lCRP3WGyHjGi9j3rgTEisNBf+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEsomVRgHHWklCRdDunNDkSHz5kNwJ7ZViRM6DuiCvsrVb+/3
	4SMgavMOztrWZJqQmaeUBNOf+MnbAq4TMFo/o2Fx1ECuIdGenwUrk96a7O4F+9B/seCTAfguMaQ
	BdzUYfhkILSPiV/8rYP40VaJd0UnBOcIj1RhPFqMFlQ==
X-Gm-Gg: ASbGnct5cjBAbx2BY4BHt6CYhowG8mKI8vsDhw2teRS0UkIMLXOnswENRn5UBzIsJ0z
	TIdw4BoE4jDH6ORLfmOSkrTEmsbr69FA8AAG5YuGkZneLbUmZ+Z/i2UYi7NZ46kSbd0VMzDxSdR
	sguL629FtAuMG4FD+mPyw0kGnEAB25P2EbFWlcU+zl6AUCqgAhHfEiANg30RoGOW4ISozUgOr7O
	fd+pihLAZIb9JKlZoCZrWahP106b3XdNOAXuJBU6TihfKX3uCrZmAH9YA6ZOJs4O0Qui7rbaXaq
	su7M/avVkOHM8bxO
X-Google-Smtp-Source: AGHT+IHY1EdCIXYngUyFFwGvzEW0znpDl77em9pEnOCmJRoroDyoIZB7DiA520ogK1u8lsISe3niq2HVycioLER4ci8=
X-Received: by 2002:a05:6512:1052:b0:578:ed03:7b70 with SMTP id
 2adb3069b0e04-591d8589aedmr3757333e87.28.1760953326040; Mon, 20 Oct 2025
 02:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com> <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
In-Reply-To: <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 20 Oct 2025 11:41:52 +0200
X-Gm-Features: AS18NWCTv8z2cF08OaIclAyR6BuSf6xIu18qyroHsfySyW-sq8vo6xUHsWKQB4s
Message-ID: <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Catalin Marinas <catalin.marinas@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 7:32=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Oct 17, 2025 at 07:26:51PM +0200, Bartosz Golaszewski wrote:
>
> > Upon a closer inspection it turns out that this is not the case - the
> > ENABLE/DISABLE events are emitted when the *logical* regulator is
> > enabled/disabled even if this does not involve a change in the state
> > of the shared pin.
>
> It really should be the actual physical state change that triggers the
> event.

I guess so, but this would require some non-trivial rework of the
regulator core. We'd need some list of deferred notifications stored
in memory for when the physical state actually changes.

Bartosz
