Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB831F9AC
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519369; cv=pass; b=CwpA8ErdCfq4WOmDvUeQmj8HYj9C7Dh/L3embw3gvkVQFjiCq18L0yyos0uECkKJtmQaHuzT6sYk1N6Glw610M0+GLabkY5m/0E7Pnkp1+Q+YJAGnWbdNqVujiKP8ox+pg4SjnIEBWqVaY345vC4qpfJc7YI2SnkvwnyahdcRtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519369; c=relaxed/simple;
	bh=Efc1PqSwsZXQlAtCvG+03vDq/5T5os6eJUDnoscLKPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iC+tsh65DFxWYW8SC18f+35DiBh8l5pCY/cbwan3LOxWMu5ajx5HJNOCte11wMrcGXrtT5+KLDA77Q/KFmAIqFvpnHFF6xa7Zqb8R9L86uhnCM6gajJytO/jB46gI9uYBQ1jIo+tLS2ve0t9jRj8pvdMkIZahKzeWCMRhymKCo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yo+efJDL; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yo+efJDL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c70c112cb61so562421a12.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 03:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774519368; cv=none;
        d=google.com; s=arc-20240605;
        b=DAaWaVeMfWqxQRHVD/KyfN7POSz3oNM9SovM/YGffH6XoG8MdfFlqUKShfKXNNX3zb
         pkk7aHZOIylH+O4mIziWeVKoTXPWm1HvHc2d1UCO5sMLtNO8LM5NoZPSJqtoxCsg9zGY
         m2AHoysObkNx/NBdbciy76E80uk933L6gB10ZrAXflFkAY3G9ppgvJ/U0nQ27CzK82q1
         lPvKSnzamve3we6VcfmbmOOKY4O0ig0EnOtbGNw7qW/gc+CoxXRQrFX8vLq8cknmPO6i
         bwAHY4ZrDtkl6MiIpX232MqqjF49tRR3fWTt3BADLiC2FOwE/lQwFbOZGYCIgLlcdUBl
         J/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=51TKOnys+1HryNBWI322Nip3SpDPN9G6txy9eqpfqVY=;
        fh=JE/RksEPcbgn/8byCKvQ/CabkzqduB8lb0hsd7eW1ys=;
        b=V/8hZCAJAz5YdB138ck+oxRUgbjZgqT4JRJWhigqipiI5alLdOSPBT5Qa4SJcW2qIP
         gw+pEsMOmdQh2YAdW7rXRjrK0ApKtAhI/WnuIj7LHzuvuJKBO5WtpdZH/yLM0Q1tNRb0
         tjFmJdtduqeDyAZlY57H9YSsnxmI6xZ6BDPGDioX+cr/MP7tUKMEL7QU35t0AlP0CJKz
         Pv1/cpxml0WyQtrGs/Ls5qCRrN9fo8tLXuSYqha6zzOmSIzKpwN3q54aKV/8eduYgcAN
         0ZVczHQ4ciDPFAgVUqM15BtgmGOvNNPa5h9loqmxcFWzH6HObTGcbnf2cQ6+ryTPOZCa
         c6zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774519368; x=1775124168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51TKOnys+1HryNBWI322Nip3SpDPN9G6txy9eqpfqVY=;
        b=Yo+efJDL+AOrtw+baG23N8K78C87NDSc6f8MQGvk30kShjHRPhacsiN9Qu70yoHJ7s
         uHMbL5+YmcuudM6XHJKSnxpjWNtP6CcaEmNc7lIaLWDatYc4p8hJJ8qcscLfxvZFH5wZ
         +ZqWtYznpc/L8p0mec4HbVH+YsHthNPyyDHpVtgi0hXyxSBwujGWkT/gX2BOJU360hGv
         Kf+NBTB5Gm1FR3ArJ99s6RT27VpUs9vVch+r+ANgtv9p+d4vMf7gQAcwlROHGhMcs04w
         Bi8vKRur3hJQYMfxKaan0+Hc9IhKxK6ip1sFAXAr7+M9XzevWQ216kOgdrRlSkAD6vYL
         wSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519368; x=1775124168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=51TKOnys+1HryNBWI322Nip3SpDPN9G6txy9eqpfqVY=;
        b=BMP+fmaT4oV/9+IqjZwYtGlGLSHfb+iL6xpUnMV4gulO9jXz91NA9jkK4E7zrKfVO8
         IGkDHROYshgRtk16s1yuT6wTNT99ynjETP2T75KfFiw/juaOj9YLmi8UeFx02xP5L6fa
         ZLlsLsCmUvpF1LHAinDWOwgNRzl86l6kD2dpaa0JDzBqy1If16MvKZUt2Gr0TzYhAH2V
         FbziIVmz74RqnB2Llk8SaFvllGCg4TsOqoo36F2BS3HPMyb8zXtcalyzYdj+EJfioW+I
         FeJzeoEOg+62IDlQntaFNLQS3eBcUwRUSuclfbSIHvhXc5KzsSWxnkJVCSXHsHG1J+Zk
         ia1g==
X-Gm-Message-State: AOJu0Yz91YiQW+yXJHi7Bipz8DxQ/epbEC2tJJ2FFUXl9/s6CeVwU3SP
	HsU1QMvwmPWz9YyCWz20s68ioQV5Yb8PSuuCJZbMzGOK9c/9W1iFWdQVZ0i7T9q8NcpIKyxHPEQ
	05+o1IGs5VOdK8VGX4tWc2BsEboNZfW/KjCQ=
X-Gm-Gg: ATEYQzwXx5XyVv28QDeW6hFkwVfQ7rglmCf/gvQX2750XVfaSwge9x7N6d79B7/Hqgz
	PyuZc4/KNKcZmzdvbvKM8i3LbnQ7KA1K7CA7kKnu7oxSxvNUaK0ILKrWJMdWHN+Ry6o+FbTNLOp
	Febhl7WMQEmQp5/St19feuO6f+Tc20bOUxZnk8mgfARqjuIv/ahRNplqk/dA0+dHOJD51JqolR6
	2tE3xzj5TUpteot5BYUQcsyIqzP2x9XTGvVUGhDh04tUdFAWAFGUr/mQCE8hqLYU9BHF4bD1EqZ
	sFCqnkRKWOcZ9tkA
X-Received: by 2002:a17:903:1aad:b0:2b0:6f21:8289 with SMTP id
 d9443c01a7336-2b0b0a7f847mr75808305ad.25.1774519367715; Thu, 26 Mar 2026
 03:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324210909.45494-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20260324210909.45494-1-jihed.chaibi.dev@gmail.com>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Thu, 26 Mar 2026 11:02:35 +0100
X-Gm-Features: AQROBzB6d9D9TRytfOFJfddoWBSCbCcheY39uzXdCXIu6El9mFAk8sF517kutcI
Message-ID: <CANBuOYp6AB=xpOeAWimjb6mBoZAEw+fnXmYa9+VyA0vtjwtUuA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add
 rollback on failure
To: linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 10:09=E2=80=AFPM Jihed Chaibi
<jihed.chaibi.dev@gmail.com> wrote:
>
> ep93xx_i2s_enable() calls clk_prepare_enable() on three clocks in
> sequence (mclk, sclk, lrclk) without checking the return value of any
> of them. If an intermediate enable fails, the clocks that were already
> enabled are never rolled back, leaking them until the next disable cycle
> =E2=80=94 which may never come if the stream never started cleanly.
>
> Change ep93xx_i2s_enable() from void to int. Add error checking after
> each clk_prepare_enable() call and unwind already-enabled clocks on
> failure. Propagate the error through ep93xx_i2s_startup() and
> ep93xx_i2s_resume(), both of which already return int.
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---
>  sound/soc/cirrus/ep93xx-i2s.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
>
> diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.=
c
> index cca01c03f048..5dba741594fa 100644
> --- a/sound/soc/cirrus/ep93xx-i2s.c
> +++ b/sound/soc/cirrus/ep93xx-i2s.c
> @@ -91,16 +91,28 @@ static inline unsigned ep93xx_i2s_read_reg(struct ep9=
3xx_i2s_info *info,
>         return __raw_readl(info->regs + reg);
>  }
>
> -static void ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
> +static int ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
>  {
>         unsigned base_reg;
> +       int err;
>
>         if ((ep93xx_i2s_read_reg(info, EP93XX_I2S_TX0EN) & 0x1) =3D=3D 0 =
&&
>             (ep93xx_i2s_read_reg(info, EP93XX_I2S_RX0EN) & 0x1) =3D=3D 0)=
 {
>                 /* Enable clocks */
> -               clk_prepare_enable(info->mclk);
> -               clk_prepare_enable(info->sclk);
> -               clk_prepare_enable(info->lrclk);
> +               err =3D clk_prepare_enable(info->mclk);
> +               if (err)
> +                       return err;
> +               err =3D clk_prepare_enable(info->sclk);
> +               if (err) {
> +                       clk_disable_unprepare(info->mclk);
> +                       return err;
> +               }
> +               err =3D clk_prepare_enable(info->lrclk);
> +               if (err) {
> +                       clk_disable_unprepare(info->sclk);
> +                       clk_disable_unprepare(info->mclk);
> +                       return err;
> +               }
>
>                 /* Enable i2s */
>                 ep93xx_i2s_write_reg(info, EP93XX_I2S_GLCTRL, 1);
> @@ -119,6 +131,8 @@ static void ep93xx_i2s_enable(struct ep93xx_i2s_info =
*info, int stream)
>                 ep93xx_i2s_write_reg(info, EP93XX_I2S_TXCTRL,
>                                      EP93XX_I2S_TXCTRL_TXEMPTY_LVL |
>                                      EP93XX_I2S_TXCTRL_TXUFIE);
> +
> +       return 0;
>  }
>
>  static void ep93xx_i2s_disable(struct ep93xx_i2s_info *info, int stream)
> @@ -195,9 +209,7 @@ static int ep93xx_i2s_startup(struct snd_pcm_substrea=
m *substream,
>  {
>         struct ep93xx_i2s_info *info =3D snd_soc_dai_get_drvdata(dai);
>
> -       ep93xx_i2s_enable(info, substream->stream);
> -
> -       return 0;
> +       return ep93xx_i2s_enable(info, substream->stream);
>  }
>
>  static void ep93xx_i2s_shutdown(struct snd_pcm_substream *substream,
> @@ -373,14 +385,16 @@ static int ep93xx_i2s_suspend(struct snd_soc_compon=
ent *component)
>  static int ep93xx_i2s_resume(struct snd_soc_component *component)
>  {
>         struct ep93xx_i2s_info *info =3D snd_soc_component_get_drvdata(co=
mponent);
> +       int err;
>
>         if (!snd_soc_component_active(component))
>                 return 0;
>
> -       ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_PLAYBACK);
> -       ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_CAPTURE);
> +       err =3D ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_PLAYBACK);
> +       if (err)
> +               return err;
>
> -       return 0;
> +       return ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_CAPTURE);
>  }
>  #else
>  #define ep93xx_i2s_suspend     NULL
> --
> 2.47.3
>

Adding the missing Fixes tag:
Fixes: f4ff6b56bc8a ("ASoC: cirrus: i2s: Prepare clock before using it")
