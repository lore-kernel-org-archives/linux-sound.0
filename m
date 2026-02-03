Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF5C1E5B88;
	Tue,  3 Feb 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079154; cv=fail; b=CAt0/g9JJJ6ht3QNa2l20snYEu8GPC9byw8P/MbjEDwyud0q3PVRibS1V9m7QrBFlH8nJKvzuLGXKruz/CjpBXfQiUaWu1+H7DF58EMzkVdMoFJcGXNjO3Dnb/fghGgUvb5RjjE/Faao4aie8/ooR0RWzzkEiZoHnHvt82Hw/GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079154; c=relaxed/simple;
	bh=Dbm/fDZP2YiX1KprE5ngpp5v1taMj9//9lNEnranviA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h4CayNcmgUoTMIanb1+Rx0YqVbMK9RNTpZCPlhAMHJISMkUEtznphskHTkVwaA6PQqFy1c11JS9zZAUn5r5uIeQIpJAM4Dvf67oSgVtw2DEgfqN/FsHlraJgQh+6NlSLMNs2JTpvZM629IoZmpRzZ+eIciDPu6+cDQNgHfVyLqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E+Tk3oDU; arc=fail smtp.client-ip=40.93.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E+Tk3oDU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhhsMxOWo5W0cDsHFjtHZQOj2CSD0y1M+0zu7kEPLGF+cE6ULoUbn/7ZripZwFfDBB8/Enm5U3cK7chmVJbHaaPR0uHrraypQw5xSQSc+K/rEfIrm1onWnwIrw0o7dO2qBFJddOn/qlPKSuQekGos78jilZcocElHXhfqbNH3SveQDjfg1TjWiDywcWEu8KcybvydX/LoSz7BSGJCQUmoEeUkv1fuMc/xsLTMiKad51rMa4XEdOKaXHk/OrdBm6tSPUG5U3MVwcKjW+9/fiVVfaCPgS/xHE8nUGKd5SHkOW6ytCuAJtF3ldDSAi2JBUZ5N3ZkHPMahkqhtQQeZRv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ddHxbQDJsG0dru79iLz6pqfUyZBxtqKATt/7eKUb54=;
 b=i5pKc8+pSfq/ZB6YqTNQHmOmgHaRGalGDl9+WqJx/YmalYaJc9KvDPf8HceymPjp7kRMLDX9130ZIocjmXG9DQDh4U4Qt+ijdZ9VuEpa9qXUITL74RKYLH9J4ZI6VnJ3vP1lpcv+Btbib5mmlZpB/dLIfpZBYD/EwXa84fYKxme9yDUprAKX5sO4ImJ6nFzhOQwS32624ZQ67pjI4krCJ3iwjHruruDJ3btJH+lkkHMEsaY3h5wYofJ8U5OXPVfUZ9cObQmG8/kQq+ptr5jzuP9ouZKJGWLkzEyiLG1J7THDcSEQH0atvccgxhzPSjTPKplMWSs2ktHQfmHrK5BDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ddHxbQDJsG0dru79iLz6pqfUyZBxtqKATt/7eKUb54=;
 b=E+Tk3oDUHGgQdVYwIyx9bfSggfYr3I2CZb3MK5Zxs+wC/lweQ7zqB5A4YErp/06yb7fgq6zPWHIYtShWbDPCinVyOyd5XaDLUI0FEQ5CR0Y+y7YXjDDs5aiCzqTFhhncaaikzW2h1J8XIL/y+C9WZbMnJv/ZS7ps8xX7gD5eLkI=
Received: from PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::7)
 by BN0PR10MB4822.namprd10.prod.outlook.com (2603:10b6:408:124::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:39:08 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::8) by PH8P221CA0058.outlook.office365.com
 (2603:10b6:510:349::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Tue,
 3 Feb 2026 00:39:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 00:39:07 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:06 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 18:39:06 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6130d6vg3043936;
	Mon, 2 Feb 2026 18:39:06 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 4/4] ASoC: ti: davinci-mcasp: Add asynchronous mode support
Date: Mon, 2 Feb 2026 18:37:03 -0600
Message-ID: <20260203003703.2334443-5-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203003703.2334443-1-sen@ti.com>
References: <20260203003703.2334443-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|BN0PR10MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e75eb3-da17-4bf2-ea24-08de62bca3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xVWIkYELFnJ1I1x1QA7/0uLqsFt+gjmtoqh24EDNY1ivkZ9VZBbft90QEPfC?=
 =?us-ascii?Q?9suT32ysn9NasleVDEQ+AJAkAlxPtPHHw6r9e+7LoOmvxqDFr/PkkaZJk0hI?=
 =?us-ascii?Q?httHRQaE0mGnI7cL6ZUMt7YymwoP04fr61XrowZJWR4D2+XTkY6DCjtTNDUb?=
 =?us-ascii?Q?0hDfzuWmLaQ/xOKJphuwErkDsQVIaWl8aMDr6vL7Y+AdFQJjF3iOMUnvhcuQ?=
 =?us-ascii?Q?XKP564qVpLK1E6pcZVrFIx2rJb+zBvpb3dBfsg3+PXaFfDj2qroYc5sbMjTF?=
 =?us-ascii?Q?HucP24oqlXH9mKKLJ4a+Z4M+zftS3W/fBzpbfWAvUNgPQ1GogNlubGhAL9Cn?=
 =?us-ascii?Q?edLxTrfKl23d0ThowJWA9Z0WOGJUtDfpXO0NLi4/GQDyQoDPAE/jFs1SCC7T?=
 =?us-ascii?Q?af6F0bcMHyNYOnYJxCDugr32/Sywfq19NEF3VYFCqdFeyP0OhAIEmRzfqCe/?=
 =?us-ascii?Q?UY1nzYTwr8wWe915AsABQ8bQx9I1jNJZdH3/SVguC0oXcy7uz/27DmL3fB1i?=
 =?us-ascii?Q?ytbW6iOPqliW9/Y20mEy07Nn80S6E9Akb87wJeUmmBapt0wIbUhafoSs+mwf?=
 =?us-ascii?Q?pmyzwffYAaoUmwr4oY3s8/UuopyKpXJujKPhijZVVkKcGAC2xOqcU7hUYDui?=
 =?us-ascii?Q?f1pYDRXeKHFomzUADKT6Cn+tu0tPaS2AvoZZlOR6NUb3koAYuufpXWyr5W9b?=
 =?us-ascii?Q?qiV7q4dTutFiRaAqr+cTNLNm1BKdN5QgtB3T+OmAfUn2FCgqyaqNCHddnciX?=
 =?us-ascii?Q?Lm1ot+MdAy2vTfSprwQv6u5KpS++qU/c/3pRkSCp2w4L66XYG8fM8h/6aN8B?=
 =?us-ascii?Q?sJxgIuZTLKJERJXElPHX/iGuGkdgVV8TCf+NpCl62+clNAHqt+z9VCzT/rmG?=
 =?us-ascii?Q?V8xfJc6YvOrxu1LKKkqmBT7O1vonOCcXXh4IC2ZkAwalxXMjNUnkjTJVhGNu?=
 =?us-ascii?Q?D28HSsAVPP4EFCOQa+g17wUoqO4s1+YGFITCPPJeiCp5hlpWzqgJ/mce0mFA?=
 =?us-ascii?Q?6Ex0z8LlrTiOIPY29IF607OQ2zsEPbF4McEgO5EusjBk7D9bEFX6URqlVliR?=
 =?us-ascii?Q?amYUFUNrq4TpXUy6PRViILoG6DnYGdBDg8o6cdnx4bstBsjRMaM/9PK2ctKJ?=
 =?us-ascii?Q?dt+cTwCOjFnOVYzpfWfjhH9DmsTE0lyHaU0J70v079BFXrhbonlU5uUzg7gQ?=
 =?us-ascii?Q?MgvMG500Lgihep2mj4eFilpfbxlhGlEUdp4dNlkKtnEEIVYBKLiJUWlGgXX3?=
 =?us-ascii?Q?PubMwKqoVbp2DY9Fe5indmDcqTgXRJZUQpoUdla+sPrU8lNfev2dll877WRU?=
 =?us-ascii?Q?VRCAx6xIlDux+mB6pcq+WUzuZKYve2mjUKYPLvYrRkgfZZF6wQzDHigzsLRt?=
 =?us-ascii?Q?M3PS9c87mR2aGf1AdyKblzexyveqq/W1AAjudiiBefv116IEWX0XRAn8A49A?=
 =?us-ascii?Q?f4ATZpu4rto4Grj9RVhhfmcHVWN6kIJ20bXK7Ki+W+B9/JVQ0h6dNf0Abk1W?=
 =?us-ascii?Q?pZVcPt1sla1keWN4BvtOuZE0EKoURRVuqQqRexTwzUMQuXuaExZ8Gyfy/4ce?=
 =?us-ascii?Q?gCD6gPOKDEf6vtCKFVxl1V/6x8Dt8v34nWSBJIJD88Tvye7z8E/aFXzpTp3v?=
 =?us-ascii?Q?l7LujlseyNVGwWyZLh0pLmaXeYihZu2taZ4jJ4nUtIbwy+1/gk/nLkNxL7iO?=
 =?us-ascii?Q?vl51Og=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g1Ghe7xOzfrbddc+xIQNAT4kcVgtn9ONcDZmkWy/BXfAgYUTA/2qsl1R46E4fGVoz/S+XMFBC+KOeoZuuLD0Ulq1OrlACSTsOfFrPasZ3pqQIcPIVKnDHCkDRbsyQPgN9paKdFQgahtNQ53T3AapvwYM1K9zVsqxGQFhj6UBkxH0yvHlb447DButNsLCkbANJzY/sJ0ND4p5wRMEFGwDlVk7/gCejq40rm3ehsKSi+IlAft5vQ1O+oGVvX/kQHfI7uGl/czQZLq1Qb+/8vPtcT3LrO7yBBgFEtq5BJkEc9ShYVJNN5NLgmDbsb2kHUz4fDL8XRAcHdo7ch5tIwtRq8X81Bo6vGrc6iHucTNqZxRTkXea8F3ugKHkK6GvrQAqplU+TGccymAcc9jxIFVGj7z2MLAs1Re0Z07hUwVmGPSyQUwTRN8biqN5Hvxtqg72
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:39:07.2899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e75eb3-da17-4bf2-ea24-08de62bca3bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4822

McASP has dedicated clock & frame sync registers for both transmit
and receive. Currently McASP driver only supports synchronous behavior and
couples both TX & RX settings.

Add logic that enables asynchronous mode via ti,async-mode property. In
async mode, playback & record can be done simultaneously with different
audio configurations (tdm slots, tdm width, audio bit depth).

Note the ability to have different tx/rx DSP formats (i2s, dsp_a, etc.),
while possible in hardware, remains to be a gap as it require changes
to the corresponding machine driver interface.

Existing IIS (sync mode) and DIT mode logic remains mostly unchanged.
Exceptions are IIS mode logic that previously assumed sync mode, which has
now been made aware of the distinction. And shared logic across all modes
also now checks for McASP tx/rx-specific driver attributes. Those
attributes have been populated according to the original extent, ensuring
no divergence in functionality.

Constraints no longer applicable for async mode are skipped.
Clock selection options have also been added to include rx/tx-only clk_ids,
exposing independent configuration via the machine driver as well.

Note that asynchronous mode is not applicable for McASP in DIT mode,
which is a transmitter-only mode to interface w/ self-clocking formats.

Signed-off-by: Sen Wang <sen@ti.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
---
v2:
	- Corrected code comments to use inclusive terminology

 include/linux/platform_data/davinci_asp.h |   3 +-
 sound/soc/ti/davinci-mcasp.c              | 489 +++++++++++++++++-----
 sound/soc/ti/davinci-mcasp.h              |  10 +
 3 files changed, 401 insertions(+), 101 deletions(-)

diff --git a/include/linux/platform_data/davinci_asp.h b/include/linux/platform_data/davinci_asp.h
index b9c8520b4bd3..509c5592aab0 100644
--- a/include/linux/platform_data/davinci_asp.h
+++ b/include/linux/platform_data/davinci_asp.h
@@ -59,7 +59,8 @@ struct davinci_mcasp_pdata {
 	bool i2s_accurate_sck;
 
 	/* McASP specific fields */
-	int tdm_slots;
+	int tdm_slots_tx;
+	int tdm_slots_rx;
 	u8 op_mode;
 	u8 dismod;
 	u8 num_serializer;
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index f9015b50e99d..b2788c4ce83c 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -70,6 +70,7 @@ struct davinci_mcasp_context {
 struct davinci_mcasp_ruledata {
 	struct davinci_mcasp *mcasp;
 	int serializers;
+	int stream;
 };
 
 struct davinci_mcasp {
@@ -87,21 +88,27 @@ struct davinci_mcasp {
 	bool	missing_audio_param;
 
 	/* McASP specific data */
-	int	tdm_slots;
+	int	tdm_slots_tx;
+	int	tdm_slots_rx;
 	u32	tdm_mask[2];
-	int	slot_width;
+	int	slot_width_tx;
+	int	slot_width_rx;
 	u8	op_mode;
 	u8	dismod;
 	u8	num_serializer;
 	u8	*serial_dir;
 	u8	version;
-	u8	bclk_div;
+	u8	bclk_div_tx;
+	u8	bclk_div_rx;
 	int	streams;
 	u32	irq_request[2];
 
-	int	sysclk_freq;
+	unsigned int	sysclk_freq_tx;
+	unsigned int	sysclk_freq_rx;
 	bool	bclk_master;
-	u32	auxclk_fs_ratio;
+	bool	async_mode;
+	u32	auxclk_fs_ratio_tx;
+	u32	auxclk_fs_ratio_rx;
 
 	unsigned long pdir; /* Pin direction bitfield */
 
@@ -203,6 +210,27 @@ static inline void mcasp_set_clk_pdir(struct davinci_mcasp *mcasp, bool enable)
 	}
 }
 
+static inline void mcasp_set_clk_pdir_stream(struct davinci_mcasp *mcasp,
+					     int stream, bool enable)
+{
+	u32 bit, bit_end;
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		bit = PIN_BIT_ACLKX;
+		bit_end = PIN_BIT_AFSX + 1;
+	} else {
+		bit = PIN_BIT_ACLKR;
+		bit_end = PIN_BIT_AFSR + 1;
+	}
+
+	for_each_set_bit_from(bit, &mcasp->pdir, bit_end) {
+		if (enable)
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_PDIR_REG, BIT(bit));
+		else
+			mcasp_clr_bits(mcasp, DAVINCI_MCASP_PDIR_REG, BIT(bit));
+	}
+}
+
 static inline void mcasp_set_axr_pdir(struct davinci_mcasp *mcasp, bool enable)
 {
 	u32 bit;
@@ -215,6 +243,36 @@ static inline void mcasp_set_axr_pdir(struct davinci_mcasp *mcasp, bool enable)
 	}
 }
 
+static inline int mcasp_get_tdm_slots(struct davinci_mcasp *mcasp, int stream)
+{
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	       mcasp->tdm_slots_tx : mcasp->tdm_slots_rx;
+}
+
+static inline int mcasp_get_slot_width(struct davinci_mcasp *mcasp, int stream)
+{
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	       mcasp->slot_width_tx : mcasp->slot_width_rx;
+}
+
+static inline unsigned int mcasp_get_sysclk_freq(struct davinci_mcasp *mcasp, int stream)
+{
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	       mcasp->sysclk_freq_tx : mcasp->sysclk_freq_rx;
+}
+
+static inline unsigned int mcasp_get_bclk_div(struct davinci_mcasp *mcasp, int stream)
+{
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	       mcasp->bclk_div_tx : mcasp->bclk_div_rx;
+}
+
+static inline unsigned int mcasp_get_auxclk_fs_ratio(struct davinci_mcasp *mcasp, int stream)
+{
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	       mcasp->auxclk_fs_ratio_tx : mcasp->auxclk_fs_ratio_rx;
+}
+
 static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 {
 	if (mcasp->rxnumevt) {	/* enable FIFO */
@@ -230,13 +288,17 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 	/*
 	 * When ASYNC == 0 the transmit and receive sections operate
 	 * synchronously from the transmit clock and frame sync. We need to make
-	 * sure that the TX signlas are enabled when starting reception.
+	 * sure that the TX signals are enabled when starting reception,
+	 * when the McASP is the producer.
 	 */
 	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp)) {
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
 	}
-	mcasp_set_clk_pdir(mcasp, true);
+	if (mcasp_is_synchronous(mcasp))
+		mcasp_set_clk_pdir(mcasp, true);
+	else
+		mcasp_set_clk_pdir_stream(mcasp, SNDRV_PCM_STREAM_CAPTURE, true);
 
 	/* Activate serializer(s) */
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
@@ -267,7 +329,10 @@ static void mcasp_start_tx(struct davinci_mcasp *mcasp)
 	/* Start clocks */
 	mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
 	mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
-	mcasp_set_clk_pdir(mcasp, true);
+	if (mcasp_is_synchronous(mcasp))
+		mcasp_set_clk_pdir(mcasp, true);
+	else
+		mcasp_set_clk_pdir_stream(mcasp, SNDRV_PCM_STREAM_PLAYBACK, true);
 
 	/* Activate serializer(s) */
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_TXSTAT_REG, 0xFFFFFFFF);
@@ -310,9 +375,17 @@ static void mcasp_stop_rx(struct davinci_mcasp *mcasp)
 	/*
 	 * In synchronous mode stop the TX clocks if no other stream is
 	 * running
+	 * Otherwise in async mode only stop RX clocks
 	 */
-	if (!mcasp->streams)
+	if (mcasp_is_synchronous(mcasp) && !mcasp->streams)
 		mcasp_set_clk_pdir(mcasp, false);
+	else if (!mcasp_is_synchronous(mcasp))
+		mcasp_set_clk_pdir_stream(mcasp, SNDRV_PCM_STREAM_CAPTURE, false);
+	/*
+	 * When McASP is the producer and operating in synchronous mode,
+	 * stop the transmit clocks if no other stream is running. As
+	 * tx & rx operate synchronously from the transmit clock.
+	 */
 	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams)
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, 0);
 
@@ -337,11 +410,14 @@ static void mcasp_stop_tx(struct davinci_mcasp *mcasp)
 	/*
 	 * In synchronous mode keep TX clocks running if the capture stream is
 	 * still running.
+	 * Otherwise in async mode only stop TX clocks
 	 */
 	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && mcasp->streams)
 		val =  TXHCLKRST | TXCLKRST | TXFSRST;
-	if (!mcasp->streams)
+	if (mcasp_is_synchronous(mcasp) && !mcasp->streams)
 		mcasp_set_clk_pdir(mcasp, false);
+	else if (!mcasp_is_synchronous(mcasp))
+		mcasp_set_clk_pdir_stream(mcasp, SNDRV_PCM_STREAM_PLAYBACK, false);
 
 
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, val);
@@ -625,13 +701,39 @@ static int __davinci_mcasp_set_clkdiv(struct davinci_mcasp *mcasp, int div_id,
 			       AHCLKRDIV(div - 1), AHCLKRDIV_MASK);
 		break;
 
+	case MCASP_CLKDIV_AUXCLK_TXONLY:		/* MCLK divider for TX only */
+		mcasp_mod_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG,
+			       AHCLKXDIV(div - 1), AHCLKXDIV_MASK);
+		break;
+
+	case MCASP_CLKDIV_AUXCLK_RXONLY:		/* MCLK divider for RX only */
+		mcasp_mod_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
+			       AHCLKRDIV(div - 1), AHCLKRDIV_MASK);
+		break;
+
 	case MCASP_CLKDIV_BCLK:			/* BCLK divider */
 		mcasp_mod_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG,
 			       ACLKXDIV(div - 1), ACLKXDIV_MASK);
+		mcasp_mod_bits(mcasp, DAVINCI_MCASP_ACLKRCTL_REG,
+			       ACLKRDIV(div - 1), ACLKRDIV_MASK);
+		if (explicit) {
+			mcasp->bclk_div_tx = div;
+			mcasp->bclk_div_rx = div;
+		}
+		break;
+
+	case MCASP_CLKDIV_BCLK_TXONLY:		/* BCLK divider for TX only */
+		mcasp_mod_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG,
+			       ACLKXDIV(div - 1), ACLKXDIV_MASK);
+		if (explicit)
+			mcasp->bclk_div_tx = div;
+		break;
+
+	case MCASP_CLKDIV_BCLK_RXONLY:		/* BCLK divider for RX only */
 		mcasp_mod_bits(mcasp, DAVINCI_MCASP_ACLKRCTL_REG,
 			       ACLKRDIV(div - 1), ACLKRDIV_MASK);
 		if (explicit)
-			mcasp->bclk_div = div;
+			mcasp->bclk_div_rx = div;
 		break;
 
 	case MCASP_CLKDIV_BCLK_FS_RATIO:
@@ -645,11 +747,33 @@ static int __davinci_mcasp_set_clkdiv(struct davinci_mcasp *mcasp, int div_id,
 		 * tdm_slot width by dividing the ratio by the
 		 * number of configured tdm slots.
 		 */
-		mcasp->slot_width = div / mcasp->tdm_slots;
-		if (div % mcasp->tdm_slots)
+		mcasp->slot_width_tx = div / mcasp->tdm_slots_tx;
+		if (div % mcasp->tdm_slots_tx)
 			dev_warn(mcasp->dev,
-				 "%s(): BCLK/LRCLK %d is not divisible by %d tdm slots",
-				 __func__, div, mcasp->tdm_slots);
+				 "%s(): BCLK/LRCLK %d is not divisible by %d tx tdm slots",
+				 __func__, div, mcasp->tdm_slots_tx);
+
+		mcasp->slot_width_rx = div / mcasp->tdm_slots_rx;
+		if (div % mcasp->tdm_slots_rx)
+			dev_warn(mcasp->dev,
+				 "%s(): BCLK/LRCLK %d is not divisible by %d rx tdm slots",
+				 __func__, div, mcasp->tdm_slots_rx);
+		break;
+
+	case MCASP_CLKDIV_BCLK_FS_RATIO_TXONLY:
+		mcasp->slot_width_tx = div / mcasp->tdm_slots_tx;
+		if (div % mcasp->tdm_slots_tx)
+			dev_warn(mcasp->dev,
+				 "%s(): BCLK/LRCLK %d is not divisible by %d tx tdm slots",
+				 __func__, div, mcasp->tdm_slots_tx);
+		break;
+
+	case MCASP_CLKDIV_BCLK_FS_RATIO_RXONLY:
+		mcasp->slot_width_rx = div / mcasp->tdm_slots_rx;
+		if (div % mcasp->tdm_slots_rx)
+			dev_warn(mcasp->dev,
+				 "%s(): BCLK/LRCLK %d is not divisible by %d rx tdm slots",
+				 __func__, div, mcasp->tdm_slots_rx);
 		break;
 
 	default:
@@ -683,6 +807,20 @@ static int davinci_mcasp_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 			mcasp_clr_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
 				       AHCLKRE);
 			clear_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+			mcasp->sysclk_freq_tx = freq;
+			mcasp->sysclk_freq_rx = freq;
+			break;
+		case MCASP_CLK_HCLK_AHCLK_TXONLY:
+			mcasp_clr_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG,
+				       AHCLKXE);
+			clear_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+			mcasp->sysclk_freq_tx = freq;
+			break;
+		case MCASP_CLK_HCLK_AHCLK_RXONLY:
+			mcasp_clr_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
+				       AHCLKRE);
+			clear_bit(PIN_BIT_AHCLKR, &mcasp->pdir);
+			mcasp->sysclk_freq_rx = freq;
 			break;
 		case MCASP_CLK_HCLK_AUXCLK:
 			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG,
@@ -690,22 +828,56 @@ static int davinci_mcasp_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
 				       AHCLKRE);
 			set_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+			mcasp->sysclk_freq_tx = freq;
+			mcasp->sysclk_freq_rx = freq;
+			break;
+		case MCASP_CLK_HCLK_AUXCLK_TXONLY:
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG,
+				       AHCLKXE);
+			set_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+			mcasp->sysclk_freq_tx = freq;
+			break;
+		case MCASP_CLK_HCLK_AUXCLK_RXONLY:
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
+				       AHCLKRE);
+			set_bit(PIN_BIT_AHCLKR, &mcasp->pdir);
+			mcasp->sysclk_freq_rx = freq;
 			break;
 		default:
 			dev_err(mcasp->dev, "Invalid clk id: %d\n", clk_id);
 			goto out;
 		}
 	} else {
-		/* Select AUXCLK as HCLK */
-		mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG, AHCLKXE);
-		mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG, AHCLKRE);
-		set_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+		/* McASP is clock master, select AUXCLK as HCLK */
+		switch (clk_id) {
+		case MCASP_CLK_HCLK_AUXCLK_TXONLY:
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG,
+				       AHCLKXE);
+			set_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+			mcasp->sysclk_freq_tx = freq;
+			break;
+		case MCASP_CLK_HCLK_AUXCLK_RXONLY:
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
+				       AHCLKRE);
+			set_bit(PIN_BIT_AHCLKR, &mcasp->pdir);
+			mcasp->sysclk_freq_rx = freq;
+			break;
+		default:
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG,
+				       AHCLKXE);
+			mcasp_set_bits(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG,
+				       AHCLKRE);
+			set_bit(PIN_BIT_AHCLKX, &mcasp->pdir);
+			set_bit(PIN_BIT_AHCLKR, &mcasp->pdir);
+			mcasp->sysclk_freq_tx = freq;
+			mcasp->sysclk_freq_rx = freq;
+			break;
+		}
 	}
 	/*
 	 * When AHCLK X/R is selected to be output it means that the HCLK is
 	 * the same clock - coming via AUXCLK.
 	 */
-	mcasp->sysclk_freq = freq;
 out:
 	pm_runtime_put(mcasp->dev);
 	return 0;
@@ -717,9 +889,11 @@ static int davinci_mcasp_ch_constraint(struct davinci_mcasp *mcasp, int stream,
 {
 	struct snd_pcm_hw_constraint_list *cl = &mcasp->chconstr[stream];
 	unsigned int *list = (unsigned int *) cl->list;
-	int slots = mcasp->tdm_slots;
+	int slots;
 	int i, count = 0;
 
+	slots = mcasp_get_tdm_slots(mcasp, stream);
+
 	if (mcasp->tdm_mask[stream])
 		slots = hweight32(mcasp->tdm_mask[stream]);
 
@@ -784,27 +958,42 @@ static int davinci_mcasp_set_tdm_slot(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	mcasp->tdm_slots = slots;
+	if (mcasp->async_mode) {
+		if (tx_mask) {
+			mcasp->tdm_slots_tx = slots;
+			mcasp->slot_width_tx = slot_width;
+		}
+		if (rx_mask) {
+			mcasp->tdm_slots_rx = slots;
+			mcasp->slot_width_rx = slot_width;
+		}
+	} else {
+		mcasp->tdm_slots_tx = slots;
+		mcasp->tdm_slots_rx = slots;
+		mcasp->slot_width_tx = slot_width;
+		mcasp->slot_width_rx = slot_width;
+	}
+
 	mcasp->tdm_mask[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
 	mcasp->tdm_mask[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
-	mcasp->slot_width = slot_width;
 
 	return davinci_mcasp_set_ch_constraints(mcasp);
 }
 
 static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
-				       int sample_width)
+				       int sample_width, int stream)
 {
 	u32 fmt;
 	u32 tx_rotate, rx_rotate, slot_width;
 	u32 mask = (1ULL << sample_width) - 1;
 
-	if (mcasp->slot_width)
-		slot_width = mcasp->slot_width;
-	else if (mcasp->max_format_width)
-		slot_width = mcasp->max_format_width;
-	else
-		slot_width = sample_width;
+	slot_width = mcasp_get_slot_width(mcasp, stream);
+	if (!slot_width) {
+		if (mcasp->max_format_width)
+			slot_width = mcasp->max_format_width;
+		else
+			slot_width = sample_width;
+	}
 	/*
 	 * TX rotation:
 	 * right aligned formats: rotate w/ slot_width
@@ -827,17 +1016,23 @@ static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
 	fmt = (slot_width >> 1) - 1;
 
 	if (mcasp->op_mode != DAVINCI_MCASP_DIT_MODE) {
-		mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, RXSSZ(fmt),
-			       RXSSZ(0x0F));
-		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXSSZ(fmt),
-			       TXSSZ(0x0F));
-		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXROT(tx_rotate),
-			       TXROT(7));
-		mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, RXROT(rx_rotate),
-			       RXROT(7));
-		mcasp_set_reg(mcasp, DAVINCI_MCASP_RXMASK_REG, mask);
+		if (!mcasp->async_mode || stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXSSZ(fmt),
+				       TXSSZ(0x0F));
+			mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXROT(tx_rotate),
+				       TXROT(7));
+			mcasp_set_reg(mcasp, DAVINCI_MCASP_TXMASK_REG, mask);
+		}
+		if (!mcasp->async_mode || stream == SNDRV_PCM_STREAM_CAPTURE) {
+			mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, RXSSZ(fmt),
+				       RXSSZ(0x0F));
+			mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, RXROT(rx_rotate),
+				       RXROT(7));
+			mcasp_set_reg(mcasp, DAVINCI_MCASP_RXMASK_REG, mask);
+		}
 	} else {
 		/*
+		 * DIT mode only use TX serializers
 		 * according to the TRM it should be TXROT=0, this one works:
 		 * 16 bit to 23-8 (TXROT=6, rotate 24 bits)
 		 * 24 bit to 23-0 (TXROT=0, rotate 0 bits)
@@ -850,10 +1045,9 @@ static int davinci_config_channel_size(struct davinci_mcasp *mcasp,
 			       TXROT(7));
 		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, TXSSZ(15),
 			       TXSSZ(0x0F));
+		mcasp_set_reg(mcasp, DAVINCI_MCASP_TXMASK_REG, mask);
 	}
 
-	mcasp_set_reg(mcasp, DAVINCI_MCASP_TXMASK_REG, mask);
-
 	return 0;
 }
 
@@ -864,11 +1058,13 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 	int i;
 	u8 tx_ser = 0;
 	u8 rx_ser = 0;
-	u8 slots = mcasp->tdm_slots;
+	int slots;
 	u8 max_active_serializers, max_rx_serializers, max_tx_serializers;
 	int active_serializers, numevt;
 	u32 reg;
 
+	slots = mcasp_get_tdm_slots(mcasp, stream);
+
 	/* In DIT mode we only allow maximum of one serializers for now */
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
 		max_active_serializers = 1;
@@ -996,7 +1192,7 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 	u32 mask = 0;
 	u32 busel = 0;
 
-	total_slots = mcasp->tdm_slots;
+	total_slots = mcasp_get_tdm_slots(mcasp, stream);
 
 	/*
 	 * If more than one serializer is needed, then use them with
@@ -1027,7 +1223,10 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 			mask |= (1 << i);
 	}
 
-	mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, TX_ASYNC);
+	if (mcasp->async_mode)
+		mcasp_set_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, TX_ASYNC);
+	else
+		mcasp_clr_bits(mcasp, DAVINCI_MCASP_ACLKXCTL_REG, TX_ASYNC);
 
 	if (!mcasp->dat_port)
 		busel = TXSEL;
@@ -1126,16 +1325,33 @@ static int mcasp_dit_hw_param(struct davinci_mcasp *mcasp,
 
 static int davinci_mcasp_calc_clk_div(struct davinci_mcasp *mcasp,
 				      unsigned int sysclk_freq,
-				      unsigned int bclk_freq, bool set)
+				      unsigned int bclk_freq,
+				      int stream,
+				      bool set)
 {
-	u32 reg = mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG);
 	int div = sysclk_freq / bclk_freq;
 	int rem = sysclk_freq % bclk_freq;
 	int error_ppm;
 	int aux_div = 1;
+	int bclk_div_id, auxclk_div_id;
+	bool auxclk_enabled;
+
+	if (mcasp->async_mode && stream == SNDRV_PCM_STREAM_CAPTURE) {
+		auxclk_enabled = mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKRCTL_REG) & AHCLKRE;
+		bclk_div_id = MCASP_CLKDIV_BCLK_RXONLY;
+		auxclk_div_id = MCASP_CLKDIV_AUXCLK_RXONLY;
+	} else if (mcasp->async_mode && stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		auxclk_enabled = mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG) & AHCLKXE;
+		bclk_div_id = MCASP_CLKDIV_BCLK_TXONLY;
+		auxclk_div_id = MCASP_CLKDIV_AUXCLK_TXONLY;
+	} else {
+		auxclk_enabled = mcasp_get_reg(mcasp, DAVINCI_MCASP_AHCLKXCTL_REG) & AHCLKXE;
+		bclk_div_id = MCASP_CLKDIV_BCLK;
+		auxclk_div_id = MCASP_CLKDIV_AUXCLK;
+	}
 
 	if (div > (ACLKXDIV_MASK + 1)) {
-		if (reg & AHCLKXE) {
+		if (auxclk_enabled) {
 			aux_div = div / (ACLKXDIV_MASK + 1);
 			if (div % (ACLKXDIV_MASK + 1))
 				aux_div++;
@@ -1165,10 +1381,10 @@ static int davinci_mcasp_calc_clk_div(struct davinci_mcasp *mcasp,
 			dev_info(mcasp->dev, "Sample-rate is off by %d PPM\n",
 				 error_ppm);
 
-		__davinci_mcasp_set_clkdiv(mcasp, MCASP_CLKDIV_BCLK, div, 0);
-		if (reg & AHCLKXE)
-			__davinci_mcasp_set_clkdiv(mcasp, MCASP_CLKDIV_AUXCLK,
-						   aux_div, 0);
+		__davinci_mcasp_set_clkdiv(mcasp, bclk_div_id, div, false);
+		if (auxclk_enabled)
+			__davinci_mcasp_set_clkdiv(mcasp, auxclk_div_id,
+						   aux_div, false);
 	}
 
 	return error_ppm;
@@ -1219,6 +1435,7 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 	int channels = params_channels(params);
 	int period_size = params_period_size(params);
 	int ret;
+	unsigned int sysclk_freq = mcasp_get_sysclk_freq(mcasp, substream->stream);
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_U8:
@@ -1259,22 +1476,26 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 	 * If mcasp is BCLK master, and a BCLK divider was not provided by
 	 * the machine driver, we need to calculate the ratio.
 	 */
-	if (mcasp->bclk_master && mcasp->bclk_div == 0 && mcasp->sysclk_freq) {
-		int slots = mcasp->tdm_slots;
+	if (mcasp->bclk_master && mcasp_get_bclk_div(mcasp, substream->stream) == 0 &&
+	    sysclk_freq) {
+		int slots, slot_width;
 		int rate = params_rate(params);
 		int sbits = params_width(params);
 		unsigned int bclk_target;
 
-		if (mcasp->slot_width)
-			sbits = mcasp->slot_width;
+		slots = mcasp_get_tdm_slots(mcasp, substream->stream);
+
+		slot_width = mcasp_get_slot_width(mcasp, substream->stream);
+		if (slot_width)
+			sbits = slot_width;
 
 		if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE)
 			bclk_target = rate * sbits * slots;
 		else
 			bclk_target = rate * 128;
 
-		davinci_mcasp_calc_clk_div(mcasp, mcasp->sysclk_freq,
-					   bclk_target, true);
+		davinci_mcasp_calc_clk_div(mcasp, sysclk_freq,
+					   bclk_target, substream->stream, true);
 	}
 
 	ret = mcasp_common_hw_param(mcasp, substream->stream,
@@ -1291,9 +1512,10 @@ static int davinci_mcasp_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	davinci_config_channel_size(mcasp, word_length);
+	davinci_config_channel_size(mcasp, word_length, substream->stream);
 
-	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE) {
+	/* Channel constraints are disabled for async mode */
+	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE && !mcasp->async_mode) {
 		mcasp->channels = channels;
 		if (!mcasp->max_format_width)
 			mcasp->max_format_width = word_length;
@@ -1337,7 +1559,7 @@ static int davinci_mcasp_hw_rule_slot_width(struct snd_pcm_hw_params *params,
 	snd_pcm_format_t i;
 
 	snd_mask_none(&nfmt);
-	slot_width = rd->mcasp->slot_width;
+	slot_width = mcasp_get_slot_width(rd->mcasp, rd->stream);
 
 	pcm_for_each_format(i) {
 		if (snd_mask_test_format(fmt, i)) {
@@ -1387,12 +1609,15 @@ static int davinci_mcasp_hw_rule_rate(struct snd_pcm_hw_params *params,
 	struct snd_interval *ri =
 		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	int sbits = params_width(params);
-	int slots = rd->mcasp->tdm_slots;
+	int slots, slot_width;
 	struct snd_interval range;
 	int i;
 
-	if (rd->mcasp->slot_width)
-		sbits = rd->mcasp->slot_width;
+	slots = mcasp_get_tdm_slots(rd->mcasp, rd->stream);
+
+	slot_width = mcasp_get_slot_width(rd->mcasp, rd->stream);
+	if (slot_width)
+		sbits = slot_width;
 
 	snd_interval_any(&range);
 	range.empty = 1;
@@ -1402,16 +1627,17 @@ static int davinci_mcasp_hw_rule_rate(struct snd_pcm_hw_params *params,
 			uint bclk_freq = sbits * slots *
 					 davinci_mcasp_dai_rates[i];
 			unsigned int sysclk_freq;
+			unsigned int ratio;
 			int ppm;
 
-			if (rd->mcasp->auxclk_fs_ratio)
-				sysclk_freq =  davinci_mcasp_dai_rates[i] *
-					       rd->mcasp->auxclk_fs_ratio;
+			ratio = mcasp_get_auxclk_fs_ratio(rd->mcasp, rd->stream);
+			if (ratio)
+				sysclk_freq = davinci_mcasp_dai_rates[i] * ratio;
 			else
-				sysclk_freq = rd->mcasp->sysclk_freq;
+				sysclk_freq = mcasp_get_sysclk_freq(rd->mcasp, rd->stream);
 
 			ppm = davinci_mcasp_calc_clk_div(rd->mcasp, sysclk_freq,
-							 bclk_freq, false);
+							 bclk_freq, rd->stream, false);
 			if (abs(ppm) < DAVINCI_MAX_RATE_ERROR_PPM) {
 				if (range.empty) {
 					range.min = davinci_mcasp_dai_rates[i];
@@ -1437,30 +1663,34 @@ static int davinci_mcasp_hw_rule_format(struct snd_pcm_hw_params *params,
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_mask nfmt;
 	int rate = params_rate(params);
-	int slots = rd->mcasp->tdm_slots;
+	int slots;
 	int count = 0;
 	snd_pcm_format_t i;
 
+	slots = mcasp_get_tdm_slots(rd->mcasp, rd->stream);
+
 	snd_mask_none(&nfmt);
 
 	pcm_for_each_format(i) {
 		if (snd_mask_test_format(fmt, i)) {
 			uint sbits = snd_pcm_format_width(i);
 			unsigned int sysclk_freq;
-			int ppm;
+			unsigned int ratio;
+			int ppm, slot_width;
 
-			if (rd->mcasp->auxclk_fs_ratio)
-				sysclk_freq =  rate *
-					       rd->mcasp->auxclk_fs_ratio;
+			ratio = mcasp_get_auxclk_fs_ratio(rd->mcasp, rd->stream);
+			if (ratio)
+				sysclk_freq = rate * ratio;
 			else
-				sysclk_freq = rd->mcasp->sysclk_freq;
+				sysclk_freq = mcasp_get_sysclk_freq(rd->mcasp, rd->stream);
 
-			if (rd->mcasp->slot_width)
-				sbits = rd->mcasp->slot_width;
+			slot_width = mcasp_get_slot_width(rd->mcasp, rd->stream);
+			if (slot_width)
+				sbits = slot_width;
 
 			ppm = davinci_mcasp_calc_clk_div(rd->mcasp, sysclk_freq,
 							 sbits * slots * rate,
-							 false);
+							 rd->stream, false);
 			if (abs(ppm) < DAVINCI_MAX_RATE_ERROR_PPM) {
 				snd_mask_set_format(&nfmt, i);
 				count++;
@@ -1497,7 +1727,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 					&mcasp->ruledata[substream->stream];
 	u32 max_channels = 0;
 	int i, dir, ret;
-	int tdm_slots = mcasp->tdm_slots;
+	int tdm_slots;
 	u8 *numevt;
 
 	/* Do not allow more then one stream per direction */
@@ -1506,6 +1736,8 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 
 	mcasp->substreams[substream->stream] = substream;
 
+	tdm_slots = mcasp_get_tdm_slots(mcasp, substream->stream);
+
 	if (mcasp->tdm_mask[substream->stream])
 		tdm_slots = hweight32(mcasp->tdm_mask[substream->stream]);
 
@@ -1527,6 +1759,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	}
 	ruledata->serializers = max_channels;
 	ruledata->mcasp = mcasp;
+	ruledata->stream = substream->stream;
 	max_channels *= tdm_slots;
 	/*
 	 * If the already active stream has less channels than the calculated
@@ -1534,9 +1767,13 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	 * is in use we need to use that as a constraint for the second stream.
 	 * Otherwise (first stream or less allowed channels or more than one
 	 * serializer in use) we use the calculated constraint.
+	 *
+	 * However, in async mode, TX and RX have independent clocks and can
+	 * use different configurations, so don't apply the constraint.
 	 */
 	if (mcasp->channels && mcasp->channels < max_channels &&
-	    ruledata->serializers == 1)
+	    ruledata->serializers == 1 &&
+	    !mcasp->async_mode)
 		max_channels = mcasp->channels;
 	/*
 	 * But we can always allow channels upto the amount of
@@ -1553,10 +1790,10 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 				   0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				   &mcasp->chconstr[substream->stream]);
 
-	if (mcasp->max_format_width) {
+	if (mcasp->max_format_width && !mcasp->async_mode) {
 		/*
 		 * Only allow formats which require same amount of bits on the
-		 * bus as the currently running stream
+		 * bus as the currently running stream to ensure sync mode
 		 */
 		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_FORMAT,
@@ -1565,8 +1802,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 					  SNDRV_PCM_HW_PARAM_FORMAT, -1);
 		if (ret)
 			return ret;
-	}
-	else if (mcasp->slot_width) {
+	} else if (mcasp_get_slot_width(mcasp, substream->stream)) {
 		/* Only allow formats require <= slot_width bits on the bus */
 		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_FORMAT,
@@ -1581,7 +1817,8 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	 * If we rely on implicit BCLK divider setting we should
 	 * set constraints based on what we can provide.
 	 */
-	if (mcasp->bclk_master && mcasp->bclk_div == 0 && mcasp->sysclk_freq) {
+	if (mcasp->bclk_master && mcasp_get_bclk_div(mcasp, substream->stream) == 0 &&
+	    mcasp_get_sysclk_freq(mcasp, substream->stream)) {
 		ret = snd_pcm_hw_rule_add(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  davinci_mcasp_hw_rule_rate,
@@ -1758,8 +1995,6 @@ static struct snd_soc_dai_driver davinci_mcasp_dai[] = {
 			.formats	= DAVINCI_MCASP_PCM_FMTS,
 		},
 		.ops 		= &davinci_mcasp_dai_ops,
-
-		.symmetric_rate		= 1,
 	},
 	{
 		.name		= "davinci-mcasp.1",
@@ -1921,18 +2156,33 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 		goto out;
 	}
 
+	/* Parse TX-specific TDM slot and use it as default for RX */
 	if (of_property_read_u32(np, "tdm-slots", &val) == 0) {
 		if (val < 2 || val > 32) {
-			dev_err(&pdev->dev, "tdm-slots must be in rage [2-32]\n");
+			dev_err(&pdev->dev, "tdm-slots must be in range [2-32]\n");
 			return -EINVAL;
 		}
 
-		pdata->tdm_slots = val;
+		pdata->tdm_slots_tx = val;
+		pdata->tdm_slots_rx = val;
 	} else if (pdata->op_mode == DAVINCI_MCASP_IIS_MODE) {
 		mcasp->missing_audio_param = true;
 		goto out;
 	}
 
+	/* Parse RX-specific TDM slot count if provided */
+	if (of_property_read_u32(np, "tdm-slots-rx", &val) == 0) {
+		if (val < 2 || val > 32) {
+			dev_err(&pdev->dev, "tdm-slots-rx must be in range [2-32]\n");
+			return -EINVAL;
+		}
+
+		pdata->tdm_slots_rx = val;
+	}
+
+	if (pdata->op_mode != DAVINCI_MCASP_DIT_MODE)
+		mcasp->async_mode = of_property_read_bool(np, "ti,async-mode");
+
 	of_serial_dir32 = of_get_property(np, "serial-dir", &val);
 	val /= sizeof(u32);
 	if (of_serial_dir32) {
@@ -1958,8 +2208,15 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 	if (of_property_read_u32(np, "rx-num-evt", &val) == 0)
 		pdata->rxnumevt = val;
 
-	if (of_property_read_u32(np, "auxclk-fs-ratio", &val) == 0)
-		mcasp->auxclk_fs_ratio = val;
+	/* Parse TX-specific auxclk/fs ratio and use it as default for RX */
+	if (of_property_read_u32(np, "auxclk-fs-ratio", &val) == 0) {
+		mcasp->auxclk_fs_ratio_tx = val;
+		mcasp->auxclk_fs_ratio_rx = val;
+	}
+
+	/* Parse RX-specific auxclk/fs ratio if provided */
+	if (of_property_read_u32(np, "auxclk-fs-ratio-rx", &val) == 0)
+		mcasp->auxclk_fs_ratio_rx = val;
 
 	if (of_property_read_u32(np, "dismod", &val) == 0) {
 		if (val == 0 || val == 2 || val == 3) {
@@ -1988,19 +2245,51 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 	mcasp->op_mode = pdata->op_mode;
 	/* sanity check for tdm slots parameter */
 	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE) {
-		if (pdata->tdm_slots < 2) {
-			dev_warn(&pdev->dev, "invalid tdm slots: %d\n",
-				 pdata->tdm_slots);
-			mcasp->tdm_slots = 2;
-		} else if (pdata->tdm_slots > 32) {
-			dev_warn(&pdev->dev, "invalid tdm slots: %d\n",
-				 pdata->tdm_slots);
-			mcasp->tdm_slots = 32;
+		if (pdata->tdm_slots_tx < 2) {
+			dev_warn(&pdev->dev, "invalid tdm tx slots: %d\n",
+				 pdata->tdm_slots_tx);
+			mcasp->tdm_slots_tx = 2;
+		} else if (pdata->tdm_slots_tx > 32) {
+			dev_warn(&pdev->dev, "invalid tdm tx slots: %d\n",
+				 pdata->tdm_slots_tx);
+			mcasp->tdm_slots_tx = 32;
+		} else {
+			mcasp->tdm_slots_tx = pdata->tdm_slots_tx;
+		}
+
+		if (pdata->tdm_slots_rx < 2) {
+			dev_warn(&pdev->dev, "invalid tdm rx slots: %d\n",
+				 pdata->tdm_slots_rx);
+			mcasp->tdm_slots_rx = 2;
+		} else if (pdata->tdm_slots_rx > 32) {
+			dev_warn(&pdev->dev, "invalid tdm rx slots: %d\n",
+				 pdata->tdm_slots_rx);
+			mcasp->tdm_slots_rx = 32;
 		} else {
-			mcasp->tdm_slots = pdata->tdm_slots;
+			mcasp->tdm_slots_rx = pdata->tdm_slots_rx;
 		}
 	} else {
-		mcasp->tdm_slots = 32;
+		mcasp->tdm_slots_tx = 32;
+		mcasp->tdm_slots_rx = 32;
+	}
+
+	/* Different TX/RX slot counts require async mode */
+	if (pdata->op_mode != DAVINCI_MCASP_DIT_MODE &&
+	    mcasp->tdm_slots_tx != mcasp->tdm_slots_rx && !mcasp->async_mode) {
+		dev_err(&pdev->dev,
+			"Different TX (%d) and RX (%d) TDM slots require ti,async-mode\n",
+			mcasp->tdm_slots_tx, mcasp->tdm_slots_rx);
+		return -EINVAL;
+	}
+
+	/* Different TX/RX auxclk-fs-ratio require async mode */
+	if (pdata->op_mode != DAVINCI_MCASP_DIT_MODE &&
+	    mcasp->auxclk_fs_ratio_tx && mcasp->auxclk_fs_ratio_rx &&
+	    mcasp->auxclk_fs_ratio_tx != mcasp->auxclk_fs_ratio_rx && !mcasp->async_mode) {
+		dev_err(&pdev->dev,
+			"Different TX (%d) and RX (%d) auxclk-fs-ratio require ti,async-mode\n",
+			mcasp->auxclk_fs_ratio_tx, mcasp->auxclk_fs_ratio_rx);
+		return -EINVAL;
 	}
 
 	mcasp->num_serializer = pdata->num_serializer;
diff --git a/sound/soc/ti/davinci-mcasp.h b/sound/soc/ti/davinci-mcasp.h
index 5de2b8a31061..83b3c67f4a2b 100644
--- a/sound/soc/ti/davinci-mcasp.h
+++ b/sound/soc/ti/davinci-mcasp.h
@@ -298,10 +298,20 @@
 /* Source of High-frequency transmit/receive clock */
 #define MCASP_CLK_HCLK_AHCLK		0 /* AHCLKX/R */
 #define MCASP_CLK_HCLK_AUXCLK		1 /* Internal functional clock */
+#define MCASP_CLK_HCLK_AHCLK_TXONLY	2 /* AHCLKX for TX only */
+#define MCASP_CLK_HCLK_AHCLK_RXONLY	3 /* AHCLKR for RX only */
+#define MCASP_CLK_HCLK_AUXCLK_TXONLY	4 /* AUXCLK for TX only */
+#define MCASP_CLK_HCLK_AUXCLK_RXONLY	5 /* AUXCLK for RX only */
 
 /* clock divider IDs */
 #define MCASP_CLKDIV_AUXCLK		0 /* HCLK divider from AUXCLK */
 #define MCASP_CLKDIV_BCLK		1 /* BCLK divider from HCLK */
 #define MCASP_CLKDIV_BCLK_FS_RATIO	2 /* to set BCLK FS ration */
+#define MCASP_CLKDIV_AUXCLK_TXONLY	3 /* AUXCLK divider for TX only */
+#define MCASP_CLKDIV_AUXCLK_RXONLY	4 /* AUXCLK divider for RX only */
+#define MCASP_CLKDIV_BCLK_TXONLY	5 /* BCLK divider for TX only */
+#define MCASP_CLKDIV_BCLK_RXONLY	6 /* BCLK divider for RX only */
+#define MCASP_CLKDIV_BCLK_FS_RATIO_TXONLY 7 /* BCLK/FS ratio for TX only */
+#define MCASP_CLKDIV_BCLK_FS_RATIO_RXONLY 8 /* BCLK/FS ratio for RX only*/
 
 #endif	/* DAVINCI_MCASP_H */
-- 
2.43.0

