Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5758EEBB
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764659317; cv=none; b=a+ul7H5pghnqFF4r4rmpPVvzlL894m/rr+3Sx8nBD7VwatFf8F5axNDdIh/EUplgv9gwtyMJw9qNIm6e1rHSrUu0j99ivVcbCmHxUgL7lhX4juNy8Jl4Dfp1iwn4tumtp5Z+ACEDB4O/LIl9ZkfNPsAeC65qNXIcdv58BioE4TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764659317; c=relaxed/simple;
	bh=J936Fnzboph2BzAg5gal+RAEMGOc6K/WlI8PeZD5I2I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pYpJazCjNxltLLUv1Kui1GOdxCnyKy+f4QI4k6z9bGkzlWBn9H2K7h0V2I6a7jlUN98bTy8zs3Eq8WKO47E18bdR9HaH0RZMcS4qUqLAOhlNS4MqZXXtLyRdRBZQqUpNpoRuA07Wm9j5iFBL99BisC+194FzwcpNF8VOafEwUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1f59n2YE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iJerLh9R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u/QsQEQe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fMwQ6+Y/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1f59n2YE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iJerLh9R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u/QsQEQe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fMwQ6+Y/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A6AF733690;
	Tue,  2 Dec 2025 07:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764659313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IxwrlJV/1/DxJZMT+rjuVuign/i6hOyOrNoDMiRqd98=;
	b=1f59n2YE9dUR6GQN82nwxcsGDa318YBAc8qREWm2BL1v8Aunz1LpwHf+SWko/SoSm58XmY
	68zyNeZvT3WHxSx2Mzm/mxPxRpnAsKfN9ik9CaOKlguj+Zh6ICBNWwb7AGWEx4AMZ45dLr
	91Xjy2Vd4h0PHBO6MNw8lh3XYDCcSXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764659313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IxwrlJV/1/DxJZMT+rjuVuign/i6hOyOrNoDMiRqd98=;
	b=iJerLh9RNSGbbWpRftyWEpGMRS0NpLNoLrzPmNaO1f4DDF7bvR4D5Cbq09CycEG3sD//JS
	W3b+Xb7opaAHNXDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764659312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IxwrlJV/1/DxJZMT+rjuVuign/i6hOyOrNoDMiRqd98=;
	b=u/QsQEQeKORkQmAP17Wp/3AI9vCEa8fnM9mF3upWoC1DNDkMErjItJimTeT0WR+gvEOgEk
	PReNSHIzJNjEMXckOPjcjqLPS9zRT3Js+yR2Qgd3Thhf3cCOS9orXdaNya64rIa4KaZTVV
	eA3QhAHqcyMlrw9YCHe8Gyb2eG+5Ves=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764659312;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IxwrlJV/1/DxJZMT+rjuVuign/i6hOyOrNoDMiRqd98=;
	b=fMwQ6+Y/Q63VCSYe5dKxfg6pzkV5F+tfUqGvYcM3oLij73kX1dBawvXj/62zv+BSwwJDM8
	RJUj4V9HC7R+S5BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BA823EA63;
	Tue,  2 Dec 2025 07:08:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U9fRIHCQLmmEYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Dec 2025 07:08:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Simplify with usb_endpoint_max_periodic_payload()
Date: Tue,  2 Dec 2025 08:08:27 +0100
Message-ID: <20251202070828.145656-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.975];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.79

Recently we received a new helper function,
usb_endpoint_max_periodic_payload(), for calculating the max packet
size for periodic transfer.

Simplify the former open code with the new helper function.

Fixes: a748e1dbb2df ("ALSA: usb-audio: Fix max bytes-per-interval calculation")
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Link: https://lore.kernel.org/20251124210518.90054-1-dylan_robinson@motu.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 074a61215de6..ec7d756d78d1 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -684,43 +684,13 @@ snd_usb_find_output_terminal_descriptor(struct usb_host_interface *ctrl_iface,
 	return NULL;
 }
 
-static unsigned int
-snd_usb_max_bytes_per_interval(struct snd_usb_audio *chip,
-					struct usb_host_interface *alts)
-{
-	struct usb_host_endpoint *ep = &alts->endpoint[0];
-	unsigned int max_bytes = usb_endpoint_maxp(&ep->desc);
-
-	/* SuperSpeed isoc endpoints have up to 16 bursts of up to 3 packets each */
-	if (snd_usb_get_speed(chip->dev) >= USB_SPEED_SUPER) {
-		int burst = 1 + ep->ss_ep_comp.bMaxBurst;
-		int mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
-		max_bytes *= burst;
-		max_bytes *= mult;
-	}
-
-	if (snd_usb_get_speed(chip->dev) == USB_SPEED_SUPER_PLUS &&
-		USB_SS_SSP_ISOC_COMP(ep->ss_ep_comp.bmAttributes)) {
-		max_bytes = le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
-	}
-
-	/* High speed, 1-3 packets/uframe, max 6 for eUSB2 double bw */
-	if (snd_usb_get_speed(chip->dev) == USB_SPEED_HIGH) {
-		if (usb_endpoint_is_hs_isoc_double(chip->dev, ep))
-			max_bytes = le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
-		else
-			max_bytes *= usb_endpoint_maxp_mult(&ep->desc);
-	}
-
-	return max_bytes;
-}
-
 static struct audioformat *
 audio_format_alloc_init(struct snd_usb_audio *chip,
 		       struct usb_host_interface *alts,
 		       int protocol, int iface_no, int altset_idx,
 		       int altno, int num_channels, int clock)
 {
+	struct usb_host_endpoint *ep = &alts->endpoint[0];
 	struct audioformat *fp;
 
 	fp = kzalloc(sizeof(*fp), GFP_KERNEL);
@@ -734,7 +704,7 @@ audio_format_alloc_init(struct snd_usb_audio *chip,
 	fp->ep_attr = get_endpoint(alts, 0)->bmAttributes;
 	fp->datainterval = snd_usb_parse_datainterval(chip, alts);
 	fp->protocol = protocol;
-	fp->maxpacksize = snd_usb_max_bytes_per_interval(chip, alts);
+	fp->maxpacksize = usb_endpoint_max_periodic_payload(chip->dev, ep);
 	fp->channels = num_channels;
 	fp->clock = clock;
 	INIT_LIST_HEAD(&fp->list);
-- 
2.52.0

