Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012006.outbound.protection.outlook.com [40.93.195.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4883D88FE;
	Mon,  4 May 2026 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899484; cv=fail; b=tm3HFBJRvjYMfhclAr/anQ/6g909ZDsBEbnxStZ9/xaH0e49kOJviqqUnCV1WucDkuo8lBe+rnhRFHS+6UnxMyyFmSBHea+AonZZoK/UAvMxzB3pVwyJun55TJpbp6NnGIZ3eaChzUS6Rp+XNAQty6HPG3UUs1bj9p7Ea5XomyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899484; c=relaxed/simple;
	bh=2/GLBI0TqPrQr+kaHLe4i0583oRlfo3qjh1y2mHyygk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q8EjGjhxNS8biWvTcBdpFduruV/s9KYmJe2xGmiE1fk0Hu1REipBJHwXhP+HrBE6UWVJoYJUtsF9XSfnJ1zlztMWkoH/3XBS7cgrz0g/QV0YF0t4cZH71quKbGT3m0FyVb4+Ws7mmbQJTR0AIlv1YHeHK6W5MdKv1knD2ZGwbF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hbMsNOFp; arc=fail smtp.client-ip=40.93.195.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hbMsNOFp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fu/dqRwU9E2JdeQw1HXUyT6V1dmvR6/pBDFB+mH6LhD2ZMOmGu96jQWjdV0w+MAIHCpFYo6EuP351BH3EjrmElSEOuaG74YiI2F+F16TNna2Qyr15DISG5xBaw/j6UOB6rvAa7KNvTt5lydzAmkdp/aAnK87VO9PHnae5lJUXxlU0tmnLRPj7tYmF97/6NmCduGZ4WxifgMALAoj6FUAPDvYgX4pGt/W1jirD4e5Ky4Q5kHJurF9Ziy4HFNkFxj+R7Z2E/W5pCfk4moLYkesvAtJJHlrqvMlctE+CnLZQofVg43HybDw3I4aasFzDQkpFEBTlQVKW+d6LNpw57gDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMTirqjoVQ4fCR5cUM93cpW/BQmr8NIhmuQdPfNGErM=;
 b=dHS4pg2CP5RJImw9AoyBhXsfkSMnfQ3d1Cw+wRAx6xMjmBEWH7YShtPljAjaPALPXFEoGvZruAwGBPq7kIgtWDQx0V1tEIn9KTZBipyAj3TuzBwQcIxsuCfWWbaeeuQzlyrtWewQ8hvETee+wuHmBMIv3KCBO3BMJNBNuqlrumZly9fTjUwpdZ5ljjDriuUcP9EEXmOJlXSr6nWp8gGpJLlsCE2xg5kLTtfgjv/Kodkn2JWy02Pqm8jWaujxFr9eNMcqS4WC9hQS1irYXSArCoSX5zFDk0N2mt2DT8dSzIwffzIUqbUp/voMZbr3xhfdwkdIVqoUdiJsjMOzjgaxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMTirqjoVQ4fCR5cUM93cpW/BQmr8NIhmuQdPfNGErM=;
 b=hbMsNOFpLfQPs/tzh8IrzbQWJQ8X+H6h/vwlvbn0rBxmEuYoA7gCZdtK6aFCXG2x8NRG0m/8oaK5ZjrkKH8+nsl3Cyva+6g6bTrLBcmENyc49ZydAy+WUx3GgSJ/5+sunHfziYwzqv4ao7hEmPI+0FvvRq660PrDEZZ5u8MG+Cc=
Received: from MW4PR04CA0301.namprd04.prod.outlook.com (2603:10b6:303:82::6)
 by CO1PR10MB4578.namprd10.prod.outlook.com (2603:10b6:303:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:58:00 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:303:82:cafe::95) by MW4PR04CA0301.outlook.office365.com
 (2603:10b6:303:82::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 12:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 12:57:59 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 07:57:51 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 07:57:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 07:57:51 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 644Cvep7762893;
	Mon, 4 May 2026 07:57:46 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v15 1/4] ASoC: SDCA: Add PDE verification reusable helper
Date: Mon, 4 May 2026 18:27:13 +0530
Message-ID: <20260504125716.2015-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260504125716.2015-1-niranjan.hy@ti.com>
References: <20260504125716.2015-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|CO1PR10MB4578:EE_
X-MS-Office365-Filtering-Correlation-Id: 650455b7-b336-468f-43ae-08dea9dcc4eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a4hRLYpI1jFuVR3hOM52zxr5YR/Ump/kKUro30sIi1YCOy8zhg70mQb50sFoRlRIapLLyTjW/mR6ilBnlBzOJerhmX9nVCK0fAzpfOuwtPrh62eUK73mK7ZNoE6FIuaUfICSaOkf0lg13dgKlnmHmnvSGBt/9oAuF9VzLZXabrLWoCzXntO3UsbqM1jD6cPxJwMgg8BzM72/L/YEtGyK3d9r6Vt8hdqx6L4t6/13BmBW7lx9aL2Ad7cacacJX91z2yWafIDL1mqNEXatbE2Gcdd3AE7KpAYIkHg2YRkU5du1wHw9NsYgTxtQibcMF7Ihalq1RVPBPI1f/4o+LORg8T2jzgPyhlFD92PjdtGNqfdQiNObbylUjSJ9yDUHo1q2ynmM7RyZxcsx2mUrksTojp2QCbFfCPQuMhXhXMTJ5Jnn/7srY4h7AJhjwGARj4Cj7qtMKh98tZYyEsrpH7KVBcprjCQXinAWAKOfDCWnmv21egDmXDFN7MN0S6+hVpI4XEemNfGKyqIgpI5YN9/OhhRZTg7eYiPJxsP/RS9fGZfl2vgERRkx8I+ZUKzJrQrCgPfbLS9fz4KK+/XVeA7+ZIihWt0hjte8ytdtw+n+3gYEwxY1gq8t5NrHRZYai+belYhEQoUxt1Xn5MYzUpGXTXpYezXdI9Hj5cqrqGHDueQzmcohTIu3TPIXO49/Q6dvUlzJo/EaM8UvdTFpeKPaMj9oXyYqwqsOqwR86mCm9P8=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TjMHK5u8w4WDzMcjH6Q3wN2xOzM0SU8BJBaonMamXfXFGL8aBQsY8/2vPxknqHrKQKXelNrHosWtt39S/jRGNQ1oh++TqF91Is/4cm/9Rj2lHeeTfRsBrTbDhjB/9LbnVEmdiPB/e48L8k/z4gKvLqYFcMMh+HB+dkyPyJ9+LCihtl3gGQzLkNCzewokUBNlaFiAfZcnk71PQbaxKC8cI5z19RWi3XkHjXEICCWucj9A2gHoPXDI6QNPFEQ6rxJRjuR89xEgFf24HXfcCmnUOAzHpk7DiDiUx72gVGjuwKUWvBkpLDT35goMdNGLo+go2mjfwXBdCctvNTV5bpGvy01tNpuuB9fRFwEYNifYUnDCn2zsyBBI+jddZDMbk4U4Ko0htSjXgJzMb3SMr16Mk8hAfqfPm+7YgVyszoCD/a1vFs7hpHKthzL/FDlQO74s
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 12:57:59.3430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 650455b7-b336-468f-43ae-08dea9dcc4eb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4578

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

