Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E82E54A1
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077563; cv=none; b=uwhLJFccVFCx+NBZSBZc/G9l/woNQquswN8NNQ9DLE0YZtgo+aorh9iFhswAAIyYkUWSIg+Rf6yFJ+Bhe2uXsJkMBMXamg/YUi1gLrcWzGpw/zf3rrz5aKAHHcb1jg+VqPpxmmxo+EauG0w40Ju1AITCdDxL8x1f78VBx5/3wMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077563; c=relaxed/simple;
	bh=u2k8KeJUo/ukmnNg9cSQrosDdqAbiMW/G2ljvJpcC9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2AymR/3xB3Pl5K0dpHKbagg6w+e7Pr771txceYIZ5mS07P7iUU+nBV8DdDhQiu020zCsiy6OwrV6VbapT8hhcWBWCaK5aaqIidB9+H2BaVmQFdEJ6fNnSY+7vo3jFPR7NHSihnH6VssTyAqM9+JtTTjl3YDvy8kZd8ge4j77mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qcb+Rr/s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZDf4vfdJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qcb+Rr/s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZDf4vfdJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qcb+Rr/s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZDf4vfdJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qcb+Rr/s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZDf4vfdJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF5F32117D;
	Wed,  9 Jul 2025 16:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RqVFtCosL/UcovoJrYuP/P2XT3mhJ3verX2TXN3sJXQ=;
	b=qcb+Rr/sDDVtv2KcLT5b4t1YC5pOE9U+yQGKz8fSBdk1KDzpke8jvX7CSvbizL5NnVDLZY
	dtc+spNk0fSzLZkaH3CsS872F2V6gn93vBLJQksGw6hcabP6PQNkr9hwAGGMwmslwyjHgw
	zHjqS4WC46zzJmuUMoyqGPh2ip7jmEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RqVFtCosL/UcovoJrYuP/P2XT3mhJ3verX2TXN3sJXQ=;
	b=ZDf4vfdJ6MFh9RxO+sjaYbb4WYm3Dr0GOl9GVFCSbQ7VnlLaUHjaSCP/v3f8orAf0SOe/y
	ciwesfNUdvJ8rvAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="qcb+Rr/s";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZDf4vfdJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RqVFtCosL/UcovoJrYuP/P2XT3mhJ3verX2TXN3sJXQ=;
	b=qcb+Rr/sDDVtv2KcLT5b4t1YC5pOE9U+yQGKz8fSBdk1KDzpke8jvX7CSvbizL5NnVDLZY
	dtc+spNk0fSzLZkaH3CsS872F2V6gn93vBLJQksGw6hcabP6PQNkr9hwAGGMwmslwyjHgw
	zHjqS4WC46zzJmuUMoyqGPh2ip7jmEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RqVFtCosL/UcovoJrYuP/P2XT3mhJ3verX2TXN3sJXQ=;
	b=ZDf4vfdJ6MFh9RxO+sjaYbb4WYm3Dr0GOl9GVFCSbQ7VnlLaUHjaSCP/v3f8orAf0SOe/y
	ciwesfNUdvJ8rvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95CF1136DC;
	Wed,  9 Jul 2025 16:04:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6D1IIx6TbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:04:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kailang <kailang@realtek.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 04/27] ALSA: hda: Move CONFIG_SND_HDA_PREALLOC_SIZE into sound/hda/common
Date: Wed,  9 Jul 2025 18:04:07 +0200
Message-ID: <20250709160434.1859-5-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709160434.1859-1-tiwai@suse.de>
References: <20250709160434.1859-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: DF5F32117D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

CONFIG_SND_HDA_PREALLOC_SIZE is used only by controller.c in
sound/hda/common, hence it depends on CONFIG_SND_HDA.

Move the definition to the right place inside SND_HDA if/endif block
in sound/hda/common/Kconfig.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/Kconfig | 17 +++++++++++++++++
 sound/hda/core/Kconfig   | 16 ----------------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/sound/hda/common/Kconfig b/sound/hda/common/Kconfig
index d1e2bfd24c11..f38e1947fb3e 100644
--- a/sound/hda/common/Kconfig
+++ b/sound/hda/common/Kconfig
@@ -77,4 +77,21 @@ config SND_HDA_CTL_DEV_ID
 
 	  The old behaviour (Y) is obsolete and will be removed. Consider
 	  to not enable this option.
+
+config SND_HDA_PREALLOC_SIZE
+	int "Pre-allocated buffer size for HD-audio driver"
+	range 0 32768
+	default 0 if SND_DMA_SGBUF
+	default 64 if !SND_DMA_SGBUF
+	help
+	  Specifies the default pre-allocated buffer-size in kB for the
+	  HD-audio driver.  A larger buffer (e.g. 2048) is preferred
+	  for systems using PulseAudio.  The default 64 is chosen just
+	  for compatibility reasons.
+	  On x86 systems, the default is zero as S/G allocation works
+	  and no preallocation is needed in most cases.
+
+	  Note that the pre-allocation size can be changed dynamically
+	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
+
 endif
diff --git a/sound/hda/core/Kconfig b/sound/hda/core/Kconfig
index eb488a522572..bfdcf6384c52 100644
--- a/sound/hda/core/Kconfig
+++ b/sound/hda/core/Kconfig
@@ -20,22 +20,6 @@ config SND_HDA_EXT_CORE
        tristate
        select SND_HDA_CORE
 
-config SND_HDA_PREALLOC_SIZE
-	int "Pre-allocated buffer size for HD-audio driver"
-	range 0 32768
-	default 0 if SND_DMA_SGBUF
-	default 64 if !SND_DMA_SGBUF
-	help
-	  Specifies the default pre-allocated buffer-size in kB for the
-	  HD-audio driver.  A larger buffer (e.g. 2048) is preferred
-	  for systems using PulseAudio.  The default 64 is chosen just
-	  for compatibility reasons.
-	  On x86 systems, the default is zero as S/G allocation works
-	  and no preallocation is needed in most cases.
-
-	  Note that the pre-allocation size can be changed dynamically
-	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
-
 config SND_INTEL_NHLT
 	bool
 	# this config should be selected only for Intel ACPI platforms.
-- 
2.50.0

