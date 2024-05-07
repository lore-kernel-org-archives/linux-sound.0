Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6C16DEA5
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097334; cv=none; b=M2KhkTqbNOld3TY+h8h6O7l4QVMa8eoA+Y4nrDIHeOivTfW6AJO9DI6Vfi53gP32wDrDiub64TuquVi9o0+MjRY8eXpGhn9LkUwM+q7QrwxzmWRwFPHVrOb7/pZqBNPypKC+Q2ZWSjRn4oREcCZPW0vDf2cqqkZichaoRdSvtYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097334; c=relaxed/simple;
	bh=0RS2nJYBhCSgeHQ5QwKP9my6kSU3bEtV+JPr2nCRrMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jk3Vidz5fzFp29KmZHPO6CXG5Wr0xAb+sgKTaX2IHUStTh9Gz6Pg3V0aoMCwbKcqfWjK+amj7VI28IzK8euLVlnzqUvrN35DZRmAxHncu1pKKRsbVHEaF9yMa+LqJcGDIQM2bhEKHJeUJ7lZgwlmTFdo6s7Tw323DD1nHkgoHDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y4eHe5oC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w3WY5Flu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y4eHe5oC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w3WY5Flu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4eHe5oC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w3WY5Flu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4eHe5oC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w3WY5Flu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF08E20C90;
	Tue,  7 May 2024 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SmlLoPt/m59lUhMr71NVm/L/lEYigeP3RrU7DhSPoQ=;
	b=y4eHe5oC5pd6El08i7bOdCvKve8/E2o/j+JVVR7RdwiJNhZXyTLEDw9wcae7C55UKHDcTT
	BNBbN6wkhnFDEwoSHsB9Q+pycqy5QYivsVEqcTNE438qYYG6Cf5Nt+GfvUikfH4HlsziaS
	NkrUdcSQ/XYpVPoBKAFEqKXNkHVcKr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SmlLoPt/m59lUhMr71NVm/L/lEYigeP3RrU7DhSPoQ=;
	b=w3WY5FluBA+OP8UDtccNRTil9RcCMk3o9sw1RwlJT0QNHok0B9DkX2QNuazsceqwfCiG8u
	lfAaLLAYaP/njkBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SmlLoPt/m59lUhMr71NVm/L/lEYigeP3RrU7DhSPoQ=;
	b=y4eHe5oC5pd6El08i7bOdCvKve8/E2o/j+JVVR7RdwiJNhZXyTLEDw9wcae7C55UKHDcTT
	BNBbN6wkhnFDEwoSHsB9Q+pycqy5QYivsVEqcTNE438qYYG6Cf5Nt+GfvUikfH4HlsziaS
	NkrUdcSQ/XYpVPoBKAFEqKXNkHVcKr4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SmlLoPt/m59lUhMr71NVm/L/lEYigeP3RrU7DhSPoQ=;
	b=w3WY5FluBA+OP8UDtccNRTil9RcCMk3o9sw1RwlJT0QNHok0B9DkX2QNuazsceqwfCiG8u
	lfAaLLAYaP/njkBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEAC613A3A;
	Tue,  7 May 2024 15:55:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8AjkLPJOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 03/34] ASoC: adi: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:07 +0200
Message-ID: <20240507155540.24815-4-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

Signed-off-by: Takashi Iwai <tiwai@suse.de>
*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.
---
 sound/soc/adi/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/adi/Makefile b/sound/soc/adi/Makefile
index 125f667b0e08..0d2db8d05806 100644
--- a/sound/soc/adi/Makefile
+++ b/sound/soc/adi/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-adi-axi-i2s-objs := axi-i2s.o
-snd-soc-adi-axi-spdif-objs := axi-spdif.o
+snd-soc-adi-axi-i2s-y := axi-i2s.o
+snd-soc-adi-axi-spdif-y := axi-spdif.o
 
 obj-$(CONFIG_SND_SOC_ADI_AXI_I2S) += snd-soc-adi-axi-i2s.o
 obj-$(CONFIG_SND_SOC_ADI_AXI_SPDIF) += snd-soc-adi-axi-spdif.o
-- 
2.43.0

