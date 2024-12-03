Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427B31F427C
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235516; cv=none; b=RAZVHTo7+r3NjiuNU8S0i0ax19gnpk2mJDwOeDqDrPti7I20+XQvi4+FzYIr7jyypSddp+W4P9eHFLRCOVmdZbZcjGLHhuDu0FS1VjOFIBb64BQvzFXd+GRfDu7nGKW15/q8Fww3z0pX5v8F5mrHfAQ/QutZDZgWdNhWVi46FYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235516; c=relaxed/simple;
	bh=vegFIY2ULVsibRpzXZ/pl9oIY+wTevUa/pw1hhL9s0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vl7ddN5eKOJbcnNa2H+1sXiUeD83YRe1mrfe/8YlmxN+EXCXeYLqYYVXv3L7DaIRQ2KIxJZjFX0iKyeoMXAFsyzgyAitxGeA10ctqmEyCnvtWtQwzIrirya4CJ9CMEGlhial2Q8+O/qW8AR8UmGggVesTZfGG5lKL79wStn9Bzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tvn2ENfa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=90ETWZQ2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tvn2ENfa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=90ETWZQ2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tvn2ENfa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="90ETWZQ2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tvn2ENfa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="90ETWZQ2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A79E71F451;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RR2pcKM87NgOO0Z9LwAToBHpn/MZpcee7JyqJHVKmpE=;
	b=Tvn2ENfaQdRfHxiw+AsPxCJwmiHObN4F1MnImOSZU9QxyoNF5BIfrBfZOjUkUzzKaIF6gU
	i8K7g9DX7XMFDsYf+dcr8y7LlHLNrIfF0ZAOa6cr4yXluHTndBcgT5uk9kZPsbmb4xcOzs
	0zaZVetGISXTmNbIZNkqFsQ3e+goi9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RR2pcKM87NgOO0Z9LwAToBHpn/MZpcee7JyqJHVKmpE=;
	b=90ETWZQ2yJo9Gips1wO45yaFcM7VxPeRJ4Fa4tj5r8m34nmo3k/JZM9CzP9G5AxdRJnX9Z
	yFLvqhxYrxTKSbBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733235512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RR2pcKM87NgOO0Z9LwAToBHpn/MZpcee7JyqJHVKmpE=;
	b=Tvn2ENfaQdRfHxiw+AsPxCJwmiHObN4F1MnImOSZU9QxyoNF5BIfrBfZOjUkUzzKaIF6gU
	i8K7g9DX7XMFDsYf+dcr8y7LlHLNrIfF0ZAOa6cr4yXluHTndBcgT5uk9kZPsbmb4xcOzs
	0zaZVetGISXTmNbIZNkqFsQ3e+goi9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733235512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RR2pcKM87NgOO0Z9LwAToBHpn/MZpcee7JyqJHVKmpE=;
	b=90ETWZQ2yJo9Gips1wO45yaFcM7VxPeRJ4Fa4tj5r8m34nmo3k/JZM9CzP9G5AxdRJnX9Z
	yFLvqhxYrxTKSbBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B4F413A54;
	Tue,  3 Dec 2024 14:18:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wBh+ITgTT2etMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 14:18:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 2/5] ASoC: mediatek: mt8365: Use *-y for Makefile
Date: Tue,  3 Dec 2024 15:18:17 +0100
Message-ID: <20241203141823.22393-3-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

We should use *-y instead of *-objs in Makefile for the module
objects.  *-objs is used rather for host programs.

Fixes: 5bbfdad8cf8d ("ASoC: mediatek: Add MT8365 support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/mt8365/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/Makefile b/sound/soc/mediatek/mt8365/Makefile
index 52ba45a8498a..b197025e34bb 100644
--- a/sound/soc/mediatek/mt8365/Makefile
+++ b/sound/soc/mediatek/mt8365/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # MTK Platform driver
-snd-soc-mt8365-pcm-objs := \
+snd-soc-mt8365-pcm-y := \
 	mt8365-afe-clk.o \
 	mt8365-afe-pcm.o \
 	mt8365-dai-adda.o \
-- 
2.43.0

