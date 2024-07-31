Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCDF19412E
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431104; cv=none; b=W+TLmRoO2Drr8/ldhW41P0RIYAgqdTBFxqFt2vGoE7erBmyRKIC1Vg6G2NIBa+PdMFiIJV2/ecuOga/XqVhdMFqXOXzyXA1ms8J/GYqGHQNfEpUsmVCfMt1x+TAIavBqI10ShrbNWMEsX9qvLQLPyZcZfsnPINY/ayuBor9QfV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431104; c=relaxed/simple;
	bh=VugmW1eL2wSuGgS8ilgnZhG75ET8gJ5hVmSXtjFGpE0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhBBCyFQxHK3Vlf/RnLTXoHJbXcAz5a7WhYOEthq8DX9HXKU+bU+AdgMMQiJVk3+6pnkp9BpxjOI+NvkVgCyojyFRVlPHceOBQRzUQQGCTujUasbh5eSKv0Zlze06B3vIpqcBU1e94cZVxCtHoElaD71dzOctN+pGG+OsI3Oj94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WM6X8aoQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pkbbJmPI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WiYOHngI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sfPvCNGB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WM6X8aoQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pkbbJmPI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WiYOHngI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sfPvCNGB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8393621A31;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLro7FW1X+vss40Tm2Z3keFpWsqiZEDiMXdcNL1+K44=;
	b=WM6X8aoQOjhgK8V1vMy/+C49zbaF+9YHWRmUVlAOnp6m7dhKKwbldWT6JObjVYcD6KE33y
	7+ZtnkL+jT0Py0cgGgFepwIUn9x8hrXeqoJz0Uq/x45+aZbvVFBdI0EkVQE3RENX/nZav9
	UPgqcUvlkmPB7WLh4hk3CUJyQsNqUQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLro7FW1X+vss40Tm2Z3keFpWsqiZEDiMXdcNL1+K44=;
	b=pkbbJmPIAGeIGozkfU504HlW5B5EUigd81FdNsxFmhlVTYJDTCo3GR0aThyPsiyvBh9XnS
	OoBO/vTbkjAzO0DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLro7FW1X+vss40Tm2Z3keFpWsqiZEDiMXdcNL1+K44=;
	b=WiYOHngIXtsOruEp3Pl2ArkfJmGWxYUF03/Ov5fe8chjL5oE8CcBwMhqeAwlx/ri8Q09WS
	m678Ew/52rWloxu/6HPu9wTCHuM9nE0T1Z+yACZviC8OKEpOhzLOOzRq06Id0+yITvs2Rt
	HdtZ/Sr3mXM20i0DDdcGdaTFvuJl/R8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLro7FW1X+vss40Tm2Z3keFpWsqiZEDiMXdcNL1+K44=;
	b=sfPvCNGBuFyAvUwHV60NGZedOdZH03cvp1yvXc61EApLiNUHhQNBw8zJrMam8n8oPs1nSs
	LmTbPhO3ArCPDSAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67CA213AD8;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8P8kGHU2qmYrWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 13:04:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/5] ALSA: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
Date: Wed, 31 Jul 2024 15:05:22 +0200
Message-ID: <20240731130528.12600-2-tiwai@suse.de>
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

The UMP 1.1 spec says that an RPN/NRPN should be sent when one of the
following occurs:
* a CC 38 is received
* a subsequent CC 6 is received
* a CC 98, 99, 100, and 101 is received, indicating the last RPN/NRPN
  message has ended and a new one has started

That said, we should send a partial data even if it's not fully
filled.  Let's change the UMP conversion helper code to follow that
rule.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump_convert.h |  1 +
 sound/core/ump_convert.c    | 49 ++++++++++++++++++++++++-------------
 2 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/include/sound/ump_convert.h b/include/sound/ump_convert.h
index 28c364c63245..d099ae27f849 100644
--- a/include/sound/ump_convert.h
+++ b/include/sound/ump_convert.h
@@ -13,6 +13,7 @@ struct ump_cvt_to_ump_bank {
 	unsigned char cc_nrpn_msb, cc_nrpn_lsb;
 	unsigned char cc_data_msb, cc_data_lsb;
 	unsigned char cc_bank_msb, cc_bank_lsb;
+	bool cc_data_msb_set, cc_data_lsb_set;
 };
 
 /* context for converting from MIDI1 byte stream to UMP packet */
diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index f67c44c83fde..5d1b85e7ac16 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -287,25 +287,37 @@ static int cvt_legacy_system_to_ump(struct ump_cvt_to_ump *cvt,
 	return 4;
 }
 
-static void fill_rpn(struct ump_cvt_to_ump_bank *cc,
-		     union snd_ump_midi2_msg *midi2)
+static int fill_rpn(struct ump_cvt_to_ump_bank *cc,
+		    union snd_ump_midi2_msg *midi2,
+		    bool flush)
 {
+	if (!(cc->cc_data_lsb_set || cc->cc_data_msb_set))
+		return 0; // skip
+	/* when not flushing, wait for complete data set */
+	if (!flush && (!cc->cc_data_lsb_set || !cc->cc_data_msb_set))
+		return 0; // skip
+
 	if (cc->rpn_set) {
 		midi2->rpn.status = UMP_MSG_STATUS_RPN;
 		midi2->rpn.bank = cc->cc_rpn_msb;
 		midi2->rpn.index = cc->cc_rpn_lsb;
-		cc->rpn_set = 0;
-		cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
-	} else {
+	} else if (cc->nrpn_set) {
 		midi2->rpn.status = UMP_MSG_STATUS_NRPN;
 		midi2->rpn.bank = cc->cc_nrpn_msb;
 		midi2->rpn.index = cc->cc_nrpn_lsb;
-		cc->nrpn_set = 0;
-		cc->cc_nrpn_msb = cc->cc_nrpn_lsb = 0;
+	} else {
+		return 0; // skip
 	}
+
 	midi2->rpn.data = upscale_14_to_32bit((cc->cc_data_msb << 7) |
 					      cc->cc_data_lsb);
+
+	cc->rpn_set = 0;
+	cc->nrpn_set = 0;
+	cc->cc_rpn_msb = cc->cc_rpn_lsb = 0;
 	cc->cc_data_msb = cc->cc_data_lsb = 0;
+	cc->cc_data_msb_set = cc->cc_data_lsb_set = 0;
+	return 1;
 }
 
 /* convert to a MIDI 1.0 Channel Voice message */
@@ -318,6 +330,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 	struct ump_cvt_to_ump_bank *cc;
 	union snd_ump_midi2_msg *midi2 = (union snd_ump_midi2_msg *)data;
 	unsigned char status, channel;
+	int ret;
 
 	BUILD_BUG_ON(sizeof(union snd_ump_midi1_msg) != 4);
 	BUILD_BUG_ON(sizeof(union snd_ump_midi2_msg) != 8);
@@ -358,24 +371,29 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 	case UMP_MSG_STATUS_CC:
 		switch (buf[1]) {
 		case UMP_CC_RPN_MSB:
+			ret = fill_rpn(cc, midi2, true);
 			cc->rpn_set = 1;
 			cc->cc_rpn_msb = buf[2];
-			return 0; // skip
+			return ret;
 		case UMP_CC_RPN_LSB:
+			ret = fill_rpn(cc, midi2, true);
 			cc->rpn_set = 1;
 			cc->cc_rpn_lsb = buf[2];
-			return 0; // skip
+			return ret;
 		case UMP_CC_NRPN_MSB:
+			ret = fill_rpn(cc, midi2, true);
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_msb = buf[2];
-			return 0; // skip
+			return ret;
 		case UMP_CC_NRPN_LSB:
+			ret = fill_rpn(cc, midi2, true);
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_lsb = buf[2];
-			return 0; // skip
+			return ret;
 		case UMP_CC_DATA:
+			cc->cc_data_msb_set = 1;
 			cc->cc_data_msb = buf[2];
-			return 0; // skip
+			return fill_rpn(cc, midi2, false);
 		case UMP_CC_BANK_SELECT:
 			cc->bank_set = 1;
 			cc->cc_bank_msb = buf[2];
@@ -385,12 +403,9 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			cc->cc_bank_lsb = buf[2];
 			return 0; // skip
 		case UMP_CC_DATA_LSB:
+			cc->cc_data_lsb_set = 1;
 			cc->cc_data_lsb = buf[2];
-			if (cc->rpn_set || cc->nrpn_set)
-				fill_rpn(cc, midi2);
-			else
-				return 0; // skip
-			break;
+			return fill_rpn(cc, midi2, false);
 		default:
 			midi2->cc.index = buf[1];
 			midi2->cc.data = upscale_7_to_32bit(buf[2]);
-- 
2.43.0

