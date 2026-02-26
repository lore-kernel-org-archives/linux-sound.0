Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAAA410D35
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120673; cv=none; b=RC67iTmhbG6kWZKglygwP2QAcNLNAYJLnClYmSfzi2X80wt6WyUolP/F4o1VqeUKoTMvuCXr5XhZcliWRm7kAGKMMzJySb63WXd+ZQMRWpiFY79hLlhyTeWtOWRFVovMGrxtBC0P0+iXu7ocdCGIxvcWL3WB9yZlJ58jSCa6LgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120673; c=relaxed/simple;
	bh=rdUpBcQEUNoSEWdHrN+/rzL160lR9Q8GuYE8BwqWBo4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJpOlQ8bEazRCQ/1HvblRRj/fIOQ6GJfw0ioeMAk3z6JMVAF8g0Jv9Eer4u3cdPZaSMTuwCfToztDu/cvozAgkIAhgkWv++8LcbTqjaWoefpnZffcXUZnZ/FNw1BC8RST3TpkjHt5Tpss6yCZQRKify39ftK4DJtRVz/EZvEVuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=asnN4iBI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q6D66ETg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uighRfrV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ihf3B6C9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="asnN4iBI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q6D66ETg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uighRfrV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ihf3B6C9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCE001FA9B;
	Thu, 26 Feb 2026 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wG3DcKQY50mS3BUmsXCOp5SmqY0iMxJGxWEM6y1bYvU=;
	b=asnN4iBIQBqlGNIBEsvBc0npsfoUwYuYguijwZ3gccoEXD31W+ki4VWOBEcnfUV3s9wKsz
	yA3DO67zn5aCUE4JGV/FSlvaaRKJzHViYFfiX0Gv/UlLwf7uUnjdUeZuH/DR2lKPIYlO6k
	91oSsHMAs297Boauc80rq3nFPCaOYXg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wG3DcKQY50mS3BUmsXCOp5SmqY0iMxJGxWEM6y1bYvU=;
	b=Q6D66ETgwUVjPWYN8+RIyZNyfDHgHLwcROYv0L/wkqbcTcAy9Z0eMwxkGwR8iUFrAeB/Kk
	mpXQcHNLHOOIyKCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772120657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wG3DcKQY50mS3BUmsXCOp5SmqY0iMxJGxWEM6y1bYvU=;
	b=uighRfrVxw+2nA075xf186zy35k3LZ5eJ+SzcQhqfe1iIBaB2BGCaobP8N6cTVdxyn1egO
	bWyWqQYdCALegEhQSRAZj2TtxSPbY5ppBE/sfuZwmdDJnrmU6wrrPqdMAu1/7Yk0n18jlR
	G6xY5wAdhF9EhOeToWO08MltmA9LINc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772120657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wG3DcKQY50mS3BUmsXCOp5SmqY0iMxJGxWEM6y1bYvU=;
	b=ihf3B6C9UN+5DuFJhbIDuBDBLFcEhULouJqkoFII8taxCjmgoD3Iiunwf9S4MjDyhuAFUc
	YWFseMm5ozbQtiCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C21AE3EA62;
	Thu, 26 Feb 2026 15:44:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wK0sLlFqoGnMawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 15:44:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/3] ALSA: usb-audio: Drop superfluous kernel-doc markers
Date: Thu, 26 Feb 2026 16:43:48 +0100
Message-ID: <20260226154414.1081568-3-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226154414.1081568-1-tiwai@suse.de>
References: <20260226154414.1081568-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

We don't process USB-audio driver code for kernel-doc, and the "/**"
marker leads to warnings with W=1 builds.  Drop the superfluous
markers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_s1810c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
index 473cb29efa7f..7eac7d1bce64 100644
--- a/sound/usb/mixer_s1810c.c
+++ b/sound/usb/mixer_s1810c.c
@@ -71,7 +71,7 @@
  *   * e I guess the same as with mixer
  *
  */
-/** struct s1810c_ctl_packet - basic vendor request
+/* struct s1810c_ctl_packet - basic vendor request
  * @selector: device/mixer/output
  * @b: request-dependant field b
  * @tag: fixed value identifying type of request
@@ -94,14 +94,14 @@ struct s1810c_ctl_packet {
 	__le32 e;
 };
 
-/** selectors for CMD request
+/* selectors for CMD request
  */
 #define SC1810C_SEL_DEVICE 0
 #define SC1810C_SEL_MIXER 0x64
 #define SC1810C_SEL_OUTPUT 0x65
 
 
-/** control ids */
+/* control ids */
 #define SC1810C_CTL_LINE_SW	0
 #define SC1810C_CTL_MUTE_SW	1
 #define SC1824C_CTL_MONO_SW	2
@@ -127,7 +127,7 @@ struct s1810c_ctl_packet {
 #define SC1810C_GET_STATE_TAG	SC1810C_SET_STATE_TAG
 #define SC1810C_GET_STATE_LEN	SC1810C_SET_STATE_LEN
 
-/** Mixer levels normally range from 0 (off) to 0x0100 0000 (0 dB).
+/* Mixer levels normally range from 0 (off) to 0x0100 0000 (0 dB).
  * raw_level = 2^24 * 10^(db_level / 20), thus
  * -3dB = 0xb53bf0 (technically, half-power -3.01...dB would be 0xb504f3)
  * -96dB = 0x109
@@ -145,7 +145,7 @@ struct s1810c_ctl_packet {
 #define MIXER_LEVEL_N3DB 0xb53bf0
 #define MIXER_LEVEL_0DB 0x1000000
 
-/**
+/*
  * This packet includes mixer volumes and
  * various other fields, it's an extended
  * version of ctl_packet, with a and b
@@ -155,7 +155,7 @@ struct s1810c_state_packet {
 	__le32 fields[63];
 };
 
-/** indices into s1810c_state_packet.fields[]
+/* indices into s1810c_state_packet.fields[]
  */
 #define SC1810C_STATE_TAG_IDX	2
 #define SC1810C_STATE_LEN_IDX	3
-- 
2.53.0

