Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD92121CFEF
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 03:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777002785; cv=pass; b=J8PcptYgem31yCHPcBWBVGM5f+VHAEVNgXvhlS63OWZglHS8+3MQ1fK5RSTIh1y3fstQ4vJLAAoF/xdMpy3ICXLnFGMCKlTSgQKfhKwfC/jhBCRJiX/jasNAKxarXSOr8wlhzmDHSufX9VhbvkOl/57uOEkDNZSnyfAj3R9Nlp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777002785; c=relaxed/simple;
	bh=QIlxIIzrBZ0N/KPvc0uB8FAQSxXW/2BSgLn1HxvjEDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXTBbw6Ir4BLcTQMW7bUTMrXexhGCRnF5U9TYL/IRkiFtunxHcm3rNq+g0GfRGJ4tUC48vkuNCtXOvEsUQcJFj7kn3E3SnoL49n6tkNwusNf9jVHSt0MMoBPk0BDlh1aPgg6kEPOIZOwMonMvSy41hZDYckzKYPaFhkr5WXO/Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=lEsXdPr0; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="lEsXdPr0"
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6D27C3F9CD
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 03:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1777002781;
	bh=887cakPgYvPGM3+avHUoAsSOSozp7Sf0ilGVQwH8MxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=lEsXdPr0lFGafh/FVbPVHWYl+CEqqmYtMaQ6l8VTtNuklB+ClJefHJFrruVEsfc0x
	 99auoXL2K6ZYpGmAe3n4rCgPuF95nfHpAr2iVLBf48YPUiSog5nO/ibrj/3OiWGBO2
	 d2ewX47w7hHoXtOE8DGCQ+IcJTL+1r5qjkuTosMXWh9mqS67o02S/c1kBT/VFncBoP
	 SHql85elI4dU2E+WOMWFsrbSRmHkCFjAP6ZYCNH3TGqwX8juWqvKTkg66SoDXQhFGm
	 kmHDPW1Bbw42+uXLzW/QyyiPQqsA2Q8kfKz4cTiEl+qf8vPRjBsZvHsY6qj6fBP5uz
	 EvWsW68+E30if7/aHWoTpP15kBuvrO4OvJLXUX2y5AKHDUul9YvnbqeHHFyKW+oarg
	 aHWy0eE9RVMKu3MIz1QLxJO1thet+UHobZwCXjDYkvvnrDwsQrBmiDwxLnxQN5lvTv
	 S0Jr2yq22uzLh9Q661kxaUz417QNM1eGk1GTW8yXDXtgg0GrXFLi8i2LcLzlnI8u2Q
	 9KJvU6mJZ/eQjfe9St8RcMNuRnNv+rZRmiaXLOnBTbtVK3ELUvknuSPQ9aM9VZ89gV
	 1eAxoEnpggxpJeb15m5D09zG4j0/loaCoW1qP2B5hMj/EbENda009gYoIDsh/3h6Nf
	 dwwXVKboqkra4no0aLtebkY0=
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c91ef7009so16474988c88.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 20:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777002779; cv=none;
        d=google.com; s=arc-20240605;
        b=R6VjLuaqTBFPL2apPSKXaSMMlFxLbTCEboPnBU7uGV1LaId//8xv8awRxTS6XkIAdf
         X7wXgPJKyHo30tSrjJdeSot0/T7eeHA+r74gch4XbkDMxpnMb1URrb7mJX9nINcjlwW2
         vcIPQc8FvSdN6NrjeFhswxvexQ0frcafzhx47vrReHFO76mJnolSnBhG7ZBTrm05sNfo
         rxO6nGh8BrYkYTLXLSHrH7Wwcxjgj9j+GtOz+KVB94UMRmqQvhAZRx4/nItVWQULjxwv
         KwCtqj+c6GjD9oH8b8fBd5f1W81NUhrdjWi7zvxgfMp60iegrBQWZqZ24DN/wIr1Lbcv
         b8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=887cakPgYvPGM3+avHUoAsSOSozp7Sf0ilGVQwH8MxY=;
        fh=C1sRWDgKLEfnr1aBijbbywzheOm7t/ETp/CyCzmr6TI=;
        b=iSZPfj+0qpeCt7yNL8tffXNKgRFvklQJhzZihdsj+f/0N6W9o4B8pqRXaAAjk93vCm
         yx+i4yppN6PtUPR18+q/6oL0PFgtYJhb2pmLbUbTn0+vtM4vssIXqHnzMkfbsLEbQ2sO
         LvMDc1zE3Sz0aDApe45lvGGSpAOskhHCGT75pDeAqsPiAhQ9BfsUlJvzb4PWIs2YgVWN
         L+OumnmX87NPn44l9B7GAl6OR5D15bw7XVPsIrKyfehFWknYUPCrKHLWrpDREURC+Da1
         zf3yVE2A0PNV7Gy8x7lEVaAt3mRbzPpc3MS56ijgB+4BBlFhiMiCfr/KQWvmuR1Q8qMk
         2j/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777002779; x=1777607579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=887cakPgYvPGM3+avHUoAsSOSozp7Sf0ilGVQwH8MxY=;
        b=qej+3/tB1+WpesW5rrR4JJOwlEl87L9MxCv01ByhHNbV+bXdiE2Bb4e5/0KQ/PVsd7
         B7rnOQIPPnqZ/FhsJvUuWN6+8rHFKW9y9dtkSkNOq3Q2LEQSZXex6Y+HFJvXxAZv4ZF6
         0h1TyBr5BnKXyVU6HpRsGiDAHuHpHAilaIkheHVc0PRhRupSNngESPdw8CAUdrTeekuK
         VJqSP2bMUDaPcfOPSX5ppyduUOScjTNovMZ/q2rm7ylPIyy7lruo726G23IqxMQUQ8+P
         ow8AQAowK5WJ6Q4rVDaXj+BHkoaGgBu8i/CgKRJ6vpbKFkQzD94DyVqQD5trWG4E77XY
         WjMA==
X-Forwarded-Encrypted: i=1; AFNElJ8dK+LX05SakXpHzwtTZEO2cR+PEvQqohf10dcNx6EK0ybDxrmGOP94d96bCmLE10655+kCliOSHJyeNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwczoBQ0xoOXhy/OIT+WuUFpGogbglx5LyGGW8vDh7GXvPc3dA
	6QOBe11YNMPTrOCNCjJ2w08JlWyQuKP5Vk9sB1tR7yRRfvNV3387XEB7gKEbQu5lmPGzUy+7k0m
	VCUY1D4mXIcLPE/Eg0GkTxE7CbPSHVkkdSbsaknIkNPW7KiD/GB5kZJaUYVBw30hZvvS8VQr1cL
	whxcQ9vyDjr2Dt8SSgWzliOtmx5nU3YjAz/skxI0sjk1ruBdKRA51lPnbenc6q7rPeNXcn
X-Gm-Gg: AeBDiet1zPCC67zixK8n238NQRKAyfYsXRGckurXSpBgAVFXEDfHutDsdw7eOTDY3by
	ivUBvgsph137sM6llSbhzO5MKqU0I/hAYRq7gnbQPBmGFaH2H9/ant66tIqbYsHq74JxtwJgwxT
	ZpuKyga8ehlkCNKpyE5pDjwVFiNZSV6a7DJx2PM8mWyAl6sjmsYbYTpmXFqhKchiS7sVm1Qr/F+
	6Ik2QDYjgNGOEDdWA==
X-Received: by 2002:a05:7022:eac8:b0:123:2c98:f6af with SMTP id a92af1059eb24-12c73f75a96mr17182394c88.14.1777002779463;
        Thu, 23 Apr 2026 20:52:59 -0700 (PDT)
X-Received: by 2002:a05:7022:eac8:b0:123:2c98:f6af with SMTP id
 a92af1059eb24-12c73f75a96mr17182383c88.14.1777002779082; Thu, 23 Apr 2026
 20:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423101338.1040131-1-aaron.ma@canonical.com> <76827f27-1a27-422f-8e83-5f5e5ae0f7ef@linux.dev>
In-Reply-To: <76827f27-1a27-422f-8e83-5f5e5ae0f7ef@linux.dev>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Fri, 24 Apr 2026 11:52:47 +0800
X-Gm-Features: AQROBzAiNzDu49u1IMWu7XySLupko1e2QuzshhzqOXXvHjoooj_2VleSXZzzN0M
Message-ID: <CAJ6xRxVy5+PnoNDK0z=15PrsUXewAgZb6y=a4pdUQ5JTqphk8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: add FU06 Playback Switch for speaker
 mute control
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 9:01=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 4/23/26 12:13, Aaron Ma wrote:
> > The rt722-sdca codec driver exposes FU06 Playback Volume but no
> > corresponding mute switch. Without a user-facing ALSA switch, UCM
> > cannot attach the speaker mute LED via snd_ctl_led, and PipeWire
> > cannot drive hardware mute.
> >
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> >  sound/soc/codecs/rt722-sdca.c | 77 ++++++++++++++++++++++++++++-------
> >  sound/soc/codecs/rt722-sdca.h |  4 ++
> >  2 files changed, 67 insertions(+), 14 deletions(-)
> >
> > diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdc=
a.c
> > index 79b8b7e70a334..23d2f63d68ef3 100644
> > --- a/sound/soc/codecs/rt722-sdca.c
> > +++ b/sound/soc/codecs/rt722-sdca.c
> > @@ -517,6 +517,61 @@ static int rt722_sdca_fu1e_capture_put(struct snd_=
kcontrol *kcontrol,
> >       return changed;
> >  }
> >
> > +static int rt722_sdca_set_fu06_playback_ctl(struct rt722_sdca_priv *rt=
722)
> > +{
> > +     int err;
> > +     unsigned int ch_l, ch_r;
> > +
> > +     ch_l =3D (rt722->fu06_dapm_mute || rt722->fu06_mixer_l_mute) ? 0x=
01 : 0x00;
> > +     ch_r =3D (rt722->fu06_dapm_mute || rt722->fu06_mixer_r_mute) ? 0x=
01 : 0x00;
> > +
> > +     err =3D regmap_write(rt722->regmap,
> > +                     SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU=
06,
> > +                     RT722_SDCA_CTL_FU_MUTE, CH_L), ch_l);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     err =3D regmap_write(rt722->regmap,
> > +                     SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_USER_FU=
06,
> > +                     RT722_SDCA_CTL_FU_MUTE, CH_R), ch_r);
>
> IIRC you can mute all channels at once in a FU (Feature Unit) using Contr=
ol Number 0.
>
> If both channels need to be muted/unmuted it's better to do so in a singl=
e command.
>

Thanks for the review.

The per-channel mute writes are unchanged from the existing DAPM
handler, just moved into a helper.
All rt711/rt712/rt722 drivers use per-channel writes for FU_MUTE =E2=80=94 =
no
CN0 precedent exists.

Aaron
