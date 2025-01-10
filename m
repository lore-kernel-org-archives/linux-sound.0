Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5584211A36
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524791; cv=none; b=jAtVUFWxGgs4TjpSww+OHEJCux9nkLwu3BUAiVjgo++O1UcGE4dB1IthyBVi1VKesx06lxTbmEQj088RBz8soTvhr6fW6v8BdDJkiro8CNjCux2DEVSzMiz+ZVx2pfLr/dkN+hz13swKDQHAUxNKCsX28OYCbhbnp2U4Qudolj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524791; c=relaxed/simple;
	bh=7X1x52fKTiqBzT+wXW9rFVuH0TwZhX+KtyKzxF3KgP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxjcBTlshiLbKwbllZ9gJVER8pfRubul/NygX+Ajt3hpTk0mYOwQZnGNrH3FYSc5pSec9kYygbJYqW7FnQHEYqzzA+uF6BAkCgLExuL7FAOuWem1NMQruNMuk2TeZ26V5cyDxAinTaWqb1jk6H/RAyHinYPEP7p+h5Yv+afOMYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2711421198;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D6B313A86;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YB4WAvRDgWefEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 15:59:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 4/8] ALSA: ump: Copy FB name string more safely
Date: Fri, 10 Jan 2025 16:59:37 +0100
Message-ID: <20250110155943.31578-5-tiwai@suse.de>
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
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 2711421198
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 

The UMP group names are referred as the corresponding sequencer port
names, hence they should be proper ASCII strings.  OTOH, the UMP group
names are composed from the UMP FB strings that are received from the
device; i.e. a device may give some bogus letters and we can't trust
them fully.

To assure that the group names consist of the proper ASCII strings,
replace the normal string copy and append operations with special ones
that strip the non-printable letters.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index d6cd11be8750..ce2e180ca557 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -53,6 +53,34 @@ static inline void update_legacy_names(struct snd_ump_endpoint *ump)
 }
 #endif
 
+/* copy a string safely with stripping non-printable letters */
+static void safe_copy_string(void *dst, size_t max_dst_size,
+			     const void *src, size_t max_src_size)
+{
+	const unsigned char *s = src;
+	unsigned char *d = dst;
+
+	if (!max_dst_size--)
+		return;
+	for (s = src; max_dst_size && *s && max_src_size--; s++) {
+		if (!isascii(*s) || !isprint(*s))
+			continue;
+		*d++ = *s;
+		max_dst_size--;
+	}
+	*d = 0;
+}
+
+/* append a string safely with stripping non-printable letters */
+static void safe_append_string(void *dst, size_t max_dst_size,
+			       const void *src, size_t max_src_size)
+{
+	unsigned char *d = dst;
+	size_t len = strlen(d);
+
+	safe_copy_string(d + len, max_dst_size - len, src, max_src_size);
+}
+
 static const struct snd_rawmidi_global_ops snd_ump_rawmidi_ops = {
 	.dev_register = snd_ump_dev_register,
 	.dev_unregister = snd_ump_dev_unregister,
@@ -565,16 +593,10 @@ void snd_ump_update_group_attrs(struct snd_ump_endpoint *ump)
 			}
 			if (!*fb->info.name)
 				continue;
-			if (!*group->name) {
-				/* store the first matching name */
-				strscpy(group->name, fb->info.name,
-					sizeof(group->name));
-			} else {
-				/* when overlapping, concat names */
+			if (*group->name)
 				strlcat(group->name, ", ", sizeof(group->name));
-				strlcat(group->name, fb->info.name,
-					sizeof(group->name));
-			}
+			safe_append_string(group->name, sizeof(group->name),
+					   fb->info.name, sizeof(fb->info.name));
 		}
 	}
 }
-- 
2.43.0

