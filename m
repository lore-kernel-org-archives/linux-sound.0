Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465B2D6612
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142415; cv=none; b=l3LGDll8xcXj0834740qAOuXlM7S8CqVHtrcZpCpmfhXQQonHBNqeGI9wmZIqiKEOkiGLcQNA3pNKaDTjULEFJDTBzF+qfOazqApdjkbDMGJ1TgDG3WDO5aSgk+nW2HqZDDt3ptQKb2CJDsW14251qJK4/pmoMlWBhNmlUpnSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142415; c=relaxed/simple;
	bh=qu70E7NGAUlprp6eaWjkdl6NaDx2XvD2EKVerdM1HCg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQs7qtBWgFyrUeMrdrexdICtAfNUSn1u5303JePaBayNtSEv1LnMpH7den/YtAy1q3wtnn948qReU184OIZLop5hjpkuB+k/t7VT1iH2cclnuXNgdlLW2KJQbcyjjb49mRAgmPZfr/vlvcrPa4HQFHKhMwWzC1oJrZ1q5JFguO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BhNH3d7p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cGnqEpdu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BhNH3d7p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cGnqEpdu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BhNH3d7p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cGnqEpdu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BhNH3d7p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cGnqEpdu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 15E5F211BA;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1tPmsJGOL6DTJDIY0JfdDFO5kZREHPV4Am8nzmYvlo=;
	b=BhNH3d7p1CFCSBrn5ixC/sSeqnw9C3F8MpYblk+2jGy6QXJviPcL/AG0aiZnhB02Lx28LZ
	BWKIMxiEtwICpEVi8j2RkoS8V2+S0p/d5KFy0bQfYWTwfGDBnSDz0VgKQEbw8GARneU5n0
	UmaMLKslg8AcoVsCE60ZBdZMAJu0HnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1tPmsJGOL6DTJDIY0JfdDFO5kZREHPV4Am8nzmYvlo=;
	b=cGnqEpdugN8KZTlzRWZn4GId1D5O79mdYILECYGaw8TFbAuxCb5Fhc8XgdrV+1X/Mm9hfd
	/iQZoIB3IT8gc0Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BhNH3d7p;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cGnqEpdu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1tPmsJGOL6DTJDIY0JfdDFO5kZREHPV4Am8nzmYvlo=;
	b=BhNH3d7p1CFCSBrn5ixC/sSeqnw9C3F8MpYblk+2jGy6QXJviPcL/AG0aiZnhB02Lx28LZ
	BWKIMxiEtwICpEVi8j2RkoS8V2+S0p/d5KFy0bQfYWTwfGDBnSDz0VgKQEbw8GARneU5n0
	UmaMLKslg8AcoVsCE60ZBdZMAJu0HnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1tPmsJGOL6DTJDIY0JfdDFO5kZREHPV4Am8nzmYvlo=;
	b=cGnqEpdugN8KZTlzRWZn4GId1D5O79mdYILECYGaw8TFbAuxCb5Fhc8XgdrV+1X/Mm9hfd
	/iQZoIB3IT8gc0Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F03EC136DC;
	Thu, 10 Jul 2025 10:07:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QO1SOfWQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 098/103] ALSA: ua101: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:07:20 +0200
Message-ID: <20250710100727.22653-99-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 15E5F211BA
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
 sound/usb/misc/ua101.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index 4f6b20ed29dd..e200e4af799c 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -1246,8 +1246,8 @@ static int ua101_probe(struct usb_interface *interface,
 		goto probe_error;
 
 	name = usb_id->idProduct == 0x0044 ? "UA-1000" : "UA-101";
-	strcpy(card->driver, "UA-101");
-	strcpy(card->shortname, name);
+	strscpy(card->driver, "UA-101");
+	strscpy(card->shortname, name);
 	usb_make_path(ua->dev, usb_path, sizeof(usb_path));
 	snprintf(ua->card->longname, sizeof(ua->card->longname),
 		 "EDIROL %s (serial %s), %u Hz at %s, %s speed", name,
@@ -1272,7 +1272,7 @@ static int ua101_probe(struct usb_interface *interface,
 	if (err < 0)
 		goto probe_error;
 	ua->pcm->private_data = ua;
-	strcpy(ua->pcm->name, name);
+	strscpy(ua->pcm->name, name);
 	snd_pcm_set_ops(ua->pcm, SNDRV_PCM_STREAM_PLAYBACK, &playback_pcm_ops);
 	snd_pcm_set_ops(ua->pcm, SNDRV_PCM_STREAM_CAPTURE, &capture_pcm_ops);
 	snd_pcm_set_managed_buffer_all(ua->pcm, SNDRV_DMA_TYPE_VMALLOC,
-- 
2.50.0

