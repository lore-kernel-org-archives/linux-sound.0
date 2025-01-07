Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B658F1EE7BB
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265419; cv=none; b=L2ycN+/2mh8Wv1gF9yeLdpq12d8ze5Ot/3S4Nl0al5VpjQXbpk/6AD4AQeqJi341p8R40zNYsFYVW5eC/M48omsx5QRXwM/pR0Y2zTvQZK38smbDI/WSTD3u3lz3CF65mm0PgBvyDJYIExp12AZtjNV/6YKdP4cC0QCaAet+Sdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265419; c=relaxed/simple;
	bh=ZegdAIqFKW2jEgQ7GqJc2P0uQKVc45beuHCj+TFuhEc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTUE5lFd3qL8kD7imfts1ahAikTZ2QWX9pAbhjoSb+Ba/8j1LLorUkkgo7TWgq5gkCr71RDCYAio0Sx2lkherG8kWG1QO/VGRHt61NX09JuP0slmqVqe88dIqUF6vlwkVPEkfnPNRgKX83Y1+2z6MufoPXtDKGf/imQZgcTnYhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=te86+g+m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BtAlS4vj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=te86+g+m; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BtAlS4vj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="te86+g+m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BtAlS4vj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="te86+g+m";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BtAlS4vj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 141AD21133;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rezG/It3Zg1CYWIxSo60TVo/IQwS0w1r98HDwwCLATU=;
	b=te86+g+mAfxukRj62PMOwfkYjXaaYhtzZzSD5fVy39v7c8Q9yTET6NYapvniok7Jel/OqU
	6ERxJsZXuhxSIKMYSNf7y7PK++T2ahVGRxikZbqSrUEYRmrkPFU46On/vpJL09yVMtE75i
	N2svRVSf9Co2YUUKvuzYXfGzZRGWYKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rezG/It3Zg1CYWIxSo60TVo/IQwS0w1r98HDwwCLATU=;
	b=BtAlS4vjdu6chzzVKlk+2/8qvU52lmkpVuofc4UbSUFsrK9E2QZthE9DB3DLL+8Jdl65k1
	RH6kQHRvZEgWAzBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=te86+g+m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BtAlS4vj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rezG/It3Zg1CYWIxSo60TVo/IQwS0w1r98HDwwCLATU=;
	b=te86+g+mAfxukRj62PMOwfkYjXaaYhtzZzSD5fVy39v7c8Q9yTET6NYapvniok7Jel/OqU
	6ERxJsZXuhxSIKMYSNf7y7PK++T2ahVGRxikZbqSrUEYRmrkPFU46On/vpJL09yVMtE75i
	N2svRVSf9Co2YUUKvuzYXfGzZRGWYKw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rezG/It3Zg1CYWIxSo60TVo/IQwS0w1r98HDwwCLATU=;
	b=BtAlS4vjdu6chzzVKlk+2/8qvU52lmkpVuofc4UbSUFsrK9E2QZthE9DB3DLL+8Jdl65k1
	RH6kQHRvZEgWAzBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E168313ABF;
	Tue,  7 Jan 2025 15:56:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iE5ENcZOfWfNUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 15:56:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/7] ALSA: sonicvibes: Simplify with str_off_on()
Date: Tue,  7 Jan 2025 16:56:32 +0100
Message-ID: <20250107155641.4435-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107155641.4435-1-tiwai@suse.de>
References: <20250107155641.4435-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 141AD21133
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the standard helper str_off_on() to simplify the code.
Only code refactoring, no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/sonicvibes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index e510715a6c95..c30eaf1038e7 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1118,7 +1118,7 @@ static void snd_sonicvibes_proc_read(struct snd_info_entry *entry,
 
 	tmp = sonic->srs_space & 0x0f;
 	snd_iprintf(buffer, "SRS 3D           : %s\n",
-		    sonic->srs_space & 0x80 ? "off" : "on");
+		    str_off_on(sonic->srs_space & 0x80));
 	snd_iprintf(buffer, "SRS Space        : %s\n",
 		    tmp == 0x00 ? "100%" :
 		    tmp == 0x01 ? "75%" :
-- 
2.43.0

