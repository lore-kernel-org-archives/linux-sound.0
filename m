Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E00B640
	for <linux-sound@vger.kernel.org>; Sat,  8 Aug 2026 15:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786202422; cv=none; b=Lfp5PR3Jao68DiiAiFVyAEVD4AcdaweCLTRrhV5I99MyXNa2YghHOFdqyJRo/VuHKCk64Pm+w/6CmgqrBxEtST5k34L2yoxG2uBpHapV//vJf+3Qs6/cltt+6eOKSuCNF7raj9cVlDEahsgz0pVewvkQcXvg+cLIS83TAAzdwTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786202422; c=relaxed/simple;
	bh=DvJAXlSqJi5Bu9r64rlBaxFlS5zLRWs2p+hG11dv+J4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nNRO3Vssr5QqTQNJXGF+pMaQj7e0K2FETha5BGQRHspxtiDryOfIk38aRVWZkRv7vkxTl7dJVD0GsBbTmcYg4B2Dy9235XHkUo3Z41VowmTWwVEEUwS4ySuT7gF0UqcPun+YSKle86ScK5aJYLbYZy98jtg1NgyeLGg6nWzGNVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fXgbAJZ0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VsxXi+lq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YHRLNk7Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e2X1Lv3z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fXgbAJZ0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VsxXi+lq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YHRLNk7Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e2X1Lv3z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 23CEE80F11;
	Sat,  8 Aug 2026 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786202415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N71J7qv6GBCFdCzDR0tW855sz6dhJN+w2ReHVkNeYv4=;
	b=fXgbAJZ0fJFNF5/noSUL0Yj6au26ijfj7VfoTgRE1S1s/5g7ygo1mtQwEZtcWE/tgNWyNL
	XNeVDNAz/e7cllxlz3kufq6Rbt78ovEfUsgtwmQ+5YyglF6EjerJlzNPav9E2ePcu7Fi8M
	4j7lO8GsjNEAfBU0tOzIsHYsHibBM0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786202415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N71J7qv6GBCFdCzDR0tW855sz6dhJN+w2ReHVkNeYv4=;
	b=VsxXi+lqJatI2vsnLkRaQHI6nvZnyjOUMJ+zW4Ql7kTIg9JR0sf/NgzIp13Hq3UoTvbdo1
	rxKuvibmQMB43wAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YHRLNk7Z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=e2X1Lv3z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786202411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N71J7qv6GBCFdCzDR0tW855sz6dhJN+w2ReHVkNeYv4=;
	b=YHRLNk7ZcQcm7bhmC6FLz7OdkFS2uMMfOP9Nu3AN6WUv2kq/23pDS3MRQcEe2v28En+ciE
	AbnPzLP8TTTGyP+ltsiIoBC+4n2qyJtx3V/3+BgAwT4Wj8PMhVWrpsyTNOOxB1F5sTVkG2
	1EWdZ4g14EYeHhtcqANTDDW/yOLZjcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786202411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=N71J7qv6GBCFdCzDR0tW855sz6dhJN+w2ReHVkNeYv4=;
	b=e2X1Lv3zbXzsBTt2wfiiuNv/BSXN+P0iyWVRTj908l53CGxZgLsV8KzsrKqBg13u20nHpy
	uFUk0+8/zwT99dBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 09A1C779B2;
	Sat,  8 Aug 2026 15:20:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s7omAStJd2pqbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 08 Aug 2026 15:20:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb: Fix UAF at delayed release of MIDI2 EPs
Date: Sat,  8 Aug 2026 17:20:06 +0200
Message-ID: <20260808152009.1947835-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
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
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim,appspotmail.com:email,syzkaller.appspot.com:url];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 23CEE80F11
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

The recent fix for UAF in ump_to_endpoint() caused another UAF because
it tries to dereference the UMP endpoint object, but this might be
executed at a delayed context where the endpoint has been already
released.

Add private_free to clear the associated data for avoiding the further
dereference for delayed releases.

Fixes: 4a05b2d1b464 ("ALSA: usb-audio: fix use-after-free in ump_to_endpoint()")
Reported-by: syzbot+565b1138cfbe549d4422@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=565b1138cfbe549d4422
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 83980fb83ac8..1dc78f536ef9 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -677,6 +677,14 @@ static int parse_midi_2_0_endpoints(struct snd_usb_midi2_interface *umidi)
 	return 0;
 }
 
+static void free_ump_private_data(struct snd_ump_endpoint *ump)
+{
+	struct snd_usb_midi2_ump *rmidi = ump->private_data;
+
+	if (rmidi)
+		rmidi->ump = NULL;
+}
+
 static void free_all_midi2_umps(struct snd_usb_midi2_interface *umidi)
 {
 	struct snd_usb_midi2_ump *rmidi;
@@ -727,6 +735,7 @@ static int create_midi2_ump(struct snd_usb_midi2_interface *umidi,
 
 	ump->private_data = rmidi;
 	ump->ops = &snd_usb_midi_v2_ump_ops;
+	ump->private_free = free_ump_private_data;
 
 	rmidi->eps[STR_IN] = ep_in;
 	rmidi->eps[STR_OUT] = ep_out;
-- 
2.55.0

