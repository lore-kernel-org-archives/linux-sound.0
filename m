Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AD2322777
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480479; cv=none; b=izuGv+3yhNC+FmGMt+mmnkBs9M4KqLUkGIITdFXXJAhdie5wOI2FT0RXi2KOJ/ertu3Q1Ic98WlDWJyxSAY68ne6qI0ZI2dWrAymKphsyHyjT3z18uqbmGX+7JLUIYX+QrqGQ1J9g515/fJt+FpUnaXUgAVrGBOVbFdH3uL7sdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480479; c=relaxed/simple;
	bh=pzudRDgxFCVkRwEgfhlpaNeV55EK+yS47lmlZzbCgWI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXfWZvM4WrzX3/3fSmYuiKMznm6pUtqSpoetoITGTLRsvqPiYYE7uliIR71LS5xmyrz5At5jlv6rvbu/BTp1R/rS3htMC2gEBIiVseC1IJr8lx7QI4RFIMNxRLnMfWMkzFKuy7EbDCz1tgwUxmCOSY2O4Rq2MYFnQyMwIkyQ1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UV0Uzn0t; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DGlNl/1q; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tN7466OQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E6ityxEl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UV0Uzn0t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DGlNl/1q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tN7466OQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6ityxEl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 50A795C269;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBm5dvNTKDKmf+BwlY3kocgDJYw5wOwg5zAWrU5sKYU=;
	b=UV0Uzn0t8HE86uWqWmgbl4tS9CJbslVl3ubW3Z/59mUT9yG3lmp9VCmvcgIM2Mx+eKrJoK
	BopWKu6n2dfzsiO8j0l9EkisQAi9nvCXn4DUWqdwSghUK9TZRq3BqC+Re/XgagMTE6by3h
	mmNENk+xkrK6rZnpOcmUvpqxtRB2YFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBm5dvNTKDKmf+BwlY3kocgDJYw5wOwg5zAWrU5sKYU=;
	b=DGlNl/1qsy+QwI9eE2Eib/yp1X+EgQf3W28Gknxs8SbRQYkp65COl2OL0ZRoX5rWf6Oohi
	6bdA/+M8kY7vR6Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBm5dvNTKDKmf+BwlY3kocgDJYw5wOwg5zAWrU5sKYU=;
	b=tN7466OQ0fitMtwsZud8i2ppYRaQHIGa+fTrEHwBmM6Rm5VL/l2FIjKMsrO/UGAc1VUvw2
	F2p5r8OHavHlhU+lPRvYcV9AEHHXlqu9N0JRzJZAPX18snf8vwxRiT8g8BrQoW/c2e2E4f
	XtjKEX4Nhegb6L8V9ULKJBuu0liva5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBm5dvNTKDKmf+BwlY3kocgDJYw5wOwg5zAWrU5sKYU=;
	b=E6ityxElhs5lx9g2sOgELsGm5kZEg/D5RsDjDOJkmUlFYEMYGvlf+laLSKaCcEt5j2/luj
	Wmn7bRPjUC4EkSDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 360B513A54;
	Fri, 29 Aug 2025 15:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QJP4C6bDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/19] ALSA: xen: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:22 +0200
Message-ID: <20250829151335.7342-9-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/xen/xen_snd_front.c         | 80 ++++++++++++++-----------------
 sound/xen/xen_snd_front_evtchnl.c | 33 ++++++-------
 2 files changed, 52 insertions(+), 61 deletions(-)

diff --git a/sound/xen/xen_snd_front.c b/sound/xen/xen_snd_front.c
index b66e037710d0..c56d17479f05 100644
--- a/sound/xen/xen_snd_front.c
+++ b/sound/xen/xen_snd_front.c
@@ -62,12 +62,12 @@ int xen_snd_front_stream_query_hw_param(struct xen_snd_front_evtchnl *evtchnl,
 	struct xensnd_req *req;
 	int ret;
 
-	mutex_lock(&evtchnl->u.req.req_io_lock);
+	guard(mutex)(&evtchnl->u.req.req_io_lock);
 
-	mutex_lock(&evtchnl->ring_io_lock);
-	req = be_stream_prepare_req(evtchnl, XENSND_OP_HW_PARAM_QUERY);
-	req->op.hw_param = *hw_param_req;
-	mutex_unlock(&evtchnl->ring_io_lock);
+	scoped_guard(mutex, &evtchnl->ring_io_lock) {
+		req = be_stream_prepare_req(evtchnl, XENSND_OP_HW_PARAM_QUERY);
+		req->op.hw_param = *hw_param_req;
+	}
 
 	ret = be_stream_do_io(evtchnl);
 
@@ -77,7 +77,6 @@ int xen_snd_front_stream_query_hw_param(struct xen_snd_front_evtchnl *evtchnl,
 	if (ret == 0)
 		*hw_param_resp = evtchnl->u.req.resp.hw_param;
 
-	mutex_unlock(&evtchnl->u.req.req_io_lock);
 	return ret;
 }
 
@@ -90,25 +89,24 @@ int xen_snd_front_stream_prepare(struct xen_snd_front_evtchnl *evtchnl,
 	struct xensnd_req *req;
 	int ret;
 
-	mutex_lock(&evtchnl->u.req.req_io_lock);
+	guard(mutex)(&evtchnl->u.req.req_io_lock);
 
-	mutex_lock(&evtchnl->ring_io_lock);
-	req = be_stream_prepare_req(evtchnl, XENSND_OP_OPEN);
-	req->op.open.pcm_format = format;
-	req->op.open.pcm_channels = channels;
-	req->op.open.pcm_rate = rate;
-	req->op.open.buffer_sz = buffer_sz;
-	req->op.open.period_sz = period_sz;
-	req->op.open.gref_directory =
-		xen_front_pgdir_shbuf_get_dir_start(shbuf);
-	mutex_unlock(&evtchnl->ring_io_lock);
+	scoped_guard(mutex, &evtchnl->ring_io_lock) {
+		req = be_stream_prepare_req(evtchnl, XENSND_OP_OPEN);
+		req->op.open.pcm_format = format;
+		req->op.open.pcm_channels = channels;
+		req->op.open.pcm_rate = rate;
+		req->op.open.buffer_sz = buffer_sz;
+		req->op.open.period_sz = period_sz;
+		req->op.open.gref_directory =
+			xen_front_pgdir_shbuf_get_dir_start(shbuf);
+	}
 
 	ret = be_stream_do_io(evtchnl);
 
 	if (ret == 0)
 		ret = be_stream_wait_io(evtchnl);
 
-	mutex_unlock(&evtchnl->u.req.req_io_lock);
 	return ret;
 }
 
@@ -117,18 +115,17 @@ int xen_snd_front_stream_close(struct xen_snd_front_evtchnl *evtchnl)
 	__always_unused struct xensnd_req *req;
 	int ret;
 
-	mutex_lock(&evtchnl->u.req.req_io_lock);
+	guard(mutex)(&evtchnl->u.req.req_io_lock);
 
-	mutex_lock(&evtchnl->ring_io_lock);
-	req = be_stream_prepare_req(evtchnl, XENSND_OP_CLOSE);
-	mutex_unlock(&evtchnl->ring_io_lock);
+	scoped_guard(mutex, &evtchnl->ring_io_lock) {
+		req = be_stream_prepare_req(evtchnl, XENSND_OP_CLOSE);
+	}
 
 	ret = be_stream_do_io(evtchnl);
 
 	if (ret == 0)
 		ret = be_stream_wait_io(evtchnl);
 
-	mutex_unlock(&evtchnl->u.req.req_io_lock);
 	return ret;
 }
 
@@ -138,20 +135,19 @@ int xen_snd_front_stream_write(struct xen_snd_front_evtchnl *evtchnl,
 	struct xensnd_req *req;
 	int ret;
 
-	mutex_lock(&evtchnl->u.req.req_io_lock);
+	guard(mutex)(&evtchnl->u.req.req_io_lock);
 
-	mutex_lock(&evtchnl->ring_io_lock);
-	req = be_stream_prepare_req(evtchnl, XENSND_OP_WRITE);
-	req->op.rw.length = count;
-	req->op.rw.offset = pos;
-	mutex_unlock(&evtchnl->ring_io_lock);
+	scoped_guard(mutex, &evtchnl->ring_io_lock) {
+		req = be_stream_prepare_req(evtchnl, XENSND_OP_WRITE);
+		req->op.rw.length = count;
+		req->op.rw.offset = pos;
+	}
 
 	ret = be_stream_do_io(evtchnl);
 
 	if (ret == 0)
 		ret = be_stream_wait_io(evtchnl);
 
-	mutex_unlock(&evtchnl->u.req.req_io_lock);
 	return ret;
 }
 
@@ -161,20 +157,19 @@ int xen_snd_front_stream_read(struct xen_snd_front_evtchnl *evtchnl,
 	struct xensnd_req *req;
 	int ret;
 
-	mutex_lock(&evtchnl->u.req.req_io_lock);
+	guard(mutex)(&evtchnl->u.req.req_io_lock);
 
-	mutex_lock(&evtchnl->ring_io_lock);
-	req = be_stream_prepare_req(evtchnl, XENSND_OP_READ);
-	req->op.rw.length = count;
-	req->op.rw.offset = pos;
-	mutex_unlock(&evtchnl->ring_io_lock);
+	scoped_guard(mutex, &evtchnl->ring_io_lock) {
+		req = be_stream_prepare_req(evtchnl, XENSND_OP_READ);
+		req->op.rw.length = count;
+		req->op.rw.offset = pos;
+	}
 
 	ret = be_stream_do_io(evtchnl);
 
 	if (ret == 0)
 		ret = be_stream_wait_io(evtchnl);
 
-	mutex_unlock(&evtchnl->u.req.req_io_lock);
 	return ret;
 }
 
@@ -184,19 +179,18 @@ int xen_snd_front_stream_trigger(struct xen_snd_front_evtchnl *evtchnl,
 	struct xensnd_req *req;
 	int ret;
 
-	mutex_lock(&evtchnl->u.req.req_io_lock);
+	guard(mutex)(&evtchnl->u.req.req_io_lock);
 
-	mutex_lock(&evtchnl->ring_io_lock);
-	req = be_stream_prepare_req(evtchnl, XENSND_OP_TRIGGER);
-	req->op.trigger.type = type;
-	mutex_unlock(&evtchnl->ring_io_lock);
+	scoped_guard(mutex, &evtchnl->ring_io_lock) {
+		req = be_stream_prepare_req(evtchnl, XENSND_OP_TRIGGER);
+		req->op.trigger.type = type;
+	}
 
 	ret = be_stream_do_io(evtchnl);
 
 	if (ret == 0)
 		ret = be_stream_wait_io(evtchnl);
 
-	mutex_unlock(&evtchnl->u.req.req_io_lock);
 	return ret;
 }
 
diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
index 26d1b3987887..2fbed8e4a490 100644
--- a/sound/xen/xen_snd_front_evtchnl.c
+++ b/sound/xen/xen_snd_front_evtchnl.c
@@ -28,7 +28,7 @@ static irqreturn_t evtchnl_interrupt_req(int irq, void *dev_id)
 	if (unlikely(channel->state != EVTCHNL_STATE_CONNECTED))
 		return IRQ_HANDLED;
 
-	mutex_lock(&channel->ring_io_lock);
+	guard(mutex)(&channel->ring_io_lock);
 
 again:
 	rp = channel->u.req.ring.sring->rsp_prod;
@@ -80,7 +80,6 @@ static irqreturn_t evtchnl_interrupt_req(int irq, void *dev_id)
 		channel->u.req.ring.sring->rsp_event = i + 1;
 	}
 
-	mutex_unlock(&channel->ring_io_lock);
 	return IRQ_HANDLED;
 }
 
@@ -93,13 +92,13 @@ static irqreturn_t evtchnl_interrupt_evt(int irq, void *dev_id)
 	if (unlikely(channel->state != EVTCHNL_STATE_CONNECTED))
 		return IRQ_HANDLED;
 
-	mutex_lock(&channel->ring_io_lock);
+	guard(mutex)(&channel->ring_io_lock);
 
 	prod = page->in_prod;
 	/* Ensure we see ring contents up to prod. */
 	virt_rmb();
 	if (prod == page->in_cons)
-		goto out;
+		return IRQ_HANDLED;
 
 	/*
 	 * Assume that the backend is trusted to always write sane values
@@ -125,8 +124,6 @@ static irqreturn_t evtchnl_interrupt_evt(int irq, void *dev_id)
 	/* Ensure ring contents. */
 	virt_wmb();
 
-out:
-	mutex_unlock(&channel->ring_io_lock);
 	return IRQ_HANDLED;
 }
 
@@ -444,23 +441,23 @@ void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair
 	else
 		state = EVTCHNL_STATE_DISCONNECTED;
 
-	mutex_lock(&evt_pair->req.ring_io_lock);
-	evt_pair->req.state = state;
-	mutex_unlock(&evt_pair->req.ring_io_lock);
+	scoped_guard(mutex, &evt_pair->req.ring_io_lock) {
+		evt_pair->req.state = state;
+	}
 
-	mutex_lock(&evt_pair->evt.ring_io_lock);
-	evt_pair->evt.state = state;
-	mutex_unlock(&evt_pair->evt.ring_io_lock);
+	scoped_guard(mutex, &evt_pair->evt.ring_io_lock) {
+		evt_pair->evt.state = state;
+	}
 }
 
 void xen_snd_front_evtchnl_pair_clear(struct xen_snd_front_evtchnl_pair *evt_pair)
 {
-	mutex_lock(&evt_pair->req.ring_io_lock);
-	evt_pair->req.evt_next_id = 0;
-	mutex_unlock(&evt_pair->req.ring_io_lock);
+	scoped_guard(mutex, &evt_pair->req.ring_io_lock) {
+		evt_pair->req.evt_next_id = 0;
+	}
 
-	mutex_lock(&evt_pair->evt.ring_io_lock);
-	evt_pair->evt.evt_next_id = 0;
-	mutex_unlock(&evt_pair->evt.ring_io_lock);
+	scoped_guard(mutex, &evt_pair->evt.ring_io_lock) {
+		evt_pair->evt.evt_next_id = 0;
+	}
 }
 
-- 
2.50.1

