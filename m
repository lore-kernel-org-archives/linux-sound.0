Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D875518C326
	for <linux-sound@vger.kernel.org>; Mon, 15 Jul 2024 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046951; cv=none; b=YadGDioBOy3juXgH58+iLg+xbRMquL3fPAJbYPI3BepUTQwiwbTccjKr2Wb515KK7e9LFu8qtSiQTQng5QBjFeZlcP992633SSNbjNhLcMMkQ8Pbrc4/OZ0dKX8HqEPLZ4LK/9UMp8UxODBlkW+aGqTvISm9UGgSc5LGmHv/XyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046951; c=relaxed/simple;
	bh=glc9Juba8Zr2gylfZctzL46EFGMAQNG8oBW17vykyRw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DYFHAmmD4wIrXdTa8IjuI3r/xouSBt4Ho8Cq9zNJrX0S2wvQb3wdyZ/rXjTGo2+H54Jx720+uZkGbqSzEo0//HJcxMe+mxp6Aaibz/dn8Rc0tzCUmfohxt0LI/pvEuAKSB/FDZvyCSqnzpTe4iAZoERSB0DfHdWLAr/B4xYli2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nsosA0uh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oicPORzp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nsosA0uh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oicPORzp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nsosA0uh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oicPORzp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nsosA0uh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oicPORzp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 142CB1F80C;
	Mon, 15 Jul 2024 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721046948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rCzSj53cl65RUKf3lG7rTPBMlplbLEQBcLACqNpxwXo=;
	b=nsosA0uhJYbTdPFRZN9l6IvSH8Idbc3fj0xFadYhGO1ratQIQHQ2v/Dq/ZWj6pN2saRExQ
	v1G5VL2cht4m6XZYfUh5kE8xgCaGpocbMhWto8U9cNNN4TM1OsTo60CBJz2plySeWzPAkY
	+GkVPTA7qXQEslSKOelwoCe2RNIUsXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721046948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rCzSj53cl65RUKf3lG7rTPBMlplbLEQBcLACqNpxwXo=;
	b=oicPORzp/ves4GIDIqVEwwiy5Twkgs+6E1CndV3CYp1JvBt72DpBZ9CuPXdysI+BWump1D
	f9nJZ3rAfkow1KDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721046948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rCzSj53cl65RUKf3lG7rTPBMlplbLEQBcLACqNpxwXo=;
	b=nsosA0uhJYbTdPFRZN9l6IvSH8Idbc3fj0xFadYhGO1ratQIQHQ2v/Dq/ZWj6pN2saRExQ
	v1G5VL2cht4m6XZYfUh5kE8xgCaGpocbMhWto8U9cNNN4TM1OsTo60CBJz2plySeWzPAkY
	+GkVPTA7qXQEslSKOelwoCe2RNIUsXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721046948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rCzSj53cl65RUKf3lG7rTPBMlplbLEQBcLACqNpxwXo=;
	b=oicPORzp/ves4GIDIqVEwwiy5Twkgs+6E1CndV3CYp1JvBt72DpBZ9CuPXdysI+BWump1D
	f9nJZ3rAfkow1KDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04E79137EB;
	Mon, 15 Jul 2024 12:35:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tkOqAKQXlWbXRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 15 Jul 2024 12:35:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb: Fix UBSAN warning in parse_audio_unit()
Date: Mon, 15 Jul 2024 14:35:54 +0200
Message-ID: <20240715123619.26612-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: 1.20
X-Spamd-Result: default: False [1.20 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,appspotmail.com:email]
X-Spam-Level: *

A malformed USB descriptor may pass the lengthy mixer description with
a lot of channels, and this may overflow the 32bit integer shift
size, as caught by syzbot UBSAN test.  Although this won't cause any
real trouble, it's better to address.

This patch introduces a sanity check of the number of channels to bail
out the parsing when too many channels are found.

Reported-by: syzbot+78d5b129a762182225aa@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/0000000000000adac5061d3c7355@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 409fc1164694..fd6b94b3b638 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2014,6 +2014,13 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 		bmaControls = ftr->bmaControls;
 	}
 
+	if (channels > 32) {
+		usb_audio_info(state->chip,
+			       "usbmixer: too many channels (%d) in unit %d\n",
+			       channels, unitid);
+		return -EINVAL;
+	}
+
 	/* parse the source unit */
 	err = parse_audio_unit(state, hdr->bSourceID);
 	if (err < 0)
-- 
2.43.0

