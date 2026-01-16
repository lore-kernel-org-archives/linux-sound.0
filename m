Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347C83370ED;
	Fri, 16 Jan 2026 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576888; cv=fail; b=dt/lfUpaEJXCB6GXqnxIbS60TqX0OJPEuIgjtcg1LGKfSug0q2CKfbphgcZg/81CixRLzXOlRGhnrAcMMMm2/78zFuNErtLbVKDjDQZGHvnIe/YWBwqtKhxYXZNqUsB9FLrp5Ik3Rs5YXlx2OBwqgor3rJMNnvQ8ofj+PPCHNV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576888; c=relaxed/simple;
	bh=sXELZc1dlwmkX229nHfq20Wefot5MrFK0i5utr6WagM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNhHhjZ2pDuWEnNIRFiVjyahA/FE20h9Bc+d+CTkaf+Lu/63KmeOyC8eZ9gq8qWGbI6Onv3s5SIjWch6y61z+Y/WRQkNSk0GIMwJEYZv3JnIVgraU2ClfPeYDZWIIovwnMLsYOdvfkqO2MYL2wjEUF60V7rsl9NprpFa7B2mpdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gZLA/NnF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=R19gjAj4; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gZLA/NnF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="R19gjAj4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8SETS3769889;
	Fri, 16 Jan 2026 09:21:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zu83+exXdcvXgUHvKzYNSoX3If2gGwP6n7010g8kOx4=; b=
	gZLA/NnF+YQdQ09tblq5PP/1YWmFG90umQNlNcbo7H1A1ABC4+cZvqVwzZT5S8WO
	HtlZZgILFp2DAOo5BPROmarLiKCq/HL3l2CLcT1NFsWSVNlAJT1GfnDyhRkiPuIK
	YRHs8OYzrhiiV3o1BpRJjm2KMDtveBCy75UlRzyT318cHTFQpTAfLlP9ulnQ9T8P
	fyNEzzUnBLqHatrFcHlHLz1P29AHu7L47Nlo37jcLvR+JnD07Q3rh3uSJ1WvEGo4
	86BN5es9/roeOqJ0a42OoSGNH1E0aVhbFTk0pM9SqYl1L3s8O96PVK0ZvjFJXrLM
	1Jvl6q5EKuardwfhUHbHqw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020102.outbound.protection.outlook.com [52.101.56.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn207ba3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 09:21:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJGspAuqoy+CiIKnU8CFnHeLEOSuJpz7zlFpClZMxSW1Fm5j8/TkExyxKXsK9TjzXXGrJ6E5J4LwGjQMkETA7Qpnpb2vgSoO0E+zBnxDiot0Vwev5S39Zson9mwqAnLZ8bLPxDuiDIeBtCfJ77dr0NiViHaheOppX6OQdrXLobD71M1QVxROWo8joisfnmoK/fqkrxnBie9KfXIyvWNeM2X05CXN0pfYh1fAWwaZH7fhveHsjpmFKkxleCg89JU1haBK4uafqb+cqmS5DmyeKRLpbm57ryFLqCj6RnvLabLj3C7yoYWDXs3msZurtzj3L/mdFNRU8V7GxKRFBSIfGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zu83+exXdcvXgUHvKzYNSoX3If2gGwP6n7010g8kOx4=;
 b=nlquyAMSS5f6l//6IOttAGkW/4ERXmNYW/TLIznuhOQ3jQufKsilM7F1vGMU+pUIYWcrGEjW3vFFsCOWhTxlMWMbIZeKGL0TW2rBuS6u8SMCTm53uyJU3YUoG8+xO59JX3CMhDktbP3Z4ggotqUKc6hQ9fdWQBXb/PNBI5xEVmGB/mW/fJUZRit1zheycq+mB8Cj1wJWjFbyaCgTLZZ7Vp8f8VktEPFWkCwZ93i9PoheWGzSi0dJ6cTV+pbO1E7Tr/vLOUaJjfO+14O2oMosCLJOCO7/LB36ERfYrl6JOee3orBDPBSfj1kSgBk3DNEzcxrvImm26at235ytUkHVQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu83+exXdcvXgUHvKzYNSoX3If2gGwP6n7010g8kOx4=;
 b=R19gjAj40/9fPGthuQwrlax6odEVrUJJxVGDePXnQ9MSVz54aqqoUghBXOanvLhcpImxToj6JMRaiVUtHfHQpExusqPKAb1f261aKvGoa9Yzm8skj6ryGLeSumI8sG4LVA+IVRUyy5f6P6kGEcay7jijwesUxX+JDHSlLT3ifd8=
Received: from CH0PR03CA0386.namprd03.prod.outlook.com (2603:10b6:610:119::29)
 by SA0PR19MB4409.namprd19.prod.outlook.com (2603:10b6:806:c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 15:21:06 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::92) by CH0PR03CA0386.outlook.office365.com
 (2603:10b6:610:119::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 15:20:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Fri, 16 Jan 2026 15:21:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51112406550;
	Fri, 16 Jan 2026 15:21:03 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 31E4F82255A;
	Fri, 16 Jan 2026 15:21:03 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2 1/4] ASoC: sdw_utils: Add CS42L43B codec info
Date: Fri, 16 Jan 2026 15:20:40 +0000
Message-ID: <20260116152054.85990-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
References: <20260116152054.85990-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|SA0PR19MB4409:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3ebba015-ff0b-48d4-de73-08de5512dda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|7416014|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DT/KrV0JFjMlcSpahAru6uUAiJBNwR6wK7V+nd5OfM66nGMN6TPwXOTrmj2o?=
 =?us-ascii?Q?JOFHlHNc/lrGHAS9lf5vmLBUn6QL+Xb64spS4Df8kNQPQmkJJTwYTkQdYg9Y?=
 =?us-ascii?Q?26Nlvup8BoobcqOHnXkWNmU8KrjE+Il74DY6Tm7Cro9I9I4mB0sMGBYEpMvS?=
 =?us-ascii?Q?vQMPpxk1YL4iNt4Dr242d73Eyixo+cJxFvj4STcuuJB4L9cUiFRaNZeZsB/u?=
 =?us-ascii?Q?3RgpKxhSrgBoIiIxcA9NBg7tuR4TqVtUAKjcY4ris4CP16kG9MOCFni9CB77?=
 =?us-ascii?Q?p6BPGA28dhFKht8VyDFjnZsX//0wgQfG20Tw+qeojL9rskJiSVgJlDTINEzj?=
 =?us-ascii?Q?xJ3mz8FxwE7yTHIfSXkNgjY5uP7RRMRSL1rgKqi1IMJZAMa2NjUBk4laMKx7?=
 =?us-ascii?Q?HhYduNAhYQXh016LQYQNcxb0P6bJp0ylDF7O1CdfR4KGsWyM2h8uVIlO9nkA?=
 =?us-ascii?Q?n9VWXcyJLtOO6P6AqR2qXBP1rxfEGJO6gr1vfUbEa/YeoUOOED9U4/2NcIEr?=
 =?us-ascii?Q?XShSy9dv+fVBg8U82xfyQJE2I3eN98DAjKWOtlhUFc+dRWdxmCOo9iB52oSt?=
 =?us-ascii?Q?O46evW5MYZhCTACj2psak5fa/ZhlVq0nmOrfV2lAJ9a7aYLHpsJt54M7L+LZ?=
 =?us-ascii?Q?dPO5kj93m5W63aRCmu59DqVnbvihIlIlzRO3IA/vtBnXBW2huU4YN+8ZMd6a?=
 =?us-ascii?Q?fSBA2rUJbc1DzPP5HbxcZkmwsQkyElKFL+BkQh1VEF84GgmhAd/xjqNsCP2G?=
 =?us-ascii?Q?zhC67jEDsf7f/Z9WmoKBdOEWko7UTU+townRdjsv2Js1Uo0/B5Yoou+tS/QO?=
 =?us-ascii?Q?Ad4z2Mmh5Kup3smHCOQl11n6q4RkUcH0cOhAY5M5KvEFx/G7Kq/I1jO1IALA?=
 =?us-ascii?Q?gH4Aqxsxbm/T9LSlFSFgxVjr9Loj1L8NPP30/fdnFVF/BB8b9SWoAUOhi/W1?=
 =?us-ascii?Q?OWeY2vgwdVhpRLh3prW2jt3Z4e3IgLqBKHT7PdNGf/jHpdY3f/C0GsUG2Jyi?=
 =?us-ascii?Q?AmYMYImSIhDcbhHIuFElPUHbk7+Zxbueh2rcWUOTmchcynN5K5CJu7xr4Qbl?=
 =?us-ascii?Q?CbpXx29nsRny822cW+pvbmN1+om6zTySzPF6yz67WzwMrT+SWAq+3TzlLrpT?=
 =?us-ascii?Q?wVy9txuTH+FgUbegrf0cTMdqTtNhGRY+wVtg3TEUk2/moH2N3sgN3bgynHOZ?=
 =?us-ascii?Q?SopmR9wW9D3YJT5aq4hBK/DMD6buv9wiG2zXT8IQVxSJo170Jr5DISQ+nI36?=
 =?us-ascii?Q?o6QkG/P2ssizgpjhPCg/f2vSxvhTPA+lXho+MSpR0DDxHZ5ZBE6kgJf8xanj?=
 =?us-ascii?Q?VyArh4DrpNVpC+/bAJSqBLS6ccX3Zy3iJOL6W2bp8t3SGhGGPcnCsc2PB4FA?=
 =?us-ascii?Q?ftD1v5hChHMRppuJQLBXPWACht0X5r/2ZyCnEZ/851r1MGqnzmclqRJgpnRE?=
 =?us-ascii?Q?a3u7r72hBHIr61kKbtLv3i/PO126zet8wa5wPKTtBYLwj5KhU9icY9xnD+TS?=
 =?us-ascii?Q?RJcwbIUvNfPBCKeQFvlLgspgmAEPxOaXAQwzLnezKdCWXD2TlxkNaOiztZIp?=
 =?us-ascii?Q?VwiBVZZiRGesTtpgsXwwHzw6+eZnXocwSrR1VaH5RtqaTcDfCMpMVlVPHIsN?=
 =?us-ascii?Q?gRbKK8W4Zo+c8wQqYUw25mNQWCT2mO0C6O/ppeEpJpQwfIW1y5bDB0i2Cmsg?=
 =?us-ascii?Q?NtYknw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(7416014)(376014)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 15:21:04.7035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebba015-ff0b-48d4-de73-08de5512dda8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4409
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOSBTYWx0ZWRfX3vE3odCS1Qij
 A2+5ZYF6KZkcpoLQG8sqXeEYlWYiUriN0vhpHfQaVnAY8GLGoBgc1peXtNpMtkDYonA4VC/dE69
 ePEixtxBBWWhx7ZkssA5qOW6nAj+7AxzBxOfmV+1Q3dveUAvtHC2+gLdSs2uw2r9f1ZhgjYyPaw
 uaw3kc44pxa2Ai089wWKzG1l2n3aq2i00zKBPzN6Z2+zylSQhohYMC4e+y+C7Xd931cmvkeo8Ln
 ZkEDfueg5cAsWLLNQPF+91GENQm1w1smZCKeXKzVCk5Qgpyce0+8QguUkyxu9fEOudrS3Ce4BVm
 52vf4t/on7vVrXud7IaHl9Rh2UGAMB0fM1We9t/CXPwA7wuLb3leTB/xysYEhY3w9dWIxlKDgCf
 uzNafAb2oxl4JIAV1uheRboKbnJ8SklV4Yyhd8lwYA7zRGJX7Dw39B/liLTW21R/ARV7KkYsVyf
 x1MKBqP+xHWjjx5CvBg==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=696a5768 cx=c_pps
 a=jBIXr2/5y8QxNzQ+Iip0Pg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=tJGs-QWwAZckUbUC11UA:9
X-Proofpoint-GUID: blTuF8Bzp6h9mlAj0MpC7kyAd_rfMRgn
X-Proofpoint-ORIG-GUID: blTuF8Bzp6h9mlAj0MpC7kyAd_rfMRgn
X-Proofpoint-Spam-Reason: safe

Add codec_info for a new variant of CS42L43. It can resue existing info
but needs a new part_id.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
No changes in v2
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 6bf81ed132d8..8b59d181a70e 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -721,6 +721,60 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 4,
 	},
+	{
+		.part_id = 0x2A3B,
+		.name_prefix = "cs42l43",
+		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
+		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
+		.dais = {
+			{
+				.direction = {true, false},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp5",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp1",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+				.quirk = SOC_SDW_CODEC_MIC,
+				.quirk_exclude = true,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp2",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+			{
+				.direction = {true, false},
+				.codec_name = "cs42l43-codec",
+				.dai_name = "cs42l43-dp6",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_cs42l43_spk_init,
+				.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS,
+			},
+		},
+		.dai_num = 4,
+	},
 	{
 		.part_id = 0x4245,
 		.name_prefix = "cs42l45",
--
2.48.1

