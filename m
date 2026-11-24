Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795500574;
	b=EalhIby4/RCJWlpJbVt5zUniIrjtd5J1/7U57nouPiKameFKjO/cXt64NV14JqIlnlkH
	 fdwMRwggIviTcvA63PQq52xby5visncHemmXhRpFbmq5Mc7lJbbufFz/Nz/EOtPxKZxUr
	 iKhJgHhdD851GQDCAwYfWoKCnx8Yme/7j7fU+VNZD2f/PkZX63pmKsv2l4RbcQCfrC2fQ
	 UH+j+ZbYkcJdXUiplO+X4lmuffqol3McVX9YEEPGEr2CrYcgsGoXtALAY1G+5lpGztB+y
	 CFUNWuKkwR4Hrdb87chAgVsIetvWpzRA+jRS15oiC9TK43T/+/urVzwOch1agbUCMUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Unmz5fGYEvX56+imjPXFeVnLj491/aA9h3Sgmra885A=;
	b=Qp6vK/JJRpAvv2J322BkjFvG9jww9fLlGZkpOkHEAqeXqUERssEOmSiB/aX5Ava+z9zz
	 RDd0NYdZsl3I39irrRbiIXzjQKT6z2H1OimQd0MIypNRlGEk9ENLEN30MxgtNjNzXc/hJ
	 DOJYbebRSPzXmw37ALzWM4zl6UD35U32jV+TMubD47d7La2Agaj5IeeovasgDpVQx1MMY
	 BwB+41+25zOzxT/Dg29eBfZtxMjpPKFHukJOm/PWHX3S6Wr8pMeU45VPzYLb3J4ZQdsKp
	 5VaQ4jpLSLQvj0X2RB6p7c9BGzt0Tj31lqGgOGr9xv4BzhROZPTp4MQDi4NZP1QLk5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2vva1r8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E51606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 06:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E51606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2vva1r8
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso2335409f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 22:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795500571; cv=none;
        d=google.com; s=arc-20260327;
        b=JwwZAfxHnnbWRHPy3c8gO9tSvpTvQbNIB5I+X+CZF6CrrYI80/HtH3h5IA7rWWZf5z
         d6NzcgpAkkLJz6tnVUYSsQtc1ta87WjZU4S5lgXvXgdYVweXGUr3do7Wns2q1mVDWQ8k
         DnjFlv63zS5R6Ayv40908NjBo5TPFYbvWmItqEVYlRIqh/s1Kxo6VwznvJ6USFbRW/Tb
         cmaXox617ZARSUXDosOO+xhIG9cicSwNLKKyz/VnhRLAmYsN0x7vL2CNrav28RINd/xV
         OYOyFpXgHWeNJqEBKWoxDZk8LdBZTpHWVcVrEinJQ1n3edVBQ01lOuMUxCkhrZjO82iU
         LTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Unmz5fGYEvX56+imjPXFeVnLj491/aA9h3Sgmra885A=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=a2srX3geYcS/FtC8ihcGtxp6fPpolNY98zq0kNZrcXYMTkvng7hsrgq5o1FFqU33Ql
         AWqrmrXnNMGWRaS/HmUXZ+7gV3NsQeFKYW6twebsGiJIGHMy5dhiCauWm94LRI+w+Oha
         H89nfx0eXSz6Gq2FBjZfVZAZSYoTNESstlmQbzjKqAVF3Tz3oWDaBXPmA4Z+qUTc7OIJ
         H/FnOUubiWUCNSSobCzQ0xh2bPvIR2vwjpBl3tgmhW4Cj4pHruoMVMS9OIfIQkduxlGg
         HKBbNNSy3JdoH0F06OGtQ7n3R3otxif9EHLPTKF3Egc2YWznVa9rKu7PRzGFo9e/x1uj
         S+RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795500571; x=1796105371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Unmz5fGYEvX56+imjPXFeVnLj491/aA9h3Sgmra885A=;
        b=k2vva1r8u6pUOixneDEV0W0ymsjAX9RATxOBO5n7Ycqo4En2wDLqo9XSp6IqLjCVcd
         ZVH4t4qV1b/SXe3KNT7viqkPPMhbqpsN5FpTPUyDhAMrDoHw0MN9uVfH/mxeBpE8W8FI
         DlusbSByyUxhvejWeXpLOE5WtAteJ30xM+rmwkVeNYWP16OO6FEt4uJ2J1Uw2lvq1aNP
         A3VKB1dUyfi2yVQBKxPvAxi0/cxv/iPCxWTaTR2LpDzBMEAeINz/1wjpQ5w0S9fafqB4
         wChc0XyTE8XVtuHx5PVrCyCD+A5bDXLUeC92mra9QZOPepBKO5a0XTCZ57TyPOZTo99j
         M5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500571; x=1796105371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Unmz5fGYEvX56+imjPXFeVnLj491/aA9h3Sgmra885A=;
        b=VXNZh+FsxaJdxLO6Poy0uvl4pF/YKI0uoc78aY6ROQQJaq3mouVJR3ywwJMWFnjqFb
         GkzGw0rQMBVi6qoefQ2CreZ52Z5QTbe17Wo3omc18uHVJkeRAU2VC6c4xcRu6txQ4pAw
         mu7CZsoYs/7WyeLCbvbNZWuAN1EeS2MD8XSDflcrJn5uoeQrfpP5BKk1pO8tKmttHztT
         fT75iBIDyRa+AmOQ/MtYLGVKfT1RYRJnJEFsJdhbdHX7GBMwnn23bIeBtCWqKsUybRok
         HGc2nRSqZRNfG3OP4rYmkC++JyXML0QlLQcURQ2HkkasTn3M8ck6SHY7UHLFUdFd0s1V
         /pSg==
X-Gm-Message-State: APuU4Z/ISRI7hCXGD7TBjJ72qIQw46efGfekIZF1jQ+mTis3iN/+eb0X
	Mhg+Ac+UH9mK1aSamo1XJuR9okm1RsgYKBI3MXML8SvutsXf2OGxAA0XdzmZafc0qMkVU/DJCiE
	8syvBeI10V56ZEw+irB5KzlV1eIRoAWY8vUzNJ7pEpg==
X-Gm-Gg: AZFdTZcoojwzB8+ceSdxmZsmjEKTjLrPanXdYNo4XzGrm/U9oZDcQQsfrfkdJrgu28y
	WQglhrsHmZB5dTuGchXvK5OjoxcTCcVTlPVF+BN57YyFNEBLP00/t9uzCStQHPtwCCW7i8reund
	svb7AEqbfKy3CXQ1lgWynUQL2/yI4kU+LCD7catWeMvDzrJkgcfToipB5awjb0SlH+aV+omMXxl
	qSq5KpbaRGJoZbcVbeJRsiHl2WMGHSNSth8oqngjvkIU0eBSJmIH3schly45S8PSV+ob1QLZqsv
	oyJYDJ9rdQmGZBojNA35sLI40ZG2CYW03bOZuhH13+0HREPUwfgs09h55CIgv651uXjOLN+slcd
	OPoJ5OKsbgl7yqklwXsWJHHPjYaBpjpeLWcKPQpaaP2d26R5qjqfeI7vqDzJ9jqmd7zIWDrG1gu
	B7SvSrdCh+BO3apTegVJ8xdOIVYMuFwPQspPSshCY3qHyfp0eFVvOI
X-Received: by 2002:a05:6000:2c04:b0:4ad:2699:74ec with SMTP id
 ffacd0b85a97d-4ad269975e8mr26924185f8f.39.1795500571241; Mon, 23 Nov 2026
 22:09:31 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-arizona-jack-remove-v1-1-11d8ec426a41@gmail.com> <sashiko-outbox-230548@kernel.org>
In-Reply-To: <sashiko-outbox-230548@kernel.org>
From: Wong Steve <shyckless@gmail.com>
Date: Tue, 24 Nov 2026 14:09:19 +0800
X-Gm-Features: Aa3M54qpM4MPvk0QbJ2lKAWT8ovgFTxZNio6uwGbDoyWApLaveGT2J3sZlXU4gY
Message-ID: <CA+X8SdjnZLuJs4LK=o_XsEBD_TaPiYX-gn-Jip8hV7iretWspA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: arizona: Disable jack detection when the component
 is removed
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Medium] ASoC: arizona: GPIO UAF in arizona_jack_codec_dev_remove() on
>   codec unbind
> - [Medium] ASoC: arizona: stale jack and HPDET state in
>   arizona_jack_disable_jack_detect()

Thanks, both are right. On codec unbind the platform remove callback
runs before the component is removed, and disabling jack detection
during a headphone measurement or before a rebind leaves state behind.

I'll send a v2 that also disables jack detection in
arizona_jack_codec_dev_remove() before the GPIOs are put, and makes
arizona_jack_disable_jack_detect() finish a running measurement and
reset the detection state. Mark, please don't pick up v1.

Thanks,
Suyuan

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8824=E6=97=A5=E5=91=
=A8=E4=BA=8C 13:17=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: arizona: GPIO UAF in arizona_jack_codec_dev_remove() on
>   codec unbind
> - [Medium] ASoC: arizona: stale jack and HPDET state in
>   arizona_jack_disable_jack_detect()
> --
>
> commit 64c10974d73769b43875985100c8e416d589c894
> Author: Suyuan Wang <stevewong@hust.edu.cn>
>
> ASoC: arizona: Disable jack detection when the component is removed
>
> This commit calls arizona_jack_set_jack(component, NULL, NULL) in the
> component_remove callbacks of the wm5102, wm5110, wm8997, and wm8998
> codec drivers to disable jack detection on teardown.
>
> > diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
> > index 762e81979cb8d..43df7cb46b599 100644
> > --- a/sound/soc/codecs/wm5102.c
> > +++ b/sound/soc/codecs/wm5102.c
> > @@ -1982,6 +1982,8 @@ static void wm5102_component_remove(struct snd_so=
c_component *component)
> >  {
> >       struct wm5102_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
> >
> > +     arizona_jack_set_jack(component, NULL, NULL);
> > +
> >       wm_adsp2_component_remove(&priv->core.adsp[0], component);
> >
> >       priv->core.arizona->dapm =3D NULL;
> > diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
> > index faa85d88a489b..c772f4380ae7d 100644
> > --- a/sound/soc/codecs/wm5110.c
> > +++ b/sound/soc/codecs/wm5110.c
> > @@ -2340,6 +2340,8 @@ static void wm5110_component_remove(struct snd_so=
c_component *component)
> >       struct wm5110_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
> >       int i;
> >
> > +     arizona_jack_set_jack(component, NULL, NULL);
> > +
> >       for (i =3D 0; i < WM5110_NUM_ADSP; ++i)
> >               wm_adsp2_component_remove(&priv->core.adsp[i], component)=
;
> >
> > diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
> > index f041dfc905a42..aa9f23ddd9975 100644
> > --- a/sound/soc/codecs/wm8997.c
> > +++ b/sound/soc/codecs/wm8997.c
> > @@ -1077,6 +1077,8 @@ static void wm8997_component_remove(struct snd_so=
c_component *component)
> >  {
> >       struct wm8997_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
> >
> > +     arizona_jack_set_jack(component, NULL, NULL);
> > +
> >       priv->core.arizona->dapm =3D NULL;
> >  }
> >
> > diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
> > index 1158e9ca40a13..47adbcd80e077 100644
> > --- a/sound/soc/codecs/wm8998.c
> > +++ b/sound/soc/codecs/wm8998.c
> > @@ -1301,6 +1301,8 @@ static void wm8998_component_remove(struct snd_so=
c_component *component)
> >  {
> >       struct wm8998_priv *priv =3D snd_soc_component_get_drvdata(compon=
ent);
> >
> > +     arizona_jack_set_jack(component, NULL, NULL);
> > +
> >       priv->core.arizona->dapm =3D NULL;
> >  }
>
> [Severity: Medium]
> When a codec platform device is unbound while a card is bound, can a jack
> IRQ or delayed work use info->micd_pol_gpio or info->hpdet_id_gpio after
> they have been freed?
>
> The codec drivers register their ASoC components with
> devm_snd_soc_register_component(), whereas their platform_driver.remove
> callbacks call arizona_jack_codec_dev_remove() directly.  Because
> snd_soc_card_bind() creates a stateless device link, unbinding the codec
> runs platform_driver.remove before devres_release_all() unregisters the
> component and invokes component_remove:
>
> CPU0                              CPU1
> wm5102_remove()
>   arizona_jack_codec_dev_remove()
>     gpiod_put(info->micd_pol_gpio)
>     gpiod_put(info->hpdet_id_gpio)
>                                   arizona_hpdet_irq()
>                                     gpiod_set_value_cansleep(
>                                       info->hpdet_id_gpio, 0)
>                                       <-- use-after-free
> devres_release_all()
>   ...
>     wm5102_component_remove()
>       arizona_jack_set_jack(..., NULL, NULL)
>
> Calling arizona_jack_disable_jack_detect() inside
> arizona_jack_codec_dev_remove() before dropping the GPIO descriptors
> (while keeping the call in component_remove for card unbind) would close
> this window.
>
> [Severity: Medium]
> If the card is unbound and bound again while a jack is plugged in, does
> stale state in struct arizona_priv prevent the newly bound card from
> detecting the jack?
>
> info->last_jackdet is only initialized in arizona_jack_codec_dev_probe(),
> and neither arizona_jack_disable_jack_detect() nor
> arizona_jack_enable_jack_detect() resets info->last_jackdet or
> info->hpdet_done.  When the card is rebound and sets a new snd_soc_jack,
> arizona_jackdet() sees val =3D=3D info->last_jackdet and suppresses the e=
vent
> instead of reporting the inserted jack, and stale info->hpdet_done causes
> arizona_identify_headphone() to skip headphone detection.
>
> In addition, if arizona_jack_disable_jack_detect() runs while an HPDET
> measurement is in flight (info->hpdet_active is true), freeing
> ARIZONA_IRQ_HPDET prevents arizona_hpdet_irq() from clearing
> arizona->hpdet_clamp and dropping the pm_runtime_get_sync() reference
> taken when starting HPDET.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-arizona-=
jack-remove-v1-1-11d8ec426a41@gmail.com?part=3D1
