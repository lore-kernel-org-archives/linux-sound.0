Received: from mailout1n.rrzn.uni-hannover.de (mailout1n.rrzn.uni-hannover.de [130.75.2.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2281C39AD55;
	Mon,  8 Jun 2026 20:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.75.2.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780950571; cv=none; b=PduY+oKhpy9a6ThLdkloYn7PDEv/jLU5vC6dK0a9yuqkZF5z+kQJt5Nc2aXSGvVXxe8GPCAHgNfgiuLI+yjqhjmcixFJBAYxh9N5X95C8DdZDvidw5g7kxItsTap7RS95S/ltWQ3RxjoNdxgSOTf+HWG0LZeIliBGRbGerzcnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780950571; c=relaxed/simple;
	bh=5laKLkHozVD+CMZRIhPdgs3u2PsqZMozrcf7rF6dTkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBryh4LCJnMTPPvazbBCFo2XTlKE+iXeARp4CdDMw2CKDw555e8wx4iDQCDsE+tOt9LU2h+cokOjOdkJ9cqWAZd1fLyd7xS9QTZubvmQgyjasQPsQE1GHy7U+TjFTLAErkNgtHEdw7q93naw0o0cIz50yWnWDeastxVw/ERqTpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stud.uni-hannover.de; spf=pass smtp.mailfrom=stud.uni-hannover.de; dkim=pass (2048-bit key) header.d=uni-hannover.de header.i=@uni-hannover.de header.b=D7wHbdu+; arc=none smtp.client-ip=130.75.2.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stud.uni-hannover.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stud.uni-hannover.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uni-hannover.de header.i=@uni-hannover.de header.b="D7wHbdu+"
Received: from moritz-Yoga-Pro-7-14IRH8.. (ip5f5abb0d.dynamic.kabel-deutschland.de [95.90.187.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailout1n.rrzn.uni-hannover.de (Postfix) with ESMTPSA id 92B08114;
	Mon,  8 Jun 2026 22:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uni-hannover.de;
	s=2024all; t=1780950242;
	bh=5laKLkHozVD+CMZRIhPdgs3u2PsqZMozrcf7rF6dTkY=;
	h=From:To:Cc:Subject:Date:From;
	b=D7wHbdu+JOrU2t4vqq5+XB1BNTs8+CjHxEoLGH/+pT9SF2h989VHlUZzNfsHPmI81
	 +4wRbHGXGzCkBS18mkqjmjcOlXIGw9UvRjwgNO1hOPjMzOXjRJB1YkkxOQKGWD2fUK
	 bSo9ZBEjYrARRiQI56+pyQOydq7ozka1uZY51jdLmGJh/94sO/vpnNBgOB2dXbMGwT
	 TZ4jEkFFJ4AW9ho0T4U6To5fvf+co5dGnNZ0QXF2GNYsQ772aYwFgXm27yLNw4wgJe
	 dq/16bppAjncRfd/1mhPTzZUgpAXdlofkPKFYi+IIrLJ65Nu99pxzR6xRez6xQ2ih5
	 OYEjbmaKE51Rw==
From: Moritz Baron <moritz.baron@stud.uni-hannover.de>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel@i4.cs.fau.de,
	Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>,
	Moritz Baron <moritz.baron@stud.uni-hannover.de>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IRH8
Date: Mon,  8 Jun 2026 22:20:54 +0200
Message-ID: <20260608202055.206744-1-moritz.baron@stud.uni-hannover.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.9 at mailout1n
X-Virus-Status: Clean

The Lenovo Yoga Pro 7 14IRH8 (ALC287 codec, subsystem ID 0x17aa:0x38b1)
has bass speakers on pin 0x17 that are not routed through a DAC with
volume control. This causes the bass speakers to play at full volume
regardless of the volume slider position.

Apply ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN which corrects the DAC
routing for pin 0x17, enabling proper volume control. This is the same
fix used for other Yoga Pro 7 models with identical audio topology
(14APH8, 14AHP9, 14ASP10, 14IAH10).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217949

Co-developed-by: Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
Signed-off-by: Felix Aljoscha Schnuell <felix.aljoscha.schnuell@stud.uni-hannover.de>
Signed-off-by: Moritz Baron <moritz.baron@stud.uni-hannover.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index dcbc669842e0..9b1e65f6d161 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7711,6 +7711,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	 * use codec SSID to distinguish them
 	 */
 	HDA_CODEC_QUIRK(0x17aa, 0x38cf, "Lenovo Yoga Pro 7 14IMH9", ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN),
+	HDA_CODEC_QUIRK(0x17aa, 0x38b1, "Lenovo Yoga Pro 7 14IRH8", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion 7 16ACHG6", ALC287_FIXUP_LEGION_16ACHG6),
 	SND_PCI_QUIRK(0x17aa, 0x384a, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-- 
2.43.0

