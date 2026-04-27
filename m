Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9F43D5662
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301815; cv=none; b=a9smGpfex1C4qpl25V97dibpX0fY3OeXps18wMUKRTFOcrOiA0J9XuL7oNOC8koj/AzK5IRe5C6SdvO0/1EuTbfAExOQkq6edzhqY9KJXgHMh9rcw9F5o/GtVMgC5RcgqUPKv3UaRE5Bf9VEePMaW3UC5LHx25hlDCfYNx09KFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301815; c=relaxed/simple;
	bh=t9cPADJY2sOKcfn3uIc5R/hF7OLAj+fsLGpzMfYWR8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IIsIQRc8yFG/Uk/JpRcJTmNqRIjsA/3DtyPczUSWvXbvv5RpDFHkRFQUzTyY/Nfd5osuZn+aOZNcBxs6Q8P2zT1XQimEjH4Dr773DYk46ZM9O919hnNzKVJhMZ7yJ3uxFRDh3x9GWIaiTsEeoQmizLehBkQr7gXF5UaG01WjCzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wAzYqx/d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3mXRqMGk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wAzYqx/d; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3mXRqMGk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wAzYqx/d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3mXRqMGk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wAzYqx/d";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3mXRqMGk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 740F75BCC8;
	Mon, 27 Apr 2026 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777301811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zJi06EC5SOQhbLWoO2lLyoWh3LhTtnSapzh23Wvvx3Y=;
	b=wAzYqx/dUqyLHE9MxgX3Ut0FlGxs1hLou6AM4ffC074F/XI4Xq+KfuU1rcshGnh1WHLPck
	5nQZVk/024cD8+4gv4EpG7UOcFcdIHp5JwaPqeMzqK+frWyzdIeGC8xDfyT4C/rZ70KzPO
	R3mT1ZeIe05IaTdkIcuNhaPcle5hUxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777301811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zJi06EC5SOQhbLWoO2lLyoWh3LhTtnSapzh23Wvvx3Y=;
	b=3mXRqMGkHzKv3QqNEfpCw8+1dKhu52nGIVB9X10vQPS6rUyA1wcamLcPgT6mmUgzYT+iUU
	z7s0AZo72oXlVTBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="wAzYqx/d";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3mXRqMGk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777301811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zJi06EC5SOQhbLWoO2lLyoWh3LhTtnSapzh23Wvvx3Y=;
	b=wAzYqx/dUqyLHE9MxgX3Ut0FlGxs1hLou6AM4ffC074F/XI4Xq+KfuU1rcshGnh1WHLPck
	5nQZVk/024cD8+4gv4EpG7UOcFcdIHp5JwaPqeMzqK+frWyzdIeGC8xDfyT4C/rZ70KzPO
	R3mT1ZeIe05IaTdkIcuNhaPcle5hUxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777301811;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zJi06EC5SOQhbLWoO2lLyoWh3LhTtnSapzh23Wvvx3Y=;
	b=3mXRqMGkHzKv3QqNEfpCw8+1dKhu52nGIVB9X10vQPS6rUyA1wcamLcPgT6mmUgzYT+iUU
	z7s0AZo72oXlVTBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52866593B0;
	Mon, 27 Apr 2026 14:56:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D+fLEjN572kkMwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 14:56:51 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: caiaq: Don't abort when no input device is available
Date: Mon, 27 Apr 2026 16:56:15 +0200
Message-ID: <20260427145642.6637-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 740F75BCC8

The previous fix to handle the error from setup_card() caused a
regression for the models that have no dedicated input device;
snd_usb_caiaq_input_init() just returns -EINVAL, and we treat it as a
fatal error although it should be ignored.

As a regression fix, change the error code to -ENODEV, and ignore this
error in the callee, to continue probing.

Fixes: 28abd224db4a ("ALSA: caiaq: Handle probe errors properly")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221423
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/device.c | 2 +-
 sound/usb/caiaq/input.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index ad9f744b496b..b8ddd124e905 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -366,7 +366,7 @@ static int setup_card(struct snd_usb_caiaqdev *cdev)
 
 #ifdef CONFIG_SND_USB_CAIAQ_INPUT
 	ret = snd_usb_caiaq_input_init(cdev);
-	if (ret < 0) {
+	if (ret < 0 && ret != -ENODEV) {
 		dev_err(dev, "Unable to set up input system (ret=%d)\n", ret);
 		return ret;
 	}
diff --git a/sound/usb/caiaq/input.c b/sound/usb/caiaq/input.c
index a9130891bb69..5c70fdf61cc1 100644
--- a/sound/usb/caiaq/input.c
+++ b/sound/usb/caiaq/input.c
@@ -804,7 +804,7 @@ int snd_usb_caiaq_input_init(struct snd_usb_caiaqdev *cdev)
 
 	default:
 		/* no input methods supported on this device */
-		ret = -EINVAL;
+		ret = -ENODEV;
 		goto exit_free_idev;
 	}
 
-- 
2.54.0

