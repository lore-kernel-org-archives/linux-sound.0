Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268432594AD
	for <linux-sound@vger.kernel.org>; Sun, 29 Dec 2024 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735461563; cv=none; b=tAy8QUhJKAAvhCC9SBFy/gjtrI/JY5S/faFDW6VMUKYE5Hu1E0YwrbJck/sHv4FQp97BC9m9NwXNQOBv9aKJR7xBxzt7FppYTa74qKVTZd1HszchXOODPqxVpn3O3Dho4jo5LZich0KFH1seS3hqBux8vADfQWddBypAa1jHLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735461563; c=relaxed/simple;
	bh=qz58VNTZV8rLAi4DTq5TMdK+W7ljVWpTWNL3VInF6XA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=OeMX/bt4wLWL1pAzMcf9MwQyDoiiPaSo9F3K/4KQcqPHdUHyqVMavglO769sZMWtEoZwCIDU+zg4uZtdiv34GnBDqjQQBxNK/LMndSJPIZER0BCtWnaGLq2wHJ5pBk7gS9YqHiLpbrp8m0+YsqyjUG0UDeoL/Ab3JujYf/FHJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CrZ35Rfs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VYCF/tie; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CrZ35Rfs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VYCF/tie; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CrZ35Rfs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VYCF/tie";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CrZ35Rfs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VYCF/tie"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4A1FA1FCE4;
	Sun, 29 Dec 2024 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735461560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QcnhartD42GGgI3x8fYtXem55tHi26O+GM94x4Mozuw=;
	b=CrZ35RfsLaTV0NJmMp+g4vWHo3Ije+83vXmq1Ez6ne3qgp4efgkUYl4paQhrNRwN1fazsE
	N6wGw+wAUj1rTLqjIh8peDwFgdmQkMDyD9e1EK4CqG41J7rujHzwpMIu80AV0lFiwxZ/cw
	Rm91D4+V5OAXweXVQxHBYgEI0pNvMwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735461560;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QcnhartD42GGgI3x8fYtXem55tHi26O+GM94x4Mozuw=;
	b=VYCF/tieImgU/QU/iYVzU1imm6GtEV8ojM4RpvXxuQx3PGbFV8hYTHIUvS2kOimmj0I24M
	wSgMnPTIGJXnFoCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735461560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QcnhartD42GGgI3x8fYtXem55tHi26O+GM94x4Mozuw=;
	b=CrZ35RfsLaTV0NJmMp+g4vWHo3Ije+83vXmq1Ez6ne3qgp4efgkUYl4paQhrNRwN1fazsE
	N6wGw+wAUj1rTLqjIh8peDwFgdmQkMDyD9e1EK4CqG41J7rujHzwpMIu80AV0lFiwxZ/cw
	Rm91D4+V5OAXweXVQxHBYgEI0pNvMwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735461560;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QcnhartD42GGgI3x8fYtXem55tHi26O+GM94x4Mozuw=;
	b=VYCF/tieImgU/QU/iYVzU1imm6GtEV8ojM4RpvXxuQx3PGbFV8hYTHIUvS2kOimmj0I24M
	wSgMnPTIGJXnFoCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A51E139D0;
	Sun, 29 Dec 2024 08:39:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 91VaCLgKcWd7QwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Dec 2024 08:39:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: compress_offload: Drop unneeded no_free_ptr()
Date: Sun, 29 Dec 2024 09:39:13 +0100
Message-ID: <20241229083917.14912-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The error path for memdup_user() no longer needs the tricky wrap with
no_free_ptr() and we can safely return the error pointer directly.

Fixes: 04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412290846.cncnpGaw-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index edf5aadf38e5..4ed6cec5fd5c 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1077,7 +1077,7 @@ static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long
 		return -EPERM;
 	task = memdup_user((void __user *)arg, sizeof(*task));
 	if (IS_ERR(task))
-		return PTR_ERR(no_free_ptr(task));
+		return PTR_ERR(task);
 	retval = snd_compr_task_new(stream, task);
 	if (retval >= 0)
 		if (copy_to_user((void __user *)arg, task, sizeof(*task)))
@@ -1138,7 +1138,7 @@ static int snd_compr_task_start_ioctl(struct snd_compr_stream *stream, unsigned
 		return -EPERM;
 	task = memdup_user((void __user *)arg, sizeof(*task));
 	if (IS_ERR(task))
-		return PTR_ERR(no_free_ptr(task));
+		return PTR_ERR(task);
 	retval = snd_compr_task_start(stream, task);
 	if (retval >= 0)
 		if (copy_to_user((void __user *)arg, task, sizeof(*task)))
@@ -1229,7 +1229,7 @@ static int snd_compr_task_status_ioctl(struct snd_compr_stream *stream, unsigned
 		return -EPERM;
 	status = memdup_user((void __user *)arg, sizeof(*status));
 	if (IS_ERR(status))
-		return PTR_ERR(no_free_ptr(status));
+		return PTR_ERR(status);
 	retval = snd_compr_task_status(stream, status);
 	if (retval >= 0)
 		if (copy_to_user((void __user *)arg, status, sizeof(*status)))
-- 
2.43.0

