Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51B54668
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159488; cv=none; b=VZAB9EAeowsY+FlhFUPaM0UEKS0aKYU89Z2oI7CIjKQ0FlF48Pu0VDvZQEN3cDu12nqvKrajQ5X7r/GRx4+sMp1EBtf2N4L24ZSYUAe1o4EmjwjFDmV/U6ME7TkrsmnC6hG5vy5OzkI2JTfTCPV/Fb45s0eX2bLiHPEurV29V9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159488; c=relaxed/simple;
	bh=bzoslyp9wxpGdAUXty3fRT6ekQUCKTV6hrRxG5mUKzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAklrw9kQEqkx8l7OoP72MGdhWzB4K3RvxaVN0t8O5IKdBg7oc+7GubAuyHZK4CcwNaLYCZFiTo5hQo1kKYAp2PGG4P1fKGBay+QCHetrzFr9PIBLe+paDEunW1zYj4ObSAq0bxlIYvWNsF0f/HEDG+nmIAbqqQRuQRxWj/bXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=edRsdBTn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w4MhNB4C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=edRsdBTn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w4MhNB4C; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="edRsdBTn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w4MhNB4C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="edRsdBTn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w4MhNB4C"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A7E852207B;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/ojPmi5uA8YZReMWavdJ8JILKdSDW2fma3X/TwcEgc=;
	b=edRsdBTn3Q4fog4yuXu+hXB1svtpOiIG9CHTAj2NulawFpS4+hwcj0L7+QftxIQL8CIl92
	QfAMRCo5MzcgaYurU6ilF7YE5AFTEujsgkYT2iSyiOxbTcOiaC6UV+EIQQ2v77DYqXfYRx
	4kuYQORT+B53L1GCASUdE83kRgccuDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/ojPmi5uA8YZReMWavdJ8JILKdSDW2fma3X/TwcEgc=;
	b=w4MhNB4CIP9j33ymVr6CTRJ2nTAEwXPjwSakATEMIwO8EiFcxzeQ3mnShEyaBLOVB4spFm
	NjEU5lLHQ1r3OQAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=edRsdBTn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=w4MhNB4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/ojPmi5uA8YZReMWavdJ8JILKdSDW2fma3X/TwcEgc=;
	b=edRsdBTn3Q4fog4yuXu+hXB1svtpOiIG9CHTAj2NulawFpS4+hwcj0L7+QftxIQL8CIl92
	QfAMRCo5MzcgaYurU6ilF7YE5AFTEujsgkYT2iSyiOxbTcOiaC6UV+EIQQ2v77DYqXfYRx
	4kuYQORT+B53L1GCASUdE83kRgccuDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v/ojPmi5uA8YZReMWavdJ8JILKdSDW2fma3X/TwcEgc=;
	b=w4MhNB4CIP9j33ymVr6CTRJ2nTAEwXPjwSakATEMIwO8EiFcxzeQ3mnShEyaBLOVB4spFm
	NjEU5lLHQ1r3OQAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F84513A3D;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4NIBHrVBO2YcFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:11:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/7] ALSA: pcm_dmaengine: Add missing module description
Date: Wed,  8 May 2024 11:11:22 +0200
Message-ID: <20240508091128.25274-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091128.25274-1-tiwai@suse.de>
References: <20240508091128.25274-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.97
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A7E852207B
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.97 / 50.00];
	BAYES_HAM(-2.96)[99.82%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_dmaengine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 494ec0c207fa..12aa1cef11a1 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -470,4 +470,5 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_refine_runtime_hwparams);
 
+MODULE_DESCRIPTION("PCM dmaengine helper APIs");
 MODULE_LICENSE("GPL");
-- 
2.43.0

