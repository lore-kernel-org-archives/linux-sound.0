Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8445C84DF1
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 09:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723108462; cv=none; b=hqyjQW+NHwdUSA5969sUO4AFaAAIrzIFy+P+0FMFqFIQANlYc7UxesHw90ukenZjby3MYf6cVaiJqCIOGfJZGtQ4ZCSbI5dcBVK6SIQ+wb9t1vDp8vJ+EnAiT5hZA7HPVqGm4PLaIwDSr3ArZjCvYysijwcjDxeyN48RfAy6Ris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723108462; c=relaxed/simple;
	bh=3usaSY9J8VPx6OSEhmXhFkApjAvMpf6rEGE1dwwPXjg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZKnmXo9YyIyHsUw2ibqDygZHGSMWtWQCIeswIx9g/SQA+t4+UXSqAo0sMPRkldQzrwRoVdC+HBsS3YfhGkhf72LLET/lov1Wr/SgBlJJZftKtyNnIsoqi+HS6AIFWKCOqDTkwFetLY54l5aeSxq6QqgIlMVfO9E5p6r6q5N2PEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mvcpJXGp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MhdaOBrT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mvcpJXGp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MhdaOBrT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mvcpJXGp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MhdaOBrT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mvcpJXGp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MhdaOBrT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B10D921B5D;
	Thu,  8 Aug 2024 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723108458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6EOZCiqin3jP/7/4+c1k195s34v74hj5u40VZ8BGT/Y=;
	b=mvcpJXGpwMzPzT0CsdN+THBsqoMaN1yAWNOHO7zqPfeyMMtkaxKtzOmSB2pzauwfCnJH/e
	xk6JeXrZ8IPRakRdH9U+cOeIJdeQTTDRNLqDp5mIB9cxTEAmw0doi0nO4mEBihx/lx1mYf
	Xx/RLp7/kQufHwYQWx5swNlLkoiN4Fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723108458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6EOZCiqin3jP/7/4+c1k195s34v74hj5u40VZ8BGT/Y=;
	b=MhdaOBrTi2pbRX9A4RpMX1+dNOshAqahK1jI+3qXUEa4QoTSIEi24cry0rWe/ZJHIuyu3O
	Wt2uLVIEdk54InBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723108458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6EOZCiqin3jP/7/4+c1k195s34v74hj5u40VZ8BGT/Y=;
	b=mvcpJXGpwMzPzT0CsdN+THBsqoMaN1yAWNOHO7zqPfeyMMtkaxKtzOmSB2pzauwfCnJH/e
	xk6JeXrZ8IPRakRdH9U+cOeIJdeQTTDRNLqDp5mIB9cxTEAmw0doi0nO4mEBihx/lx1mYf
	Xx/RLp7/kQufHwYQWx5swNlLkoiN4Fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723108458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6EOZCiqin3jP/7/4+c1k195s34v74hj5u40VZ8BGT/Y=;
	b=MhdaOBrTi2pbRX9A4RpMX1+dNOshAqahK1jI+3qXUEa4QoTSIEi24cry0rWe/ZJHIuyu3O
	Wt2uLVIEdk54InBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96C9B13876;
	Thu,  8 Aug 2024 09:14:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cqSGI2qMtGZWHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Aug 2024 09:14:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: asihpi: Fix potential OOB array access
Date: Thu,  8 Aug 2024 11:14:42 +0200
Message-ID: <20240808091454.30846-1-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

ASIHPI driver stores some values in the static array upon a response
from the driver, and its index depends on the firmware.  We shouldn't
trust it blindly.

This patch adds a sanity check of the array index to fit in the array
size.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/hpimsgx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/asihpi/hpimsgx.c b/sound/pci/asihpi/hpimsgx.c
index d0caef299481..b68e6bfbbfba 100644
--- a/sound/pci/asihpi/hpimsgx.c
+++ b/sound/pci/asihpi/hpimsgx.c
@@ -708,7 +708,7 @@ static u16 HPIMSGX__init(struct hpi_message *phm,
 		phr->error = HPI_ERROR_PROCESSING_MESSAGE;
 		return phr->error;
 	}
-	if (hr.error == 0) {
+	if (hr.error == 0 && hr.u.s.adapter_index < HPI_MAX_ADAPTERS) {
 		/* the adapter was created successfully
 		   save the mapping for future use */
 		hpi_entry_points[hr.u.s.adapter_index] = entry_point_func;
-- 
2.43.0

