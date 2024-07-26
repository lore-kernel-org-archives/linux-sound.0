Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AB5182AE
	for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722004465; cv=none; b=H4o076/CThYWuiWn4FYwRAUz8hb+vyRw/ijOC/17XIl9xhe7qUWh0qDTSEYTaBTjlwBylUyp1g+eMKJBkIQGiHTOYCNYjMDHE6qOza5N9zjKMVG7TnUoakxbs6knuRj5d38gPRAkDKMBmdQhJouRoUKo4Ey9ZTP91XKK1XP5EF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722004465; c=relaxed/simple;
	bh=q147MjCyy/lSaS46JdrmP1VeCOLc71/hTfsR5i2mg+k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uKWiHO0vY4OTZP2QY0JZMt/iWFjJCXVp8XqSVS3/rQhdFTeLk2cSDVf7CG3DtI/dT9o/MLxK32FNZwTcoVSsaHHt3tzd/EKtzpNJn5fcyPcdKVFUL/KaOQMVaxw7grCrYGq6V3Ij9L1xXOmfiZSD+b5S4Z8BwnTUpmm6YIDHrqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jIM9fyxk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gh4VKpmr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jIM9fyxk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gh4VKpmr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jIM9fyxk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gh4VKpmr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jIM9fyxk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gh4VKpmr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA47A21BEE;
	Fri, 26 Jul 2024 14:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722004461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Arx9Z2hC7DiuauqKd9iXu6Jkhx3SKh3tuMSMI62mke4=;
	b=jIM9fyxkw4Uts95W3ZENWEO5aGerGEOcdkdm/oI1djCgkBrayZxXFNDXWxTpALpWoqFyRc
	cC/KtdJ1ogO90wCdFES4TqxIbYFQFgDiA19D15slmB6Q8OjyQw/naH/jJwNb+5dRkGZHfI
	O8UYlhcDi03E8vmmxuj7H8PVNGfgTEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722004461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Arx9Z2hC7DiuauqKd9iXu6Jkhx3SKh3tuMSMI62mke4=;
	b=gh4VKpmrndrep7HPC3T5gBt39nNgkgOTsL/WMKREcOR0+T08mrm6uQy5yGkIwyjWAdU4XZ
	sB5HnfqWT1AfjsCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722004461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Arx9Z2hC7DiuauqKd9iXu6Jkhx3SKh3tuMSMI62mke4=;
	b=jIM9fyxkw4Uts95W3ZENWEO5aGerGEOcdkdm/oI1djCgkBrayZxXFNDXWxTpALpWoqFyRc
	cC/KtdJ1ogO90wCdFES4TqxIbYFQFgDiA19D15slmB6Q8OjyQw/naH/jJwNb+5dRkGZHfI
	O8UYlhcDi03E8vmmxuj7H8PVNGfgTEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722004461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Arx9Z2hC7DiuauqKd9iXu6Jkhx3SKh3tuMSMI62mke4=;
	b=gh4VKpmrndrep7HPC3T5gBt39nNgkgOTsL/WMKREcOR0+T08mrm6uQy5yGkIwyjWAdU4XZ
	sB5HnfqWT1AfjsCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 916BB138A7;
	Fri, 26 Jul 2024 14:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bJs6Iu2zo2amIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jul 2024 14:34:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: ump: Optimize conversions from SysEx to UMP
Date: Fri, 26 Jul 2024 16:34:54 +0200
Message-ID: <20240726143455.3254-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

The current conversion from the legacy SysEx event to UMP SysEx packet
in the sequencer core has a couple of issues:

* The first packet trims the SysEx start byte (0xf0), hence it
  contains only 5 bytes instead of 6.  This isn't wrong, per
  specification, but it's strange not to fill 6 bytes.

* When the SysEx end marker (0xf7) is placed at the first byte of the
  next packet, it'll end up with an empty data just with the END
  status.  It can be rather folded into the previous packet with the
  END status.

This patch tries to address those issues.  The first packet may have 6
bytes even with the SysEx start, and an empty packet with the SysEx
end marker is omitted.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 41 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index e90b27a135e6..d9dacfbe4a9a 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -1192,44 +1192,53 @@ static int cvt_sysex_to_ump(struct snd_seq_client *dest,
 {
 	struct snd_seq_ump_event ev_cvt;
 	unsigned char status;
-	u8 buf[6], *xbuf;
+	u8 buf[8], *xbuf;
 	int offset = 0;
 	int len, err;
+	bool finished = false;
 
 	if (!snd_seq_ev_is_variable(event))
 		return 0;
 
 	setup_ump_event(&ev_cvt, event);
-	for (;;) {
+	while (!finished) {
 		len = snd_seq_expand_var_event_at(event, sizeof(buf), buf, offset);
 		if (len <= 0)
 			break;
-		if (WARN_ON(len > 6))
+		if (WARN_ON(len > sizeof(buf)))
 			break;
-		offset += len;
+
 		xbuf = buf;
+		status = UMP_SYSEX_STATUS_CONTINUE;
+		/* truncate the sysex start-marker */
 		if (*xbuf == UMP_MIDI1_MSG_SYSEX_START) {
 			status = UMP_SYSEX_STATUS_START;
-			xbuf++;
 			len--;
-			if (len > 0 && xbuf[len - 1] == UMP_MIDI1_MSG_SYSEX_END) {
-				status = UMP_SYSEX_STATUS_SINGLE;
-				len--;
-			}
-		} else {
-			if (xbuf[len - 1] == UMP_MIDI1_MSG_SYSEX_END) {
-				status = UMP_SYSEX_STATUS_END;
-				len--;
-			} else {
-				status = UMP_SYSEX_STATUS_CONTINUE;
-			}
+			offset++;
+			xbuf++;
 		}
+
+		/* if the last of this packet or the 1st byte of the next packet
+		 * is the end-marker, finish the transfer with this packet
+		 */
+		if (len > 0 && len < 8 &&
+		    xbuf[len - 1] == UMP_MIDI1_MSG_SYSEX_END) {
+			if (status == UMP_SYSEX_STATUS_START)
+				status = UMP_SYSEX_STATUS_SINGLE;
+			else
+				status = UMP_SYSEX_STATUS_END;
+			len--;
+			finished = true;
+		}
+
+		len = min(len, 6);
 		fill_sysex7_ump(dest_port, ev_cvt.ump, status, xbuf, len);
 		err = __snd_seq_deliver_single_event(dest, dest_port,
 						     (struct snd_seq_event *)&ev_cvt,
 						     atomic, hop);
 		if (err < 0)
 			return err;
+		offset += len;
 	}
 	return 0;
 }
-- 
2.43.0

