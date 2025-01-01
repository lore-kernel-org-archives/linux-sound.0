Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70892E62B;
	Wed,  1 Jan 2025 08:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735721780; cv=none; b=BYT/dqfwCEvQBw3GAoyWrF7qYDBfvuTtBzOfd1Hda58npY5KXPPBCtssZda7FFmovsk+sBocF/lakmb6YEXEM1r9QkLbAQ24xJbSYcm2z10MZ4Hi618l0ovulcU6KRQLrQZodJPt0XC871xhx4Mhpocj85Gy6gFPYnIAxx6LL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735721780; c=relaxed/simple;
	bh=5r6/onrG9flAAFCz83ykg7NfsaUS5Z94YtICC1qwEps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMCKlf6VIdW7SqcFkPCIfHZKXZ1REmnwYBmqAzg01ouX5aJHE8JlNSt+Ylxz9gTRVjAenf7/mhYQtJW4oQhoJFQsZ7VzxqrIeU+GBk1NIeIy62HMjmx0HHnFlmP2AQuOW92hStT8nBzVJAZbOwzmiMDEHiXeuEJPHhyKq7yYT7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53f22fd6887so10111971e87.2;
        Wed, 01 Jan 2025 00:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735721774; x=1736326574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIrh5/xF9foHE2ZtaHkAInkCtUR6yzl9To1EWrJQ0MA=;
        b=p8lgH0Rz390EDUpZjSN962oSSSWHLXPVo5VguxnOGKgJnEfJcJBzYo7HV0lMVjPmwG
         znayoFIgZDUone5B1wa/aGo0osTqntdkTymJMh3JvaAlPCUB1y6xIgVShZaNOCYTKPVr
         lNx1M9onXnI5DpdaKCVeTzGHCl57O2HwFH7mtNU9+CatDR71rF13rJEs0Dbh1vDJJz9O
         b78/mzNWA7bVbgxrz04YWi0c9PDNUYpejHor8nWYxm2VFoNctw9kCq5/3ktUIY5G9KKI
         KJhiV7dI/3i8omHNPBshN/WNyo9v4o5GbxwVUQ6ajoujLvYjy6yccWetWvvDPSQ8i1vS
         2HGA==
X-Forwarded-Encrypted: i=1; AJvYcCW0m3uNqwNGT7TBSoywx4Q8SZh9PoZp4c7QejWfIpQHx8ktNpBYx/Fr2hCT+XXHh1qvvekzaqNON6Kx@vger.kernel.org, AJvYcCXGMrfM0hkzo6J35IqnVwwhNvrEq8P2sd/4Zp3N4UYY+e9wQYaxjakWc2SA8iHk38boSijEOef/SydE2CE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuit/xE4iZ1pJKmgW+Fa2m2rxfzuq0UcC7sp793YJlrfeK9H9E
	R54sVanZMod13ETPWKgyy4dKf3b9YDprQOA0Xy8S6jjCdvE/fXLbLIccuyiz
X-Gm-Gg: ASbGncuTQz0AYFogQnsqt6Uqw2lDppTDtFTPRrFj+UjmulYXIA8HGqSitG8hq6ticv/
	Njb9GxbAKWVCO6Ob4zG6yacxCOpu/tZguFip1yWOs6uR1Q0JruDFUSSxPJQHYWLrs8lEN0qBt58
	08e+63Tp5XqvatBeksvWDhl+I1ZXOCpiFqPnEkGc1YrALuRdVy7gATC6ES5QC6ZbCpgiMbtCNAf
	mNj+PdDfO7IJT7h371S3yGjIqyl6JN/viT/JiOl0Uzdr8EdrVGksex2v6jGBcQryWDvM96FJshA
	I+wklLYNmQbnWA==
X-Google-Smtp-Source: AGHT+IHbytfQ/KVbM7eRy7bk24H230eDmCNn2BbazVhKkhnD1EVWwiKMmicpPm8N5iN1hq1xSbLnsw==
X-Received: by 2002:a05:6512:398d:b0:540:1b07:e033 with SMTP id 2adb3069b0e04-54229561af5mr12208413e87.45.1735721773599;
        Wed, 01 Jan 2025 00:56:13 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5e3dsm3647935e87.29.2025.01.01.00.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2025 00:56:13 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3002c324e7eso121937891fa.3;
        Wed, 01 Jan 2025 00:56:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjfSKty8348L0It7kiktgIKsgVyC6OCdhaTpgapObY+o62vjCEgtJdQiZgZ51j7ekpyouwP2dBoLVN@vger.kernel.org, AJvYcCXHpjmVvMtjNkqym3PtfEa4PE0rFhHvdmDyYAxmrSyBQerPzdNOV5fXkTE9Z3SZBxnvztVRPp24FocSftk=@vger.kernel.org
X-Received: by 2002:a2e:a54a:0:b0:300:34b2:f8a3 with SMTP id
 38308e7fff4ca-304685482c3mr137981211fa.13.1735721773198; Wed, 01 Jan 2025
 00:56:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221094122.27325-1-ryan@testtoast.com> <20241221094122.27325-3-ryan@testtoast.com>
 <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com> <982a7d32-ab58-434e-a125-4f7143928caf@app.fastmail.com>
In-Reply-To: <982a7d32-ab58-434e-a125-4f7143928caf@app.fastmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Jan 2025 16:56:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v661eZPh8+ScJNUTXwm_y_RtrL7yo7EE4i_zg-=LrBhBhg@mail.gmail.com>
Message-ID: <CAGb2v661eZPh8+ScJNUTXwm_y_RtrL7yo7EE4i_zg-=LrBhBhg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 5:20=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> Hi Chen-Yu,
>
> Thanks for the review!
>
> On Mon, 23 Dec 2024, at 6:15 AM, Chen-Yu Tsai wrote:
> > On Sat, Dec 21, 2024 at 5:41=E2=80=AFPM Ryan Walklin <ryan@testtoast.co=
m> wrote:
>
> >> @@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driver s=
un50i_h616_codec_codec =3D {
> >>  };
> >>
> >>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D =
{
> >> -       SOC_DAPM_PIN_SWITCH("LINEOUT"),
> >> +       SOC_DAPM_PIN_SWITCH("Speaker"),
> >
> > Why?
>
> The speaker amp is controlled by a GPIO, this needs a specific card contr=
ol to toggle on and off, discrete from the line-out volume. Muting the outp=
ut entirely is not what is required, hence the separate control. I also und=
erstand (although it is IMO not well documented on the user-space side) tha=
t "Speaker" has a specific meaning to the user-space routing. Can add this =
to the merge message.

It should be documented, and probably a separate patch. This patch is
for the headphone. Also, "Speaker" is a DAPM widget name and that widget
is what toggles the GPIO. So it's actually the kernel side routing.

And also, you can't remove the "LINEOUT" pin because it is referenced from
existing device trees.


> >> @@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_codec_cr=
eate_card(struct device *dev)
> >>
> >>         card->dev               =3D dev;
> >>         card->owner             =3D THIS_MODULE;
> >> -       card->name              =3D "H616 Audio Codec";
> >> +       card->name              =3D "h616-audio-codec";
> >
> > Why?
>
> As mentioned in the cover letter, ALSA UCM in user space uses the card na=
me to detect and apply the relevant configuration, by loading /usr/share/al=
sa/ucm2/conf.d/<driver_name>/<card_name>.conf. Spaces are therefore removed=
 in the card name to make this easier to manage. Happy to add this to the c=
ommit message too, and this could be changed to card->long_name if it is de=
sired to maintain a human-readable card->name.

This should also be a separate patch. And yes please add `long_name` to
keep the human friendly name.

ChenYu

> See https://github.com/alsa-project/alsa-ucm-conf/pull/491/files for the =
UCM patch.
>
> >> @@ -1940,6 +1987,14 @@ static int sun4i_codec_probe(struct platform_de=
vice *pdev)
> >>                 return ret;
> >>         }
> >>
> >> +       scodec->gpio_hp =3D devm_gpiod_get_optional(&pdev->dev, "allwi=
nner,hp-det",
> >> +                                                 GPIOD_IN);
> >
> > Just put it on the same line. Lines can go up to 100 characters.
>
> Thanks, will do.
>
> Regards,
>
> Ryan
>
