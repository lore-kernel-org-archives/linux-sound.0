Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB6A32255F
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478734; cv=none; b=DjoP/WmcpAkfRmH6QXCYeP1KITBoD774A5ehsFQBIgN9n9+iKOCENBJGQD+9H9bn5+LhMFDwelUzxZH6q+5UW0hkOxJDGLWL/EH2s8VQm8gRKyApAlXqsPEd9MkGxnBz8ch2QLJrtoa0P6Sur2mFycpQ8YyqzNfgtCoru6HOLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478734; c=relaxed/simple;
	bh=rZXoynDvCjRp50MYXCCxEnjYEVNewvH9887eYIS8M2w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWRw3yUa5fCOoK2GEeqVEEo/kVD5VdVKKsA8Hz5BXZsQ3e5JrUE0EOk8ZbBZERV53q7Ed9Hh2tCWSNVBPy3s9zeKb6W2kzclIAt/mUul1//sk5M4kAGx0v+4Nw8phwpbtlEbfLRS56wW1voYsfZxb5FjFZBJFa2RsTsaEZi/n/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XCQ13cyx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/fclTgq5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XCQ13cyx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/fclTgq5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XCQ13cyx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/fclTgq5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XCQ13cyx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/fclTgq5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B317F33ECF;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8SR0N5xUnUVZ3OhpUuxqa3rtu8c5/7fwycmeEdMr4k=;
	b=XCQ13cyx8AA6Z7cYZ3A2YiIFKN409/UrXNHhhKJDCblgaF1lIEIgAMEuaUWEikHbpO6kcQ
	ysOeMMP1pHqXI7RLyT8Fpl4Mdt3VmBU6Z/OgAAZDeywMif3M26THSkyuniKCnYXbfsxzK3
	jQtfk/FL1jVhhiO2+EcoEWoWFeU1gvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8SR0N5xUnUVZ3OhpUuxqa3rtu8c5/7fwycmeEdMr4k=;
	b=/fclTgq5KHO9UhLzWp+z+CM41NVR0tK+9u+6/EQ+diJUBadW98RXZzTXzDyfBW88Wq0PPf
	G7Jy/4n8m+U677Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XCQ13cyx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/fclTgq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8SR0N5xUnUVZ3OhpUuxqa3rtu8c5/7fwycmeEdMr4k=;
	b=XCQ13cyx8AA6Z7cYZ3A2YiIFKN409/UrXNHhhKJDCblgaF1lIEIgAMEuaUWEikHbpO6kcQ
	ysOeMMP1pHqXI7RLyT8Fpl4Mdt3VmBU6Z/OgAAZDeywMif3M26THSkyuniKCnYXbfsxzK3
	jQtfk/FL1jVhhiO2+EcoEWoWFeU1gvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8SR0N5xUnUVZ3OhpUuxqa3rtu8c5/7fwycmeEdMr4k=;
	b=/fclTgq5KHO9UhLzWp+z+CM41NVR0tK+9u+6/EQ+diJUBadW98RXZzTXzDyfBW88Wq0PPf
	G7Jy/4n8m+U677Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9AE3E13A3E;
	Fri, 29 Aug 2025 14:44:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eD+mJLC8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 31/61] ALSA: es1968: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:06 +0200
Message-ID: <20250829144342.4290-32-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B317F33ECF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1968.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 624ba7d47566..a9344c0bcf6b 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -1318,12 +1318,11 @@ static int calc_available_memory_size(struct es1968 *chip)
 	int max_size = 0;
 	struct esm_memory *buf;
 
-	mutex_lock(&chip->memory_mutex);
+	guard(mutex)(&chip->memory_mutex);
 	list_for_each_entry(buf, &chip->buf_list, list) {
 		if (buf->empty && buf->buf.bytes > max_size)
 			max_size = buf->buf.bytes;
 	}
-	mutex_unlock(&chip->memory_mutex);
 	if (max_size >= 128*1024)
 		max_size = 127*1024;
 	return max_size;
@@ -1335,21 +1334,18 @@ static struct esm_memory *snd_es1968_new_memory(struct es1968 *chip, int size)
 	struct esm_memory *buf;
 
 	size = ALIGN(size, ESM_MEM_ALIGN);
-	mutex_lock(&chip->memory_mutex);
+	guard(mutex)(&chip->memory_mutex);
 	list_for_each_entry(buf, &chip->buf_list, list) {
 		if (buf->empty && buf->buf.bytes >= size)
 			goto __found;
 	}
-	mutex_unlock(&chip->memory_mutex);
 	return NULL;
 
 __found:
 	if (buf->buf.bytes > size) {
 		struct esm_memory *chunk = kmalloc(sizeof(*chunk), GFP_KERNEL);
-		if (chunk == NULL) {
-			mutex_unlock(&chip->memory_mutex);
+		if (chunk == NULL)
 			return NULL;
-		}
 		chunk->buf = buf->buf;
 		chunk->buf.bytes -= size;
 		chunk->buf.area += size;
@@ -1359,7 +1355,6 @@ static struct esm_memory *snd_es1968_new_memory(struct es1968 *chip, int size)
 		list_add(&chunk->list, &buf->list);
 	}
 	buf->empty = 0;
-	mutex_unlock(&chip->memory_mutex);
 	return buf;
 }
 
@@ -1368,7 +1363,7 @@ static void snd_es1968_free_memory(struct es1968 *chip, struct esm_memory *buf)
 {
 	struct esm_memory *chunk;
 
-	mutex_lock(&chip->memory_mutex);
+	guard(mutex)(&chip->memory_mutex);
 	buf->empty = 1;
 	if (buf->list.prev != &chip->buf_list) {
 		chunk = list_entry(buf->list.prev, struct esm_memory, list);
@@ -1387,7 +1382,6 @@ static void snd_es1968_free_memory(struct es1968 *chip, struct esm_memory *buf)
 			kfree(chunk);
 		}
 	}
-	mutex_unlock(&chip->memory_mutex);
 }
 
 static void snd_es1968_free_dmabuf(struct es1968 *chip)
-- 
2.50.1

