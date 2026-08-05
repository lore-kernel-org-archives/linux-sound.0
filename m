Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530BC4756AA
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938004; cv=none; b=llmlpzCQkK51U429A2tZRFUFLDL3fnVBP/N35TH6Qkij1Olkpt3eg2Jer3shwDn65pynGqlHoxJdwMh5y3EG2v/jjbyiXfY44Ydq0YRy6K88memuB0dFCpbtAMDX3s/jOLjtRh/vcy2ndvcVEoieh0xhaSqO4ZbkQsvUXm81Wgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938004; c=relaxed/simple;
	bh=25USWmJlnb9NCRoXLqoIPspqGqFKLcCMEbGEEwBdhCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5hKVK8R9joKTt9Jr1rH5OJCkN9af+v4cFdmBHhErXjJQlkZpM8S6BNSJvwPXUjiyGAkdtLD+qEd/jOMqWip+83cKdBb6fY/6wcA05z2j/3r3O1YihqFc2ldDKHPgNwZziiE39cnZUOO3QfSNSuMRV9i/77CwaOBVB+JsPxN5ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TI94D6bu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M/Op3TKu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XtlcsHhW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OYfIX37Z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TI94D6bu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M/Op3TKu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XtlcsHhW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OYfIX37Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3ECBF3DF2;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FbRNtjhPnACz8YiXLvL9+GIkcR4T2izOTbPgWsY0Og=;
	b=TI94D6buuK5FrxUTHhixDemw9UO0TctctwFlVVMksWU4gdrFCeLveNhuCL1mFwzZOq5/g0
	PRDki497Wmg17jjyPwXQvPCzUWahXXOH3xRsPARsQXTsObPg0/4YTTPT9QXEzyolDDYRBT
	7h0OdlPvelWCHXC4NC2Pl5Y/8IXVWwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FbRNtjhPnACz8YiXLvL9+GIkcR4T2izOTbPgWsY0Og=;
	b=M/Op3TKur77gYLyWUEZu/s9O4prij3krXN4jIDpmIJlL6QZgXRMC6D/rdH2REpi25Ruqv4
	9uWgdA9t+qnExRDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XtlcsHhW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OYfIX37Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FbRNtjhPnACz8YiXLvL9+GIkcR4T2izOTbPgWsY0Og=;
	b=XtlcsHhW6XT/e+nzwBbGxtqgIYgAmtF+RxACKRJPUSaDGvqn+LuTVBjJ9rYmpkxaHN0mRz
	e2cy9s+35eFT6OWc2H36rk/RhJZUCsiLgtYPWtzOkvrQdOblsTLUpdcgQdNA3Q8cHcv9R+
	ALyw90is+bznSF09+/FJn3Xik1/oQbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+FbRNtjhPnACz8YiXLvL9+GIkcR4T2izOTbPgWsY0Og=;
	b=OYfIX37ZLLHHeo10++mJPqxxBkwLVgKL5bgwRjbnoJ+N6Re3ULI45c0pieGnxN8Fo4jkz9
	I4IBalb/PvzDlZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28CAD779FB;
	Wed,  5 Aug 2026 13:52:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2M/gCDpAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Kiseok Jo <kiseok.jo@irondevice.com>
Subject: [PATCH 18/31] ASoC: sma1307: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:19 +0200
Message-ID: <20260805135247.670693-19-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 3ECBF3DF2
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[irondevice.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Kiseok Jo <kiseok.jo@irondevice.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/sma1307.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index c52fe95b30c6..adb369a29b9d 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -1690,7 +1690,7 @@ static void sma1307_check_fault_worker(struct work_struct *work)
 
 static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *file)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int size, offset, num_mode;
 	int ret;
 
@@ -1703,22 +1703,18 @@ static void sma1307_setting_loaded(struct sma1307_priv *sma1307, const char *fil
 		return;
 	} else if ((fw->size) < SMA1307_SETTING_HEADER_SIZE) {
 		dev_err(sma1307->dev, "%s: Invalid file\n", __func__);
-		release_firmware(fw);
 		sma1307->set.status = false;
 		return;
 	}
 
 	int *data __free(kfree) = kzalloc(fw->size, GFP_KERNEL);
 	if (!data) {
-		release_firmware(fw);
 		sma1307->set.status = false;
 		return;
 	}
 	size = fw->size >> 2;
 	memcpy(data, fw->data, fw->size);
 
-	release_firmware(fw);
-
 	/* HEADER */
 	sma1307->set.header_size = SMA1307_SETTING_HEADER_SIZE;
 	sma1307->set.checksum = data[sma1307->set.header_size - 2];
-- 
2.55.0

