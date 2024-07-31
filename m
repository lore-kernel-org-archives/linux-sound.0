Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4502D1B1400
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431116; cv=none; b=svWkIdMEzydfnxlwieiL0yw+Ex7MbCUEUzmwzcfqJuaLxldmchckxt83cKuwkNcfAjPiy79LBlnMrS4ugqmhhNAxR3DjpfCKgRAAKxINUJr89YLCfWvTUiqw+WXiz4N+yf/4mZpJMyzaB4ub1HWG3lU0J0D0fHCC/wIetseq0zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431116; c=relaxed/simple;
	bh=8fvuuHcARjGrSfmetR7Tlnpq9KqO04ZYsFdo/PKG6Ms=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=haSr8fSbXIeQs17CMBAkS56+pkdkXtv8dWTgto0yt/1YoWLZBXfJU6snd/utzZkf58p5/a5L+ALnObgZ28T3aYq1NsgAiQe2rjQ1GJj0mB31We2c79kuA7q1/vdFLvgzXYSk0k6kTIO3mW7+3AUkIhN8OAWGwWuPpdYqC/aTD5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=R5bu6vm2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3gXbLt8+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mNHT8zdl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ah9td15a; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="R5bu6vm2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3gXbLt8+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mNHT8zdl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ah9td15a"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6244D1F833;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BPxayUZJ4dgdMdsy3Flw9a1LK5cll6LS8hglcQSROZQ=;
	b=R5bu6vm2awYHRQa4100ucfxzF7Z7XpuW6U/2m+KISru7SAg63Xj2U+k4VxhAWLhzoBBNMY
	9VQpbDVgVRiA1Pn8CXzTTmXOd+QqYQ6TbvmRfW8PjlC7cfMERd/NGKFRZts3O1SjTG9cvK
	3LapTQ8RvH152bFc33fjY56XqHl23ZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BPxayUZJ4dgdMdsy3Flw9a1LK5cll6LS8hglcQSROZQ=;
	b=3gXbLt8+PbA8X3DxW3nLKpINdKvLMXhKMhJrpOqQfgmyaqI6j9ChF1XQjS2uXn03Nk3UIZ
	DA4EjNbUTlg7MsDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722431093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BPxayUZJ4dgdMdsy3Flw9a1LK5cll6LS8hglcQSROZQ=;
	b=mNHT8zdllv6iiqD9jypY3hEBXZX/UfiFGLwVzzpZDXqz9SsVG96LKJEbXqAOCyjvUSnJUg
	skkBZqgoOBhf2s6xBy4Kg/MMigh0ZpfTa4CXrZTogirrCa2wuxtloesOr1Q/60ReMDUmI/
	a2cNI+0t3LLzIBXjYo9ZoR5FQ0/i87U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722431093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BPxayUZJ4dgdMdsy3Flw9a1LK5cll6LS8hglcQSROZQ=;
	b=ah9td15awtQlyv6KY9jKwP3kmZw88cOeK7r42Yk2AjlInWdjNk/MCauf+XvyQ6SQCfi2fL
	Fgev3pO87Yj1kxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4840413297;
	Wed, 31 Jul 2024 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id t/RkEHU2qmYrWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jul 2024 13:04:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/5] ALSA: UMP RPN/NRPN conversion fixes
Date: Wed, 31 Jul 2024 15:05:21 +0200
Message-ID: <20240731130528.12600-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.60

There are a few minor issues about RPN/NRPN message conversions
between MIDI1 and MIDI2 when some incomplete messages are sent.
This patch set addresses the issue.  It also cleans up the data type
shared by both UMP core and sequencer UMP conversion.


Takashi

===

Takashi Iwai (5):
  ALSA: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
  ALSA: ump: Explicitly reset RPN with Null RPN
  ALSA: seq: ump: Use the common RPN/bank conversion context
  ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data
    reception
  ALSA: seq: ump: Explicitly reset RPN with Null RPN

 include/sound/ump_convert.h      |  1 +
 sound/core/seq/seq_ports.h       | 14 +----
 sound/core/seq/seq_ump_convert.c | 97 ++++++++++++++++++++------------
 sound/core/ump_convert.c         | 60 ++++++++++++++------
 4 files changed, 106 insertions(+), 66 deletions(-)

-- 
2.43.0

