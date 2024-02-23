Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FCE140371
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710619; cv=none; b=kOYTQNzOHLUaXlaJeCHrF5IpTTTs7Qudn1CsaHMCJcnXIiF/vUA4wbJyfCjg4jcGcHdVxz59bAd/u7Yf9GA0eXxzRzyh//kuBvFh1gcYxfbVxMPTY7Ml4PogFTKgGi9yV23By/gRnVv9/uq68fsQ7bfzLPU8M1MjG8iJDeqZrwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710619; c=relaxed/simple;
	bh=iVbsxpUnf2B/8Be4+eRwSrf6X5dXHMJ/eVjotKOwxeI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VhOo3vG4GUSz9XBiCPkuvS/dBCnfWTAPLgMxUAmRlxoxCGVkZEMe+tFCFLkJ0NIDlIMJIQfoFubgGfXbgYDvfx7bP/1wpzdL0acZ2DzZvLAbaoL0S8E+aOtUVzPYO5Dp5+dWX+neeurNR0cvdqhpb4tl/E7yGeqCz98T9sf/MtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w8ZT6lh8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y/nmjz7U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w8ZT6lh8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y/nmjz7U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w8ZT6lh8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y/nmjz7U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w8ZT6lh8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y/nmjz7U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6EBB5221D9;
	Fri, 23 Feb 2024 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=w8ZT6lh8I6mogCdlENvlE3+V+EnGrjvp5YRLNdkjNMm0ZFYFXj6zYSUkyqjNa/kbXZA3rA
	JE35yNYI6KUiHmTS+b33KryECYE79R7gnvVvgf0XBSLE168Qpn1wHzXX6fl7IVuLFFAkSq
	1ZYtvMO0g4Ht3yqIUOmKehlieKbbDo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=Y/nmjz7UGIXsMTo88ldfWg//9JiWGO9szG9HkxV/sRfor8CZ07izRDTJLkva48pB8fOWMv
	GaJcbfebOk6t3HAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=w8ZT6lh8I6mogCdlENvlE3+V+EnGrjvp5YRLNdkjNMm0ZFYFXj6zYSUkyqjNa/kbXZA3rA
	JE35yNYI6KUiHmTS+b33KryECYE79R7gnvVvgf0XBSLE168Qpn1wHzXX6fl7IVuLFFAkSq
	1ZYtvMO0g4Ht3yqIUOmKehlieKbbDo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710614;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=Y/nmjz7UGIXsMTo88ldfWg//9JiWGO9szG9HkxV/sRfor8CZ07izRDTJLkva48pB8fOWMv
	GaJcbfebOk6t3HAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B94013AC7;
	Fri, 23 Feb 2024 17:50:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UJv0ENba2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 23/24] ALSA: pcm: oss: Use guard() for setup
Date: Fri, 23 Feb 2024 18:50:00 +0100
Message-Id: <20240223175001.24375-24-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223175001.24375-1-tiwai@suse.de>
References: <20240223175001.24375-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[34.49%]
X-Spam-Flag: NO

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

