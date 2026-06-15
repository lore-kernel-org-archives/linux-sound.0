Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619293DA7FD
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516449; cv=none; b=RjxaJw5Heg9dwmBBwC7STyX1y2dTnLcz7ungP+hlX8QAuVaarLaaP3AliN6ipQ6L1kK8DHR2BLDM3c7A+6xE5qUKUKkTbwvEOA5L+OAc4YEe5ZBYOQtxyOkL/qXecFRPf/7VRBZDR5LpE31kEg+JwXMXkgOFdpqAQJ8ingogUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516449; c=relaxed/simple;
	bh=uRKMa+0pM5/xNHpif3K5YMMQ7wGymJJ4S/rOeExb078=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B23gpS9Tdqdg7oAdaAaB76O/itbvTEkavLkUKO6Tn/lQADy64j39fi0peqoh8BvBiKEIC9QaaHdvOPuzQAR17ZNE/ZObGGvbk1wHqJtncQDPAXlHla6q8KraZxuTZjcFqJWNAT7yEYNP216OVbxpmb1o/9zMbP2bZoRBMx1HAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWW5+/nS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWW5+/nS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso1795476a91.1
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516448; x=1782121248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=rWW5+/nSwJcuMukAv3R1scyQcB4Vl2jAR1gQVvYVxic/N5PgtFCEJLQYbzDyeYcXEG
         pz93AqqaByLLk78X4gKpfLyayMM+2NDsezYvnusW+uBliFkKQqkD4YCvChzAFaJMOJC4
         SV6jaTEc9VFphtHcQ7YsZxV68WlVGzXaMfgEtsWxuAL4y3Co7BRaAz0bSL7YTP1ju+Vz
         +6SH36q4e/VUlQO/oIlkKYLF1t7slrHIfl7crCvFo5OuvWiA1MZlboBupeb60i2zSnF9
         VUTJmEGaXk9o2G5f8WfFU4sbBfCRFZW6KjxQBF7r++oi4PnYV5gdxfLOgn3lNd4WqYvr
         u+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516448; x=1782121248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=Hxx70CCFuEo9iPQ58tjQO6suuReT7hxEvEMMMs+93vWJcaJifyskKPDOGCjEKQGiCC
         St4ZoogTai7VdlMDsgVuhIbPOQHXwqm2UYznZgQiN9QOfVg10zZNOeEDgHHMJ5R895Pk
         ulWWqo+ADK0pBc7iplCcSpYqLw4VRW1ZZf2uiP24r6KydHvDsM4eStfK9/KRa+WZPQ7x
         jd60y2HZ78GTQ6moMYFb9kZK/AC2Llcl99WKuQodbx9pSGW5hqVVv3L4R0WN+XEEUOOF
         6ByX2hpIgLi0QAK2+CQt1qGHY0IGnCIzQadWO+Ls5R4x/8B2XyRKIohuId2CjiPOK6BQ
         ZIBA==
X-Forwarded-Encrypted: i=1; AFNElJ9SNQsK4h9RJAa4WSz8qToCZlfs2M27hYDJayVfY4csNxuBperWYDYxX6CETHmVOJpDeXy0/HSLN893hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcQgHpREOnuMVElYG6Kz9txW3kNmH/Yh9LRfJ2vOxYctv4gp7z
	3PrLFz52vFBG2WDbn0fa8OfrlfAGB0YZIL6BwUMtBe+fgB72YxWWC032
X-Gm-Gg: Acq92OHQvcWGNavgeA1HUuQGTVNxAQgyQfI7ZO0l0ca3yUyfE59GQK3DnvMjr21SvS9
	Y4EqTArCx2Cnx1seRXXmRCD3GV+nKKiioWqKfcPWnYeH+VG7+X7GzmsvqbO9wHZnR9xoXQyc397
	5vagpZLrKB0q369b3eqMC5tNF06PS8CD19HOcCyuaS0Qvyzo35o4oRzEfwvyZUm70zdFGKJ4/7E
	CSMdA8V1w3wBxDr82Od9gDa6FKHCPILi91KoPuy+/mbBiCqKKtgXYNqJiXMq8iUojh54PxZ4Js/
	o4jw1hVAnAUotZcqJluW3dI2qhwW01L0QRgQW83xX0umhb/nDuKDz6PZofLmjqqDMUNQIH/6Dmh
	0YbCffhJeT3rFdwwS92VQawwb1OAGcsMy7cV2MBFCWCeCBoxmibzHLI1cxmF2rmoFdG4p4SCEiF
	moaB+RsQ4btgLx//7Am4GtpaTVKccj2eyMHmiOb4lnrTcgFPiK0a/2PMriZw==
X-Received: by 2002:a17:90b:5583:b0:36d:5d1c:c4ad with SMTP id 98e67ed59e1d1-37a01f2d31emr14079846a91.9.1781516447765;
        Mon, 15 Jun 2026 02:40:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin locks
Date: Mon, 15 Jun 2026 16:38:21 +0700
Message-ID: <20260615093824.115751-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-audio-rpmsg.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 38aafb8954c7..b55dfbdb4502 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -22,7 +22,6 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 	struct rpmsg_r_msg *r_msg = (struct rpmsg_r_msg *)data;
 	struct rpmsg_info *info;
 	struct rpmsg_msg *msg;
-	unsigned long flags;
 
 	if (!rpmsg->rpmsg_pdev)
 		return 0;
@@ -37,21 +36,21 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 		/* TYPE C is notification from M core */
 		switch (r_msg->header.cmd) {
 		case TX_PERIOD_DONE:
-			spin_lock_irqsave(&info->lock[TX], flags);
-			msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
-			msg->r_msg.param.buffer_tail =
-						r_msg->param.buffer_tail;
-			msg->r_msg.param.buffer_tail %= info->num_period[TX];
-			spin_unlock_irqrestore(&info->lock[TX], flags);
+			scoped_guard(spinlock_irqsave, &info->lock[TX]) {
+				msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+				msg->r_msg.param.buffer_tail =
+							r_msg->param.buffer_tail;
+				msg->r_msg.param.buffer_tail %= info->num_period[TX];
+			}
 			info->callback[TX](info->callback_param[TX]);
 			break;
 		case RX_PERIOD_DONE:
-			spin_lock_irqsave(&info->lock[RX], flags);
-			msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
-			msg->r_msg.param.buffer_tail =
-						r_msg->param.buffer_tail;
-			msg->r_msg.param.buffer_tail %= info->num_period[1];
-			spin_unlock_irqrestore(&info->lock[RX], flags);
+			scoped_guard(spinlock_irqsave, &info->lock[RX]) {
+				msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+				msg->r_msg.param.buffer_tail =
+							r_msg->param.buffer_tail;
+				msg->r_msg.param.buffer_tail %= info->num_period[1];
+			}
 			info->callback[RX](info->callback_param[RX]);
 			break;
 		default:
-- 
2.43.0

