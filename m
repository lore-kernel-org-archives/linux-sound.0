Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0030D279338
	for <linux-sound@vger.kernel.org>; Tue, 29 Apr 2025 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745919597; cv=fail; b=oj3H/gX5ev4PU7ioleuwxA0oHqecz/TYz1Rf7Dcb/XnIiPUb0ylEeom3WBsTYCcJ4BqWlEaYbYynEUO/L2IACxn6bCFWNdwk3nD7QcOuWZcEZZJs978Ntpczsc7WYgp0Rvfv3IWOv2F4ffvEcqvF3AHpCWELle0R2GyrK2xV8pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745919597; c=relaxed/simple;
	bh=aMn6k/S2uyRucbvgg0hy3d8stxj01qknSDlG1FaNzDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PD7Ks4ojlHcbhvaev5VJN2zw88K2vJYpV2FlOLVdCa5YxVi4lJvDkWu286uJuLVptmSgR4h9MEd0KPO4XSQUY68NPGmpF+rsyQzI7q8WhNvLx0QWaAeMqIuacUVoTsk/s8iPAInQzMYQTGFSl9xSEodkTkJHXieJpV/lEVMvTLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qLmaYBq7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DvJdDzmE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qLmaYBq7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DvJdDzmE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T60TcS012706;
	Tue, 29 Apr 2025 04:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ynkgl1feq2h/K7aZ
	KNo3+xx5hidmyZuBsQfSWRaWIDc=; b=qLmaYBq7JoYTiX1gi1OJafqcvZ1jFGWX
	ymGV11qxdLHJY5X7eHXjVHhsVoe6O1i6y2PNArJF/mfB57PORTdPfpeodiMFuwIu
	nH8i4MtlVpCAI5NxOKXHBEKY12oYZDv0eJ1tXCSsgNOBCvd3TelVBlix0OJ4488G
	cfsEg+vz15zSn0OPw0dHy/lzC/fiwmXUSpKDGF8QY40eev4wVe2q0sRZo5lbVhmv
	0Ts3wZOdW58wC4gK+yLq1MvXoe6ypi/5PTEBbJkePVAf86M839KKbJCuU8RDU5sK
	EE5KXTT79FhU3KuinvZGp/MDIxDhrGUNC0Ww8XQS8K0Rq3lYooYP9Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46ae7cgv63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 04:39:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3522HpLnrYXcpAOgtdhhg7gtDsR9FzNOzSgq6AimEs/E6jdqDBqF/DiFROBiD54p5b5MSLAZFn4vMH9b+5q2kTuMEcHIuMbavYypT/zpEbCEZOkOZad8//sziYUBqqv6Y3/ZBzsHogvKqa9kyOdwWE7gMk77jEfSzkHX5vrq58h1renBb79xr11Nj3CXFo/pjyQ3eOkGTniBVJsl3PXh7pVQUSrB2XtV8w1oBRBf6Xi0mveacxR/E3Wuhwhnfho/GdqRXtflMCezRVzq6H5KcJhd/3YYaKuXU9mzHv5aywVHXbnx3NZnE1GtS8xNXDJ+l7XU5+jNrF/5G2lec+qGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynkgl1feq2h/K7aZKNo3+xx5hidmyZuBsQfSWRaWIDc=;
 b=Nu0AfFzN4Uqvx1sKQOYNmtbpS2RMq39Ut25qnoduxXY5OLwTWi5f4/6Nax6SvB3JdIZUGihtqhAluv5qGlKXrKNojvKxDxd5hFSX3kO6NBiaW8y4e1Sq4TAp+WliCJvoWK/Z2j/ucdEUcGN1dhUK/4COg0hyssEb4rlpMdv9RbsmsYmADJ2waA65bDt46ABrxEI5QYCdWWeQFqCryZkQZMmW24hn/VD03x/yUXWzxsWgJW6wGLsM6o6jvIqqHUY0GwcXQRhCb3p8p1rcg2Fa0v4RaLDCGoG9oqdsuIItEKf5ZJP104u+P3rhQ+Jexf93zI76adhHA2AFhm7yepXEvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynkgl1feq2h/K7aZKNo3+xx5hidmyZuBsQfSWRaWIDc=;
 b=DvJdDzmES8vBJ/BmXZyJv3nCwZayCJFLB2QgnhB3BevxgxSc3FZpMW9RgJCBAW5Z1QpZF9HEg+z2i/m8YUpVfKrW7puFnv4496RDEJzMywJ5nzzGAJsxlK5QfmDxnTjrt5wc2VpqPHt483MnN1TtVqkmCy5FOtzhz4BBi76AvQg=
Received: from BY5PR17CA0028.namprd17.prod.outlook.com (2603:10b6:a03:1b8::41)
 by MW4PR19MB6934.namprd19.prod.outlook.com (2603:10b6:303:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 09:39:35 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::6) by BY5PR17CA0028.outlook.office365.com
 (2603:10b6:a03:1b8::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 09:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Tue, 29 Apr 2025 09:39:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4460C406543;
	Tue, 29 Apr 2025 09:39:31 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 202D3820244;
	Tue, 29 Apr 2025 09:39:31 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: sdw_utils: Remove num_platforms from simple DAI helper
Date: Tue, 29 Apr 2025 10:39:30 +0100
Message-Id: <20250429093931.343725-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|MW4PR19MB6934:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3e8ebdde-8bc7-4977-6389-08dd8701bfa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9HN2GIJfG5WCPevknQClYF59aQqPOwQZclr/o133a5e8Ap/7xzJcOCZewpvI?=
 =?us-ascii?Q?PpFqnVxwqZiILu8bDvKTyhEYO+kEEC4SN+6nxjh06eW5QYB4ghmknzlEMMsz?=
 =?us-ascii?Q?LMWJwAp2yEOLg9njKTauXzBsOpLrYoxmHiNXVkaI8qodbAvwho8yPs3qdsms?=
 =?us-ascii?Q?zWOAw+Re5sKxIlSfSVWLuLnaFEGydemTUBmJ1Y8sbelGJJv4XXA+iNFyjhh0?=
 =?us-ascii?Q?rJjFDbjbu7rCA/DjHrKHHY2+x+SC/vhIyQ3FbJRMLtE76aMF5xB5HhJ/HbBD?=
 =?us-ascii?Q?pY2vP2BtXv+RgUUkaw8PSE2iSFhHQrkvu09j9DWv2kTBr4OmUo8Y5kt7djjl?=
 =?us-ascii?Q?WYlZ4B0PVnvnI95pvX+F06LHr82RRTja/Ze41uzYIfuGi/NDAs3w1jYr8FTw?=
 =?us-ascii?Q?q05AXLvGuceZ+u7dJn6BFqvF+77qRhTam1FFf3Ld8kDpOL8ymsE8sjcCmBe/?=
 =?us-ascii?Q?bUMMqgWDkifYqXqd3ZYmLi4jtspagXkNObrGgewYyPQXQl5jmQghrFtoI5yM?=
 =?us-ascii?Q?bmUr/Ssps+8RQVO25vw2pTXPc4QJU63EkLaU23G+OgVNw4H+rvNW7vff4jPQ?=
 =?us-ascii?Q?MjOE3hznYWgsVNUdZR7JfCpjjdfKeirXSs558OsU2rzlpjJB9mn6uj/Q9Lsy?=
 =?us-ascii?Q?QlQ09rOn3ThvF7sOpa8Il8ZMJWN8lsV1GRXTBhNP1XE+BAo84mvxPXmbll9B?=
 =?us-ascii?Q?v8bI7pdOSqJ1Fmz7GDYm+QTo2UikE5xgJQ0PFOZhAxDcLcMZROo9pNfUnfji?=
 =?us-ascii?Q?IDCOxWHp4UHtz8jtAEsvmPcYMUkhlXtCW0FlWd7fZhiRMKkKDjMRr5LvYDFQ?=
 =?us-ascii?Q?LsecELLbhj+5Zd4ymTkqZIHuzzwpyI2SHaLNq4fQ2lUsS6LEwEZp52r14Zmy?=
 =?us-ascii?Q?5/vzcEYWyjEBHyuds7+w2coUwmvM4B4oHiXA11iSHf3FNM56P9GQlcZqU34c?=
 =?us-ascii?Q?v2DOCWSBSivunQd+rPO/94QqH7wQi+8vxcf2lIYkoDE9cZFYXfROXrZx5HyI?=
 =?us-ascii?Q?LWMsL3fjxVvrkDzW4IZgTy+zv8tl9VueVF9bdSB6e41SRw+XSr1kItGzAUi9?=
 =?us-ascii?Q?5vsSVHOfgHkaPW3tiZabkXVc8AljnfF0IwpSXYLqkuLdUdfMSwwCWh53oa5Y?=
 =?us-ascii?Q?+brKSxsvuglJbfG2xGEqJ3PyE6ikLJv1+UzhXpQXiDiuoIUTXAzpBynDZ3gs?=
 =?us-ascii?Q?3nayRO6CGnruAoLYQLH4AX+q3Wm1j63FEMSS0MnjkQhVyO6eEyA8B3LsFvUj?=
 =?us-ascii?Q?d3QMqeL0BaxHaQLN1rmTywaAPJkwJyer4WlC6YNm/cMXf8WoFsHbV5OXFxAU?=
 =?us-ascii?Q?3FpQxtI7/5MPjqQCz+HKh/l9B3Zw//wR9hOes+CaiOttWBMiRW0fZYHAgJDo?=
 =?us-ascii?Q?tG71+9I8kzef4X+8Q1yPsOy0osSlZJoLIo807d6DWFoDSsLV9dhwRWhyxdbU?=
 =?us-ascii?Q?Gsjoz73Q7eCOobcuM/BHxZJHmCmCO14Ny8dxzTFVW2lbm6yiKp93LqVeU7CS?=
 =?us-ascii?Q?j0moTRf/8Ap4t0r1lq79Yqyr7bXG8Aoc5dTE?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 09:39:33.3023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8ebdde-8bc7-4977-6389-08dd8701bfa3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6934
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3MSBTYWx0ZWRfXy6NnnE+iHOBv t5IyjTD1CZxsyADedhYB73THJdvSxB5bfdlB38qgcliOnS2a8gXjHjshXpo/XgvJa/ZzBNsc2fi dhK70Rdx5zwy78N3B8pjhBDypzZWU8iJo+xhjb2k7jPUuoU9+1ZdvgfPp21hX3oXxGGaaqTNadw
 ANkdCpmTP4psjhqBzRtboEt8NGW1NVnNDf6Q1hqy5TA6TaHI3RrOm/u25VvPMXIzNylxAi25wfx jbFj35KaY/gNl+geuWWlx5vZu3KDbknPyS6f+korbjqr1ZQ4bzeNdC5wQAJ1OM0chwfRjIpDJdL ZkFmFK3vfSPqa+SwnysJxkKQVhKYKPKHgMocYlnW6tUJoHnwx3k7VgudaGaIrYThcBeO9EaX+5+
 wCT4CbM0n15YJTj59dnYWWQFK2G9/WASknvzJyy5J8quVGdguQsMwMQOa/QCLf81Xmj7Yjy2
X-Authority-Analysis: v=2.4 cv=DotW+H/+ c=1 sm=1 tr=0 ts=68109e5b cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=98xO0Hqg-jp0wvTIZKsA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: 7yPm_MTjc1lYQJ2xnu5PxFJJmEZF6QIy
X-Proofpoint-ORIG-GUID: 7yPm_MTjc1lYQJ2xnu5PxFJJmEZF6QIy
X-Proofpoint-Spam-Reason: safe

There is no point in passing num_platforms into
asoc_sdw_init_simple_dai_link(). Firstly, as a single pointer for the
component name is passed in only a single string can be passed and
secondly if it is a complex DAI with multiple platforms it would make
more sense to use asoc_sdw_init_dai_link().

Fixes: 59f8b622d52e ("ASoC: intel/sdw_utils: refactor init_dai_link() and init_simple_dai_link()")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc_sdw_utils.h           | 5 ++---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 1 -
 sound/soc/intel/boards/sof_sdw.c        | 7 +------
 sound/soc/sdw_utils/soc_sdw_utils.c     | 9 ++++-----
 5 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 36a4a1e1d8ca..64fee97efbaf 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -159,9 +159,8 @@ void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_lin
 int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 				  int *be_id, char *name, int playback, int capture,
 				  const char *cpu_dai_name, const char *platform_comp_name,
-				  int num_platforms, const char *codec_name,
-				  const char *codec_dai_name, int no_pcm,
-				  int (*init)(struct snd_soc_pcm_runtime *rtd),
+				  const char *codec_name, const char *codec_dai_name,
+				  int no_pcm, int (*init)(struct snd_soc_pcm_runtime *rtd),
 				  const struct snd_soc_ops *ops);
 
 int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends);
diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 2020c5cfb3d5..0bb06cb7d0f9 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -321,7 +321,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	*be_id = ACP_DMIC_BE_ID;
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "acp-dmic-codec",
 					    0, 1, // DMIC only supports capture
-					    pdm_cpu->name, pdm_platform->name, 1,
+					    pdm_cpu->name, pdm_platform->name,
 					    "dmic-codec.0", "dmic-hifi", no_pcm,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index c09b1f118a6c..2141ccb8329d 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -245,7 +245,6 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "acp-dmic-codec",
 					    0, 1, // DMIC only supports capture
 					    "acp-sof-dmic", platform_component->name,
-					    ARRAY_SIZE(platform_component),
 					    "dmic-codec", "dmic-hifi", no_pcm,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 095d08b3fc82..29b813943ccc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -994,8 +994,7 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 
 		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 						    playback, capture, cpu_dai_name,
-						    platform_component->name,
-						    ARRAY_SIZE(platform_component), codec_name,
+						    platform_component->name, codec_name,
 						    ssp_info->dais[0].dai_name, 1, NULL,
 						    ssp_info->ops);
 		if (ret)
@@ -1020,7 +1019,6 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
 					    0, 1, // DMIC only supports capture
 					    "DMIC01 Pin", platform_component->name,
-					    ARRAY_SIZE(platform_component),
 					    "dmic-codec", "dmic-hifi", 1,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
@@ -1031,7 +1029,6 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
 					    0, 1, // DMIC only supports capture
 					    "DMIC16k Pin", platform_component->name,
-					    ARRAY_SIZE(platform_component),
 					    "dmic-codec", "dmic-hifi", 1,
 					    /* don't call asoc_sdw_dmic_init() twice */
 					    NULL, NULL);
@@ -1075,7 +1072,6 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 						    1, 0, // HDMI only supports playback
 						    cpu_dai_name, platform_component->name,
-						    ARRAY_SIZE(platform_component),
 						    codec_name, codec_dai_name, 1,
 						    i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
 		if (ret)
@@ -1102,7 +1098,6 @@ static int create_bt_dailinks(struct snd_soc_card *card,
 
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 					    1, 1, cpu_dai_name, platform_component->name,
-					    ARRAY_SIZE(platform_component),
 					    snd_soc_dummy_dlc.name, snd_soc_dummy_dlc.dai_name,
 					    1, NULL, NULL);
 	if (ret)
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 60b731673f3b..30f84f4e7637 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1067,9 +1067,8 @@ EXPORT_SYMBOL_NS(asoc_sdw_init_dai_link, "SND_SOC_SDW_UTILS");
 int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 				  int *be_id, char *name, int playback, int capture,
 				  const char *cpu_dai_name, const char *platform_comp_name,
-				  int num_platforms, const char *codec_name,
-				  const char *codec_dai_name, int no_pcm,
-				  int (*init)(struct snd_soc_pcm_runtime *rtd),
+				  const char *codec_name, const char *codec_dai_name,
+				  int no_pcm, int (*init)(struct snd_soc_pcm_runtime *rtd),
 				  const struct snd_soc_ops *ops)
 {
 	struct snd_soc_dai_link_component *dlc;
@@ -1086,8 +1085,8 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 	dlc[2].dai_name = codec_dai_name;
 
 	asoc_sdw_init_dai_link(dev, dai_links, be_id, name, playback, capture,
-			       &dlc[0], 1, &dlc[1], num_platforms,
-			       &dlc[2], 1, no_pcm, init, ops);
+			       &dlc[0], 1, &dlc[1], 1, &dlc[2], 1,
+			       no_pcm, init, ops);
 
 	return 0;
 }
-- 
2.39.5

