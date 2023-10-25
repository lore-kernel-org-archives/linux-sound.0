Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E86C25B6D
	for <linux-sound@archiver.kernel.org>; Wed, 25 Oct 2023 13:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbjJYNX2 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 25 Oct 2023 09:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235002AbjJYNXW (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 25 Oct 2023 09:23:22 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19287184
        for <linux-sound@vger.kernel.org>; Wed, 25 Oct 2023 06:23:20 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 7D92C1FF65;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698240198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f4WTmmHaVpQttwKCBMI4vUSGzq03jOVDiqKIhfMa7mE=;
        b=AkbRN0yoLzQG6V2dtYhzWRCr+0ImrGFFB0cFWfVT/s/2MlOQMd16CicYZNT9LSQd9HByxr
        i3Dawh8es9EKclWY6VzDwRTA3Rujkqs10l7VTWA0whaXv9FSE/C1r8HgFSOIadRvlyGvQ+
        8KT4NHAb6VE5wUKIpXG8Ld/SjHnsh/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698240198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f4WTmmHaVpQttwKCBMI4vUSGzq03jOVDiqKIhfMa7mE=;
        b=YIQ/lWSSv4t/UyEE4kf21elw6o9EMyzEIAz5bYBsBO8qF27gzxx5zL5FN1cxGkpy84YODE
        D5Xd5MKl5ENpGKCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6756E13524;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id UM2SGMYWOWULeQAAMHmgww
        (envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:23:18 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Subject: [PATCH 08/11] ALSA: opl3: Replace with __packed attribute
Date:   Wed, 25 Oct 2023 15:23:11 +0200
Message-Id: <20231025132314.5878-9-tiwai@suse.de>
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
 include/sound/opl3.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/opl3.h b/include/sound/opl3.h
index ebf3852da9fe..052395a2f876 100644
--- a/include/sound/opl3.h
+++ b/include/sound/opl3.h
@@ -229,7 +229,7 @@ struct fm_operator {
 	unsigned char attack_decay;
 	unsigned char sustain_release;
 	unsigned char wave_select;
-} __attribute__((packed));
+} __packed;
 
 /* Instrument data */
 struct fm_instrument {
-- 
2.35.3

