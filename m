Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60D216E878
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097338; cv=none; b=KdDf4RACvkklmLRCu7OpNMN3y1Jh6E3PBUQI4mqtfr9kNjO/BecRHWUZygH4LxzR4XGALtgqRjFvwUQ7ZGIj0S3LxfLSCmdsadI1nuja47cfL67snUQ9tZjL+9Hg6jWvt4e/5RRg29ExUqrr6K1OK4+zuMGHq4OIHKSEqjDc6FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097338; c=relaxed/simple;
	bh=vDikAqL9SrKg4vdjml+zE8Gz+7nmdQd65nrSt/TIEuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OYN64KP4XMxb5DBALkftZT6X+Hca1TKkCroG0cjAOJAvQGvxiZeRk4V8nrtnXWWUruKlqlE5ZljfZReUvCBmrxSmU1fJ7sg3UWk5EI7ougNis+bFuwGoIMhn0eD5pyEGKYhJVTZDS8U28svKRiaMv1tqFEpvohOtwebwItS5ZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p8Mtfwow; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CG3XesqL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=p8Mtfwow; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CG3XesqL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p8Mtfwow";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CG3XesqL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="p8Mtfwow";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CG3XesqL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A6AAA21BC4;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8th4tDJj638S6VIC3Nen851O+Yst/XqI0lCtXitNz4=;
	b=p8Mtfwowy8BeysADfuuo+yXXh7CkncuyTq01HayxHxv9L2Oa1jejQ5thJkG1EpCw6TIXDT
	f5seb2GoG3lcty+d6hDMGKtWjTUc1/FsEGLjtNTLVJ2AZFD0ZUJm+0OxMveIAzn2PoItwn
	NdoV2DbTnobyZD3EhdhuQr/5o8C6yx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8th4tDJj638S6VIC3Nen851O+Yst/XqI0lCtXitNz4=;
	b=CG3XesqLYdl47SleUGPtkNz3eat2EANqgSABbsAGI3IdONZ0Q0KF0snL77RcPazWlpg2tx
	+aJlPTroEVD2wGCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8th4tDJj638S6VIC3Nen851O+Yst/XqI0lCtXitNz4=;
	b=p8Mtfwowy8BeysADfuuo+yXXh7CkncuyTq01HayxHxv9L2Oa1jejQ5thJkG1EpCw6TIXDT
	f5seb2GoG3lcty+d6hDMGKtWjTUc1/FsEGLjtNTLVJ2AZFD0ZUJm+0OxMveIAzn2PoItwn
	NdoV2DbTnobyZD3EhdhuQr/5o8C6yx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C8th4tDJj638S6VIC3Nen851O+Yst/XqI0lCtXitNz4=;
	b=CG3XesqLYdl47SleUGPtkNz3eat2EANqgSABbsAGI3IdONZ0Q0KF0snL77RcPazWlpg2tx
	+aJlPTroEVD2wGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CCC913A3A;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eDRAHfROOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 13/34] ASoC: jz4740: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:17 +0200
Message-ID: <20240507155540.24815-14-tiwai@suse.de>
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

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/jz4740/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/jz4740/Makefile b/sound/soc/jz4740/Makefile
index f8701c9b09fe..1c7f3f375318 100644
--- a/sound/soc/jz4740/Makefile
+++ b/sound/soc/jz4740/Makefile
@@ -2,6 +2,6 @@
 #
 # Jz4740 Platform Support
 #
-snd-soc-jz4740-i2s-objs := jz4740-i2s.o
+snd-soc-jz4740-i2s-y := jz4740-i2s.o
 
 obj-$(CONFIG_SND_JZ4740_SOC_I2S) += snd-soc-jz4740-i2s.o
-- 
2.43.0

