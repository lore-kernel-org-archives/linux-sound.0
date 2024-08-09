Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD844178374
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 07:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723189131; cv=none; b=puor8XBuwNXRPqXwwyJGCGrKd0FOymMvOGAn8v/WUjQE2zzQmzKlYD9yk+8+siqJe+RbT0B42XEMm8R4KzEVXPy5zaK9Ea3033ikOsbX75/RB6xyCszFCU5a9Ib8BhLonz7AuBqP4Zm0xvUD8oZirqeGdnHkj/xQUyebHD6de/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723189131; c=relaxed/simple;
	bh=sQ0OABIkAQP60E6wrjZJyxI9WwqK0Aysu70B42xsYjc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=gdba2WUTdWpQnwFqCfnF9bBNZp6z7nKK52E0T/ViZ92LgjJ9KwiyOzCcA7j0DIS1xg1OWvYlMpF41aenNAKoEGP2nJ+ht7nx9mHUbHs5Fqby7G62C7atkD3uLtPjM0qJK5aOVEcyz7bIht4uKFEAfuh86JgJIrLtYgwLdABBqQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aIHxreeW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=crwkcgCL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Rvd+5nW0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p0Qp4LSm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aIHxreeW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="crwkcgCL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rvd+5nW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p0Qp4LSm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E32BB1FF18;
	Fri,  9 Aug 2024 07:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723189127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2d+olvftG6F6K/BckjXKnNY9rKTPJWZsUUjEg9wfgYg=;
	b=aIHxreeWl9QgiotrqfNiRBeFxxNFC4Xor+hKHOrufp6iezkGOyU6m3Olg0DHqAvWdUzQu1
	U5oVu+c1umML1S/LTGqSsdXWutWGOBXBHM8cEA3Ze1e5/EQvTDvXw05pcDV/Y2NZ3hjT55
	jFSb0CaFPNqRxLkO+9pwV1LtB1GiSsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723189127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2d+olvftG6F6K/BckjXKnNY9rKTPJWZsUUjEg9wfgYg=;
	b=crwkcgCLwstvoQr91MsycPdxxbgQr4Z22k61di8mPrYUq89jhRWzvPPCsnxOP4Tougs+R1
	0UoZgNRWvHD2r5Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Rvd+5nW0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p0Qp4LSm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723189126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2d+olvftG6F6K/BckjXKnNY9rKTPJWZsUUjEg9wfgYg=;
	b=Rvd+5nW0mVweefwETpTfMOx5b7qEjxIBI+ol9lgZAGGHlVjuxugY2Elk++aAAMs/BJn3TC
	48Ev3IF4t/hu8aPy8fUeLLZk8sHMSpu1toGtx9reTo6UMgTkibrOPF4ngwEx1S3P8kVwke
	OaijXNT2n2k03h2qfzxFgnzWCrUoV2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723189126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2d+olvftG6F6K/BckjXKnNY9rKTPJWZsUUjEg9wfgYg=;
	b=p0Qp4LSmG8w9YSSrYWoFi0GH89Tvcq+zuZppjVCoIWQ7fRljXSuFJtvED+0b90WBq73xDK
	HSYn+taxxc9Tn+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C86001379A;
	Fri,  9 Aug 2024 07:38:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id soCtL4bHtWaEFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 07:38:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: sparc: Fix a typo at dev_*() conversion
Date: Fri,  9 Aug 2024 09:39:21 +0200
Message-ID: <20240809073923.3735-1-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.01 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: E32BB1FF18

There was a stupid typo left that broke the build.  Fix it.

Fixes: d41abde89483 ("ALSA: sparc: Use standard print API")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408090648.J2EAijjH-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/cs4231.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 5f39b7847d31..a1339f9ef12a 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -2015,7 +2015,7 @@ static int snd_cs4231_ebus_create(struct snd_card *card,
 
 	if (ebus_dma_register(&chip->p_dma.ebus_info)) {
 		snd_cs4231_ebus_free(chip);
-		dev_dbg(chpi->card->dev,
+		dev_dbg(chip->card->dev,
 			"cs4231-%d: Unable to register EBUS play DMA\n",
 			dev);
 		return -EBUSY;
-- 
2.43.0

