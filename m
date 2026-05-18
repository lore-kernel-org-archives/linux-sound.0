Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD967480DEB;
	Mon, 18 May 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114047; cv=none; b=EhlQ9XBmSmk1XsX/u8RdqxXzc9UdGcA27AT56sPyorH+/AWjaLvM8orSxTS8G/ZKf+WeSHaF0XicqoULa99iB+t3KZ+BP/rF2/krEZRRSnA8Gx2V8N+ozE7rVLkkjMvA7ZrZ6lE8YZNZryqPUfRgONP6FKa8+yJTLcrO4esWj4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114047; c=relaxed/simple;
	bh=zOP61I2trmgbCJs/Xg6hHhDYoM+WA89uYNUSP8i7dTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SktO4Bpe53TaEuml3aKL0ZzMyRS2QZ1P8GrUFAYEbAFFjSREhLa+Udq6pTE9/Yj05iG6aAXDUM9e07UjyZQOYsRqnxj5trrQeJs5GA06rjKgmJFTfINkU2FLTg7H9moWhhBqUPFCAPuuxgt/nkbAZ/11Uj5kuwy40wUCf91IfhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=pWcZD2bp; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="pWcZD2bp"
Received: from wsembach-tuxedo.fritz.box (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 960002FC004D;
	Mon, 18 May 2026 16:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1779114037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZFgBkIgX6f3aDECP5IXX69BgV+AVYv5x9bEJ69Kmb9I=;
	b=pWcZD2bpBsZ39BeYO76eUT1NKDHo258YSQendEkw1OMeg/+0LJ9l+0p+LgsQB1iYnv7YiD
	SYeH1lBbl2nVz3GnVBHgaAWOb9k751Wyw1DPJhoxHnAZghLiS8AffTLk0xDkaF/yZ0zD6C
	WWOC2hlWOnfAB0NSILQQSJSdtOvwKDQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Fix noisy mic for Clevo V6xxAW
Date: Mon, 18 May 2026 16:20:01 +0200
Message-ID: <20260518142034.65227-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aaron Erhardt <aer@tuxedocomputers.com>

Add a PCI quirk to reduce the volume of the internal microphone to
prevent extremely noisy signal.

Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
V1->V2: Add cc stable
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2f5d13032fd7a..b6b0237d79696 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7603,6 +7603,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0xa741, "Clevo V54x_6x_TNE", ALC245_FIXUP_CLEVO_NOISY_MIC),
 	SND_PCI_QUIRK(0x1558, 0xa743, "Clevo V54x_6x_TU", ALC245_FIXUP_CLEVO_NOISY_MIC),
 	SND_PCI_QUIRK(0x1558, 0xa763, "Clevo V54x_6x_TU", ALC245_FIXUP_CLEVO_NOISY_MIC),
+	SND_PCI_QUIRK(0x1558, 0x6480, "Clevo V6xxAW", ALC245_FIXUP_CLEVO_NOISY_MIC),
 	SND_PCI_QUIRK(0x1558, 0xb018, "Clevo NP50D[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb019, "Clevo NH77D[BE]Q", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0xb022, "Clevo NH77D[DC][QW]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.43.0

