Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3952E7623
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426015; cv=none; b=PwQIiS30OiFAwrJrdah7PFkXPDFshKMfLTAGsyf+G8zla7gK+4+wFhzPBskDL/oh1fkmqaWZr2PAdX5PfE/VRnLHRWS2UaSrG1a0WeiiDsM4Txqcm7bv/DDFec1oG69yMXT+3/x70pGjRqeS2/lilv2wItur0v4YXUvVVNWpm6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426015; c=relaxed/simple;
	bh=anbJuKJSsHsWFaS0ted2iy0pjN66OvODUqrqIL078Wg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hhDRlxzTDhSIV422ynUqqU75z/34fNMx29FI6oKm7OpSRINFwDj9/pFcf6bFWCM7Zlt1UI1hY9WPNqwW+2W+RphZ7l2okvu4imA4JMbgtqUpRwexCyW4b7o3v4LyWBxIbfer6ve1guVmJnTiAn+7QpvfoC9fEn3kH8Q9SeRk3vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NhwgDZEy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9IGCDk+T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NhwgDZEy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9IGCDk+T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NhwgDZEy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9IGCDk+T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NhwgDZEy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9IGCDk+T"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1FACA1F393;
	Thu,  6 Nov 2025 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762426011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xjoi0kCxOSnL4puYEZZ+qr+6HDjWf/qSVTHsC7IfcYA=;
	b=NhwgDZEyYCZIcDEXx71NimT+6VqSe6irCS5mC1n6++rOy9KpUsbLzJlO6sZYSdO06BuZxz
	5reNKqOzHP44w4oQbuLxkGPdFKOx2vMr2qYFPl9nXa7g6GI6YeB4by29uw3dnwRd4AiiPg
	c7b5fcGHRAu3MIcvBC0vmVeuG4zk5Jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762426011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xjoi0kCxOSnL4puYEZZ+qr+6HDjWf/qSVTHsC7IfcYA=;
	b=9IGCDk+T64mpubMzXzI689e0KLNI9kKdhFNNVD3ajYxwvLbh/Yjs7c8BkylDKJm8uSh39Q
	1rU1h6HqtsgwcbCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762426011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xjoi0kCxOSnL4puYEZZ+qr+6HDjWf/qSVTHsC7IfcYA=;
	b=NhwgDZEyYCZIcDEXx71NimT+6VqSe6irCS5mC1n6++rOy9KpUsbLzJlO6sZYSdO06BuZxz
	5reNKqOzHP44w4oQbuLxkGPdFKOx2vMr2qYFPl9nXa7g6GI6YeB4by29uw3dnwRd4AiiPg
	c7b5fcGHRAu3MIcvBC0vmVeuG4zk5Jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762426011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xjoi0kCxOSnL4puYEZZ+qr+6HDjWf/qSVTHsC7IfcYA=;
	b=9IGCDk+T64mpubMzXzI689e0KLNI9kKdhFNNVD3ajYxwvLbh/Yjs7c8BkylDKJm8uSh39Q
	1rU1h6HqtsgwcbCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 049CE13A31;
	Thu,  6 Nov 2025 10:46:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iJBjO5p8DGl9ZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Nov 2025 10:46:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/hdmi: Fix breakage at probing nvhdmi-mcp driver
Date: Thu,  6 Nov 2025 11:46:45 +0100
Message-ID: <20251106104647.25805-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

After restructuring and splitting the HDMI codec driver code, each
HDMI codec driver contains the own build_controls and build_pcms ops.
A copy-n-paste error put the wrong entries for nvhdmi-mcp driver; both
build_controls and build_pcms are swapped.  Unfortunately both
callbacks have the very same form, and the compiler didn't complain
it, either.  This resulted in a NULL dereference because the PCM
instance hasn't been initialized at calling the build_controls
callback.

Fix it by passing the proper entries.

Fixes: ad781b550f9a ("ALSA: hda/hdmi: Rewrite to new probe method")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220743
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/hdmi/nvhdmi-mcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/hdmi/nvhdmi-mcp.c b/sound/hda/codecs/hdmi/nvhdmi-mcp.c
index 8fd8d76fa72f..1c5fdfe872f2 100644
--- a/sound/hda/codecs/hdmi/nvhdmi-mcp.c
+++ b/sound/hda/codecs/hdmi/nvhdmi-mcp.c
@@ -350,8 +350,8 @@ static int nvhdmi_mcp_probe(struct hda_codec *codec,
 static const struct hda_codec_ops nvhdmi_mcp_codec_ops = {
 	.probe = nvhdmi_mcp_probe,
 	.remove = snd_hda_hdmi_simple_remove,
-	.build_controls = nvhdmi_mcp_build_pcms,
-	.build_pcms = nvhdmi_mcp_build_controls,
+	.build_pcms = nvhdmi_mcp_build_pcms,
+	.build_controls = nvhdmi_mcp_build_controls,
 	.init = nvhdmi_mcp_init,
 	.unsol_event = snd_hda_hdmi_simple_unsol_event,
 };
-- 
2.50.1

