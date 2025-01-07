Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FD31EF08D
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736251729; cv=none; b=PWcEUJv8U+6b4zst7585XYVmm7b7zo25/XCT0P/3ajVB85qxsgC0WaGnmV4OgsQsZEhEd7mjTFv9+zJ7FlKzrrkxwq7xB47a1HzVPnogiQ1g11njqFHWGsA2DVz2/Kh4rtdRw0q55hlheJBJIdafgpT/uZhywpzifU1lXSyuIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736251729; c=relaxed/simple;
	bh=EQzZGWXu2RHi+AH0zdBZWrxErwJT+W5TuSL1MF9YDsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lswTvtqxfRxkWwh5QZatmh2GOmVTiGvN9nHfuE/WDjbQUfuGmNmQz20e1FdlW6/f6lCrqyRSxZUZThaMkx1plZEFk4ke7gZlYZFGmSkLHH6l+PPyJzC+M+7PWTaInSsy/UgAqSFErGeiSxn9JNdzvUZmmbntDN4x730NR3aHLDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X5G3VLb4; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X5G3VLb4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736251693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kgPNrzJmVnRfOdhFs/9KfBeTeUcSYie0esv8xPSfGzM=;
	b=X5G3VLb4j/6k5WN0bKYcq90I8imt8EbXj8hDtPvQFM7NZPUDsbExvG2vhAvPjugGUCgMP1
	wxPi9+px0ncnQvXOFfntnV7jNCZoXZBwu5Lt/mxEWfMApa8kuH/DnYNedG6TaJwuYzPEf4
	IDihTGpmBKcqcAi2UbeTIzwaacqJTqE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: ens137x: Use str_on_off() helper in snd_ensoniq_proc_read()
Date: Tue,  7 Jan 2025 13:08:06 +0100
Message-ID: <20250107120809.4393-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/ens1370.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 18928b905939..71c89e4e3090 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1850,12 +1850,12 @@ static void snd_ensoniq_proc_read(struct snd_info_entry *entry,
 
 	snd_iprintf(buffer, "Ensoniq AudioPCI " CHIP_NAME "\n\n");
 	snd_iprintf(buffer, "Joystick enable  : %s\n",
-		    ensoniq->ctrl & ES_JYSTK_EN ? "on" : "off");
+		    str_on_off(ensoniq->ctrl & ES_JYSTK_EN));
 #ifdef CHIP1370
 	snd_iprintf(buffer, "MIC +5V bias     : %s\n",
-		    ensoniq->ctrl & ES_1370_XCTL1 ? "on" : "off");
+		    str_on_off(ensoniq->ctrl & ES_1370_XCTL1));
 	snd_iprintf(buffer, "Line In to AOUT  : %s\n",
-		    ensoniq->ctrl & ES_1370_XCTL0 ? "on" : "off");
+		    str_on_off(ensoniq->ctrl & ES_1370_XCTL0));
 #else
 	snd_iprintf(buffer, "Joystick port    : 0x%x\n",
 		    (ES_1371_JOY_ASELI(ensoniq->ctrl) * 8) + 0x200);
-- 
2.47.1

