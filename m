Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848948167B
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009755; cv=pass; b=TDfLppuT2XYsQFr5OhoB7iOkEUe1Vx1X9Ig6tPH9E7pU3WnE0BNw3MfgczX2u7YaaVE6e+bmZX9WGWQ1vL5tBGsn+LaA4sxPUl1suY1S/IMbPxCXhx0/4WXNSDsVP5CZd4lwuyQn82zdiccddp7+ooroOggb5d0Y5M/8vjhkC+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009755; c=relaxed/simple;
	bh=8CLaJmRDL+P7LtFb+x1VQBA5WVLV9B31rAcEE8OheA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJ56fh0zmlDMip4Dg/l+tpyrU9M1JT2YfjanMA9I3tKfjtIopLSTtAVFz3hf0dtUGxSNmkU2loSf5oYtbYnrfKQualLFKxuIKKS9yRO46H1Wm27hLgbd7Y5y9Mfk5UBTtEw3gIlg8jMO39Nwc4hQG9YucVjND6Rgw2oiqxSMC7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYiAH3+U; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYiAH3+U"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso5070640a12.1
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 09:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790009751; cv=none;
        d=google.com; s=arc-20260327;
        b=EgbhcaAdnkb0ZLyuCKalFabjpztwck8Rehi2HcW7GJq2lqO4zleYVnxPbFHCDRSRU0
         LgpAf70L/6GMxI8DUsUtfQnawvm8le5a8sJJgfWhP2/Pyqyu2No7qd7+pYWs8+0aCHGY
         Hsz9vGHZfBBq0c4I2/pjknAVNZjjcmlLNZ7b6QiV4256svrrUpcdXzXDknzfX3CkmV5C
         JOgCx7mzlsMt6rSlZR/gjBNIoROAhYwlxWln2zWB9qjBDewkaTHQMjG1Tc1NBacGb6lL
         Hf1zUBHm72u0+Taqy7BXOFDfsELlF5RD8Oer5JUbIgrzZuLaTPZA4PgKVKyFB/ny2wCB
         KjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjCwpxCoWvLfQkK75JAuQLMO5x7s5tBUZgfd0L9YWqI=;
        fh=E89MuwkKtuxGs24tGGKZurFJwJ+/3fSuJn+Z5iGXgto=;
        b=r4LsD7hvvzfSE7sVRplrZbnKsA92ekkFb7VRdqQD44Z8Vh0uVb/NEKJuIOGdh0sFWO
         sZmG8T9dWbCdTZtgikRNkx9LOxdOleL35syTkMUAP2q3AipJZEQ2lid3TsLJa/bzC+Co
         OmZlOK8b7OfJLRM8CqggtyqPwRQXhClpnbFFNNGH6YQUz3VK506Zd6PRTwV/fX1/efWL
         qO/IjakjxSvM+TloNUEQqJWXFw23Z0jluMqzrUgF8Ow/wgDnEgHV2kRu6Ugypi4eWAuv
         Xf9xycLlRxj9OfA11YwXczTDsbFAau72kPCSvh/yTzKqcZ0zlDobbdwcO+VNNMMRTFH+
         Oj7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009751; x=1790614551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjCwpxCoWvLfQkK75JAuQLMO5x7s5tBUZgfd0L9YWqI=;
        b=iYiAH3+UNoqfKDV41kPfJ2OFMJyFBVZObdmfKAHysDvgy96lWA6F3HNhTFIK7Tngyq
         TapIaK8r8BJzqx0Gz1f6KaX/eB+a0KH7lOd0CUprdTfXCygDYuRHeVf6sIj5iE7pzX1q
         BC4HwuMuqwby0etOkv8i4/Owf2NFQ7osL7as5HUCKNMi1+PTWUp4WW78DEbySc1ke7KM
         rmV60wHJcaH9rCGpYAzBhaf9fKUQJ7qaG+qQiGh/xhQKqeNezDa9t8bCpFZDXe/09WS1
         f+jEin0HVle53WymCPwozlsEe8Tb9UUC1xbp9B0wn4GPYs/P76CNzr6b8dy+r3cEfVx1
         c9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009751; x=1790614551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjCwpxCoWvLfQkK75JAuQLMO5x7s5tBUZgfd0L9YWqI=;
        b=DEBz9bj2rw+u4JzQXrrecbUiCrILSfeukwIcMCm8queCv9LMZqQL9FhcLaKMMx9X/2
         kuMAs5DbOrfYczFpDdGEVopdowCForKencEUq6RBm5bYb4jOZd3C7NwaqC45qSqmQSMJ
         9fqIPXcLsq2uxnkaKvuQ8+q08dIgPBhyiUoQMIHiy75ytwqTzHfe40qvPPGrAnv9oTDC
         OmIDFY/ObDPMK9Ks6hXyTfWi2SpoYbVRJngS96yXjei4NFU7Gafjl0OL4qbyK7PodpVN
         Q5H1TBPZ6DfhGK4oUcq4twGSqdGGYSMmSPuW3coJcNjKxEt2K5GqWxYPFFFy/C2jxR4W
         3ZiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKDdEMqOaO31sscG0vugIqQasLXBnrR4Zx98rZZgPRbjTqvo8ORommKXqcvVWlnbfYaYGJzhPGFh1BjQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mDBEao+pHjERy/IWNDy5/EoupmkRnmP3VjSLjCvuBisi2RHt+u
	IsbImlqK7oSS/Fz43weUQGczRNwVt128YndaRWY99o+JT1w2QSQj2Nk7DHjzKDXSZdCzSUmmf48
	eSZcUQe8YU3KiH41S7UQQx1QiLzd11A==
X-Gm-Gg: AYBFou2dXC0QhKgWKiv5gvYw1+AtxqV2EcmVSX48EnvwlSTKHjsLa5OFswZ1Us+/Xk0
	M8qskusHsJ1hBvIvdEt0plqXnjlLjOY9E8Wpw9BuMF5iCREucmqOiz5mjD9gAZBuztTCblrtPoG
	Ztr7bHdJwnsSbwqBMNYUOGeFolXOJxqjJW96QpRtypWRMNkMD90nepIWh70yyqToj/4/sr3mQ53
	zYO9hMGuRBbYLGWOlG4jpHfP0OD2iq8jI3ZPlZoZp8z3cKW62ni4edZay4RJja1NgHc2kQl6JVt
	MdNSlSmH+ReugOmn5j+vig3GYol0aitgaDXpEa5SDnMvhRsTrQiNv6u1uTBwvEMhmQ==
X-Received: by 2002:a05:6402:a0d4:b0:6aa:1112:62fa with SMTP id
 4fb4d7f45d1cf-6aa564b7906mr7942434a12.4.1790009750844; Mon, 21 Sep 2026
 09:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921131728.8999-1-krishgulati7@gmail.com>
In-Reply-To: <20260921131728.8999-1-krishgulati7@gmail.com>
From: Raphael Briones <erph.briones27@gmail.com>
Date: Mon, 21 Sep 2026 11:55:39 -0500
X-Gm-Features: AcwNN1VFWuMt55Zi9QnVi4SWB3-BFp6BXM0z4d_fKbTqdiyOV3SCCQiQQtEVkmQ
Message-ID: <CABYdxMdHOJJjnoX_awwfVOyBvB-zREDM4q2SWgAVF+YT6FiMqQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Victus 15-fb2xxx
To: Krish Gulati <krishgulati7@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhang Heng <zhangheng@kylinos.cn>, 
	Eric Naim <dnaim@cachyos.org>, Damien Dagorn <damien.dagorn29@gmail.com>, 
	Kailang Yang <kailang@realtek.com>, =?UTF-8?Q?Habil_Eren_T=C3=BCrker?= <habilerenturker@hotmail.com>, 
	Bob Song <songxiebing@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krish,
Thanks for putting the patch together, and sorry for the late reply.

I applied it on my HP Victus Gaming Laptop 15-fb2xxx (ALC245,
subsystem ID 103c:8c2f) running kernel 7.2.6-1-cachyos, and the mute
LED now works correctly, both with the hardware mute key and when
toggling mute from the software mixer.

Tested-by: Raphael Briones <erph.briones27@gmail.com>


El lun, 21 sept 2026 a la(s) 8:18=E2=80=AFa.m., Krish Gulati
(krishgulati7@gmail.com) escribi=C3=B3:
>
> The HP Victus 15-fb2xxx (PCI SSID 103c:8c2f) with the ALC245 codec
> does not turn on the mute LED when audio is muted.
> Add a quirk entry to enable it.
>
> Reported-by: erph.briones27@gmail.com
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221946
> Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 5127a111c59c..617e2500505b 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7603,6 +7603,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>         SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre x360 2-in-1 Laptop 16-a=
a0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
>         SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX"=
, ALC245_FIXUP_HP_X360_MUTE_LEDS),
>         SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", AL=
C245_FIXUP_HP_MUTE_LED_COEFBIT),
> +       SND_PCI_QUIRK(0x103c, 0x8c2f, "HP Victus 15-fb2xxx", ALC245_FIXUP=
_HP_MUTE_LED_COEFBIT),
>         SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP=
_HP_MUTE_LED_COEFBIT),
>         SND_PCI_QUIRK(0x103c, 0x8c3f, "HP Victus 15-fa1xxx (MB 8C3F)", AL=
C245_FIXUP_HP_MUTE_LED_COEFBIT),
>         SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXU=
P_CS35L41_SPI_2_HP_GPIO_LED),
> --
> 2.55.0
>
