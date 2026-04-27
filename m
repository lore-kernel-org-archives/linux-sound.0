Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011069.outbound.protection.outlook.com [40.93.194.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF34139B489;
	Mon, 27 Apr 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777278332; cv=fail; b=V5a0jUc5/S27EWxfVwUNjDF4DAjhuw94B1waaFpivh28ORZw87M6V4FkCxncHlnaA6rlkW4bJ5CaqzhrgNxGhIlXXavsdb0x/v2o+54DmLdVLMtQwJTQwpbs8QD+GC/PBG9dClF5jrJXwVlW3qnDi4au4SFzi6i/jSJb09huYUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777278332; c=relaxed/simple;
	bh=r6Nr9QfuUq0JsUlbCJUDLKSepy5Nr8GOmOinGPilo2A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u2hW752e+Hyn/bb/q8aL/lRCMCM1b7jEOWs+t4dGjVMDiwpGrw931KvmL2FhYMmYbFsyCEA8o3V+FdueQyLvDgBWjb5/ewIX1L9ELd7y4s1/8K5I8Yd6EiNMIGFNsG9iDzNImBIZpqoqt9L9+mymwumGwXiOJ7Yo2YsjF3k9CpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vo/8lttD; arc=fail smtp.client-ip=40.93.194.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vo/8lttD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQl6ZHfTSnALnP3sQTXjd72RQyVd9VMzk4GN7sVjRYbTx5yO1C+aAiecLrjAPMlq2UOjwT8DprpZa8EIP/xzoHcVtkpIHZoABP7Ijlp9GcMrfhY9asRSI0FNj2Ty7XF+2kgwkYgniaeMk0WBnv0lAHLfXImQPN/qzSu1eaQ5Zb48zLsDEXe6iHIQssq+/3dzKU6emA0lSbNCa66AC4EClP+QizwG0rnrpTMFYivvmWytJJOkIVl2aEIVxZpwmW6V8h5xJ1iK/L1IeT9aXY9EHQu2y9c2avBgvv1yh7xqhf1MIMq53AwlEPM6jusOe9KI22i5gRV4vychdxiSH2/hiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRlq6I7WSKILrpxzp1s3g86beCPjGyjQxpcuSKWLHKM=;
 b=Ovh+PWFB6w4VIdCNDWvbQMcnZPn1SxfAUOm0/6xFdr6fAdt1NT5y/HlOE8EOGerEwCbekWM28iPWeZEPlDVij05iqyNBmP3LTgXeL8ErlE6joONyq9Sb2Rxk5rtkk2bqPGI4p9r9bRVvSIsbnhK/J9OUWHWeCvDk9qKWOD9DBBTN+7+b/tTyXHDh6b0Eb9V7dfXXfHLgz+RrYycYt/aTZyS+IHuBH/jAaT0xOTenWi7gnEWo9jdIgC6fzzmBxBDHrd++1PZ9yh0R5jH3Ik9Pi2lxEouELbY2ZWGYQMcaU2NWd/Hhn0qKRmWxsbfJBrnN7Xq/N1YfCBQlKxb+eQxkbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRlq6I7WSKILrpxzp1s3g86beCPjGyjQxpcuSKWLHKM=;
 b=Vo/8lttDbe8sCoZK1dflwNqrtMCvuXmKTzT3XNFGUwOEOnygNBMfMbsNjtwfmcWrYuXjgqinKWeLHEIicLZjajqEngVmME9A9jW71lCWtJIO8JN+5ieMgHp2ZmfgP/Q9snbhoAWhY/VPh3eqdP8lSiYO0DTffBMr42WZhHo4jaA=
Received: from IA1P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::12)
 by SA1PR10MB7586.namprd10.prod.outlook.com (2603:10b6:806:379::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:25:28 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:464:cafe::15) by IA1P220CA0024.outlook.office365.com
 (2603:10b6:208:464::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 08:25:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 08:25:27 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 03:25:26 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 03:25:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Apr 2026 03:25:26 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63R8PGjB2864337;
	Mon, 27 Apr 2026 03:25:18 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v11 1/4] ASoC: SDCA: Add PDE verification reusable helper
Date: Mon, 27 Apr 2026 13:53:58 +0530
Message-ID: <20260427082401.2118-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SA1PR10MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3dbe95-008a-4ec7-c150-08dea43689aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+YfD7g9owY4xakOa0a+kvrs4oCPugXqNCHkHh45oQyZKQ6e+2x3hFVfaphICgirJUTy7kqpmNe6kOEx6JgrQbVGs9ijM+NS4O4vvHGmzlu7yhfYnkdDZJWI7rrrrfjkoN40HYU8PCRE6iTnx1rwe1rD1jLcnxMX6kdCNcTbXrOGnN2g+6Z2ZKxaWRwsnQeQgtC8UpNpqNFGpEqv7gCMmi3et/kb+jwak/BTBdYHCUTT5nO9HFuXsfg+vLkr1fXRT3cWyEVhFc5dvOyQrzLXBJ8+mMidazmsf5o7rSZQafWik4klQ8st87Gv61pMu+UxEDhMExadSEWdG+UNn7gKQ7JIVqQIbZYb/wimqRMpDTKSfVv9PaUT4pkYDSUFZQAqNJ2ohKKCQEjwhYwp1GrXxkY3jwGR8nke+jVw6qOzQW+i1BFLEzivHLAegFKWaddqttO14zYS2taTAs083193iATwVl99yeXTzhPB9kWSWxqUNAHa3tVo5UmYBvAU/0id2CEjbwm0+Q/exmkd+CkgxjK/SJNALlAzbFSBe13non1+ciJZ9hC4tOX3Wter53VGuQHRwMutJB4aZWeh++H/YkolRzv5D9EyrcNnP1PouyJw56OJGfi01I0eTNu0BN7uxWMnZ3fF9ttWR9DWNm6P09XOjBqdk+9er3v3LSiGtIfz2pTBAfGKFlKq7epgLa03zbyJCUUZ62uAIm+HgHgGYfwR9H5QXUChHTXUvrjInnqfXfD/LInRLpObXvsr/vkonft8gL58In23N9krJwsYl/Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	19vsVdV0EPRmYzm+hyA959JLLEYYHwC7L6lLL/YcMC+4qw8jmHM7lnAoulr95elf70jeUavy7DA+kcFDKuxX1M+mcrE2J3b7W97OSZOzitqO/rvRSpX/inO2B9f8iA+L5I6T0ICuvECnNv43yuawFe6JsZZloJUSE69jVBeM02/GDB52uw/uZI+HrOnc2goaeolcaUEY46cSb3Cxtrq8IbCjEbJurlqOhpHozRSKzhBlUOnn23DPdgST+WotsrcpBSbQpKQ7PunDRXU9Urqb7tRDXwsKgAhBVS5tN7hmWQzfLAIaVfQcaBkASIYW/MKMjvh8G3++cOINSR0zILu8uCzlb3kvoLR806MDKweoxHaGnEQsVr1pSr8O3gAf1tC8DJvbk5N/1bPb+poTKSMGS1mxjQPEWKAMhIOEWAZ4A0HYAV+15fab9kBUnIEoX00S
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:25:27.6847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3dbe95-008a-4ec7-c150-08dea43689aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7586

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
 sound/soc/sdca/sdca_asoc.c | 105 ++++++++++++++++++++++++++-----------
 2 files changed, 79 insertions(+), 32 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 46a61a52decc5..ca35d5a44370b 100644
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
index 2bfc8e5aee31d..43bb5ce0b3dd7 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -359,16 +359,78 @@ static int entity_parse_ot(struct device *dev,
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
+	dev_err(dev, "PDE power transition failed: expected 0x%x, got 0x%x\n", to_ps, val);
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL(sdca_asoc_pde_poll_actual_ps);
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
-	int ret;
+	int from, to;
 
 	if (!component)
 		return -EIO;
@@ -386,33 +448,12 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
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
-
-	dev_err(component->dev, "%s: power transition failed: %x\n",
-		entity->label, val);
-	return -ETIMEDOUT;
+	return sdca_asoc_pde_poll_actual_ps(component->dev, component->regmap,
+				       SDW_SDCA_CTL_FUNC(widget->reg),
+				       SDW_SDCA_CTL_ENT(widget->reg),
+				       from, to,
+				       entity->pde.max_delay,
+				       entity->pde.num_max_delay);
 }
 
 static int entity_parse_pde(struct device *dev,
-- 
2.34.1

