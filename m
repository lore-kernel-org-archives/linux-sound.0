Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0918C91D
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431097; cv=none; b=lOHSDAR8216B4I+aYgY0S1W+TysAPxje1KGMI9jpYQHwaAWyw2Sy+bTID4M/3oeFtNeNsr78oJu2v+SfaM1rzrQ2oZ8+aV4gN/+rWFGi+GCUmO+WDbdian7fTP3GNYJkXSAM+TxI7baOuRcfI5jvMtgkVvIKToIspPC5BpDrzKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431097; c=relaxed/simple;
	bh=5IQw8P8rVOMOZlmuqS+PgJXGed2u9NFYge9GWsk9KZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESPuJpqq0uXirMgpb6aAesKyM6zdTZMX7Se0z7FBDoFGsGedbtsNXyq9/5ipb6mpBmRFte+EZ8wgnlMxu0b5KShFt7mX/EBSxKXMFx3oLuvggglCWcym/KNNhAMxStrbiXo7RvVpB07RJ2iZ8MF6atph1o3gNK84P6VpzdtuFvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OHR6VsAa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G8+vePVE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CLSEX94E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5plIVKBN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OHR6VsAa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G8+vePVE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CLSEX94E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5plIVKBN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C3B7F1F840;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iHTkzJcM0pMr2AViWgOWnSYLAB59nevSfT6aQbAFi4=;
	b=OHR6VsAaxN3T/lVPgr/plOcxiw3iTWr73101MsAkHvRBH8RLqA7an03aTPabCSWbcO0jDn
	U/OfrtFxiN5YmBYe5AMz+qIxmBExvwtm2J2vNmcvp19GOZxlOvtQBUHIhGCrdErHNXlErU
	sUKCPNVJ7pT4+WHm1A3nq3t3VMSf+Vo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iHTkzJcM0pMr2AViWgOWnSYLAB59nevSfT6aQbAFi4=;
	b=G8+vePVEjcWHzbwxHNflQo9grGFOK+iYeouOFwTQ2bAaPvu1JE8h1e68l4lqsYVv2CYReS
	aCSijsg+vFmGXgDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iHTkzJcM0pMr2AViWgOWnSYLAB59nevSfT6aQbAFi4=;
	b=CLSEX94E7wp0nu2ad1MkHzCG/mkvXCAG6U6zQuALa7c6Xp7XVT4EKpxeHzoZXzuUpZFwEl
	Vt4J/n2hWTOhbdacHosN3Sbe7BRGpNyM9nA5wtkjhJ4i1G1m9EwQIoLKGzio5PMBbAmCEZ
	Y6CyWQaT5X0tFgZRdZKuKfK/0IdE41I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iHTkzJcM0pMr2AViWgOWnSYLAB59nevSfT6aQbAFi4=;
	b=5plIVKBNTp4ot9jkok7hg3HN598nXrEcgrLnhpD/cPMtgdm4fd9uwXeK5Nmf42LK2lv9GI
	7ugSitSW0f5ksVBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5EC913ADB;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CCVWJ3U2qmYrWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 13:04:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/5] ALSA: seq: ump: Use the common RPN/bank conversion context
Date: Wed, 31 Jul 2024 15:05:24 +0200
Message-ID: <20240731130528.12600-4-tiwai@suse.de>
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

The UMP core conversion helper API already defines the context needed
to record the bank and RPN/NRPN values, and we can simply re-use the
same struct instead of re-defining the same content as a different
name.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ports.h       | 14 ++------------
 sound/core/seq/seq_ump_convert.c | 10 +++++-----
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index b111382f697a..9e36738c0dd0 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -7,6 +7,7 @@
 #define __SND_SEQ_PORTS_H
 
 #include <sound/seq_kernel.h>
+#include <sound/ump_convert.h>
 #include "seq_lock.h"
 
 /* list of 'exported' ports */
@@ -42,17 +43,6 @@ struct snd_seq_port_subs_info {
 	int (*close)(void *private_data, struct snd_seq_port_subscribe *info);
 };
 
-/* context for converting from legacy control event to UMP packet */
-struct snd_seq_ump_midi2_bank {
-	bool rpn_set;
-	bool nrpn_set;
-	bool bank_set;
-	unsigned char cc_rpn_msb, cc_rpn_lsb;
-	unsigned char cc_nrpn_msb, cc_nrpn_lsb;
-	unsigned char cc_data_msb, cc_data_lsb;
-	unsigned char cc_bank_msb, cc_bank_lsb;
-};
-
 struct snd_seq_client_port {
 
 	struct snd_seq_addr addr;	/* client/port number */
@@ -88,7 +78,7 @@ struct snd_seq_client_port {
 	unsigned char ump_group;
 
 #if IS_ENABLED(CONFIG_SND_SEQ_UMP)
-	struct snd_seq_ump_midi2_bank midi2_bank[16]; /* per channel */
+	struct ump_cvt_to_ump_bank midi2_bank[16]; /* per channel */
 #endif
 };
 
diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index d9dacfbe4a9a..b1bc6d122d92 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -368,7 +368,7 @@ static int cvt_ump_midi1_to_midi2(struct snd_seq_client *dest,
 	struct snd_seq_ump_event ev_cvt;
 	const union snd_ump_midi1_msg *midi1 = (const union snd_ump_midi1_msg *)event->ump;
 	union snd_ump_midi2_msg *midi2 = (union snd_ump_midi2_msg *)ev_cvt.ump;
-	struct snd_seq_ump_midi2_bank *cc;
+	struct ump_cvt_to_ump_bank *cc;
 
 	ev_cvt = *event;
 	memset(&ev_cvt.ump, 0, sizeof(ev_cvt.ump));
@@ -790,7 +790,7 @@ static int paf_ev_to_ump_midi2(const struct snd_seq_event *event,
 }
 
 /* set up the MIDI2 RPN/NRPN packet data from the parsed info */
-static void fill_rpn(struct snd_seq_ump_midi2_bank *cc,
+static void fill_rpn(struct ump_cvt_to_ump_bank *cc,
 		     union snd_ump_midi2_msg *data,
 		     unsigned char channel)
 {
@@ -822,7 +822,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 	unsigned char channel = event->data.control.channel & 0x0f;
 	unsigned char index = event->data.control.param & 0x7f;
 	unsigned char val = event->data.control.value & 0x7f;
-	struct snd_seq_ump_midi2_bank *cc = &dest_port->midi2_bank[channel];
+	struct ump_cvt_to_ump_bank *cc = &dest_port->midi2_bank[channel];
 
 	/* process special CC's (bank/rpn/nrpn) */
 	switch (index) {
@@ -887,7 +887,7 @@ static int pgm_ev_to_ump_midi2(const struct snd_seq_event *event,
 			       unsigned char status)
 {
 	unsigned char channel = event->data.control.channel & 0x0f;
-	struct snd_seq_ump_midi2_bank *cc = &dest_port->midi2_bank[channel];
+	struct ump_cvt_to_ump_bank *cc = &dest_port->midi2_bank[channel];
 
 	data->pg.status = status;
 	data->pg.channel = channel;
@@ -924,7 +924,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 {
 	unsigned char channel = event->data.control.channel & 0x0f;
 	unsigned char index = event->data.control.param & 0x7f;
-	struct snd_seq_ump_midi2_bank *cc = &dest_port->midi2_bank[channel];
+	struct ump_cvt_to_ump_bank *cc = &dest_port->midi2_bank[channel];
 	unsigned char msb, lsb;
 
 	msb = (event->data.control.value >> 7) & 0x7f;
-- 
2.43.0

