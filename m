Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661E52DA75C
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802549; cv=none; b=BKKhDHH5xl7nY3B4nsQ0FDc6JxAN6EXhOibCFHzN+N3iEnswLM2cwiCJn7ZQom6d0+evb+QbPbn9p+KwRh/62HmiWgLo80hCRDCiw4Gi25gai+VMIYhL0a49FhoUMofcseGa24mC666bXm9/hbzSRsoaZQM55/F6ZDCOl1we/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802549; c=relaxed/simple;
	bh=Q3jNJf/Zw7GedcatHW2MG36wqnuXqB6GYRmwcVuFe1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3Qd3d5cwmR1UjQPR4m0GSFaF+48vf3pSMaeq24tKAnYlxAcYj0Bu6UzSU3n1lw41xSw70aUd1dv7fL5ew6TUcRbDrJLW/uePUGTWZ5V//1I9xDma/0r1q83/lF1X5ycNzNFCxW5AqFChAWxqwiL33zzUDD8wTj6Xat3pzmQv4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fHKxTNNZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GmNDEBT4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fHKxTNNZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GmNDEBT4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fHKxTNNZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GmNDEBT4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fHKxTNNZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GmNDEBT4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D88C1F78E;
	Fri, 13 Jun 2025 08:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3BBiXf6RjDDK3NeKj75WXol65b5aTur7W6MrnTaAOto=;
	b=fHKxTNNZktxNF34xdb6ZuqLJAduNl8IRTAKo+tblsv6EJg4g/nk5b4S+QIGvRa68O0uDKX
	Ek98wEhcKDtI0eAmZX6K/z9sYm7QUiLSI2TBXD/V/MhwbzZ3BMH45tIJS55UnCO+buDW6U
	EKnM/ECzv/Wrb7La9D8+rmQ0oDQickg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3BBiXf6RjDDK3NeKj75WXol65b5aTur7W6MrnTaAOto=;
	b=GmNDEBT4OO/CIJeIS39OLedUmAviGbt73bvGAGoSSnBU4K0bXPTFKEbi1n8h/X5THIw7bU
	HOhLtgPtIEAYcNDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749802546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3BBiXf6RjDDK3NeKj75WXol65b5aTur7W6MrnTaAOto=;
	b=fHKxTNNZktxNF34xdb6ZuqLJAduNl8IRTAKo+tblsv6EJg4g/nk5b4S+QIGvRa68O0uDKX
	Ek98wEhcKDtI0eAmZX6K/z9sYm7QUiLSI2TBXD/V/MhwbzZ3BMH45tIJS55UnCO+buDW6U
	EKnM/ECzv/Wrb7La9D8+rmQ0oDQickg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749802546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3BBiXf6RjDDK3NeKj75WXol65b5aTur7W6MrnTaAOto=;
	b=GmNDEBT4OO/CIJeIS39OLedUmAviGbt73bvGAGoSSnBU4K0bXPTFKEbi1n8h/X5THIw7bU
	HOhLtgPtIEAYcNDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EA2F13782;
	Fri, 13 Jun 2025 08:15:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WDLiFTLeS2jaJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 08:15:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH] ALSA: usb-audio: Fix build with CONFIG_INPUT=n
Date: Fri, 13 Jun 2025 10:15:30 +0200
Message-ID: <20250613081543.7404-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

The recent addition of DualSense mixer quirk relies on the input
device handle, and the build can fail if CONFIG_INPUT isn't set.
Put (rather ugly) workarounds to wrap with IS_REACHABLE() for avoiding
the build error.

Fixes: 79d561c4ec04 ("ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506130733.gnPKw2l3-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a0ffe8b559dc..7cc27ae5512f 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -532,6 +532,7 @@ static int snd_emu0204_controls_create(struct usb_mixer_interface *mixer)
 					  &snd_emu0204_control, NULL);
 }
 
+#if IS_REACHABLE(CONFIG_INPUT)
 /*
  * Sony DualSense controller (PS5) jack detection
  *
@@ -788,6 +789,7 @@ static int snd_dualsense_controls_create(struct usb_mixer_interface *mixer)
 
 	return snd_dualsense_jack_create(mixer, "Headset Mic Jack", false);
 }
+#endif /* IS_REACHABLE(CONFIG_INPUT) */
 
 /* ASUS Xonar U1 / U3 controls */
 
@@ -4331,10 +4333,12 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		err = snd_emu0204_controls_create(mixer);
 		break;
 
+#if IS_REACHABLE(CONFIG_INPUT)
 	case USB_ID(0x054c, 0x0ce6): /* Sony DualSense controller (PS5) */
 	case USB_ID(0x054c, 0x0df2): /* Sony DualSense Edge controller (PS5) */
 		err = snd_dualsense_controls_create(mixer);
 		break;
+#endif /* IS_REACHABLE(CONFIG_INPUT) */
 
 	case USB_ID(0x0763, 0x2030): /* M-Audio Fast Track C400 */
 	case USB_ID(0x0763, 0x2031): /* M-Audio Fast Track C400 */
-- 
2.49.0

