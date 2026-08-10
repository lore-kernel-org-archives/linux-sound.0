Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9FF28033B;
	Mon, 10 Aug 2026 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369052; cv=none; b=nPqHKDCP9uyM5zOTvaYRXUSTanFwCwhnQLMh+tlDzwQWXUbP5AUZ8IOS1nxpd72rl+lmW3ka0FYsetU9siJmdWVjPcFABC1ZIGOYW9cfvemmULybCESb22zuTJ1bU1GnNl0kPasXPUEB7FXmquLq94F25ZVxBZdKLuEGltp3wg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369052; c=relaxed/simple;
	bh=Zjq1Q8CeoiFpm5gURvKJ6CGk/x0CqTDUS1AkevgWyLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dpb5XGQwdaEK712hA423q9Lj0O8UdKjUzCoyo83ltJe3NpXXSLXoWxGGnV6RonVu9FexmJM7iXIdSSQ6UhLo9K8yo1AiCEpO71UvV2LCXMsulBX40pe7HQBaNw8BIaHaekiXaZjZSxRl5dSrnILso1fzOIiYvZP4BZEoJG84xBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=e0cJB/I0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5/jtI7ss; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0v81DiJa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/QW1tjKh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e0cJB/I0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5/jtI7ss";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0v81DiJa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/QW1tjKh"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 377433DF6;
	Mon, 10 Aug 2026 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HfLb0hKzmLBwjDNiuOQe4KtAHV9fyQ/UPZ2Erumlck=;
	b=e0cJB/I0trzBcK4KTHnZ8ePNDfjRBj+TTU7IJ6U5JnBlDb+lWQeRLpf9gaqjVwAsJ3Et+w
	gkmVGDm7EGY7EAPGS5Cwar1J0l66iLvDx80uIKysuP6pTtIrVG7L3YbhbEwQ+StT4ulrjB
	RZcv0GG31BbpVISW6im1MBVPr2O5C/I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HfLb0hKzmLBwjDNiuOQe4KtAHV9fyQ/UPZ2Erumlck=;
	b=5/jtI7ssI4paAfyxruyJ95eLNDWvY0XWNIq3AgG6wl3aRlFh/tJfhO4pzjiiFiKwcAWWhp
	TPNfYNLVnsTnQGCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0v81DiJa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/QW1tjKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HfLb0hKzmLBwjDNiuOQe4KtAHV9fyQ/UPZ2Erumlck=;
	b=0v81DiJajFMDRRe3xP/ZwNQ6yfdTzV9lDB8qf/k2QbXm7ENy0WV/TZlPCnh6W7jBGft0gB
	CdIitBeltxI11eEEhXkKcNySbSWCpyx1Cl4ZeQop7zECpD+79v91GQW7Yu5O+oJUY18gIz
	tTF5LTPpn79s9hcWDfNAooJ+Y2m3bW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HfLb0hKzmLBwjDNiuOQe4KtAHV9fyQ/UPZ2Erumlck=;
	b=/QW1tjKh+xvp9enIKeDDx8sMF/gFlcLtGt/ERi/xh2RyRh0J6IrbL4WHIsEYyHNgMzTt7d
	7uxol6VTYt823pDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71FB5779C3;
	Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MBisGgnUeWq3HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 13:37:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] ALSA: seq: Use RCU for the UMP client output substream
Date: Mon, 10 Aug 2026 15:37:06 +0200
Message-ID: <20260810133711.42483-6-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810133711.42483-1-tiwai@suse.de>
References: <20260810133711.42483-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 377433DF6
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

The UMP sequencer client protects its output rawmidi file (out_rfile)
with an rwlock (output_lock).  seq_ump_process_event(), the port's
event_input callback, reads out_rfile.output under read_lock on every
delivered UMP event, while the open/close paths (serialized by
ump->open_mutex) publish and clear out_rfile under write_lock.

Output is opened/closed only on the subscribe/use lifecycle while
delivery happens per event, so this is another read-mostly hot path.
Convert it to RCU and drop the rwlock.  out_rfile is an embedded struct
rather than a pointer, so instead of restructuring it, add an
RCU-protected shadow of the substream (out_substream) for the reader;
out_rfile itself becomes writer-only state accessed solely under
open_mutex.  The reader now runs lock-free under rcu_read_lock() via
rcu_dereference(), and open publishes the substream with
rcu_assign_pointer().

On close the substream is cleared with rcu_assign_pointer(NULL) and the
rawmidi is released only after synchronize_rcu(), so no reader in the
delivery path can still be writing to the substream when
snd_rawmidi_kernel_release() runs.

Dropping write_lock_irqsave() from the writers is safe: they run in
process context under open_mutex, and the sole atomic reader now uses
RCU, which is IRQ-safe.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_client.c | 38 +++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index ccd93599b493..4c1e81db376f 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -37,8 +37,11 @@ struct seq_ump_client {
 	struct snd_ump_endpoint *ump;	/* assigned endpoint */
 	int seq_client;			/* sequencer client id */
 	int opened[2];			/* current opens for each direction */
-	rwlock_t output_lock;		/* protects out_rfile output access */
 	struct snd_rawmidi_file out_rfile; /* rawmidi for output */
+	/* RCU-protected shadow of out_rfile.output for the delivery hot path;
+	 * out_rfile itself is only touched by open/close under open_mutex
+	 */
+	struct snd_rawmidi_substream __rcu *out_substream;
 	struct seq_ump_input_buffer input; /* input parser context */
 	void *ump_info[SNDRV_UMP_MAX_BLOCKS + 1]; /* shadow of seq client ump_info */
 	struct work_struct group_notify_work; /* FB change notification */
@@ -89,8 +92,8 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
 	unsigned char type;
 	int len;
 
-	guard(read_lock_irqsave)(&client->output_lock);
-	substream = client->out_rfile.output;
+	guard(rcu)();
+	substream = rcu_dereference(client->out_substream);
 	if (!substream)
 		return -ENODEV;
 	if (!snd_seq_ev_is_ump(ev))
@@ -108,19 +111,22 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
 static int seq_ump_client_open(struct seq_ump_client *client, int dir)
 {
 	struct snd_ump_endpoint *ump = client->ump;
-	struct snd_rawmidi_file rfile = {};
 	int err;
 
 	guard(mutex)(&ump->open_mutex);
 	if (dir == STR_OUT && !client->opened[dir]) {
+		/* out_rfile is only accessed under open_mutex; the delivery
+		 * path reads out_substream via RCU, so open into out_rfile
+		 * directly and publish the substream afterwards
+		 */
 		err = snd_rawmidi_kernel_open(&ump->core, 0,
 					      SNDRV_RAWMIDI_LFLG_OUTPUT |
 					      SNDRV_RAWMIDI_LFLG_APPEND,
-					      &rfile);
+					      &client->out_rfile);
 		if (err < 0)
 			return err;
-		scoped_guard(write_lock_irqsave, &client->output_lock)
-			client->out_rfile = rfile;
+		rcu_assign_pointer(client->out_substream,
+				   client->out_rfile.output);
 	}
 	client->opened[dir]++;
 	return 0;
@@ -130,17 +136,18 @@ static int seq_ump_client_open(struct seq_ump_client *client, int dir)
 static int seq_ump_client_close(struct seq_ump_client *client, int dir)
 {
 	struct snd_ump_endpoint *ump = client->ump;
-	struct snd_rawmidi_file rfile = {};
 
 	guard(mutex)(&ump->open_mutex);
 	if (!--client->opened[dir]) {
-		if (dir == STR_OUT) {
-			scoped_guard(write_lock_irqsave, &client->output_lock) {
-				rfile = client->out_rfile;
-				client->out_rfile = (struct snd_rawmidi_file){};
-			}
-			if (rfile.rmidi)
-				snd_rawmidi_kernel_release(&rfile);
+		if (dir == STR_OUT && client->out_rfile.rmidi) {
+			rcu_assign_pointer(client->out_substream, NULL);
+			/* wait for a grace period so that no reader in the
+			 * delivery path is still writing to the substream
+			 * before it is released
+			 */
+			synchronize_rcu();
+			snd_rawmidi_kernel_release(&client->out_rfile);
+			client->out_rfile = (struct snd_rawmidi_file){};
 		}
 	}
 	return 0;
@@ -480,7 +487,6 @@ static int snd_seq_ump_probe(struct snd_seq_device *dev)
 
 	INIT_WORK(&client->group_notify_work, handle_group_notify);
 	client->ump = ump;
-	rwlock_init(&client->output_lock);
 
 	client->seq_client =
 		snd_seq_create_kernel_client(card, ump->core.device,
-- 
2.55.0

