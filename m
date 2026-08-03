Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ACE2931D4
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765686; cv=none; b=j01BvSw8/BEC7MFDwz2IJRQhthi8EDpl0CMzEiDbKfbo+BF8aDh9x5SOSKqvESDVb2VrSFF3vRCzDKiiG3QrgizRiBgwlssDZ8Z3Hb61zzVeFOOLs8c3YAccLIJKN7MoR9kxR7ay3XsRieCOn+ijHQrgchlGrE2JpTQlHVNdlh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765686; c=relaxed/simple;
	bh=fk650vqkGqqky9mfepd4hNSr9UwtH7jSgyGLIO/iqII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7LkTIEaqnYvAh+dncbUNeLU/5fKWpLCIYhHfbrb2RCD3EWhYGe1nv5KPKWSwOGjsMe+zQAgIANpQMt9TBMkg6uvQInX2hXgu9EnPeWxlHvNozgn7xieXj0WLSqwr6Z5GXCekFSwghDxAMpnmfK7JulmgnrxHB8LI8yNjV0PbNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uZbSgNIk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aJF0+ghq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1yntK+6W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PPn/iVMU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uZbSgNIk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aJF0+ghq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1yntK+6W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PPn/iVMU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A64137F158;
	Mon,  3 Aug 2026 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y08lCWvAwtjdJZdGi81xLOUH1/Eg9I/TAkaWaiNnV+A=;
	b=uZbSgNIkyuqk/VZBdkFZbry3SskN3Br5B6K4h+hDDmLZuvbUJ6BzbupPgFMVHvqq+i2zjy
	caQ4LX8fTai79EhFx5epz6qQsomJGoJ56ebuOsEohnlxPo/w8tYs9ak7fpXeXIEhfreB3n
	aUgmjbdFazjAeEGeWiBnJyASB4+r8Wo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y08lCWvAwtjdJZdGi81xLOUH1/Eg9I/TAkaWaiNnV+A=;
	b=aJF0+ghqEPrACKDaezHr/I46rsuQrkEvSNLlLN+XLQp6+xQCmdfUzhUujqSb8v9FiIgYlj
	nBHvyr45MYBdp6CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1yntK+6W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="PPn/iVMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y08lCWvAwtjdJZdGi81xLOUH1/Eg9I/TAkaWaiNnV+A=;
	b=1yntK+6Wd6aSoKAOg3cnRQEjU+ZUqVqcbRptVjYwxwh3uu9OrJe1/4g1ZknpPoqmjGjjN+
	gGzOmL8VjpqxUdwln9tcnJOOuTpr3/BB75miSVRgkCEDLLzUTWyO8zC/VIRNqR/tgfOj/8
	DquAVG0J/F2b7GlsdSNFDRWdczwdlzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y08lCWvAwtjdJZdGi81xLOUH1/Eg9I/TAkaWaiNnV+A=;
	b=PPn/iVMUCxMCFV+pVstx6NSfKAPbHSeOq4xlaSJ2at2qNky3rdpeLfZA83SbUYz24iYxN+
	Zo3S+hnzQoU8c5BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CEE0779D3;
	Mon,  3 Aug 2026 14:01:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sLlLHR+fcGpJKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 14:01:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 3/3] ALSA: hda: cs35l41: Use auto-cleanup for put_device()
Date: Mon,  3 Aug 2026 16:00:53 +0200
Message-ID: <20260803140100.919071-3-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803140100.919071-1-tiwai@suse.de>
References: <20260803140100.919071-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: A64137F158
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

A temporary refcount management of a struct device can be done
gracefully with __clean(put_device) for avoiding potential leaks.

No functional change but just a code cleanup.

Cc: patches@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index c8eba0638ada..62296be45c55 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -1915,7 +1915,6 @@ int cs35l41_hda_parse_acpi(struct cs35l41_hda *cs35l41, struct device *physdev,
 static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, int id)
 {
 	struct acpi_device *adev;
-	struct device *physdev;
 	struct spi_device *spi;
 	const char *sub;
 	int ret;
@@ -1927,7 +1926,8 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	}
 
 	cs35l41->dacpi = adev;
-	physdev = get_device(acpi_get_first_physical_node(adev));
+	struct device *physdev __free(put_device) =
+		get_device(acpi_get_first_physical_node(adev));
 	if (!physdev) {
 		acpi_dev_put(adev);
 		return -ENODEV;
@@ -1945,13 +1945,9 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	}
 
 	ret = cs35l41_hda_parse_acpi(cs35l41, physdev, id);
-	if (ret) {
-		put_device(physdev);
+	if (ret)
 		return ret;
-	}
 out:
-	put_device(physdev);
-
 	cs35l41->bypass_fw = false;
 	if (cs35l41->control_bus == SPI) {
 		spi = to_spi_device(cs35l41->dev);
-- 
2.55.0

