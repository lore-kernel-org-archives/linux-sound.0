Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD96C0018A
	for <linux-sound@archiver.kernel.org>; Sun, 29 Oct 2023 17:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjJ2RG2 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Sun, 29 Oct 2023 13:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjJ2RGY (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Sun, 29 Oct 2023 13:06:24 -0400
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C43C1
        for <linux-sound@vger.kernel.org>; Sun, 29 Oct 2023 10:06:21 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id AAEF91C2593;
        Sun, 29 Oct 2023 17:57:54 +0100 (CET)
Received: from fluffy-mammal.fritz.box (dslb-088-078-198-137.088.078.pools.vodafone-ip.de [88.78.198.137])
        by srv01.abscue.de (Postfix) with ESMTPSA id 5E8641C2590;
        Sun, 29 Oct 2023 17:57:54 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v2 4/4] ASoC: qcom: q6afe: remove "port already open" error
Date:   Sun, 29 Oct 2023 17:57:16 +0100
Message-Id: <20231029165716.69878-5-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029165716.69878-1-otto.pflueger@abscue.de>
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

The clock fallback for older firmware versions now represents a use case
for having multiple references to a port. Stop logging an error when a
port is requested more than once because this does not indicate a problem
anymore and causes unnecessary spam in dmesg.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6afe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index f14d3b366aa4..56b1407c30bb 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1592,10 +1592,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 
 	/* if port is multiple times bind/unbind before callback finishes */
 	port = q6afe_find_port(afe, id);
-	if (port) {
-		dev_err(dev, "AFE Port already open\n");
+	if (port)
 		return port;
-	}
 
 	port_id = port_maps[id].port_id;
 
-- 
2.39.2
