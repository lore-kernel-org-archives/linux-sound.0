Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6156B237170
	for <linux-sound@vger.kernel.org>; Fri,  9 May 2025 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808235; cv=none; b=Su4MgcneLJGq5iLAh8kmlo4OMsrIkENRA7KwKaanHy3e4q1mhFk8x1lu0nABcYtiP0SQrGUepoN0KJ8Mfbrm5hXqauDuEnknqynW6yFlBqwuYNgJNmeKrxKPzFcERHJ0Oxq1rBRkcC5JWSTu6dK7o5RdHHCvWHp58vXV/RoVISc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808235; c=relaxed/simple;
	bh=NzrY/1ewqebxTfDLviyUcpEnV4ZulnCWBj89W+GHgZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BUrDD15XjSjAXYov5R95NkynDF7QVcJrZ3TSSQT98FfblRKzah730gAyGyOdOfZPXWS0D1r5sleKODd+x3W7Uhk4n66NoIOJ+XI25v4pvchPgGXR6sMlttHY9MOt5kr7oh0YiwqplrnCZEEactydrjXx7XNLiX+0bv0lA0el4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iN+WluyY; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iN+WluyY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746808231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GglqYaDK1E5miYpG6JM3LCeaJfder+0zsmAeMdh8uhk=;
	b=iN+WluyYopFMAE34eoS7VXTJbK4Q3d7MF+7PAnYJmmdd1x408foH+O1O58uZWCak4ROASb
	nf/a7/ztNXD0WsJgQR+wrcnUe+s+LfYyHvXKHv7VlRb5uPDjYVLQ8TYO1oSVUvFsgajlzq
	LpyjSCsMI5HY0/zyhOqWM0DZ+NLrFVM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: intel-hdmi-audio: Replace deprecated strcpy() with strscpy()
Date: Fri,  9 May 2025 18:29:28 +0200
Message-ID: <20250509162930.171047-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/x86/intel_hdmi_audio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 7fcc528a0204..fe5cb4139088 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -22,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 #include <linux/delay.h>
+#include <linux/string.h>
 #include <sound/core.h>
 #include <sound/asoundef.h>
 #include <sound/pcm.h>
@@ -1698,9 +1699,9 @@ static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
 	card_ctx = card->private_data;
 	card_ctx->dev = &pdev->dev;
 	card_ctx->card = card;
-	strcpy(card->driver, INTEL_HAD);
-	strcpy(card->shortname, "Intel HDMI/DP LPE Audio");
-	strcpy(card->longname, "Intel HDMI/DP LPE Audio");
+	strscpy(card->driver, INTEL_HAD);
+	strscpy(card->shortname, "Intel HDMI/DP LPE Audio");
+	strscpy(card->longname, "Intel HDMI/DP LPE Audio");
 
 	card_ctx->irq = -1;
 
-- 
2.49.0

