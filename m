Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E953C3AFD0D
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314293; cv=none; b=m+di3ciWfSPZCR4c71rDNWez8vzTjPw6tdQBYEJQy4URBOUgwMRG+s0s3FAbZ13yXLXQXOPnu4CxizmRFsh+Jgvk0Gk+0PK3G5I6Zra0rxcLG3q/4tRHHvuLdyIRFSnljnl9kWjpVbKGorRZVjOfxQQMRpwuqeYKn4OIaIcaDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314293; c=relaxed/simple;
	bh=sNOfwxxXYCKobn7B+vDZ+nBNLonZCyHP7PACEC0kyug=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+7obOde5D2FBWdatP9EvmEMzEGdd/KJ2b8kq9TEmKq+Oc6HF0MynAio8lm+5FI/sHNEY/dSz+Fn/CzlR+EwnRDd53YcOh5fgpAYYCBk0NOLnCTIJHkgLTkHXpyWZmupsu/kUH3mPmj+wVP5Edns8iwXPoI7CiKWkZcnSbqfYEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ShUpcdCj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HfU8Htx5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ylrhTeGb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n7NQWS7z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ShUpcdCj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HfU8Htx5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ylrhTeGb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n7NQWS7z"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DABD47C92C;
	Wed, 29 Jul 2026 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRLHlBwvBuKG8KvB8R8KMwaO9hIMudOGDgsw1L6vhcc=;
	b=ShUpcdCjfZ3ZqNsn7MlS/cGgIiK9VaQS3GeFKYaHuzDz9X8jlgP3SYZOFNXw70eB3jP//d
	WiFQskel7kiyKxlHDQ1Xb0UI8/j1jaEacR3irrjrUH5IGrcfwcBVPFSiCzv2XgCUDU7cn+
	sLvVE0IUip6KMbMU3QxBWwit5lvc8uo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRLHlBwvBuKG8KvB8R8KMwaO9hIMudOGDgsw1L6vhcc=;
	b=HfU8Htx5wzKJ3Whj527oM1lT72wRSFFoMlt7gzTIHJ0GdOHwUvuzTf3+qxl6OxeJDaiQn2
	E3iNL4zR84XYMXDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRLHlBwvBuKG8KvB8R8KMwaO9hIMudOGDgsw1L6vhcc=;
	b=ylrhTeGbKjaXfc90n6NU+1/yeYGCMhoYCjxQ2krBR1/wuuFvGEA/UEUtr2LuqJymaqdQ2q
	sArou60JzCuPTEZlxM4oxwNIJMUxVA9LWYUdjiynGldHNyyF8IQfsberijiE4QDbPgdIC9
	P5GQJr1O2E4cK6vwDmzFKEqg0iTRdGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRLHlBwvBuKG8KvB8R8KMwaO9hIMudOGDgsw1L6vhcc=;
	b=n7NQWS7zUasrJgAqSiwAFc5xiAjKawuEspO6pciqEL3ROrkeG+GBLAHCqg4Hw3jEl+1R1Y
	QkdQrUaPmLbGz4AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C808779C0;
	Wed, 29 Jul 2026 08:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8KpZFdi7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 07/14] ALSA: sscape: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:25 +0200
Message-ID: <20260729083735.120219-8-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sscape.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/isa/sscape.c b/sound/isa/sscape.c
index ce8a59650e38..9b615b588cdf 100644
--- a/sound/isa/sscape.c
+++ b/sound/isa/sscape.c
@@ -526,7 +526,7 @@ static int upload_dma_data(struct soundscape *s, const unsigned char *data,
 static int sscape_upload_bootblock(struct snd_card *card)
 {
 	struct soundscape *sscape = get_card_soundscape(card);
-	const struct firmware *init_fw = NULL;
+	const struct firmware *init_fw __free(firmware) = NULL;
 	int data = 0;
 	int ret;
 
@@ -537,8 +537,6 @@ static int sscape_upload_bootblock(struct snd_card *card)
 	}
 	ret = upload_dma_data(sscape, init_fw->data, init_fw->size);
 
-	release_firmware(init_fw);
-
 	guard(spinlock_irqsave)(&sscape->lock);
 	if (ret == 0)
 		data = host_read_ctrl_unsafe(sscape->io_base, 100);
@@ -562,7 +560,7 @@ static int sscape_upload_bootblock(struct snd_card *card)
 static int sscape_upload_microcode(struct snd_card *card, int version)
 {
 	struct soundscape *sscape = get_card_soundscape(card);
-	const struct firmware *init_fw = NULL;
+	const struct firmware *init_fw __free(firmware) = NULL;
 	char name[14];
 	int err;
 
@@ -579,8 +577,6 @@ static int sscape_upload_microcode(struct snd_card *card, int version)
 		dev_info(card->dev, "sscape: MIDI firmware loaded %zu KBs\n",
 			 init_fw->size >> 10);
 
-	release_firmware(init_fw);
-
 	return err;
 }
 
-- 
2.55.0

