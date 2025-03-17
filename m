Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AF8226D1F
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205396; cv=none; b=cGSjmSUZ9NMt/Z8jfzuFAkL9aM66CQWcMLG5tsLz9nTyfF0lrxneAUIm04GRaOdtlbCAvoQ+mW3IAz0T0K5FKJe0ARmMyyRJyFwrTNS1qvIl0ASNyZSKSg09ECYEB942BAyXyH0cX1f8DG77soLKW9sZ9U7dRh7gAvb+gFz+87E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205396; c=relaxed/simple;
	bh=BP9/+wWQhzsMYM3TxSkokjU521CC0lk+76pewyO22K4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXrFh0OUgLvi67D2WvUtdt1IwkhsCtIe5Rzhz8yTpAbGSI3q/9meVNJlJaDy14wTTwzQk9yV3ldaF31QwFM7sMlg7wZ//FSnJuNp2GH4GHAPi1bYXDZxsHipAIhV7k66JalV0y2IhPrOL7PhuqdDG5z+2qdIxB+AAdze4NESHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QvemIfEj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=12WEO1zf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QvemIfEj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=12WEO1zf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QvemIfEj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="12WEO1zf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QvemIfEj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="12WEO1zf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A1381FF1B;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qU9s6uQOVAGycmYj9mf6Tihs4iyaGQ3slxQOg/tdnfY=;
	b=QvemIfEjZqNNoGqZ6X9PrLe49sdnA7wbZg8BIAoQK5d7w6Y1e8pjTDpN/C2wMPFWSjK/Lw
	YXz9l+tbJwGbOx440dWzBS/0oXl+Z9RTiS1sTe7IH1qxpYW7bQOhFeMs4pyDm5WMwThMRX
	Irl4REOUZF/6LLb9NtQudJjZXtFbN1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qU9s6uQOVAGycmYj9mf6Tihs4iyaGQ3slxQOg/tdnfY=;
	b=12WEO1zfkKy9B9qxQSBdPvdE/RW1RTpzWqBamsfXGAeqHKcAE4C+KHWWTeRJDf0EykkKFp
	nSoduk3NKgtiAvBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205373; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qU9s6uQOVAGycmYj9mf6Tihs4iyaGQ3slxQOg/tdnfY=;
	b=QvemIfEjZqNNoGqZ6X9PrLe49sdnA7wbZg8BIAoQK5d7w6Y1e8pjTDpN/C2wMPFWSjK/Lw
	YXz9l+tbJwGbOx440dWzBS/0oXl+Z9RTiS1sTe7IH1qxpYW7bQOhFeMs4pyDm5WMwThMRX
	Irl4REOUZF/6LLb9NtQudJjZXtFbN1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205373;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qU9s6uQOVAGycmYj9mf6Tihs4iyaGQ3slxQOg/tdnfY=;
	b=12WEO1zfkKy9B9qxQSBdPvdE/RW1RTpzWqBamsfXGAeqHKcAE4C+KHWWTeRJDf0EykkKFp
	nSoduk3NKgtiAvBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A579132CF;
	Mon, 17 Mar 2025 09:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IC2uGL3x12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 04/88] ASoC: ak5558: Convert to RUNTIME_PM_OPS() & co
Date: Mon, 17 Mar 2025 10:54:26 +0100
Message-ID: <20250317095603.20073-5-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros
instead of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together
with pm_ptr(), which allows us dropping ugly __maybe_unused
attributes.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/ak5558.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 6c767609f95d..683f3e472f50 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -342,7 +342,7 @@ static void ak5558_remove(struct snd_soc_component *component)
 	ak5558_reset(ak5558, true);
 }
 
-static int __maybe_unused ak5558_runtime_suspend(struct device *dev)
+static int ak5558_runtime_suspend(struct device *dev)
 {
 	struct ak5558_priv *ak5558 = dev_get_drvdata(dev);
 
@@ -354,7 +354,7 @@ static int __maybe_unused ak5558_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ak5558_runtime_resume(struct device *dev)
+static int ak5558_runtime_resume(struct device *dev)
 {
 	struct ak5558_priv *ak5558 = dev_get_drvdata(dev);
 	int ret;
@@ -376,9 +376,8 @@ static int __maybe_unused ak5558_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops ak5558_pm = {
-	SET_RUNTIME_PM_OPS(ak5558_runtime_suspend, ak5558_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(ak5558_runtime_suspend, ak5558_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_ak5558 = {
@@ -495,7 +494,7 @@ static struct i2c_driver ak5558_i2c_driver = {
 	.driver = {
 		.name = "ak5558",
 		.of_match_table = of_match_ptr(ak5558_i2c_dt_ids),
-		.pm = &ak5558_pm,
+		.pm = pm_ptr(&ak5558_pm),
 	},
 	.probe = ak5558_i2c_probe,
 	.remove = ak5558_i2c_remove,
-- 
2.43.0

