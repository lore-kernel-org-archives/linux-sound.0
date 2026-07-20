Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD9370D49
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555645; cv=none; b=cCqFYC10Mz8kO7BUG50TeJStK6uYVuTA4gHF27u9bGFzTqtmklC3ueLd1Tlmr3zRFZu4WZObfgy6t7jfKn8acTyHd87k/NQPnAqwpLAD21xgkCxADx4qvazOsV5QMeWf3O2YwS8go1G6y4ug7sVt6I2uxyZaSe7SUXatXqtLOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555645; c=relaxed/simple;
	bh=GDOAuLGlWfU/3pZrRDF8pgbr9JlZhJZCTO9DoT1MHsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTOHKXHli2/EMBjQeta/If9H+T7cbBmlqgv0bcT1hzjoKV4pEtFPqH+lrSVTY6V9TG55mkS3E8J4sd7V8wqPiVuTPgQ1ckDjuEXk8nELFKfSDxpXO8RhdiV9MQm+4dOh1Cg5SMAbF/Qnzzp+58mrD2nqic2OmaWm1Awoq9lhIAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cbtDw9tY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=obr37YFr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cbtDw9tY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=obr37YFr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cbtDw9tY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="obr37YFr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cbtDw9tY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="obr37YFr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BCE8679FA7;
	Mon, 20 Jul 2026 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784555641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4T4EbWJ3BFLxEozB4C9mdMSwLQgbOtGNHAcrVB/7nV0=;
	b=cbtDw9tYY8olwNuEUHt7QeoDWuh2akZAwzcIP+2/X59ExUevioYl+au5yrAu3lAgqqjZoX
	IGntdYDeM8PbqPDYjpAe5KT9nKWff0g6Jlc2ADEG5N2aBNH405YrGmQAIL52rUEjHORdUS
	uZOPClOFnUlDuHpo6BcpLgrJa1/FvKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784555641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4T4EbWJ3BFLxEozB4C9mdMSwLQgbOtGNHAcrVB/7nV0=;
	b=obr37YFrcc4L8VwMaLaELa8v2X2Qy/Ga+6ePylyA75Moi4LXo++PpMuoV7C2r/BbHmGPDT
	EoZctYpCukRFFmDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784555641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4T4EbWJ3BFLxEozB4C9mdMSwLQgbOtGNHAcrVB/7nV0=;
	b=cbtDw9tYY8olwNuEUHt7QeoDWuh2akZAwzcIP+2/X59ExUevioYl+au5yrAu3lAgqqjZoX
	IGntdYDeM8PbqPDYjpAe5KT9nKWff0g6Jlc2ADEG5N2aBNH405YrGmQAIL52rUEjHORdUS
	uZOPClOFnUlDuHpo6BcpLgrJa1/FvKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784555641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4T4EbWJ3BFLxEozB4C9mdMSwLQgbOtGNHAcrVB/7nV0=;
	b=obr37YFrcc4L8VwMaLaELa8v2X2Qy/Ga+6ePylyA75Moi4LXo++PpMuoV7C2r/BbHmGPDT
	EoZctYpCukRFFmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91FD3779AA;
	Mon, 20 Jul 2026 13:54:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4mjNIHkoXmr8KgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 13:54:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ALSA: dummy: Improvements of timer backend calls
Date: Mon, 20 Jul 2026 15:53:51 +0200
Message-ID: <20260720135356.1779857-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-2.99)[99.96%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.79

Here is a small patch series for ALSA dummy driver to improve the
handling of systimer and hrtimer callbacks.  This is mainly a cleanup
and a hardening for the cases where we miss the synchronizations after
stopping the PCM.


Takashi

===

Takashi Iwai (3):
  ALSA: dummy: Use the standard PCM sync_stop callback for hrtimer
  ALSA: dummy: Implement sync_stop for systimer, too
  ALSA: dummy: Properly shutdown the systimer at freeing

 sound/drivers/dummy.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

-- 
2.55.0

