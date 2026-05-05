Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43737BE94;
	Tue,  5 May 2026 11:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979944; cv=fail; b=F9zmOxT3RDgUgc6cbx/yYvBOTJsYeVOoTch2YQJOb3nArkclTF5YnauWiQCw3S8ZEP09cdPnHEAVv1YSnQ33n55YdBiH+i+CJ3i+HHd+SNjZoAma+wgr995XQgaFn6gD0hEIMlrKB2q+i1rbjtOihhEfV1XZqritQw4Vq5aOk0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979944; c=relaxed/simple;
	bh=lkmFAz4qISUivW5gSIRo43IWEUFF9izJdVUtV2pusb8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZhqoz/WHVOxJ3XaVDB5d2J0VetEJh0Xmd6EHi8Lsr5AKi6MrpIqbYHIFktEMs/UxAXFderhXMq9PjTX0M8vg6UZ7nXmf26Du77zY1PW0dSo2WdqPkCeNPc051oxUtYdygicmBOepXCygl+nqGzdeLksRz8DvfRlzCwquuOu2UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rfZU/g4w; arc=fail smtp.client-ip=52.101.46.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rfZU/g4w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AujpNepiatkTJC2oShgiJ60gTanz+3TCdpyjRo/ypnh6obrX1w2h7bY41B/dDg9bOzmh6yDoT41kj2jdF19nrfG+1KjqxEM+BlD1VhFnDu++OmtuWGJNnOTUjsYNRQekDjF+F82HQ5VMHRuHOUbovPN/PuN0Iy9PvYYcN0DNrECsJqGW1o/aDacP6+BoaiSLqniduMSjoyALBFpKc8E21/pdHxDLnqaSe9EY+PTbMbbTxNoWZ7o+U6e7EVJYikKhq0kefuNlLSpuU+SYFX7pnWyeLpmCsBNXki+DscKivnyGQsQgzJ3/ujvU9M06YuMExJOy19bFR2UMv0/yF3lkhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06i9y1bA5eX+kaxAsu3Vjuo49v1daUC7nJF7S6Mb0Ag=;
 b=zTuN8IiF1w1G/4UuKIwFD4GVx3PWgLR2XdD/D46LkPGRe/suyj/UCnhguG0PuSGgsYRxrD0mu37U1P421DdAmd9cprkw0389e4a5GlRAJJHa74g7BgrAYV5BPyuo+N12NYrilbtQiNf6EKJjjc2rM9VAfSPj2wCKdbZ2YxeBVTcMGCe/0tDWMH2Ax7VYC6cGT3eBUVyHeTlYPrzIi/EOqb9F5ReaqRLoHNZFZlLUw9dYfzO4ucCTCSL5FTChOLkBvWslrXi4L2jA2dhKfeAUjXVuXjI47SxzAMW+c+DSCITseUvIOnBkLWpLXpZFYXY8B23rdfGuR4mTD23WHSXDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06i9y1bA5eX+kaxAsu3Vjuo49v1daUC7nJF7S6Mb0Ag=;
 b=rfZU/g4wHpBOIAblYaswZVFhHU6rViX9aUXsDZmUI/5kW7Cqaiko2O4c6kMTDD9eyBImroIDXXvVMgNUnawRmtm42iUZhaBYK1N2dapuOugfZ+1bVuz3XGG44Y3IRPykTvaHM4HE+YaYWlCYJVM068CpWkMXrZTjm3dfQFuLduM=
Received: from DS7PR07CA0016.namprd07.prod.outlook.com (2603:10b6:5:3af::18)
 by DM6PR10MB4282.namprd10.prod.outlook.com (2603:10b6:5:222::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:19:00 +0000
Received: from DM2PEPF00003FC5.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::2c) by DS7PR07CA0016.outlook.office365.com
 (2603:10b6:5:3af::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 11:19:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC5.mail.protection.outlook.com (10.167.23.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:19:00 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:19:00 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:18:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:18:59 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645BInUm3137036;
	Tue, 5 May 2026 06:18:55 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v16 1/4] ASoC: SDCA: Add PDE verification reusable helper
Date: Tue, 5 May 2026 16:48:03 +0530
Message-ID: <20260505111806.2280-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260505111806.2280-1-niranjan.hy@ti.com>
References: <20260505111806.2280-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC5:EE_|DM6PR10MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: c750e589-6634-474d-128a-08deaa981b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|7416014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BqrMoWeugKtc1nv2NGBUltOjlaP6I/qpHPPDgb9meIsJfgIbskhvzy7uFKD6M1ONk3302qHznsK7UD7jWF68IBZlIog3w3cY4SdXA0VKUJXv27bjMnis9quDqnWKlIjYEqjZ1WI2KVkmjIbwZuGm3NfwP+NrHVOg/mUjkgKneAg/o5vKsnP3/r7b9vUWadiGM26vcs8Mdm+ojuBB4DXDyYA+ymWQwPHfWqN4a2Kw1iR3jFJyppsSh5j/4lAVWGyG0d5GFWhO9paC0azUtmiFeRmX8L58b7LwLLWcXcEgxf3YANeCwUqBYdqS3U1lEQD19xtq3VNTaxdsvQzm9eaEbyQJHNlgv2SF6rFAzxRqi4WCnioK3Y7xFDm7zNVbwJHbyyNak+epSBPZ0KR/VK5t0xLIKQdY9me3bqp6ekjotMq1+6FeIf19U6W8UuNDzeF/jvBSxQQtqL7gho9+6T5zJAxD78/NvtZnBfa1kBX/aI72mLtJPIUvbE5v6IWushbsGhbk6Tsdv/e6Bw0TnkJ15SJCi3tJzyb2014V6FAtFhRWzy9jYnuQoliBvAiqL7t6iRc2JabSsdwZccr5Yxbon2mefIZkYdYuK35AASXppqpgZXYPoAAc+uwUSCCrs8Y6/PvnZJeblnJ+9y5APY4Y0s912mUhzldZa7bCjZlupaAvrBvNW9rCBaHl0Pucbv8mu/LWt00pKcN//rXag39W2T9uMj7IPH5BTPox+H/ZPME=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(7416014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TfjpqeqsHC9zguVD8gT4eDnUna1wl2W1MLs9hzcSKI4dX0dav/LhCOTfMhTWAPomt81InqiemAoOqrry22t0CYTRvjppwE/Y4vmjLmExtfFNd+YKS6Z2tkgr3KfuA2IEWNY/c2AKbK9YOg07NlH8R8GkPg7KzrAUaRFt+ueq6IqEJ0EBap2GSWn4RgAoC56brDrbRaeye9W3W5pOVYIIjW/Kx61AJ+P6e0xV89fqHzwlgiWNf+uOTMiV8q4tyTmby7ux8QKFzUkWmO6rtP/HdmcsYZ2bDMdkH0HdkCEW4P2cHMMG5epkAwi6MM05iJnLXDWcM8rJrSnCcjawTKEXGofEl0buizsvXSFi76dgaFDCp9lIxfnE3XF8g7ZhGq3pMH+a1y1fA5+mJDR66KwY7VsPqS5GAOxoIofukeLay5uKyTtTq6w1/k4GWA2CbZJu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:19:00.4072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c750e589-6634-474d-128a-08deaa981b6c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4282

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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
---
v16:
- no change

v15:
- no change

v14:
- Resending complete series (v13 1/4 was accidentally sent alone)
- No code changes from v13

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

