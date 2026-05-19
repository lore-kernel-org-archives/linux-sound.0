Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E89833AD99;
	Tue, 19 May 2026 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205860; cv=none; b=hbRADqXPPFODkCiBkrA023f4vlzMgPl+Gbc/sz8maxpBS1dqswWZvKZ5YWmtaqCm83DqoJmbVz6/W9npeK2bMr1Ehio2mCLNchUq6tP9oO4Ms1kwl5+75FYGxK0WOkxJOktwPkSBLbR2kpnQnUHnF7ZpU1uAf10iTM6FvH5Fltw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205860; c=relaxed/simple;
	bh=gxFNiq+UhDexEf0lSceDE1ZuNuw4szyGGunNQk5iYhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qa1m7PdzIPDa395EmXTWQ3MbqUxEafDfhKyOe5N67eAfBBbsOLXEq60z4xg91b67FYvesYLlDDS/RGnygCFfAeqzAGQRaIhRfKbTxDj7orAnvc9rrLgmL29t+nq8PJXIyhnANFsOwz03PLFyiBOx6lOLZLcdDY5XZPM2j56GxU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=b775vVLK; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="b775vVLK"
Received: from wsembach-tuxedo.fritz.box (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 1A55A2FC004A;
	Tue, 19 May 2026 17:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1779205849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LV63yaHqj3bWCCQ1d5vQwbqD/LYQ1UdHJO8+U9Onkh8=;
	b=b775vVLKg/AqQI7Nzi94PGffw7F9E0ucIn4Ua1ShoABh2JigJba16ve8zJwM5PYSEKdj1w
	c6Ta04Y90+cPxIHZTllj8pdPIMf9sUR6AQUykWWP16NmX8SX22wQNho0kZd3B7rvcB1DmK
	kB6Z5bgWbZTnPJJF6TmdTrO2uouQH+g=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ALSA: hda/realtek: Fix noisy mic for Clevo V6xxAW
Date: Tue, 19 May 2026 17:49:48 +0200
Message-ID: <20260519155047.106096-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aaron Erhardt <aer@tuxedocomputers.com>

Add a PCI quirk to reduce the volume of the internal microphone to prevent
extremely noisy signal.

Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
V1->V2: Add cc stable
V2->V3: Correct place in list for new entry (sorry overlooked that Aaron
        already created a corrected version)

 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2f5d13032fd7a..bc7832a5b6973 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7561,6 +7561,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x51b3, "Clevo NS70AU", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x5630, "Clevo NP50RNJS", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x5700, "Clevo X560WN[RST]", ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x6480, "Clevo V6xxAW", ALC245_FIXUP_CLEVO_NOISY_MIC),
 	SND_PCI_QUIRK(0x1558, 0x70a1, "Clevo NB70T[HJK]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70b3, "Clevo NK70SB", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x70f2, "Clevo NH79EPY", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.43.0

