Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5C3229B01
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205410; cv=none; b=M5O90U4y9KbPvqMA9+mD3gBdqN5R9ZmrvQ7RYpU8MXRwkQVjMDO52gwvPW/Z/0dCRIZ/metrQNX+l0U95WgDo4pBjBywxobQELwcdM8cDHrxQpweyZ43BLMjs+7a5V3d/EZyjU2/D6Wi6rOv/LQUxUEOcH35s6HVN7HD18ZdHW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205410; c=relaxed/simple;
	bh=czkyhD4Wfz+zEd0Q8/H7gCutNhvg92LRW94SoBxinnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvAsrpDkgq6NvBJncCChjC+3zRzGyn/+znvo+/sIZmx2F/LbtyyozeSHLYfbR10UfraNMQKUdNHLUywZBUG/moJ3GKciv5avF8pQMgfglQUISWLLNRRZMuMVT1+Dqa2AcW4/fgLV/0yF1CHg4vUGm/0IMJ+7KuktgtY5bVRndIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pS2q5k+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LSqj9HmT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pS2q5k+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LSqj9HmT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pS2q5k+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LSqj9HmT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pS2q5k+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LSqj9HmT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 35E27200C6;
	Mon, 17 Mar 2025 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0yco2krN11/T/9/QsL7KcTJWw5ZqyWr1PWen/pcRTw=;
	b=pS2q5k+5ZOjGY6mq1sQ8012T5/Vqosq/LQPVakg5DGCptGGMuJgfgnHTWegXR44rgfOmCF
	bQHQq1XhPKY0EVBh70wLsEBublI+YFZv8ahqhDE9XIr6sn5srT/07JZc0+DIS+7RthoIyK
	GzzObTppGOnrpxUz/Qdf1HcSBZhqJ0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0yco2krN11/T/9/QsL7KcTJWw5ZqyWr1PWen/pcRTw=;
	b=LSqj9HmTaGdDGTRHEsllWcnVazPVxR9ZG1xnnjW29afpCWL9uH67iztT5TCDXnICQuDkMb
	z0h+/EIw3mXzyqBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0yco2krN11/T/9/QsL7KcTJWw5ZqyWr1PWen/pcRTw=;
	b=pS2q5k+5ZOjGY6mq1sQ8012T5/Vqosq/LQPVakg5DGCptGGMuJgfgnHTWegXR44rgfOmCF
	bQHQq1XhPKY0EVBh70wLsEBublI+YFZv8ahqhDE9XIr6sn5srT/07JZc0+DIS+7RthoIyK
	GzzObTppGOnrpxUz/Qdf1HcSBZhqJ0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+0yco2krN11/T/9/QsL7KcTJWw5ZqyWr1PWen/pcRTw=;
	b=LSqj9HmTaGdDGTRHEsllWcnVazPVxR9ZG1xnnjW29afpCWL9uH67iztT5TCDXnICQuDkMb
	z0h+/EIw3mXzyqBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04E1E13A2C;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GBSOO73x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 07/88] ASoC: cs35l34: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:54:29 +0100
Message-ID: <20250317095603.20073-8-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: patches@opensource.cirrus.com
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/cs35l34.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 6d098bfd38f6..a5a8075598ff 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -1116,7 +1116,7 @@ static void cs35l34_i2c_remove(struct i2c_client *client)
 		cs35l34->core_supplies);
 }
 
-static int __maybe_unused cs35l34_runtime_resume(struct device *dev)
+static int cs35l34_runtime_resume(struct device *dev)
 {
 	struct cs35l34_private *cs35l34 = dev_get_drvdata(dev);
 	int ret;
@@ -1149,7 +1149,7 @@ static int __maybe_unused cs35l34_runtime_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused cs35l34_runtime_suspend(struct device *dev)
+static int cs35l34_runtime_suspend(struct device *dev)
 {
 	struct cs35l34_private *cs35l34 = dev_get_drvdata(dev);
 
@@ -1165,9 +1165,7 @@ static int __maybe_unused cs35l34_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops cs35l34_pm_ops = {
-	SET_RUNTIME_PM_OPS(cs35l34_runtime_suspend,
-			   cs35l34_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(cs35l34_runtime_suspend, cs35l34_runtime_resume, NULL)
 };
 
 static const struct of_device_id cs35l34_of_match[] = {
@@ -1185,7 +1183,7 @@ MODULE_DEVICE_TABLE(i2c, cs35l34_id);
 static struct i2c_driver cs35l34_i2c_driver = {
 	.driver = {
 		.name = "cs35l34",
-		.pm = &cs35l34_pm_ops,
+		.pm = pm_ptr(&cs35l34_pm_ops),
 		.of_match_table = cs35l34_of_match,
 
 		},
-- 
2.43.0

