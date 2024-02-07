Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ABA80048
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321129; cv=none; b=G0TxxokIwMNlL+98uVC6v0UoyLDN0dzkoo92NA29CtAPjfztBAd/gDmVUo0tUHiWu49kRZ+mp8/tpZazGmrsUl0Fzn6O0itvPKt4sdo80bGV5eohnQSewGwiPvqIKBWgFmhXnfTaj7qX1ROPFtIyHyNQIeFthZTFiBFnD+Y86rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321129; c=relaxed/simple;
	bh=rTszBTSTZp3ezvcPYpCtkPre6eUqs/ETdFcNwwvxTAs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VcyTttVzCJtRbAiTHXOm4GAyGoC0AZUAfybyP83VX+I6D1lMLJhgMNdOIbNRU8kkX8LM7EXydrv8kRObUgUFp+mPb7Z2+fi7OghFqftuFfJVLpGwBJAsYiHxFqZO5u5pnmUedG1V/1HPEkdCebq36XfD5FR7Le6chh2FaWWLdJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DJfFTxY7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6AJK2/l6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DJfFTxY7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6AJK2/l6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DJfFTxY7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6AJK2/l6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DJfFTxY7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6AJK2/l6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8EFBF2233B;
	Wed,  7 Feb 2024 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jl5vFwEKDQH4SRKFEWfI7aT506q5QR8VeYf75bW0qW8=;
	b=DJfFTxY7wAc6RpmJWDP9d29o7uQfAfYZgvVX1u+xm2bBNdiuTX1WYQgfMawLsZliM2OfUv
	PliTNk9aLdITl1yFFkF7FNuR7+qnS3IJhCUuev76uMBO377TdkOFpj37D/C52YalvpbGmZ
	hUEyXIyN8/IX0XaqvSgSD2oV3ouWyb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jl5vFwEKDQH4SRKFEWfI7aT506q5QR8VeYf75bW0qW8=;
	b=6AJK2/l6kZddT0LLu4Sfvzi3fWvm10kw4ktBTLJnQODaWKr+1IsXiFHPegN/31X7TaZeH4
	hJUo0GsVYY52VRDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jl5vFwEKDQH4SRKFEWfI7aT506q5QR8VeYf75bW0qW8=;
	b=DJfFTxY7wAc6RpmJWDP9d29o7uQfAfYZgvVX1u+xm2bBNdiuTX1WYQgfMawLsZliM2OfUv
	PliTNk9aLdITl1yFFkF7FNuR7+qnS3IJhCUuev76uMBO377TdkOFpj37D/C52YalvpbGmZ
	hUEyXIyN8/IX0XaqvSgSD2oV3ouWyb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jl5vFwEKDQH4SRKFEWfI7aT506q5QR8VeYf75bW0qW8=;
	b=6AJK2/l6kZddT0LLu4Sfvzi3fWvm10kw4ktBTLJnQODaWKr+1IsXiFHPegN/31X7TaZeH4
	hJUo0GsVYY52VRDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72A05139D8;
	Wed,  7 Feb 2024 15:52:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aC6LGiKnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 29/29] ALSA: doc: Use DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:40 +0100
Message-Id: <20240207155140.18238-30-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207155140.18238-1-tiwai@suse.de>
References: <20240207155140.18238-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[22.82%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for the example code.  This allows us to drop CONFIG_PM_SLEEP ifdefs.

While we're at it, expand the driver definition instead of passing
directly via .driver.pm field.  This seems to be a more common
pattern.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index cd421856409e..2d2998faff62 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3864,14 +3864,16 @@ corresponding destructor.
 
 And next, set suspend/resume callbacks to the pci_driver::
 
-  static SIMPLE_DEV_PM_OPS(snd_my_pm_ops, mychip_suspend, mychip_resume);
+  static DEFINE_SIMPLE_DEV_PM_OPS(snd_my_pm_ops, mychip_suspend, mychip_resume);
 
   static struct pci_driver driver = {
           .name = KBUILD_MODNAME,
           .id_table = snd_my_ids,
           .probe = snd_my_probe,
           .remove = snd_my_remove,
-          .driver.pm = &snd_my_pm_ops,
+          .driver = {
+                  .pm = &snd_my_pm_ops,
+          },
   };
 
 Module Parameters
-- 
2.35.3

