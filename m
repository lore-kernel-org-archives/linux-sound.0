Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B32130E2B
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024007; cv=none; b=SrQOs3QoqEb9dyASRMTGcsiQGmO+tfiXDI712r2m4q6rO0mi7gvGs2R+/8OOs836u96biJejq2LuB6bz+KZCVvf/2nxt6EBAXi4CMHP4txYVXhsJbD4dF8TCZDAVPAYD0HRNqLZrXfk1n4XhLZ0/gyFMf/o4+XdCXt14UTnEhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024007; c=relaxed/simple;
	bh=iVbsxpUnf2B/8Be4+eRwSrf6X5dXHMJ/eVjotKOwxeI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EhDfttqHjcLnViQuyWH2v7xmghoO6Z3cpFuVowxtZjKGKnRMCY/aC4RzDnS6EUO/fl4mRvSrSCVVW2BZ0scerRAz5ZkKBkvOzoJ/GPDIj4wkx1YQiFa7LMqdhb1K55OGVuJI79MtAp1d29uRxKwD8OKF7LSMjwBAF37myMiBQVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YUgL5ucx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8hFtvwmR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YUgL5ucx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8hFtvwmR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YUgL5ucx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8hFtvwmR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YUgL5ucx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8hFtvwmR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 246D522785;
	Tue, 27 Feb 2024 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=YUgL5ucxzLilmLzuNN+a4MwLL07gSPcgCRUBgJAubZBStJ0NZwGV6TcVE3j8iDYajMygzq
	dcjVWPu+Gguk6IBBZDasAVyrSF3Aa788t8WU48OWyMJ9/7G3lv6CvhIKQnKQvRIjT9GHui
	xkIqUCLl9tVK00HyoBavbs5S0tE7Y4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=8hFtvwmRyHa+DkBdm62CIw1TFHWTmXhQ0mgIRr3PPT+n8qWyqs3nQ9SN8EmOwKYQfbPy/C
	ELRqj7nF8kE2y+Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=YUgL5ucxzLilmLzuNN+a4MwLL07gSPcgCRUBgJAubZBStJ0NZwGV6TcVE3j8iDYajMygzq
	dcjVWPu+Gguk6IBBZDasAVyrSF3Aa788t8WU48OWyMJ9/7G3lv6CvhIKQnKQvRIjT9GHui
	xkIqUCLl9tVK00HyoBavbs5S0tE7Y4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023997;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmUAO9wCR0kmDV9eSbdyS30Vznsz9ef5C+U+jYbZzII=;
	b=8hFtvwmRyHa+DkBdm62CIw1TFHWTmXhQ0mgIRr3PPT+n8qWyqs3nQ9SN8EmOwKYQfbPy/C
	ELRqj7nF8kE2y+Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BB1A13AD8;
	Tue, 27 Feb 2024 08:53:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EHioAf2i3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 23/24] ALSA: pcm: oss: Use guard() for setup
Date: Tue, 27 Feb 2024 09:53:05 +0100
Message-Id: <20240227085306.9764-24-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240227085306.9764-1-tiwai@suse.de>
References: <20240227085306.9764-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ******
X-Spam-Score: 6.51
X-Spamd-Result: default: False [6.51 / 50.00];
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
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 NEURAL_SPAM_SHORT(2.61)[0.870];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[28.88%]
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

