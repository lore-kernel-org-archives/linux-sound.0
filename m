Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lelqUOS2"
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807A697;
	Tue, 21 Nov 2023 07:44:33 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AL50Bcw022405;
	Tue, 21 Nov 2023 09:44:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=t
	f4vV/JGXrNZcmaJSXi5sFq5mqc/1CJfPKpZ9T2m2+c=; b=lelqUOS2eeAEi2KwN
	a1Ml983FjtjOJX78sgho9xMQYWqz+83e258nyndiR/eDl3x/sQ61Pi1Ouwal0K05
	JyIK6rEaSzcPtwYzNUA2SfELMiwk+gO2lzP5uESRo6EyIJYUdwZ6H1xnOWq7cMTM
	XBa0zEBaQGddDLzqAIhedHTBOrX0VghWYElZcZEEgrLIv88GjxKWT/rgHGard253
	x72o/4zv9y4gwCOuN2M2VcBwQHaIrnitf/GEYimFGXnkvezjD7PTvJfgq8l6uVxp
	FWOnrljYsk4A2B2BOgQotjFh9MeLQ4TvfJAHrjbcoURPtDPpjAqWRYx35714BEwI
	YubJQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uetjpbc77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 09:44:25 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 21 Nov
 2023 15:44:23 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Tue, 21 Nov 2023 15:44:23 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.65.98])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6E158B12;
	Tue, 21 Nov 2023 15:44:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Enable low-power hibernation mode on SPI
Date: Tue, 21 Nov 2023 15:44:19 +0000
Message-ID: <20231121154419.19435-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IDFertXpDvP9COE2sNlOkT0gzg_1l1BG
X-Proofpoint-ORIG-GUID: IDFertXpDvP9COE2sNlOkT0gzg_1l1BG
X-Proofpoint-Spam-Reason: safe

SPI hibernation is now supported with the latest hibernation/wake
sequences in the shared ASoC code.

This has a functional dependency on two commits:

commit 3df761bdbc8b ("ASoC: cs35l56: Wake transactions need to be issued
twice")

commit a47cf4dac7dc ("ASoC: cs35l56: Change hibernate sequence to use
allow auto hibernate")

To protect against this, enabling hibernation is conditional on
CS35L56_WAKE_HOLD_TIME_US being defined, which indicates that the new
hibernation sequences are available.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda_spi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/pci/hda/cs35l56_hda_spi.c
index 756aec342eab..27d7fbc56b4c 100644
--- a/sound/pci/hda/cs35l56_hda_spi.c
+++ b/sound/pci/hda/cs35l56_hda_spi.c
@@ -21,6 +21,10 @@ static int cs35l56_hda_spi_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	cs35l56->base.dev = &spi->dev;
+
+#ifdef CS35L56_WAKE_HOLD_TIME_US
+	cs35l56->base.can_hibernate = true;
+#endif
 	cs35l56->base.regmap = devm_regmap_init_spi(spi, &cs35l56_regmap_spi);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
-- 
2.30.2

