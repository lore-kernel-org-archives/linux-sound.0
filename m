Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22C236165E
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238867; cv=none; b=jNGPfYd9fNdwne+cpxXfIdOD9shQc1J86aubtWtyTKxGPHl69v9w3Qnz0R9E46iLrZn/TEPTeZJr47IiBJsfUuLCNYOOp7jVAdpc5wyZiXYF/2VtKXhyFSyB4WKOIsCOFS66PvsAe5dlia6ndyh1A5iaai+zO4OpvNckcuQcZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238867; c=relaxed/simple;
	bh=qXUBpIZEMZH7CJJ7kfjiLT2vG3Z+ZXpD/mOOaKoVIA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fyvi9sG2V9sanxBVNrD5+D6HwXcNTgiIkelZT2AqJdU6Eam+AsyceEvZ/6Cixs2lSenGXdr7ojMK0vOzNKw4opwY/7PF5YtB/ycpCnnZyusNOmEqRgOEouuNlF91s0UsNctSEEjHcG8ofELdgSpw1HVl5KUOTYnTNVwDJxILPCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8UUKzXY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8UUKzXY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5650CC2BCC6;
	Sun,  5 Jul 2026 08:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783238867;
	bh=qXUBpIZEMZH7CJJ7kfjiLT2vG3Z+ZXpD/mOOaKoVIA4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=F8UUKzXY+QwCXeBy0UB5F7DJ9OhW3Djc0kUPfos5DgxGeob/vjSYjAv1T0ilU7lHh
	 QnveR/jnLJeOj3HZails4wt0zekWhs4xQTIooYX11LlYis75Pmg6gpUVGTamFQpaDn
	 Y9m+5ChUOKv7LjfSY/hnUm/+BowyxRQhOFP7bmtMz7vqKBVA9BeNpEfnrP/dMZZEEP
	 xiYVBG0NZRbUOV6FCl0HwVZaQTDR2K5c/c0Xn33Gmf0195Tcr14Tf6B7wx3KH91P+n
	 uDYu++CFVBbTWhreg+DjNspZnsNrFVp4AnEErV82kfcgp3HI5/gF3J3RLVZR6ZQO47
	 Jmt3zrlax+7yA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A60DC43602;
	Sun,  5 Jul 2026 08:07:47 +0000 (UTC)
From: Daniel Schaefer via B4 Relay <devnull+dhs.frame.work@kernel.org>
Date: Sun, 05 Jul 2026 16:07:13 +0800
Subject: [PATCH] ALSA: hda/realtek: add quirk for Framework F111:0010
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-framework-audio-ssid-0x0010-v1-1-fffc8996ac18@frame.work>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqDQAwA0KtI1g3EtH7oVUoXUyejodQpCVVBv
 HsHl2/zdnAxFYd7tYPJoq55LqgvFQxTmEdBjcXAxC111GCy8JE12xvDL2pGd41IG1FNOLyuPdO
 Ne04JyvA1Sbqd++N5HH8I67UKbQAAAA==
X-Change-ID: 20260705-framework-audio-ssid-0x0010-cb38204282ff
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux@frame.work, 
 Daniel Schaefer <dhs@frame.work>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238865; l=1317;
 i=dhs@frame.work; s=20260705; h=from:subject:message-id;
 bh=ZuKVyyBkhHa8+nRdHOgKdv02u2mQ8xtQLyrlEclnmFU=;
 b=N8uQZiYI539De94mhlvUExkl3biccVUH0yqr88v/hsZDHYesqbpn8NR+Z0gYmSKefmnLu/SQC
 ArWOkQ/6nihB5u5y+b2jRwBGafdxiHySGt8rIUIZhqN9KzJhu35MRMA
X-Developer-Key: i=dhs@frame.work; a=ed25519;
 pk=O1zF7VDnmz6EZNc7sEiawR+KK650uRg1XteQ8jHwScw=
X-Endpoint-Received: by B4 Relay for dhs@frame.work/20260705 with
 auth_id=852
X-Original-From: Daniel Schaefer <dhs@frame.work>
Reply-To: dhs@frame.work

From: Daniel Schaefer <dhs@frame.work>

Similar to commit 67c738152207 ("ALSA: hda/realtek: fix mic boost on
Framework PTL") and previous quirks for Framework systems with
Realtek codecs.

0010 is another platform with an ALC285 which needs the same quirk.

Signed-off-by: Daniel Schaefer <dhs@frame.work>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 21ab891fcb47..54c2470c3846 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7942,6 +7942,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0xf111, 0x000c, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x000f, "Framework Laptop 13 Pro PTL", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0xf111, 0x010f, "Framework Laptop 13 PTL", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0xf111, 0x0010, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_LIMIT_INT_MIC_BOOST),
 
 #if 0
 	/* Below is a quirk table taken from the old code.

---
base-commit: c0933934d5d96fc641e8d0025f9099e554a7b47a
change-id: 20260705-framework-audio-ssid-0x0010-cb38204282ff

Best regards,
-- 
Daniel Schaefer <dhs@frame.work>


