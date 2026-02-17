Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729C42D0602
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323730; cv=none; b=f68JFMkxNTF0XNHohab3htx2DF+4sEDeVViWtNHozOV2lWG7RTMslfOMaZwgoao8d/ryYFTV9jLOaluuSBkbGvtuwIXFrWLZwI4JUzWqVk+uZfQSYFknRikreGvnbWt5PEGdOhOXFQXrKtOCVNyRPVwkoGGQkbj0jMbro1ZCEWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323730; c=relaxed/simple;
	bh=6VZzx/kL2dvPzaEFaWwQ+R5XdhqPH3Ktk4NegYuQiDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rQXMxLbAUUZV5HL6WwBtIb0Ggjz1DVMZeOEAkPoYxOcnVyRi57xCihxHkR1JP6Nb2ja6IK76G6Qg3154zMDk9ifO2DcypiMbrhWnsZUdACi4QCJhkQYUReL/nhdR0ZL5G0rRi/N9irX+NRK9U2rj7eXPEi1BdSZCA+4ySKdBBUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmFRUrnZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmFRUrnZ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6e248aa446so1612896a12.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771323729; x=1771928529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odpiWOWJ49Gr7MKWlkFU3XEsAbytu1q3J5WtSm8EifE=;
        b=fmFRUrnZ/R74NPuwsMMDJhb6d/4NvQJ5sAe+QVoCz3ygnw9bCNUHHSnJxNtXSgQk/w
         XvNNWakoFdMauncEwNYmH9MyqpSLU5RFr9dvC6MwN3wNx2liki4VclAZ6vEf0KgsJLpI
         C3G3eu8DAUDUKcvcHP9l0tk/5DRo5H8IqT0hopFBDelxYZ/pfOiksrJACGP1o74VeVpp
         XZ5VlWw++xNHjiXp5jOvYc2y4PJ4kpZx9ATNTMxv3fN3J6gsvWx9eweQzKAsBtQt9xJ1
         NcQnXJ30NaPZqmqJD2dexwyeJbrNhsPIVcqvpAp+ftxGOM1IXS63brLEYuSYVCinKLOX
         nLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771323729; x=1771928529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odpiWOWJ49Gr7MKWlkFU3XEsAbytu1q3J5WtSm8EifE=;
        b=D+ztqtps+usMilqbjaKv6PFs0X5mzHcz3tBZcDMukSfIUm8bTngd16Z+0mmJCVO9ue
         6GH6ETcUSCcMHOfgojbeVJwwCzK4klqta1TnedGAtit4qNQ47CMoqEOcWIFtB8KArfbP
         3JG7fYQx4wPCpp8DLOxPAiaHuG4iWr4cs0FxhAsr14OJPJaEywClg6uZFjki7OXGpa09
         HtDEmhkpk9Xn4F+S7/E4D0E5m3gcuA413C8nEOr0KeHPf+55i5P2fd2zUG996FHKPJeO
         KAfGJjo0EW7FeCxCAg4g1KZUEgoFIKnXRcFDHQln8o2IlYGg6za/MxKtXl9L7aDJWeBf
         cdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcEsqzJFEEb11G7yyOBpy1rvz8JmwDJXx0lbxVyaXaJVC5LZ0MnkqK1ZCRJ6aCPGE0HpivXlU+9PoBIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUZvUNiyCO4TX8ltELMZVOqyLAJMhEn3WFLIl+swiy0iJslZZl
	ZCjNYbfY4XmB+Y345qX/om1jjIBWphB5jAVFoDc+E0MTQZDnBzZjvY3k
X-Gm-Gg: AZuq6aI/7SCrGY8/1KMp2QvQ277DO7rzIzRHo1Oq5N5nBngYcacVLROT7JZI7dyRAUG
	Kj9yl9QqHS6+Ez8+8xBlvE/depq8HRf2RNby5myeCwnW8hKZryShXrKpKWlK5NOs1z3pmyJJiSB
	q/uMYYqruHLuPVMjHw4SMNhhN6Xb6EodjTqZO43zVZaA8Odj7LpvRcQeL7vq4Tp0jLhCgHTXX2S
	TqNAk8lxWrABIqNeR2XXJ1M+qF5vItHE4qjiei/dYz7eFh8w7aMli30LNfWGDqbJWatKZeuLmlN
	sIfDfeE+BAW1kj+BCknzCw/UxREErqM1iZrVq8tfaGfdxtZAom9cjN+J7v0PmpwJEzDerv93NyD
	SYMMP5oUViDahhlI4Lmg/sAUmf4Nm7ZXpBbTYCbQa9da3BFliyYbeuv9Rib7v5cuPddwIgk3yFQ
	QNXn0V7ypcEotSbjuz
X-Received: by 2002:a17:90b:1a86:b0:354:9b26:cdfc with SMTP id 98e67ed59e1d1-356aabe68e1mr11547802a91.11.1771323728786;
        Tue, 17 Feb 2026 02:22:08 -0800 (PST)
Received: from amarui ([103.216.223.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662fac3c1sm22317999a91.17.2026.02.17.02.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:22:08 -0800 (PST)
From: Erik Sanjaya <sirreidlos@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	chris.chiu@canonical.com,
	Erik Sanjaya <sirreidlos@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14 UX3405MA
Date: Tue, 17 Feb 2026 17:21:12 +0700
Message-ID: <20260217102112.20651-1-sirreidlos@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS Zenbook 14 UX3405MA uses an ALC294 codec with CS35L41
amplifiers over SPI. The existing quirk for this model only configured
the amplifiers, leaving the headset microphone on the combo jack
non-functional.

Introduce a new fixup that configures pin 0x19 as headset mic input
and chains to ALC245_FIXUP_CS35L41_SPI_2 to preserve speaker
functionality.

Similar to the fix done for the UM3406HA in commit 018f659753fd
("ALSA: hda/realtek: Fix headset mic on ASUS Zenbook 14").

Signed-off-by: Erik Sanjaya <sirreidlos@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 80f0be13b69f..7b05d24f8253 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3886,6 +3886,7 @@ enum {
 	ALC294_FIXUP_ASUS_MIC,
 	ALC294_FIXUP_ASUS_HEADSET_MIC,
 	ALC294_FIXUP_ASUS_I2C_HEADSET_MIC,
+	ALC294_FIXUP_ASUS_SPI_HEADSET_MIC,
 	ALC294_FIXUP_ASUS_SPK,
 	ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE,
@@ -5236,6 +5237,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_CS35L41_I2C_2
 	},
+	[ALC294_FIXUP_ASUS_SPI_HEADSET_MIC] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x04a11020 }, /* use as headset mic */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC245_FIXUP_CS35L41_SPI_2
+	},
 	[ALC294_FIXUP_ASUS_SPK] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -7189,7 +7199,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV", ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1a13, "Asus G73Jw", ALC269_FIXUP_ASUS_G73JW),
-	SND_PCI_QUIRK(0x1043, 0x1a63, "ASUS UX3405MA", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1a63, "ASUS UX3405MA", ALC294_FIXUP_ASUS_SPI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC294_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1a8e, "ASUS G712LWS", ALC294_FIXUP_LENOVO_MIC_LOCATION),
 	SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
-- 
2.52.0

