Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A732824BBFD
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638955; cv=none; b=qgOZCOB1gOrDcLpizSDVEJre2zgdfJL8rtEq0Iie4slewXSRjG/rgO8mz5ot2GnC+8NVXUoDq75gDUYHzk0jDr2aXV8Nu4B1T8soHPYFtszLZmYVIjzooz0Sf5NRjmMO5ekupNrbT/5f5x8IH71oa/uke0tLVqhp7OWOpl6yFWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638955; c=relaxed/simple;
	bh=e03lKtQFMIx4x+v0nccWMS1K1iEBnXDDrrvCp3ctYGY=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=c2U0I1/5RryHUGwBX9aJwtLbzFWGyuxXEUhPfn2HXHFiCfKhdgxJFv1o32K7b2KtXfQG+B7aqhxPVTdfuSEJYBUw+XsQvj5+wGawQv1nJPBxI4bVuge8BVJlsntEPI4AE4LXPc8ULUWHFiQx71WfIPg3T0/TU+TuONvdbMw1nQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=qRDcAK/m; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="qRDcAK/m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=yhobl6wFVQghJFc+QUbx/otCo9qbJmrR+UUcfqjPqDU=; b=q
	RDcAK/m+lCuB3g5UK+X4FW5vERm/G8zn46UcRJiVjrn1rCbZJ4bNGB6fcnkhyQmtuTVIXP5heJ9u9
	icxHzclOtr+vWegeYJg/goCgRB7NBRPjGqwcHJYOI1cpE82Bs50uvLsVsVfJeq9FmWS4RxFx5VX67
	fHf6qgiVipojXNgVxZYUPNdWm+wyH92gXSm9R725H+kgsuy7HyQge0tNcozqzvjnvTrHIM5gmKDUY
	s57WjILKhpkul5G+t2aP7C5Apj0L/2eyuG983/Gw1G+kgtSkkC7HNACS/o2OTgZdOVrzNj3glnC8O
	GtbKUXhAxmdhZlabBk+LRBW80LA1r2itQ==;
Date: Thu, 20 Nov 2025 12:42:40 +0100 (CET)
Message-Id: <20251120.124240.139462482701146043.rene@exactco.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>
Subject: [PATCH V2] ALSA: realtek/alc288 fix headphone for MS Surface 2/3
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The Surface Pro 2 and 3 have a strange headphone frequency response
and miss most of the bass. I discovered connecting the HP out to the
main DAC fixes this. Maybe the other is mono or intentionally filtered
signal for the built-in speakers? (At least the Lenovo Ideapad 720S
(AMD) (0x17aa, 0x3812) exhibited the same problem, but I don't have it
anymore for testing V2 changes.)

Signed-off-by: René Rebe <rene@exactco.de>
Co-developed-by: Takashi Iwai <tiwai@suse.com>
---
V2: use preferred_pairs instead of directly writing verbs
---
 sound/hda/codecs/realtek/alc269.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1aa4fef8acf6..46f40f38b6f5 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3453,6 +3453,21 @@ static void alc283_fixup_dell_hp_resume(struct hda_codec *codec,
 		alc_write_coef_idx(codec, 0xd, 0x2800);
 }
 
+/* Swap DAC assignments for HP and speaker */
+static void alc288_fixup_surface_swap_dacs(struct hda_codec *codec,
+					   const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+	static hda_nid_t preferred_pairs[] = {
+		0x21, 0x03, 0x14, 0x02, 0
+	};
+
+	if (action != HDA_FIXUP_ACT_PRE_PROBE)
+		return;
+
+	spec->gen.preferred_dacs = preferred_pairs;
+}
+
 enum {
 	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
@@ -3774,6 +3789,7 @@ enum {
 	ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE,
 	ALC245_FIXUP_HP_TAS2781_SPI_MUTE_LED,
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
+	ALC288_FIXUP_SURFACE_SWAP_DACS,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6229,6 +6245,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_tas2781_i2c_hp_fixup_muteled,
 	},
+	[ALC288_FIXUP_SURFACE_SWAP_DACS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc288_fixup_surface_swap_dacs,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -6929,6 +6950,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x12cc, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x12f6, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1414, 0x9c20, "Microsoft Surface Pro 2/3", ALC288_FIXUP_SURFACE_SWAP_DACS),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
-- 
2.46.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
