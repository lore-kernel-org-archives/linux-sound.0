Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6894536EAAC;
	Thu, 30 Apr 2026 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533818; cv=fail; b=hPRfTDDX3Mcdd6VTYqZAGxT9qUv7dFNwW1W8WeI3o7+BL0CAGm4Nq2FWS2mV7BnQms9sUhATCGqGjB8t/Yj7+Dl47XAdxK3VLeJVvI5d0SsVMuaOjHTlu2SXhdsy/F5TcT/YpHKFxw11IQVVl5jT+TaFv18bzHJJM7K7XIqqdks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533818; c=relaxed/simple;
	bh=7gFsS6/OUMFCoJi+CedWefJyTjPib9vnpt6tt6uwtZU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B2kMflLG8rNwGpqhgCIVEyAIAX7UvymZJH0xldJde8gAht1z2l+hFI+KZspy45dtg9oLI+BVJ3vpwIrJwhd8UsFQAhMqk9+yF8PnPqBbkS4QhHE0+uofvoS5/g2dNNFmqaHEnqAlega7CDgCdrJBL8o8dRSfCKkECa2ygFXUhVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HD0R++ZM; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HD0R++ZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8C1Bxgq7Yl5a8oDSjcjg6qRzmrq4Dwye3yT/Y1+vE0KICiv5YfPd2bi56gDnIdrYiDMQi2jxXK4XrdIm1oukdAkbR6k2Q/7qJtTOTyEqybwOCCSOmVo7uMyBRqUbVTOCaV56t23G/TTx17royPJQFTNmziMxxdAJzWGSvQHbF6hMqSwU0jKrWSqM287aUufuMIftfMhuo5cQDrIxl6Dz1pRs8UqoL+KHYl7Dya3yX4woRF6W583dqwoTYGZ/EMlVRcRms49vSMfelNMYhF9TE71CsBdDxsyePqPkOfUJ/nSgxnTxUXQpbv1epY9Ht3YwNir2Qp04c8qF52KPDVlaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GN+fvozmwC3B6u5yCCW0H96TmjbcpyKxIxQY3H1CCR4=;
 b=VOQWlRhMxBoCVRHmoMZrpeIRHCuDtEU20Ux13JHMIlFBox69iVrnkYo5DKS2eUYxQOlvo+Qr2NeWvxqmV5LbOeEGI7kENZWFnOLTN8dsO7axfPq0s6M+ghe/PATyKcYpu4/+WZlRjUKaRTe4RzgVuQoODr0itTsYw3tqZ/wW3Z6qFgA5N/vR7BK7j/w7x2snXCVeEdEIZrpQs+bYDv+6ipRZcMtsZQpEM8cmkxAZx9nl8JXWBDnWuQjQGXOcQIrJrPaQ20/09Qst+Xg6bjzEfqn3jqBqVgzXvlUNHY71thTivVWytnVlK0YG2tS4LUVEjgUHf2yxdWEw7xESEqbA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GN+fvozmwC3B6u5yCCW0H96TmjbcpyKxIxQY3H1CCR4=;
 b=HD0R++ZMo4GEyZMTvy7EooZTZnSDbus7F6V/5cSXd9nwxR4nJ+Wz6gwJCtAkaypPMLOqyFua/HXVFux06C0g4atYdXx4wP1zD9GEIGo4pKf36Nr8EWA99jm89D8yPgRDoreO7hUxCt2bO4kOR9a2JNPOKhOAbMnDKz9yWtEFECk=
Received: from MN0PR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:52c::6)
 by SA2PR10MB4682.namprd10.prod.outlook.com (2603:10b6:806:110::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:23:34 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::d5) by MN0PR05CA0001.outlook.office365.com
 (2603:10b6:208:52c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.20 via Frontend Transport; Thu,
 30 Apr 2026 07:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 07:23:33 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:23:31 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:23:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 02:23:30 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63U7NPP2864506;
	Thu, 30 Apr 2026 02:23:26 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v13 1/4] ASoC: SDCA: Add PDE verification reusable helper
Date: Thu, 30 Apr 2026 12:53:21 +0530
Message-ID: <20260430072324.2183-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|SA2PR10MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: e151f50c-67cf-4d9f-dff7-08dea689631e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qgsZTBxTho2Ke/UBkuvbV8Jtk1TQZCPY7Bp3b/ounlZiIXLOEwlHtnkLGk1Xjmcr4Q+a4JOo8tc3fRZhTkaQ7YCxR/MVJdQnrTer0RWNXUW2+B1eT/pm2qVJBeCjyorewgPCjqCXlkVzQwCGWdLNLOUphoLGXyktvcb4Wv+8nwr4XlLgXD/CMKj0vxBr73dQbxI8buP/orm0J7UsuKMU2HbLuHqizUzVwIiqCKaEtodVbuHNjy91bNEK5In0VPIbdHuKajCIFyI6P6Ep6/1Yc0XPLGoqDWeCbaWDzgr9NAH6EKH65e45JLuexSKG/H2fOSPaQlQTjIOOM4IbRhAapeCLfkeZz3ONnMYzG9YRx0UQxV7Xd5r5JOCZudOhFrXCrWnzdYzPQt/faBHLppcHoqDlWRcJdZgThUXmNYJq0z8gq1uJsIVuGnnjNOHfDj23QdlSq7b3QVlByzDTJTQqIj5ffVCCWhHx20B52wrH32Cc1FbBO+42BdhjJU/RruwImVk9d8XHorzNE1zdu/hAA5PoHEx+m46OCg05ITozQJfT7gEzYYnTZIeBqnPwWSdCHbUUtxM5KUFuOe5jrplcJVuuSXKxwLaqfwWqqBJ2mtc8mNmpSxHDT7vAbFH0d9f1bXDSEiIkcLkrUbZSnGEwnwVyQCLHV/zY5DTgsETuDaHaw2KuXTla/tgl4AnHPfx6o0Ns/4QYVqwtqAPhFbfz8njqHdm1w0LFOK26ZxExnOsNmLzhH5G1AT/khVbxJVnDUIem2SkAsogDx7rTDN7OYQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VdaljxnLJQYXoKwo4svZmZrH1wmyeMnKfUQOf2UtXvEo1jRr9mzaCuuwp43CPjxlkUduh4K1gzD7s1U/py65zfc3hMG3P11SU80DJ4X6K02ccpJjk7rz/jHLk3iIHUf0N/V9JjiHpcaeuv6vPXKwQCF8UnkutYaJLuEseWQgQvXPv6hpoEpNWBvSrCbh+yQ3kcizTqeWhNf1XRbKSCGnAFSAcFhpuLe1rAyi3/l4eUKcvDFS1puOZxvGCyNNAvFGzsmpB7AdaHzAXCnGaXST7fCOUzDeRPWQVLDIySq6SNS7gjuWfxaLQFlUFGFrDTSnVHn2LLebQ8Jx+7Ru3zKvagYATMHIj+tfNPHbSKSQXhx+J/YPe0cBBzOUj9uln9GrXHML3zzYh76kInkELwipxhv1jEUmWSFjyrTwQv3EdXnGLUzC9UOgOrqwYqVEbOO4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:23:33.5646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e151f50c-67cf-4d9f-dff7-08dea689631e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4682

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
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
v13:
- no change

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

