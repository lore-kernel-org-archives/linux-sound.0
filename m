Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664C132572C
	for <linux-sound@vger.kernel.org>; Tue,  6 Jan 2026 07:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686308; cv=none; b=PjG01C4hb6EMPR6zAnILuv61ZpvNjb0wsumj/vRGr2DFqsGBGnV580Q7mdQPJZeM1FgOSbQhgNf6oLXjGAsLq8i+iGNaibQPBnay0TBaIlemtCaulBIwZB2YeTHzKb9zrfDtFdaN2/BBm8AgMIlkqnQRGnIrLA3H0en1UFwA3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686308; c=relaxed/simple;
	bh=MtkIYuoA74SG2oZ3h+Ie7HThkUa9MD0Zemt0Da+cK+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lp++nI9gih6QMvF0HYgeJPxsszDt9i4QfGFwXL1qd9g8bKlvrtmPncvlEq0W92aDjA7M8RW2Tt1+WqCF8pbeolT8BdnPwedcZEqqjlP3VMvnPVESXt72fNQpuYF/99Z2ywWtcuT3phZb4+o6JMyfqN47d+3bCCwi51RK5/OFbXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dqlj5Vnp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dqlj5Vnp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso908855b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 05 Jan 2026 23:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767686307; x=1768291107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLBza2X5HD47Z5qYWRdV/0voLmxJvN9RKBL9LmOat68=;
        b=Dqlj5Vnp0iSvTml9CsmhWTfwI9xsxMLGbdgzuIedeZdJHN2Az2aZchGsj+BbUHPmko
         KriSC/HeYad+c8vhHfrQsQtCuEyK0KVe9FUVPGqcOK68t6gVfoom2VaxMrDRMnCNQjQh
         hb9Y0q3Rx1+cKnlq6nLbaSWRBn4Utj1MmzqpN7b2s1tMMIPyaGQ4H3wOOo8AGpuiBq4T
         jws5W/56ZJdtpROsedgmN+nGKelqsIuMO561lcqfe5E1VbBWDnFuLQdeaUOqW02cJ1pQ
         26mti0uxWEbRId9HEG5oVj0mYtahpmm7Onl8QTekiu+GcSgiHQzf24Vvyy/TI/Su6h00
         Od5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686307; x=1768291107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLBza2X5HD47Z5qYWRdV/0voLmxJvN9RKBL9LmOat68=;
        b=YbwdBLs4OUo5bpmPU0ClC5iBNz/9Nxh2jDAcr+ffqOg8QOymW64YOwBzBPmx6i/Ili
         qEL8novYj0Rxz1GbjOSt77LK4JdyJ4VR7nwxuBmf2m2sbSWTOdVoUkKCRbwBbUIOIqkt
         Zlv21ypEUV/j5QMIMzbVO7IbkzLV9/M6fIhRc1wZNMFySKDRZrMtQ7YQC6fsNzARo/5z
         gbOvApgfBv5VZQYmhJKO+NpP5AMCDRQSFY0J9rNMqxpUW/h1Ip/lwZtTlxLnLukoszHv
         aibLOjYexL67t+uFbCbCdjtU2ElaVOwbk9IoI0yNaCaGJIHf2XPWaD+gvLWjfIpcLsz0
         gHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZGOBjqW+uuwTHkWY4cd/e92hKbhGVn4pCeXUxV4p22niOsmJh3rphvTDVrj7+TqDHJyJVukoDWyvdpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhxEbX+wDi5Wepu1INOzwYz+Lg6hMkhWqSzxUnHQd05vz9kPo
	CB/Unceky7VCLTO7MnoqRG9G4M1gCqPMxidGaCiSs7jPjnC1fy+312GItsbC09drLkRr4S5W+hi
	U9Gvg0EWPaoNUTxJwAY+IJ+ViGAwXB9Q=
X-Gm-Gg: AY/fxX5NhjOVChEspxFqqXnBCdrznR5AhPT5EqEaeh8L9bZDu4xTPUG6v7lO5CGG59X
	bK401UUUcbftq58f8/+G2L0Ev78J0tApWkCjnuQnExmrKLT/xQO6cZekZad9n5kAScIXMJfq1uj
	k1uodMgWl4Tj7SVFaStKUgrETMwxwzWuHXyJSyiuIp2lQsMZakB2RBoSIBhBWvv3MeR0MhPbIY2
	1YOYXvtZOc+QZd48TL20fl6Wljd3LFhjv+qN99kq8EEYpTmVSD2GkcYukmJLaHr5UHZVW4=
X-Google-Smtp-Source: AGHT+IEHlZyXdXcxR5RsluHTNejvpJpV18nZCBNr3m6Nqhf2aV0r3VQUhWRXd06ytprpu4gzIW1qts9QEpxINJHvE4c=
X-Received: by 2002:a05:6a20:7345:b0:366:1955:e965 with SMTP id
 adf61e73a8af0-38982240dedmr1889055637.5.1767686306654; Mon, 05 Jan 2026
 23:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229111839.4009517-1-shengjiu.wang@nxp.com> <20251229111839.4009517-3-shengjiu.wang@nxp.com>
In-Reply-To: <20251229111839.4009517-3-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 6 Jan 2026 15:58:14 +0800
X-Gm-Features: AQt7F2qmHeLdaE0xHM15dTnD0T7XxV2U60ncNvPLhWTQmD-57Nj_7ZRqCsdpot4
Message-ID: <CAA+D8ANu4i7BV-gCcXOAeUSgFd5-rULwfu36DOdeD=n9779LLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: simple-card-utils: Add support of
 "hp-pin-name-headphone" property
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: broonie@kernel.org, kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 7:23=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The 'Headphones Jack' name used in current simple-card and audio-graph
> card driver can't be recognized by user space service daemon like
> pulseaudio and pipewire, which only recognize the 'Headphone Jack',
> so add 'hp-pin-name-headphone' property for this case and it won't block
> original use cases for 'Headphones Jack'
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/generic/simple-card-utils.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/si=
mple-card-utils.c
> index bdc02e85b089..3d2194e23373 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -779,6 +779,24 @@ int simple_util_parse_pin_switches(struct snd_soc_ca=
rd *card,
>  }
>  EXPORT_SYMBOL_GPL(simple_util_parse_pin_switches);
>
> +static const char *simple_util_parse_hp_pin_name(struct snd_soc_card *ca=
rd,
> +                                                char *prefix, char *pin)
> +{
> +       struct device_node *node =3D card->dev->of_node;
> +       const char *str =3D NULL;
> +       char prop[128];
> +
> +       if (!prefix)
> +               prefix =3D "";
> +
> +       snprintf(prop, sizeof(prop), "%s%s", prefix, "hp-pin-name-headpho=
ne");
> +
> +       if (of_property_present(node, prop))
> +               str =3D "Headphone";
> +
> +       return pin ? pin : (str ? str : "Headphones");
> +}
> +
>  int simple_util_init_jack(struct snd_soc_card *card,
>                           struct simple_util_jack *sjack,
>                           int is_hp, char *prefix,
> @@ -787,7 +805,7 @@ int simple_util_init_jack(struct snd_soc_card *card,
>         struct device *dev =3D card->dev;
>         struct gpio_desc *desc;
>         char prop[128];
> -       char *pin_name;
> +       const char *pin_name;
>         char *gpio_name;
>         int mask;
>         int error;
> @@ -797,7 +815,7 @@ int simple_util_init_jack(struct snd_soc_card *card,
>
>         if (is_hp) {
>                 snprintf(prop, sizeof(prop), "%shp-det", prefix);
> -               pin_name        =3D pin ? pin : "Headphones";

If the DT binding is not a choice,  shall I change the "Headphones" to
"Headphone"
directly?  I don't know if this change will block any case?

    pin_name        =3D pin ? pin : "Headphone";

best regards
Shengjiu Wang

> +               pin_name =3D simple_util_parse_hp_pin_name(card, prefix, =
pin);
>                 gpio_name       =3D "Headphone detection";
>                 mask            =3D SND_JACK_HEADPHONE;
>         } else {
> --
> 2.34.1
>
>
