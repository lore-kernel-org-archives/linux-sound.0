Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725943822AE
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773650790; cv=none; b=Tlz1Y8G7G/jVm6NaXGzaTO02VjtgugCPLpwBa9HVf7ZdVMDDpIxoMD/4XvIOSbjVwoqFI3LYeDjkUOH+9zLIZVEuAh5FhRCmlxzOMz3nfbymfzRr5MEtkaJ754q+9se/hfbeukX+VYBn0rS/xYzaDwc7h45Tgwd7SkR54sWnHt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773650790; c=relaxed/simple;
	bh=XqSTTuxVg08oGu6Chy61D+Tj2nDX9EYfvpREQsaiIIc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FxetFE3b9CUtcuX9K66IMSY716X+WTVGFUTtyJf6jy4UZfO6DJalYXu9qhiaxA4SJSQISYVjjlv8qADHz30RJmT3+hsWR8ISrIujPlDmVlLiiPpGkFInBnGqs2ebXh8LM1P3IGSI+WAlXjSzAWyuU0hzIAI8tHBgeX8STWasjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qVu5Erfm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p//LriXQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qVu5Erfm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=p//LriXQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qVu5Erfm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p//LriXQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qVu5Erfm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="p//LriXQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ACA7B4D23B;
	Mon, 16 Mar 2026 08:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773650787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIhJnKoQQ6x92pEUeM7+5/uRoU/rUMz0hhGtkeVYCP8=;
	b=qVu5ErfmLtCIR69MuNSAhRtCjHIURRxCxBewFNy9XovpXh5lYxCdk/54R5uowwA9DsR3JU
	gMCCQg14BJSJMUo6mrmPJULvXwtrbk9u2PXbkd60lV9a11ylb9saNk03H9Fd0k5ziMbCnw
	oRls+tGwLUIpoVIBRYmKHia5PvvTdx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773650787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIhJnKoQQ6x92pEUeM7+5/uRoU/rUMz0hhGtkeVYCP8=;
	b=p//LriXQn/GCF0/eJo/4RzLcrCxYAuB4/hf+4qwQgiizNLyhCnz174nI41hY7FL70bXNeM
	52/BZMX4a+kTlfDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qVu5Erfm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="p//LriXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773650787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIhJnKoQQ6x92pEUeM7+5/uRoU/rUMz0hhGtkeVYCP8=;
	b=qVu5ErfmLtCIR69MuNSAhRtCjHIURRxCxBewFNy9XovpXh5lYxCdk/54R5uowwA9DsR3JU
	gMCCQg14BJSJMUo6mrmPJULvXwtrbk9u2PXbkd60lV9a11ylb9saNk03H9Fd0k5ziMbCnw
	oRls+tGwLUIpoVIBRYmKHia5PvvTdx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773650787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIhJnKoQQ6x92pEUeM7+5/uRoU/rUMz0hhGtkeVYCP8=;
	b=p//LriXQn/GCF0/eJo/4RzLcrCxYAuB4/hf+4qwQgiizNLyhCnz174nI41hY7FL70bXNeM
	52/BZMX4a+kTlfDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 666594273B;
	Mon, 16 Mar 2026 08:46:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0p2wFmPDt2k1bwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Mar 2026 08:46:27 +0000
Date: Mon, 16 Mar 2026 09:46:27 +0100
Message-ID: <87cy149n6k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Karsten Hohmeier <linux@hohmatik.de>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: UBSAN: shift-out-of-bounds in sound/pci/ctxfi/cthw20k2.c:956:31
In-Reply-To: <20260315155004.15633-1-linux@hohmatik.de>
References: <20260315155004.15633-1-linux@hohmatik.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: ACA7B4D23B
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sun, 15 Mar 2026 16:50:04 +0100,
Karsten Hohmeier wrote:
> 
> Hello Takashi,
> 
> Updated to 6.19.8 and got some more UBSAN errors.
> Care to take a look?

Through a quick glance, the patch below should paper over it, but we'd
need to check the printed error values.  You can uncomment
"//dump_stack();" lines to show the stack traces for further
investigation, too.


Takashi

-- 8< --
diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index b8bde27f3a1d..ad465f66e5bc 100644
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
@@ -112,7 +112,10 @@ static unsigned int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		case LINEO3:	return 5;
 		case LINEO4:	return 6;
 		case LINEIM:	return 7;
-		default:	return -EINVAL;
+		default:
+			pr_err("XXX invalid type %d for hw20k1\n", type);
+			//dump_stack();
+			return -EINVAL;
 		}
 	case ATC20K2:
 		switch (type) {
@@ -125,9 +128,14 @@ static unsigned int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		case LINEIM:	return 4;
 		case MIC:	return 5;
 		case RCA:	return 3;
-		default:	return -EINVAL;
+		default:
+			pr_err("XXX invalid type %d for hw20k2\n", type);
+			//dump_stack();
+			return -EINVAL;
 		}
 	default:
+		pr_err("XXX invalid chip type %d\n", hw->chip_type);
+		//dump_stack();
 		return -EINVAL;
 	}
 }
@@ -148,8 +156,11 @@ static int dao_spdif_set_spos(struct dao *dao, unsigned int spos)
 
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
 
@@ -287,8 +298,11 @@ static int dai_set_enb_srt(struct dai *dai, unsigned int enb)
 
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
 
@@ -367,7 +381,7 @@ static int dao_rsc_init(struct dao *dao,
 {
 	struct hw *hw = mgr->mgr.hw;
 	unsigned int conf;
-	int err;
+	int idx, err;
 
 	err = daio_rsc_init(&dao->daio, desc, mgr->mgr.hw);
 	if (err)
@@ -386,15 +400,18 @@ static int dao_rsc_init(struct dao *dao,
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
@@ -443,7 +460,7 @@ static int dai_rsc_init(struct dai *dai,
 			const struct daio_desc *desc,
 			struct daio_mgr *mgr)
 {
-	int err;
+	int idx, err;
 	struct hw *hw = mgr->mgr.hw;
 	unsigned int rsr, msr;
 
@@ -457,6 +474,12 @@ static int dai_rsc_init(struct dai *dai,
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
 
@@ -465,8 +488,7 @@ static int dai_rsc_init(struct dai *dai,
 	/* default to disabling control of a SRC */
 	hw->dai_srt_set_ec(dai->ctrl_blk, 0);
 	hw->dai_srt_set_et(dai->ctrl_blk, 0); /* default to disabling SRT */
-	hw->dai_commit_write(hw,
-		daio_device_index(dai->daio.type, dai->hw), dai->ctrl_blk);
+	hw->dai_commit_write(hw, idx, dai->ctrl_blk);
 
 	return 0;
 
@@ -581,28 +603,28 @@ static int put_daio_rsc(struct daio_mgr *mgr, struct daio *daio)
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
 
