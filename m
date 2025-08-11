Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8B121CC63
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906951; cv=none; b=biXZehrEpeZIB3IyRDi26U+em17ini6RhypuLFTv6H7s+HDq5evJfEIhB6Bk+MuHsihZmWgb4T70t3If6nko0sedUOOYfc/4gGx3a/iGB00vu4B1aGTelnQVjLUpUtrsyk6iWxKxCdej9m7ODkP6LpbwfcrKZGgXP/PwEdqQjH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906951; c=relaxed/simple;
	bh=vQAzBM3dyaDJm8MXns5iG9qVxmGTKDO/58mkNBVG35I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Um4WkTh76xParIcbdDz6jYxUY/T9gvbmE8n22LpvIRib5hwCdeAw9JKnw7WnUMQ2yQMzNwn8oxCrr64y7ApAyGRA2vnUFt0V63iCTR8usguhEfIfGTDcMwYTufjMd69c4MKpiR+EkE7utkS7RajogZyzxdTXMfw/OX40B33/qbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IMNPOsQ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C6tHoEmc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IMNPOsQ5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C6tHoEmc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IMNPOsQ5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C6tHoEmc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IMNPOsQ5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C6tHoEmc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA4925BE38;
	Mon, 11 Aug 2025 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3U6GgXxpyMgyG4NrB+L2K3OZe8kgUL1SLGiGIYjUJ8=;
	b=IMNPOsQ5FKgRxLUhNXdgxiRozFQI9UAyVH/CrdgVEWueXrhNIzWejWWjpdTcqtDD0EYVxW
	5ZiVmYXlZocHTvte0ytDHqL+7Q9pRuRK87/eapGn4MnkCmuNTEbBMXW2MO56ckifkhCrkt
	yaprsIsGJOsnOF2nmDmh+ON3zsnqk0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3U6GgXxpyMgyG4NrB+L2K3OZe8kgUL1SLGiGIYjUJ8=;
	b=C6tHoEmcEBdgaqtHHSIQV+fXtaQbhqfk+Z5Hl8L9tHWT13uCfRvANojcwf0ns2m+zhFK9i
	Au66G+AWqPSlchAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3U6GgXxpyMgyG4NrB+L2K3OZe8kgUL1SLGiGIYjUJ8=;
	b=IMNPOsQ5FKgRxLUhNXdgxiRozFQI9UAyVH/CrdgVEWueXrhNIzWejWWjpdTcqtDD0EYVxW
	5ZiVmYXlZocHTvte0ytDHqL+7Q9pRuRK87/eapGn4MnkCmuNTEbBMXW2MO56ckifkhCrkt
	yaprsIsGJOsnOF2nmDmh+ON3zsnqk0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3U6GgXxpyMgyG4NrB+L2K3OZe8kgUL1SLGiGIYjUJ8=;
	b=C6tHoEmcEBdgaqtHHSIQV+fXtaQbhqfk+Z5Hl8L9tHWT13uCfRvANojcwf0ns2m+zhFK9i
	Au66G+AWqPSlchAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7427613A7E;
	Mon, 11 Aug 2025 10:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WEY8GxDBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 15/25] ALSA: hda/component: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:49 +0200
Message-ID: <20250811100807.7962-16-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLf66hkhxcz6y1w5afddqk81z3)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

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

