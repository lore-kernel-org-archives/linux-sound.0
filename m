Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7817117BB03
	for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007693; cv=none; b=nPX8CKQk5QklEqJ5Ovm/NwrziO8/XhkV4GuhwFSXVPCiXvCRHhjjpn/koq/Z7z7kR6WwGlT+a9AFEMbceELTCdzef6MZ4Jnaz409uRkr+bmuVqiZi9db1d4e5hPW/+3YAKNQrJltgFwDdU249Pp8y6oRoSIPyHyn5y4VfSYtIE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007693; c=relaxed/simple;
	bh=5ZsHMli+/VBT7LTPV5mtwDMCGNyHd09t9XDLqiluIls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btpJvB2QbQgMrvlbcQ0sNMOehYJBGeIlWW6ThJf2B9uWpR3kZEW3SvZSrtierJ8/V27WVAJ3WNVJaSXS5jY7TjhZfM03/Sktc+vpUhpS/2SRv3enKwkWs31gZGBuyzfXMuiZ0nh057vdYp/MOsnTlPhU0mSUlURabNQP/u8DlpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XsMrV2Vz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4dGGQFm1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XsMrV2Vz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4dGGQFm1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XsMrV2Vz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4dGGQFm1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XsMrV2Vz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4dGGQFm1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC23F21A1B;
	Fri, 26 Jul 2024 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722007689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K4Y+tAKMOwTgKV4vppb/DcXq09pQo2U6ZBV28izI1yc=;
	b=XsMrV2VzZ+5WGqacPdhQGKBIO36IVTbbotsYh35FpQgMzDj+8OQjR1OzCs0xdkh/cZm2HK
	x8qjemGIVcApTdXA71kQYp6kDJsEYIKiA6z6hjgBIaB/Z+hmwgRX2GhL2u6o4BL7Fx0xhc
	iRFJOMRZoLipwJ7ApIltq37b3Ainb3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722007689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K4Y+tAKMOwTgKV4vppb/DcXq09pQo2U6ZBV28izI1yc=;
	b=4dGGQFm11hb0mKLuAZIKBH2oHKhU/4Hnbfo9NtXyZpiYxnT/6HRqMn6csipS7DfnvfDgbY
	kCbeAioQxyI30JDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722007689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K4Y+tAKMOwTgKV4vppb/DcXq09pQo2U6ZBV28izI1yc=;
	b=XsMrV2VzZ+5WGqacPdhQGKBIO36IVTbbotsYh35FpQgMzDj+8OQjR1OzCs0xdkh/cZm2HK
	x8qjemGIVcApTdXA71kQYp6kDJsEYIKiA6z6hjgBIaB/Z+hmwgRX2GhL2u6o4BL7Fx0xhc
	iRFJOMRZoLipwJ7ApIltq37b3Ainb3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722007689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K4Y+tAKMOwTgKV4vppb/DcXq09pQo2U6ZBV28izI1yc=;
	b=4dGGQFm11hb0mKLuAZIKBH2oHKhU/4Hnbfo9NtXyZpiYxnT/6HRqMn6csipS7DfnvfDgbY
	kCbeAioQxyI30JDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB8051396E;
	Fri, 26 Jul 2024 15:28:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M058KInAo2YfMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jul 2024 15:28:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Gustavo A . R . Silva" <gustavo@embeddedor.com>
Subject: [PATCH] ALSA: control: Annotate snd_kcontrol with __counted_by()
Date: Fri, 26 Jul 2024 17:28:15 +0200
Message-ID: <20240726152840.8629-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
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
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.40

struct snd_kcontrol contains a flex array of snd_kcontrol_volatile
objects at its end, and the array size is stored in count field.
This can be annotated gracefully with __counted_by() for catching
possible array overflows.

One additional change is the order of the count field initialization;
The assignment of the count field is moved before assignment of vd[]
elements for avoiding false-positive warnings from compilers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This one seems out of Gustavo's radar.  I have no compiler that can
actually check this annotation, so it's a bit untested.

 include/sound/control.h | 2 +-
 sound/core/control.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index c1659036c4a7..13511c50825f 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -81,7 +81,7 @@ struct snd_kcontrol {
 	unsigned long private_value;
 	void *private_data;
 	void (*private_free)(struct snd_kcontrol *kcontrol);
-	struct snd_kcontrol_volatile vd[];	/* volatile data */
+	struct snd_kcontrol_volatile vd[] __counted_by(count);	/* volatile data */
 };
 
 #define snd_kcontrol(n) list_entry(n, struct snd_kcontrol, list)
diff --git a/sound/core/control.c b/sound/core/control.c
index f64a555f404f..c3aad64ffbf5 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -237,11 +237,11 @@ static int snd_ctl_new(struct snd_kcontrol **kctl, unsigned int count,
 	if (!*kctl)
 		return -ENOMEM;
 
+	(*kctl)->count = count;
 	for (idx = 0; idx < count; idx++) {
 		(*kctl)->vd[idx].access = access;
 		(*kctl)->vd[idx].owner = file;
 	}
-	(*kctl)->count = count;
 
 	return 0;
 }
-- 
2.43.0

