Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E861A270ECD
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613073; cv=none; b=Vp6cJ8GM8NjC70uc1pEu+EHjsYiBpaiWOmNTii3KbgC4WFE6l2M9tr7N+vbfO+UC9Y5b+ou2C44+HPbm5VB3fG/fdEIBbUZx9+FfE45kTbIkxb9rdg/7KNSaf4WGAsiyOW4wWeBnfCmuayraR02Q8qbgfbiaVyVzTYiMu4N2zk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613073; c=relaxed/simple;
	bh=IbS5Wya6yvXm1/oQ0FTP5jj3TQZkyJL714G1fQgggfU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=RzP/WB7io4UgCtQBioWFjA/4INoHBODdMGP9k3vPoWLSpm99QPVeEawvabFDe7ImIplf1xlrLkQ3Z/H1x/ns16P0yVUDWwDPaHjjo3hID+fd1bMW7lVuezSCK1vRzNYU4Qy5oieAkzhei5yswgvuFh955Z4HIGSvjDVZHBCzaCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iqQ/bLNu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hYcvdZid; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G/jUQJ8y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XzDq+zhF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iqQ/bLNu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hYcvdZid";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G/jUQJ8y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XzDq+zhF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D39071F385;
	Fri,  4 Jul 2025 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751613070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Iu4ZyKgBCsKcYxyDfT6Oh/lhlBNNs2+YC4KXlC8SgE=;
	b=iqQ/bLNuVGrw12so6EMig8KGq0HGs4OwJH55n41JgBsAJT8FXcTR9n4sBjcUmiM6AjkGNG
	Fnme4/kx8tpcYg8iyrefpjc9H0ku4kEQ/YQ8T2rip2S7mcF9IPH+e639Jne8Xef+JQAYeS
	v4DdLOl2KtvSQGOizXaOIdDs2zchXa8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751613070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Iu4ZyKgBCsKcYxyDfT6Oh/lhlBNNs2+YC4KXlC8SgE=;
	b=hYcvdZidyeX3tKJ+KxgJJFop4RsF27SKKv1o+3A0o6WMH2TPL4B6h0NKMlcHHSInzJd788
	bTqe9QvYe02YCSDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="G/jUQJ8y";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XzDq+zhF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751613069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Iu4ZyKgBCsKcYxyDfT6Oh/lhlBNNs2+YC4KXlC8SgE=;
	b=G/jUQJ8yPuG2kPDPD2jia8VAjHhInmBtMK14w6Nj1lk4sqSYntN2wc821fP8SF+UxI/o0K
	IimR1Vax534+OYZ4BXsC4KfJ+6+J1buAZ+cwhbNbyn6ENnu2l+CjZKR7++/cDa/3f5ouGN
	YsKuYGo7SIGReFyaX8SkrNODnT01ETg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751613069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Iu4ZyKgBCsKcYxyDfT6Oh/lhlBNNs2+YC4KXlC8SgE=;
	b=XzDq+zhFK+80Gmv1jR3jNiRu3n5CU5loFywqSILBjxyn+mkDLrLwaXiwNpjIr5i+H+RJYB
	/OcAGrTZKQwIPIDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B147813757;
	Fri,  4 Jul 2025 07:11:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ShX4KY1+Z2jveAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 04 Jul 2025 07:11:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Add device entry for QEMU
Date: Fri,  4 Jul 2025 09:11:06 +0200
Message-ID: <20250704071107.14626-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D39071F385
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

QEMU HD-audio device (1af4:0021) is handled by the generic HD-audio
codec driver, hence it's better to have an explicit device ID listing,
so that we can avoid the superfluous vendor driver matching.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index b34d84fedcc8..2a28c8b6ba55 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -6144,6 +6144,7 @@ static int snd_hda_parse_generic_codec(struct hda_codec *codec)
 }
 
 static const struct hda_device_id snd_hda_id_generic[] = {
+	HDA_CODEC_ENTRY(0x1af40021, "Generic", snd_hda_parse_generic_codec), /* QEMU */
 	HDA_CODEC_ENTRY(HDA_CODEC_ID_GENERIC, "Generic", snd_hda_parse_generic_codec),
 	{} /* terminator */
 };
-- 
2.50.0

