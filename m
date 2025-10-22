Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C1A2D94A8
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155192; cv=none; b=Ibc25K1dMbdCqmdFQtBWOKZ3s8aRXXzHxZHvGKnlB/xIVQJtV/l60omKc3HTd9rHeG5hNyZiX4c6oAHRsTUliqFikbBCQw6ZRYYERyHzDzYb80P/9VE7vMUZFQ4RZFPLVnYiMsH7X2YzR0+iW3qtJ1rzQjyz4jjWgHhF4KyxV2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155192; c=relaxed/simple;
	bh=ZO9k478u1ngiqeGGIY3WNX6oKY50clVVErq42QbTs/Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fG5uazpyYxvUt7g66OB4UPwxFLFFuvGds7qKF4gCRXsr2qiDC7WCvOHOonPcG+Pd5VO19W4xZacavHDmkTUWjAgD/JkPBZTQnczpX60iPVUNy2/nosxEE03bD44nU1S/MkWRgOpdEztAiQEQwJvLq1D7e8nAKjzPAOL/YdxndWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZkRdKPT; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZkRdKPT"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b457d93c155so1094214466b.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 10:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761155188; x=1761759988; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZO9k478u1ngiqeGGIY3WNX6oKY50clVVErq42QbTs/Y=;
        b=YZkRdKPT8pBjRz95XUgoi033TzSjMyLT+va7nkpxPFJcIM6sAHgxpPXeBqDzxRhrDL
         1ibGckJb7OBlfnv6DwAvxnXnOLhC2dSjsi8GVstRUUwJMYX3LEbSm84KegKmsCn0GDbq
         dXQm+uQ/sfDwT5umd2I6/8U2uBToOmFg3oaUBpGA9cGjmfYPWfHnZom6J5c1B9DqnWx6
         OJ5bT89BtiIro7S4Ukk09fa0Jr8Y/vkcsxbjG4QblzyfxQ/ikkDwWwakcWGLQkHNI1Ht
         /mbcpcEqQPzmGTsfnKnI26vO/6VMxcCi6MNOLMMl77yY1NENlS/OfMGYqUevJpF32T0W
         yAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761155188; x=1761759988;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZO9k478u1ngiqeGGIY3WNX6oKY50clVVErq42QbTs/Y=;
        b=CGV9HUYniVuOelTuizty6pGUmPVeF0TQeL+MEzkyXr8RMDzWA8EJuQkRckXZ9LXHv7
         ZEsyORWKhsNJNmlnVqHghySbWlqr18RJD9dpoxxyyPclyyR/BStxZYInAICg5pO7Jgie
         SA3gYtcv/ucJ7O74KoUxbJE7SGLsmk9pTSIkzTMuwVRMxfTWtATWIJSFg/xciddoftdI
         9yhxxFfG/U+hUyivCAQzyh6qTqN7JotBA1KJT0pY1BmOnrdvvzxpY+bUWN+3JgJZ3p1z
         91LuiYxiwbE3Lw3NQlMxxPBUKjj76DbbCwlbkwoVYgJ93I/msRRsEgoGQKuG0vXsYvt6
         rzhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5GtnitfUdtRD6DNdhHtWtTBUFQfsn5ZbkgXEe0xYk+EbNp7KEddT5kQDpWpQBzvnt0UWvU7epzD6fnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDwNFzryK36xceCFysVaX6gUkPiLuUQYjI8f1nPTjP+KiExRUW
	sa16NMv2j4IEP1xXic1F4RtnvvliltFeLp22P7RyGnXApyed50jw5/6y
X-Gm-Gg: ASbGncsL7HebPP+jhPqOZ10p5quX+FopMR7+/NSUWjhFTr4LXmx5bXaIuPQEHsOeeix
	T4aLsdA2qBWDORTb8MUNbWnoZquAhE8fsItKqd7Gr1JZZLDDrwKIYzbYaPNxPjcF5NgsyOBhchl
	in/eaWkQJH5P99al2aGcnFlIi8/JaDoWXla/mwdO+vGHVFC/oQT6j1krUvfvCQYIbLpeVKsbEtL
	SnqvWdPymNSbqwdII5fZGqSjoaNZs0VGZXQijBRmZdVWzFgX2ZEI6vLkWu38sM+C/CHJ6FX0E4X
	Qy0zioqLSlgPW3pCVfTa5AyY8OQdjcvO+ie+XTIRzK8RexdtehmvGNNyavH4NMbfdiqwD6end0Y
	er9Ht/MpS+pkXx7GAJ3UNRSJ8DsETzJsrcT0uTDNSbR+ywOb+QK9yAyLgsELZQ9u33ByOhXBh2c
	48Kciax4EPmC4+ZyT/i4OSRQ3RWz/dH/I+z0VTWcxNcK5OACFH+RbHTqP3uS4CPe1buWQ=
X-Google-Smtp-Source: AGHT+IHCalBjEk5A4VepIJrx2VZmsQyalUaHdRlIahxdnPTXIoiiuFZ8zgGAwcDIXssdST0QDBYUzA==
X-Received: by 2002:a17:907:3f88:b0:b3d:5088:214e with SMTP id a640c23a62f3a-b647501277bmr2370373466b.64.1761155188114;
        Wed, 22 Oct 2025 10:46:28 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83960e6sm1393779166b.33.2025.10.22.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:46:27 -0700 (PDT)
Message-ID: <d42ab1a0665f55731aabd1e9fcb31b8401b7913f.camel@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: cs4271: Fix cs4271 I2C and SPI drivers
 automatic module loading
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>, Wolfram Sang	
 <wsa@the-dreams.de>, Herve Codina <herve.codina@bootlin.com>, David Rhodes	
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>,  Nikita Shubin <nikita.shubin@maquefel.me>, Axel Lin
 <axel.lin@ingics.com>, Brian Austin	 <brian.austin@cirrus.com>,
 linux-sound@vger.kernel.org, 	patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Oct 2025 19:46:26 +0200
In-Reply-To: <d38779a7-a1af-49e4-b429-5ebd791e2168@sirena.org.uk>
References: <e7873e6ce07cd92f4b5ce8880aa81b12c2a08ed3.camel@gmail.com>
	 <d38779a7-a1af-49e4-b429-5ebd791e2168@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

On Wed, 2025-10-22 at 15:56 +0100, Mark Brown wrote:
> > > I'm very reluctant to touch this stuff for SPI without some very care=
ful
> > > analysis that it's not going to cause things to explode on people, ri=
ght
> > > now things seem to be working well enough so I'm not clear we'd be
> > > solving an actual problem.
>=20
> > The actual problem is that i2c-core is producing "of:" prefixed uevents
> > instead of "i2c:" prefixed uevents starting from v4.18.
>=20
> > Most of the dual-bus ASoC CODECs are affected.
>=20
> That's a description of what change but not of a concrete problem that
> users are experiencing.

the concrete problem Herve has experienced is that cs4271-i2c will not be
loaded automatically starting with Linux v4.18 (commit af503716ac14
"i2c: core: report OF style module alias for devices registered via OF").

> > Now declaring "of:" to be the new I2C bus prefix for uevents starting f=
rom
> > Linux v4.18 sounds strange.
>=20
> I think a robust solution would involve having the OF aliases namespaced
> by bus, or just not using the OF aliases but potentially having
> collisions if two vendors pick the same device name.

But this sounds like the situation before the above mentioned commit
af503716ac14, when both i2c and spi were symmetrically namespaced with
i2c: and spi: respectively and contained the "compatible" stripped of the
vendor prefix.

And I must admit that I had more understanding for the prior state of thing=
s.

--=20
Alexander Sverdlin.
