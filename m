Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B99211A2D
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524791; cv=none; b=sRRzQG9ZnAzbmO7C9iWUtidcjlpa7O2ATB92Xx0lpumSjIEG/CLNzzmMoKLb7bmVu/pX3aN/yNSPMV2b9UQnY+JeTzIIXNMcIVmhsLOPIfopt3YJRv1m3HRqByxI3x6KBcl0RyBaceosXe//aSejHHt+NCrJeBMVrqI/8htKzKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524791; c=relaxed/simple;
	bh=+b7fQahgNR1+5OvUHn4ONM+OhFlEYJePR4j+eXNSC54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8w0p9Bj2lXNLr+bOSH7Wp/okaHtceV97SVXNhzulSizJLP+ml7JG9+t+Xivwkzg0XD8KOR2A/X1kgbQPM2QySGziJBfCYaHHD/nV0Hmpf1za7BtOGeAl9a6eEE5IYcctzcfuHna4Z2j4e5n4PxvkTwiUxxZwnJ/0jGPIR94vDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0756F21192;
	Fri, 10 Jan 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8D1B13A86;
	Fri, 10 Jan 2025 15:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KL69M/NDgWefEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 15:59:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/8] ALSA: rawmidi: Bump protocol version to 2.0.5
Date: Fri, 10 Jan 2025 16:59:36 +0100
Message-ID: <20250110155943.31578-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110155943.31578-1-tiwai@suse.de>
References: <20250110155943.31578-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0756F21192
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

Bump the protocol version to 2.0.5, as we extended the rawmidi ABI for
the new tied_device info and the substream inactive flag.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asound.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 9f3b32602ac1..000b36c0e2b9 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -716,7 +716,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 4)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 5)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
-- 
2.43.0

