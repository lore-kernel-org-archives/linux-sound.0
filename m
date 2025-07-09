Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383D1482E7
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077224; cv=none; b=O+ZwVbYJKOEatbOl5xuqFE1WI5LPD1eK3f0M9yO8oRBWapnfbefpVPyT119AOJeGXMoKqjOBfqHDYZu+kkPMTTSZxzCN3p/1Dn0J5wH4m4IQeXOsv4gpb+oHFqODGAyiDgEyd8XbQwyCMwdbzBAJBBfz23U8UzYmKoWWRc7AluA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077224; c=relaxed/simple;
	bh=N7oaJFcj9j/Et52sed82lGU1ILI5J8XVyQSJ54sNYQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cD9etlPt4aGIbh+5XvAvsBTqe9mf+0P7zjHtaurRhxdNzIUrRajCNpF6vonrH3x8ORrINtrXV/TDpJV0cfNp+6+qsAr/QFHtR5906MaqLkAi7jwnTd7kOPfuDhzWMyuRDUhGHFoF88i4ipBHiZP34oJwVpkSKcaB9EWYFvbHzXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lYiy0hHz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KBR1Y+pV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=poBecDtG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GMekTRvH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lYiy0hHz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KBR1Y+pV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="poBecDtG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMekTRvH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB29C1F456;
	Wed,  9 Jul 2025 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vo+Sucy5q/j9k1o3mIsyLd41hLgJy65/2jy20+mKFxc=;
	b=lYiy0hHz+oNePuit0tlEJSuhOME48VV39sBqcyXkrGXIvKmYqU3iGKx/dZ615OJMHCwzfT
	Ja4yrYG/2Z9pwnKbDjb3QoiIJ/8ehS31ckODxfaGQz3OLPhawduWpWLW0zRq5dKBJ6Jq7f
	feEmQ1Jg3/DdGtPt6TNMgAONASzYuXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077103;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vo+Sucy5q/j9k1o3mIsyLd41hLgJy65/2jy20+mKFxc=;
	b=KBR1Y+pVtqoD04kruwhe3456Cm1D9D/hXFsXdt6PiJwI6kTxGtC5mqa2VGqKokjj5TL0x6
	d43Pwi9N5XiRXrBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752077102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vo+Sucy5q/j9k1o3mIsyLd41hLgJy65/2jy20+mKFxc=;
	b=poBecDtGyLt0ub/Si0R49w7Bv3xe4mb9Sp7lhpgHtbCkoaotM+i6IWwzyfIdUn9wcBxXfJ
	1ygjsqrtVwApKYMdfV7TqTr02ySfddzZUHjbkU/SgXOsD729hjNtnmZzjG5ToRW7DTGdBI
	IXTPEUMwwyGhxjYEKjrggF7riL7NelA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752077102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vo+Sucy5q/j9k1o3mIsyLd41hLgJy65/2jy20+mKFxc=;
	b=GMekTRvHYGkUCMzKZ9IR1a77AXczHNlO5MgMrIEPJPdpBIiBJEvyh65ssOCEMzpuzNVMKN
	9NaD3t567ls9WvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78568136DC;
	Wed,  9 Jul 2025 16:05:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4MsjHC6TbmhDEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Jul 2025 16:05:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kailang <kailang@realtek.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 26/27] MAINTAINERS: Adjust to the new HD-audio driver paths
Date: Wed,  9 Jul 2025 18:04:29 +0200
Message-ID: <20250709160434.1859-27-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709160434.1859-1-tiwai@suse.de>
References: <20250709160434.1859-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL7bz5f8woybp4997xe1n6ecoy)];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

The HD-audio drivers are moved under sound/hda now.
Correct the locations.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5bfcaf0732ed..bd86f2ad65b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5741,9 +5741,9 @@ F:	drivers/spi/spi-cs42l43*
 F:	include/dt-bindings/sound/cs*
 F:	include/linux/mfd/cs42l43*
 F:	include/sound/cs*
-F:	sound/pci/hda/cirrus*
-F:	sound/pci/hda/cs*
-F:	sound/pci/hda/hda_component*
+F:	sound/hda/codecs/cirrus*
+F:	sound/hda/codecs/side-codecs/cs*
+F:	sound/hda/codecs/side-codecs/hda_component*
 F:	sound/soc/codecs/cs*
 
 CIRRUS LOGIC HAPTIC DRIVERS
@@ -24533,7 +24533,7 @@ F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
-F:	sound/pci/hda/tas2781_hda_i2c.c
+F:	sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
 F:	sound/soc/codecs/pcm1681.c
 F:	sound/soc/codecs/pcm1789*.*
 F:	sound/soc/codecs/pcm179x*.*
@@ -27473,7 +27473,7 @@ SENARYTECH AUDIO CODEC DRIVER
 M:	bo liu <bo.liu@senarytech.com>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
-F:	sound/pci/hda/patch_senarytech.c
+F:	sound/hda/codecs/senarytech.c
 
 THE REST
 M:	Linus Torvalds <torvalds@linux-foundation.org>
-- 
2.50.0

