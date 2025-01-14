Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85BA45C14
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736863530; cv=none; b=FIXN71zNbELEOPXhw7NFg157CSpo1pXNr8bMToIH+ebhlcu3+PBoqjsRbpHynv5zz3P+pznxpPkqhnBHGWMc51LF9zIPxtGMXrO53VdACOSpPJuLpHF3sAAYqfw/LcvnEpZX6PoyFXoYt99DDNNhtR0jX1CfDokQnsGQ0pALKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736863530; c=relaxed/simple;
	bh=6tKjcpDmSDVi0I0Iymsx6pKq7XeGCNlnh/DkEXq+Kvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SVrI5H64nvFUVVdhYgqC8anFgzk0aXy7cfUZobw3fyCWEtycB4MYV4k6tcYycF1BMUNwoWKJRWnLVe+RjVWbHVZN1ZzVlCqDR0pr1p3nlsC1WoTqRlwqWTOT3PHDnDUpENc+ay7J9Q9uN99tMu0+nqjiqxTFOXV8nILXYJq6ujA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zxLaka5h; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zxLaka5h"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so7568725e9.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 06:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736863526; x=1737468326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tKjcpDmSDVi0I0Iymsx6pKq7XeGCNlnh/DkEXq+Kvg=;
        b=zxLaka5hYGgofHs76q25QEOy75B3+rFA0WfYvOvZyAnj7iWI6+5m6hBSri6TLPzJ54
         xjmAbueWQ/wNkuZTVFXMtp0CXUJvfoV9w4PTz+0ZR0TKtoNB0Gwq+tDRkLsXiezh/U0n
         ZMpdb19uusTeim/SU5p0iHPpb6x33XnrCEGj8868XBr5y10jo+IG39g55rXd4rqYYTmh
         sctJp2qe7bIp27b4STvMrbFJOv24wLHWTtqXwuPy4T4BR4DxskTavNYw2QZ6zDu/uOQF
         l2BSiTGf/8tBfFABa7xJBUd/0OwB4990OVqbE1Q7QnpaeSgsgSHyTS8CXL1FHhMoKyAu
         t2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736863526; x=1737468326;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tKjcpDmSDVi0I0Iymsx6pKq7XeGCNlnh/DkEXq+Kvg=;
        b=woL8lsuBWvQTVq4+BxxGha68P9xzGOCk0NAJVUddWWRkvswblCm1wuHPgVjOpXoRgP
         uaCwlnFSpm5StbzoJSbcKFmlGbHH4KeM1mhnOiMEWYSGVHNExVe1Pqc+ZCIHN86mY1Yl
         nrAhJZSzSgvg1rAu5W2It9HD/SA78H5UZZk8qTcJ1MMGgk5QYa3kKVCkvUjs52JOsG6/
         eGM9MePAHDEBJpObDcIKwjOYuK171m0e6/eKb5j2i6xaAcT5h7vHnOV+QmtDcK7jjQTF
         18Z77MsLM5bxaD211OqTOvBGcIAbGqdIvNyfFrlDluu63HXCbZaOgcYYK6KMcMXLP3VX
         PcEg==
X-Forwarded-Encrypted: i=1; AJvYcCUIvDHCBQy/G82q/ggSGspZdAazNIMLRFm+8vuisvHWyOyyeSBIM2rZrF/SsiuRZrPCrYTJfmh4CbKi7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YygWA8XBa+GoGJx5LtL7OCfDBh6ZpMqGhfZxTXCQPjGn+1RNNO8
	Z9TwdwY+kKyvMWuTgiQL2AxGwY/tnmmYivpXpLUtipp3WiHliJDet1HjQht6/c4=
X-Gm-Gg: ASbGncvZR/AzkurD6hwR8CsHJAaW17o3CZ9pVDByfF365hQWAGyPy2IqJV391OaPuAV
	HoCDXmbIn+9Es9vL1FjefF0uLZCdDTfjUo0a5ZvQpu859/zfJYrpjEelaT5MXgEqYIfY6796I9v
	IyuS4RwcCjbcYqR3Ah4O/UpZxA0JEYwxMHaw9jo5a3GbMd5Obwclq3kyoGSm7wN55uTOKq/vpnb
	7ArocBU5jwFdTyNlP7xoWgid4JJxG7DYL7UUt/tigogurWkqNVKeCs7
X-Google-Smtp-Source: AGHT+IGYBCH61RKlTG9lkoFWiyGMe6exY5OKDG7Opi27JjRz3QS+q+QxKENJfYtPEqBwzJBVByTGvA==
X-Received: by 2002:a05:600c:1d03:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-436e2699e91mr225375155e9.9.1736863525942;
        Tue, 14 Jan 2025 06:05:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddc5f5sm210760595e9.18.2025.01.14.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 06:05:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
In-Reply-To: <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com> (Jiebing
	Chen's message of "Tue, 14 Jan 2025 19:20:00 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
	<1jwmey9451.fsf@starbuckisacylon.baylibre.com>
	<e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
	<e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 15:05:24 +0100
Message-ID: <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 14 Jan 2025 at 19:20, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>>> +
>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>> index
>>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e=
03d953586648
>>>> 100644
>>>> --- a/sound/soc/meson/t9015.c
>>>> +++ b/sound/soc/meson/t9015.c
>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai =3D {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .channels_min =3D 1,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .channels_max =3D 2,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .rates =3D SNDRV_PCM_RATE_8000_96000,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .formats =3D (SNDRV_PCM_FMTBIT_S8 |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SNDRV_PCM_FMTBIT_S16_LE |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SNDRV_PCM_FMTBIT_S20_LE |
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SNDRV_PCM_FMTBIT_S24_LE),
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 .formats =3D (SNDRV_PCM_FMTBIT_S16_LE |
>>>> SNDRV_PCM_FMTBIT_S32_LE),
>>> Again, mixed up changes with zero justification.
>>>
>>> This drops S8 and S16 format support for the existing SoCs (such as GXL)
>>> which is known to work and add S32 support on an HW documented as 24bits
>>> only. Can you explain ?
>
> for g12a, sm1 etc, it is use new audio ip, GXL is old ip,

If there are chips difference we did not know about, then you should
introduce those difference, without breaking existing support -
including for GXL, which is what you did IIUC.

> the new ip not support 24 bit,

Are sure about that ? that code has been there for a while.

If sm1 does not support SNDRV_PCM_FMTBIT_S24_LE, you should a fix up patch =
for
that, with the proper "Fixes:" tag, how to reproduce the problem and
explaining the fix.

>
> usually support 16/32 bit for new audio ip , for SNDRV_PCM_FMTBIT_S24_LE,
> it width =3D24, phy =3D32

Yes physical of SNDRV_PCM_FMTBIT_S24_LE, so most chip supporting 32 bits
width would support this S24_LE, unless there is something odd.

>
> it was=C2=A0 treated as 32 bit to send for tdm, so we can only add the S3=
2LE
> base on it , right ?

You are asking me ? How am I suppose to know ?

> but if the gxl not support the 32bit

I don't see a problem with a DAC taking input on 32bits physical
interface and ignoring some bit on processing.

If that's not the case, please send a proper fix change with some explanati=
on

>
> we need add new snd_soc_dai_driver t9015_dai_s4 ?
>

If I understood correctly format depends on the chip and needs to
adjusted including for sm1.=20

>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ops =3D &t9015_dai_ops,
>>>> =C2=A0 };
>>> -- Jerome

--=20
Jerome
