Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE81586EE
	for <linux-sound@vger.kernel.org>; Fri, 31 May 2024 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158760; cv=none; b=nbggXVLtKmlmxzCz4VUMhu+VdMjgK5aE3v3C8mhYrPvKL6gpNurAX/b13sfX8beqr+TbBqjdSjlJ/TUCNsUCkMuUAs1rEhJBJ18zHwst4VQAOdUPzkf9hMw7WEWHpKjxsYCGKPif04VLG6aqjIAoJX7vqFD0+aeLJpm7xfBxdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158760; c=relaxed/simple;
	bh=80geQ++gWpnY/ZDTanhJTcHl279tHGDhIeZBBr2Hrzs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=N44xCo0PJlyTYy24UkDUJBc352qJdqd+6KlCa7XGPkKGIE7MU5/ddUYxWpOSyALIBj1QfNTweV1C5H3g7cRvvpuZHYSgGUZiCfVAKW7tdwBzQkNeoyA2LHOnuIUlHEVURH1M3m1yr0KKY90jM9Rv4hw8B4FbkurkZud2ClAF5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q6wGCT/W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ELvKQKwJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q6wGCT/W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ELvKQKwJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q6wGCT/W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ELvKQKwJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q6wGCT/W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ELvKQKwJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 02B591F8C1;
	Fri, 31 May 2024 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717158757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lmy+F5kAqeWyKQQqqksZvHinyzzbA8KMeSc5l2M1zRk=;
	b=Q6wGCT/Wswy30lYpSVYbnuUS02TuoYV8WRzyHWoI2eyM3cBXvguLYghC7cKR+nW8uWztpb
	AhNnfPoiobYUJcQ8a0JiPBviJxkhgSJrXqvNAT26EbH/DFGTkbpxvzzmZ+DWEFTGcI/2yY
	Ts2wZlaSr9SYwIgZSMles/YNHnEfPjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717158757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lmy+F5kAqeWyKQQqqksZvHinyzzbA8KMeSc5l2M1zRk=;
	b=ELvKQKwJdsEJaqohyVRJDxiTu/RhVonjn4CoPhvdYPPgHDL/YbDn/rRlBc45hsvgOAzf1z
	2UEfi5YMMkP24gCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717158757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lmy+F5kAqeWyKQQqqksZvHinyzzbA8KMeSc5l2M1zRk=;
	b=Q6wGCT/Wswy30lYpSVYbnuUS02TuoYV8WRzyHWoI2eyM3cBXvguLYghC7cKR+nW8uWztpb
	AhNnfPoiobYUJcQ8a0JiPBviJxkhgSJrXqvNAT26EbH/DFGTkbpxvzzmZ+DWEFTGcI/2yY
	Ts2wZlaSr9SYwIgZSMles/YNHnEfPjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717158757;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lmy+F5kAqeWyKQQqqksZvHinyzzbA8KMeSc5l2M1zRk=;
	b=ELvKQKwJdsEJaqohyVRJDxiTu/RhVonjn4CoPhvdYPPgHDL/YbDn/rRlBc45hsvgOAzf1z
	2UEfi5YMMkP24gCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBF0613A64;
	Fri, 31 May 2024 12:32:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cLl6NGTDWWbzUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 May 2024 12:32:36 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH alsa-utils] aseqdump: Add dump for UMP Utility and System messages
Date: Fri, 31 May 2024 14:32:49 +0200
Message-ID: <20240531123256.12959-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]

Add the dump functions for UMP Type 0 (Utility) and Type 1 (System)
messages.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 seq/aseqdump/aseqdump.c | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/seq/aseqdump/aseqdump.c b/seq/aseqdump/aseqdump.c
index af4ca216ad65..1b2fa430328c 100644
--- a/seq/aseqdump/aseqdump.c
+++ b/seq/aseqdump/aseqdump.c
@@ -595,6 +595,79 @@ static void dump_ump_midi2_event(const unsigned int *ump)
 	printf("\n");
 }
 
+static void dump_ump_utility_event(const unsigned int *ump)
+{
+	unsigned char status = snd_ump_msg_status(ump);
+	unsigned int val = *ump & 0xfffff;
+
+	printf("          ");
+	switch (status) {
+	case SND_UMP_UTILITY_MSG_STATUS_NOOP:
+		printf("Noop\n");
+		break;
+	case SND_UMP_UTILITY_MSG_STATUS_JR_CLOCK:
+		printf("JR Clock               value %d\n", val);
+		break;
+	case SND_UMP_UTILITY_MSG_STATUS_JR_TSTAMP:
+		printf("JR Timestamp           value %d\n", val);
+		break;
+	case SND_UMP_UTILITY_MSG_STATUS_DCTPQ:
+		printf("DCTPQ                  value %d\n", val);
+		break;
+	case SND_UMP_UTILITY_MSG_STATUS_DC:
+		printf("DC Ticks               value %d\n", val);
+		break;
+	default:
+		printf("UMP Utility event: status = %d, 0x%08x\n",
+		       status, *ump);
+		break;
+	}
+}
+
+static void dump_ump_system_event(const unsigned int *ump)
+{
+	const snd_ump_msg_system_t *m = (const snd_ump_msg_system_t *)ump;
+
+	printf("Group %2d, ", group_number(m->group));
+	switch (m->status) {
+	case SND_UMP_MSG_MIDI_TIME_CODE:
+		printf("MIDI Time Code         value %d\n", m->parm1);
+		break;
+	case SND_UMP_MSG_SONG_POSITION:
+		printf("Song position pointer  value %d\n",
+		       ((unsigned int)m->parm2 << 7) | m->parm1);
+		break;
+	case SND_UMP_MSG_SONG_SELECT:
+		printf("Song select            value %d\n", m->parm1);
+		break;
+	case SND_UMP_MSG_TUNE_REQUEST:
+		printf("Tune request\n");
+		break;
+	case SND_UMP_MSG_TIMING_CLOCK:
+		printf("Timing clock\n");
+		break;
+	case SND_UMP_MSG_START:
+		printf("Start\n");
+		break;
+	case SND_UMP_MSG_CONTINUE:
+		printf("Continue\n");
+		break;
+	case SND_UMP_MSG_STOP:
+		printf("Stop\n");
+		break;
+	case SND_UMP_MSG_ACTIVE_SENSING:
+		printf("Active sensing\n");
+		break;
+	case SND_UMP_MSG_RESET:
+		printf("Reset\n");
+		break;
+	default:
+		printf("UMP System event: status = %d, 0x%08x\n",
+		       m->status, *ump);
+		break;
+	}
+}
+
 static void dump_ump_event(const snd_seq_ump_event_t *ev)
 {
 	if (!snd_seq_ev_is_ump(ev)) {
@@ -605,6 +678,12 @@ static void dump_ump_event(const snd_seq_ump_event_t *ev)
 	printf("%3d:%-3d ", ev->source.client, ev->source.port);
 
 	switch (snd_ump_msg_type(ev->ump)) {
+	case SND_UMP_MSG_TYPE_UTILITY:
+		dump_ump_utility_event(ev->ump);
+		break;
+	case SND_UMP_MSG_TYPE_SYSTEM:
+		dump_ump_system_event(ev->ump);
+		break;
 	case SND_UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE:
 		dump_ump_midi1_event(ev->ump);
 		break;
-- 
2.43.0

