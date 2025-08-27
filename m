Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C4205E2F
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280182; cv=none; b=b5dNKJPLTf+L6lvPgviHUJL3kcQj/lo+kjLrxBZ2x8isf/SeuOPJM2fNOe4sIxWTiuvk1D25Ct3Q/O9ChVtpveapn0OFqVK9tSboGP1ED3aY9GyFEOP2NfFjw6gvPNWys9SDKxMAYWJsWl16HmswEWif0UsvE7xj/am6e3aj1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280182; c=relaxed/simple;
	bh=vQAzBM3dyaDJm8MXns5iG9qVxmGTKDO/58mkNBVG35I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4WL2RmsJ7xfHLmTFnNKBEs4bS/ywzHI6e+MQFqRfgJbXj/7ayXx5xBOAUCvWOpfPmmN3Mmzrbd9/tAWfdfd8hT5/KeXZiFFWrW3FYP4uzbyhXrXKtE7fm3hmGJBVCSNFFnqjTTtFraHTjri2EdSixeU/ipw59po6mKnmfXK68E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BRf4pqHJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=462SSZV0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BRf4pqHJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=462SSZV0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BRf4pqHJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="462SSZV0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BRf4pqHJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="462SSZV0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9957E223D1;
	Wed, 27 Aug 2025 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3U6GgXxpyMgyG4NrB+L2K3OZe8kgUL1SLGiGIYjUJ8=;
	b=BRf4pqHJw/Bl+RlevAecWmjHQIyjUFbz/p/2Jw9jZOL+LAbCcwR/fvjrdYycYOGnX/qEBi
	+bUavcY6Q03Fc046e6yHKFTz0SEwDt4BLhs0jICQ9d/xnxRxipRvWOfg1/yV1Ckers8E3w
	dDmrEE219OnuFExa3XF+hGwwbs7ijm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3U6GgXxpyMgyG4NrB+L2K3OZe8kgUL1SLGiGIYjUJ8=;
	b=462SSZV0JxF6k2bTSMNzliG8+bDzzdJ6kGLto0B+m+jqJpMjw0uxsmiLzoN6OxLJIRo/qA
	m1re1ZI9LvgjN4DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BRf4pqHJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=462SSZV0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3U6GgXxpyMgyG4NrB+L2K3OZe8kgUL1SLGiGIYjUJ8=;
	b=BRf4pqHJw/Bl+RlevAecWmjHQIyjUFbz/p/2Jw9jZOL+LAbCcwR/fvjrdYycYOGnX/qEBi
	+bUavcY6Q03Fc046e6yHKFTz0SEwDt4BLhs0jICQ9d/xnxRxipRvWOfg1/yV1Ckers8E3w
	dDmrEE219OnuFExa3XF+hGwwbs7ijm8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3U6GgXxpyMgyG4NrB+L2K3OZe8kgUL1SLGiGIYjUJ8=;
	b=462SSZV0JxF6k2bTSMNzliG8+bDzzdJ6kGLto0B+m+jqJpMjw0uxsmiLzoN6OxLJIRo/qA
	m1re1ZI9LvgjN4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 810DA13A31;
	Wed, 27 Aug 2025 07:29:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CDpKHtGzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 15/25] ALSA: hda/component: Use guard() for mutex locks
Date: Wed, 27 Aug 2025 09:28:55 +0200
Message-ID: <20250827072916.31933-16-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 9957E223D1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard().

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/hda_component.c | 15 ++++-----------
 sound/hda/codecs/side-codecs/hda_component.h |  3 +--
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/hda_component.c b/sound/hda/codecs/side-codecs/hda_component.c
index 71860e2d6377..bcf47a301697 100644
--- a/sound/hda/codecs/side-codecs/hda_component.c
+++ b/sound/hda/codecs/side-codecs/hda_component.c
@@ -21,13 +21,12 @@ void hda_component_acpi_device_notify(struct hda_component_parent *parent,
 	struct hda_component *comp;
 	int i;
 
-	mutex_lock(&parent->mutex);
+	guard(mutex)(&parent->mutex);
 	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
 		comp = hda_component_from_index(parent, i);
 		if (comp->dev && comp->acpi_notify)
 			comp->acpi_notify(acpi_device_handle(comp->adev), event, comp->dev);
 	}
-	mutex_unlock(&parent->mutex);
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_acpi_device_notify, "SND_HDA_SCODEC_COMPONENT");
 
@@ -89,7 +88,7 @@ void hda_component_manager_playback_hook(struct hda_component_parent *parent, in
 	struct hda_component *comp;
 	int i;
 
-	mutex_lock(&parent->mutex);
+	guard(mutex)(&parent->mutex);
 	for (i = 0; i < ARRAY_SIZE(parent->comps); i++) {
 		comp = hda_component_from_index(parent, i);
 		if (comp->dev && comp->pre_playback_hook)
@@ -105,7 +104,6 @@ void hda_component_manager_playback_hook(struct hda_component_parent *parent, in
 		if (comp->dev && comp->post_playback_hook)
 			comp->post_playback_hook(comp->dev, action);
 	}
-	mutex_unlock(&parent->mutex);
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_playback_hook, "SND_HDA_SCODEC_COMPONENT");
 
@@ -138,16 +136,11 @@ static int hda_comp_match_dev_name(struct device *dev, void *data)
 int hda_component_manager_bind(struct hda_codec *cdc,
 			       struct hda_component_parent *parent)
 {
-	int ret;
-
 	/* Init shared and component specific data */
 	memset(parent->comps, 0, sizeof(parent->comps));
 
-	mutex_lock(&parent->mutex);
-	ret = component_bind_all(hda_codec_dev(cdc), parent);
-	mutex_unlock(&parent->mutex);
-
-	return ret;
+	guard(mutex)(&parent->mutex);
+	return component_bind_all(hda_codec_dev(cdc), parent);
 }
 EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, "SND_HDA_SCODEC_COMPONENT");
 
diff --git a/sound/hda/codecs/side-codecs/hda_component.h b/sound/hda/codecs/side-codecs/hda_component.h
index 7ee37154749f..075137a73bae 100644
--- a/sound/hda/codecs/side-codecs/hda_component.h
+++ b/sound/hda/codecs/side-codecs/hda_component.h
@@ -95,9 +95,8 @@ static inline struct hda_component *hda_component_from_index(struct hda_componen
 static inline void hda_component_manager_unbind(struct hda_codec *cdc,
 						struct hda_component_parent *parent)
 {
-	mutex_lock(&parent->mutex);
+	guard(mutex)(&parent->mutex);
 	component_unbind_all(hda_codec_dev(cdc), parent);
-	mutex_unlock(&parent->mutex);
 }
 
 #endif /* ifndef __HDA_COMPONENT_H__ */
-- 
2.50.1

