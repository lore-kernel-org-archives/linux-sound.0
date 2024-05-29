Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5BF4DA08
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971866; cv=none; b=P/GSuKREVCrBW1ZUcFIHjDJd/TqYKgvBxznSDJfDAB2PSaSJMmj0rPxOvdofdMrZ+IswKi021emIZeGwcEpsaHFHD+VbT7Sfvo2zelZZk/aUAVRUTIQ9Vh3pb/qxb/F+i/bPHGdwmTUF9UEeJtA+JLJGEGUdFHsKCh1aBUexIk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971866; c=relaxed/simple;
	bh=RTHWMJZ/j0KWnlN1EmOFMjxFGGhHf4XRE7shH+ESPQk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=b/VAg9Uu7dPaLvdr68pDjacZwDRUSLWYPwNO4i/Q40OENt0XXW0wULks4++bH61RzXJQARDvHhQqsuztCoJbFY8PilbLDxdsZhYt3JhGNjGpotwMo9jvLRBqUTw2cv8UuLCs/i5Xq7z7/rIo0MKkMS/fU0x1FJBAkqtr/vMJaeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mQayy2ef; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7muMyPRT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mQayy2ef; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7muMyPRT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mQayy2ef";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7muMyPRT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mQayy2ef";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7muMyPRT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C763204CF;
	Wed, 29 May 2024 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716971862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0avBwrCzDE7Abw8hPyqwC5aUtpzCkJHEGVhvZq476JU=;
	b=mQayy2ef7ylfEInjjhcaq7+8csbZJW+kHlL+hYFwlLMLDAGQUB9uFbkjN2FDzxTxkSgKYO
	SBCxuQt0iV2nRZAVRxcVkFNIPZRMDw9NtVRUjIh1TMQuqb8wo5MhggX6wxBurviLhjJtGR
	owAyOq4L/PCDivD25r9Z7No25C2O4Ag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716971862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0avBwrCzDE7Abw8hPyqwC5aUtpzCkJHEGVhvZq476JU=;
	b=7muMyPRTdWkqV2emAi6DBfI3tWBNHbYYLw/Cnkw5aSdSynTjNrunW/uzP2h+ob0uqNUoJW
	g7nmvvKDW5OKdcAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mQayy2ef;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7muMyPRT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716971862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0avBwrCzDE7Abw8hPyqwC5aUtpzCkJHEGVhvZq476JU=;
	b=mQayy2ef7ylfEInjjhcaq7+8csbZJW+kHlL+hYFwlLMLDAGQUB9uFbkjN2FDzxTxkSgKYO
	SBCxuQt0iV2nRZAVRxcVkFNIPZRMDw9NtVRUjIh1TMQuqb8wo5MhggX6wxBurviLhjJtGR
	owAyOq4L/PCDivD25r9Z7No25C2O4Ag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716971862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0avBwrCzDE7Abw8hPyqwC5aUtpzCkJHEGVhvZq476JU=;
	b=7muMyPRTdWkqV2emAi6DBfI3tWBNHbYYLw/Cnkw5aSdSynTjNrunW/uzP2h+ob0uqNUoJW
	g7nmvvKDW5OKdcAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DFFB1372E;
	Wed, 29 May 2024 08:37:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DbvKEVbpVmZCaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 May 2024 08:37:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Fix incorrect UMP type for system messages
Date: Wed, 29 May 2024 10:37:59 +0200
Message-ID: <20240529083800.5742-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6C763204CF
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]

When converting a legacy system message to a UMP packet, it forgot to
modify the UMP type field but keeping the default type (either type 2
or 4).  Correct to the right type for system messages.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index f5d22dd00842..add70b4c2885 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -739,6 +739,7 @@ static int system_1p_ev_to_ump_midi1(const struct snd_seq_event *event,
 				     union snd_ump_midi1_msg *data,
 				     unsigned char status)
 {
+	data->system.type = UMP_MSG_TYPE_SYSTEM; // override
 	data->system.status = status;
 	data->system.parm1 = event->data.control.value & 0x7f;
 	return 1;
@@ -750,6 +751,7 @@ static int system_2p_ev_to_ump_midi1(const struct snd_seq_event *event,
 				     union snd_ump_midi1_msg *data,
 				     unsigned char status)
 {
+	data->system.type = UMP_MSG_TYPE_SYSTEM; // override
 	data->system.status = status;
 	data->system.parm1 = (event->data.control.value >> 7) & 0x7f;
 	data->system.parm2 = event->data.control.value & 0x7f;
-- 
2.43.0

