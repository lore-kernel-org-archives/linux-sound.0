Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146961FE0EB
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496249; cv=none; b=ME0mujOGstLCldrBVoAtA1NfzHL25E5IQSmBa47n/o8G1ufmoUphvrmJTh/o7rOfMSo5EU8HFSYpgV8XvJsHdHDAkHacqQgD+8j0yJYTCPEjS/Epp2osHMbobUdlYe+peD7NM298ip9grOR/Zg26QApDTNuHhwkVu0d7IDMeTHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496249; c=relaxed/simple;
	bh=z9c4ZlwpR5IpFOyWCXbKrN2DtHZVam5uRc1k0BDl8PM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aw/21hcZuocRmkGPk1sIHaXa7DtC7v7NiuMJl319iT9uG15kyO+KadvDEd8DWDi2O5Mkblv4XMTfrEvUBscIRY+bvlqL62IfFSVW1wkzDtBvgGIH2Kbhylp9+1OiC4ilvrcKCCBgsMXDlLRENccq2wQFHHLDSMApcLIk8J7+MsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GLSLZqom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nA6cPbNL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GLSLZqom; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nA6cPbNL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GLSLZqom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nA6cPbNL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GLSLZqom";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nA6cPbNL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 714AC1F399;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9iHD7ZRv80KBf28sc2u8+9NwHpQZ1EMb6WNtgk5dFY=;
	b=GLSLZqomfe3Q62193yKETzM+U+37aKo7ITyG13vCK2vx9TnaBy2DYx1IAfVLuqYmRbm9cS
	BQxhQY67tihE9+xTCPKr7CfAimvj6BAqNzALkD/+T6zwY5PZeMcT6S7BaLlUddXiUu5zmc
	S3DZLxWP6sJwL6peDUOXZg2MIpMfycs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9iHD7ZRv80KBf28sc2u8+9NwHpQZ1EMb6WNtgk5dFY=;
	b=nA6cPbNLMkBIfLp2yafZ8MUl1gUVn3ZgNDOYhOqxDMzNW1icpN2IewHz7Yi1VeE2ft12Hz
	ms4CPLPegIn35kBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GLSLZqom;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nA6cPbNL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9iHD7ZRv80KBf28sc2u8+9NwHpQZ1EMb6WNtgk5dFY=;
	b=GLSLZqomfe3Q62193yKETzM+U+37aKo7ITyG13vCK2vx9TnaBy2DYx1IAfVLuqYmRbm9cS
	BQxhQY67tihE9+xTCPKr7CfAimvj6BAqNzALkD/+T6zwY5PZeMcT6S7BaLlUddXiUu5zmc
	S3DZLxWP6sJwL6peDUOXZg2MIpMfycs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L9iHD7ZRv80KBf28sc2u8+9NwHpQZ1EMb6WNtgk5dFY=;
	b=nA6cPbNLMkBIfLp2yafZ8MUl1gUVn3ZgNDOYhOqxDMzNW1icpN2IewHz7Yi1VeE2ft12Hz
	ms4CPLPegIn35kBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52B8813AE6;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHr2EjaJNGe3UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 11:10:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/5] ALSA: us122l: Drop mmap_count field
Date: Wed, 13 Nov 2024 12:10:37 +0100
Message-ID: <20241113111042.15058-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113111042.15058-1-tiwai@suse.de>
References: <20241113111042.15058-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 714AC1F399
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

us122l.mmap_count field was used for counting the hwdep mmap opens and
syncing at disconnection.  But such a manual sync isn't needed, as the
refcount check is done in the ALSA core side.  So let's drop it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/us122l.c | 16 ----------------
 sound/usb/usx2y/us122l.h |  2 --
 2 files changed, 18 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index ca5fac03ec79..6bcf8b859ebb 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -89,13 +89,6 @@ static void pt_info_set(struct usb_device *dev, u8 v)
 			     v, 0, NULL, 0, 1000, GFP_NOIO);
 }
 
-static void usb_stream_hwdep_vm_open(struct vm_area_struct *area)
-{
-	struct us122l *us122l = area->vm_private_data;
-
-	atomic_inc(&us122l->mmap_count);
-}
-
 static vm_fault_t usb_stream_hwdep_vm_fault(struct vm_fault *vmf)
 {
 	unsigned long offset;
@@ -132,17 +125,9 @@ static vm_fault_t usb_stream_hwdep_vm_fault(struct vm_fault *vmf)
 	return VM_FAULT_SIGBUS;
 }
 
-static void usb_stream_hwdep_vm_close(struct vm_area_struct *area)
-{
-	struct us122l *us122l = area->vm_private_data;
-
-	atomic_dec(&us122l->mmap_count);
-}
 
 static const struct vm_operations_struct usb_stream_hwdep_vm_ops = {
-	.open = usb_stream_hwdep_vm_open,
 	.fault = usb_stream_hwdep_vm_fault,
-	.close = usb_stream_hwdep_vm_close,
 };
 
 static int usb_stream_hwdep_open(struct snd_hwdep *hw, struct file *file)
@@ -218,7 +203,6 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
 	if (!read)
 		vm_flags_set(area, VM_DONTEXPAND);
 	area->vm_private_data = us122l;
-	atomic_inc(&us122l->mmap_count);
 out:
 	mutex_unlock(&us122l->mutex);
 	return err;
diff --git a/sound/usb/usx2y/us122l.h b/sound/usb/usx2y/us122l.h
index c32ae5e981e9..8e59b78d3514 100644
--- a/sound/usb/usx2y/us122l.h
+++ b/sound/usb/usx2y/us122l.h
@@ -16,8 +16,6 @@ struct us122l {
 	struct file		*slave;
 	struct list_head	midi_list;
 
-	atomic_t		mmap_count;
-
 	bool			is_us144;
 };
 
-- 
2.43.0

