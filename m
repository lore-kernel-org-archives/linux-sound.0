Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171D5369D4F;
	Mon, 22 Jun 2026 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113406; cv=none; b=EfamsyPGD6QZjgvP20ugkuSrUKk9VGnT0i3rt1u5GRgoAM6Z6XHM15OB2AZdMFz0c6E5kc6IDB9KYcSnM1hfPGYaUjC62bi+oxctFLx7IWIx7xzSy5M7aZaAdm3YVJj2nbSpsFvCRS2A90C5Syq0PdRgPlsz99D/AswfCOVHxG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113406; c=relaxed/simple;
	bh=hRygkT5Fud6kmaXDDEGtLB52497Aypb/vw15rFpp25I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QIm/AhN64byIKx5HYqx845T1gJBDRLh2uWnc8xQb3ahR0CpXfUnY09HIGB27Pgt8FaR7//wlX9j/yzOkHPNR5Q/X4QbAivRoWnM4jSfk3zD+QpSvucDdt4I7JZRqdfJt8tz+Ran6sZkh5BxIKL5VGklWjre3vXhzGF03nnmUtJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=qMgURAQS; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="qMgURAQS"
Received: from localhost.localdomain (unknown [10.101.197.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 815D04205F;
	Mon, 22 Jun 2026 07:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1782112840;
	bh=tltXLRC3KKJbc/RCok2DekGfFxF7HQxnyqBLd5o64V4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=qMgURAQSIsWz7rLL5A1mZAKub/92Cik5O/oxzvbpE/KfaqNXUXX8q+Q/ILOe3AIoX
	 abUnaAuCGn8LTgTVYSC2ZlpMfFG0u3W6mGgACLLuGAWhL9OAgmzL9rSfKWd2Vo2SKb
	 z2kF5Eo5+caKLlW6M6nObpM2/lNB9ESfp0abxO7QNp+wKbDTCinhbnB1H1Qhzhkltv
	 WZFlA6TWgQZjGXZKq6tIDV67PCl97/RsOHxjM/6ZzE/unbqfmEMXlHkg+ku6aKkmzz
	 F3aKmbUZXZnIgzFsQSUPSrfJlqlteKthecaVg3SiEaZHX1zrABAIdgiWcrpNQ8Yg7q
	 EbajHDWoZSgYLgoZk5ZJfnvVjmFydAB3xr7+N583UMBhhLXztLwZK4ZyouuoDP0JRV
	 zB6b3phK2pKQJ81NGG/McnT15cvHJFAAxEzQBeWmrxqMbB+BhFNSpugsyuWozOrMhM
	 Vxr/HlJviL6+GoXnjTJwj3L5wbckjrWdbc7E+YiDVZvlWkfhZZbJt4/Ttu2Ukc2GMG
	 vMjVbzGM3jSSh2gP2gtfg5NYGZYricsxKd0punsEm0xLP5K1dpVrVVXgFewAXQouIH
	 VDaJ14dWCdBA2o6G6VfG71SXxhdwFCFxQCPc0GlY0TEGq5n00WmmOwHrmEnp622qZD
	 2hYh+80mEypxp8+H3/x1pX/4=
From: Dirk Su <dirk.su@canonical.com>
To: 
Cc: dirk.su@canonical.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add LED fixup for HP EliteBook 6 G2i Laptops
Date: Mon, 22 Jun 2026 15:20:04 +0800
Message-ID: <20260622072019.56351-1-dirk.su@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP EliteBook 6 G2i laptops requires specific LED control method
ALC236_FIXUP_HP_GPIO_LED to work

Signed-off-by: Dirk Su <dirk.su@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 2df491335a76..000c04974d44 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7328,6 +7328,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f0e, "HP ZBook X G2i 16W", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f2d, "HP Auster 14", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8f2e, "HP Auster 14", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8f37, "HP EliteBook 6 G2i", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f38, "HP EliteBook 6 G2i", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f39, "HP EliteBook 6 G2i", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f3a, "HP EliteBook 6 G2i", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f3c, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8f3d, "HP EliteBook 6 G2a", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
-- 
2.43.0

