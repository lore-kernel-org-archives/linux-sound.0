Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8A16EBF6
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097342; cv=none; b=RJ/xvl06OJ76XqjGwComJzrHp8g1vV447NvzjVgUF5kYsiORS1LNvR6joIv/MUnwfeCu/2qojw09IJSg4fhepY5bh/yqEn/KekgrtAxv0Zl2/JQDbz6s+uStow5tk/J+fvcemhaqdBgocNeD/Mssal1CNvnw7vroriwKklHgLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097342; c=relaxed/simple;
	bh=C1LVu/bWHW7TaXgd7MHVb6xuWrurAV4wiG3SFyCAVPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMXk13mHQe7bQ774Gd4HZUtZcsYxx6/xbrfIXgFgYd71edr3LoejOyV6pQeDyFsPqpFdzPKDNasyNucT676sUrKm2vRhkhbs964aM/6cqXJ6X8xZqRivvJne/crcbHDg/h6BHTm166s+Uh52GZriZEcTEOq5RFy96bgGjnV6Bu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DfT0V/d2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hTDS0cVB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DfT0V/d2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hTDS0cVB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DfT0V/d2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTDS0cVB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DfT0V/d2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hTDS0cVB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D376E2222D;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiRRJ1vTPQ3m60QdNIJOT8dSmeyD6jkxXEqhmWwOBP4=;
	b=DfT0V/d217kbJ7tnEzrbZzNSGVZ15qx4OTGaX3y5PORY+KxTUdaBeC2yl+UiNZ/s2uyj0v
	qhh3vbLgqXvdfCOQBLHZvUbH3FAlDF3rS3lPhV5UrAC/1TUKnI9/Ww04p/tAGN6TQUIygm
	18P8QdVMYG1u58Cy4O4AKS5ZDTi9iyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiRRJ1vTPQ3m60QdNIJOT8dSmeyD6jkxXEqhmWwOBP4=;
	b=hTDS0cVBMc8lsGGqWbNTxkNMT1/1zODUzqWKuxfM+OMPvDRa/2R4PybcI3V661qcBRIYSZ
	g5Fm5n0ndwGgBdAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiRRJ1vTPQ3m60QdNIJOT8dSmeyD6jkxXEqhmWwOBP4=;
	b=DfT0V/d217kbJ7tnEzrbZzNSGVZ15qx4OTGaX3y5PORY+KxTUdaBeC2yl+UiNZ/s2uyj0v
	qhh3vbLgqXvdfCOQBLHZvUbH3FAlDF3rS3lPhV5UrAC/1TUKnI9/Ww04p/tAGN6TQUIygm
	18P8QdVMYG1u58Cy4O4AKS5ZDTi9iyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiRRJ1vTPQ3m60QdNIJOT8dSmeyD6jkxXEqhmWwOBP4=;
	b=hTDS0cVBMc8lsGGqWbNTxkNMT1/1zODUzqWKuxfM+OMPvDRa/2R4PybcI3V661qcBRIYSZ
	g5Fm5n0ndwGgBdAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5E0913A3A;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wMs5K/dOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 33/34] ASoC: xilinx: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:37 +0200
Message-ID: <20240507155540.24815-34-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/xilinx/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/xilinx/Makefile b/sound/soc/xilinx/Makefile
index be7652ce7c13..61cb47cf74dc 100644
--- a/sound/soc/xilinx/Makefile
+++ b/sound/soc/xilinx/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-xlnx-i2s-objs      := xlnx_i2s.o
+snd-soc-xlnx-i2s-y      := xlnx_i2s.o
 obj-$(CONFIG_SND_SOC_XILINX_I2S) += snd-soc-xlnx-i2s.o
-snd-soc-xlnx-formatter-pcm-objs := xlnx_formatter_pcm.o
+snd-soc-xlnx-formatter-pcm-y := xlnx_formatter_pcm.o
 obj-$(CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER) += snd-soc-xlnx-formatter-pcm.o
-snd-soc-xlnx-spdif-objs := xlnx_spdif.o
+snd-soc-xlnx-spdif-y := xlnx_spdif.o
 obj-$(CONFIG_SND_SOC_XILINX_SPDIF) += snd-soc-xlnx-spdif.o
-- 
2.43.0

