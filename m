Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF7238D3F4
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314306; cv=none; b=RpbtZNGPpURK2ox8kz2wzh7EwKt+18LeAepOtlEsOBtA4ThLp/zPwqzlK3a/g4AAB6db3Z48Saza7Dn4Uh28dv09dkHBgy4C44SRxzZwJnh2Ey/IH4GpLuHiYilVq7j4cD95nKVtyarQfWAqbRnTIi/2Vvu3/k+5VjTJq+IASlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314306; c=relaxed/simple;
	bh=MgNNlw0mYQoKxSvVs2v41e36PrPRpVD862oR8MKdgpk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSzR04Ve+vBGFQsXC3JBu3QNSl0nG1NpetGi+D8F2aiR3j8/JvfYiZ1W5Eklfr2xbQF9g/GnmxR4gbWzeS0ITFmaCZSP/2Q5Hg2EUyNF4D7/bn0CGRhEMpXLFtwU6aTXlInsPvkKJ+KtwmIbr0GN9HA0kBbuemiYByVXLhXXIsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EGQnvHjC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tWFWONd/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y0K3qCyu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RpitEmbo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EGQnvHjC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tWFWONd/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y0K3qCyu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RpitEmbo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 36A7B7C9AD;
	Wed, 29 Jul 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ae76XIbVOw1pCJozV0H19IG88b0Je7WRqeOdDSAHPM=;
	b=EGQnvHjCxiEBLCURvBqtn+rNEFYT+7+fPsdTcozrPVaZEC6ILULkMSSvJuI59EmufRFJsA
	7uc65N5DpQ/8tZ5q4ag01Vzv1NOLMlblNh1xv6xmCGtOgji7MCPlnEVTGv/xfhcgQRqcv/
	GGMp2TBCZB1H7LF+HKtWM6+hN61KRfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ae76XIbVOw1pCJozV0H19IG88b0Je7WRqeOdDSAHPM=;
	b=tWFWONd/JZetY8FGTdSCBD7hdv8cV+6Gug5prjqqklIvwjJDsgB9b6wqKu5zyB+Ey1DEnD
	ji32bdiI5gziE/Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y0K3qCyu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RpitEmbo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ae76XIbVOw1pCJozV0H19IG88b0Je7WRqeOdDSAHPM=;
	b=y0K3qCyuh1BUNJSKHwRIZ4qO3Db1k6TYERJRc/esWPwT/Wln6Y/Y2n2zeN2tTjHSh4NfXW
	91WrNNJi8L8jAoP7SrypTNo9goMjVecxqRBmePgpJVyTuxgvQc13IEREBmgrJuiwJab4kY
	lo5yQ+PhfnEF/Mg6vQLle6PVUoUTKDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Ae76XIbVOw1pCJozV0H19IG88b0Je7WRqeOdDSAHPM=;
	b=RpitEmbo1Tl83LBAofSwjv5ZXpLLxbgIG83q931DaxOe+GseaWClqLZnDfi9mr/ZQCUKP7
	N1xSe9PVC3C/kDCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F7FE779D1;
	Wed, 29 Jul 2026 08:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2L2KAtm7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/14] ALSA: mixart: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:30 +0200
Message-ID: <20260729083735.120219-13-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 36A7B7C9AD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/mixart/mixart_hwdep.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/mixart/mixart_hwdep.c b/sound/pci/mixart/mixart_hwdep.c
index 439e3ff05fe1..aa8d5bae30d0 100644
--- a/sound/pci/mixart/mixart_hwdep.c
+++ b/sound/pci/mixart/mixart_hwdep.c
@@ -560,12 +560,11 @@ int snd_mixart_setup_firmware(struct mixart_mgr *mgr)
 		"miXart8.xlx", "miXart8.elf", "miXart8AES.xlx"
 	};
 	char path[32];
-
-	const struct firmware *fw_entry;
 	int i, err;
 
 	for (i = 0; i < 3; i++) {
 		sprintf(path, "mixart/%s", fw_files[i]);
+		const struct firmware *fw_entry __free(firmware) = NULL;
 		if (request_firmware(&fw_entry, path, &mgr->pci->dev)) {
 			dev_err(&mgr->pci->dev,
 				"miXart: can't load firmware %s\n", path);
@@ -573,7 +572,6 @@ int snd_mixart_setup_firmware(struct mixart_mgr *mgr)
 		}
 		/* fake hwdep dsp record */
 		err = mixart_dsp_load(mgr, i, fw_entry);
-		release_firmware(fw_entry);
 		if (err < 0)
 			return err;
 		mgr->dsp_loaded |= 1 << i;
-- 
2.55.0

