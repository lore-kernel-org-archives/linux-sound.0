Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0C922538B
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 17:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811646; cv=none; b=KD9AXl10TgHn5VVNHUZ+KaPP/c21o+JW2abpAtLabDr3a+YdtU1wknrqc+IlUB3NUklHWGeu96N9hKF+R/hpUfFx8WSbs3PaBtWsThLREY8hE5jX/JACxqJgtY9bC/bHFxXCL2TkvQY7uL9NVyP7Fm30nSTGPJfZqDf/IndA4sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811646; c=relaxed/simple;
	bh=/0LZmfXOfYmuixW/npLNr6IVBtoN3xuDbuMDHIqeo/I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HbiYskK3MlkG9VNOvxoeA8r7nRT04UzLcg1CdsB4O678sM+8jRQkr0nm448Ru0YC1RjmYbS71ocFhpTqQ2grUjoS0Bxyw1Vx/HBEpN5T3cPPrMi1HcKaXgFmNfjDo2sNJ/EvlIePgNxecHulaThZL+7u7geshPdyjeV05wg3LQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Im0nRmyZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cTo3GwNK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Im0nRmyZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cTo3GwNK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Im0nRmyZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cTo3GwNK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Im0nRmyZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cTo3GwNK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 694AA21185;
	Mon, 17 Feb 2025 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739811642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qKnX5W/cYK5Y/uASAe2r3zdAHGQO12StIQ8UPn1vJOg=;
	b=Im0nRmyZVRNIMk84MP5XqiHkFKzt9aPELmZ4yTwFLEnTRFQH+55oaCTefVn9HguptjPxx4
	xwpllqPsm0LszNBklHybtckOx6h/B2qkiAOCD7no0yaW3spaQkEpFnteJwkwuljlaK41LA
	eK0VEDwqBrCHSILNQW0kMSFLk/U2pZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739811642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qKnX5W/cYK5Y/uASAe2r3zdAHGQO12StIQ8UPn1vJOg=;
	b=cTo3GwNK4VSPuYKHXT6wViXaIgK3QwnwMOJmVkJ2BkPM3za8/Vsc5hLCk+TjA4KtFuBKix
	MrETpejDBhouv4Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739811642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qKnX5W/cYK5Y/uASAe2r3zdAHGQO12StIQ8UPn1vJOg=;
	b=Im0nRmyZVRNIMk84MP5XqiHkFKzt9aPELmZ4yTwFLEnTRFQH+55oaCTefVn9HguptjPxx4
	xwpllqPsm0LszNBklHybtckOx6h/B2qkiAOCD7no0yaW3spaQkEpFnteJwkwuljlaK41LA
	eK0VEDwqBrCHSILNQW0kMSFLk/U2pZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739811642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qKnX5W/cYK5Y/uASAe2r3zdAHGQO12StIQ8UPn1vJOg=;
	b=cTo3GwNK4VSPuYKHXT6wViXaIgK3QwnwMOJmVkJ2BkPM3za8/Vsc5hLCk+TjA4KtFuBKix
	MrETpejDBhouv4Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2970A1379D;
	Mon, 17 Feb 2025 17:00:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IAKgBjprs2dOXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Feb 2025 17:00:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Drop UMP events when no UMP-conversion is set
Date: Mon, 17 Feb 2025 18:00:30 +0100
Message-ID: <20250217170034.21930-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

When a destination client is a user client in the legacy MIDI mode and
it sets the no-UMP-conversion flag, currently the all UMP events are
still passed as-is.  But this may confuse the user-space, because the
event packet size is different from the legacy mode.

Since we cannot handle UMP events in user clients unless it's running
in the UMP client mode, we should filter out those events instead of
accepting blindly.  This patch addresses it by slightly adjusting the
conditions for UMP event handling at the event delivery time.

Fixes: 329ffe11a014 ("ALSA: seq: Allow suppressing UMP conversions")
Link: https://lore.kernel.org/b77a2cd6-7b59-4eb0-a8db-22d507d3af5f@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 073b56dc2225..cb66ec42a3f8 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -678,12 +678,18 @@ static int snd_seq_deliver_single_event(struct snd_seq_client *client,
 					  dest_port->time_real);
 
 #if IS_ENABLED(CONFIG_SND_SEQ_UMP)
-	if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
-		if (snd_seq_ev_is_ump(event)) {
+	if (snd_seq_ev_is_ump(event)) {
+		if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
 			result = snd_seq_deliver_from_ump(client, dest, dest_port,
 							  event, atomic, hop);
 			goto __skip;
-		} else if (snd_seq_client_is_ump(dest)) {
+		} else if (dest->type == USER_CLIENT &&
+			   !snd_seq_client_is_ump(dest)) {
+			result = 0; // drop the event
+			goto __skip;
+		}
+	} else if (snd_seq_client_is_ump(dest)) {
+		if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
 			result = snd_seq_deliver_to_ump(client, dest, dest_port,
 							event, atomic, hop);
 			goto __skip;
-- 
2.43.0

