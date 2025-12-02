Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F330F7F3
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 15:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764690615; cv=none; b=o5krz8kOuKRA93+BCerpptpO8lzdBGuorAJZn9kOsTg3L583gcjuPznpTCpyHfYQCMxhTt2jgEnD1uHQFXNZbOESoNId6g+ns85GU0rtUQGmlLeiiQTAK3yf8fHANpFCNyx01VhIoTHtwoXnadQN6+WtcLcFqgiRtEU8mrgVlEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764690615; c=relaxed/simple;
	bh=U1SKcNOF8MZPUhTpTtdqifT6JpGRY4x49+UW+vUxzpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYjSxiYBfpANXjyYy+AW4cp73IoblGWWhqcjv3PsZNL1D0rFwfaexlV42PUruyIxaagF2xy3BveqRkv76gXJTW4LRJBiw3NdNDjNEGjsviBDu48GxziJoNPzG3CgRoxHqKuUeJAH0+MAxWuPE7WQ24YLdsZGgfLAhF2mlMgU12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gsnoff.com; spf=pass smtp.mailfrom=gsnoff.com; dkim=pass (2048-bit key) header.d=gsnoff.com header.i=@gsnoff.com header.b=VfnnhP7O; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gsnoff.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gsnoff.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gsnoff.com header.i=@gsnoff.com header.b="VfnnhP7O"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4dLQFs0CrwzB0pf;
	Tue,  2 Dec 2025 16:50:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gsnoff.com; s=MBO0001;
	t=1764690609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjGX0fI7HQIQSyULVM+IAlNuPRWjPQtBJCF00VOQ+ZM=;
	b=VfnnhP7OPxGhctfwl0tHJwVEmrHH8pDr87fMz5Gt9O/mdLqyiz1OUJcCYSotfk/8YHSkas
	WsT7SgTyD+bFmpUi1JhGKfbou8zdWCo2OCTgOsCxS+uuB+g2mlZVRz71wYWyqGWjaqg8fn
	4sPE6sAibDKETuAlDvhX4OhJnn4hMAk6sUEiqBXxiUHAyMQsGL5UnpLRaUcDYWPNTLPtBs
	5Xd7e/9/RCXb9uxSFiMYUM8xzZ4ZvLSp0EeKFxauSam9GG+Ak+EvGCba8CT4zlyKINfFwU
	b8PmBk4RfnpICe9aR615cHVRUjGt7aNB4zWcT5X4F3CSUF9TsNAT0eHPzYYxvw==
From: Ilyas Gasanov <public@gsnoff.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add PCI SSIDs to HP ProBook quirks
Date: Tue,  2 Dec 2025 19:49:30 +0400
Message-ID: <20251202154930.74481-1-public@gsnoff.com>
In-Reply-To: <20251202131508.56184-1-public@gsnoff.com>
References: <20251202131508.56184-1-public@gsnoff.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to HW probes, there exist upgraded variants of HP ProBook
440/450 G8 notebook PC hardware, with PCI SSIDs not yet covered:

 - https://linux-hardware.org/?id=pci:8086-a0c8-103c-8a76
   (HP ProBook 440 G8, SSID 103C:8A76, Tiger Lake HDA, ALC236)
 - https://linux-hardware.org/?id=pci:8086-a0c8-103c-8a77
   (HP ProBook 450 G8, SSID 103C:8A77, Tiger Lake HDA, ALC236)

The HDA GPIO indices for the mic mute (0x1) and speaker mute (0x2) LEDs
are virtually guaranteed to be identical for the HP ProBook 440/450 G8
variants with motherboard SSIDs 8A74/8A75 (BIOS T87) and 8A76/8A77 (BIOS
T88); especially since spare keyboard parts are interchangeable between
different revisions of the same notebook models, and thus necessarily
have the same slot pinouts.

Signed-off-by: Ilyas Gasanov <public@gsnoff.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4efc16ae6b5d..d90a6c01f63b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6598,6 +6598,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a75, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a76, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a77, "HP ProBook 450 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x8aa0, "HP ProBook 440 G9 (MB 8A9E)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.51.0

