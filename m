Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290B41D5AD3
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630216; cv=none; b=O4F5l5QJl1lVEQXcSt3fleGAD9tlYyyJMpIlQb8C2ec24nMvVRyNxQHkv07hTwB6AlWLHx2XnZneySQUADr6E3GfxghPJjzPwU09twFBHwE1cd7tmzwHVeLwSkDrTKjZjXDcqMOD4VOSiPwFLi/0hzu5hVXMZjDys1Ar8eId73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630216; c=relaxed/simple;
	bh=7qi2eG/PDHH87u/rklJAxuCj0fwuGND0hl9/ACd03Ik=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mO51IE5Vo0yL1DSe4+wKyPBGrrrGspQ3ZuMUSlMjxu4i2EQaJQco1OAHez53c/ajGhO7xoRoQrQ+CWF2KoUhei+01RV83i+ifzVGSTd7I2jnghpPNQFfzTAhtaqPaen6pZ6uwSkHFGQQLdmCHQpt6YqRkPx6vJsTsCIPuYo2o1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2RN9UFYL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7/LJWtLd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2RN9UFYL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7/LJWtLd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2RN9UFYL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7/LJWtLd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2RN9UFYL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7/LJWtLd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C2231F74B;
	Tue, 26 Nov 2024 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732630212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8G9xmm6rIjvaAXLhn98zmVZd2MVg04XY6UkI3pEiS+E=;
	b=2RN9UFYLUoV+p3csh35q3f4Vshem9cdvl9WmO/aIe7ULW+ouvoif8pybxWwUYe6niFfdS/
	g4mFV86+Fc0xqb4wuUhlPVBSLR7gvGsTS0X2937Wha1MddxxeVWkGZABFL83Er4ETyzhu3
	xqzF43ZCyAUj+LmI0QAXRKNhEXd9C3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732630212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8G9xmm6rIjvaAXLhn98zmVZd2MVg04XY6UkI3pEiS+E=;
	b=7/LJWtLdoTDb56aB66XYgqeMTj+Vgibas7GfpMcv3jyWAJCuFU74VDU4BlvJ/7Raw6a5Tf
	zxKcyvL7f7DwAFAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2RN9UFYL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="7/LJWtLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732630212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8G9xmm6rIjvaAXLhn98zmVZd2MVg04XY6UkI3pEiS+E=;
	b=2RN9UFYLUoV+p3csh35q3f4Vshem9cdvl9WmO/aIe7ULW+ouvoif8pybxWwUYe6niFfdS/
	g4mFV86+Fc0xqb4wuUhlPVBSLR7gvGsTS0X2937Wha1MddxxeVWkGZABFL83Er4ETyzhu3
	xqzF43ZCyAUj+LmI0QAXRKNhEXd9C3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732630212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8G9xmm6rIjvaAXLhn98zmVZd2MVg04XY6UkI3pEiS+E=;
	b=7/LJWtLdoTDb56aB66XYgqeMTj+Vgibas7GfpMcv3jyWAJCuFU74VDU4BlvJ/7Raw6a5Tf
	zxKcyvL7f7DwAFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42512139AA;
	Tue, 26 Nov 2024 14:10:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CPyuD8TWRWcbcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Nov 2024 14:10:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Show the codec quirk info at probing
Date: Tue, 26 Nov 2024 15:10:10 +0100
Message-ID: <20241126141010.12567-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5C2231F74B
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Lots of HD-audio devices need the device-specific quirk, and it's
often helpful to know which quirk is applied.  But currently the
driver shows it only as a debug output, hence we'd have to enable the
debug option at each time we want to see it (and the output becomes
too messy due to other debug messages).

This patch changes the messages to the info level, so that they appear
at probing normally.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_auto_parser.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 8e74be038b0f..84393f4f429d 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -933,6 +933,7 @@ void snd_hda_pick_pin_fixup(struct hda_codec *codec,
 			    bool match_all_pins)
 {
 	const struct snd_hda_pin_quirk *pq;
+	const char *name = NULL;
 
 	if (codec->fixup_id != HDA_FIXUP_ID_NOT_SET)
 		return;
@@ -946,9 +947,10 @@ void snd_hda_pick_pin_fixup(struct hda_codec *codec,
 			codec->fixup_id = pq->value;
 #ifdef CONFIG_SND_DEBUG_VERBOSE
 			codec->fixup_name = pq->name;
-			codec_dbg(codec, "%s: picked fixup %s (pin match)\n",
-				  codec->core.chip_name, codec->fixup_name);
+			name = pq->name;
 #endif
+			codec_info(codec, "%s: picked fixup %s (pin match)\n",
+				   codec->core.chip_name, name ? name : "");
 			codec->fixup_list = fixlist;
 			return;
 		}
@@ -1015,8 +1017,8 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 	if (codec->modelname && !strcmp(codec->modelname, "nofixup")) {
 		id = HDA_FIXUP_ID_NO_FIXUP;
 		fixlist = NULL;
-		codec_dbg(codec, "%s: picked no fixup (nofixup specified)\n",
-			  codec->core.chip_name);
+		codec_info(codec, "%s: picked no fixup (nofixup specified)\n",
+			   codec->core.chip_name);
 		goto found;
 	}
 
@@ -1026,8 +1028,8 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 			if (!strcmp(codec->modelname, models->name)) {
 				id = models->id;
 				name = models->name;
-				codec_dbg(codec, "%s: picked fixup %s (model specified)\n",
-					  codec->core.chip_name, codec->fixup_name);
+				codec_info(codec, "%s: picked fixup %s (model specified)\n",
+					   codec->core.chip_name, name);
 				goto found;
 			}
 			models++;
@@ -1085,9 +1087,9 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
 #ifdef CONFIG_SND_DEBUG_VERBOSE
 	name = q->name;
 #endif
-	codec_dbg(codec, "%s: picked fixup %s for %s %04x:%04x\n",
-		  codec->core.chip_name, name ? name : "",
-		  type, q->subvendor, q->subdevice);
+	codec_info(codec, "%s: picked fixup %s for %s %04x:%04x\n",
+		   codec->core.chip_name, name ? name : "",
+		   type, q->subvendor, q->subdevice);
  found:
 	codec->fixup_id = id;
 	codec->fixup_list = fixlist;
-- 
2.43.0

