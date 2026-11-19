Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094152;
	b=jcbV+c9dkFc9hAU8rpraxgcdJ3HU45CorCbOnhk2VX1KnbGHfZCsSpAHC7Gf+n7EKLb4
	 sv5BlJhHDhIw+O16b0xvZTYnZ+VTakrZzXhM7LGonDZn1guaidZnRw+RCughXYBRvcqEI
	 34oiazXrHoejEpBzTQsEXsfRhvk46RPjCUMd8CsCQ6ltqOyh8YIdMHb+cvSVRdlTpdXaL
	 jsuKQcOZQDDwX7Ar9z2h+B25Py1Xz/VM5AdEGYevm3v82JrGk2x8S1LCHnCHESV9OdCbJ
	 cP/tsYhdzejeEGtqiBmviF27ANK6kTehwQpVfW8t9tBfkRwejddqGuArUyYQ6sPzkhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094152;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Spam-Flag:
	 X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=V+I+03HAtJhHBHshFIbQiGiR0hsogdnHJw1QU9Ojyrc=;
	b=zv9hLQmqJZle5lWV/2R8pz3pWURUQwsmct/JjU58lWPGHjZr0nym7TQWHbB6yTv8BghG
	 pt4hLVAy42iainK+5sJIU0+Bis3ZbmtGv2OUebAh/eJQmgZkjOUCas9ohyrkVqEV0iUGC
	 4BrNa64T2CJhQKciAfCRTr+OFKZOAHuxcIwUde9lBhZBYVTRDkHuHpSvFqFiZdRrObC6N
	 fMP9Nc2MrgusESc7qqLsfq5ybhzhNEbec0dH13XPQVvHKfrIBuAVuGpRJhX6iJ5IfoCt9
	 Mif4d9QsM9dwpkb3eNtiBO7EiVt/6lEOJRQDeICf2zlrIk2qdWqIsHQxybllnlL0Vrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SnaQYasj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+88+bK8D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g398vHOk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tNCmRqKe;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197C7606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 13:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SnaQYasj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+88+bK8D;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g398vHOk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tNCmRqKe
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE20B22121;
	Thu, 19 Nov 2026 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795094150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=V+I+03HAtJhHBHshFIbQiGiR0hsogdnHJw1QU9Ojyrc=;
	b=SnaQYasjkExVF/fbAAS48zLfTQdeyoVPepxXdYsHGC6g50TrKUnKyvyzPPwLrg6KxvB0xm
	gK6ikdblw1Ae5T18OSdUYJ39h+B7lyNlPcSZ2wewqQwu05Yt4ZI3gzOL0LmyYr2Dxj1bdb
	4+MaKHxt4ZJsfNeqPD1UAFv1Wbp6/WU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795094150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=V+I+03HAtJhHBHshFIbQiGiR0hsogdnHJw1QU9Ojyrc=;
	b=+88+bK8Dcqftcjhy5SrHElnbsTZI6ndTbpMOOiqQ1K3IX/cJST+UkR4H1/7vJ6rFTHSjrv
	tQSFSXgJWQQAocDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795094148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=V+I+03HAtJhHBHshFIbQiGiR0hsogdnHJw1QU9Ojyrc=;
	b=g398vHOkSWCT/w//87ZqYrMEET3hKXr7Zl05cyYjONrHaJGHLlZmaebxY0aT3DnPn66l/l
	wdqddCN91kv0riCnEjiGGMlWqDVN6W5q3w4AlUJBCG4FVsLO15ArtV4iwXtS6d+8M78ljM
	UxBABvoHAPRNkSzRajv5WxAJvP9yzwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795094148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=V+I+03HAtJhHBHshFIbQiGiR0hsogdnHJw1QU9Ojyrc=;
	b=tNCmRqKeVRdxEJ3X1GOquBjVj2s3w4r62lHrvXD7qyDZ6nFU9Ve5jHn+OR1aatwXYyBdTi
	XDqKLvP+2boALkBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93A4A1334C;
	Thu, 19 Nov 2026 13:15:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Too/GoT2/moRPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Nov 2026 13:15:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: Avoid possible zero-division
Date: Thu, 19 Nov 2026 14:10:44 +0100
Message-ID: <20261119131045.2152868-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -11.80

The calibration preprocessing code in TAS2781 codec driver has a
division with the value calculated from the firmware data, and when a
malformed firmware is given, this could lead to a zero-division error.
We already hit and addressed such a case (commit 8dbab764f1e0 "ALSA:
hda/tas2781: Only accept CRC-less V1 data if all entries are valid")
which was fixed in the caller side (HD-audio TAS2781 driver).

For avoiding such a breakage in future, let's add a safety check for
zero division in the callee side, too.

Fixes: 05ac3846ffe5 ("ALSA: hda/tas2781: A workaround solution to lower-vol issue among lower calibrated-impedance micro-speaker on TAS2781")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index e6429b4c8dc5..527d5e0ab906 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2579,7 +2579,7 @@ static int tas2781_cali_preproc(struct tasdevice_priv *priv, int i)
 		 */
 		re_org = r0_deflt[0] << 8 | r0_deflt[1];
 		re_cal = data[k + 1] << 8 | data[k + 2];
-		if (re_org > re_cal) {
+		if (re_cal && re_org > re_cal) {
 			rc = tasdevice_dev_read(priv, i, TAS2781_PG_REG,
 						 &pg_id);
 			if (rc < 0) {
-- 
2.53.0

