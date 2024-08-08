Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C918A6A4
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723105048; cv=none; b=VAagGRykRe0+gCpvqf+7yBpjPxdrZivnRjhykXuSNas2nA1AbmjG1n9MAHFqP0Z0DVRc/Ag8LiV6lOSs6ft9Q6mV/sfHF6LMU1MsZ6wuGNoVNIV0RA+78EVZNavuKBt6J3BUt7fqKLq50V3ecd9qr3obOhTIIDci6tgW/sZicN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723105048; c=relaxed/simple;
	bh=49iRrYlZsOk7icFFVe8JKNUdjSY04jD5j1KUNTHux80=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=BA4TV5u7fhm/DOY2X8RSn9JHhWR1O+hA4U/n2/nUIiCmZVKtMjGDxLhMdCSC6dEkIPnJFO83/JS0MU2MXA2v48Ril9F4dXxb74/Crq20h6KMZ84BdYu6vuvA9H3dS65d2iufHllIZBWqAVt3rSSWkVh97pMnuK6KdlOCGcU9oh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pNzQG5ZX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yWeS5+eg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pNzQG5ZX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yWeS5+eg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pNzQG5ZX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yWeS5+eg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pNzQG5ZX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yWeS5+eg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4FC6B21AEE;
	Thu,  8 Aug 2024 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723105045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=485W5/7z/yJzSvYQeF9H4ohDOdB5q8vP/KucXAC0LH0=;
	b=pNzQG5ZXNqZAyDOncHeisWZ5O/+eMDNO6kcOWayvd5jn60qmdJuTf5+dTX/DNGPePcFddN
	ON7965TbUk6RQZFLKu57lhrXfeX8QK0bUQg6voLBl92cLqm6o9Jj/KS5g8JkwOr4Cf11xJ
	JKpD6C5Mw55Wdv8CuOLdy1KQ0nEXM24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723105045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=485W5/7z/yJzSvYQeF9H4ohDOdB5q8vP/KucXAC0LH0=;
	b=yWeS5+egTOE9D0rkfn2NolN7Jx3GlWPCqbmNwa7kZSWjVCjsXMN/L6O2+jPqZCVmckg7gS
	/kdcm8qE/6LKc4Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723105045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=485W5/7z/yJzSvYQeF9H4ohDOdB5q8vP/KucXAC0LH0=;
	b=pNzQG5ZXNqZAyDOncHeisWZ5O/+eMDNO6kcOWayvd5jn60qmdJuTf5+dTX/DNGPePcFddN
	ON7965TbUk6RQZFLKu57lhrXfeX8QK0bUQg6voLBl92cLqm6o9Jj/KS5g8JkwOr4Cf11xJ
	JKpD6C5Mw55Wdv8CuOLdy1KQ0nEXM24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723105045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=485W5/7z/yJzSvYQeF9H4ohDOdB5q8vP/KucXAC0LH0=;
	b=yWeS5+egTOE9D0rkfn2NolN7Jx3GlWPCqbmNwa7kZSWjVCjsXMN/L6O2+jPqZCVmckg7gS
	/kdcm8qE/6LKc4Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 370DA13946;
	Thu,  8 Aug 2024 08:17:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dJD8CxV/tGYaDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 08:17:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Re-add ScratchAmp quirk entries
Date: Thu,  8 Aug 2024 10:18:01 +0200
Message-ID: <20240808081803.22300-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80

At the code refactoring of USB-audio quirk handling, I assumed that
the quirk entries of Stanton ScratchAmp devices were only about the
device name, and moved them completely into the rename table.
But it seems that the device requires the quirk entry so that it's
probed by the driver itself.

This re-adds back the quirk entries of ScratchAmp, but in a
minimalistic manner.

Fixes: 5436f59bc5bc ("ALSA: usb-audio: Move device rename and profile quirks to an internal table")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks-table.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 73abc38a5400..f13a8d63a019 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2594,6 +2594,10 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 	}
 },
 
+/* Stanton ScratchAmp */
+{ USB_DEVICE(0x103d, 0x0100) },
+{ USB_DEVICE(0x103d, 0x0101) },
+
 /* Novation EMS devices */
 {
 	USB_DEVICE_VENDOR_SPEC(0x1235, 0x0001),
-- 
2.43.0

