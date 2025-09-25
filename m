Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F0D2F6183
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 10:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797665; cv=fail; b=R/LhW/6fkzI/cnyhUNGX6IpoVmfZYS6/I0YzDqcsq5pr9YN9VFnocZ4wdo4pxjr+TwrerpflhcmJlY+nV6aS2/IHkJC8mjZ9VH0lSm/Q+/QfQ0L5FEohp9c7i4I3u1ZeYCVcQu9LSsb13bouOTZb6yXaNE2e5Nh52m1n3CNbs70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797665; c=relaxed/simple;
	bh=9VosFf/+NY4lFcjXqDOvLklwNYNwmqMD6l867zZHFR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rAiCDA2ElxUqyWCLlGIfIuMhSna7yS0BiopO6lGWATmRVCfSyaMZprAWCIXxda5RH60BjCJRcUVy+B3OQq0iHGc+jWhHq940kX1AZKax743O7yPhLx72bIbEO3VAiQSHZ/sqPE6SAzGbs/nI0SLZQoKc43xEk+LxOk0MUGg/0k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZTf+am9Z; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=JrVtDTW7; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZTf+am9Z";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="JrVtDTW7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P1vI901785206;
	Thu, 25 Sep 2025 05:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rhd519RClKoLX7BElSL2YnyQ/tQT3XuVfMtK8cdRhZ0=; b=
	ZTf+am9ZN+EBt8JVvEIFoAUydzVYdKZn5AY9zB6DdsVKZRJ7ikdFzUwcxZEJBioJ
	CGAmahGyZ2juG+bbPAfA+/VFOUkW1wuERu0eSdV8ZPXxrIhRwPK+nemtMQNw+Aff
	K7ds/W7jeQpxbKzNjYvHYCrOPYz7w7PSozo8hMvy5gxuCGJNPSIkN6wO4q5qWbb7
	hUkxk6vBeGUL/aMnc/Y6HPWEDaLJkJJtQHBXXEXgE9Yds85K9asuJLPBdSPOKOMK
	/PAjK3v4vtpMEy9/Xg0hc4BqRD9qGDT3wa0S/2td0c0VKwkv/0ouZrRfXO2Jj9Dl
	nfFlgBi4mJveBwBfNSMyMA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022141.outbound.protection.outlook.com [40.93.195.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49cvharf6d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 05:53:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJDCfFFx01GaMa5W3CeYnU7OvDQW6COO0Dtfo9NxHfGwUbstLmAWJbkJ4wfeWfCvNdHPSoMbpk1uyU9HZA9/TaPT173YKNLvmKOMAaRTncLnVsHe07x4XoP3tU4O/1+1+/9GAevTn0xw4ZgAR34OlFw+p8eMnFUZQOD0FP4M76Sbc42McMLOV+qeApoZFNjbmmohUY/YPhH0Kd/caiZo+fsODJBv3/qoIQX/37i8xx9NAfMu9s7t/lihtv/5WsZgyJP2UmKjE+ROt36K6l6P1ttZrC1gcyLweQATyzOwa2twClWjymoVj7IevLPOfF5rIHVcFn+JzGh+3exMGO7c/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhd519RClKoLX7BElSL2YnyQ/tQT3XuVfMtK8cdRhZ0=;
 b=A4AJ9Zc97qhp/dDyv2E3PwOHiqYE9fLGpBNXw50eT/4e4/i/CxvZEOrSRNdQ977Tkjtl5/03sOVIBNosjd+/e7EIhv61HbP5lJ2q/gr1L8StHhJVu9vMxo3gY9YgxUZyee2ZukxSho1CPYGH7zL21ddjfXTB4XYSxgAZdDZy/5LlHBABT0i4VIjRPi5iB/RunyYyhyT/sUdN6T1j2/UdMn3ZyA0HebIUiVW4Jm34DZA6Nkq7sb+sXIQUUhsG7omhDLUVTxMoAMJfZs90N0tOi+mvTXOrkbQpDkVYFn58h/UczbOYFpkTTaZjKuvZCvp+EtCd2e7OUP15Hpp3y+eM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhd519RClKoLX7BElSL2YnyQ/tQT3XuVfMtK8cdRhZ0=;
 b=JrVtDTW7NDmEfMNtVNXVLaUSSFmRCT2MSn1YFndeR2wdvMskOnKBrQOSvEc0XOVZjUPiptI8IoDJQ6ulyp790CpB82bFtG5HJJy4pLdlFJD92ii5Mz1pCT0QfpXNMvL9PLtsqQsTSHOSsFlgSYqIXrGfb8e2e3eOD1ICqAj0dQo=
Received: from CH2PR18CA0023.namprd18.prod.outlook.com (2603:10b6:610:4f::33)
 by DS0PR19MB7421.namprd19.prod.outlook.com (2603:10b6:8:140::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:53:50 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::43) by CH2PR18CA0023.outlook.office365.com
 (2603:10b6:610:4f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Thu,
 25 Sep 2025 10:53:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:53:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 77BF4406578;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 64E90820249;
	Thu, 25 Sep 2025 10:53:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 10/19] ASoC: SDCA: Parse XU Entity properties
Date: Thu, 25 Sep 2025 11:53:32 +0100
Message-ID: <20250925105341.194178-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
References: <20250925105341.194178-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|DS0PR19MB7421:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aa21bb73-b0f2-44e5-dc2b-08ddfc21cf84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Y9npxHg8IsowY73Sy9jKOF2w/NiEiIQdvZbPHgr/CnwR7NIpM42r5+QV9ML?=
 =?us-ascii?Q?Pch02COedUL4N3fnp4H15IJ4qegSp8QFhYlIb2MS0QdME6Y7g7QcQY7VJg47?=
 =?us-ascii?Q?mBXBRPzDd6ASaY8BCKTI3gnWQ/NX5H98aZ4ZWGG2HFn2HibOkLHZyNfNbLsx?=
 =?us-ascii?Q?pJExgkHmx/+9HtN4TI0p7dO74QyDDADhngVJWrHa1Cekos28FbiGn7rD+TFp?=
 =?us-ascii?Q?mipxPgct2fZQKUxbZrrQCP6VCdG1CORApx0BwyfEJQX7WXnLNIWlTbfKB0gB?=
 =?us-ascii?Q?0jAsnoKnVwVlB/svGhr0zNUU1tUnj/YKSoX9ur2bJy4FdCY/ufeALjIY98rd?=
 =?us-ascii?Q?n/qO96ZwJguF1rFGvhPPB8IGBlEShkaZLjqdoJahlqMoUKDTLfKSqdjY6wWO?=
 =?us-ascii?Q?K+TQAldSvq7arFMu3eiG37bKeuU76wUUhOpRgDjtVxcej72LPmBce22FIVVF?=
 =?us-ascii?Q?cB5EXr5r5bcKeKScZZ63KZ4cBdoL+FS4eGBCocixuQg9u5nMQwuv6nbMzO5/?=
 =?us-ascii?Q?G5Ov0w0p55wR7UbCzXuJTNp0T1SCZLsXc2k00mU/74za8g1STD51ii5a1yGb?=
 =?us-ascii?Q?xLH5pJXlv7ZEIvuWBFISPdMAFTBrcv6FGPfDHc4bqSCge0qlSsDgnfAx+T3C?=
 =?us-ascii?Q?AHzTpndcZ8tG1bzZKEtOVjk+X1CbVNHg0pEv8ZqPzk3q4UFJNlzYfdq46dem?=
 =?us-ascii?Q?mjrZ1tupAuzZutBndiqRG/9DfglVwuxOKs4fNmA0WZhbwkCjWMkddHmTC8Ed?=
 =?us-ascii?Q?1JHUfeddik4/HZY8LsXmKfv3FrujATrd6vcrszCB21jxoeQcoCZ1NIw1uTFw?=
 =?us-ascii?Q?SrvQfVFarP2zKgaCGp4I6AP9VY8St857LG2aSEevXMJGLp4iVpJBiZ/rR6oX?=
 =?us-ascii?Q?rE571AcLg7Sw7+XHqdZikY+USxNWY9+HaLisn91PEWyJnOxItKkyVLywsjMr?=
 =?us-ascii?Q?3kRt1/PHkFzQYha9EnjU03aHjK1kYaYZXBpgypD7ZO/86+NHbbEXwY2t7rbH?=
 =?us-ascii?Q?GbYMJ12ur30lDkkYsWDUdzb8yUJ1l7y2/QExEboqezMIDDwCvcHR8IonN7Vw?=
 =?us-ascii?Q?CCRICxBiccOaz0O0GUYka3c+VOqqZb4cWYxlMojEUx4hPV6RrVIYv4/88e1w?=
 =?us-ascii?Q?Y8HIR3oF9DTr7QIjSVt2xkThfq73P42Ai60+mWLD55FXCttFfCT5StHdIFHu?=
 =?us-ascii?Q?tXnLCTURnf1qSfQQKVtFLk0G+KO+Cm9RacfTsig4YpxCs817L9cZKdzW49dN?=
 =?us-ascii?Q?TqrCeEKE58boDj64XC5cAMVCAR8DlLZ98KfGbfoaxiqvrqRndxcmnl2ZqoSj?=
 =?us-ascii?Q?sChJ2EAx6GDQ9yfE9w7ImtfINwN7Dd314YbpQkjmwKBz6GJa0OyeNvG+0OXB?=
 =?us-ascii?Q?7zg0v16PcRd/xjXUfqk14ZAfkZ6CY6U1UZZcmiwZSbkooiJpQxZV8FPFHwv4?=
 =?us-ascii?Q?ocKWVQzL5XmW3Q0u92Q+Jsd6T7n24TXImgAzs6Sv+15uhsrdtLRqvIqK13JM?=
 =?us-ascii?Q?6Vd7sgpKS0XQ9hLj4OidWfOBTcV1g6IkCjq1?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:53:49.9863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa21bb73-b0f2-44e5-dc2b-08ddfc21cf84
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7421
X-Proofpoint-GUID: mhtKazMQ2MKaD3Q0Ehbobe5vPO6Ms5Wd
X-Proofpoint-ORIG-GUID: mhtKazMQ2MKaD3Q0Ehbobe5vPO6Ms5Wd
X-Authority-Analysis: v=2.4 cv=dL+mmPZb c=1 sm=1 tr=0 ts=68d51f41 cx=c_pps
 a=grR+JLqVfS8Y5b128bbGRQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8
 a=w1d2syhTAAAA:8 a=PNBlM2Yev1JeWuC6KiQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDEwMiBTYWx0ZWRfX5RWXKvxXhKoB
 bWgF9cxvUMp43M2ciWfHTK+i2yxvaOeAIgp4BW+WjXYgUgCM9GCl5+X9VOCm/h8IICwW/GPpJud
 Ud38vEnErQyol+Hz0SR+mc0CUI6odM5VlRjwDjRrXidvFPBcuNrjavue99Vr8ixVUnl/BJUT5kt
 P4S0x8Tkvxyf8cFHcSPp01DynYDxELoonroIXj+hDv4WFJKytsQoAST2VED6SA4Bv90F/nNMrII
 JAa9RcxoTqZioG3Uut8gZOeqV3W/8m8HL1BUpcf2bhZFIAClIGdOh5tWKR+oL/Xwdz8zSAJQriE
 JVYbFeM/K+S+SIYP+hJsrtDI8VI79ZZsOlPkAu1yVZ9T0S7evATVfv7ZPV2x3Y=
X-Proofpoint-Spam-Reason: safe

Parse the DisCo properties for XU Entities.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_function.h   | 23 +++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c | 25 +++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index ab9af84082c95..f2ce13162151d 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1090,6 +1090,27 @@ struct sdca_entity_hide {
 	struct hid_descriptor hid_desc;
 };
 
+/**
+ * enum sdca_xu_reset_machanism - SDCA FDL Resets
+ */
+enum sdca_xu_reset_mechanism {
+	SDCA_XU_RESET_FUNCTION				= 0x0,
+	SDCA_XU_RESET_DEVICE				= 0x1,
+	SDCA_XU_RESET_BUS				= 0x2,
+};
+
+/**
+ * struct sdca_entity_xu - information specific to XU Entities
+ * @max_delay: the maximum time in microseconds allowed for the Device
+ * to change the ownership from Device to Host
+ * @reset_mechanism: indicates the type of reset that can be requested
+ * the end of an FDL.
+ */
+struct sdca_entity_xu {
+	unsigned int max_delay;
+	enum sdca_xu_reset_mechanism reset_mechanism;
+};
+
 /**
  * struct sdca_entity - information for one SDCA Entity
  * @label: String such as "OT 12".
@@ -1106,6 +1127,7 @@ struct sdca_entity_hide {
  * @pde: Power Domain Entity specific Entity properties.
  * @ge: Group Entity specific Entity properties.
  * @hide: HIDE Entity specific Entity properties.
+ * @xu: XU Entity specific Entity properties.
  */
 struct sdca_entity {
 	const char *label;
@@ -1123,6 +1145,7 @@ struct sdca_entity {
 		struct sdca_entity_pde pde;
 		struct sdca_entity_ge ge;
 		struct sdca_entity_hide hide;
+		struct sdca_entity_xu xu;
 	};
 };
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 3e1df30f5d609..2e66748462213 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1398,6 +1398,28 @@ find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
 	return 0;
 }
 
+static int find_sdca_entity_xu(struct device *dev,
+			       struct fwnode_handle *entity_node,
+			       struct sdca_entity *entity)
+{
+	struct sdca_entity_xu *xu = &entity->xu;
+	u32 tmp;
+	int ret;
+
+	ret = fwnode_property_read_u32(entity_node,
+				       "mipi-sdca-RxUMP-ownership-transition-max-delay",
+				       &tmp);
+	if (!ret)
+		xu->max_delay = tmp;
+
+	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-FDL-reset-mechanism",
+				       &tmp);
+	if (!ret)
+		xu->reset_mechanism = tmp;
+
+	return 0;
+}
+
 static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
@@ -1430,6 +1452,9 @@ static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 	case SDCA_ENTITY_TYPE_OT:
 		ret = find_sdca_entity_iot(dev, entity_node, entity);
 		break;
+	case SDCA_ENTITY_TYPE_XU:
+		ret = find_sdca_entity_xu(dev, entity_node, entity);
+		break;
 	case SDCA_ENTITY_TYPE_CS:
 		ret = find_sdca_entity_cs(dev, entity_node, entity);
 		break;
-- 
2.47.3

