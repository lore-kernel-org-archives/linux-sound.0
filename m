Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719892;
	b=Cqb3N1eU85ilh4R+HZNic4xJkml2gO0eWC1/kuXYXucrZ67WeiOZNjhOROXcHSeqqO6k
	 pKwkyUpSVciqeDPdN6W+7k0lAOYGw+Nm2m+wtDCzOMvccDpPtHjzi3mzPKOiHtyi5MIYw
	 dKztXbV+E9Hhx83irE1knQUSGkCtmxeiXaly1sAS5w+BNqHlpSPpuL79juIx6M2v828wi
	 IB10TjqwFH5CDhDbCSKWMeROqF61H2neFBU/yIu4Qdu1ngZ3om2xrULqugzOqDoMgCGda
	 k6DKAgEnC2G/OxJ2Qejj181FzlJZQr2lnofdueteV+x73HH8O8BHU7DOWH/orznLXaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719892;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Rspamd-Queue-Id:
	 X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spamd-Result:X-Spam-Score;
	bh=K3kP4kGzmn/1aYNPq6B9QmpO9cbuV7gtsYRqryKvkkg=;
	b=j8lIe+KAJVW7sehTccRfW5ZENh1VzKXD5BJHVCuGbP3oLSfUnmsY6/SriW476n5+9wTF
	 0qENZOrFxV/cQsL1udnXbpThdjDlIAoX46c1n6jFzjJhEYHtYR03AFu7sR8l1tZuPu68J
	 8Hb50du4l/DDk0LN2YUykrFZ/6Wz9/TkTp1J9tVv6rjmFYdaw/w6hCftEv4ZZPlDX032u
	 iolJaJTFjCXpnRSCzbSzJW2ZH2z2CjSt7XpzUWrbxF7Q2FeSez959kihoK66paI0M1gM2
	 DAl1jPIbZkkdIr5Vv3pv4G/2DzMBhgjpie0RGTCOh1d1AjWBIc9Q+A9Vu2eya96wCOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1FYUUksO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A2hgtGmI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1FYUUksO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A2hgtGmI;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3730606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 15:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3730606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1FYUUksO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A2hgtGmI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1FYUUksO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A2hgtGmI
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7262821C35;
	Tue,  3 Nov 2026 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793719889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K3kP4kGzmn/1aYNPq6B9QmpO9cbuV7gtsYRqryKvkkg=;
	b=1FYUUksOSWYOH3IEGq8GsOECtXizGAxP8N8jiDvAWQJUybdYqXv3pW7I1bXcuMBUNAJXA8
	xAs/ZGkyyaEuY23k0iqcbkfT+Vf+kUU7ozZDnu/h9Y2J2GCW/embfTvVfEwd+Q2+S0EOVS
	k9Dm+8OArRx0L9K4gEH9xheNCcC6K9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793719889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K3kP4kGzmn/1aYNPq6B9QmpO9cbuV7gtsYRqryKvkkg=;
	b=A2hgtGmIdSm7o9g3w9E4Rn7n9KKiHGihACWYXWKYNtd3pxWa6MfVJOBlhZG7rRzBWCgJAV
	+nHg4OakJJgAH9CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1FYUUksO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=A2hgtGmI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793719889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K3kP4kGzmn/1aYNPq6B9QmpO9cbuV7gtsYRqryKvkkg=;
	b=1FYUUksOSWYOH3IEGq8GsOECtXizGAxP8N8jiDvAWQJUybdYqXv3pW7I1bXcuMBUNAJXA8
	xAs/ZGkyyaEuY23k0iqcbkfT+Vf+kUU7ozZDnu/h9Y2J2GCW/embfTvVfEwd+Q2+S0EOVS
	k9Dm+8OArRx0L9K4gEH9xheNCcC6K9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793719889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K3kP4kGzmn/1aYNPq6B9QmpO9cbuV7gtsYRqryKvkkg=;
	b=A2hgtGmIdSm7o9g3w9E4Rn7n9KKiHGihACWYXWKYNtd3pxWa6MfVJOBlhZG7rRzBWCgJAV
	+nHg4OakJJgAH9CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4451A1352B;
	Tue,  3 Nov 2026 15:31:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3ijbBlH+6WrYQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Nov 2026 15:31:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Abort properly at errors for Extidy boot quirk
Date: Tue,  3 Nov 2026 16:31:16 +0100
Message-ID: <20261103153123.112097-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7262821C35
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.01

The boot quirk for Extigy tries to continue even if the extraction of
a new device descriptor fails, and it means an uninitialized data is
copied onto the device.

Abort properly upon errors for safety, instead.
Also, make the error messages more visible, as they are now supposed to
be real errors.

Fixes: b909df18ce2a ("ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy and Mbox devices")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 05a9f6727a3a..220ac9b10238 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -575,13 +575,18 @@ static int snd_usb_extigy_boot_quirk(struct usb_device *dev, struct usb_interfac
 			return -ENOMEM;
 		err = usb_get_descriptor(dev, USB_DT_DEVICE, 0,
 				new_device_descriptor, sizeof(*new_device_descriptor));
-		if (err < 0)
-			dev_dbg(&dev->dev, "error usb_get_descriptor: %d\n", err);
-		if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurations)
-			dev_dbg(&dev->dev, "error too large bNumConfigurations: %d\n",
+		if (err < 0) {
+			dev_err(&dev->dev, "error usb_get_descriptor: %d\n", err);
+			return -ENODEV;
+		}
+
+		if (new_device_descriptor->bNumConfigurations > dev->descriptor.bNumConfigurations) {
+			dev_err(&dev->dev, "error too large bNumConfigurations: %d\n",
 				new_device_descriptor->bNumConfigurations);
-		else
-			memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor));
+			return -ENODEV;
+		}
+
+		memcpy(&dev->descriptor, new_device_descriptor, sizeof(dev->descriptor));
 		err = usb_reset_configuration(dev);
 		if (err < 0)
 			dev_dbg(&dev->dev, "error usb_reset_configuration: %d\n", err);
-- 
2.55.0

