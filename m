Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA33A6B98;
	Thu, 26 Mar 2026 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549068; cv=fail; b=G7iBJU4uFQ2XeYVAv3TdGkW+9Dt+0npECpPw0X03LRxgyNPm7amOOKPHbM3M4qoeh/25NL2JDt0VUSIAYnu97RuoKSMAz+kkIChdkqM9JpQW7MwMZSlvPtV65vQlCDYzxmqiMcrxtv0sTVVVftrCYhLN1DLHt4iq+gu3RQ/XOKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549068; c=relaxed/simple;
	bh=w5poc+Xrc+440U74ZDKwVuz/5bsOHK8DSY3wx0sI4A8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OkZKaimtZAMnlwKf6CSG89Wq+UppqQ+1kOiP1bvvPQ8n6BXedo3zon79pW4S5DDEbCjjGua30HSzQfmaa33iIy5o5myRsyvTvrvlel8X26TVXiY5Pu9rlDjGv9zDfFu96K25SXllkFMllR7cCIbbOMUFjQjcEZ7larqqmd74bpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UY2gA4du; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UY2gA4du"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHPpuEV6BgUWqNque4md2wLc8NA7DEyuKI7u6mWRG0RSuBm9yQ+8+mED74SoeHvXf1JwsbLAZGUN3SjLHj1ByOMivykvmEoCYbkFg6ZG08hu1/tZlvR5Swz+3/qcRPcAjB89VROxz9aUQvY4iNbUZSy3YfkHe/4v713bPFpzC41+Ta/qDFyuKDmeTMqNh0go/OBq/Fbpu9hSTI43n1aXNgPe7zRB/TlExzg6WGCDp3EtLYhLbQ48ScMhDZttEqb2Tkm7VqFqSDbeZlSSgOhMpzS3O+7tbLWenYRQO1dCkmZSa7Hh4fcpUK6F7xLGJL006pmKSkNdLdqI6bBQgF/wKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7iJOArpf8tuuBhf62851WoW4SMEgRtfrPWCwFylGuA=;
 b=cw0Li7te+TnFmqGd0L3bKPUB8uKzT6YG8u3O5JxGMZkiDvFpjeu/7r5QWra2JARpUdFW87UxpnFXHhTQkYob3j05HlB0fItIeyHg3gmMUXVvILt6Oecbr0homCdS2663ZLLlPtQCRE3zh4Wsa4AG6EyKImgVTFQPn2CHB782dLsQ0t2xPQ5kEqXQZWCSxaSQvh0mF/58fV9em5pEEX9U6b/hbhNuSc5fGT8/p+q+Ic+2b0l8B7Xi1gBmD+LU9g5NnovaXLa3N9vvaHLMcriMXEc7NyTcBySa2MZdc+cB74FsA1SHG4ejQX0bt9tuCwB3fL6mr+FawoCv+BQPHDg7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7iJOArpf8tuuBhf62851WoW4SMEgRtfrPWCwFylGuA=;
 b=UY2gA4duLmJM2BRTB+HyYE2OSp7i2g0e3P/VBoEXS1vUNVmkfnXEO3DTY34ekDu2naq+6ylktNJ2rSim6/b8WfeSFeSlRWPcndgtSCIgOF2CdVm0mFWmuoxu4pTk0j4Xr24/DuNgdztAcfmLfczForueyLL/vHhh3zCddWy2F3I=
Received: from BYAPR02CA0017.namprd02.prod.outlook.com (2603:10b6:a02:ee::30)
 by MW4PR10MB5812.namprd10.prod.outlook.com (2603:10b6:303:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 18:17:37 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::86) by BYAPR02CA0017.outlook.office365.com
 (2603:10b6:a02:ee::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 18:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 18:17:36 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 13:17:36 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 13:17:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 13:17:35 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QIHU8Y2094511;
	Thu, 26 Mar 2026 13:17:31 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 1/4] ASoC: SDCA: make q78_get_volsw and q78_put_volsw extern
Date: Thu, 26 Mar 2026 23:47:09 +0530
Message-ID: <20260326181712.2274-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|MW4PR10MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: f4251ce3-3381-4183-d8b4-08de8b63f54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jiRidkVIn85AsvdduPQHPLbV1BQTLOm+1DfREPwb5K99cnKXKW3b0I5vT4Kwxg3o4l41SC/fuaY9EcPZuVjK/Sq/g/nIIY601cqTSbyJeFbRX8+AuBTxpIe4TzSZHz38UBXiFqIdtvjhaCTNXNXWMmbn9m+gR6QzxFm+Tgm2WcRZCGvHEYq4Sr7T9yOIAo3dQhwSEsO+wtK3qfNZSclVTjIyyqYlX/zqSJ/YxcNt/21a+ULwrR42u+pjzA0TQSOIB55pfvE0jjLZ/1GY7sjwnn/ipMPcCar98ueFhbPYVEaa4rgLRAO2ABnaSW+hcWFvx+F6/PVenA4YwN/kuYtHe3uza44o6Ujt9Uf0vYOYzmtvZI0y2zZbWZQD06FhmLiTL+oeCq8uIyi8EKJGlJLH3KXy7ONP4h/j2WYmz8CDxnV2/2nd/vHBSaYId0Y58GZ9YYq23iysQyCoyvBpvTxvGfYFkOhROtu8wmdpa+3lwryLX7tcYOaW6Z/Fza1pqdWiuxF45hDMemYeYnI9t9wfC1cGVuMGn48ZFM0aQzcTX0gog0yTGHA6h3MPRpsZ2CWtlP/Wrq2KQgCxHYyftgOqWETxDn62FbE0qCgQd5WBAIJKO8hCNdnN73TlzFYjd39LVQMOS/vOEaMAQu+rKXn2Y4y2f3pytlFukMHKW9jl4Xeb1Ni/cZuut1nSCZchLlBYjV1rhzgPgf1yhWOLwvMNJ/2nyLDoU3Y44nlrCSE6hcBsLJFCNpYbb8yZXn59c9K6YzCkW9511iE9zIFapneY4A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z0d88bbseTWU0nHcQHCdheSR2mIcjZW0V3ij5CtH4jIqqpkOb65Y+MdMyttgTgf3PjKTWS3jtS0ZMrooeWlCDpdtxcrCXQeGa/UDsSVr7ZAwFT2IYn/1/gK1gMajERpF1gfvRK5wSXA39ndBSdsUBpVmgJjm4i8IUdIkGiKY0llSiga1RHFdU/Fwyguz16XgDFa4e7+Ww7YOElkEs+9YH7iKcyASEahtD8QmkYvPPfoeUJ73qpkf6sz7rJBv6CUnWuQYEmVTz7JqtjbSoOVcOKXY/D5Vktf61qTgk+FUd9TbhCh7s9X+09mCZwWGRpWidFxlXHl3Fh+RszvTT35jETxk9/KADl9hOcxtl/VkCJGMR4KCen7Wai3HfWNcC6mAukG/kC+3kpYYcgDHyPKeU0V5eWy+ucSAm7ndvsUgu4+pwYwqsY1TTDJQDLW9Qds4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 18:17:36.5466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4251ce3-3381-4183-d8b4-08de8b63f54d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5812

 q78_get_volsw and q78_put_volsw are get and set functions
in sdca library to handle 16bit signed Q7.8 values for
Volume control. Make them extern so that ASoC drivers can
reuse them.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v2:
- newly added patch
---
 include/sound/sdca_asoc.h  |  6 ++++++
 sound/soc/sdca/sdca_asoc.c | 10 ++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index aa9124f932189..bea885202c35a 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -13,6 +13,8 @@
 struct device;
 struct regmap;
 struct sdca_function_data;
+struct snd_ctl_elem_value;
+struct snd_kcontrol;
 struct snd_kcontrol_new;
 struct snd_pcm_hw_params;
 struct snd_pcm_substream;
@@ -57,5 +59,9 @@ int sdca_asoc_hw_params(struct device *dev, struct regmap *regmap,
 			struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params,
 			struct snd_soc_dai *dai);
+int q78_put_volsw(struct snd_kcontrol *kcontrol,
+		  struct snd_ctl_elem_value *ucontrol);
+int q78_get_volsw(struct snd_kcontrol *kcontrol,
+		  struct snd_ctl_elem_value *ucontrol);
 
 #endif // __SDCA_ASOC_H__
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 733c9808891a4..6ea61e5c761c1 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -820,8 +820,8 @@ static int q78_write(struct snd_soc_component *component,
 	return snd_soc_component_update_bits(component, reg, mask, reg_val);
 }
 
-static int q78_put_volsw(struct snd_kcontrol *kcontrol,
-			 struct snd_ctl_elem_value *ucontrol)
+int q78_put_volsw(struct snd_kcontrol *kcontrol,
+		  struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
@@ -841,6 +841,7 @@ static int q78_put_volsw(struct snd_kcontrol *kcontrol,
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(q78_put_volsw, "SND_SOC_SDCA");
 
 static int q78_read(struct snd_soc_component *component,
 		    struct soc_mixer_control *mc, unsigned int reg)
@@ -855,8 +856,8 @@ static int q78_read(struct snd_soc_component *component,
 	return val & GENMASK(mc->sign_bit, 0);
 }
 
-static int q78_get_volsw(struct snd_kcontrol *kcontrol,
-			 struct snd_ctl_elem_value *ucontrol)
+int q78_get_volsw(struct snd_kcontrol *kcontrol,
+		  struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
@@ -868,6 +869,7 @@ static int q78_get_volsw(struct snd_kcontrol *kcontrol,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(q78_get_volsw, "SND_SOC_SDCA");
 
 static int control_limit_kctl(struct device *dev,
 			      struct sdca_entity *entity,
-- 
2.34.1

