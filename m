Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26341C6A0
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717001230; cv=none; b=io91+Pr7wszKBjJjvI/sM0uw2qf+tlqwlx1qGs93zGY3iYrHLc+9awtkM1mdbOOFefay2X+BVi3byOdh1zvY+llPYlYCHRU7SVewnCOX1I3hqKQBYREqyzSTv/AnWDZSsNGapaNImsj6MwLQwAEswab3jciJ6coN2DeDcjjHtrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717001230; c=relaxed/simple;
	bh=afgjzX5FW3bh2IvjlJ17REZkZrs1WYEZVS+dsfd85L4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbYsFU/R8IzD9cAi2pNLQYFUF9CKG6PNJyjZsUwdn0+WUQb6M3a60Os/0web1KnjrMSuRWJGA2z8po/I0GyrO25TWcp1z9oC0lXD7InWoGD4eyoowm5mBFlIer4ngEttzPLWr8RdPG531vLaBZVmm/CLZnLX20lg8T7wiFyNyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Us8Ld9po; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zsxop7Al; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zoE8gf/4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BQimbaZS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Us8Ld9po";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zsxop7Al";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zoE8gf/4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BQimbaZS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E81C6336E8;
	Wed, 29 May 2024 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717001226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dgi+QaiwgHuMCh03q17gaqOz64VZW0OMdGlgf1WPg8s=;
	b=Us8Ld9poS48CEaO8ECSV44a5Eowj+3PLGvHKbhVtIe621o2aeAp60+Q7h44dmxv978TW7H
	oceonHs5AwtvTtMwY2XKoIiD9K97ZqZy8Q4zzwRODA25oY2mTNq317lKCvqrxsiV0kmfAv
	Os0Zw1c+xquoxfkCgMaedEHnu6yqXis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717001226;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dgi+QaiwgHuMCh03q17gaqOz64VZW0OMdGlgf1WPg8s=;
	b=Zsxop7Al3uaG2wxlpegQJ9hsTLdrIJsTQyN5SasRpkxFNs85U9dnJBybjwCd/+oGfvPntN
	fk/jf1DxFt8skXAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="zoE8gf/4";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BQimbaZS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717001224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dgi+QaiwgHuMCh03q17gaqOz64VZW0OMdGlgf1WPg8s=;
	b=zoE8gf/4zZG1pht8kOfAMzo1RYhWOJbf1LI0xM0+ENXGZL1Xxx9yob0bnc2FK3yZXOIzKP
	iCBiHBKYDjrnddtWGZrxqO4lUxYNaaN/01QsdOj25LytZ5sQUs1f0RNE9GAtZan3mvbixt
	0UGKbKwjSAWtjF2Oy3Sqtu9KwmrTruI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717001224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dgi+QaiwgHuMCh03q17gaqOz64VZW0OMdGlgf1WPg8s=;
	b=BQimbaZSMOVuuvME+KIR+kVhClZP9+nJli2rQ0Gx7ptLRpAGy1QbhmAcMJC6i81DlAkFBp
	s9gHp1TuHN5rZFAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB36213A87;
	Wed, 29 May 2024 16:47:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qIN7MAhcV2bUDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 May 2024 16:47:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 2/2] ALSA: ump: Set default protocol when not given explicitly
Date: Wed, 29 May 2024 18:47:17 +0200
Message-ID: <20240529164723.18309-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529164723.18309-1-tiwai@suse.de>
References: <20240529164723.18309-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.88
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E81C6336E8
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.88 / 50.00];
	BAYES_HAM(-2.87)[99.44%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	TO_DN_NONE(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

When an inquiry of the current protocol via UMP Stream Configuration
message fails by some reason, we may leave the current protocol
undefined, which may lead to unexpected behavior.  Better to assume a
valid protocol found in the protocol capability bits instead.

For a device that doesn't support the UMP v1.2 feature, it won't reach
to this code path, and USB MIDI GTB descriptor would be used for
determining the protocol, instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: no change

 sound/core/ump.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 117c7ecc4856..3f61220c23b4 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -967,6 +967,14 @@ int snd_ump_parse_endpoint(struct snd_ump_endpoint *ump)
 	if (err < 0)
 		ump_dbg(ump, "Unable to get UMP EP stream config\n");
 
+	/* If no protocol is set by some reason, assume the valid one */
+	if (!(ump->info.protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI_MASK)) {
+		if (ump->info.protocol_caps & SNDRV_UMP_EP_INFO_PROTO_MIDI2)
+			ump->info.protocol |= SNDRV_UMP_EP_INFO_PROTO_MIDI2;
+		else if (ump->info.protocol_caps & SNDRV_UMP_EP_INFO_PROTO_MIDI1)
+			ump->info.protocol |= SNDRV_UMP_EP_INFO_PROTO_MIDI1;
+	}
+
 	/* Query and create blocks from Function Blocks */
 	for (blk = 0; blk < ump->info.num_blocks; blk++) {
 		err = create_block_from_fb_info(ump, blk);
-- 
2.43.0

