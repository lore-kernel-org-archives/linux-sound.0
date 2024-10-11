Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FE61F4FDF
	for <linux-sound@vger.kernel.org>; Fri, 11 Oct 2024 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631266; cv=none; b=loyK3s4G5KymOrVt/vqnHtxwL9LWgb1gv9c/zNtZVVUerYA4n/K1/kPoDkBmiljCVeN+zDa2U3JqLR+ioIvA2xSt0YrYl2zKu4LNw8uHw27gCUgVukzD63R5HCzYEMkoI/01+4kd/Revf9nQsB0noQh2namM+lTk/ygFzffLp00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631266; c=relaxed/simple;
	bh=nXv3pixeJkPXNX/fZpWeNJk5U6Nbfd/b9JymRJ4m9MU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HmKtKvsL2lLDla+/efpfTBkXwEDY5wDOas8z3ECAlNVg4Pyhd+HBp4hxltmGHQ1LytAqF4dA6p1RXBX7oSy2BVPtyCQmTwcgXZv55WEuMInxQqdQzbrXrwsIjF5lAaH0iC/wlbREy0FwIxIpXV1wJGVR4RgRxYQdcQ27uGnCuI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nyixxfa1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vLqhf3Ev; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YLh2IZ2I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VIJ7Bj39; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nyixxfa1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vLqhf3Ev";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YLh2IZ2I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VIJ7Bj39"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E089021D5A;
	Fri, 11 Oct 2024 07:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728631257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2NGm3wvvsZfSVILhlMuLTK0wAenVklfTd74hKUOJLuA=;
	b=Nyixxfa1XGbY3Z1eGYd/TrFst/geY57Rv6I/7YWkkC4acjHKccQ/z7mPOmgx8NA83GU0v9
	dQF51ORsw4kRY3wLKHBn0N7FAE+aVoXCMdK/HOxvLDSejTC7B+hfjkE1ZNOF2HXV/kjfxz
	nayMoH3nh+DTsAbd5yMnEURgMA6XrDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728631257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2NGm3wvvsZfSVILhlMuLTK0wAenVklfTd74hKUOJLuA=;
	b=vLqhf3EvV6zPeOlWmaX7S/TlMzKLVqEhdREYg6RniW5ZZxWYMkFnJt1GtZTIlRJa9pAvMs
	ZmAOIXyLbzWLjPAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728631256; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2NGm3wvvsZfSVILhlMuLTK0wAenVklfTd74hKUOJLuA=;
	b=YLh2IZ2IZeEGghiOf8bbY3uW9tckfkTpdzFkqHgFrvNFqiBZvCEJhBzP7lqVINPsxwjrxS
	ESCdNNN6zXe7ROWrkHdJq0zACXgu/PI9PkdSkO5CsuxWG6eMedZDA2MV4lN8qxSyngWa9F
	OFRoQcZkC9L63AkM2//NeOQSvrUurBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728631256;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2NGm3wvvsZfSVILhlMuLTK0wAenVklfTd74hKUOJLuA=;
	b=VIJ7Bj39N3bCU1fLGq8jN5k0akPhoDYH1J8xbWDatRhtvDrW3IcVrjym9crVDmbIT3qWIy
	D+S9EhTSmpUIuPAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAD36136E0;
	Fri, 11 Oct 2024 07:20:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5utTLNjRCGcTBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Oct 2024 07:20:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Fix build error without CONFIG_SND_DEBUG
Date: Fri, 11 Oct 2024 09:21:52 +0200
Message-ID: <20241011072152.14657-1-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,auug.org.au:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

The macro should have been defined without setting the non-existing
name field in the case of CONFIG_SND_DEBUG=n.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/20241011131046.5eb3905a@canb.auug.org.au
Fixes: 5b1913a79c3e ("ALSA: hda: Use own quirk lookup helper")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_local.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index b7d926e9eb94..763f79f6f32e 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -308,9 +308,15 @@ struct hda_quirk {
 #endif
 };
 
+#ifdef CONFIG_SND_DEBUG_VERBOSE
 #define HDA_CODEC_QUIRK(vend, dev, xname, val) \
 	{ _SND_PCI_QUIRK_ID(vend, dev), .value = (val), .name = (xname),\
 			.match_codec_ssid = true }
+#else
+#define HDA_CODEC_QUIRK(vend, dev, xname, val) \
+	{ _SND_PCI_QUIRK_ID(vend, dev), .value = (val), \
+			.match_codec_ssid = true }
+#endif
 
 struct snd_hda_pin_quirk {
 	unsigned int codec;             /* Codec vendor/device ID */
-- 
2.43.0

