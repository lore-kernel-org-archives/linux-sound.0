Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB9147A6B
	for <linux-sound@vger.kernel.org>; Sun, 16 Nov 2025 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763306790; cv=none; b=GX5dOUHiBKC0+uc2cZv3fzwpXkevGaj14+xls+AUn7S352DHcGe35Rzvwh01ZcLPBTPCViVRSy0n4FXvE1nT6eViw6gmP1jl+yFHfMf7KjoEAXufL1uajSJJEpWTT8sGdkiBuOL5l4hdMpRQ6SkpFm2BSf5fuhPhYAvylWVoaA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763306790; c=relaxed/simple;
	bh=0jvNrFJwx5TeTyBmZtXDyIutOJnsW433R1JK2EJF/HM=;
	h=Date:Message-Id:Cc:To:Subject:From:Mime-Version:Content-Type; b=mM6yRO6IIRWBr6yU9pPB2blAZZk7brpPmVCNpmQK4Sxylk426nwIS9VEUzbwLefAJmMD/qHW6taIYrJKiG4awWjUqdlMkZqCEJNK6fCjRCAEsBTvzEnVKFH09iMLaXutpaLerPy1h4H5g+3aR2jepAkLYIqBIZHwT6sjNb7oFJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=TmjHEBNX; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="TmjHEBNX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:To:Cc
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=KOamihvpXVrhkBewLTay7Ch3dlQ7u6nVK7RTRC7IAeY=; b=T
	mjHEBNXirniP/XMIbQQZ8BDbjw+FKnvCmf41zRoyoVTcmZmxRIdX+3QECiCH79sI9soQtz+2HfnmR
	vTd35Lxi6QcDp9bU614/rVQOTl1rMgx5eR6ypvbo0paKmyjimnHPwN25BWLQ9SrremxbeGmkTLAZw
	cn7S6K7pFmyGaFIA8OZUvC1yC+3rygcspir/uwDwBsx1dNqayO99pz0EqlGyG033+St47L7VUIptm
	ufZ9+XK8IGgs3xPr9QEwspkao4ZG8u0xEPAya8VAPZ0t0ulrGwqAvVDUmUb7RquFFLdvLbmaeVKYu
	70evsq5cCXGYLK4pCWFLU1FSmCx0UfoYA==;
Date: Sun, 16 Nov 2025 16:26:33 +0100 (CET)
Message-Id: <20251116.162633.1272923634893984527.rene@exactco.de>
Cc: Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>
To: linux-sound@vger.kernel.org
Subject: [PATCH] fixup realtek/alc288 headphone for MS Surface 2, 3 and 
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

The Surface Pro 2 and 3 have a strage frequency response and miss most
of the bass. I discovered connecting the HP out to the main DAC fixes
this.  Maybe the other is mono or whatever strangely mixed signal for
the built-in speakers?

I later noticed the Lenovo Ideapad 720S (AMD) exhibited the same
problem, so this may be a more wide-spread general bug w/ Realtek
codecs and the hda_auto_parser, ...

Signed-off-by: René Rebe <rene@exactco.de>

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4aec5067c59d..81ac86b65796 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -2259,6 +2259,17 @@ static void alc282_fixup_asus_tx300(struct hda_codec *codec,
 	}
 }
 
+static void alc288_fixup_headset(struct hda_codec *codec,
+				 const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_INIT) {
+		/* Surface Pro? */
+		int nid = codec->core.vendor_id == 0x10ec0280 ? 0x15 : 0x21;
+		/* DAC node 0x0c is giving low bass output, reverse default order. */
+		snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_CONNECT_SEL, 1);
+	}
+}
+
 static void alc290_fixup_mono_speakers(struct hda_codec *codec,
 				       const struct hda_fixup *fix, int action)
 {
@@ -3483,6 +3495,7 @@ enum {
 	ALC283_FIXUP_SENSE_COMBO_JACK,
 	ALC282_FIXUP_ASUS_TX300,
 	ALC283_FIXUP_INT_MIC,
+	ALC288_FIXUP_HEADSET,
 	ALC290_FIXUP_MONO_SPEAKERS,
 	ALC290_FIXUP_MONO_SPEAKERS_HSJACK,
 	ALC290_FIXUP_SUBWOOFER,
@@ -4245,6 +4258,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
 	},
+	[ALC288_FIXUP_HEADSET] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc288_fixup_headset,
+	},
 	[ALC290_FIXUP_SUBWOOFER_HSJACK] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -6872,6 +6889,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x12cc, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x12f6, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1414, 0x9c20, "Microsoft Surface Pro 2/3", ALC288_FIXUP_HEADSET),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
@@ -7053,6 +7071,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3812, "Lenovo Ideapad 720S", ALC288_FIXUP_HEADSET),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_LENOVO_C940_DUET7),
 	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de
