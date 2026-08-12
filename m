Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20362320CD3
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786514784; cv=none; b=OCDsGUxf2te+hdj/bsHTZ0lpJzwvcG93yQB7MRRoWJVw9M57ioNQf1EpkFDOrGZLUDXcQNNgxf6LJPshZbh9GGOirIKjey690bBvFR8xY9B7SL/TkgXgNk5COtd8whxKD+lQWsWgVFigoQvujDnKyXvmaFL7Zc9E52H6lHHW5g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786514784; c=relaxed/simple;
	bh=l309QEMS4iORkoHFGszDJ/YcxRUQcAkZduvbrHLehUE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzNos4QHVE51cCzFdVjHJo9Lr+zjgRySRXKXSuxmM12b/5XAjdgZaApA8jNpvGkujU5h8RGefR4BGjcUudEo3DeKLCovBvf07dToBQsKhsZjVE1+sLaN2jZBcgTbqAYWIKVY/fueJgfEa6LDIZhdXHDgsO2yV3VJUCBrZyMhy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CAGOvi5D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8auXJUHW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=shsqR+RV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/+OwNthh; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CAGOvi5D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8auXJUHW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="shsqR+RV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/+OwNthh"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05AF8820DC;
	Wed, 12 Aug 2026 06:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12gDg9y0CwhRXCh8eSW86+Z/LudbQuDI2z5FmWhnjL0=;
	b=CAGOvi5DHypIU83trxKUsBZlQ2JFJrN8m7lSXjt3bpSLTokP4EsqAQ2xo+rdUL3UB1PuXY
	3PwyFVxg86rmFMhY74XvHGgJH1m6874MgsiHQg/TBoVexXxaNkHISjfeJoYeRoC8IG6ba5
	UXrX3JdLOihdcfxREaR02T/VCQm2TyI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12gDg9y0CwhRXCh8eSW86+Z/LudbQuDI2z5FmWhnjL0=;
	b=8auXJUHW0P0mTELvwEpv3KyxaK/ZjTjR4JAZmzU6QdxiPyN8QraxRUbPhmucYe4TiSwINQ
	URW4E8H493F2BWCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786514772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12gDg9y0CwhRXCh8eSW86+Z/LudbQuDI2z5FmWhnjL0=;
	b=shsqR+RVjcU7FEwKf0vsnPS6Y8BCYzg7AWASLaimeGIOfNoHoT8nceX7Ty4+1GzrGLKswW
	YacmVKz8zZu79QJG3DOZO2iX/l9+f3TDWapbZxmseLb7NoKkjAz7YX16XPwb26UuIGavC+
	9/Kdc11I3/adMy8aiZ7Nyo7knhS4xV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786514772;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12gDg9y0CwhRXCh8eSW86+Z/LudbQuDI2z5FmWhnjL0=;
	b=/+OwNthh2KETbFPAwy99E3BHL3dp+9UlxcZJtHKVouSFoCrjF2Yp29Ji0HCMZhygT1Bewd
	aG/09JpU64V0A2Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB061779B6;
	Wed, 12 Aug 2026 06:06:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2H05NFMNfGrREAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 06:06:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/14] ALSA: pcm: Avoid macros for SNDRV_PCM_FMTBIT and SNDRV_PCM_SUBFMTBIT
Date: Wed, 12 Aug 2026 08:04:35 +0200
Message-ID: <20260812060557.80445-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812060557.80445-1-tiwai@suse.de>
References: <20260812060557.80445-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Avoid macros to define SNDRV_PCM_FMTBIT_* and SNDRV_PCM_SUBFMTBIT_*
contants but use plain bit shifts, instead.  This allows bindgen and
other tools aware of those definitions.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h | 112 ++++++++++++++++++++++----------------------
 1 file changed, 55 insertions(+), 57 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ab96396a7444..02d8689354c4 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -145,61 +145,60 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_8000_768000	(SNDRV_PCM_RATE_8000_384000|\
 					 SNDRV_PCM_RATE_705600|\
 					 SNDRV_PCM_RATE_768000)
-#define _SNDRV_PCM_FMTBIT(fmt)		(1ULL << SNDRV_PCM_FORMAT_##fmt)
-#define SNDRV_PCM_FMTBIT_S8		_SNDRV_PCM_FMTBIT(S8)
-#define SNDRV_PCM_FMTBIT_U8		_SNDRV_PCM_FMTBIT(U8)
-#define SNDRV_PCM_FMTBIT_S16_LE		_SNDRV_PCM_FMTBIT(S16_LE)
-#define SNDRV_PCM_FMTBIT_S16_BE		_SNDRV_PCM_FMTBIT(S16_BE)
-#define SNDRV_PCM_FMTBIT_U16_LE		_SNDRV_PCM_FMTBIT(U16_LE)
-#define SNDRV_PCM_FMTBIT_U16_BE		_SNDRV_PCM_FMTBIT(U16_BE)
-#define SNDRV_PCM_FMTBIT_S24_LE		_SNDRV_PCM_FMTBIT(S24_LE)
-#define SNDRV_PCM_FMTBIT_S24_BE		_SNDRV_PCM_FMTBIT(S24_BE)
-#define SNDRV_PCM_FMTBIT_U24_LE		_SNDRV_PCM_FMTBIT(U24_LE)
-#define SNDRV_PCM_FMTBIT_U24_BE		_SNDRV_PCM_FMTBIT(U24_BE)
+#define SNDRV_PCM_FMTBIT_S8		(1ULL << SNDRV_PCM_FORMAT_S8)
+#define SNDRV_PCM_FMTBIT_U8		(1ULL << SNDRV_PCM_FORMAT_U8)
+#define SNDRV_PCM_FMTBIT_S16_LE		(1ULL << SNDRV_PCM_FORMAT_S16_LE)
+#define SNDRV_PCM_FMTBIT_S16_BE		(1ULL << SNDRV_PCM_FORMAT_S16_BE)
+#define SNDRV_PCM_FMTBIT_U16_LE		(1ULL << SNDRV_PCM_FORMAT_U16_LE)
+#define SNDRV_PCM_FMTBIT_U16_BE		(1ULL << SNDRV_PCM_FORMAT_U16_BE)
+#define SNDRV_PCM_FMTBIT_S24_LE		(1ULL << SNDRV_PCM_FORMAT_S24_LE)
+#define SNDRV_PCM_FMTBIT_S24_BE		(1ULL << SNDRV_PCM_FORMAT_S24_BE)
+#define SNDRV_PCM_FMTBIT_U24_LE		(1ULL << SNDRV_PCM_FORMAT_U24_LE)
+#define SNDRV_PCM_FMTBIT_U24_BE		(1ULL << SNDRV_PCM_FORMAT_U24_BE)
 // For S32/U32 formats, 'msbits' hardware parameter is often used to deliver information about the
 // available bit count in most significant bit. It's for the case of so-called 'left-justified' or
 // `right-padding` sample which has less width than 32 bit.
-#define SNDRV_PCM_FMTBIT_S32_LE		_SNDRV_PCM_FMTBIT(S32_LE)
-#define SNDRV_PCM_FMTBIT_S32_BE		_SNDRV_PCM_FMTBIT(S32_BE)
-#define SNDRV_PCM_FMTBIT_U32_LE		_SNDRV_PCM_FMTBIT(U32_LE)
-#define SNDRV_PCM_FMTBIT_U32_BE		_SNDRV_PCM_FMTBIT(U32_BE)
-#define SNDRV_PCM_FMTBIT_FLOAT_LE	_SNDRV_PCM_FMTBIT(FLOAT_LE)
-#define SNDRV_PCM_FMTBIT_FLOAT_BE	_SNDRV_PCM_FMTBIT(FLOAT_BE)
-#define SNDRV_PCM_FMTBIT_FLOAT64_LE	_SNDRV_PCM_FMTBIT(FLOAT64_LE)
-#define SNDRV_PCM_FMTBIT_FLOAT64_BE	_SNDRV_PCM_FMTBIT(FLOAT64_BE)
-#define SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE _SNDRV_PCM_FMTBIT(IEC958_SUBFRAME_LE)
-#define SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_BE _SNDRV_PCM_FMTBIT(IEC958_SUBFRAME_BE)
-#define SNDRV_PCM_FMTBIT_MU_LAW		_SNDRV_PCM_FMTBIT(MU_LAW)
-#define SNDRV_PCM_FMTBIT_A_LAW		_SNDRV_PCM_FMTBIT(A_LAW)
-#define SNDRV_PCM_FMTBIT_IMA_ADPCM	_SNDRV_PCM_FMTBIT(IMA_ADPCM)
-#define SNDRV_PCM_FMTBIT_MPEG		_SNDRV_PCM_FMTBIT(MPEG)
-#define SNDRV_PCM_FMTBIT_GSM		_SNDRV_PCM_FMTBIT(GSM)
-#define SNDRV_PCM_FMTBIT_S20_LE	_SNDRV_PCM_FMTBIT(S20_LE)
-#define SNDRV_PCM_FMTBIT_U20_LE	_SNDRV_PCM_FMTBIT(U20_LE)
-#define SNDRV_PCM_FMTBIT_S20_BE	_SNDRV_PCM_FMTBIT(S20_BE)
-#define SNDRV_PCM_FMTBIT_U20_BE	_SNDRV_PCM_FMTBIT(U20_BE)
-#define SNDRV_PCM_FMTBIT_SPECIAL	_SNDRV_PCM_FMTBIT(SPECIAL)
-#define SNDRV_PCM_FMTBIT_S24_3LE	_SNDRV_PCM_FMTBIT(S24_3LE)
-#define SNDRV_PCM_FMTBIT_U24_3LE	_SNDRV_PCM_FMTBIT(U24_3LE)
-#define SNDRV_PCM_FMTBIT_S24_3BE	_SNDRV_PCM_FMTBIT(S24_3BE)
-#define SNDRV_PCM_FMTBIT_U24_3BE	_SNDRV_PCM_FMTBIT(U24_3BE)
-#define SNDRV_PCM_FMTBIT_S20_3LE	_SNDRV_PCM_FMTBIT(S20_3LE)
-#define SNDRV_PCM_FMTBIT_U20_3LE	_SNDRV_PCM_FMTBIT(U20_3LE)
-#define SNDRV_PCM_FMTBIT_S20_3BE	_SNDRV_PCM_FMTBIT(S20_3BE)
-#define SNDRV_PCM_FMTBIT_U20_3BE	_SNDRV_PCM_FMTBIT(U20_3BE)
-#define SNDRV_PCM_FMTBIT_S18_3LE	_SNDRV_PCM_FMTBIT(S18_3LE)
-#define SNDRV_PCM_FMTBIT_U18_3LE	_SNDRV_PCM_FMTBIT(U18_3LE)
-#define SNDRV_PCM_FMTBIT_S18_3BE	_SNDRV_PCM_FMTBIT(S18_3BE)
-#define SNDRV_PCM_FMTBIT_U18_3BE	_SNDRV_PCM_FMTBIT(U18_3BE)
-#define SNDRV_PCM_FMTBIT_G723_24	_SNDRV_PCM_FMTBIT(G723_24)
-#define SNDRV_PCM_FMTBIT_G723_24_1B	_SNDRV_PCM_FMTBIT(G723_24_1B)
-#define SNDRV_PCM_FMTBIT_G723_40	_SNDRV_PCM_FMTBIT(G723_40)
-#define SNDRV_PCM_FMTBIT_G723_40_1B	_SNDRV_PCM_FMTBIT(G723_40_1B)
-#define SNDRV_PCM_FMTBIT_DSD_U8		_SNDRV_PCM_FMTBIT(DSD_U8)
-#define SNDRV_PCM_FMTBIT_DSD_U16_LE	_SNDRV_PCM_FMTBIT(DSD_U16_LE)
-#define SNDRV_PCM_FMTBIT_DSD_U32_LE	_SNDRV_PCM_FMTBIT(DSD_U32_LE)
-#define SNDRV_PCM_FMTBIT_DSD_U16_BE	_SNDRV_PCM_FMTBIT(DSD_U16_BE)
-#define SNDRV_PCM_FMTBIT_DSD_U32_BE	_SNDRV_PCM_FMTBIT(DSD_U32_BE)
+#define SNDRV_PCM_FMTBIT_S32_LE		(1ULL << SNDRV_PCM_FORMAT_S32_LE)
+#define SNDRV_PCM_FMTBIT_S32_BE		(1ULL << SNDRV_PCM_FORMAT_S32_BE)
+#define SNDRV_PCM_FMTBIT_U32_LE		(1ULL << SNDRV_PCM_FORMAT_U32_LE)
+#define SNDRV_PCM_FMTBIT_U32_BE		(1ULL << SNDRV_PCM_FORMAT_U32_BE)
+#define SNDRV_PCM_FMTBIT_FLOAT_LE	(1ULL << SNDRV_PCM_FORMAT_FLOAT_LE)
+#define SNDRV_PCM_FMTBIT_FLOAT_BE	(1ULL << SNDRV_PCM_FORMAT_FLOAT_BE)
+#define SNDRV_PCM_FMTBIT_FLOAT64_LE	(1ULL << SNDRV_PCM_FORMAT_FLOAT64_LE)
+#define SNDRV_PCM_FMTBIT_FLOAT64_BE	(1ULL << SNDRV_PCM_FORMAT_FLOAT64_BE)
+#define SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE (1ULL << SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
+#define SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_BE (1ULL << SNDRV_PCM_FORMAT_IEC958_SUBFRAME_BE)
+#define SNDRV_PCM_FMTBIT_MU_LAW		(1ULL << SNDRV_PCM_FORMAT_MU_LAW)
+#define SNDRV_PCM_FMTBIT_A_LAW		(1ULL << SNDRV_PCM_FORMAT_A_LAW)
+#define SNDRV_PCM_FMTBIT_IMA_ADPCM	(1ULL << SNDRV_PCM_FORMAT_IMA_ADPCM)
+#define SNDRV_PCM_FMTBIT_MPEG		(1ULL << SNDRV_PCM_FORMAT_MPEG)
+#define SNDRV_PCM_FMTBIT_GSM		(1ULL << SNDRV_PCM_FORMAT_GSM)
+#define SNDRV_PCM_FMTBIT_S20_LE		(1ULL << SNDRV_PCM_FORMAT_S20_LE)
+#define SNDRV_PCM_FMTBIT_U20_LE		(1ULL << SNDRV_PCM_FORMAT_U20_LE)
+#define SNDRV_PCM_FMTBIT_S20_BE		(1ULL << SNDRV_PCM_FORMAT_S20_BE)
+#define SNDRV_PCM_FMTBIT_U20_BE		(1ULL << SNDRV_PCM_FORMAT_U20_BE)
+#define SNDRV_PCM_FMTBIT_SPECIAL	(1ULL << SNDRV_PCM_FORMAT_SPECIAL)
+#define SNDRV_PCM_FMTBIT_S24_3LE	(1ULL << SNDRV_PCM_FORMAT_S24_3LE)
+#define SNDRV_PCM_FMTBIT_U24_3LE	(1ULL << SNDRV_PCM_FORMAT_U24_3LE)
+#define SNDRV_PCM_FMTBIT_S24_3BE	(1ULL << SNDRV_PCM_FORMAT_S24_3BE)
+#define SNDRV_PCM_FMTBIT_U24_3BE	(1ULL << SNDRV_PCM_FORMAT_U24_3BE)
+#define SNDRV_PCM_FMTBIT_S20_3LE	(1ULL << SNDRV_PCM_FORMAT_S20_3LE)
+#define SNDRV_PCM_FMTBIT_U20_3LE	(1ULL << SNDRV_PCM_FORMAT_U20_3LE)
+#define SNDRV_PCM_FMTBIT_S20_3BE	(1ULL << SNDRV_PCM_FORMAT_S20_3BE)
+#define SNDRV_PCM_FMTBIT_U20_3BE	(1ULL << SNDRV_PCM_FORMAT_U20_3BE)
+#define SNDRV_PCM_FMTBIT_S18_3LE	(1ULL << SNDRV_PCM_FORMAT_S18_3LE)
+#define SNDRV_PCM_FMTBIT_U18_3LE	(1ULL << SNDRV_PCM_FORMAT_U18_3LE)
+#define SNDRV_PCM_FMTBIT_S18_3BE	(1ULL << SNDRV_PCM_FORMAT_S18_3BE)
+#define SNDRV_PCM_FMTBIT_U18_3BE	(1ULL << SNDRV_PCM_FORMAT_U18_3BE)
+#define SNDRV_PCM_FMTBIT_G723_24	(1ULL << SNDRV_PCM_FORMAT_G723_24)
+#define SNDRV_PCM_FMTBIT_G723_24_1B	(1ULL << SNDRV_PCM_FORMAT_G723_24_1B)
+#define SNDRV_PCM_FMTBIT_G723_40	(1ULL << SNDRV_PCM_FORMAT_G723_40)
+#define SNDRV_PCM_FMTBIT_G723_40_1B	(1ULL << SNDRV_PCM_FORMAT_G723_40_1B)
+#define SNDRV_PCM_FMTBIT_DSD_U8		(1ULL << SNDRV_PCM_FORMAT_DSD_U8)
+#define SNDRV_PCM_FMTBIT_DSD_U16_LE	(1ULL << SNDRV_PCM_FORMAT_DSD_U16_LE)
+#define SNDRV_PCM_FMTBIT_DSD_U32_LE	(1ULL << SNDRV_PCM_FORMAT_DSD_U32_LE)
+#define SNDRV_PCM_FMTBIT_DSD_U16_BE	(1ULL << SNDRV_PCM_FORMAT_DSD_U16_BE)
+#define SNDRV_PCM_FMTBIT_DSD_U32_BE	(1ULL << SNDRV_PCM_FORMAT_DSD_U32_BE)
 
 #ifdef SNDRV_LITTLE_ENDIAN
 #define SNDRV_PCM_FMTBIT_S16		SNDRV_PCM_FMTBIT_S16_LE
@@ -228,11 +227,10 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_FMTBIT_U20		SNDRV_PCM_FMTBIT_U20_BE
 #endif
 
-#define _SNDRV_PCM_SUBFMTBIT(fmt)	BIT(SNDRV_PCM_SUBFORMAT_##fmt)
-#define SNDRV_PCM_SUBFMTBIT_STD		_SNDRV_PCM_SUBFMTBIT(STD)
-#define SNDRV_PCM_SUBFMTBIT_MSBITS_MAX	_SNDRV_PCM_SUBFMTBIT(MSBITS_MAX)
-#define SNDRV_PCM_SUBFMTBIT_MSBITS_20	_SNDRV_PCM_SUBFMTBIT(MSBITS_20)
-#define SNDRV_PCM_SUBFMTBIT_MSBITS_24	_SNDRV_PCM_SUBFMTBIT(MSBITS_24)
+#define SNDRV_PCM_SUBFMTBIT_STD		(1U << SNDRV_PCM_SUBFORMAT_STD)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_MAX	(1U << SNDRV_PCM_SUBFORMAT_MSBITS_MAX)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_20	(1U << SNDRV_PCM_SUBFORMAT_MSBITS_20)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_24	(1U << SNDRV_PCM_SUBFORMAT_MSBITS_24)
 
 struct snd_pcm_file {
 	struct snd_pcm_substream *substream;
-- 
2.55.0

