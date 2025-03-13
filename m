Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BBA1E51EE
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887930; cv=none; b=hBxninEx+BDVjLqH6NOB9MrMxAsO8T33Gac1p2l2TeVp6sQti7hSf+QBaqM790dgSm5bISdP8z+KAXBqgn6yWOVS6ChH4ISeP4YrT3r3c1YHjNKhqZfKm7xmYQ2RYGFPr8tu1aSNhYZvuUMQC+jGWP0/Ugm2Oz5mHrOZe3n8gdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887930; c=relaxed/simple;
	bh=TOTp01n5I2uulikfSBRyOJYJ54C8uH2mMFsqdoysIj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMGk+34xlLN4DNMG0yPD24ySGwfG/4/5cyrbjB0a0SLRLM6zXh7kwZTP9GvJsF+/1rG9jizKFfu11QQyYpeNOQf54K1dpJCpF6R1mfypvxIeAl5yByQor2cUmzQ558mHb5PHGhUUre4a0gxterLXZDzgorK6BuzlFlfINGTcw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gYhgXid1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jvj7QA4C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gYhgXid1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jvj7QA4C; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gYhgXid1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jvj7QA4C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gYhgXid1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jvj7QA4C"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 45F191F7AB;
	Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5/EOsnv1+f5QfGLkeUdMe0ztpHXBbTZmJoXJ8rtXVE=;
	b=gYhgXid1S+iZ99Tlo7/VrjOO3sUlHLgz1Q7WacSNO560Ve64bd//vSQVbt8nGMbXJ9l/V1
	7ylXoA0hFQUSHF/ABATZFEHChU/hi1Iwau7xCs7vDCOaNY0R/SFw5j/e+iq+tUk01L7J2p
	INB3mcH39eI5EGOw4fV4YtBC6INzOGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5/EOsnv1+f5QfGLkeUdMe0ztpHXBbTZmJoXJ8rtXVE=;
	b=Jvj7QA4Cj8vUJsKN3/w/OBpNuWXHXnD1hfpmoA4IE3+kcNVJowKRZxnqhDcQmaisudpthO
	D97zkWKXJftCRqBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5/EOsnv1+f5QfGLkeUdMe0ztpHXBbTZmJoXJ8rtXVE=;
	b=gYhgXid1S+iZ99Tlo7/VrjOO3sUlHLgz1Q7WacSNO560Ve64bd//vSQVbt8nGMbXJ9l/V1
	7ylXoA0hFQUSHF/ABATZFEHChU/hi1Iwau7xCs7vDCOaNY0R/SFw5j/e+iq+tUk01L7J2p
	INB3mcH39eI5EGOw4fV4YtBC6INzOGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k5/EOsnv1+f5QfGLkeUdMe0ztpHXBbTZmJoXJ8rtXVE=;
	b=Jvj7QA4Cj8vUJsKN3/w/OBpNuWXHXnD1hfpmoA4IE3+kcNVJowKRZxnqhDcQmaisudpthO
	D97zkWKXJftCRqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10735137BA;
	Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gPm6Au8Y02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:42:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 75/89] ASoC: rcar: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:41:20 +0100
Message-ID: <20250313174139.29942-76-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS() together with pm_ptr(), which allows us to
drop ugly __maybe_unused attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/renesas/rcar/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index f3f0c3f0bb9f..30afc942d381 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -2059,7 +2059,7 @@ static void rsnd_remove(struct platform_device *pdev)
 		remove_func[i](priv);
 }
 
-static int __maybe_unused rsnd_suspend(struct device *dev)
+static int rsnd_suspend(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
@@ -2068,7 +2068,7 @@ static int __maybe_unused rsnd_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rsnd_resume(struct device *dev)
+static int rsnd_resume(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
@@ -2076,13 +2076,13 @@ static int __maybe_unused rsnd_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rsnd_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(rsnd_suspend, rsnd_resume)
+	SYSTEM_SLEEP_PM_OPS(rsnd_suspend, rsnd_resume)
 };
 
 static struct platform_driver rsnd_driver = {
 	.driver	= {
 		.name	= "rcar_sound",
-		.pm	= &rsnd_pm_ops,
+		.pm	= pm_ptr(&rsnd_pm_ops),
 		.of_match_table = rsnd_of_match,
 	},
 	.probe		= rsnd_probe,
-- 
2.43.0

