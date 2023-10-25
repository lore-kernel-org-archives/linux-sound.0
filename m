Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEB7C0032E
	for <linux-sound@archiver.kernel.org>; Wed, 25 Oct 2023 13:23:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbjJYNXd (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Wed, 25 Oct 2023 09:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbjJYNXX (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Wed, 25 Oct 2023 09:23:23 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB9D132
        for <linux-sound@vger.kernel.org>; Wed, 25 Oct 2023 06:23:21 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A74B91FF67;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1698240198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xysczqMrEiqueG3bbfcO8N3mOgtDvChTFuMtLAEWII0=;
        b=BOtTqM/n10I9zd0BaoNLNcvOWJm+yLHbTd2b3U989y0X6QLIE24zYFE/yfgUKr4WS1+n8q
        ylop5bduIGWLvWOlf33BLoUMC+lVdRxt752wSRS6LeE30gJFOjYlg5Cxq96qJhqUpWl5/x
        pTKPjXc6TQjUKGP22PBmaxj3hZeuQYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1698240198;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xysczqMrEiqueG3bbfcO8N3mOgtDvChTFuMtLAEWII0=;
        b=VKDDKymUd4Fx9J0cjPryoCRYJFQYY6yV3gbcQDCp+rzjtVtdimVrA/xobgbjANr5llEgFA
        rq/R6qUJdMHhAIDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98A5B13524;
        Wed, 25 Oct 2023 13:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GL9AJMYWOWULeQAAMHmgww
        (envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:23:18 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Subject: [PATCH 10/11] ALSA: wavefront: Drop obsoleted comments and definitions
Date:   Wed, 25 Oct 2023 15:23:13 +0200
Message-Id: <20231025132314.5878-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231025132314.5878-1-tiwai@suse.de>
References: <20231025132314.5878-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

The header file contains lots of outdated comments and definitions.
Drop those as cleanup.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/wavefront.h | 51 ---------------------------------------
 1 file changed, 51 deletions(-)

diff --git a/include/sound/wavefront.h b/include/sound/wavefront.h
index 5360985bd183..ef6f46accf29 100644
--- a/include/sound/wavefront.h
+++ b/include/sound/wavefront.h
@@ -8,34 +8,6 @@
  *  Copyright (c) by Paul Barton-Davis <pbd@op.net>
  */
 
-#if (!defined(__GNUC__) && !defined(__GNUG__))
-
-     You will not be able to compile this file correctly without gcc, because
-     it is necessary to pack the "wavefront_alias" structure to a size
-     of 22 bytes, corresponding to 16-bit alignment (as would have been
-     the case on the original platform, MS-DOS). If this is not done,
-     then WavePatch-format files cannot be read/written correctly.
-     The method used to do this here ("__attribute__((packed)") is
-     completely compiler dependent.
-     
-     All other wavefront_* types end up aligned to 32 bit values and
-     still have the same (correct) size.
-
-#else
-
-     /* However, note that as of G++ 2.7.3.2, g++ was unable to
-	correctly parse *type* __attribute__ tags. It will do the
-	right thing if we use the "packed" attribute on each struct
-	member, which has the same semantics anyway. 
-     */
-
-#endif /* __GNUC__ */
-
-/***************************** WARNING ********************************
-  PLEASE DO NOT MODIFY THIS FILE IN ANY WAY THAT AFFECTS ITS ABILITY TO 
-  BE USED WITH EITHER C *OR* C++.
- **********************************************************************/
-
 #ifndef NUM_MIDIKEYS 
 #define NUM_MIDIKEYS 128
 #endif  /* NUM_MIDIKEYS */
@@ -44,29 +16,6 @@
 #define NUM_MIDICHANNELS 16
 #endif  /* NUM_MIDICHANNELS */
 
-/* These are very useful/important. the original wavefront interface
-   was developed on a 16 bit system, where sizeof(int) = 2
-   bytes. Defining things like this makes the code much more portable, and
-   easier to understand without having to toggle back and forth
-   between a 16-bit view of the world and a 32-bit one. 
- */   
-
-#ifndef __KERNEL__
-/* keep them for compatibility */
-typedef short s16;
-typedef unsigned short u16;
-typedef int s32;
-typedef unsigned int u32;
-typedef char s8;
-typedef unsigned char u8;
-typedef s16 INT16;
-typedef u16 UINT16;
-typedef s32 INT32;
-typedef u32 UINT32;
-typedef s8 CHAR8;
-typedef u8 UCHAR8;
-#endif
-
 /* Pseudo-commands not part of the WaveFront command set.
    These are used for various driver controls and direct
    hardware control.
-- 
2.35.3

