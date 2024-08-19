Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0B14D282
	for <linux-sound@vger.kernel.org>; Mon, 19 Aug 2024 08:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056881; cv=none; b=oPj/P5fo1oOBSsdkRipQWO/E/fSEI3by3yEwv5wA+w3PVwsTiv3KoGJYptfN8RLzWPbpnvPcviPF+v0BKrMOShkPorJaoDt8XOzEyrCkgciEAEwRgOG7KAxqnsoN2Bp44Sd96KF3ofvkwbaox1BiWBFttB2QN1BPshs7PNlDqb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056881; c=relaxed/simple;
	bh=DYOZjjTyo6yr/1B9VlzFauwRY2dm++3+4If5qA9wrtw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=c6oHFq4Dep+NhItIT+m561mJ4QdzpHDlICgu0hRGm7X4qcgJfxITPHUqTD5LQuf3DXZeMKJMVUbMKDLd6Gyfjg8wxMtIFnmQ262hGVhrEV+nUjbLioTCXPkfnPmDpvntz98hB0eJR5Z4jK9uCDQG5PWipU4xOnn3vn69buv3ZbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=swUklBGV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kZTNtU7K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ra1uRtvg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wm4Etfdm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="swUklBGV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kZTNtU7K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ra1uRtvg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wm4Etfdm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9C1C203A7;
	Mon, 19 Aug 2024 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724056878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xfxxaaqCqjjlPKjU7/dctx1PRFXd4gL7VMQrEC4X/O4=;
	b=swUklBGVuR9zImuUkPThVqTQN8Sd7eIgmUzfpsPWNru8BKBT2q8+szxGK6sVEEbvu4N3Rc
	5GLH0ctcxcl1v+9r5jXdTjorX+cIo4LEVOSmbghubyaR8GzclsCAjqTo0yNVStUHEBIjoA
	l9cpAwjs9uTbGK+OUGeLpkFN1g9LZ4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724056878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xfxxaaqCqjjlPKjU7/dctx1PRFXd4gL7VMQrEC4X/O4=;
	b=kZTNtU7K9UeoN3rvwlwAnburEdgGyVIL9dT/WIipoREvycfvEXwJ3hpcCo/n/OP0CFVZlR
	nxNapdZ3CKkTpFBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724056876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xfxxaaqCqjjlPKjU7/dctx1PRFXd4gL7VMQrEC4X/O4=;
	b=Ra1uRtvglCrPCItMgFZq32P80zGBnXejrDstrII+r9uAljVsjK8gs7KBhUYLgn565yCHhM
	QoSYFEz0pnCt3RrPiTVPPRdFiDjtbnuS+HBC85X1qgv+RwPDbyLfBrtLH4Ok2IfYI523gg
	3CmkZtNOAye1LyzJeuldr8C9m6bHMD4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724056876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xfxxaaqCqjjlPKjU7/dctx1PRFXd4gL7VMQrEC4X/O4=;
	b=Wm4EtfdmeI/V7GqP9Wg+9mzrO6OrjDTPgI/EomCnH1j71PITQ/NHJuA059B59z997hm9St
	lHrgGIpByeNsK/Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C55D6137C3;
	Mon, 19 Aug 2024 08:41:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VcXaLiwFw2a2GQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Aug 2024 08:41:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Skip event type filtering for UMP events
Date: Mon, 19 Aug 2024 10:41:53 +0200
Message-ID: <20240819084156.10286-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

UMP events don't use the event type field, hence it's invalid to apply
the filter, which may drop the events unexpectedly.
Skip the event filtering for UMP events, instead.

Fixes: 46397622a3fa ("ALSA: seq: Add UMP support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 276b5b3f68dc..49e524e6a741 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -537,6 +537,9 @@ static struct snd_seq_client *get_event_dest_client(struct snd_seq_event *event,
 		return NULL;
 	if (! dest->accept_input)
 		goto __not_avail;
+	if (snd_seq_ev_is_ump(event))
+		return dest; /* ok - no filter checks */
+
 	if ((dest->filter & SNDRV_SEQ_FILTER_USE_EVENT) &&
 	    ! test_bit(event->type, dest->event_filter))
 		goto __not_avail;
-- 
2.43.0

