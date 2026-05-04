Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1163E2772
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 17:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777915899; cv=pass; b=khvZjlxjNJCXMHanqbuBtXaxLNQXif6ywe8zwhQV5xSq4D/FVDRDLCneWLyY6MACMn0MlCv41qXG2lYwCpluRLP/DFMJvFUp0dpFmvYScF4rXpMFAvD/XKF3Yj/BJSFLU6Zks2eirUvnSqeNRDyu8DuojTHKDLwDGVVK3z4sIx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777915899; c=relaxed/simple;
	bh=qlw6wx52aKT7ZK+cR8yW5qxvXGd4ucvFNIi84V+nOSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzmkkhEsblJOrOrZTR2HJviVPCIJ0KGGPP/U/5IDskQn1DX/UY1+d93+iLgPpS9rHWmmbtanXgTyFWe2cYsMUvIp9tqi9QJWe2sz/e0JjHpPqalPVzxNZDQctwwbaT+Lcl2f4iR98HDdQS8Ac95KK45AKC9c8RxebLLwGYNhgG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/CRzcGs; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/CRzcGs"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-42c08cbae4cso3167173fac.2
        for <linux-sound@vger.kernel.org>; Mon, 04 May 2026 10:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777915897; cv=none;
        d=google.com; s=arc-20240605;
        b=F1YVWsPcUrByUu6oKOGIR5cW2mn8KWM/lGclPLcNcO73Mn9Wy3LHSI9VvFYvLmqT9Y
         09vNu3/yJ5NFojsJQeH0t5vrc1gar8XXyEP7y+YE0ZaA8ZERZFwdpi04bp16pv12LUG1
         8kJ7AyeJoVUDwd2KfaCMVelPmS/iNpgqM4CArkMazcqFogb+evsImkW4StaCsXkFq2Kr
         GS50EFl0Rc6xoiAHW+2XUvwwDeuQ1oMjxmkY/JBLJo+P/WR4VdlWlLZH0Ptfd0LO9cpO
         ZHHticBYhUgZZM5WuA4HbZKC3Qf+8DJ/KPenUJd352LTWFL9su9XDi6/oVF6C078bBJm
         wkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6tmRTSJK/erEQRCXWkDw4CRAs41V6+ojRKNQlgh4L8=;
        fh=gjXYTINrFRQw3slyxz5EchVr5cVlOxSIqnUqWwV5D14=;
        b=cQ45tNlnW/B0HKT2S1HlZnMxqP47UY+ulBkf8rWZ9wewlE5tonQdv0lRBke3MnnYmd
         zKKcVJqwWSB/EE+WWaqENpxYy7hChhUuc5X2kIRfAMxJivjzfbjpvXHKL8YrPeOgislG
         6ystswvf07wP+/Br3lcK3hpjTQ4n2uLKh02WF5uSotA7mftzGJtX1v4rC5uKiBwTvYgH
         WOMoh2GyNPj++1+j1E+y3M+dsNDqtvQuQzw9YdhpVWEvrIUEgAHEH26VaZxya5WUZ1ve
         sVQlpnq2R0Y2YJB23+G6US3KI+uD8kfv6XURY+jrom9hJD4w5wzFUoyLLkQTcWMgs6MS
         aRSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777915897; x=1778520697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6tmRTSJK/erEQRCXWkDw4CRAs41V6+ojRKNQlgh4L8=;
        b=h/CRzcGsqYRpCnyYo8YxeCfDuU1f304YovMFrBXzSi8j1vt9EkrJExm+XNVrFic3sp
         qBXpRdkR4G6/eeNocnNCjdzsPpHRtb+GcXf+19eYqb8o63MfmiAe7Xf0XvVmqDE+MBBs
         f+Xtd05ZCP7ybGbonvMcYKSqq5keuNuupSUBP1Xg+VNUqe96BpY/QQPhdR1m74f0Zz+S
         VFC0J3DePVsubpCeWAZ7oal6Mrwqb2aFPhVfloVmdw8fL8fWR71Xxy2Hpge0VbPCO1CN
         B/h0+J5HjaSGV/5FFWi5Cgy41d30Yea9xrUQHmwlmyVFyGtzurvfvghfD9n7AEDNNYMU
         uTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777915897; x=1778520697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q6tmRTSJK/erEQRCXWkDw4CRAs41V6+ojRKNQlgh4L8=;
        b=SM4rxSSWtrYltwqfsiYYYlSFQ7FfFmrKtvMG+ZUJi9i4GqQrALEgP6qEXENI/KBwFU
         umrNB7X0HSug2Y3eRbGFb/ZEsVnxD44F6EmGCmqFHpqB8t6TuwV+1XxKc1gi51Q252T8
         78zXrbIvJbZJvWuL79Ik/B0FCYisa83jviddw5KWUygfhFUkRjy16prekDCOr3Gxasvn
         Q6lncPRmUh7D0EMSMKXUL1R7N2e4ynjgwneIk+64U0WzxMPD9iIgGQ7XKt62/xPEOukf
         /CMvZ5Jc1F72YdvdKvikN/Edw6a7n1bEZY+wk/FvwRX+bOzusKXHxQAmVEnPx0oUSQsb
         4p8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Qjk8cC5qtwiLZHEslNfenOVUBD+OD5pkIUkbeGJcCJnoFiMseg5r/9sMNF9m08sAq4vCGvxktXmVI0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzQrWdpjYTG5p8HrMH+XjZVDQetkYLPhnWDp8xm/NCNmrSNaFS
	i4/ijKolXd/HC8/C++7Ag6Pfcl5SkKti1FijHsGzhrcZFwYPy508ZX1JLj2XFtBz1eCb8pWlAbd
	ITOvY6rJyMR3Wy8dXp4eZ3im4Avrq4Y0k3Rz3eUM=
X-Gm-Gg: AeBDietddPkhLw/oqy8aAv8Rw8MLz85fgB0UvHuV05PW8S4xwdlSLHvJdw7fvpdJOZC
	S99b/QzCixghCHVi70if+dZB9ejv3ikRM7B/yvG3vn69fik7OlXIWOaR+E2re6uxosU/0Q4L1hq
	fCsnq7s0iVNTTzgya99l6lL8M6QMY82h5jfElyJd/SKBH7octB+ql0b+DcjPSr7rO2LFnoafXy6
	3/DAdvJv+KALGPNAeXKZGnh855pSQRwuVhbBBIdHGiQTzF0VjUadc2uFbqMGr4Vwy5ZJJVM5HIg
	HuvuxrVa99BsmI4oghk+6BAOlzaaZhecxBPWCZRFyKBPDyTABRxUa18e9bIo6XtPSHbBe/hu9As
	vVB8tZOmt
X-Received: by 2002:a05:6870:830d:b0:41c:4af:7f5f with SMTP id
 586e51a60fabf-434761d85e0mr5702246fac.28.1777915897212; Mon, 04 May 2026
 10:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504145337.8740-1-rodrigofilipefaria@gmail.com> <87qznrw4om.wl-tiwai@suse.de>
In-Reply-To: <87qznrw4om.wl-tiwai@suse.de>
From: Rodrigo Faria <rodrigofilipefaria@gmail.com>
Date: Mon, 4 May 2026 18:31:26 +0100
X-Gm-Features: AVHnY4KjYe85S5VqrsxcwljsZaAC1X7dZFj1yd2g-eDr7h_aiZeQoFQvnjB9ggQ
Message-ID: <CAPmh8XQi+TbOAh7-cAa0i3nwcLq_c0mYHCf0qPT2YT8ak2YQTQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The OEM Strings (Type 11) contain "String 6: HP_Mute_LED_0_A", which
confirms the BIOS knows about the LED.
However, it seems the auto-parser is not correctly mapping this to the
actual hardware on this model.
Regarding the 103c:0000 SSID: I noticed it in dmesg during some early
boot cycles, but the codec_dump consistently identifies the device as
103c:856a.
I've physically verified that the mute LED is connected to NID 0x1b.
Without this quirk, the LED remains non-functional even though the
audio itself works fine with the generic driver.

Best regards,
Rodrigo Faria

On Mon, May 4, 2026 at 4:54=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 04 May 2026 16:53:37 +0200,
> Rodrigo Faria wrote:
> >
> > Add a new fixup for the mute LED on the HP Pavilion 15-cs series
> > using the VREF on NID 0x1b. These models will no longer fall back
> > to the generic 103c:0000.
>
> So your model has a PCI SSID *:0000?  Or what does this mean exactly?
>
> > Signed-off-by: Rodrigo Faria <rodrigofilipefaria@gmail.com>
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index a9cd03bb7..1db72bf28 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -1669,6 +1669,20 @@ static void alc295_fixup_hp_mute_led_coefbit11(s=
truct hda_codec *codec,
> >       }
> >  }
> >
> > +static void alc295_fixup_hp_pavilion_mute_led_1b(struct hda_codec *cod=
ec,
> > +                                              const struct hda_fixup *=
fix,
> > +                                              int action)
> > +{
> > +     struct alc_spec *spec =3D codec->spec;
> > +
> > +     alc269_fixup_hp_mute_led(codec, fix, action);
> > +
> > +     if (action =3D=3D HDA_FIXUP_ACT_PRE_PROBE) {
> > +             spec->mute_led_nid =3D 0x1b;
> > +             spec->mute_led_polarity =3D 0;
> > +     }
>
> Hm, the BIOS gives a wrong pin number via DMI?
> This bug pattern is new.
>
> I can take the patch, but I'd like to understand better what's going
> on.
>
>
> thanks,
>
> Takashi
