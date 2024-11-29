Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1161865E1
	for <linux-sound@vger.kernel.org>; Fri, 29 Nov 2024 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873557; cv=none; b=byOW/POZkL/Vsp3RvKRBotnJ6K60Fa32EqJzgUd3KsfdvkVr/2ov/7/Vz8wlES2B+grzK9WfbY0w2+7Tq/FRXicSchNv16OyqRKdCF/loU/ZCH1yeLcHoWgpoTjafkkKM4GJxM/klf0UFi9k8HCTBARPLklpPP54H3MmgVA+RT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873557; c=relaxed/simple;
	bh=CNBxd/wdtPpQ28DVwTA5yo9WFndtjMBL3WEybJ+xwC0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xi/CCDkNPb2zvOm4HVc5//vauC9ZeuRgYHvdfmCDUcRAZZAszmX9rI4m4Uf03hWvZWe4fRrnHdmjaJ2xDtkPVXxqUoMSXGPdIo1Jd755AYbFF4op7Mw5mH2y2IaXxxwewlJrXwDeFn0vgkIcpE6F5hjLCuqrddK5HHMfYRmmYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x2lGD+rj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k8FQWrTz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x2lGD+rj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k8FQWrTz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x2lGD+rj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k8FQWrTz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x2lGD+rj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k8FQWrTz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 950B821194;
	Fri, 29 Nov 2024 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732873553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tyj4WT1TTMFZfxKuf63vbbqOeKSh2+XP43iBrvH5hX4=;
	b=x2lGD+rjnnVtoUbjm1uCOMUPQVhPY40v5OiUzmbPqh+5kxjE+HJXF5Dm0h9bbVvTtYSaJt
	FmUXx1N3BNpk74vnk7tfugELy/4WdjkPs4gSHNu7noqavW63+fFkMrqeatpKHlhx8JMdOt
	HO05JHeNld3N1pCSpY6o2Dhs5KbBaIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732873553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tyj4WT1TTMFZfxKuf63vbbqOeKSh2+XP43iBrvH5hX4=;
	b=k8FQWrTzOWJLlagubC092ZAqm93oV+FNCDb+lFyc3JLjNkMsWuiIJ1A6c8P/sdIIphBc8i
	+D4u0OAvsLfRE5DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732873553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tyj4WT1TTMFZfxKuf63vbbqOeKSh2+XP43iBrvH5hX4=;
	b=x2lGD+rjnnVtoUbjm1uCOMUPQVhPY40v5OiUzmbPqh+5kxjE+HJXF5Dm0h9bbVvTtYSaJt
	FmUXx1N3BNpk74vnk7tfugELy/4WdjkPs4gSHNu7noqavW63+fFkMrqeatpKHlhx8JMdOt
	HO05JHeNld3N1pCSpY6o2Dhs5KbBaIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732873553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tyj4WT1TTMFZfxKuf63vbbqOeKSh2+XP43iBrvH5hX4=;
	b=k8FQWrTzOWJLlagubC092ZAqm93oV+FNCDb+lFyc3JLjNkMsWuiIJ1A6c8P/sdIIphBc8i
	+D4u0OAvsLfRE5DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F57813AA5;
	Fri, 29 Nov 2024 09:45:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WOXpGVGNSWd5VgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Nov 2024 09:45:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ALSA: ump: Don't open legacy substream for an inactive group
Date: Fri, 29 Nov 2024 10:45:42 +0100
Message-ID: <20241129094546.32119-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241129094546.32119-1-tiwai@suse.de>
References: <20241129094546.32119-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

When a UMP Group is inactive, we shouldn't allow users to access it
via the legacy MIDI access.  Add the group active flag check and
return -ENODEV if it's inactive.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 6d0aac6c763f..9f9ad106107f 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1087,6 +1087,8 @@ static int snd_ump_legacy_open(struct snd_rawmidi_substream *substream)
 	guard(mutex)(&ump->open_mutex);
 	if (ump->legacy_substreams[dir][group])
 		return -EBUSY;
+	if (!ump->groups[group].active)
+		return -ENODEV;
 	if (dir == SNDRV_RAWMIDI_STREAM_OUTPUT) {
 		if (!ump->legacy_out_opens) {
 			err = snd_rawmidi_kernel_open(&ump->core, 0,
-- 
2.43.0

