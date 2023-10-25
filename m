Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8D4C25B47
	for <linux-sound@archiver.kernel.org>; Wed, 25 Oct 2023 13:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344511AbjJYNXZ (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 25 Oct 2023 09:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234828AbjJYNXW (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 25 Oct 2023 09:23:22 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A42313D
        for <linux-sound@vger.kernel.org>; Wed, 25 Oct 2023 06:23:19 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0DFDF21DC7;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698240198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R2j5Y4lCgTEVAiVp2aDLcNV0NWkPPmGoVlhWzXjK3tg=;
        b=zE94Q8qyYdjxRhSl3avImmzXTlJNBk4C06bda5RUW/1v6rAFUZ94UHwc7osOTg9zt71usV
        FpmZ0WMWApEGoILfbGNA8n0kgTn0fJ8YDVJndb9gZh+73MDAhmrgtsN0k1jw3Rbqvh1jov
        hemyEfBQ1rY7VO8BHGaFBSiG47H0/Y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698240198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R2j5Y4lCgTEVAiVp2aDLcNV0NWkPPmGoVlhWzXjK3tg=;
        b=c+6FZmxFJu58/jFmXJRSBPub9Dj7bD2pCpv2EjIYhmrFxTsd7EKqpADtoSUHmFC2iZ34xf
        Kwyu8swGpzAboDDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E962613A9B;
        Wed, 25 Oct 2023 13:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QGNvOMUWOWULeQAAMHmgww
        (envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:23:17 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Subject: [PATCH 02/11] ALSA: pcm: Replace with __packed attribute
Date:   Wed, 25 Oct 2023 15:23:05 +0200
Message-Id: <20231025132314.5878-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231025132314.5878-1-tiwai@suse.de>
References: <20231025132314.5878-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
        none
X-Spamd-Result: default: False [0.90 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         BAYES_SPAM(0.00)[13.09%];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         MIME_GOOD(-0.10)[text/plain];
         TO_DN_NONE(0.00)[];
         BROKEN_CONTENT_TYPE(1.50)[];
         RCPT_COUNT_ONE(0.00)[1];
         NEURAL_HAM_LONG(-3.00)[-1.000];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         NEURAL_HAM_SHORT(-1.00)[-1.000];
         MID_CONTAINS_FROM(1.00)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_TLS_ALL(0.00)[]
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Replace the old __attribute__((packed)) with the new __packed.
Only cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index bd9ddf412b46..e1eabe9ca90f 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3089,7 +3089,7 @@ struct snd_pcm_mmap_status32 {
 	snd_pcm_state_t suspended_state;
 	s32 audio_tstamp_sec;
 	s32 audio_tstamp_nsec;
-} __attribute__((packed));
+} __packed;
 
 struct snd_pcm_mmap_control32 {
 	u32 appl_ptr;
@@ -3106,7 +3106,7 @@ struct snd_pcm_sync_ptr32 {
 		struct snd_pcm_mmap_control32 control;
 		unsigned char reserved[64];
 	} c;
-} __attribute__((packed));
+} __packed;
 
 /* recalcuate the boundary within 32bit */
 static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
-- 
2.35.3

