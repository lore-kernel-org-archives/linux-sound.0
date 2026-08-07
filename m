Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B361838DC4A
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091680; cv=none; b=rDnSimMQXMAivDFn22HHdjvqAPuqLkOwLdIrC0HX4HYzklwtj35uZ2xAz1lJPmgeGgIQXmez/XAebgvtlIqIUeQzkzy+iTSBhNA/AFwV/HUms4K/3NZtCD6U306dcLuWLznx18D/zfw033RUt+mkXThSEvTP2blKZF/lPfMfDn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091680; c=relaxed/simple;
	bh=4b7Xkxhn7stAwg++71q/1YEukbmWmJXHCZMhJzZvUvI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=asJ9s4RZ7qcM75/qHna9w3rL1eYQy16znH4vKxqAaYdDUj5v3hZrqPZz2USleyBTAEFjwT4uO1jOhUdNm7p3YMLCnfZj4cYzgb0ulaSCDxBYM9wtB0g8TodD4MQCS8QMcUJtXDsQNdIW4VspBVvsQ0wJwa9aZEGyGwfw8qrITfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SOaq3IJy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8HHa/V93; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k79mFJGM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gN2MZoTR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SOaq3IJy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8HHa/V93";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k79mFJGM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gN2MZoTR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 328B73DFE;
	Fri,  7 Aug 2026 08:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786091667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7zwynrkanq6CALRlKv+wZnaVd4mBPG+z/zBxCWSr8KA=;
	b=SOaq3IJy+XMVV1xWSW8VTsncDQDnmueXab3h8+SQUmOHKt91m3YbtpMN5Gy3dF+jC24F7G
	VI7CskiO3Pa8hKLtZpvLyvOz/7clHQyz/sql+rfB27cLpQOWxAxJmoKCJgMt+266J5xK79
	Ny7WoRPgMM/YoJnQ46PtFh1Hgmw2dJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786091667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7zwynrkanq6CALRlKv+wZnaVd4mBPG+z/zBxCWSr8KA=;
	b=8HHa/V93Web28f9gxbvY3l0NbQmt7k+dWF2kqiduBPLEEtl89FpflHM9k2UzzsLsfVU7TC
	oF3H4JarLhkHecCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k79mFJGM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gN2MZoTR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786091663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7zwynrkanq6CALRlKv+wZnaVd4mBPG+z/zBxCWSr8KA=;
	b=k79mFJGMIJdPcrqoKuZr4Uxd6psZZViRseaTEell8gS4/Zf8hhCTC15uh9Nv9oy9FAieFq
	TMVfJb7ygIgK4zV5WBZqPoxFn3mwdoSE30oJT/YnENJFsjasFnLYS1U+WEgRlctdDASsDv
	DGNtCoVL2/VAT7VH/vC/AIlk/N139D0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786091663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7zwynrkanq6CALRlKv+wZnaVd4mBPG+z/zBxCWSr8KA=;
	b=gN2MZoTRoL/ZZmpl4rr8gMC4XHbt0E4+4yjK/mGgxlU/8iTqS+DKSL1/q9IDvjECtjcpNy
	Yyc1QP6BQhRaKRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 190C7779B6;
	Fri,  7 Aug 2026 08:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0WPaBI+YdWpKUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Aug 2026 08:34:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix sticky mixer regressions on M-Audio Fast Track Ultra
Date: Fri,  7 Aug 2026 10:34:16 +0200
Message-ID: <20260807083418.1712585-1-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:url,suse.de:email,suse.de:mid,suse.de:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 328B73DFE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

The recent fix for sticky mixer volumes caused regressions of M-audio
Fast Track Ultra device, where the mixer state is kept to the default
value.

Add the quirk entries to tolerate the broken mixer behavior.  As the
device is known to work in the implicit feedback mode, explicitly
enable the implicit feedback mode, too.

Since there are two FTU models that are almost identical, both entries
are added in this patch (0763:2080 and 0763:2081).

Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1273166
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index c90c89200baf..90ca39dbed18 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2327,6 +2327,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0763, 0x2031, /* M-Audio Fast Track C600 */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x0763, 0x2080, /* M-Audio Fast Track Ultra */
+		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x0763, 0x2081, /* M-Audio Fast Track Ultra */
+		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x07fd, 0x000b, /* MOTU M Series 2nd hardware revision */
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M),
 	DEVICE_FLG(0x08bb, 0x2702, /* LineX FM Transmitter */
-- 
2.55.0

