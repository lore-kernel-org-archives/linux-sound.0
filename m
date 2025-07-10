Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7D82D781F
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142428; cv=none; b=Ukylzm1tjwX7sLEVud6PSM4zn4gXl4iy3/6WsdqUcPhGhBKBNDs7/ql6e/sOiIIk8p6Yj6BQ7FVKWDeiJkLs+8BYOv/eJJOjXBaTGJOBqU2pyY8gJOEr/0Z8cothHiFlTKC5MPNjSCiBZ6lbzVUzebF4ToSbWN852AZZSFZLhOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142428; c=relaxed/simple;
	bh=uFsp9Dd1ogPPd99lgw9/lY0e5KHzmyWVrmdJQN+oEQI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFD5ZoBNnPpEPo2tpjnf5uVhRKT5BlzP5KAe3KKXMyIASFGw/9rW5rZ/W77VLUr1hCc6qNfiEsyS3EV2N6FEiPjq+O9CvVWLdYqluXCvQ5c9q6N1ME97LstW0yA3MEQc6sVCY8KMmWSRL0lABMVCcSvwNfujZ21ocs+juMePD5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sr996lRw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KhL8VMSO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sr996lRw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KhL8VMSO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sr996lRw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KhL8VMSO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sr996lRw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KhL8VMSO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5AEE1211CA;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiuSaot/REHdMxRG/RfgPmcKojU+kAjKFFbWipKAXHA=;
	b=Sr996lRwLkDYcwccFi2c+LaG7it1ROScI+USKv3vuSZ3jNYU2G7TnHZX/TieJZSn62VixE
	gn92MUpxOuFIhzAaDghQWCABvTGZ7NM/SjPdYnziWnfi1Yftlbl2Lv/9Io4F0T8jZ1MVfL
	yG2qNxuCn6Ly4mjyj7Ss9xrurelCR64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiuSaot/REHdMxRG/RfgPmcKojU+kAjKFFbWipKAXHA=;
	b=KhL8VMSOv68mEYgANefT13X5Gscw2RapHFzceZprG2PCm6/7tJGvyu/kEqcp4L6ioZZJ9H
	pW+n9EB1+RJarCDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Sr996lRw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KhL8VMSO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiuSaot/REHdMxRG/RfgPmcKojU+kAjKFFbWipKAXHA=;
	b=Sr996lRwLkDYcwccFi2c+LaG7it1ROScI+USKv3vuSZ3jNYU2G7TnHZX/TieJZSn62VixE
	gn92MUpxOuFIhzAaDghQWCABvTGZ7NM/SjPdYnziWnfi1Yftlbl2Lv/9Io4F0T8jZ1MVfL
	yG2qNxuCn6Ly4mjyj7Ss9xrurelCR64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XiuSaot/REHdMxRG/RfgPmcKojU+kAjKFFbWipKAXHA=;
	b=KhL8VMSOv68mEYgANefT13X5Gscw2RapHFzceZprG2PCm6/7tJGvyu/kEqcp4L6ioZZJ9H
	pW+n9EB1+RJarCDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BD02136DC;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eMxdDfaQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 100/103] ALSA: ac97: Copy string more safely
Date: Thu, 10 Jul 2025 12:07:22 +0200
Message-ID: <20250710100727.22653-101-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 5AEE1211CA
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

snd_ac97_get_name() blindly assumes that the name buffer is large
enough, but we should be more careful.  Pass the max buffer length and
allow trimming to the size.

Only a cosmetic safety matter, no functional changes intended.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_codec.c | 19 +++++++++++--------
 sound/pci/ac97/ac97_local.h |  2 +-
 sound/pci/ac97/ac97_proc.c  |  2 +-
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
index 588c094080be..cd60c856a92e 100644
--- a/sound/pci/ac97/ac97_codec.c
+++ b/sound/pci/ac97/ac97_codec.c
@@ -1840,7 +1840,8 @@ static const struct ac97_codec_id *look_for_codec_id(const struct ac97_codec_id
 	return NULL;
 }
 
-void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name, int modem)
+void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name,
+		       size_t maxlen, int modem)
 {
 	const struct ac97_codec_id *pid;
 
@@ -1852,7 +1853,7 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name, int m
 	if (! pid)
 		return;
 
-	strcpy(name, pid->name);
+	strscpy(name, pid->name, maxlen);
 	if (ac97 && pid->patch) {
 		if ((modem && (pid->flags & AC97_MODEM_PATCH)) ||
 		    (! modem && ! (pid->flags & AC97_MODEM_PATCH)))
@@ -1861,8 +1862,8 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name, int m
 
 	pid = look_for_codec_id(snd_ac97_codec_ids, id);
 	if (pid) {
-		strcat(name, " ");
-		strcat(name, pid->name);
+		strlcat(name, " ", maxlen);
+		strlcat(name, pid->name, maxlen);
 		if (pid->mask != 0xffffffff)
 			sprintf(name + strlen(name), " rev %u", id & ~pid->mask);
 		if (ac97 && pid->patch) {
@@ -1870,8 +1871,10 @@ void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name, int m
 			    (! modem && ! (pid->flags & AC97_MODEM_PATCH)))
 				pid->patch(ac97);
 		}
-	} else
-		sprintf(name + strlen(name), " id %x", id & 0xff);
+	} else {
+		int l = strlen(name);
+		snprintf(name + l, maxlen - l, " id %x", id & 0xff);
+	}
 }
 
 /**
@@ -2295,8 +2298,8 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
 	/* additional initializations */
 	if (bus->ops->init)
 		bus->ops->init(ac97);
-	snd_ac97_get_name(ac97, ac97->id, name, !ac97_is_audio(ac97));
-	snd_ac97_get_name(NULL, ac97->id, name, !ac97_is_audio(ac97));  // ac97->id might be changed in the special setup code
+	snd_ac97_get_name(ac97, ac97->id, name, sizeof(name), !ac97_is_audio(ac97));
+	snd_ac97_get_name(NULL, ac97->id, name, sizeof(name), !ac97_is_audio(ac97));  // ac97->id might be changed in the special setup code
 	if (! ac97->build_ops)
 		ac97->build_ops = &null_build_ops;
 
diff --git a/sound/pci/ac97/ac97_local.h b/sound/pci/ac97/ac97_local.h
index 8eeae2dec552..965284eb4b33 100644
--- a/sound/pci/ac97/ac97_local.h
+++ b/sound/pci/ac97/ac97_local.h
@@ -8,7 +8,7 @@
  */
 
 void snd_ac97_get_name(struct snd_ac97 *ac97, unsigned int id, char *name,
-		       int modem);
+		       size_t maxlen, int modem);
 int snd_ac97_update_bits_nolock(struct snd_ac97 *ac97, unsigned short reg,
 				unsigned short mask, unsigned short value);
 
diff --git a/sound/pci/ac97/ac97_proc.c b/sound/pci/ac97/ac97_proc.c
index 518834964b7b..2df3ba9a08dc 100644
--- a/sound/pci/ac97/ac97_proc.c
+++ b/sound/pci/ac97/ac97_proc.c
@@ -98,7 +98,7 @@ static void snd_ac97_proc_read_main(struct snd_ac97 *ac97, struct snd_info_buffe
 	static const char *spdif_rates_cs4205[4] = { " Rate=48kHz", " Rate=44.1kHz", " Rate=res", " Rate=res" };
 	static const char *double_rate_slots[4] = { "10/11", "7/8", "reserved", "reserved" };
 
-	snd_ac97_get_name(NULL, ac97->id, name, 0);
+	snd_ac97_get_name(NULL, ac97->id, name, sizeof(name), 0);
 	snd_iprintf(buffer, "%d-%d/%d: %s\n\n", ac97->addr, ac97->num, subidx, name);
 
 	if ((ac97->scaps & AC97_SCAP_AUDIO) == 0)
-- 
2.50.0

