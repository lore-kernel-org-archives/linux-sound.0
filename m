Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FA53209
	for <linux-sound@vger.kernel.org>; Wed,  1 Jan 2025 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735736159; cv=none; b=A1UyxT9aYTxxtIJHiGH9TRAEpV1nEgFl2g+VYqQPepvdtoeyIHWHzu7lklnDnLnbYg7MTo6n9stCqI0fkVeif1766ek10BfSs6VkCt2sDFbAxYYCW8fkIZcc4cU6hYgqMSqQeNZJNnd/NF77iS+02EXVxBRhkm+n32+AI5+MBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735736159; c=relaxed/simple;
	bh=B2h9PtHukrtlxJuSKoKWnZekV5CkNOwX50YPInXc4uQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=bIHmG5+m8TAMtb+K7+eGB+b9ZiVdKM5maOkyO3ctA+OBF6gW2co/TVmMppS7sThSY09+CCYKfhaqOCuPI2CKjVjD5l7IhJZA0OSplQojcYSrdHcPPpPR9zKiqmuxDEbm2t7g+oderwA/BD/tm2Evu6AodE0ZuiOPGppbpdL+nSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D3VW9YO9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0sJQ7NgX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D3VW9YO9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0sJQ7NgX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D3VW9YO9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0sJQ7NgX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D3VW9YO9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0sJQ7NgX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1FCF81F37C;
	Wed,  1 Jan 2025 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735736156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OeBE2HloL2YgswpCjtQCLIeqfm+bsPNReRM8LFg7GVc=;
	b=D3VW9YO96ehaBAN3XOv0WQhsUNr2CLB9/gVWTxWiJpofXM9FFSrxCCJIk2UZiXQ2QdrJRs
	j62uSmzYjYbCJeuvAci3yCIkFJaG6DXuRgVdkpKRUt45xQR0f77Sgju1l2J6APMh2laJAS
	bADiW8WBXlG7qsF3y99vEFW6xaMih54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735736156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OeBE2HloL2YgswpCjtQCLIeqfm+bsPNReRM8LFg7GVc=;
	b=0sJQ7NgX8OCU0YHz1uCCc4NpPBkTaNO7i+B0nWB8z73Jt/gXCx5FYcVtuagv+HrCojtIEu
	6x2xhi7IMAe0oFDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735736156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OeBE2HloL2YgswpCjtQCLIeqfm+bsPNReRM8LFg7GVc=;
	b=D3VW9YO96ehaBAN3XOv0WQhsUNr2CLB9/gVWTxWiJpofXM9FFSrxCCJIk2UZiXQ2QdrJRs
	j62uSmzYjYbCJeuvAci3yCIkFJaG6DXuRgVdkpKRUt45xQR0f77Sgju1l2J6APMh2laJAS
	bADiW8WBXlG7qsF3y99vEFW6xaMih54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735736156;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OeBE2HloL2YgswpCjtQCLIeqfm+bsPNReRM8LFg7GVc=;
	b=0sJQ7NgX8OCU0YHz1uCCc4NpPBkTaNO7i+B0nWB8z73Jt/gXCx5FYcVtuagv+HrCojtIEu
	6x2xhi7IMAe0oFDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0202913A30;
	Wed,  1 Jan 2025 12:55:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aq/OOls7dWcLUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Jan 2025 12:55:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Make dependency on UMP clearer
Date: Wed,  1 Jan 2025 13:55:47 +0100
Message-ID: <20250101125548.25961-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

CONFIG_SND_SEQ_UMP_CLIENT is a Kconfig for a sequencer client
corresponding to the UMP rawmidi, while we have another major knob
CONFIG_SND_SEQ_UMP that specifies whether the sequencer core supports
UMP packets or not.  Strictly speaking both of them are independent,
but practically seen, it makes no sense to enable
CONFIG_SND_SEQ_UMP_CLIENT without UMP support itself.

This patch makes such an implicit dependency clearer.  Now
CONFIG_SND_SEQ_UMP_CLIENT depends on both CONFIG_SND_UMP and
CONFIG_SND_SEQ_UMP.  Meanwhile, CONFIG_SND_SEQ_UMP is enabled as
default when CONFIG_SND_UMP is set.

Fixes: 81fd444aa371 ("ALSA: seq: Bind UMP device")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/Kconfig b/sound/core/seq/Kconfig
index 0374bbf51cd4..e4f58cb985d4 100644
--- a/sound/core/seq/Kconfig
+++ b/sound/core/seq/Kconfig
@@ -62,7 +62,7 @@ config SND_SEQ_VIRMIDI
 
 config SND_SEQ_UMP
 	bool "Support for UMP events"
-	default y if SND_SEQ_UMP_CLIENT
+	default SND_UMP
 	help
 	  Say Y here to enable the support for handling UMP (Universal MIDI
 	  Packet) events via ALSA sequencer infrastructure, which is an
@@ -71,6 +71,6 @@ config SND_SEQ_UMP
 	  among legacy and UMP clients.
 
 config SND_SEQ_UMP_CLIENT
-	def_tristate SND_UMP
+	def_tristate SND_UMP && SND_SEQ_UMP
 
 endif # SND_SEQUENCER
-- 
2.43.0

