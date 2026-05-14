Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10159428477;
	Thu, 14 May 2026 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771642; cv=none; b=rjGoGCUeQUY3TlZEURRguTC4F6w53UEfv1KomTeixLFZIKTQug6mB9OCH2/T6N9whl6OmvQ6gQsw+RP25n28Sewa8gdswEWVTpPSDHoDpZS52e9/IL5j6FlVDN14ikwwqplMrS6kHAG34HGBvmKwbtnQ5L6EcOycbO6BdBkiF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771642; c=relaxed/simple;
	bh=n77jKvBXKYfi7DBqR2kZfZANLWBvMhgpqu6SOLWV4tM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=anTfCAOkxbZeRHVQV7EwE9QWEs4vZ3IvfbYD2olddwViK5dLPT2eqtfJ1pOq3Mql/9DX4CR2SxIP+LpvJh8T2XJgEeQU6BT/TLulUsGTxpDRt+kSLsKV3EF5Pa8i/V2hHItC2wMDdZ6E31zobQQDGWpoXyNm4JGxpADTDcqFRgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b=fx4s+rRf; arc=none smtp.client-ip=120.232.169.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b="fx4s+rRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=fx4s+rRfXxo6C4RijacnhYjgpuxgBRkjDK0mb9SsMkKdz4GX0SysXlOKMWYVDRtLhXLZJS4zseR3t
	 03l16fqLzdhzNcgJ4xsiE4OnuKZHbEPEY2yq1K0AYHoX9hiy8gPgI1jtmFdeoYQ7mgTld43S8wxplb
	 YreRL9J9LzATFz+4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [IPv6:2409:8a00:7873:2520:8bdc:11b0:b1c5:6df4] (unknown[2409:8A00:7873:2520:8BDC:11B0:B1C5:6DF4])
	by rmsmtp-lg-appmail-01-12079 (RichMail) with SMTP id 2f2f6a05e68d18b-031c8;
	Thu, 14 May 2026 23:13:29 +0800 (CST)
X-RM-TRANSID:2f2f6a05e68d18b-031c8
Message-ID: <62e812a78e58dba82ceeec5262f598685244b982.camel@139.com>
Subject: Re: [PATCH] ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7
 15ASH111 audio
From: Jackie Dong <xy-jackie@139.com>
To: Eric Naim <dnaim@cachyos.org>, perex@perex.cz, tiwai@suse.com, 
	sbinding@opensource.cirrus.com, zhangheng@kylinos.cn, kailang@realtek.com, 
	edip@medip.dev, mpearson-lenovo@squebb.ca
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 14 May 2026 23:13:17 +0800
In-Reply-To: <541669a6-879c-454b-98c4-3a58c8d2d76b@cachyos.org>
References: <20260513091256.97584-1-xy-jackie@139.com>
	 <541669a6-879c-454b-98c4-3a58c8d2d76b@cachyos.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-05-13 at 09:26 +0000, Eric Naim wrote:
> On 5/13/26 5:12 PM, Jackie Dong wrote:
> > ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio
> >=20
> > The amp/speakers on the Lenovo Yoga Pro 7 15ASH11 laptop aren't be
> > adjusted by Speaker Volume. Reuse the DAC routing selected for
> > ThinkPad
> > X1 Gen7 function to fix it.
> >=20
> > Signed-off-by: Jackie Dong <xy-jackie@139.com>
> > ---
> > =C2=A0sound/hda/codecs/realtek/alc269.c | 8 ++++++++
> > =C2=A01 file changed, 8 insertions(+)
> >=20
> > diff --git a/sound/hda/codecs/realtek/alc269.c
> > b/sound/hda/codecs/realtek/alc269.c
> > index 11d0ea8ed859..84aa1d4e7410 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -4076,6 +4076,7 @@ enum {
> > =C2=A0	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
> > =C2=A0	ALC298_FIXUP_LENOVO_C940_DUET7,
> > =C2=A0	ALC287_FIXUP_LENOVO_YOGA_BOOK_9I,
> > +	ALC287_FIXUP_LENOVO_YOGA_PRO7,
> > =C2=A0	ALC287_FIXUP_13S_GEN2_SPEAKERS,
> > =C2=A0	ALC256_FIXUP_SET_COEF_DEFAULTS,
> > =C2=A0	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
> > @@ -6100,6 +6101,11 @@ static const struct hda_fixup
> > alc269_fixups[] =3D {
> > =C2=A0		.chained =3D true,
> > =C2=A0		.chain_id =3D ALC285_FIXUP_THINKPAD_HEADSET_JACK,
> > =C2=A0	},
> > +	[ALC287_FIXUP_LENOVO_YOGA_PRO7] =3D {
> > +		.type =3D HDA_FIXUP_FUNC,
> > +		/* Reuse the DAC routing selected for ThinkPad X1
> > Gen7 */
> > +		.v.func =3D alc285_fixup_thinkpad_x1_gen7,
> > +	},
>=20
> Hi Jackie, an identical quirk exists for this. See
> ALC245_FIXUP_BASS_HP_DAC. I
> think you should use that instead of creating a new quirk that is
> identical.
>=20
> > =C2=A0	[ALC623_FIXUP_LENOVO_THINKSTATION_P340] =3D {
> > =C2=A0		.type =3D HDA_FIXUP_FUNC,
> > =C2=A0		.v.func =3D alc_fixup_no_shutup,
> > @@ -7752,6 +7758,7 @@ static const struct hda_quirk
> > alc269_fixup_tbl[] =3D {
> > =C2=A0	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL",
> > ALC287_FIXUP_TAS2781_I2C),
> > =C2=A0	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5",
> > ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
> > =C2=A0	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5",
> > ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
> > +	SND_PCI_QUIRK(0x17aa, 0x38fc, "Lenovo Yoga Pro 7 15ASH11",
> > ALC287_FIXUP_LENOVO_YOGA_PRO7),
> > =C2=A0	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5
> > Hybrid", ALC287_FIXUP_TAS2781_I2C),
> > =C2=A0	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80",
> > ALC269_FIXUP_DMIC_THINKPAD_ACPI),
> > =C2=A0	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10",
> > ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> > @@ -8043,6 +8050,7 @@ static const struct hda_model_fixup
> > alc269_fixup_models[] =3D {
> > =C2=A0	{.id =3D ALC285_FIXUP_HP_SPECTRE_X360_DF1, .name =3D "alc285-
> > hp-spectre-x360-df1"},
> > =C2=A0	{.id =3D ALC285_FIXUP_HP_ENVY_X360, .name =3D "alc285-hp-envy-
> > x360"},
> > =C2=A0	{.id =3D ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name =3D "alc287-
> > ideapad-bass-spk-amp"},
> > +	{.id =3D ALC287_FIXUP_LENOVO_YOGA_PRO7, .name =3D "alc287-
> > lenovo-yoga-pro7"},
> > =C2=A0	{.id =3D ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, .name =3D
> > "alc287-yoga9-bass-spk-pin"},
> > =C2=A0	{.id =3D ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name =3D
> > "alc623-lenovo-thinkstation-p340"},
> > =C2=A0	{.id =3D ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name =3D
> > "alc255-acer-headphone-and-mic"},
>=20
>=20
Hi Eric,
  In fact, I find the codec name is  ALC287 series on Yoga Pro 7
15ASH11 at first.
  I have reviewed the alc269.c again and agree your suggestion, will upstre=
am
the patch V2 with ALC245_FIXUP_BASS_HP_DAC instead of creating a new
quirk.
  Thanks,=20


