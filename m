Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21497347D
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971887; cv=none; b=mgDcm1U6kMqbbAxwScvkQv5G6DbFx/r5b4wq23bdtmLtS/262YrTWtOVjGlz1RsfmQucDu6+Z7cfKAyZ55XRko5yYn2FEmo2dJgg6NC0PaNyGJLSjx00VgrNcZnskh8XSxAj85EcPJZ9IkRKzISZRWuhmmWANV/D6hQL0H5pH7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971887; c=relaxed/simple;
	bh=0d9bIGbj5C6XNrsNMF+tZwDteFlWSpjTDLpQPZdiZGw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lPKm8+7Q3Lz2nZcxOFq5foGktTE8BcEsl6COfHSjUnVhAROoR2M0H5VPCfRsuFygDjhksXAtJSxnkjLNo4Yh9MtEEhEtyEAtMFRkHQKakUwutgPnHGPGSpgMLfdRmGXTJV8lGOzB95Kf4UJj4eLjoa01s0btuqSv9UsTzZ+DPzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tSlVZdRH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LdIYRrbP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tSlVZdRH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LdIYRrbP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tSlVZdRH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LdIYRrbP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tSlVZdRH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LdIYRrbP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B9E7022D4D;
	Wed, 29 May 2024 08:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716971883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DiaI0icAUJ8MGxnxmBgHAisSaIUR3rX4sXirJxv+cMM=;
	b=tSlVZdRHCgra7EKvWI/Jn593Udfedh1EtAbwMbUeHjgUbc0gLsSZwqgr3hAC7tAKYYG4B+
	dSSSuu/yfxiBb+2KqqjoM8ZZIGtxHDAvDBOBhJm0klCtZJdKsZL1sHOwXDG1kdqA9Y9PlK
	Tht4MUnKL2t5A+53uaHZQ1SA7HU2EBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716971883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DiaI0icAUJ8MGxnxmBgHAisSaIUR3rX4sXirJxv+cMM=;
	b=LdIYRrbP+gxLSAhoTg/E20UfreyJy05oz83pNQJa2NM/OFt9sT36DmJ5TGIe4EpORzOjTV
	FCIDpsm9JDf7Z+BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tSlVZdRH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LdIYRrbP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716971883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DiaI0icAUJ8MGxnxmBgHAisSaIUR3rX4sXirJxv+cMM=;
	b=tSlVZdRHCgra7EKvWI/Jn593Udfedh1EtAbwMbUeHjgUbc0gLsSZwqgr3hAC7tAKYYG4B+
	dSSSuu/yfxiBb+2KqqjoM8ZZIGtxHDAvDBOBhJm0klCtZJdKsZL1sHOwXDG1kdqA9Y9PlK
	Tht4MUnKL2t5A+53uaHZQ1SA7HU2EBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716971883;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DiaI0icAUJ8MGxnxmBgHAisSaIUR3rX4sXirJxv+cMM=;
	b=LdIYRrbP+gxLSAhoTg/E20UfreyJy05oz83pNQJa2NM/OFt9sT36DmJ5TGIe4EpORzOjTV
	FCIDpsm9JDf7Z+BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1A0B1372E;
	Wed, 29 May 2024 08:38:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qyZEJmvpVmZgaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 May 2024 08:38:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Don't clear bank selection after sending a program change
Date: Wed, 29 May 2024 10:38:21 +0200
Message-ID: <20240529083823.5778-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B9E7022D4D
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

The current code clears the bank selection MSB/LSB after sending a
program change, but this can be wrong, as many apps may not send the
full bank selection with both MSB and LSB but sending only one.
Better to keep the previous bank set.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump_convert.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index de04799fdb69..f67c44c83fde 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -404,7 +404,6 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			midi2->pg.bank_msb = cc->cc_bank_msb;
 			midi2->pg.bank_lsb = cc->cc_bank_lsb;
 			cc->bank_set = 0;
-			cc->cc_bank_msb = cc->cc_bank_lsb = 0;
 		}
 		break;
 	case UMP_MSG_STATUS_CHANNEL_PRESSURE:
-- 
2.43.0

