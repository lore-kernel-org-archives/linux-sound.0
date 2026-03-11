Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312F2D12F3
	for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217082; cv=pass; b=rGVF0i1otMLaofZT8tSoqhsHpjHEuYhRxNxCQ8/yhMHdIY1d/suNt/io5ZTEfw9av2TibyGmyH1CqwPUjkvg25IsP67PInLKGyRMutUeDMQpr63P1CLA7lzSP+6klh7dRE1IKCH5VdBKbTy2dfYnp40/EeAdX2i4IclDMMINnp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217082; c=relaxed/simple;
	bh=bvc+6Y2uaW1tJtPm4VR1GaWpkiNRWqiDYswbFc8+/Q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oG+x6OItZ/iK7QF0ClsamnTMVp35cCvBPE/7KT3Zs4Cf9P+aXIKtodp32Rss5W/w53cZFKIMxwgz+D/VA4YdC6fZcT12DNn0/wEQbpIA8DnKVIxW5m8FWOmQDMC21npUyxezt+2pC9qls9Qx4OsqEv6g24YsmE3I1GaoXq02t4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GY0NFPPa; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GY0NFPPa"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-660ea6ceb5aso1116171a12.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 01:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773217078; cv=none;
        d=google.com; s=arc-20240605;
        b=A+AM4+v94LQo+aHuhFrK3YSRUFRh1OoxTTZIXBNPMMvuLizyUvr1/6eQUJ7IIul+U6
         SUWJcuZ0u/cj0/Wyu3IR/PIbecU7L35HtezSmsTWk1DfhxjYOF7vfxgJS/Erk7+TwKf+
         HAIz7xPn77EQb4twgZVcn5Rs1GsbA/qPsuzFDn6Zs0z3DL/RFiiTK1B3NmKEXiH7aIwu
         aHeBaRUdz7HpheMzFo4Sap5YecvCrBKln5VtGbYAsVP7VBJ/w/zWuNeKrVOwjCTm8D4/
         r2S9WbZY9ikvYrPucDvKr3or1bdb35IW54u7rYagI8vwr5KiNQ4jMZP/Cc1id8YMKbY6
         ev9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DSqIY/cfxGhiXZ3sxGbmKbwjNNRfS8ZavCJutHh1i/E=;
        fh=IeYRPnA9/RIWQNghgdmqLuePVMVDItLqxmmlo9xwUuM=;
        b=YgfCoBs6zfIydpFqmRGV145zuDlhaknEiFK0+M1bMhkZnsXzA0WtPWFdLccJsmCFhQ
         yKykygOp5LNKOuWsSxZrsEaW+pNHZj+FPEdMeTcDIcshRnVlUY9sYkzRScd+x8mZGpbB
         sirkthVCtjQrBumnq/9yuIDEBY1WwzSuNJ3n34zqnhkNPoIwOANTfIysQcK2oYuETzbI
         3YMFU2l7+WjrBvAfqKMGWpYpCcCENWx7TZRJhXHoMhpFfWwspNQxvJCvuCJ8mCPNso3q
         78jhktKS8bvQ7hWg41ul0Grrt4NNV6zCK285+PKSHLtnCE9uwk/zP7bpfjFHmSZ4c3FK
         cV3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773217078; x=1773821878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSqIY/cfxGhiXZ3sxGbmKbwjNNRfS8ZavCJutHh1i/E=;
        b=GY0NFPPafQ3UD4IDrQwPr7EJMa0LMcICi6tUm7E3E+/KDIAZYunICZKWt/QpqpUMQj
         fnt950FXoiMNbYF8cU4p5fe3UhO1OglqiQDhqTvUQ8asdSRnaFuN7YxD5i3iCAnRbcI0
         FLJVyNMihLwdxWx6B9Uhkz598qyzaKjwxcZB0qeJeceSG5vajb6+x6t78a/0D5s7UQHG
         zqliZ5brRWwhdwETxgYcz2MjsxUyhkdYGPus7htcXkSmP4uRQeqGG5/G2T/KJijYqn5x
         14ANb1I1SR5CYlJdigMxDSz15CdWtWCxEYw+9R0e500WUgPJO1peLcHHEsdX6iWWn6QM
         HyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773217078; x=1773821878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DSqIY/cfxGhiXZ3sxGbmKbwjNNRfS8ZavCJutHh1i/E=;
        b=XexhXCgyOKkdlVXQVHkzERwd5hNEbLe/EG4HhYl2fI678UhA8g4okDz4WyKdzgohG7
         KR7vr4gVpLF7FSP4DRxeRorh/QLhDDdqcLixRQnzQ6ugDlMWpeH4V5IK1fXvQimzEMai
         kFRu1jpZSKSP0Cdf0d/WJkU2DMrLbnTfHVabqnDo+O96d3O6aTTfD/tXqWfPvjE1TWjj
         jjPFbgM0ui6uX/yls0+LyDx2ETBo4MHEAE7FLqWu45rtSgxeXMZUeuEA2D0wBX4QueJB
         1I5VGlJe7VkJcp8IeRmDR7Q74GF6W6ewrmfBhf003MMeVwfbinV+A1HoB5nuK2Kyv5NM
         2YTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnkbqbf1fCaYpMy2L0ajqR7k5tgtKx/ahywFNiaWSM07KjO2lUEpJjw+pWsa6eZSKsFWOV3C0dAgpHBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxnVtgwOzwTnxFwMViBdv8TYg4BxIGuUGH1+RVozbWET95lqh/
	83lWhL8ptc2xaIRjrUAQrfDBP+41VUDcdn9VYL9hrvYV25urEUah9vtgzaFWtHZecTGA7Axfx0m
	NJ72WetwZUOs2KcglQ8vFhzIh0Mzub50=
X-Gm-Gg: ATEYQzy51pY5MipjJeD6mIHth987cLbXxVbiy0RkY2f/z77WCW6kMu+Yw8VBSsRReX+
	Xgpap/tqgRJHC9rzWIuVX7mISHpcmWrOjtqnJ4m//Qq3bpAot5oA3KjhNCFpywYcRMJj4pw+rKh
	dKTvsriNM9+2RuSxGpgdq5oa2IF2ny+dbBUToyysFfTLjtEuRbvflIMMF4OjrOOFHReDEjurcU0
	iaWUBW/4v03yUEGefNBubutbGF95lhe9OMedZrvWKpBab0xyToIjEBlzZEdQvCzuKBIL7B/Ujd/
	029Qcvo=
X-Received: by 2002:a17:907:7211:b0:b8f:de69:b597 with SMTP id
 a640c23a62f3a-b972d51c4ffmr98810566b.7.1773217077803; Wed, 11 Mar 2026
 01:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773107475.git.zhoubinbin@loongson.cn> <8fc0f9483b0ef0ff52ac5588f029f329098f45fc.1773107475.git.zhoubinbin@loongson.cn>
 <CAAhV-H7D0oGeWYCGXwPJxUBBGibNQ27B_fAFThDYXZ-+Qr7RMA@mail.gmail.com>
In-Reply-To: <CAAhV-H7D0oGeWYCGXwPJxUBBGibNQ27B_fAFThDYXZ-+Qr7RMA@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 11 Mar 2026 16:17:45 +0800
X-Gm-Features: AaiRm52fvLzj-z2f6S8hIS-AkBlETUoqIBlwVuGOvJWq_S-q2wO-mmxTvxhMBq8
Message-ID: <CAMpQs4LxN7t=OoNp0=R95yNYHewzR9Eikr2DiZTj=jR__re3og@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: loongson: Combined regmap definitions
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 3:55=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> Hi, Binbin,
>
> On Wed, Mar 11, 2026 at 2:37=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.=
cn> wrote:
> >
> > For Loongson I2S, the difference between i2s_plat and i2s_pci is more i=
n
> > the external interface, the internal registers are accessed in the same
> > way, so the regmap definitions can be united to simplify the code.
> >
> > Also, the following warning for the i2s_plat driver will be eliminated:
> >
> > loongson-i2s-plat loongson-i2s: using zero-initialized flat cache, this=
 may cause unexpected behavior.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  sound/soc/loongson/loongson_i2s.c      | 55 ++++++++++++++++++++++++++
> >  sound/soc/loongson/loongson_i2s.h      |  1 +
> >  sound/soc/loongson/loongson_i2s_pci.c  | 54 -------------------------
> >  sound/soc/loongson/loongson_i2s_plat.c |  8 ----
> >  4 files changed, 56 insertions(+), 62 deletions(-)
> >
> > diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loo=
ngson_i2s.c
> > index e336656e13eb..09ccab0c535e 100644
> > --- a/sound/soc/loongson/loongson_i2s.c
> > +++ b/sound/soc/loongson/loongson_i2s.c
> > @@ -272,5 +272,60 @@ const struct dev_pm_ops loongson_i2s_pm =3D {
> >  };
> >  EXPORT_SYMBOL_GPL(loongson_i2s_pm);
> >
> > +static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
> > +{
> > +       switch (reg) {
> > +       case LS_I2S_CFG:
> > +       case LS_I2S_CTRL:
> > +       case LS_I2S_RX_DATA:
> > +       case LS_I2S_TX_DATA:
> > +       case LS_I2S_CFG1:
> > +               return true;
> > +       default:
> > +               return false;
> > +       };
> > +}
> The 'write' function is usually after the 'read' function.

Okay, it will be reordered in the next version.
>
> > +
> > +static bool loongson_i2s_rd_reg(struct device *dev, unsigned int reg)
> > +{
> > +       switch (reg) {
> > +       case LS_I2S_VER:
> > +       case LS_I2S_CFG:
> > +       case LS_I2S_CTRL:
> > +       case LS_I2S_RX_DATA:
> > +       case LS_I2S_TX_DATA:
> > +       case LS_I2S_CFG1:
> > +               return true;
> > +       default:
> > +               return false;
> > +       };
> > +}
> > +
> > +static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int=
 reg)
> > +{
> > +       switch (reg) {
> > +       case LS_I2S_CFG:
> > +       case LS_I2S_CTRL:
> > +       case LS_I2S_RX_DATA:
> > +       case LS_I2S_TX_DATA:
> > +       case LS_I2S_CFG1:
> > +               return true;
> > +       default:
> > +               return false;
> > +       };
> > +}
> > +
> > +const struct regmap_config loongson_i2s_regmap_config =3D {
> > +       .reg_bits =3D 32,
> > +       .reg_stride =3D 4,
> > +       .val_bits =3D 32,
> > +       .max_register =3D LS_I2S_CFG1,
> > +       .writeable_reg =3D loongson_i2s_wr_reg,
> > +       .readable_reg =3D loongson_i2s_rd_reg,
> > +       .volatile_reg =3D loongson_i2s_volatile_reg,
> > +       .cache_type =3D REGCACHE_FLAT,
> > +};
> > +EXPORT_SYMBOL_GPL(loongson_i2s_regmap_config);
> > +
> >  MODULE_LICENSE("GPL");
> >  MODULE_DESCRIPTION("Common functions for loongson I2S controller drive=
r");
> > diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loo=
ngson_i2s.h
> > index c8052a762c1b..e73ffa954ec9 100644
> > --- a/sound/soc/loongson/loongson_i2s.h
> > +++ b/sound/soc/loongson/loongson_i2s.h
> > @@ -65,6 +65,7 @@ struct loongson_i2s {
> >         u32 sysclk;
> >  };
> >
> > +extern const struct regmap_config loongson_i2s_regmap_config;
> >  extern const struct dev_pm_ops loongson_i2s_pm;
> >  extern struct snd_soc_dai_driver loongson_i2s_dai;
> >
> > diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson=
/loongson_i2s_pci.c
> > index 1ea5501a97f8..dea1e4ebee29 100644
> > --- a/sound/soc/loongson/loongson_i2s_pci.c
> > +++ b/sound/soc/loongson/loongson_i2s_pci.c
> > @@ -18,60 +18,6 @@
> >
> >  #define DRIVER_NAME "loongson-i2s-pci"
> >
> > -static bool loongson_i2s_wr_reg(struct device *dev, unsigned int reg)
> > -{
> > -       switch (reg) {
> > -       case LS_I2S_CFG:
> > -       case LS_I2S_CTRL:
> > -       case LS_I2S_RX_DATA:
> > -       case LS_I2S_TX_DATA:
> > -       case LS_I2S_CFG1:
> > -               return true;
> > -       default:
> > -               return false;
> > -       };
> > -}
> > -
> > -static bool loongson_i2s_rd_reg(struct device *dev, unsigned int reg)
> > -{
> > -       switch (reg) {
> > -       case LS_I2S_VER:
> > -       case LS_I2S_CFG:
> > -       case LS_I2S_CTRL:
> > -       case LS_I2S_RX_DATA:
> > -       case LS_I2S_TX_DATA:
> > -       case LS_I2S_CFG1:
> > -               return true;
> > -       default:
> > -               return false;
> > -       };
> > -}
> > -
> > -static bool loongson_i2s_volatile_reg(struct device *dev, unsigned int=
 reg)
> > -{
> > -       switch (reg) {
> > -       case LS_I2S_CFG:
> > -       case LS_I2S_CTRL:
> > -       case LS_I2S_RX_DATA:
> > -       case LS_I2S_TX_DATA:
> > -       case LS_I2S_CFG1:
> > -               return true;
> > -       default:
> > -               return false;
> > -       };
> > -}
> > -
> > -static const struct regmap_config loongson_i2s_regmap_config =3D {
> > -       .reg_bits =3D 32,
> > -       .reg_stride =3D 4,
> > -       .val_bits =3D 32,
> > -       .max_register =3D LS_I2S_CFG1,
> > -       .writeable_reg =3D loongson_i2s_wr_reg,
> The same.
>
> Huacai
>
> > -       .readable_reg =3D loongson_i2s_rd_reg,
> > -       .volatile_reg =3D loongson_i2s_volatile_reg,
> > -       .cache_type =3D REGCACHE_FLAT,
> > -};
> > -
> >  static int loongson_i2s_pci_probe(struct pci_dev *pdev,
> >                                   const struct pci_device_id *pid)
> >  {
> > diff --git a/sound/soc/loongson/loongson_i2s_plat.c b/sound/soc/loongso=
n/loongson_i2s_plat.c
> > index fa2e450ff618..f8d7aca8b903 100644
> > --- a/sound/soc/loongson/loongson_i2s_plat.c
> > +++ b/sound/soc/loongson/loongson_i2s_plat.c
> > @@ -85,14 +85,6 @@ static const struct snd_soc_component_driver loongso=
n_i2s_component_driver =3D {
> >         .open   =3D loongson_pcm_open,
> >  };
> >
> > -static const struct regmap_config loongson_i2s_regmap_config =3D {
> > -       .reg_bits =3D 32,
> > -       .reg_stride =3D 4,
> > -       .val_bits =3D 32,
> > -       .max_register =3D 0x14,
> > -       .cache_type =3D REGCACHE_FLAT,
> > -};
> > -
> >  static int loongson_i2s_apbdma_config(struct platform_device *pdev)
> >  {
> >         int val;
> > --
> > 2.52.0
> >
> >

--=20
Thanks.
Binbin
