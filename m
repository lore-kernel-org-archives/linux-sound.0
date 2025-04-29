Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FCF10F2
	for <linux-sound@vger.kernel.org>; Tue, 29 Apr 2025 18:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951792; cv=none; b=F8pQSAcPFfDNacwpg9C2PBKKBV+ojwDog9odMGGIdJQ233rGt0aCZpyVs8eOcZ5KQDA0DSWsvyyhwYxFRGKvessFfqQL2YkFj+EiTiNMolXemwoY9Uiw2YSkEv9rJ9bbj5ACr2t5CfEXCvJpH2/oFZS7v72YCVYpirvvWTbWHuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951792; c=relaxed/simple;
	bh=FVytEU9MRuMzkH/g97rERd39kdFzztV5W5V0+4EZacQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeGZBx2w2EhMmnYuvLeFryvQwfxn7rMAxbaDSabVJ6Ay97oqAMBZTHA4g3JXuwG0bAk/nPtoMSaA/tUe8x+I++gtTOnS2ewO9refjAPvRCMz9Iciru7/zCSyGGfEYGN1v9eLAijNiUvH1JmRqfZ8dl5EQB9CRtcdva89MoZMZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FDIfJ6MQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZaGXN4uH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FDIfJ6MQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZaGXN4uH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FDIfJ6MQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZaGXN4uH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FDIfJ6MQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZaGXN4uH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86E231F391;
	Tue, 29 Apr 2025 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745951788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RoJhViwhrycSZs+p4izA20bApDBr+vDO0qUKgxPuNG8=;
	b=FDIfJ6MQx1g+cBTy4AutpjS8REe/LeWtmQ/J81w2He9sQw5PdSnYfKuBvNMVeBeAGCZTLX
	euWd6CYDtyC+/ILNeRm97TtVs5VH0KStAabvCyHc4hTw4DYr3cr4ANB/OOklLlRyqutcqp
	h05eH4F0qp/JIb1s9iL0jKlU9RpZfWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745951788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RoJhViwhrycSZs+p4izA20bApDBr+vDO0qUKgxPuNG8=;
	b=ZaGXN4uHCr79BeUwnskcOYp634aJThsS7AMdD6viWiSpU8WuizwPlxRenDv/53YGEkQM8i
	moLuo7v8TB9hNHBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FDIfJ6MQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZaGXN4uH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745951788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RoJhViwhrycSZs+p4izA20bApDBr+vDO0qUKgxPuNG8=;
	b=FDIfJ6MQx1g+cBTy4AutpjS8REe/LeWtmQ/J81w2He9sQw5PdSnYfKuBvNMVeBeAGCZTLX
	euWd6CYDtyC+/ILNeRm97TtVs5VH0KStAabvCyHc4hTw4DYr3cr4ANB/OOklLlRyqutcqp
	h05eH4F0qp/JIb1s9iL0jKlU9RpZfWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745951788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=RoJhViwhrycSZs+p4izA20bApDBr+vDO0qUKgxPuNG8=;
	b=ZaGXN4uHCr79BeUwnskcOYp634aJThsS7AMdD6viWiSpU8WuizwPlxRenDv/53YGEkQM8i
	moLuo7v8TB9hNHBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 677FA13931;
	Tue, 29 Apr 2025 18:36:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O1MXGCwcEWgHQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Apr 2025 18:36:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Paul Davis <paul@linuxaudiosystems.com>
Subject: [PATCH] ALSA: usb-audio: Fix duplicated name in MIDI substream names
Date: Tue, 29 Apr 2025 20:36:15 +0200
Message-ID: <20250429183626.20773-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 86E231F391
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The MIDI substream name string is constructed from the combination of
the card shortname (which is taken from USB iProduct) and the USB
iJack.  The problem is that some devices put the product name to the
iJack field, too.  For example, aplaymidi -l output on the Lanchkey MK
49 are like:

  % aplaymidi -l
  Port    Client name            Port name
  44:0    Launchkey MK4 49       Launchkey MK4 49 Launchkey MK4
  44:1    Launchkey MK4 49       Launchkey MK4 49 Launchkey MK4

where the actual iJack name can't be seen because it's truncated due
to the doubly words.

For resolving those situations, this patch compares the iJack string
with the card shortname, and drops if both start with the same words.
Then the result becomes like:

  % aplaymidi -l
  Port    Client name            Port name
  40:0    Launchkey MK4 49       Launchkey MK4 49 MIDI In
  40:1    Launchkey MK4 49       Launchkey MK4 49 DAW In

A caveat is that there are some pre-defined names for certain
devices in the driver code, and this workaround shouldn't be applied
to them.  Similarly, when the iJack isn't specified, we should skip
this check, too.  The patch added those checks in addition to the
string comparison.

Suggested-by: Paul Davis <paul@linuxaudiosystems.com>
Tested-by: Paul Davis <paul@linuxaudiosystems.com>
Link: https://lore.kernel.org/CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index dcdd7e9e1ae9..cfed000f243a 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1885,10 +1885,18 @@ static void snd_usbmidi_init_substream(struct snd_usb_midi *umidi,
 	}
 
 	port_info = find_port_info(umidi, number);
-	name_format = port_info ? port_info->name :
-		(jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
-	snprintf(substream->name, sizeof(substream->name),
-		 name_format, umidi->card->shortname, jack_name, number + 1);
+	if (port_info || jack_name == default_jack_name ||
+	    strncmp(umidi->card->shortname, jack_name, strlen(umidi->card->shortname)) != 0) {
+		name_format = port_info ? port_info->name :
+			(jack_name != default_jack_name  ? "%s %s" : "%s %s %d");
+		snprintf(substream->name, sizeof(substream->name),
+			 name_format, umidi->card->shortname, jack_name, number + 1);
+	} else {
+		/* The manufacturer included the iProduct name in the jack
+		 * name, do not use both
+		 */
+		strscpy(substream->name, jack_name);
+	}
 
 	*rsubstream = substream;
 }
-- 
2.49.0

