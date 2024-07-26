Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DC9101F7
	for <linux-sound@vger.kernel.org>; Fri, 26 Jul 2024 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722009132; cv=none; b=GEq2RY+bEKSv4s58X52h6s6iHNA7VmQUIAUAN28KP3Ozv+R+w7J1W+VJIwqiwFjcQSYArTKSDfW6jJbzOzOdZnoqO1lBNS1ocA2govgAPIVLpSSvnit06U4YfhV9raJ7BN8/UzTSYeIFv/ldRCcIS71e6A1MNcus47KazcQoIVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722009132; c=relaxed/simple;
	bh=ZkkAdD6i4WDmk/ry/WzzBwkX9EMQsetDO3Wyhu/w1p0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K5FBHQYr6d4+qDeapVtz0MAJaOI9yka/VBIt7fpeO36p6stYgA81jftbYTgJN74ON+8aB7wIOhIQA8mO9UZX11qbkEfWvoNFnuKbMj7JzylujG4V6x1KKInJp0L3Dg/mO4dMKHINVokBnTt9H/OsJ1DvagdwF+KPeqXA8H8sw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I1QlgX+G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VATvYnrZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I1QlgX+G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VATvYnrZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I1QlgX+G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VATvYnrZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I1QlgX+G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VATvYnrZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E6D121ACF;
	Fri, 26 Jul 2024 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722009127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yjLHMWqrgoqe7XPRtD63prhGnmbl3PM93EgtRAmvKFA=;
	b=I1QlgX+GqDnJRS1qiA7kR4OHb1z8PvzkdUelOkwBYGeMsuHgN3HM+1J7+oTkzhm70O0i03
	sq8Zm5VajJ1VzMZkWYhSQLc2ux/3kvHHvV2HDZflacuMiyJmWWVjkvmKG2p4q1ubhuBwjQ
	omIJSDjlP/aG3+s3lQ1xrannobHetGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722009127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yjLHMWqrgoqe7XPRtD63prhGnmbl3PM93EgtRAmvKFA=;
	b=VATvYnrZHAlYav3jVYdmJEl1cmzs/ejlHkw0k94i7tooemjSbEl1/2/5uQjZWuhOianGAe
	GeqIgpJvrLa3VMBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I1QlgX+G;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VATvYnrZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722009127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yjLHMWqrgoqe7XPRtD63prhGnmbl3PM93EgtRAmvKFA=;
	b=I1QlgX+GqDnJRS1qiA7kR4OHb1z8PvzkdUelOkwBYGeMsuHgN3HM+1J7+oTkzhm70O0i03
	sq8Zm5VajJ1VzMZkWYhSQLc2ux/3kvHHvV2HDZflacuMiyJmWWVjkvmKG2p4q1ubhuBwjQ
	omIJSDjlP/aG3+s3lQ1xrannobHetGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722009127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yjLHMWqrgoqe7XPRtD63prhGnmbl3PM93EgtRAmvKFA=;
	b=VATvYnrZHAlYav3jVYdmJEl1cmzs/ejlHkw0k94i7tooemjSbEl1/2/5uQjZWuhOianGAe
	GeqIgpJvrLa3VMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 534C61396E;
	Fri, 26 Jul 2024 15:52:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DSfSEifGo2agNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jul 2024 15:52:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Subject: [PATCH] ASoC: Use __counted_by() annotation for snd_soc_pcm_runtime
Date: Fri, 26 Jul 2024 17:52:36 +0200
Message-ID: <20240726155237.21961-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7E6D121ACF
X-Spam-Score: -4.81
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.81 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]

The struct snd_soc_pcm_runtime has a flex array of snd_soc_component
objects at its end, and the size is kept in num_components field.
We can add __counted_by() annotation for compiler's assistance to
catch array overflows.

A slight additional change is the assignment of rtd->components[];
the array counter has to be incremented at first for avoiding
false-positive reports from compilers.

Also, the allocation size of snd_soc_pcm_runtime is cleaned up with
the standard struct_size() helper, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Another missing one in sound/*.  It'd be appreciated if anyone can
actually check this annotation.

 include/sound/soc.h  |  3 ++-
 sound/soc/soc-core.c | 13 ++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a8e66bbf932b..e844f6afc5b5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1209,8 +1209,9 @@ struct snd_soc_pcm_runtime {
 
 	bool initialized;
 
+	/* CPU/Codec/Platform */
 	int num_components;
-	struct snd_soc_component *components[]; /* CPU/Codec/Platform */
+	struct snd_soc_component *components[] __counted_by(num_components);
 };
 
 /* see soc_new_pcm_runtime()  */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 724fe1f033b5..80bacea6bb90 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -326,8 +326,8 @@ static int snd_soc_rtd_add_component(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	/* see for_each_rtd_components */
-	rtd->components[rtd->num_components] = component;
-	rtd->num_components++;
+	rtd->num_components++; // increment flex array count at first
+	rtd->components[rtd->num_components - 1] = component;
 
 	return 0;
 }
@@ -494,7 +494,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_component *component;
 	struct device *dev;
 	int ret;
 	int stream;
@@ -521,10 +520,10 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	 * for rtd
 	 */
 	rtd = devm_kzalloc(dev,
-			   sizeof(*rtd) +
-			   sizeof(component) * (dai_link->num_cpus +
-						 dai_link->num_codecs +
-						 dai_link->num_platforms),
+			   struct_size(rtd, components,
+				       dai_link->num_cpus +
+				       dai_link->num_codecs +
+				       dai_link->num_platforms),
 			   GFP_KERNEL);
 	if (!rtd) {
 		device_unregister(dev);
-- 
2.43.0

