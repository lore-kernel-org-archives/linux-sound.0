Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B99378D96
	for <linux-sound@vger.kernel.org>; Wed, 14 Jan 2026 21:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426797; cv=none; b=Zgjr5ZrRC/RZ9mrDE1P5Tbw8wGJlrbJv853//j9/0uKnTfVe8DteRjQTqm/odaLD9nwI8wzYj4vbvO/rrrc+PC/epv82vZSZGtEYzJftJgD1CurFK4SL8ddnJiHh6OTkHhgBrfxfLc0rCPcFprdXnXT0Lg6iK/jfPMMIkiQeWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426797; c=relaxed/simple;
	bh=zfNp6GOFNoi0v6QL9StGLUTzNZcnL5oXF6CePsmmW3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M6SDtD2q75Tp+U87KEQZ3z0iPgB0GvZUAuB27zCoevQzzWRVmt82WAP7XtJEnw7r2dO54R7F/o+C+lAQ4tn9szi6FsZfCeHimS3LymjXZagtHcnH9PDV1IAiftV58mu1YsoUqfS2a6gtAlQ7sN1XfqEQmcApBi4KtPe9SEh+Qcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: linux-sound@vger.kernel.org
Cc: ckeepax@opensource.cirrus.com,
	sbinding@opensource.cirrus.com,
	broonie@kernel.org,
	patches@opensource.cirrus.com,
	cole@unwrap.rs
Subject: [PATCH] ASoC: cs42l43: Fix headphone volume control overflow at 100%
Date: Wed, 14 Jan 2026 14:38:29 -0700
Message-ID: <20260114213829.15456-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headphone digital volume control is defined with:
  SOC_DOUBLE_SX_TLV(..., 0x11B, 229, ...)

Where 0x11B (283) is the minimum register value and 229 is the number of
steps. This means the maximum register value is 283 + 229 = 512 (0x200).

However, the register field is only 9 bits wide (mask 0x1FF, max 511).
When the volume is set to 100%, the computed register value of 512
overflows and wraps to 0, causing the volume to suddenly drop to minimum.

Fix by changing the minimum from 0x11B (283) to 0x11A (282), so that:
  282 + 229 = 511 (0x1FF)

This allows 100% volume to work correctly while maintaining the full
229-step range for the -114.50dB to 0dB TLV scale.

Fixes: fc918cbe874e ("ASoC: cs42l43: Add support for the cs42l43")
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index fd02d8a57e0f..d0c3589d8e1d 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1231,7 +1231,7 @@ static const struct snd_kcontrol_new cs42l43_controls[] = {
 
 	SOC_DOUBLE_SX_TLV("Headphone Digital Volume", CS42L43_HPPATHVOL,
 			  CS42L43_AMP3_PATH_VOL_SHIFT, CS42L43_AMP4_PATH_VOL_SHIFT,
-			  0x11B, 229, cs42l43_headphone_tlv),
+			  0x11A, 229, cs42l43_headphone_tlv),
 
 	SOC_DOUBLE("Headphone Invert Switch", CS42L43_DACCNFG1,
 		   CS42L43_AMP3_INV_SHIFT, CS42L43_AMP4_INV_SHIFT, 1, 0),
-- 
2.52.0

