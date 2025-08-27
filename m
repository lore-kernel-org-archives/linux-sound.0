Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95010318127
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279826; cv=none; b=M8eK69m3gzi5P865FVtRrHf6oGzhZKu+L4RNR9bwLWk1rTvjbv9WUmmtWXoY5IWhaGGfV4AGW5E9HW1auimFPRFO8s7l6p7cw0nk4M4o9mQjFb6n8aLm6rtNfnnHnAzgwZAA991DgzqvOpKOcOgMpV9g4903jrKqaQ4QYIFGUlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279826; c=relaxed/simple;
	bh=JeZjJF4cH+TcLkSxh1uEGY1vDsRCbZDxlMQsfZ5A6qY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxbkCDwBSHGIj0w7FgcgRocLg5IQWlxAWW0iaQ/HqFGvCDF2FoFryGw3KO1Z+IM3D2ijGJGU2Il0BcgicDJkGBY+rJ5AMCbecoFYLzGYsl3n3+IfcCM8RFdJ1vVUcFEeumwB9pVmXh7Xd+drKLVK8IUp19JJc9kHVn7tBn9fDBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oNAvzjZC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=550tK+bq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oNAvzjZC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=550tK+bq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oNAvzjZC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="550tK+bq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oNAvzjZC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="550tK+bq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ACD761FE68;
	Wed, 27 Aug 2025 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZ8t/iZebaH52f6gv8zF2HbenkNqV+MndxLpjxd+yJ8=;
	b=oNAvzjZCjNY9Rme+RH1JfyaZ874wNo0B0VbpsGfHJ1PlYreMN6L6aPZKldOH+ln51DwjS6
	t5F1jgdapU5Rgnb+Ubr5KC86YgC09+s58iK67b634eJLW1Ptqa3msmqoDU6LaBdQ5NAAJf
	SIcDdqoVj8gq1GECrGve7WRUu953sR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZ8t/iZebaH52f6gv8zF2HbenkNqV+MndxLpjxd+yJ8=;
	b=550tK+bqxRhnicjqPZWqX4mYfaip1/xzddUwB5CJ7isETqow1g/q+xzZ3UWEp+gmIuruZL
	R90upbac6wbQqhAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZ8t/iZebaH52f6gv8zF2HbenkNqV+MndxLpjxd+yJ8=;
	b=oNAvzjZCjNY9Rme+RH1JfyaZ874wNo0B0VbpsGfHJ1PlYreMN6L6aPZKldOH+ln51DwjS6
	t5F1jgdapU5Rgnb+Ubr5KC86YgC09+s58iK67b634eJLW1Ptqa3msmqoDU6LaBdQ5NAAJf
	SIcDdqoVj8gq1GECrGve7WRUu953sR4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279764;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZ8t/iZebaH52f6gv8zF2HbenkNqV+MndxLpjxd+yJ8=;
	b=550tK+bqxRhnicjqPZWqX4mYfaip1/xzddUwB5CJ7isETqow1g/q+xzZ3UWEp+gmIuruZL
	R90upbac6wbQqhAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3BEB213A31;
	Wed, 27 Aug 2025 07:29:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8Ld4DNSzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 25/25] ALSA: hda/intel: Use guard() for spinlocks
Date: Wed, 27 Aug 2025 09:29:05 +0200
Message-ID: <20250827072916.31933-26-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual spin lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/controllers/intel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 1e13678428d2..48c52a207024 100644
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

