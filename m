Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C96B3D4122
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 14:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831545; cv=none; b=vAfq9TlhZrFDYC0dbQTf8bQbItlv085Y9DMgwXcEakVddscdSkIyOcY5pq6l2ZdlA4zR1EbqJt9M5DVVJo4j9aleRhXOFGwLjosftgXMd6nvmLWec9+XOpp8s4AnA60cqFTi0BKejO6elvvU85hPGrRTmv+XcI6skR9d6397xEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831545; c=relaxed/simple;
	bh=AawMgTAIMTG5n43yJ+fqzfX3lyd809mOab7JBPnjP84=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eSEZYjM+RieC0VxyUUo+ohOX1qnoStXnIVIK1/SHxNerA3iIk4AiTI13vRfb0MFQPj06Ox+FRykCrLJvZQsY+5BJ8dV0uxjrgavGmRANNPXMRou1OHv3Mw0LHBOJDHewnkOeiN8rp9iPKuDkay0Ze8vFCwN1ldiXQLEooj5I8TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wCQDf5HV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KgkXCTbV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wCQDf5HV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KgkXCTbV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wCQDf5HV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KgkXCTbV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wCQDf5HV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KgkXCTbV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 855516A7EC;
	Fri, 10 Apr 2026 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775831541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z0GSNIdaIhqASIVPAWwtguyqWnOSn8AjzgZQSIKZFLM=;
	b=wCQDf5HVisvWSxFrlhhg5fZeiMzmDJKnVa7jva67RqN0jJi8NhtPN3lnHtUbclh7/Dn6mr
	MGLz3t3dxjAGIJXLxdWd1tKgoyj1K844EX5mMSMQuVOUbiuqvxuUOjDx0PCupMC0d394qF
	1KlBcEflPtIveYlubBqzzS2Ic8a0Yvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775831541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z0GSNIdaIhqASIVPAWwtguyqWnOSn8AjzgZQSIKZFLM=;
	b=KgkXCTbVSJUC0Aossi8JLbUFQf32TPRNoWab2ZNM8R32B3+K8reRj/1ozmuodcAV1jprgE
	op2lqMD8B6RUQXBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wCQDf5HV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KgkXCTbV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775831541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z0GSNIdaIhqASIVPAWwtguyqWnOSn8AjzgZQSIKZFLM=;
	b=wCQDf5HVisvWSxFrlhhg5fZeiMzmDJKnVa7jva67RqN0jJi8NhtPN3lnHtUbclh7/Dn6mr
	MGLz3t3dxjAGIJXLxdWd1tKgoyj1K844EX5mMSMQuVOUbiuqvxuUOjDx0PCupMC0d394qF
	1KlBcEflPtIveYlubBqzzS2Ic8a0Yvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775831541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=z0GSNIdaIhqASIVPAWwtguyqWnOSn8AjzgZQSIKZFLM=;
	b=KgkXCTbVSJUC0Aossi8JLbUFQf32TPRNoWab2ZNM8R32B3+K8reRj/1ozmuodcAV1jprgE
	op2lqMD8B6RUQXBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6878B4A0B2;
	Fri, 10 Apr 2026 14:32:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PUFWGPUJ2WljawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 14:32:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Evaluate packsize caps at the right place
Date: Fri, 10 Apr 2026 16:32:19 +0200
Message-ID: <20260410143220.1676344-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Queue-Id: 855516A7EC
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

We introduced the upper bound checks of the packet sizes by the
ep->maxframesize for avoiding the URB submission errors.  However, the
check was applied at an incorrect place in the function
snd_usb_endpoint_set_params() where ep->maxframesize isn't defined
yet; the value is defined at a bit later position.  So this ended up
with a failure at the first run while the second run works.

For fixing it, move the check at the correct place, right after the
calculation of ep->maxframesize in the same function.

Fixes: 7fe8dec3f628 ("ALSA: usb-audio: Cap the packet size pre-calculations")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221292
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index bf4401aba76c..6fbcb117555c 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1379,9 +1379,6 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 		return -EINVAL;
 	}
 
-	ep->packsize[0] = min(ep->packsize[0], ep->maxframesize);
-	ep->packsize[1] = min(ep->packsize[1], ep->maxframesize);
-
 	/* calculate the frequency in 16.16 format */
 	ep->freqm = ep->freqn;
 	ep->freqshift = INT_MIN;
@@ -1408,6 +1405,9 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	ep->maxframesize = ep->maxpacksize / ep->cur_frame_bytes;
 	ep->curframesize = ep->curpacksize / ep->cur_frame_bytes;
 
+	ep->packsize[0] = min(ep->packsize[0], ep->maxframesize);
+	ep->packsize[1] = min(ep->packsize[1], ep->maxframesize);
+
 	err = update_clock_ref_rate(chip, ep);
 	if (err >= 0) {
 		ep->need_setup = false;
-- 
2.53.0

