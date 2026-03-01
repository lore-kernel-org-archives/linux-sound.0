Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FDE25228C;
	Sun,  1 Mar 2026 01:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328473; cv=none; b=uYWsr8eVA+l1YOzOkC4oYHcq9dp4M6Pxsd56SQQylNCm43ygI5A/LAtdtFaQz4mvgn2uk9NT8qUsvyCvECkU7xzeQ1t0IyCPBXuhANIcGwv0Zr5HZfY1PfC5QSWVwgM2nABvEOcOGxzLYmsvICU6yRSQuvoEQdSPxIj91cFjrnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328473; c=relaxed/simple;
	bh=hIXQLformX9FVpvSBQhOJUqVPR6SQMFpYDH4fC3YoBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lG1+UgrnCQZCiyg9dtnWa9VEq9sRr4lY1Ka0c2BI5yHaqPPB1pqKw7R9rvBwC/sTCkohj8WZ/2iAbz5dg9F7+ur/zYfNkEGvouQFrrvp/I3n9fRNlBjzVwp7bEs4OIIyfVYxcqmtYLv8H3qyhjsD2lBzC97XG87xCHGJcPVqRo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NIK+EqQ6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIK+EqQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FAEC19421;
	Sun,  1 Mar 2026 01:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328473;
	bh=hIXQLformX9FVpvSBQhOJUqVPR6SQMFpYDH4fC3YoBM=;
	h=From:To:Cc:Subject:Date:From;
	b=NIK+EqQ6Hlc1gIRB50DKeT8a/1DithUYehnZCoCzCR6i5X7VKaQqHZdemeVvJ92wS
	 KvfE37jv7pQJbZ4lMOJFeumDoUgLfcbhE3ziTkIo1pL1bw2zp8C8L3La8dEOIwTtI8
	 GYXSO29We8bBBKEiThnYlr7zfLlFctRIkkV1AxWuGy2auy64fJ4IWYwbQnus1z/J4C
	 dBelPCJM9GeNMfWpECcKCV/8V8GM2rdxtzublF9o9agK661nRdH9toCG6temzqIcxn
	 Ev+rFp9IWVCVi6ZzktWlFHiDhv0qSVevbawwT8u5BTowgePicIfCT3a4xYDLi7uwX6
	 bwjyxr4uHaNag==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	dnaim@cachyos.org
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: FAILED: Patch "ALSA: hda/realtek: Add quirk for Gigabyte G5 KF5 (2023)" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:27:51 -0500
Message-ID: <20260301012751.1685468-1-sashal@kernel.org>
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

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 405d59fdd2038a65790eaad8c1013d37a2af6561 Mon Sep 17 00:00:00 2001
From: Eric Naim <dnaim@cachyos.org>
Date: Tue, 10 Feb 2026 17:34:02 +0800
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Gigabyte G5 KF5 (2023)

Fixes microphone detection when a headset is connected to the audio jack
using the ALC256.

Cc: stable@vger.kernel.org
Signed-off-by: Eric Naim <dnaim@cachyos.org>
Link: https://patch.msgid.link/20260210093403.21514-1-dnaim@cachyos.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 80f0be13b69f5..8664446648096 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7319,6 +7319,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc886, "Samsung Galaxy Book3 Pro (NP964XFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1ca, "Samsung Galaxy Book3 Pro 360 (NP960QFG)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
+	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
-- 
2.51.0




