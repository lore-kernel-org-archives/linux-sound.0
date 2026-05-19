Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBBB4D2EFE
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192722; cv=none; b=pRHS2rVgxMSbE4h5QhfPFeCSXk5awGqFdfOifSU/GKYJpG/kHCfvSKqYqatJqHC5VA3A4AokFes6XLMOnR3tT0DJ7i3jULekbWeQrz2gxdqJzgl9DJTcywUMxrY8/GpvVNgndyOk03vS5BaEUf4Lp2R3ddyWt3VWf3MbInonxVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192722; c=relaxed/simple;
	bh=sgHxSZBGatwbAHPbmt3UpumaR62O7OZ0oWEe7NBtLlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAzcN8MGKt2n5Ztv1Uop9+2EMgaD/qDJH0Xy3gBmb8po5qxVxDJ1tfuFin/6xz344CTXGFQWv9sKiGp8qS/VM3Slk5IpSi09Bc5/aVmoDwJIcwyHTms3/BeCHsDXlQwv52Ei28Drk1HNjMgvUT9WQJleN9VLrxB7qDBDIvmYz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=momTeoVA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MNzxS6Bz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=momTeoVA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MNzxS6Bz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="momTeoVA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MNzxS6Bz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="momTeoVA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MNzxS6Bz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B097C6B458;
	Tue, 19 May 2026 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779192719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MczN08BkLD5yxEuZcqlrDivqEa75GkUZ3qKsg/zkbD0=;
	b=momTeoVArI0IXDBGIlBOS4uoJrhRwPH9++ftsqI4b6XhhCeiFnw8x31IrX37qgJB1PGqNl
	lR9LCfwpUIbt5O7584sXRSX3S7hqxHO/HRqk9K2+FjmeekCBxN6nTssjq4qAz9XHgSytVh
	FLI5h/2NjN/sRJq5pU6y1BOZ5dIlg44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779192719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MczN08BkLD5yxEuZcqlrDivqEa75GkUZ3qKsg/zkbD0=;
	b=MNzxS6BzZObmyH14NUZJLiD6mUu/TW4G88fXhz5LpPTK7+66fzkF64vCCGQdHc4Zuqh5Dl
	Xccd0u4+D5WZuPBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=momTeoVA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MNzxS6Bz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779192719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MczN08BkLD5yxEuZcqlrDivqEa75GkUZ3qKsg/zkbD0=;
	b=momTeoVArI0IXDBGIlBOS4uoJrhRwPH9++ftsqI4b6XhhCeiFnw8x31IrX37qgJB1PGqNl
	lR9LCfwpUIbt5O7584sXRSX3S7hqxHO/HRqk9K2+FjmeekCBxN6nTssjq4qAz9XHgSytVh
	FLI5h/2NjN/sRJq5pU6y1BOZ5dIlg44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779192719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MczN08BkLD5yxEuZcqlrDivqEa75GkUZ3qKsg/zkbD0=;
	b=MNzxS6BzZObmyH14NUZJLiD6mUu/TW4G88fXhz5LpPTK7+66fzkF64vCCGQdHc4Zuqh5Dl
	Xccd0u4+D5WZuPBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96C6C593AA;
	Tue, 19 May 2026 12:11:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sJ/SI49TDGp6agAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 12:11:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jake Lamberson <lamberson.jake@gmail.com>
Subject: [PATCH 2/2] ALSA: hda/intel: Make sure to cancel irq-pending work at closing PCM stream
Date: Tue, 19 May 2026 14:11:53 +0200
Message-ID: <20260519121157.28477-2-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519121157.28477-1-tiwai@suse.de>
References: <20260519121157.28477-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Queue-Id: B097C6B458
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.01

The pending irq work might be still floating while the assigned stream
has been already closed, which may lead to UAF, especially when
another async work for fasync is involved.

For addressing this, extend the hda_controller_ops for allowing the
extra cleanup procedure that is specific to the controller driver, and
make sure to cancel and sync the pending irq work at each PCM close
before releasing the resources.

Reported-by: Jake Lamberson <lamberson.jake@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/controller.c     |  2 ++
 sound/hda/common/hda_controller.h |  2 ++
 sound/hda/controllers/intel.c     | 20 ++++++++++++++++----
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index 89e63a53d683..a847546753db 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -97,6 +97,8 @@ static int azx_pcm_close(struct snd_pcm_substream *substream)
 
 	trace_azx_pcm_close(chip, azx_dev);
 	scoped_guard(mutex, &chip->open_mutex) {
+		if (chip->ops->pcm_close)
+			chip->ops->pcm_close(chip, azx_dev);
 		azx_release_device(azx_dev);
 		if (hinfo->ops.close)
 			hinfo->ops.close(hinfo, apcm->codec, substream);
diff --git a/sound/hda/common/hda_controller.h b/sound/hda/common/hda_controller.h
index bc8ee4cc2401..38227f82e704 100644
--- a/sound/hda/common/hda_controller.h
+++ b/sound/hda/common/hda_controller.h
@@ -78,6 +78,8 @@ struct hda_controller_ops {
 	int (*position_check)(struct azx *chip, struct azx_dev *azx_dev);
 	/* enable/disable the link power */
 	int (*link_power)(struct azx *chip, bool enable);
+	/* additional hook for PCM */
+	void (*pcm_close)(struct azx *chip, struct azx_dev *azx_dev);
 };
 
 struct azx_pcm {
diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 01477bd4fcb9..4b03c64e72ab 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -761,16 +761,27 @@ static void azx_irq_pending_work(struct work_struct *work)
 }
 
 /* clear irq_pending flags and assure no on-going workq */
+static void hda_intel_stream_clear_irq_pending(struct azx_dev *azx_dev)
+{
+	struct hda_intel_stream *istream = azx_dev_to_istream(azx_dev);
+
+	istream->irq_pending = false;
+	cancel_work_sync(&istream->irq_pending_work);
+}
+
+/* called at PCM close */
+static void hda_intel_pcm_close(struct azx *chip, struct azx_dev *azx_dev)
+{
+	hda_intel_stream_clear_irq_pending(azx_dev);
+}
+
 static void azx_clear_irq_pending(struct azx *chip)
 {
 	struct hdac_bus *bus = azx_bus(chip);
 	struct hdac_stream *s;
 
 	list_for_each_entry(s, &bus->stream_list, list) {
-		struct azx_dev *azx_dev = stream_to_azx_dev(s);
-		struct hda_intel_stream *istream = azx_dev_to_istream(azx_dev);
-		istream->irq_pending = false;
-		cancel_work_sync(&istream->irq_pending_work);
+		hda_intel_stream_clear_irq_pending(stream_to_azx_dev(s));
 	}
 }
 
@@ -2131,6 +2142,7 @@ static const struct dmi_system_id driver_denylist_dmi[] = {
 static const struct hda_controller_ops pci_hda_ops = {
 	.disable_msi_reset_irq = disable_msi_reset_irq,
 	.position_check = azx_position_check,
+	.pcm_close = hda_intel_pcm_close,
 };
 
 static DECLARE_BITMAP(probed_devs, SNDRV_CARDS);
-- 
2.54.0

