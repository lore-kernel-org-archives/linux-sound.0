Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70AD3E168F
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810887; cv=pass; b=VIzyftMcgYimeV1tFh+FdRN75WJm1Ke+B+XZWfmiKGn/C3cZ03Kx85GJckU3npHVyjzb7CAtH5qBOxwei1GS1GgvATdhZg9ReEU69PWcQ0AFdfAeQsMSI3HDZ2id81ngu2hE7DYqKhp9tifP3HE5C7BZfl5/H2jFlkwnrbni+zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810887; c=relaxed/simple;
	bh=28Bm4BVWDzLcCgztJ1mFPF8i5A1Q5I+HyUvoNTsRLVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMp928BKSbkGoqUpdMmMOOzBr8Z6mbBpfHkqoJP8TTkpLovg0VnbZP2vtwq9gyI4lbPP6Px+bS+O/fX/Q6wDL6SKExKhmSAAEGlgu9oV12bWaXgBk6yvzfsphrCmJd6Szm1GM70kTDK57NqElhutCjXhHtyuWIfP2cyJm9teuuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh9YFOlB; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh9YFOlB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c8c30492a0so36041515ad.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 02:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782810885; cv=none;
        d=google.com; s=arc-20260327;
        b=W7b6gpafhgnMEKhGIZZ0Uhn5KN4GMK3GF0m4e5JVI6bR4ynGH2/bi62VFwyPZ7Dy8w
         vkWMZrXgNK3a/n7pgOsYHzEuTFjeDvpe6c/wp5nlkUqbPiO+5Px2H77fRVnS364ua5+s
         sfnySjahWRK5J+UwXdz4Pro1E1CxrsAiw9HcwURm7g2tqf7nuAKJ8v+EWbsmduAWQiB6
         0fA4xK5yC4NvkzYKZs/sGhXx55QvRyFGgqs9uUOYRX06gDN/6WLspcY3Ve7Rpl8KoJSf
         ajHac23VHAwHUVjBQgdDXuXQYpKUEzjPmFYK3O359EBs+RE3hZvOkLzesZs7NU1+vGuz
         ES2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        fh=XRycC3wobJEunPBL6JL8fgXUuBIeU5OIYQCYLEnPdSk=;
        b=l7NIdkLtMNfr8eNMrYd5UXHCGtKwUdduomW1ik6r9iIMX4VGqG6zASS9k6VuojlugM
         xC+GTYHeEAYrKGG85nepj3j9RYNkRit1gJ27fj2W4/3pa76KVNyR1LBudBliJQDOP4cO
         9QkEQT0qUETjocCxjTTzNoeaq57txKbL9ijTGWmssjGJmbcr10zDIwPXcDit2wyVGpHc
         EWBIXOqCFnWrINT2LR+38QM8B7/KLQqzGcqrIaeON/BddVvqS5QMdUhAdGofWJrvouX4
         msHDp/2R5a6Yq8ZWNDWGAD8smr8GB9FnK07aVXoOIcir+utfu17Sx+R5/WBFvbjZPNoS
         Hk/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782810885; x=1783415685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        b=nh9YFOlBrTRJ/Wk4PSue1LldgGjMqTizMNEn8x2hKr0CEU7C3qcKMGwG/tVr//2t00
         qyN+6H3Cs4c0mmcx8899C3pfPAxz28x2nMJOFPxbs3eGES1IVoyI1YSp48DYccsRZe/9
         yw2WMI/1p6rniAMef2FFxYtRBecNBHkWB0UBQJcV1/y/OwHv/jHsA9BDwU7KQ1gBLNJr
         VGSaiwxMCJtE/Z5hlIWhEIVdKIlqg2Abrgo/UihL5UhNyjTIaBZdI3R3AGwjnN1Gcyge
         hPnGNObCgAzkgNefXDouBPtleOxMtnV7kDLTwqQXruEGyk7cJEE0Q32K6Sd3i7m3kB6B
         Ajug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810885; x=1783415685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mc8cfwvLT4bAM4tk7++9grOS37/A0u8v1goWlPe04Vo=;
        b=mDiqYTYA30g/PjfFUNI2aGid7qsTdTnd5izbCvMpynFp1szYywZdDCHLotdscsGVWn
         4EG18fjfnI1zpyWdzrjlF26xLwUUcOzAQGT26+R4Cv0iZ29fvjyD3KagMTto0GJfkS6m
         jX3mcgoNbRTuuF3iuPe5PbM4TmaQPplqRVpfA47qHIRzUL0HhAJlGT62IdZqp219aE32
         auJA3lQQHxJlPAFYzNsus85/bvED7F5cuET6h4Lr6rq8ow9FlXl1ru0n6z5V4aGq6XLa
         VKWRUXVySSSUs4RtdkaSq1uF0m1ThXE1Y6+zPB6MOF824dvG6nrlI+kFB8TQmPdeWXNv
         WxwA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3XdP9k+rr2GjZNCw8ZPVxV8OvqVWOQ8auXBBEe8kXYO5T+CLv02GcLhVxENkWfi3AIjVn5yb2mGSLkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7uHpsQRekY4+5xHImtuKK7P83hpJLCHsq/8kEwJkFqyJ4OBA9
	0YCNbc9kyVzdurAY2eZuhuhG7Vy2hBZSIxWBvOFGGebo8GKRAYke1wdhNRVNeLR1aI4qzaaf6Y/
	lVh9V0EgiU9VQifsvyOIUI2yY2xq7o8k=
X-Gm-Gg: AfdE7ck7ctpO+CJ2VbvhjgGGLbGBoOepy45U+m0dMjex7RqJ73wfiyflZBgTNRZ7RMN
	lwEv9MkEu+hILXg+DoVk7P36YRBoD1UBR26LtEddxXvj8/phxIw5cHWVfInxXBNP4mLe8F7xiXt
	7hInDOqwBdoaVOZUssUI7Qp0DntM5L6YkquNTlij0Af5eSRwxxZFnRArMAG0MpUapDOmjRupdW6
	YN6lRRjJ5NUNv9W20y+kuk7vEncebneppOruPPDTs4uCRRQMQXpUNbk1I26qN+MjfgzOvfdug35
	olf8tqmpEbIiwKG1mS2Haecmlh4=
X-Received: by 2002:a17:902:fd83:b0:2c9:97a7:3276 with SMTP id
 d9443c01a7336-2ca2ea335c2mr19419135ad.39.1782810884946; Tue, 30 Jun 2026
 02:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com> <20260630092821.650c30ec@bootlin.com>
In-Reply-To: <20260630092821.650c30ec@bootlin.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 30 Jun 2026 16:14:33 +0700
X-Gm-Features: AVVi8CdpcGsQO7j2elPBPz0Nft0JM37FEMmCfPqP7T8On5LblxvKpA_DrRSwZCQ
Message-ID: <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com>
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
To: Herve Codina <herve.codina@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 2:28=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi,
>
> On Tue, 30 Jun 2026 13:34:31 +0700
> phucduc.bui@gmail.com wrote:
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >  sound/soc/codecs/idt821034.c | 121 +++++++++++++++--------------------
> >  1 file changed, 51 insertions(+), 70 deletions(-)
> >
> > diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.=
c
> > index 084090ccef77..078de6c9c395 100644
> > --- a/sound/soc/codecs/idt821034.c
> > +++ b/sound/soc/codecs/idt821034.c
> > @@ -6,6 +6,7 @@
> >  //
> >  // Author: Herve Codina <herve.codina@bootlin.com>
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/bitrev.h>
> >  #include <linux/gpio/driver.h>
> >  #include <linux/module.h>
>
> Alphabetic order. Move <linux/cleanup.h> after <linux/bitrev.h>.
>
> ...
>
> > @@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcon=
trol *kcontrol,
> >
> >       ch =3D IDT821034_ID_GET_CHAN(mc->reg);
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       if (IDT821034_ID_IS_OUT(mc->reg)) {
> >               amp =3D &idt821034->amps.ch[ch].amp_out;
> > @@ -466,21 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kc=
ontrol *kcontrol,
> >               gain_type =3D IDT821034_GAIN_TX;
> >       }
> >
> > -     if (amp->gain =3D=3D val) {
> > -             ret =3D 0;
> > -             goto end;
> > -     }
> > +     if (amp->gain =3D=3D val)
> > +             return 0;
> >
> >       if (!amp->is_muted) {
> >               ret =3D idt821034_set_gain_channel(idt821034, ch, gain_ty=
pe, val);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >       }
> >
> >       amp->gain =3D val;
> >       ret =3D 1; /* The value changed */
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 1; /* The value changed */
>         return ret;
>
> Call directly
>         return 1; /* The value changed */
>
> >  }
>
> ...
> > @@ -521,7 +519,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcon=
trol *kcontrol,
> >       ch =3D IDT821034_ID_GET_CHAN(id);
> >       is_mute =3D !ucontrol->value.integer.value[0];
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       if (IDT821034_ID_IS_OUT(id)) {
> >               amp =3D &idt821034->amps.ch[ch].amp_out;
> > @@ -531,20 +529,17 @@ static int idt821034_kctrl_mute_put(struct snd_kc=
ontrol *kcontrol,
> >               gain_type =3D IDT821034_GAIN_TX;
> >       }
> >
> > -     if (amp->is_muted =3D=3D is_mute) {
> > -             ret =3D 0;
> > -             goto end;
> > -     }
> > +     if (amp->is_muted =3D=3D is_mute)
> > +             return 0;
> >
> >       ret =3D idt821034_set_gain_channel(idt821034, ch, gain_type,
> >                                        is_mute ? 0 : amp->gain);
> >       if (ret)
> > -             goto end;
> > +             return ret;
> >
> >       amp->is_muted =3D is_mute;
> >       ret =3D 1; /* The value changed */
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 1; /* The value changed */
>         return ret;
>
> Call directly
>         return 1; /* The value changed */
>
> >  }
> >
> > @@ -629,7 +624,7 @@ static int idt821034_power_event(struct snd_soc_dap=
m_widget *w,
> >       ch =3D IDT821034_ID_GET_CHAN(id);
> >       mask =3D IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT8=
21034_CONF_PWRUP_TX;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       power =3D idt821034_get_channel_power(idt821034, ch);
> >       if (SND_SOC_DAPM_EVENT_ON(event))
> > @@ -638,8 +633,6 @@ static int idt821034_power_event(struct snd_soc_dap=
m_widget *w,
> >               power &=3D ~mask;
> >       ret =3D idt821034_set_channel_power(idt821034, ch, power);
> >
> > -     mutex_unlock(&idt821034->mutex);
> > -
> >       return ret;
>
> Instead of
>         ret =3D idt821034_set_channel_power(idt821034, ch, power);
>         return ret;
>
> return directly:
>
>         return idt821034_set_channel_power(idt821034, ch, power);
>
> and remove the 'ret' variable (no more used)
>
> >  }
> >
>
> ...
> > @@ -771,7 +764,7 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai=
 *dai, unsigned int fmt)
> >       u8 conf;
> >       int ret;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       conf =3D idt821034_get_codec_conf(idt821034);
> >
> > @@ -785,12 +778,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_d=
ai *dai, unsigned int fmt)
> >       default:
> >               dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
> >                       fmt & SND_SOC_DAIFMT_FORMAT_MASK);
> > -             ret =3D -EINVAL;
> > -             goto end;
> > +             return -EINVAL;
> >       }
> >       ret =3D idt821034_set_codec_conf(idt821034, conf);
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D idt821034_set_codec_conf(idt821034, conf);
>         return ret;
>
> return directly:
>         return idt821034_set_codec_conf(idt821034, conf);
>
> and remove the 'ret' variable.
>
> >  }
> >
> > @@ -802,7 +793,7 @@ static int idt821034_dai_hw_params(struct snd_pcm_s=
ubstream *substream,
> >       u8 conf;
> >       int ret;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       conf =3D idt821034_get_codec_conf(idt821034);
> >
> > @@ -816,12 +807,10 @@ static int idt821034_dai_hw_params(struct snd_pcm=
_substream *substream,
> >       default:
> >               dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
> >                       params_format(params));
> > -             ret =3D -EINVAL;
> > -             goto end;
> > +             return -EINVAL;
> >       }
> >       ret =3D idt821034_set_codec_conf(idt821034, conf);
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Idem here:
>         return idt821034_set_codec_conf(idt821034, conf);
>
> and remove 'ret'.
>
>
> >  }
> >
> > @@ -897,11 +886,11 @@ static int idt821034_reset_audio(struct idt821034=
 *idt821034)
> >       int ret;
> >       u8 i;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       ret =3D idt821034_set_codec_conf(idt821034, 0);
> >       if (ret)
> > -             goto end;
> > +             return ret;
> >
> >       for (i =3D 0; i < IDT821034_NB_CHANNEL; i++) {
> >               idt821034->amps.ch[i].amp_out.gain =3D IDT821034_GAIN_OUT=
_INIT_RAW;
> > @@ -909,23 +898,22 @@ static int idt821034_reset_audio(struct idt821034=
 *idt821034)
> >               ret =3D idt821034_set_gain_channel(idt821034, i, IDT82103=
4_GAIN_RX,
> >                                                idt821034->amps.ch[i].am=
p_out.gain);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               idt821034->amps.ch[i].amp_in.gain =3D IDT821034_GAIN_IN_I=
NIT_RAW;
> >               idt821034->amps.ch[i].amp_in.is_muted =3D false;
> >               ret =3D idt821034_set_gain_channel(idt821034, i, IDT82103=
4_GAIN_TX,
> >                                                idt821034->amps.ch[i].am=
p_in.gain);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               ret =3D idt821034_set_channel_power(idt821034, i, 0);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >       }
> >
> >       ret =3D 0;
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> Instead of
>         ret =3D 0;
>         return ret;
>
> return directly
>         return 0;
>
> >  }
> >
> ...
>
> >
> > @@ -1079,23 +1061,22 @@ static int idt821034_reset_gpio(struct idt82103=
4 *idt821034)
> >       int ret;
> >       u8 i;
> >
> > -     mutex_lock(&idt821034->mutex);
> > +     guard(mutex)(&idt821034->mutex);
> >
> >       /* IO0 and IO1 as input for all channels and output IO set to 0 *=
/
> >       for (i =3D 0; i < IDT821034_NB_CHANNEL; i++) {
> >               ret =3D idt821034_set_slic_conf(idt821034, i,
> >                                             IDT821034_SLIC_IO1_IN | IDT=
821034_SLIC_IO0_IN);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >               ret =3D idt821034_write_slic_raw(idt821034, i, 0);
> >               if (ret)
> > -                     goto end;
> > +                     return ret;
> >
> >       }
> >       ret =3D 0;
> > -end:
> > -     mutex_unlock(&idt821034->mutex);
> > +
> >       return ret;
>
> return 0;
>
> >  }
> >
>
> Best regards,
> Herv=C3=A9
>

Hi Herv=C3=A9,

Thank you for the very detailed review.
I hadn't realized I had missed so many issues.
I'll fix them all and include the updates in v2.

Best regards,
Phuc
