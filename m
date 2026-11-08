Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794171695;
	b=Re3OhsMB6wAZeqHUVnAEy046pUCpR1RM47GswVdm7VH9/8NxxLHJQvz23mrbpdrXEXkm
	 fzZt+s0dOfiiklGsusvzWXvrtz+hy7XZsXMG2Gfuzt3IzALmduIYy55RLcVfB7llpqXhN
	 G2IdNYYU4QXfuAraGTa/Cp7wGbd+gE4AQCHImZ7pjx5x8uA7P7obmd2lwR2TBsA+uW1kk
	 36ppO1/r+2LpEUOabOTmdCldDU83yr34Ipp2bzL5BLq84+9W9m/c9p2xoLZmmMPgref8c
	 kHfFBksBkXxmlysm6Tt6MRhUbLwpqe8XqFqU9E+KZvu1aqUA8lQ/JQu86X8qWjO9OMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
	b=fteuaMCfYEM8fBgujAUxE4OCXMu82Ly9x43KqWKAS1pckRZa9sxCnhwsr4JmKVI6vrfr
	 pxNLYUDLxgDiWYJhVUL/enIClE4I677bRmPmOzm3XwVUUOpxMU410OZllYjeK1dWpLyhs
	 Gwa6FbxiHiQpz9d+BD6XKogrjoycbReOXmG+ScDwz7aQXQHbsBkWgMzmjNgUrukFIfyWo
	 KKg5pg5LbdlRsxBy1MPX42qJroIl5tR2wzdx4YjJ+72ZD7VEyJ7eybBiCCFLaEC4ezOtq
	 WAvuMx/dAQ/32jqqT6I9gnjsnBscBKigIz+6rkRBPQV8jDOPW75tLEIi92TWJ9+SvBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DnxrZtao;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DE0606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 21:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DnxrZtao
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677d35fd1d2so304314d50.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 13:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794171694; cv=none;
        d=google.com; s=arc-20260327;
        b=rpzq+exXC8FVxmV91qYfbC7zcOdS7u7j5IYQwU7gvmX1gokFmUBun9MMAP88uanW7a
         vmGYFja/SeUgKenpQYYVuaIjzdZV3PELdR+Wo+ay+rvAyUlvIStJq1KypvBuNZJCJTs4
         LZtplDaYaIZyIHNrVBkmZhHinnyeaYm+gpbng4i7i2IgQxhD5gxbwFx/tcAvwJ55T8s3
         E4Nt4jVSE7ZeqLC8qFJ6TGaItstIk4Q0IncPw3cf7eIXC6/9J7e6U5uuEVnLWe8Q53y3
         ukT22sxp3Eg93juBC1BExBtSW+PfndwPeAj1VdSpG9xr614Tx7Ijht94cfq3B77my7fS
         gcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        fh=BHlnTLvPz3he7lzu62YZEWAACBRmVLdXLJDE+8jMadI=;
        b=QnXThWw7a6KyWfOSdaL+21RnWWwaIwOEf+NRGEjDktG4aH/QkYRy+KXlAAi5TFfQAJ
         zg/hNNF/PDCiV1ajE8dZ1uTTSXbhQ23+60SfpqqId0QwV7u2bxTmfjKiEc0rNc0YRX/r
         cHGB1A1h6iSBHgDKziP01of/CAORZ7kDiAYI+fl9o+Ed60U1p+4iPrnoTnBURdwGUTsY
         oWyMIUIjMV5hCMMTU0Zg+m03M7YSKNGaCJHGQANwQ03/T0260X9O07AfD0rPCqsvar0k
         HGx0tlwnSwh0hp8GU/vCzFv6PIkEXJ+uTgxs72cxR7+Y4YhVpFG11sRPqiLXIqvWqlNP
         GJMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794171694; x=1794776494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        b=DnxrZtaohsc6hDRPtZaWNGrtpROGG4QnoYOZoG075Wtkuc+8j6uhGZD4yGo/FKHU6Q
         e8sfH4d3akjBUE9fh5YEbbLbROcF5pjYWOJxoABwHlg8ZV0ctaDuLDjiei0JqmLuqkDA
         SaihU3BHyyJT7sB3JDhddYBUoagjCXxvWjQiauKX+yop6iejFEx3d5S1TRSatdxurArV
         S6/2NEPsYJzuoqFlq9B0ViBhxfWy9CSZV8NzEwtE4bDW1eGN+FI65nS+6+aISPkgxyLG
         NPiHSIv4+gEuIWPkrhSc89BQAkb2FAmizsbLLiE5ofMG76SBFtuAH9/PkgCgy6gEswYw
         +Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171694; x=1794776494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjWQ9SIkuGbMHe9AutqeADfZ8JpsqaOjJ5BHz57lk2o=;
        b=gGzjbU8AnzkA/8Q8HTSFfNGFTGnGRTTWy8MSC0IVeRkAlwQ6Jaqfs4SvDWl3w0Qj6g
         CP1Mk2phpjVtVX/ZYXOYgLohkI9R35J4YS5cTHB/+/UIuokRBxA0danOjk62vkZ77VCB
         ssWs43VC6JkNnF4JA+WV0XpaOVj6xbeKRuIdutj5puPZwiQMMehzbsMHNRrhe7IAlZp/
         4dujvqy7PQB5jdjoyCsOgV886JajLM2x5bpzTVCQ7OYCMlSCyzwsULd/uEZFqiD+IMKg
         GvrbYNNfdH1FaOQ8H88Bd8cjcVFbr/9vowHhBcTQM3ESRlb5wbebXyD+ciU/FFOnOBMA
         APmw==
X-Forwarded-Encrypted: i=1; AL+hErEqxBB4qa0aZptwqD1fG7JrGJ4pq6AoiTpQyAjTMR3FEIahdhf0sCF2rDhILuxORULEzAam4Fub+cC+Ow==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MMxOanEfM8iwl0npp+3fDSO31pfnfZl+g4B4e30veXUDf/xIB
	CEUCT23jy6Id0xyQeZBOUcAuK4NDXoUTD/05G74LX2JNLMS+3+Hi1S4Z9w9hcgDSgqfv5XpyO5F
	+5m0017bzsIKVOgIMUYpWuAudo0z+3es=
X-Gm-Gg: AYBFou2Gd3dCsk/VdM1semZzDNUPs1z85kJd2qcFuwYGTC9EN4FTOhbMJWYAdxrmMht
	hcjzw4qY37vxuONXdcGXQBjag5poSmYmR+NRx4rNtoV8WjUzW7nCvr/OJED29bD/QXAQKfHQCsZ
	gfctm4kmHv9VmKdUpKrr744Bwqo4LkudnWwUb/iiObmrobyC0xYJGHwOFNMQsL5wq7pXjb4G0hh
	UHBI/G29ssogOBD8B23dWRhiMcYdxrMB+1WCzf6w66brhAib9buYgKE+Rqi8CjTJ+35LODhTWdT
	78OzTxCrIfe18dvlY27oVRLnxK8/E6Sy+1NWtGLz0s05/vA9DfgBJei4Aw9w6LeLpdHYGEIdp00
	mwBSDypu7JPfpIuS2xNsDFqqmfeEmQ5uhaXcHZ4S2YScWvMgeudjrbusEgM0v1Rakp0QdfGbcRB
	qVWwh22qEhiqdcSQ0=
X-Received: by 2002:a05:690e:4386:b0:67a:3678:e323 with SMTP id
 956f58d0204a3-67c3d9d34aamr703099d50.38.1794171693858; Sun, 08 Nov 2026
 13:01:33 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
In-Reply-To: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:01:23 +0100
X-Gm-Features: AclHuK-YI1_ZLeM-O06Jf1zbjFaiV_faZLy9KmuFTZNRq2F63vw1avnq47JKnuI
Message-ID: <CAFBinCCV+rBnfSzY6LWfCU_D=BHmWi8CoZE0aza5BhvWXw3-8Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valerio,

On Wed, Oct 21, 2026 at 11:52=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> @@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *fo=
rmatter)
>         if (!ts)
>                 return;
>
> -       mutex_lock(&ts->lock);
> +       spin_lock_irq(&ts->lock);
>         list_del(&formatter->list);
> -       mutex_unlock(&ts->lock);
> +       spin_unlock_irq(&ts->lock);
>
>         gx_formatter_disable(formatter);
The documentation below states that ->ops->disable is called with the lock =
held.
gx_stream_stop() does call it with the locks held but
gx_formatter_detach here doesn't.

It doesn't seem to be problematic yet because aiu-formatter-i2s.c
doesn't register a ->disable callback.
Can you please still look into whether this is a problem?

Also for a future patch (not this bugfix anymore) it would be great to
have lockdep_assert_held validate that the lock has been taken (inside
->enable, ->disable and ->prepare).

[...]
>  struct gx_formatter_ops {
>         struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
> +       /*
> +        * Following functions are called with gx_stream->lock held and l=
ocal
> +        * IRQs disabled so they must not sleep.
> +        */
>         void (*enable)(struct regmap *map);
>         void (*disable)(struct regmap *map);
>         int (*prepare)(struct regmap *map,


Thank you and best regards,
Martin
