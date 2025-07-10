Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6CB2D5A16
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142212; cv=none; b=BAxGB/phKvApjKNwTWeeFuFnWivIACrSoXtvf+yhdxbusw/6uni59XluSF+4aai6f5My5pspp9cnUrFjpVkpBKYwBS6cCL7SeqqWzG7zMsONusIOBiuODjsanepBjfv8eiQVvG+UtdASZsbV2s/o0oTwLXC7EEmn/BbZ3qIxzh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142212; c=relaxed/simple;
	bh=FM5wmZEQot8oCb48PusnQcrj1refiEn+rHmyZt2ppGU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MC0nAYBE/OmuxZPZqeZjRQhsVuNQcU2QJ20df6e06a2IykpUwFcVt47B/YXXMltDliV+wY+0ombiGqkz+uPZb1haw6lWDqzHaGiWfIZ+FVEmrj4z+Sr8meUOuJB4LLqh+/VTahPmJNCOHz1FJ0dDPfgH1V38x0nMUe7h6x8OkDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hspc13Bj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8xeoM/SR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hspc13Bj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8xeoM/SR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hspc13Bj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8xeoM/SR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hspc13Bj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8xeoM/SR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 748F021196;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htXBC2i6TRgckCiRDoygf0oa/t2Z3p3lNLm+ZFc5zkY=;
	b=Hspc13BjLeEzqWUG1XyZkzVtS95qcH+vr95xgf6afAB+uhAhYxbxqAcu+Fx2K9PJOCKVXO
	DzGCdWnD0uG+/XmtoJu2lZia8tSxSmXwPPerZGCuLpZ2CqPjbGMtiaWmaNxn3dblN2sDbZ
	vYPOzwaF4v8/T0u74EQEGpQ1s6WZJWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htXBC2i6TRgckCiRDoygf0oa/t2Z3p3lNLm+ZFc5zkY=;
	b=8xeoM/SROlVbPZfY3DtpPUfWVGuYDMlpuCeGENaJs9sXAIMo+tpwf0wVl5D9muZIPSocpA
	ysHvk0ygoSFI9GDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hspc13Bj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="8xeoM/SR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htXBC2i6TRgckCiRDoygf0oa/t2Z3p3lNLm+ZFc5zkY=;
	b=Hspc13BjLeEzqWUG1XyZkzVtS95qcH+vr95xgf6afAB+uhAhYxbxqAcu+Fx2K9PJOCKVXO
	DzGCdWnD0uG+/XmtoJu2lZia8tSxSmXwPPerZGCuLpZ2CqPjbGMtiaWmaNxn3dblN2sDbZ
	vYPOzwaF4v8/T0u74EQEGpQ1s6WZJWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htXBC2i6TRgckCiRDoygf0oa/t2Z3p3lNLm+ZFc5zkY=;
	b=8xeoM/SROlVbPZfY3DtpPUfWVGuYDMlpuCeGENaJs9sXAIMo+tpwf0wVl5D9muZIPSocpA
	ysHvk0ygoSFI9GDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C06613A70;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AN5XFe2Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 035/103] ALSA: sc6000: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:17 +0200
Message-ID: <20250710100727.22653-36-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 748F021196
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sc6000.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index 3115c32b4061..6d618cc2ba45 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -469,24 +469,24 @@ static int snd_sc6000_mixer(struct snd_wss *chip)
 	id1.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	id2.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	/* reassign AUX0 to FM */
-	strcpy(id1.name, "Aux Playback Switch");
-	strcpy(id2.name, "FM Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch");
+	strscpy(id2.name, "FM Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
-	strcpy(id1.name, "Aux Playback Volume");
-	strcpy(id2.name, "FM Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
+	strscpy(id2.name, "FM Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
 	/* reassign AUX1 to CD */
-	strcpy(id1.name, "Aux Playback Switch"); id1.index = 1;
-	strcpy(id2.name, "CD Playback Switch");
+	strscpy(id1.name, "Aux Playback Switch"); id1.index = 1;
+	strscpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
-	strcpy(id1.name, "Aux Playback Volume");
-	strcpy(id2.name, "CD Playback Volume");
+	strscpy(id1.name, "Aux Playback Volume");
+	strscpy(id2.name, "CD Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0)
 		return err;
@@ -652,8 +652,8 @@ static int __snd_sc6000_probe(struct device *devptr, unsigned int dev)
 				mpu_port[dev]);
 	}
 
-	strcpy(card->driver, DRV_NAME);
-	strcpy(card->shortname, "SC-6000");
+	strscpy(card->driver, DRV_NAME);
+	strscpy(card->shortname, "SC-6000");
 	sprintf(card->longname, "Gallant SC-6000 at 0x%lx, irq %d, dma %d",
 		mss_port[dev], xirq, xdma);
 
-- 
2.50.0

