Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4C4259CA9
	for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774775567; cv=none; b=MaQRG05r8V5MROBsB1OS04WWUqujrp9VTdFR3kK7HjEPzp4k0jV1xc/hPsedRlKZMZsj8z7J3BOnPuaHyNRlq7luD3CTHBTAjbFrKORNMIkXiE9YnSzqIK0fPU2DYcUkD4xCYulNaYASiXa3UZDy46UTkmAs8pfua9pTPkPaMLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774775567; c=relaxed/simple;
	bh=/UbqsR4pT0ZRUVxOl+1oEVdBVmVxJj6kjumen8H3970=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMx+cF2QJztZqzD/1rZW2jbXO7XeeAPToaGXByw8+1E/axdMlpHZPNJzRaYo5RB1bCR2SrZ9bMyTBteEsykm1p7DJ50TWGKrUsPaegMklZHMiTyXZaGqznXbfluCcExDWHHb8P/w3Lk0yMzFB43vylEN1+7E1t6uOVL40gfJW3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oex3111C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w15vRLna; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VwaAFFwQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cya+LTPK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oex3111C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w15vRLna";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VwaAFFwQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cya+LTPK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F3A824D4ED;
	Sun, 29 Mar 2026 09:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiOaa6z44r4wXHvzgwlHpgcZ84EjxPXYfHwfC5v78QI=;
	b=oex3111CtrX2Fc8k9ueGSD6SHfZnCetUjIQtvhx+/PI5ONxEoYtf5/fSKWYAJkw9ROaIgZ
	j1JTlVHVlY4l9WBQurR1lleN1BdBEHum0O7OqEUd4np+/LDdmUfphUZbqoATDftrmzQPaW
	mPi7A4DIv39gpnqM20jNQDV1obLnCKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiOaa6z44r4wXHvzgwlHpgcZ84EjxPXYfHwfC5v78QI=;
	b=w15vRLnaMdEsCZ6ubF7zqhOX/V/NOQbcF3WNubn8p7M6/jFWNaCjSJH249lQLbfk88My2y
	f2n9vWcXCAEB9PAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiOaa6z44r4wXHvzgwlHpgcZ84EjxPXYfHwfC5v78QI=;
	b=VwaAFFwQPnQrld9Wl3Am2fkQdUbmTcuY+nNU0IDNGcs1vGFIoOYjblsol51ROdGSnd+PsT
	zlVGlmkTPfn0/CrmoofkXQUUwzRfHFyoW7y/d+DjQ6pQ3swKYgeVcuA2o8+5gu6VWjLILV
	5F3OfswLlLWoCQjGkAx08/h/57NtBb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BiOaa6z44r4wXHvzgwlHpgcZ84EjxPXYfHwfC5v78QI=;
	b=cya+LTPKh6v7mum/cZ5bbYEDIePtUGR6N4B+Dd1sRHqUlNrlo7q76FQAzntY93AT3+ytkg
	Jrz3LWeSbuEmNvBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE3604A0B0;
	Sun, 29 Mar 2026 09:12:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oOXaMAvtyGkHEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Mar 2026 09:12:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Karsten Hohmeier <linux@hohmatik.de>
Subject: [PATCH 2/2] ALSA: ctxfi: Check the error for index mapping
Date: Sun, 29 Mar 2026 11:12:38 +0200
Message-ID: <20260329091240.420194-2-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329091240.420194-1-tiwai@suse.de>
References: <20260329091240.420194-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The ctxfi driver blindly assumed a proper value returned from
daio_device_index(), but it's not always true.  Add a proper error
check to deal with the error from the function.

Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/87cy149n6k.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctdaio.c | 81 +++++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 31 deletions(-)

diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 19faa81d5400..4dbb1dd7af32 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -99,7 +99,7 @@ static const struct rsc_ops daio_in_rsc_ops_20k2 = {
 	.output_slot	= daio_index,
 };
 
-static unsigned int daio_device_index(enum DAIOTYP type, struct hw *hw)
+static int daio_device_index(enum DAIOTYP type, struct hw *hw)
 {
 	switch (hw->chip_type) {
 	case ATC20K1:
@@ -112,7 +112,9 @@ static unsigned int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		case LINEO3:	return 5;
 		case LINEO4:	return 6;
 		case LINEIM:	return 7;
-		default:	return -EINVAL;
+		default:
+			pr_err("ctxfi: Invalid type %d for hw20k1\n", type);
+			return -EINVAL;
 		}
 	case ATC20K2:
 		switch (type) {
@@ -126,9 +128,12 @@ static unsigned int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		case LINEIM:	return 4;
 		case MIC:	return 5;
 		case RCA:	return 3;
-		default:	return -EINVAL;
+		default:
+			pr_err("ctxfi: Invalid type %d for hw20k2\n", type);
+			return -EINVAL;
 		}
 	default:
+		pr_err("ctxfi: Invalid chip type %d\n", hw->chip_type);
 		return -EINVAL;
 	}
 }
@@ -149,8 +154,11 @@ static int dao_spdif_set_spos(struct dao *dao, unsigned int spos)
 
 static int dao_commit_write(struct dao *dao)
 {
-	dao->hw->dao_commit_write(dao->hw,
-		daio_device_index(dao->daio.type, dao->hw), dao->ctrl_blk);
+	int idx = daio_device_index(dao->daio.type, dao->hw);
+
+	if (idx < 0)
+		return idx;
+	dao->hw->dao_commit_write(dao->hw, idx, dao->ctrl_blk);
 	return 0;
 }
 
@@ -288,8 +296,11 @@ static int dai_set_enb_srt(struct dai *dai, unsigned int enb)
 
 static int dai_commit_write(struct dai *dai)
 {
-	dai->hw->dai_commit_write(dai->hw,
-		daio_device_index(dai->daio.type, dai->hw), dai->ctrl_blk);
+	int idx = daio_device_index(dai->daio.type, dai->hw);
+
+	if (idx < 0)
+		return idx;
+	dai->hw->dai_commit_write(dai->hw, idx, dai->ctrl_blk);
 	return 0;
 }
 
@@ -368,7 +379,7 @@ static int dao_rsc_init(struct dao *dao,
 {
 	struct hw *hw = mgr->mgr.hw;
 	unsigned int conf;
-	int err;
+	int idx, err;
 
 	err = daio_rsc_init(&dao->daio, desc, mgr->mgr.hw);
 	if (err)
@@ -387,15 +398,18 @@ static int dao_rsc_init(struct dao *dao,
 	if (err)
 		goto error2;
 
-	hw->daio_mgr_dsb_dao(mgr->mgr.ctrl_blk,
-			daio_device_index(dao->daio.type, hw));
+	idx = daio_device_index(dao->daio.type, hw);
+	if (idx < 0) {
+		err = idx;
+		goto error2;
+	}
+
+	hw->daio_mgr_dsb_dao(mgr->mgr.ctrl_blk, idx);
 	hw->daio_mgr_commit_write(hw, mgr->mgr.ctrl_blk);
 
 	conf = (desc->msr & 0x7) | (desc->passthru << 3);
-	hw->daio_mgr_dao_init(hw, mgr->mgr.ctrl_blk,
-			daio_device_index(dao->daio.type, hw), conf);
-	hw->daio_mgr_enb_dao(mgr->mgr.ctrl_blk,
-			daio_device_index(dao->daio.type, hw));
+	hw->daio_mgr_dao_init(hw, mgr->mgr.ctrl_blk, idx, conf);
+	hw->daio_mgr_enb_dao(mgr->mgr.ctrl_blk, idx);
 	hw->daio_mgr_commit_write(hw, mgr->mgr.ctrl_blk);
 
 	return 0;
@@ -444,7 +458,7 @@ static int dai_rsc_init(struct dai *dai,
 			const struct daio_desc *desc,
 			struct daio_mgr *mgr)
 {
-	int err;
+	int idx, err;
 	struct hw *hw = mgr->mgr.hw;
 	unsigned int rsr, msr;
 
@@ -458,6 +472,12 @@ static int dai_rsc_init(struct dai *dai,
 	if (err)
 		goto error1;
 
+	idx = daio_device_index(dai->daio.type, dai->hw);
+	if (idx < 0) {
+		err = idx;
+		goto error1;
+	}
+
 	for (rsr = 0, msr = desc->msr; msr > 1; msr >>= 1)
 		rsr++;
 
@@ -466,8 +486,7 @@ static int dai_rsc_init(struct dai *dai,
 	/* default to disabling control of a SRC */
 	hw->dai_srt_set_ec(dai->ctrl_blk, 0);
 	hw->dai_srt_set_et(dai->ctrl_blk, 0); /* default to disabling SRT */
-	hw->dai_commit_write(hw,
-		daio_device_index(dai->daio.type, dai->hw), dai->ctrl_blk);
+	hw->dai_commit_write(hw, idx, dai->ctrl_blk);
 
 	return 0;
 
@@ -582,28 +601,28 @@ static int put_daio_rsc(struct daio_mgr *mgr, struct daio *daio)
 static int daio_mgr_enb_daio(struct daio_mgr *mgr, struct daio *daio)
 {
 	struct hw *hw = mgr->mgr.hw;
+	int idx = daio_device_index(daio->type, hw);
 
-	if (daio->output) {
-		hw->daio_mgr_enb_dao(mgr->mgr.ctrl_blk,
-				daio_device_index(daio->type, hw));
-	} else {
-		hw->daio_mgr_enb_dai(mgr->mgr.ctrl_blk,
-				daio_device_index(daio->type, hw));
-	}
+	if (idx < 0)
+		return idx;
+	if (daio->output)
+		hw->daio_mgr_enb_dao(mgr->mgr.ctrl_blk, idx);
+	else
+		hw->daio_mgr_enb_dai(mgr->mgr.ctrl_blk, idx);
 	return 0;
 }
 
 static int daio_mgr_dsb_daio(struct daio_mgr *mgr, struct daio *daio)
 {
 	struct hw *hw = mgr->mgr.hw;
+	int idx = daio_device_index(daio->type, hw);
 
-	if (daio->output) {
-		hw->daio_mgr_dsb_dao(mgr->mgr.ctrl_blk,
-				daio_device_index(daio->type, hw));
-	} else {
-		hw->daio_mgr_dsb_dai(mgr->mgr.ctrl_blk,
-				daio_device_index(daio->type, hw));
-	}
+	if (idx < 0)
+		return idx;
+	if (daio->output)
+		hw->daio_mgr_dsb_dao(mgr->mgr.ctrl_blk, idx);
+	else
+		hw->daio_mgr_dsb_dai(mgr->mgr.ctrl_blk, idx);
 	return 0;
 }
 
-- 
2.53.0

