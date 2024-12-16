Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7691FF7BE
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734352489; cv=none; b=a5FwEfiYBUfJ5MyiGrZBy/CUXM0fO2ZvB0yd5njT3riG+qEHOOrMG3vaLMq0vi54hXukbegn343So3wDEqf3YvDiLCdxyl7vGRgx5MG7qjnbEL+goXYhK8VbrcotflA6KzrucbL4k2KCJ2EHNPWEK52OO4Dp8VX/AFHKn2Q9M5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734352489; c=relaxed/simple;
	bh=bGY5vGOduknawaVXI+p963aaIAk6ZBySeihaKTMiDOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmOHvCEgUHzJql0848Cud+LqeY7fBCba4FYV7ROBVJ4wloGn7EcpoPPR0RHOgenUlcp6fwKsBPzLHkWOr532sSeMSDl9HsSa7CsUjyjDOxGawuz8nq66jPfu7/lv1MJ5sD4eleCTA3alH9L70DJP4cRL/S2UnHlDJ/AHilCvCiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rl1ekae4; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rl1ekae4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734352482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ecCUV64E3I9yoNIZtKRMVYS+tTxWlY0Y+hDUV07hbeg=;
	b=rl1ekae4Qq4lZ6X8FVkWsZRTql/roCyrH1SpebesobcrGtTD9YdUwA/6mrUuP7XbsCp+GH
	0O5M9Z9kz11ZXTNQn7RCBjM3QkF5Q2pMFAmx2ru3EKEU5Ix47SBCXAdfdMrElP5tt8Jz0Y
	J2rBzQUzYFBhtgMEBcceqKY2dq1xjz0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hdsp: Use str_on_off() and str_yes_no() helper functions
Date: Mon, 16 Dec 2024 13:34:11 +0100
Message-ID: <20241216123412.64691-2-thorsten.blum@linux.dev>
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
 sound/pci/rme9652/hdsp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 1c504a591948..fd3dfbad397a 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3444,7 +3444,7 @@ snd_hdsp_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 	snd_iprintf(buffer, "MIDI1 Input status: 0x%x\n", hdsp_read(hdsp, HDSP_midiStatusIn0));
 	snd_iprintf(buffer, "MIDI2 Output status: 0x%x\n", hdsp_read(hdsp, HDSP_midiStatusOut1));
 	snd_iprintf(buffer, "MIDI2 Input status: 0x%x\n", hdsp_read(hdsp, HDSP_midiStatusIn1));
-	snd_iprintf(buffer, "Use Midi Tasklet: %s\n", hdsp->use_midi_work ? "on" : "off");
+	snd_iprintf(buffer, "Use Midi Tasklet: %s\n", str_on_off(hdsp->use_midi_work));
 
 	snd_iprintf(buffer, "\n");
 
@@ -3452,8 +3452,8 @@ snd_hdsp_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 
 	snd_iprintf(buffer, "Buffer Size (Latency): %d samples (2 periods of %lu bytes)\n", x, (unsigned long) hdsp->period_bytes);
 	snd_iprintf(buffer, "Hardware pointer (frames): %ld\n", hdsp_hw_pointer(hdsp));
-	snd_iprintf(buffer, "Precise pointer: %s\n", hdsp->precise_ptr ? "on" : "off");
-	snd_iprintf(buffer, "Line out: %s\n", (hdsp->control_register & HDSP_LineOut) ? "on" : "off");
+	snd_iprintf(buffer, "Precise pointer: %s\n", str_on_off(hdsp->precise_ptr));
+	snd_iprintf(buffer, "Line out: %s\n", str_on_off(hdsp->control_register & HDSP_LineOut));
 
 	snd_iprintf(buffer, "Firmware version: %d\n", (status2&HDSP_version0)|(status2&HDSP_version1)<<1|(status2&HDSP_version2)<<2);
 
@@ -3750,8 +3750,8 @@ snd_hdsp_proc_read(struct snd_info_entry *entry, struct snd_info_buffer *buffer)
 		snd_iprintf(buffer, "Phones Gain : %s\n", tmp);
 
 		snd_iprintf(buffer, "XLR Breakout Cable : %s\n",
-			hdsp_toggle_setting(hdsp, HDSP_XLRBreakoutCable) ?
-			"yes" : "no");
+			str_yes_no(hdsp_toggle_setting(hdsp,
+						       HDSP_XLRBreakoutCable)));
 
 		if (hdsp->control_register & HDSP_AnalogExtensionBoard)
 			snd_iprintf(buffer, "AEB : on (ADAT1 internal)\n");
-- 
2.47.1

