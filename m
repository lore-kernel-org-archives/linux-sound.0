Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B05211A1F
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524791; cv=none; b=Mv3ydPFGB5s4QLkfk21gCslFbTWg4QmVtuQfA2PMBouxQS/i2eaE06Is2fMBo8mEVd/SjX1Wk7UzfrW6DIriRzv4gwCcAuOgoa/8W7bA3ivoiofqIMoHytVwIn9O6WP2+XrxeQk4CKSG4XLiI+I6/Q/CaO8ujXc1EDryErg/Q7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524791; c=relaxed/simple;
	bh=Y9XbEPOvt0KxBZoLnc691wFFFNobFWs4WZm2nem3gmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yx+xeuCjvxUdkUkh06YmnVnDrE1DmqVDjflkPasHk8tj7SbTPmZfO/MGehEWupjzEN1/nLCXhsos0JbhwESTTL5y+kz171LOxAtu2e8iUcGhGnzlDgnAmNN3Bd2g7NSfzkxkLPdFG6fl662pklp4l9PW3yLF46p73OicFDSd0ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UTP/sdnu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iepru14e; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UTP/sdnu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iepru14e; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UTP/sdnu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iepru14e";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UTP/sdnu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iepru14e"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9C99221175;
	Fri, 10 Jan 2025 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736524787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g+8mA2kVW4x9z/0Jafbl9PW3nC6zj/XtJkcy+kP5cDE=;
	b=UTP/sdnu3n3RJeYnWtP1zyxCMsx+CUsUBJyyT9D8mMGkXiP+G60Pn+K4oOl2lEymdnBmds
	q1d1m6s7RPdP4HHh47av+hvxshz4yZeNCRevxbSVp3/jkxe5gAyPhU8JkZRhOpX+uW3iFT
	bjEFEe+Z9uhEHrcix3S8NMiU7yyqpRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736524787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g+8mA2kVW4x9z/0Jafbl9PW3nC6zj/XtJkcy+kP5cDE=;
	b=Iepru14e7voR6i9+aWd1++jD+trI53t/CHyzS68EO+Cu+QZ1qa7YPhJWgrg1PoyL+jRkjP
	u9r7mcLTmdHNJgCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736524787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g+8mA2kVW4x9z/0Jafbl9PW3nC6zj/XtJkcy+kP5cDE=;
	b=UTP/sdnu3n3RJeYnWtP1zyxCMsx+CUsUBJyyT9D8mMGkXiP+G60Pn+K4oOl2lEymdnBmds
	q1d1m6s7RPdP4HHh47av+hvxshz4yZeNCRevxbSVp3/jkxe5gAyPhU8JkZRhOpX+uW3iFT
	bjEFEe+Z9uhEHrcix3S8NMiU7yyqpRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736524787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g+8mA2kVW4x9z/0Jafbl9PW3nC6zj/XtJkcy+kP5cDE=;
	b=Iepru14e7voR6i9+aWd1++jD+trI53t/CHyzS68EO+Cu+QZ1qa7YPhJWgrg1PoyL+jRkjP
	u9r7mcLTmdHNJgCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7653313A86;
	Fri, 10 Jan 2025 15:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2UaSG/NDgWefEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 15:59:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/8] ALSA: Small extensions for UMP
Date: Fri, 10 Jan 2025 16:59:33 +0100
Message-ID: <20250110155943.31578-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Hi,

this is a series of changes for rawmidi and sequencer APIs for
handling the missing piece for UMP v1.1.

UMP v1.1 allows the device updating the Endpoint and the Function
Block information dynamically.  The current driver already handles it,
but a few things are still missing:
* The update of rawmidi name
* Notification of EP and FB update via sequencer
The patches cover those missing info.

Also, the current implementation doesn't give a clear idea which UMP
rawmidi device is tied with the legacy rawmidi.  The rawmidi info is
extended to indicated the tied device number.

Last but not least, the UMP EP and FB info strings are copied as-is,
which isn't good for the id strings.  The copy operation is changed to
be a safer form.


Takashi

===

Takashi Iwai (8):
  ALSA: rawmidi: Expose the tied device number in info ioctl
  ALSA: rawmidi: Show substream activity in info ioctl
  ALSA: rawmidi: Bump protocol version to 2.0.5
  ALSA: ump: Copy FB name string more safely
  ALSA: ump: Copy safe string name to rawmidi
  ALSA: ump: Update rawmidi name per EP name update
  ALSA: seq: Allow system notification in atomic
  ALSA: seq: Notify UMP EP and FB changes

 Documentation/sound/designs/midi-2.0.rst |  18 ++++
 include/sound/rawmidi.h                  |   2 +
 include/sound/ump.h                      |   1 +
 include/uapi/sound/asequencer.h          |  12 ++-
 include/uapi/sound/asound.h              |   8 +-
 sound/core/rawmidi.c                     |   4 +
 sound/core/seq/seq_clientmgr.c           |  12 ++-
 sound/core/seq/seq_system.c              |   9 +-
 sound/core/seq/seq_system.h              |  31 +++++--
 sound/core/seq/seq_ump_client.c          |  40 +++++++-
 sound/core/ump.c                         | 113 ++++++++++++++++++-----
 11 files changed, 211 insertions(+), 39 deletions(-)

-- 
2.43.0

