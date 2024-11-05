Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D21E1CC170
	for <linux-sound@vger.kernel.org>; Tue,  5 Nov 2024 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730808080; cv=none; b=b/NG1t/xo/q36PBrpv5CfI7+S4MroTzfpjd81TGb8k1SJUVtud7dB9Hx9XLksKmQP5pwjDNaAy0BBnnd3jsn05sN+8kHnX/g9KmlHNBDBDZNPVkexrc0UoGRiPHKE3sQf/uJzvBSYK1IWiPEKj6QfVnHfqGmQvXye/+fScl4vF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730808080; c=relaxed/simple;
	bh=7pEyFITjgzqD+aMWYvtllxh0HR2qEP7raFeiFlVaLi8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=vEa1y3m1hahuhz/FZn2RKe4DFaWjwzAKlsOqflg0ZAoz7PFZDAVGtCbCvpopGnPDz+gLQI0MY+bkjtVRPnqC75IwD8+kqOKz7TIBdRb+/xlwrTmZmF840qM5V4oZF0SiitYxm1SJINFd5REBqu5Etp1yobgQZ0mx0XkP2H668ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y2SaDAym; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8df+1U3+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kHwrXs+t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u9g+51ux; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y2SaDAym";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8df+1U3+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kHwrXs+t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u9g+51ux"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4196C1FE2F;
	Tue,  5 Nov 2024 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730808077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f6ipmgvf+23Jj/2O4EaGzLxEwFmuGQyNWOnX3O22thM=;
	b=Y2SaDAymJQbgDoMYDPsn/LPQKqjzcz2PzsA/h2hwyAEdALylQDlL0axt0RQKUqQZLJpFzO
	roJZejugiEfwD46X5TDWdJU0Z4ewLfq55AQj2u+W0jUuyB5S0/FEr7ojfYtwoIie0hfwSh
	tVQGYctRdRqTdED7AeQ0VXw8NPgZU5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730808077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f6ipmgvf+23Jj/2O4EaGzLxEwFmuGQyNWOnX3O22thM=;
	b=8df+1U3+u17WyU827rmVEx3iFkI3MNd4e39ZI45Qa6O0fBD2ybpUS643+/nT47ZdXndZO1
	V/CatG71rXyN+fCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730808076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f6ipmgvf+23Jj/2O4EaGzLxEwFmuGQyNWOnX3O22thM=;
	b=kHwrXs+tatb2P+PUXr9MmIkovdE4Wcypy3tkqUb6c8EdkotzOr0+nPqzkUwFjOKnx4p7FC
	c9V/h3c2xihm+kiouacB5+QUdPCbAqQIgO/VvCELspUdx2Ib/o42fdrhvhTy3s3pn4guxn
	szJun4zQrSm6te4hVBcWxfsDALf2ooQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730808076;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=f6ipmgvf+23Jj/2O4EaGzLxEwFmuGQyNWOnX3O22thM=;
	b=u9g+51uxuwUubVCgg/oMfDxHY55iHHCC+F3wbBhUoEhI41doCnsHD7guaJKHqB25p4tAVT
	LIX7rt2BlVuO0DBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3392513964;
	Tue,  5 Nov 2024 12:01:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s8UBDAwJKmcFcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 05 Nov 2024 12:01:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: usb-audio: Add quirk for HP 320 FHD Webcam
Date: Tue,  5 Nov 2024 13:02:17 +0100
Message-ID: <20241105120220.5740-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.com:url,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

HP 320 FHD Webcam (03f0:654a) seems to have flaky firmware like other
webcam devices that don't like the frequency inquiries.  Also, Mic
Capture Volume has an invalid resolution, hence fix it to be 16 (as a
blind shot).

Link: https://bugzilla.suse.com/show_bug.cgi?id=1232768
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c  | 1 +
 sound/usb/quirks.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9945ae55b0d0..bd67027c7677 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1205,6 +1205,7 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 		}
 		break;
 	case USB_ID(0x1bcf, 0x2283): /* NexiGo N930AF FHD Webcam */
+	case USB_ID(0x03f0, 0x654a): /* HP 320 FHD Webcam */
 		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
 			usb_audio_info(chip,
 				"set resolution quirk: cval->res = 16\n");
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index e6278a245795..c5fd180357d1 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2114,6 +2114,8 @@ struct usb_audio_quirk_flags_table {
 
 static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	/* Device matches */
+	DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x041e, 0x4080, /* Creative Live Cam VF0610 */
-- 
2.43.0

