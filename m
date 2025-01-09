Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DE171658
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 23:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736464016; cv=none; b=imj2Vs62Qi+Vl/PORairgHfaTL0u4zEPtOv1URNCikyDDLkTLiJD1VIteH9rsimsLlMcyj9Ve0aE4krYU+hEvbrc3Am4kIeAbyW/IdKFYGGQaqZJ8M6bBsw1ccgLwN77lXBpm4cO1OW00ATmxroQw9+NzggbGSLa0fizHe2Ss+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736464016; c=relaxed/simple;
	bh=yZ8imY5hTitSY+f0LwW2ZPR9wiL4s25QWuraqtvi7wY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kzYzUWYKVvZAiE4kp9Dq/iEan+rcoa27LTmIaMv9/XW9QJ+Obx7Ezm38ElyiWjVSeQp3tC96mGPqmN7cuGIX59mBkftqz5XWV2H2NqNu+dBPHMOTjWVupEYJIaUFXorhtewoWtZq/0ezZlu9Y/pGib6p2CrT2/G95IZ4wbnr3LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YBv4Ar3v; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YBv4Ar3v"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736463997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Anr1wQLQLUGCQzZBFiC0JF9ftTGT6FFBBuQNEN6gAcg=;
	b=YBv4Ar3vg2GybfTp0H/Ab8YH31eloz67reniCgmB3Zn4S4Fyc88iuml6Pyy8ImmjKJfVe5
	3zBdpKo6HRQseIoWu1NFbVfJcIO8CAWHgyzIPLmEMnNvlPyojhp5us59K8YV6DaupcKx4U
	DNiBfy5mw9j98ZQWpunVKn6eo5R2YAg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: sb: Use str_enabled_disabled() helper in info_read()
Date: Fri, 10 Jan 2025 00:05:19 +0100
Message-ID: <20250109230521.237162-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/isa/sb/sb16_csp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 071ba85f76bb..7034072c80d4 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/string_choices.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/info.h>
@@ -1157,8 +1158,8 @@ static void info_read(struct snd_info_entry *entry, struct snd_info_buffer *buff
 				    ((p->acc_rates & SNDRV_SB_CSP_RATE_44100) ? "44100Hz" : ""));
 		}
 		if (p->mode == SNDRV_SB_CSP_MODE_QSOUND) {
-			snd_iprintf(buffer, "QSound decoder %sabled\n",
-				    p->q_enabled ? "en" : "dis");
+			snd_iprintf(buffer, "QSound decoder %s\n",
+				    str_enabled_disabled(p->q_enabled));
 		} else {
 			snd_iprintf(buffer, "PCM format ID: 0x%x (%s/%s) [%s/%s] [%s/%s]\n",
 				    p->acc_format,
-- 
2.47.1

