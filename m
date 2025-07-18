Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4BA299927
	for <linux-sound@vger.kernel.org>; Fri, 18 Jul 2025 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846910; cv=fail; b=mVrrhsNtLyIB2IZ/iAVvSG+2xnEIzFrI04K4J2+7yRUYCgpoKHBEdEcOVekcp7/ge0wObaywm9pqTT99QkkdVIUGtXs724QsDpja+tcN6EcX11ihokepTKVYgu+2PVMJPuGknCKGmYo/vwnt80TM/WVos6vSwrpa9/R+gtiQ/EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846910; c=relaxed/simple;
	bh=CLU8GY93UbuPTVbs0379ECNPzJNLdqHunSqKmOVlpQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cinNOWH0mfAUpROBjpX1yuSJrrvyWBKpwZieQAk9t1rgJcKdKxj0ANoQGl3xQu3DHKMEQaqQLUT01nCUFitnG5F5ANIn7cZjXudi6qwldQpp2pRl9Myi45ut6ByAXJbXLPwlhxSuTGAJ8oz+syUXFYgkP2foH2E2YLWfTgGl6/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=k0YzBaza; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YjALvhdc; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="k0YzBaza";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YjALvhdc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ID36mm022990;
	Fri, 18 Jul 2025 08:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mt9eZN9f9D7xwvusPkXAhLtsw7ghb3sjKqt3rCCgzOE=; b=
	k0YzBazahkFVrWC8Ub3oYUXyezufJtdIn1A1yinnUmXe/0ibng4s7LViaXd9fwWS
	bDb8mOaYrHSepodMMq0mp/BxaLWcEHtnDD30Abg9r/4ZaLsbb4qaQdz1hE4MG32K
	1+eO0once13ILzlZ6VAJtTIOKL6G76jhHjDCHTgrd3naaLjQk2z1zKHHjmd+gBsT
	cg3Bky55L+t1E9lbancX2W409+ohw9cQ5CrdvHXO4E3XfxtXLUfxcnAxTErmapUY
	Cn5BsM2Oam9goDzMMcMETRRk9rN6bQA4pdXwYJ9YcVi3GL33A2/S8uSz3NC14i1H
	eoHtrWOzjyHZSGRFZnidtg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2117.outbound.protection.outlook.com [40.107.94.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47x7uuuf4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 08:54:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4TRS6N7zJN1qB/JsywuRMByaBHBomLkZtWFQ8hJjXSWcDd34BCP8hZhOSgLaOkOUe/bIroZYFIZeW6eEq+lT9ehyB0hvgjVnqYXWGnIvPVgT+jVwbKdDzxqV80I6lzGD4qYnPdfvxzv8p1jjL+VIQSQwvMmbxSloEVUjdgCwE5Bkiqp0Vh99BTNYMRfVZfoMR+PPn5DKgeJBLt4P57JfBcVFo7l0+gti9FThVb8fe8qRdgz/I8exoZivB1ugHSyTZ6zP2X+QAUk5kjAMQGjXkHVAOx6p9yhevZB7c9tm60QYTaPn6K72vsGBobvlCGlK70QVS1va2EUBy8XnM8GOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt9eZN9f9D7xwvusPkXAhLtsw7ghb3sjKqt3rCCgzOE=;
 b=K+z0HsbPkPbTm1W0F11Kwy1DZe7rprUjYwkSSe6MQSweXKZXVroIGuahlHl7TdVivumZSuK0+0jb81YiaaXs3QoVRwaw1rX1Ymt2yPdMCbkfKoMjv+j7g4EJmd+LZ0pTn5JGTmmijtuzQd1rEeWtZJ3545sS5l7j0865e7mTOmQpZniCCr+qCZmFgxg+WyO2SfDxc85opXy3rmAdbYtYmYVdFTyIBKQRzC0PlQlmPvcWbvmGEp37SIfuSoLNuluvjHjmEK/QKdDWm/kIxA4AL+ArWxWAUbWoIN+H7NBHA5K5FiMyviq6DRMF3Z+DNomV//Jw++dYKE4x8NRCY40kqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt9eZN9f9D7xwvusPkXAhLtsw7ghb3sjKqt3rCCgzOE=;
 b=YjALvhdcNoM7mmDtwlz/B+E/tV0dMebgFBm9f/9dWpg8jS7/aAEhc72OQFehImxLaQIL7GM7XthDk7RrbqYNF3BYYQj6rwUgJwrQK78o8FdyROMJV6+iH7q+Sa0yHUtzKh+oJg1S8Wpn0ZUJg3g5o+ysV3I7y/EAZ3rmfFsUbuo=
Received: from MW4PR04CA0133.namprd04.prod.outlook.com (2603:10b6:303:84::18)
 by LV5PR19MB9155.namprd19.prod.outlook.com (2603:10b6:408:2b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Fri, 18 Jul
 2025 13:54:39 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::59) by MW4PR04CA0133.outlook.office365.com
 (2603:10b6:303:84::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.22 via Frontend Transport; Fri,
 18 Jul 2025 13:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 13:54:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 413B0406545;
	Fri, 18 Jul 2025 13:54:37 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 33C2A820249;
	Fri, 18 Jul 2025 13:54:37 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: SDCA: Add support for -cn- value properties
Date: Fri, 18 Jul 2025 14:54:32 +0100
Message-Id: <20250718135432.1048566-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718135432.1048566-1-ckeepax@opensource.cirrus.com>
References: <20250718135432.1048566-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|LV5PR19MB9155:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 48198b7b-aebc-4edc-4873-08ddc602a35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4dykWvZqvHPrsnDJ4Ta5LO3fWMfeqV3JGGHIRNq57Zuq6g193zPff9oloqZE?=
 =?us-ascii?Q?fXVC+2hD/iqG7gtn4Y+kZPINVClgGxySPUs8512270dpbgXToHetLvvdNhPL?=
 =?us-ascii?Q?5Tm3kMpI99TrlmQxPN4QGODeHJezkYR3s6CyvnthfStOCQ8f/kEDhCqX4Ngf?=
 =?us-ascii?Q?ImI9EReRw5J2UCcaI1IbwXI2SR7Oupx72LDiVHkVS2eqG68VowoFaDz/G/LK?=
 =?us-ascii?Q?WjK2Hb3eQKdh76xKG60ryLuOQrg9yAQMe298ruZQHYLA3Kf2v2JJgYX/OaFU?=
 =?us-ascii?Q?e7xPACbYybiDKZyDqkZ3kZA+ZJENsdWW4/Td4kiiEcUeNZJsHvTUTGuljGtc?=
 =?us-ascii?Q?T/SWvvaQT2BqqDsDxHK+mMS7hbrMsHLzykugTRelXlVnNfuGB216I9mgvHUx?=
 =?us-ascii?Q?4oHLbAvpK7w7sBZReFP7naymE8qF+7HuX3PYR7IT5B22hgM/HVIzxqBATQUq?=
 =?us-ascii?Q?A+dZMmlIey9A3GjtWNc2zcCoVkkfrxszfj48QK33+5uZtyyUqMJaz0yUL83+?=
 =?us-ascii?Q?sSE+CRI4FQXrwrBYNw3v+IWvQmD5me9kVIOM4vJpx0WF0rceg+JLzHS5oJx3?=
 =?us-ascii?Q?YiNdqV3p5ZPWqZerJi1csRpZPDQtzXrsSBbQQWIXFgSvpjlKqMivkncnrONp?=
 =?us-ascii?Q?C/i6PIqzqnaa9bfLWwgiYhLv8N/XaIoM64Npn+mPCL4PLuQcajPl0ZQuo0Dx?=
 =?us-ascii?Q?bXm1Zvbwo2cu8SsamzKC61RrwFQNl8y8asY4qKT0hIBtrL0wC245lCKGYAll?=
 =?us-ascii?Q?DT4Cq5AR751L71DfaB2yawCUTSSxLkJyDi7TCiFeYnfaaR8qEpD5NAFULf0i?=
 =?us-ascii?Q?nVNqMyDHPBx2NT0zQ+Kq30mJtO2yABTT8A0GNuMS9Sb2jQqGViZH+kPBz4r3?=
 =?us-ascii?Q?Mzbb00YHW1I6q2zGKRht2ygHPFzhKk9an3AQzRVEsje3yFmDUNN9D1yN2RWG?=
 =?us-ascii?Q?cCaIFPJMGOHKQWgVIMnZIseEl4S6W6F4RrnG5kDfnFJkl+RAAyW6F2r6M+zc?=
 =?us-ascii?Q?DTgAqVGWlmdBr0Ssnc1ClVtowv+dbWfoc64P35nxb7AP0lFejfDi9kS46xdu?=
 =?us-ascii?Q?LdQHuhRTNN9C25vqIc/HZIXBrB4PrpiQuRfVKhzOJrKHBmdm4++vmOkfoeXZ?=
 =?us-ascii?Q?OIFjVVnqeipCtLOqIlkSMAUBxrs7D/CdE1EqCfzSxUNUK9jFu3BHcFGw/zpV?=
 =?us-ascii?Q?IKMbCQC3g055JVa1IVoF8pX60311B0UvuhYtnFt6yncOi8Gflws6nMIK/Eco?=
 =?us-ascii?Q?QRAfnPubENbaruAaPKaRppmsCA45Z4PmMMJTddAY6ZwbL0FWTRgyWbPzSbUM?=
 =?us-ascii?Q?Fs9Krmj8IOFWT+qToqg2i7a81rT4AsVgfmtyfOZzQoQtrJDd47C9kM1L7pzz?=
 =?us-ascii?Q?8Cm6IJB5QUocAaTVne7xt2Pg6y+Mc7PHQz3IU5PZ8+mcSvVRoK0n4guQtzZ5?=
 =?us-ascii?Q?5zqogEwHbHrtli7MhkwqkD0OEEuEf1ldi4tswgHWV0KnmBXRH6d/zeSB2/s7?=
 =?us-ascii?Q?2yZJEa8nrsoSa5aRti3Ai8JGmwnJD1dq7rZb?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 13:54:38.6091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48198b7b-aebc-4edc-4873-08ddc602a35c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9155
X-Proofpoint-ORIG-GUID: bSzSnQdKFPc0ByV_bfXDMts1f96ofEhq
X-Proofpoint-GUID: bSzSnQdKFPc0ByV_bfXDMts1f96ofEhq
X-Authority-Analysis: v=2.4 cv=IIwCChvG c=1 sm=1 tr=0 ts=687a5224 cx=c_pps a=2Vt9mhCfVCJbdOeYln4eOA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=9Sb4u0DMPxK8mmHg0o0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NyBTYWx0ZWRfX2zvLgC9PhFbe h2+5VBoYPssYmgkd3f7PVroi3iBZrz74vBElgIqNzrOOwnAS0oRDKPhBAOf8Z3t7jQYyDd1cA1W C+/SpfLvP64gjbMlQkqJIlk/Glk48D9xzXeeV3X89uPlOX9JPfn5ITwdp1Zzd+Y76i/cHSjI/Qu
 xEQ6XyTbDi3ZlLIGCbmBFhD/cn/x+AkpxCv5/2n5w49e5mK1cxAQGCz0lcYDYzEZlWA2+0hnHA5 z66SZjV11FKBPOoMQ6UF8CPb9Fb5yjsNL2wyUT0cQCEb+WMQqifTMBgwhlO9tUltwBRvxN/5iIm hiyZMCoY4QmdamLF0C3QX+yTpyB3LjlIw9GbdKfT+nmJ0vsC+fFHbUbvEICDA3K0g6iVhtL+b8e UbLSwAm+
X-Proofpoint-Spam-Reason: safe

Many of the DisCo properties that specify Control values have an
additional variant that specifies a separate value for each Control
Number. Add support for these.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   | 14 ++---
 sound/soc/sdca/sdca_functions.c | 99 +++++++++++++++++++++------------
 sound/soc/sdca/sdca_regmap.c    | 13 +++--
 3 files changed, 78 insertions(+), 48 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 90d77fc46416b..06ec126cdcc34 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -742,14 +742,14 @@ struct sdca_control_range {
  * struct sdca_control - information for one SDCA Control
  * @label: Name for the Control, from SDCA Specification v1.0, section 7.1.7.
  * @sel: Identifier used for addressing.
- * @value: Holds the Control value for constants and defaults.
  * @nbits: Number of bits used in the Control.
- * @interrupt_position: SCDA interrupt line that will alert to changes on this
- * Control.
+ * @values: Holds the Control value for constants and defaults.
  * @cn_list: A bitmask showing the valid Control Numbers within this Control,
  * Control Numbers typically represent channels.
- * @range: Buffer describing valid range of values for the Control.
+ * @interrupt_position: SCDA interrupt line that will alert to changes on this
+ * Control.
  * @type: Format of the data in the Control.
+ * @range: Buffer describing valid range of values for the Control.
  * @mode: Access mode of the Control.
  * @layers: Bitmask of access layers of the Control.
  * @deferrable: Indicates if the access to the Control can be deferred.
@@ -760,13 +760,13 @@ struct sdca_control {
 	const char *label;
 	int sel;
 
-	int value;
 	int nbits;
-	int interrupt_position;
+	int *values;
 	u64 cn_list;
+	int interrupt_position;
 
-	struct sdca_control_range range;
 	enum sdca_control_datatype type;
+	struct sdca_control_range range;
 	enum sdca_access_mode mode;
 	u8 layers;
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 4b6da587c4ac3..0faee522b3af2 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -814,6 +814,43 @@ static int find_sdca_control_range(struct device *dev,
 	return 0;
 }
 
+static int find_sdca_control_value(struct device *dev, struct sdca_entity *entity,
+				   struct fwnode_handle *control_node,
+				   struct sdca_control *control,
+				   const char * const label)
+{
+	char property[SDCA_PROPERTY_LENGTH];
+	bool global = true;
+	int ret, cn, i;
+	u32 tmp;
+
+	snprintf(property, sizeof(property), "mipi-sdca-control-%s", label);
+
+	ret = fwnode_property_read_u32(control_node, property, &tmp);
+	if (ret == -EINVAL)
+		global = false;
+	else if (ret)
+		return ret;
+
+	i = 0;
+	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
+			 BITS_PER_TYPE(control->cn_list)) {
+		if (!global) {
+			snprintf(property, sizeof(property),
+				 "mipi-sdca-control-cn-%d-%s", cn, label);
+
+			ret = fwnode_property_read_u32(control_node, property, &tmp);
+			if (ret)
+				return ret;
+		}
+
+		control->values[i] = tmp;
+		i++;
+	}
+
+	return 0;
+}
+
 /*
  * TODO: Add support for -cn- properties, allowing different channels to have
  * different defaults etc.
@@ -843,44 +880,44 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 
 	control->layers = tmp;
 
+	ret = fwnode_property_read_u64(control_node, "mipi-sdca-control-cn-list",
+				       &control->cn_list);
+	if (ret == -EINVAL) {
+		/* Spec allows not specifying cn-list if only the first number is used */
+		control->cn_list = 0x1;
+	} else if (ret || !control->cn_list) {
+		dev_err(dev, "%s: control %#x: cn list missing: %d\n",
+			entity->label, control->sel, ret);
+		return ret;
+	}
+
+	control->values = devm_kzalloc(dev, hweight64(control->cn_list), GFP_KERNEL);
+	if (!control->values)
+		return -ENOMEM;
+
 	switch (control->mode) {
 	case SDCA_ACCESS_MODE_DC:
-		ret = fwnode_property_read_u32(control_node,
-					       "mipi-sdca-control-dc-value",
-					       &tmp);
+		ret = find_sdca_control_value(dev, entity, control_node, control,
+					      "dc-value");
 		if (ret) {
 			dev_err(dev, "%s: control %#x: dc value missing: %d\n",
 				entity->label, control->sel, ret);
 			return ret;
 		}
 
-		control->value = tmp;
 		control->has_fixed = true;
 		break;
 	case SDCA_ACCESS_MODE_RW:
 	case SDCA_ACCESS_MODE_DUAL:
-		ret = fwnode_property_read_u32(control_node,
-					       "mipi-sdca-control-default-value",
-					       &tmp);
-		if (!ret) {
-			control->value = tmp;
+		ret = find_sdca_control_value(dev, entity, control_node, control,
+					      "default-value");
+		if (!ret)
 			control->has_default = true;
-		}
-
-		ret = fwnode_property_read_u32(control_node,
-					       "mipi-sdca-control-fixed-value",
-					       &tmp);
-		if (!ret) {
-			if (control->has_default && control->value != tmp) {
-				dev_err(dev,
-					"%s: control %#x: default and fixed value don't match\n",
-					entity->label, control->sel);
-				return -EINVAL;
-			}
 
-			control->value = tmp;
+		ret = find_sdca_control_value(dev, entity, control_node, control,
+					      "fixed-value");
+		if (!ret)
 			control->has_fixed = true;
-		}
 		fallthrough;
 	case SDCA_ACCESS_MODE_RO:
 		control->deferrable = fwnode_property_read_bool(control_node,
@@ -897,17 +934,6 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 		return ret;
 	}
 
-	ret = fwnode_property_read_u64(control_node, "mipi-sdca-control-cn-list",
-				       &control->cn_list);
-	if (ret == -EINVAL) {
-		/* Spec allows not specifying cn-list if only the first number is used */
-		control->cn_list = 0x1;
-	} else if (ret || !control->cn_list) {
-		dev_err(dev, "%s: control %#x: cn list missing: %d\n",
-			entity->label, control->sel, ret);
-		return ret;
-	}
-
 	ret = fwnode_property_read_u32(control_node,
 				       "mipi-sdca-control-interrupt-position",
 				       &tmp);
@@ -923,11 +949,10 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 	control->type = find_sdca_control_datatype(entity, control);
 	control->nbits = find_sdca_control_bits(entity, control);
 
-	dev_info(dev, "%s: %s: control %#x mode %#x layers %#x cn %#llx int %d value %#x %s\n",
+	dev_info(dev, "%s: %s: control %#x mode %#x layers %#x cn %#llx int %d %s\n",
 		 entity->label, control->label, control->sel,
 		 control->mode, control->layers, control->cn_list,
-		 control->interrupt_position, control->value,
-		 control->deferrable ? "deferrable" : "");
+		 control->interrupt_position, control->deferrable ? "deferrable" : "");
 
 	return 0;
 }
diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index c41c67c2204a4..5cb3048ea8cfc 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -253,7 +253,7 @@ int sdca_regmap_populate_constants(struct device *dev,
 				   struct sdca_function_data *function,
 				   struct reg_default *consts)
 {
-	int i, j, k;
+	int i, j, k, l;
 
 	for (i = 0, k = 0; i < function->num_entities; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -265,13 +265,15 @@ int sdca_regmap_populate_constants(struct device *dev,
 			if (control->mode != SDCA_ACCESS_MODE_DC)
 				continue;
 
+			l = 0;
 			for_each_set_bit(cn, (unsigned long *)&control->cn_list,
 					 BITS_PER_TYPE(control->cn_list)) {
 				consts[k].reg = SDW_SDCA_CTL(function->desc->adr,
 							     entity->id,
 							     control->sel, cn);
-				consts[k].def = control->value;
+				consts[k].def = control->values[l];
 				k++;
+				l++;
 			}
 		}
 	}
@@ -295,7 +297,7 @@ EXPORT_SYMBOL_NS(sdca_regmap_populate_constants, "SND_SOC_SDCA");
 int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 			       struct sdca_function_data *function)
 {
-	int i, j;
+	int i, j, k;
 	int ret;
 
 	for (i = 0; i < function->num_entities; i++) {
@@ -311,6 +313,7 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 			if (!control->has_default && !control->has_fixed)
 				continue;
 
+			k = 0;
 			for_each_set_bit(cn, (unsigned long *)&control->cn_list,
 					 BITS_PER_TYPE(control->cn_list)) {
 				unsigned int reg;
@@ -318,9 +321,11 @@ int sdca_regmap_write_defaults(struct device *dev, struct regmap *regmap,
 				reg = SDW_SDCA_CTL(function->desc->adr, entity->id,
 						   control->sel, cn);
 
-				ret = regmap_write(regmap, reg, control->value);
+				ret = regmap_write(regmap, reg, control->values[k]);
 				if (ret)
 					return ret;
+
+				k++;
 			}
 		}
 	}
-- 
2.39.5

