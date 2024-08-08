Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C3718B47A
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723134509; cv=none; b=TxcEPJdl5F/jL0n1LWqESECEjpDMbqlcvRq5bcznZ1lbdGSzC/wOpwmSRoQoJnobF5p9XgZB7xP8Qdx51/9u1B2ODuxPvrr2kQLvJWLT7rW8T/TLRCEZV40v53Og1MUcgRTJbrFs+tpdbdk/CfwQQPhv+CJ596lH6tE4dCGqq3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723134509; c=relaxed/simple;
	bh=/pA3qRRKPjv1GzyYjUKW6Xpa+S10jMzFF/74RQHo3yA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Itj1zJuFXM0K20o6aK03lP7hrGvmjxqKxuZM0K3K4LGQvBjsMQJUbe4dUX6fuN+jg44LZe0z4irvJBWyQWO59iM33xhkZX/TUn2g2IH5KaqzP2YueNIoy4qqjzoaZI1nUdJoFH4Md5phOB3cEiVSF/LWDLVO9xoCyUHadhA/42A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZguJK7XN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gHUQHwIP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZguJK7XN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gHUQHwIP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZguJK7XN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gHUQHwIP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZguJK7XN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gHUQHwIP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE7651FCE1;
	Thu,  8 Aug 2024 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723134505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xxo7D8FEW8OdLdBDMiCXHcOMQeYAc+i7vCKucgZ2lVk=;
	b=ZguJK7XN9/XQLjKhfCHSDr35G3U7V8MMznHj7DQKkks/W+enZdAN8D1L55ybg7DW2bKuoS
	TQlJ4tTAGKAO4aHJ9vEShz9iZkYZmOev5eeMk5fBBXQQcN6IcIH5uDR8vXSb7LhJhtfOx4
	l5EIst8hzxQuEiOuTBP5kplBZn8t3Gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723134505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xxo7D8FEW8OdLdBDMiCXHcOMQeYAc+i7vCKucgZ2lVk=;
	b=gHUQHwIPixJZUANltfAbe3Aj8MxTatTNm5Cs7dvEwtKzuRB3l4L2SnK4NjnbBHCXMIuZqG
	zLMpODPpebujgLBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZguJK7XN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gHUQHwIP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723134505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xxo7D8FEW8OdLdBDMiCXHcOMQeYAc+i7vCKucgZ2lVk=;
	b=ZguJK7XN9/XQLjKhfCHSDr35G3U7V8MMznHj7DQKkks/W+enZdAN8D1L55ybg7DW2bKuoS
	TQlJ4tTAGKAO4aHJ9vEShz9iZkYZmOev5eeMk5fBBXQQcN6IcIH5uDR8vXSb7LhJhtfOx4
	l5EIst8hzxQuEiOuTBP5kplBZn8t3Gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723134505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Xxo7D8FEW8OdLdBDMiCXHcOMQeYAc+i7vCKucgZ2lVk=;
	b=gHUQHwIPixJZUANltfAbe3Aj8MxTatTNm5Cs7dvEwtKzuRB3l4L2SnK4NjnbBHCXMIuZqG
	zLMpODPpebujgLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C238613B2E;
	Thu,  8 Aug 2024 16:28:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5RjpLSnytGb0LAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 16:28:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: vxpocket: Drop no longer existent chip->dev assignment
Date: Thu,  8 Aug 2024 18:29:01 +0200
Message-ID: <20240808162902.20082-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim,intel.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim,intel.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -5.01
X-Rspamd-Queue-Id: DE7651FCE1

The recent cleanup change for vx_core overlooked the code in vxpocket
pcmcia driver.  Kill the superfluous line as well.

Fixes: b426b3ba9f6f ("ALSA: vx_core: Drop unused dev field")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408090016.kW0TA6fc-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pcmcia/vx/vxpocket.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pcmcia/vx/vxpocket.c b/sound/pcmcia/vx/vxpocket.c
index 2ea62efa0064..5f72c73eac85 100644
--- a/sound/pcmcia/vx/vxpocket.c
+++ b/sound/pcmcia/vx/vxpocket.c
@@ -204,8 +204,6 @@ static int vxpocket_config(struct pcmcia_device *link)
 	if (ret)
 		goto failed;
 
-	chip->dev = &link->dev;
-
 	if (snd_vxpocket_assign_resources(chip, link->resource[0]->start,
 						link->irq) < 0)
 		goto failed;
-- 
2.43.0

