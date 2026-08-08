Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DCD23C4F3
	for <linux-sound@vger.kernel.org>; Sat,  8 Aug 2026 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786202597; cv=none; b=TjPE4SCJnGzPXE4kyP0PGBLG1heBCOGkM5e6EP44mKkdyTpL8+TsLUeN2Y1khWZya1mqLg72mft5BfuaoCQX6dK0kvcbRoyTKGTXBBWfBqsQXAsvVCltMCSVRuuUGmcCqDbCet/WKh7wVkft8eOyc+rVzeDrxBRGwvJcgYVoDHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786202597; c=relaxed/simple;
	bh=MRlvyDvQh1ch+AoSeSjl+4Om+c+sInHE6Mh/I3Am/1o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YFgmUo3LUXqtWWtUt2NpTHAvBIi0AbeVGBc6FNVIwzJR22m6YqEvd149PRGaTFutAz6ADYrN3XlMA2oWCfwszhiVMj1yLbQoztSPBusyGPpnkx7xAzTzn60Em2EJafmI+99S54hh/wZlA4f8j3m8pAmPz/8lppZUGGbLr8IlCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wHt5aODw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kgh6uIIj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AKVnTWLI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lOCx09Pd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wHt5aODw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kgh6uIIj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AKVnTWLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lOCx09Pd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 883E54047;
	Sat,  8 Aug 2026 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786202583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8igKahXlSJGe7ricZkVuHtorM0mjbLPpp1zbDVFxEYU=;
	b=wHt5aODwcnZhhdgqi/+kvEE5ARbGzqV6S1Q6CD0+bLsKFm0DqmSH+VbpJR0H8DTjEC48es
	Cn+XZCXjM+bqY71VVrcxesD98p7GqLlB3T5Js8HlpgooB3+g6snnc7gGVLGOV4HhSo3WhO
	hau4//+KGl3lbFvd7adTrczFzlSLoXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786202583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8igKahXlSJGe7ricZkVuHtorM0mjbLPpp1zbDVFxEYU=;
	b=kgh6uIIjtgV83/yMleZqNLZeYEFa89vLrOJarL3IHautY8ucr58aEExzi+Lnt/PGmVhCIY
	28BTz552q6fgMkBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786202579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8igKahXlSJGe7ricZkVuHtorM0mjbLPpp1zbDVFxEYU=;
	b=AKVnTWLI5YAjZnyJPlCOmierkrL0mRgEZT7YX1POBuxZQGixc4jaHaB2hpjkiunG8Dgd8E
	6+s9z9Oecfz1cusysBH+Odew3nhOuS0NffoYIyUgLmx536FoIOLscQ0T7luRnm7HVICSyv
	9GCdY2K6qVE9EAwwc2aAWYTcZEcI9Po=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786202579;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8igKahXlSJGe7ricZkVuHtorM0mjbLPpp1zbDVFxEYU=;
	b=lOCx09PdLTBqiyrJbNIUxIJ5EJkNnDZa7+209XqbKVeQxE6yGTNBkpTbAhxRD5OVtMDero
	Jwu2NvV0LIUqh7CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C57D779B2;
	Sat,  8 Aug 2026 15:22:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hcZXF9NJd2oKcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 08 Aug 2026 15:22:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix mixer regression on SteelSeries Arctis Nova 5
Date: Sat,  8 Aug 2026 17:22:54 +0200
Message-ID: <20260808152258.1948767-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

The recent "sticky mixer" sanity check in USB-audio driver caused a
regression on SteelSeries Arctis Nova 5 (1038:2232); because the
firmware doesn't handle GET_CUR requests, some mixers are effectively
disabled, leading to the too low / soft volumes:
  usb 5-1.1: 9:0: sticky mixer values (-19712/0/256 => 0), disabling
  usb 5-1.1: 10:0: sticky mixer values (-21248/0/256 => 0), disabling

Restore the functionality by ignoring GET_CUR errors intentionally
with MIXER_GET_CUR_BROKEN quirk.

Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
Reported-by: Gert Burger <gertburger@gmail.com>
Closes: https://lore.kernel.org/CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com
Link: https://bbs.archlinux.org/viewtopic.php?id=314220
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3330eb604911..618baa80d2b7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2363,6 +2363,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x1038, 0x2232, /* SteelSeries Arctis Nova 5 */
+		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x12d1, 0x3a07, /* HUAWEI USB-C HEADSET */
-- 
2.55.0

