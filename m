Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051594CDA35
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577480; cv=none; b=E08pGiNgeFs6zTHQQ5L4ynVgXIAkMOZrrHWj8ZR7KUEZ4UOG/rTUOxXnkXw3QtDsk8y+OX88QsHIZeNpPoe5LReGwhG3WW5fQGtBDDXdcyYBJx6VdaY9aCiFs5mxKU/BSqJin3Ld8p19c3uVXMI5Yy6tKlJUFyRfalKInE9IBMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577480; c=relaxed/simple;
	bh=aPNoc/IlVGOzrz4AF5oUnZbB8ytSLfqRYFF3aP/E0sQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoEw0CZURwUhnEQ4SmW2Y5chhZ2yJ5JHtZ66KhI0FKN+Gooo7U+MXXf2Q4skL6j2PvEMXi45+l8RXmZ/zsGb3uRLhvNd+wIqC7eg42zWy6SLhe0SqS3nUGyvmmeGXN6LhJsnttnmeA7ATcuQu9kV4NhW7GcF5zCnRC/EhQ3Ih0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDzpsTWg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDzpsTWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC891F00A06
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577459;
	bh=aPNoc/IlVGOzrz4AF5oUnZbB8ytSLfqRYFF3aP/E0sQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KDzpsTWg/z/5krxTobDbUSigXfKLPKN3GY+kPVHqBR7Qs64CjzbIot5CkPAxP2KI+
	 Upq0GS82M9H0w++Czaj9svBiDTIMQmYdYP/CnWtiPeFrOEHUujcdjRSLexmI83DV+8
	 d3OQKB1DCYTLA88vtfqbmhxp+3cXxscBoXEspNQE0qlsMYOfCwjg24mnoTiNgsl1/S
	 2qLgSSSaznjuc0hKlv6DMiusMtJMUHjJIhhSSySZ7vl9callQF4Q+5MgOlSemRyTDx
	 yueZt3Uscllvxw64KPLdcYhjZOLgiIXI50AcSMUhvVtuef5e/bhhcPutASFv5vSY+5
	 AtaQQrqZxPKdg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso1617734e87.1
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 09:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByebWiGDf74nRMyqR9HLC585ksQVbq2PxCcCK7adI+JJWoTu8GWm4PG7nNiiUOpZps9x4wQnykxJNOWnw==@vger.kernel.org
X-Gm-Message-State: AFuF++nfZEyRR5zGaZ1LmAloM43oklHwQYuUYiRZ+0UUjaO/y/ccHoBg
	kj8TCJJhnNKSY/nzjpVN8fpVJur/9Osq03RKaluoM53f/zr9omIaNIFri4xqP+ZuFzn5I7YYFYG
	pqRPjRwtvJyFl7Q9XgtUENArz5bN5luA=
X-Received: by 2002:a05:6512:4023:b0:5b8:b419:c8ad with SMTP id
 2adb3069b0e04-5b8b6617917mr969995e87.17.1789577458536; Wed, 16 Sep 2026
 09:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-9-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-9-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:50:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=dBJNiZMwRfYtVXC=qfWEU8WY1DRRzDA1o9Ngsd_VRqg@mail.gmail.com>
X-Gm-Features: AcwNN1VWCbypMBp0nAwSnIVxOHs3QNpjZkwVGv_5Swi1QUA8mHWSb92JoMn3LYg
Message-ID: <CAD++jL=dBJNiZMwRfYtVXC=qfWEU8WY1DRRzDA1o9Ngsd_VRqg@mail.gmail.com>
Subject: Re: [PATCH 08/14] mfd: remove unused aat2870 driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver was apparently never used, as it has has no devicetree
> support and never had corresponding platform_data definitions.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
