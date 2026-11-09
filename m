Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246591;
	b=TqmMGPnDdJi2VFFr5K3sFqu+pOV5dCtrBTx4zHYILqhkGLuf6Up881nTaiic44s6eTlj
	 MQMVNSPGKuXnKMmXH8kWCMQTohabeP7vC/D+g1YBCtabyR3o3xz69Y8l7yS2xxR8FHM5w
	 OyB9EIQ8OT1kOxCDrgQ2j+R1Mr5RlAVgY4hMG1H9FsjkGUHgrm7L/IMCMRyNUilS4YLQ7
	 SpMKyXMKBHsg6bxghLPIJtidjLOLAMuReNK7Oopoam/JSroRG6ggM0YdroharO2VDxXig
	 84rjXUG99uNZElyFIqlN9//FuHmWTiwFa3DIxZb1DPLlTnBJKIE6htDylY2273FsPBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=MSNuxv5dkoXCn3ab0WfKzy0DEMSuanuWV6KxDVb5yYk=;
	b=CGhwsjm3fBuCjNNUz3emQqQUARKaXl7sik8TvV+eJ0BJM2ROYm/N1QYvuF7xBIN1Y5bh
	 IVZvBIcB2cXBDDSieJY3BxTSAJdCEqHyg9eIcj1T4/zvgg/Oo32SY7Y6wwjuL1KaMXI9A
	 lc2XPi5Y2EvKCpjvUBaNAmsb9u7bUgdb7C1cT496LfyuJscDwQoN6/PhtTTMZhBrLYbdn
	 xw9GiW2OSBpww9BUeRntFKTn7Tk4Abym0YKkunVJKhcDSger/uNQYK7yeS67lVi/a9NIB
	 9u8gQ9/0TgiwHZYBo9MzRxRFMXSDEDW0Y4nqhfhiZDvyYGfzsKw83vKpU3pPQuc3ETw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxMtyyyK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E635F606A325
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 17:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E635F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxMtyyyK
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91eb46044c4so14447676d6.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 09:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794246590; cv=none;
        d=google.com; s=arc-20260327;
        b=SdfcG8H0eFJxwD59AK6bZq8lMiESJ4/OaO8apJyWBpTgLd1SildGgCi/a7IeofJM9F
         Gfr/wCkHLpIOVBdjuhubCszfMu4iic7sc7wK0CCMxQZfpQc0UmppsokX68zLymnMZhts
         gy3nElHg8Dmb27xrZvdNyLu3dHpXaTriuhLXDJRPW36B8T/455/rcpvBrIlK4pfCIpCx
         WLm6mPhlglJydrMa5FQejDVVKT+4posRxAYy3u4uLMTDcroCSFO6atE5AxOflYxIG67o
         KcJNmCIT9LlyGOIs6y4OITo/QSPofUpBejZIrdaks3kghxhU/iWZPor3lDxGP0WCXFAw
         Kdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MSNuxv5dkoXCn3ab0WfKzy0DEMSuanuWV6KxDVb5yYk=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=XiAPsDRwEIRQrUwv6LEv6Wnv3ONAbdRDdtWzjTVJBOzp86Jp0ypAjtVmSbtDkwu+7P
         HjwZN49117A7DKoOlAp2kv4UAp5GcBNnRIonk87JQFPopkMZI9dO7yZNve4DbrpzS6qO
         VZa1RZOpLZ2jLlLuvjJojlUO+ivJW3lvWmVn95R5PP7uxOE8H2+TYjN3CcFRNhvXEFwy
         IHhpPpDThNqf58ODyZJ6IHEDTq+gG9yci52c80+r+iI/DDCNX5edeS4qaDGqbVq6wtEL
         8hGFWr0Jyc8CCLxWK2AEdQPt8h8ihC+GUHlyGrQ0Fs6nrCIokZXXT4X//aAF1ar79cdb
         u3Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246590; x=1794851390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MSNuxv5dkoXCn3ab0WfKzy0DEMSuanuWV6KxDVb5yYk=;
        b=KxMtyyyK2TG41NgZKDRQzPz32Eho6DvufYIcP2aKf+y/nDek3oJbTbZRZ2Jhfk3vRi
         mQpg92zcBLJBoVFzDmbDZNA4BlVYSZcgQMmbne+0juv9OiTuL6eK9PNJXC49z09dhmCN
         DVyy08+eaTn3TJtf3H5Eda8j6dr+x7FdcnjwCjzMo94t7Bl+nyDxr+wpIjp7naSwtg1A
         fH1erxu0wbJWYTn15/p0nuqD09ytgChqH2HQj6jvvAjlYN3fKsYon+XOgaBFHS8FW7L7
         03ZTLkAN+YlGsm7NerN+HmKU1oJEeb0Y8P+h+C7qSl/khRN4ApihhRG6f4rBqkyRtjCF
         M5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246590; x=1794851390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSNuxv5dkoXCn3ab0WfKzy0DEMSuanuWV6KxDVb5yYk=;
        b=WGAhDSzcqSevA1rngBeTQpoAafH4qDTymLYGK9x5aXqZuaT33WH7w7gEOwK1VFagaS
         6Xua6cdfRroJll9eHhWEz9eDadNJFXHQXcz/zvk3o5sIVJMSqEEsK5Q2sU/0t3FSCBsn
         Q4Y/56Irrt5r9XFY6ytWzyCTsguKi5i3UTarH6OafcJZLtMXfk2lndA2o7RwTTsr7NWk
         mML5E/4V5aHB3mZwU/4xkO91wJiE8BlAyJE1nPa2UaiHOporeewPfPfIYXSUIuH8PABM
         EjhxBD8aGCeae8tGHqDwsNNCW6fI+xUr6AWF008DGfYJ45t8nESXtqo99YQiki1/fc5S
         1vPQ==
X-Gm-Message-State: APuU4Z+A3vSrgrCKtuU5rs/x9sRrjSnJVFI1KafsYu9PalBxTByqdOF+
	o4J8NNdyNrQyb1isS819+sM9ECOEkRFtE2T8EhlSQ4G1NbAGaxNEEOHzewxkiVtv82s8Uomqxlp
	OyPuQQ6KCDBP4JABRYVNTEmUPbzo9HHQ6ej8Bl8M=
X-Gm-Gg: AYBFou20XxjYHRFr1xCSn0fCg3Bg8u+BBWF3bvMO1BtqYQiK+3opK+pB77ZhdcYfCV8
	c9VjNDCW4JtpRNR+Z8lJfZtNcxv9La5stFEGltSYpAgcK1ZHzH5co7hFpemQO91ODUIWh7XLbFR
	iYGAS+DHWoEetlWtCJLP0tszjBbAjxucmWq5yDm7oTORTjokxAUTDas9JpX6SNx/K/Vb2LC+Zy2
	f4caJlAHU5sKkNPPOH0kkXwt3APEwZvXpWuESPSAkqkLYxSfAeuqvxze+xPDUPvRNEWCLksmhG9
	kPLc/SJnELsORsP+rAZSHU2PoTFY9hkYcCif3fnOcbsowpl3Mifu1LS3Vb4krSvwTkzXCTa8hdN
	MmuMYZWL4EeXL4/xkz9VGLj+a0cgX6YngctD91kDcye4aDDH1j0TWSvn1ETQZqCGLF3Hi
X-Received: by 2002:a05:6214:cac:b0:91e:bcef:384f with SMTP id
 6a1803df08f44-91eef84d7d4mr6751636d6.46.1794246589654; Mon, 09 Nov 2026
 09:49:49 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109172144.1851173-1-hj351016@gmail.com> <sashiko-outbox-205332@kernel.org>
In-Reply-To: <sashiko-outbox-205332@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 02:49:37 +0900
X-Gm-Features: AclHuK8y_DcJwMMG1_6LrWdxW7usdoZIty8966dYKsKjCcGNp3DTuJhiAnq5thg
Message-ID: <CAGr5VtMuhPM+9dtTcsDLk3E5xyRXibvN=pY=ehT+AfuN4q030w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the thorough review - the points are all valid. The
jack_detect_work and calibrate_work handlers busy-wait for card
instantiation, so cancel_delayed_work_sync() on the teardown path can
hang, and calibrate_work needs the same handling. This needs the
reschedule rework the sibling drivers got (4c33de0673ce, a6d78661dc90)
before a cancel is safe, so please disregard this version.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 2:45, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] ASoC: rt5665: infinite hang in rt5665_i2c_shutdown() canceling
>   jack_detect_work
> - [High] ASoC: rt5665: uncanceled calibrate_work in
>   rt5665_i2c_shutdown() causes UAF
> - [Medium] ASoC: rt5665: unconditional disable_irq() in
>   rt5665_i2c_shutdown() on IRQ error
> - [Low] ASoC: rt5665: inaccurate handler name and queuing site in commit
>   message
> --
>
> commit 753d54cd6a5c4d1a6c0962dfc60f96a690d96477
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> ASoC: rt5665: cancel jack detect work on removal to avoid use-after-free
>
> This commit disables the client IRQ and cancels jack_detect_work and
> jd_check_work in rt5665_i2c_shutdown(), and wires up an I2C .remove callb=
ack
> that invokes rt5665_i2c_shutdown().
>
> > rt5665_jack_detect_work() runs from the delayed work jack_detect_work,
> > which is queued from the jack IRQ handler and from the jack-detect setu=
p,
> > and the jd_check_work polls button state; both dereference the driver
> > data via container_of().
>
> [Severity: Low]
> In sound/soc/codecs/rt5665.c, the handler for jack_detect_work is named
> rt5665_jack_detect_handler(), and it is only queued from rt5665_irq();
> rt5665_set_jack_detect() only configures registers and stores hs_jack.
>
> > diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
> > index 62b21092e352b..bce2fc8c9bc6b 100644
> > --- a/sound/soc/codecs/rt5665.c
> > +++ b/sound/soc/codecs/rt5665.c
> > @@ -4837,9 +4837,19 @@ static void rt5665_i2c_shutdown(struct i2c_clien=
t *client)
> >  {
> >       struct rt5665_priv *rt5665 =3D i2c_get_clientdata(client);
> >
> > +     if (client->irq)
> > +             disable_irq(client->irq);
>
> [Severity: Medium]
> Can this disable an IRQ that the driver never acquired?
>
> In rt5665_i2c_probe(), a failure in devm_request_threaded_irq() only logs=
 an
> error and lets probe succeed with client->irq still set:
>
> sound/soc/codecs/rt5665.c:rt5665_i2c_probe() {
>         if (i2c->irq) {
>                 ret =3D devm_request_threaded_irq(&i2c->dev, i2c->irq, NU=
LL,
>                         rt5665_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FA=
LLING
>                         | IRQF_ONESHOT, "rt5665", rt5665);
>                 if (ret)
>                         dev_err(&i2c->dev, "Failed to request IRQ: %d\n",=
 ret);
>
>         }
> }
>
> If that request fails, rt5665_i2c_shutdown() will still call
> disable_irq(client->irq) on remove or shutdown, leaving the IRQ disable d=
epth
> unbalanced.
>
> > +     cancel_delayed_work_sync(&rt5665->jack_detect_work);
>
> [Severity: High]
> Will cancel_delayed_work_sync(&rt5665->jack_detect_work) hang forever if =
the
> device is unbound or shut down before the sound card is instantiated or
> calibrated?
>
> rt5665_i2c_probe() requests the IRQ before registering the component, and
> rt5665_jack_detect_handler() spins inside the work callback waiting for t=
he
> component, card instantiation, and calibration:
>
> sound/soc/codecs/rt5665.c:rt5665_jack_detect_handler() {
>         while (!rt5665->component) {
>                 pr_debug("%s codec =3D null\n", __func__);
>                 usleep_range(10000, 15000);
>         }
>
>         while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
>                 pr_debug("%s\n", __func__);
>                 usleep_range(10000, 15000);
>         }
>
>         while (!rt5665->calibration_done) {
>                 pr_debug("%s calibration not ready\n", __func__);
>                 usleep_range(10000, 15000);
>         }
> }
>
> If an interrupt schedules jack_detect_work while any of those conditions =
is
> false and the device is then unbound or shut down, cancel_delayed_work_sy=
nc()
> waits indefinitely for a loop that will never make progress.  The sibling
> drivers fixed this by rescheduling the delayed work instead of looping in=
side
> the handler; see 4c33de0673ce ("ASoC: rt5682: do not block workqueue if c=
ard
> is unbound") and a6d78661dc90 ("ASoC: rt5668: do not block workqueue if c=
ard
> is unbound").
>
> > +     cancel_delayed_work_sync(&rt5665->jd_check_work);
>
> [Severity: High]
> Does rt5665->calibrate_work also need to be canceled here?
>
> Unlike rt5682, rt5665_probe() schedules rt5665->calibrate_work with a 100=
 ms
> delay, and rt5665_calibrate_handler() -> rt5665_calibrate() sleeps across
> polling loops while accessing rt5665, rt5665->component, and rt5665->regm=
ap.
> If the I2C device is unbound while calibrate_work is pending or running,
> devres frees rt5665_priv and the work handler accesses freed memory.  Not=
e
> that rt5665_calibrate_handler() also has an unbounded while
> (!snd_soc_card_is_instantiated(rt5665->component->card)) loop that would =
block
> cancel_delayed_work_sync() if not converted to reschedule.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109172144.18=
51173-1-hj351016@gmail.com?part=3D1
