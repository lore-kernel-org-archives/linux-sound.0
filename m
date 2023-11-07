Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBAEC4332F
	for <linux-sound@archiver.kernel.org>; Tue,  7 Nov 2023 15:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbjKGPh2 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 7 Nov 2023 10:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235450AbjKGPhP (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Tue, 7 Nov 2023 10:37:15 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80123903B
        for <linux-sound@vger.kernel.org>; Tue,  7 Nov 2023 07:12:34 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0Nkl-0007Au-Ja; Tue, 07 Nov 2023 16:12:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0Nkl-007Jzm-1d; Tue, 07 Nov 2023 16:12:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1r0Nkk-00EaRR-OQ; Tue, 07 Nov 2023 16:12:30 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-sound@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] OSS: dmasound/paula: Convert to platform remove callback returning void
Date:   Tue,  7 Nov 2023 16:12:24 +0100
Message-ID: <20231107151223.3971602-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PTzxLgTOwXDgxRSdUjqNPNNBKFp2hbxEwQ6WqcxlIE8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSlPYuKnXRswMQBRLFQ7oea09r4Xuou9xUUUxb lm7UYi/sGqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUpT2AAKCRCPgPtYfRL+ TvcnB/4pLV782iLAjT/0W8/H+8jJqlS0ACWchy74zzgPLvmNa3RBf4zznwdm1Y1gnYl1q4NtKXn Nr43Lw731XIfR3v7QPP9cRmmVQ9IpSEbpPHXp8mvy4bgaptozFbFoGqpUjvdfon9s9WOK8vvTyh h34id2ZmvsBCLZhLeumc1RaBIu5R2Zj7vJXnZJF7Rh+l6QnQAGXPWF/o9vLPrTtf/gbpv3h1k4X NR4E2L2Ljr9u4ylbB/PM1bz7Sh+C7cGJX9KKODMJ1iAtIDL9qCZYh/9iMyV0JOe6ia40ZW2mbfQ mjC/HREtxBLCekc4sN5YV0ggP8s7nvdhhgL6s9PDQmJ3M3ae
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sound@vger.kernel.org
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/oss/dmasound/dmasound_paula.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/oss/dmasound/dmasound_paula.c b/sound/oss/dmasound/dmasound_paula.c
index 23cf8284ce36..0ba8f0c4cd99 100644
--- a/sound/oss/dmasound/dmasound_paula.c
+++ b/sound/oss/dmasound/dmasound_paula.c
@@ -720,15 +720,14 @@ static int __init amiga_audio_probe(struct platform_device *pdev)
 	return dmasound_init();
 }
 
-static int __exit amiga_audio_remove(struct platform_device *pdev)
+static void __exit amiga_audio_remove(struct platform_device *pdev)
 {
 	dmasound_deinit();
-	return 0;
 }
 
 static struct platform_driver amiga_audio_driver = {
-	.remove = __exit_p(amiga_audio_remove),
-	.driver   = {
+	.remove_new = __exit_p(amiga_audio_remove),
+	.driver = {
 		.name	= "amiga-audio",
 	},
 };

base-commit: 3ff7a5781ceee3befb9224d29cef6e6a4766c5fe
-- 
2.42.0

