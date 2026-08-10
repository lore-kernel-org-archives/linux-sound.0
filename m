Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36630357702
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 04:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786335902; cv=none; b=n9wz8eq8Pv+aBvsgXrFaqXmrxjMk7L5dFnUphKjIZ1iiAkZABTdFTuvIEyBFcLPuKLcW4DbTNuNokv0zmTGNB6efLh2cymtyXabXkISahCjHIHKPGAkeP+JDhU9WE7PbOfk01S+rc+k41R76eoEvZxQ4qqqZwmNWXfdnpLRxQyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786335902; c=relaxed/simple;
	bh=daYkTOnB3L+j6O+6HZyhpSqOlokrfBaQ0xl0UmzeAw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0JHlpSzoSQS+qWq3VVLk5zvDKES0VkIJJcAK/YXsaQStaTeC5iAbWADi1SOCLrpJWTsi/F2fzwcos3/YBNaiWgqIomKT2v3YRxmZtp2MaGcNKvXnMj0tcs/qRqZMSwxhC2kfqF4odVuhS4eJyC/IK+uTFWYICgPyXHZPiDe6+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=koeb.be; spf=pass smtp.mailfrom=koeb.be; dkim=pass (2048-bit key) header.d=koeb.be header.i=@koeb.be header.b=tpS5/hr3; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=koeb.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=koeb.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=koeb.be header.i=@koeb.be header.b="tpS5/hr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koeb.be;
	s=protonmail3; t=1786335881; x=1786595081;
	bh=Zrv8qSVEHiUPvDFhmb2Sd+OKTtzKXCr/NU5tjnsBytM=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tpS5/hr3fBCpOPGGczF7Q+0j2qx7JkZBxqbWQEQvTEEoLwzEfxdW83T4vqkPYZnj+
	 9BH5K4b1F5mvZf0i6SYeOEFy8AkbW+npiAbI7lDOXBrmug57VkoDUu2foZNj7hhydL
	 YUgf2F6ob4B8Q96ncuzdHcI7spbKWHj0GXttpBn2tNZerqc0kFzTBsuUzVgPtEsage
	 TEAS2anta0vH5E/E6zwyIaJEizTuV8KgS3nZk6psQvN+b1P3psfpoj1AuebcfdodEj
	 0pkCDh9Ytje6pHWMVBYO7jQVE9moVC6BKLCrQJPSp66PEk9Tv/DpTCa/x96uch0mU3
	 kevBjKC0kLbbQ==
X-Pm-Submission-Id: 4hJM9331fFz2SccR
From: Brian Koebbe <brian@koeb.be>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Brian Koebbe <brian@koeb.be>
Subject: [PATCH] ALSA: hda/realtek: Fix quiet 3.5mm jacks on Beelink SER6
Date: Sun,  9 Aug 2026 23:24:25 -0500
Message-ID: <20260810042425.1122213-1-brian@koeb.be>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the front headphone jack and the rear line-out jack play back
at a barely audible volume on the Beelink SER6 Max (ALC897, PCI subsystem
ID 1f66:0202), even with all mixer controls at 0dB. GPIO2 on the
codec gates an external headphone/line amplifier that the generic
parser never enables. Add a fixup that asserts it. Verified fixed
on both jacks.

Signed-off-by: Brian Koebbe <brian@koeb.be>
---
 sound/hda/codecs/realtek/alc662.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index 2cf3664a35ff..2ce1b171337d 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -324,6 +324,7 @@ enum {
 	ALC897_FIXUP_HEADSET_MIC_PIN2,
 	ALC897_FIXUP_UNIS_H3C_X500S,
 	ALC897_FIXUP_HEADSET_MIC_PIN3,
+	ALC897_FIXUP_BEELINK_SER6_AMP,
 	ALC662_FIXUP_CSL_GPIO,
 };
 
@@ -778,6 +779,14 @@ static const struct hda_fixup alc662_fixups[] = {
 			{ }
 		},
 	},
+	[ALC897_FIXUP_BEELINK_SER6_AMP] = {
+		/* Beelink SER6 Max (Ryzen 6900HX) both 3.5mm jacks are very
+		 * quiet without this: GPIO2 gates an external headphone/line
+		 * amplifier that the generic parser never enables.
+		 */
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_gpio4,
+	},
 	[ALC662_FIXUP_CSL_GPIO] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc662_fixup_csl_amp,
@@ -788,6 +797,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1019, 0x9087, "ECS", ALC662_FIXUP_ASUS_MODE2),
 	SND_PCI_QUIRK(0x1019, 0x9859, "JP-IK LEAP W502", ALC897_FIXUP_HEADSET_MIC_PIN3),
 	SND_PCI_QUIRK(0x1022, 0xc950, "CSL Unity BF24B", ALC662_FIXUP_CSL_GPIO),
+	SND_PCI_QUIRK(0x1f66, 0x0202, "Beelink SER6 Max 6900", ALC897_FIXUP_BEELINK_SER6_AMP),
 	SND_PCI_QUIRK(0x1025, 0x022f, "Acer Aspire One", ALC662_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x0241, "Packard Bell DOTS", ALC662_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x0308, "Acer Aspire 8942G", ALC662_FIXUP_ASPIRE),
-- 
2.55.0

