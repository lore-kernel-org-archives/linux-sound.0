Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D839A3B14BF
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781881245; cv=none; b=O0IF7brwsLS5+u5l3dtuLzltMz84HbE5zWh/e/X84Cd2fvNU+dlM4KhiJMkDSd2CTk5i0EfULQ5thRJa/cz0I/D5aRbUs13vz1jK5zCWvO/fYzY1cByJPdGSaS5yc7Y0hbYzIdxyTsZZxAKjc2rPN4avEKuH5H78s9Tb9ddGxAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781881245; c=relaxed/simple;
	bh=/QfzYbffaf8bwih6CIvEpCLzvEWYOwXUbazlryFVh7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7bojDNm/Mu2v4DH9v4M8s5ewplXkiIY/2hNsww7A0yuThx78yJRjo+StfwDSkKiY6qXfsHHQHaYqf+u1tR+EA65zaBcNBTMeSRJ2kh8vdBFvZJk3tLrPIAQMfPppcbVBatQJp9b7CSOSkI2RVNRjnlgv48WvPIdjEHiH8Ai4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GHFsOEOk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sIzSYWeW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ox47kuih; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GybF9mAO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GHFsOEOk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sIzSYWeW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ox47kuih";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GybF9mAO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8893A6DB45;
	Fri, 19 Jun 2026 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781881241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NS+RAkssP9CJ7FZ+16aScWXBvleUCpHf1yujlCLAJ/8=;
	b=GHFsOEOkpJ4ApBpOp8aKe5oQkii521dHTnbRqE9wA33yIQQtMegApET/YfnB9S6ZWI9joa
	JJFf+u3xqRwWj8pNwOsVnDQHRx+JAbLFlJWO0w/uQx01lr32FZoaVFF2r+fOfvfW12UOg3
	BWMKhNdIL3Lk4FSp7wOInWcqHjT/G8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781881241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NS+RAkssP9CJ7FZ+16aScWXBvleUCpHf1yujlCLAJ/8=;
	b=sIzSYWeWYE3kLYqZ+nefErlz6xkzNFWGMR/EO5M6pOMeSeUhdR0zcNcNwCxXSqsf0ThGDu
	aqmJN7HOggDtidBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781881236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NS+RAkssP9CJ7FZ+16aScWXBvleUCpHf1yujlCLAJ/8=;
	b=ox47kuihvof6xBYYTTg2zeDl/OepI4cWYpSuM9FwL+T5VX0JJ8K0bxNwoNHhK30hvyqwjj
	rLeaJoWN0pSlliiGT6LCpPLUi8ljNN5aoWyyYiW6Ner1i4299JdOn9Y3FWIAucx/ps2t1f
	NFJGoD8yvZm7Szgv1Y6C6TvaA4Rosls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781881236;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=NS+RAkssP9CJ7FZ+16aScWXBvleUCpHf1yujlCLAJ/8=;
	b=GybF9mAODLVq2aEkk+SgnY/R+cugKdAF4o97KPWY6oPV6USFBdrNZjPhak9kY6jz4sTOXe
	ViQtLw/ny8FO+XCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62573779A8;
	Fri, 19 Jun 2026 15:00:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hWO/FpRZNWqOPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jun 2026 15:00:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH] ALSA: pcm: Notify disconnected state at mmap data fault, too
Date: Fri, 19 Jun 2026 17:00:34 +0200
Message-ID: <20260619150035.1560937-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

When a device gets disconnected, the driver waits until the all opened
file descriptors are closed before releasing the device.  Although PCM
core emits an error to any further syscalls (except for close), some
applications don't notice the disconnected state because they mainly
access only via mmap, and it may block the device release
unnecessarily too long.

This patch is an attempt to improve the behavior by adding the
notification of the PCM disconnected state at mmap data faulting.
When the device is disconnected, it now returns VM_FAULT_SIGBUS, so
that the application can notice the invalid PCM state.

Reported-and-tested-by: Ai Chao <aichao@kylinos.cn>
Link: https://lore.kernel.org/20260615132657.2097213-1-aichao@kylinos.cn>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 7dc0060617f1..d4e04b5088c5 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3907,6 +3907,8 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
 	if (substream == NULL)
 		return VM_FAULT_SIGBUS;
 	runtime = substream->runtime;
+	if (runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
+		return VM_FAULT_SIGBUS;
 	offset = vmf->pgoff << PAGE_SHIFT;
 	dma_bytes = PAGE_ALIGN(runtime->dma_bytes);
 	if (offset > dma_bytes - PAGE_SIZE)
-- 
2.54.0

