Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A649513DBB8
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710618; cv=none; b=hk07bJ0Ec6Mu0CZ1RV4Md2W8dgmzmwh1e6IYPeIe0poDZbHrAktXktlqZP8BPLhJ2V9jJrDc6YvP/zSxAdEcxZl+d9pJvtmhKj6//5do43hgjthnXJnzwZb9btnK6U1PB0ll2NTjHN/BgDEm+zrNGbqcMl68eL8aUD1ZWHvn9U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710618; c=relaxed/simple;
	bh=StSRseVduxz2CzYVmw15vcm84+58r95yzclWyvAb9Kg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ktPddIjhAyHtGsIEVtMrqRq2x3xpdXVZsu7o+8i7oMxOzO3hndwULjR9i6DX7TFwf9te3GkD56M4N2ywgD8ugbtE1r7LwC50gtGT0uLiJHh4iPGf5QG3OvY5Q8kNjcseFbxQynwMjAXSs8frfxXU2kxZlpGOLcnyRQQ8RKS7/xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S8LieSDB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R8dgpwlb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S8LieSDB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=R8dgpwlb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S8LieSDB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R8dgpwlb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S8LieSDB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="R8dgpwlb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EB7E221D4;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HABQDTVX0pBESwhuPNseodGFTvAQynzpsUe/oXSotEI=;
	b=S8LieSDBjtsJZrotO/GjcpPNEylYr5S5Sve1Eat9tjzwj9q/wqeRN45cAJjBt9jqBg8cHN
	P11ToeSFW1n9Xr+gaxd42Mpy5D0oJkdPOoFjWdjR0CF8gSmUBsv2D0o5rNemP4P0HYf6m/
	oMGbC/igCD1mcYDBiv9yai3Sg6h5D/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HABQDTVX0pBESwhuPNseodGFTvAQynzpsUe/oXSotEI=;
	b=R8dgpwlbd+dzUh06oD/IOlqCfGZE+Cc87NhISDE/0zHUZGHt0/KPdKSKajf5vYX4wrqUT1
	EwUkcWrxSEY4kCBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HABQDTVX0pBESwhuPNseodGFTvAQynzpsUe/oXSotEI=;
	b=S8LieSDBjtsJZrotO/GjcpPNEylYr5S5Sve1Eat9tjzwj9q/wqeRN45cAJjBt9jqBg8cHN
	P11ToeSFW1n9Xr+gaxd42Mpy5D0oJkdPOoFjWdjR0CF8gSmUBsv2D0o5rNemP4P0HYf6m/
	oMGbC/igCD1mcYDBiv9yai3Sg6h5D/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HABQDTVX0pBESwhuPNseodGFTvAQynzpsUe/oXSotEI=;
	b=R8dgpwlbd+dzUh06oD/IOlqCfGZE+Cc87NhISDE/0zHUZGHt0/KPdKSKajf5vYX4wrqUT1
	EwUkcWrxSEY4kCBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 739C613AC1;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WMhcGdXa2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 18/24] ALSA: seq: ump: Use guard() for locking
Date: Fri, 23 Feb 2024 18:49:55 +0100
Message-Id: <20240223175001.24375-19-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223175001.24375-1-tiwai@suse.de>
References: <20240223175001.24375-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.99%]
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_client.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index ccac2d3a9fbc..c627d72f7fe2 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -115,21 +115,19 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
 static int seq_ump_client_open(struct seq_ump_client *client, int dir)
 {
 	struct snd_ump_endpoint *ump = client->ump;
-	int err = 0;
+	int err;
 
-	mutex_lock(&ump->open_mutex);
+	guard(mutex)(&ump->open_mutex);
 	if (dir == STR_OUT && !client->opened[dir]) {
 		err = snd_rawmidi_kernel_open(&ump->core, 0,
 					      SNDRV_RAWMIDI_LFLG_OUTPUT |
 					      SNDRV_RAWMIDI_LFLG_APPEND,
 					      &client->out_rfile);
 		if (err < 0)
-			goto unlock;
+			return err;
 	}
 	client->opened[dir]++;
- unlock:
-	mutex_unlock(&ump->open_mutex);
-	return err;
+	return 0;
 }
 
 /* close the rawmidi */
@@ -137,11 +135,10 @@ static int seq_ump_client_close(struct seq_ump_client *client, int dir)
 {
 	struct snd_ump_endpoint *ump = client->ump;
 
-	mutex_lock(&ump->open_mutex);
+	guard(mutex)(&ump->open_mutex);
 	if (!--client->opened[dir])
 		if (dir == STR_OUT)
 			snd_rawmidi_kernel_release(&client->out_rfile);
-	mutex_unlock(&ump->open_mutex);
 	return 0;
 }
 
-- 
2.35.3

