Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5F01F4E46
	for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737478839; cv=none; b=A8Mh4v+BeUwsJ7vrGBmMMaqiq5HdRCeY+kNke7k227K38fwxSRWKMoC4w07huprA2Nh/gWwY8DJaUf8yLBlTw2p5KY8OUT7MMvDGKnpW1vxv3+cKVJ2tDJdtPam70KslGrQmhYbSe0mI+iwOyq5gz56KDPIP7u0WIiuFQnvkKuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737478839; c=relaxed/simple;
	bh=RnK5/nYbd++PfS0Bj2dQu4etfx0T59rsTOZLD3Ls1Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwNDiKY7SXqHaQ67uKj5I23itpsTnV9C7Fv27tRLrmOdfum8mZLflmFqQOJYLjutTN+2vf5iccxDDsmE9eM/QT1gLpwOP6TW7+9+LBSPsn/gTeHPgXuJ1gil+BltVkpK5Gnklkf6pUJXYRP90/JD1bXw3ZwF5+DbVbptz0vd+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=siNJDs2k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gUHnWCw6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=siNJDs2k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gUHnWCw6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="siNJDs2k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gUHnWCw6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="siNJDs2k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gUHnWCw6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 144A51F443;
	Tue, 21 Jan 2025 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737478836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sJL/2REsJzqo9iNn7I6z4ygayRN493pLzw2vvVTRyQ=;
	b=siNJDs2k9ukBGu5zk1d9w16BKfYM2ccu624oGUWyOKjWwlvg16i2dEBIdDTrY8h5sXwi5A
	Mzz+7BVMe6w/IBNL7lGVy+qpnF4/JufYd+e++uzl6VuJtBpzuHXdLquUQJIpE+vTD2OtCB
	ehDmsMmXIixhQQwi1QaEOtnCpI3b+tI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737478836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sJL/2REsJzqo9iNn7I6z4ygayRN493pLzw2vvVTRyQ=;
	b=gUHnWCw6BsfJ11VFEuNcVw2x/+FsXI0PbF7OMl1VAiezizfD3lx/Mzi2lHn5T0+zBEQNMc
	TT6H6TLCPzn25LBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=siNJDs2k;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gUHnWCw6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737478836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sJL/2REsJzqo9iNn7I6z4ygayRN493pLzw2vvVTRyQ=;
	b=siNJDs2k9ukBGu5zk1d9w16BKfYM2ccu624oGUWyOKjWwlvg16i2dEBIdDTrY8h5sXwi5A
	Mzz+7BVMe6w/IBNL7lGVy+qpnF4/JufYd+e++uzl6VuJtBpzuHXdLquUQJIpE+vTD2OtCB
	ehDmsMmXIixhQQwi1QaEOtnCpI3b+tI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737478836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sJL/2REsJzqo9iNn7I6z4ygayRN493pLzw2vvVTRyQ=;
	b=gUHnWCw6BsfJ11VFEuNcVw2x/+FsXI0PbF7OMl1VAiezizfD3lx/Mzi2lHn5T0+zBEQNMc
	TT6H6TLCPzn25LBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB3A313991;
	Tue, 21 Jan 2025 17:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gOQ1OLPSj2d3bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Jan 2025 17:00:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH 3/3] ALSA: usb: fcp: Fix return code from poll ops
Date: Tue, 21 Jan 2025 18:00:31 +0100
Message-ID: <20250121170032.7236-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121170032.7236-1-tiwai@suse.de>
References: <20250121170032.7236-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 144A51F443
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Fix a sparse warning due to the invalid return type from poll ops,
which is __poll_t.

Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/fcp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index cfa131b35e43..7df65041ace5 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -843,18 +843,18 @@ static long fcp_hwdep_read(struct snd_hwdep *hw, char __user *buf,
 	return sizeof(event);
 }
 
-static unsigned int fcp_hwdep_poll(struct snd_hwdep *hw,
-				   struct file *file,
-				   poll_table *wait)
+static __poll_t fcp_hwdep_poll(struct snd_hwdep *hw,
+			       struct file *file,
+			       poll_table *wait)
 {
 	struct usb_mixer_interface *mixer = hw->private_data;
 	struct fcp_data *private = mixer->private_data;
-	unsigned int mask = 0;
+	__poll_t mask = 0;
 
 	poll_wait(file, &private->notify.queue, wait);
 
 	if (private->notify.event)
-		mask |= POLLIN | POLLRDNORM;
+		mask |= EPOLLIN | EPOLLRDNORM;
 
 	return mask;
 }
-- 
2.43.0

