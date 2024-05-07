Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248E916ABD7
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097339; cv=none; b=SX1mqdzv+HG+6/7IF2zbuoL9TvVe5KDWgQY1aurimhI93KMU5Rb4Y8XpuNd9M04/C/0a7rBf2f6BjACcCuPiSN1pDuModHWTwlIf2DHeNGLd4cC1QTCUrt0YCBj1sTThGbEZbd6WT3odi9LjfVms/XDXQGTda4ucRfAWm6ERlWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097339; c=relaxed/simple;
	bh=FeeFvxB4lqoAzllqhDnZJi4n1PdVavjkWc8fFQNm8ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWnNwIfzsu9CNxbz6WpF6u6WS4PKHvanlvKpf/PzWbIH4DETPu2s+ZdwM/QcyEtnI2xyrcJ/S2rb//oXBXY+qma08/D60UGdsU0SN86gelh2DAGL/R0yEzQmAfO8sq40jdyaJCghmpuDxs/O5teT60srQ2+k6tO4zOafc4BUjO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oTv0nzHc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vf6c3ps0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oTv0nzHc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vf6c3ps0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oTv0nzHc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vf6c3ps0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oTv0nzHc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vf6c3ps0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 75E8322142;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DAlXl9+Nmvtpl+XfBX0ioKHpgEvPFLOryfqsWF+4qs=;
	b=oTv0nzHc8ro1X+KVvNRKFzejmkM+Oe1C5198ANNtBBxGXnHTEr0MarmwAzzkjwGq7doHq+
	782H6mbHxC0E+pfLNc2qvpPJuhIo2A5WdGBZ2Y2rvdubpTPkfZRFwqoM8c6LaKJ2YfzgR7
	zDhSu0bGUw3HLzzpW3x1AMutNkZ3YXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DAlXl9+Nmvtpl+XfBX0ioKHpgEvPFLOryfqsWF+4qs=;
	b=vf6c3ps0T68xb2BYrch1DMaWjKEdwrwBEAHk//5z2kcgNSVaN9VMQr/CXUL2rwvRhtgWiq
	v3csglWhIlHiSYBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DAlXl9+Nmvtpl+XfBX0ioKHpgEvPFLOryfqsWF+4qs=;
	b=oTv0nzHc8ro1X+KVvNRKFzejmkM+Oe1C5198ANNtBBxGXnHTEr0MarmwAzzkjwGq7doHq+
	782H6mbHxC0E+pfLNc2qvpPJuhIo2A5WdGBZ2Y2rvdubpTPkfZRFwqoM8c6LaKJ2YfzgR7
	zDhSu0bGUw3HLzzpW3x1AMutNkZ3YXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DAlXl9+Nmvtpl+XfBX0ioKHpgEvPFLOryfqsWF+4qs=;
	b=vf6c3ps0T68xb2BYrch1DMaWjKEdwrwBEAHk//5z2kcgNSVaN9VMQr/CXUL2rwvRhtgWiq
	v3csglWhIlHiSYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5688F13A2D;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4M2sE/VOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 18/34] ASoC: mxs: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:22 +0200
Message-ID: <20240507155540.24815-19-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email]
X-Spam-Score: -6.80
X-Spam-Flag: NO

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mxs/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mxs/Makefile b/sound/soc/mxs/Makefile
index ab0a9a553702..474bdd75513f 100644
--- a/sound/soc/mxs/Makefile
+++ b/sound/soc/mxs/Makefile
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 # MXS Platform Support
-snd-soc-mxs-objs := mxs-saif.o
-snd-soc-mxs-pcm-objs := mxs-pcm.o
+snd-soc-mxs-y := mxs-saif.o
+snd-soc-mxs-pcm-y := mxs-pcm.o
 
 obj-$(CONFIG_SND_MXS_SOC) += snd-soc-mxs.o snd-soc-mxs-pcm.o
 
 # i.MX Machine Support
-snd-soc-mxs-sgtl5000-objs := mxs-sgtl5000.o
+snd-soc-mxs-sgtl5000-y := mxs-sgtl5000.o
 
 obj-$(CONFIG_SND_SOC_MXS_SGTL5000) += snd-soc-mxs-sgtl5000.o
-- 
2.43.0

