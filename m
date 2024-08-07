Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC52201251
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037670; cv=none; b=REeRujKy9rnjd5oFgQ55NvWvmib5m3H32976mtz9kCSnrqYbndrbVmpdeeXcvBuaViPJB58AV2r4fNvyya2ZLrgsbIUVoJYnBeRc6y4DU2FYgAmkXVaQpCfr8Hwbm+kD6hDDga/+Fdk5JDVrV7QneSAbZULVfiI/dVBZFTUKRsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037670; c=relaxed/simple;
	bh=H3MuSEt/UeSbJwxrRLv5Kt4Ntseh8UXwhSzgIp9Hw8o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDYxJuzqpCz/wEVa0q720xP4C79R0LV9dnREKDh25HlksmrSJDsJb/fk8PtaQ7DDrRjhbp98Ya59kFx6tsjnvgl6NY6iEADJBPjiOqnmRaWYUgENQB1auR7nYtaHPSeBhjy5e++YYo9afiVUDonGAljB0WWuDmL1x4JSiTMVMYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u2MR3gFx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z28hFx3q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u2MR3gFx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z28hFx3q; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u2MR3gFx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z28hFx3q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u2MR3gFx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z28hFx3q"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF53F1FB9F;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLkpc04dO3IG4lQn54dzs8vzR9eKRIvkDDjcq5xa/DE=;
	b=u2MR3gFx4ffMa99R3pkhbOV7yk/2l6MOXdFae7JuKKFEo/9cSvqVJFfXK31tnAM9A78gSo
	/qrW7ZGtpvnymOOHBwhNfmKnDnSpxssflz02j5sr6YuszmzAb8A6leo2JaXSaU0Xelth0k
	n8bDJrNIDsK4bQSb90MJlaPWLmdrwFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLkpc04dO3IG4lQn54dzs8vzR9eKRIvkDDjcq5xa/DE=;
	b=Z28hFx3qpr9mbXi7/ybRdBB8ox4dQKotCb6eaC3TMCOmF+wk3Xz+ibA3sMB9Pgh3cjUbgx
	R9+7rRgTMMtH6XBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLkpc04dO3IG4lQn54dzs8vzR9eKRIvkDDjcq5xa/DE=;
	b=u2MR3gFx4ffMa99R3pkhbOV7yk/2l6MOXdFae7JuKKFEo/9cSvqVJFfXK31tnAM9A78gSo
	/qrW7ZGtpvnymOOHBwhNfmKnDnSpxssflz02j5sr6YuszmzAb8A6leo2JaXSaU0Xelth0k
	n8bDJrNIDsK4bQSb90MJlaPWLmdrwFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLkpc04dO3IG4lQn54dzs8vzR9eKRIvkDDjcq5xa/DE=;
	b=Z28hFx3qpr9mbXi7/ybRdBB8ox4dQKotCb6eaC3TMCOmF+wk3Xz+ibA3sMB9Pgh3cjUbgx
	R9+7rRgTMMtH6XBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B67B513B05;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iMBtK953s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 46/54] ALSA: intel8x0: Drop unused snd_printd() calls
Date: Wed,  7 Aug 2024 15:34:36 +0200
Message-ID: <20240807133452.9424-47-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.21 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.948];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.21

There are commented out debug prints, which are utterly superfluous.
Let's drop them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 3 ---
 sound/pci/intel8x0m.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index dae3e15ba534..e4bb99f71c2c 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -703,7 +703,6 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
 	if (!(status & ICH_BCIS)) {
 		step = 0;
 	} else if (civ == ichdev->civ) {
-		// snd_printd("civ same %d\n", civ);
 		step = 1;
 		ichdev->civ++;
 		ichdev->civ &= ICH_REG_LVI_MASK;
@@ -711,8 +710,6 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
 		step = civ - ichdev->civ;
 		if (step < 0)
 			step += ICH_REG_LVI_MASK + 1;
-		// if (step != 1)
-		//	snd_printd("step = %d, %d -> %d\n", step, ichdev->civ, civ);
 		ichdev->civ = civ;
 	}
 
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 3d6f5b3cc73e..38f8de51d641 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -423,7 +423,6 @@ static inline void snd_intel8x0m_update(struct intel8x0m *chip, struct ichdev *i
 
 	civ = igetbyte(chip, port + ICH_REG_OFF_CIV);
 	if (civ == ichdev->civ) {
-		// snd_printd("civ same %d\n", civ);
 		step = 1;
 		ichdev->civ++;
 		ichdev->civ &= ICH_REG_LVI_MASK;
@@ -431,8 +430,6 @@ static inline void snd_intel8x0m_update(struct intel8x0m *chip, struct ichdev *i
 		step = civ - ichdev->civ;
 		if (step < 0)
 			step += ICH_REG_LVI_MASK + 1;
-		// if (step != 1)
-		//	snd_printd("step = %d, %d -> %d\n", step, ichdev->civ, civ);
 		ichdev->civ = civ;
 	}
 
-- 
2.43.0

