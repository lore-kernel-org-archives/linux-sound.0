Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA041FF1B4
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251143; cv=none; b=r4Dubc3Dd0GuoYETNLorcFwNmkLL76M1NTNSpwA5dpVqNy+c0Q//sZcPORMNbOBhBd1g0gormW0YBX5nH06hk+gR+KAPXunE6Owgew5ut3eOppBnytG+cAmXxjXMWvbI1yE1EVbleFPCSNhb25gcyhNwLAOczM8N2TH+Lgiq+44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251143; c=relaxed/simple;
	bh=+mRu9AdzORKm99YCEIv3UCG1OoEfBnDGY+enF7Ngc+k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=TdqCLxlNUiWhRouEPgfpbLYyzUSmAdX/WUGzhc4IsM0B89kPkufL+NvVuU1IK6GlI7I4b2k8sbq19viEeD18x3GC8hal3Swk19naigUkwX4sHHG2Z561SyjlTV2/hsVzLfag8+Gv3C6IjgBdGEatjLaQjU4yViItgCieiEzSZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FbI1BgzJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cmUDHh15; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FbI1BgzJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cmUDHh15; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FbI1BgzJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cmUDHh15";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FbI1BgzJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cmUDHh15"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 61DEE3E866;
	Mon, 16 Feb 2026 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oU3QpubKKEyPG69UJIxmNN60SIUFH7MYAbkDomhc2NM=;
	b=FbI1BgzJjnU2jShVu8eWBR8NUu9EeOXByp0d95iIl0hCKrJcZ4AI6P5xYwLzyPc2EWvQLi
	hiQSYa0p5A1EcoUU2sEuoJnyPp8vc5B2nFeRcIHMI0UuVLvy34BLsMjkNXw71StKwF0gPW
	aD3xc8HHEvGGrWagrVqzsW9OZTo4Yus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oU3QpubKKEyPG69UJIxmNN60SIUFH7MYAbkDomhc2NM=;
	b=cmUDHh158+7Pc8Y3AA63DnOny094HiqUrjqMXYYTD/KEoL6XC9FMbs+ymfZzoCvitGV/fI
	6ZIRoIL0JhNBt0Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FbI1BgzJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cmUDHh15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oU3QpubKKEyPG69UJIxmNN60SIUFH7MYAbkDomhc2NM=;
	b=FbI1BgzJjnU2jShVu8eWBR8NUu9EeOXByp0d95iIl0hCKrJcZ4AI6P5xYwLzyPc2EWvQLi
	hiQSYa0p5A1EcoUU2sEuoJnyPp8vc5B2nFeRcIHMI0UuVLvy34BLsMjkNXw71StKwF0gPW
	aD3xc8HHEvGGrWagrVqzsW9OZTo4Yus=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oU3QpubKKEyPG69UJIxmNN60SIUFH7MYAbkDomhc2NM=;
	b=cmUDHh158+7Pc8Y3AA63DnOny094HiqUrjqMXYYTD/KEoL6XC9FMbs+ymfZzoCvitGV/fI
	6ZIRoIL0JhNBt0Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35AD73EA62;
	Mon, 16 Feb 2026 14:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sRyLAL8lk2kTGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Feb 2026 14:12:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/4] Small USB-audio fixes
Date: Mon, 16 Feb 2026 15:12:04 +0100
Message-ID: <20260216141209.1849200-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 61DEE3E866
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi,

here are a few small patches for USB-audio, mainly for covering the
missing buffer overflow check at silencing the playback packets.


Takashi

===

Takashi Iwai (4):
  ALSA: usb-audio: Update the number of packets properly at receiving
  ALSA: usb-audio: Optimize the copy of packet sizes for implicit fb
    handling
  ALSA: usb-audio: Add sanity check for OOB writes at silencing
  ALSA: usb-audio: Avoid potentially repeated XRUN error messages

 sound/usb/card.h     |  2 +-
 sound/usb/endpoint.c | 67 ++++++++++++++++++++++++++------------------
 2 files changed, 40 insertions(+), 29 deletions(-)

-- 
2.53.0

