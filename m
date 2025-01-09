Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2BCA2D
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736462350; cv=none; b=WLPz6UVnYhjYcTUgYC4Zb1aoSE5caR7DzelTxbDk+kmVKZLaTB0Zmv5U2V7Hf1BmyATkkasxJYdwlzdMZCHhufnFpAPWRujNcDbAgsUL2mMHjOwk4cJKgQxUNxyV6XLLfYOZlB7wcRSsCXASMzgJ+jVoJLkbyPrng9kP6KqK9kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736462350; c=relaxed/simple;
	bh=dDrF5kn2f8I+r0F1ahqFoeIi/dBdMF1bwb4V8qFi8K4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i21S1mdZk/3nDAOIzCRI0MJCd+mmFs16GYRnWaNodrv9pE/e9P59w7ZZjenVUFHnVLl9VKRQdFcMyPReZ78GBvuQDUFr3W8vOqusVqJlMbM2Qf8xdYobZ8/q+o3SO0knqrt6mIOMVS+9yI5/yNiilKWxRqayJG5KS/mZjIOeE4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QZTqoHtP; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QZTqoHtP"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736462331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jhWD3WyFwqa7sOJY4cvXQNB1taXBNsLKMxnbKbtEvsI=;
	b=QZTqoHtPRrxhI7ocj6k1w/TuxtsHwz7SbWIySAA5XwNzcvBgkznCuPw4LcecCnGMLpaSjf
	zVMtCnHYNB7BMOqcW6u/+hwpji6f8o6hIn4OKW1yEHVod1oxvOd8uWN40H09CYU5jJARzE
	lwrRC+3Xp81TsMDeHjtvh/AqFX9nFIs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: emu10k1: Use str_yes_no() helper
Date: Thu,  9 Jan 2025 23:38:08 +0100
Message-ID: <20250109223809.198582-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/emu10k1/emuproc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
index 47448750f334..bd4734dc04cd 100644
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
-- 
2.47.1

