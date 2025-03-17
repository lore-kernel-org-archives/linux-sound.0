Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241F22FE06
	for <linux-sound@vger.kernel.org>; Mon, 17 Mar 2025 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742205590; cv=none; b=Jhe4ccJx1kKuHU38vAQKRmbVJUCBz7EVF8mYbVVmMvXNXiAbshbURfDG4B38m84GLw3768CZFbWx7JrXVvUxmZ6Xkptayd6c5+pBYvgaagYnGwk3/PEKHKQwOcMCshVytNw2wFoWsKyO1LPWfmPDx3ZQ3GXzPAMi/axzPqw9mMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742205590; c=relaxed/simple;
	bh=ts0sK6RDM7p2iinds6quDFImQJWku1qBEHw6jDoz0CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHYao7f0NOlDpyb+wrSzoTTdxEpcuCt7+jn4C2cnNUtZkFhs80Ijb9TTo1uo86Sgj2tqlpfYn0wYFKrGp2yH6C2lZCnIsS90u72S8VruazH/QQJ+axw72JFGW+hXRvdjur8BnFkVK03PQLidhiRtm0MTrmKqhFwk/8UF6MSS1zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cwha0Ufu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QYPf4mHA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cwha0Ufu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QYPf4mHA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cwha0Ufu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QYPf4mHA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cwha0Ufu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QYPf4mHA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 04C322023C;
	Mon, 17 Mar 2025 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrRbrRs8yjF39jRzqLY81ETFBjqhrdftWgiNCid+rCQ=;
	b=cwha0UfuWswLQDa81iU2lwH+0GcnXSv+nQ/1v0r5EMFQ68j3UmgW3xMv5cyBXdSi2Bzfvm
	D5E+LxLuuptLwJiPv9VbpTgwaQB7qH6G5BxM2diGUMZAEa89HuS5ggUlOaSFPjBsYbo9bf
	fxaVl0K5F2ai68Keb3O7NnD+TMl3zcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrRbrRs8yjF39jRzqLY81ETFBjqhrdftWgiNCid+rCQ=;
	b=QYPf4mHACG16v2RKdoLUNDsavfEp6cgAL+PDmuSC6TFURps4E19lCQv7druO7gnBR9gCmu
	sTkBZ4UNgMThPODQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742205385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrRbrRs8yjF39jRzqLY81ETFBjqhrdftWgiNCid+rCQ=;
	b=cwha0UfuWswLQDa81iU2lwH+0GcnXSv+nQ/1v0r5EMFQ68j3UmgW3xMv5cyBXdSi2Bzfvm
	D5E+LxLuuptLwJiPv9VbpTgwaQB7qH6G5BxM2diGUMZAEa89HuS5ggUlOaSFPjBsYbo9bf
	fxaVl0K5F2ai68Keb3O7NnD+TMl3zcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742205385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrRbrRs8yjF39jRzqLY81ETFBjqhrdftWgiNCid+rCQ=;
	b=QYPf4mHACG16v2RKdoLUNDsavfEp6cgAL+PDmuSC6TFURps4E19lCQv7druO7gnBR9gCmu
	sTkBZ4UNgMThPODQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D59AA132CF;
	Mon, 17 Mar 2025 09:56:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EPzjMsjx12eaGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:56:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 66/88] ASoC: mediatek: mt8173: Convert to RUNTIME_PM_OPS()
Date: Mon, 17 Mar 2025 10:55:28 +0100
Message-ID: <20250317095603.20073-67-tiwai@suse.de>
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
X-Spam-Score: -6.80
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Use the newer RUNTIME_PM_OPS() macro instead of SET_RUNTIME_PM_OPS()
together with pm_ptr().

This optimizes slightly when CONFIG_PM is disabled, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 03250273ea9c..04ed0cfec174 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1212,15 +1212,15 @@ static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
 MODULE_DEVICE_TABLE(of, mt8173_afe_pcm_dt_match);
 
 static const struct dev_pm_ops mt8173_afe_pm_ops = {
-	SET_RUNTIME_PM_OPS(mt8173_afe_runtime_suspend,
-			   mt8173_afe_runtime_resume, NULL)
+	RUNTIME_PM_OPS(mt8173_afe_runtime_suspend,
+		       mt8173_afe_runtime_resume, NULL)
 };
 
 static struct platform_driver mt8173_afe_pcm_driver = {
 	.driver = {
 		   .name = "mt8173-afe-pcm",
 		   .of_match_table = mt8173_afe_pcm_dt_match,
-		   .pm = &mt8173_afe_pm_ops,
+		   .pm = pm_ptr(&mt8173_afe_pm_ops),
 	},
 	.probe = mt8173_afe_pcm_dev_probe,
 	.remove = mt8173_afe_pcm_dev_remove,
-- 
2.43.0

