Received: from mailout1n.rrzn.uni-hannover.de (mailout1n.rrzn.uni-hannover.de [130.75.2.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECCA33B6D9;
	Tue,  9 Jun 2026 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.75.2.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014626; cv=none; b=YGFe7rCoPvDvNjHOrt5da1P+BMzTF6b/rg61VAh3RMtSQxWsFILxDLvTARTLQwybZAg6xtoK3wRjpeWyz7f9DiSsNRK8JaFcrWOLjr9cukryeAmRb12+it5WJU26dWNt4hCLMW2DtEtCprboIp/Vabxy/ilCl0VkyWZVUvKRKRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014626; c=relaxed/simple;
	bh=v9Xjp5WDOt6rPgE3bbkhfYbSAPeo5LAza3PYMIsO0sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezRBlwYRup9S4hZNGJlkuMDIEbtz4gxt3H9XFqm5ngiwJhuK0YaX7v0Zb0XIdn7DCVloXy+BWk4VX03MbFv36f91/XFRT1TFKJ3J17ZxVp4cCAb1p/5CT5u+24ut+oQ5Mtc8IYyXjhaaofSi7Jwm3VK0S+nenEPK5ldISure6xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stud.uni-hannover.de; spf=pass smtp.mailfrom=stud.uni-hannover.de; dkim=pass (2048-bit key) header.d=uni-hannover.de header.i=@uni-hannover.de header.b=tv4WFFM/; arc=none smtp.client-ip=130.75.2.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stud.uni-hannover.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stud.uni-hannover.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uni-hannover.de header.i=@uni-hannover.de header.b="tv4WFFM/"
Received: from moritz-Yoga-Pro-7-14IRH8.. (ip5f5abb0d.dynamic.kabel-deutschland.de [95.90.187.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailout1n.rrzn.uni-hannover.de (Postfix) with ESMTPSA id 1FE522C2;
	Tue,  9 Jun 2026 16:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uni-hannover.de;
	s=2024all; t=1781014621;
	bh=v9Xjp5WDOt6rPgE3bbkhfYbSAPeo5LAza3PYMIsO0sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tv4WFFM/Q/H6WInEmP94AgzVjLohjgIdmPuyDdlgnj25Ccc5VXYLLg44jBBvZCAIv
	 ics6cXFAaDmb587pz/7OV+L0I4+Ikzb8GkNNTdW5xpCaOIQ2YKsCPRkejSUFuvIugN
	 SI8+ilSRmeqFqMD8tYg713555JwjvIrqIgN/EpjazV2aPnmE9akceSJBxu8yuwEFIZ
	 su3HCIIvqBBkTsUZwSA79UbRulWM1UOoaKXczfA79LOB0FZpuspEE35c3dDg7oblkM
	 5U0S4qXsNgcB9ixJGlIQt6zetUIoJia+XdOpUTXojfjxAaJ03um4Gtq8kr5OAgAJup
	 cclrWO+cDO2QA==
From: Moritz Baron <moritz.baron@stud.uni-hannover.de>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel@i4.cs.fau.de,
	Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>,
	Moritz Baron <moritz.baron@stud.uni-hannover.de>
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IRH8
Date: Tue,  9 Jun 2026 16:16:48 +0200
Message-ID: <20260609141648.60608-1-moritz.baron@stud.uni-hannover.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87ecig6l1v.wl-tiwai@suse.de>
References: <87ecig6l1v.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.9 at mailout1n
X-Virus-Status: Clean

The Lenovo Yoga Pro 7 14IRH8 (ALC287 codec, subsystem ID 0x17aa:0x38b1)
has bass speakers on pin 0x17 that are not routed through a DAC with
volume control. This causes the bass speakers to play at full volume
regardless of the volume slider position.

Apply ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN which corrects the DAC
routing for pin 0x17, enabling proper volume control. This is the same
fix used for other Yoga Pro 7 models with identical audio topology
(14APH8, 14AHP9, 14ASP10, 14IAH10).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217949

Co-developed-by: Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
Signed-off-by: Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
Signed-off-by: Moritz Baron <moritz.baron@stud.uni-hannover.de>
---
v2: Move the quirk entry before 17aa:3852 and add a comment to
    clarify the PCI SSID conflict, as suggested by Takashi Iwai.

 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index dcbc669842e0..dbd562c7c626 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7713,6 +7713,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x38cf, "Lenovo Yoga Pro 7 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion 7 16ACHG6", ALC287_FIXUP_LEGION_16ACHG6),
 	SND_PCI_QUIRK(0x17aa, 0x384a, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	/* Yoga Pro 7 14IRH8 shares PCI SSID 17aa:3852 with Yoga 7 14ITL5;
+	 * use codec SSID to distinguish them
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x38b1, "Lenovo Yoga Pro 7 14IRH8", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
-- 
2.43.0

