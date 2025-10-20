Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00F2773D3
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975754; cv=fail; b=Vjlg29ZRSCAWfU0UFTf6UGCsmR2N3dzh+/gTuZT0TEpnbQpQAC4GCYW2DcnQGulMNkjm9IRvUno2KjtxzZd6mqCj4HsT1dXjLS9ldRbqPHGkuCzCaEcgK9OfpDfwAc93PLjTRLz63QjKJp+6BE86oDw+M6yjidaNuAD5aM4i4Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975754; c=relaxed/simple;
	bh=9VosFf/+NY4lFcjXqDOvLklwNYNwmqMD6l867zZHFR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpgCqO4wqUDUw8YQfyaVuNh4BtWyCjyYYS0YDCeVyQ46NiMCDTjpWFbNvMmjCTC2Ma/tMJgQOH5bbyv9UQHd4PNOtN+3LwpguMxCc4g8e+YNcHxOURe25lsk7QyT+PZ4yARoRA+C6tsomqwU/aB2aJvhQbsUXTlPXHTW5rwxXKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QX1m4qhz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=So/yHn1a; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QX1m4qhz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="So/yHn1a"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59KEAeTp941384;
	Mon, 20 Oct 2025 10:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rhd519RClKoLX7BElSL2YnyQ/tQT3XuVfMtK8cdRhZ0=; b=
	QX1m4qhzxCTO41X6m+JHOiYKDa8wNur7lkcbhwxG+xNK2AyzybM+6ogUXfmL8frS
	N31Y9dCPi5Uf+ZDShXDOeNoPhCrDi+k7OYBT9OH1D/nx6H4V4xKWM3vYda6TIQ6+
	BlyNwBl6UHy/mlZNLNyHdqrt2T8fF39L+9Z3e/wwHV2WCbkOrnTuoUQiZ8WvhP0J
	dep+q0lCTuGoX1VEe+5rdv8lP7CqO1WrCanh8/6Lhm1sh3aeR2j3/V/zTn127nh8
	wfGQILnjpDirDrJ43UrnQaMhDEG7y/B3dsgjqhR3aOBXhKAGiXUs/YBlOqxp0gYp
	HAHDzqzs6FCpWOKGSTu0hA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021129.outbound.protection.outlook.com [40.107.208.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 49v7aj2aeq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 10:55:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0Kq9+d+7SjM2d3N1NncKsiGepZJP5Ri2UlFJQah2Bxxsea4hFDfnEvg6RVO/p6qtqKmibls2TGlTcb0LuOrGI22NDERm6spEhwd/rpNfawdk+1biYXaYHTcQDqIMWwZ/9eGVrDmS68dOYo4y2X7TRs3wMG0jJU8tAlCd8daWxTJNFDYyJG7JVy0PYs/ZuM7PBKu3ExRP8XW8zsY00r9LtfTgKrcj2mf80TNjCy0zVtRhEWPQAfhrY2wx6ND4pn9ojbu2zjd7NE+4uZRt+3FOa3GoWFBKMZ07p9BhtZ4ioBkdxGFS8Oz6c3rdaHvT/RL/uMPr3iHcw+HBnYK0liquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhd519RClKoLX7BElSL2YnyQ/tQT3XuVfMtK8cdRhZ0=;
 b=cG7YT5gYcBhbb9kLQ2Q+nhNuDGh8RUa5WiFMcuhoIoOOjrQeWAy6w+rklRE7S3epmEYqbQnm2/Rg79vq/BRdGEGwa8ZptBTM69BfpOG+pGHhzokbBhgR8zAtQYkseTlajUcFTyRdapuAxp8MOadU1pYIF2IwUO8sdwMBtXERupoJjXPb/AOV9Zt/x4Q42b2sk/SZcnVA8rqzEWg/+WWdX1r6WH9mt49x4tLJx8Qn/ldrbe4xasSaiBQIV9J0yAlDVlC2P9F4hxKgPjYn81KBoUhE5RM5RXfbsIsaMxV3GuMka6x+sdtk+RQafhOVbgaogTR5hZQm64ncmTtPyZQ6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhd519RClKoLX7BElSL2YnyQ/tQT3XuVfMtK8cdRhZ0=;
 b=So/yHn1aBdSAFKqbaPljHNPK8ixr1JNsyT19sjG5pzzmtbOVUZ9eSvA+k1scFsL2E+h0dr9Sjf7Tlmpohl8xdZvURuyhZ5n6J/4cahdeoJRY7dtzMeNASofVsYZS4T6FZje1xUpwAf2HF5avhHNEKfaeG23Rg+OHN3UO199WZnE=
Received: from BY3PR05CA0025.namprd05.prod.outlook.com (2603:10b6:a03:254::30)
 by DM4PR19MB6049.namprd19.prod.outlook.com (2603:10b6:8:6c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 15:55:23 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::fc) by BY3PR05CA0025.outlook.office365.com
 (2603:10b6:a03:254::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.10 via Frontend Transport; Mon,
 20 Oct 2025 15:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 15:55:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9DE3E406569;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8CA5F820244;
	Mon, 20 Oct 2025 15:55:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 RESEND 10/19] ASoC: SDCA: Parse XU Entity properties
Date: Mon, 20 Oct 2025 16:55:03 +0100
Message-ID: <20251020155512.353774-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
References: <20251020155512.353774-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|DM4PR19MB6049:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e60ca81b-2d9a-414d-9d93-08de0ff11377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?evtNcg3qgfXQ98ECVboqcimmL1Pj0bV5PSAc8Gj8QbSYaosLYdXq+ceFFLUq?=
 =?us-ascii?Q?WLdcF7pWOcF13WErBlh8nBlf400wzkaQ+hD3XQQBBFpxieqNg1dqIYiuAL16?=
 =?us-ascii?Q?Fd/Pe6c7e35wMwwi2bvViBi8w4BhS9uA/Y4HfySm6SK2skP9EbBtZSPMkl2l?=
 =?us-ascii?Q?FjAPVGMVnDRmf/j9vCJDuXixIEe0I7pmBciSS+cJ66QWoD3Sl+rkAUNWnlUe?=
 =?us-ascii?Q?lPjmSQqW29Rz8P5GCz2aAJ2jJVW95DVulLjBaRQoFKgVDX+YZNdAkAGnOZOg?=
 =?us-ascii?Q?fdNcVs/kdfgzkfYZTDUI81pjnh1uRb2rjKSwY++Un95gzPmvdh8/pKm5Fo7F?=
 =?us-ascii?Q?CZE5DvcP3INQr01PxW/YtadaMbT3ATMtxDUQcOFQCqPs1eBAgZV6fUqUpD4G?=
 =?us-ascii?Q?iR1ZNZUDImGDTZnkeSZT/CCearmXn+padz431SpLkHzStMPJ3CgcTy1hPXMW?=
 =?us-ascii?Q?dQXb8d+9XvHA6p3xnsJozwk0xSDf9rGB1FPhY3rDaBZ6MgFFT7mdlzo9xPfu?=
 =?us-ascii?Q?HDG0aYaYTP/VNQ4TAost7kcrtjSrGnhj0GG8BJbUcbm9ScmuacbZCAVtt4jf?=
 =?us-ascii?Q?+6XL8iOD/QgoTBojjoD9sBdCanCwkRTNP2IAeYXlsdBU8XcoDQA+Rj34ITXm?=
 =?us-ascii?Q?OzZ7woKmQ9tlfNZUxBYmCu0ozLgHszhEfIBrMAuFNrozyZ+8Frsbxggfa8Ek?=
 =?us-ascii?Q?z2nkwiJ+ffcOE7EXe0HM7y2SWZDO4P9pvb0/l6ls4SUKYANUPzl3ggBIVpe7?=
 =?us-ascii?Q?wnJMkMSotnpH67ZUXxXlWOnfOlPUdkvAIoEc3xpjAOsz89e6qAAUa8Xe1kND?=
 =?us-ascii?Q?2WfR6oCZozVFJvkr1pkbW3ZXZkQnrtUMYIzUml/MJxjDURZwmWXtXMF7Y311?=
 =?us-ascii?Q?aMRVEWvqLgTlb+PsGvTt27hLp/fhH+KYeMbR96nhY359NrrYzpD1aiWzQv/d?=
 =?us-ascii?Q?o2gH2rnsQc5fa8SVTyZMSPftsPRuM9mcbowRE0ubDvVMFaBc31TC0ZJ3SjHd?=
 =?us-ascii?Q?wu5dcncWpWwmfVcu9OpHTr9gaaBFBafX8KOPhgNkt8ZpYvefnS10vQaRe5ea?=
 =?us-ascii?Q?UgN1RPTPhmZsxKCIIaWbycoZsscJ9TTV9+yhcf0hIcx68SVBHUhysi7fl+um?=
 =?us-ascii?Q?9VqIhKqIiYF7PaPnneUbIYK1oYf2FavUbR+rTxy82wR6zLFChAvwd2RsPTIb?=
 =?us-ascii?Q?8UGco461MfNHz8tO4kIavhbefqYvNiAAhVW21ZVRb77KpUk2yid77hX3Z2Cw?=
 =?us-ascii?Q?If8OXDWSJ3xYvUfaMaOTGvI1HLguz4yNIiWlmg8WXIXaew99eizPLNnhYGcN?=
 =?us-ascii?Q?fvLJ90lakgexdn9BzSf1ppYoVgNYHRJPfjNdqLXDjb+DkkhspCG9+TVC6p9u?=
 =?us-ascii?Q?6/H4yJuVbG37XvAYzAIQsHtuonDWkTm/f29i2c05doejR4e7zZehB9OxVMUE?=
 =?us-ascii?Q?Sq/z+/XMLoqeTQAn2qWs9OgMA+nHNzMj6hg1PnZ5WWyXPbvMfzsEDX/VbHGh?=
 =?us-ascii?Q?mJMlzMZPUd+pLhc0EPmJqtBY4tmhLIsnQuRxo3kVJv2VH0xqrzt3nNJpu3Tr?=
 =?us-ascii?Q?qIfigjhUJw5wyT3Yh8A=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:55:21.7940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e60ca81b-2d9a-414d-9d93-08de0ff11377
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6049
X-Proofpoint-ORIG-GUID: 3DbHg8BkFaaJLNcyIGlyHgZAPxGI7ZfZ
X-Proofpoint-GUID: 3DbHg8BkFaaJLNcyIGlyHgZAPxGI7ZfZ
X-Authority-Analysis: v=2.4 cv=bdNmkePB c=1 sm=1 tr=0 ts=68f65b6f cx=c_pps
 a=kwRT7Y8+/JoSMihcLh98Gw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=PNBlM2Yev1JeWuC6KiQA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEzMSBTYWx0ZWRfX1yrlsTgQvClo
 N6Bxh+J5MtX9rUJErYGQOE/sstmWft3mTE5U7WC6nksw4CWF5Yfdcj1GP6vyRFjtwqIpkN1YYGQ
 PEzQvPQW9Qa/Uwaj6z6wANWkZjuwpfi28DbnSe9jKxPklrEKswVo1C0b85S7FkZskPvMnl1YFPt
 G2YUi5DxRLu5a7GdeJphqAgAuAzvXmnh+v/6Q5ihVbtECSvDoh2DC+faKvzSvgdadt5Ixyilvik
 cxgB4sGt1D41P4SpHRO44V+F6LnwFcuI5AcRbtaNL5Ud6vQV2oKOYi5RK4MZmei2nEOegUvBLO9
 2Rn1lAjLriyv8jWSv1AIpaDmorr0dtunL4zPPxCkKOlPCHFFCCNcC1zGKkHWFG1/2h/Gn4vg1fc
 Vs06schezK7VFgZiZ5T293eXK71Acw==
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

