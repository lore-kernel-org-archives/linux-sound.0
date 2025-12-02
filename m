Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FD9158535
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764681352; cv=none; b=FQEPhR3vnCjyC9TPNO1VmS9wscuVvLDvyUYiA728RZUxRp15RyfvfVgo69rbietLaXL3+UhmD7SDFThC6UEbNT/tKZe3Lv2YsSJU+zYZ/Kx3crwuNe8y2XGUg2pCy7Okb+W86Jas3wOGqNQlop1gi4YAUVirc55yD7RMjnrV0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764681352; c=relaxed/simple;
	bh=wsBSS81vmxIXTlSP724NW3QUzT9Q7REy8+kylwXIXVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QVPKBHfOZDR81d6KGq63WXCwBqUBw5crMunf3YRa2m+3yDD66iyuHRlvETAGrwLKSYybYyCMlAm2+LqSuXkIAYuRSl8N/d9sxWXOX7mGh0Q64YgfFsm3Um8QUbu+ZYEK0KvSA6t6ORTfmNIMcyiZO7fCOdx2U9z9iEvgb2UIyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gsnoff.com; spf=pass smtp.mailfrom=gsnoff.com; dkim=pass (2048-bit key) header.d=gsnoff.com header.i=@gsnoff.com header.b=1gQS0uPO; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gsnoff.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gsnoff.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gsnoff.com header.i=@gsnoff.com header.b="1gQS0uPO"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4dLLqb3hwYzB0qL;
	Tue,  2 Dec 2025 14:15:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gsnoff.com; s=MBO0001;
	t=1764681339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3qoChmlD/B/1y0lQ865GhEyPzytsQit+uw+jnRZECMw=;
	b=1gQS0uPOc4fpuTL+TzmcN60JjXsp+0F65Vt99Nh0eC6xLBkobIKUg3PaFkycA5Rtj5Jg6r
	wD0+JlOffpNvhDhs1m81nZ1czca45GMQ4ZV/pvLNA/TYL/9UQZ2n0UeaLqauT5sxpPG3TI
	v/dZhon/+FV2tFFHpLJTs8Y91rGow12EltjLhdl6w1VxcIEMJl8v+ZktrlLS8GCyU6rDNI
	28A8+ClYw+k5gLGNRRMcXRt0fAvLNqbRpFI8Xdq23j3rDFMpyxiA2FG8h4pEZovoMxVu5B
	8IDxq26dDCgQ5l9KBoh3HscHNQjb4pwFUbFuaDO/JjV2fxz7klMmGxds2kRfEQ==
From: Ilyas Gasanov <public@gsnoff.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add codec IDs to HP ProBook G8 fixups
Date: Tue,  2 Dec 2025 17:15:08 +0400
Message-ID: <20251202131508.56184-1-public@gsnoff.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to amixer output, as well as the result value of the
GET_SUBSYSTEM_ID HDA verb, the codec's own subsystem ID may differ from
that of the HDA controller.

The snd_hda_pick_fixup() function specifically inspects just the codec's
subsystem ID, ignoring that of the controller, which causes mismatch on
machines where the above is the case, unless the codec's subsystem ID is
also covered.

For reference:

 - https://linux-hardware.org/?probe=9829e4ea09&log=amixer
   (HP ProBook 440 G8, MB 8A74, codec 10ec0236,103c8a7a)
 - https://linux-hardware.org/?probe=5b2ca9b826&log=amixer
   (HP ProBook 450 G8, MB 8A75, codec 10ec0236,103c8a7b)
 - https://linux-hardware.org/?probe=228aee06a5&log=amixer
   (HP ProBook 440 G8, MB 8A76, codec 10ec0236,103c8a7c)
 - https://linux-hardware.org/?probe=1cd4bf968d&log=amixer
   (HP ProBook 450 G8, MB 8A77, codec 10ec0236,103c8a7d)

Signed-off-by: Ilyas Gasanov <public@gsnoff.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4efc16ae6b5d..d34a196158aa 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6599,6 +6599,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x103c, 0x8a7a, "HP ProBook 440 G8 (MB 8A74)", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a7b, "HP ProBook 450 G8 (MB 8A75)", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a7c, "HP ProBook 440 G8 (MB 8A76)", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a7d, "HP ProBook 450 G8 (MB 8A77)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa8, "HP EliteBook 640 G9 (MB 8AA6)", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.51.0

