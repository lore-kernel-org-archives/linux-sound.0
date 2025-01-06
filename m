Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424EA41C79
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736169861; cv=none; b=fIsZDHmG5k+liL7L6kceliDjsHsZodPNdocIw78AO/Lf4ItAx6TcYthHoWfBaZ0/dFTPrhOm+bgckkbd/eIi+2sb0Kf5LIpVGuvGkFBlAkFHAghm830hdCP/cKg3Sxjh8S4445rGwuJ89hJvyXy3KNoG+ohStHOs3sJMHFiEc2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736169861; c=relaxed/simple;
	bh=dkSYDb0qQi545zqCwN1aWjjhu3oBvhjT+5nxkeMCONo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CcEpWwyw1PXtUAOIAnGP88WORI9CcSdJjUg8rT4OBtXgydnkG7of4Q5QIO1EuFvRRe9wP4++OXAXgmXOTbo1Q+VDWPLP9Kx5UVjK6M8P+h2uDfU7Oec0s8gUmN2N2h3jNGBCKnxWZD48V9GJ5AeamfbvcstbaaRDT/MYXxLtrXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qbLLnbCe; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qbLLnbCe"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so5244250f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Jan 2025 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736169856; x=1736774656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh7y9ZL8IHaZKAw4Kx4QJ+0Dl9iHJaYj8tnVocIhEBI=;
        b=qbLLnbCe0BY3IeJj9CCAX8kx/CxgtNFQ5JstX0+dmXmAlVnkaiQMmuZRPLhz5pPb8v
         Ftkfek0Zv9KxBw6abeiLGUhtE9qDYIrljpFAD+D07cdvuaiZgX1XaSDicMCDngombXks
         t42MPfthzrEwKyEOnF6A3coJTq/JK7s3J/BmKC+iPPzFtVPqJgqOTmkMbce5S+rpYxwW
         kLGu8gSMRSZcGBGNaor24qsZJPHT+gfj3GFHmHNXIf6/cNFVF4QYFsnpa4J3dxWBkRLQ
         FIDtDYNDMnDkMg4Le3KmfHiJrVPqXuF1U/YOx35qNBkD+aFnfQHNpAuL/wuOw3QHXl4/
         yQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169856; x=1736774656;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wh7y9ZL8IHaZKAw4Kx4QJ+0Dl9iHJaYj8tnVocIhEBI=;
        b=PGst6FYg5c3VCKFAEemhODNQRqDCEuht8rGcJfdxA9SP2S7JunAb5nzwygTIgguHHX
         FCPwekFc7zNiApbMD0X3vxLeIhSFx/aL/JAV8Jd7A29VhAmXnLgovr+aWNcdhECAaF9g
         yEcpo840kxcTiD+dcADt23kM8md/hMwkd6/Q9LeV1qxfF9U0FucdPFq1gxhqiZu7XZQB
         vNMifK1IYXRsCjiEAti10B1Cd00YZMc7Dpxukrymi64W222kkvhKyeNC85VrGEpp4hei
         0RonUSOf49/F2vKzD1TUWee4CzQLrTO4VCz60xKX6ORRVMnTRutVGHavm0pHNtb3E2HW
         I+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXxwpG17hKw3q84lHgdnj6keqU0qzqjb4W5llo91p7VQzrTPPu7EM18q0UtVyJ1jbMB62J3i51wWCvz8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxULuwwoOojv096oEf7SAvbzhtEz4BVRA6rpszrpAiOB1tIrfqr
	O2/m5aRJ3d4o5xnEmrmp1qt1Fz0jkAMlUcwInCuoYk8GJatqk0jj9FmKCiHZwmiEA9hrr8y2imq
	H
X-Gm-Gg: ASbGncsbCoPMsVYOdyyyq31XcseN0vDmfHUqPe8plc4ONbDW/r/FpWqxHZ/CDuTtjye
	9wKl6yITGa3ib1NA0nAV0hSedI1hf2aK/cA0ZPlF/xSuz0ke26putalUrzaZLujO2yiz6MuxjPr
	c4BKkxvc+X5kdFJgyl/6eTq1EcIyBnece5im5pqPvV1EykS6BKRUjw8aXch1wv7GdipSyoi7QHu
	N1O/jiTM5qditeg3OpNE1s3tvz/mGyqfDS37NvX7e2Xoy1lOW1K9J+J
X-Google-Smtp-Source: AGHT+IEYX2sk1R9ukeY4XWDMmDErFBY6fzPWeg/ypRYwHmYveU89A+VrD/4Ey7f29RphiwDzBZmMKg==
X-Received: by 2002:a05:6000:178b:b0:385:e303:8dd8 with SMTP id ffacd0b85a97d-38a221ffda0mr51262438f8f.26.1736169856421;
        Mon, 06 Jan 2025 05:24:16 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8330e0sm47133587f8f.34.2025.01.06.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:24:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  dmitry.baryshkov@linaro.org
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
In-Reply-To: <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
	(Martin Blumenstingl's message of "Mon, 6 Jan 2025 13:49:44 +0100")
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
	<1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
	<CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 14:24:15 +0100
Message-ID: <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon 06 Jan 2025 at 13:49, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hi Jerome,
>
> On Mon, Jan 6, 2025 at 11:44=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.c=
om> wrote:
> [...]
>> > I have further verified that the gx-card parsing does find the HDMi
>> > controller and links it correctly.
>> > To me it's odd that only the .prepare() callback is not called, all
>> > others (as mentioned above: .hw_params, .startup, ...) are working
>> > fine.
>>
>> I think the problem you are seeing comes from the quirk of
>> codec-to-codec links. The hdmi codec link is such a link on Amlogic
>> because further digital routing is required after the backend.
>>
>> Those type of links are not used much beside some
>> CPU offloading on Samsung and Amlogic, as far as I know.
>> It is possible, even likely, that things are still missing there.
>>
>> So those C2C links are operated by the DAPM events, not the regualar
>> ASoC code. You can start here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
sound/soc/soc-dapm.c#n3995
> Thank you - that is indeed the root cause!
>
>> You'll see that .prepare() is not called, same as .trigger()
>> That should propably be fixed :/
> Since I'm still very much clueless about all of this I just came up
> with an experimental patch. Any feedback on it is welcome (I can send
> it as RFC patch - but prepare for me needing support).

It is probably a good idea to send it to get more feedback, yes.

> With the attached patch I now see hdmi-codec's .prepare callback being ca=
lled:

Looks like a good start :)

Couples of nitpicks:

You might want to check the stream validity in
the function you've introduced, like in soc_dai_trigger()

It may also be nice to update snd_soc_pcm_dai_prepare() with the
introduced function.

> $ speaker-test -c2
>
> speaker-test 1.2.13
>
> Playback device is default
> Stream parameters are 48000Hz, S16_LE, 2 channels
> Using 16 octaves of pink noise
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 128 to 262144
> Period size range from 64 to 131072
> Periods =3D 4
> [   42.043413] hdmi-audio-codec hdmi-audio-codec.0.auto:
> hdmi_codec_hw_params() width 16 rate 48000 channels 2
> [   42.047916] hdmi-audio-codec hdmi-audio-codec.0.auto:
> hdmi_codec_prepare() width 16 rate 48000 channels 2
>
>
>
> Best regards,
> Martin
>
> [2. text/x-patch; soc-damp-call-prepare.diff]...

--=20
Jerome
