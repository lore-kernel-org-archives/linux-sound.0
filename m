Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133C200137
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037668; cv=none; b=DDsui6kV9qSVd+kTeHJOfrKxhewWdyBYnyPkRwk/2iRjIR3WwNdyWerHOXLCtJgKzue93ucMqYP66dGm5e4qwFSpQ+cftiYtScncc9zjWXYHdh4cNSwGvNpseb2Ow/YACT+G/7VQX4Y8siCP8D1HG0P0XNnEEM1S3BUZKoDM1hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037668; c=relaxed/simple;
	bh=Wj2mpRRG0ZDDfZSdHjuTyIHV7UTywiza2L0rd12IRjI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+D60p10LLSopmVsCAN1V8kgfrtsmYS/Sf6n/pTK3Xa/jPxN1RJbn2ZwT8QQ12YS6wIu4ejIzJhkxoNL9JeZZGzC7GJmOG0V/qydG2VDEUSuQ0ujlcSdrLH2MQ/MtukPW4BOLu2Fskdvs67Ghk17PWVJx8hMFlxTqhv3cbDkQd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tL09DKzw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7js7b14R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tL09DKzw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7js7b14R; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tL09DKzw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7js7b14R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tL09DKzw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7js7b14R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1BB731FCDE;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGOVRt4nUP+Sgt2XWVrgfuRyDqjRK9xQe8rCoE49A18=;
	b=tL09DKzw83DflnNnevYHfspLF0MeNLBRGvQC7uUdsKBbRseD/EU6gjkfhMxOIZaTlSP+09
	xbJAz2fibINsB2Dfe3M1ikhJpTsvtzrneQgJrqogZzcKfeBygL/JalgJ2NB1VseAoeOtE6
	QJfKj0IHDqWCxgN3eXLYv4YFG+advkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGOVRt4nUP+Sgt2XWVrgfuRyDqjRK9xQe8rCoE49A18=;
	b=7js7b14RXzUiLTyYaKllR9L0tIYDSbxJkhycUwUZiUL2dGTkBJ+rvAzpuTXrudvxnHvsoQ
	NoXOQsA+oPKd2sDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tL09DKzw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7js7b14R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGOVRt4nUP+Sgt2XWVrgfuRyDqjRK9xQe8rCoE49A18=;
	b=tL09DKzw83DflnNnevYHfspLF0MeNLBRGvQC7uUdsKBbRseD/EU6gjkfhMxOIZaTlSP+09
	xbJAz2fibINsB2Dfe3M1ikhJpTsvtzrneQgJrqogZzcKfeBygL/JalgJ2NB1VseAoeOtE6
	QJfKj0IHDqWCxgN3eXLYv4YFG+advkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGOVRt4nUP+Sgt2XWVrgfuRyDqjRK9xQe8rCoE49A18=;
	b=7js7b14RXzUiLTyYaKllR9L0tIYDSbxJkhycUwUZiUL2dGTkBJ+rvAzpuTXrudvxnHvsoQ
	NoXOQsA+oPKd2sDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED59013B03;
	Wed,  7 Aug 2024 13:34:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aO3GON13s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 40/54] ALSA: azt3328: Use pr_warn()
Date: Wed,  7 Aug 2024 15:34:30 +0200
Message-ID: <20240807133452.9424-41-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1BB731FCDE
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Replace with the standard print API from the home-baked one.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/azt3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 84989c291cd7..8a895d838005 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -1220,7 +1220,7 @@ snd_azf3328_codec_setfmt(struct snd_azf3328_codec_data *codec,
 	case AZF_FREQ_22050: freq = SOUNDFORMAT_FREQ_22050; break;
 	case AZF_FREQ_32000: freq = SOUNDFORMAT_FREQ_32000; break;
 	default:
-		snd_printk(KERN_WARNING "unknown bitrate %d, assuming 44.1kHz!\n", bitrate);
+		pr_warn("azf3328: unknown bitrate %d, assuming 44.1kHz!\n", bitrate);
 		fallthrough;
 	case AZF_FREQ_44100: freq = SOUNDFORMAT_FREQ_44100; break;
 	case AZF_FREQ_48000: freq = SOUNDFORMAT_FREQ_48000; break;
-- 
2.43.0

