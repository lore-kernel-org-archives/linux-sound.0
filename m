Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE73E639D
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172950; cv=none; b=KCHhBvXrGISgwVwmiv/aSzEGWqCeMA/d2Uly04KNxT6OKquJEqztaADLDy8qSODRpSkikYq71RJz63NjGpPab3mdjHXc/EUXHLXbKeFfTC/K4Kjk/DpP53hPYP5TdRLl4SOvXxD/RRhqXlZxS13myONBalW5C9PWO1N/j4WsgM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172950; c=relaxed/simple;
	bh=3dc3W8yQFWHIqnX5A518jtpHziEOiZeVXYFgCr4qjyw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIZAdI+wdF08cp09rCZZN2MaZ7KyRdEFXRWSzkCrQtyhL8H2vbdvb4MrTe5D5lS+80VaNdpy1Wc74uH5JxrFGLUPk3n3clpUdz19fidnS2iTQ7Wwgzn0gnz4RFhCQXjeGL8u/2/BPgkQyJrAk/VMh1k3UiOCin2inVBeltogiiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gph38ebw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nBXPqwyP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gph38ebw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nBXPqwyP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gph38ebw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nBXPqwyP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gph38ebw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nBXPqwyP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 480E06A932;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+VuXn9LFI1DaKzkP3K02XbzGMyxBQP1ZxAbvKNNK8M=;
	b=gph38ebwIcJAXHPkLJhf1S0Lt+lqG6IXKApm2H9vrSAQzgNLDqpUW/+Jz9m+IKY2MulYbH
	hAlUL4jAo/SM+yF4BMkhBdZXGr6OTYNt4mlexi6UDNhsOBPQwOS/KKMj/jfIPvYndkIvtp
	9/ZkVjl2LKNhohSVpA8TJrcYXZ7Jti0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+VuXn9LFI1DaKzkP3K02XbzGMyxBQP1ZxAbvKNNK8M=;
	b=nBXPqwyP8stwEKsSrI1uMeo2vmetDkfO+NuAD+FjBvflcAdl3x3Bp1Yj+c1qLhkxaGvi25
	XIBDU5f5FoQphKBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gph38ebw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nBXPqwyP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+VuXn9LFI1DaKzkP3K02XbzGMyxBQP1ZxAbvKNNK8M=;
	b=gph38ebwIcJAXHPkLJhf1S0Lt+lqG6IXKApm2H9vrSAQzgNLDqpUW/+Jz9m+IKY2MulYbH
	hAlUL4jAo/SM+yF4BMkhBdZXGr6OTYNt4mlexi6UDNhsOBPQwOS/KKMj/jfIPvYndkIvtp
	9/ZkVjl2LKNhohSVpA8TJrcYXZ7Jti0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+VuXn9LFI1DaKzkP3K02XbzGMyxBQP1ZxAbvKNNK8M=;
	b=nBXPqwyP8stwEKsSrI1uMeo2vmetDkfO+NuAD+FjBvflcAdl3x3Bp1Yj+c1qLhkxaGvi25
	XIBDU5f5FoQphKBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2DA814B478;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QMvRCY0/3mnbOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 13:22:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/4] ALSA: 6fire: Cover the whole probe and disconnect calls with register_mutex
Date: Tue, 14 Apr 2026 15:22:11 +0200
Message-ID: <20260414132218.411013-2-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414132218.411013-1-tiwai@suse.de>
References: <20260414132218.411013-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 480E06A932

In 6fire driver, we protect the concurrent calls against probe and
disconnect with the register_mutex, but it's applied only partially.
Since we handle two global pointers in devices[] and chips[] pairs,
the assignment of the latter can be inconsistent upon concurrent
interface probes, and the refcount handling isn't properly protected
at disconnect, either.

This patch extends the mutex application range to the whole probe and
disconnect functions.  It makes the code safer against potential
concurrent probles and disconnects, while it makes the code easier to
read, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/chip.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/usb/6fire/chip.c b/sound/usb/6fire/chip.c
index 874f6cd503ca..18a25449bcd3 100644
--- a/sound/usb/6fire/chip.c
+++ b/sound/usb/6fire/chip.c
@@ -83,22 +83,21 @@ static int usb6fire_chip_probe(struct usb_interface *intf,
 	struct snd_card *card = NULL;
 
 	/* look if we already serve this card and return if so */
-	scoped_guard(mutex, &register_mutex) {
-		for (i = 0; i < SNDRV_CARDS; i++) {
-			if (devices[i] == device) {
-				if (chips[i])
-					chips[i]->intf_count++;
-				usb_set_intfdata(intf, chips[i]);
-				return 0;
-			} else if (!devices[i] && regidx < 0)
-				regidx = i;
-		}
-		if (regidx < 0) {
-			dev_err(&intf->dev, "too many cards registered.\n");
-			return -ENODEV;
-		}
-		devices[regidx] = device;
+	guard(mutex)(&register_mutex);
+	for (i = 0; i < SNDRV_CARDS; i++) {
+		if (devices[i] == device) {
+			if (chips[i])
+				chips[i]->intf_count++;
+			usb_set_intfdata(intf, chips[i]);
+			return 0;
+		} else if (!devices[i] && regidx < 0)
+			regidx = i;
 	}
+	if (regidx < 0) {
+		dev_err(&intf->dev, "too many cards registered.\n");
+		return -ENODEV;
+	}
+	devices[regidx] = device;
 
 	/* check, if firmware is present on device, upload it if not */
 	ret = usb6fire_fw_init(intf);
@@ -165,14 +164,13 @@ static void usb6fire_chip_disconnect(struct usb_interface *intf)
 	struct sfire_chip *chip;
 	struct snd_card *card;
 
+	guard(mutex)(&register_mutex);
 	chip = usb_get_intfdata(intf);
 	if (chip) { /* if !chip, fw upload has been performed */
 		chip->intf_count--;
 		if (!chip->intf_count) {
-			scoped_guard(mutex, &register_mutex) {
-				devices[chip->regidx] = NULL;
-				chips[chip->regidx] = NULL;
-			}
+			devices[chip->regidx] = NULL;
+			chips[chip->regidx] = NULL;
 
 			/*
 			 * Save card pointer before teardown.
-- 
2.53.0

