Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89FE153801
	for <linux-sound@vger.kernel.org>; Thu, 13 Mar 2025 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885666; cv=none; b=mVG62/4pYzQhWFJ3nSpRN/0LKTE/geY4VDex2dSr889Z+B+QrCd0aQrTkVOaB2Emwf4kkmMQOKVKjdpwD6n+r+exHRBMuHBck3Meux6bfUcVO3Vr6u0ivekacuVphdVqeP2yLXMTkmcNmPQk+zyx1qbdN7280RyINFHDHl5BQLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885666; c=relaxed/simple;
	bh=ZUkqT/YWBpw8oIE2jehGvxc65nbetWfWiXPK83au8hg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hckiqTukFi47uT7/tw5xu9/hG217j3DTq3g8b9DkUgGXRG2W537FuKWq2o6eqpfratiEzSRuQ+fRUuLfgMeNmtak6M/tvCHWDIxvGBT5GnJbPQCMZH7sz2IkYMhdXovOWk9neja8eIKMv1TBu0VnH0lUrR7YDI/3ZSvtW0MbnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PlfDBfq8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dm3NpdXQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PlfDBfq8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dm3NpdXQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PlfDBfq8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dm3NpdXQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PlfDBfq8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dm3NpdXQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6EB6F21188;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1ClED/Kw3FmmgxAGCDVHLV5YB1e2T2RKEzNIpscAmM=;
	b=PlfDBfq8WrsRRQmZcfeo7u7yrYxeVnDAgrIz435voDDqIJg+9vfbetePJAeABJuq70EUcL
	lHs0FacQnLe+xuOp/3CrOZ+ffVYXmU3VKBfAVdqLFgwhaD7T7AMb3rznpBCDYSwEVtAnwY
	tSXCa1n7RHjyhHdBk8oWH8kaeClAxOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1ClED/Kw3FmmgxAGCDVHLV5YB1e2T2RKEzNIpscAmM=;
	b=dm3NpdXQDj8xa7WARb3piHkhnr5wEB71Ja5hNCajHYlPDyQuoA6C1etJWBRaBxwGOWFURP
	nHW+rNFhUQjZWbAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741885656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1ClED/Kw3FmmgxAGCDVHLV5YB1e2T2RKEzNIpscAmM=;
	b=PlfDBfq8WrsRRQmZcfeo7u7yrYxeVnDAgrIz435voDDqIJg+9vfbetePJAeABJuq70EUcL
	lHs0FacQnLe+xuOp/3CrOZ+ffVYXmU3VKBfAVdqLFgwhaD7T7AMb3rznpBCDYSwEVtAnwY
	tSXCa1n7RHjyhHdBk8oWH8kaeClAxOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741885656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B1ClED/Kw3FmmgxAGCDVHLV5YB1e2T2RKEzNIpscAmM=;
	b=dm3NpdXQDj8xa7WARb3piHkhnr5wEB71Ja5hNCajHYlPDyQuoA6C1etJWBRaBxwGOWFURP
	nHW+rNFhUQjZWbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54A1913797;
	Thu, 13 Mar 2025 17:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wKV8E9gQ02ciOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 13 Mar 2025 17:07:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/9] ALSA: pcm: Convert to SYSTEM_SLEEP_PM_OPS()
Date: Thu, 13 Mar 2025 18:07:21 +0100
Message-ID: <20250313170731.26943-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313170731.26943-1-tiwai@suse.de>
References: <20250313170731.26943-1-tiwai@suse.de>
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Use the newer SYSTEM_SLEEP_PM_OPS() macro instead of
SET_SYSTEM_SLEEP_PM_OPS(), which makes CONFIG_PM_SLEEP ifdefs
superfluous.

Merely a cleanup, there should be no actual code change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 290690fc2abc..283aac441fa0 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -592,7 +592,6 @@ static const struct attribute_group *pcm_dev_attr_groups[];
  * PM callbacks: we need to deal only with suspend here, as the resume is
  * triggered either from user-space or the driver's resume callback
  */
-#ifdef CONFIG_PM_SLEEP
 static int do_pcm_suspend(struct device *dev)
 {
 	struct snd_pcm_str *pstr = dev_get_drvdata(dev);
@@ -601,10 +600,9 @@ static int do_pcm_suspend(struct device *dev)
 		snd_pcm_suspend_all(pstr->pcm);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops pcm_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(do_pcm_suspend, NULL)
+	SYSTEM_SLEEP_PM_OPS(do_pcm_suspend, NULL)
 };
 
 /* device type for PCM -- basically only for passing PM callbacks */
-- 
2.43.0

