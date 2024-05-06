Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5CC156230
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012034; cv=none; b=huOZEZij08cAM9w8Zm5c79h9CqiKqgUwnKMdE1UnbqMS3k2aCHQbvAGsLqyEcOGe5xIQyA9EGzRDwPWG2YTuoI8V0gWhL9L3ZxacvTJgtmQAN863WbT2EEbK3fjlVrCXnoEhoo4hW+G9YH15HqHyRUWZQzHMtzsjrzuMjIk20YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012034; c=relaxed/simple;
	bh=HPlLJypHEQYHMkj2+GdCpZsENfmcQqkziuibdDmvTsY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCbLoaHG/AKNa5jin46hbntZ5s9dgA13N00j/Pvckmv4dE+7cXsGZJ4w7iCmRLhU00Uvpn2c4Id3wXudUudtS0T2AW9u8nIDXwIispL4O6VP6pey5/HsAKWq8D9wFK7QBdrI59eCmTTMawSxWkqeDV6x0w1VpILkRXCNecR7TFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vyraP0TE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B2S6MAv2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vyraP0TE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B2S6MAv2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vyraP0TE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B2S6MAv2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vyraP0TE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B2S6MAv2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 01DF4385E3;
	Mon,  6 May 2024 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6igZx2nDiQyQ6p37W2PMbkn56U2TI6741Wxphapbbc=;
	b=vyraP0TEGxrEh4jT2+nVVsC8Yx/SaSvvQ8PotWRTLuDl35FHx5gDzOwv8+TlWywYPM5UCw
	MEoLVjAQe93AF8sc+5RRfptlzT/dKy7yBWo+GemitRXJ4yikc1N+UtXuqlBkGWhwwfEeVD
	jUpV+P6BIS7h4Im6fq9y5QQv843FwJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012031;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6igZx2nDiQyQ6p37W2PMbkn56U2TI6741Wxphapbbc=;
	b=B2S6MAv28OcknPDxwhBBvRvC5zQXMc3FGxrO5FZx8/x2OdPd7zQNdLJ2exq4Sh41T0AfJ+
	2bRZCP51dJfmPHDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vyraP0TE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B2S6MAv2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6igZx2nDiQyQ6p37W2PMbkn56U2TI6741Wxphapbbc=;
	b=vyraP0TEGxrEh4jT2+nVVsC8Yx/SaSvvQ8PotWRTLuDl35FHx5gDzOwv8+TlWywYPM5UCw
	MEoLVjAQe93AF8sc+5RRfptlzT/dKy7yBWo+GemitRXJ4yikc1N+UtXuqlBkGWhwwfEeVD
	jUpV+P6BIS7h4Im6fq9y5QQv843FwJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012031;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A6igZx2nDiQyQ6p37W2PMbkn56U2TI6741Wxphapbbc=;
	b=B2S6MAv28OcknPDxwhBBvRvC5zQXMc3FGxrO5FZx8/x2OdPd7zQNdLJ2exq4Sh41T0AfJ+
	2bRZCP51dJfmPHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEE061386E;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eIE1Nb4BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 12/12] ALSA: hda: via: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:55 +0200
Message-ID: <20240506161359.6960-13-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506161359.6960-1-tiwai@suse.de>
References: <20240506161359.6960-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-0.93 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.92)[86.28%];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 01DF4385E3
X-Spam-Flag: NO
X-Spam-Score: -0.93
X-Spamd-Bar: /

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio via codec driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_via.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
index 2994f85bc1b9..a8ef4bb70dd0 100644
--- a/sound/pci/hda/patch_via.c
+++ b/sound/pci/hda/patch_via.c
@@ -379,7 +379,6 @@ static void via_free(struct hda_codec *codec)
 	snd_hda_gen_free(codec);
 }
 
-#ifdef CONFIG_PM
 static int via_suspend(struct hda_codec *codec)
 {
 	struct via_spec *spec = codec->spec;
@@ -400,9 +399,7 @@ static int via_resume(struct hda_codec *codec)
 	snd_hda_regmap_sync(codec);
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM
 static int via_check_power_status(struct hda_codec *codec, hda_nid_t nid)
 {
 	struct via_spec *spec = codec->spec;
@@ -410,7 +407,6 @@ static int via_check_power_status(struct hda_codec *codec, hda_nid_t nid)
 	vt1708_update_hp_work(codec);
 	return snd_hda_check_amp_list_power(codec, &spec->gen.loopback, nid);
 }
-#endif
 
 /*
  */
@@ -423,11 +419,9 @@ static const struct hda_codec_ops via_patch_ops = {
 	.init = via_init,
 	.free = via_free,
 	.unsol_event = snd_hda_jack_unsol_event,
-#ifdef CONFIG_PM
 	.suspend = via_suspend,
 	.resume = via_resume,
 	.check_power_status = via_check_power_status,
-#endif
 };
 
 
-- 
2.43.0

