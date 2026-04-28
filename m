Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6E32720D;
	Tue, 28 Apr 2026 16:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777393777; cv=fail; b=f0dzrnojY+Gp9ciGxfk11QBaEAaZHYBlr8vESfKg4PXOghUf149isM9vZ5xBSL88EKq01VVNJmeI3I+799LvAQhUjY18oba96xAyW4ye3K5q/nPA7BiDoqtTwShGrwtJXnPufBa7dJQzh463DbbD9n2NuCHDD9MdkZsgk7llZ6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777393777; c=relaxed/simple;
	bh=W+gRmIXT/omriVAFrpLc7OCE3WdtcpSi6mTuZikGUqY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YxBxf2SJL0CG+ts1YNoT/T/FkzL3qjZFL5zOdCc9lQbOw2uUGxAXcIT4jbZVNhThFp+3mz50F3f0Euxo7D0VktRf737e2Gfcc854nCjD6FmRV12EhawdCJ6wXuXEXmz2yIDNq7fkw9FCbKlGw11RBJk0KDXodfeF1MY0K//EdtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pExyUwFu; arc=fail smtp.client-ip=40.93.198.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pExyUwFu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fByYUMsJEjJEWL49oX+J9SysbA0k9lmAJI3fBvKSZYZHqbQr/5GbtxIknWuQlueT7gRtE5kLFQZWfpm9jJWutf9qVwoQIU5MagEFSwi5hPqDBUAmZTzRSeV8D/XhRJI0V+dPtKIj1hZi68hBWjihGtVw17+xp/9s1JBoqeV0yCkByAZc0flhzlzMgrMms42FJaEUf3kb0Abky5hS0CC4/n/IRsYgBK382ZRCKTiq1P1ldVQbUdtSsKKpvIpigskTciKb6uOXMVlrmbbKsQ0hd/6g6MVAdZuo8vQ/yMrjvEZBUIhArloForfwPV/JgY0P0lcfvdA/okAYCDwvQ/feig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDr0ynKW1U098rEvtQQ63VA1ZUIRX58Hg2vpYRCNabU=;
 b=iLB1tTHH35+3jCJLoe4bULv80WqMN/q0elj0xzlFO0toScgtHOUhUyKuLJYTY3g6LOMKvzaw+bNvfpQLVOsWGyAyGvnK0qxhszwOKNw65z3xxtuRkdCnQmacCCoe8x13zteXOeOSImn1SmWqttNgfdvz/eWJnVf5sJSpPauuaJDi/cVBqbnaMd878DMqul20te1ZFaGArChPUSm9/RnDyjMBVrwYb+xznDfkePUUvUUsfti8IUq8A7wOFJRuvTMuE3uQzz1mJyJk59B9N2ARC3UCdKEzNM5k6mJK0pWEmbPJU5u1YSR36oOiMOTVPhc18SChw6d9BPanyCsWoCrqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDr0ynKW1U098rEvtQQ63VA1ZUIRX58Hg2vpYRCNabU=;
 b=pExyUwFuutXTrb+At334s1DfaQmBATTpqEEYxPMNJ6j/rmpenF7T2tAm+flaWSOVZzkv9FGWQ245Uhge2CoBW/G219vpIotGjgCd0gCDPoq0iALuJ4Uxw8ZaipSljZ+65PDPlfqJ2Trq9jLz0t+nRqCN9hcFZtvPqk1gbVtUqFo=
Received: from SA1PR02CA0022.namprd02.prod.outlook.com (2603:10b6:806:2cf::29)
 by PH5PR10MB997735.namprd10.prod.outlook.com (2603:10b6:510:34d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.27; Tue, 28 Apr
 2026 16:29:32 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::75) by SA1PR02CA0022.outlook.office365.com
 (2603:10b6:806:2cf::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 16:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 16:29:30 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 11:29:29 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 11:29:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 11:29:28 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SGTNnx1314937;
	Tue, 28 Apr 2026 11:29:24 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v12 1/4] ASoC: SDCA: Add PDE verification reusable helper
Date: Tue, 28 Apr 2026 21:59:08 +0530
Message-ID: <20260428162911.2372-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|PH5PR10MB997735:EE_
X-MS-Office365-Filtering-Correlation-Id: 5458db25-4b9c-4ac1-63f8-08dea543532d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/rcMndpNOXT4CfX8l99TARNUsVNH3xG3FCKKmhVJBPz69tmQNnoC758uLCn3DZWrJ2A2lgQWztBVbJ2xtfe1c1JG3iXpeMRVv/gyW77sZPSdEB08EOvk0EF298CPam69SDfefGF2vw7F8g6e0Er1CG/bgtt168gn4yTawyuKedIXMHL00Gz2DigpHs71f9Cts9AkxUWTxNYRxFRqlNHmMdJlLhn81yijqySjfq8P0/1t6FElvbqxLiWbKllDg3JRRIr+D1slXagGIIgw7xCnCn+8Gyse2KtUzka/+e1SWh8pfpRizKOV5A+qlWejPvpr/RH5agcKOwfkcgKRm/Ss5tNQb/0j06M6JEM5b6awY8XAmCdX+tdspNvzazW2N8wTsPifuzqcaN0zHXRkPcqYF9TSEAIeFRxvSV0qPnRsavo2cvkhZ6fjxrIMrkg3gvFUdKjp5xAHXlRi2P4qX8NOExcCStGaDp2Xa7bHOG+LspPIp+WVGAd0G/SR/Kb1DU1EbbEU4LkzsPQJx82cl2EpC7UR/UZzyfilh5aa83B0JFtWdBfX7Jb1ulpuEeBgZcH48LSi/jWoKLcdK3L/4lZ9C6V3bkrh+XholsFv3llSfHbLrvONp968WMHukfUcCozcFf80PX82kwgraYMdXiZX9RSZH+CTEFVzOALOEv3b5NSOabQ8rGNw1d+R7IEkvLvIbHWjzpdKHTTZNupVQR99XuER5NXcms6tz17aaxc4HHGIKduAUyrot6GilBihtU8IxYw6w8Sc4YYZ70zPoiDOOQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6MXzFme7wuJW+0DVq6VgDIEgXgIXIkrcuFrOTNlhoHi8HEyQbEjJzawUORt2OgDBLg4YASjyCEdd1oQwZYTFWTmAer5nhUeOEzRxM57n/s82588U449OOvEr9h/7nQlPFwhEl7gwd3WuznOMGcF9lou8giMiTxle+zMk3oGymCahRF7fwn0zvQ7ku0waIqEjD/rkVz2U95MLhWbivx5maa17ymGSeLFjAdFpAFId9Egag9OdYvfFeonIGyeqnVXHnTlGZ6YYWsrc5l3/BGuxcwoLlpHBORNuYUvZCLJ4L8U74hKySgk6Hx7RTL9KkfYvHL7nxof7CToXsSpcw+v1Oy4cRYOvoodie+S0FNym5DEfxhB7icIgSaJdSM7v1adRzEJJO2Sk9oK3NGeZcTO4Y2asL/ZxEKckTX4enwaJAqnOhouYW/84JPDvIGrVTNq/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 16:29:30.9280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5458db25-4b9c-4ac1-63f8-08dea543532d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997735

  Implement sdca_asoc_pde_ensure_ps() helper function to poll for PDE
power state transitions. Per SDCA specification, after writing
REQUESTED_PS, drivers must poll ACTUAL_PS until the target power state
is reached.

Changes include:
- Add sdca_asoc_pde_ensure_ps() to handle ACTUAL_PS polling with
  support for device-specific delay tables or default intervals
- Export function via sdca_asoc.h for use by SDCA-compliant drivers
- Refactor entity_pde_event() in sdca_asoc.c to use the helper

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v12:
- use correct namespace while exporting the variable
- fix missing entity information while logging

v11:
- revert v10 changes
- API is renamed from sdca_asoc_pde_ensure_ps to
  sdca_asoc_pde_poll_actual_ps

v10:
- write REQUESTED_PS before checking the target state.
- change the API name sdca_asoc_pde_ensure_ps to
  sdca_asoc_set_pde_poll_sync

v9:
- newly added interface
---
 include/sound/sdca_asoc.h  |   6 +++
 sound/soc/sdca/sdca_asoc.c | 106 ++++++++++++++++++++++++++-----------
 2 files changed, 82 insertions(+), 30 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 46a61a52d..ca35d5a44 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -13,6 +13,7 @@
 struct device;
 struct regmap;
 struct sdca_function_data;
+struct sdca_pde_delay;
 struct snd_ctl_elem_value;
 struct snd_kcontrol;
 struct snd_kcontrol_new;
@@ -99,4 +100,9 @@ int sdca_asoc_q78_put_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
 int sdca_asoc_q78_get_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
+int sdca_asoc_pde_poll_actual_ps(struct device *dev, struct regmap *regmap,
+				 int function_id, int entity_id,
+			    int from_ps, int to_ps,
+			    const struct sdca_pde_delay *pde_delays,
+			    int num_delays);
 #endif // __SDCA_ASOC_H__
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 2bfc8e5ae..e76afa396 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -359,15 +359,77 @@ static int entity_parse_ot(struct device *dev,
 	return 0;
 }
 
+/**
+ * sdca_asoc_pde_poll_actual_ps - Verify PDE power state reached target state
+ * @dev: Pointer to the device for error logging.
+ * @regmap: Register map for reading ACTUAL_PS register.
+ * @function_id: SDCA function identifier.
+ * @entity_id: SDCA entity identifier for the power domain.
+ * @from_ps: Source power state (SDCA_PDE_PSn value).
+ * @to_ps: Target power state (SDCA_PDE_PSn value).
+ * @pde_delays: Pointer to array of PDE delay specifications for this device,
+ *              or NULL to use default polling interval.
+ * @num_delays: Number of entries in pde_delays array.
+ *
+ * This function polls the ACTUAL_PS register to verify that a PDE power state
+ * transition has completed. Per SDCA specification, after writing REQUESTED_PS,
+ * the caller must poll ACTUAL_PS until it reflects the requested state.
+ *
+ * This function implements the polling logic but does NOT modify the power state.
+ * The caller is responsible for writing REQUESTED_PS before invoking this function.
+ *
+ * If a delay table is provided, appropriate polling intervals are extracted based
+ * on the from_ps and to_ps transition. If no table is provided or no matching entry
+ * is found, a default polling interval is used.
+ *
+ * Return: Returns zero when ACTUAL_PS reaches the target state, -ETIMEDOUT if the
+ * polling times out before reaching the target state, or a negative error code if
+ * a register read fails.
+ */
+int sdca_asoc_pde_poll_actual_ps(struct device *dev, struct regmap *regmap,
+				 int function_id, int entity_id,
+			    int from_ps, int to_ps,
+			    const struct sdca_pde_delay *pde_delays,
+			    int num_delays)
+{
+	static const int polls = 100;
+	static const int default_poll_us = 1000;
+	unsigned int reg, val;
+	int i, poll_us = default_poll_us;
+	int ret;
+
+	if (pde_delays && num_delays > 0) {
+		for (i = 0; i < num_delays; i++) {
+			if (pde_delays[i].from_ps == from_ps && pde_delays[i].to_ps == to_ps) {
+				poll_us = pde_delays[i].us / polls;
+				break;
+			}
+		}
+	}
+
+	reg = SDW_SDCA_CTL(function_id, entity_id, SDCA_CTL_PDE_ACTUAL_PS, 0);
+
+	for (i = 0; i < polls; i++) {
+		if (i)
+			fsleep(poll_us);
+
+		ret = regmap_read(regmap, reg, &val);
+		if (ret)
+			return ret;
+		else if (val == to_ps)
+			return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_pde_poll_actual_ps, "SND_SOC_SDCA");
+
 static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 			    struct snd_kcontrol *kctl, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct sdca_entity *entity = widget->priv;
-	static const int polls = 100;
-	unsigned int reg, val;
-	int from, to, i;
-	int poll_us;
+	int from, to;
 	int ret;
 
 	if (!component)
@@ -386,33 +448,17 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 		return 0;
 	}
 
-	for (i = 0; i < entity->pde.num_max_delay; i++) {
-		struct sdca_pde_delay *delay = &entity->pde.max_delay[i];
-
-		if (delay->from_ps == from && delay->to_ps == to) {
-			poll_us = delay->us / polls;
-			break;
-		}
-	}
-
-	reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(widget->reg),
-			   SDW_SDCA_CTL_ENT(widget->reg),
-			   SDCA_CTL_PDE_ACTUAL_PS, 0);
-
-	for (i = 0; i < polls; i++) {
-		if (i)
-			fsleep(poll_us);
-
-		ret = regmap_read(component->regmap, reg, &val);
-		if (ret)
-			return ret;
-		else if (val == to)
-			return 0;
-	}
+	ret = sdca_asoc_pde_poll_actual_ps(component->dev, component->regmap,
+					   SDW_SDCA_CTL_FUNC(widget->reg),
+					   SDW_SDCA_CTL_ENT(widget->reg),
+					   from, to,
+					   entity->pde.max_delay,
+					   entity->pde.num_max_delay);
+	if (ret)
+		dev_err(component->dev, "%s: PDE transition %x -> %x failed, err=%d\n",
+			entity->label, from, to, ret);
 
-	dev_err(component->dev, "%s: power transition failed: %x\n",
-		entity->label, val);
-	return -ETIMEDOUT;
+	return ret;
 }
 
 static int entity_parse_pde(struct device *dev,
-- 
2.34.1

