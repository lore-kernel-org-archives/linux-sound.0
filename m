Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1E20012A
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037669; cv=none; b=KeBodHUo6V8ULCPnepFEvgoDaXUGMdV0YtlcEIB2LSq7B8ET7q/bi6gR7lBJH3wfiRaGXaN1iZpdoIWD8W6GzpztpTak4ERrBWBUKynswWnjEq3p97gKgjpVmvPZKVFMg3pSOIv+Ur8HbXv/1t1wbeDWwr581dUlgwzBoOupnDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037669; c=relaxed/simple;
	bh=aJJ9ANZcWqf+yHq/a/UkFrujxJgzsJGAFkBubztMkgI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tm92nYUM8NhqGobTrmAcpprQn6mhdKCFUm4+wQmqw6VG383Isro7r2Mzvr8C/cJtOdDunB0rNjkOfv5JGsE2FOs3scKC3/O8Mi1Xo0I5Z9+uih5FT4twRS0xncWJNvV3zCZOuCjP7Ptywj0CBMcQRdiKF567E6vWuL9UI/oHHGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VFclUkWK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3VZqSMmV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VFclUkWK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3VZqSMmV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VFclUkWK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3VZqSMmV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VFclUkWK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3VZqSMmV"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B61CC21D29;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOGMG8NTAUd7Cng1llRcXIuIfH6grZ6ZeNOrEQzwIB4=;
	b=VFclUkWKiOtaqn0SNKZnIoOlrPWcHJCfZI1dU8CnEdSIz7RCKi2nL61wHwM6RtlJMD87bD
	D0M/jh88aoVE0A/NfYXU4F9M1GPY+hkQlL8mF0LAX0aKuTwU7jWlfHAne3yBRDwMkK4adx
	QqTDAGZxmCIF/Epwc6D5F4BUXWYAlDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOGMG8NTAUd7Cng1llRcXIuIfH6grZ6ZeNOrEQzwIB4=;
	b=3VZqSMmVjmWpbCA+paBkdBjPc4xtbSAvgsfNRnBHL88pd3CzAxwjA6JwBFf4mlVB5DXI2G
	77o78AEOHaHw06BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOGMG8NTAUd7Cng1llRcXIuIfH6grZ6ZeNOrEQzwIB4=;
	b=VFclUkWKiOtaqn0SNKZnIoOlrPWcHJCfZI1dU8CnEdSIz7RCKi2nL61wHwM6RtlJMD87bD
	D0M/jh88aoVE0A/NfYXU4F9M1GPY+hkQlL8mF0LAX0aKuTwU7jWlfHAne3yBRDwMkK4adx
	QqTDAGZxmCIF/Epwc6D5F4BUXWYAlDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037661;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NOGMG8NTAUd7Cng1llRcXIuIfH6grZ6ZeNOrEQzwIB4=;
	b=3VZqSMmVjmWpbCA+paBkdBjPc4xtbSAvgsfNRnBHL88pd3CzAxwjA6JwBFf4mlVB5DXI2G
	77o78AEOHaHw06BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 940FF13A7D;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YJ4LI913s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 37/54] ALSA: riptide: Use standard print API
Date: Wed,  7 Aug 2024 15:34:27 +0200
Message-ID: <20240807133452.9424-38-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.19)[-0.947];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

The device pointer is stored in struct cmdif for calling dev_*()
functions.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 193 ++++++++++++++++++------------------
 1 file changed, 98 insertions(+), 95 deletions(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 7e80686fb41a..329816f37b76 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -380,6 +380,7 @@ struct riptideport {
 };
 
 struct cmdif {
+	struct device *dev;
 	struct riptideport *hwport;
 	spinlock_t lock;
 	unsigned int cmdcnt;	/* cmd statistics */
@@ -727,7 +728,7 @@ static int loadfirmware(struct cmdif *cif, const unsigned char *img,
 			}
 		}
 	}
-	snd_printdd("load firmware return %d\n", err);
+	dev_dbg(cif->dev, "load firmware return %d\n", err);
 	return err;
 }
 
@@ -740,7 +741,7 @@ alloclbuspath(struct cmdif *cif, unsigned char source,
 
 		sink = *path & (~SPLIT_PATH);
 		if (sink != E2SINK_MAX) {
-			snd_printdd("alloc path 0x%x->0x%x\n", source, sink);
+			dev_dbg(cif->dev, "alloc path 0x%x->0x%x\n", source, sink);
 			SEND_PSEL(cif, source, sink);
 			source = lbusin2out[sink][0];
 			type = lbusin2out[sink][1];
@@ -778,7 +779,7 @@ freelbuspath(struct cmdif *cif, unsigned char source, const unsigned char *path)
 
 		sink = *path & (~SPLIT_PATH);
 		if (sink != E2SINK_MAX) {
-			snd_printdd("free path 0x%x->0x%x\n", source, sink);
+			dev_dbg(cif->dev, "free path 0x%x->0x%x\n", source, sink);
 			SEND_PCLR(cif, source, sink);
 			source = lbusin2out[sink][0];
 		}
@@ -811,8 +812,8 @@ static int writearm(struct cmdif *cif, u32 addr, u32 data, u32 mask)
 		} else
 			rptr.retlongs[0] &= ~mask;
 	}
-	snd_printdd("send arm 0x%x 0x%x 0x%x return %d\n", addr, data, mask,
-		    flag);
+	dev_dbg(cif->dev, "send arm 0x%x 0x%x 0x%x return %d\n", addr, data, mask,
+		flag);
 	return flag;
 }
 
@@ -832,14 +833,14 @@ static int sendcmd(struct cmdif *cif, u32 flags, u32 cmd, u32 parm,
 	hwport = cif->hwport;
 	if (cif->errcnt > MAX_ERROR_COUNT) {
 		if (cif->is_reset) {
-			snd_printk(KERN_ERR
-				   "Riptide: Too many failed cmds, reinitializing\n");
+			dev_err(cif->dev,
+				"Riptide: Too many failed cmds, reinitializing\n");
 			if (riptide_reset(cif, NULL) == 0) {
 				cif->errcnt = 0;
 				return -EIO;
 			}
 		}
-		snd_printk(KERN_ERR "Riptide: Initialization failed.\n");
+		dev_err(cif->dev, "Riptide: Initialization failed.\n");
 		return -EINVAL;
 	}
 	if (ret) {
@@ -899,21 +900,21 @@ static int sendcmd(struct cmdif *cif, u32 flags, u32 cmd, u32 parm,
 	if (time < cif->cmdtimemin)
 		cif->cmdtimemin = time;
 	if ((cif->cmdcnt) % 1000 == 0)
-		snd_printdd
-		    ("send cmd %d time: %d mintime: %d maxtime %d err: %d\n",
-		     cif->cmdcnt, cif->cmdtime, cif->cmdtimemin,
-		     cif->cmdtimemax, cif->errcnt);
+		dev_dbg(cif->dev,
+			"send cmd %d time: %d mintime: %d maxtime %d err: %d\n",
+			cif->cmdcnt, cif->cmdtime, cif->cmdtimemin,
+			cif->cmdtimemax, cif->errcnt);
 	return 0;
 
       errout:
 	cif->errcnt++;
 	spin_unlock_irqrestore(&cif->lock, irqflags);
-	snd_printdd
-	    ("send cmd %d hw: 0x%x flag: 0x%x cmd: 0x%x parm: 0x%x ret: 0x%x 0x%x CMDE: %d DATF: %d failed %d\n",
-	     cif->cmdcnt, (int)((void *)&(cmdport->stat) - (void *)hwport),
-	     flags, cmd, parm, ret ? ret->retlongs[0] : 0,
-	     ret ? ret->retlongs[1] : 0, IS_CMDE(cmdport), IS_DATF(cmdport),
-	     err);
+	dev_dbg(cif->dev,
+		"send cmd %d hw: 0x%x flag: 0x%x cmd: 0x%x parm: 0x%x ret: 0x%x 0x%x CMDE: %d DATF: %d failed %d\n",
+		cif->cmdcnt, (int)((void *)&(cmdport->stat) - (void *)hwport),
+		flags, cmd, parm, ret ? ret->retlongs[0] : 0,
+		ret ? ret->retlongs[1] : 0, IS_CMDE(cmdport), IS_DATF(cmdport),
+		err);
 	return err;
 }
 
@@ -923,14 +924,14 @@ setmixer(struct cmdif *cif, short num, unsigned short rval, unsigned short lval)
 	union cmdret rptr = CMDRET_ZERO;
 	int i = 0;
 
-	snd_printdd("sent mixer %d: 0x%x 0x%x\n", num, rval, lval);
+	dev_dbg(cif->dev, "sent mixer %d: 0x%x 0x%x\n", num, rval, lval);
 	do {
 		SEND_SDGV(cif, num, num, rval, lval);
 		SEND_RDGV(cif, num, num, &rptr);
 		if (rptr.retwords[0] == lval && rptr.retwords[1] == rval)
 			return 0;
 	} while (i++ < MAX_WRITE_RETRY);
-	snd_printdd("sent mixer failed\n");
+	dev_dbg(cif->dev, "sent mixer failed\n");
 	return -EIO;
 }
 
@@ -961,7 +962,7 @@ getsourcesink(struct cmdif *cif, unsigned char source, unsigned char sink,
 		return -EIO;
 	*a = rptr.retbytes[0];
 	*b = rptr.retbytes[1];
-	snd_printdd("getsourcesink 0x%x 0x%x\n", *a, *b);
+	dev_dbg(cif->dev, "%s 0x%x 0x%x\n", __func__, *a, *b);
 	return 0;
 }
 
@@ -988,11 +989,11 @@ getsamplerate(struct cmdif *cif, unsigned char *intdec, unsigned int *rate)
 	}
 	if (p[0]) {
 		if (p[1] != p[0])
-			snd_printdd("rates differ %d %d\n", p[0], p[1]);
+			dev_dbg(cif->dev, "rates differ %d %d\n", p[0], p[1]);
 		*rate = (unsigned int)p[0];
 	} else
 		*rate = (unsigned int)p[1];
-	snd_printdd("getsampleformat %d %d %d\n", intdec[0], intdec[1], *rate);
+	dev_dbg(cif->dev, "getsampleformat %d %d %d\n", intdec[0], intdec[1], *rate);
 	return 0;
 }
 
@@ -1003,9 +1004,9 @@ setsampleformat(struct cmdif *cif,
 {
 	unsigned char w, ch, sig, order;
 
-	snd_printdd
-	    ("setsampleformat mixer: %d id: %d channels: %d format: %d\n",
-	     mixer, id, channels, format);
+	dev_dbg(cif->dev,
+		"%s mixer: %d id: %d channels: %d format: %d\n",
+		__func__, mixer, id, channels, format);
 	ch = channels == 1;
 	w = snd_pcm_format_width(format) == 8;
 	sig = snd_pcm_format_unsigned(format) != 0;
@@ -1013,7 +1014,7 @@ setsampleformat(struct cmdif *cif,
 
 	if (SEND_SETF(cif, mixer, w, ch, order, sig, id) &&
 	    SEND_SETF(cif, mixer, w, ch, order, sig, id)) {
-		snd_printdd("setsampleformat failed\n");
+		dev_dbg(cif->dev, "%s failed\n", __func__);
 		return -EIO;
 	}
 	return 0;
@@ -1026,8 +1027,8 @@ setsamplerate(struct cmdif *cif, unsigned char *intdec, unsigned int rate)
 	union cmdret rptr = CMDRET_ZERO;
 	int i;
 
-	snd_printdd("setsamplerate intdec: %d,%d rate: %d\n", intdec[0],
-		    intdec[1], rate);
+	dev_dbg(cif->dev, "%s intdec: %d,%d rate: %d\n", __func__,
+		intdec[0], intdec[1], rate);
 	D = 48000;
 	M = ((rate == 48000) ? 47999 : rate) * 65536;
 	N = M % D;
@@ -1042,8 +1043,8 @@ setsamplerate(struct cmdif *cif, unsigned char *intdec, unsigned int rate)
 				 rptr.retwords[3] != N &&
 				 i++ < MAX_WRITE_RETRY);
 			if (i > MAX_WRITE_RETRY) {
-				snd_printdd("sent samplerate %d: %d failed\n",
-					    *intdec, rate);
+				dev_dbg(cif->dev, "sent samplerate %d: %d failed\n",
+					*intdec, rate);
 				return -EIO;
 			}
 		}
@@ -1062,7 +1063,7 @@ getmixer(struct cmdif *cif, short num, unsigned short *rval,
 		return -EIO;
 	*rval = rptr.retwords[0];
 	*lval = rptr.retwords[1];
-	snd_printdd("got mixer %d: 0x%x 0x%x\n", num, *rval, *lval);
+	dev_dbg(cif->dev, "got mixer %d: 0x%x 0x%x\n", num, *rval, *lval);
 	return 0;
 }
 
@@ -1105,8 +1106,8 @@ static irqreturn_t riptide_handleirq(int irq, void *dev_id)
 				if ((flag & EOS_STATUS)
 				    && (data->state == ST_PLAY)) {
 					data->state = ST_STOP;
-					snd_printk(KERN_ERR
-						   "Riptide: DMA stopped unexpectedly\n");
+					dev_err(cif->dev,
+						"Riptide: DMA stopped unexpectedly\n");
 				}
 				c->dwStat_Ctl =
 				    cpu_to_le32(flag &
@@ -1119,11 +1120,11 @@ static irqreturn_t riptide_handleirq(int irq, void *dev_id)
 				period_bytes =
 				    frames_to_bytes(runtime,
 						    runtime->period_size);
-				snd_printdd
-				    ("interrupt 0x%x after 0x%lx of 0x%lx frames in period\n",
-				     READ_AUDIO_STATUS(cif->hwport),
-				     bytes_to_frames(runtime, pos),
-				     runtime->period_size);
+				dev_dbg(cif->dev,
+					"interrupt 0x%x after 0x%lx of 0x%lx frames in period\n",
+					READ_AUDIO_STATUS(cif->hwport),
+					bytes_to_frames(runtime, pos),
+					runtime->period_size);
 				j = 0;
 				if (pos >= period_bytes) {
 					j++;
@@ -1184,23 +1185,23 @@ static int try_to_load_firmware(struct cmdif *cif, struct snd_riptide *chip)
 			break;
 	}
 	if (!timeout) {
-		snd_printk(KERN_ERR
-			   "Riptide: device not ready, audio status: 0x%x "
-			   "ready: %d gerr: %d\n",
-			   READ_AUDIO_STATUS(cif->hwport),
-			   IS_READY(cif->hwport), IS_GERR(cif->hwport));
+		dev_err(cif->dev,
+			"Riptide: device not ready, audio status: 0x%x ready: %d gerr: %d\n",
+			READ_AUDIO_STATUS(cif->hwport),
+			IS_READY(cif->hwport), IS_GERR(cif->hwport));
 		return -EIO;
 	} else {
-		snd_printdd
-			("Riptide: audio status: 0x%x ready: %d gerr: %d\n",
-			 READ_AUDIO_STATUS(cif->hwport),
-			 IS_READY(cif->hwport), IS_GERR(cif->hwport));
+		dev_dbg(cif->dev,
+			"Riptide: audio status: 0x%x ready: %d gerr: %d\n",
+			READ_AUDIO_STATUS(cif->hwport),
+			IS_READY(cif->hwport), IS_GERR(cif->hwport));
 	}
 
 	SEND_GETV(cif, &firmware.ret);
-	snd_printdd("Firmware version: ASIC: %d CODEC %d AUXDSP %d PROG %d\n",
-		    firmware.firmware.ASIC, firmware.firmware.CODEC,
-		    firmware.firmware.AUXDSP, firmware.firmware.PROG);
+	dev_dbg(cif->dev,
+		"Firmware version: ASIC: %d CODEC %d AUXDSP %d PROG %d\n",
+		firmware.firmware.ASIC, firmware.firmware.CODEC,
+		firmware.firmware.AUXDSP, firmware.firmware.PROG);
 
 	if (!chip)
 		return 1;
@@ -1211,20 +1212,20 @@ static int try_to_load_firmware(struct cmdif *cif, struct snd_riptide *chip)
 
 	}
 
-	snd_printdd("Writing Firmware\n");
+	dev_dbg(cif->dev, "Writing Firmware\n");
 	if (!chip->fw_entry) {
 		err = request_firmware(&chip->fw_entry, "riptide.hex",
 				       &chip->pci->dev);
 		if (err) {
-			snd_printk(KERN_ERR
-				   "Riptide: Firmware not available %d\n", err);
+			dev_err(cif->dev,
+				"Riptide: Firmware not available %d\n", err);
 			return -EIO;
 		}
 	}
 	err = loadfirmware(cif, chip->fw_entry->data, chip->fw_entry->size);
 	if (err) {
-		snd_printk(KERN_ERR
-			   "Riptide: Could not load firmware %d\n", err);
+		dev_err(cif->dev,
+			"Riptide: Could not load firmware %d\n", err);
 		return err;
 	}
 
@@ -1257,7 +1258,7 @@ static int riptide_reset(struct cmdif *cif, struct snd_riptide *chip)
 
 	SEND_SACR(cif, 0, AC97_RESET);
 	SEND_RACR(cif, AC97_RESET, &rptr);
-	snd_printdd("AC97: 0x%x 0x%x\n", rptr.retlongs[0], rptr.retlongs[1]);
+	dev_dbg(cif->dev, "AC97: 0x%x 0x%x\n", rptr.retlongs[0], rptr.retlongs[1]);
 
 	SEND_PLST(cif, 0);
 	SEND_SLST(cif, 0);
@@ -1350,11 +1351,11 @@ static snd_pcm_uframes_t snd_riptide_pointer(struct snd_pcm_substream
 
 	SEND_GPOS(cif, 0, data->id, &rptr);
 	if (data->size && runtime->period_size) {
-		snd_printdd
-		    ("pointer stream %d position 0x%x(0x%x in buffer) bytes 0x%lx(0x%lx in period) frames\n",
-		     data->id, rptr.retlongs[1], rptr.retlongs[1] % data->size,
-		     bytes_to_frames(runtime, rptr.retlongs[1]),
-		     bytes_to_frames(runtime,
+		dev_dbg(cif->dev,
+			"pointer stream %d position 0x%x(0x%x in buffer) bytes 0x%lx(0x%lx in period) frames\n",
+			data->id, rptr.retlongs[1], rptr.retlongs[1] % data->size,
+			bytes_to_frames(runtime, rptr.retlongs[1]),
+			bytes_to_frames(runtime,
 				     rptr.retlongs[1]) % runtime->period_size);
 		if (rptr.retlongs[1] > data->pointer)
 			ret =
@@ -1365,8 +1366,9 @@ static snd_pcm_uframes_t snd_riptide_pointer(struct snd_pcm_substream
 			    bytes_to_frames(runtime,
 					    data->pointer % data->size);
 	} else {
-		snd_printdd("stream not started or strange parms (%d %ld)\n",
-			    data->size, runtime->period_size);
+		dev_dbg(cif->dev,
+			"stream not started or strange parms (%d %ld)\n",
+			data->size, runtime->period_size);
 		ret = bytes_to_frames(runtime, 0);
 	}
 	return ret;
@@ -1410,7 +1412,7 @@ static int snd_riptide_trigger(struct snd_pcm_substream *substream, int cmd)
 			udelay(1);
 		} while (i != rptr.retlongs[1] && j++ < MAX_WRITE_RETRY);
 		if (j > MAX_WRITE_RETRY)
-			snd_printk(KERN_ERR "Riptide: Could not stop stream!");
+			dev_err(cif->dev, "Riptide: Could not stop stream!");
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		if (!(data->state & ST_PAUSE)) {
@@ -1448,8 +1450,8 @@ static int snd_riptide_prepare(struct snd_pcm_substream *substream)
 	if (snd_BUG_ON(!cif || !data))
 		return -EINVAL;
 
-	snd_printdd("prepare id %d ch: %d f:0x%x r:%d\n", data->id,
-		    runtime->channels, runtime->format, runtime->rate);
+	dev_dbg(cif->dev, "prepare id %d ch: %d f:0x%x r:%d\n", data->id,
+		runtime->channels, runtime->format, runtime->rate);
 
 	spin_lock_irq(&chip->lock);
 	channels = runtime->channels;
@@ -1469,8 +1471,7 @@ static int snd_riptide_prepare(struct snd_pcm_substream *substream)
 			lbuspath = data->paths.stereo;
 		break;
 	}
-	snd_printdd("use sgdlist at 0x%p\n",
-		    data->sgdlist.area);
+	dev_dbg(cif->dev, "use sgdlist at 0x%p\n", data->sgdlist.area);
 	if (data->sgdlist.area) {
 		unsigned int i, j, size, pages, f, pt, period;
 		struct sgd *c, *p = NULL;
@@ -1483,9 +1484,9 @@ static int snd_riptide_prepare(struct snd_pcm_substream *substream)
 		pages = DIV_ROUND_UP(size, f);
 		data->size = size;
 		data->pages = pages;
-		snd_printdd
-		    ("create sgd size: 0x%x pages %d of size 0x%x for period 0x%x\n",
-		     size, pages, f, period);
+		dev_dbg(cif->dev,
+			"create sgd size: 0x%x pages %d of size 0x%x for period 0x%x\n",
+			size, pages, f, period);
 		pt = 0;
 		j = 0;
 		for (i = 0; i < pages; i++) {
@@ -1543,17 +1544,18 @@ snd_riptide_hw_params(struct snd_pcm_substream *substream,
 	struct snd_dma_buffer *sgdlist = &data->sgdlist;
 	int err;
 
-	snd_printdd("hw params id %d (sgdlist: 0x%p 0x%lx %d)\n", data->id,
-		    sgdlist->area, (unsigned long)sgdlist->addr,
-		    (int)sgdlist->bytes);
+	dev_dbg(chip->card->dev, "hw params id %d (sgdlist: 0x%p 0x%lx %d)\n",
+		data->id, sgdlist->area, (unsigned long)sgdlist->addr,
+		(int)sgdlist->bytes);
 	if (sgdlist->area)
 		snd_dma_free_pages(sgdlist);
 	err = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
 				  sizeof(struct sgd) * (DESC_MAX_MASK + 1),
 				  sgdlist);
 	if (err < 0) {
-		snd_printk(KERN_ERR "Riptide: failed to alloc %d dma bytes\n",
-			   (int)sizeof(struct sgd) * (DESC_MAX_MASK + 1));
+		dev_err(chip->card->dev,
+			"Riptide: failed to alloc %d dma bytes\n",
+			(int)sizeof(struct sgd) * (DESC_MAX_MASK + 1));
 		return err;
 	}
 	data->sgdbuf = (struct sgd *)sgdlist->area;
@@ -1729,13 +1731,13 @@ snd_riptide_codec_write(struct snd_ac97 *ac97, unsigned short reg,
 	if (snd_BUG_ON(!cif))
 		return;
 
-	snd_printdd("Write AC97 reg 0x%x 0x%x\n", reg, val);
+	dev_dbg(cif->dev, "Write AC97 reg 0x%x 0x%x\n", reg, val);
 	do {
 		SEND_SACR(cif, val, reg);
 		SEND_RACR(cif, reg, &rptr);
 	} while (rptr.retwords[1] != val && i++ < MAX_WRITE_RETRY);
 	if (i > MAX_WRITE_RETRY)
-		snd_printdd("Write AC97 reg failed\n");
+		dev_dbg(cif->dev, "Write AC97 reg failed\n");
 }
 
 static unsigned short snd_riptide_codec_read(struct snd_ac97 *ac97,
@@ -1750,7 +1752,7 @@ static unsigned short snd_riptide_codec_read(struct snd_ac97 *ac97,
 
 	if (SEND_RACR(cif, reg, &rptr) != 0)
 		SEND_RACR(cif, reg, &rptr);
-	snd_printdd("Read AC97 reg 0x%x got 0x%x\n", reg, rptr.retwords[1]);
+	dev_dbg(cif->dev, "Read AC97 reg 0x%x got 0x%x\n", reg, rptr.retwords[1]);
 	return rptr.retwords[1];
 }
 
@@ -1768,6 +1770,7 @@ static int snd_riptide_initialize(struct snd_riptide *chip)
 		cif = kzalloc(sizeof(struct cmdif), GFP_KERNEL);
 		if (!cif)
 			return -ENOMEM;
+		cif->dev = chip->card->dev;
 		cif->hwport = (struct riptideport *)chip->port;
 		spin_lock_init(&cif->lock);
 		chip->cif = cif;
@@ -1781,11 +1784,11 @@ static int snd_riptide_initialize(struct snd_riptide *chip)
 	case 0x4310:
 	case 0x4320:
 	case 0x4330:
-		snd_printdd("Modem enable?\n");
+		dev_dbg(cif->dev, "Modem enable?\n");
 		SEND_SETDPLL(cif);
 		break;
 	}
-	snd_printdd("Enabling MPU IRQs\n");
+	dev_dbg(cif->dev, "Enabling MPU IRQs\n");
 	if (chip->rmidi)
 		SET_EMPUIRQ(cif->hwport);
 	return err;
@@ -1838,8 +1841,8 @@ snd_riptide_create(struct snd_card *card, struct pci_dev *pci)
 				      snd_riptide_interrupt,
 				      riptide_handleirq, IRQF_SHARED,
 				      KBUILD_MODNAME, chip)) {
-		snd_printk(KERN_ERR "Riptide: unable to grab IRQ %d\n",
-			   pci->irq);
+		dev_err(&pci->dev, "Riptide: unable to grab IRQ %d\n",
+			pci->irq);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
@@ -1987,9 +1990,9 @@ snd_riptide_joystick_probe(struct pci_dev *pci, const struct pci_device_id *id)
 		goto inc_dev;
 	}
 	if (!request_region(joystick_port[dev], 8, "Riptide gameport")) {
-		snd_printk(KERN_WARNING
-			   "Riptide: cannot grab gameport 0x%x\n",
-			   joystick_port[dev]);
+		dev_err(&pci->dev,
+			"Riptide: cannot grab gameport 0x%x\n",
+			joystick_port[dev]);
 		gameport_free_port(gameport);
 		ret = -EBUSY;
 		goto inc_dev;
@@ -2064,9 +2067,9 @@ __snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 					  val, MPU401_INFO_IRQ_HOOK, -1,
 					  &chip->rmidi);
 		if (err < 0)
-			snd_printk(KERN_WARNING
-				   "Riptide: Can't Allocate MPU at 0x%x\n",
-				   val);
+			dev_warn(&pci->dev,
+				 "Riptide: Can't Allocate MPU at 0x%x\n",
+				 val);
 		else
 			chip->mpuaddr = val;
 	}
@@ -2076,15 +2079,15 @@ __snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		err = snd_opl3_create(card, val, val + 2,
 				      OPL3_HW_RIPTIDE, 0, &chip->opl3);
 		if (err < 0)
-			snd_printk(KERN_WARNING
-				   "Riptide: Can't Allocate OPL3 at 0x%x\n",
-				   val);
+			dev_warn(&pci->dev,
+				 "Riptide: Can't Allocate OPL3 at 0x%x\n",
+				 val);
 		else {
 			chip->opladdr = val;
 			err = snd_opl3_hwdep_new(chip->opl3, 0, 1, NULL);
 			if (err < 0)
-				snd_printk(KERN_WARNING
-					   "Riptide: Can't Allocate OPL3-HWDEP\n");
+				dev_warn(&pci->dev,
+					 "Riptide: Can't Allocate OPL3-HWDEP\n");
 		}
 	}
 #ifdef SUPPORT_JOYSTICK
-- 
2.43.0

