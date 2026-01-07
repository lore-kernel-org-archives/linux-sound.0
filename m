Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303B30EF8C
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781340; cv=none; b=LcZZXYsRHlTOCqLZKk7gJg1wEOHApmSQ0FjSk7gE7nqPZfJeElkJcMLlKOc6CXZ8KNw+amD1gaHbNJTuX8q/8JfSZJQTOfFnYMaIFDBZy9fVjfdl7VrqRsRbclyp/SfVfUCG3r3jvWZeE1Vz64kt779Ul2vr9uOmeGRndhC3AEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781340; c=relaxed/simple;
	bh=BkpA/OzD9D0VCi/zbU5mgHTiBbjnsNx3d9Kgii1mUy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZ/FBJ2YfCTYk1Ex6H70Vvcnyy+IE5BuJ1cssbXwQu3kvlO7ExOXpE4g+rv9+a9N3AOLghgmqWHWq2ICInN6eUUs/HLFvkS90kKvXlYMQvV7M8W4XtCohaQ+IHXGBdJp7Ow3eIEGZjD840PbVJxD+amdYf9wvQ3S8pvf82pZmng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=R77OcVEn; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="R77OcVEn"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id E4E81BDAB8
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 12:22:14 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 01DC4BCF22
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 12:22:14 +0200 (EET)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id A72AC2024C6
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 12:22:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767781333;
	bh=xqkCIBQR16HFOwIVLf3IWnAkQKwjViGtibBmuGOH/0E=;
	h=Received:From:Subject:To;
	b=R77OcVEn8joD/PhwxI+xtfZhqhNIHcYc7x8YDQcO2yRYqH1G3TFFYZkzdKJhuYhps
	 QL2OahJUWXyK+GWM99R3bWmB3WOzHoo8eEhEyZ4dfMeRlULNoQPn2hyD27WaeuDpHq
	 G1W7KfC4AnwpowbpCkuJqrzBO2p8BGmURhFizS5t/veQtc5Fg85qk0cpSZiz8kjUyg
	 /Arxxt5ixMjVnztGvY9yiUo9L9yc8TRiEEmgsMa/0wp7pg/8V95SmK4atobcrPrfqx
	 RiCcdSOSh6lrZutIhO0V41Q2VvKuGqp53m+D1m9hczSFva00Pcx5jr4qFJeZL5N0PK
	 yp/s3FGwCjzIg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-383022729d5so3289531fa.2
        for <linux-sound@vger.kernel.org>;
 Wed, 07 Jan 2026 02:22:11 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCURejUnzXvBl9hi+8NM1HpmkAv401C4lu0aY5EzXf24CuiND7e99RKoGJA/bAZ0wYTlwtHEq2GEbxtMWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGhmczwxSw1UjJolRb4kEEDFdR9pAgWiif5WJsrqCUss3crMr
	3GwYNQ+L3zB16DkX+rG9S20qIQF+ju4FdQSxvBl5yYJdd1MZxBMOsjL8UM+yI2jlZ/oWTla5CE3
	7iMddw6VFHfysZdxFG9MiSUQY0cfpFJo=
X-Google-Smtp-Source: 
 AGHT+IF8DLOxnKbQzmitiIWV97qxsU0xr0k+ozEjB5U5HowFcjXF37iSDZs4oIeQjkxzSHqp6ZXHCAhZmCncFvD36wc=
X-Received: by 2002:a05:651c:988:b0:37b:b952:5f2 with SMTP id
 38308e7fff4ca-382ff697e5bmr4883831fa.13.1767781330886; Wed, 07 Jan 2026
 02:22:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <862C1A43-9C43-404F-A940-920FCD7D1919@linux.dev>
In-Reply-To: <862C1A43-9C43-404F-A940-920FCD7D1919@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 7 Jan 2026 12:21:58 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGXCe-nDi7moPvPH++_Bz687Ksffe1GU37qcTxR2ygx+g@mail.gmail.com>
X-Gm-Features: AQt7F2pPk5MsoWgQecUn7i4Xq1RADLMJmWfJo4eXbZyeZO4krd54AEZH7yhMZp0
Message-ID: 
 <CAGwozwGXCe-nDi7moPvPH++_Bz687Ksffe1GU37qcTxR2ygx+g@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 tiwai@suse.de,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176778133256.841083.13057574056307377063@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 7 Jan 2026 at 12:17, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
>
>
> > On Jan 7, 2026, at 1:32=E2=80=AFAM, Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:
> >
> > =EF=BB=BFThe V2 UEFI spec for per-device calibration data in TAS allows=
 for
> > manufacturers to specify up to five custom calibration register
> > addresses and values to optimize per-device in factory.
> >
> > A basic description of the spec is found in a comment in function
> > tas2781_apply_calib(). However, currently, for the condition of
> > p->dspbin_typ !=3D TASDEV_BASIC, if custom calibration addresses have b=
een
> > provided by the manufacturer, they are ignored and the ones listed in
> > firmware are used.
> >
> > In case the manufacturer chose to change different registers other than
> > the default ones (r0, invr0, r0_low, pow, tlimit), this causes the
> > UEFI calibration data to scratch different registers and cause the
> > firmware to misbehave. This is true in the Xbox ROG Ally X, for one of
> > the firmwares, where it pops and has audio dropouts after the
> > calibration data is applied.
> >
> > Therefore, add a new bool to indicate that UEFI supplied custom
> > calibration addresses, and if so, use them regardless of dspbin_typ.
> >
> > Link: https://lore.kernel.org/all/CAGwozwFQKoQgo_Q=3Dqdr-FTD+uoVWA8AtHy=
DmKwTOV4ZU6+F3SQ@mail.gmail.com/
> > Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> > Closes: https://lore.kernel.org/all/0ba100d0-9b6f-4a3b-bffa-61abe1b46cd=
5@linux.dev/
> > Co-developed-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> > Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >
> > ---
> > @Matt: can you kindly verify this patch works for you?
>
> I=E2=80=99ll have time to debug it more in the morning but the patch does=
 not work, it=E2=80=99s still using the same calibrated data as before with=
 dropouts.

If you can check that the register addresses changed that would be
great. Especially that we enter and exit the calibration block.
Perhaps that was happening before as well and the addresses were
overwritten by firmware later

Antheas

> >
> > Then verify your sign-off for the coby tag. If you would rather a
> > different acknowledgment tag (e.g., tested-by or suggested-by), lmk
> >
> > Thanks.
> > Antheas
> > ---
> > sound/hda/codecs/side-codecs/tas2781_hda.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/cod=
ecs/side-codecs/tas2781_hda.c
> > index 96e6d82dc69e..6efdf0a3442b 100644
> > --- a/sound/hda/codecs/side-codecs/tas2781_hda.c
> > +++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
> > @@ -64,6 +64,7 @@ static void tas2781_apply_calib(struct tasdevice_priv=
 *p)
> >       TASDEVICE_REG(0, 0x18, 0x7c),
> >   };
> >   unsigned int crc, oft, node_num;
> > +    bool custom_addr =3D false;
> >   unsigned char *buf;
> >   int i, j, k, l;
> >
> > @@ -104,6 +105,7 @@ static void tas2781_apply_calib(struct tasdevice_pr=
iv *p)
> >       for (j =3D 0, k =3D 0; j < node_num; j++) {
> >           oft =3D j * 6 + 3;
> >           if (tmp_val[oft] =3D=3D TASDEV_UEFI_CALI_REG_ADDR_FLG) {
> > +                custom_addr =3D true;
> >               for (i =3D 0; i < TASDEV_CALIB_N; i++) {
> >                   buf =3D &data[(oft + i + 1) * 4];
> >                   cali_reg[i] =3D TASDEVICE_REG(buf[1],
> > @@ -151,7 +153,7 @@ static void tas2781_apply_calib(struct tasdevice_pr=
iv *p)
> >       }
> >   }
> >
> > -    if (p->dspbin_typ =3D=3D TASDEV_BASIC) {
> > +    if (custom_addr || p->dspbin_typ =3D=3D TASDEV_BASIC) {
> >       r->r0_reg =3D cali_reg[0];
> >       r->invr0_reg =3D cali_reg[1];
> >       r->r0_low_reg =3D cali_reg[2];
> >
> > base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> > --
> > 2.52.0
>

