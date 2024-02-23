Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091CF84FB4
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705706; cv=none; b=ZiOS+ET8Pr/OZzXcSI/HhHf9XVK+MIAbyWZRqBa3Q4mYOlbVmzS4uLGhJytWxJKJhWk106jaNCWSHNJNELSwIPZx1FJ3WSxyKgOJ3idL7aYzgx+7bs+KiwKTgzlhXchSTQcQJq7csZ0KtA0as1FeIYCET9m4WfjGe37EzLalzs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705706; c=relaxed/simple;
	bh=iVbsxpUnf2B/8Be4+eRwSrf6X5dXHMJ/eVjotKOwxeI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=isIPg1zUjWYkr45Gx+AxDRE6mYslBup9AR9phDWoWHVv4TMciavSx2V5ikkSU8F1KuC1P5JWfNR948YcPuSRv0H1co7Fo1NuvtV993zIF9U3pIkG4NwF8z9k0cjr/kyy9Q64ArJXDLauN51ToEsyGQcCf+M5pqYVCuqgUyoiZLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uR2b5jTo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4rQCRlTG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uR2b5jTo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4rQCRlTG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uR2b5jTo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4rQCRlTG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uR2b5jTo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4rQCRlTG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7D2022184;
	Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=uR2b5jToXKWMrjl0Ck4AZbgLRNeY0tsUEpXklpElINiZFvkuyz5NDn27G56akX2t3rJhPm
	UVi+jtiOnJD5dnu7eI+zzLOHBEHXJqHYNj003PPYkSBkIU7ZULRuHWPBl1YJsplSaooiRA
	77tviM+0+CJ+xlvk45zf4ow0U/Q/94Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=4rQCRlTGAj7nc6X5AFC7UM2EnnczI42EqASz60VwJS3IDE+fllymXydGcJqoKlSiUqSo8f
	NpNtUTzSme+7sOAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=uR2b5jToXKWMrjl0Ck4AZbgLRNeY0tsUEpXklpElINiZFvkuyz5NDn27G56akX2t3rJhPm
	UVi+jtiOnJD5dnu7eI+zzLOHBEHXJqHYNj003PPYkSBkIU7ZULRuHWPBl1YJsplSaooiRA
	77tviM+0+CJ+xlvk45zf4ow0U/Q/94Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=4rQCRlTGAj7nc6X5AFC7UM2EnnczI42EqASz60VwJS3IDE+fllymXydGcJqoKlSiUqSo8f
	NpNtUTzSme+7sOAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC66C13ACD;
	Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IPmpKKXH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 23/24] ALSA: pcm: oss: Use guard() for setup
Date: Fri, 23 Feb 2024 17:28:09 +0100
Message-Id: <20240223162810.32302-24-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223162810.32302-1-tiwai@suse.de>
References: <20240223162810.32302-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uR2b5jTo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4rQCRlTG
X-Spamd-Result: default: False [2.68 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[46.04%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.68
X-Rspamd-Queue-Id: C7D2022184
X-Spam-Level: **
X-Spam-Flag: NO
X-Spamd-Bar: ++

The setup_mutex in PCM oss code can be simplified with guard().
(params_lock is tough and not trivial to covert, though.)

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 49ea092e90f9..7386982cf40e 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2333,7 +2333,7 @@ static void snd_pcm_oss_look_for_setup(struct snd_pcm *pcm, int stream,
 {
 	struct snd_pcm_oss_setup *setup;
 
-	mutex_lock(&pcm->streams[stream].oss.setup_mutex);
+	guard(mutex)(&pcm->streams[stream].oss.setup_mutex);
 	do {
 		for (setup = pcm->streams[stream].oss.setup_list; setup;
 		     setup = setup->next) {
@@ -2344,7 +2344,6 @@ static void snd_pcm_oss_look_for_setup(struct snd_pcm *pcm, int stream,
  out:
 	if (setup)
 		*rsetup = *setup;
-	mutex_unlock(&pcm->streams[stream].oss.setup_mutex);
 }
 
 static void snd_pcm_oss_release_substream(struct snd_pcm_substream *substream)
@@ -2950,7 +2949,7 @@ static void snd_pcm_oss_proc_read(struct snd_info_entry *entry,
 {
 	struct snd_pcm_str *pstr = entry->private_data;
 	struct snd_pcm_oss_setup *setup = pstr->oss.setup_list;
-	mutex_lock(&pstr->oss.setup_mutex);
+	guard(mutex)(&pstr->oss.setup_mutex);
 	while (setup) {
 		snd_iprintf(buffer, "%s %u %u%s%s%s%s%s%s\n",
 			    setup->task_name,
@@ -2964,7 +2963,6 @@ static void snd_pcm_oss_proc_read(struct snd_info_entry *entry,
 			    setup->nosilence ? " no-silence" : "");
 		setup = setup->next;
 	}
-	mutex_unlock(&pstr->oss.setup_mutex);
 }
 
 static void snd_pcm_oss_proc_free_setup_list(struct snd_pcm_str * pstr)
@@ -2990,12 +2988,11 @@ static void snd_pcm_oss_proc_write(struct snd_info_entry *entry,
 	struct snd_pcm_oss_setup *setup, *setup1, template;
 
 	while (!snd_info_get_line(buffer, line, sizeof(line))) {
-		mutex_lock(&pstr->oss.setup_mutex);
+		guard(mutex)(&pstr->oss.setup_mutex);
 		memset(&template, 0, sizeof(template));
 		ptr = snd_info_get_str(task_name, line, sizeof(task_name));
 		if (!strcmp(task_name, "clear") || !strcmp(task_name, "erase")) {
 			snd_pcm_oss_proc_free_setup_list(pstr);
-			mutex_unlock(&pstr->oss.setup_mutex);
 			continue;
 		}
 		for (setup = pstr->oss.setup_list; setup; setup = setup->next) {
@@ -3035,7 +3032,6 @@ static void snd_pcm_oss_proc_write(struct snd_info_entry *entry,
 			setup = kmalloc(sizeof(*setup), GFP_KERNEL);
 			if (! setup) {
 				buffer->error = -ENOMEM;
-				mutex_unlock(&pstr->oss.setup_mutex);
 				return;
 			}
 			if (pstr->oss.setup_list == NULL)
@@ -3049,12 +3045,10 @@ static void snd_pcm_oss_proc_write(struct snd_info_entry *entry,
 			if (! template.task_name) {
 				kfree(setup);
 				buffer->error = -ENOMEM;
-				mutex_unlock(&pstr->oss.setup_mutex);
 				return;
 			}
 		}
 		*setup = template;
-		mutex_unlock(&pstr->oss.setup_mutex);
 	}
 }
 
-- 
2.35.3

