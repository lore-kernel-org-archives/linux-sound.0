Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E3119412E
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431099; cv=none; b=in4pqgfDpymiitsazmz4ZX5VbBqchtSYsQJvOcmBuHO+gA/CLXrSr8IM7OEShUXZU3VeA50p1lXqoB+RZKXUyo5tIiRRD56OQT86yJlJsWbUFy+oiF4FiRUcMiiL1dSFO56wQ2hYDh8RxrfJQw6j5oCuXaQOQsJNclJAJGmY0q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431099; c=relaxed/simple;
	bh=/8zVhww/2ZbHJp/inFTj7vgTx9rybdu4o3WvoqkwOeA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPY/H4SI3Qx+piEMh1V1s285h/gIYdA0ZE9wcCN1jB2hP53iJhZYbFLtBIfKwyp6HJoAsLcfJfnYZuW4tYygVflAMpQkvcmjALsyqbJswSgPnW7M7x70865g2Kc2HJddssX1ho6VL2cWJ+r/CRauQSnsbGUvghJTFbqJOjFR5Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=U0aKWRd/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z4xc0CfH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nLwoCsXp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gXsyfgtf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U0aKWRd/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z4xc0CfH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nLwoCsXp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gXsyfgtf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3DDD21A8F;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWhuRE1EK+sOCx+TDvw5XCeDVOR//YTxf1uHTREG+9A=;
	b=U0aKWRd/49+1gW8yJmd+NoDK6fbHtSYz5y+r2yogYy4oVGvDIwgx9ybGTXhF2vEV0m10Hy
	cEg73iljgMwi53Blpcb96KIY6HQZggApoELmj76m4Zs74brBpusAPAo0jJ/xRCvWo722gW
	iRiQUkyJYK3dEBfg1iedn+uig40QIJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWhuRE1EK+sOCx+TDvw5XCeDVOR//YTxf1uHTREG+9A=;
	b=z4xc0CfHVEzNoPD01iKl1ru0Zs+IBlj5ZIimo22lRYEQELWF1sF6jrc5RFm3diH3qJ6WNI
	8AB5E3EmcPjhopBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nLwoCsXp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gXsyfgtf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWhuRE1EK+sOCx+TDvw5XCeDVOR//YTxf1uHTREG+9A=;
	b=nLwoCsXpILPy7cPp8eLy9VIzLBcDGPfE/ZCV3hdSPE73kLFuB3pbt1u5VqUyekEAyxq0Xf
	Z0hG3HD/fUcORAbrLDXLD7TwYTwRMWxPy7HRwhOUFDtOkzvVRW6NNYwd/PZprQ7SjU0JFR
	qa9k9wc4TG84O3Al+G775Gxu5g0S850=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWhuRE1EK+sOCx+TDvw5XCeDVOR//YTxf1uHTREG+9A=;
	b=gXsyfgtfE/TuAzbBzGCU3GOKWKmbPvFYslKXWF0zY3+sypmI/MWLkhk7e9zsxzqN76wV1p
	nuZ6vvOx4/cdYrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8779413ADA;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cEG2H3U2qmYrWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 13:04:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/5] ALSA: ump: Explicitly reset RPN with Null RPN
Date: Wed, 31 Jul 2024 15:05:23 +0200
Message-ID: <20240731130528.12600-3-tiwai@suse.de>
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
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A3DDD21A8F
X-Spam-Score: -4.81
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

RPN with 127:127 is treated as a Null RPN, just to reset the
parameters, and it's not translated to MIDI2.  Although the current
code can work as is in most cases, better to implement the RPN reset
explicitly for Null message.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump_convert.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index 5d1b85e7ac16..0fe13d031656 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -287,6 +287,15 @@ static int cvt_legacy_system_to_ump(struct ump_cvt_to_ump *cvt,
 	return 4;
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
 static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 		    union snd_ump_midi2_msg *midi2,
 		    bool flush)
@@ -312,11 +321,7 @@ static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
 	midi2->rpn.data = upscale_14_to_32bit((cc->cc_data_msb << 7) |
 					      cc->cc_data_lsb);
 
-	cc->rpn_set = 0;
-	cc->nrpn_set = 0;
-	cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
-	cc->cc_data_msb = cc->cc_data_lsb = 0;
-	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+	reset_rpn(cc);
 	return 1;
 }
 
@@ -374,11 +379,15 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			ret = fill_rpn(cc, midi2, true);
 			cc->rpn_set = 1;
 			cc->cc_rpn_msb = buf[2];
+			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
+				reset_rpn(cc);
 			return ret;
 		case UMP_CC_RPN_LSB:
 			ret = fill_rpn(cc, midi2, true);
 			cc->rpn_set = 1;
 			cc->cc_rpn_lsb = buf[2];
+			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
+				reset_rpn(cc);
 			return ret;
 		case UMP_CC_NRPN_MSB:
 			ret = fill_rpn(cc, midi2, true);
-- 
2.43.0

