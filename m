Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [178.154.239.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3A3DA5D5;
	Mon, 20 Jul 2026 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570542; cv=none; b=ZUzilCmzSqlObzryNd8nM8BOoXof+OKmYT4jFOCOa+kCN2eTdg0uO+BBFDvrL6GI5adziymN1FvflJ41PzbBSDFnvRTWvwZler2z+8qe+sJqdVd2WFJ/bfAq5lQc6QLovyzq2lYtL3GO6z8o/lzIvYISejA3/It2yrtqStbsJXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570542; c=relaxed/simple;
	bh=hSqcpYgm4WpInn7Tyj0s2iZIQZXFzTtCksFKx9ZnDBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HPhcd+3bVRyfVcevlJEpBF3ff+NTxfQLOuJFbZNkLBLFZKxkRv1sm0Oryt8I5+W2IGfDPhNdXpZpARrMKO6ypAKXmqpJst6STXWZmSSv+X00GjCa9g90rrUR0mulc9avxxagmVb5kWIOpy59Jtoul7OukBQYHsKuCCs9AuOKprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=mP/YWwn+; arc=none smtp.client-ip=178.154.239.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="mP/YWwn+"
Received: from mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:83a9:0:640:50fd:0])
	by forward101d.mail.yandex.net (postfix) with ESMTPS id 46106C0084;
	Mon, 20 Jul 2026 21:02:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net (smtp) with ESMTPSA id F2asoE6gHuQ0-AL5KOHg3;
	Mon, 20 Jul 2026 21:02:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1784570535; bh=0Ndm/hZjXE4FeU5Ck7H/t71L3f7NKMa4XDDfp+Tbg9c=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=mP/YWwn+OC5Mr+X8E39ZuqLTk/h3umC0+i13ZYj2CYB+bD0YE/rDYs+sfLtvJsWGW
	 WO+x05846qx0NJ0enMcGqyXwX57/UPGCIGsqxRWfATEjJ5CHd1Wx95gZ3XDypQYRN9
	 bddR/zpuWDPtWHPkH3ee0mndx40Rou8OSV+scJq8=
Authentication-Results: mail-nwsmtp-smtp-production-main-78.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Nikita Maksimov <nickstogramm@yandex.ru>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Maksimov <nickstogramm@yandex.ru>
Subject: [PATCH] ALSA: hda/realtek: Fix speakers on Lunnen Ground 14
Date: Mon, 20 Jul 2026 21:02:14 +0300
Message-ID: <20260720180214.73770-1-nickstogramm@yandex.ru>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware on the Lunnen Ground 14 marks pin 0x1b as unused even
though the internal speakers are connected to it. As a result, the
speakers are not detected.

Add a pin configuration quirk for PCI subsystem ID 2782:a212 to configure
pin 0x1b as an internal speaker.

The pin configuration was tested on a Lunnen Ground 14 (DMI product LL4FA)
with an ALC269VC codec. The internal speakers and microphone work as
expected.

Cc: stable@vger.kernel.org
Signed-off-by: Nikita Maksimov <nickstogramm@yandex.ru>
---
 sound/hda/codecs/realtek/alc269.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 09e724749..97632d2f9 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3906,6 +3906,7 @@ enum {
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
 	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
 	ALC269VC_FIXUP_INFINIX_Y4_MAX,
+	ALC269VC_FIXUP_LUNNEN_GROUND_14,
 	ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO,
 	ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
 	ALC255_FIXUP_ASUS_MIC_NO_PRESENCE,
@@ -4389,6 +4390,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
 	},
+	[ALC269VC_FIXUP_LUNNEN_GROUND_14] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1b, 0x90170150 }, /* internal speaker */
+			{ }
+		},
+	},
 	[ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -7974,6 +7982,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
+	SND_PCI_QUIRK(0x2782, 0xa212, "Lunnen Ground 14", ALC269VC_FIXUP_LUNNEN_GROUND_14),
 	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),

base-commit: 2d0769387594eb26df33c72c08c6429e4fddf5fd
-- 
2.50.1

