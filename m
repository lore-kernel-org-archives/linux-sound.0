Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276093EA9D
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708509976; cv=none; b=Cz5MXJfGYxQIUSb8lm6NdtwDj84ALAFJVFR772XA2ZTxVZqLRhpxG6zlqCYAOJOXiMcRkcSwltXy12ZM/ii9qgzWWyAZ9p0MEo+2FzSDP0ZDzGJ0kBL/257TRVozaBDfVVHD4g5JoS7TwjWhBjFANLFf7AwlSNB0++yuACjLbJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708509976; c=relaxed/simple;
	bh=pHWsqAxQR0TBRajeNJfNRxkI0rdBU5aFL1fePQAIqlg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qH4dmlOrfQx7NBBUxX/8rfvGEyVz9GFsRw5x2YWJeJCYRA0UeY/5TWJMM7kvsSHRiMATvDbBEjEDjJUZwiMYTpok7CXC8KDQpTHCOQmn4Tq7eW6IyHYy8wDqNwNTJa0J0nT71wZlLz/tbU6ZjE6vgdcv6B6hH5m9rMd47lS3gp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BdYCKK0L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rLeDyJbu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BdYCKK0L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rLeDyJbu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BdYCKK0L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rLeDyJbu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BdYCKK0L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rLeDyJbu"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 858491FB4A;
	Wed, 21 Feb 2024 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708509973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w48gr5J53ICOf5bqqCd5+7F6f+P2h884AcglklLqXPo=;
	b=BdYCKK0LEDDoa2hRjfq1hrghmX8ZEc2src6fk3FOXb6Epj9FMffk7HA3k3f9GOgh4MpjzA
	29f5xzeHqxGHmgq3gH4EPllSA55fNbNJ2SWpSWW8z5Tghb0a75N/DT9qyuzPgAzfHXJGa+
	Bj8oQQ5MGpmE0lDtsWUd77EdbN7eFbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708509973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w48gr5J53ICOf5bqqCd5+7F6f+P2h884AcglklLqXPo=;
	b=rLeDyJbuRQr3ziAJTxznlYywpozK+fp7S+KknezRPGPuSoEDW8GVuuCauipx9qub2cyWy8
	JCKtJE0PzkEhrYAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708509973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w48gr5J53ICOf5bqqCd5+7F6f+P2h884AcglklLqXPo=;
	b=BdYCKK0LEDDoa2hRjfq1hrghmX8ZEc2src6fk3FOXb6Epj9FMffk7HA3k3f9GOgh4MpjzA
	29f5xzeHqxGHmgq3gH4EPllSA55fNbNJ2SWpSWW8z5Tghb0a75N/DT9qyuzPgAzfHXJGa+
	Bj8oQQ5MGpmE0lDtsWUd77EdbN7eFbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708509973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w48gr5J53ICOf5bqqCd5+7F6f+P2h884AcglklLqXPo=;
	b=rLeDyJbuRQr3ziAJTxznlYywpozK+fp7S+KknezRPGPuSoEDW8GVuuCauipx9qub2cyWy8
	JCKtJE0PzkEhrYAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67FFC13A7C;
	Wed, 21 Feb 2024 10:06:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GO4YGBXL1WVIQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Feb 2024 10:06:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda: Downgrade BDL table overflow message
Date: Wed, 21 Feb 2024 11:06:07 +0100
Message-Id: <20240221100607.6565-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240221100607.6565-1-tiwai@suse.de>
References: <20240221100607.6565-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BdYCKK0L;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rLeDyJbu
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.30 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 R_MISSING_CHARSET(2.50)[];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.19)[70.67%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_ONE(0.00)[1];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: 3.30
X-Rspamd-Queue-Id: 858491FB4A
X-Spam-Flag: NO

When BDL table entry overflow happens, the driver spews an error
message explicitly.  But basically this condition can be triggered
easily by an application and it may flood of error logs
unnecessarily.

Downgrade the error message with dev_dbg() as a debug message
instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 610ea7a33cd8..b53de020309f 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -567,7 +567,7 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 	return 0;
 
  error:
-	dev_err(bus->dev, "Too many BDL entries: buffer=%d, period=%d\n",
+	dev_dbg(bus->dev, "Too many BDL entries: buffer=%d, period=%d\n",
 		azx_dev->bufsize, period_bytes);
 	return -EINVAL;
 }
-- 
2.35.3

