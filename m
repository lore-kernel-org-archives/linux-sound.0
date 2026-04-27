Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CD4318BB5
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291199; cv=fail; b=hPzYY6d2CttV+lRlQndBgxOWyKPKasT3XsHvl2AUddyqBj6MgyZGTFPZTxC2cuRetf1ghr7IDFg1PpocLiXSgqe2WGG1B+thgK8OezzaFMcGm7tU8buJkYUNyD7pnfunK1jqdvd2q4ITfirhxoPGeGyg0LTxpzWwBtw2nQqS4oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291199; c=relaxed/simple;
	bh=+NDhTCbKYrBoP+LXJqy+B33Stw3TdQkCugxoD3IaXl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2eFiHiJhder5evRHQP5zmaX5kpJ/B6orBM+UXJNJxYvEkqEkkdylehelHGCsF0VrQyp44SI371Uk/kvhFWnK6aWjYqRxmcdqcgooV1eXI0aOktnLoLbCtJh9Aw9yd4UXPRhyvXS4drhpNF/ibO92LWc/xgbELFu2LWcloZ6WDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CM0xmA4g; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FJkyWsSM; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CM0xmA4g";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FJkyWsSM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4cjvf3875699;
	Mon, 27 Apr 2026 06:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uiR5VzoIFyCRb8sWuK3lPvAde4kkaR3dhz4ZdcN40C8=; b=
	CM0xmA4gQempNWUewRwtqmJYP1zpEUOBxJQy7Xsf3Q4a2mAIm4ist1lbdowASsAK
	QBnzQr3n3NU/TfUdm0g2QuJ5ikw6Ic80CAe8Dp66Y4wQRG1vPAvELi4oO2gSSw2Y
	hGTQYTzRqz6CNANNFsGA2VDq/bl5sKTnTEPicJ0fFQK1lmeizjWe7Cyn+BpXtCuC
	v/JCL28p7oEt+xTX0C4y3wqzhTZCc8zEfjjubzhCS8QmmgtgWQnNx3zSbIFBne2V
	BWtdj3I6hfsLZ5piYNirPZKWhQSa+PwSS+SLXmZ3aertN8LOqBFyhiWtXXG560t7
	LioG/06XSsLhBS+XEjMdMw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022087.outbound.protection.outlook.com [52.101.53.87])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10a3cs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Apr 2026 06:59:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SitduG0Fb97cox4agU8s5XlW5r+XsSs423OvOjFXQp174zXTD3S4bD88oNQt53Cw3tYfH4lC/D4HGVkxGJL5vKkIqb70uoOSviLKxlMRo7iMnZwEK+yxjEWJNbImIgs4J5tyZIv6N+H9CTPI4MJJj+PTUYF67ErYFpyqpRS94Pet4bYuLUX5bJwQj22PLWupV7VY1Ndn9wJol3rRsKHvXzwXvOLRI+Qnz3x7v1zvhLzPe43t14pOnMazWwq5P31xD/Mkj5a0SqUk7W1LiKbnG5iTTVe+c4931cth9bWQX68HZ9KM4PELYDrQxWTopVd+VXqXwXeeUv2E4uuW8z5udQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiR5VzoIFyCRb8sWuK3lPvAde4kkaR3dhz4ZdcN40C8=;
 b=ume0h2o1kiaEH1MI4gcTJW9hdtSdNm3yX9b/lO6fok+/NAsZNOdC7iFfFRDNmzzU2uTiRQ5b11u6M7H/DjvpUCyHUY87UTYsa2QUtFz/VCPSrx/DuDnVsnFckcnIvZ1f9wCs4h4xl4WrejgmIRuq1YZOGpzE3ngbN+GVOv7GcjggM/HSv61omA1FtKYMItKRUQzrfehRUHRJzJhHh8Gvml9byv3XdaQRlEy6LTxVFtfWckts9mK1i7ITlRv/rC+hNR7kMKyvQ7bJcPDZOutAtodOHOjLfMouxRf1z2ogp+rXGkxDUfTvDmXkJpn+8TqbQ+286E1CklRb+82LNqvHvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiR5VzoIFyCRb8sWuK3lPvAde4kkaR3dhz4ZdcN40C8=;
 b=FJkyWsSMv+t7UTxaDLF8mvtuV2odXqL5y/uPO0wN40gDfG/Mw/FN+/UhbuC00EW9yJf9yjj6BdKp6IVtdC3oV0gvNBKeZqHXrwRkRMIt3bahUnqnzgpcTeBf2B/iMdp0VT5Vdus4J/HbXUoPkTwUF5J5p84566CoPbd3mghiICc=
Received: from SA1P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::24)
 by CY5PR19MB6363.namprd19.prod.outlook.com (2603:10b6:930:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 11:59:32 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:22c:cafe::89) by SA1P222CA0029.outlook.office365.com
 (2603:10b6:806:22c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 11:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 11:59:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9ED18406543;
	Mon, 27 Apr 2026 11:59:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8EF98820273;
	Mon, 27 Apr 2026 11:59:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: SDCA: Support devices with multiple functions of identical type
Date: Mon, 27 Apr 2026 12:59:25 +0100
Message-ID: <20260427115925.3801099-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|CY5PR19MB6363:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fb6a5abc-c69e-4046-ece9-08dea4547106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|56012099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2oKYlGEyo78YVJnAnywvWtgWwh9rroYRVBRgXAJoSvRiB0gm3SW51SBOX1O3SI0bn7ECeoBV2srVP3D/kXJ83XjZb+zKAMTNffIEZkgXzoVCosIOqY3tg6kZ8zqvcMV+efhaSjAwVFaIxhX6NtqZ8murXmfnP53fwMyjUVjPnVuhtibN+DubqnCnE0vLogMP7k/z4KaOuuFasXBNuayFWypnsgE2unMo038VRRTZ8D8r7jbr+P9gm+NeZ6MIIy/lt7vT3Of/dpJik0uVGDhznYyDPXPmhvsKdxdF/aQvn5xmHhF6BPFublynx9gWF/0SdZCZCpGaCItp0jvrO0t8XINTyNGsOfushkuqkrMTI4+4TNjuqVQzXFIOPAg1h9fZeT5AEF4V3/rVqUokyqaVt0iHS/reiNIos2Yz2GTwV5YwTAZ9dsuYddN+By/5w8A2wkUy8WGOY77IxZkM3uc69ALKEHABjSsZsbgv42qtKWrY0VbniKrNnQ8jKStBtDDeaQnOH7eXA2L22a5WBgcO0GZAVxhn+4Iby4/oN+QMbfr0oE6YX+KtHsVOhhEkfP54FAXq7CPJijLmAUowU79hIRkdvvBy8KrBlvCJ/3MQTzTWkZNHQfDTpv+uv47g8OcC+qlxUnmy1k0O5+g72n5sYuLnuoMxmkD4nuh2pnz7o9MtS9IOxnIFIxStn9q8vWaY6sY5zmHZLMd3q9BQXI1BHtdFlN6SuE2nlio2yAanloYhqX30Yr2kmXQw3eREbLBIRIkBTmdfZOkHsIojGvhxig==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(56012099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kymgc5uWSH9+fi+0gwyBH7i9BAVRV+4OQFsMOqL0OoW5HI7eACFyY7H3P4EGhSzE+hZaW5wGMvFlc1q9eb/EkJ4dz0tgdwCrO2zws85DhT5KJGoTjoRuQa8WUixAMDMgci6xTKEjWymIj1gXltw4avAOLGB11beKDNzmtrw2X8YjcgVLwKP62eJh3xWmdFBky3AhHEUPMfFMyymkn9HzPL2U9WKfSF071w9ewn3QBFQn5RlTn+nEsifH+KaifMyzduh3j31JKQcK0MdkYkJVG3YMCeimu9IlvkuVusVGWYwWijgpo99dgC2kkrOOxQItYlf0z+FuRffJ/CS6n0G90T5WS4BQ/297K364EQZSkzUbyjQD2VJY9Lmziijq9LAX03YGLNC5Dym5oGUYiuFA8hoa4sNznH3bu2UwnYA4Noc2tGCPZTlbtkej4JKlckXG
X-Exchange-RoutingPolicyChecked:
	Pkk9IFOH73iZ12a8Odrk1uaYihPkU7/F8aOl7olPAPjck5I/+J4LY7jgVX5tUW1weprO1ujofb9NehB9/3GtJ3rL2Q/81BUrrUMlcoF5P4bp4OxsyCsb74+3vxQSfPQrCRc/5QltZNRmouY7iBqF5zBETmYwrMOxWkW8oFuRYWFEKHWW5+/2zP92ihTRBWo8r9P1Aj+vyR/PXVcRYXgs4yXZ7XZ6VB7wTlvr9xP0njnREAYRLS0/2/7NrGUR3eBaiWBKyZoDNi6riAP9COo/h7CdfBHvO9yctyHTkND+F/xnR6o4ZAPGULbMXAruf48ypFL2IDqh4HoYOTgQVBms6w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 11:59:31.0886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6a5abc-c69e-4046-ece9-08dea4547106
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6363
X-Proofpoint-ORIG-GUID: caanac2nLf-FA-MXswJNovhhNEVRUTYx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNyBTYWx0ZWRfX2BwaUiSNJpHF
 Dh1LyIWPG4zEcqXNXDdOaCdFd+TTb8VCJq93XjXAQhSdZ5x/rqxluW3cw3vZbSCExwc4g1nmLbi
 7yFcGFq0O1QvZpooYoqSg7Jmm0KYJh5m8xbPjm2520Fb9g6UJufdFyYYBf7YlYDsL/mfJbKSP40
 C2OCWyQVgxrzR5jj1Rg3iLCA0/ofBP1/XfYVRnrL0wJz/q47j10Z1PqQh7J9ySBlxaz03+uVz3K
 sqdm4zqZK2Cwvod+ET782H74qzS7mp8dxZLYeO9MO6/1qDZZE3eUspyrDtpH6UQL73+21r6ax0A
 X5adyozhftSm4043uoCUBG1NXo9b7N2hSV3lX5mdURStqVy9+uzSaqOvgnMKfwtNd5BwVna72rH
 SZRjMcGmXZJky1YxqSncikXqFa32bHRdOSsgSetE8Crz56GtnPs8Lk3aQALBtc90m0tVP+wZRxb
 L8RLA1UQ7e3FV+mOeHQ==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69ef4fa7 cx=c_pps
 a=w/xsMB98MdRKPpKwYm4Ziw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=15t3AZZTe7-wH9pYiFYA:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: caanac2nLf-FA-MXswJNovhhNEVRUTYx
X-Proofpoint-Spam-Reason: safe

It is possible that SDCAs devices might have multiple functions of
the same type, as the entity names within a function are defined by
the specification it is very likely such a device will have duplicate
entities. This causes problems where DAIs and ALSA controls end up
with clashing names.

This can be handled by adding the function address into the names to
ensure uniqueness, although, ideally this would have been included from
the start. User-space already has UCM using the current control names,
so as a compromise the first function of a given type will use the
raw entity names, then duplicates will get an added function address.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca.h             |  3 +++
 sound/soc/sdca/sdca_functions.c  | 26 ++++++++++++++++++++++++--
 sound/soc/sdca/sdca_interrupts.c |  3 +--
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 67ff3c88705d5..62767245fb6e9 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -26,6 +26,7 @@ struct sdca_dev;
  * @name: Human-readable string.
  * @type: Function topology type.
  * @adr: ACPI address (used for SDCA register access).
+ * @bool: Internal flag to indicate if other functions of the same type exist.
  */
 struct sdca_function_desc {
 	struct fwnode_handle *node;
@@ -33,6 +34,8 @@ struct sdca_function_desc {
 	const char *name;
 	u32 type;
 	u8 adr;
+
+	bool duplicate;
 };
 
 /**
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 02abb7315b727..77940bd6b33c9 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -98,7 +98,7 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 	u32 function_type;
 	int function_index;
 	u64 addr;
-	int ret;
+	int i, ret;
 
 	if (sdca_data->num_functions >= SDCA_MAX_FUNCTION_COUNT) {
 		dev_err(dev, "maximum number of functions exceeded\n");
@@ -159,6 +159,14 @@ static int find_sdca_function(struct acpi_device *adev, void *data)
 
 	/* store results */
 	function_index = sdca_data->num_functions;
+
+	for (i = 0; i < function_index; i++) {
+		if (sdca_data->function[i].type == function_type) {
+			sdca_data->function[function_index].duplicate = true;
+			break;
+		}
+	}
+
 	sdca_data->function[function_index].adr = addr;
 	sdca_data->function[function_index].type = function_type;
 	sdca_data->function[function_index].name = function_name;
@@ -1466,6 +1474,7 @@ static int find_sdca_entity_xu(struct device *dev,
 }
 
 static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
+			    struct sdca_function_data *function,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
 			    struct sdca_entity *entity)
@@ -1481,6 +1490,13 @@ static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 		return ret;
 	}
 
+	if (function->desc->duplicate) {
+		entity->label = devm_kasprintf(dev, GFP_KERNEL, "%d %s",
+					       function->desc->adr, entity->label);
+		if (!entity->label)
+			return -ENOMEM;
+	}
+
 	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-entity-type", &tmp);
 	if (ret) {
 		dev_err(dev, "%s: type missing: %d\n", entity->label, ret);
@@ -1578,7 +1594,7 @@ static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 			return -EINVAL;
 		}
 
-		ret = find_sdca_entity(dev, sdw, function_node,
+		ret = find_sdca_entity(dev, sdw, function, function_node,
 				       entity_node, &entities[i]);
 		fwnode_handle_put(entity_node);
 		if (ret)
@@ -1605,8 +1621,14 @@ static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *
 						     const char *entity_label)
 {
 	struct sdca_entity *entity = NULL;
+	char tmp[64];
 	int i;
 
+	if (function->desc->duplicate) {
+		snprintf(tmp, sizeof(tmp), "%d %s", function->desc->adr, entity_label);
+		entity_label = tmp;
+	}
+
 	for (i = 0; i < function->num_entities; i++) {
 		entity = &function->entities[i];
 
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 6e10b4e660d96..4539a52a8e32b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -375,8 +375,7 @@ int sdca_irq_data_populate(struct device *dev, struct regmap *regmap,
 	if (!dev)
 		return -ENODEV;
 
-	name = kasprintf(GFP_KERNEL, "%s %s %s", function->desc->name,
-			 entity->label, control->label);
+	name = kasprintf(GFP_KERNEL, "%s %s", entity->label, control->label);
 	if (!name)
 		return -ENOMEM;
 
-- 
2.47.3

