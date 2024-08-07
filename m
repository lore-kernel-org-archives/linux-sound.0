Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADEB1E7A52
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037670; cv=none; b=Iq1W0bb2dqVeOPMUwD5LG8XaYHJTmYTTq/D9amKqaCEGeBgOaHQOV6fE0hH8JENfRaRCYRipO0wZLwEVLGVaqPbeILfd/EzABk9AyduSl7nzMgI+VMAtcuWPKgB2Tn+4oa2DvLE1cmZViVEp62AGiEaZK+MuoTG6IH4RrsAVwZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037670; c=relaxed/simple;
	bh=OCqnhEmVfEbAeAPWhw+pk5D7+artQ6G/UopZ5/TOZVM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWFv/tzRxvuzL3hftFVVXTCFfwLrY+4ySRUXI6qGQ5qgx8zCgQ4uzbzSd7AXLEM4l5R7WpfIY2ZHCF5DCAvbMyHHTVFhjSvNiukAXycNN4NXd1uCXPM4EhRLuZxkKosct/+n7EyJVJQ11QrBSxreaasrZsv69qcDDErt3KlFH+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E0Hj84WP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sb/BLXI4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E0Hj84WP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sb/BLXI4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E0Hj84WP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sb/BLXI4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E0Hj84WP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sb/BLXI4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B1D8621D25;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AawWqt03Jw9q2O0sYjogHwf2dRwpOLdIXud6zNhoar4=;
	b=E0Hj84WP647eb2suBJzV33EcGYEoMgSoXz5r9amnDqiYdoCAq7JdA4RctiaUxN3ypCx4SR
	6ezOni5ceo4BGkJpk1GTodyEcTWuxVEYDyB8VXvT23msbTH7EYe8syhnGAbQR8Q9t8a13B
	j/vZhJ3h4jJZSNL6OyiDGOG1SIUGGBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AawWqt03Jw9q2O0sYjogHwf2dRwpOLdIXud6zNhoar4=;
	b=sb/BLXI4L71w8KOJjS4Pdo4/U/pmyi0nAtRGBlP4UPKujLzs1PAcZQBaxIqq7IP43NdVi3
	vVbEJihIPTWxXgCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AawWqt03Jw9q2O0sYjogHwf2dRwpOLdIXud6zNhoar4=;
	b=E0Hj84WP647eb2suBJzV33EcGYEoMgSoXz5r9amnDqiYdoCAq7JdA4RctiaUxN3ypCx4SR
	6ezOni5ceo4BGkJpk1GTodyEcTWuxVEYDyB8VXvT23msbTH7EYe8syhnGAbQR8Q9t8a13B
	j/vZhJ3h4jJZSNL6OyiDGOG1SIUGGBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AawWqt03Jw9q2O0sYjogHwf2dRwpOLdIXud6zNhoar4=;
	b=sb/BLXI4L71w8KOJjS4Pdo4/U/pmyi0nAtRGBlP4UPKujLzs1PAcZQBaxIqq7IP43NdVi3
	vVbEJihIPTWxXgCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98C5B13A7D;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0BI1JN53s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 45/54] ALSA: usb-audio: Use standard print API
Date: Wed,  7 Aug 2024 15:34:35 +0200
Message-ID: <20240807133452.9424-46-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.952];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spam-Level: 

Use pr_*() instead of open-coded printk() for code simplicity.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index c1f2e5a03de9..737dd00e97b1 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -224,10 +224,10 @@ static void snd_usbmidi_input_data(struct snd_usb_midi_in_endpoint *ep,
 #ifdef DUMP_PACKETS
 static void dump_urb(const char *type, const u8 *data, int length)
 {
-	snd_printk(KERN_DEBUG "%s packet: [", type);
+	pr_debug("%s packet: [", type);
 	for (; length > 0; ++data, --length)
-		printk(KERN_CONT " %02x", *data);
-	printk(KERN_CONT " ]\n");
+		pr_cont(" %02x", *data);
+	pr_cont(" ]\n");
 }
 #else
 #define dump_urb(type, data, length) /* nothing */
-- 
2.43.0

