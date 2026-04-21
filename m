Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC56303A35;
	Tue, 21 Apr 2026 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786563; cv=fail; b=i7b9JCdwTfbZXNRGIj8+oY/Otp6StA00k7DaOj3f1opg6XJQ4H/I7vjzMdf7wYEkmVWEST8FUzNT3NzbdPdbTDursKV5+pGhMTau2gwELL5wSSm9VNXibsWS/mgfZOZGPGJg0JiKHoOrQ8nLocwBuQQq3NYEZnu0pb4nIM7l7bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786563; c=relaxed/simple;
	bh=3AD5iZkf5k37I1ZLz0xLQb8EWaDu3r3QenjD4CleS6g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KnnAW2+NSMD6sVBRg+64+ZGUYmOSd6PFftqp/xu/nlP/lPN0r5xq18q6CXff8kKdBEAkAsaaI2i6NxDQenOGpHx/HrGTFITQq/SsKizWJEdDUayEQdtyr1M08vxw/xT1AUOeFDtYrLWQuWoFuBitr9O5Dub1sGp4BdphUR7wLgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vzNGIwjT; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vzNGIwjT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqJf4KKSRCulWN65oJ9F6W1N4UtbMi0tF9ETlPgmek7JICxr011b7VHv9qTgCBxBAAFhPOYrM9Ab+lUfvT9QczQq9ZQIkqlOXMElyJBPJrc3JKpmpBhjVjUpPwKPQdW2RlFg2X/nK0i12GAwEV75FeQkyTXF/MoesKz3YbOaUoOiTiwfn/h79KOp3HoFVVGkG5YVcUNKD2B5RjilF9naUxdP604qhFhb5Q7dlud+d7vYRp8XcFglfxjPZrrXTNt22lwlrubuUBafCqvUs1hR0DsBAcS6j9JVfD4Bh9iN1BX7dgvR649CEUDtl2H3D8mDmWg+Gg53ZIoMDO8jotf2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izVmYV94NC8QKvEP1rka5XQoXrpbg4nl/TpZbCh/hg0=;
 b=JUpo8dWE2w5BO99SgMmFxdDLzJZDIFUJstHZGxgCE+kPDtMdEImVkCm5ichI7G2C8/R73b2WMj4/VBqwcprKDptkEozBK6/M8nUP1YLtZ+w6hxaA/yYgZWv7pcl5afLyhtAlikzyCm/9NodIWRIrSpdC26hoCeaRhYF2gPTCSz2nvKTTFghPEmITygMqQz1Jg40eu4MyQWXXeDMzfOETEkOD7Z19kDaGfSQ9UO7vKijUthd6X9DGe9H5ClvJSn1wZLeBRJUG4pSHHDQ+su9XCd9jPErp3GbPckyVnbKcLx43iPACHp87CfJ0lnozoHiMlw2xfxKhf+xT1rCp2/kzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izVmYV94NC8QKvEP1rka5XQoXrpbg4nl/TpZbCh/hg0=;
 b=vzNGIwjTsP7gnC5yAZJP+C8vMwCGjb40xgoBNfA19XBJvS2B56ocOvayXf5iXlQ0KMHkS4js09y6xDfDZ2aaaZbMPAnCgKnOdfh5jPwR3etBxqakfrlalo/b04sV0Tf7xMLwjCDR5JZarP2GdffHRzHutDdAnEqBd865bv78l+Y=
Received: from DM6PR11CA0069.namprd11.prod.outlook.com (2603:10b6:5:14c::46)
 by DS0PR10MB7319.namprd10.prod.outlook.com (2603:10b6:8:fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 15:49:16 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:5:14c:cafe::15) by DM6PR11CA0069.outlook.office365.com
 (2603:10b6:5:14c::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 15:49:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 15:49:16 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 10:49:08 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 21 Apr
 2026 10:49:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 21 Apr 2026 10:49:08 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63LFn3U2522085;
	Tue, 21 Apr 2026 10:49:04 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v10 1/4] ASoC: SDCA: Add PDE state transition helper
Date: Tue, 21 Apr 2026 21:18:01 +0530
Message-ID: <20260421154804.2670-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|DS0PR10MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2c1b95-2879-4214-94f2-08de9fbd8aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VQEI270hMyNMvxX7vz5MWN+1+le63VBk9u1GjFbmOLKTknU1zqgEk67PNV1ECpwalUUIERGkinfCVRyqU/XZKPZram9cNeFRkWxp7mxu6KO4pBejorCvbiLPuxo9DhXckSOP/41yQGp00VO/m03dpy8R892sPyGBFzZuc2Gu/lh04gsax9ZeBOXE1hIRirFXcd9WEMg+kQ5p/0SYI/v52/ZNnu/OMN3D47jwSIX/uWQJrYkOUJzV3amWQiB1GtRq9oI60CVp1QUGmiU97B7UAfg/w5+M4beyeXxlhfobBK/8vqXAlO+envpwxiorgjdl8oqGFvg6HM3eviJ3TcAk+vMLUlJXsKIGvWpLG3ArmU0DkH1Bek4Y3Ox1H1MNvVD0KbCXC/AW+g4Lv73ZvT7TuFX/9JW27veoGeDAL5Q52Kg40ECuC7qHp+5U2KCDTjNhZGR2YQy1ERHabzxhBwMi77Z0LA2Wpexe0a9MwXS2Tx2wVkUW+7a/FnvECUNk4yCBAew+8m/St/EqJoG//fLHFoqxAZxP0rcRT/lgQU7Ng3I4dmPxVsCKvnx7zSsnvhrz7gNdMbtPAk2bJIKeIdy14mNNnk3+mZUFcFCcYz0PnAI6qL5Z8uW2HkyLaDwJ/jARqn98HKL9V/jQYoq+mexzLkhkLdn+gqj4CKWBceNboFaviw/Frvub73cCFmYiBv2rEysYJB3NDvrU6PhWHLPNXGL2bRBMTQNCcwVXclD6RO3HxkdCsQZV8tmb6yfz0CkpJHUed4RECX0tCeoLB+1ACg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EI/CTEs8BGSYaX+nBhML5h39j0VwLLaAgnsB/F0HirM0j2Jz5lHo/rsCzpWmG2eN8qPBCcJ9uLY53SqV6vznbRUr9AfE3hjFFQN3oaBWp1qcgXPpNr6sO7k+upW3BDRoKTBR5eZKmKk34Ce5LpEZ94G2zH7AqSf5RaIaTz3JRLGa1JYqid6yCFUvCUHiUlXb7gxZ2TJOKiMOgUVDxQT2pQ8ssHdw3Y12z1I0sETb+YwMyEGAaQ9ZX1621pdZotQ9P17OZXvoHavUtnyhd7UU23yeE0Lr3+O8GS4G8pgoRaNsMq74+Mlmpa3jmGRh1iqPbDf6QWfCmxtwiF/cwG+55d3CXRPrLwG3sE0qe8qefV0TboqWOlaTSQmCbBIh8p0kZWfu6l/j6twkxbAq9VJq7jce9OOwLvQvtUYJDBjrxuUSXknr0k5qk3axKiYcO5k1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:49:16.1876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2c1b95-2879-4214-94f2-08de9fbd8aff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7319

Per SDCA specification, after writing REQUESTED_PS, drivers must
poll ACTUAL_PS until the target power state is reached.
Implement sdca_asoc_set_pde_state_sync() helper function for
changing the power state of the PDE widget and wait for the power
transition to happen or timeout.

Changes include:
- Add sdca_asoc_set_pde_poll_sync() to handle write
  REQUESTED_PS register and poll ACTUAL_PS register until
  the target state is reached or timed out.
- Export function via sdca_asoc.h for use by SDCA-compliant drivers
- Refactor entity_pde_event() in sdca_asoc.c to use the helper

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v10:
- write REQUESTED_PS before checking the target state.
- change the API name sdca_asoc_pde_ensure_ps to
  sdca_asoc_set_pde_poll_sync

v9:
- newly added interface
---
 include/sound/sdca_asoc.h       |   4 ++
 include/sound/sdca_function.h   |   2 +
 sound/soc/sdca/sdca_asoc.c      | 111 ++++++++++++++++++++++----------
 sound/soc/sdca/sdca_functions.c |   4 +-
 4 files changed, 86 insertions(+), 35 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 46a61a52decc5..125a3d4e18c09 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -12,6 +12,7 @@
 
 struct device;
 struct regmap;
+struct sdca_pde_delay;
 struct sdca_function_data;
 struct snd_ctl_elem_value;
 struct snd_kcontrol;
@@ -99,4 +100,7 @@ int sdca_asoc_q78_put_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
 int sdca_asoc_q78_get_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
+int sdca_asoc_set_pde_poll_sync(struct device *dev, struct regmap *regmap,
+				int function_id, int entity_id, int from_ps, int to_ps,
+				const struct sdca_pde_delay *pde_delays, int num_delays);
 #endif // __SDCA_ASOC_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 0e871c786513f..18cee74fb1f9b 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1173,6 +1173,7 @@ struct sdca_entity_xu {
  * @sources: Dynamically allocated array pointing to each input Entity
  * connected to this Entity.
  * @controls: Dynamically allocated array of Controls.
+ * @parent_func: Pointer to sdca_function_data to which this entity belongs to.
  * @num_sources: Number of sources for the Entity.
  * @num_controls: Number of Controls for the Entity.
  * @iot: Input/Output Terminal specific Entity properties.
@@ -1190,6 +1191,7 @@ struct sdca_entity {
 	struct sdca_entity *group;
 	struct sdca_entity **sources;
 	struct sdca_control *controls;
+	struct sdca_function_data *parent_func;
 	int num_sources;
 	int num_controls;
 	union {
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 2bfc8e5aee31d..87e81ee4e90b9 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -359,16 +359,81 @@ static int entity_parse_ot(struct device *dev,
 	return 0;
 }
 
+/**
+ * sdca_asoc_set_pde_poll_sync - change PDE state and wait for trasntion to
+ * complete or timeout.
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
+ * This function writes the REQUESTED_PS register and polls the ACTUAL_PS register to
+ * verify that a PDE power state transition has completed. Per SDCA specification,
+ * after writing REQUESTED_PS, the caller must poll ACTUAL_PS until it reflects the
+ * requested state.
+ *
+ * If a delay table is provided, appropriate polling intervals are extracted based
+ * on the from_ps and to_ps transition. If no table is provided or no matching entry
+ * is found, a default polling interval is used.
+ *
+ * Return: Returns zero when ACTUAL_PS becomes REQUESTED_PS, -ETIMEDOUT if the
+ * polling times out before reaching the target state, or a negative error code if
+ * a register access fails.
+ */
+int sdca_asoc_set_pde_poll_sync(struct device *dev, struct regmap *regmap,
+				int function_id, int entity_id, int from_ps, int to_ps,
+				const struct sdca_pde_delay *pde_delays, int num_delays)
+{
+	static const int polls = 100;
+	static const int default_poll_us = 100;
+	unsigned int requested_ps_reg, actual_ps_reg, val;
+	int poll_us;
+	int i, ret;
+
+	requested_ps_reg = SDW_SDCA_CTL(function_id, entity_id, SDCA_CTL_PDE_REQUESTED_PS, 0);
+	ret = regmap_write(regmap, requested_ps_reg, to_ps);
+	if (ret)
+		return ret;
+
+	poll_us = default_poll_us;
+	if (pde_delays && num_delays > 0) {
+		for (i = 0; i < num_delays; i++) {
+			if (pde_delays[i].from_ps == from_ps && pde_delays[i].to_ps == to_ps) {
+				poll_us = pde_delays[i].us / polls;
+				break;
+			}
+		}
+	}
+
+	actual_ps_reg = SDW_SDCA_CTL(function_id, entity_id, SDCA_CTL_PDE_ACTUAL_PS, 0);
+	for (i = 0; i < polls; i++) {
+		if (i)
+			fsleep(poll_us);
+
+		ret = regmap_read(regmap, actual_ps_reg, &val);
+		if (ret)
+			return ret;
+		else if (val == to_ps)
+			return 0;
+	}
+
+	dev_err(dev, "PDE power transition failed: expected 0x%x, got 0x%x\n", to_ps, val);
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL(sdca_asoc_set_pde_poll_sync);
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
+	struct sdca_function_data *function;
+	int from, to;
 
 	if (!component)
 		return -EIO;
@@ -385,34 +450,12 @@ static int entity_pde_event(struct snd_soc_dapm_widget *widget,
 	default:
 		return 0;
 	}
+	function = entity->parent_func;
 
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
+	return sdca_asoc_set_pde_poll_sync(component->dev, component->regmap,
+				       function->desc->adr, entity->id, from, to,
+				       entity->pde.max_delay,
+				       entity->pde.num_max_delay);
 }
 
 static int entity_parse_pde(struct device *dev,
@@ -449,8 +492,8 @@ static int entity_parse_pde(struct device *dev,
 	}
 
 	(*widget)->id = snd_soc_dapm_supply;
-	(*widget)->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
-	(*widget)->mask = GENMASK(control->nbits - 1, 0);
+	(*widget)->reg = SND_SOC_NOPM;
+	(*widget)->mask = 0;
 	(*widget)->on_val = SDCA_PDE_PS0;
 	(*widget)->off_val = SDCA_PDE_PS3;
 	(*widget)->event_flags = SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD;
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index fd6a254c95305..2396487213819 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1556,8 +1556,10 @@ static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 	fwnode_property_read_u32_array(function_node, "mipi-sdca-entity-id-list",
 				       entity_list, num_entities);
 
-	for (i = 0; i < num_entities; i++)
+	for (i = 0; i < num_entities; i++) {
 		entities[i].id = entity_list[i];
+		entities[i].parent_func = function;
+	}
 
 	/* now read subproperties */
 	for (i = 0; i < num_entities; i++) {
-- 
2.34.1

