Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209981EB36
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431098; cv=none; b=Z4BhlbPBwn84P2Lsa6KnZ5wUSD5embTdiU55yisKDnfC/Ki//p/bmwlR/f9L3kZdC5rq/WQFUf+MjIlIq28DYx85gsagsmuwZ8pDTaGgQiKZIp43PH3xRH5w0vIjgbAit/U8uH+FrSbzXVgNlIH34fj2jZo4MuEsECEmaKLyN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431098; c=relaxed/simple;
	bh=GAjuATXzm14U7zT4Yd2Na+3yEZfyNwIWUQx9t60SD1c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mcA7aAyWODbA2HxiD7/yzfoTF4cxiC9BfCv0qhIO55h5ScbGNXVkUrO9TczGVy/bpJE3QoA+shfBuIOcqSswtKG5wbpgATxnIriBTUwaA9DJ+25nIbKdFcuV30KbA5XMbcce8NutfsDzXs5ZIXJpttC8OrS6mkPdh7JgzoZiBWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z82idw9V; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Oc//dKiY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VHmsi72S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H/ws4RtN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z82idw9V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oc//dKiY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VHmsi72S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H/ws4RtN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E3BBA21B61;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMfvClg6Mbn3c8H+czZyftL5f9KpG5bhck/RuCuid9c=;
	b=z82idw9Vh1kv1SaIhjdNUe09BMPTe5mL7gkSa8fmLgtKZeFMbqzyJLrEE0RnxW/grwFfWz
	0Oqns2pqFxzm41cp6K4FFrFHDMgo/FwLDrcPcI77qyyWnFYmxVHoc511i2XAyVPsmigjQq
	WQ+OK/Q+p07SCPQ5VVHc9y7h8Pf/+SU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMfvClg6Mbn3c8H+czZyftL5f9KpG5bhck/RuCuid9c=;
	b=Oc//dKiYKMs1bRj/CKO/FCsOBp+3lvApDZ9Y3Bcu5EXjG/9IySLM5hzRy4ushPe8hxx1ja
	OvTHVFsAHkV+UvAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMfvClg6Mbn3c8H+czZyftL5f9KpG5bhck/RuCuid9c=;
	b=VHmsi72SCA40OXMXijq20VZCDlUlMvLAR8ZzGabsGhNicv31MgOua5IC9T3P/2xgXwJlDk
	/EP/790YGaEFrKO+jx9+1lOtbTD4bvIDV6mQXTQNE8GAi9saj2C5imAiE4HrZj+fcOzVFw
	WLMFi+JIzsAwVT9FyiQn9nbf4NDeKsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMfvClg6Mbn3c8H+czZyftL5f9KpG5bhck/RuCuid9c=;
	b=H/ws4RtN/+OmhtIlT9MDM1alDg/pcYV2J9AVEe5uG51loyOniGhwGUAqu2iqi8T222tQpl
	H+Gl1HH5ehlx6pBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4FD213ADE;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cKzcLnU2qmYrWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 13:04:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/5] ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
Date: Wed, 31 Jul 2024 15:05:25 +0200
Message-ID: <20240731130528.12600-5-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Result: default: False [0.40 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.40

Just like the core UMP conversion helper, we need to deal with the
partially-filled RPN/NRPN data in the sequencer UMP converter as
well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 74 +++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index b1bc6d122d92..7ca62667f28d 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -790,27 +790,39 @@ static int paf_ev_to_ump_midi2(const struct snd_seq_event *event,
 }
 
 /* set up the MIDI2 RPN/NRPN packet data from the parsed info */
-static void fill_rpn(struct ump_cvt_to_ump_bank *cc,
-		     union snd_ump_midi2_msg *data,
-		     unsigned char channel)
+static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
+		    union snd_ump_midi2_msg *data,
+		    unsigned char channel,
+		    bool flush)
 {
+	if (!(cc->cc_data_lsb_set || cc->cc_data_msb_set))
+		return 0; // skip
+	/* when not flushing, wait for complete data set */
+	if (!flush && (!cc->cc_data_lsb_set || !cc->cc_data_msb_set))
+		return 0; // skip
+
 	if (cc->rpn_set) {
 		data->rpn.status = UMP_MSG_STATUS_RPN;
 		data->rpn.bank = cc->cc_rpn_msb;
 		data->rpn.index = cc->cc_rpn_lsb;
-		cc->rpn_set = 0;
-		cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
-	} else {
+	} else if (cc->nrpn_set) {
 		data->rpn.status = UMP_MSG_STATUS_NRPN;
 		data->rpn.bank = cc->cc_nrpn_msb;
 		data->rpn.index = cc->cc_nrpn_lsb;
-		cc->nrpn_set = 0;
-		cc->cc_nrpn_msb = cc->cc_nrpn_lsb = 0;
+	} else {
+		return 0; // skip
 	}
+
 	data->rpn.data = upscale_14_to_32bit((cc->cc_data_msb << 7) |
 					     cc->cc_data_lsb);
 	data->rpn.channel = channel;
+
+	cc->rpn_set = 0;
+	cc->nrpn_set = 0;
+	cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
 	cc->cc_data_msb = cc->cc_data_lsb = 0;
+	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+	return 1;
 }
 
 /* convert CC event to MIDI 2.0 UMP */
@@ -823,28 +835,34 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 	unsigned char index = event->data.control.param & 0x7f;
 	unsigned char val = event->data.control.value & 0x7f;
 	struct ump_cvt_to_ump_bank *cc = &dest_port->midi2_bank[channel];
+	int ret;
 
 	/* process special CC's (bank/rpn/nrpn) */
 	switch (index) {
 	case UMP_CC_RPN_MSB:
+		ret = fill_rpn(cc, data, channel, true);
 		cc->rpn_set = 1;
 		cc->cc_rpn_msb = val;
-		return 0; // skip
+		return ret;
 	case UMP_CC_RPN_LSB:
+		ret = fill_rpn(cc, data, channel, true);
 		cc->rpn_set = 1;
 		cc->cc_rpn_lsb = val;
-		return 0; // skip
+		return ret;
 	case UMP_CC_NRPN_MSB:
+		ret = fill_rpn(cc, data, channel, true);
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_msb = val;
-		return 0; // skip
+		return ret;
 	case UMP_CC_NRPN_LSB:
+		ret = fill_rpn(cc, data, channel, true);
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = val;
-		return 0; // skip
+		return ret;
 	case UMP_CC_DATA:
+		cc->cc_data_msb_set = 1;
 		cc->cc_data_msb = val;
-		return 0; // skip
+		return fill_rpn(cc, data, channel, false);
 	case UMP_CC_BANK_SELECT:
 		cc->bank_set = 1;
 		cc->cc_bank_msb = val;
@@ -854,11 +872,9 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->cc_bank_lsb = val;
 		return 0; // skip
 	case UMP_CC_DATA_LSB:
+		cc->cc_data_lsb_set = 1;
 		cc->cc_data_lsb = val;
-		if (!(cc->rpn_set || cc->nrpn_set))
-			return 0; // skip
-		fill_rpn(cc, data, channel);
-		return 1;
+		return fill_rpn(cc, data, channel, false);
 	}
 
 	data->cc.status = status;
@@ -926,6 +942,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 	unsigned char index = event->data.control.param & 0x7f;
 	struct ump_cvt_to_ump_bank *cc = &dest_port->midi2_bank[channel];
 	unsigned char msb, lsb;
+	int ret;
 
 	msb = (event->data.control.value >> 7) & 0x7f;
 	lsb = event->data.control.value & 0x7f;
@@ -939,28 +956,25 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 		cc->cc_bank_lsb = lsb;
 		return 0; // skip
 	case UMP_CC_RPN_MSB:
-		cc->cc_rpn_msb = msb;
-		fallthrough;
 	case UMP_CC_RPN_LSB:
-		cc->rpn_set = 1;
+		ret = fill_rpn(cc, data, channel, true);
+		cc->cc_rpn_msb = msb;
 		cc->cc_rpn_lsb = lsb;
-		return 0; // skip
+		cc->rpn_set = 1;
+		return ret;
 	case UMP_CC_NRPN_MSB:
-		cc->cc_nrpn_msb = msb;
-		fallthrough;
 	case UMP_CC_NRPN_LSB:
+		ret = fill_rpn(cc, data, channel, true);
+		cc->cc_nrpn_msb = msb;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = lsb;
-		return 0; // skip
+		return ret;
 	case UMP_CC_DATA:
-		cc->cc_data_msb = msb;
-		fallthrough;
 	case UMP_CC_DATA_LSB:
+		cc->cc_data_msb_set = cc->cc_data_lsb_set = 1;
+		cc->cc_data_msb = msb;
 		cc->cc_data_lsb = lsb;
-		if (!(cc->rpn_set || cc->nrpn_set))
-			return 0; // skip
-		fill_rpn(cc, data, channel);
-		return 1;
+		return fill_rpn(cc, data, channel, false);
 	}
 
 	data->cc.status = UMP_MSG_STATUS_CC;
-- 
2.43.0

