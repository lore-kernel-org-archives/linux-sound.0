Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013041.outbound.protection.outlook.com [40.93.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63D13382E8;
	Fri, 17 Apr 2026 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431663; cv=fail; b=WkXgQMBf5Oz3vVIcdHqV6uBjU8q4kGbf94ZcobWqNWPu0AbD5ZYkV7o9lYatqtzldcGCn6rvlVACz/qDq7TLOqg4VawfMhAADGxFN4vXCivtouFqBccyj9vLyS0zyjlv+UICFGW5BtD1OiBaAVIn5IQ4GmiVr8v/UyqR+CTW4wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431663; c=relaxed/simple;
	bh=6wPXj1Xox9eB/snAN6T8DAbRS1WGrl1c3nrRdDoXieA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DIjgWq11+VMHc2pwOSsqU8MKGToT+4Py9LkQIfR3TkC4zRXGQha6m+1lQAuu4fW8rIH7jAUcyzZb+e4R6JMPsSzDlFVgmgvnYScLnhGyh966uFEbfC7wAh5HhsqBxf+OGbhy3fOKQJjw7JVRHtxBmAKAapSMzZEfuF187bqEjhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qOqhsTiU; arc=fail smtp.client-ip=40.93.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qOqhsTiU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzW1ZTsmxzRHlImC6nwhSYmFxvM4yWTA5xPL9sFFwuKpCpp79q4C623Z/diirw1yLWdfSmB6wNoTfFJjdWtGwmIPZl8FspI0dMb7E2xpG+xlo/8vTiX6EcEyRc4m0LQUodZ5EfueTJRAopAsp7FFTFeGBaGY4fYxUbBMwa4HpnzLoBnkvfwii5orEe9cgDZ6IXTDrVqxhgPHpNCvqYT2JxI+yE5em08CSD7S29ORCBl3wmRl8apWNHDRu+hJDVzBshgOM9OhnXhnWqb+Q1zh8cu7vFm1N0hX1SnnLBWc29Tf9neDDwGrndlW03u5+rYnT1tBOgOuMUC2IL3cymbQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7gg4ZSIBsYrfLCtpF6vmBNqnTbdkWHgsjoJvtlwd4M=;
 b=GNfSwwjAmz2exfSMGtzY9vtLqG8SgkJT7/gcaTqI0ZU35VHHp1A7DztYaNZP4pSmnjaVcpUOiNU61xHzFUQ+ur1XCMrtPdt4cNJLNsxewa0stLJe5qAJW6wZjyysegnQtBsQ35lNQsZLF+Ixu+PRV3+W9ctYcgTRZCL0Q1WkZEsEMSgLx+jwdrBaxeFy65qJ2yUYGLhHlS0Ln8+LxxcBE2Xj3V0HetxxuqC56asZrXbK7XFI7Ou5EsRH6TN2pq2mOdyOjMU2K20w8QDmqQZ5zslfemCT4c34d8QA6ekyIj1AmRv8rrfPubi0K81bTBTXs39FAdGb5EulI4UJ6aZUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7gg4ZSIBsYrfLCtpF6vmBNqnTbdkWHgsjoJvtlwd4M=;
 b=qOqhsTiUVuKf/irRyi8YrDnk2YG4GDLmFTQLYkKX09W0JWQ0Su0yziNK4QqTwMK7RfyAfI989hRUbiMr1k/v4cVldfMnH9vLva8D4KUNOXZ9lwdOjqMO/slQ3DUl0wO8N7T9wDHKbY0vkbff5p7s/iVvghGSqIKfX2Mljjth1Xg=
Received: from DM6PR02CA0154.namprd02.prod.outlook.com (2603:10b6:5:332::21)
 by PH3PPFE6F9E2E1D.namprd10.prod.outlook.com (2603:10b6:518:1::7d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Fri, 17 Apr
 2026 13:14:18 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::74) by DM6PR02CA0154.outlook.office365.com
 (2603:10b6:5:332::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 13:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 13:14:13 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 08:14:10 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Apr
 2026 08:14:10 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Apr 2026 08:14:10 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63HDE5981770830;
	Fri, 17 Apr 2026 08:14:05 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <baojun.xu@ti.com>, <shenghao-ding@ti.com>,
	<sandeepk@ti.com>, <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v9 1/4] ASoC: SDCA: Add PDE verification reusable helper
Date: Fri, 17 Apr 2026 18:43:58 +0530
Message-ID: <20260417131401.3104-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH3PPFE6F9E2E1D:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7683ff-9681-4f4f-3482-08de9c83384c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JYRUErmS2NAvU4vZyaCINvbGQUq7imkxivEhj3x9ry37kEprPQmQbW7IL7ESIv2yK7QhqdLDp4roMx7OUAMRa5oyukk2dUv+FzbS+G09iVxJK2w9eYNxx2kgluW1f452IjpBJd/wOBjV59oxyWmpXq87NXr8UpRTDUkRvUpU/oYcIZm+h30Vx9Fh3h4GF8K0sfKtwQ7HUwnB9NSMJPIUnDFze0Wf1U4BUMDwgYQotf5+PT1q/ej4ETWsxerlO4HkGE67L/mFWfjhujxq6hH3OcBzVLx5phhFrLffeG7QGF1wx0SN0bnNxGTj4+J8r7Ln0XoOUO4WK8GZzADsBersyJ/GL2GZ341jLxBDNRWtN4TDfoazke5LRTEI2ZdpmZ/n+mZf1hSUEL+ZYW5RUAizIJUr8g3td6lhEJ+T4pqE5Vj2pv6IQ9ialHdZVG0zb1PjtAf2vaISRJxS3419IzD3sXrqxBsTgL1DxiAzk87xMgo/sSmOWWZznkVuSJi0ynvhPDh6smVvlr5kA26HKdI+bKStpPjkGw+PqPVJ0cVswN8bZIYH9zooC0bRIt7GzjZDhnu3s3UL2YMocfJyq6aHs14FI69jY5yCapccBjVpLvXgjlkpoEF7qqif+t+OcnYomDsrq0LI/6cNkATT6efhXtHVwungMktjugXMFPuk/F5Nd2X/llLJd2uRsBRKmSXJltsHObtt51AjFdKcKOymUXggfIr6b3QURQD9VAafqyy6nvD/0ua5wlEF8tWk4wQzbf90HUC7sxzIMGx6yV5JPw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k2/E+VAxowN4c2Qb2oopgZZA/1v0IbKvy9+nOpNbULBpRJIvyX0XnYGMxQFwNK83SQyx2ZOCCt2yxARL3C8hAE+ytlDIpYlIupwQrJ/IjL3PfZhxOVKeDTEjDjqBNMY7PIYs0kpk0rHEfUmRRxWVZTLU5ka97FqRRgmX760i/UoR/yw4F/gcJg4WNsntJjHVyoAyXDAw+wHwtWoD2x6XP0HlTWxyXE0Tmt6txT1hvEp9UQydDW9e9zHID+Nl9Xuw7bNvafpgTIUo+RTUe7RjoqgJYBHYOuqaYX+FsEpUxRJYOtuiAI39eMc2AD+iBo1pzUM00smE4pkJAl3Qg2DIzk8Mw0ErvZrrB33NE6vOBBdrf5bD7KHsMOJ7LAHRDadDII3+gLbLRmKK8JXYh3uYM/ZRoypk95ruzQIMk35fC1JQ2oaNdaI7vhPKdPiObdna
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 13:14:13.1562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7683ff-9681-4f4f-3482-08de9c83384c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE6F9E2E1D

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
v9:
- newly added interface
---
 include/sound/sdca_asoc.h  |   9 ++++
 sound/soc/sdca/sdca_asoc.c | 105 ++++++++++++++++++++++++++-----------
 2 files changed, 82 insertions(+), 32 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 46a61a52decc5..6c1c8af514122 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -99,4 +99,13 @@ int sdca_asoc_q78_put_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
 int sdca_asoc_q78_get_volsw(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
+
+struct device;
+struct sdca_pde_delay;
+
+int sdca_asoc_pde_ensure_ps(struct device *dev, struct regmap *regmap,
+			    int function_id, int entity_id,
+			    int from_ps, int to_ps,
+			    const struct sdca_pde_delay *pde_delays,
+			    int num_delays);
 #endif // __SDCA_ASOC_H__
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 2bfc8e5aee31d..d5bccb2e04375 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -359,16 +359,78 @@ static int entity_parse_ot(struct device *dev,
 	return 0;
 }
 
+/**
+ * sdca_asoc_pde_ensure_ps - Verify PDE power state reached target state
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
+int sdca_asoc_pde_ensure_ps(struct device *dev, struct regmap *regmap,
+			    int function_id, int entity_id,
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
+EXPORT_SYMBOL(sdca_asoc_pde_ensure_ps);
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
+	return sdca_asoc_pde_ensure_ps(component->dev, component->regmap,
+				       SDW_SDCA_CTL_FUNC(widget->reg),
+				       SDW_SDCA_CTL_ENT(widget->reg),
+				       from, to,
+				       entity->pde.max_delay,
+				       entity->pde.num_max_delay);
 }
 
 static int entity_parse_pde(struct device *dev,
-- 
2.34.1

