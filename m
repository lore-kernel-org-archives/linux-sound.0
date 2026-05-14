Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE94341ADD
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765507; cv=none; b=G18GjdlbKQpn0DCPpJZ69hWsqhjSoUOHDprhnNVdDju7I/QXabh0ovC8acHP/DNLTqJcZHMUVc/lIaleVBHwStiuVncAeDy0M49yvRr+cus2SNq+7FBjVbh3e9Mnxl87agXkDZJ2ZABDF251eua6lAGji3jbG7CkUDrIle6nt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765507; c=relaxed/simple;
	bh=d2/AYwZ8sQRUMjOA5mOBgLZVoRqLXHjg0ry17DSBkIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQdvupPbXzni5KEaaYgWe6uKVU1K+fi8EgVeKzHJ0P4wuOTaq/bfKj3K1uqlOxCMr1aFXongvDsW+byIkX6C74Ved2ebo9tg5iqvw7iIiZFoshvBsdHOxvuviHCZoyqwEhKHe/4SDmTti9fRmu124rZi//OhxwevTWxcArZAZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=future-machines.org; spf=pass smtp.mailfrom=future-machines.org; arc=none smtp.client-ip=45.157.188.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=future-machines.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=future-machines.org
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gGWSk030jz6tr;
	Thu, 14 May 2026 15:31:34 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gGWSj3KmXzf4L;
	Thu, 14 May 2026 15:31:33 +0200 (CEST)
From: Heiko Schmid <heiko@future-machines.org>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	Heiko Schmid <heiko@future-machines.org>
Subject: [PATCH] ALSA: hda: Fix SSID detection for HP Dragonfly Folio G3
Date: Thu, 14 May 2026 15:31:10 +0200
Message-ID: <20260514133110.12302-1-heiko@future-machines.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

The HP Dragonfly Folio 13.5 inch G3 (PCI SSID 103c:8a05/8a06) BIOS does
not program the PCI subsystem ID correctly when the SOF audio driver is
used. This causes the codec fixup lookup to fail as the PCI SSID reads
as 0x0000:0x0000 instead of the correct 103c:8a06.

Fix this by falling back to the codec SSID when the PCI SSID is zero,
and add the device-specific quirk entry for the HP Dragonfly Folio G3.

Signed-off-by: Heiko Schmid <heiko@future-machines.org>
---
 sound/hda/codecs/realtek/alc269.c |  2 ++
 sound/hda/common/auto_parser.c    | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 22b2f67..494dd0a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6990,6 +6990,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89ae, "HP EliteBook 650 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89c0, "HP ZBook Power 15.6 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio 13.5 G3", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89c3, "Zbook Studio G9", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
diff --git a/sound/hda/common/auto_parser.c b/sound/hda/common/auto_parser.c
index 8923813..e876378 100644
--- a/sound/hda/common/auto_parser.c
+++ b/sound/hda/common/auto_parser.c
@@ -1048,6 +1048,16 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 	if (codec->bus->pci) {
 		pci_vendor = codec->bus->pci->subsystem_vendor;
 		pci_device = codec->bus->pci->subsystem_device;
+		/* Fallback: use codec SSID if PCI SSID is zero (e.g. HP Dragonfly Folio G3 with SOF) */
+		if (!pci_vendor && !pci_device) {
+			pci_vendor = codec->core.subsystem_id >> 16;
+			pci_device = codec->core.subsystem_id & 0xffff;
+		}
+		/* Fallback: use codec SSID if PCI SSID is zero (e.g. HP Dragonfly Folio G3 with SOF) */
+		if (!pci_vendor && !pci_device) {
+			pci_vendor = codec->core.subsystem_id >> 16;
+			pci_device = codec->core.subsystem_id & 0xffff;
+		}
 	}
 
 	codec_vendor = codec->core.subsystem_id >> 16;
-- 
2.54.0

