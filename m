Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F5E35A15E
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652558; cv=none; b=GPtr+7M0Oz/2e2AGVIqAOuokR5pAsKMY6jLlOA49dCHMa9UhA0CCH4/cKkltHkYLYOI6h4DD6hOs/SEXNDaDZOzH1sIHv6NwBxpb3wLbFV1LqqXSre8NMAQEVNM/Smb5d0eRh+QWGH3CQlwBoq5X7H3/hEXXScx5xGmI6GzMNPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652558; c=relaxed/simple;
	bh=um+CI5cBHeGChwX7KjitHJqTVTZIuNNoC5BfrLnZ0wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERaCgQL3eCKeDcRani9BPhW486RN0+zMKN5ZP/+UkR+Y7WDwLb9/6uPKXoUsZxO+qXqpmKMulbv7DaDooqvay6yz9R6ir2PPYqEOmG1ZR4YfzaC6zYeX+Arvwjl9XxAbzFJJDD9Y1GqEZR1RQ3cNipGPjFgoZP1LL6Qv557wNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t8RNyaMr; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t8RNyaMr"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b983fbd45so7830121fa.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 07:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763652555; x=1764257355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=um+CI5cBHeGChwX7KjitHJqTVTZIuNNoC5BfrLnZ0wQ=;
        b=t8RNyaMrYAlJeYQXkFJFNJgumPX3XvrgMNW3J+pZ5ECpX1/5FiEAMv2+qrZzI8r5h6
         CV0bVVV2PfVlPVN7X/kWCLvg4921BuUJAyeYFPOic2aiiN6qX/AcgIm/if17zrx3Bo6A
         2KmMYEE79okn5fD9qMhhALHam+Sd9CxpXDF+VYuIWYGHDoe7H3hh9a56qv0C+hVKLpY+
         JrmFopxxqKCGIst5EO09GkBXZ/MSdBJvq3jg4Z9fJKAY/XRE1r9XvPsXFJdVGyb1+rkB
         +bPI807K12PNgYOCAnbpEyLKml2tdu3HZx2DZ83cfJCtqN/Cvfr5WeuEdKczcc1Jb6Cu
         NnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763652555; x=1764257355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=um+CI5cBHeGChwX7KjitHJqTVTZIuNNoC5BfrLnZ0wQ=;
        b=nqTewAfbFYjdLpxQxTsILjuFf0z/6Xr5jHaYmfqhqAlYSTfNy5w4Cy5RT82YEIxbI/
         L89+aboBknXXrhDLI10duFIIizboCmWccMbsyHD1at66ldGrdpFwybinnq62VjmHqvf1
         rpU86QutYKcvs8fBmlWTCRm08LwdjV98kElVCFLbVbnx1WsBfxhMd6v+VXx/XO7UQxk1
         QWZUD1ruLWO6DdOEbb9aZdVT8/84KLrYVTx9rdLxdGTCw3CP1daZzFUo/oOr4RHxgHfw
         1EglRNV6/+yzBzU3brnWYeYN0696ItIZK5GEoantlf+CX10+XljzEoxUSPfKILqO89jk
         wRew==
X-Forwarded-Encrypted: i=1; AJvYcCWlT4R006CO86ETUGZtb38x9lZ45GXi/IdUBOWCZGaUsDvyKfz/pFvhwQowDvDXxFAMILqQ9tSa6T9cKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPhERa/kHoCG17mlkjCHsnlqwOa13qrp8IHbTE2inNVMdRD8HM
	qENryk0ivUivePvQ77iD4BJilkK6JP7Kgf4U3Vm/tQRjUriAZbR/sfDvM1jHRVPPifguuTN3Se9
	MiQrFbqbIq8R4X1Fraj8lK7VxwW524BuVTUqrBLJdfQ==
X-Gm-Gg: ASbGncsPcXs4g9NHybH21xjFnffIVwUsSc2IihGiSDmObYAkTjxrLjkLDTWcpd94q4L
	PPTVM88ifAoIXBSrFOGWpAA97lhCtd6+uCB244oU+KV0HQCm76sCoYHzBiaZN1V33pEDfiSa6eY
	5KNzqMT3NQFhUjrMFMyRmDIMoc5Eozi5iFraavD0F2+cIoOEMhVL8yjn2cgqIcO1FY9ucmjoTvE
	GgMo6+QHJ25LKVG7xK6WYsTx4LXfY1Mwd5B2weNpSYq9pGVnfChaHpchmvmUVai9dpYtjH1HjGk
	HDsMiVUQIBtcT7zv+c7ZW/DtSw==
X-Google-Smtp-Source: AGHT+IEwidjnrwli0on3X1tYNsofRsV5iuRR2IvcQDVcZgif5EMNUWatPeED9AltuvQHRMHzZ8zIwLVcLIsqUGVZxNw=
X-Received: by 2002:a05:651c:f1c:b0:368:c52f:fb64 with SMTP id
 38308e7fff4ca-37cc67a22ebmr9554811fa.34.1763652554706; Thu, 20 Nov 2025
 07:29:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org> <aR8ubexLrTgmxtpv@smile.fi.intel.com>
In-Reply-To: <aR8ubexLrTgmxtpv@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Nov 2025 16:29:02 +0100
X-Gm-Features: AWmQ_bmTkA8uTlF3NGcgGx57EX7_URhlcWrn-F13z5Yf1pKxFzyi3Y_bNfqlVVs
Message-ID: <CAMRc=McrnapFwpgRHOckgX4k7UkpaJwWXnRp9Z+WfWw7m8cqpA@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] reset: rework reset-gpios handling
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-spi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 4:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Solution seems still OF-centric (some of_* is in reset-gpio are left),
> but the series in the right direction, thanks for doing this!
>

That's coming up, don't worry. Though I don't think it'll make v6.19.

Bart
