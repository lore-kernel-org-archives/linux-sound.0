Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8342E651
	for <linux-sound@vger.kernel.org>; Wed, 17 Jul 2024 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721205177; cv=none; b=Zm13Qro9ZrXt5WikG0mEQ9XmiHirNajgGrfJ21qJPi9CgbvibunCKWOEAo1W3i4DJ+++uVsnHcE0u20Ph6gCUKBqXzPrz+N8XYgOKRNGNBtWuOefeSFYOGNYWQBL/O0j4EeaiECGPnWOrJtHIqgideTMJF+uHynt6mVkEmQYxFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721205177; c=relaxed/simple;
	bh=gn8a6+t5OkKQIZ8C27iuFzsnMS2lKmlhu5dIQFt/yxo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Zveb4Q+FsOM7o2JQbGT2YGIJMm09yrgpYJHJOv6dSL/294uWLuAxFRyR530GiQbUmLztWazegqCzt08AJN/w9N6cUsKOilofLzy/PSqwJ4ci4/VVvq1HAIRyWz9lmvME9BSw+f9wGIQ0vDrHJNAUQuFuM04QulC+vEjjrexqaP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LeTdyeI7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n+iJh38M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LeTdyeI7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n+iJh38M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LeTdyeI7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n+iJh38M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LeTdyeI7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n+iJh38M"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6DA4F1FB63;
	Wed, 17 Jul 2024 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721205173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+UW3luWzxlfgPBApeX5rScZFkdqcrmV1744Orp8ghJQ=;
	b=LeTdyeI76LxgC0/QhbxkZcKimZquMLP22byw4wIkDXc6AiUdWM1ularFVmUFP5Q+GF9Djk
	QeJPAd/H9FpBHljPDrxNPxZsxMPQnWiG6JitdLy1O86qRQ32EC65pmu4e9vDhsr6H7HivO
	dKQZ8TxFzgD0nl5kv/mGHRzUQMFm9OU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721205173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+UW3luWzxlfgPBApeX5rScZFkdqcrmV1744Orp8ghJQ=;
	b=n+iJh38M3ZWxYaqRFDrsNyhtFObaPBDMJAq571KFLoI2yCI2zhOXzQwsZ5YKtbVKZ26NhD
	r6m7uGIg8Em6pLBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721205173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+UW3luWzxlfgPBApeX5rScZFkdqcrmV1744Orp8ghJQ=;
	b=LeTdyeI76LxgC0/QhbxkZcKimZquMLP22byw4wIkDXc6AiUdWM1ularFVmUFP5Q+GF9Djk
	QeJPAd/H9FpBHljPDrxNPxZsxMPQnWiG6JitdLy1O86qRQ32EC65pmu4e9vDhsr6H7HivO
	dKQZ8TxFzgD0nl5kv/mGHRzUQMFm9OU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721205173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=+UW3luWzxlfgPBApeX5rScZFkdqcrmV1744Orp8ghJQ=;
	b=n+iJh38M3ZWxYaqRFDrsNyhtFObaPBDMJAq571KFLoI2yCI2zhOXzQwsZ5YKtbVKZ26NhD
	r6m7uGIg8Em6pLBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5302D1368F;
	Wed, 17 Jul 2024 08:32:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UKv3ErWBl2apFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jul 2024 08:32:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: ump: Skip useless ports for static blocks
Date: Wed, 17 Jul 2024 10:33:01 +0200
Message-ID: <20240717083322.25892-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

When the UMP Endpoint is configured with static blocks, the block
configuration will never change, hence the unused ports will be
unchanged as well.  Creating sequencer ports for those unused ports
is simply useless, and it might be rather confusing for users.
The idea behind the inactive ports was for allowing connections
from/to ports that can become usable later, but this will never
happen for inactive groups in static blocks.

Let's change the sequencer UMP binding to skip those unused ports when
the UMP EP is with static blocks.

Fixes: 81fd444aa371 ("ALSA: seq: Bind UMP device")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_client.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index c627d72f7fe2..b1dadd7ad324 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -28,6 +28,7 @@ struct seq_ump_group {
 	int group;			/* group index (0-based) */
 	unsigned int dir_bits;		/* directions */
 	bool active;			/* activeness */
+	bool valid;			/* valid group (referred by blocks) */
 	char name[64];			/* seq port name */
 };
 
@@ -210,6 +211,13 @@ static void fill_port_info(struct snd_seq_port_info *port,
 		sprintf(port->name, "Group %d", group->group + 1);
 }
 
+/* skip non-existing group for static blocks */
+static bool skip_group(struct seq_ump_client *client, struct seq_ump_group *group)
+{
+	return !group->valid &&
+		(client->ump->info.flags & SNDRV_UMP_EP_INFO_STATIC_BLOCKS);
+}
+
 /* create a new sequencer port per UMP group */
 static int seq_ump_group_init(struct seq_ump_client *client, int group_index)
 {
@@ -217,6 +225,9 @@ static int seq_ump_group_init(struct seq_ump_client *client, int group_index)
 	struct snd_seq_port_info *port __free(kfree) = NULL;
 	struct snd_seq_port_callback pcallbacks;
 
+	if (skip_group(client, group))
+		return 0;
+
 	port = kzalloc(sizeof(*port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
@@ -250,6 +261,9 @@ static void update_port_infos(struct seq_ump_client *client)
 		return;
 
 	for (i = 0; i < SNDRV_UMP_MAX_GROUPS; i++) {
+		if (skip_group(client, &client->groups[i]))
+			continue;
+
 		old->addr.client = client->seq_client;
 		old->addr.port = i;
 		err = snd_seq_kernel_client_ctl(client->seq_client,
@@ -284,6 +298,7 @@ static void update_group_attrs(struct seq_ump_client *client)
 		group->dir_bits = 0;
 		group->active = 0;
 		group->group = i;
+		group->valid = false;
 	}
 
 	list_for_each_entry(fb, &client->ump->block_list, list) {
@@ -291,6 +306,7 @@ static void update_group_attrs(struct seq_ump_client *client)
 			break;
 		group = &client->groups[fb->info.first_group];
 		for (i = 0; i < fb->info.num_groups; i++, group++) {
+			group->valid = true;
 			if (fb->info.active)
 				group->active = 1;
 			switch (fb->info.direction) {
-- 
2.43.0

