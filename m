Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F41F322773
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480486; cv=none; b=NY9S1mkv+vUtmXIAR6fFBUhBaIMkqhEOESV5XO1lI7H2yzWkTx/6kYAGCaLBcQ8KrhqZlRieHKDWg4zV4UWLs/pjvm6TpC3E4vZ//5vwVYzPfFndnUjNzm+aCJUMTUYPeQcu40K8C1EVhxZDHicv+hSTN52xmtNJ6+6N2ImSOqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480486; c=relaxed/simple;
	bh=wwUQtbFpbRd8mfxNIcuV+HeyqjGF0xUZLUVu9KAu8LY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMoqvbZsdL6bHmB+DO2MkVsKItdd01Y2Xlcs+LJ1KTZToP6jS401ngBLPVCCFw9BfXHfwdC1KyMkv82oFzronL3/ju6+JPCKjobZCphJiwkBfZVzEWymhcpzq0lJEge+DYk4ICcih6br4K85zkgAcoijwtxVOoxOxbfVcFRC77I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nx2GJAzr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bKNdsCwg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nx2GJAzr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bKNdsCwg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nx2GJAzr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bKNdsCwg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nx2GJAzr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bKNdsCwg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 932885C270;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DNTCjT122CltVktNQxP2TJ7CacYAl1POK4v68WmR+8=;
	b=Nx2GJAzr7nDXrs5iwA5QjQKsVA4i+ljAAzOFKkrUkbtxWYo0qV4fxVhSlqTOjIADwHMskt
	9v2RW4zNIq7QhJ8/vTKL93t77W2FCf67M9+6KBExbkYkXKBfI0GwalL8hYLNhPjX+ffVKT
	i1rOoDAd+x+1/W4+Tqr4JAHDpOSOjNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DNTCjT122CltVktNQxP2TJ7CacYAl1POK4v68WmR+8=;
	b=bKNdsCwgH8bCYTIKRwdu2wAPQS/pIVTzc8rl0IcGeSGzUmBgYIXPeAYc7z2wljG7c0lOAB
	qjZFWScRhIJcgQAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Nx2GJAzr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bKNdsCwg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DNTCjT122CltVktNQxP2TJ7CacYAl1POK4v68WmR+8=;
	b=Nx2GJAzr7nDXrs5iwA5QjQKsVA4i+ljAAzOFKkrUkbtxWYo0qV4fxVhSlqTOjIADwHMskt
	9v2RW4zNIq7QhJ8/vTKL93t77W2FCf67M9+6KBExbkYkXKBfI0GwalL8hYLNhPjX+ffVKT
	i1rOoDAd+x+1/W4+Tqr4JAHDpOSOjNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DNTCjT122CltVktNQxP2TJ7CacYAl1POK4v68WmR+8=;
	b=bKNdsCwgH8bCYTIKRwdu2wAPQS/pIVTzc8rl0IcGeSGzUmBgYIXPeAYc7z2wljG7c0lOAB
	qjZFWScRhIJcgQAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7949713A54;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sFNiHKfDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 17/19] ALSA: ac97bus: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:31 +0200
Message-ID: <20250829151335.7342-18-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 932885C270
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/ac97/bus.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/ac97/bus.c b/sound/ac97/bus.c
index 47c6787158a7..f4254703d29f 100644
--- a/sound/ac97/bus.c
+++ b/sound/ac97/bus.c
@@ -241,10 +241,9 @@ static ssize_t cold_reset_store(struct device *dev,
 {
 	struct ac97_controller *ac97_ctrl;
 
-	mutex_lock(&ac97_controllers_mutex);
+	guard(mutex)(&ac97_controllers_mutex);
 	ac97_ctrl = to_ac97_controller(dev);
 	ac97_ctrl->ops->reset(ac97_ctrl);
-	mutex_unlock(&ac97_controllers_mutex);
 	return len;
 }
 static DEVICE_ATTR_WO(cold_reset);
@@ -258,10 +257,9 @@ static ssize_t warm_reset_store(struct device *dev,
 	if (!dev)
 		return -ENODEV;
 
-	mutex_lock(&ac97_controllers_mutex);
+	guard(mutex)(&ac97_controllers_mutex);
 	ac97_ctrl = to_ac97_controller(dev);
 	ac97_ctrl->ops->warm_reset(ac97_ctrl);
-	mutex_unlock(&ac97_controllers_mutex);
 	return len;
 }
 static DEVICE_ATTR_WO(warm_reset);
@@ -284,10 +282,10 @@ static const struct attribute_group *ac97_adapter_groups[] = {
 
 static void ac97_del_adapter(struct ac97_controller *ac97_ctrl)
 {
-	mutex_lock(&ac97_controllers_mutex);
-	ac97_ctrl_codecs_unregister(ac97_ctrl);
-	list_del(&ac97_ctrl->controllers);
-	mutex_unlock(&ac97_controllers_mutex);
+	scoped_guard(mutex, &ac97_controllers_mutex) {
+		ac97_ctrl_codecs_unregister(ac97_ctrl);
+		list_del(&ac97_ctrl->controllers);
+	}
 
 	device_unregister(&ac97_ctrl->adap);
 }
@@ -311,7 +309,7 @@ static int ac97_add_adapter(struct ac97_controller *ac97_ctrl)
 {
 	int ret;
 
-	mutex_lock(&ac97_controllers_mutex);
+	guard(mutex)(&ac97_controllers_mutex);
 	ret = idr_alloc(&ac97_adapter_idr, ac97_ctrl, 0, 0, GFP_KERNEL);
 	ac97_ctrl->nr = ret;
 	if (ret >= 0) {
@@ -322,13 +320,11 @@ static int ac97_add_adapter(struct ac97_controller *ac97_ctrl)
 		if (ret)
 			put_device(&ac97_ctrl->adap);
 	}
-	if (!ret)
+	if (!ret) {
 		list_add(&ac97_ctrl->controllers, &ac97_controllers);
-	mutex_unlock(&ac97_controllers_mutex);
-
-	if (!ret)
 		dev_dbg(&ac97_ctrl->adap, "adapter registered by %s\n",
 			dev_name(ac97_ctrl->parent));
+	}
 	return ret;
 }
 
-- 
2.50.1

