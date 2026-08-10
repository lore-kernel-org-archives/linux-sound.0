Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7491740FDAD
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373849; cv=none; b=Kckr2ruHUvziz5sT803drMDIo+Tn0h7h9/nQX2k8oZrddzYze7oduPXebZ+K1Hs9OegG+NamPQT7fSdU2tboqZqYu+xPQC1yVJuqDLvHomqVKo2pmyNqa1C8FyEGsfNZOpcmjxqsrSCRlJYyCFe1i9vF16Ph7objygPhmNhCfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373849; c=relaxed/simple;
	bh=V9J/XO889xXeieyeMMMu8PGhKbU+ViSaAe4iLti4CW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DizXJRcdI7mN1mLdJGKwL3+UeAJ1VkdxQMkYC3qH5jHEceQTaOjk7LKGb6Ympi0aAWc3/8ZdF+WlzDcku0wDXwYMnzGQWH5+0ZmBI4e5U+8REgTXxGtdxfEZK2b0/9EONiXUxQwbezGr2ADbKylR5g6mBKNZtTsiJ6/BCxWdwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=koeb.be; spf=pass smtp.mailfrom=koeb.be; dkim=pass (2048-bit key) header.d=koeb.be header.i=@koeb.be header.b=TPcx23z9; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=koeb.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=koeb.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=koeb.be header.i=@koeb.be header.b="TPcx23z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koeb.be;
	s=protonmail3; t=1786373836; x=1786633036;
	bh=3n8Z1dmAG5OhAbeX0EvJJbKqZgTLWcy5wgex4x7lG8s=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TPcx23z9LMtzmvSmcNaUOHSI+duR4aDz7XQ8VPsHCjHXO6+VWtxp5ylOYx/p7JYaj
	 6lW18OiFpJ6u/A66Z7i8xyTtFnO5KHCHsHHU9HTOVAGKVbYquVA/SVrIQmI7fqfPLO
	 kL+q2/Qwp/kDqE+WK+rG82Q2Dl4M/0rDsiCF7Vgxj9k6A1K8uUCUCfkQprx8TOOI9+
	 icnhdP71y7Om83Tw8JJEL6N/cq1F+IIMO84TRmoeej5zxO6N8Eg/GxQAd2aO066ONK
	 y9Y83b3qGdvRjWH4+q1Q+pcQ9ejZG2+ATtm/IJ+yhsIM/taOAnuHAw3cBQklD47BXh
	 xlgodWJGS+1PQ==
X-Pm-Submission-Id: 4hJdBx2VyJz2SccV
From: Brian Koebbe <brian@koeb.be>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Brian Koebbe <brian@koeb.be>
Subject: [PATCH v2] ALSA: hda/realtek: Fix quiet 3.5mm jacks on Beelink SER6
Date: Mon, 10 Aug 2026 09:57:00 -0500
Message-ID: <20260810145700.1206010-1-brian@koeb.be>
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
v2: put the QUIRK in the correct position

    remove comment from alc662_fixups[] addition, to better match others

    append to enum and alc662_fixups[] rather than insert
---
 sound/hda/codecs/realtek/alc662.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index 2cf3664a35ff..77aada355031 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -325,6 +325,7 @@ enum {
 	ALC897_FIXUP_UNIS_H3C_X500S,
 	ALC897_FIXUP_HEADSET_MIC_PIN3,
 	ALC662_FIXUP_CSL_GPIO,
+	ALC897_FIXUP_BEELINK_SER6_AMP,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -782,6 +783,10 @@ static const struct hda_fixup alc662_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc662_fixup_csl_amp,
 	},
+	[ALC897_FIXUP_BEELINK_SER6_AMP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_gpio4,
+	},
 };
 
 static const struct hda_quirk alc662_fixup_tbl[] = {
@@ -852,6 +857,7 @@ static const struct hda_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1b35, 0x1234, "CZC ET26", ALC662_FIXUP_CZC_ET26),
 	SND_PCI_QUIRK(0x1b35, 0x2206, "CZC P10T", ALC662_FIXUP_CZC_P10T),
 	SND_PCI_QUIRK(0x1c6c, 0x1239, "Compaq N14JP6-V2", ALC897_FIXUP_HP_HSMIC_VERB),
+	SND_PCI_QUIRK(0x1f66, 0x0202, "Beelink SER6 Max 6900", ALC897_FIXUP_BEELINK_SER6_AMP),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.55.0

