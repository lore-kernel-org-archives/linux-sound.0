Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A171823A9
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262363; cv=none; b=duQhLniK+oIENewzskTsPmaHW8JrTrQZjQmyPDqT1FGbiTJLiTtIOFUFjUDvBPVYH/1KOeDF3nUMWbktf209nz8rzGLSEwhWXG/X9C3Uj6DeKSl8sh9KX2TKB3YkRqCTaRWU4zXG0nJlxGAbTyC8iuDQ78fr/0LZubgyQ5FahPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262363; c=relaxed/simple;
	bh=xm+I1CisCwTMo0VNMz8vtvQIxE3Y3AY9j0H4GY+Vo8M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=FGSBjLMfKeFG5LNmMN5mWhMotVRExRoiOhe03P96qXyfPxgb/nkM0/dNXmHoNrC4tEdOvJqwnSFkKiVShzTmjY6JXVZslmPuq6cUyr+S7FMoIBPwI4IeH7l+9nTf9i1PHmDrzNcSY1XhNb54g285ELZpubXjVLbiK4NfJg5MP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wwE9Ms7o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8M2ykcDt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wwE9Ms7o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8M2ykcDt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wwE9Ms7o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8M2ykcDt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wwE9Ms7o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8M2ykcDt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 730F121A92;
	Mon, 29 Jul 2024 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722262359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UVQuOp4wMg61AS0QCKf/OyBOpONjI330tqlJXsDsnSw=;
	b=wwE9Ms7ov/IOB7xXNfD/Xh0LAtGGQBd60R2iE+IU8pEQkhlFPN8wEDR1ntKoh+Y71ho/sk
	9XAQkD3nwo2Zas5HO/Z/RB7PixRU3OoJO/78FilTgTYWyJRlKrHKOFJC7ojIaiRUZSdE7g
	NpZMOo1+YIV+sd+GnuBY9E+RmzH3Tg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722262359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UVQuOp4wMg61AS0QCKf/OyBOpONjI330tqlJXsDsnSw=;
	b=8M2ykcDt46T3we48w0d3jenCHtAJOV6vsECGLWSk0QDyHojMdNZqIHFxCHE/XiGks5u/xe
	CoOuJ+3/hclhTIBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722262359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UVQuOp4wMg61AS0QCKf/OyBOpONjI330tqlJXsDsnSw=;
	b=wwE9Ms7ov/IOB7xXNfD/Xh0LAtGGQBd60R2iE+IU8pEQkhlFPN8wEDR1ntKoh+Y71ho/sk
	9XAQkD3nwo2Zas5HO/Z/RB7PixRU3OoJO/78FilTgTYWyJRlKrHKOFJC7ojIaiRUZSdE7g
	NpZMOo1+YIV+sd+GnuBY9E+RmzH3Tg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722262359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UVQuOp4wMg61AS0QCKf/OyBOpONjI330tqlJXsDsnSw=;
	b=8M2ykcDt46T3we48w0d3jenCHtAJOV6vsECGLWSk0QDyHojMdNZqIHFxCHE/XiGks5u/xe
	CoOuJ+3/hclhTIBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5951A138A7;
	Mon, 29 Jul 2024 14:12:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EtWdFFejp2aBZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 14:12:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Update substream name from assigned FB names
Date: Mon, 29 Jul 2024 16:13:14 +0200
Message-ID: <20240729141315.18253-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

We had a nice name scheme in ALSA sequencer UMP binding for each
sequencer port referring to each assigned Function Block name, while
the legacy rawmidi refers only to the UMP Endpoint name.  It's better
to align both.

This patch moves the UMP Group attribute update functions into the
core UMP code from the sequencer binding code, and improve the
substream name of the legacy rawmidi.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h             | 10 +++++
 sound/core/seq/seq_ump_client.c | 75 +++------------------------------
 sound/core/ump.c                | 74 ++++++++++++++++++++++++++++++--
 3 files changed, 86 insertions(+), 73 deletions(-)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 91238dabe307..7f68056acdff 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -13,6 +13,14 @@ struct snd_ump_ops;
 struct ump_cvt_to_ump;
 struct snd_seq_ump_ops;
 
+struct snd_ump_group {
+	int group;			/* group index (0-based) */
+	unsigned int dir_bits;		/* directions */
+	bool active;			/* activeness */
+	bool valid;			/* valid group (referred by blocks) */
+	char name[64];			/* group name */
+};
+
 struct snd_ump_endpoint {
 	struct snd_rawmidi core;	/* raw UMP access */
 
@@ -41,6 +49,8 @@ struct snd_ump_endpoint {
 
 	struct mutex open_mutex;
 
+	struct snd_ump_group groups[SNDRV_UMP_MAX_GROUPS]; /* table of groups */
+
 #if IS_ENABLED(CONFIG_SND_UMP_LEGACY_RAWMIDI)
 	spinlock_t legacy_locks[2];
 	struct snd_rawmidi *legacy_rmidi;
diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 9cdfbeae3ed5..637154bd1a3f 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -23,15 +23,6 @@ enum {
 	STR_OUT = SNDRV_RAWMIDI_STREAM_OUTPUT
 };
 
-/* object per UMP group; corresponding to a sequencer port */
-struct seq_ump_group {
-	int group;			/* group index (0-based) */
-	unsigned int dir_bits;		/* directions */
-	bool active;			/* activeness */
-	bool valid;			/* valid group (referred by blocks) */
-	char name[64];			/* seq port name */
-};
-
 /* context for UMP input parsing, per EP */
 struct seq_ump_input_buffer {
 	unsigned char len;		/* total length in words */
@@ -48,7 +39,6 @@ struct seq_ump_client {
 	int opened[2];			/* current opens for each direction */
 	struct snd_rawmidi_file out_rfile; /* rawmidi for output */
 	struct seq_ump_input_buffer input; /* input parser context */
-	struct seq_ump_group groups[SNDRV_UMP_MAX_GROUPS]; /* table of groups */
 	void *ump_info[SNDRV_UMP_MAX_BLOCKS + 1]; /* shadow of seq client ump_info */
 	struct work_struct group_notify_work; /* FB change notification */
 };
@@ -175,7 +165,7 @@ static int seq_ump_unuse(void *pdata, struct snd_seq_port_subscribe *info)
 /* fill port_info from the given UMP EP and group info */
 static void fill_port_info(struct snd_seq_port_info *port,
 			   struct seq_ump_client *client,
-			   struct seq_ump_group *group)
+			   struct snd_ump_group *group)
 {
 	unsigned int rawmidi_info = client->ump->core.info_flags;
 
@@ -212,7 +202,7 @@ static void fill_port_info(struct snd_seq_port_info *port,
 }
 
 /* skip non-existing group for static blocks */
-static bool skip_group(struct seq_ump_client *client, struct seq_ump_group *group)
+static bool skip_group(struct seq_ump_client *client, struct snd_ump_group *group)
 {
 	return !group->valid &&
 		(client->ump->info.flags & SNDRV_UMP_EP_INFO_STATIC_BLOCKS);
@@ -221,7 +211,7 @@ static bool skip_group(struct seq_ump_client *client, struct seq_ump_group *grou
 /* create a new sequencer port per UMP group */
 static int seq_ump_group_init(struct seq_ump_client *client, int group_index)
 {
-	struct seq_ump_group *group = &client->groups[group_index];
+	struct snd_ump_group *group = &client->ump->groups[group_index];
 	struct snd_seq_port_info *port __free(kfree) = NULL;
 	struct snd_seq_port_callback pcallbacks;
 
@@ -261,7 +251,7 @@ static void update_port_infos(struct seq_ump_client *client)
 		return;
 
 	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++) {
-		if (skip_group(client, &client->groups[i]))
+		if (skip_group(client, &client->ump->groups[i]))
 			continue;
 
 		old->addr.client = client->seq_client;
@@ -271,7 +261,7 @@ static void update_port_infos(struct seq_ump_client *client)
 						old);
 		if (err < 0)
 			return;
-		fill_port_info(new, client, &client->groups[i]);
+		fill_port_info(new, client, &client->ump->groups[i]);
 		if (old->capability == new->capability &&
 		    !strcmp(old->name, new->name))
 			continue;
@@ -285,57 +275,6 @@ static void update_port_infos(struct seq_ump_client *client)
 	}
 }
 
-/* update dir_bits and active flag for all groups in the client */
-static void update_group_attrs(struct seq_ump_client *client)
-{
-	struct snd_ump_block *fb;
-	struct seq_ump_group *group;
-	int i;
-
-	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++) {
-		group = &client->groups[i];
-		*group->name = 0;
-		group->dir_bits = 0;
-		group->active = 0;
-		group->group = i;
-		group->valid = false;
-	}
-
-	list_for_each_entry(fb, &client->ump->block_list, list) {
-		if (fb->info.first_group + fb->info.num_groups > SNDRV_UMP_MAX_GROUPS)
-			break;
-		group = &client->groups[fb->info.first_group];
-		for (i = 0; i < fb->info.num_groups; i++, group++) {
-			group->valid = true;
-			if (fb->info.active)
-				group->active = 1;
-			switch (fb->info.direction) {
-			case SNDRV_UMP_DIR_INPUT:
-				group->dir_bits |= (1 << STR_IN);
-				break;
-			case SNDRV_UMP_DIR_OUTPUT:
-				group->dir_bits |= (1 << STR_OUT);
-				break;
-			case SNDRV_UMP_DIR_BIDIRECTION:
-				group->dir_bits |= (1 << STR_OUT) | (1 << STR_IN);
-				break;
-			}
-			if (!*fb->info.name)
-				continue;
-			if (!*group->name) {
-				/* store the first matching name */
-				strscpy(group->name, fb->info.name,
-					sizeof(group->name));
-			} else {
-				/* when overlapping, concat names */
-				strlcat(group->name, ", ", sizeof(group->name));
-				strlcat(group->name, fb->info.name,
-					sizeof(group->name));
-			}
-		}
-	}
-}
-
 /* create a UMP Endpoint port */
 static int create_ump_endpoint_port(struct seq_ump_client *client)
 {
@@ -432,7 +371,7 @@ static void setup_client_group_filter(struct seq_ump_client *client)
 		return;
 	filter = ~(1U << 0); /* always allow groupless messages */
 	for (p = 0; p < SNDRV_UMP_MAX_GROUPS; p++) {
-		if (client->groups[p].active)
+		if (client->ump->groups[p].active)
 			filter &= ~(1U << (p + 1));
 	}
 	cptr->group_filter = filter;
@@ -445,7 +384,6 @@ static void handle_group_notify(struct work_struct *work)
 	struct seq_ump_client *client =
 		container_of(work, struct seq_ump_client, group_notify_work);
 
-	update_group_attrs(client);
 	update_port_infos(client);
 	setup_client_group_filter(client);
 }
@@ -508,7 +446,6 @@ static int snd_seq_ump_probe(struct device *_dev)
 		client->ump_info[fb->info.block_id + 1] = &fb->info;
 
 	setup_client_midi_version(client);
-	update_group_attrs(client);
 
 	for (p = 0; p < SNDRV_UMP_MAX_GROUPS; p++) {
 		err = seq_ump_group_init(client, p);
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 0f0d7e895c5a..e39e9cda4912 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -524,6 +524,58 @@ static void snd_ump_proc_read(struct snd_info_entry *entry,
 	}
 }
 
+/* update dir_bits and active flag for all groups in the client */
+static void update_group_attrs(struct snd_ump_endpoint *ump)
+{
+	struct snd_ump_block *fb;
+	struct snd_ump_group *group;
+	int i;
+
+	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++) {
+		group = &ump->groups[i];
+		*group->name = 0;
+		group->dir_bits = 0;
+		group->active = 0;
+		group->group = i;
+		group->valid = false;
+	}
+
+	list_for_each_entry(fb, &ump->block_list, list) {
+		if (fb->info.first_group + fb->info.num_groups > SNDRV_UMP_MAX_GROUPS)
+			break;
+		group = &ump->groups[fb->info.first_group];
+		for (i = 0; i < fb->info.num_groups; i++, group++) {
+			group->valid = true;
+			if (fb->info.active)
+				group->active = 1;
+			switch (fb->info.direction) {
+			case SNDRV_UMP_DIR_INPUT:
+				group->dir_bits |= (1 << SNDRV_RAWMIDI_STREAM_INPUT);
+				break;
+			case SNDRV_UMP_DIR_OUTPUT:
+				group->dir_bits |= (1 << SNDRV_RAWMIDI_STREAM_OUTPUT);
+				break;
+			case SNDRV_UMP_DIR_BIDIRECTION:
+				group->dir_bits |= (1 << SNDRV_RAWMIDI_STREAM_INPUT) |
+					(1 << SNDRV_RAWMIDI_STREAM_OUTPUT);
+				break;
+			}
+			if (!*fb->info.name)
+				continue;
+			if (!*group->name) {
+				/* store the first matching name */
+				strscpy(group->name, fb->info.name,
+					sizeof(group->name));
+			} else {
+				/* when overlapping, concat names */
+				strlcat(group->name, ", ", sizeof(group->name));
+				strlcat(group->name, fb->info.name,
+					sizeof(group->name));
+			}
+		}
+	}
+}
+
 /*
  * UMP endpoint and function block handling
  */
@@ -792,8 +844,10 @@ static int ump_handle_fb_info_msg(struct snd_ump_endpoint *ump,
 
 	if (fb) {
 		fill_fb_info(ump, &fb->info, buf);
-		if (ump->parsed)
+		if (ump->parsed) {
+			update_group_attrs(ump);
 			seq_notify_fb_change(ump, fb);
+		}
 	}
 
 	return 1; /* finished */
@@ -822,8 +876,10 @@ static int ump_handle_fb_name_msg(struct snd_ump_endpoint *ump,
 	ret = ump_append_string(ump, fb->info.name, sizeof(fb->info.name),
 				buf->raw, 3);
 	/* notify the FB name update to sequencer, too */
-	if (ret > 0 && ump->parsed)
+	if (ret > 0 && ump->parsed) {
+		update_group_attrs(ump);
 		seq_notify_fb_change(ump, fb);
+	}
 	return ret;
 }
 
@@ -995,6 +1051,9 @@ int snd_ump_parse_endpoint(struct snd_ump_endpoint *ump)
 			continue;
 	}
 
+	/* initialize group attributions */
+	update_group_attrs(ump);
+
  error:
 	ump->parsed = true;
 	ump_request_close(ump);
@@ -1172,10 +1231,17 @@ static void fill_substream_names(struct snd_ump_endpoint *ump,
 				 struct snd_rawmidi *rmidi, int dir)
 {
 	struct snd_rawmidi_substream *s;
+	const char *name;
+	int idx;
 
-	list_for_each_entry(s, &rmidi->streams[dir].substreams, list)
+	list_for_each_entry(s, &rmidi->streams[dir].substreams, list) {
+		idx = ump->legacy_mapping[s->number];
+		name = ump->groups[idx].name;
+		if (!*name)
+			name = ump->info.name;
 		snprintf(s->name, sizeof(s->name), "Group %d (%.16s)",
-			 ump->legacy_mapping[s->number] + 1, ump->info.name);
+			 idx + 1, name);
+	}
 }
 
 int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
-- 
2.43.0

