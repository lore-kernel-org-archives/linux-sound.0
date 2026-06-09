Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9780F400DFB
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005873; cv=none; b=eGWYByNLAm494GM5fpZL5kdYiVabV6ko0AF2zFCanjvFypp7u8fNTe0SQPDKHVnsB5YNl4F8Gb8B3mGKm3dviaOVWgj+O1feJn4T1zxSRk+qp1eByXYyipo4L6chocWSb0UQyDI3zdlvuheCMc4+qIva8EehR1j/AeR7uILCvmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005873; c=relaxed/simple;
	bh=glyo9EJZaoq6gyMDPj+MyQ1fFtsVZpOHPz4fHyYaAE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjMtf19DnUm9DFmbI45MtBrzQJxXS0doou7871GXW5R7EpgTgEWBWrdl7kEEsF2TExc3Jcu/r+qQD1HyQS+8m4g2+RIFP0vEX5eC/4NonSmlXbbtvr+Hc5+pcaxeHJyfPT/Xs2834xg9XASly0H9+m9e/tZ9Ho6JkBspP3HJjKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eufOMuzm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k36IIY8f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eufOMuzm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k36IIY8f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eufOMuzm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k36IIY8f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eufOMuzm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k36IIY8f"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39A846AAB3;
	Tue,  9 Jun 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781005865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v90XqdbZexAxCiPzwDh7GHoje0dXrDgvHEFSus6WtIU=;
	b=eufOMuzmZoD3ZKxZwD7gnGNmBBuTTv5N7qSuwdezM5lLfxPm3WuAl8RVMBuRdJ7AjXM08A
	DSaemvqvOCdWSTE1H5tN5MaDMbu0SNnufEg0bVZGIs86JWxWt+PLNVCQxJaM3nUolTkd8+
	memJT/EwRlVEK/vZWAmN/x+8QZXFzLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781005865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v90XqdbZexAxCiPzwDh7GHoje0dXrDgvHEFSus6WtIU=;
	b=k36IIY8fYAd6MNBtbgyGzcGmrf5vKc2Ef8gowTg6ugPTU1EjkeQxWLooiuqcl7t89wFQ+e
	ql13P12CYJ+bLoBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eufOMuzm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=k36IIY8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781005865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v90XqdbZexAxCiPzwDh7GHoje0dXrDgvHEFSus6WtIU=;
	b=eufOMuzmZoD3ZKxZwD7gnGNmBBuTTv5N7qSuwdezM5lLfxPm3WuAl8RVMBuRdJ7AjXM08A
	DSaemvqvOCdWSTE1H5tN5MaDMbu0SNnufEg0bVZGIs86JWxWt+PLNVCQxJaM3nUolTkd8+
	memJT/EwRlVEK/vZWAmN/x+8QZXFzLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781005865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v90XqdbZexAxCiPzwDh7GHoje0dXrDgvHEFSus6WtIU=;
	b=k36IIY8fYAd6MNBtbgyGzcGmrf5vKc2Ef8gowTg6ugPTU1EjkeQxWLooiuqcl7t89wFQ+e
	ql13P12CYJ+bLoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A204779A7;
	Tue,  9 Jun 2026 11:51:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OEXIBSn+J2rvMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Jun 2026 11:51:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH 3/3] ALSA: timer: Disable work at freeing timer object
Date: Tue,  9 Jun 2026 13:50:55 +0200
Message-ID: <20260609115100.806869-4-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609115100.806869-1-tiwai@suse.de>
References: <20260609115100.806869-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 39A846AAB3
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

There might be a pending work at freeing a timer object, hence clean
it up properly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 6baa63a3bad0..a3ae5416485e 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1045,6 +1045,8 @@ static int snd_timer_free(struct snd_timer *timer)
 		list_del(&timer->device_list);
 	}
 
+	disable_work_sync(&timer->task_work);
+
 	snd_timer_ref_put(timer);
 	return 0;
 }
-- 
2.54.0

