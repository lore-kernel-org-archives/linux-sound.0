Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7AD26E717
	for <linux-sound@vger.kernel.org>; Thu, 18 Dec 2025 11:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057750; cv=fail; b=jC2LYr1GDi83nGnbD4WJnJDTBUOQT79BbhHw3ByVysJF+gwWxHmBum2edblwxzLpB5pVUf4pQsdYc1DHw6sCFvF2PgWq1BkVjVfTEhR/FJBPKWChalf985gfQDqNdznBmVZYpfy8SmFaAMxBL1IFnN0RNfE2gW2BF2olcXjgPFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057750; c=relaxed/simple;
	bh=906tvMhm0DdgbNqdIgSh6mNDPhipytgvfTXo47/Z3ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ms3qotYYlPN7PbDSWR3C1kLPzDwVJyMPVtu4tYq2cTyQmFEge8RUzLPoNXg9+65wsuUcGRNkO6gQD6Hg/enfCDS8fRhP6MQKftY3sNpR8tKTmJxVjUJc31l3B0dYHETdJIxYzwsBB9ZqegtmE2CY9Mf8RDI+CiystrnmM79kLpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MmXi4uv1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=k9T5oC/U; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MmXi4uv1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="k9T5oC/U"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI5hJBQ1368193;
	Thu, 18 Dec 2025 05:35:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6TI/WAtjeKFLCCmq
	xVLUEXZl307gw4PoHwvJF1uN5n8=; b=MmXi4uv10REb/XElClRmCzjFcnpoae2t
	htaVY1n1MYl1RKTbE19BRTk23hMQtuys3JaAxrlju3UeZG1K8+54lOXWa/U1Bn2z
	7YjZa3aYFSOCDbD5PM5abWuDGWQVoiENFh6gVbZm8iIq0Y00NFCL1pLZToTjl1yQ
	MFfF5rTNfL63ddZX/MTm0lAS2VrI5fkl3CgDBM6Mp9okSKAndgLl/+wQR6VPRqwN
	FV5zRKlzMSRROqKHIovqM0hKA6uquzHWbJrGD/g6NVs3OijjK9/oesJqXFSssp3C
	qGBgCBx8P6dwCKBL4N9Sg+gvuZxJy8CsWw4nnE36zCBojeH6NvghLA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022075.outbound.protection.outlook.com [52.101.53.75])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15eje0he-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 05:35:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXNso3ehtXYXHuw4BocagHs8IL3S4536e5NF2CA8MOsIA5ma7rdX+fH60EtGmowLbXY/Rcfl/f93izQxf2MYvM04/QqZOQRsYJKOcVrSxpz1CTOLyGzuBIEp3h7UKj8iPpu1Vh3aRR3XFFGtSJ+JTq1Yf+1Bm5lvsbPv8fDWz3Q2yu6uKtReCyqXS+eA23f/ZOa9cFpVSd7W+oWV001K03pUbhbCAr3wFsXdv0wCk0Rzdn7VS44Q+fsZ21PESxeYsY0azp8qHxv2ZwAnmmwHLi3wG+aHzI9t9/Wt086ph5nvIzjQ9cqw1DQjdOlT4d0DP1URY3zUAmY3agpGJi1UYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TI/WAtjeKFLCCmqxVLUEXZl307gw4PoHwvJF1uN5n8=;
 b=MK0togKi0FhEcigcSUmoWK7lYCgeQPjT/aFjSmxX19O7JcMeT8Kw+DztRwfpb/nqfDIxCcj9/ARS2HdmC9RKPabjXSB+XvRNrMrLD/VHg/Rxcu/OoIykzXusC+YbtP0foFaWXHJJNHzl5GOEJSd681QM6l/Ex3EMYDOe+ZwkK0rt4lSNQqszZcCC/D27ebl+mNNzOFS8IeKQw7uzFcjmth0fHDCzJw34SLNZSo1sDHdvJj80ZpbNsoY5TnITMXxAg/w6zUi2PHIFZoxsV1eld38uBqmT/sm6ulYbCp9ZsIuciOJNU8IwxhSpp2zrI/uUaEzniXRrpLbG1DJvxsPklA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TI/WAtjeKFLCCmqxVLUEXZl307gw4PoHwvJF1uN5n8=;
 b=k9T5oC/UlIVVqhW525lTun/vPkVtpa2BDpB+93oXPR8izTlLdcrIO0c36bOLgW2FwXqgXZ4ldG0GjH7I/S6LqyJjqprbyvDyOTuhY8phcV9RkYYQGCHpylKUOUPbfhx1rpAMD022J3zuosw6m7oJzItL9P6hCniDvOstqWsuHPo=
Received: from SJ0PR03CA0171.namprd03.prod.outlook.com (2603:10b6:a03:338::26)
 by IA3PR19MB8664.namprd19.prod.outlook.com (2603:10b6:208:520::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 11:35:27 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::3) by SJ0PR03CA0171.outlook.office365.com
 (2603:10b6:a03:338::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 11:35:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Thu, 18 Dec 2025 11:35:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21D1B406542;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 07822820247;
	Thu, 18 Dec 2025 11:35:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/4] SDCA System Suspend Support
Date: Thu, 18 Dec 2025 11:35:16 +0000
Message-ID: <20251218113520.1287693-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|IA3PR19MB8664:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9c300e4d-45b8-4865-7339-08de3e298a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c7MY9kxb4TL6rVg7voKwCv5hzJs+L6fiUBtMfbrCnuXkwUZUmdaHhVZp05Uw?=
 =?us-ascii?Q?boZrJovcAhftzqPPTrdsGiPyphnYG7TQM+xsKMU4fp5eJBLopREKW6aq8RWz?=
 =?us-ascii?Q?yot0q1n6YF+rRuK3SmHlapYxlomjc21GVDJS3QOkHPc87wLPNRB5h/11ahQd?=
 =?us-ascii?Q?EsykP8ZXM+1XGO/svRBP/7guIDo2P3H5uLGo3LAwXl44SH3nZ8PsPwffsw+3?=
 =?us-ascii?Q?EzO2Uo4T59HBkZQLp4FEWSiZIHC01sJjACZ7sp+vcti+NTNz/DP/mdmCYchM?=
 =?us-ascii?Q?7ARxlHz5tp9nS/tm6CDyGFjnrb2SXNpx/l0N1Bpz7t7+N8ENEAw2fqcOdT7C?=
 =?us-ascii?Q?MFevwVRsQCAY/u4bCGzvfqxNiwUtiMKwoU5bKhb9QRPO0dwKKpzMzfYs6S1a?=
 =?us-ascii?Q?h8O5wFy4Vg0c2jNZ/+bQd0KrM4OxbKltGTUj/IdNK+oHKzdR3SRwgtLqCanK?=
 =?us-ascii?Q?sgU8De9Wr6uqYqmvrJ7KhmuKkQ5wpt7FWXw9qlpWG2nzIwv4J5LH/qawY7uW?=
 =?us-ascii?Q?AJr+2mG8VDfxgFGUWRIrGpA6relUi2IoKSb1WFAXkqD4bcV5eHVPC04PKpap?=
 =?us-ascii?Q?+Pw2MCPiVSdkycj+iMiBjFlf0ySijuDALPXFKkOkGWGYxymSDtC94unF8Roj?=
 =?us-ascii?Q?LHSMi9THTYcDJLdKuWBCa9Uy8VUm4+GXnh4SSBuSa0KQf+JDGt/+qn7lsHw/?=
 =?us-ascii?Q?wE27F5RK899m/pSviWzJHS+JUlYf0vPhwLr3t1iKBy8Wn7hWk2SpULOTOXVg?=
 =?us-ascii?Q?+Wz2rqqWUNwy2jzrw2e1gnfp8rJNnFU5XEGeeVgB1rAxIF7QAO6QLSQQ++cW?=
 =?us-ascii?Q?j9eY+EllVPCBxOyBAxYIF8DhtQ3lXzmsijAxFpjfrot3IswPmycFyDE0kqld?=
 =?us-ascii?Q?aMPc1e9cXmlNn/AkQccvXCKkgWXynkFtX8BHRi4zK/yudw9dt+r8dzTnQ3H5?=
 =?us-ascii?Q?USTHwpJfqQ36NqZlFHR5+LHjuctFwQ4moPa0af1fAhvEsXvHUPnA2YIKuDmW?=
 =?us-ascii?Q?l2MwguMMv20DC7CfTG+Z0eDFYtt2K386poYnzn90Ld0S7UIaqmQ43YD0b4iS?=
 =?us-ascii?Q?9uuPGq+KMJ6qJ1I0yG0nShLl5ZKdDx3ymMWWvkgrvOM+WmH9ElEdVPft7QS2?=
 =?us-ascii?Q?Iv53fwitAd9UNSh1ij0LLbwy3LskaDl7/P6J//A9CY/e41Ddv0Xvxa1XMuQS?=
 =?us-ascii?Q?OOWjo0PlyZ44CFigjVyzpJj9Tst4ELBrO9EO8Z5FE/+Ij9eDmq4XfpMzAUeN?=
 =?us-ascii?Q?eQ06Qiqt9Nz3nuPYpadgtt4dnfmOCbEuyct20z56x57oxA5CXmHDk9v2IyJW?=
 =?us-ascii?Q?aX6zX/gTe9JgR5d+lz3/m0bLyDIgHjQ/jVFjg0O2ryskMsVLNn96rmnHj4nS?=
 =?us-ascii?Q?P1PoVBinmSJ0P7Db0PY7iZrVyFtFcms+MbbL+7KDNQYbutIvyFf6hlfXxcvv?=
 =?us-ascii?Q?CPrtvROm0MrvU+2kcMWowUiVqbZdVTca9jEZ92HbxPbCMxSWWhd9xohFRnwi?=
 =?us-ascii?Q?eI9EzmryNuoQG/E7k8xoGqWvQ3DE+icR6CCuECzi9VICQbo/NM25CzMxJ//+?=
 =?us-ascii?Q?/cPXnEKR2YEhYloouJ4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:35:26.0081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c300e4d-45b8-4865-7339-08de3e298a05
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8664
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=6943e701 cx=c_pps
 a=Uwkc+iahKUE6A/BuLhjHwA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0bSmIU6_SNyXwrq30uIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA5NSBTYWx0ZWRfX+6BuG84gsllB
 CE7Kdj8EbZxYIGbCj4HR9710dtVqL1bDIMi++/I+ynY9xkRDBaTjFGMUgFPyxCqGuZUyAtIE+PI
 SluRxKmrJuzhN6hu24DUcTdvLhAzDLkRoEUOpKRth3CQ7W7n+Fe2SuykE2XMUn4EGdckarDN8+9
 BDn6V4w7hSm+M3U6iUWf2ZNhSadKELrgVCqoQU+ReVMk0465+rn396D0BJid+yDAVnbrDuD8dOw
 aAphbp9MPLBfSVXNUU76Nn29SeUaDvEzIeaMbgruJwGUEdMfBjBxngDm6s3wewZD+F6XmqyPiVB
 NSCHwDVoekIysWt2FMcA2OKGVp631E3ypK1wh24dP6//JARiKN0lzVoc1GabcPmSg2xTicSvlXh
 Yuydg12iQ6BLOr6FujC0XLNzh13+vw==
X-Proofpoint-ORIG-GUID: ARA58t4KB0wCXOu4Sqh8phVuG-FTGW5p
X-Proofpoint-GUID: ARA58t4KB0wCXOu4Sqh8phVuG-FTGW5p
X-Proofpoint-Spam-Reason: safe

Add support for system suspend into the class driver, now split
out into a separate patch chain.

Where we got to on the previous discussion, was we don't currently
have any parts requiring download on runtime resume, doing so
will add noticeable delay to the runtime resume, and we are not
blocking someone from adding support for firmware download on
runtime resume in the future. Also as runtime resume is really
a kernel concept and power rails are primarily controlled by
ACPI it is quite unlikely anyone will actually power down the
part on a runtime suspend anyway. So this version of the chain
still only downloads firmware on probe and system resume.

Thanks,
Charles

Changes since v1:
 - Update SDCA IRQ enable/disable API to be more clear.

Charles Keepax (4):
  ASoC: SDCA: Add SDCA IRQ enable/disable helpers
  ASoC: SDCA: Add basic system suspend support
  ASoC: SDCA: Device boot into the system suspend process
  ASoC: SDCA: Add lock to serialise the Function initialisation

 include/sound/sdca_interrupts.h      |   7 ++
 sound/soc/sdca/sdca_class.c          |  34 ++++++++
 sound/soc/sdca/sdca_class.h          |   2 +
 sound/soc/sdca/sdca_class_function.c | 117 ++++++++++++++++++++++-----
 sound/soc/sdca/sdca_interrupts.c     |  89 ++++++++++++++++++--
 5 files changed, 223 insertions(+), 26 deletions(-)

-- 
2.47.3

