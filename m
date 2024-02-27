Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F89912F371
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024001; cv=none; b=g6BJK2ZjYhi6T4BayXiHMW4IOclw8sVACcGovth6ayQCreAcG3LPc8E46Rw1Ky46xBJLiTYnGljYHAFUarBF4o4U2UHsh9BzpKsNAvup9RSGW3XzNu5zmeUc5TAloJFQerNvvQc2sT7v2j38In8KqRk9ZZ50Ydt7D8SQpV3sU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024001; c=relaxed/simple;
	bh=rO0mi5Xh4oJ+QS+TXrqEUkBmiSdLGWifwDmS4RNtR8g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D1XL9Ub0SRff79jeuJDJc93ykg/sp1oMzTKcHOLIN+klZ3slet26U3eam4x7M6TB4EQEqdImF/bweoiRLS4vywcRQV8dimnoqJwiNtZpMudBzKhGFOeYQGcGxYENv8n57t/LaZHgXev3H/X6MEgl9gIxl+ShdL4TX2akXJo6M7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yz0qhzKS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2KwmWen8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yz0qhzKS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2KwmWen8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yz0qhzKS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2KwmWen8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yz0qhzKS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2KwmWen8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 803C01FD29;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2Q6Dm3TRCFahzOR97DO/gIIZcnP3VqGYCcTjdcxZds=;
	b=yz0qhzKSFe9jHcDqtbyqHgr8Oh4LNDp/wvfKUNHR38xzhayBqeYAc4ntpis1lYZFbHgC6D
	eXCTUC2kiySTy/lb3Qi7YKYOPqR4VxkrORxYrqVlXgbSZYPfq00oLm1xvempwof4WyI32F
	YiphJYRzPMqEENsymDLLFYQ1Oj4bVbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2Q6Dm3TRCFahzOR97DO/gIIZcnP3VqGYCcTjdcxZds=;
	b=2KwmWen8f1qn9kby0ECQnE6Rvm3KWd6JATFw50Zr134aP+Bl8KvtOn3xBOx+pu5HQAglIs
	nmtnFH8TXvgckSAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2Q6Dm3TRCFahzOR97DO/gIIZcnP3VqGYCcTjdcxZds=;
	b=yz0qhzKSFe9jHcDqtbyqHgr8Oh4LNDp/wvfKUNHR38xzhayBqeYAc4ntpis1lYZFbHgC6D
	eXCTUC2kiySTy/lb3Qi7YKYOPqR4VxkrORxYrqVlXgbSZYPfq00oLm1xvempwof4WyI32F
	YiphJYRzPMqEENsymDLLFYQ1Oj4bVbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2Q6Dm3TRCFahzOR97DO/gIIZcnP3VqGYCcTjdcxZds=;
	b=2KwmWen8f1qn9kby0ECQnE6Rvm3KWd6JATFw50Zr134aP+Bl8KvtOn3xBOx+pu5HQAglIs
	nmtnFH8TXvgckSAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6801D13A58;
	Tue, 27 Feb 2024 08:53:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2LRGGPui3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 10/24] ALSA: jack: Use guard() for locking
Date: Tue, 27 Feb 2024 09:52:52 +0100
Message-Id: <20240227085306.9764-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240227085306.9764-1-tiwai@suse.de>
References: <20240227085306.9764-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ******
X-Spam-Score: 6.51
X-Spamd-Result: default: False [6.51 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 NEURAL_SPAM_SHORT(2.61)[0.869];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[18.28%]
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/jack.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/sound/core/jack.c b/sound/core/jack.c
index e0f034e7275c..e08b2c4fbd1a 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -42,11 +42,9 @@ static int snd_jack_dev_disconnect(struct snd_device *device)
 #ifdef CONFIG_SND_JACK_INPUT_DEV
 	struct snd_jack *jack = device->device_data;
 
-	mutex_lock(&jack->input_dev_lock);
-	if (!jack->input_dev) {
-		mutex_unlock(&jack->input_dev_lock);
+	guard(mutex)(&jack->input_dev_lock);
+	if (!jack->input_dev)
 		return 0;
-	}
 
 	/* If the input device is registered with the input subsystem
 	 * then we need to use a different deallocator. */
@@ -55,7 +53,6 @@ static int snd_jack_dev_disconnect(struct snd_device *device)
 	else
 		input_free_device(jack->input_dev);
 	jack->input_dev = NULL;
-	mutex_unlock(&jack->input_dev_lock);
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 	return 0;
 }
@@ -92,11 +89,9 @@ static int snd_jack_dev_register(struct snd_device *device)
 	snprintf(jack->name, sizeof(jack->name), "%s %s",
 		 card->shortname, jack->id);
 
-	mutex_lock(&jack->input_dev_lock);
-	if (!jack->input_dev) {
-		mutex_unlock(&jack->input_dev_lock);
+	guard(mutex)(&jack->input_dev_lock);
+	if (!jack->input_dev)
 		return 0;
-	}
 
 	jack->input_dev->name = jack->name;
 
@@ -121,7 +116,6 @@ static int snd_jack_dev_register(struct snd_device *device)
 	if (err == 0)
 		jack->registered = 1;
 
-	mutex_unlock(&jack->input_dev_lock);
 	return err;
 }
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
@@ -586,14 +580,9 @@ EXPORT_SYMBOL(snd_jack_new);
 void snd_jack_set_parent(struct snd_jack *jack, struct device *parent)
 {
 	WARN_ON(jack->registered);
-	mutex_lock(&jack->input_dev_lock);
-	if (!jack->input_dev) {
-		mutex_unlock(&jack->input_dev_lock);
-		return;
-	}
-
-	jack->input_dev->dev.parent = parent;
-	mutex_unlock(&jack->input_dev_lock);
+	guard(mutex)(&jack->input_dev_lock);
+	if (jack->input_dev)
+		jack->input_dev->dev.parent = parent;
 }
 EXPORT_SYMBOL(snd_jack_set_parent);
 
-- 
2.35.3

