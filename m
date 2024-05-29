Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B69225AE
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717001229; cv=none; b=nZz/DblTBRtogA4kln1/G6d5cLzPCXaJr19YDFMIeq6GB/Mu/GA896KHTZiCvXnu/BF+krRij+LNx1ckHl176GANDvojUoLp9K7WmzPM6cWAS4PlzEZv1YVl1ppkSuk3OhUB8lKB6c88WdqX7dpqiRkqK9XDpd0FTvsrhxksIXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717001229; c=relaxed/simple;
	bh=2oPyGU7MmETJ97qX39Mbq7f4qy59GsaQAxZKNirJcVw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ScuBWhYSLNcxTwaTR/f3mHWZ4CgoBQ8hfiAk7LoDQPO3160Filuhk9U8rY5w4pZbH8V0XToZWPXc1O2Z+5CViWViLT87MKcl94vkPgCIdIqSjsqIWv+IbeE1JmNOJ3haKLhC/KGPI2pA+D4jJyx7r+a0WnjKFrTkxGtqxRwbleI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tr0+Esxl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CbqS763e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MyNmtyky; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pjwfFPD9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tr0+Esxl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CbqS763e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MyNmtyky";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pjwfFPD9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C5C45205BE;
	Wed, 29 May 2024 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717001226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dvJ7Ddwjh9tWQb6Tsb4IqunQ0Llr9mIm6SRfZGcsSz4=;
	b=tr0+Esxl80YrkJVAhP8d+SM5+6g33F2TilFmO5LL5BSczkakzBnRN8m7XsuwhX4EIw36bh
	jVockYwcjsT7zll/iRATtORW4tOfUGcJA/9dnwB3+vnkYfdLKVRv/FljSKm3cGFa4ExsRZ
	HkPWEoinqvK68LgDUTbXJuJMBXCkrjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717001226;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dvJ7Ddwjh9tWQb6Tsb4IqunQ0Llr9mIm6SRfZGcsSz4=;
	b=CbqS763ecAiuFsxzCaPAJy3I8ZaefHPyiL9Kh2lmBgeYspnKy2Q4PhYF0rdzJNd5IsHTBj
	nQrq7rMv1OM/YsDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717001224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dvJ7Ddwjh9tWQb6Tsb4IqunQ0Llr9mIm6SRfZGcsSz4=;
	b=MyNmtykygpBr4y2nWfgI2z3z/q99vOAq/EFmkV/LeKEdTdolhd8B7+RVc930q1v6sr3Smb
	uG4SS7J6c1t7Yg3K0eAnjNd/oKGXI81BfdqQX83RY1GdV9w6EIg6ak0MJ73PF7QTz6u8MD
	P7oxcW+OhgSPptejK2eZ9gHf4EQbLkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717001224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dvJ7Ddwjh9tWQb6Tsb4IqunQ0Llr9mIm6SRfZGcsSz4=;
	b=pjwfFPD9l+4Chz3eRkWVFxB2ZAtJ1fqN9m8aS7V66A6NLdKCtSI82U41LbQnhZdpm5Gjqy
	OAPXr8hjdVGGiFDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA0D71372E;
	Wed, 29 May 2024 16:47:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P0VGKAhcV2bUDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 May 2024 16:47:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 1/2] ALSA: ump: Don't accept an invalid UMP protocol number
Date: Wed, 29 May 2024 18:47:16 +0200
Message-ID: <20240529164723.18309-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.77 / 50.00];
	BAYES_HAM(-2.97)[99.88%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.77
X-Spam-Flag: NO

When a UMP Stream Configuration message is received, the driver tries
to switch the protocol, but there was no sanity check of the protocol,
hence it can pass an invalid value.  Add the check and bail out if a
wrong value is passed.

Fixes: a79807683781 ("ALSA: ump: Add helper to change MIDI protocol")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Fix the line dropped mistakenly in v1 patch

 sound/core/ump.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index fd6a68a54278..117c7ecc4856 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -685,10 +685,17 @@ static void seq_notify_protocol(struct snd_ump_endpoint *ump)
  */
 int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol)
 {
+	unsigned int type;
+
 	protocol &= ump->info.protocol_caps;
 	if (protocol == ump->info.protocol)
 		return 0;
 
+	type = protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI_MASK;
+	if (type != SNDRV_UMP_EP_INFO_PROTO_MIDI1 &&
+	    type != SNDRV_UMP_EP_INFO_PROTO_MIDI2)
+		return 0;
+
 	ump->info.protocol = protocol;
 	ump_dbg(ump, "New protocol = %x (caps = %x)\n",
 		protocol, ump->info.protocol_caps);
-- 
2.43.0

