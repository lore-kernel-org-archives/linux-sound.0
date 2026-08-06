Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FEA30E0D6
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024837; cv=none; b=OFUKAUEu3h6xnWfCrBsMPI5wl754aLRevBS3KbcY4WYtXrBNVD3vmesapd6lsf7vBg0bx2lKnGrmibJmS2I7l+SCAgAmpZbEngLPCXGtl3Ddqjchhg1MTRGs/mPd7/vvnRgMfpL9I0csy2dPalGbkI1eOBOCgZ2/nSsSxDVCq6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024837; c=relaxed/simple;
	bh=Bu1ghSCPHI5Zpr21WAs4ahvZres8/CU7go3RBIrzhaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1I2sqOhYRAWn9Y9QNF5bX0djQYiMgMiA5K5n/eUPtVhn8OFqfYctAuoS49hX8eLlbo/InXkSkhzCZfjmJ3QLkmHHVmV/7FQR3KCcN6ajuASHRO7vfGcmrmY+qpWApiqeZJJINnyq4zJjA73KfLluHCyP6z8mgykcwdLp9H7LgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IMvzKDw6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JQ01nc5/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X1WMuXJn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KVm7Uxzn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IMvzKDw6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JQ01nc5/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X1WMuXJn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KVm7Uxzn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF3CC800D2;
	Thu,  6 Aug 2026 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVY9Z+vs7piGW/Bbbssix+RHmrUJrbKHw9kH3kp1WiI=;
	b=IMvzKDw6hK8I1khe9OAa+2HFwKE4MlOrahAvklUeq4hsVqiBHqGVStueEayjC5Q07vUSlr
	PfScis0Cs+wxqwgt8ANXC+WniLBQ5U5wjvTCutlU0VhCgQKz5oU7GozCUobiGao1siC2ug
	cueNTp5TGu4hPqJi0PKCHoLtsx3QjZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVY9Z+vs7piGW/Bbbssix+RHmrUJrbKHw9kH3kp1WiI=;
	b=JQ01nc5/ed67Wq4gffX+Hs+BHUDrXGjVQ+BIEayMVlEXOocBxwWqXt1MYdY5RxHVKS1J24
	a6GmCgT7Na90LYDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X1WMuXJn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KVm7Uxzn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVY9Z+vs7piGW/Bbbssix+RHmrUJrbKHw9kH3kp1WiI=;
	b=X1WMuXJnvDSMIDj9yjJZI5qwevH1C3pOm/CDiJztG1Wa22Xbc24ZY1mS6GiMLHUZhahUok
	RJmk3hKXMXIN4bE7/IN+wmZjzg6evK3iaJwnCPdix0eWOKIt0okCcsuafY+ZaCdJRUNl82
	+gRBDxtr3WwPq60c3uXq98MzJYyUG1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVY9Z+vs7piGW/Bbbssix+RHmrUJrbKHw9kH3kp1WiI=;
	b=KVm7Uxzn9TYEMOLMsXFzjADzV+ka+ieO7VIXJ8Iea5ornXAUfzKqC5tupArjPMA11rBIeG
	eye4z2GEaELj1PAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09078779F7;
	Thu,  6 Aug 2026 14:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0CSNAG2TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v2 15/31] ASoC: rt5677: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:47 +0200
Message-ID: <20260806140006.1412298-16-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: CF3CC800D2
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,realtek.com:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5677.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 3e4d1dbce740..4757017cc83d 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -849,11 +849,11 @@ static int rt5677_parse_and_load_dsp(struct rt5677_priv *rt5677, const u8 *buf,
 
 static int rt5677_load_dsp_from_file(struct rt5677_priv *rt5677)
 {
-	const struct firmware *fwp;
 	struct device *dev = rt5677->component->dev;
-	int ret = 0;
+	int ret;
 
 	/* Load dsp firmware from rt5677_elf_vad file */
+	const struct firmware *fwp __free(firmware) = NULL;
 	ret = request_firmware(&fwp, "rt5677_elf_vad", dev);
 	if (ret) {
 		dev_err(dev, "Request rt5677_elf_vad failed %d\n", ret);
@@ -861,9 +861,7 @@ static int rt5677_load_dsp_from_file(struct rt5677_priv *rt5677)
 	}
 	dev_info(dev, "Requested rt5677_elf_vad (%zu)\n", fwp->size);
 
-	ret = rt5677_parse_and_load_dsp(rt5677, fwp->data, fwp->size);
-	release_firmware(fwp);
-	return ret;
+	return rt5677_parse_and_load_dsp(rt5677, fwp->data, fwp->size);
 }
 
 static int rt5677_set_dsp_vad(struct snd_soc_component *component, bool on)
-- 
2.55.0

