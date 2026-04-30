Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590453FE373;
	Thu, 30 Apr 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777544518; cv=fail; b=lvKQ7fC4UD7jdIXXBzyqLxoDp92Dc5QCZwCCJkOsp38TWB6nvNdN7SsjH1WT5pIkV74DRW5aR934OgxajPcbIhgV/zq88uKyeoAlSGVKlTkRF2nqrjYbl2Cr3zSHdLVpXHscPTkArt+049V7TD6WBL+FeTQJX1RBXpztiPZvCNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777544518; c=relaxed/simple;
	bh=sbxWqve+BGPp37cquj4y7WbMU9JyDcV3m6gkkTa3P0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SABvBLqEf0ixxkyuxK8rlau94OC7Afw91heSREFxz1mBOy3Mk5CTKI3ymORsxcbt5yBMZoQfy5OP8S426uZrXMOZykS62VgXER8hJsr05czk7iAxRBqxQKefkJsruOmnzZY0bUoV/elUDIDiS6RJvBKrlsBehUuONu7cCTRmfeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BgHjHaWp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Bf2wO5NH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BgHjHaWp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Bf2wO5NH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U3pXNu2717378;
	Thu, 30 Apr 2026 05:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=i5QnBSugQ6TYgZcfl+vX57j5c40YtgWvWznu4dXEwOE=; b=
	BgHjHaWpXITaPXs+7Tn+ik//wx7Tgb4tqp2r+2KubdnncIyjbMTgVZVNfXnk0KG6
	USjk1WLafZS/ZXL2Kj6voCBO+ze/ZiK+O++rGQE+2UqHh/cdjESXaDQN4f0sYrze
	jimTYyYrT82AfsN/54X5o2DUlyERON0wVCClBAbeFvDhTvH4ll12VE+ariGGfLUw
	18vlcGlicKbBfhVxVtEjzMZ/4NbrhJfEhDgFNX/Z8580KwDXuggwiX61hFe+7LlM
	Q4S2SV+1lJnlHhz7PZvWn1yllHmDqCC/lzhcGaR65OKr8aB9H+WRzk8qkzQDCu2E
	wyvSGLGJEEXR7rsLkPxvUA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023073.outbound.protection.outlook.com [40.93.201.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10efk6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Apr 2026 05:21:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uH9ctmD+UZWHNokoE2nVzy/1ZYI2PZ9yU5fJavdnk7uSDuUaRotOBJplqPGssNtOPQg68gVjOpR9h+J7oBjSz9yTvP2K9b+9X0EXOeKETbj9/2w3XDKYMGVTQmh59ZVDtfTjn+fEHjo2UHJuL6kB/X9Gk0LxS8OlKYqpFMOrd8goODRbF9xDw8ExggBHH83Oi5PAjn1x4vFkO14UlylyGJv23xGi+7xGNt2GJ+oigJPLvImUg/zTwqAWyrKqHef84YWShfQwkDn6m/6gIbnfxJdjvSyoGXl0K3Hen9MKV3cXpfLZasJHpnbFc9iKXFBTuoAqic1CoVhL3fmG8Qpqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5QnBSugQ6TYgZcfl+vX57j5c40YtgWvWznu4dXEwOE=;
 b=K1jhdvXddKQJci2B6/wnM6iKka9Jc+emneAce9QowIa4YA7VAtoTrObA8L29steyHiu8v8TWPKZVXSpdRwGVI7p0leBkG3IYDJP9jM8NnHusGxO6f36TbSC878i7NsmiX3Gh0UGhJSifvvo0pgzABMFtYMkZbmh0Q0QC3R1IhBLhxPm4tTG3sSe+aUPREFdR8XF7NVGYsvP1Sh4rmnfFhdB+HoUpQ3s54f5DD1nblSlgOg49Tbn0iG43KqZWw6HCJOsD74ga0UPfJdPMk8WssOoM2P0hfQuADvDIQc5tohZXZlssSsYzAAX4tLgJlrieMARzjFAZLhQLhGP59/n9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5QnBSugQ6TYgZcfl+vX57j5c40YtgWvWznu4dXEwOE=;
 b=Bf2wO5NH8XRiZcQpbIVyRa/+8QK4qyAYcxLMNGTZiy73WV7jjT+bAZfKcmfllIGR95ksQP8onWRbLiZdm0rdKkvgnoj/PwIEGS0PWrMY2b6Q3E563COzawPwdoo9tKipovnG3Xk2EFC9VXs70wtoAyYl9d7sHb6uwn3nt5VUw/I=
Received: from BYAPR02CA0047.namprd02.prod.outlook.com (2603:10b6:a03:54::24)
 by SJ0PR19MB6867.namprd19.prod.outlook.com (2603:10b6:a03:47c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 30 Apr
 2026 10:21:26 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::82) by BYAPR02CA0047.outlook.office365.com
 (2603:10b6:a03:54::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 10:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 10:21:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E2DAA406558;
	Thu, 30 Apr 2026 10:21:23 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C9F32820244;
	Thu, 30 Apr 2026 10:21:23 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 3/3] ASoC: SDCA: Support devices with multiple functions of identical type
Date: Thu, 30 Apr 2026 11:21:20 +0100
Message-ID: <20260430102120.1283320-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
References: <20260430102120.1283320-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SJ0PR19MB6867:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1035150a-b5f7-4244-5862-08dea6a23c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|7416014|22082099003|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	hwB37gik1flU+BH9VxkLI/aECNVwIDkJruk1PSw7Qlnlbm2TVGumrnMtIrrOygjGQ36AX3qbgzLkbQ10wTpFgI2TX2FOQ7cMgBZ1EK5DK2OKoF/iGFOtVweNu0rwxOZu31p8HNqJsbt+7+KrH4f0cRpxQDumJWz+MpgvdxcuDpIf0jrLWcAZLFFd58lz+C+XiXbcQr4zryC8Xh2aQkR4Sth/qohLrgxZA4WJU7hvWldTwFmIhlAVOrdD6IW1zpOORXM4XriXO/zOLY8giJg2TGkIZsTIdCyQCMg5OELzvQKis6HE3DylbnIBpD/hqnLn4kqGxNmRfjRwDaVnFZDeM6W5gLruo/FER1qyn1ySYdl6uWr0qHlJXDUPK2nGjfN1T1rmrIjf0xD7h8FC2erTq+mDI65flWN+uFaTkmtf7Bu0IrqnjN66oN2nPjwAM8D1XNKasGMUHIlOqLl6YiA0PDncdQsIS/Ee3T1DSuPkNfem+kc4rOLpIqVtykKMFMHywAgS1eMsuqURIbMB/G/macSqg9Doo6jQB/CX6SryC/TdJWElaxtAw8kj+ESXIB2yRN7OQ14gPIqMyYUkqvJPQH0bnx0Bk2aWrx2En3PBmGb0M37Zmc6RuIzp/TL4ZcJhwBi5aM0qiRkWH0VlSYghZ57cxib2gmz1yZXzpNzdh/uSFQ8r9kw4OFvez0Ni5Nxc8yczYRMG03bUkX32BCgH26eYoWveiertmcASwzGo2LPtieNyN5k+tljJ5QWRcqCph7IqLpmbsK4IJRayeY28bg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(7416014)(22082099003)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fb1G3ivKM7njB0EoQzO8Qz511nV2qNNvKETuo9vsxaCTxjO9Pu6bGItlTAIgi6gceu6p/P/tI0Vx4D6vBedehB443zpSOfoWZ8XDagqfrSinJlLM2xDniylzitHeo7NwODGnULg9vD1H6m2Iqs/7Z0akqTTjGzy+FBaQqK44J8GOuhZh5hR6Y3qVFmaKgBP5vgocokzUXBYY1BlqvYXDRKstE0Byluuc7WVjLKAHtOONmTT53+ZLlkHqo0IJ9paT1xNQGD/ZdmoB5H5ynwB70v4OBGSaCmHj0oNgUuTb06m9Sn37U1HNLsC+GD2d7jzfLIwG9qr67nNVROiNurxPhijETBzGbIR5Ub+BKP2MSXkQ3PZFp/9Cc1nn1O9XXvaBcX3C6hrTAnbAbrg/lsoSyF2uYbkPOfMF9A/UQYfVClJd7/fF94ueBxRYpzSrOtwN
X-Exchange-RoutingPolicyChecked:
	KBHopIbRmM7MqivNEfnME1WovrYPMyxd3KGvLWCPukwu008PraJCVHxJEu2OE+xfkCtwGS9u/oIb3DIyAlaMs1AAuy1sGfvNBwEePVUQCafVUQT0krB8NzfUN0Uu+kJ4OS/TZz7YTo9ivaGy7sGa9Y+om6Uf/e/8Kyh7JC2CITo0p05+tsK62D19GN+yMUKvAUcCzATCq5aFPjOONfLIMi3cUNzj3VggRTXzdmtXMjMoWitUjSpT1pSTkbPIaDrF8ZAJPuO9Bq8M9aYuRKWaNVFMcquL1VegcO4lVOGExD0pyLLTg848jVUjm1ysB8HcWwPtHLesHP1e4AJXulL0/w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 10:21:25.7129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1035150a-b5f7-4244-5862-08dea6a23c57
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6867
X-Proofpoint-ORIG-GUID: qBz_QpEWnKmosgCfaiJoHcvKycnUUQDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEwMyBTYWx0ZWRfXyoYtZli/XfK+
 Pi6z3A0QpWn3W/qD1HuzPIyHvDJ1MGBorNjGb4lisjd0gFJfth07DiqSZUZ+P+lI6O4zKoTeoM4
 /lNkdDFzFUwbJaL915C5W/tzFZOtUj2a06lK3jBayFr73UoBfS9/M0KULdk/rFeRvVn/oYsFfTM
 kRZ1j0CMy7QG+/OFo7qhhZoze5nUcmhZN4NRs1pBmuEMS1ezZ2qu8THgGcJae/vTyVzgM4QdnW7
 LiXXtFNUt638bigdNg6J9wHxSjW9VRnVZP8x7PvKxJmO20T46KP+2g/6t3nbDYCOtp1zvnQSPzh
 WiNHFcQFpGZxpA0dc2HmWtO9Tx48iXhBtdEvbDMZHPHZSOKZk1Jm00wPfhq3I+uEr6f/eGKn6uC
 UR/kfCEKZ/SvZ2+qS0EjT/9TbReB5HE/x83kmSunoIAwE+kS5KI/pQ1kht2CULOAQRnMvPo2IxT
 hYzb5nrtcgmaj4fb/IQ==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f32d2a cx=c_pps
 a=GKgL0VAr1x+Lwu9ZGPB1HQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=uwUvDvqBefo4-HQeGWsA:9 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: qBz_QpEWnKmosgCfaiJoHcvKycnUUQDk
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

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Correct kernel doc.

 include/sound/sdca.h             |  4 ++++
 sound/soc/sdca/sdca_functions.c  | 26 ++++++++++++++++++++++++--
 sound/soc/sdca/sdca_interrupts.c |  3 +--
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 67ff3c88705d5..2bdf4e333e044 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -26,6 +26,8 @@ struct sdca_dev;
  * @name: Human-readable string.
  * @type: Function topology type.
  * @adr: ACPI address (used for SDCA register access).
+ * @duplicate: Internal flag to indicate if other functions of the same type
+ * exist.
  */
 struct sdca_function_desc {
 	struct fwnode_handle *node;
@@ -33,6 +35,8 @@ struct sdca_function_desc {
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

