Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAF71E515
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772774191; cv=pass; b=F3rKeX/lof5Oyp5wA+vU37rQw2Mcej9w5xtDVlk9nq19jz8zkZJrYDn4jITiy8hu9bHNYpil3wuxR/rY/qMUUjd1NLtDzuVAFYRk7GwHSrHT0dUzEuEXXvuU6RD98gMv2ZLOWRxFlnP1YMVDeSKNuM0qcEt++RJYd6OK2scaxMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772774191; c=relaxed/simple;
	bh=QLUZpExQERon0epG3/N01nmOarXKiuhNsoSQpzUJOFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPbDbUdRMbB+sxmcLAl6OvDtD0Q2pfnT8VUnPtJnXB6bFqkcvAI/gfDQhvivHOgN6QViRXgOc5wysgLe63KVhYoucFAkg88iQSaeg4/FCkvfhzIiXOZk875+HuO6wONAL5ADDDSIkDZ97JLYh8I1imHNT8UgbjinzmD2lfD9TiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJKzDqEp; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJKzDqEp"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70f91776fcso3522794a12.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Mar 2026 21:16:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772774189; cv=none;
        d=google.com; s=arc-20240605;
        b=gThNtyRd3uIUrtDK6GVH29xj87aM97wEGTSHBmorFlxpmme3HU8kfJWI4tVfvqTlhC
         dVFJNxxMKRmExJ7ENIlXdMHEEZ3mptsFtfHAsEYIj7AoiucntXVgPqp93E2W6Jx62pkr
         YwYkGZyEuT/DcXdZseI/dJj54ehgveN1Lycqxtds7+w7tlmOLvejOaGdv1iMgE4z2bsJ
         96fw13vyM1LzrAhyh0icT1wx4z0t5++394ako8sutS+WT0ucOCUXowVpTlTSNYooHmdu
         b6UPoThFKIU/8HK12ishcATkWAHQH0tsGakUxz6PN2uEe0/uPnhv4SWLiNtVBwQWDO4e
         VwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i4bJ53LWAF7Dgbm3MaLrGdxoClqcQbF8GzZ/FzZGtDA=;
        fh=Zn1ZbPblKbv0dPp2isY5KeRNXGH7FqwrcFipQdW30rs=;
        b=Y46HjLWb71D4519RTrb1D866kMfkUnOYzT4+noSkbChCVI1LvUeAYs1i+VnUPJm/ik
         2U0TnjAP+UuMEyRzGSBAVvnXl8SffXCu1PmqSL7QyTPXi5Pqq+15jPT5K4nz/byJejR6
         VxmVi3lpXfKBGBi1tpVTzCWPXpcVuIohWh8HA2QhniTEjLC/+YGl7kWO8q00NcypX7aj
         vqjHGn4FmzaZVpKaLmUztpCcEv7ARQjBbOtXHx22nhR58SztjyMiLMIymMTE43CXEoAT
         MzgP6HncPC/lne7h36t6DRcu4uZGgJJ9Y7zqgKvUZHf8G0d4KWFfGbiIEHjptP0OVNt3
         bGAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772774189; x=1773378989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4bJ53LWAF7Dgbm3MaLrGdxoClqcQbF8GzZ/FzZGtDA=;
        b=KJKzDqEpIFCstOg4NGmlaXWcmpaxibKTW6YftjGr2WrdMJU4pXWHWIqQ/yTaVaOBVV
         M6Jw/oVXe3zsRBxJtfYiEo1phmbCk0cW6uwlquwdlQ7U/3k3ucZ8Z7h6M7O6UCURU5jl
         4d0gWSyx4LVvT22Enbb1E/zi3BxKJxkeg1QSxlT+hcI4YIDkevfhPtiTD3cwDZ3uzEd+
         MeAGYnCm8LsyZR6/nAouE/st/mpnbGW7D+huS8fVahwYlVco7TyjXeROOuyIkQAXHjJU
         frXfY5XdHj/LMnt+k4cgw2M1KNxTh24VORIdEM7ANgV+qsV/Z31h97A7/XOb9cUNzShk
         g1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772774189; x=1773378989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4bJ53LWAF7Dgbm3MaLrGdxoClqcQbF8GzZ/FzZGtDA=;
        b=OSqbQcmtb85cGx6mpL5b85ExCPfju4UJ8cOKfn5ooxTKdTkKdybUDggdt7lARaLFN+
         ibhJXbrW8Hc+PqMNbyN1FG5Vt5Vsb0fwVhYiQu4cME96V3nMvuUECPZQkYbBgNkqWI8a
         wPpULv9qaXcUmmt5cLbahb7w5PLLcj3XF2sQ+em6SDkGZ3hH6C6J0Gd3bf3nI2y9K2Iq
         ttZ3hvRNZToz0Rl7iQ4CumhPwhaxdgh61RspeTZ4GhAM6fQFsSkJ7FK582x45W+dxJ3f
         VHHirfrwihnp+0Hz10361ziIbTf/wbp1xBS/q8YA0ZJLXcQLGt2xK/FYcNvmgXkiiLGt
         +tAA==
X-Forwarded-Encrypted: i=1; AJvYcCXbIFxZ2hPKVsXtMg7qy0yQVt1Jxgm01pipTE4Jh3jFaRwVPdGCeG300piYA9PWIBhcXNzAU7/UhgttSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD7RNjLSDFLRAYCiQIoym0F5DGQuZ7lVf9gg7YP79Sc3UKCjc5
	KqIfQ162JQqs05RFDa4nVIklssojM8Z3cVbmATOiZvQOPOVn88TsjoCM7EDX4E2rJ7X+LGLtVTt
	y7IvRjiGlLYHov6Dvp4kY4Gd5N0Wyd38=
X-Gm-Gg: ATEYQzwRUPueHv1bYjqsj95unbDpn+znZGfe+vSRgUMFev0211aJnl9kqKP7+aEcMHv
	PlZ/mMCzRhiI2vBcVC5qHJ7pxi2+o8IPUbBxyJr5H8VZ1/EYT+WhW3chUxrlGOD9XV2RPVh0ZNr
	0RPshCfnwwZp3Nkd0UqGAZ6dJZirmyCsRh8SD1emTUQOn0SnxKcqu3LQp5lanT3DWFiR1qHrv1y
	7Yq9hnn420xhUq7nYUFbJgOnZPEkOGAkp3S1UGfJEPhh772JraxuTtIHy+FsklH7d11dBed4l29
	G9e4wW0=
X-Received: by 2002:a05:6a21:7484:b0:38b:de3d:d530 with SMTP id
 adf61e73a8af0-398590ff0femr1031916637.72.1772774189507; Thu, 05 Mar 2026
 21:16:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
 <20260305031031.3808182-2-shengjiu.wang@nxp.com> <7665641b-1cad-4a65-94a1-771701363bf2@sirena.org.uk>
In-Reply-To: <7665641b-1cad-4a65-94a1-771701363bf2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Mar 2026 13:16:06 +0800
X-Gm-Features: AaiRm51kMa-O1sAC39Dn2vCk8cWF4P1mitNEX2s0U2KmBk3uO7t_JP-YBfFrl0o
Message-ID: <CAA+D8AO71d6mYi9YmTnzKy6hXXF0qLhFdCH_eQ5kGqOoDuBCsA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for
 specific cases
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 11:12=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Mar 05, 2026 at 11:10:29AM +0800, Shengjiu Wang wrote:
>
> > +int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active) {
> > +             ucontrol->value.integer.value[0] =3D 0;
> > +             return 0;
> > +     }
> > +
> > +     return snd_soc_get_xr_sx(kcontrol, ucontrol);
> > +}
>
> This is racy, what happens if we race with runtime PM disabling the
> device so it gets powered off between the check and the call to the
> generic function?  I think we need to take a runtime reference here,
> this is annoying but I can't see how else to do things robustly and
> probably in practice there's not much performance impact.

Ok, let me try this.
Thanks.

Best regards
Shengjiu Wang

>
> > +EXPORT_SYMBOL(fsl_asoc_get_xr_sx);
> > +
> > +int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active)
> > +             return 0;
> > +
> > +     return snd_soc_put_xr_sx(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_put_xr_sx);
> > +
> > +int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
> > +                          struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active) {
> > +             ucontrol->value.enumerated.item[0] =3D 0;
> > +             return 0;
> > +     }
> > +
> > +     return snd_soc_get_enum_double(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_get_enum_double);
> > +
> > +int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
> > +                          struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active)
> > +             return 0;
> > +
> > +     return snd_soc_put_enum_double(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_put_enum_double);
> > +
> > +int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active) {
> > +             ucontrol->value.integer.value[0] =3D 0;
> > +             return 0;
> > +     }
> > +
> > +     return snd_soc_get_volsw(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_get_volsw);
> > +
> > +int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +     struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> > +     bool pm_active =3D pm_runtime_active(component->dev);
> > +
> > +     if (!pm_active)
> > +             return 0;
> > +
> > +     return snd_soc_put_volsw(kcontrol, ucontrol);
> > +}
> > +EXPORT_SYMBOL(fsl_asoc_put_volsw);
> > +
> >  MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
> >  MODULE_DESCRIPTION("Freescale ASoC utility code");
> >  MODULE_LICENSE("GPL v2");
> > diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
> > index 21b25a11ecda..0cf9d1e7fb14 100644
> > --- a/sound/soc/fsl/fsl_utils.h
> > +++ b/sound/soc/fsl/fsl_utils.h
> > @@ -31,4 +31,34 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_cons=
traint_list *target_constr,
> >                             const struct snd_pcm_hw_constraint_list *or=
iginal_constr,
> >                             struct clk *pll8k_clk, struct clk *pll11k_c=
lk,
> >                             struct clk *ext_clk, int *target_rates);
> > +
> > +/* Similar to SOC_SINGLE_XR_SX, but it is for read only registers. */
> > +#define FSL_ASOC_SINGLE_XR_SX_EXT_RO(xname, xregbase, xregcount, xnbit=
s, \
> > +                             xmin, xmax, xinvert, xhandler_get) \
> > +{    .iface =3D SNDRV_CTL_ELEM_IFACE_MIXER, .name =3D (xname), \
> > +     .access =3D SNDRV_CTL_ELEM_ACCESS_READ |          \
> > +             SNDRV_CTL_ELEM_ACCESS_VOLATILE,         \
> > +     .info =3D snd_soc_info_xr_sx, .get =3D xhandler_get, \
> > +     .private_value =3D (unsigned long)&(struct soc_mreg_control) \
> > +             {.regbase =3D xregbase, .regcount =3D xregcount, .nbits =
=3D xnbits, \
> > +             .invert =3D xinvert, .min =3D xmin, .max =3D xmax} }
> > +
> > +int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
> > +                          struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
> > +                          struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol);
> > +
> > +int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
> > +                    struct snd_ctl_elem_value *ucontrol);
> > +
> >  #endif /* _FSL_UTILS_H */
> > --
> > 2.34.1
> >
