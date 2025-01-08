Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF4033062;
	Wed,  8 Jan 2025 02:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736303108; cv=none; b=sl0W43VEb9U6S8CCv+ou8ew7YgpAzVzqvpMz6bePIU26rTOWyFSRWUALv2Ait1lk7EUDuvT27Nc942J334ct5yEpidWLBnOqUVl/mSXvQ0F7soD1QiVl0no4w1TdW1sehb3f8ZZAi1+hH9bzkAsoHF33QV+lswvgPJpza150SI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736303108; c=relaxed/simple;
	bh=mTST5LhFE7Ct4A/sGXE2C7XwvC6rb7/IgSvpf8cQe8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=d7WYw8aA8KSUinjwKi/Bjw3lehFKqTS5jXvFe0xMCBb3MTZpdKTuTGWPQ4PuOxx+lpY5UCUuhZQ0XSgJYs7dzqAr10PVJTiDtj5oVriPHlX4WJ3EyUh8/PTOfasY0XtSaqcA1ZAEgRyw67YvfhqMxaqWhZHhB/o/79XE9R9RKck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOt3TrUp; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOt3TrUp"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so8157652fac.3;
        Tue, 07 Jan 2025 18:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736303106; x=1736907906; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+znau2/SxzOfAm5TaFDXUlYIMNrBzWX4AMaXWidTqo=;
        b=LOt3TrUp0GU3HZ43RJeNzOhwJ4dYxJs7ET4KrCpfz6xHSu2rWX7nQ/Xtp6Tt5Th9IX
         h3TZ0qzSR8KTSBVntwASEsKBcjRYpVTzedBSFs73s2YtBhO91PI6NUBBZsiHJPp+GwzE
         +1h7D3l0FQ/V1dWgNGKKicB2xHEi3jBeITbRFwMN+7TP8qXMkn6bXJlpamMSjD94/BbT
         PCOgUl7YDk/7bHkoTHgbIfnWZ7Qesz6TXxeTQi1X4qVU2vk0wsE9ZmWxYlzO+YkkWkEY
         yZxgAzFL1iZPNNrxT7xQDKlNxYk6tdBu9ILClNcozgqjO/UTH3gkuC0APIHNgSyeSG4Z
         24gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736303106; x=1736907906;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+znau2/SxzOfAm5TaFDXUlYIMNrBzWX4AMaXWidTqo=;
        b=L9zNVhVjNmCi4jIhUw6om62g/UoVGKsK2swN0UovmowZnUsKlhe2pQtwekusKZCgx9
         ALzgdKlpQ+ZO0rQp9o52mhHtqoENX9PJaOPJsTf0jncHsugXfKKU7hVNkMBVJZxx1C0W
         +g4yeq9sgWFEJtEUYTLVdMnrVnKVFwbgQeSkvJwSKkhvW9jcail1Db5BefE8i0TMDDzb
         v2XEs5Y3ZllkXk26z4eD6BfMNkXnnBPApr2ZAmPutwHiY5wExUBc036j3w3/PckLhDVY
         FB7OKUeAoAaj9UYxtc3MD1w6bodo30sbLQmxDsnwkrmk64EvVt2u38pyvdBj4aF4QoF+
         7fFg==
X-Forwarded-Encrypted: i=1; AJvYcCUzEzgChPnCDOMwMXB0enSJclUfrJFmzcebCGL4xNx2MdXxn138TZUWBnHzu/4cbLP6z8i8aBp/lfbztGI=@vger.kernel.org, AJvYcCVtzzkqnRNxx4+i4oaSCbUW6RRUp6R9sT/qHUgH3KI5b/gV21u+Glq6HWVl3N86bEajZ6DWXsELNII/OIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUT4muvYHU38+XdjsgBIpxGOa2OtCBjrhUnMb6iizjcA2Vj6N
	2P8Q/5xO8d2VprIYRB6Pe5/aZ+jN/LpcblxWeYlWY8ayTWnSqpFJ9MbMzEoRbkf0EBW+T1jxhts
	DW3ZMMNaf14cNg3SOQ4CMVDrObfU=
X-Gm-Gg: ASbGnctXjQBCqsmvD/4eOrfXQNxogMJcEoPk3l4Q2u3XRgSY/oH/9EitGRjqCHmDjAO
	pEkyd0Lrn5B+Deuo+hOsOze2xby1/zKnSKwVR03U3g/DLm2yakNvSjYjv33IuA0x/2+TOTv0=
X-Google-Smtp-Source: AGHT+IGimp31Q2+GIXmJCiU77kiAeGfSZMa6DDCh5lmqyMkyk3np84Arcp+XHpNIL2EKTQUC4MdlEo+8QKTb3zmsQGo=
X-Received: by 2002:a05:6870:2f18:b0:296:9c08:51a3 with SMTP id
 586e51a60fabf-2aa06998fd6mr540344fac.39.1736303106023; Tue, 07 Jan 2025
 18:25:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240302140042.1990256-1-megi@xff.cz> <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
 <dfb3lsuqf4yowkovwwi6iiroslb4r357u7ddevntdk72ivxcjz@3spuwm24ubwr>
In-Reply-To: <dfb3lsuqf4yowkovwwi6iiroslb4r357u7ddevntdk72ivxcjz@3spuwm24ubwr>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 7 Jan 2025 18:24:40 -0800
X-Gm-Features: AbW1kvarpSVOWiQEcu5eIaDkv8lEzWepv1weHLELLVGIQHmXGts_5WHJYUNkVAM
Message-ID: <CA+E=qVeDw=p+1qSmifXTscOUVSSXnrYFVNY2+-_DcUNXe51eAA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for jack detection to codec present in
 A64 SoC
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Arnaud Ferraris <arnaud.ferraris@collabora.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 11:23=E2=80=AFAM Ond=C5=99ej Jirman <megi@xff.cz> wr=
ote:

> > Has it ever materialized? As far as I can tell, this code has been
> > sitting dead due to missing dt-related code.
>
> The code is used with some non-mainline patches. There was a bit of
> a problem with simple-sound-card not being flexible enough for complete
> functionality of audio jack on Pinephone, so I had to extend it a bit:

So maybe it's time to respin the discussion? :)

> https://codeberg.org/megi/linux/commit/afbe7688083cd1e3ab98c37e0fe0c28d53=
0829e1
> https://codeberg.org/megi/linux/commit/95552b66a269c2da434edd3880f9819c0b=
d5602f

I think the only fishy-looking part is using device name instead of
device node here, i.e. something like this would look cleaner in my
opinion:

simple-audio-card,jack-pins =3D
<&codec>, "Headphone Jack",
<&codec>, "Headset Microphone";

However, I'd like to hear the opinion of ASoC maintainers. Mark, Liam,
what would be the best approach here?

> https://codeberg.org/megi/linux/commit/c15070c220e7425dd0d0445ae0eacdb4a4=
872ad7
>
> Here's a bunch of patches that I use currently for complete audio
> jack detection functionality:
>
>   https://codeberg.org/megi/linux/commits/branch/audio-6.13
>
> But no, complete upstream support did not materialize, yet.
>
> I'm not sure about the direction. Whether to push more features to DT or
> just write a sound card driver for Pinephone, that would be able to handl=
e all
> this without extending simple-sound-card or DT changes to codec driver.

It's not really Pinephone-specific, all A64 (and probably other
Allwinner-based) devices can benefit from generic code, so I think
extending simple-card driver is appropriate.

Regards,
Vasily
