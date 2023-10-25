Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848E7C07545
	for <linux-sound@archiver.kernel.org>; Wed, 25 Oct 2023 13:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbjJYNXf (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 25 Oct 2023 09:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343843AbjJYNXY (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 25 Oct 2023 09:23:24 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33BD5133
        for <linux-sound@vger.kernel.org>; Wed, 25 Oct 2023 06:23:22 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 9918E1FF66;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698240198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sCia2dluDMjEQF//V0XB7Gb4BqtZKyvD1BXTCR1yKwI=;
        b=vpIofsxKE/30MWD7dKzLkTjkvki+DuzjrQhdtgUFvTh7Cc+vKFKDomxn4ZstI/Ue2gp99e
        BL9cdB1eq12iTSviJH4tv+0R+kclMzIT91SpHvqN4+FZJlFNwMpZQ3aGUPxjFLCtg6sQAN
        KZE7YqnaFpj/5dgswubKMFLFNcInJG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698240198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sCia2dluDMjEQF//V0XB7Gb4BqtZKyvD1BXTCR1yKwI=;
        b=FTX5rXIdILUn9McwG7ePst3JVemvVbikJTZZEfRi2KPAzwAosZbOrt/QrJIL7oRygIPYma
        vCxlHgUnCps5OtBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D28913A82;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YDQRHsYWOWULeQAAMHmgww
        (envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:23:18 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Subject: [PATCH 09/11] ALSA: wavefront: Replace with __packed attribute
Date:   Wed, 25 Oct 2023 15:23:12 +0200
Message-Id: <20231025132314.5878-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231025132314.5878-1-tiwai@suse.de>
References: <20231025132314.5878-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
        none
X-Spamd-Result: default: False [0.90 / 50.00];
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
         BAYES_HAM(-0.00)[32.50%]
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Replace the old __attribute__((packed)) with the new __packed.
Only cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/wavefront.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/wavefront.h b/include/sound/wavefront.h
index 37ed437e2123..5360985bd183 100644
--- a/include/sound/wavefront.h
+++ b/include/sound/wavefront.h
@@ -468,7 +468,7 @@ typedef struct wf_alias {
     */
 
     u8 sixteen_bit_padding;
-} __attribute__((packed)) wavefront_alias;
+} __packed wavefront_alias;
 
 typedef struct wf_drum {
     u8 PatchNumber;
-- 
2.35.3

