Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71F018EFF1
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418198; cv=none; b=tx7W5QhIGR3uUmsCvzcgC6dMFd9MucHC8NOHlGVsyU+wzhAiG+0DoPB9ICC8I0WA4RJ3pOSwx71LsqbVk/zLKgRtsZYvy6REVrdulIJCIr+fnKhVeSI6FOqo6Quf+1KCDqljTNvJIJmAjtzy8kKa3CBwDsMXqMOIohLwRlb1y90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418198; c=relaxed/simple;
	bh=wE/evG5aIuf/NRfa6675B7WJMUX2smOC45sb3lXcP8Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SAgxqyzi1bB7XAjayYgMV4PxYB+KTLaWmZcWCr8N/Se3ACNND4EUr6ARJwCp+wpzJpIs0a8O8uKqCrnRoLzYZts02W3OD2t/R5Tqs4GMq+imXj5doctAmpv1AkGDA4UN5W5bdVlh4l6vloh0qra01mn7jw6VU7Dl7loIrFb7Nes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xFnupu95; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T5BGSlyk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xFnupu95; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T5BGSlyk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xFnupu95";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T5BGSlyk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xFnupu95";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T5BGSlyk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A96411FB65;
	Wed, 26 Jun 2024 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719418192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1gteg1SK9P+1d/KN0Dw7pF50O1xRvNNmDtXXFx0ZX4M=;
	b=xFnupu95fVkkTcKB+fe+GoCFi+w+054+3G0+Py5UXIuAlH1jd5MRmST4B3oPe27X2NXRHs
	rtimWnD5+6bSEwuGHABl77+XMIW5MRuaIzEI15UaEUTahfUSOyb2m4msbkxKKvdxSBk9U6
	Qt+ES1Iv4xAWHKYCAqwrabHZPGW3XRY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719418192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1gteg1SK9P+1d/KN0Dw7pF50O1xRvNNmDtXXFx0ZX4M=;
	b=T5BGSlykld2XtzI0IhbPH2gRSMAhVn+prRK5DZuwBVwGoCcUBtQ8U2cDwYP3wHgFWtGKIg
	yXls2eW3ctBahOBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xFnupu95;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T5BGSlyk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719418192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1gteg1SK9P+1d/KN0Dw7pF50O1xRvNNmDtXXFx0ZX4M=;
	b=xFnupu95fVkkTcKB+fe+GoCFi+w+054+3G0+Py5UXIuAlH1jd5MRmST4B3oPe27X2NXRHs
	rtimWnD5+6bSEwuGHABl77+XMIW5MRuaIzEI15UaEUTahfUSOyb2m4msbkxKKvdxSBk9U6
	Qt+ES1Iv4xAWHKYCAqwrabHZPGW3XRY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719418192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1gteg1SK9P+1d/KN0Dw7pF50O1xRvNNmDtXXFx0ZX4M=;
	b=T5BGSlykld2XtzI0IhbPH2gRSMAhVn+prRK5DZuwBVwGoCcUBtQ8U2cDwYP3wHgFWtGKIg
	yXls2eW3ctBahOBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90C4313AAD;
	Wed, 26 Jun 2024 16:09:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mPkTIlA9fGaudgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Jun 2024 16:09:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Improve UMP SysEx packing
Date: Wed, 26 Jun 2024 18:10:15 +0200
Message-ID: <20240626161017.9479-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A96411FB65
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

The initial implementation of 7bit SysEx message conversion to UMP did
a trick to deal with the first SysEx start byte (0xf7).  The converter
trims it and sends the first packet with the content of 5 bytes.
Although this is valid and should work, it's not ideal and a bit
confusing as if something goes wrong.

This patch improves the handling to try filling always 6 bytes in the
package.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 48 +++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index e90b27a135e6..952e64c499dd 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -1192,7 +1192,7 @@ static int cvt_sysex_to_ump(struct snd_seq_client *dest,
 {
 	struct snd_seq_ump_event ev_cvt;
 	unsigned char status;
-	u8 buf[6], *xbuf;
+	u8 buf[6];
 	int offset = 0;
 	int len, err;
 
@@ -1200,36 +1200,44 @@ static int cvt_sysex_to_ump(struct snd_seq_client *dest,
 		return 0;
 
 	setup_ump_event(&ev_cvt, event);
+	len = 0;
+	status = UMP_SYSEX_STATUS_START;
 	for (;;) {
-		len = snd_seq_expand_var_event_at(event, sizeof(buf), buf, offset);
-		if (len <= 0)
+		err = snd_seq_expand_var_event_at(event, sizeof(buf) - len,
+						  buf + len, offset);
+		if (err < 0)
+			break;
+		len += err;
+		if (!len)
 			break;
 		if (WARN_ON(len > 6))
 			break;
-		offset += len;
-		xbuf = buf;
-		if (*xbuf == UMP_MIDI1_MSG_SYSEX_START) {
-			status = UMP_SYSEX_STATUS_START;
-			xbuf++;
+		offset += err;
+		if (status == UMP_SYSEX_STATUS_START &&
+		    buf[0] == UMP_MIDI1_MSG_SYSEX_START) {
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
+			memmove(buf, buf + 1, len);
+			continue; /* fill one more byte */
 		}
-		fill_sysex7_ump(dest_port, ev_cvt.ump, status, xbuf, len);
+		if (buf[len - 1] == UMP_MIDI1_MSG_SYSEX_END) {
+			len--;
+			if (status == UMP_SYSEX_STATUS_START)
+				status = UMP_SYSEX_STATUS_SINGLE;
+			else
+				status = UMP_SYSEX_STATUS_END;
+		}
+		fill_sysex7_ump(dest_port, ev_cvt.ump, status, buf, len);
 		err = __snd_seq_deliver_single_event(dest, dest_port,
 						     (struct snd_seq_event *)&ev_cvt,
 						     atomic, hop);
 		if (err < 0)
 			return err;
+
+		if (status == UMP_SYSEX_STATUS_START)
+			status = UMP_SYSEX_STATUS_CONTINUE;
+		else if (status != UMP_SYSEX_STATUS_CONTINUE)
+			break;
+		len = 0; /* reset filling */
 	}
 	return 0;
 }
-- 
2.43.0

