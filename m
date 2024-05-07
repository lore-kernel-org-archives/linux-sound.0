Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611A16E879
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097339; cv=none; b=upG6icsAqSJtJinjAa0ihhN8GfNGykmKhsAciCKewuqg1nKABUgqCDVENTBmFemMs3IB9aLnwiWlWTX9SqOhL9bxUa3XxtjeUwuUJ412BE3C4PkGw0H+jYP1LgcLPVmm6L5PR41yEhA0qPOBHV9jFvDpbZYAdQ9VrXUCffOHrtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097339; c=relaxed/simple;
	bh=SQSx1KjgVEXVVMX1x4saor0x4edutvCgL2OaCWg+6Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpTGO8iYcxdF4YwTieSYPDAU5PQq1/qlfFY/ZXxkYwbnR+rRwTZxtNWoHzr4X2cxealt4X8pIYiduOZGzMIHLDo2LqVSQk7mnPHBXxxOM3HeZwGqStd66zCPX/DBpY0XLK3v1R/d5vabMxHHtVCPtOdgO1syw0PA/BZbsDc3whw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TRMk/2fu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IJM42BhC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TRMk/2fu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IJM42BhC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TRMk/2fu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IJM42BhC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TRMk/2fu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IJM42BhC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5003121D1F;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRri6Yus/d797PK4WP5h1r/YLgoR+iXL+hC0vAUWLfY=;
	b=TRMk/2fu8vfth5BPLHfQjTti2svA5Z1yPPNaY4PyXEU5Tv6nHmBQ//+RbvN1Y/fZkZYMtU
	QUtXE1wZNW9v6hsuFVKVlsjvk74hcz93GsHRfVrpdlwidv5JoqQ1P9NhBRaw7tOHkOUfTv
	DmDl6T2oNEvOjj6d3RxFZNlCgtfn00M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRri6Yus/d797PK4WP5h1r/YLgoR+iXL+hC0vAUWLfY=;
	b=IJM42BhCTtD3s64IIQz3h/ZUvrxpmZlcY2q0zhgm350AtxWOajocKovN2oB6St5bc7GeFR
	ff5oGOsMBSOavWDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRri6Yus/d797PK4WP5h1r/YLgoR+iXL+hC0vAUWLfY=;
	b=TRMk/2fu8vfth5BPLHfQjTti2svA5Z1yPPNaY4PyXEU5Tv6nHmBQ//+RbvN1Y/fZkZYMtU
	QUtXE1wZNW9v6hsuFVKVlsjvk74hcz93GsHRfVrpdlwidv5JoqQ1P9NhBRaw7tOHkOUfTv
	DmDl6T2oNEvOjj6d3RxFZNlCgtfn00M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRri6Yus/d797PK4WP5h1r/YLgoR+iXL+hC0vAUWLfY=;
	b=IJM42BhCTtD3s64IIQz3h/ZUvrxpmZlcY2q0zhgm350AtxWOajocKovN2oB6St5bc7GeFR
	ff5oGOsMBSOavWDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F41013A3A;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2D0iCfROOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 11/34] ASoC: generic: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:15 +0200
Message-ID: <20240507155540.24815-12-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/generic/Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/Makefile b/sound/soc/generic/Makefile
index 084862156506..d5abb3eed3df 100644
--- a/sound/soc/generic/Makefile
+++ b/sound/soc/generic/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-soc-simple-card-utils-objs	:= simple-card-utils.o
-snd-soc-simple-card-objs	:= simple-card.o
-snd-soc-audio-graph-card-objs	:= audio-graph-card.o
-snd-soc-audio-graph-card2-objs	:= audio-graph-card2.o
-snd-soc-audio-graph-card2-custom-sample-objs := audio-graph-card2-custom-sample.o
-snd-soc-test-component-objs	:= test-component.o
+snd-soc-simple-card-utils-y	:= simple-card-utils.o
+snd-soc-simple-card-y		:= simple-card.o
+snd-soc-audio-graph-card-y	:= audio-graph-card.o
+snd-soc-audio-graph-card2-y	:= audio-graph-card2.o
+snd-soc-audio-graph-card2-custom-sample-y := audio-graph-card2-custom-sample.o
+snd-soc-test-component-y	:= test-component.o
 
 obj-$(CONFIG_SND_SIMPLE_CARD_UTILS)	+= snd-soc-simple-card-utils.o
 obj-$(CONFIG_SND_SIMPLE_CARD)		+= snd-soc-simple-card.o
-- 
2.43.0

