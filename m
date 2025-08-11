Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D421223DFF
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906982; cv=none; b=iGCXSQLl06BuJKVMzAhIOX2aLyIQQ7n3cPkUt+j4ilEeyXV/SDfXSIa6+M1vQkVvmvjPat2/Oeaeb8t77Li438iz32TNZqjlH4GoDfddSjDuft4opxQ5B1Gri8KV8f2m7GPcj/6rEvlSahmeqVU90B+zQh9oQSNVHWU/gtw4OOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906982; c=relaxed/simple;
	bh=I898ouPAUsVywMS1Ca6Nb3AP46UWKiTZSY3ZGzI4y0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYwFk2bUiCd2o6n6MkUU9PhPIlTGDUNoJSXk13ob9S0Wwi0/NyyWUjPW12ASYkKajosJP70tW10rX7y3eJXmKW92oaQt2MRw2H5coMeMMzcrU0Uo14EKujzvHa7RwbNJnzu1taY49BtIbXO+GVq71Eq62RzifZYzdg5bVeYdi90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QO7ArZIg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8/14pPi4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QO7ArZIg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8/14pPi4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QO7ArZIg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/14pPi4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QO7ArZIg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8/14pPi4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 30D0C5BE84;
	Mon, 11 Aug 2025 10:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85ZBFyFIucha1p01F3lM2V/SpLD+clnbokp8AQ5Sxhc=;
	b=QO7ArZIgG/W/6ArWRYlrMg35ZcjsS+FrwmCnL3SG5tGQ4KbLbDtKMeuiLJcCwW6Oji9JCy
	AOJlKlg7XmXvgrjZJrgFP9cWcC01NFNzFk71W6kvLjNSRPBiwvqBjh1GuBx495LA4+JhN4
	v5jKInUQlcCTieEFbz1n0kTb59Fbl/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85ZBFyFIucha1p01F3lM2V/SpLD+clnbokp8AQ5Sxhc=;
	b=8/14pPi48NeLlHxGOdn5rPVOH1BJctMIwzKJlQvohL8tBVebtTRaFrc+JyhRlQ9PW3srUi
	vTx70eoI0whAXDAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QO7ArZIg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="8/14pPi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85ZBFyFIucha1p01F3lM2V/SpLD+clnbokp8AQ5Sxhc=;
	b=QO7ArZIgG/W/6ArWRYlrMg35ZcjsS+FrwmCnL3SG5tGQ4KbLbDtKMeuiLJcCwW6Oji9JCy
	AOJlKlg7XmXvgrjZJrgFP9cWcC01NFNzFk71W6kvLjNSRPBiwvqBjh1GuBx495LA4+JhN4
	v5jKInUQlcCTieEFbz1n0kTb59Fbl/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=85ZBFyFIucha1p01F3lM2V/SpLD+clnbokp8AQ5Sxhc=;
	b=8/14pPi48NeLlHxGOdn5rPVOH1BJctMIwzKJlQvohL8tBVebtTRaFrc+JyhRlQ9PW3srUi
	vTx70eoI0whAXDAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2FD413A7E;
	Mon, 11 Aug 2025 10:08:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0NZPNhLBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 25/25] ALSA: hda/intel: Use guard() for spinlocks
Date: Mon, 11 Aug 2025 12:07:59 +0200
Message-ID: <20250811100807.7962-26-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 30D0C5BE84
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual spin lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 37918363b8bc..408e7f8c4cb4 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -764,12 +764,11 @@ static void azx_clear_irq_pending(struct azx *chip)
 	struct hdac_bus *bus = azx_bus(chip);
 	struct hdac_stream *s;
 
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	list_for_each_entry(s, &bus->stream_list, list) {
 		struct azx_dev *azx_dev = stream_to_azx_dev(s);
 		azx_dev->irq_pending = 0;
 	}
-	spin_unlock_irq(&bus->reg_lock);
 }
 
 static int azx_acquire_irq(struct azx *chip, int do_disconnect)
-- 
2.50.1

