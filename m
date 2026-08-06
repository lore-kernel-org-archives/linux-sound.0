Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47083374E55
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024829; cv=none; b=SQ5kWO0nCNMLrC+2y/+ufAR/mOJHOw6OMO2e/iDwmnDCBVA0SSOCsb9GpbhEFmbXDfWjVhqgihDD+f+5oHUcnTWRFGUWasKBi5nr+yWRT/d1jIJ8E/aIM0jTfnw7nSu1C19Fv2eCdxYWeVuescl1JqldeeXKnNLVl70TcUNblys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024829; c=relaxed/simple;
	bh=WVs7CYtmve25x69d27AOPhH/S6cVg1pKxShn+HK9u9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8Ua7kh/Fo/yAYLDJ/D+NDXSezbb1eIkWgz8s6X3db/xR4G8gxi4egPA0/6L1nVcmSYsOtzGC9k5oS52XRL3oevSUD5XPw/61Q7exVvCnp60t1paP4Q2evLZf+idKoqDMSX6+kAJbI21PeNc4Qka4lh1lycjSfsjHkqd2EhhD1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jlle4njD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J5jqunoL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2RnY1Nxw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dX+hheQG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jlle4njD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J5jqunoL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2RnY1Nxw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dX+hheQG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 499F33E16;
	Thu,  6 Aug 2026 14:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuO+MUy+1uRzX1DRrOuzF9dgijdfPNPED5OCI3l40Yc=;
	b=jlle4njDmTuZLI2uwLBEbJU3j1zEcx76o13pT7L2J4p+2f4iaCU9vo0ZT2xfSrAhQEekhN
	Nt8z5o3eq27R56oDTaYPP2yVplLX98LFltk8HLDPLSkK/OKfqCUnhOXxKXZ/vDD74MZ5Yo
	M51hRltm59KBc4LGMq0rZFiD7SPvfDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuO+MUy+1uRzX1DRrOuzF9dgijdfPNPED5OCI3l40Yc=;
	b=J5jqunoL5O4wOI/iGVMAEi9lz2tYdhrFG5Zg4WJ/Or0Y3uBbknnlsa7xYA/GN7ClpjCBbE
	1vByr/I2CKDJv8CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2RnY1Nxw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dX+hheQG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuO+MUy+1uRzX1DRrOuzF9dgijdfPNPED5OCI3l40Yc=;
	b=2RnY1Nxw8fpGxlDdh0L2jLUlTFyFZz2+OmKMWQna1vt++IQ/ymUcJ8iX4QjbK/J5lo39MN
	TKYaGY5EhJdt4KvMwMZeVCVQj79yv/HNptQWcl+H+q19tgmGZrbVjfHdmKRGDQqvU6LZ77
	V1d9YRXIcI8gyxsVPpufwSg/1ZZAhQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LuO+MUy+1uRzX1DRrOuzF9dgijdfPNPED5OCI3l40Yc=;
	b=dX+hheQGnMHVtGpBrzyoRbHMa0NNr6lxUxoeHwKnyGKms+Fcd0wLJy3GhfihahVj8HoPx6
	R1QxZktuDe/oNnCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 25232779EB;
	Thu,  6 Aug 2026 14:00:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4EOOB2uTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Nick Li <nick.li@foursemi.com>
Subject: [PATCH v2 07/31] ASoC: fs-amp-lib: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:39 +0200
Message-ID: <20260806140006.1412298-8-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 499F33E16
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Nick Li <nick.li@foursemi.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/fs-amp-lib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/fs-amp-lib.c b/sound/soc/codecs/fs-amp-lib.c
index c8f56617e370..a562c72fc524 100644
--- a/sound/soc/codecs/fs-amp-lib.c
+++ b/sound/soc/codecs/fs-amp-lib.c
@@ -221,7 +221,7 @@ static void fs_print_firmware_info(struct fs_amp_lib *amp_lib)
 
 int fs_amp_load_firmware(struct fs_amp_lib *amp_lib, const char *name)
 {
-	const struct firmware *cont;
+	const struct firmware *cont __free(firmware) = NULL;
 	struct fs_fwm_header *hdr;
 	int ret;
 
@@ -237,7 +237,6 @@ int fs_amp_load_firmware(struct fs_amp_lib *amp_lib, const char *name)
 	dev_info(amp_lib->dev, "Loading %s - size: %zu\n", name, cont->size);
 
 	hdr = devm_kmemdup(amp_lib->dev, cont->data, cont->size, GFP_KERNEL);
-	release_firmware(cont);
 	if (!hdr)
 		return -ENOMEM;
 
-- 
2.55.0

