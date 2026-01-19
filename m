Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC529B8EF;
	Mon, 19 Jan 2026 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835800; cv=none; b=gTvPC2l/La5ZiZgIRzXXIk2J39fHRuzlGpl2kXODMWZmc7P4RYT8Gxw+UhKEw97zRYTEQnYE8Y214ehDMBdVRnEP4lfrTBnqbSI0K+ZzPBYbhBcAd+L4VU5Dvf00TeMKSuCZNzOg+RryLZ3GK160RlS5ka11miAYQn7hc6lakaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835800; c=relaxed/simple;
	bh=JLoMe3A77iq+gQ9rLjWrpb9PYs6fTebJYpx2GEVdfHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDdcWI/Ro1RXZQoqSTPNueccKE771ue1UGHOgfQ7iWidyG70xFuFNcp+aEDG0UgBszWcRFEBy3HMWAazOmt2r8cCjK8tFodnfxJ6QKvbqbl738yWPfZJft3QN5DI3AbrjxD4ZpN0lqS9eVtmIiceoaY2nCzjohABrTq+T6a3EhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=o8w4J3wF; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="o8w4J3wF"
Received: from wse-pc.. (unknown [61.8.154.9])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 657AB2FC0052;
	Mon, 19 Jan 2026 16:16:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1768835790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S/rnZ/cwW3S/SGKEkQerxcXL0bQbURfsipIJYk0rMAg=;
	b=o8w4J3wF/U3qyVaYjUTCo9njJj+efehckGiS1169bm73iwQLPlT2EP33W3mUfSPfOnLepS
	7vsVnFF0ylwYbY1JVuIj6VildrcZfkEVivtbn3PyjLHiAG6WC9e1pQv+Beh2L85d/OKk+r
	chM5pswyPopGG46JV+0ULme68eTN31s=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix headset mic for TongFang  X6AR55xU
Date: Mon, 19 Jan 2026 16:15:55 +0100
Message-ID: <20260119151626.35481-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
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
 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index eb6197d19078c..24d534f6d3d3a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7674,6 +7674,10 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x12, 0x90a60140},
 		{0x19, 0x04a11030},
 		{0x21, 0x04211020}),
+	SND_HDA_PIN_QUIRK(0x10ec0274, 0x1d05, "TongFang", ALC274_FIXUP_HP_HEADSET_MIC,
+		{0x17, 0x90170110},
+		{0x19, 0x03a11030},
+		{0x21, 0x03211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0282, 0x1025, "Acer", ALC282_FIXUP_ACER_DISABLE_LINEOUT,
 		ALC282_STANDARD_PINS,
 		{0x12, 0x90a609c0},
-- 
2.43.0

