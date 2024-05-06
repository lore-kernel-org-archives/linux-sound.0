Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5209156223
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012033; cv=none; b=m0avEYijaLrjEYTQwWyZwnIu8soWBcsclJj7kpAeTXBMT+m5lHi7bhLEkkkiV5x0t8OMERyp2QgxgcUQfErP7eU5nrCBVcNUmILnZPEI0msKhs7LeM8LD/GEbtmwg/zDZ1hg1vVPF0yI0unP6oixOT7bZwTR4VD8Z5jKR+PHBJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012033; c=relaxed/simple;
	bh=EVLNe1l3sZ3fv+e2AJ+ufMucpyyBTKNnRhw8Jv2pQ/Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQnijGnBvNiHsOMzT/3hFHX5LBy4AzJ6L+vTOzh8KT2kkBRKbPjQtk8c11eOVn0jj8zbUyO48zVARGnieF1UzPoTVzcinvwIuHcoTIA27EsFpKQd2ny0euKgnLeDKqU37sdwKD1NDchM9JP5NWi0VLdbndlVx+fFfw4RinUIyYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uyuwlsc5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1twUv2CO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Uyuwlsc5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1twUv2CO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uyuwlsc5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1twUv2CO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Uyuwlsc5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1twUv2CO"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0FD4C385E1;
	Mon,  6 May 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNf+du6zNNSHu7KBY+sp1qKFV2PdyFSGIYs5aSbtgd4=;
	b=Uyuwlsc5y1WcJyzEbnay3OYq4VbcMg0kQ9SLLFigsuySOZigsXBQ/BU3Kb7ljJ32NIyrsg
	/W/LXJ3ATmgffw/m23E4B8csZKjKkq6HqdFfzc79mvxagT4eQuTOsI/qBCJhFJSsCpPLug
	IGlg/0v4VgtfvqMpSDV3R2pOkktGU+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNf+du6zNNSHu7KBY+sp1qKFV2PdyFSGIYs5aSbtgd4=;
	b=1twUv2COv/Ehv9OqJJaQriH/uDwdnhHmqxA3F/d9oLap7sX8Xpd/tDhBbCxx9fFSviOsce
	TTepNMXybwpU/9AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715012030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNf+du6zNNSHu7KBY+sp1qKFV2PdyFSGIYs5aSbtgd4=;
	b=Uyuwlsc5y1WcJyzEbnay3OYq4VbcMg0kQ9SLLFigsuySOZigsXBQ/BU3Kb7ljJ32NIyrsg
	/W/LXJ3ATmgffw/m23E4B8csZKjKkq6HqdFfzc79mvxagT4eQuTOsI/qBCJhFJSsCpPLug
	IGlg/0v4VgtfvqMpSDV3R2pOkktGU+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715012030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dNf+du6zNNSHu7KBY+sp1qKFV2PdyFSGIYs5aSbtgd4=;
	b=1twUv2COv/Ehv9OqJJaQriH/uDwdnhHmqxA3F/d9oLap7sX8Xpd/tDhBbCxx9fFSviOsce
	TTepNMXybwpU/9AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E634313A31;
	Mon,  6 May 2024 16:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0FYLN70BOWbwFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 May 2024 16:13:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 05/12] ALSA: hda: ca0132: Reduce CONFIG_PM dependencies
Date: Mon,  6 May 2024 18:13:48 +0200
Message-ID: <20240506161359.6960-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506161359.6960-1-tiwai@suse.de>
References: <20240506161359.6960-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -0.65
X-Spam-Level: 
X-Spamd-Result: default: False [-0.65 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.85)[85.40%];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.982];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

CONFIG_PM dependencies got reduced in HD-audio codec core driver, and
now it's time to reduce in HD-audio ca0132 codec driver, too.

Simply drop CONFIG_PM ifdefs.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_ca0132.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index aa312441604f..e4673a71551a 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -9682,7 +9682,6 @@ static void dbpro_free(struct hda_codec *codec)
 	kfree(codec->spec);
 }
 
-#ifdef CONFIG_PM
 static int ca0132_suspend(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
@@ -9690,7 +9689,6 @@ static int ca0132_suspend(struct hda_codec *codec)
 	cancel_delayed_work_sync(&spec->unsol_hp_work);
 	return 0;
 }
-#endif
 
 static const struct hda_codec_ops ca0132_patch_ops = {
 	.build_controls = ca0132_build_controls,
@@ -9698,9 +9696,7 @@ static const struct hda_codec_ops ca0132_patch_ops = {
 	.init = ca0132_init,
 	.free = ca0132_free,
 	.unsol_event = snd_hda_jack_unsol_event,
-#ifdef CONFIG_PM
 	.suspend = ca0132_suspend,
-#endif
 };
 
 static const struct hda_codec_ops dbpro_patch_ops = {
-- 
2.43.0

