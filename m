Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5078135A5A
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024007; cv=none; b=j/+M5hYXQGm+MYxDZ2u/ziXS26Na/x9DIRBt59XoHqryEcaFyql7Gdw8182uHZV9VagmPwtdR5b3bs+zvNSdj4hQPhhtLRyzqBuB9lrNXVg1Th087Kw2Su13OTubdkURAdJlZzZ6U7roFpaOq6kGr6PicZS6bK13fQLKal3JVW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024007; c=relaxed/simple;
	bh=L3Z6tFZWH/11EnKGcD80oUidpfbs8ozwJPif2MFq82w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qK+QIsrJWNVw/JFXZ/dvOnGHXHLXEqZjxOFuIlYitkT4q6H8+iLpbnmXoqfAAV6/4u1Pt1UCdS0d2JQj2fIQb/uKG61cM5kTt8YMtrsYIiSjesa8nuc5opmFgBYKMKWv+AXU7ieTkFXmx1kdtNRH7qqKt0a2OBJxg/TrYl7ANpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LQeBwTPm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lcsG+Qqm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LQeBwTPm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lcsG+Qqm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LQeBwTPm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lcsG+Qqm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LQeBwTPm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lcsG+Qqm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A03E422783;
	Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yDggWGYSo1B6qJHvxDJ8RSVsB9I+nuYnA/S+jhaUPA=;
	b=LQeBwTPmVGzilHfElT+gVrTenyXOGqQqXZHmQJiIp0XwmX98tgd3ksdBx7R1NuF1+779py
	uig6Zl9Fgh9lL+rQaYf3V5sHkX5Dgp6a1KVIwHWAhtR4gvvNYsuslfLJc6pH3jS24YctwS
	ToHg4uf3woyjyCCu3lTa3YeyztF+L8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yDggWGYSo1B6qJHvxDJ8RSVsB9I+nuYnA/S+jhaUPA=;
	b=lcsG+QqmxKjuKeEuJVjVJrIsLRmeBNnYBYnjuReZpbyER7q+HSnWi3T6lr41bP5LdnBUSM
	K25i3IHlGkZSUeDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yDggWGYSo1B6qJHvxDJ8RSVsB9I+nuYnA/S+jhaUPA=;
	b=LQeBwTPmVGzilHfElT+gVrTenyXOGqQqXZHmQJiIp0XwmX98tgd3ksdBx7R1NuF1+779py
	uig6Zl9Fgh9lL+rQaYf3V5sHkX5Dgp6a1KVIwHWAhtR4gvvNYsuslfLJc6pH3jS24YctwS
	ToHg4uf3woyjyCCu3lTa3YeyztF+L8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yDggWGYSo1B6qJHvxDJ8RSVsB9I+nuYnA/S+jhaUPA=;
	b=lcsG+QqmxKjuKeEuJVjVJrIsLRmeBNnYBYnjuReZpbyER7q+HSnWi3T6lr41bP5LdnBUSM
	K25i3IHlGkZSUeDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87B0A13AD7;
	Tue, 27 Feb 2024 08:53:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2LzrH/yi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 19/24] ALSA: seq: virmidi: Use guard() for locking
Date: Tue, 27 Feb 2024 09:53:01 +0100
Message-Id: <20240227085306.9764-20-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LQeBwTPm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lcsG+Qqm
X-Spamd-Result: default: False [1.88 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
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
	 BAYES_HAM(-2.81)[99.16%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.88
X-Rspamd-Queue-Id: A03E422783
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Bar: +

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_virmidi.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 35f93b43dd2a..b4672613c261 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -199,11 +199,10 @@ static int snd_virmidi_input_open(struct snd_rawmidi_substream *substream)
 	vmidi->client = rdev->client;
 	vmidi->port = rdev->port;	
 	runtime->private_data = vmidi;
-	down_write(&rdev->filelist_sem);
-	write_lock_irq(&rdev->filelist_lock);
-	list_add_tail(&vmidi->list, &rdev->filelist);
-	write_unlock_irq(&rdev->filelist_lock);
-	up_write(&rdev->filelist_sem);
+	scoped_guard(rwsem_write, &rdev->filelist_sem) {
+		guard(write_lock_irq)(&rdev->filelist_lock);
+		list_add_tail(&vmidi->list, &rdev->filelist);
+	}
 	vmidi->rdev = rdev;
 	return 0;
 }
@@ -243,11 +242,10 @@ static int snd_virmidi_input_close(struct snd_rawmidi_substream *substream)
 	struct snd_virmidi_dev *rdev = substream->rmidi->private_data;
 	struct snd_virmidi *vmidi = substream->runtime->private_data;
 
-	down_write(&rdev->filelist_sem);
-	write_lock_irq(&rdev->filelist_lock);
-	list_del(&vmidi->list);
-	write_unlock_irq(&rdev->filelist_lock);
-	up_write(&rdev->filelist_sem);
+	scoped_guard(rwsem_write, &rdev->filelist_sem) {
+		guard(write_lock_irq)(&rdev->filelist_lock);
+		list_del(&vmidi->list);
+	}
 	snd_midi_event_free(vmidi->parser);
 	substream->runtime->private_data = NULL;
 	kfree(vmidi);
-- 
2.35.3

