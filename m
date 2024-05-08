Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AD874407
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159481; cv=none; b=W9gWcanBKYCFzWxWX03pnnnreDBzcPbGJdoLjzGWaqP+rqkTthGCOWhlVMF4E7qqtCZb8myOCD2rw/8IW9AW4zES9e0ht3hbc89j8qEdcowJhNQSiRzzDJOxAe67H2/fpnxOqEtlH3n5Be/2d7z3gZP+XBmnsTcQxQT3rMfAUOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159481; c=relaxed/simple;
	bh=N15F+znoo1xMfgc6voejD3F0WpTqS7eaMX6d4wOvoDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZGOHlg7vBQOt3flB1luCI+K1XYCHUyqY9EE36nnyuDIz+wJYPaPNmmRLgP9OEQtwAVgLiQ5DYluHjeWhvMTwQrU4DWBGdiythGS2eVo3V+q500HghgtHcRHj8Ov+aOx0KYa5hYEqUytMRpl9Zz/TpyTNHtMkoeuFkzI/ReGgggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CZQ0Uckc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6Vs3I6LL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CZQ0Uckc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6Vs3I6LL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CZQ0Uckc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Vs3I6LL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CZQ0Uckc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Vs3I6LL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 38B3E5C6FB;
	Wed,  8 May 2024 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nk88BkjqRIgmIR3q6UKgfL8C+58LZlPO12CmmwleDM=;
	b=CZQ0Uckczrq+DexRqm7E4DFOmUyxft4NPEmovZKPdytpZ3LrBG2BGPyghn5IeP/juVGIjH
	nVogiRLjFhMcyH9h+8rqonvVouNPgKyua9ZO+IKZL6DZYVwZPzSgjbTgV6V4NFzRB7PtM5
	74kPqJn4x1iIbzmpA7wr5adAZb/6TdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nk88BkjqRIgmIR3q6UKgfL8C+58LZlPO12CmmwleDM=;
	b=6Vs3I6LLSLbyezylbtU05YKQcKDnyX4D4lzVoHi1ICQvS2g64a/6RuspOab9i8KBeNth4S
	DcSX8s+fIDmM6WCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nk88BkjqRIgmIR3q6UKgfL8C+58LZlPO12CmmwleDM=;
	b=CZQ0Uckczrq+DexRqm7E4DFOmUyxft4NPEmovZKPdytpZ3LrBG2BGPyghn5IeP/juVGIjH
	nVogiRLjFhMcyH9h+8rqonvVouNPgKyua9ZO+IKZL6DZYVwZPzSgjbTgV6V4NFzRB7PtM5
	74kPqJn4x1iIbzmpA7wr5adAZb/6TdY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nk88BkjqRIgmIR3q6UKgfL8C+58LZlPO12CmmwleDM=;
	b=6Vs3I6LLSLbyezylbtU05YKQcKDnyX4D4lzVoHi1ICQvS2g64a/6RuspOab9i8KBeNth4S
	DcSX8s+fIDmM6WCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19D5F13A27;
	Wed,  8 May 2024 09:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6ErrBLZBO2YcFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:11:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6/7] ALSA: hda: cirrus_scodec_test: Add missing module descriptions
Date: Wed,  8 May 2024 11:11:25 +0200
Message-ID: <20240508091128.25274-7-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091128.25274-1-tiwai@suse.de>
References: <20240508091128.25274-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.47
X-Spam-Level: 
X-Spamd-Result: default: False [-2.47 / 50.00];
	BAYES_HAM(-2.67)[98.55%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_TLS_ALL(0.00)[]

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/cirrus_scodec_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
index 8ae373676bd1..e925ebe21ccb 100644
--- a/sound/pci/hda/cirrus_scodec_test.c
+++ b/sound/pci/hda/cirrus_scodec_test.c
@@ -366,5 +366,6 @@ static struct kunit_suite cirrus_scodec_test_suite = {
 kunit_test_suite(cirrus_scodec_test_suite);
 
 MODULE_IMPORT_NS(SND_HDA_CIRRUS_SCODEC);
+MODULE_DESCRIPTION("KUnit test for the Cirrus side-codec library");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0

