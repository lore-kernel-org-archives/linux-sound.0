Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29506370AFC;
	Wed, 20 May 2026 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295071; cv=fail; b=pIxe66I9bFcM0JwAlO38GyJvus3i2fdxA8KWYCuFFJrBJA3rk3LYISsAahSs17XyUgMmt/WwhdyjFLDhrZu0tv/nqkPbOt4FtgkIkEZ8PxuJdeXbFDtOxkJNpu2L2XnnsggiP4qCCHxYyuVGSZut5yB4wTM/jHPObzlJXZdSc5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295071; c=relaxed/simple;
	bh=posqzQ3AEtaUXxTz39QJNjSJnS+pIvqFI9FCnRYdSvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EeKMa4M6MRWhmdyiG+HbSrPxHEHQdEqP4UoUHd+8IeAooN9Sub1tZcNk/IRmttPZDijNRCQNAjiXE947IBZOzIB6tOviAZIJ4/uxnVtOgNvNN/hDMkfQ1nvnF2H3ji8plkiyXshUpm2UNvfAQXQbQTaDnSNcrvKNPNvaetK11/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TbqCkIcr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dAMY0Y1S; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TbqCkIcr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dAMY0Y1S"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCd4601158575;
	Wed, 20 May 2026 11:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0lmSm5ogNnY8vt+E6po7mL0xVIZluHnD7+bWTdAyvXE=; b=
	TbqCkIcrV5WxQkthKlyzwfTvp/q924rRnDuMWn/xE6kzS84X6nmLgpWDMeskeYID
	HCbhI/nvmiVmbhUHcg/x/0NYYkULcDegnkrlPeJeor+K1dtC1gniC1cezd5B06dt
	zXZDbCC2EuwdrbhgWFNITJpghNTMzIc7A31IQtn6f3zrC1J9IYrZhMQQnRiLVK6h
	IBIEr8KEjnbEk7nXGbVc2sQnDD/FO/PwgEcppGh+YIenb87Ihy9/hX8wENmQSz6o
	tg3t4NvTVOCCz9Omi7WVk0C78MutuHRr6NKq13jlZ6SI3vxhdTRmFcksn0H6/M94
	91gfRWGSCQbBquBAbXr7Og==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022082.outbound.protection.outlook.com [52.101.53.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1h32u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:36:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPEzbyvvrS0X9Vrf4FPcnZoAIrBeMD+WNk75Jnb41HqBZoow87gXaldfiSdEr6WWpX+NxDyCas1LlqibIy+RW25L930uh99yPgvdP4zJ4p5TSjS0Ugv9ZkNYvH4rHpHY1se5baUMQOgVkqVn1nWEjyp8LUww+uyjduWK6uV+FCXV9smysEeRlkPKu5Wqw9VeH9Ty5PMSzi6jYT7uqR0KRcuotj1BjFkybTTP9m/01HAXdCgLewbuMqc6+jcCYzRiESPVShVSuGDR4+lBByR/hCTBkyoqYc/CbakyPCbbnNGd//H7Mk2PFBzQ5RYZ/j/PJsMHmB1MOCFkOmt3Z0DaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lmSm5ogNnY8vt+E6po7mL0xVIZluHnD7+bWTdAyvXE=;
 b=FhEy5059XH5Or5sO9PFZHw+9vrx7Wzmg9kAmeUfQFnaoLi3LWAfofWUT+cfpTeXt9OeHm35Mbt/0/5ZVKAuP2kCJjyCPV60rwQB+Xa+tHQNKa069KJxUb9I+86LQN2oxaiJHG2mtzCAqXLBiJoFlA+Xnw2panlJkvsns96LPZGUeDZ+uriqfdLuQr1S1h5aMX3RL7icOfjB3ZPboQKU0NRD4OZkIbVuO6L2uKmSE55xWe0FTND3lN7CFdm2ERUILKOTHEWESbMxMNkwZYkPVy5XtN0h58Ifh94PE+w/VWAc4vUY4hCLsu19UqVGDjQ1xiOtQKlJqvZedPavceWFNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lmSm5ogNnY8vt+E6po7mL0xVIZluHnD7+bWTdAyvXE=;
 b=dAMY0Y1SywSPHqs+bKliv2f2ZYHPSmq4giA1Y/DiVeXszamLL78yrpx/EKmn9e14gR0QZ/ZH/6H4NRWceYGnoz42U3dxXR7lcM83b7+yFco3+pOKebYCeBK0BeJkgbfJI8PNU6qa+GRC/0HOn+4udHyvH424Or5tSBKeNQ5dafM=
Received: from BN9P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::28)
 by MW3PR19MB4266.namprd19.prod.outlook.com (2603:10b6:303:4d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 16:36:37 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::54) by BN9P221CA0005.outlook.office365.com
 (2603:10b6:408:10a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 16:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 16:36:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4C16D406550;
	Wed, 20 May 2026 16:36:35 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 26D0082025A;
	Wed, 20 May 2026 16:36:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: soc-acpi-intel-ptl-match: Make Chrome matches conditional
Date: Wed, 20 May 2026 17:36:29 +0100
Message-ID: <20260520163631.3300102-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|MW3PR19MB4266:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 231deb2b-1b7d-49ea-2a72-08deb68df62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|7416014|36860700016|18002099003|16102099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	fm/6TTbzoXFka9EyMcwoHFqdu8598LHIW836qXlM9trOLXGopylU7auGfu1znDfbfxKN3121aOwSd7A81qgH1n3PqWaj10HLixDiNkJvSuNN4llTxMe/VyQMB6tNs4GCiSte1tSBXl9Xmc2uoZKLuWUAIeri77Yc7aWvYUc5f5iAJZ5Nq2+/WhwlwEX7GOCwwj7fwtwBUIByVxjWiNc02+CFs2WpW88rV1XrSczqtoqZGppa3KFEz2P7dCjkc6Fm5N5d7ChajvY2BGc6AetyGoJqaYlhs1AEnYso8GZlwUMWilWsozMuQ8xMUYcqmXL1ptkVUXbmYgfH/ljBlB8oVrLJzIr0Q0XecI4e7auSInRndZwkCDBisekXs2XMarVRhUnUQgHjWFkF7RVt4St24D3qnxsxb3LlWP4qN/lurY++9E41kiIdVXRNXKN9ugfwKtPU6cmGgOzdLwlQlB5+Dx2Hptn/9GNE0/R0qc1DVxkQxPp7alAZR1PUKbSDd+LqOozmS07PdmWElkQ8HbVPp8LJbXmj4rT6QQZd/DNpHqtmWnFHnbmyuuZ/R8TAHUtSvlG7019/7Xws2dvA/vnGn6Cf2gpR8T1ZZTsJ7/sCj7O3Eyt0YSu3C1gibsq11hakp6iKsuEkL3rDyPbYm8IX0LpSAuBLCD4PnWLCHBHs6U68CeBPBSq/GBz2vI3ZxuGEwBV/RJ87420rbCGh/BaJk2cW6+g7dh0UeX4bGz1o9XI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(7416014)(36860700016)(18002099003)(16102099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6wud8WuNmJjVijaY8Rx05/VCOLeKRhzG1/E2c4tHMrnfU/dZBapI5bMc0KH1g8sLrFUIxfMss4thVYW4oPzOXLWQOoDufHTbbKiuswaR54eq0OWLYQxKwIFUbE+k2So18V0p+qVku4E1YB89BBu1QqD5n9SVewU8AEXWPv5VD4r/tJJGxUUIqELD5fURN3sknNfD2vTKGkwEQpy6Rnh0EZMgqkyTf0ozxjPSTo4VsS2LRBkg5vMO0JI/ixB8uEoriQD5vBcU3JZJuoqi1Y7f6rOyulwqBHu6bG0z8CsHEg+iOs6IuRRCzTplA9fLyASHEICF/XT6GK6SUzLyaheUMavJhbwfAdoIQ1p2+Dr1winCxkPxIfdB/r4+23XXglKEaTjuiHMhoLihHLzaHp9xltYhGdTG5l4xjjlcKnvnth7sriVK5N6b78tZPuX8cY8z
X-Exchange-RoutingPolicyChecked:
	jbXuZwOkpvex2p0YUNikiZ4si5K64qJhTS6cUyOINBJSMpuqKt77gngtSAgEauLOpZM0L1tnNInv6VKfhDi6P57whtRM4o2DYfMO/bSMh3Wmb6lAjTR5ZydrXnTIb3TWgTZgHA1defajR4T8+r5X6Ezawael5WQGT5RW25eIJdxNdeGXQifcMLJsGHjheLc8oNHd0Vw/v7h/zIlVoNKG/xmmBBxP2R25FBDP9Cynl/hrZRzkDrLeZcJvQJ4lhsXvGNAymVg5F399d6agI+ajsVFRLXEb9+LsEsECsppih1v5oUG78p7EUL62WUB3iUu1O7tTgWGVHbrWtAwkdP42hw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:36:36.7867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 231deb2b-1b7d-49ea-2a72-08deb68df62d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4266
X-Proofpoint-ORIG-GUID: syAqsfIeEfLZvmjpH--E8Aau5FqlxGgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MSBTYWx0ZWRfXw6RwUBK+0CH/
 RmQ/N6Zain2jGvOnKxyQqmTAA58n7tN1lVpfUL43cScUl+MMw5ADMkNILPbHsrJlM1BznO073Ze
 mB9/Ag52YXGfzXkZFEEt/gA7FhxrpcoWPP1OL9FGQggQOLpBhDgatJjgl3Ep1XNNe38ifnjtBVC
 iL9zRFaz6XLtJ4lORnE2kbrvmX9STk6YfOxlMIXMRh9/gcMbiXMtTvQHgvLb2PHU7LgtPKtvHYr
 GfGDNv49++Lhwl4jBzl4LBk523vORD/KCxPu0/RQ0dldWgmGryjvcmC+An31Ux+HTjxG14ovoJK
 Mnsn/eCZgVa6nUJN+XepjQUJGClhnF2RhR8Eapb8n8wHajcbO5ZZSEHb5GDNnf9v+WlrKu8+Ad6
 JdP3rknvVONAvLQr4pok0PLPNGvGvqZi2KgHbAiNLEw6mqua/rxo9/jGiZ5LsYPJXO5E3KAbpE+
 gQeNRSEKkEbhGdX1Z/g==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0de31c cx=c_pps
 a=fzV1Iv4YRLQDDQDbumTdQQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=bz7lhGWuN2dzd1EYfvcA:9
X-Proofpoint-GUID: syAqsfIeEfLZvmjpH--E8Aau5FqlxGgm
X-Proofpoint-Spam-Reason: safe

For PTL onwards Cirrus are intending to rely on function
topologies, rather than using a match table for each system
type. Chrome systems tend to have custom magic in the topology
and thus need to load a specific file. This causes problems as
these system can have the same layout as generic laptops causing
the match to apply to other laptops. Add a DMI quirk that forces
these matches to only apply to specific devices.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 .../soc/intel/common/soc-acpi-intel-ptl-match.c  |  1 +
 .../intel/common/soc-acpi-intel-sdca-quirks.c    | 16 ++++++++++++++++
 .../intel/common/soc-acpi-intel-sdca-quirks.h    |  1 +
 3 files changed, 18 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index ad3af8834e431..c6bf70e393975 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -632,6 +632,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.link_mask = BIT(2) | BIT(3),
 		.links = ptl_cs42l43_agg_l3_cs35l56_l2,
 		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_no_function_topology,
 		.sof_tplg_filename = "sof-ptl-cs42l43-agg-l3-cs35l56-l2.tplg",
 	},
 	{
diff --git a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
index 3eaa058f84608..7caabc501b163 100644
--- a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
+++ b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/dmi.h>
 #include <linux/soundwire/sdw_intel.h>
 #include <sound/sdca.h>
 #include <sound/soc-acpi.h>
@@ -37,6 +38,21 @@ bool snd_soc_acpi_intel_sdca_is_device_rt712_vb(void *arg)
 }
 EXPORT_SYMBOL_NS(snd_soc_acpi_intel_sdca_is_device_rt712_vb, "SND_SOC_ACPI_INTEL_SDCA_QUIRKS");
 
+static const struct dmi_system_id function_topology_quirk_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+		},
+	},
+	{}
+};
+
+bool snd_soc_acpi_intel_no_function_topology(void *arg)
+{
+	return !!dmi_check_system(function_topology_quirk_table);
+}
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_no_function_topology, "SND_SOC_ACPI_INTEL_SDCA_QUIRKS");
+
 MODULE_DESCRIPTION("ASoC ACPI Intel SDCA quirks");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
index bead5ec6243f9..2ea0a1881c4bd 100644
--- a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
+++ b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
@@ -10,5 +10,6 @@
 #define _SND_SOC_ACPI_INTEL_SDCA_QUIRKS
 
 bool snd_soc_acpi_intel_sdca_is_device_rt712_vb(void *arg);
+bool snd_soc_acpi_intel_no_function_topology(void *arg);
 
 #endif
-- 
2.47.3

