Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826FE2D59E8
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142076; cv=none; b=fUAWXXqUbEe8I01MnW25wOpevy05qABaeKv/JffYBnfZzjwMy854NJqQObICgSjXNluwKZmdMuRnY4q/O6rPGmNwsRPnGFNY5pTTRadtuqeeHYndqVGQPSX8i4480GwEXnyVQCIjZjcg5ozVPRg+NYP+O3htnuP/dXklNVmWTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142076; c=relaxed/simple;
	bh=CfcML2LII8QPV2Gl8dWm9TSzhSrnkHw3Rpd9YSIhP9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUNHoWLh6vRvu4Xwyacn1xxmCTilLy8kGHn9YCMYb7tLIKjWe/ELicFRyb5ZS2yCYMersb2WWbCCpMaO94tP8ogmvpw7z24Cy/mYTzOa8fJzb6VmzI52JAep69XtyzYVnXgyS4oKW0YXx9wsOiY0oNZGdbiGlSZIWuVm/KJdS7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hi+hM578; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SZ1vH0Gh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1vxNTwLP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bGcR0JD0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hi+hM578";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SZ1vH0Gh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1vxNTwLP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bGcR0JD0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F0F071F44E;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GZmfihl6HdL4Ay7E5B3SpZreNSPPIIpqJME0eVaSww=;
	b=hi+hM5782OaFiAdgrc4VjK4D8y414FATd1Ep8GCv/b3y5VVS1okyz+mFI7M1R9lgpd2aen
	/W2vVkADnhKya90LpoxoaeuVwmHbq8prdklrRdCfJyr4+clyIVXk9hYRS318vwtiaN0DI+
	76NOKjmHNY2hEtw6HkTciCVbPlLX78k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GZmfihl6HdL4Ay7E5B3SpZreNSPPIIpqJME0eVaSww=;
	b=SZ1vH0GhvCoH25Lgw2b4SbfrrVwQvCbcmUejsQ53uRmE7XkUuUl2nHCFlcIK+ZV0jUMBhF
	VjxWGR+7tILLTTDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1vxNTwLP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bGcR0JD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GZmfihl6HdL4Ay7E5B3SpZreNSPPIIpqJME0eVaSww=;
	b=1vxNTwLPYVlfINWFQtyKwhHxvxVMME/XKEUVtz1Ay/IGpgsrR5AoI5L6lMlWWihUCNQUHr
	m/5spqhsUYDPcXsM6IVkg0BQ2wa3qkIx5SJXUKsV6BtyCgag9yZr0pm+z2zWfJO5IiZxOU
	Rk45cKr7TAkg/ef20MN/CIvayBNWTj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GZmfihl6HdL4Ay7E5B3SpZreNSPPIIpqJME0eVaSww=;
	b=bGcR0JD0LtAUY+wPJmlyLVgHQNkdLJMjtbqJ3Z5rAbbGM3d13XUxcOLhgGH84U9GzeAjUY
	QDpCEoEL3egJ/xDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D75E413A70;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2DRgM+mQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 009/103] ALSA: serial-generic: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:51 +0200
Message-ID: <20250710100727.22653-10-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: F0F071F44E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/serial-generic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/serial-generic.c b/sound/drivers/serial-generic.c
index 36409a56c675..21ae053c0576 100644
--- a/sound/drivers/serial-generic.c
+++ b/sound/drivers/serial-generic.c
@@ -300,7 +300,7 @@ static int snd_serial_generic_rmidi(struct snd_serial_generic *drvdata,
 				&snd_serial_generic_input);
 	snd_rawmidi_set_ops(rrawmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
 				&snd_serial_generic_output);
-	strcpy(rrawmidi->name, drvdata->card->shortname);
+	strscpy(rrawmidi->name, drvdata->card->shortname);
 
 	snd_serial_generic_substreams(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT],
 					drvdata->serdev->ctrl->nr);
@@ -329,7 +329,7 @@ static int snd_serial_generic_probe(struct serdev_device *serdev)
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "SerialMIDI");
+	strscpy(card->driver, "SerialMIDI");
 	sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
 	sprintf(card->longname, "Serial MIDI device at serial%d", serdev->ctrl->nr);
 
-- 
2.50.0

