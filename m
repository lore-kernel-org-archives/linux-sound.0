Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1DD1B6CE3
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887782; cv=none; b=Fn2aKbcMqe95k6BHaSZ3QvWf34o3zDA3X9frv0qMv+Pe2Bf00jt4NPym5aM+4NV179kkGLW9/WQvhGTX/1gXpMY9FNfZk30p52r+XiNVrRCTl3zzwk25It3FBmEjhSeV70w+Xtx6XG9W3ixJt68OR0wS1NIT/Iv/nZFQpJmJ8b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887782; c=relaxed/simple;
	bh=2ZWSiX+XG0vDzaFjtSRqDpMjCnpWChk2gnTnw8EXxFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frUP7T5W//aEmEohV6VZHMZYfBJhWKCqbVtxyTDxzoj92bYaO7fv0RgHI3phKiLOJT70ba3Nbpe/GLAr3UQfK0Yt2nP1BGdXwqqLbvq+HSg2SuN76cwgcE9jmoVCpykRvyd7okN/sJzhl3jmPvgdxsooQOiHKcmtellCUotpnVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o3Od1dwa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HPVNMb/U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FF1Xr12B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kIjQTqr5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o3Od1dwa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPVNMb/U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FF1Xr12B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kIjQTqr5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F1BD0211D0;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwWntg5AzrP/kEf/VbYrKMm59OKmTtQ3JTbuK+8ErSw=;
	b=o3Od1dwaHLmxNGj5Wp32uzKBAJESN1r4biQ53yZN/o/bQCwVy7dC26wVl4P3ret9rcA19K
	dA49c1nq9nLwVv2JXDcoVj6PuGbF5w8nLYZ9L6kznKECfMaFx2OfBrac+6Ghi9NXcHtsqM
	xWixcl1RcUCU2Ys79SZnljvJLM60RMs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwWntg5AzrP/kEf/VbYrKMm59OKmTtQ3JTbuK+8ErSw=;
	b=HPVNMb/UZEg2d+yO2iM6rcWKSluY2/GB+4HKFcaq/WdRgXM59KIESYv26ujw1UXdArq0S1
	0bOXjtDPqlysaOAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741887716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwWntg5AzrP/kEf/VbYrKMm59OKmTtQ3JTbuK+8ErSw=;
	b=FF1Xr12BZbgCHbmclfEgKmRciH3zLrR0YJE8PXh/nZB5If9gsnniWU6jAQ069eYXvgNieB
	8Z5geOHR5Ao5X71x4qFKj+XGcQjb9BV/RVAAULrWh6Cjs2fT5lXQHCus/JPeMZhH6PIXJN
	Fs916WxOArEHCmf7P32Hk3UdoLvU/LM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741887716;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwWntg5AzrP/kEf/VbYrKMm59OKmTtQ3JTbuK+8ErSw=;
	b=kIjQTqr5H326XYjnKjA6xNDFUdTj2cOAhlGPDl9z85xRfVuy2nLq8PsorsdzWg3MW/Gjyb
	p4fHBpPaPG1eRXAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF313139D2;
	Thu, 13 Mar 2025 17:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kBFfMeQY02cFRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:41:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 19/89] ASoC: hdac_hdmi: Convert to RUNTIME_PM_OPS() & co
Date: Thu, 13 Mar 2025 18:40:24 +0100
Message-ID: <20250313174139.29942-20-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL5j9wc7mf8ens4usejdmaiz8d)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIE_PM_OPS() and SYSTEM_SLEEP_PM_OPS() macros instead
of SET_RUNTIME_PM_OPS() and SET_SYSTEM_SLEEP_PM_OPS() together with
pm_ptr(), which allows us dropping superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/hdac_hdmi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3bea5d09219a..1139a2754ca3 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -2032,7 +2032,6 @@ static void hdmi_codec_remove(struct snd_soc_component *component)
 	pm_runtime_disable(&hdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int hdmi_codec_resume(struct device *dev)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
@@ -2055,9 +2054,6 @@ static int hdmi_codec_resume(struct device *dev)
 	hdac_hdmi_present_sense_all_pins(hdev, hdmi, false);
 	return 0;
 }
-#else
-#define hdmi_codec_resume NULL
-#endif
 
 static const struct snd_soc_component_driver hdmi_hda_codec = {
 	.probe			= hdmi_codec_probe,
@@ -2227,7 +2223,6 @@ static int hdac_hdmi_dev_remove(struct hdac_device *hdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int hdac_hdmi_runtime_suspend(struct device *dev)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
@@ -2296,14 +2291,10 @@ static int hdac_hdmi_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#else
-#define hdac_hdmi_runtime_suspend NULL
-#define hdac_hdmi_runtime_resume NULL
-#endif
 
 static const struct dev_pm_ops hdac_hdmi_pm = {
-	SET_RUNTIME_PM_OPS(hdac_hdmi_runtime_suspend, hdac_hdmi_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, hdmi_codec_resume)
+	RUNTIME_PM_OPS(hdac_hdmi_runtime_suspend, hdac_hdmi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, hdmi_codec_resume)
 };
 
 static const struct hda_device_id hdmi_list[] = {
@@ -2322,7 +2313,7 @@ MODULE_DEVICE_TABLE(hdaudio, hdmi_list);
 static struct hdac_driver hdmi_driver = {
 	.driver = {
 		.name   = "HDMI HDA Codec",
-		.pm = &hdac_hdmi_pm,
+		.pm = pm_ptr(&hdac_hdmi_pm),
 	},
 	.id_table       = hdmi_list,
 	.probe          = hdac_hdmi_dev_probe,
-- 
2.43.0

