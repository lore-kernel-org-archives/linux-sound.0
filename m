Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40431CD2C;
	Sun,  1 Mar 2026 01:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329007; cv=none; b=q2I4jvgW7n26gMcR7dFCMM52Yl2FG9A8ttlZsNx5M2dYvUPY1z6RQ/QmDQIwUuhR+joHFK1tu6XKH6igB4CJrENphy46K7rrUzC2MfWysTnDbKF8QSECqwlcwWrN5CYPajxxxwKfda4OkZp3C15VYFQOAhhK9AN4vrK8r5I2JtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329007; c=relaxed/simple;
	bh=cPnHsNkfBiF94anblz/RhqAQDGDOuq1guSvohUlr86E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/fIQ4MLGneZynaa6wvA94S5rX2tr6Ds2estSfIVzEY3p9XbITMCFLb/7yQZFKy0gm/OESEjBDy6dZtQRAQ++zlZV8YA6X8JshIJrLZnnUJT2PXCA7NRXWmg6c85x+dq+4E4GJnEliaVE9QvY7Jk/3WMPyNNXBzVgkgFhSn6kaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK76txYM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK76txYM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78598C19421;
	Sun,  1 Mar 2026 01:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329006;
	bh=cPnHsNkfBiF94anblz/RhqAQDGDOuq1guSvohUlr86E=;
	h=From:To:Cc:Subject:Date:From;
	b=oK76txYMu/fyo0UhgnLqY6WybP3RL/hJ3Wl9C9d/5eJsDKOD6zzJYix7dghgyoKx7
	 yGzkistUBRQw8dnqSo7/kmXGH+BFsr1J9x6A477li7ttTKzmI4cY2IohHd2kxNZKuM
	 rwDrHNAi0G+RgQ/WBqWVgwEAQtXpLbTruxkC5wvnNQMK3l+VFLNuAVu0IFDqeqoSA3
	 juCp5XHO+WTN2X/uoKFz238o/Bz93i74+7hLjHu7I9gzyTxFvKhGAoqZigs2JuA3VF
	 dp5hE3bWk5pzOXNLAjCsieYWC5i7eizN/PIYTrPuzO6+2otJmyvmX2SSGbGHXOF+QR
	 wG/bPqdz9Q+fQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org
Subject: FAILED: Patch "ALSA: hda/conexant: Add quirk for HP ZBook Studio G4" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:36:45 -0500
Message-ID: <20260301013645.1696793-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 1585cf83e98db32463e5d54161b06a5f01fe9976 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 7 Feb 2026 14:13:17 +0100
Subject: [PATCH] ALSA: hda/conexant: Add quirk for HP ZBook Studio G4

It was reported that we need the same quirk for HP ZBook Studio G4
(SSID 103c:826b) as other HP models to make the mute-LED working.

Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/64d78753-b9ff-4c64-8920-64d8d31cd20c@gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221002
Link: https://patch.msgid.link/20260207131324.2428030-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 2384e64eada36..5623d8c0a0f7c 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1081,6 +1081,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", CXT_FIXUP_HP_SPECTRE),
 	SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8231, "HP ProBook 450 G4", CXT_FIXUP_MUTE_LED_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x826b, "HP ZBook Studio G4", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
-- 
2.51.0




