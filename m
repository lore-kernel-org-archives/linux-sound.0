Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D6350D6B
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860920; cv=none; b=YDYwjvS+opzhiv9N0ybaNvT2UfxZhTsyQ8RKky9ti2SVoI8QjTcoKreRJReuxESSVMswUcZ8/vuJXAmmIXiAj1UbEUT6C3AEnfNe3tMLfwoGv07I0UHyV5aZMxOkyQ52MpvrKara3Xhw/DDTjV6w3Ggso3VUIkC98wCuckKCjSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860920; c=relaxed/simple;
	bh=oejpnVZUzKZ184PgT1mbSxqRJAjtwfFQ8icnR9JOo8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtiJ9YoWKU1RcPW/ePnrlu9WjBHXl4yxzNlgv3Z/WywH61QRh16BxxaZn/JPAQt3BqxYmXYBVWd3EJ9vvLKl+6an1bKGqt+4jFGkBHyKez/oM/HxiFeF39nsyi4jlqYVyj8Gi8ZWwQVkErrdJ227CMXIFBxHxhBJmygqp6NOtuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=R1o+YAnt; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="R1o+YAnt"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id DA9595E65B
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:22:43 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id C1A1D5E637
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:22:42 +0200 (EET)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C08EC20242C
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 10:22:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767860562;
	bh=yLvPrJiqZyyocq7FaGMgu8nIZBlN2v/3yqJ5C18gTYY=;
	h=Received:From:Subject:To;
	b=R1o+YAntWrvlAZrAKQI4vOy4J6yLWNomtGCTWFs39xOnXGMp+VT8tDf3JnMg1qD4d
	 jN4Yny2FKKOY3GMtuE6zlt75zuB3MrAbLlBO3tQaGO6jcKYUnXwrPKsdXL4yWAVjQI
	 bd1Bnb58KFdNSkCucccLh2++iXN0ihPRTZhXp0YPEPdeq7bZGt8lQUyojKrBXtPhOC
	 UEW9+r0sXId6STrz+X5ZQDbud9e4p0KPJZ53nMsTr1EU2DzH7RcZSCovPVFjiKKRwx
	 a1ueGyvcV68OwXHSI7ARdVtoa2AzW9XX6wvj2ulwZBb9aYwsx3RSxiynNMO5Cx0SQz
	 NTz/S0AS6Q11g==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38304020185so11880711fa.2
        for <linux-sound@vger.kernel.org>;
 Thu, 08 Jan 2026 00:22:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRuadoiho5gK1NJP/lza8pOr7i5jmkqmHJ0ljHcZ3WdlcKAVdcwIHLZ3PeEC3F+cMK7e0oi83gf+8a9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqnHX+XdkuvwNmMZCTiwLMbOuJN6vHGOzTj6vmkKwAXM5DdVM6
	+tbxlIFiMJz4L8gT8BM/6RGYzjVaI760yO3phS2uH2X0DZ40QsuGLuS4iSf1zD6nztn0g0qbSrf
	dLSSdmWkQeXq0XptYOJZVkQEqxxUuPJc=
X-Google-Smtp-Source: 
 AGHT+IHiGAlf9VXjeOeGT3cCo0fE4/dbsjq9ozSn104dHXJR2PgdAzThJPd5ddd/iqXBos//w1DeIv+Av4m0qRTRnYw=
X-Received: by 2002:a2e:be92:0:b0:380:989:f5fb with SMTP id
 38308e7fff4ca-382ff5ac3bbmr14375831fa.0.1767860561210; Thu, 08 Jan 2026
 00:22:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <862C1A43-9C43-404F-A940-920FCD7D1919@linux.dev>
 <CAGwozwGXCe-nDi7moPvPH++_Bz687Ksffe1GU37qcTxR2ygx+g@mail.gmail.com>
 <a74b90ee-5885-4acc-88f0-60642e0284e5@linux.dev>
In-Reply-To: <a74b90ee-5885-4acc-88f0-60642e0284e5@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 8 Jan 2026 10:22:29 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEmz00SDE5-xZ40q9OJa=yvQZMEha+JoAMrX2Tsd-hRrQ@mail.gmail.com>
X-Gm-Features: AQt7F2qMjHkWJV5LYmDWzxcDIDU7ZN5qN15MuePQHu681ploI0iHvAnaga6mnjk
Message-ID: 
 <CAGwozwEmz00SDE5-xZ40q9OJa=yvQZMEha+JoAMrX2Tsd-hRrQ@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 tiwai@suse.de,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176786056199.2032579.16649253273754815923@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 8 Jan 2026 at 05:29, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> On 1/7/26 2:21 AM, Antheas Kapenekakis wrote:
> > On Wed, 7 Jan 2026 at 12:17, Matthew Schwartz
> > <matthew.schwartz@linux.dev> wrote:
> >>
> >>
> >>
> >>> On Jan 7, 2026, at 1:32=E2=80=AFAM, Antheas Kapenekakis <lkml@antheas=
.dev> wrote:
> >>>
> >>> =EF=BB=BFThe V2 UEFI spec for per-device calibration data in TAS allo=
ws for
> >>> manufacturers to specify up to five custom calibration register
> >>> addresses and values to optimize per-device in factory.
> >>>
> >>> A basic description of the spec is found in a comment in function
> >>> tas2781_apply_calib(). However, currently, for the condition of
> >>> p->dspbin_typ !=3D TASDEV_BASIC, if custom calibration addresses have=
 been
> >>> provided by the manufacturer, they are ignored and the ones listed in
> >>> firmware are used.
> >>>
> >>> In case the manufacturer chose to change different registers other th=
an
> >>> the default ones (r0, invr0, r0_low, pow, tlimit), this causes the
> >>> UEFI calibration data to scratch different registers and cause the
> >>> firmware to misbehave. This is true in the Xbox ROG Ally X, for one o=
f
> >>> the firmwares, where it pops and has audio dropouts after the
> >>> calibration data is applied.
> >>>
> >>> Therefore, add a new bool to indicate that UEFI supplied custom
> >>> calibration addresses, and if so, use them regardless of dspbin_typ.
> >>>
> >>> Link: https://lore.kernel.org/all/CAGwozwFQKoQgo_Q=3Dqdr-FTD+uoVWA8At=
HyDmKwTOV4ZU6+F3SQ@mail.gmail.com/
> >>> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> >>> Closes: https://lore.kernel.org/all/0ba100d0-9b6f-4a3b-bffa-61abe1b46=
cd5@linux.dev/
> >>> Co-developed-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> >>> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>
> >>> ---
> >>> @Matt: can you kindly verify this patch works for you?
> >>
> >> I=E2=80=99ll have time to debug it more in the morning but the patch d=
oes not work, it=E2=80=99s still using the same calibrated data as before w=
ith dropouts.
> >
> > If you can check that the register addresses changed that would be
> > great. Especially that we enter and exit the calibration block.
> > Perhaps that was happening before as well and the addresses were
> > overwritten by firmware later
>
> [    2.415699] snd_hda_codec_alc269 hdaudioC1D0: bound i2c-TXNW2781:00-ta=
s2781-hda.0 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781_i2c])
> [    2.417548] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: dspbin_type_che=
ck: ppcver=3D0x19500 -> dspbin_typ=3D2 (0=3Dnone,1=3DBASIC,2=3DALPHA,3=3DBE=
TA)
> [    3.809849] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_c=
alib: enter, dspbin_typ=3D2, chip_id=3D0xadd
> [    3.809855] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_c=
alib: default cali_reg: r0=3D0xbf4 invr0=3D0xc0c r0_low=3D0xc14 pow=3D0x9f0=
 tlimit=3D0xc7c
> [    3.809858] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_c=
alib: UEFI custom cali_reg found: r0=3D0xce4 invr0=3D0xcf4 r0_low=3D0xcfc p=
ow=3D0xae0 tlimit=3D0xd70
> [    3.809860] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_c=
alib: using cali_reg for r->regs (custom_addr=3D1, dspbin_typ=3D2)
> [    3.809861] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_c=
alib: exit, total_sz=3D42, is_user_space_calidata=3D1
> [    6.180351] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_hda_pla=
yback_hook: action =3D 0
> [    6.330017] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_cal=
ibrated_data: enter dev 0, is_user_space_calidata=3D1
> [    6.330021] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_cal=
ibrated_data: writing UEFI cal data to regs: r0=3D0xce4 invr0=3D0xcf4 r0_lo=
w=3D0xcfc pow=3D0xae0 tlimit=3D0xd70
> [    6.330022] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_cal=
ibrated_data: cal values: r0=3D3c5f7222 invr0=3D10f615d5
> [    6.332137] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_cal=
ibrated_data: enter dev 1, is_user_space_calidata=3D1
> [    6.332138] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_cal=
ibrated_data: writing UEFI cal data to regs: r0=3D0xce4 invr0=3D0xcf4 r0_lo=
w=3D0xcfc pow=3D0xae0 tlimit=3D0xd70
> [    6.332138] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_cal=
ibrated_data: cal values: r0=3D3c90e72d invr0=3D10e83c28
>
> Looks like the addresses changed. I'm just going to send out a patch to s=
kip calibration for the device as Jim suggested, as that is confirmed to wo=
rk.

The addresses did not change

From a previous email:
    r0_reg=3D0x000ce4 40cccccd
    r0_reg=3D0x000ce4 3c90e72d
 invr0_reg=3D0x000cf4 0fcd6e9e
 invr0_reg=3D0x000cf4 10e83c28
r0_low_reg=3D0x000cfc 0f8d4fdf
r0_low_reg=3D0x000cfc 2ec1c8ff
   pow_reg=3D0x000ae0 009b9c58
   pow_reg=3D0x000ae0 0096cefc
tlimit_reg=3D0x000d70 25800000
tlimit_reg=3D0x000d70 25800000

So the firmware data register overrides are correct and 0x80 addresses
can be ignored by the UEFI parser.

Well that's unfortunate. I'm not sure where to go from here

Antheas



> >
> > Antheas
> >
> >>>
> >>> Then verify your sign-off for the coby tag. If you would rather a
> >>> different acknowledgment tag (e.g., tested-by or suggested-by), lmk
> >>>
> >>> Thanks.
> >>> Antheas
> >>> ---
> >>> sound/hda/codecs/side-codecs/tas2781_hda.c | 4 +++-
> >>> 1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/c=
odecs/side-codecs/tas2781_hda.c
> >>> index 96e6d82dc69e..6efdf0a3442b 100644
> >>> --- a/sound/hda/codecs/side-codecs/tas2781_hda.c
> >>> +++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
> >>> @@ -64,6 +64,7 @@ static void tas2781_apply_calib(struct tasdevice_pr=
iv *p)
> >>>       TASDEVICE_REG(0, 0x18, 0x7c),
> >>>   };
> >>>   unsigned int crc, oft, node_num;
> >>> +    bool custom_addr =3D false;
> >>>   unsigned char *buf;
> >>>   int i, j, k, l;
> >>>
> >>> @@ -104,6 +105,7 @@ static void tas2781_apply_calib(struct tasdevice_=
priv *p)
> >>>       for (j =3D 0, k =3D 0; j < node_num; j++) {
> >>>           oft =3D j * 6 + 3;
> >>>           if (tmp_val[oft] =3D=3D TASDEV_UEFI_CALI_REG_ADDR_FLG) {
> >>> +                custom_addr =3D true;
> >>>               for (i =3D 0; i < TASDEV_CALIB_N; i++) {
> >>>                   buf =3D &data[(oft + i + 1) * 4];
> >>>                   cali_reg[i] =3D TASDEVICE_REG(buf[1],
> >>> @@ -151,7 +153,7 @@ static void tas2781_apply_calib(struct tasdevice_=
priv *p)
> >>>       }
> >>>   }
> >>>
> >>> -    if (p->dspbin_typ =3D=3D TASDEV_BASIC) {
> >>> +    if (custom_addr || p->dspbin_typ =3D=3D TASDEV_BASIC) {
> >>>       r->r0_reg =3D cali_reg[0];
> >>>       r->invr0_reg =3D cali_reg[1];
> >>>       r->r0_low_reg =3D cali_reg[2];
> >>>
> >>> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> >>> --
> >>> 2.52.0
> >>
> >
>
>

