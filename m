Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860282EBBA4
	for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774775566; cv=none; b=Xxqezn2LKhUosbt7bpYIjTHZOisNgCVqSIOm2nYmL8JC+KSpJZSxbv2yuhFdtRdjVRh2J83GYemjlCS1OfqJz7Xq3eJtSLPniVdOzypUl9QPibZVD/nUKOjPTAIoH7qXjpfYxfZaM9M6Wmc6Tdh5D22jEUDkguGiPmOcHe8OLS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774775566; c=relaxed/simple;
	bh=/S6vobjTj40ghqqTZYqGG3wxxnEaCeD5PoC6NlAvVOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=izkByUKISD1tPORCGAqAXKbj04ipNKetf47qVm5tfdVEIxw6m5Nu+atC+UlilgEgTqhccDQJ9Gd5BMtfil7HBhk7LlGYaurLDdqQJtP7VQm1YynL1+CzsROLnjRNaP6PR7uZFn5zqydEIexz7HER10sE+WGLfH+u+g4k3iikods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=07xxME6e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/hV18/PT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=07xxME6e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/hV18/PT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="07xxME6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/hV18/PT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="07xxME6e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/hV18/PT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C70F95BDCB;
	Sun, 29 Mar 2026 09:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7GUmA3eUHixvV0DpnlaEfwZZgaKlorVjvRP7VSxPlA=;
	b=07xxME6eNNbo5p3ynL9UAZcLVPpUn4KZrKoA+lI51XSjnZVBP1OTt87WILWANCv4bBZMP5
	w3f+k1y8dpGoXwpi3hJ0nXiVCKMIjLsWzQcxN8UDF3g1aHSGE9Sds5HJyaePZ+ev3oXtaW
	8EYrC9SroafPXw2Q4uGRJMwOYLbmzZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7GUmA3eUHixvV0DpnlaEfwZZgaKlorVjvRP7VSxPlA=;
	b=/hV18/PTNfKCyPfFuy1T9gsGIEdjZJb4I1drKC0XtEFxJEmFzmjZxlk9jnq/NXEYa8kZyV
	+u20QU0NXbCtvGCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7GUmA3eUHixvV0DpnlaEfwZZgaKlorVjvRP7VSxPlA=;
	b=07xxME6eNNbo5p3ynL9UAZcLVPpUn4KZrKoA+lI51XSjnZVBP1OTt87WILWANCv4bBZMP5
	w3f+k1y8dpGoXwpi3hJ0nXiVCKMIjLsWzQcxN8UDF3g1aHSGE9Sds5HJyaePZ+ev3oXtaW
	8EYrC9SroafPXw2Q4uGRJMwOYLbmzZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b7GUmA3eUHixvV0DpnlaEfwZZgaKlorVjvRP7VSxPlA=;
	b=/hV18/PTNfKCyPfFuy1T9gsGIEdjZJb4I1drKC0XtEFxJEmFzmjZxlk9jnq/NXEYa8kZyV
	+u20QU0NXbCtvGCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A24444A0A2;
	Sun, 29 Mar 2026 09:12:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bLo1JgvtyGkHEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Mar 2026 09:12:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Karsten Hohmeier <linux@hohmatik.de>
Subject: [PATCH 1/2] ALSA: ctxfi: Fix missing SPDIFI1 index handling
Date: Sun, 29 Mar 2026 11:12:37 +0200
Message-ID: <20260329091240.420194-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO

SPDIF1 DAIO type isn't properly handled in daio_device_index() for
hw20k2, and it returned -EINVAL, which ended up with the out-of-bounds
array access.  Follow the hw20k1 pattern and return the proper index
for this type, too.

Reported-and-tested-by: Karsten Hohmeier <linux@hohmatik.de>
Closes: https://lore.kernel.org/20260315155004.15633-1-linux@hohmatik.de
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctdaio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index b8bde27f3a1d..19faa81d5400 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -118,6 +118,7 @@ static unsigned int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		switch (type) {
 		case SPDIFOO:	return 0;
 		case SPDIFIO:	return 0;
+		case SPDIFI1:	return 1;
 		case LINEO1:	return 4;
 		case LINEO2:	return 7;
 		case LINEO3:	return 5;
-- 
2.53.0

