Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D588D321420
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514785; cv=none; b=K2quTf9Bs3PXGfWRtTqUG9NaMNNNnqspeDHaLcgrSRNLXvqjhn/lr6yxifLLGDzgTUVt18MO3hWbGjObBYwKNDcNpiBixrh02se2l4KFCzWfc1xZ8pF+LNfARMfbcgX7Py5nlKHO4NQNuj9oHAr8vQzwvvBmvtkZKxSxUmzYUQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514785; c=relaxed/simple;
	bh=jqHovWqIOv50klOtUvKoVcOXHqNTL1thd0OvG0a3NEk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVDLjNlMcF4ACrvGCX1MsD4kYVPCIoBVCA3gJi9PDSBCnHc5fQuz8hcH0aazwtvLw6JICHmTEOxLkmbN/cC85Bklq825L9xDsj39zEUJxXs18CMGIvkoxXxZJZ+Vlp0ZiDf+8wntCgPAeiBXAeOdBFfw93lRoDadigMd1jU5VfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rIr3DQqH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gIOavX+i; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xyR1bqJD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Vu06gBeP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rIr3DQqH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gIOavX+i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xyR1bqJD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vu06gBeP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA24A3E3D;
	Wed, 12 Aug 2026 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tl+fVLFlnOOq5gdKtjZl78zn4cvmdae1ltNvfSpj0V0=;
	b=rIr3DQqHSpnrGt0SS/nk7/zOh6vcGSL5v70stFs0zmIZ7KqDVSDCY3EP+59bVZNUidV1a4
	jdjiEfr39j+8JGWodaXtJxTC0erDVuv2zmCarsiD82UY6kmKi3qpEGwWFF+CRbTocdozLo
	vUDMvjNNhpOCZ8q70ggUwSv3auhq7hI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tl+fVLFlnOOq5gdKtjZl78zn4cvmdae1ltNvfSpj0V0=;
	b=gIOavX+ijoDjzCOyFU2Z2iOjSSSmSHHKAAymlZOxzCTxtP1xKD1Um+bryn1qJPgSU8221m
	INl/hBDzNwxoo0Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xyR1bqJD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Vu06gBeP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tl+fVLFlnOOq5gdKtjZl78zn4cvmdae1ltNvfSpj0V0=;
	b=xyR1bqJDL3ZPXUxR85KyiNbQsOx3qDBHZmr8wAU3FajmoSbQfI89DapjyfZK/FyACF0o44
	5Vd92yDjlM46SlsYJBY3liEso2tTul6hUtyXpTG3FCgmGTLh4l+ZbqcYFyFai/YydPbeSY
	OLVTPBCVZFm7eYWUBXm2pPwlpVyzzNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tl+fVLFlnOOq5gdKtjZl78zn4cvmdae1ltNvfSpj0V0=;
	b=Vu06gBePZBk/ZBUrvLhn/l4lIlyzewQjXXCvy4YYS5ZQWp1efeNhvgi4PPTnpylu749Hkn
	9+NMhSQLzKjVmfAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A339779B2;
	Wed, 12 Aug 2026 06:06:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2N50JFMNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 01/14] ALSA: uapi: Drop __bitwise and __force prefix
Date: Wed, 12 Aug 2026 08:04:33 +0200
Message-ID: <20260812060557.80445-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: BA24A3E3D
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

We've used __bitwise and __force for some integer parameters for
sanity-checks via sparse, with a hope that it'll reduce the misuse or
incorrect assignments.  This worked in principle, but OTOH, it's been
quite a PITA, making the code much uglier than its gain, too, because
one had to cast with __force everywhere.  Also, Rust-binding would
skip those defines because of __force usage, which will become more
pains in near future.

So let's drop __bitwise and __force prefix usages.  In this patch, we
start cleaning up the UAPI headers at first.  The former bit-wised
typedefs are still kept for compatibility for now.

As it's only markers for sparse, the changes are absolutely safe, per
se.  Only that we'll need to watch out more carefully about the
variable usage for PCM format type, etc.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h |   8 +-
 include/uapi/sound/asound.h     | 178 ++++++++++++++++----------------
 2 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index a5c41f771e05..0c4281992a99 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -348,10 +348,10 @@ struct snd_seq_running_info {
 
 
 	/* client types */
-typedef int __bitwise snd_seq_client_type_t;
-#define	NO_CLIENT	((__force snd_seq_client_type_t) 0)
-#define	USER_CLIENT	((__force snd_seq_client_type_t) 1)
-#define	KERNEL_CLIENT	((__force snd_seq_client_type_t) 2)
+typedef int snd_seq_client_type_t;
+#define	NO_CLIENT	0
+#define	USER_CLIENT	1
+#define	KERNEL_CLIENT	2
                         
 	/* event filter flags */
 #define SNDRV_SEQ_FILTER_BROADCAST	(1U<<0)	/* accept broadcast messages */
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 500599213f93..c11da9656e38 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -169,72 +169,72 @@ enum {
 	SNDRV_PCM_STREAM_LAST = SNDRV_PCM_STREAM_CAPTURE,
 };
 
-typedef int __bitwise snd_pcm_access_t;
-#define	SNDRV_PCM_ACCESS_MMAP_INTERLEAVED	((__force snd_pcm_access_t) 0) /* interleaved mmap */
-#define	SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED	((__force snd_pcm_access_t) 1) /* noninterleaved mmap */
-#define	SNDRV_PCM_ACCESS_MMAP_COMPLEX		((__force snd_pcm_access_t) 2) /* complex mmap */
-#define	SNDRV_PCM_ACCESS_RW_INTERLEAVED		((__force snd_pcm_access_t) 3) /* readi/writei */
-#define	SNDRV_PCM_ACCESS_RW_NONINTERLEAVED	((__force snd_pcm_access_t) 4) /* readn/writen */
+typedef int snd_pcm_access_t;
+#define	SNDRV_PCM_ACCESS_MMAP_INTERLEAVED	0 /* interleaved mmap */
+#define	SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED	1 /* noninterleaved mmap */
+#define	SNDRV_PCM_ACCESS_MMAP_COMPLEX		2 /* complex mmap */
+#define	SNDRV_PCM_ACCESS_RW_INTERLEAVED		3 /* readi/writei */
+#define	SNDRV_PCM_ACCESS_RW_NONINTERLEAVED	4 /* readn/writen */
 #define	SNDRV_PCM_ACCESS_LAST		SNDRV_PCM_ACCESS_RW_NONINTERLEAVED
 
-typedef int __bitwise snd_pcm_format_t;
-#define	SNDRV_PCM_FORMAT_S8	((__force snd_pcm_format_t) 0)
-#define	SNDRV_PCM_FORMAT_U8	((__force snd_pcm_format_t) 1)
-#define	SNDRV_PCM_FORMAT_S16_LE	((__force snd_pcm_format_t) 2)
-#define	SNDRV_PCM_FORMAT_S16_BE	((__force snd_pcm_format_t) 3)
-#define	SNDRV_PCM_FORMAT_U16_LE	((__force snd_pcm_format_t) 4)
-#define	SNDRV_PCM_FORMAT_U16_BE	((__force snd_pcm_format_t) 5)
-#define	SNDRV_PCM_FORMAT_S24_LE	((__force snd_pcm_format_t) 6) /* low three bytes */
-#define	SNDRV_PCM_FORMAT_S24_BE	((__force snd_pcm_format_t) 7) /* low three bytes */
-#define	SNDRV_PCM_FORMAT_U24_LE	((__force snd_pcm_format_t) 8) /* low three bytes */
-#define	SNDRV_PCM_FORMAT_U24_BE	((__force snd_pcm_format_t) 9) /* low three bytes */
+typedef int snd_pcm_format_t;
+#define	SNDRV_PCM_FORMAT_S8		0
+#define	SNDRV_PCM_FORMAT_U8		1
+#define	SNDRV_PCM_FORMAT_S16_LE		2
+#define	SNDRV_PCM_FORMAT_S16_BE		3
+#define	SNDRV_PCM_FORMAT_U16_LE		4
+#define	SNDRV_PCM_FORMAT_U16_BE		5
+#define	SNDRV_PCM_FORMAT_S24_LE		6	/* low three bytes */
+#define	SNDRV_PCM_FORMAT_S24_BE		7	/* low three bytes */
+#define	SNDRV_PCM_FORMAT_U24_LE		8	/* low three bytes */
+#define	SNDRV_PCM_FORMAT_U24_BE		9	/* low three bytes */
 /*
  * For S32/U32 formats, 'msbits' hardware parameter is often used to deliver information about the
  * available bit count in most significant bit. It's for the case of so-called 'left-justified' or
  * `right-padding` sample which has less width than 32 bit.
  */
-#define	SNDRV_PCM_FORMAT_S32_LE	((__force snd_pcm_format_t) 10)
-#define	SNDRV_PCM_FORMAT_S32_BE	((__force snd_pcm_format_t) 11)
-#define	SNDRV_PCM_FORMAT_U32_LE	((__force snd_pcm_format_t) 12)
-#define	SNDRV_PCM_FORMAT_U32_BE	((__force snd_pcm_format_t) 13)
-#define	SNDRV_PCM_FORMAT_FLOAT_LE	((__force snd_pcm_format_t) 14) /* 4-byte float, IEEE-754 32-bit, range -1.0 to 1.0 */
-#define	SNDRV_PCM_FORMAT_FLOAT_BE	((__force snd_pcm_format_t) 15) /* 4-byte float, IEEE-754 32-bit, range -1.0 to 1.0 */
-#define	SNDRV_PCM_FORMAT_FLOAT64_LE	((__force snd_pcm_format_t) 16) /* 8-byte float, IEEE-754 64-bit, range -1.0 to 1.0 */
-#define	SNDRV_PCM_FORMAT_FLOAT64_BE	((__force snd_pcm_format_t) 17) /* 8-byte float, IEEE-754 64-bit, range -1.0 to 1.0 */
-#define	SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE ((__force snd_pcm_format_t) 18) /* IEC-958 subframe, Little Endian */
-#define	SNDRV_PCM_FORMAT_IEC958_SUBFRAME_BE ((__force snd_pcm_format_t) 19) /* IEC-958 subframe, Big Endian */
-#define	SNDRV_PCM_FORMAT_MU_LAW		((__force snd_pcm_format_t) 20)
-#define	SNDRV_PCM_FORMAT_A_LAW		((__force snd_pcm_format_t) 21)
-#define	SNDRV_PCM_FORMAT_IMA_ADPCM	((__force snd_pcm_format_t) 22)
-#define	SNDRV_PCM_FORMAT_MPEG		((__force snd_pcm_format_t) 23)
-#define	SNDRV_PCM_FORMAT_GSM		((__force snd_pcm_format_t) 24)
-#define	SNDRV_PCM_FORMAT_S20_LE	((__force snd_pcm_format_t) 25) /* in four bytes, LSB justified */
-#define	SNDRV_PCM_FORMAT_S20_BE	((__force snd_pcm_format_t) 26) /* in four bytes, LSB justified */
-#define	SNDRV_PCM_FORMAT_U20_LE	((__force snd_pcm_format_t) 27) /* in four bytes, LSB justified */
-#define	SNDRV_PCM_FORMAT_U20_BE	((__force snd_pcm_format_t) 28) /* in four bytes, LSB justified */
+#define	SNDRV_PCM_FORMAT_S32_LE		10
+#define	SNDRV_PCM_FORMAT_S32_BE		11
+#define	SNDRV_PCM_FORMAT_U32_LE		12
+#define	SNDRV_PCM_FORMAT_U32_BE		13
+#define	SNDRV_PCM_FORMAT_FLOAT_LE	14	/* 4-byte float, IEEE-754 32-bit, range -1.0 to 1.0 */
+#define	SNDRV_PCM_FORMAT_FLOAT_BE	15	/* 4-byte float, IEEE-754 32-bit, range -1.0 to 1.0 */
+#define	SNDRV_PCM_FORMAT_FLOAT64_LE	16	/* 8-byte float, IEEE-754 64-bit, range -1.0 to 1.0 */
+#define	SNDRV_PCM_FORMAT_FLOAT64_BE	17	/* 8-byte float, IEEE-754 64-bit, range -1.0 to 1.0 */
+#define	SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE 18	/* IEC-958 subframe, Little Endian */
+#define	SNDRV_PCM_FORMAT_IEC958_SUBFRAME_BE 19	/* IEC-958 subframe, Big Endian */
+#define	SNDRV_PCM_FORMAT_MU_LAW		20
+#define	SNDRV_PCM_FORMAT_A_LAW		21
+#define	SNDRV_PCM_FORMAT_IMA_ADPCM	22
+#define	SNDRV_PCM_FORMAT_MPEG		23
+#define	SNDRV_PCM_FORMAT_GSM		24
+#define	SNDRV_PCM_FORMAT_S20_LE		25	/* in four bytes, LSB justified */
+#define	SNDRV_PCM_FORMAT_S20_BE		26	/* in four bytes, LSB justified */
+#define	SNDRV_PCM_FORMAT_U20_LE		27	/* in four bytes, LSB justified */
+#define	SNDRV_PCM_FORMAT_U20_BE		28	/* in four bytes, LSB justified */
 /* gap in the numbering for a future standard linear format */
-#define	SNDRV_PCM_FORMAT_SPECIAL	((__force snd_pcm_format_t) 31)
-#define	SNDRV_PCM_FORMAT_S24_3LE	((__force snd_pcm_format_t) 32)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_S24_3BE	((__force snd_pcm_format_t) 33)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_U24_3LE	((__force snd_pcm_format_t) 34)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_U24_3BE	((__force snd_pcm_format_t) 35)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_S20_3LE	((__force snd_pcm_format_t) 36)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_S20_3BE	((__force snd_pcm_format_t) 37)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_U20_3LE	((__force snd_pcm_format_t) 38)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_U20_3BE	((__force snd_pcm_format_t) 39)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_S18_3LE	((__force snd_pcm_format_t) 40)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_S18_3BE	((__force snd_pcm_format_t) 41)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_U18_3LE	((__force snd_pcm_format_t) 42)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_U18_3BE	((__force snd_pcm_format_t) 43)	/* in three bytes */
-#define	SNDRV_PCM_FORMAT_G723_24	((__force snd_pcm_format_t) 44) /* 8 samples in 3 bytes */
-#define	SNDRV_PCM_FORMAT_G723_24_1B	((__force snd_pcm_format_t) 45) /* 1 sample in 1 byte */
-#define	SNDRV_PCM_FORMAT_G723_40	((__force snd_pcm_format_t) 46) /* 8 Samples in 5 bytes */
-#define	SNDRV_PCM_FORMAT_G723_40_1B	((__force snd_pcm_format_t) 47) /* 1 sample in 1 byte */
-#define	SNDRV_PCM_FORMAT_DSD_U8		((__force snd_pcm_format_t) 48) /* DSD, 1-byte samples DSD (x8) */
-#define	SNDRV_PCM_FORMAT_DSD_U16_LE	((__force snd_pcm_format_t) 49) /* DSD, 2-byte samples DSD (x16), little endian */
-#define	SNDRV_PCM_FORMAT_DSD_U32_LE	((__force snd_pcm_format_t) 50) /* DSD, 4-byte samples DSD (x32), little endian */
-#define	SNDRV_PCM_FORMAT_DSD_U16_BE	((__force snd_pcm_format_t) 51) /* DSD, 2-byte samples DSD (x16), big endian */
-#define	SNDRV_PCM_FORMAT_DSD_U32_BE	((__force snd_pcm_format_t) 52) /* DSD, 4-byte samples DSD (x32), big endian */
+#define	SNDRV_PCM_FORMAT_SPECIAL	31
+#define	SNDRV_PCM_FORMAT_S24_3LE	32	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_S24_3BE	33	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_U24_3LE	34	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_U24_3BE	35	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_S20_3LE	36	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_S20_3BE	37	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_U20_3LE	38	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_U20_3BE	39	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_S18_3LE	40	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_S18_3BE	41	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_U18_3LE	42	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_U18_3BE	43	/* in three bytes */
+#define	SNDRV_PCM_FORMAT_G723_24	44	/* 8 samples in 3 bytes */
+#define	SNDRV_PCM_FORMAT_G723_24_1B	45	/* 1 sample in 1 byte */
+#define	SNDRV_PCM_FORMAT_G723_40	46	/* 8 Samples in 5 bytes */
+#define	SNDRV_PCM_FORMAT_G723_40_1B	47	/* 1 sample in 1 byte */
+#define	SNDRV_PCM_FORMAT_DSD_U8		48	/* DSD, 1-byte samples DSD (x8) */
+#define	SNDRV_PCM_FORMAT_DSD_U16_LE	49	/* DSD, 2-byte samples DSD (x16), little endian */
+#define	SNDRV_PCM_FORMAT_DSD_U32_LE	50	/* DSD, 4-byte samples DSD (x32), little endian */
+#define	SNDRV_PCM_FORMAT_DSD_U16_BE	51	/* DSD, 2-byte samples DSD (x16), big endian */
+#define	SNDRV_PCM_FORMAT_DSD_U32_BE	52	/* DSD, 4-byte samples DSD (x32), big endian */
 #define	SNDRV_PCM_FORMAT_LAST		SNDRV_PCM_FORMAT_DSD_U32_BE
 #define	SNDRV_PCM_FORMAT_FIRST		SNDRV_PCM_FORMAT_S8
 
@@ -265,11 +265,11 @@ typedef int __bitwise snd_pcm_format_t;
 #define	SNDRV_PCM_FORMAT_U20		SNDRV_PCM_FORMAT_U20_BE
 #endif
 
-typedef int __bitwise snd_pcm_subformat_t;
-#define	SNDRV_PCM_SUBFORMAT_STD		((__force snd_pcm_subformat_t) 0)
-#define	SNDRV_PCM_SUBFORMAT_MSBITS_MAX	((__force snd_pcm_subformat_t) 1)
-#define	SNDRV_PCM_SUBFORMAT_MSBITS_20	((__force snd_pcm_subformat_t) 2)
-#define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 3)
+typedef int snd_pcm_subformat_t;
+#define	SNDRV_PCM_SUBFORMAT_STD		0
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_MAX	1
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_20	2
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_24	3
 #define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_24
 
 #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
@@ -303,16 +303,16 @@ typedef int __bitwise snd_pcm_subformat_t;
 #define __SND_STRUCT_TIME64
 #endif
 
-typedef int __bitwise snd_pcm_state_t;
-#define	SNDRV_PCM_STATE_OPEN		((__force snd_pcm_state_t) 0) /* stream is open */
-#define	SNDRV_PCM_STATE_SETUP		((__force snd_pcm_state_t) 1) /* stream has a setup */
-#define	SNDRV_PCM_STATE_PREPARED	((__force snd_pcm_state_t) 2) /* stream is ready to start */
-#define	SNDRV_PCM_STATE_RUNNING		((__force snd_pcm_state_t) 3) /* stream is running */
-#define	SNDRV_PCM_STATE_XRUN		((__force snd_pcm_state_t) 4) /* stream reached an xrun */
-#define	SNDRV_PCM_STATE_DRAINING	((__force snd_pcm_state_t) 5) /* stream is draining */
-#define	SNDRV_PCM_STATE_PAUSED		((__force snd_pcm_state_t) 6) /* stream is paused */
-#define	SNDRV_PCM_STATE_SUSPENDED	((__force snd_pcm_state_t) 7) /* hardware is suspended */
-#define	SNDRV_PCM_STATE_DISCONNECTED	((__force snd_pcm_state_t) 8) /* hardware is disconnected */
+typedef int snd_pcm_state_t;
+#define	SNDRV_PCM_STATE_OPEN		0 /* stream is open */
+#define	SNDRV_PCM_STATE_SETUP		1 /* stream has a setup */
+#define	SNDRV_PCM_STATE_PREPARED	2 /* stream is ready to start */
+#define	SNDRV_PCM_STATE_RUNNING		3 /* stream is running */
+#define	SNDRV_PCM_STATE_XRUN		4 /* stream reached an xrun */
+#define	SNDRV_PCM_STATE_DRAINING	5 /* stream is draining */
+#define	SNDRV_PCM_STATE_PAUSED		6 /* stream is paused */
+#define	SNDRV_PCM_STATE_SUSPENDED	7 /* hardware is suspended */
+#define	SNDRV_PCM_STATE_DISCONNECTED	8 /* hardware is disconnected */
 #define	SNDRV_PCM_STATE_LAST		SNDRV_PCM_STATE_DISCONNECTED
 
 enum {
@@ -1091,24 +1091,24 @@ struct snd_ctl_card_bytes {
 	__u64 data;				/* user buffer (pointer stored as __u64) */
 };
 
-typedef int __bitwise snd_ctl_elem_type_t;
-#define	SNDRV_CTL_ELEM_TYPE_NONE	((__force snd_ctl_elem_type_t) 0) /* invalid */
-#define	SNDRV_CTL_ELEM_TYPE_BOOLEAN	((__force snd_ctl_elem_type_t) 1) /* boolean type */
-#define	SNDRV_CTL_ELEM_TYPE_INTEGER	((__force snd_ctl_elem_type_t) 2) /* integer type */
-#define	SNDRV_CTL_ELEM_TYPE_ENUMERATED	((__force snd_ctl_elem_type_t) 3) /* enumerated type */
-#define	SNDRV_CTL_ELEM_TYPE_BYTES	((__force snd_ctl_elem_type_t) 4) /* byte array */
-#define	SNDRV_CTL_ELEM_TYPE_IEC958	((__force snd_ctl_elem_type_t) 5) /* IEC958 (S/PDIF) setup */
-#define	SNDRV_CTL_ELEM_TYPE_INTEGER64	((__force snd_ctl_elem_type_t) 6) /* 64-bit integer type */
+typedef int snd_ctl_elem_type_t;
+#define	SNDRV_CTL_ELEM_TYPE_NONE	0 /* invalid */
+#define	SNDRV_CTL_ELEM_TYPE_BOOLEAN	1 /* boolean type */
+#define	SNDRV_CTL_ELEM_TYPE_INTEGER	2 /* integer type */
+#define	SNDRV_CTL_ELEM_TYPE_ENUMERATED	3 /* enumerated type */
+#define	SNDRV_CTL_ELEM_TYPE_BYTES	4 /* byte array */
+#define	SNDRV_CTL_ELEM_TYPE_IEC958	5 /* IEC958 (S/PDIF) setup */
+#define	SNDRV_CTL_ELEM_TYPE_INTEGER64	6 /* 64-bit integer type */
 #define	SNDRV_CTL_ELEM_TYPE_LAST	SNDRV_CTL_ELEM_TYPE_INTEGER64
 
-typedef int __bitwise snd_ctl_elem_iface_t;
-#define	SNDRV_CTL_ELEM_IFACE_CARD	((__force snd_ctl_elem_iface_t) 0) /* global control */
-#define	SNDRV_CTL_ELEM_IFACE_HWDEP	((__force snd_ctl_elem_iface_t) 1) /* hardware dependent device */
-#define	SNDRV_CTL_ELEM_IFACE_MIXER	((__force snd_ctl_elem_iface_t) 2) /* virtual mixer device */
-#define	SNDRV_CTL_ELEM_IFACE_PCM	((__force snd_ctl_elem_iface_t) 3) /* PCM device */
-#define	SNDRV_CTL_ELEM_IFACE_RAWMIDI	((__force snd_ctl_elem_iface_t) 4) /* RawMidi device */
-#define	SNDRV_CTL_ELEM_IFACE_TIMER	((__force snd_ctl_elem_iface_t) 5) /* timer device */
-#define	SNDRV_CTL_ELEM_IFACE_SEQUENCER	((__force snd_ctl_elem_iface_t) 6) /* sequencer client */
+typedef int snd_ctl_elem_iface_t;
+#define	SNDRV_CTL_ELEM_IFACE_CARD	0 /* global control */
+#define	SNDRV_CTL_ELEM_IFACE_HWDEP	1 /* hardware dependent device */
+#define	SNDRV_CTL_ELEM_IFACE_MIXER	2 /* virtual mixer device */
+#define	SNDRV_CTL_ELEM_IFACE_PCM	3 /* PCM device */
+#define	SNDRV_CTL_ELEM_IFACE_RAWMIDI	4 /* RawMidi device */
+#define	SNDRV_CTL_ELEM_IFACE_TIMER	5 /* timer device */
+#define	SNDRV_CTL_ELEM_IFACE_SEQUENCER	6 /* sequencer client */
 #define	SNDRV_CTL_ELEM_IFACE_LAST	SNDRV_CTL_ELEM_IFACE_SEQUENCER
 
 #define SNDRV_CTL_ELEM_ACCESS_READ		(1<<0)
-- 
2.55.0

