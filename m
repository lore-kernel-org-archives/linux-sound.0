Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CFAC07545
	for <linux-sound@archiver.kernel.org>; Wed, 25 Oct 2023 13:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234993AbjJYNXW (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 25 Oct 2023 09:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234415AbjJYNXV (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 25 Oct 2023 09:23:21 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66281132
        for <linux-sound@vger.kernel.org>; Wed, 25 Oct 2023 06:23:19 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2178B1FF62;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698240198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TLbG5gnkwY7SZtx2DKziAS2iuNo6b7NBEBVxGKGqxdc=;
        b=B6HONxXIJkINdtPYh1SSGrLlqLU3KPBCZLacvTnpQ4d/bQqEdm1YRJU2JtHbmlWguE4A8W
        rJ1RFqHQ0fHEUzM6e4yZUCkwDectoaLm23dZyePFzyHtnZ1iIQee9/+fHgeeM8e9qp9IxL
        QfCKk1qVZ7RQoQct4KIFuoKQtr3cPbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698240198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TLbG5gnkwY7SZtx2DKziAS2iuNo6b7NBEBVxGKGqxdc=;
        b=LDLlS2gUtpTlB01RoTlHn4rH0AMXQNSdkjYObpEcg0L5A+UpAGZPEbNTr8U9jjfnUf8xDn
        VVuG1RMDMNvNm9DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B71513524;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id KFpTAsYWOWULeQAAMHmgww
        (envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:23:18 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Subject: [PATCH 04/11] ALSA: azt3328: Replace with __packed attribute
Date:   Wed, 25 Oct 2023 15:23:07 +0200
Message-Id: <20231025132314.5878-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231025132314.5878-1-tiwai@suse.de>
References: <20231025132314.5878-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Replace the old __attribute__((packed)) with the new __packed.
Only cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/azt3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 0c6754bf9455..431f0026b507 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -1383,7 +1383,7 @@ snd_azf3328_codec_setdmaa(struct snd_azf3328 *chip,
 			u32 dma_start_1;
 			u32 dma_start_2;
 			u32 dma_lengths;
-		} __attribute__((packed)) setup_io;
+		} __packed setup_io;
 
 		area_length = buffer_bytes/2;
 
-- 
2.35.3

