Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A9E5467A
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159480; cv=none; b=VYItVxU+Cgu3e3nhLZxB0wPMopBOccJSpwgO2NZHa7PngZpkTUooWBR7XIMhWTsZK3L2YHte6bnpyHn+tED7hA2ErEG9M6UR+LvbEenbZBy59yUWOsS0j9pZsY2kF64bPbmr18+0qlkFR12WXz/i7L9X1VL3n9daFnpZDVfRGhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159480; c=relaxed/simple;
	bh=li5gezQRHYaIZDbA4HMedrxY88JRY9WRskBHzaS4fGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNLd9jYyL9RrNdqFLvrom5mTZhK1+bKEyfTOMcAyFiveL5LK9KumaX14lHELGQ4pSMXN1ADnkmfNX6u5Gfk/05EOXICU8b2n+27Z7q561kP+fivQCZi3M0wI3lreF+qErApHmv55iuQ2L4YMTEH4+nJEHCiiVfeHV5kBFK5Mcig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YzDFAb1D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1BpUGr1y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YzDFAb1D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1BpUGr1y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YzDFAb1D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1BpUGr1y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YzDFAb1D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1BpUGr1y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A22D5C6F9;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=surRdd04zMdXhYjhd9RQrJrVsO5cPrOlvYvYQl9eNC8=;
	b=YzDFAb1D4d68yJDtbNmHqtTIcgkiWvbZnykwwI9fCjNkpaumEgOjLQJ/AOJpMsi6qHiATw
	PC90cKSs0nNo5KMFhs7zQAkb2weF1/1TwJUQFJMCJES8z/Ftix/kE0kAlEGWZGBKTKrUFD
	asNU7ThtkxB/hFtpj7Bp6Z4aVZnyRpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=surRdd04zMdXhYjhd9RQrJrVsO5cPrOlvYvYQl9eNC8=;
	b=1BpUGr1yXlyvsqr0VfXQdkzIzyzLUQZO41IrqTOH+/QjLovH34BrkYSpJAVQHgJTOgTCFt
	GodHAVrBfulTOgDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=surRdd04zMdXhYjhd9RQrJrVsO5cPrOlvYvYQl9eNC8=;
	b=YzDFAb1D4d68yJDtbNmHqtTIcgkiWvbZnykwwI9fCjNkpaumEgOjLQJ/AOJpMsi6qHiATw
	PC90cKSs0nNo5KMFhs7zQAkb2weF1/1TwJUQFJMCJES8z/Ftix/kE0kAlEGWZGBKTKrUFD
	asNU7ThtkxB/hFtpj7Bp6Z4aVZnyRpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159477;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=surRdd04zMdXhYjhd9RQrJrVsO5cPrOlvYvYQl9eNC8=;
	b=1BpUGr1yXlyvsqr0VfXQdkzIzyzLUQZO41IrqTOH+/QjLovH34BrkYSpJAVQHgJTOgTCFt
	GodHAVrBfulTOgDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F13613A27;
	Wed,  8 May 2024 09:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cPMWErVBO2YcFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:11:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 2/7] ALSA: ac97: bus: Add missing module description
Date: Wed,  8 May 2024 11:11:21 +0200
Message-ID: <20240508091128.25274-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091128.25274-1-tiwai@suse.de>
References: <20240508091128.25274-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.72 / 50.00];
	BAYES_HAM(-2.92)[99.65%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.72
X-Spam-Flag: NO

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ac97/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 5e46b972a3da..40e88d79c483 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -551,5 +551,6 @@ static void __exit ac97_bus_exit(void)
 }
 module_exit(ac97_bus_exit);
 
+MODULE_DESCRIPTION("AC97 bus interface");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Robert Jarzmik <robert.jarzmik@free.fr>");
-- 
2.43.0

