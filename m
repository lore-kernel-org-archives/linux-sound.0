Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631231F12F2
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 14:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235516; cv=none; b=PA8VNOTThbmMrwiVta7KfyVwCYhKcJx3Hcc+rk1ltC9PlIKh0SK2fJ9uJK+ihNGDM6kbJ72pRNM6Oa6KqNQxfb5yuoLR+HrXzAMIDMsW4uLJSc6sJ7Rhb1VLxniqBX0FVKkBA2vMFy7D/VjdKcy+qAwfqpUhWakwBD/a/ZPmIT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235516; c=relaxed/simple;
	bh=j81/OehW9hD62rR3BtWHszw1pRZ//y/auglxwSj26qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxwKqxGZizypO6eR5326eW1HWDXqsVLLpse6fnK9ph56JJ28VOXFeQssjYayJaf1WQ5X1AgH7eZe9POm3qoKYKIsUxVlATr0dzqSXdDyjJl8Fafhpkcb0lpDiHE4XJL+ha/A3kKBchS6HFNwMp0lEMPC4W44rw/q+i5LLR9THqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GwQBShUQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i10Baupt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GwQBShUQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i10Baupt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GwQBShUQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i10Baupt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GwQBShUQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i10Baupt"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F5A52115E;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fTwOP9Mbe+QafwXu111/pon3VAoaOL4UXp3E7TVKF8=;
	b=GwQBShUQR/aowm1z5nNGomXQJK9abtBByJ0S5U/H49RX+u24BsZk+KXrtEJb0SqsPk89uG
	Kq9qp0zlQlPHoKpDlIM74MrryWgTO6LJSAdxOrJlDWS+TpqOT/CFIrszLgCJH/C7HETDk2
	Q935/ufMeMnUy+rhbIPMYt1F29V3R+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fTwOP9Mbe+QafwXu111/pon3VAoaOL4UXp3E7TVKF8=;
	b=i10BauptpdoZpeV+KpVaWyg0Q+uJcPCrse1U5SvI6CVBb6r3sEaSRUauit7oin+fKuEE1E
	iJduQtkHkK4q0ECA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fTwOP9Mbe+QafwXu111/pon3VAoaOL4UXp3E7TVKF8=;
	b=GwQBShUQR/aowm1z5nNGomXQJK9abtBByJ0S5U/H49RX+u24BsZk+KXrtEJb0SqsPk89uG
	Kq9qp0zlQlPHoKpDlIM74MrryWgTO6LJSAdxOrJlDWS+TpqOT/CFIrszLgCJH/C7HETDk2
	Q935/ufMeMnUy+rhbIPMYt1F29V3R+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/fTwOP9Mbe+QafwXu111/pon3VAoaOL4UXp3E7TVKF8=;
	b=i10BauptpdoZpeV+KpVaWyg0Q+uJcPCrse1U5SvI6CVBb6r3sEaSRUauit7oin+fKuEE1E
	iJduQtkHkK4q0ECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B16E13A2E;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EPV9HTgTT2etMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 14:18:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 1/5] ASoC: cs40l50: Use *-y for Makefile
Date: Tue,  3 Dec 2024 15:18:16 +0100
Message-ID: <20241203141823.22393-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203141823.22393-1-tiwai@suse.de>
References: <20241203141823.22393-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

We should use *-y instead of *-objs in Makefile for the module
objects.  *-objs is used rather for host programs.

Fixes: c486def5b3ba ("ASoC: cs40l50: Support I2S streaming to CS40L50")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index f37e82ddb7a1..57d3aab27d2f 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -80,7 +80,7 @@ snd-soc-cs35l56-shared-y := cs35l56-shared.o
 snd-soc-cs35l56-i2c-y := cs35l56-i2c.o
 snd-soc-cs35l56-spi-y := cs35l56-spi.o
 snd-soc-cs35l56-sdw-y := cs35l56-sdw.o
-snd-soc-cs40l50-objs := cs40l50-codec.o
+snd-soc-cs40l50-y := cs40l50-codec.o
 snd-soc-cs42l42-y := cs42l42.o
 snd-soc-cs42l42-i2c-y := cs42l42-i2c.o
 snd-soc-cs42l42-sdw-y := cs42l42-sdw.o
-- 
2.43.0

