Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E51215169
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415136; cv=none; b=MjPJbjXK3CAXr5DGu36wtV2bNx48zOlIhdbV2g8ymezSpikWX/uJxA5gl5rwL9uoxFF/JxIisRRjU3JqZRe9ua8BvE667j1qwY0eK91zZGFxDIVRDyMjmPHZ9YqQ1JfT4o1m5eotbLR82+zwVvSPZ1+y1FHcg8Y2vICApsVRuzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415136; c=relaxed/simple;
	bh=FA8fgGIm58NJopwwG86wchFOueukGk9wkDNjaZiwa5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2gOUfKMAoETYN8Zq5J2Lwpy7AernzH0EMdOihjRV6ZoifT7PnlvixgZ3PCug2z8LdniTuIsNcXN/C0Fmmwn/MzoHQJQM76Ya8PniZamT2o7Yru9jel1SE48etD/bwb3vv45Gu1jp0Lx+SVOixI3xIcJP2nZFe86jLVqdSVNSdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RojoSRIT; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RojoSRIT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736415116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fsbeNZ5HbnJFiL2Ay4CSOfkeH8h9zJZnhhc/SFgeZIo=;
	b=RojoSRITLGDr2m9/wc0zkxfXImuWDR2XG8KMGFEQJP5N5Zl3QVYyLC7inuiV9yJsyvISH3
	bqZ/M8SVQ8wYCS4F9dHnIS+1QC4ZJ1ScLWHXQzV8NXPqE/RPLkFL2rsEMFc8wvqSt3qTyz
	UY9D3sT0kbvYx6C/z9CcNPuizWKPrts=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: emu10k1: Use str_on_off() and str_yes_no() helpers
Date: Thu,  9 Jan 2025 10:31:08 +0100
Message-ID: <20250109093110.3850-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() and str_yes_no()
helper functions.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/emu10k1/emuproc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 737c28d31b41..67a9216d3f4d 100644
--- a/sound/pci/emu10k1/emuproc.c
+++ b/sound/pci/emu10k1/emuproc.c
@@ -11,6 +11,7 @@
 
 #include <linux/slab.h>
 #include <linux/init.h>
+#include <linux/string_choices.h>
 #include <sound/core.h>
 #include <sound/emu10k1.h>
 #include "p16v.h"
@@ -32,9 +33,9 @@ static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
 	snd_iprintf(buffer, "\n%s\n", title);
 
 	if (status != 0xffffffff) {
-		snd_iprintf(buffer, "Professional Mode     : %s\n", (status & SPCS_PROFESSIONAL) ? "yes" : "no");
-		snd_iprintf(buffer, "Not Audio Data        : %s\n", (status & SPCS_NOTAUDIODATA) ? "yes" : "no");
-		snd_iprintf(buffer, "Copyright             : %s\n", (status & SPCS_COPYRIGHT) ? "yes" : "no");
+		snd_iprintf(buffer, "Professional Mode     : %s\n", str_yes_no(status & SPCS_PROFESSIONAL));
+		snd_iprintf(buffer, "Not Audio Data        : %s\n", str_yes_no(status & SPCS_NOTAUDIODATA));
+		snd_iprintf(buffer, "Copyright             : %s\n", str_yes_no(status & SPCS_COPYRIGHT));
 		snd_iprintf(buffer, "Emphasis              : %s\n", emphasis[(status & SPCS_EMPHASISMASK) >> 3]);
 		snd_iprintf(buffer, "Mode                  : %i\n", (status & SPCS_MODEMASK) >> 6);
 		snd_iprintf(buffer, "Category Code         : 0x%x\n", (status & SPCS_CATEGORYCODEMASK) >> 8);
@@ -46,9 +47,9 @@ static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
 
 		if (rate_reg > 0) {
 			rate = snd_emu10k1_ptr_read(emu, rate_reg, 0);
-			snd_iprintf(buffer, "S/PDIF Valid          : %s\n", rate & SRCS_SPDIFVALID ? "on" : "off");
-			snd_iprintf(buffer, "S/PDIF Locked         : %s\n", rate & SRCS_SPDIFLOCKED ? "on" : "off");
-			snd_iprintf(buffer, "Rate Locked           : %s\n", rate & SRCS_RATELOCKED ? "on" : "off");
+			snd_iprintf(buffer, "S/PDIF Valid          : %s\n", str_on_off(rate & SRCS_SPDIFVALID));
+			snd_iprintf(buffer, "S/PDIF Locked         : %s\n", str_on_off(rate & SRCS_SPDIFLOCKED));
+			snd_iprintf(buffer, "Rate Locked           : %s\n", str_on_off(rate & SRCS_RATELOCKED));
 			/* From ((Rate * 48000 ) / 262144); */
 			snd_iprintf(buffer, "Estimated Sample Rate : %d\n", ((rate & 0xFFFFF ) * 375) >> 11); 
 		}
-- 
2.47.1

