Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2494D473C81
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938008; cv=none; b=txYoR06vPw0dRHcEbr7ak20YJY1jmXtDcO85DYTYOY7k5AxvciObSDetDrBmuv7UJKyEKfoJS/TvmerccyCn1eqxs763Tp/x87q2igXRzuXVFDz1o54Htl8MyXkouI+Iuc8Pt8nFkAOu0WF/sUOqJp7/rWCqYyutf+o2UyGuERg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938008; c=relaxed/simple;
	bh=FE/SoUamnkdL97w0JYAx9SyctovNSxryUnUE19g6P+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+UfSUr+cLWU5p5hT7th7tMS4y/yBxMSu32Izy4QAENx3vP7ucMwKE+jnsgO2sgrFFIbI0Rq/iCJqw9qmgMWYZ6N+hrMO1DnJpNxfhw+txfBPIyyYziZKwB4TICZrjuFiqAEqqH5s01dL7FzkArOzeqPsTUkK2UnHrSYaKqpD98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bpZ9sJUE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WkHhjH/W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LbabtrRl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LQxPrFg8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bpZ9sJUE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WkHhjH/W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LbabtrRl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LQxPrFg8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6973D3E01;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24zL51lqa/ZaHIYLk3bsUqRtIJQ2/bKzjeu6roLd0Jg=;
	b=bpZ9sJUECuzi+9FGXehoML+j1zTxfjydQE7lHqlvNGp+3EWCA4LSn9WV6zWL2UNoa0Dq8x
	ktL/Oebo4dDV3zIp1PMp9SI974ABHyEfRkN6y6A9SnVv+0lHvvIDO/RggWPiFXMaaRYDY9
	eubfFn/8X3S0XKrJIZ/dEi6jSmKerf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24zL51lqa/ZaHIYLk3bsUqRtIJQ2/bKzjeu6roLd0Jg=;
	b=WkHhjH/W1DzzhW0tB8u7djItDCQ4s4+I6H5YeJDTssBqDevhVDC2dzSQ+5Aqcw14snJolR
	aXWslcwvE8ONFcBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LbabtrRl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LQxPrFg8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24zL51lqa/ZaHIYLk3bsUqRtIJQ2/bKzjeu6roLd0Jg=;
	b=LbabtrRlENeUPPpG1+plCa9y6ZRRon3cg+a0ci7R2B0fFlwmrzZFdNvT4EoSAJ/8bumItF
	5QNIohnbaAD/inDMWO9DO9xsXBwJ6bHBGeLxwZGR9/EDroNO4q4NuKLWJoGTtHFDwPkK//
	ku1VkAbPjDLi0N7W+/XcTzAiozaJEso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24zL51lqa/ZaHIYLk3bsUqRtIJQ2/bKzjeu6roLd0Jg=;
	b=LQxPrFg8r7erNKoc3fJzSbzgSQn3LD7xZvgYw4SPmx+q5CWKRPs+6GUpz14hjPuJezxKN+
	fSquYK4p/tW0USCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9ABC877A03;
	Wed,  5 Aug 2026 13:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SH2dJDtAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 26/31] ASoC: Intel: avs: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:27 +0200
Message-ID: <20260805135247.670693-27-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6973D3E01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email,suse.de:mid,suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/avs/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 9033f683393c..673ac31f2fea 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -2222,7 +2222,7 @@ struct avs_tplg *avs_tplg_new(struct snd_soc_component *comp)
 
 int avs_load_topology(struct snd_soc_component *comp, const char *filename)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret;
 
 	ret = request_firmware(&fw, filename, comp->dev);
@@ -2235,7 +2235,6 @@ int avs_load_topology(struct snd_soc_component *comp, const char *filename)
 	if (ret < 0)
 		dev_err(comp->dev, "load topology \"%s\" failed: %d\n", filename, ret);
 
-	release_firmware(fw);
 	return ret;
 }
 
-- 
2.55.0

