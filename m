Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DEB13D53C;
	Sun,  1 Mar 2026 02:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330705; cv=none; b=F8vnKwao+WMe90Vn5XNAw8ml2eO/HRd2IwvREZM958FoMmLFoJ3G1JJqDK00eJN23A/H3ymdwqwsRudHdne+hEVsg2rwFp8iiaKKX9OthMv5zNoM6yG+8OL6YF7mMISW2AmShN8jo6hqQb/ifkydU17Yb3JhPmNNtT5Kg73M5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330705; c=relaxed/simple;
	bh=RNNJdn87lG+GN1BNPjAhglmrAR88/Rabx7WzNXXq6eg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LkgGC6/q+4W8Fbyy8O3pREzzPlP1HYeQwlgaMNZhUpYkPRkX6+mvLuvYUKj+5CBOBsa6i1yWDdc6lCAq5nLzkKeb6ODRniZ3FbtFi/tbK1e8fO32k0P3OfxGNOvEooQukWQY8qG63GQE8BoTPq7JhZsQ9k1jGudCZQkBNxhvoAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqyMFibY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqyMFibY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CA5C19421;
	Sun,  1 Mar 2026 02:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330705;
	bh=RNNJdn87lG+GN1BNPjAhglmrAR88/Rabx7WzNXXq6eg=;
	h=From:To:Cc:Subject:Date:From;
	b=iqyMFibYwr1aFGKc6zr7g/PgcK6ND3myDgL2FjcDzQYTurn/Y2UnEH2AiRWoQW2bv
	 QWIVjEBSqmuYEvSfRCMfqzy85YzIDhU/8QGVxrSzQFOl0rM51R7KNdsxbWtPCterXb
	 ZWhF5VwvD7dM5GdMm2P1NTYo73EHeB6emrBqE+A6eaubOmUr2z2azTY9s/voRYLf20
	 G+USe4TVPqfi78zoF8g8rU66VT7JVvRKDkzcgqSUfK/7NSxAwyYlS6FDJ5+iwixn46
	 EJS2WN+OtdwoRIuzDspcEOCd10ROgAKPI2q/j8iXd0XRJQa4KAI3EA+raJ5EX9xFmG
	 n+YPm8F+9g8Hw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	mason8110@gmail.com
Cc: Lewis Mason <lewis@ocuru.co.uk>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: FAILED: Patch "ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360 (NP965QFG)" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:05:03 -0500
Message-ID: <20260301020503.1733666-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3a6b7dc431aab90744e973254604855e654294ae Mon Sep 17 00:00:00 2001
From: Lewis Mason <mason8110@gmail.com>
Date: Tue, 10 Feb 2026 23:13:37 +0000
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360
 (NP965QFG)

The Samsung Galaxy Book3 Pro 360 NP965QFG (subsystem ID 0x144d:0xc1cb)
uses the same Realtek ALC298 codec and amplifier configuration as the
NP960QFG (0x144d:0xc1ca). Apply the same ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS
fixup to enable the internal speakers.

Cc: stable@vger.kernel.org
Signed-off-by: Lewis Mason <lewis@ocuru.co.uk>
Link: https://patch.msgid.link/20260210231337.7265-1-lewis@ocuru.co.uk
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 8664446648096..c11312aa5ca76 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7318,6 +7318,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc872, "Samsung Galaxy Book2 Pro (NP950XEE)", ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
+	SND_PCI_QUIRK(0x144d, 0xc1cb, "Samsung Galaxy Book3 Pro 360 (NP965QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-- 
2.51.0




