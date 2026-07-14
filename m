Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0465192
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994171; cv=pass; b=OaKm4wZbEZEBSkbI/i3729ml3olryGDjbHJGuiBkG4bQuKnEZRtjLZahNBdCpBnINIGs1ikZmhpIYDEdnIA4Z2viKhXat2qwSLH6iFItXptBcOuIGZ/UIsYZXkmshR0Fh3E6elaKoUejCVHfgNWyRulJ312HIgToDYo7RDuMgww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994171; c=relaxed/simple;
	bh=W5R8u8NdUHDscmsrlv/8+haoKXIReMg46thRhoHmNnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DigFFxVTjKCDPEd8WXKyjCMYChENn3y+Wt2MxZhIUmkkMVedEcYPjXwmxKwMGEeDPne581rrwnuI9vOyESidi3+hXNtBdIpV+pxcfgxivNjY8Cw1gp4Qp4+Ji0/01o81Ar7WWdnIu1ImyvFpfB5Ydk7uEeGhWF49JR1fTHE+T4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=jiH+bZFY; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="jiH+bZFY"
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7DD3B3F2B7
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783994166;
	bh=9tQBhP0PuM6aN+W31YuQ0UCndt/dUo0BulSfzn8ueJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=jiH+bZFYzllWskJIQ5wqKuczNHsL/zlQzKWAXa8uaALo/bwVFcXb4I8SeWToMB8D7
	 wcKVV1gxfDeMz+Rgb53ueK+MPcrzx8slje4UqAU4+zTBEqMtb/sfxss+in1Ap0ztIE
	 KJYslESBi8K2pSCbzg+RMOhgl7mfzeE7fl7ns+6V5Bk9H6YhGaYbSftgWaoRJJTmC8
	 EOihRT8iBEZtBU9zPtoUT+K9RrCG93pbGukqdR6lRfVXeD/xxAXLB9MZCMMiKaDAIl
	 oRfHHAcDA9CgyTqi5O1Dqqg0Vzm828Kb0+Xm8sQMuxyHepgQEqP25HBB2j6uemGMer
	 QbpHMAMaRkQN673V7C2lT24YZzqIQl1LyMi1U0/ZjZGIa2Tewmf4FRuu1vJ316xsbm
	 TUz5rdcYQIo6l3cj+pLTwu5TStRcp4mGJjTTG5YNs5kx7qY80MlOpHxozo61YgQjG5
	 p9MK7586xGSrs1iCT1oevG3yBLF1TzsVwuMYTwTmpCr8ptp+Izn6wo9sQkTlu4S4Dk
	 MdDB4cuAcIOZsFeKwqNHYD6egKd0uuNMXg48ZClAzV+h2OabbkHvJfjaYx16yJFGcf
	 o86hMJgkN5jcaIoum+TFil5WjiNxegaRz4getuT9cTHlC1ZrXEfHXuurcJv1HiHeiW
	 Lk4mHEF1whwj0jNh6fhttkW0=
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-664e15b53d3so6869122d50.3
        for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 18:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783994165; cv=none;
        d=google.com; s=arc-20260327;
        b=Sdbu5tFNCZYc50lO4yhNeCaFi2hezLa/RiJV9Bx7TAC3M8Ml7tidMBKUCp0dMuPyO+
         ulsm0sUsXbow7hIQW7Bxn/35Btni6ySt+do9e5Fkj7UU2vrymFHK7I8FKggxfgRCuzJU
         IG3lJohylJxeWg3AGV+ulR+FIChwV64RPYU9zNBF1T5Cr5ND7ZpSDlvKJ6/XU8y0HaWh
         PKRdV4xL6Y1kgVteWEXjf7zKneoBXmj9uHBFevSFWSx+kbpFuP2zFZfOZdyq1RxkioOU
         XF0rLj+8rM9cflBhUCfJYVVClHAWvUpCjKawlhNzlOynr/s+pgryGTH5i7qdOvf9TgaN
         jbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=9tQBhP0PuM6aN+W31YuQ0UCndt/dUo0BulSfzn8ueJU=;
        fh=joIAMsqYusAt2nMKCCiAOFF4t9PnUsoyIcEF16SQzhU=;
        b=QW0P9NWJW206KkexzphTSUvjtU98jR86tW/8Ip2qqBw2Xn72MGw1087M724qQHEWsO
         N+/XDyevSogDrnc6Vx6SEAcN03usg7km4bKfDcob+Ad+VFJleQzDJN8W2acb3X48pZMI
         4DfCJidcxuQZ8kEDm76NJF9q1IDdl4gr5mmlxgu7R54MKrYjNTxXlHW8MioB5rZimixs
         SjnwvUPHE8Wo13tj7laHY/WeU7UJ45zCN5kj+ZQahcI2A2yj/mtVghhON5xAx1riWSuR
         JVknzjABQUhgn0Eo/LZF4UtL1wL27FsT5Ysg0SRZ3cQcIMgdg4nRo84Jh9ev98PfWot0
         x/Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783994165; x=1784598965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tQBhP0PuM6aN+W31YuQ0UCndt/dUo0BulSfzn8ueJU=;
        b=slIBxnq7ytJYWGxAenRM45VKITd2iOaKf6OWz29hCKpUeJ7JA7xlxErjyjDFDtBLSA
         6bRaVgD70aN5pKAZsCbprExz3yS77DRcuepRIQfdbiQymICkPn45sUD2tuTmfFeqa3wo
         9WtL0+uRnEje+MZf6LPjghwy9PM+pxn9VEyoqsFUuQQI7ndLtfRKqP80QzIi3pmS17mW
         2fu7Faqp19Ft1YywIB0GDSS+vhaPdRQO0pEVxas6nCHYXwwYrhqF7lSZnadtMyAwwbS1
         72jDJ+bGvMpmlhPXqT+3hUF868yhKLpB2IdnLjcbRqJHvo4w7ChvkBKuk71Pqjnv9M0P
         xYJg==
X-Forwarded-Encrypted: i=1; AHgh+RpdasGCvtxSUdEVitQzxBFm1LO4IXqHUB39FTAyT+F3HRtEY+gAc6wBzkJ8bdm9dTv3vjzFWHOn8m8q5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaq6amLVc3se8wnfMy4Y9bArvDjtHBOr46WyFbATJTHfEjoKyc
	lzbUe0dfgak4u9OAELvtJn3ZDilUbY8ZDqeWoJx7U3575UCDSf5gvqhCiO0WM6k+BUl8EjL7UMK
	dzEvUe5lu1jgvGvHgNQUm6REuVNakgdwH5pRSWUUmRLA7MTarEXF3KKQkfcreX9oqsAUz06OT3D
	EC3Uv7NRDreugbiOSTTGqf03QB1HBOtYKwxtf1py8ZGk0jeRf88TdzANA=
X-Gm-Gg: AfdE7ckqt1nGWbfGpUCAeIbQXRM4bBirO4hwfq4ujugaQJgCHuEXsm5jyvfUvsCf9LH
	BHSi8FAa+AeSVrpq5OuUqqkUq5OO9iLHjYco30pF/zYi8OQMK917Pqqz5ez7yBMXpmqPOmdqQVY
	64wDrHmPnm2GTSY7VSPhVctBBG8xE2+LiAZc1tCn48s+mViMCTt8kOar0Ugb0pLs6U5YH7
X-Received: by 2002:a53:a450:0:b0:666:3936:98fa with SMTP id 956f58d0204a3-667d7afc099mr6198316d50.4.1783994165183;
        Mon, 13 Jul 2026 18:56:05 -0700 (PDT)
X-Received: by 2002:a53:a450:0:b0:666:3936:98fa with SMTP id
 956f58d0204a3-667d7afc099mr6198305d50.4.1783994164712; Mon, 13 Jul 2026
 18:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713020839.3822602-1-chris.chiu@canonical.com> <87qzl7yzd9.wl-tiwai@suse.de>
In-Reply-To: <87qzl7yzd9.wl-tiwai@suse.de>
From: Chris Chiu <chris.chiu@canonical.com>
Date: Tue, 14 Jul 2026 09:55:53 +0800
X-Gm-Features: AUfX_mwmV33SiHxxaGYKuN0tdsPD3c0HkONrBggRLFFsn7q7e_rO3IsiZsKU5PU
Message-ID: <CABTNMG0iB9fGd9AAfvjjzsZULUaXr=sX_ZDL6riAAMgVZhnKqg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add inverted LED quirk for HP ZBook
 8 G2a
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, kailang@realtek.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 6:09=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 13 Jul 2026 04:08:39 +0200,
> Chris Chiu wrote:
> >
> > HP ZBook 8 G2a 14 and 16 (SSIDs 0x103c:0x8f94, 0x103c:0x8f95) use
> > Realtek ALC245 codec with TAS2781 amplifier via I2C. These models
> > require inverted speaker mute LED handling compared to the existing
> > ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED quirk.
> >
> > The existing quirk produces opposite LED behavior: when speaker is
> > muted, the LED turns off (should be on), and when unmuted, the LED
> > turns on (should be off). This patch adds a dedicated quirk that
> > properly handles the inverted LED polarity.
> >
> > Code flow explanation:
> > - With HP pin (hp_pin !=3D 0): Uses standard HDA LED framework via
> >   alc245_fixup_hp_mute_led_coefbit() for full control interface
> >   support, enabling both manual control and direct hardware updates.
> >
> > - Without HP pin (hp_pin =3D=3D 0, speaker-only laptops): Registers
> >   direct vmaster_mute hook (alc245_hp_spk_mute_led_update_inverted)
> >   to control LED during mute operations, ensuring LED feedback
> >   without headphone jack detection capability.
> >
> > Both paths use inverted LED update logic to correct polarity and
> > maintain backward compatibility with existing systems.
>
> So there can be multiple models with the same SSID and they have
> different hardware configurations?
>

The new SSIDs 0x8f94 and 0x8f95 actually have the same hardware
configuration as the old 0x8f40, 0x8f41, 0x8f42, 0x8f62 but different
GPIO polarity. I tried to request that they remain aligned but received no
positive response.

> > Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 56 +++++++++++++++++++++++++++++++=
+++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index b26ed9c1f09f..e04b5adce075a 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -3776,6 +3776,15 @@ static void alc245_hp_spk_mute_led_update(void *=
private_data, int enabled)
> >       alc_update_coef_idx(codec, 0x0b, 0x0c, val);
> >  }
> >
> > +static void alc245_hp_spk_mute_led_update_inverted(void *private_data,=
 int enabled)
> > +{
> > +     struct hda_codec *codec =3D private_data;
> > +     unsigned int val;
> > +
> > +     val =3D enabled ? 0x04 : 0x08;    /* inverted: 0x04 off, 0x08 on =
*/
> > +     alc_update_coef_idx(codec, 0x0b, 0x0c, val);
> > +}
> > +
> >  /* JD2: mute led GPIO3: micmute led */
> >  static void alc245_tas2781_i2c_hp_fixup_muteled(struct hda_codec *code=
c,
> >                                        const struct hda_fixup *fix, int=
 action)
> > @@ -3804,6 +3813,42 @@ static void alc245_tas2781_i2c_hp_fixup_muteled(=
struct hda_codec *codec,
> >               alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
> >       alc285_fixup_hp_coef_micmute_led(codec, fix, action);
> >  }
> > +
> > +/* Inverted LED version for HP ZBook 8 G2a models (SSIDs 0x8f94, 0x8f9=
5)
> > + * This fixup handles systems where the speaker mute LED polarity is r=
eversed
> > +/* Inverted LED quirk for HP ZBook 8 G2a (SSIDs 0x8f94, 0x8f95)
>
> The comment block unbalance, you forgot to close the previous comment
> line, or starting a new comment line mistakenly?
>

Thanks for the reminder. I'll propose a v3 to fix.

>
> thanks,
>
> Takashi
