Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4268F1F12FF
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235517; cv=none; b=j+IPUyJ1NZZkQ35M0oxKY5wrKxBJnl0XfbTdf9Tt7UlAJgNIuHiEFLIIuNG+jFT6CNExHXqnwoyC5lHIkmwXiuGYCFkQhqWZlCNAECPCl+tw+VJfMwGrDJgubEvuvKCKOVOiuKLY3Sd4GOUtnnGvq4KGj+DjOzP2m8qme1kLM3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235517; c=relaxed/simple;
	bh=wzRtBS76zFk8KBQ7zqSLX7BQZgZ7l99QIrk2273jofA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbRFfhOs7wqksOitUp4EzaQjNVoGGGQrpoVs+xEDoFyheVvMBnsEZFyUItr4bZliHUb/D351ElFWJMNF9ztzqKqffYPnlbht3l3vF59HKE/55OrMYn4KLGm7D2K9/ksB54KTJHEXmHpaHBZQo2dEhknIdRpw3EvUi4W5FHUjguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vIjhdPP1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LusEJh1T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vIjhdPP1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LusEJh1T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vIjhdPP1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LusEJh1T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vIjhdPP1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LusEJh1T"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DDA421F45E;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVMypyW9XyPZ85YY6EoPx2ucg80vXhctklRmvPuHQdw=;
	b=vIjhdPP1PPTMryUtfOjWeZAb7ccMBLxafbZ/Wj/xwpo8k7Z2m8JBix7R3xrzv16ON3UJ1F
	fxudYaqLZdD9c06Uals2OVqfAfrNlF3gIXnZr4zx+p43wuoc3qv/0AXPToBpLuC9Mvg1ja
	Z41fbgelth/f4RMT1LXTfS/sA2/eYXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVMypyW9XyPZ85YY6EoPx2ucg80vXhctklRmvPuHQdw=;
	b=LusEJh1TGxRSVjXhjYu7boFzEgTAbBtO6XSkB3rw8lCNtrFb0/s7tAHQ07HAUfp/63/79L
	uA23eJz72Py1fiCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVMypyW9XyPZ85YY6EoPx2ucg80vXhctklRmvPuHQdw=;
	b=vIjhdPP1PPTMryUtfOjWeZAb7ccMBLxafbZ/Wj/xwpo8k7Z2m8JBix7R3xrzv16ON3UJ1F
	fxudYaqLZdD9c06Uals2OVqfAfrNlF3gIXnZr4zx+p43wuoc3qv/0AXPToBpLuC9Mvg1ja
	Z41fbgelth/f4RMT1LXTfS/sA2/eYXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVMypyW9XyPZ85YY6EoPx2ucg80vXhctklRmvPuHQdw=;
	b=LusEJh1TGxRSVjXhjYu7boFzEgTAbBtO6XSkB3rw8lCNtrFb0/s7tAHQ07HAUfp/63/79L
	uA23eJz72Py1fiCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C25DC13A2E;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iLTaLjgTT2etMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 14:18:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 4/5] ASoC: cs42l84: Use *-y for Makefile
Date: Tue,  3 Dec 2024 15:18:19 +0100
Message-ID: <20241203141823.22393-5-tiwai@suse.de>
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
X-Spam-Level: 
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

We should use *-y instead of *-objs in Makefile for the module
objects.  *-objs is used rather for host programs.

Fixes: 250304a0fb34 ("ASoC: cs42l84: Add new codec driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 57d3aab27d2f..5a83ee963966 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -92,7 +92,7 @@ snd-soc-cs42l52-y := cs42l52.o
 snd-soc-cs42l56-y := cs42l56.o
 snd-soc-cs42l73-y := cs42l73.o
 snd-soc-cs42l83-i2c-y := cs42l83-i2c.o
-snd-soc-cs42l84-objs := cs42l84.o
+snd-soc-cs42l84-y := cs42l84.o
 snd-soc-cs4234-y := cs4234.o
 snd-soc-cs4265-y := cs4265.o
 snd-soc-cs4270-y := cs4270.o
-- 
2.43.0

