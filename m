Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6946824A06B
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750684501; cv=none; b=BRhiS8WyfSsvVUT91b2P81fkxFoV4Xa+K0mupkXZJYyeVeFQH5XCoXlLjgMmKQjfDGGcBA25c5MGawVa7B4f1XDDJcw/pvCJVA4ZDnmknhaPDTyRQtXQAmk1Vpr6enjbjXq68wmvF0Tb5dbZ6EOl9Am00aoJ31rdHqTgfw/8YI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750684501; c=relaxed/simple;
	bh=RvUQ+czBIKPCoSkLkcLz6sDNGtnr49QEWwrGMs6+EOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RQ7Jx7kOQuYOzdPk9KSgBKyiXbWtlNTSlZoorwTIRQSzVU2yj5dJWlRb1hAzy2EfpEOzkWEie+kYvKLLYYkMWUtT4zfO+Nb0GTIRmo89cT+dTLYRPS7KWMYprXnM8Fn/1Qu38OZEIR43FjoMqvQW6u9wKhbPnRcfdcTcvTvAxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oG7UHU1L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jOMfwDZS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oG7UHU1L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jOMfwDZS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oG7UHU1L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jOMfwDZS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oG7UHU1L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jOMfwDZS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3379C1F391;
	Mon, 23 Jun 2025 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750684490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAVz0QRXr/Vu35bxYUHMr1NRG+NYYiXMoOGRxqHZYz0=;
	b=oG7UHU1LxkZsOJz26wn707jtMExCeNVSmOxulZNFj/F6Ghjecd+s8mmgW/fGrVS+z+XjcF
	kzyo0oR+qySFf9Bvspgtn2fUSrT5e5uKfeovxE6sPfFVlhguoWNz444MtRXJPLMbPCSzoB
	35yD8S9HyiRKQk4+GlnsYLC5pQXQF7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750684490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAVz0QRXr/Vu35bxYUHMr1NRG+NYYiXMoOGRxqHZYz0=;
	b=jOMfwDZSkGCVA8EfTehhOp8tgaSNOK4OVn3P/SWNnCCJQn71biag520hyHd1cruCpT+BCZ
	3NY4mTcubsfydjDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750684490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAVz0QRXr/Vu35bxYUHMr1NRG+NYYiXMoOGRxqHZYz0=;
	b=oG7UHU1LxkZsOJz26wn707jtMExCeNVSmOxulZNFj/F6Ghjecd+s8mmgW/fGrVS+z+XjcF
	kzyo0oR+qySFf9Bvspgtn2fUSrT5e5uKfeovxE6sPfFVlhguoWNz444MtRXJPLMbPCSzoB
	35yD8S9HyiRKQk4+GlnsYLC5pQXQF7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750684490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sAVz0QRXr/Vu35bxYUHMr1NRG+NYYiXMoOGRxqHZYz0=;
	b=jOMfwDZSkGCVA8EfTehhOp8tgaSNOK4OVn3P/SWNnCCJQn71biag520hyHd1cruCpT+BCZ
	3NY4mTcubsfydjDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 085E113A27;
	Mon, 23 Jun 2025 13:14:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kEWsAEpTWWhzTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Jun 2025 13:14:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH 2/3] ALSA: hda: Disable codec runtime PM when jack polling is enabled
Date: Mon, 23 Jun 2025 15:14:31 +0200
Message-ID: <20250623131437.10670-3-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623131437.10670-1-tiwai@suse.de>
References: <20250623131437.10670-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,cixtech.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

When the jack polling is triggered quite frequently, it makes little
sense to perform the runtime PM at each time; since we do almost full
configuration at each runtime resume for HD-audio, the merit by power
saving would be lost.  Hence, it'd be more reasonable to disable the
runtime PM when the jack polling is enabled.

This patch introduces the runtime PM idle callback and disables the
runtime PM when the jack polling is enabled.  This also serves as the
preliminary change for the further jack poll cleanup.

The exception is the case where codec->bus->jackpoll_in_suspend flag
is set by the driver (currently set by HD-audio Tegra driver).  This
flag indicates that the polling is infrequent, hence there is still
benefit to perform the runtime PM.  The idle callback checks this flag
and allows the runtime PM when set.

Link: https://lore.kernel.org/20250619020844.2974160-1-joakim.zhang@cixtech.com
Tested-by: Joakim Zhang <joakim.zhang@cixtech.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_codec.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 4eba3970cd1a..ea361390b829 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2943,6 +2943,15 @@ static int hda_codec_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int hda_codec_runtime_idle(struct device *dev)
+{
+	struct hda_codec *codec = dev_to_hda_codec(dev);
+
+	if (codec->jackpoll_interval && !codec->bus->jackpoll_in_suspend)
+		return -EBUSY;
+	return 0;
+}
+
 static int hda_codec_pm_prepare(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
@@ -3008,7 +3017,8 @@ const struct dev_pm_ops hda_codec_driver_pm = {
 	.thaw = pm_sleep_ptr(hda_codec_pm_thaw),
 	.poweroff = pm_sleep_ptr(hda_codec_pm_suspend),
 	.restore = pm_sleep_ptr(hda_codec_pm_restore),
-	RUNTIME_PM_OPS(hda_codec_runtime_suspend, hda_codec_runtime_resume, NULL)
+	RUNTIME_PM_OPS(hda_codec_runtime_suspend, hda_codec_runtime_resume,
+		       hda_codec_runtime_idle)
 };
 
 /* suspend the codec at shutdown; called from driver's shutdown callback */
-- 
2.50.0

