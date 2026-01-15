Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0E333DEEB
	for <linux-sound@vger.kernel.org>; Thu, 15 Jan 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477597; cv=fail; b=ekkPRGiTf88hoykV6EbzYSoqBeua2JLayp/4n4UJLJ7x+fpsvKkf2j095yMiCPiGWvqY00gaJDZCKwnSUoJ8xIaE71BY6MujCtRs9VfA2xDjgmAxFt71QnrxLZQ+zybfV0jWq2yz6MFtNoaD1zkqcwJZp3XE459fz/rUyhm5YKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477597; c=relaxed/simple;
	bh=Lze2vYKXJCUCrJpetbSGPfdTaj593qH2B6TWWcAq8ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EjZVPZw7HZUNsCL9AiwHXP8Gohn55JHNI9bvofBVzeUDQjKR3blSI2P0W3hbpmzJhWPbdjSdEjcDV/+M3XnAfyv6+GDmzPsNlh50f70pb49fsr4E0bqmp/zkt+AYGENN27W7yClGv/WFibbnxpJlOaNuuIJy2nAjLpvwzlZxfi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f8oKyadt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=w2puRLgQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f8oKyadt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="w2puRLgQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5tf7a1710468;
	Thu, 15 Jan 2026 05:46:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/EzJe86tEwqgAjWl
	Iho02GG+g8wxXn/Mkt6HG15PTU8=; b=f8oKyadtd2Y8ieib/IootTWYefWozps0
	SSlBZ9jXOjyKYlqOy91RhDQj8PAfN39BCnxknklOalm/JLfNRY6Bgsl/9NQKaQWZ
	wu8V0ceg4TDoh+6OTqakN/EkjMqvMfpjEaYGZTAz2EURc5Z4x6HtcGd3CP0gHbBk
	/9noKZO8zPtU4Ss4kf+P+mrTU4tAR4APzYi/XBnTCUi0ZawHCFcS1B1zH2djymJ7
	RKd2/bZf2ZPj5XmavpBzI4xBlpf3CZJXTnRMouIyW8xyTipZeriFtZRO5P3v5zwe
	WKnsy7GvzLtFkncqh7CQwoUIbQhHnUym+fdls5zHAqd7vvmj7ZWHEQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022090.outbound.protection.outlook.com [52.101.43.90])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n5s4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 05:46:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAQtOUbf1MqPmfjspBg4FlT7trHpryMXxbzXvJiXvI6zGokVsZ21lrRV1NXr+JfwbTxnGNwknF3JZOnXGCsuBEaguWZH9SPi2ibw6VDZctuhDjXF+JFOa1mIIudevYi8rq4EZlYe3WsR01mTuMelq7YgUFDdzKMYFGeaqa1KvwadlpViQazPTDTLVA+nKeMIADYhPXn7peQshT53dqEkRYhLovnvPrylYujeHryFMmXwdhPU++7LgDH2YPcLtchLpp2qgPmjJxHT9ycXgTmC+NC4LyJ1hvbVN/A/fTWdLmn8a68c+T6B+b7cn5d717lrnBZDAMrGEHE9TcUJk1boyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EzJe86tEwqgAjWlIho02GG+g8wxXn/Mkt6HG15PTU8=;
 b=X9MYgbEtXe2PyTrt9/FG+Ltxb8Tfvd06ma/Z4feEWnjNmwgLpAxq0LBLH6PTqumgWpda3T5UPdYiifq7T486hii9MavJk4Pr2O9MfrhOXf3a3Gx3Re8nd7Ib+4SksmtABMTD3U4YEbl8ROnwY1syD5cSodTnjLo773AWobDgUnXR7/E05AhFeh9YeTD2LhBx72NL2YrzzGHon4tJQEJr0NmmytWMmFO+Ba80If/LFDtUYHlcxKggKYHyOuF67DlO3jLHWzXoqUoClp5xpXlpXTI/1L4zjjGDp51jd/SqTadvmYR8t7ANsCf+e/nlKU5hSGY4wJzm/KohsAUAOadV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EzJe86tEwqgAjWlIho02GG+g8wxXn/Mkt6HG15PTU8=;
 b=w2puRLgQI48O3aZIJCsGIIrTAceldZ5g6aSWsyjiPHveyX9ynV3rEfOZ8M8oXZo0tBtvsuWYBhmErzf6KagEmITiv9Dl9M2tH9oIQtNQpnE5wkdC4EhMNaMGHiX5r+azHnT/p4rr4HAs4J/RUEs/zfmY7Nrqs7EOJFAXOZkRLek=
Received: from SJ0PR03CA0179.namprd03.prod.outlook.com (2603:10b6:a03:338::34)
 by DM6PR19MB4375.namprd19.prod.outlook.com (2603:10b6:5:2b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Thu, 15 Jan
 2026 11:46:15 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::cd) by SJ0PR03CA0179.outlook.office365.com
 (2603:10b6:a03:338::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Thu,
 15 Jan 2026 11:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 15 Jan 2026 11:46:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9B0CC40654E;
	Thu, 15 Jan 2026 11:46:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8359A820247;
	Thu, 15 Jan 2026 11:46:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Tidy up some memory allocations
Date: Thu, 15 Jan 2026 11:46:07 +0000
Message-ID: <20260115114607.271990-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DM6PR19MB4375:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 36fbfb7d-5449-4b53-1f57-08de542baf68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R+EQC9RdtDaszqOSN37v6FceaULhuoAgjSPvZBBgN5okeUrdiU8JB5SXMcVE?=
 =?us-ascii?Q?VP/UqRVLRemegDzccAUq3nzZRiw/psY6YKKgljVGEONOpRkhvN81PIjbwchQ?=
 =?us-ascii?Q?BZ9M0uUczf/gISqS2tMLtSdPX0D6LyhScnK7L9LBvF2uMFw7s7wJsgFdUMSx?=
 =?us-ascii?Q?B4/G86/MKJ64ydQwTJmNZ0KQiKtYiBfEQSb7T1SMzwVT4tCXFVWQS0IH7Jp4?=
 =?us-ascii?Q?YR/Gzh1tw1Yv+0uU7E4jNY3uaI0rME70lDeR7mdLxyj4OnL1/NZUrT5XWABQ?=
 =?us-ascii?Q?xgL+2AnRjBrmsGKDWZ38P62TGDwfcRetYD5ZzS+fgIixbNCA2880Wv9y21VX?=
 =?us-ascii?Q?L22OnpYlCND8qjJCz7lWoxg+/413CefukqZnSuC3IcSjlAMC3CKKTVOO4IT2?=
 =?us-ascii?Q?xQi6yrf4u8mFWxoIKohoAhu35zSuOWIMHj3indyjR4gEbFSVc6YfsfbqrjDU?=
 =?us-ascii?Q?U1houOoiVKYaAw/TPhG0Wv4g6EE6E4rGv/FjuMrg7Y9qg295pmWQDwQ2XxMJ?=
 =?us-ascii?Q?2BfLzWLU6VtC0PWEc7jloaaNM1AY29cOlQmr0NREYrCj3M58khVjWhC+WoOP?=
 =?us-ascii?Q?aKmOcxibnq9g4Wt/O+cm3Re0+XNiuKf53tgmq4sPf0XCDVVHRvGwVCRjpX7L?=
 =?us-ascii?Q?Rz9WlXrtfwuLb4WUmlVz60QTo/62X+kRAxDP88lPX5sXbNMrF2DA9MV368pN?=
 =?us-ascii?Q?/c4N97rVtxBstghPFXhkFJwqPD5njWNIF7Dj6KpcFJafa0HiD4BMkJiayL2c?=
 =?us-ascii?Q?Qw9e+5cva5N4eCgmADLoI+kUYDyHZC6juRMPW7S8KEym9RyiCsMDJx/aaVij?=
 =?us-ascii?Q?ZUnvLvwvzWAr40S4SV87m7nRc598KZWLU9IElhytMakBGc9MSRlKMWan2C4c?=
 =?us-ascii?Q?5vRGd5KtWnw+NKTb+yz8owEztwpp9xLTQuW1fAqleScuedb1VNqqmiU5y+aJ?=
 =?us-ascii?Q?Zo6oucUOpOL+UVih4o9DxgBMR2VZq6oVGBNLrp2HVJ6No91WM95pF3xetyEj?=
 =?us-ascii?Q?0hIbeY0F8BCxbN4aorndv96w5/3fh0drdWRjGfORraB0FkFAEt9n2zNGqztY?=
 =?us-ascii?Q?1WpaK1w7AY3z0ydS4r4/TZW/x179RZyFS6erf3zzwQigxLkIQf+vePVRyMts?=
 =?us-ascii?Q?+7rO9mlPnLjr5aZM0VLekLqn6jOc6Bj2mbZKdJSORcGmoSOWFOw2E89+M0Iv?=
 =?us-ascii?Q?2yxvDI89Xv0gOejoclP6xO1oCBu6hzeEpHmiVXiKkyFfUezSf1Q0gmh/kPDv?=
 =?us-ascii?Q?MVoYq2npYSA5/p8XEKHdyIS1skFo1z8HFkqzOw34xguvb3EN6VNNejR6noja?=
 =?us-ascii?Q?hPo3UezyT9cq+Gs9yxvx7T0+4chWhh+dd4MouAim8mHJcgrUVMgQpqBc2bQq?=
 =?us-ascii?Q?xRdBOcLhMZ0uB/O8T+724p+V4nUwyc3UHTGfpAPg0Twmh5eU0sKzL8IsTFQa?=
 =?us-ascii?Q?1pitDW+x8Fqf90WeGJBr28VjtQkuGMJjY0ipDNj8LRXNt9FGBxzM1gMi6y+4?=
 =?us-ascii?Q?98n4aU0qTO4Ac00WjuX59E0XHGEiJiC3/C8OqGHJb3GasuCCzJnrDuhcDC5W?=
 =?us-ascii?Q?+0SnLbqO+1KnKtoD0NtS0ScanBI4mgUTYONF9oDARQtrREnfDPtJdpm/SLEA?=
 =?us-ascii?Q?C2EzPjpYSGmTL9JCZar1DWRSeJkp4AJNOu9nM80yohOE2+VknLT+m6jR4hfu?=
 =?us-ascii?Q?Fasmcg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:46:13.3086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fbfb7d-5449-4b53-1f57-08de542baf68
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4375
X-Proofpoint-GUID: U_Q5dyzfRnX8mdvsLtrEZStok4HGRwId
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6968d38e cx=c_pps
 a=ybF/z1spmW4Yh6p7z4QQKQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=qNjjvvk-De-zebRTYMgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA4NiBTYWx0ZWRfX1uheTcLuA9cb
 6Q/yBpYKoTP1z9LiLo5jwTIXqFz2YlVteUD2xZYHC6gGwqM083/S1B2sdPsv9vatjC0JMidHyLM
 YUg3xFkvDAVv9GLRxSMcXGarCy05Na1l8WkYt4gwf4KtyUUCA17+hOby8g61xlLp60zrQLekqms
 x6T9WhF/VHdSXF0K7s1rafgqj6atOxQknhCcNUETtypp6AxCk+LHvetksYiCDZLqEI9Frg2kkFi
 cQknBlTp6VAsMI4JQRDjsHdo6gs302Rzv/jblKvqxPQfElUZg4D/Q3w8BGA7CaLLYaXYz6UHiME
 My4mWGxYVP35mWSDCCr1NM9NoqRerBg4JrZyIChKj9Tz8dsJh+Z2w5/j0nfMAzazo1+pfzHjzZ5
 KHavDd6uF6JH0LAvLJZjCE1/dXuFdCGHxRb5+zFCnJmKaEQbMpAjo+8Nju6FeJz7nLJgOZ9wvPn
 k3Nj2XKWLxABlf1SCzQ==
X-Proofpoint-ORIG-GUID: U_Q5dyzfRnX8mdvsLtrEZStok4HGRwId
X-Proofpoint-Spam-Reason: safe

It is slightly better to deference the type being allocate for a sizeof
rather than manually using the type. Saves effort if types change in the
future. This results in no functional changes, just tidies up the style
of the code a little.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_fdl.c       | 2 +-
 sound/soc/sdca/sdca_functions.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 3180ebd07c400..8bee9f23c4739 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -487,7 +487,7 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	struct device *dev = interrupt->dev;
 	struct fdl_state *fdl_state;
 
-	fdl_state = devm_kzalloc(dev, sizeof(struct fdl_state), GFP_KERNEL);
+	fdl_state = devm_kzalloc(dev, sizeof(*fdl_state), GFP_KERNEL);
 	if (!fdl_state)
 		return -ENOMEM;
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index acac066f1d8dc..80c71116e6d4c 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -952,7 +952,7 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 	}
 
 	control->values = devm_kcalloc(dev, hweight64(control->cn_list),
-				       sizeof(int), GFP_KERNEL);
+				       sizeof(*control->values), GFP_KERNEL);
 	if (!control->values)
 		return -ENOMEM;
 
@@ -2048,7 +2048,7 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 	fwnode_property_read_u32_array(function_node, "mipi-sdca-file-set-id-list",
 				       filesets_list, num_sets);
 
-	sets = devm_kcalloc(dev, num_sets, sizeof(struct sdca_fdl_set), GFP_KERNEL);
+	sets = devm_kcalloc(dev, num_sets, sizeof(*sets), GFP_KERNEL);
 	if (!sets)
 		return -ENOMEM;
 
@@ -2074,7 +2074,7 @@ static int find_sdca_filesets(struct device *dev, struct sdw_slave *sdw,
 		dev_dbg(dev, "fileset: %#x\n", filesets_list[i]);
 
 		files = devm_kcalloc(dev, num_entries / mult_fileset,
-				     sizeof(struct sdca_fdl_file), GFP_KERNEL);
+				     sizeof(*files), GFP_KERNEL);
 		if (!files)
 			return -ENOMEM;
 
-- 
2.47.3

