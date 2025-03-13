Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699A1714B7
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887729; cv=none; b=gWlnmmZgZlglVBUI6S6U3+rR3T9AdhZ81fS45r6jKw8X5HqRTQDPco0VCd/XuGWIZm32PBZEZC0s0mh4+FbmK2HY28x8KZSFWFUTlLLaANGZbWHtUqz73qIF8uw2Ebtg0SUE7mNL0IyQ46lpeN+l3JyNICQ5jFxeo4wYi+Pwyqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887729; c=relaxed/simple;
	bh=xHYLq0uUYSafFxof2giB1VNBp15NqvTurmccQUZvNXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMiIddzA1+EEzf3XS2wAQbR9Len7gypXOaZ0DToo4E73XCwAiCvFH3GtbSWOdPxwpSnk3VLlnRp00yGJpZ7M8Qek/++kqziV4q/U7448EU5iQsjAHx5xwfwnyNn5QDzzfd1sfH9GfZ1xRDb638bQSgQZHA38xDka01RhmnFhJrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GALFUW5F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G3mx+o/l; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GALFUW5F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G3mx+o/l; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GALFUW5F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G3mx+o/l";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GALFUW5F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G3mx+o/l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D48C21F793;
	Thu, 13 Mar 2025 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGhOO0S7dTmw4fxIURICGRnYydAlgjiKvRqA9TpaFA4=;
	b=GALFUW5FWZgLdpUlVtQ7b1UVfCJYXc22q2y4OWy4WUxyWkOF7Hu9yagpApzgdOd5sXzeCt
	23fPEx9yA8B45uf1N+DJW5ppSb7MqNONCT2JCuKalSqqKFJt08aHj1cxT7e1XMw/q0QFsd
	4MFNTjxvRyCpRr8otY6nQtSpToMzTFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGhOO0S7dTmw4fxIURICGRnYydAlgjiKvRqA9TpaFA4=;
	b=G3mx+o/lUHtCALaj5FlP4CvipyIrwMybIO84knFdZLatfcHiKb5WQLAF4zJK7SUSdC9pMn
	2KCG9XYWqu9Rv5Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGhOO0S7dTmw4fxIURICGRnYydAlgjiKvRqA9TpaFA4=;
	b=GALFUW5FWZgLdpUlVtQ7b1UVfCJYXc22q2y4OWy4WUxyWkOF7Hu9yagpApzgdOd5sXzeCt
	23fPEx9yA8B45uf1N+DJW5ppSb7MqNONCT2JCuKalSqqKFJt08aHj1cxT7e1XMw/q0QFsd
	4MFNTjxvRyCpRr8otY6nQtSpToMzTFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MGhOO0S7dTmw4fxIURICGRnYydAlgjiKvRqA9TpaFA4=;
	b=G3mx+o/lUHtCALaj5FlP4CvipyIrwMybIO84knFdZLatfcHiKb5WQLAF4zJK7SUSdC9pMn
	2KCG9XYWqu9Rv5Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B313C137BA;
	Thu, 13 Mar 2025 17:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CPpfKuEY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 02/89] ASoC: ak4375: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:07 +0100
Message-ID: <20250313174139.29942-3-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer RUNTIE_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros instead
of SET_RUNTIME_PM_OPS () and SET_SYSTEM_SLEEP_PM_OPS() together with
pm_ptr(), which allows us dropping ugly __maybe_unused attributes.

This optimizes slightly	when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/ak4375.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
index 3ee5a5c3c5fe..452559d8c97b 100644
--- a/sound/soc/codecs/ak4375.c
+++ b/sound/soc/codecs/ak4375.c
@@ -438,7 +438,7 @@ static int ak4375_power_on(struct ak4375_priv *ak4375)
 	return 0;
 }
 
-static int __maybe_unused ak4375_runtime_suspend(struct device *dev)
+static int ak4375_runtime_suspend(struct device *dev)
 {
 	struct ak4375_priv *ak4375 = dev_get_drvdata(dev);
 
@@ -448,7 +448,7 @@ static int __maybe_unused ak4375_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ak4375_runtime_resume(struct device *dev)
+static int ak4375_runtime_resume(struct device *dev)
 {
 	struct ak4375_priv *ak4375 = dev_get_drvdata(dev);
 	int ret;
@@ -490,9 +490,8 @@ static const struct ak4375_drvdata ak4375_drvdata = {
 };
 
 static const struct dev_pm_ops ak4375_pm = {
-	SET_RUNTIME_PM_OPS(ak4375_runtime_suspend, ak4375_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(ak4375_runtime_suspend, ak4375_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static int ak4375_i2c_probe(struct i2c_client *i2c)
@@ -594,7 +593,7 @@ MODULE_DEVICE_TABLE(of, ak4375_of_match);
 static struct i2c_driver ak4375_i2c_driver = {
 	.driver = {
 		.name = "ak4375",
-		.pm = &ak4375_pm,
+		.pm = pm_ptr(&ak4375_pm),
 		.of_match_table = ak4375_of_match,
 	},
 	.probe = ak4375_i2c_probe,
-- 
2.43.0

