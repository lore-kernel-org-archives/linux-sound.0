Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDA0C25B47
	for <linux-sound@archiver.kernel.org>; Wed, 25 Oct 2023 13:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbjJYNX2 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 25 Oct 2023 09:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234995AbjJYNXW (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 25 Oct 2023 09:23:22 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D13185
        for <linux-sound@vger.kernel.org>; Wed, 25 Oct 2023 06:23:19 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 669B421DCC;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698240198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vRlwboOdmkgttIHTHC/j+v9+vbbtO2mHYzZAjBvcu80=;
        b=UiP1PLb8jUg0wrftYLcTai+M638x1WF0+R5HIBdimqR25Kefjmjnzd2mC1koVXHhtSG5Ao
        1pd6YgPfbCjvo5Fv4Xsdebs0WSwWCzYmYvc9i9TGo+LkoUKzuSo5jVJa//fF6yM28Q+3RB
        Dl0XpFgelbfDcYrhWv6wBBQo0QZ8FQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698240198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vRlwboOdmkgttIHTHC/j+v9+vbbtO2mHYzZAjBvcu80=;
        b=Muk1X0laFX1C9Edgdg7rTnW987UAv+Jyu3GWeK233u8ykAJoQUkGCa4TslR8RO57oSwrkR
        3hyFXNsRgeGqTdCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F68A13A82;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MNX7EsYWOWULeQAAMHmgww
        (envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:23:18 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Subject: [PATCH 07/11] ALSA: aoa: Replace with __packed attribute
Date:   Wed, 25 Oct 2023 15:23:10 +0200
Message-Id: <20231025132314.5878-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231025132314.5878-1-tiwai@suse.de>
References: <20231025132314.5878-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
        none
X-Spamd-Result: default: False [0.81 / 50.00];
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
         BAYES_HAM(-0.09)[64.42%]
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Replace the old __attribute__((packed)) with the new __packed.
Only cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/aoa/soundbus/i2sbus/interface.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/aoa/soundbus/i2sbus/interface.h b/sound/aoa/soundbus/i2sbus/interface.h
index 16fa88822d2b..a136274266ea 100644
--- a/sound/aoa/soundbus/i2sbus/interface.h
+++ b/sound/aoa/soundbus/i2sbus/interface.h
@@ -34,7 +34,7 @@ struct i2s_interface_regs {
 	__le32 peak_level_in1;	/* 0x90 */
 	PAD(12);
 	/* total size: 0x100 bytes */
-}  __attribute__((__packed__));
+} __packed;
 
 /* interrupt register is just a bitfield with
  * interrupt enable and pending bits */
-- 
2.35.3

