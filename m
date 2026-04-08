Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A457319857
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683210; cv=pass; b=IgLxo5zYA0Sa8RZHXBrmIDM/fQU28zgs34kwiXrpHwo8prwAiCvpy7wUG29pIPlH002ifSyeC6OZkIkK2iVcCThTzWF61WKp0x7x16rDkYwy53E3cc007ZuJwh4+LQRkuu/godgomE+o+4CmKme60EP9c5QZ6Foe+oPYRQP+D84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683210; c=relaxed/simple;
	bh=w6HuGbAt29hunfsVixF+Oz6nMbU+6+kA8Wt8FyAQRNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHNUT+qlYx8AnYfJU86fgfk9wBXadTjZz9bOlA5WcgXCa7L5l113yya6OF1fuLi/K3WjTMMtqpNA3JakOK9RX162qvfuLsvAKGbXuPBTqo1jt0R2MhxzeDyBvyoSVfJ2f1xI+KeElT3v7ZJasg9htRaX610hsgfWQKtRcuqmx1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8KQW8Bm; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8KQW8Bm"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so205104e87.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 14:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775683207; cv=none;
        d=google.com; s=arc-20240605;
        b=jm635U8ZVBdKt9jS5PVuedJC882iK5T3I8IfZvHHjgBoghN0Ya8VPdnabWteSjqUBv
         mpt4F8L4esfx3EeLgwVr7O5YVxqP3izaIRR51Ff6BR22Lhux4Ns68963Jblfd1yiHOY2
         RHZlRdHqlDlIkiN5csDhCIukRRCeBOuzWH400w8A5cfKtrt8x9NF3HKC9lTpd5yW5Fjn
         qb6Khz83oZ6yopXeQnXC2Z0/F+rQACCDIk2bT9t6Hr2pSoehbVem6V+VjSFzrc2O52nR
         lqtRAf0emNe1clR6TUOBDBT4KKgRKjhrOoMrVEGN5doTUr22ydJKugiQibifZ2WqXiq9
         VDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EMCMLECo02eXBhSDMm1eRN49LeGDrS1E5IJtLpRBGmI=;
        fh=pCRJgwN1U24Mc2KaZs+W4rtnt0NOdiRHtB1iuUjAmbk=;
        b=iN4trHIce68TNAPrkeIFk9aNJu3JKxSubVnu93UcLr/sp//UsjD8A4hoa/SGxDUIoW
         wPVzw1m1AjsQOPXt5a/oD3lvm8WjA0R4u0g4U7/KwoLkqzFIA4jmUNAfBnR6nlqC3m/R
         xRfTTcxdEOgqfSwaLKhVufGlw16S8wPLUgoh27aAUe+zK3S9DW/DnrdjY0X4lqIPfNs1
         flv8Kg4XM1Zml6rlJlTNka/ZkucHGYNO+NIDe6rVZRYi0s7kbIhgBeTi4KTdElTMXjHH
         wbHa69nIPoJX5kvsavRZzlmbYLPug/sJ+kW7eucgR5BNOo+P33C6K5VsMnDnr1NgYmZi
         J+nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775683207; x=1776288007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMCMLECo02eXBhSDMm1eRN49LeGDrS1E5IJtLpRBGmI=;
        b=F8KQW8Bmb+MA6qkyODQLh88/V+GlS6du8nqcNK0ASAtXN7yk703km0+VX0zuqqRPgq
         9pZprFTZxJdpbZayjTOwMqoqICtQ2iEs8Kzr5tloju6knt70LvX+E312hZVoDjGLfrLG
         Cy8Kjn3anaSUyDbElFtmGMlIcemT+dK6BZ2hWLQV+sm7tevlcwyHfLLvhVbeWb1MSDs6
         mxFqmRPDSkB05JPwUkYUpdaem1w4Uy4d7DIhEwLAJDN6/boGCPf94UbIMrixm5vObQfz
         SmrORHqWgQ8tGFEaVcdy2QM2WS2sILWS04pytik1YJo0NtKTgZkTd5I6SFG1/KYnSVnf
         w7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775683207; x=1776288007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EMCMLECo02eXBhSDMm1eRN49LeGDrS1E5IJtLpRBGmI=;
        b=fXBkA/BogOmwLoAHnUdpHbgDGbpbe7ZRdRtX6zuigtTOqTweiWzLVoZ5eQYvgGfWEI
         TDTkX6bIlSIJtS81xyje+8Uz6imML1+/v7R0jUAnHkxhghTKGnGLgN+ntptKXDkr4Ccz
         r4K/HMJ+r35bPa+PxEV3QL/rS3ZM1bzb91COl2rbrnH4Sj15O9GI0w4V1nc6rw+qH1La
         v0tirUi4dYU+H6j+nQw/40CJjK+jkZcEfNqnlBhDOkg1jGcBzoFqwDCQEgOqF6CsVMQJ
         /TQbafexlv2WqKxju5Zq24N1c6Tb3D+qsTWpzN/2WW/YpnxSuQqVVpXJizWSohr70whX
         yjig==
X-Forwarded-Encrypted: i=1; AJvYcCUiQrEk5NZr0iOGH99wxyn4qFB/1rXh+0F+c7KUM+cbEaGYKlN/uR9B868UNOllZh70m9qg9GjAkN1QdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN/jK+uvCsu+PMNROda1EJqmJynuceiQVC4UaKxzW02GBs+Bc3
	UBdab2WZY8LoK5yp4ybhdIo2XvcnL7UTjmNwDLFUsUzqXIcd/NIIclIkxFsWGm5hAf/4nUql/1z
	dTdXmLIPV24pbChBA94tyapdx7B1g/eQ=
X-Gm-Gg: AeBDiesDpX6sMSAMw9Do0nJyKkOwCyMU5Okb5KwevbDfvXSmfB5vkfS+QoAdpP4YEml
	sWzS/iq6kL7dm/Nhr4lrUwSMI7om8yUJNiWJoJN2dftMls6AnQniCoqrMUvzbbLum1Zzh29a9hI
	Qb8fUGCj/NVJaCal3ckI45jN7riUqGUdUFAgrQu4BfgAnsBIXynDBLXUd614nE8eUKkrromtugZ
	NPl3mszSEqGA7feI4evNvKLsH4JYT6frICzv4yhp3O6VcP9NP+s6Qf1nRuth5rkNG8dCtDNtyvh
	z2ADAqa79V3ZYF8jrpWGMTHx/CGw7XNkY2Fsqw0=
X-Received: by 2002:a05:6512:3e0e:b0:5a3:c690:b4a6 with SMTP id
 2adb3069b0e04-5a3e7a16b15mr368920e87.7.1775683207122; Wed, 08 Apr 2026
 14:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com> <20260408170818.70322-2-piyushpatle228@gmail.com>
 <f837da45-2b31-4788-a957-085d3f0570d0@nvidia.com>
In-Reply-To: <f837da45-2b31-4788-a957-085d3f0570d0@nvidia.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Thu, 9 Apr 2026 02:49:26 +0530
X-Gm-Features: AQROBzBUy-it-vv-kjO6ebLVhc04dn2olvWf_81zN6zTyAHrTx2NmaM7LrDNOQo
Message-ID: <CAMB+xkaQAaJSZ6nJ_LN9zyRHxFAEMoydbb-BZc3t1qfr71Sd4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: tegra210_adx: simplify byte map get/put logic
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Sheetal <sheetal@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 11:09=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 08/04/2026 18:08, Piyush Patle wrote:
> > The byte-map controls ("Byte Map N") already expose a value range of
> > [0, 256] to userspace via SOC_SINGLE_EXT(), where 256 is the
> > "disabled" sentinel. The driver stored this state as a byte-packed
> > u32 map[] array plus a separate byte_mask[] bitmap tracking which
> > slots were enabled, because 256 does not fit in a byte. As a result
> > get_byte_map() had to consult byte_mask[] to decide whether to
> > report the stored byte or 256, and put_byte_map() had to keep the
> > two arrays in sync on every write.
> >
> > Store each slot as a u16 holding the control value directly
> > (0..255 enabled, 256 disabled). This is the native representation
> > for what userspace already sees, so get_byte_map() becomes a direct
> > return and put_byte_map() becomes a compare-and-store. The
> > hardware-facing packed RAM word and the IN_BYTE_EN mask are now
> > derived on the fly inside tegra210_adx_write_map_ram() from the
> > slot array, which is the only place that needs to know about the
> > hardware layout.
> >
> > The byte_mask scratch buffer is allocated dynamically using
> > kcalloc() based on soc_data->byte_mask_size, removing dependency
> > on SoC-specific constants. The byte_mask field is dropped from
> > struct tegra210_adx.
>
> So this was already the case. However ...
>
>
> > -static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
> > +static int tegra210_adx_write_map_ram(struct tegra210_adx *adx)
> >   {
> > +     const unsigned int bits_per_mask =3D BITS_PER_TYPE(*adx->map) * B=
ITS_PER_BYTE;
> > +     unsigned int *byte_mask;
> >       int i;
> >
> > +     byte_mask =3D kcalloc(adx->soc_data->byte_mask_size, sizeof(*byte=
_mask),
> > +                         GFP_KERNEL);
> > +     if (!byte_mask)
> > +             return -ENOMEM;
> > +
>
> Now you are allocating this everytime this function is called (which
> happens on RPM resume) instead of ...

You're right, I was wrong here. I read Sheetal's v1comment as
"allocate it dynamically" and over-corrected by moving the
allocation into write_map_ram() itself.

>
> > @@ -700,16 +706,15 @@ static int tegra210_adx_platform_probe(struct pla=
tform_device *pdev)
> >
> >       regcache_cache_only(adx->regmap, true);
> >
> > -     adx->map =3D devm_kzalloc(dev, soc_data->ram_depth * sizeof(*adx-=
>map),
> > -                             GFP_KERNEL);
> > +     adx->map =3D devm_kcalloc(dev,
> > +                             soc_data->ram_depth * TEGRA_ADX_SLOTS_PER=
_WORD,
> > +                             sizeof(*adx->map), GFP_KERNEL);
> >       if (!adx->map)
> >               return -ENOMEM;
> >
> > -     adx->byte_mask =3D devm_kzalloc(dev,
> > -                                   soc_data->byte_mask_size * sizeof(*=
adx->byte_mask),
> > -                                   GFP_KERNEL);
> > -     if (!adx->byte_mask)
> > -             return -ENOMEM;
>
> ... here in the probe function, which makes more sense. IOW I am not
> sure why you have changed this.
>
>
The intent was only to drop the dependency on
the SoC-specific TEGRA264_*_BYTE_MASK_COUNT
constant; the lifetime should still be probe-scoped

For v3 I'll keep byte_mask as a member of struct tegra210_adx and
allocate it once in probe() with:

  adx->byte_mask =3D devm_kcalloc(dev, soc_data->byte_mask_size,
                               sizeof(*adx->byte_mask),
                               GFP_KERNEL);

That keeps Sheetal's "no chip-specific constant" requirement (size
is still soc_data->byte_mask_size) while avoiding the per-RPM-resume
allocation.
I think that would be better, Right?

Same change in tegra210_amx.c.
