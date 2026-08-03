Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAF833D6D2;
	Mon,  3 Aug 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748304; cv=none; b=XErUYPU00TImCmH23kTr9uSiW6o7QDRyDDaQdkpal4PRIGr2vx7/fq6/ekaJkbXVoe7+x2maYFtaaTekMD+U+14Cwj/UanSWN+/a172ZUw7Ay8qo5hyIw1OjfHdsvHDdLRDTF3Hk+MaC1thDv6agSTYjzoAJ7z1K7MY8MAZ8g6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748304; c=relaxed/simple;
	bh=FZXsjAejjTVb9TxrOzoasgLiRrc7R/AI1MTU2WKEHYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDSjss1rFH5v5Z1XDLLhon8rHvbWaB9E8he4iUNR14CGIMVe6IGUzW+qD77lwFa//ow7LnNxOImQpZ9Hk9rGiZs6Db4Z2mqaOEWPXv5wDGdWNYZuz1Pm64NHs6gTYUsOcO20n5W0syfZWYnYl4u5lHNngZzJZ0Jv/QJwrX5UyL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=R1wDYj7X; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="R1wDYj7X"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AFFEE28055C;
	Mon,  3 Aug 2026 11:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785748301; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2ZZsDIIuXhB4VGzOl/ljfYoZk3g6kuDdSPuL9MLfDn0=;
	b=R1wDYj7XnRo8QzECU/g9FJG2Jaal/n2kej3nwMtLOIPmMl4v1I9Yv+Grki5FXInJMe6F6/
	9ro0C6Y0CEk4HTu8hUKGlwdFjX0Lb/E7M+FYQ2b83vKLB5RririzuII0PzZryuK9P6N6Wj
	ucpmRU042uPTTeVNHEkCKggGZSj+7I0jKNnIhcriA5ELmaz2Cy3lrpmLQoyd1FDcpwt6Do
	QjSxV+Nv9HqIVW4o+gze6F24iukFlfNMmpdF3j3Qedz8bTT8dWcfwVUwux6wpBpwzle19B
	pt2uYOkP/QpzMy4rJLqimrdJHbyuqrR9moFD688mOzzscYWN3OGw+DPS0emAaQ==
From: Eric Naim <dnaim@cachyos.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] ALSA: hda/realtek: Remove ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST
Date: Mon,  3 Aug 2026 16:10:54 +0700
Message-ID: <20260803091102.107570-6-dnaim@cachyos.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803091102.107570-1-dnaim@cachyos.org>
References: <20260803091102.107570-1-dnaim@cachyos.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Now that ALC269_FIXUP_LIMIT_INT_MIC_BOOST is no longer chained to
ALC269_FIXUP_THINKPAD_ACPI, ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST and
ALC269_FIXUP_LIMIT_INT_MIC_BOOST are both identical. Remove the former
and replace it with the latter to avoid redundancy.

Signed-off-by: Eric Naim <dnaim@cachyos.org>
---
 sound/hda/codecs/realtek/alc269.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index addea99b3bce..473422e236e9 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4248,7 +4248,6 @@ enum {
 	ALC245_FIXUP_MINISFORUM_JACK_DETECT,
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
-	ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST,
 	ALC233_FIXUP_STARLABS_STARFIGHTER,
 	ALC294_FIXUP_BASS_SPEAKER_15,
 	ALC283_FIXUP_DELL_HP_RESUME,
@@ -6822,15 +6821,11 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 	},
-	[ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = alc269_fixup_limit_int_mic_boost,
-	},
 	[ALC233_FIXUP_STARLABS_STARFIGHTER] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc233_fixup_starlabs_starfighter,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST,
+		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST,
 	},
 	[ALC294_FIXUP_BASS_SPEAKER_15] = {
 		.type = HDA_FIXUP_FUNC,
@@ -8266,7 +8261,7 @@ static const struct hda_quirk alc269_fixup_vendor_tbl[] = {
 	SND_PCI_QUIRK_VENDOR(0x104d, "Sony VAIO", ALC269_FIXUP_SONY_VAIO),
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Lenovo XPAD", ALC269_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK_VENDOR(0x19e5, "Huawei Matebook", ALC255_FIXUP_MIC_MUTE_LED),
-	SND_PCI_QUIRK_VENDOR(0x2145, "Star Labs", ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK_VENDOR(0x2145, "Star Labs", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	{}
 };
 
-- 
2.55.0

