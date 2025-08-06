Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6924928B3FA
	for <linux-sound@vger.kernel.org>; Wed,  6 Aug 2025 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473474; cv=none; b=t9U0TaJnibN/aAJy70nuhhmH7FIhGWlE+tHo4VqCySl8oYb/bHZ8FMISJjOixVLB12lmYSY0H13bi1DdVNQ7VJItCnVpX3lUJM2oqMMnhxritko5TNKAVqcZIqnrTrRnocxvLSer9dPXqrLy6EVct7xyPXc0Da1o3xJ8AQG+iEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473474; c=relaxed/simple;
	bh=JEjIiwS9nyilP1mIl3ohYFjyGiwZpwoePx4ATTobsgk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KUwpK+PVyblqJJtdmyXwL6VCVJYXofRmcSVKMucCfVAE0rnRyLJR1tp8L8nIRJ7ugVprqOMYjVFljkUeAKu7CTF2ztV1TIezIZbiRak+K9psUOjLvz0k6demSJWZvoGqqKLVtKI+P8P3U+SprHuzbF9igO9G0we+ThIp66qMDIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q5zaHCOR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cJPSRY9v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q5zaHCOR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cJPSRY9v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q5zaHCOR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cJPSRY9v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q5zaHCOR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cJPSRY9v"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3EB3E216ED;
	Wed,  6 Aug 2025 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754473465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2MivEwy7TMiGoX/n8wGCYwMK0vvnc2gATemmkrqV+Nw=;
	b=q5zaHCORIcHcrpFt9NmptRZCCLtGXGucIciHTrlW43NvMkZis9F3P/B71qBdABkZAw7drD
	gWPs1xuIhwtQjTcJUCA9VxhupKsmHLTKSMf6ZJqAnuvontZpHi6+c/A9+gmaBn+0Fnya+a
	p7NByXgm2A2viDTDMy1NXyvorT+PUaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754473465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2MivEwy7TMiGoX/n8wGCYwMK0vvnc2gATemmkrqV+Nw=;
	b=cJPSRY9vHpiKX54dIu0hiv5oI7dysFG3UgEEqNSifcqOiIKYRkQ6pltqAaASgsRmjUgGU+
	/h9/WHj2Ly31IQBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q5zaHCOR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cJPSRY9v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754473465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2MivEwy7TMiGoX/n8wGCYwMK0vvnc2gATemmkrqV+Nw=;
	b=q5zaHCORIcHcrpFt9NmptRZCCLtGXGucIciHTrlW43NvMkZis9F3P/B71qBdABkZAw7drD
	gWPs1xuIhwtQjTcJUCA9VxhupKsmHLTKSMf6ZJqAnuvontZpHi6+c/A9+gmaBn+0Fnya+a
	p7NByXgm2A2viDTDMy1NXyvorT+PUaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754473465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2MivEwy7TMiGoX/n8wGCYwMK0vvnc2gATemmkrqV+Nw=;
	b=cJPSRY9vHpiKX54dIu0hiv5oI7dysFG3UgEEqNSifcqOiIKYRkQ6pltqAaASgsRmjUgGU+
	/h9/WHj2Ly31IQBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30DDF13ABE;
	Wed,  6 Aug 2025 09:44:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k2hcC/kjk2jIJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 09:44:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/ca0132: Fix missing error handling in ca0132_alt_select_out()
Date: Wed,  6 Aug 2025 11:44:22 +0200
Message-ID: <20250806094423.8843-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3EB3E216ED
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

There are a couple of cases where the error is ignored or the error
code isn't propagated in ca0132_alt_select_out().  Fix those.

Fixes: def3f0a5c700 ("ALSA: hda/ca0132 - Add quirk output selection structures.")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/ca0132.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index b716f721f25d..b7d456e16c93 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -4802,7 +4802,8 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 	if (err < 0)
 		goto exit;
 
-	if (ca0132_alt_select_out_quirk_set(codec) < 0)
+	err = ca0132_alt_select_out_quirk_set(codec);
+	if (err < 0)
 		goto exit;
 
 	switch (spec->cur_out_type) {
@@ -4892,6 +4893,8 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 				spec->bass_redirection_val);
 	else
 		err = ca0132_alt_surround_set_bass_redirection(codec, 0);
+	if (err < 0)
+		goto exit;
 
 	/* Unmute DSP now that we're done with output selection. */
 	err = dspio_set_uint_param(codec, 0x96,
-- 
2.50.1

