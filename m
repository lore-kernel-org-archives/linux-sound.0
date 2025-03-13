Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E21607B4
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887778; cv=none; b=thv6hV4oWjdz58/EAFHAuCV90rj4Ne110XQHTD44VoQhAQZmlzvYm55e1tDiTJA6+ajOEF0k7aUEnfEpg44+JCAeMUbLCKEzk7QVwh41fiNr1BnAn0ZvzpxwGrsj9ryIs2Rut1ud9TsoqtsHnY7Gg8bHpwKudOJTdrLKZuNIj5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887778; c=relaxed/simple;
	bh=ysCmnx/5FN7lATd5UDe50taoejiOQwRmwg65YEBDeKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyuv+pk2ck6jZS1F+cuF0R+A3JbTVATm47CUUv0V6ayOYrKgQKuA23JgZbljpSNZ6Q78Bu2Od9Uv9nk7qXHd90chvi66OnCtwzjTIIpmkCE5j39JLdeodBXHAW0louHoXggwqbC9N9LJYtEv0Y7zlGsDON+O1PhgogSoC4GM+AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ftO68WSA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QK5/RYg+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ftO68WSA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QK5/RYg+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ftO68WSA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QK5/RYg+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ftO68WSA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QK5/RYg+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A82A51F787;
	Thu, 13 Mar 2025 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Th6Lt7gQvv4PObPjiw4wch/j9nA9MlQoExJQrTmdOo=;
	b=ftO68WSAtVPna+bxjdhRW7TM7uBLB/CFdx/RR32PsCLZsKU5l5DdGQp7Z9lBScgHo1vvPG
	f2VDSaEjkrJPdh1Bc2IFsSEzE7UVwVPhSRwAUvYBvheZXS+VQLaM7u8U9IfyMdcCr9Jk1O
	g7ot8iUzRk4GI8CeA2s4vTcbKxBbviA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Th6Lt7gQvv4PObPjiw4wch/j9nA9MlQoExJQrTmdOo=;
	b=QK5/RYg+kOQraotSsTHUlkcqOQSROvlhwkO8qSBU21oV0bLtfI/k2OxUSE5hIvuQifTHF/
	7U6B92JPvm6SWaDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ftO68WSA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="QK5/RYg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Th6Lt7gQvv4PObPjiw4wch/j9nA9MlQoExJQrTmdOo=;
	b=ftO68WSAtVPna+bxjdhRW7TM7uBLB/CFdx/RR32PsCLZsKU5l5DdGQp7Z9lBScgHo1vvPG
	f2VDSaEjkrJPdh1Bc2IFsSEzE7UVwVPhSRwAUvYBvheZXS+VQLaM7u8U9IfyMdcCr9Jk1O
	g7ot8iUzRk4GI8CeA2s4vTcbKxBbviA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Th6Lt7gQvv4PObPjiw4wch/j9nA9MlQoExJQrTmdOo=;
	b=QK5/RYg+kOQraotSsTHUlkcqOQSROvlhwkO8qSBU21oV0bLtfI/k2OxUSE5hIvuQifTHF/
	7U6B92JPvm6SWaDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86CC1137BA;
	Thu, 13 Mar 2025 17:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cHKZH+UY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:57 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 23/89] ASoC: max98390: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:40:28 +0100
Message-ID: <20250313174139.29942-24-tiwai@suse.de>
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
X-Rspamd-Queue-Id: A82A51F787
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
dropping superfluous CONFIG_PM_SLEEP ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/max98390.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 1bae253618fd..76296176f948 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -943,7 +943,6 @@ static int max98390_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int max98390_suspend(struct device *dev)
 {
 	struct max98390_priv *max98390 = dev_get_drvdata(dev);
@@ -967,10 +966,9 @@ static int max98390_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max98390_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(max98390_suspend, max98390_resume)
+	SYSTEM_SLEEP_PM_OPS(max98390_suspend, max98390_resume)
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_max98390 = {
@@ -1130,7 +1128,7 @@ static struct i2c_driver max98390_i2c_driver = {
 		.name = "max98390",
 		.of_match_table = of_match_ptr(max98390_of_match),
 		.acpi_match_table = ACPI_PTR(max98390_acpi_match),
-		.pm = &max98390_pm,
+		.pm = pm_ptr(&max98390_pm),
 	},
 	.probe = max98390_i2c_probe,
 	.id_table = max98390_i2c_id,
-- 
2.43.0

