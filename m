Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18519C564
	for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726063036; cv=none; b=qSKknX3cHnyKNawLbD0HnlVKlxMTOYFz3y9QCLYDkix/f5po0srs3d1MeKfoJFMjz0iPB5xfu0mc8uiKiw4i5trkUtvHOqpyyzaWf8flkm/6K8oeUYVs8NWzAbowg965aCi6ZcroxJn1dIX9fZxLBRRaXbBCXzSeEifu5C6ya24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726063036; c=relaxed/simple;
	bh=TAzcWqscQQ3M4CoOj2TL22FL/x7dv7MSZqST0rvLTR0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=d5FaqJnSnVno7iA2N0e+P7AEFpCDPET0W9Ef/fy3aashvJt8fJnSLRoTFEyCAvCaCZQgE385siuQHk+ZyyakdjWSqotYj0PzALNHcnfMz9YRie/yudJF0YhfoOPIoNP7dXb/EwzxaGOdw5hAuLM2l3Zc6jmTdoKpfwAYRLpfM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QQePGKfr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yFx4Btu3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QQePGKfr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yFx4Btu3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QQePGKfr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yFx4Btu3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QQePGKfr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yFx4Btu3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3AFE71F8B2;
	Wed, 11 Sep 2024 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726063032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mlq7PEudxhNp9cRaNywtTlErCYynxE8OucBl5+jADxE=;
	b=QQePGKfrlrrH+HXqrDOVo4oAe7k6flWiz+QwfpeYiVcOzl46QSPrYgvdVFYhGOkXCSMNhj
	E62hZNxSYH+rEf6F7Id0rrs0NeZWFCSk+GRU+iDfMcuY4y3Nim1L7nG5N9DF8KFAostUY6
	H6PNVMuxNRdn9G+hcyam44U+2eKzkXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726063032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mlq7PEudxhNp9cRaNywtTlErCYynxE8OucBl5+jADxE=;
	b=yFx4Btu3uPSZZEAPe92UxwB0hv3PIkKO8Orznk0qcFtSfXxLEHaLvS3kS3S3NL2zOraUPy
	2s/3gVSzsOsXcXDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QQePGKfr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yFx4Btu3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726063032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mlq7PEudxhNp9cRaNywtTlErCYynxE8OucBl5+jADxE=;
	b=QQePGKfrlrrH+HXqrDOVo4oAe7k6flWiz+QwfpeYiVcOzl46QSPrYgvdVFYhGOkXCSMNhj
	E62hZNxSYH+rEf6F7Id0rrs0NeZWFCSk+GRU+iDfMcuY4y3Nim1L7nG5N9DF8KFAostUY6
	H6PNVMuxNRdn9G+hcyam44U+2eKzkXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726063032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mlq7PEudxhNp9cRaNywtTlErCYynxE8OucBl5+jADxE=;
	b=yFx4Btu3uPSZZEAPe92UxwB0hv3PIkKO8Orznk0qcFtSfXxLEHaLvS3kS3S3NL2zOraUPy
	2s/3gVSzsOsXcXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12EA713A7C;
	Wed, 11 Sep 2024 13:57:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jmZeA7ih4WZtTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Sep 2024 13:57:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Fix breakage of PCM rates used for topology
Date: Wed, 11 Sep 2024 15:57:52 +0200
Message-ID: <20240911135756.24434-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3AFE71F8B2
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
X-Spam-Flag: NO

It turned out that the topology ABI takes the standard PCM rate bits
as is, and it means that the recent change of the PCM rate bits would
lead to the inconsistent rate values used for topology.

This patch reverts the original PCM rate bit definitions while adding
the new rates to the extended bits instead.  This needed the change of
snd_pcm_known_rates, too.  And this also required to fix the handling
in snd_pcm_hw_limit_rates() that blindly assumed that the list is
sorted while it became unsorted now.

Fixes: 090624b7dc83 ("ALSA: pcm: add more sample rate definitions")
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Closes: https://lore.kernel.org/1ab3efaa-863c-4dd0-8f81-b50fd9775fad@linux.intel.com
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 35 ++++++++++++++++++-----------------
 sound/core/pcm_misc.c   | 18 ++++++++++--------
 sound/core/pcm_native.c | 10 +++++++---
 3 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index c993350975a9..0bf7d25434d7 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -109,23 +109,24 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
 #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
 #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
-#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
-#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
-#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
-#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
-#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
-#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
-#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
-#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
-#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
-#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
-#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
-#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
-#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
-#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
-#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
-#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
-#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
+#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
+#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
+#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
+#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
+#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
+#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
+#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
+#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
+#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
+#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
+#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
+#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
+/* extended rates since 6.12 */
+#define SNDRV_PCM_RATE_12000		(1U<<17)	/* 12000Hz */
+#define SNDRV_PCM_RATE_24000		(1U<<18)	/* 24000Hz */
+#define SNDRV_PCM_RATE_128000		(1U<<19)	/* 128000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 5588b6a1ee8b..4f556211bb56 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -494,18 +494,20 @@ EXPORT_SYMBOL(snd_pcm_format_set_silence);
 int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw)
 {
 	int i;
+	unsigned int rmin, rmax;
+
+	rmin = UINT_MAX;
+	rmax = 0;
 	for (i = 0; i < (int)snd_pcm_known_rates.count; i++) {
 		if (hw->rates & (1 << i)) {
-			hw->rate_min = snd_pcm_known_rates.list[i];
-			break;
-		}
-	}
-	for (i = (int)snd_pcm_known_rates.count - 1; i >= 0; i--) {
-		if (hw->rates & (1 << i)) {
-			hw->rate_max = snd_pcm_known_rates.list[i];
-			break;
+			rmin = min(rmin, snd_pcm_known_rates.list[i]);
+			rmax = max(rmax, snd_pcm_known_rates.list[i]);
 		}
 	}
+	if (rmin > rmax)
+		return -EINVAL;
+	hw->rate_min = rmin;
+	hw->rate_max = rmax;
 	return 0;
 }
 EXPORT_SYMBOL(snd_pcm_hw_limit_rates);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 7461a727615c..5e1e6006707b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2418,13 +2418,17 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 19
+#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12 ||\
+	SNDRV_PCM_RATE_128000 != 1 << 19
 #error "Change this table"
 #endif
 
+/* NOTE: the list is unsorted! */
 static const unsigned int rates[] = {
-	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000,
-	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
+	5512, 8000, 11025, 16000, 22050, 32000, 44100,
+	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000,
+	/* extended */
+	12000, 24000, 128000
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {
-- 
2.43.0

