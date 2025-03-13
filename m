Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92A31DE8B3
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887858; cv=none; b=olpxZaN6E43UDh3fv46xA6Kz8NmJbG1I7qJe32iL7ilUvi0oDu+EvnSqlEA6pha0wVlfDjnB3koiVFC3H34kcK3gWDqge3MHl2v+mId6boWLzc71MzLSO3/suRD9qdSsG0k7u2kgB6Zx0O41zuUdCRHyZHjiFk62kB8vKuutkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887858; c=relaxed/simple;
	bh=R+DVQYzGhnOeagk+Y5I7qAjWdI/lc++U82fnDNtOjHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZEd3Fq2rlOetYq2jeTpPEdH5xZhJUlnkQ2oQcOkBAFiQilnZK81h1v0/kab5Lwybk/4F7foNRhj2rXJztksE7sblAwCrU4NrEfdxH6XCBQMDNoUdOEfSjzpiBxqc4TddZNNpQz5Rcl8TrUtCtue50TRPxfhyvM1ycg0eCKBYD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IrYMMlTI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZTWOEUAR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IrYMMlTI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZTWOEUAR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IrYMMlTI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZTWOEUAR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IrYMMlTI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZTWOEUAR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A3431F7A2;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS4KPgdBD3ff/FphhPhROAdb9D3gS90At2Cq6vZ7XBY=;
	b=IrYMMlTIQ+4uHaB1kNCmQgJVR4Nsh/bkrtN2lfJUdJWLF+bKzObHLp3k6TOCKFwtgccNwI
	gMqWT0weW3PNiu7UjZigKSu1V7Ohu/8lxm25B5um7rh3/sNZpyS9XPba1mHfMAO75wpWwN
	LELPCqhu+8V+uNXPUP/sfb6WUrMN+KI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS4KPgdBD3ff/FphhPhROAdb9D3gS90At2Cq6vZ7XBY=;
	b=ZTWOEUARLA44Ga5ig6bdoJ6Bb0Mvyej1Bk6ZKQ/xF+of/FkqvDPf0vahmaIysc7QQgLdjH
	fNpk9nrU8zr3IvAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IrYMMlTI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZTWOEUAR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS4KPgdBD3ff/FphhPhROAdb9D3gS90At2Cq6vZ7XBY=;
	b=IrYMMlTIQ+4uHaB1kNCmQgJVR4Nsh/bkrtN2lfJUdJWLF+bKzObHLp3k6TOCKFwtgccNwI
	gMqWT0weW3PNiu7UjZigKSu1V7Ohu/8lxm25B5um7rh3/sNZpyS9XPba1mHfMAO75wpWwN
	LELPCqhu+8V+uNXPUP/sfb6WUrMN+KI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887721;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IS4KPgdBD3ff/FphhPhROAdb9D3gS90At2Cq6vZ7XBY=;
	b=ZTWOEUARLA44Ga5ig6bdoJ6Bb0Mvyej1Bk6ZKQ/xF+of/FkqvDPf0vahmaIysc7QQgLdjH
	fNpk9nrU8zr3IvAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 552A7137BA;
	Thu, 13 Mar 2025 17:42:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ACxXE+kY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 43/89] ASoC: rt722: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:48 +0100
Message-ID: <20250313174139.29942-44-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A3431F7A2
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 543cb32c2463..11e2e8f68a98 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -430,7 +430,7 @@ static const struct sdw_device_id rt722_sdca_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt722_sdca_id);
 
-static int __maybe_unused rt722_sdca_dev_suspend(struct device *dev)
+static int rt722_sdca_dev_suspend(struct device *dev)
 {
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
 
@@ -445,7 +445,7 @@ static int __maybe_unused rt722_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rt722_sdca_dev_system_suspend(struct device *dev)
+static int rt722_sdca_dev_system_suspend(struct device *dev)
 {
 	struct rt722_sdca_priv *rt722_sdca = dev_get_drvdata(dev);
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -477,7 +477,7 @@ static int __maybe_unused rt722_sdca_dev_system_suspend(struct device *dev)
 
 #define RT722_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt722_sdca_dev_resume(struct device *dev)
+static int rt722_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
@@ -514,14 +514,14 @@ static int __maybe_unused rt722_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt722_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt722_sdca_dev_system_suspend, rt722_sdca_dev_resume)
-	SET_RUNTIME_PM_OPS(rt722_sdca_dev_suspend, rt722_sdca_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt722_sdca_dev_system_suspend, rt722_sdca_dev_resume)
+	RUNTIME_PM_OPS(rt722_sdca_dev_suspend, rt722_sdca_dev_resume, NULL)
 };
 
 static struct sdw_driver rt722_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt722-sdca",
-		.pm = &rt722_sdca_pm,
+		.pm = pm_ptr(&rt722_sdca_pm),
 	},
 	.probe = rt722_sdca_sdw_probe,
 	.remove = rt722_sdca_sdw_remove,
-- 
2.43.0

