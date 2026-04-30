Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8B40DFCF;
	Thu, 30 Apr 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560387; cv=fail; b=BRW1dvwTLfrmIME2Jz7SvMJ4lT+gFQtAj2/LX4BWpg6XqajHga9u4e/1IDymiqKhAoxFlHmcrRx4OwyKt7x1SYaBF7/t3ADP/MQRCpCmUq/OGa2y/C0PllG7zv27bswqbp7bHtUd5h9YYpsrGC1cjqEwzuKIfgY7yEjdPXyro28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560387; c=relaxed/simple;
	bh=7ATEQWhLA882gs1UT1gYMxBAo70SJriAhKSI76w0uUo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d27QPYbuHlYvRkHMbbDi/1k1sol0mArKQZOobBrd4XvJqgGPC74tVNge5ta229pnhYwwcIZWxP+1wUDfgT4cCj9ugGYtYwmpyklArq/rWUfTIR2bfLZHupLmqrpc7rnY3IBDeH6Uc+l08xmClrhQPASWhRSh/iH2KefZFnP61KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NHLi+HfE; arc=fail smtp.client-ip=52.101.85.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NHLi+HfE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwI1/sBubEszgizrIglcpc2kgUyxfsehHH8/gxtsIsrO4KDOYovs279haY/W0YAn1zPZxLTCh6qX1d1d7SaAANJztNFhnqFcsmJ4NhwZrh03THUtrEqF1JfQSAzTruHeoHTtEJO1PeADIQX8mqUwAmbAntRzgHV+Ya3LlGN+I+orj3hyqP4b7C3o+Yo9/KTMSWnT+i2V0/7JTIiPktNgMc0vxcvqoqrS9o8DPdTNgL6x8VG9uECSyhO5v8om2SqZfYIqnDhgrfIYoAOXVLlhyW2UEJtFfH9aWOcm5JWSa63qHUvt82V9BW1qOtcc+9XpN/0D2VmUZp33bUdMP3OTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7vVuX6xM5DYT5fVNeqeH2ClsKqUAUNI4n2kSLrRWzQ=;
 b=uL+WIKRzchphuZWWortBWGpU9RsMBRr0K974m6owZIBDRr7aXHX+ODArhaW4G/lrMFV8ub5S9hXfkSKsGYw0xICgnil+/zaoVpqKK8DQy6Nga5JR5aTMko0I5eW1zSsB3kzWlJbdwLhMci7z4rSl5/GYHFCl+yfSFt/MHI9H76fbi0VpYgA/2KIf6Fx4pCXU8qP0iiWkEjyRqM60N/tJK5MgTFJ8clOFfI5thvedl15IVz8szxt3BYhGCBpyi4KqE8zb7NJsKF22A99XOsmn2xfaCYAFSCBpAj3s6RxWP4MMDJ0G+BHFmwEqHgAIBUQP/bvckomylvXuZCVnKHUNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7vVuX6xM5DYT5fVNeqeH2ClsKqUAUNI4n2kSLrRWzQ=;
 b=NHLi+HfE1lLBqbgO2URCiO4s9YkeELHOl4R8yE+88gECkUzHt6pW4LtBMevF0T7l97TzuFLbR7rgv+ttkObAHLtc5ywIq8+4CTdVpfn6XFBKt9WLdJwx4xLg00ELK6E0BNuK0MSfatvqCnqeGaptFZHBuFp+GVccDLqerZEgVTw=
Received: from BN9PR03CA0158.namprd03.prod.outlook.com (2603:10b6:408:f4::13)
 by MW4PR10MB5704.namprd10.prod.outlook.com (2603:10b6:303:18e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 14:46:23 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::8c) by BN9PR03CA0158.outlook.office365.com
 (2603:10b6:408:f4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 14:46:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 14:46:22 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 09:46:20 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 09:46:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Apr 2026 09:46:19 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63UEk6Mi1332278;
	Thu, 30 Apr 2026 09:46:14 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v14 1/4] ASoC: SDCA: Add PDE verification reusable helper
Date: Thu, 30 Apr 2026 20:15:51 +0530
Message-ID: <20260430144554.1335-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260430144554.1335-1-niranjan.hy@ti.com>
References: <20260430144554.1335-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|MW4PR10MB5704:EE_
X-MS-Office365-Filtering-Correlation-Id: d466f23c-e241-478e-0dd2-08dea6c73fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kmLSm8nvk0Frcv3cQby1nQ0JRasagrESC4+Uc51Z+/Ch3el6dW9fgfVH5TT3BKPdf8aOh5Onn1K4MpxPWvCBaezu8RtaD3gwIr6nBQ3wsfxuwNYKPnE/V/ppJ3o+P1dHYlsFIM/5mniwinuSuFCMewPx8ULRNh/8y3HjoZq61J/UI+bdxECwQ9GQOiMZrYyq7U0YfeHTL+gXmEIWC1ljPKJ7cjPI6xkamBSteDFNkFp5cBri43Vqh9w/FUfAIdb+wF70/6AbHjOMDbQSa6P8ePZmkTL88JrEzeX4LdP8+rvKAruM+uooIvIkEBO6Qi//tVonCmZh7puXmwC7q0uAJ6LHV6141+2eW9GVcSUuxK0mYNzz7pChafm5+Dr1kgc3+5nd5lKAS9GdvEjJEYaiMMcEzPNJms7SfBldc6zzmOc8GP1ZieXzEhx0/es0o6FUVA5C1H1trv5+ZGsVl6o405XYMUbEypuQ5+Me2yu9WdC0SF7YGmmf7cvq51pvLQRiCUxlX4BcicJh8w8SqHKadhZf07IgAB0qlrhTTQQhaIwYmad8syWA5A6Tdv2nxsG+W38A1lltPTYUAGuRqIw0G/hyJgg6Xzir4plzBoZxHjfdeZXP+kPRPnQMY2Tbf9cpArw0gjy2hpvJwuv7pxyTdc/QorCAXwLpD1mAM15HQyhotiD48fo/pzx/yU0/CVXJNpzJnAnxfi5jkQmosV7UXItGB/cC/kmVbrYJB7RPyfqMZl4oHubpIT/TQpBPCF8wee3P5JNAZfemdHwViUaErQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LM2x+zdO6/4vLh6RRrTZcpbAKkK2di7spsZ6/bdDyooUW7+L/BloIZA37aLLxquKEzBsSmj6x77igbbhFMvaGUtNqpVVW4u7/vCgxy4qVkw407cUpwjSdFB7gunCPLh/7OFtvhqhYnRbV8B0vkwC5nYxMaVr6ZJvNO7I/p5AWxc2L4TX2uUPNFlm+Z68Y6r6FwAgyqtvsqAKsmX5Z6FwHBYvS96scNKjDmDOdklh7ZbBo1/fDP3GQvwBmfLAc1+MNK8szUcMCZ6babBozfomfIs8SKTc0m1O+kCittrpXIoUhf3blc2xqunCOy4L8foz9Yxlkl9LjBbCnRozwYIRyuU0Lq6poyu+lFlkTrKHhhEGgo9taay0mRHxsxSoIi18DKVWSfrlxuHtWkWJwQdP7vGjotRyL0R1AtGLjzSUTMJvJ+GLtcS54vSoDILXAiLM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:46:22.9065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d466f23c-e241-478e-0dd2-08dea6c73fc3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5704

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

