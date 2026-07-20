Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D82D41DECA
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555658; cv=none; b=WKVIKFquBKtOlb8JSgwN222qdj9NZWKakU3glxxNFvA9Hh4r/5IEFt2CwVeejNtZi/NaiZLFdHSmXJny1UiWu6Hm7ls56lCLNuywt2vT4w6agIrTAfU+QHTdQDl5YlNVFGcCa9zgLU0miXYFoZfZH0zH914aikQ25IwdKeoL2l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555658; c=relaxed/simple;
	bh=e0aSv+9JnyYvKEk+xoJb7PTEJeDYhakF2wCfud0spzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EyZz1VST+qehcwGB0adlG4nwT5HsBzODz1AcUFBfVu1bovnzMx9iOxIayF4fuGylHgNujXZVhrWoXCEu8pxRG2s12wQqIzdHrTiCvQ0FzUTvq41Y3Z1F/zRFpggLD5ZZacaFtxk321sVP+NnYIS8py1bvZfIy9dc3KGJlWXqTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iIwTkBSl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=js+z9I/o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iIwTkBSl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=js+z9I/o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iIwTkBSl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="js+z9I/o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iIwTkBSl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="js+z9I/o"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 13E4A79FA9;
	Mon, 20 Jul 2026 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784555642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPgCshBj2V6WI6FFQ3vk3tVARqmn3O7GTHYH4EVXB38=;
	b=iIwTkBSl71MYOOgqBXkhLqeD8i2kEVypzRhjdRB868XpSZlw0zcCX1VgDbs23MnCCjgnlm
	5Z19JxRRiu8PNVY/di19tBCsktsCQwgCI9Skb0PUyrF0yEFcEhX/4KAv9VnIUnT5N4PQnl
	vo8l0aDczCpt6459OGmbzGyAeAy7Lec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784555642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPgCshBj2V6WI6FFQ3vk3tVARqmn3O7GTHYH4EVXB38=;
	b=js+z9I/oBTXa8Z0uZ4qrCNPhmmiBsbbiajWGxZ4vfuBtqxRf2fS1tR4WTs7o1/my9OUh/5
	3Mfpe8qY65Xr/dBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784555642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPgCshBj2V6WI6FFQ3vk3tVARqmn3O7GTHYH4EVXB38=;
	b=iIwTkBSl71MYOOgqBXkhLqeD8i2kEVypzRhjdRB868XpSZlw0zcCX1VgDbs23MnCCjgnlm
	5Z19JxRRiu8PNVY/di19tBCsktsCQwgCI9Skb0PUyrF0yEFcEhX/4KAv9VnIUnT5N4PQnl
	vo8l0aDczCpt6459OGmbzGyAeAy7Lec=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784555642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPgCshBj2V6WI6FFQ3vk3tVARqmn3O7GTHYH4EVXB38=;
	b=js+z9I/oBTXa8Z0uZ4qrCNPhmmiBsbbiajWGxZ4vfuBtqxRf2fS1tR4WTs7o1/my9OUh/5
	3Mfpe8qY65Xr/dBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E98BE779AA;
	Mon, 20 Jul 2026 13:54:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qCuzN3koXmr8KgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 13:54:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ALSA: dummy: Implement sync_stop for systimer, too
Date: Mon, 20 Jul 2026 15:53:53 +0200
Message-ID: <20260720135356.1779857-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720135356.1779857-1-tiwai@suse.de>
References: <20260720135356.1779857-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.80

The systimer backend invokes timer_delete() at stopping the PCM, but
it misses its synchronization, which might lead to concurrent changes
or releases at PCM prepare or free.  Use the sync_stop callback to
assure the synchronization of timer deletion.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index ddd4da058693..3bc0289e3518 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -286,6 +286,14 @@ static int dummy_systimer_stop(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int dummy_systimer_sync_stop(struct snd_pcm_substream *substream)
+{
+	struct dummy_systimer_pcm *dpcm = substream->runtime->private_data;
+
+	timer_delete_sync(&dpcm->timer);
+	return 0;
+}
+
 static int dummy_systimer_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -351,6 +359,7 @@ static const struct dummy_timer_ops dummy_systimer_ops = {
 	.prepare =	dummy_systimer_prepare,
 	.start =	dummy_systimer_start,
 	.stop =		dummy_systimer_stop,
+	.sync_stop =	dummy_systimer_sync_stop,
 	.pointer =	dummy_systimer_pointer,
 };
 
-- 
2.55.0

