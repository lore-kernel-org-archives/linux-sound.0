Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3752216E888
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097341; cv=none; b=h3oxhQ8AXzkij9k5xdCG55cQhLFvx59R5lLW7W9F4ECZ6Q2CyDMQ/rzURyEZPIqU0QLY9gPR4419E3ETNMo1vODHA3kzr8L56ya6Qr442d88ZqkQ2wSk35hybphrintK4rV7ipOxmg1attOnVVggXqCrNcEjKnLaBrKQq5ssam4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097341; c=relaxed/simple;
	bh=VcsQ/miB9vV/VWq+ondDeTtgWckLrDHOM4vykN1OD2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROxoEIzM+VT2b0bPklZLkCf1hU6Ln724K3iDAZrcciIUUv+5Jhif6waF/909EmK5Fvh8TRIK29fA9v4bIbXJMCdJFqsrlVwJ59LZRa3j9M60+zpODPhUkSR7iXcgQzbu6YIUv8sE8VCjHFouyZTIecZPOwoUN5k7TgsR6OR6L0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2MPj5KDW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XNspD3HR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2MPj5KDW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XNspD3HR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2MPj5KDW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XNspD3HR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2MPj5KDW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XNspD3HR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B913522184;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDxLvUBLfXZDWGYNV4Zc/P7dNO6BH5jLCFhVDqUzHQw=;
	b=2MPj5KDW7WcwfM1ZHxlHEvihDET3tgrQkp98ZsyAvk+r3lZ4+RqttELNaKkmsiLEpKXGeS
	QNIRFYW58QGhhn4siBU+n67u3Dn+1gOVhFbW8wZmohNfaGVnpcGWFBKNfhJ0J/Kk2HEKhb
	a1thEsgVpgp0kgUBTlEglFwIfwXq5XE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDxLvUBLfXZDWGYNV4Zc/P7dNO6BH5jLCFhVDqUzHQw=;
	b=XNspD3HRZojuKNJqweAukvJi7Ud7hMTTIckn4BpWsmLSESzUhYSFlBvyBy28tk0bqaemUL
	JNqZxqS6P/OIgLAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDxLvUBLfXZDWGYNV4Zc/P7dNO6BH5jLCFhVDqUzHQw=;
	b=2MPj5KDW7WcwfM1ZHxlHEvihDET3tgrQkp98ZsyAvk+r3lZ4+RqttELNaKkmsiLEpKXGeS
	QNIRFYW58QGhhn4siBU+n67u3Dn+1gOVhFbW8wZmohNfaGVnpcGWFBKNfhJ0J/Kk2HEKhb
	a1thEsgVpgp0kgUBTlEglFwIfwXq5XE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097334;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDxLvUBLfXZDWGYNV4Zc/P7dNO6BH5jLCFhVDqUzHQw=;
	b=XNspD3HRZojuKNJqweAukvJi7Ud7hMTTIckn4BpWsmLSESzUhYSFlBvyBy28tk0bqaemUL
	JNqZxqS6P/OIgLAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A01B13A2D;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UGMyJPZOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 26/34] ASoC: sprd: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:30 +0200
Message-ID: <20240507155540.24815-27-tiwai@suse.de>
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
 sound/soc/sprd/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sprd/Makefile b/sound/soc/sprd/Makefile
index a95fa56cd000..c36399414862 100644
--- a/sound/soc/sprd/Makefile
+++ b/sound/soc/sprd/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Spreadtrum Audio Support
 
-snd-soc-sprd-platform-objs := sprd-pcm-dma.o sprd-pcm-compress.o
+snd-soc-sprd-platform-y := sprd-pcm-dma.o sprd-pcm-compress.o
 
 obj-$(CONFIG_SND_SOC_SPRD) += snd-soc-sprd-platform.o
 
-- 
2.43.0

