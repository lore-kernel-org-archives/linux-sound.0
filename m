Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533DF84A39
	for <linux-sound@vger.kernel.org>; Thu,  3 Oct 2024 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727940215; cv=none; b=fV+dWA0qpg3jaWNGRj/CjAFehTnH3JiRiEwnHvEfyfRf4Y8hMEHYVUT38Ucxmi8V3WzAg+2OqOMmyy9SzLdweulLB/THWmxOrJt3kglgtmLTzARlvM8zP+Ikvegio0NpZ+wKLud9QL1rRedYIBDpozVZVVRoErAqzxZwYjs+w0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727940215; c=relaxed/simple;
	bh=+AR7p4a9tZykmRl4b/T93PhH4SEr43dTI1XSm/MzUjc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uMkDcuC8soThMQDIsy3R87rChJps6owuATOO5+7hR/2XXQLdMXWsAGFWNRntUWTaBKgJF85IUJF/A+ftgP5Z5ecoun9u6+ogeW8LWS0SHU3wgAM9shbeUKRqrR+XyssKu7+wut6+AaxhJ8ILHC6AJvVd4NPgKhSYHy5/mvauv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XVRgRzzV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EqJsAgZ8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XVRgRzzV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EqJsAgZ8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XVRgRzzV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EqJsAgZ8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XVRgRzzV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EqJsAgZ8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2312F21B93;
	Thu,  3 Oct 2024 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727940209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PPpg9p6KyyXCtCfK3II7ueO1TORUlFMRxz47/ipnMgY=;
	b=XVRgRzzVGEujVng9szrD/Uq9X9ZgWPDJgD4bsOYWCrwjMd0PU/kHrFMkThvMx/wgBowvLo
	SvxMe9z+pKf58sMtDLygx8TPSQsC6GtwaQiFquPYpcvN4LUTihdAw5GrI9dHNUHXxYUow5
	lYqbcVtHL2wXxchmWIyR+krHw9POsaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727940209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PPpg9p6KyyXCtCfK3II7ueO1TORUlFMRxz47/ipnMgY=;
	b=EqJsAgZ8YZzG9KwX8qY46UIxCKDjQ4pFkT4QLUpTaOWe+sets2H7edgpt3Aef0QGx4lcT1
	cSVz4uwcpc5ouSCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XVRgRzzV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EqJsAgZ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727940209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PPpg9p6KyyXCtCfK3II7ueO1TORUlFMRxz47/ipnMgY=;
	b=XVRgRzzVGEujVng9szrD/Uq9X9ZgWPDJgD4bsOYWCrwjMd0PU/kHrFMkThvMx/wgBowvLo
	SvxMe9z+pKf58sMtDLygx8TPSQsC6GtwaQiFquPYpcvN4LUTihdAw5GrI9dHNUHXxYUow5
	lYqbcVtHL2wXxchmWIyR+krHw9POsaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727940209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PPpg9p6KyyXCtCfK3II7ueO1TORUlFMRxz47/ipnMgY=;
	b=EqJsAgZ8YZzG9KwX8qY46UIxCKDjQ4pFkT4QLUpTaOWe+sets2H7edgpt3Aef0QGx4lcT1
	cSVz4uwcpc5ouSCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04D1B139CE;
	Thu,  3 Oct 2024 07:23:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GE3eOnBG/mb/RQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Oct 2024 07:23:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Add missing parameter description for snd_hdac_stream_timecounter_init()
Date: Thu,  3 Oct 2024 09:24:18 +0200
Message-ID: <20241003072420.8932-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2312F21B93
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Add the missing description for the new parameter "start" of
snd_hdac_stream_timecounter_init() in the previous patch.

Fixes: df5215618fbe ("ALSA: hda: fix trigger_tstamp_latched")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410031300.ecLmATNd-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 0411a8fe9d6f..2670792f43b4 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -657,6 +657,7 @@ static void azx_timecounter_init(struct hdac_stream *azx_dev,
  * snd_hdac_stream_timecounter_init - initialize time counter
  * @azx_dev: HD-audio core stream (master stream)
  * @streams: bit flags of streams to set up
+ * @start: true for PCM trigger start, false for other cases
  *
  * Initializes the time counter of streams marked by the bit flags (each
  * bit corresponds to the stream index).
-- 
2.43.0

