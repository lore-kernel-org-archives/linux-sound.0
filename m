Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B127A1F4E49
	for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737478839; cv=none; b=EH8zaVPlWHGY9RV7EAN2p3ds7CFW0ybnZ7mjCx3KB9rm5vuJWGS8DuwkaAHSyv6YlEE6EHIZQ6r6p3jDVa3IuPr0BweZK1viKshwR/er/iYjIdxDUFGaTrUsi4Pvx3GM34kpmXl+HX7z5FVCG0NuClxOfleqOhvOPVcWf81+kFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737478839; c=relaxed/simple;
	bh=3+6R666ywBlWcpI7MygkND3v2vixLSQ/WxbV1sTH1AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxAOqIIdTNUyDfR9ugNhsNRxaT215TFp9Bkk77IHdlfj6foqdSn18hLderw0PUJGlSrVziOS0/JpzKjF4ncYthm1TspAwFW1oHiMekEMIzl5O3oD2F52LUgeRnxU5ms7MTTCitVVtMh0aX0ZdGtwOpvbiQZPvWX7Qh1oYQfbikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X+IrGyRT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=40sLOtTZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X+IrGyRT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=40sLOtTZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X+IrGyRT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="40sLOtTZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X+IrGyRT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="40sLOtTZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B514C2116D;
	Tue, 21 Jan 2025 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737478835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6lL+lUFrtnuO/foo1lYJ7PPBTkOybkD6ykyjEmincM=;
	b=X+IrGyRT5j9tpbhs4GXdG5ux1HytThwUx8+habyaABiQPPUfdddH1LqrMa7gK+HTX8ciT6
	gqvsyz1RvL7hDWgB7HpGJACaUimRPV8/uqCfYnQAbFPqJVYsic9i0joT5LAZfv+2OYTx4u
	+MSLsKgtEBnTqcPpYa2bAl4t68z1AJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737478835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6lL+lUFrtnuO/foo1lYJ7PPBTkOybkD6ykyjEmincM=;
	b=40sLOtTZMtv80GbX1MX21apZGdiytI6mOom6ON+vlj5mB6m6F1vwVdX2NeDCp2J+A2+cO8
	YNXL4DR0N+3ihwCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737478835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6lL+lUFrtnuO/foo1lYJ7PPBTkOybkD6ykyjEmincM=;
	b=X+IrGyRT5j9tpbhs4GXdG5ux1HytThwUx8+habyaABiQPPUfdddH1LqrMa7gK+HTX8ciT6
	gqvsyz1RvL7hDWgB7HpGJACaUimRPV8/uqCfYnQAbFPqJVYsic9i0joT5LAZfv+2OYTx4u
	+MSLsKgtEBnTqcPpYa2bAl4t68z1AJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737478835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6lL+lUFrtnuO/foo1lYJ7PPBTkOybkD6ykyjEmincM=;
	b=40sLOtTZMtv80GbX1MX21apZGdiytI6mOom6ON+vlj5mB6m6F1vwVdX2NeDCp2J+A2+cO8
	YNXL4DR0N+3ihwCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8FB0D13991;
	Tue, 21 Jan 2025 17:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WDSYIbPSj2d3bgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Jan 2025 17:00:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH 1/3] ALSA: usb: fcp: Fix meter_levels type to __le32
Date: Tue, 21 Jan 2025 18:00:29 +0100
Message-ID: <20250121170032.7236-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121170032.7236-1-tiwai@suse.de>
References: <20250121170032.7236-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The cached level meter values are returned from the USB core as
__le32, hence declare properly.

Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501212331.SaePSmsA-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/fcp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index ecdd18335ab7..92e3caab0b82 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -100,7 +100,7 @@ struct fcp_data {
 
 	u8                   num_meter_slots;
 	s16                 *meter_level_map;
-	u32                 *meter_levels;
+	__le32              *meter_levels;
 	struct snd_kcontrol *meter_ctl;
 
 	unsigned int *meter_labels_tlv;
@@ -383,7 +383,7 @@ static int fcp_meter_ctl_get(struct snd_kcontrol *kctl,
 	struct usb_mixer_interface *mixer = elem->head.mixer;
 	struct fcp_data *private = mixer->private_data;
 	int num_meter_slots, resp_size;
-	u32 *resp = private->meter_levels;
+	__le32 *resp = private->meter_levels;
 	int i, err = 0;
 
 	struct {
@@ -655,7 +655,7 @@ static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
 	/* If the control doesn't exist, create it */
 	if (!private->meter_ctl) {
 		s16 *new_map __free(kfree) = NULL;
-		u32 *meter_levels __free(kfree) = NULL;
+		__le32 *meter_levels __free(kfree) = NULL;
 
 		/* Allocate buffer for the map */
 		new_map = kmalloc_array(map.map_size, sizeof(s16), GFP_KERNEL);
@@ -663,7 +663,7 @@ static int fcp_ioctl_set_meter_map(struct usb_mixer_interface *mixer,
 			return -ENOMEM;
 
 		/* Allocate buffer for reading meter levels */
-		meter_levels = kmalloc_array(map.meter_slots, sizeof(u32),
+		meter_levels = kmalloc_array(map.meter_slots, sizeof(__le32),
 					     GFP_KERNEL);
 		if (!meter_levels)
 			return -ENOMEM;
-- 
2.43.0

