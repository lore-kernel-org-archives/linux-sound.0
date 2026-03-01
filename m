Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8FF2EE5FD;
	Sun,  1 Mar 2026 01:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330034; cv=none; b=qHC4CqYdBXeMl2J/C6DwRYPHs0hm3J6zdzVLR8hkmOWPUOe2ZYkEpNziTMJT6sIGODIYTGXWW+5V7/fnMWyp3gKSyw+7d+HSQdUm0Ce1OSfUC1F2wi6tuIGuMiP4hicKW3TimJLhFY4XJYth90BjSDKnGjjO0wK4dHnBTVDLTuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330034; c=relaxed/simple;
	bh=ucYr/n11bP/5vjX9OhGt3Zz5SHClV50N0kAnnz+VbcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0ZTbkazFSoFwdIENfwR0D2vg570+rmEY5jLe4eODL8GbNWDmypyWOgU41ZuyOkZ5KLLTfip6EdD0hfcgR1W9jR1JD/CACOE/gFuFsJKlI1oGg/0LdEzpSpLxAjbp8Pw6rBBmk9mK6Ta2bZCl3CZlkogYUiFerO1IiofCklUQZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mke3/rZY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mke3/rZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B106C19421;
	Sun,  1 Mar 2026 01:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330034;
	bh=ucYr/n11bP/5vjX9OhGt3Zz5SHClV50N0kAnnz+VbcM=;
	h=From:To:Cc:Subject:Date:From;
	b=mke3/rZY0k59xWQJyguaD+NJFg8ZrftNfkcVadI11L3YJn9ujZlVN9V7fkVcwrxrY
	 apyuE5vRasv/H1hKtVXMOU46GDHuStsatVKOUqoaBCFtyzxATEI/c9AJyjH0y8fz1y
	 IoU/AZJChxYAxVUTYchfPOBqoMdQhHN1Fii+hn2QA5e5X7B8ktqUB3xPRnHXY8a7MZ
	 gx3981SeO241eNBkxLs5QbWT3i2HbQivmTQPU+Uok6Ex4N7ODynFrMFCymbIDEZ4QL
	 HgVYPO9o1LmTi5h0+v4Ya8LpEQ1wAFenUBiES7z6C310edx/toUkvxUQvOdiRvlRkP
	 8oI1N2e8wb2BA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org
Subject: FAILED: Patch "ALSA: hda/conexant: Add quirk for HP ZBook Studio G4" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:53:52 -0500
Message-ID: <20260301015353.1720760-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
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




