Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD132211A2F
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524795; cv=none; b=YABKCQtTr3JY42b/euiVhx1gx/tNZFuQKYh1g4S53FH6+XMnykiPHI715gfWvh6ihUc66IecVONaESD0uNjHWSc6OBeo3F9vBkxZx9bFyXfx6oY9ytadgRwWeE80VgpsyrBQTxFkcE+y6JyxLEbIUzjreGnYCO4oUu5AjSOoiz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524795; c=relaxed/simple;
	bh=z4clsnQfFq3Mt0RQaOm1mQ0i58qK5U5aro+NnLFEDrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Arcb8LH9ICQSfkF+AwoegSC2G/TWg6eScnAPxPYnE0xxaIasOEUvUm0NLUqGRG0oEuD4sdm4L2edZNIzYjDukh8IwEuacTwhuQ6ZsU8IYgQwqfUAVs144GgqemrSCb0f3fZNEUQexvaYFM7jOImZfJ0m6RAgxyzV403bHTdnQXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4727A21199;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CCE713A86;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wPi/CfRDgWefEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 15:59:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 5/8] ALSA: ump: Copy safe string name to rawmidi
Date: Fri, 10 Jan 2025 16:59:38 +0100
Message-ID: <20250110155943.31578-6-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 4727A21199
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

The UMP helper didn't set up the rawmidi name string by itself but
left it to the driver.  But since the only user (USB MIDI2 driver)
picks up the UMP info name string to the rawmidi name as default, it's
better to set up in the UMP core side.

Meanwhile, UMP receives the EP name string from the device, and it
might contain garbage letters.  We should purify the string to be
usable for the kernel as done previously for UMP Group names.

This implements the copy of the UMP info name string into the rawmidi
name at the creation of UMP EP object in a safe way to strip the
non-ASCII or non-printable characters.  Also, change the reference
from the legacy rawmidi and other places to rawmidi name field instead
of ump info; this assures the sane strings.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index ce2e180ca557..5c4dc4dc9ac8 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -740,6 +740,13 @@ static int ump_handle_device_info_msg(struct snd_ump_endpoint *ump,
 	return 1; /* finished */
 }
 
+/* set up the core rawmidi name from UMP EP name string */
+static void ump_set_rawmidi_name(struct snd_ump_endpoint *ump)
+{
+	safe_copy_string(ump->core.name, sizeof(ump->core.name),
+			 ump->info.name, sizeof(ump->info.name));
+}
+
 /* handle EP name stream message; update the UMP name string */
 static int ump_handle_ep_name_msg(struct snd_ump_endpoint *ump,
 				  const union snd_ump_stream_msg *buf)
@@ -1067,6 +1074,8 @@ int snd_ump_parse_endpoint(struct snd_ump_endpoint *ump)
 	if (err < 0)
 		ump_dbg(ump, "Unable to get UMP EP name string\n");
 
+	ump_set_rawmidi_name(ump);
+
 	/* Request Endpoint Product ID */
 	err = ump_req_msg(ump, msg, UMP_STREAM_MSG_REQUEST_PRODUCT_ID,
 			  UMP_STREAM_MSG_STATUS_PRODUCT_ID);
@@ -1283,7 +1292,7 @@ static void update_legacy_substreams(struct snd_ump_endpoint *ump,
 		idx = ump->legacy_mapping[s->number];
 		name = ump->groups[idx].name;
 		if (!*name)
-			name = ump->info.name;
+			name = ump->core.name;
 		scnprintf(s->name, sizeof(s->name), "Group %d (%.16s)%s",
 			  idx + 1, name,
 			  ump->groups[idx].active ? "" : " [Inactive]");
@@ -1330,7 +1339,7 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 		snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
 				    &snd_ump_legacy_output_ops);
 	snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
-		 ump->info.name);
+		 ump->core.name);
 	rmidi->info_flags = ump->core.info_flags & ~SNDRV_RAWMIDI_INFO_UMP;
 	rmidi->ops = &snd_ump_legacy_ops;
 	rmidi->private_data = ump;
-- 
2.43.0

