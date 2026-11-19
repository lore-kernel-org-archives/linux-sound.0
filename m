Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068400;
	b=fZd8CLMCGsd29Fk53sbVxWtwv+jssDDsJMS2+BQPmsYLramPD+q/gR0fdQurc5H8AwOG
	 ea7LoXzKxw0p2Hize9O8ki+4KFk3Erd2PE/uwAjM2ax0AGqoVtlTgYWlPhVClSDssQMou
	 QR7jZKrGqDvT81ytqM+5SkijEAO2IDTUr2vzVUJ8yiq1KIR5NCY7Il59NfH9DixubBkKY
	 ZLKQEB7XppJJb7AtNO6j+W2hXfrg8q16y/+rESzno/MFiBegtIDak6d/OTjCGJYlufuMz
	 Xl4IZ0UNl4AzM8hkqJL9YwG9mMNBqIA7enROHAEXA2d6MBxL9B2K/D3gOlczQC6sDPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068400;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Uf7K5zrslglubPN6D1YV7ahClAMFdOKaoTZaYtz/J5w=;
	b=UF4gE2n8OlRGv9ey7lUecYwEO6mQKritdP7zQaJ3q6nA8cIjrtAvrA1hTRkK5DuI5Af8
	 4TU9qsPOAxgpzyp1LvOLbMsJeQag6Pce4o+Z/ZeVwdhTqEybyA6hxBHgbSlYuH4K6l702
	 ud1EfV2nGUUUX32DtbTKmxqmkgvgFc8Ckb21rfIgFLgCSabAIi0pBOQh3GvnlA3ExqhIh
	 S23lrNlK3Ok17Gj87sk3I3hEakAZn0VMeHAArq+iSqliABkFtSIXEdy7WV82CV63IkMq2
	 oIrb6evDtykt9R8PfwUzS7bxS3C24vgBrzSGuZ1AZ4yZDIu/oQrs6CTaeA5xui1unxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=JOxvhZ4P;
	arc=none smtp.remote-ip=185.125.188.120
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC33606A320;
	Thu, 19 Nov 2026 06:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC33606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=JOxvhZ4P
Received: from localhost.localdomain (unknown [10.101.197.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 03A4B41505;
	Thu, 19 Nov 2026 06:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795068397;
	bh=Uf7K5zrslglubPN6D1YV7ahClAMFdOKaoTZaYtz/J5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=JOxvhZ4PfbNJ26U1IW5iYqU7IC3iOeFguA0LxVK58oyBpcMm0AdfYDcWHI1UAToz+
	 Y1cLQ9IwIe41AZogNjoChh6HvR5N8D301EsMeztpbaUB4biawy+CsuqMsrEMmJD74P
	 Xjp24Xlw2tmw1rLG5gxt5Kz+9FU42otXylosehAUvPbrPuIkfw1i7ZVua0LHMsiO5e
	 6TDHUp8opDGPOfHFZgn0tc1eG5lyNuqVGVGNG4Sr75NDt28RD1iGUkalP6B60sJrFp
	 R6Zi5tHoZiM+RhAqn7aByBKwszgKNWs16ycCSx2JL+Gd9j8vSLJ9GmKoe1QweQPQCX
	 r7JT9xKZ+9fuQz+PZ5fpq3hKhsEmkWNEYHkBqTvBBdHX2rgVIoZzIvxWYNbLft/cuI
	 oNOGKewCUbmFtIyZTL8PCNqVYpgfglI+q4xDJOR+L7ExKm4y60jZ+BN/j9ON8MLS7D
	 BRlwquXxCFQ4FEmYDh/UtuAx/WDK7cvWBvbnt/rVa97wXI7HPjDE2rS0v2wVFfQtIJ
	 jmFMZ2+1K/c4wGhDpVxmPHckSFXt28lkdUkLCCCaxjxda189IhzvTPWY/YZzUvHHDE
	 nJyWG+XUkjES/1reVtAH3PGPshvrZmU6QQslx2Keb8wFu6ZwQZXosTB0VT3mZPuFy7
	 7rsJa6grB1RrGWDZLLNGV4J8=
From: Dirk Su <dirk.su@canonical.com>
To: 
Cc: dirk.su@canonical.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Kailang Yang <kailang@realtek.com>,
	Eric Naim <dnaim@cachyos.org>,
	Matej Sochan <matej.sochan@gmail.com>,
	Denis Yakovlev <mfthesun@vivaldi.net>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add LED fixup for HP ZBook Ultra G1a Laptops
Date: Thu, 19 Nov 2026 14:05:49 +0800
Message-ID: <20261119060604.31205-1-dirk.su@canonical.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ZBook Ultra G1a laptops requires specific LED control method
ALC285_FIXUP_HP_GPIO_LED to work

Signed-off-by: Dirk Su <dirk.su@canonical.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a43bfcf9705b..d38be4d500b2 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8167,6 +8167,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1024, "ASUS Zephyrus G14 2025", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
+	SND_PCI_QUIRK(0x103c, 0x900c, "HP ZBook Ultra G1a 14", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x1044, "ASUS GA403UM", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
-- 
2.43.0

