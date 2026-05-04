Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9593DB629;
	Mon,  4 May 2026 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901666; cv=none; b=t3bFno4OXmV0vU5hV2TucJp0AtlK28c1RqpWqWJKH6xdMT+P+A3YfBJFSouXZ1lYnyF67u0mo8EJ6LNJ2Zdv9vRavI/I+1NCy2v1Aivno0oBWy4up1XLwqisHiUolMp6IjJO160Kl7whKvQKgCekpoup2y5UbW70E9xC5UYKXo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901666; c=relaxed/simple;
	bh=2CT7brXTCUODE5N6poWqMs5onPhdL0L++jrixvf7jrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SFxCSq9Jxaal+0y5Lr26241blg3KHuyki79RnwTBvga+I6+GEQwR/JrArrmAC5cLsZWOUL2kCp3RMjLSXOAjXltb1a+hyjD6aCb1c+Bm37a/p9/v8X2QBu2vqTr13ZM/WAXCBJDoUwwY5mMzH9AsoTl2DiTaY+7ENwSqTADckFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDaC7U5j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDaC7U5j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01FBDC2BCC9;
	Mon,  4 May 2026 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777901666;
	bh=2CT7brXTCUODE5N6poWqMs5onPhdL0L++jrixvf7jrk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NDaC7U5jCvCGy/SgkwcfKKuG5O7p2T0krDoyBNANhnhTAcjA1qGIHCUPjrt9Ltva2
	 ci+UP6bLtYPZ+JzMjxFsFMTPX5ie6kY1WJb8bMrI+g6eIpLarYOx9obpxnPqyadJs0
	 KZLHGaofZ1m7HiihkZfGayREg6AtWojKNgyzeuynec+JmMFGuYgJvmBYiPR3Rlp3P2
	 iQQjtNRnTfbsY+nWlZn039fs+fpZJXEHuUWVsgCNTdlfxbR/3CIJIs3b1zQzbAO6PT
	 kbFXQHsLsFhfoJQUKkfgQEfHj41Ieyguh+js+2gikY8uCdLsE8Ak4NgakKL2YeGRwY
	 lM9J5yNdUsZgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DE4FF885A;
	Mon,  4 May 2026 13:34:25 +0000 (UTC)
From: Fernando Antunez Antonio via B4 Relay <devnull+fer.antunez24antonio.gmail.com@kernel.org>
Date: Mon, 04 May 2026 07:33:26 -0600
Subject: [PATCH v3] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP
 Envy X360 15-fh0xxx
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-hpenvy-muteled-fix-v3-1-5567fd9b3d25@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf8V0bU0fUKkr/8O4aMsANbzSQiMh/
 LstblgYl2dy55wVeXAWPLqdVuQgWG+HPgI/n5BpVF8DtmVkxAgTJCcUNyP0YcHdPEELJa7sGwu
 WU62kFNm1QPFxdBDPu/Tx/LKf9QvMlExp0Vg/DW7Zq4Gm3d9AoJjiwkjCgQtSANzrTtn2YoYOp
 UBgRwX7qWBRUVZMKyo115k+KrZt+wBvEKfwCQEAAA==
X-Change-ID: 20260501-hpenvy-muteled-fix-6251ba996478
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777901665; l=3093;
 i=fer.antunez24antonio@gmail.com; s=20260501; h=from:subject:message-id;
 bh=VijOgi0WUel34so1SFghTlCssUXe9O1y0V7ZHd+bqck=;
 b=cjwuZfj1kUpW2gwwCduxu0Y0NfM2o7jnrjFnB/tvM1JIK5boMB5tI/EYOCKCBARRvDX74Ox2H
 TD+j0inaKwoBWAwedgAlyDALHQRGTTiZksjHB1lTbtYIgEUXdK6J5OP
X-Developer-Key: i=fer.antunez24antonio@gmail.com; a=ed25519;
 pk=KtAZSzHv34SEFf0i38Wjweb1kiwZdCAcJmQ8koSweKY=
X-Endpoint-Received: by B4 Relay for
 fer.antunez24antonio@gmail.com/20260501 with auth_id=765
X-Original-From: Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>
Reply-To: fer.antunez24antonio@gmail.com

From: Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>

This enables the mute and mic-mute LEDs on the HP Envy X360 15-fh0xxx
2-in-1 laptops.
The quirk 'ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX' has been created and
is now enabled for this device.

This is my first patch, and I'm still getting to grips with the code,
so there's probably a better way to implement this fix.
I apologize for any inconvenience caused by the constant release of
new versions of this patch.

Signed-off-by: Fernando Antunez Antonio <fer.antunez24antonio@gmail.com>
---
Changes in v3:
- Removed duplicate entry with same PCI SSID
- While previous version used ALC245_FIXUP_HP_X360_MUTE_LEDS to fix
  the mute LEDs, it also rendered the laptop's built-in speakers 
  broken as it lacked the previous ALC287_FIXUP_CS35L41_I2C_2 fixup. 
  A new fixup was created that implements both of them, fixing the 
  mute LEDs and keeping the speaker functionality.
- Link to v2: https://patch.msgid.link/20260502-hpenvy-muteled-fix-v2-1-df2ba19b3b4b@gmail.com

Changes in v2:
- Moved quirk entry to correct position to preserve PCI SSID order
- Removed redundant use of the word Laptop
- Changed subject from SOUND to ALSA
- Link to v1: https://patch.msgid.link/20260501-hpenvy-muteled-fix-v1-1-8c903e3608ee@gmail.com
---
 sound/hda/codecs/realtek/alc269.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a9cd03bb73c4..8637f3394f67 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4123,6 +4123,7 @@ enum {
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
 	ALC236_FIXUP_HP_DMIC,
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
+	ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6675,6 +6676,12 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1b, 0x90170110 },
 			{ }
 		}
+	},
+	[ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_i2c_two,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_HP_X360_MUTE_LEDS
 	}
 };
 
@@ -7097,7 +7104,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8be6, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8be9, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8be9, "HP Envy x360 2-in-1 Laptop 15-fh0xxx", ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8bf0, "HP", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c15, "HP Spectre x360 2-in-1 Laptop 14-eu0xxx", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c16, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),

---
base-commit: f1a5e78a55ebf2b05777fd5eb738038ddae609d6
change-id: 20260501-hpenvy-muteled-fix-6251ba996478

Best regards,
--  
Fernando Antunez <fer.antunez24antonio@gmail.com>


