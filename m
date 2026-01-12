Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94D27A123;
	Mon, 12 Jan 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226890; cv=fail; b=LULM/YOPhHRS12AUHRcVNqndN3aIpkysFUvL34lh26+G1sG4s4rzqIfkV3d79CbYTdBXJah4MvK7U6DgBcNE9v+6+2vHI5Nwbl30Wl6JltkhRMJuxt6/vgmPmY3OE+uIYXOkXCmKJYfaAj7TaUDxBWN7IyiLNjLbc2fiNdPd0Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226890; c=relaxed/simple;
	bh=VHJtWR2ExSBxYcT9ko2MKG4MvtyNticqyetM6nT3UeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kWgbfuwnUOLw0yEJRIBptrddfuHRtKk5BunpXLMvRJ4TvivL6OFqEUK/qX2DnOfGjjG+3oK3CgIk5QJ+bjYjrwAF/2XPYWYHjXifrkmGRPiVqGCdhJQqVqzK7CbbCnyqiqObmL0lYTT5uVhK1HkPXxsjgEcGggah+SNhJLaRbqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Lkk2WpBe; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=snBgz9y/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Lkk2WpBe";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="snBgz9y/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C6j70O2227961;
	Mon, 12 Jan 2026 08:08:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=okUSi1ICTzOt2PP6
	AgQPR/EQ0qad/B/Ias15m5MNods=; b=Lkk2WpBe5aO/sNoRcXUiHQQeXEwKX069
	nMNlIR+39QWr6rDS3PsCFBdkWUtvs087rtKTOJu425OztvEUoo3TG3+SKzi34LCr
	pw4N/RPmq11FvgES9Wn1TpG/K43eU9MLc8yrFMK6RU0fHTejpdcRTX7x2h8fOeLZ
	LADPh2PVO4gh573jMpkRndJTgUhMa0jh5KTI2y1b2qze0pOpgSYVp2049uvUKd9Z
	geNmdfURnxnjsd9PlpONq1kLdNp1estE2eF5uOquk6KvvBWZDfsFYjmMhVeeCFD0
	CTSupy7yXuFNolhCJlNqTQoV+1EbiGJYdBxtaD/B3FbSD3/7Qdwf3w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020133.outbound.protection.outlook.com [52.101.201.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn201pgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 08:08:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL8mBkbm4nJmFGYwtHsGvjkpG+JoV06iBEpA+NzVaQJCiOluQa9mga8KkEsJMSbytetRQXWtXZl9kWYHrvMqs/aVjuo+kSeF30yGHdh2yUS13K+RYM2Ah87rZaKGsVPBC0loHAHQaasBmmp4unLvJ4prECsSY4MwSFrRklPsztMqqQ8GaB0u1DrUw5mC3+d9tv7ixwv5STam3jmqs1PpVw/mssbC0fAMe76enA2Kg/TOxqyhDBj5wLXPcuAbViSRWALLQM53euyW87i8VFBcQzaX8ulzpO1eUPbrUQgs10K5Mc5ca5k0B6vEuSPw4bsei3GxQpqZzKtqLenSBdYd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okUSi1ICTzOt2PP6AgQPR/EQ0qad/B/Ias15m5MNods=;
 b=yg+tn+kTcSu5rdnuS9d2zDwzbD+fcv62O7UNYEde4YStIZLIeiNXi5SGYu2LnhSTbu3+Cwar7Gkuerrsfigf/isgvJmTDJCVJwy+eqtKCIwEJU+m1hIjH40So6YAF8bVmfBVusVOZ7GvV2zUg4f95ul7C+BGgmI+KNROXOWGzaKW8sj7AOksClFoFou2vMNRVa2EyIF1tOfTVkM9kQ6nWtxI3WVWHvgI6R9qcsIyNFV0A46iFr01HmVSWpQ45rbianKzB3/awIK6CdAghCQ99fzHoADSnYkZ/r1OlNkF0huKrwlnV6AHYtXOETkpi4ZgTDlZ9+F0oDmt4zSNlGFFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okUSi1ICTzOt2PP6AgQPR/EQ0qad/B/Ias15m5MNods=;
 b=snBgz9y/4Md5+iVosyTW6mzW31+aoO8Z1I+5ZngvE/QYjj8oiKif5yzoixfmh3hZUSoK3XTg1M6PzogJQkzso1x+qwJwCG3+2/87KjFlghCyZcISDCkxs5N1ynBZwKbmvuSib+G9o1sZq0ViI1tfzDNMZNrtgiCpEcbGW4emblk=
Received: from BN9PR03CA0723.namprd03.prod.outlook.com (2603:10b6:408:110::8)
 by LV3PR19MB8581.namprd19.prod.outlook.com (2603:10b6:408:270::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:08:01 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::a8) by BN9PR03CA0723.outlook.office365.com
 (2603:10b6:408:110::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 14:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.0
 via Frontend Transport; Mon, 12 Jan 2026 14:07:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 69DE340654A;
	Mon, 12 Jan 2026 14:07:58 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 52363820247;
	Mon, 12 Jan 2026 14:07:58 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: Fix sdw_utils calling wrong codec init callbacks
Date: Mon, 12 Jan 2026 14:07:55 +0000
Message-ID: <20260112140758.215799-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|LV3PR19MB8581:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b9793ab-20aa-47de-feb7-08de51e3fe16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4gsAKW2n87I0rqf2g9m94qvUBh2Vt2DrPgyK0P+6IpjoFQfs/gcUu6sOjAZ8?=
 =?us-ascii?Q?niNTKZk7TLpjDMJuSK/sQzSsyAWwg/IBXr2fo+DYVzxv4747UMdlm/8YsI4i?=
 =?us-ascii?Q?DZfvmsydcEeNqdgmD0JVwpybJWCSFxgINiXW3HSkkjC7u7RRkKAdqX3htcy6?=
 =?us-ascii?Q?fO7c/5/GQf7pEWO+r8V8QGw6Rq+/VzFmvOvOy1hgcvjWq6R8gZfN/KB40Frh?=
 =?us-ascii?Q?7/tvNae/VJVHlugfijyH7FED9DXycEVSj6RH9bJONyKebiLPlsD+wUICEnck?=
 =?us-ascii?Q?uCl4Y22kLqChhAk8jwYSJjvAuHH8OLLxJj5NEE/hpMx8obrpBSedTbCr6mg/?=
 =?us-ascii?Q?GPO2RRe0oznQ5ZCqQAe44K/WGSduZ+262ex4N0FHC5Qn6JZu48exhZaP4rS/?=
 =?us-ascii?Q?dq0hEGAJhToI3wA0JH5VrTOYPNGfZ01kWjJY1DT0dd/7wACaBLbqIi9xaDNL?=
 =?us-ascii?Q?EVTlinUoaH6lk1uNRWALoDUeBbrhH/SWjMkWOeCn7WjmwsIfFPFoN++4YICV?=
 =?us-ascii?Q?4d/4wRKxNx7i1j9a/4I7fnmxtiWc/HiaMsXo/eLnwFJv3fdGkIDz9yP83bl7?=
 =?us-ascii?Q?j3Zyza8UP9B7La7Axx/JM7wdTE8Ec62Cl2ZLNJM1CsVLdCXKDbmFn7/6n8N1?=
 =?us-ascii?Q?/FBSFblypfi1PvLKTk1TsCTHgSkgA+S+FPLn4IYKG/x0FMXiOkd5Y9bSXkt+?=
 =?us-ascii?Q?LS8MzhGdO4ZKORn7Eejk6wnQPYL6KmikaPqI/p+KOVdZtIcvBy7wTK7/02i2?=
 =?us-ascii?Q?d5ZIpo+8t4Napay1M4/ra0sDCvHa+Vnqpcs3M6uzvSBRZkPqpmjkGWYvHbRH?=
 =?us-ascii?Q?Y2TwveqrdICooUaq205tkfcaTmOGTovGD2wdGfePGJqwBgXGO+83iKt+9udp?=
 =?us-ascii?Q?mgVcoAP3NebyOV7yWjmUtFXLVLIL4alAJKG0MtiutTyvfc3dSJQ8gQrOoksa?=
 =?us-ascii?Q?LTuZeiustdIycO6yfokjYY93wxUEETG2rkyy7HnVte5G2EVXwMbRXhGcC7WF?=
 =?us-ascii?Q?W2qq5H/vwsynZnsBqHpSRGtU4NhwvS42xr+vD0RadgInqW0IxlGv8kJxecns?=
 =?us-ascii?Q?1Tah/Cy83qfj+8Stuij/675LWtyOTLYSKpWHaLBaVrrGdJ+96gs5KmI2M2xd?=
 =?us-ascii?Q?uTXiQk4PDAyZ6641osxHouRJl1MRzjdHhEZyo0qAdaMgDN2mzx7kXZvMIYwp?=
 =?us-ascii?Q?w6+ZLME/barmOspyM253+QpQ3VKl6N4D8B8PEzXJn01Zm7tLJ7w1m4HKnRKp?=
 =?us-ascii?Q?5UQmhryu4yWi/zmB+Z1WoGs+4oWWmF8NL6IHCmLZUxSkyUkPUwCFDVy1dFsF?=
 =?us-ascii?Q?z/GbynypJXzaiVTbtfJWoRR1lSVLiox6jZ5cw6Vv+2PCrRPI+lDefY94QJkw?=
 =?us-ascii?Q?y5SH3ksFBUHqIaBo0NjX9TnvYk0ZJ4kpUrMt1FiysXXeW+0TSvkzgdcW+n3R?=
 =?us-ascii?Q?kY3zO0Age5V3VuAoDY42fc49EfaL8pAQ5V5lafrwS6efzACaDUgQ5OaQb2x7?=
 =?us-ascii?Q?/edb1VGEQEcQlhd6mJ+yCSjqVi6bY4g9pU3kNUBb86UxAGFM7VBmaSdV7tsq?=
 =?us-ascii?Q?ZDngtDgoebNHKfUvIms=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:07:59.3407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9793ab-20aa-47de-feb7-08de51e3fe16
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8581
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDExNCBTYWx0ZWRfX0LnXzkDrnR9b
 gE8vuk7YLj5GG5jOieMjGSxYdqCkA6UiT31AsZf4S9baIhXyxmwkaDaJLwOtTUSPwi9wGUyfcWK
 VHf2sDaAWlbPNuEadseaWSQcrXe0zPQyY4+hk9KluMg070TeuCOnvyRmdp6Sw5cuwmaE1U+7OAG
 I0EbAGs9F98k0vmG1OzS9LcFSgHAYYEm85fM1UAaJO12cUptFtlBnj/3ZHiTBAT8L4LbsV5wQLe
 9GuR61wziyA+h6y6WEOh/WUF2/CkcgXVEFIFvgC0rAHwPnLiUa6OeN5B57er/ksXyeaOwWXUbA3
 LbNcD84J4AlFV1O4cqXeqlvZVEwSHKbT+G+gr7g+Au9IxHF9+zUAmXRVtETBERS2nG9SrE+2VF9
 9SfBSc6zafc7mcwKEF7dO8UVUyRwFSGK++1hDWnbMi+dCnHhBfCO7oO9Sgxf4+Om9IL3uU8DlUR
 pBDSt+zGEVxbDGWFf9Q==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=69650044 cx=c_pps
 a=jUwHYlc/2yWvgdYQnTyS2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=h4j_YMugpKLE-fttdj0A:9
X-Proofpoint-GUID: x5DLpTV8eFETwgwJVcjOYdj1w3H7A_fV
X-Proofpoint-ORIG-GUID: x5DLpTV8eFETwgwJVcjOYdj1w3H7A_fV
X-Proofpoint-Spam-Reason: safe

This series fixes a problem with soc_sdw_utils.c calling the wrong
codec init callbacks, because it assumed that the DAI name could be
used to uniquely identify the codec. This isn't the case, especially
on SDCA which is a generic driver for many parts.

The second patch is the actual fix.
The first patch is needed to add a missing export to SoundWire core.

Richard Fitzgerald (2):
  soundwire: Add missing EXPORT for sdw_slave_type
  ASoC: sdw_utils: Call init callbacks on the correct codec DAI

 drivers/soundwire/slave.c           |  1 +
 sound/soc/sdw_utils/soc_sdw_utils.c | 43 ++++++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

-- 
2.47.3

