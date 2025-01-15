Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312091DB136
	for <linux-sound@vger.kernel.org>; Wed, 15 Jan 2025 08:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736930197; cv=none; b=ZQ/3i0B4cWnaKNBFCFhuBsNI8Ir09uUOzL/kPjUUqJBR9pEjxKLgB1YUWN7uYatm+Qc5OrHWwWHV14YQT8z1xDfq3VQcHrtLLzLxRJ0EesSskC47cHYE074mU3yPeEQkvhFr0xzo0hi1+a3ynZtdpA8wNfHtS2I+WSgIe0nfI3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736930197; c=relaxed/simple;
	bh=N+rD8Fc501GUvq0ViLsHtr99/9fGf1D0Vy95kbI29SQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UxnUnWwvRJM9lCEEfgGyVrmdL2Hxwd7UrjjHWhx4stRV8j/XA7yQLQhgCCuK3imq0ODhu8dLzoqg21apF7C+OW2OmN/3i8g9SBRMHkk5JFqpNQLeKcF7yv+XcwakHrlt0xiM7e3cTEN3cQLgA55aTu71HAjmEwivpYcQmnOqpqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BhZtAVae; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BhZtAVae"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso45293925e9.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jan 2025 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736930192; x=1737534992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB3rHXjrUs5AJYYMIbdtSlreS8MQ74B9bY+rKil3MA8=;
        b=BhZtAVaeLeAhta1TJwovoWLrvHd6l9PH9FIJiikETLM4MZn6FgRo/Ci6jW2t0aMg7Y
         bTKJd82X7kglPydlRzmJfn43VnSZ05TIOp5P1/lzBAzmB0Cjv1t7+fBaRp0Bhj5Q4VLA
         g3sRrArQqM0fkF1jBN30LeHJAgvaVcJnOteE8z0F3U8SmN+FtQ2+OLqSPPAD4kTA+OC4
         /t/+70Ot6ICChSIeotWOqQHS7iTMH2bZ4YtvCPYZhEpamYyssTloDFqNlUs6jE8WKqgn
         TL+ROyFRaDBdiJOAGXwRxkC5NwqKFanU1CSc+jVlLPiG3SphQNYWUa0pdnOHwyyS/bMU
         0pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930192; x=1737534992;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lB3rHXjrUs5AJYYMIbdtSlreS8MQ74B9bY+rKil3MA8=;
        b=bzw6nhJoInfY8yLshZoWsMtK+9Oc5/emndlCys7Hdyb5vGIj6gEsfk9tsYpAUEvm6J
         4OiGOHmm8ox5nALGuheoh3g/Wp5eRQmSYTdaB9SPi89GgfJy+m4vvilr84BajEocUEQN
         4/wYeH9bj5a1XayzXorrBJavyzfFy6MBc3eQlGs2f9Z9t0hRK/E8lQJpGI1724J+WXj3
         XTQRXFjaHZYWf3nH5bW+d7rTB4v6MBmWZyFtR17Axwa4AayIsCHfF3PrUcQZxmAjsRcO
         F8NgEjn1I3LcPRWP0j7lMpIv/FMHXvsYRJjtpwELggdSA6spiRocvwB6R0t0/Jjyku4m
         chpg==
X-Forwarded-Encrypted: i=1; AJvYcCVa+CqN6kTw1I6kobkkjlixg5p/fOHyayOrqknN+QbAO4wEljgLDA8ns3om2kw5UH13NGKdd7iTNC+nrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEfG939n939h43RqC3oEd3PH+WJVn4pVWBGOELHjrC80cEz5zU
	pMWnryc5RtuCaFay8xESZK++otAqSoOk3qt1u1SJJBkH1HD9rVhteunXcmLR5mw=
X-Gm-Gg: ASbGnctwOdW466PtGznu5/wcmcrFVzbOhLUDSLi1SbaSwbQv5CX1LnY/82B9q3n+G1g
	CPYmie5LjBSYKDmgTdzqgFzLHTWyzD73qfej7FWomCjy/0flYlFmJ91RzH4NKtTS0umLPFl79Tk
	tlepahRb54pRA64IjHJQu32NbPEfCDcKT7P7uGV0389HLJcTOcAKyL4+TmitnaJmLnmyunQ/EEH
	KyibcSgYCgp1kkKmlSBf7JN+0gYgdo1RCnsxaYv0anFMvJrMu86lg3t
X-Google-Smtp-Source: AGHT+IGHLV3oniHk2tCYLxFndHHL9KG5RVtJRTDpiO1CMzyqcEywc4SzfBdAV2UjsP92dEf3xkAv9g==
X-Received: by 2002:a05:600c:3554:b0:436:1be4:c9b4 with SMTP id 5b1f17b1804b1-436e26ff1b2mr227264435e9.27.1736930192380;
        Wed, 15 Jan 2025 00:36:32 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e7b8:6186:fc23:f678])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d447sm16644404f8f.4.2025.01.15.00.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:36:31 -0800 (PST)
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
In-Reply-To: <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com> (Jiebing
	Chen's message of "Wed, 15 Jan 2025 10:56:17 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
	<1jwmey9451.fsf@starbuckisacylon.baylibre.com>
	<e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
	<e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
	<1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
	<e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 09:36:31 +0100
Message-ID: <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 15 Jan 2025 at 10:56, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

> =E5=9C=A8 2025/1/14 22:05, Jerome Brunet =E5=86=99=E9=81=93:
>> [ EXTERNAL EMAIL ]
>>
>> On Tue 14 Jan 2025 at 19:20, Jiebing Chen <jiebing.chen@amlogic.com> wro=
te:
>>
>>>>>> +
>>>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>>>> +MODULE_LICENSE("GPL");
>>>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>>>> index
>>>>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d728205=
4e03d953586648
>>>>>> 100644
>>>>>> --- a/sound/soc/meson/t9015.c
>>>>>> +++ b/sound/soc/meson/t9015.c
>>>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai =3D {
>>>>>>                 .channels_min =3D 1,
>>>>>>                 .channels_max =3D 2,
>>>>>>                 .rates =3D SNDRV_PCM_RATE_8000_96000,
>>>>>> -             .formats =3D (SNDRV_PCM_FMTBIT_S8 |
>>>>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>>>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>>>>> -                         SNDRV_PCM_FMTBIT_S24_LE),
>>>>>> +             .formats =3D (SNDRV_PCM_FMTBIT_S16_LE |
>>>>>> SNDRV_PCM_FMTBIT_S32_LE),
>>>>> Again, mixed up changes with zero justification.
>>>>>
>>>>> This drops S8 and S16 format support for the existing SoCs (such as G=
XL)
>>>>> which is known to work and add S32 support on an HW documented as 24b=
its
>>>>> only. Can you explain ?
>>> for g12a, sm1 etc, it is use new audio ip, GXL is old ip,
>> If there are chips difference we did not know about, then you should
>> introduce those difference, without breaking existing support -
>> including for GXL, which is what you did IIUC.
>>
>>> the new ip not support 24 bit,
>> Are sure about that ? that code has been there for a while.
>>
>> If sm1 does not support SNDRV_PCM_FMTBIT_S24_LE, you should a fix up pat=
ch for
>> that, with the proper "Fixes:" tag, how to reproduce the problem and
>> explaining the fix.
>
> maybe there are some gap , we support SNDRV_PCM_FMTBIT_S24, not support t=
he
>
> SNDRV_PCM_FMTBIT_S24_3LE,=C2=A0 for SNDRV_PCM_FMTBIT_S24
>
> it is=C2=A0 Signed, 24-bit (32-bit in memory), little endian , the audio =
dma
> busrt is 64bit

It makes absolutely no sense to discuss memory layout for the codec.

>
> it can get the full data. we send the 32 bit data=C2=A0 mclk =3D 32bit* 4=
8k *4,=C2=A0
> use the clk to send
>
> the=C2=A0 SNDRV_PCM_FMTBIT_S24,=C2=A0=C2=A0 the hadware always send the 3=
2bit data

No it does not. It send 24 bits of data over a 32 bits physical word with
8 bits ignored.

>
> so, i think we only add the SNDRV_PCM_FMTBIT_S32 base on it

That's wrong if the codec does not actually use the full 32bits ... and
I have clear indication that's what the codec is doing, on GXL at least.

>
> we think the 24 bit is the SNDRV_PCM_FMTBIT_S24_3LE, it is 24bit in memro=
y,
>
> due to the dma busrt 64 bit limit, it can't align the sample bit, if it is
> 24 bit

Again, memory layout makes no sense here.

>
> so the clock configure can't 24bit clock,

I disagree and this has been tested. If you have a test case showing
otherwise please share it.

> by the way, We discuss internally for gxl,
>
> it also support the SNDRV_PCM_FMTBIT_S32
>

Does it really ? If it is just to ignore the 8bits LSB, that not a support.

>
>>
>>> usually support 16/32 bit for new audio ip , for SNDRV_PCM_FMTBIT_S24_L=
E,
>>> it width =3D24, phy =3D32
>> Yes physical of SNDRV_PCM_FMTBIT_S24_LE, so most chip supporting 32 bits
>> width would support this S24_LE, unless there is something odd.
>>
>>> it was  treated as 32 bit to send for tdm, so we can only add the S32LE
>>> base on it , right ?
>> You are asking me ? How am I suppose to know ?
>>
>>> but if the gxl not support the 32bit
>> I don't see a problem with a DAC taking input on 32bits physical
>> interface and ignoring some bit on processing.
>>
>> If that's not the case, please send a proper fix change with some explan=
ation
>>
>>> we need add new snd_soc_dai_driver t9015_dai_s4 ?
>>>
>> If I understood correctly format depends on the chip and needs to
>> adjusted including for sm1.
>>
>>>>>>         },
>>>>>>         .ops =3D &t9015_dai_ops,
>>>>>>    };
>>>>> -- Jerome
>> --
>> Jerome

--=20
Jerome
