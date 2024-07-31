Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB02209F
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431097; cv=none; b=KrHBzst4v6S1+aUy2kdfH7oLOmxSE4lVmTLgaR5ouc0Lu3eOpezDzyg0/KDQ4B2+bWbP6g+o5UNs3+rQanA9772DbWUF6hJdk5ka+4owUF8JPEaFgM8es2IjQGgdEcL63X8s6P3TspVSUbHSymMxaq/ujQPmn7cAf6YohrPki3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431097; c=relaxed/simple;
	bh=B5WsamjuS20KPAoSquP2yD521Fg8Yt9/LPXXPaOS5sc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiQpLS2vIIdqWDbTHNFL5DD/psBUdcmktFmqbHZ7HwZ5nmciuSnYw9HBRGLFrTtC0ddwGNOWd/sMv5/px716VJIcaGYpU9BrZ8irLKaOyTJ6mfy9KwJMgOcpVdFmgafqWR+vd4BYFfs9eEXlbvAsbw4NEky4ZWlsZhMwfGQ/qtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GuuNyBCp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kyD3gwmy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GuuNyBCp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kyD3gwmy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GuuNyBCp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kyD3gwmy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GuuNyBCp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kyD3gwmy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ABE1A21B70;
	Wed, 31 Jul 2024 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIuCGLYnFxVzQ2WV4zRR2IQLaTe4h/OocPK8hDfrEcE=;
	b=GuuNyBCpAuHI3hMNh+WpXuomphTiRFwx27ODy2e/aJpVpI9eHTc0/ROcDo4/+ARRe5LzDk
	9MsxiA/nwn2bjzbM8wRgBD1wNcuCD8f1gjB5KlWd07aFsdV6I97Bc3cbcbvbTBDz1fgOEu
	5EjwTkjy8aG45CTlCo0PohtCy2JD/iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIuCGLYnFxVzQ2WV4zRR2IQLaTe4h/OocPK8hDfrEcE=;
	b=kyD3gwmyhKUHLP7IIbBR6VkYB9KBnV6QMX6SjFqNsfcYWDEZ3VCuAfh6g7m4ZGrmvk7C/8
	86S/i/RtFlO9/+AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIuCGLYnFxVzQ2WV4zRR2IQLaTe4h/OocPK8hDfrEcE=;
	b=GuuNyBCpAuHI3hMNh+WpXuomphTiRFwx27ODy2e/aJpVpI9eHTc0/ROcDo4/+ARRe5LzDk
	9MsxiA/nwn2bjzbM8wRgBD1wNcuCD8f1gjB5KlWd07aFsdV6I97Bc3cbcbvbTBDz1fgOEu
	5EjwTkjy8aG45CTlCo0PohtCy2JD/iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIuCGLYnFxVzQ2WV4zRR2IQLaTe4h/OocPK8hDfrEcE=;
	b=kyD3gwmyhKUHLP7IIbBR6VkYB9KBnV6QMX6SjFqNsfcYWDEZ3VCuAfh6g7m4ZGrmvk7C/8
	86S/i/RtFlO9/+AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E697513AE0;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8A8PN3U2qmYrWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 13:04:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/5] ALSA: seq: ump: Explicitly reset RPN with Null RPN
Date: Wed, 31 Jul 2024 15:05:26 +0200
Message-ID: <20240731130528.12600-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731130528.12600-1-tiwai@suse.de>
References: <20240731130528.12600-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

RPN with 127:127 is treated as a Null RPN, just to reset the
parameters, and it's not translated to MIDI2.  Although the current
code can work as is in most cases, better to implement the RPN reset
explicitly for Null message.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index 7ca62667f28d..4dd540cbb1cb 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -789,6 +789,15 @@ static int paf_ev_to_ump_midi2(const struct snd_seq_event *event,
 	return 1;
 }
 
+static void reset_rpn(struct ump_cvt_to_ump_bank *cc)
+{
+	cc->rpn_set = 0;
+	cc->nrpn_set = 0;
+	cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
+	cc->cc_data_msb = cc->cc_data_lsb = 0;
+	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+}
+
 /* set up the MIDI2 RPN/NRPN packet data from the parsed info */
 static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 		    union snd_ump_midi2_msg *data,
@@ -817,11 +826,7 @@ static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 					     cc->cc_data_lsb);
 	data->rpn.channel = channel;
 
-	cc->rpn_set = 0;
-	cc->nrpn_set = 0;
-	cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
-	cc->cc_data_msb = cc->cc_data_lsb = 0;
-	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+	reset_rpn(cc);
 	return 1;
 }
 
@@ -843,11 +848,15 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		ret = fill_rpn(cc, data, channel, true);
 		cc->rpn_set = 1;
 		cc->cc_rpn_msb = val;
+		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
+			reset_rpn(cc);
 		return ret;
 	case UMP_CC_RPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
 		cc->rpn_set = 1;
 		cc->cc_rpn_lsb = val;
+		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
+			reset_rpn(cc);
 		return ret;
 	case UMP_CC_NRPN_MSB:
 		ret = fill_rpn(cc, data, channel, true);
@@ -961,6 +970,8 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->cc_rpn_msb = msb;
 		cc->cc_rpn_lsb = lsb;
 		cc->rpn_set = 1;
+		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
+			reset_rpn(cc);
 		return ret;
 	case UMP_CC_NRPN_MSB:
 	case UMP_CC_NRPN_LSB:
-- 
2.43.0

