Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C98233141
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205651; cv=none; b=JyYSfmzSSo/Yq0aLlgwMMaJ75XceDaD86tVtDXa3tMhorhppxvKCZCvYd1P+zxlXbTkMSy9Ua5xyrYJ6ksYXeNHJ+8CoIOUejeqjphi27ycnYAmJGLtHou2hFrJUkDYjr+Hg1HdY0sPZvIw01hKh6DXzDRmoJluVtiO8mV9dtZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205651; c=relaxed/simple;
	bh=3kgPWq5W/86TBA5z4A0vNdx3bYjIcKt83A0rjrft7OY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zeenyg+MyzY9y3MADGCyrzD6RagGpgDTdynDFQCHI90ToHUNlFV2wCLP+rkUzTOJoU6niUW+mLawGtmbox4LWBmDSDTSa0+6h295UDcpGb+d8VkqQd/sTWoE7oIm5nl7xs2u7g5pO/RoneXGVBakPDHmk4zwF6hPKy6QDC++IiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VGIyOA7A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cqIAZaZQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VGIyOA7A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cqIAZaZQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VGIyOA7A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cqIAZaZQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VGIyOA7A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cqIAZaZQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15C7B22230;
	Mon, 17 Mar 2025 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrPS9JXDrR7GdX7hks2u1pyyEJqmjYmZdzofcM17agc=;
	b=VGIyOA7AATUn3hiYxeiRKKMfatd84BxLTWdgzAa2CKX6BaYjimqSZuZGa9m7DPQoQRvN3u
	RpTiLi/qk4Z397xk3vLobxeG9A8r0cq+lFg1fWrwIED9RZ+kwb2boV9kMF49AC1tB/reNZ
	ELQWlJtLPHNVYXjkVN5ad0fBdtyJ5SY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrPS9JXDrR7GdX7hks2u1pyyEJqmjYmZdzofcM17agc=;
	b=cqIAZaZQktw/E2fh60xXaqDzZdpkXpkcUST1M0o0JDK2t5pO6jhOPyf4sz9qQQPJMeY+X7
	wRh0r1aQth7nO7Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrPS9JXDrR7GdX7hks2u1pyyEJqmjYmZdzofcM17agc=;
	b=VGIyOA7AATUn3hiYxeiRKKMfatd84BxLTWdgzAa2CKX6BaYjimqSZuZGa9m7DPQoQRvN3u
	RpTiLi/qk4Z397xk3vLobxeG9A8r0cq+lFg1fWrwIED9RZ+kwb2boV9kMF49AC1tB/reNZ
	ELQWlJtLPHNVYXjkVN5ad0fBdtyJ5SY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xrPS9JXDrR7GdX7hks2u1pyyEJqmjYmZdzofcM17agc=;
	b=cqIAZaZQktw/E2fh60xXaqDzZdpkXpkcUST1M0o0JDK2t5pO6jhOPyf4sz9qQQPJMeY+X7
	wRh0r1aQth7nO7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D15F4132CF;
	Mon, 17 Mar 2025 09:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mDiBMMzx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 88/88] ASoC: pcm3168a: Convert to EXPORT_GPL_DEV_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:50 +0100
Message-ID: <20250317095603.20073-89-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

Use the newer EXPORT_GPL_DEV_PM_OPS() macro together with pm_ptr(),
which allows us to drop superfluous CONFIG_PM ifdefs.

This optimizes slightly when CONFIG_PM is disabled, too.

Cc: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/pcm3168a-i2c.c | 2 +-
 sound/soc/codecs/pcm3168a-spi.c | 2 +-
 sound/soc/codecs/pcm3168a.c     | 7 ++-----
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a-i2c.c b/sound/soc/codecs/pcm3168a-i2c.c
index 4da608ba514d..ff18c74b616c 100644
--- a/sound/soc/codecs/pcm3168a-i2c.c
+++ b/sound/soc/codecs/pcm3168a-i2c.c
@@ -59,7 +59,7 @@ static struct i2c_driver pcm3168a_i2c_driver = {
 		.name	= "pcm3168a",
 		.acpi_match_table = pcm3168a_acpi_match,
 		.of_match_table = pcm3168a_of_match,
-		.pm		= &pcm3168a_pm_ops,
+		.pm		= pm_ptr(&pcm3168a_pm_ops),
 	},
 };
 module_i2c_driver(pcm3168a_i2c_driver);
diff --git a/sound/soc/codecs/pcm3168a-spi.c b/sound/soc/codecs/pcm3168a-spi.c
index b5b08046f545..0871338eacba 100644
--- a/sound/soc/codecs/pcm3168a-spi.c
+++ b/sound/soc/codecs/pcm3168a-spi.c
@@ -50,7 +50,7 @@ static struct spi_driver pcm3168a_spi_driver = {
 	.driver = {
 		.name	= "pcm3168a",
 		.of_match_table = pcm3168a_of_match,
-		.pm		= &pcm3168a_pm_ops,
+		.pm		= pm_ptr(&pcm3168a_pm_ops),
 	},
 };
 module_spi_driver(pcm3168a_spi_driver);
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index df6836a652ef..c8617a488b11 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -849,7 +849,6 @@ void pcm3168a_remove(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pcm3168a_remove);
 
-#ifdef CONFIG_PM
 static int pcm3168a_rt_resume(struct device *dev)
 {
 	struct pcm3168a_priv *pcm3168a = dev_get_drvdata(dev);
@@ -905,12 +904,10 @@ static int pcm3168a_rt_suspend(struct device *dev)
 
 	return 0;
 }
-#endif
 
-const struct dev_pm_ops pcm3168a_pm_ops = {
-	SET_RUNTIME_PM_OPS(pcm3168a_rt_suspend, pcm3168a_rt_resume, NULL)
+EXPORT_GPL_DEV_PM_OPS(pcm3168a_pm_ops) = {
+	RUNTIME_PM_OPS(pcm3168a_rt_suspend, pcm3168a_rt_resume, NULL)
 };
-EXPORT_SYMBOL_GPL(pcm3168a_pm_ops);
 
 MODULE_DESCRIPTION("PCM3168A codec driver");
 MODULE_AUTHOR("Damien Horsley <Damien.Horsley@imgtec.com>");
-- 
2.43.0

