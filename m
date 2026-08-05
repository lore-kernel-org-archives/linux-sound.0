Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03DA4734F2
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937996; cv=none; b=X5uYw/icC2zIZ0axdIiRUmDdJZN3I/5n10pFzvDOm6umWL1OiZbqGhDIgVbyebT8zubctPNPdqIGqe/VJD+iRx6mneUFk4PtYUeu0NmjYwegxYknWV/3ReY4x+EigrXoP8bpYfqO7tYNOSVCOSlOYtChNcnB/XLAXVFmQFEDsr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937996; c=relaxed/simple;
	bh=ytbzByAukjs4sgj7kyfUcqcrr1jrwlOR8sP88WTv1Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iwavm0V+9QNaGPMiIT4GpB9gGiAo4O5Pjm2j+Gd06Xplf13UB8JEN7mQfrmRQC+pfds90t6fzI5WzgwtF24olu19KAgioUxyNv8U1P6lqa+nI4JOBhAcUmL+LWda7tavetkDvtTFpt7ssA4PEQtdscJpIeEQeAYPUyH2eVThzHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hJsnDTPU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T1GV45Ov; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V/CHFzzE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aeYH2uaH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hJsnDTPU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T1GV45Ov";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V/CHFzzE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aeYH2uaH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C2993DFC;
	Wed,  5 Aug 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x88uVPU3KsdL6Ooa4IRGOUaJlrRFDu9swYSuG4u7DVI=;
	b=hJsnDTPUyrWzz/BSZFAZrTtEt1jL8DGKoG/DC9mAK/44HizdjMbHQjfBPBk1j/VqFy6EsL
	RUp5KPcwnQuDdFF29bDbZtc18+LXtnkyujN/6DFFU4xU3Oc4bEncrprSeQpCWVpbK14a9o
	+nVyNhRvIwRGLjvQTIxiDLiR/Z/X/d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x88uVPU3KsdL6Ooa4IRGOUaJlrRFDu9swYSuG4u7DVI=;
	b=T1GV45OvoD41zcoVfJin6zvjtlDgSDQN2YId73b6FinOezLF/Rb1I4JjgBpCBO//MrSS6g
	VaiCc0dOzUyvE8AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x88uVPU3KsdL6Ooa4IRGOUaJlrRFDu9swYSuG4u7DVI=;
	b=V/CHFzzEOsWvGi9gJBKyf70Nl6oDy1/Lw+k+2hy/BYCHXKvCoat47Zt2Is78a4AZY4wIj3
	pw1gd4L43f3pgxhq3cN0AXXbViD+6W0CA7wkT2Q5laqtCqHEPcIQoCfOzXcX259fIFfiB8
	yZrDLn3Z990bcMCRHIYbJQvflBUqj00=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937984;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x88uVPU3KsdL6Ooa4IRGOUaJlrRFDu9swYSuG4u7DVI=;
	b=aeYH2uaHn8whzcP5kpovlhqpkjddj87yH0rMx//Lk+GB4gi7lu8V/CRlMZmVq7+tYoiF7v
	XcnU4y2wDNvtUDAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC7C7779F4;
	Wed,  5 Aug 2026 13:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MLGaODhAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 11/31] ASoC: pcm6240: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:12 +0200
Message-ID: <20260805135247.670693-12-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Since the firmware release is cleaned up automatically, we can convert
the mutex call with guard() gracefully, too.

Only the code refactoring, no functional changes.

Cc: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/pcm6240.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index a2b66eae6ac4..db85ae2f8aed 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -1577,10 +1577,10 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 {
 	struct pcmdevice_priv *pcm_dev = snd_soc_component_get_drvdata(comp);
 	struct i2c_adapter *adap = pcm_dev->client->adapter;
-	const struct firmware *fw_entry = NULL;
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	int ret, i, j;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	pcm_dev->component = comp;
 
@@ -1588,7 +1588,7 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 		for (j = 0; j < 2; j++) {
 			ret = pcmdev_gain_ctrl_add(pcm_dev, i, j);
 			if (ret < 0)
-				goto out;
+				return ret;
 		}
 	}
 
@@ -1621,21 +1621,17 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: request %s err = %d\n", __func__,
 			pcm_dev->bin_name, ret);
-		goto out;
+		return ret;
 	}
 
 	ret = pcmdev_regbin_ready(fw_entry, pcm_dev);
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: %s parse err = %d\n", __func__,
 			pcm_dev->bin_name, ret);
-		goto out;
+		return ret;
 	}
-	ret = pcmdev_profile_ctrl_add(pcm_dev);
-out:
-	release_firmware(fw_entry);
 
-	mutex_unlock(&pcm_dev->codec_lock);
-	return ret;
+	return pcmdev_profile_ctrl_add(pcm_dev);
 }
 
 
-- 
2.55.0

