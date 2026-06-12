Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210323EFD32
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270863; cv=none; b=RdoDHtO3t4YWp+vUqqoaSs/ZLmj49Ix5n4H3ySWLcTnIahHF1pUxRDst7gb0AAKtoBKNIrZTsuP/dVumUmI3ReNrmZOw3KEw16tXMNbrqlN8ywAyr4IPFXhgvvR3qE472sJh9INSDPZOU4fgOwAr2VHvPmPDfNCz1nqeeqNE5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270863; c=relaxed/simple;
	bh=uRKMa+0pM5/xNHpif3K5YMMQ7wGymJJ4S/rOeExb078=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNVrtKro9VOmYHX1HruUunVrI1CcmswOcak5zLUvWJvqN/MGr6uPoFrsvOnuySMOWLhVg9QYqIEZKT+VS66nrGbPmGhNt/ma558AK5j7OCLRtu86j+afK4ARu6ffl5ss9UZaqfTgqpgk8lEUjoYKfieM5TX9lwxsEReILtCXWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2U+XjtO; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2U+XjtO"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30749947917so2925033eec.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270861; x=1781875661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=H2U+XjtO9wpohV1BFn7QnK3RKkT+7b94Yzdkw//yL5FrdAHKeQbsr0hH2MHsUf5Yrj
         qbCzYdhFestfMBOsO9WHSwaJ9kEtUU5jQnp3DwTWT0l4uQx5ehDFDZpc8bYlU4BzBjSL
         18uPsPSb8Y4RaJ4McczblNg4EtLSS67YmUoCj8nQV4GNqzNGywI2eTIYmSXxlY6dsdNd
         FmEOg8kpuaen1stxxG9uLwXAACdrDKnNd3BbUfPJhG/XxeW9nHdJEf/tei0Yuq5OeIy5
         CDuQ3PMocOdIXO72KplFWbPMa7/DD//JezniXd9MK4UpNYQdN1Z8kxSCD+oAQFPwBSSL
         UkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270861; x=1781875661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t/AXZy6D5BbhT5x9hx+suwKOnmd8LSBhmzi01ciTQP4=;
        b=U2rALWbT8/FEYyCf2ZhDZjSW98c5vISVnWI+mPxaz9AhCCH8frMoRBc+D+aKJw5y6S
         AdVgs07I+zeELrmbxVVaxxd5nMZotqjBvTGnYb2dcMza9gucPbwNTKU4g1gjcsd1XuwK
         2XTbd54GEuMFJH8AhTEEL7OVxr1Xl6l6fTHhmgU35kX8bfxmizyOfBzkj+SLmGqEWBWL
         xiQx5cfM8gqIXeq1BvP4SxmlH93Y2DDihECtN3Vsre3yykwIcu5Z7FxmalrSXYnUjmvS
         iRX1H4hbKLVnfgmJ+YxmEsP8KvBBYx393LsHZTmz0SibwTzNmT8Ye2CAC3erB7d7B+vp
         YpIQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oXooNZZr3xg0SHlsnhfV8YEH+4ZuHhyQsF4UC8npBFF1pKwfArtq7d6tQPyXKgE3FeBX9dH9A0cogoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQqcYyHb4aYXcHSbqgYUctcqvZ/mnGeGn/Sv/NVUPxBag9i/HM
	/GZX2CNZXnmUOm8F6QSigjFu/xisWVzoMspeHDlsBsyK1OP+4NKg5la8
X-Gm-Gg: Acq92OELXwGYUY+ZrxQdMVs1q32aunq5i3o8eHZdnNjSpFI8MawRXL7p2Rh89r5lI/R
	2udG08lTFhEwNU+BWIdzigLKkXqi7LfEAxyNaXoZetKoH+RrRBds6WQveOt9dMt4H6kgDCmdNor
	/p6SkrdEDYc5Y1fvBE/8nbb252es6LP/vn/PD+qstcR+dmrjDikGo/IAyYPwe10AagpEHKb/dbw
	n6ccHbL4JrPtIBcSvPzMPcqMjMotqZAzlHiOY8KKwJ3MoIeeiZrwXcAGbwD7m9UJB+2cIun+0wA
	9T35VIH5fHtgU3KUDfSHvQLaDff/MXx/xy8Q2GWuiR6r47uKkYyRJqWChkIR1lXeqlj2xmXBMWq
	N9/8LzThh4+GQhvXMKMoejCd2QDmoMMqSTfcyFmUS4j08yXRovD+62HnVUpFjpNdAVzye1Ef+Rk
	mp45bKDWppEFQ/BjdSKHUKYkd3MkbT/7p8hORSVfGEwAyG0YaW9G+MV7k3eQ==
X-Received: by 2002:a05:7301:60d:b0:2be:2cfe:68b7 with SMTP id 5a478bee46e88-3081ff9ae90mr1661153eec.11.1781270861204;
        Fri, 12 Jun 2026 06:27:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:40 -0700 (PDT)
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
Subject: [PATCH 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:36 +0700
Message-ID: <20260612132639.78086-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
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

