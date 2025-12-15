Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8D92E040D
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813055; cv=fail; b=HttNxY5L8c/WqzTykX6fFcA60I0KSlD2M+Fv9XA12TNUYlpu8DRh60GyiKPTV/PVhDGpCMLw9bN5u4/E+Um7fs3guis1C2K5lnbxm3NgDsFT9aZhCl1ooXBqtQl70mGMZlxqInTj0B88ylh29zJGPUNzeFd8E2HlzolDaOgvoJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813055; c=relaxed/simple;
	bh=jxfwDqbF9tQyskGpaCX9mswvuFN2c4pZ4NdxT/lD2ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y9jrwraIBMjAxIde/up9fRvIE3rcAQWDuDrxp8NJab/1qkg4UUOxHr1WRt9T5GxHrXzgqiLhNacwWrOqD72IKhEVUuPVHHaNjBREB9cKJWSzTwonHLKuZ/4maOLri9DM+e/voDKbsUSwC4pwLd4Ux+uqI1LLxppT1zigBVHT4mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T9yCh0WQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lpDF5LdY; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T9yCh0WQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lpDF5LdY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFEua2d1043494;
	Mon, 15 Dec 2025 09:37:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8X5vYAQfv9SVjTSnWj3J27akw0T/JHv5JmqWsV86dGo=; b=
	T9yCh0WQJgvX5oYSiME3AhEd2Z8lcl644ITG3EqhTavYFM/bp9FozrFiRJxkcxWG
	vvlipU6qCj92hx8FcJVL+gobZUZxCM9mzcKodohtx8MF2II36Tw5x4uAhe4jL1z8
	iMyPr5IaT+G2FWhj3jprK/5jLkzUeiXHIkY7jU5cV+POIqoky0acQa5x1i4hUt1E
	SpXr51K5hoPVAQexCDznvswvn33MpS9AGAqNFGdAmJvIWwiTdsf3kqLnu7KvdphJ
	hkGXKgVaWGk/vhJakjxXk0bmzcBHZuBx47t4rjn4TsNPBX4WmopFQvexyxJgKERk
	UZjpL1LrITtUR7nMI4a8jw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022107.outbound.protection.outlook.com [40.107.209.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b16e1t13g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 09:37:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=So7DbSdi/SDcfoNEddmoNivXvHWbVkHjooQD02L9Wtn4v9nfxvn8RhRNytu0JE4/HOZr/ngqfyng+SYUBzDRQQqFjsWM4pEA1c8z+qIJxyzmeYRus5g+DL0eQNTB6igGse968WD6ZGeMLDmR3lKbYOSeybxQXfV8y+5g6AkHc4jWMP5qB6WqWZfA4edEIlhCJgWXFKOgg8J8WGt9/uDwtfGkA8j+/jSmpfRezjpG38veeG8m0UNcOIYsSRW3dSmG0oToOIAlkBz7JnS/i6Qk36ZPY6tnjjb9MulAyM6U00niy8ilNuU7qF31bJEoQ1tr9vqN3tk6xshZXozU1E+h3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8X5vYAQfv9SVjTSnWj3J27akw0T/JHv5JmqWsV86dGo=;
 b=Hj25SFyF80Qr6w3zI9Q6CfkJQ2hQHuuLK4TqHmHSHFxAp/i3SD/kDXJlQKRETxRdPM5JHIgMgYuPXwz/H3ffjNDvm7iyoBnZNQIjO5cRARsg11HcHWpD0XGb+g23EmXol40arhYBdwqoQ57NVm2aAhv8M0b0FPOLGkLYytJ9MgqJ22wOJeJs/BHGqnkcXkkMliEBK32VmewNH7q9QM4nJC2vDnUFZJ8aPazR//I4oV/CGoIKV6LlEiTKeHOTaXFpxDkca6UlbPbVLn0pZNIY+gwx6JhbaVx3IHLhEGyQQUX+apvMnxrFLLwVx5bdMa+QAm/GiH9OPtIs9Ty7msuoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8X5vYAQfv9SVjTSnWj3J27akw0T/JHv5JmqWsV86dGo=;
 b=lpDF5LdYdGOOyO4MYbQDYPUn0m5qNlAu8ToKGAGHv/IyrOG8RsM1bD+6O9jL7+zjHQwQHXf+JHEUT3puX+2510awxSDv5wg9YyLpU50kzfJtD27E9B1OP3bbpqk+viHgHyBKeRvdJ+5cOBiBzx4kyP2wDvhyJikYbwP9fjC5PQI=
Received: from BN9PR03CA0504.namprd03.prod.outlook.com (2603:10b6:408:130::29)
 by DM3PPF1B31A7205.namprd19.prod.outlook.com (2603:10b6:f:fc00::70f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:36:55 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::9e) by BN9PR03CA0504.outlook.office365.com
 (2603:10b6:408:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:36:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 15:36:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 60E14406545;
	Mon, 15 Dec 2025 15:36:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 491E8820259;
	Mon, 15 Dec 2025 15:36:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH RESEND 2/3] ASoC: SDCA: Add ability to connect SDCA jacks to ASoC jacks
Date: Mon, 15 Dec 2025 15:36:48 +0000
Message-ID: <20251215153650.3913117-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
References: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|DM3PPF1B31A7205:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e21eb443-a2df-4f8d-8741-08de3befc66d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+D2qyHDBAQuKEARpMwUv0EzPR2TFZ9atzWr67Mkl/9IEj7aHTQhH1toBRFdE?=
 =?us-ascii?Q?nRkK/qeEi238J036L/H+uH7Bl/Ilga/DqQDwpJP/9syK0mYUgPYdKjLzkcJL?=
 =?us-ascii?Q?hdMaiq9Q/7/6O+lyYGVWvVZCCQ0lt8LWI0XiVix1IUypbK4wQIUR/Avg9LzO?=
 =?us-ascii?Q?NmU/LkrZZMpkXVWTj0Jf6dMBQTDRnEJQpTc673Ms8w2rJdAIH6MUX38WVqZU?=
 =?us-ascii?Q?kTJCzyZ7TxGMluIXUg2GALzb4jhTWMxW2nT1XqHvOm4OCkWB1FzO//KhX827?=
 =?us-ascii?Q?2p/0OixAyfAIoUnMBA4grTqeHCcASiAMnLOjKe23TAKB6WRI5vT1m78+eU4Q?=
 =?us-ascii?Q?WpkWjDcSd/y025TqGWWGGFVlXvf24BccAeZaht0B43CR3sAcpoU6qP0RRomb?=
 =?us-ascii?Q?r9SsY8gQN20/Mhs/d3cbuaUuXivB91EH2nX5d4YZOgoGr6H0Ws0L9pnkIFa6?=
 =?us-ascii?Q?YOLTW6DXvEJEkoIfbolNzSibzFAJrsUrF8hz0TRdnWtub/a7NLIqHUfqHRfY?=
 =?us-ascii?Q?r8oGQle5LF4YT+gXQqwk62eT9Nf05jH501MkMhk1ALauBInLufJ64JGdKP8E?=
 =?us-ascii?Q?tOTkHv47SW5Gsq8DXIzrVTnHp46PuciNIeeO6mOULcv/0whEqbuK6mgxI3nS?=
 =?us-ascii?Q?mK1Fw9QSI1Uuy9HC62GQvmpGP8AjKejVaFUjGGB7tVUlPsRkWs+f2bndvAln?=
 =?us-ascii?Q?nYU9yzqx6h4UYs5szRD6c5qaFRWcuqkVtmZvX9VDrr8H3f8GQqrQZDWTfS1O?=
 =?us-ascii?Q?Jbf14czdvCGPPDfsolTejXFGzXBICSm+tNqzhu2eA5KZbdnxGe5ibRLhR3Tf?=
 =?us-ascii?Q?KuwN1jGKArrIQ0mDiz365xGfFgB2A0G6kRDB3qTHKfp6sYki0xc0gTv2WaMh?=
 =?us-ascii?Q?hiQSheqgxr7r6W2ix17jUVL6QgfFWRnvPu4FcMWuenl5lOOF2yPKs1VfTaOc?=
 =?us-ascii?Q?ETYn4YsJ3cepcqNzBqr14LfLcEb2GbkxqRIUOoEVs84NobIJHxA0QERNaijy?=
 =?us-ascii?Q?/NHHm73kHsOGZC1dT0zoPLKCUf9LGGpjOMH8TIAnTJRtsstztq4j/+umFKki?=
 =?us-ascii?Q?4xJ/5H3nXDiq4D5Gg82m3/ELmwRSSwxMxp+Rj6HI34oRamfsRxAxJVfPj5fM?=
 =?us-ascii?Q?ApMltkyp8ToH29lQkOZcmCbrqeSRpvDaC8e8+4ZIFQd3dOup8mtipeMYuW2C?=
 =?us-ascii?Q?uq+y4iXpzgGgeUUzY/HoJ5tPkSPCx/oIB2rOVgHANOQubhvmxrDB89o4P6r4?=
 =?us-ascii?Q?1xZJYN5N83+zreIRqPMNwU+T8VzasyAmqnszYdusFFt4Y7wrIIN/AUPYK/b9?=
 =?us-ascii?Q?/EBQPmGNTCteDxX2Ouh1KwjjHvVS/E44vE+7pOIi0Hk/8GLpnEjuTbsgTtIv?=
 =?us-ascii?Q?6cHU0ISDF/CcRwZ4Z75Lqt/+BNV7yfB24rVHEZcS243CuAx8eszMkj389JvG?=
 =?us-ascii?Q?HbbUXm9j1VEHaudjR6TBrSSxrz20xBQqA9r8n0P96/alwMFcylbAckP+aQS8?=
 =?us-ascii?Q?kaEt9fChswaG+qb8RBfcJUGp9whC7yikkUwsuQm2aaDoRza7RcHHVNLBreii?=
 =?us-ascii?Q?ke82K9A7NfU9ikgXkcI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:36:54.3285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e21eb443-a2df-4f8d-8741-08de3befc66d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1B31A7205
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzNSBTYWx0ZWRfX8f10jjsXwyUv
 qdIEnrauiMi/AEf2leXpPB7r++z5p0EER+dEwkPniRsh25lPSMeGdk1O31XwBwEigEnui/VQcZd
 RBwnor//ssCzneWDO8IXXI6B++WbJ8m9/drNdp6OvKH5SKS/MjROIuIbFfg6GJZxpw7Op822h5m
 vxDWVy+6NVTOJiYDRMwAfoyWEHZFVE/JciL6YlSK4IOCIX392hwRIyiqI0AcyzJ4L5M3Pfa2dsh
 l4pBhiWCA1nmrLIqaIcxoPrYidza3QRz/5sXiPBqjoqqu5/O4MXb/9Ajmq/gY2NhPh6YPiDDbCv
 n+prlygBMSrwyMkHNXnlskcdOEpQoKrbuBscuPsLTe6jKvGJ8+44oPaIl97b6o2LciFjUhpYKmR
 KYSj0HKf41C9Y6ypU8izi0YLW1udLw==
X-Proofpoint-ORIG-GUID: 2T1lqICurxVuTb8xdH_kPtGPN_ROuJ6j
X-Authority-Analysis: v=2.4 cv=Qdprf8bv c=1 sm=1 tr=0 ts=69402b1e cx=c_pps
 a=eTkUf83celiOrjwTarmvrA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=CYD-5wu46CJa73xgJB0A:9
X-Proofpoint-GUID: 2T1lqICurxVuTb8xdH_kPtGPN_ROuJ6j
X-Proofpoint-Spam-Reason: safe

Add handling for the ASoC jack API to SDCA to allow user-space to be
hooked up normally.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_jack.h  |   5 ++
 sound/soc/sdca/sdca_jack.c | 106 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_jack.h b/include/sound/sdca_jack.h
index 9fad5f22cbb9e..3ec22046d3ebc 100644
--- a/include/sound/sdca_jack.h
+++ b/include/sound/sdca_jack.h
@@ -12,16 +12,21 @@
 
 struct sdca_interrupt;
 struct snd_kcontrol;
+struct snd_soc_jack;
 
 /**
  * struct jack_state - Jack state structure to keep data between interrupts
  * @kctl: Pointer to the ALSA control attached to this jack
+ * @jack: Pointer to the ASoC jack struct for this jack
  */
 struct jack_state {
 	struct snd_kcontrol *kctl;
+	struct snd_soc_jack *jack;
 };
 
 int sdca_jack_alloc_state(struct sdca_interrupt *interrupt);
 int sdca_jack_process(struct sdca_interrupt *interrupt);
+int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *jack);
+int sdca_jack_report(struct sdca_interrupt *interrupt);
 
 #endif // __SDCA_JACK_H__
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index 83b2b9cc81f00..5b9cf69cbcd6b 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -17,11 +17,13 @@
 #include <linux/rwsem.h>
 #include <sound/asound.h>
 #include <sound/control.h>
+#include <sound/jack.h>
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_jack.h>
 #include <sound/soc-component.h>
+#include <sound/soc-jack.h>
 #include <sound/soc.h>
 
 /**
@@ -114,7 +116,7 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 
-	return 0;
+	return sdca_jack_report(interrupt);
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_process, "SND_SOC_SDCA");
 
@@ -138,3 +140,105 @@ int sdca_jack_alloc_state(struct sdca_interrupt *interrupt)
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_alloc_state, "SND_SOC_SDCA");
+
+/**
+ * sdca_jack_set_jack - attach an ASoC jack to SDCA
+ * @info: SDCA interrupt information.
+ * @jack: ASoC jack to be attached.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *jack)
+{
+	int i, ret;
+
+	guard(mutex)(&info->irq_lock);
+
+	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
+		struct sdca_interrupt *interrupt = &info->irqs[i];
+		struct sdca_control *control = interrupt->control;
+		struct sdca_entity *entity = interrupt->entity;
+		struct jack_state *jack_state;
+
+		if (!interrupt->irq)
+			continue;
+
+		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+		case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+			jack_state = interrupt->priv;
+			jack_state->jack = jack;
+
+			/* Report initial state in case IRQ was already handled */
+			ret = sdca_jack_report(interrupt);
+			if (ret)
+				return ret;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_jack_set_jack, "SND_SOC_SDCA");
+
+int sdca_jack_report(struct sdca_interrupt *interrupt)
+{
+	struct jack_state *jack_state = interrupt->priv;
+	struct sdca_control_range *range;
+	enum sdca_terminal_type type;
+	unsigned int report = 0;
+	unsigned int reg, val;
+	int ret;
+
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   SDCA_CTL_GE_SELECTED_MODE, 0);
+
+	ret = regmap_read(interrupt->function_regmap, reg, &val);
+	if (ret) {
+		dev_err(interrupt->dev, "failed to read selected mode: %d\n", ret);
+		return ret;
+	}
+
+	range = sdca_selector_find_range(interrupt->dev, interrupt->entity,
+					 SDCA_CTL_GE_SELECTED_MODE,
+					 SDCA_SELECTED_MODE_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	type = sdca_range_search(range, SDCA_SELECTED_MODE_INDEX,
+				 val, SDCA_SELECTED_MODE_TERM_TYPE);
+
+	switch (type) {
+	case SDCA_TERM_TYPE_LINEIN_STEREO:
+	case SDCA_TERM_TYPE_LINEIN_FRONT_LR:
+	case SDCA_TERM_TYPE_LINEIN_CENTER_LFE:
+	case SDCA_TERM_TYPE_LINEIN_SURROUND_LR:
+	case SDCA_TERM_TYPE_LINEIN_REAR_LR:
+		report = SND_JACK_LINEIN;
+		break;
+	case SDCA_TERM_TYPE_LINEOUT_STEREO:
+	case SDCA_TERM_TYPE_LINEOUT_FRONT_LR:
+	case SDCA_TERM_TYPE_LINEOUT_CENTER_LFE:
+	case SDCA_TERM_TYPE_LINEOUT_SURROUND_LR:
+	case SDCA_TERM_TYPE_LINEOUT_REAR_LR:
+		report = SND_JACK_LINEOUT;
+		break;
+	case SDCA_TERM_TYPE_MIC_JACK:
+		report = SND_JACK_MICROPHONE;
+		break;
+	case SDCA_TERM_TYPE_HEADPHONE_JACK:
+		report = SND_JACK_HEADPHONE;
+		break;
+	case SDCA_TERM_TYPE_HEADSET_JACK:
+		report = SND_JACK_HEADSET;
+		break;
+	default:
+		break;
+	}
+
+	snd_soc_jack_report(jack_state->jack, report, 0xFFFF);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_jack_report, "SND_SOC_SDCA");
-- 
2.47.3

