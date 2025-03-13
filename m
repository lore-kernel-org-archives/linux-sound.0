Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CFA1607B4
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887800; cv=none; b=dE9QGI1TqUJWW7F55MzWnnS9za/hSKIMy5LjrcsUKhWa+7sSg27AwrbSFnVJL4E81rrHPeEoZK2ZTD9E6VSAHIsgGE3mOREslb7vJ0ce1d6MCr4hXaOX74GmeYr6IPXahn3mSrxVQIpZO31PrjGzA6ZZTlATcc+wJSJnZOuo57c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887800; c=relaxed/simple;
	bh=lzP++nsp8ZDWtNHn2vlRy+P6/grNsjRL2WEosnj+yyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vi/GzsC9Ws0q2sZw9AB/lrnvd7yJVyJgbjwSmHu7qdxxw5EwV9dPC1qnF/ln3L/M/Akmy4Ic1Kj8jMnj1nViebR4usPTWQVVnohJLt9b18V2DIv5YiSiipzLuOpmtpHAU/HihQ5sg2koHR8jtsPSxHHqI7Db2lhVo/otWIs1V98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=poFRSJgC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bnynPVDO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=poFRSJgC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bnynPVDO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="poFRSJgC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bnynPVDO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="poFRSJgC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bnynPVDO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0B4DA211D5;
	Thu, 13 Mar 2025 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtMMse/i/ff9Xok72/bw8Nv+RrnQUWQ2HL/S8mPNoqc=;
	b=poFRSJgCWN5CRm8MWPQRW37X0j65veVd3JGOzYXKlc1X8StaL1uKhBiFaE/aPkw2jXWO8h
	OvHvPUFOopHUylz3FqwJ/2a1RzirnEtCxqgo5K+eK2ivFMAwVsqDvEZfjP9gvDEZi+8Z+w
	NXKRXVqbcZWoNZzHVagfMTk7yhjEEpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtMMse/i/ff9Xok72/bw8Nv+RrnQUWQ2HL/S8mPNoqc=;
	b=bnynPVDOglH4zI1zfbaeJRxlkrCmAk6koS9Bre/7a38PAIykKA3S4hF/J2qqHS7sQxsFOS
	tjfRRo4E09Rcb8CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=poFRSJgC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bnynPVDO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtMMse/i/ff9Xok72/bw8Nv+RrnQUWQ2HL/S8mPNoqc=;
	b=poFRSJgCWN5CRm8MWPQRW37X0j65veVd3JGOzYXKlc1X8StaL1uKhBiFaE/aPkw2jXWO8h
	OvHvPUFOopHUylz3FqwJ/2a1RzirnEtCxqgo5K+eK2ivFMAwVsqDvEZfjP9gvDEZi+8Z+w
	NXKRXVqbcZWoNZzHVagfMTk7yhjEEpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtMMse/i/ff9Xok72/bw8Nv+RrnQUWQ2HL/S8mPNoqc=;
	b=bnynPVDOglH4zI1zfbaeJRxlkrCmAk6koS9Bre/7a38PAIykKA3S4hF/J2qqHS7sQxsFOS
	tjfRRo4E09Rcb8CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D70EC137BA;
	Thu, 13 Mar 2025 17:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AM/kMuUY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 25/89] ASoC: max98520: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:30 +0100
Message-ID: <20250313174139.29942-26-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 0B4DA211D5
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLi691ga9brjh6qjnnbs1osk4o)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us
dropping ugly __maybe_unsed attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max98520.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 479ded22672e..adf5a898c6df 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -621,7 +621,7 @@ static int max98520_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-static int __maybe_unused max98520_suspend(struct device *dev)
+static int max98520_suspend(struct device *dev)
 {
 	struct max98520_priv *max98520 = dev_get_drvdata(dev);
 
@@ -630,7 +630,7 @@ static int __maybe_unused max98520_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused max98520_resume(struct device *dev)
+static int max98520_resume(struct device *dev)
 {
 	struct max98520_priv *max98520 = dev_get_drvdata(dev);
 
@@ -641,7 +641,7 @@ static int __maybe_unused max98520_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops max98520_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98520_suspend, max98520_resume)
+	SYSTEM_SLEEP_PM_OPS(max98520_suspend, max98520_resume)
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_max98520 = {
@@ -752,7 +752,7 @@ static struct i2c_driver max98520_i2c_driver = {
 	.driver = {
 		.name = "max98520",
 		.of_match_table = of_match_ptr(max98520_of_match),
-		.pm = &max98520_pm,
+		.pm = pm_ptr(&max98520_pm),
 	},
 	.probe = max98520_i2c_probe,
 	.id_table = max98520_i2c_id,
-- 
2.43.0

