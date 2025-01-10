Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A5211A39
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524794; cv=none; b=FwhJazcIHl7wscWUjBkoaxPwY0eLZ/M6PRjJYZZzeOJAmZiYgQbcQwtRNkkJUl6cgefiNk7sAGCpUNKsiXpDJB4yigmsq86cSAVN7Wzj6dC933ThQR3tin88mYstPa0gKs0lxwqs/eAIGJw7i0c3mqJNtn26mBX7hvx6l1fFnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524794; c=relaxed/simple;
	bh=bdeJll16GmTy3T4UBhD6JyEHh+Fl2pHUNEHClh0yQWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzyVRAdDmP5wekQzCn9+9B0vIv/80U2E9+UTQdQIYrGJXvE1dJ+xVV5pBD13Kywb5SGnFzqyG16b6t+/jOinVaUzgyQqM2ph9O0YaSCPZin4LdR4OB633oXJ13COi30BN1fg9ey4XLv+hv453NqJhgOSKoYvdGOiZFERCMg0sqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 680372119C;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D65D13A86;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CHuiEfRDgWefEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 15:59:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6/8] ALSA: ump: Update rawmidi name per EP name update
Date: Fri, 10 Jan 2025 16:59:39 +0100
Message-ID: <20250110155943.31578-7-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110155943.31578-1-tiwai@suse.de>
References: <20250110155943.31578-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 680372119C
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

The rawmidi name string should be updated dynamically when the device
receives the UMP EP name update, too.  Both the core and legacy
rawmidi names are updated.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 5c4dc4dc9ac8..c80a0a8b7ad0 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -37,6 +37,7 @@ static int process_legacy_output(struct snd_ump_endpoint *ump,
 				 u32 *buffer, int count);
 static void process_legacy_input(struct snd_ump_endpoint *ump, const u32 *src,
 				 int words);
+static void ump_legacy_set_rawmidi_name(struct snd_ump_endpoint *ump);
 static void update_legacy_names(struct snd_ump_endpoint *ump);
 #else
 static inline int process_legacy_output(struct snd_ump_endpoint *ump,
@@ -48,6 +49,9 @@ static inline void process_legacy_input(struct snd_ump_endpoint *ump,
 					const u32 *src, int words)
 {
 }
+static inline void ump_legacy_set_rawmidi_name(struct snd_ump_endpoint *ump)
+{
+}
 static inline void update_legacy_names(struct snd_ump_endpoint *ump)
 {
 }
@@ -751,8 +755,16 @@ static void ump_set_rawmidi_name(struct snd_ump_endpoint *ump)
 static int ump_handle_ep_name_msg(struct snd_ump_endpoint *ump,
 				  const union snd_ump_stream_msg *buf)
 {
-	return ump_append_string(ump, ump->info.name, sizeof(ump->info.name),
-				 buf->raw, 2);
+	int ret;
+
+	ret = ump_append_string(ump, ump->info.name, sizeof(ump->info.name),
+				buf->raw, 2);
+	if (ret && ump->parsed) {
+		ump_set_rawmidi_name(ump);
+		ump_legacy_set_rawmidi_name(ump);
+	}
+
+	return ret;
 }
 
 /* handle EP product id stream message; update the UMP product_id string */
@@ -1308,6 +1320,14 @@ static void update_legacy_names(struct snd_ump_endpoint *ump)
 	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
 }
 
+static void ump_legacy_set_rawmidi_name(struct snd_ump_endpoint *ump)
+{
+	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
+
+	snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
+		 ump->core.name);
+}
+
 int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 				  char *id, int device)
 {
@@ -1338,12 +1358,11 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 	if (output)
 		snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
 				    &snd_ump_legacy_output_ops);
-	snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
-		 ump->core.name);
 	rmidi->info_flags = ump->core.info_flags & ~SNDRV_RAWMIDI_INFO_UMP;
 	rmidi->ops = &snd_ump_legacy_ops;
 	rmidi->private_data = ump;
 	ump->legacy_rmidi = rmidi;
+	ump_legacy_set_rawmidi_name(ump);
 	update_legacy_names(ump);
 
 	rmidi->tied_device = ump->core.device;
-- 
2.43.0

