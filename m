Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802742BFC8F
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 17:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767374584; cv=none; b=mK4U/p1joe/CGWtf8iw+emCVo1R/Y3vHRiN6G9zU9IJBg7FAFSTwOyeQtsXmDuiRRPT9IwRWJhDWQhLJNu/AmeJGfErtpANMijhHTef3ynNFqZANUgOMjqRe07ZwEsWeVr2eqOuwjGS1ghBbLx/SnLa5yw7oxC7Ft+f/ypfX9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767374584; c=relaxed/simple;
	bh=h4D5HBc5WuhiUpsO+UED6vLZNUMj4d0INbUPfiV1Eiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGzeQlEVCO1uxjLhDrb5tmy8hJm9emTltRlY2deSv3K+M2KNACX7DtrrNQU9D3VQYPIUkI9Ph72pKmQTQr8WU3kTicAwSPwygVz7rCjTCwaKnrrGC9mxXduU3WO/tABrYBI/EOWwl08ujsy2Yyi96m24g/2QFIHc7G5vu9OR8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ZR8ISSNk; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ZR8ISSNk"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 79AD4BDAA8
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 19:13:10 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id D84C9BDA23
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 19:13:09 +0200 (EET)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 5F50F200AF3
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 19:13:09 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767373989;
	bh=2trmHDSDyTnZver3StwnXqe0LuBQfLJSeKl5Q3YD/H0=;
	h=Received:From:Subject:To;
	b=ZR8ISSNkopitkJLxKGv1fEpAeAlW70y16xQUvvS1BqVUiJbRqR+82Yi992AE6pMRS
	 c7TDxxhZLuooUwFcPv2/kTrLfPGXweRewAhRAEX2yupLXkiU/2RRsXmJvAJqCfyb2b
	 DL9YmvGjvtkZadvQBYKgwycu/i4t+EGbTDjtrcUVp0UnyknFnGU6eukoQybbG+4okz
	 KPgXmw2FHg7hMCqC58ak7KxCssMAP7h6sN/PvVz6AkN1t8TQeT71LA4fjYLC8KxhwN
	 4gXMW9DMMxxAU5WK3snj7cGxaybzqazz1syqPhW6opdoWBh23RfivFE+6ycK2E5S5z
	 Wq55az5WOK2lA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f174.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-37a3d86b773so96560951fa.0
        for <linux-sound@vger.kernel.org>;
 Fri, 02 Jan 2026 09:13:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCURX9tg8cyDPWnhIsFbsBcwLjugi7KLo2Jk1dKWYAQeqmDq6PM0GWuABuFaYDpwL+jTQ3ydBaYRXoYyDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfNrGRVr5LunYYuJNpztEYrOB3mgsi8Hs11DlBsF2SvGODdjqk
	54NnFPGVRmAHA86Syz1vD6sI9gQpv7MR/aJY89NW/YeTvLdOJoOfis22BGB/ZAleuDGXH7jdn1e
	eUlaheKZCYI76qL+OzJ4wiAeVXVTVnFY=
X-Google-Smtp-Source: 
 AGHT+IF+kPyBBN24VPv3yVM6zVbrpdXcBUsjBHH2sTxN20vEO0gsL+v08qSbTRB/xURKo3/lMDsFBFVwI0Js7IYeRQY=
X-Received: by 2002:a05:651c:1614:b0:37e:644a:49ad with SMTP id
 38308e7fff4ca-3812169239bmr148388731fa.29.1767373988837; Fri, 02 Jan 2026
 09:13:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
 <2d8b782c-a97c-4521-9307-a2cf8934802a@linux.dev>
 <288f6482-9a6b-4362-ac97-18043659deb7@linux.dev>
 <09148B42-71C2-4428-8D21-903F85853091@linux.dev>
In-Reply-To: <09148B42-71C2-4428-8D21-903F85853091@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 2 Jan 2026 19:12:57 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEJRDq96ZUQv+8H5fiXBVQ2jFvvuK48WpDqZ0eQ_NB+NA@mail.gmail.com>
X-Gm-Features: AQt7F2p71BFoeOn03E2tHEKv4TN1D_3sDLkErKgeSVpZqrE8Ju1lnxxok8Mb7io
Message-ID: 
 <CAGwozwEJRDq96ZUQv+8H5fiXBVQ2jFvvuK48WpDqZ0eQ_NB+NA@mail.gmail.com>
Subject: Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>,
 linux-sound@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176737398960.236310.14328617387142707681@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 30 Dec 2025 at 22:44, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
>
>
> > On Dec 8, 2025, at 8:00=E2=80=AFPM, Matthew Schwartz <matthew.schwartz@=
linux.dev> wrote:
> >
>- snip
> > 2.52.0
>
> After reading the TI E2E forums, it seems these calibration tuning config=
urations are only meant to be used during a calibration process.

A source would be good here, a link or two

> Instead, something else I found that works is not overriding the firmware=
 file calibration data with the UEFI calibration data:

I did not look into the source code, do you have any reference in the
ACPI TAS code that r0_buf is prefilled with UEFI data?

It could be that there is a specific priority, where UEFI data is
supposed to be loaded after the firmware code, replacing the
calibration data from the file, or that is what is done in Windows.
But here it is done the other way. In that case, it might be more
appropriate to set a dummy var such as bool uefi_calib that becomes 1
when loading calibration from UEFI, and skip loading from the fw file
if available.

But links, etc. Here, this would affect all TAS devices too, so it is
more major.

Happy new year,
Antheas

> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781=
-fmwlib.c
> index 78fd0a5dc6f2..1e768e6187da 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -2377,6 +2377,7 @@ static void tasdev_load_calibrated_data(struct tasd=
evice_priv *priv, int i)
>         unsigned char *data =3D cali_data->data;
>         struct tasdevice_calibration *cal;
>         int k =3D i * (cali_data->cali_dat_sz_per_dev + 1);
> +       unsigned char r0_buf[4];
>         int rc;
>
>         /* Load the calibrated data from cal bin file */
> @@ -2389,6 +2390,20 @@ static void tasdev_load_calibrated_data(struct tas=
device_priv *priv, int i)
>         }
>         if (!priv->is_user_space_calidata)
>                 return;
> +
> +       /*
> +        * Check if the DSP config already set the calibration registers.
> +        * Some tuning configs contain their own calibration data which s=
hould
> +        * not be overwritten by user space calibration data.
> +        */
> +       rc =3D tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_buf, 4);
> +       if (rc >=3D 0 && (r0_buf[0] | r0_buf[1] | r0_buf[2] | r0_buf[3]))=
 {
> +               dev_dbg(priv->dev,
> +                       "%s: dev %d r0_reg already set by config, skippin=
g calibration\n",
> +                       __func__, i);
> +               return;
> +       }
> +
>         /* load calibrated data from user space */
>         if (data[k] !=3D i) {
>                 dev_err(priv->dev, "%s: no cal-data for dev %d from usr-s=
pc\n",
>
> Is this more suitable to be upstreamed?
>
> Thanks,
> Matt
> <snip>
>

