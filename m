Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8FB22DFB4
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205494; cv=none; b=dwhcakd9JiYJ7pOLt66AIlOG7z4XX91Vvu+aoQ7wKuMAlXC5wEoZtGtOjrTuROTs9WjaHsidpG1ZzvP+v+EgY+8EjfQ+/+Xrxv6GFBl9CSl6f1nDL1fFjtP0Zcy549Mz/cXGiUcgck56v1AH+AxVTSPvGLnru2VoJDtxLeVWEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205494; c=relaxed/simple;
	bh=FUfII2VSdR3k36KnNQ3CvRAWLnhKmUZhB9WtFgWeaGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lY4cBSAwfs38AAZcOB7SSI+q4pfaZ95D291sesooiv5huTxoj6FWa0GUPU9/bPyQmznCtvlVQ8ElKOob67G0g6eGr/CGCv+NTuXjeVXl1i33BgVpXyC8Yo3bzG1Pl1TAmGUNbRM1PkZNQaniBJWqlIgiNfaCduy03McKHlaNUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BFJ4Icah; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KCBVgF7y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GrtlwTPb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qI8ELCAp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BFJ4Icah";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KCBVgF7y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GrtlwTPb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qI8ELCAp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E19282022D;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aa9U0ADXZ4ygTdEfqiE/J8IwIMFwgOntb0zE8Ssc4Q=;
	b=BFJ4IcaheJErOISkYaTFH7DyhkrwCC0IjQdlQvFhLiJIFWmQUEOrXI+3fTviQ6wiFmxSn+
	640qZIlHDwi3bOiY5ef3k8Liu0NKPAW236udKnVCehiag/Bhwn+yqatKaw9M4bYF4HzT4x
	kEE3NmYOccwP/f+2IIIWh0C9GRIcJ4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aa9U0ADXZ4ygTdEfqiE/J8IwIMFwgOntb0zE8Ssc4Q=;
	b=KCBVgF7ysNyNG3FiX+ZkLMt/AJumG8hoTEavRDhh2aKqSUhJSGuLAhGALy0CKRsA+l2Nd7
	C2Fb4aHT4SepXuAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aa9U0ADXZ4ygTdEfqiE/J8IwIMFwgOntb0zE8Ssc4Q=;
	b=GrtlwTPbw1SfI1Lf/Ma/7YZ+iuqJcxjyMIoPt7XqbME8UiljI04l8Po7Sn9UL625YMFfdk
	p3nokEj9cNDO/5tV1Hja8IqoyP7BA839YxiArqubGHTvDUTUKATp+sOAnQP9WIuUKyDGaz
	ODTPESSTZSEjOmoPF7fXrCyr/gn55hU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Aa9U0ADXZ4ygTdEfqiE/J8IwIMFwgOntb0zE8Ssc4Q=;
	b=qI8ELCAptCEhCutbLrTtSz61YqOJbbBJN+eNhDVwwxkPJrGiF992qF1MMJcCa+F0FIyxPx
	d6NbFgCDqROpHpBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BBE12132CF;
	Mon, 17 Mar 2025 09:56:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gGumLMLx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 33/88] ASoC: rt1320-sdw: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:55 +0100
Message-ID: <20250317095603.20073-34-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317095603.20073-1-tiwai@suse.de>
References: <20250317095603.20073-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt1320-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index d83b236a0450..f51ba345a16e 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1458,7 +1458,7 @@ static const struct sdw_device_id rt1320_id[] = {
 };
 MODULE_DEVICE_TABLE(sdw, rt1320_id);
 
-static int __maybe_unused rt1320_dev_suspend(struct device *dev)
+static int rt1320_dev_suspend(struct device *dev)
 {
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
 
@@ -1472,7 +1472,7 @@ static int __maybe_unused rt1320_dev_suspend(struct device *dev)
 
 #define RT1320_PROBE_TIMEOUT 5000
 
-static int __maybe_unused rt1320_dev_resume(struct device *dev)
+static int rt1320_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
@@ -1501,14 +1501,14 @@ static int __maybe_unused rt1320_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt1320_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt1320_dev_suspend, rt1320_dev_resume)
-	SET_RUNTIME_PM_OPS(rt1320_dev_suspend, rt1320_dev_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(rt1320_dev_suspend, rt1320_dev_resume)
+	RUNTIME_PM_OPS(rt1320_dev_suspend, rt1320_dev_resume, NULL)
 };
 
 static struct sdw_driver rt1320_sdw_driver = {
 	.driver = {
 		.name = "rt1320-sdca",
-		.pm = &rt1320_pm,
+		.pm = pm_ptr(&rt1320_pm),
 	},
 	.probe = rt1320_sdw_probe,
 	.remove = rt1320_sdw_remove,
-- 
2.43.0

