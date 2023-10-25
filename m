Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C772BC07545
	for <linux-sound@archiver.kernel.org>; Wed, 25 Oct 2023 13:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbjJYNX1 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 25 Oct 2023 09:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbjJYNXW (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 25 Oct 2023 09:23:22 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41AB186
        for <linux-sound@vger.kernel.org>; Wed, 25 Oct 2023 06:23:19 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0C9A71FF61;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698240198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qI5nFlWCa/o7ZB5k24PDcUIzDCcEg6eVN5y2u2sWATM=;
        b=oScP/t1K9FRSuFQm+GTy5QI6BrwCPiyfkwPEzzGzA9hbRPNtADYRo0cPYoaSMgL/BLenNX
        OBJ0h2LVm/WybE1Gi6gtDaNes0Fmxx/x588PerorScWXeIRvacVSseZntO4fmEXsj4UzzN
        Rl+ty24hoCV98r4jWK95/WGgvHeH9QA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698240198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qI5nFlWCa/o7ZB5k24PDcUIzDCcEg6eVN5y2u2sWATM=;
        b=JtdBeB1mCO5i4zTLz3+q2yBNFhAfzcjyYIFvlkqjkSDF2mDhYiykkW6Dm0SWhg4UPNbdTP
        tshWcS/Wm+D2kfCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3AA613A82;
        Wed, 25 Oct 2023 13:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OLwCO8UWOWULeQAAMHmgww
        (envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:23:17 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Subject: [PATCH 03/11] ALSA: rawmidi: Replace with __packed attribute
Date:   Wed, 25 Oct 2023 15:23:06 +0200
Message-Id: <20231025132314.5878-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231025132314.5878-1-tiwai@suse.de>
References: <20231025132314.5878-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
        none
X-Spamd-Result: default: False [0.87 / 50.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
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
         RCVD_TLS_ALL(0.00)[];
         BAYES_HAM(-0.03)[57.20%]
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Replace the old __attribute__((packed)) with the new __packed.
Only cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/rawmidi_compat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/rawmidi_compat.c b/sound/core/rawmidi_compat.c
index b81b30d82f88..2c6de6e113e4 100644
--- a/sound/core/rawmidi_compat.c
+++ b/sound/core/rawmidi_compat.c
@@ -15,7 +15,7 @@ struct snd_rawmidi_params32 {
 	unsigned int no_active_sensing; /* avoid bit-field */
 	unsigned int mode;
 	unsigned char reserved[12];
-} __attribute__((packed));
+} __packed;
 
 static int snd_rawmidi_ioctl_params_compat(struct snd_rawmidi_file *rfile,
 					   struct snd_rawmidi_params32 __user *src)
@@ -51,7 +51,7 @@ struct compat_snd_rawmidi_status64 {
 	u32 avail;
 	u32 xruns;
 	unsigned char reserved[16];
-} __attribute__((packed));
+} __packed;
 
 static int snd_rawmidi_ioctl_status_compat64(struct snd_rawmidi_file *rfile,
 					     struct compat_snd_rawmidi_status64 __user *src)
-- 
2.35.3

