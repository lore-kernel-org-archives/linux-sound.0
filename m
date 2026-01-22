Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFDB3587BF;
	Thu, 22 Jan 2026 17:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102309; cv=none; b=I+QCwBWIW4QEe1tAANVcTPTAbfdSM4fYvPztmEeaK8IDKXfR/g9dPBwJ8l20vLSXxf/iBL+Pbdg3R7TcW3pJQgRGCcOS/Y9WaXfr0KAWr9sRT+w+stvxpd6bknvpb8O2cYKuUtWb5NOG73Dna5CdHAlE8le1jAQN6hgkW50e4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102309; c=relaxed/simple;
	bh=Dnyb85sbwXXiWgqJ3vZi09OMFADDLCLI+dxu/Dh1FQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B452zBwdQGUa6Eojy6pWxAbC743yMAKItSWBWlXvyh4nt1gWHyM1nHfBcyiAVjoDmIhPGr3vhyU91vf+lkonU+mgAdnM9jwqxL3UzEmZw5X0K/J7g5dsfC4C+AsEUruNcWOAexvzpW6cv4DrXmL26VrigWSsSPTIfd2sEPUcfbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=GSAwoMu4; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="GSAwoMu4"
Received: from wse-pc.. (unknown [61.8.159.47])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 755212FC0057;
	Thu, 22 Jan 2026 18:18:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1769102288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qp8mjxZT60qZel93vAHE5AR+nFbtsS/0qxVv7LKYhgU=;
	b=GSAwoMu49nNOn9QZIznPhb2MH02MFtzKNhfyiJ++lQO+plfkFWZKZxRpay81bspoJ+hHAp
	gI44uIoCVGPoGvaArQ60WtAyrpu/+ZoykQSyeOLEMXKn7NholWAayKIiv4o/eOGPc0zFwY
	s5x6WoamxNGGKFS0GyYGjbhpG1KeU90=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/realtek: Really fix headset mic for TongFang  X6AR55xU
Date: Thu, 22 Jan 2026 18:13:44 +0100
Message-ID: <20260122171543.19958-4-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122171543.19958-2-wse@tuxedocomputers.com>
References: <20260122171543.19958-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>

Add a PCI quirk to enable microphone detection on the headphone jack of
TongFang X6AR55xU devices.

Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index eb6197d19078c..c709d19a824d3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7205,6 +7205,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d05, 0x1409, "TongFang GMxIXxx", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d05, 0x300f, "TongFang X6AR5xxY", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d05, 0x3019, "TongFang X6FR5xxY", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1d05, 0x3031, "TongFang X6AR55xU", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d17, 0x3288, "Haier Boyue G42", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
-- 
2.43.0

