Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A3E426D3F
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311163; cv=none; b=uCrDxt8/q0q9Iv6tRUo7hVwceGOk/xcClcnynVyuss22u46g39gmJNfGvrkOh6k1seFpa9k+L+EZJFOjdOgk5KF9h7AVfw//yhbDH0XG/SzpPN0KnjoW91Wsw0fYiAZzW6iSZthZHN1pA7f/q1xL/1gsy12uGFuS1QnM/r9sbOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311163; c=relaxed/simple;
	bh=uCB0GcDiMSH3RYGTbeODy4CFA9aq/+EXlMqBdij8B64=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrUP4FGRYL9Lrq8KiEK4gBC9TFVJapFLFzqQb6RmCudr8FHxAhCLdAz+ZQ77ZCSXS1MKm6sEp85Hixy5H2Ua62XroiJSmIgpeYLOkt18/ZEJJ2iCFVYttETTgBdPR5uZKJI5PifhFahp8KazpPa1NIZHwbJKZzbp1icMEEelo+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uoTcPa5U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rmNrwO+x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IWvW4ttR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4prnIKje; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uoTcPa5U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rmNrwO+x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IWvW4ttR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4prnIKje"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F33D13E20;
	Wed, 29 Jul 2026 07:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tI1s0e2T2iKGpLV/gmjBqR9cWROLThM+WRLBJbROcK8=;
	b=uoTcPa5UAnqMUJQvCQqIZ6kGfTsmaWXPYMzT6N8Qd3mr3yheXq5sOQyybbqsCFinby5jV/
	KaXtNwVxKBi3tA5sRedie4oLl6e/HGX5DQ2Z+Y8t6yy8MV5ef8p+qaPXDFROK2kNcnd09S
	uL9Rk/RCIyzQLcdLyBZrf+yq8q2F1J8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tI1s0e2T2iKGpLV/gmjBqR9cWROLThM+WRLBJbROcK8=;
	b=rmNrwO+x1WF5EyRQipJXHYrOwLeoOvGy+HRZX7x+qgMJvM09hPOGxAF+nGzBsVWSGUUcMH
	ViVdRYDEdzqlhvDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IWvW4ttR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4prnIKje
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785311125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tI1s0e2T2iKGpLV/gmjBqR9cWROLThM+WRLBJbROcK8=;
	b=IWvW4ttR9dl8pwHXdwqphaenMNKY7vEyVXzOvoPBZ/l/TatMCjEFbd+gwr8uUIDZ/VPYKM
	wCv9pjkCJYRywpkA3YgZSndmqpuqbU/I/Nx+MwHrTzYQTfk+UYNx2SMyEn8g8/leqYyzU7
	VWJbQhA5TMlyiRVpIAgt+OPs7ZFF/js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785311125;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tI1s0e2T2iKGpLV/gmjBqR9cWROLThM+WRLBJbROcK8=;
	b=4prnIKje/4ilxvJJhFE3ri2BmIqlBP4Nv20OIwBaw7GcBYdpf8dGPMfB2hwJjOwHHbrn43
	u/NQqPM/gN79zkDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D54BE779B9;
	Wed, 29 Jul 2026 07:45:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MFzhMpWvaWolJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 07:45:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ALSA: docs: Add description of usb-audio playback_urb_fixup quirk
Date: Wed, 29 Jul 2026 09:45:16 +0200
Message-ID: <20260729074523.92761-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729074523.92761-1-tiwai@suse.de>
References: <20260729074523.92761-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: F33D13E20
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

We missed the description for the recently introduced quirk bit
QUIRK_FLAG_PLAYBACK_URB_FIXUP.  A brief explanation is added here.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/alsa-configuration.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index c4aef14a3147..b2171472e6cb 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2401,6 +2401,11 @@ quirk_flags
           disabling GET_CUR instead of the whole mixer. The current volume will
           then be provided by the internal cache that stores the last set
           volume
+        * bit 31: ``playback_urb_fixup``
+          Some devices show the stuttering at playback, and this quirk
+          works around it by enforcing the fixed max URBs (12) instead of
+          the dynamic calculation from the buffer size, and passing the
+          `URB_ISO_ASAP` URB flag.
 
 This module supports multiple devices, autoprobe and hotplugging.
 
-- 
2.55.0

