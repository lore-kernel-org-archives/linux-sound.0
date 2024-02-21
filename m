Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275CF3EA91
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708509976; cv=none; b=kQle31mv4zntqoViNVpZJRvZbu17830qzGq69xx+Xalij/+5eI90Iu4W13n874Ha905P4+Y1+nD78tqhCSZy98peOKqWR0X8zVgqJPaKc7H5qWklnnpCl97H+WB+evt4E7tEdqNmXMNZdv9D2ZFx+GtB0p78s2R1jdO+7JJvtqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708509976; c=relaxed/simple;
	bh=Vb9NanSvUNZfscwHNS6ZX2o10xLEcfBUG2n5GIrbkJw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=pdjUUAdbEQQIkUGOSPnzTqg18LpnnmhmO6xPOH85dLNaEdaoZxidLrHAlfcQrwtvKO1D0UFDqLzryo83XtZOom3F1Hp/DoMoyO76LJ+ehDWKrm9rD0fUu72Ln4uBCRHADyfs1/OQ2e5SyxDRK64ujVvXOflVpn6bPNLGSzjL/sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ToBKDYjR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jo/9GbWy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ToBKDYjR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jo/9GbWy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ToBKDYjR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jo/9GbWy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ToBKDYjR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jo/9GbWy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 613FE1FB4C;
	Wed, 21 Feb 2024 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708509973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c+pkwekdc22H4GTwXXIuumq2XnxXUn/KNOcOQIKmyc0=;
	b=ToBKDYjRgM0xaM2uxieh7KlU5QSAmEx/+d7IHoCt2FqRcaiaNbMFUz2Vu+yGoZEv42PzgO
	CdztbsouUsShqpDA2jhUc2Q0Vg2oGYqDdC8UrjUZXBmsnZJ13SCvS7WGMagSeRo1XiChOK
	ZO4kWxl6AswdAD3S+5BfBmQ4pDsde/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708509973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c+pkwekdc22H4GTwXXIuumq2XnxXUn/KNOcOQIKmyc0=;
	b=Jo/9GbWyrBiKblHgzfCD+OdOra4lIiLG9B7AIdo75HvWhC3aChFcN1nFhkyH5G7weBaYOq
	He38aPSbwMVpVKAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708509973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c+pkwekdc22H4GTwXXIuumq2XnxXUn/KNOcOQIKmyc0=;
	b=ToBKDYjRgM0xaM2uxieh7KlU5QSAmEx/+d7IHoCt2FqRcaiaNbMFUz2Vu+yGoZEv42PzgO
	CdztbsouUsShqpDA2jhUc2Q0Vg2oGYqDdC8UrjUZXBmsnZJ13SCvS7WGMagSeRo1XiChOK
	ZO4kWxl6AswdAD3S+5BfBmQ4pDsde/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708509973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c+pkwekdc22H4GTwXXIuumq2XnxXUn/KNOcOQIKmyc0=;
	b=Jo/9GbWyrBiKblHgzfCD+OdOra4lIiLG9B7AIdo75HvWhC3aChFcN1nFhkyH5G7weBaYOq
	He38aPSbwMVpVKAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 459B013A69;
	Wed, 21 Feb 2024 10:06:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id of2lDxXL1WVIQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Feb 2024 10:06:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda: Set up BDL table at hw_params
Date: Wed, 21 Feb 2024 11:06:06 +0100
Message-Id: <20240221100607.6565-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ToBKDYjR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Jo/9GbWy"
X-Spamd-Result: default: False [4.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[16.64%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Rspamd-Queue-Id: 613FE1FB4C
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

So far the setup of BDL table is performed at the prepare stage, where
all PCM parameters have been already set up.  When something wrong
happens at it, we return -EINVAL; it's supposed to be a rare case
since the involved memory allocation is a small chunk of kmalloc for
the table.

However, when we receive too many small non-contiguous pages in highly
fragmented memories, it may overflow the max table size, resulting in
the same -EINVAL error from the prepare, too.  A bad scenario is that
user-space cannot know what went wrong (as it's an error from the
prepare stage) and -EINVAL, hence it may retry with the same
parameters, failing again repeatedly.

In this patch, we try to set up the BDL table at hw_params right after
the buffer allocation, and return -ENOMEM if it overflows.
This allows user-space knowing that it should reduce the buffer size
request accordingly and may retry with more fitting parameters.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_controller.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 3e7bfeee84fd..29eae7244fe7 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -24,6 +24,7 @@
 
 #include <sound/core.h>
 #include <sound/initval.h>
+#include <sound/pcm_params.h>
 #include "hda_controller.h"
 #include "hda_local.h"
 
@@ -108,6 +109,7 @@ static int azx_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct azx_pcm *apcm = snd_pcm_substream_chip(substream);
 	struct azx *chip = apcm->chip;
 	struct azx_dev *azx_dev = get_azx_dev(substream);
+	struct hdac_stream *hdas = azx_stream(azx_dev);
 	int ret = 0;
 
 	trace_azx_pcm_hw_params(chip, azx_dev);
@@ -117,9 +119,15 @@ static int azx_pcm_hw_params(struct snd_pcm_substream *substream,
 		goto unlock;
 	}
 
-	azx_dev->core.bufsize = 0;
-	azx_dev->core.period_bytes = 0;
-	azx_dev->core.format_val = 0;
+	/* Set up BDLEs here, return -ENOMEM if too many BDLEs are required */
+	hdas->bufsize = params_buffer_bytes(hw_params);
+	hdas->period_bytes = params_period_bytes(hw_params);
+	hdas->format_val = 0;
+	hdas->no_period_wakeup =
+		(hw_params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP) &&
+		(hw_params->flags & SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP);
+	if (snd_hdac_stream_setup_periods(hdas) < 0)
+		ret = -ENOMEM;
 
 unlock:
 	dsp_unlock(azx_dev);
-- 
2.35.3

