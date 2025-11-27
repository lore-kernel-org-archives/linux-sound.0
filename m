Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B441B79DA;
	Thu, 27 Nov 2025 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764240003; cv=fail; b=k/QZTKjuV+2EOArFyVqz7a2r6iGo3CG2WpOQphtj0ezzDnf0nJarPB4GI4N3jjqopweihQmU5ijl9QUPxFo9+emVUUBAIbSOHQ3nWoFQfoU956Reo5CgLV8gGSo2/XYXyB/NkWEPIcp12eYARxQo2B0whS5z6bJIcTQtq9RRt2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764240003; c=relaxed/simple;
	bh=0SHMDFKLf3nIvWlJiLg+51vgEkbDgC22YYPiFSe1VYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jdVWRxCdLJ6/V34oBtgkaSXsjFcZj7neOIOx+AhT1XxS81hkuUmMP316FGLhL4ENgxsWzrxR8h+n1RdNPNfZgcN5OEO52/i6JCLG2/vqjNhXsprX89Ub4lnMDLlzHu6YJU4t/L3hMbUuHIqDwbt2yMbKYmC09zk0TdWx9EZfUo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UpMmzmD6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MP2o+8HR; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UpMmzmD6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MP2o+8HR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5NWP8122994;
	Thu, 27 Nov 2025 04:39:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=LpVLaqmpWJ9lEkd6
	g0rdCMZbfIAw4ebS+k2rCuz7SMg=; b=UpMmzmD6ZrTKQNupnJQSYQiUE2t4T0FL
	xXtHoftF54FXJcpcJsa8Kj9ODNSc3+X4dyyjcf0LD5w5dWJx0CwUSvWTuS+UMq6Q
	fm2jY6Qu8zjNXguxc5+WsUEO9p+hr+EyH9SLj+LBz+ECyly8fYPChCEpknsAnwQ1
	oe17wRU5tjkWj3LOY5QfAVx6tzWAADqn69hsz5BRkK29p3ZgtjVZu8DEjZhTMIc4
	xhfvPuXhKBHcOhormpCxTq+D6bs+mK97LahfdkgA3HSTaWPuonEZ0j9LGZ3PMb5w
	fHF/AnDIFwWqQMzhOGzPSiasyMBvBiM9C91iPBzlwIqHu+jcTZM9HQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020142.outbound.protection.outlook.com [52.101.46.142])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4anjw5j23r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 04:39:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYgduHMuZyZnE8MevNKcN9PHto2pFVHfDWjlO9s31NGp1g5CZDBgt/R7jmuKs7shQHgkMYLUieziO1Su+6h7MuRavxcwXcZagAIuLqehzt6/KG8lwSVf4qZKPsxx0V4Pz3O0nEEZjWNl0HQCo8MdgZu5lt+8tVDU0oNJxoeqPl+CFFbTsqp1Y0IIEUgKmNbDhrXKP5otgw31mZR8fNXqyvYWL5E6mpglaIFqE40RMo9b8n3Nl4a/CjhxkZxQXiF6ynmaYgu0TiRCEDFNnIAbpY1lgnWfDG8ymi02aFAiDwVFdSWgrApCxE0Fs+mXoEpqkmsdTW6YIoWnG4AdmFdxvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpVLaqmpWJ9lEkd6g0rdCMZbfIAw4ebS+k2rCuz7SMg=;
 b=tGdtf2pwcNrggIUrPPS063l2UPj0LsKwU4gQ8H2Io05szgISYQ7sObrlAkdoD4yxrDDRXrUmn2XFBTbFyBFo1IkGEEyxXfR/y4MoeoYTgxXXJ+NCfs/NE7mpeeknYlELiXTdB7JoFMl7A5wx5OJzs9UTpv/shzu2CnKi4gw5phzdUBOKhisnPFvQ12awAqywI1ky9bm18jIBzWK9I7RS2b8Q4uNATCxxVZClEg7T5Aa0azgmxQzAzCBCt4smdlqQlF4ssg2/ayqPz9wE9Lp3Ti1nLyLltdQItz6Eg/QE2jMNCNvg15pllO7XyOVb7PiRq0T4lhXfqAYmMDwTkMq1uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LpVLaqmpWJ9lEkd6g0rdCMZbfIAw4ebS+k2rCuz7SMg=;
 b=MP2o+8HRy+kJ6YfjX6yfgEOdkU7L1h2cuPSIoohvIyFnbdwT98hem3QeYJOUHCTQFHjdq22Ezx89UeNbYAL9o/LscCDNyuKMxBymp4jEoa0PY+apxvDaza6U6JSlGMHI7VkDxIiNbEk0g9KEBC7gWlzzqPP4pKyO0naVyvvN/gE=
Received: from DM6PR07CA0129.namprd07.prod.outlook.com (2603:10b6:5:330::23)
 by CH2PR19MB3781.namprd19.prod.outlook.com (2603:10b6:610:a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 10:39:49 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::8) by DM6PR07CA0129.outlook.office365.com
 (2603:10b6:5:330::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Thu,
 27 Nov 2025 10:39:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 10:39:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8A88D406541;
	Thu, 27 Nov 2025 10:39:47 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 68BE382024D;
	Thu, 27 Nov 2025 10:39:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] firmware: cs_dsp: Use kvzalloc() to allocate control caches
Date: Thu, 27 Nov 2025 10:39:47 +0000
Message-ID: <20251127103947.1094934-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH2PR19MB3781:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6bace0dd-5d75-483a-1ef1-08de2da14a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n5mkBbvOFqmkR4ZYWkGuW2C+ZJaPlmkvS69a3ZymR0zhDRBY42DeNCc/kcH8?=
 =?us-ascii?Q?hQaQAWphYQMIredluwXhf+evYMzXEfOakUqJdPEHzHzcEXNqqAIMGQqQvD+i?=
 =?us-ascii?Q?V/2RcYahcILl3c/nRVQ88JwcCkIQagaGTIYtS8KYgFeGjl8HdNkl2V4amdDf?=
 =?us-ascii?Q?/OkYY5Lp+R+lHcrTh33VckQrzDDl+pbfyyPsnYYDDQzK1yJlE26a6WgeWjZ5?=
 =?us-ascii?Q?PRj/RIYClkYN0HciP3dXTPgGI2xPnGItykYo1dzO8r7mNxJzbdeGQZd/ZMxy?=
 =?us-ascii?Q?EH+oFb0xB/p5MNthCCnXh4Ev/uEmyesDb3p0bPe7d0dcFXidHa2RKUO1wtcr?=
 =?us-ascii?Q?dSHrv4CrOqC7nmHuivP68BqqmdfSd4R+zHKamMwnsR0HwyJlNUV7pbwFljmJ?=
 =?us-ascii?Q?7xDQa1ikAm2SUTFRIZYX4gN/U7OX5xRYVD9ghM96bwt0HH/k5mvTMReSYYm1?=
 =?us-ascii?Q?PcOVfMBBWLdSbC2gKww84csEWLzUFDTRhdjlGi9tBvAKBTBTL0WB45lktQ7B?=
 =?us-ascii?Q?K9yFsc1hVbCt4G2m4jjASPz0eXO74pak4qCNvl9cKMqfIAz76JlhkQ9yq0qv?=
 =?us-ascii?Q?YtxqHs/WMv66lAjPi8XoQSgWsb+Q0nseNw9MgraxYg1UQy8Qd58wLflgjelt?=
 =?us-ascii?Q?D7RTpwmIUYAJsKkdTMd2AN76L+I3sb910nEB83Qg/HtgpgyGe0mh5u7Pj5Yj?=
 =?us-ascii?Q?/DZvm/Hw7t6jNi3fhuKIn3dxLYxgyx+GnDGzZrU1rZSKwCX3dX2U40D0NMeo?=
 =?us-ascii?Q?ZBhPdvHhU72i7y4XVti7O8iNRbossVqqLpe+vuJXYRRMWQ10pUx5IHu+ArXB?=
 =?us-ascii?Q?Li++iw1EXnOS+LeFYHLdLb9U7T2MonlsgzmxqA1tb7KOyrmuiawQ5nyW4jBA?=
 =?us-ascii?Q?Xqb8JTXJGOuurinNPa/jDgDucazGn1cM4dvdBbdG4uOYbRBjn4PFM+CDGUIk?=
 =?us-ascii?Q?O3D5toPonXy8zAyFHvAC3CWJVvAXc50EAhi+khKriHSaoiZ0qPULDYaOrA8Q?=
 =?us-ascii?Q?Tu45Sub2KLt18Kwqpf/OneNvnsEdNYshV2VCh2zb+AnGd3/jBAebMFkQ1hUe?=
 =?us-ascii?Q?Er+qszgAigW2XHgI+cjs1/reKcsHaqst/Fh/kE1XN5I+Kb7s2guWFnMSuIif?=
 =?us-ascii?Q?OZB+G1YP5l6Ycm3hUbYraQmGrguK0MAYP4gqTDF1F5GryNVjE+LTJaUte4vn?=
 =?us-ascii?Q?/3TcSYiPT0qMz0kxAu5EjZDEse7OhNDkvlKna91s9hPTgmcm5qUEeSOSfoFS?=
 =?us-ascii?Q?WS5qUTPMANFRPe2ba8trdVYDUhNk8cNVUIYHkSFS9jqQ+TYfk5QGaAwA/v0p?=
 =?us-ascii?Q?Bwj3dfU/7bxI9H4+515UGmV/+SlFjcdBMH+b5FzjinOLeoGICt7Dk5pQJUBa?=
 =?us-ascii?Q?2Efb1YhJqzCECYRHd7Q9UYnjJM2qNLAZT0f5IkVLK+7jF/cyEcxdUKGYlL9M?=
 =?us-ascii?Q?qjC1MwM8P3XpNOONwEUYGDqDgKhRa33wx8vGZx8Tr8iGdhE0t4ElKyHPs3qi?=
 =?us-ascii?Q?vA2y5HSr+7pLBflDUCmkTlTFINh1tczAYM6Vw+X86mnPLPHnc+zkKDxwknQN?=
 =?us-ascii?Q?CaquyCXSGIxvGAov/Vo=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 10:39:48.7923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bace0dd-5d75-483a-1ef1-08de2da14a2f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3781
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3OCBTYWx0ZWRfX/th7SFwxCWNF
 nS5Htc2cC0KsTcqET/jIvLWGRXtBZyQzAE84hCMiDoaIgG+RBTk5UC5NUVjFYZh1qeVdRvFDzJ6
 ryFTz2Ii8Fm5nMbeZacnWctvqwrunMa3O8Yx7XcSwdClS4rL15pdVmZ5w/hiAktgfJWqn6JwhXx
 GLXIsYjK7+rE1CCzEVXODjc512D9IgVS7E26mTdQPVs1tCt7RnLNxE5I4DZDbGKITvAnydgYPhf
 3EA8kJd9KNq8jkfAOOBmN44I0/nKvmG1tOSNKXW+apeKph/PQb3uT4cndo3mQN7ZAOF8b7Jxzqs
 WUMu7bKd+0wKT8xizbG+gfZ31WJjOM1NKxX2v9L/S7JwHa9gwwRaQKbksGaWuJz7fHqDZT0PtTf
 2enQDLWIOtZiywaSHpczrbV1trEMeA==
X-Proofpoint-GUID: jIB04wjWPhpcw9isIN0s4NOcZM84kVwV
X-Proofpoint-ORIG-GUID: jIB04wjWPhpcw9isIN0s4NOcZM84kVwV
X-Authority-Analysis: v=2.4 cv=V4JwEOni c=1 sm=1 tr=0 ts=69282a79 cx=c_pps
 a=iw/g3Nm1s12GBgadF/0+Gw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=Otg07u5HJlA-6VySfCwA:9
X-Proofpoint-Spam-Reason: safe

Use kvzalloc() instead of kzalloc() to allocate memory to cache the
content of a firmware control.

Most firmware controls are only small, typically a few bytes. But on
some firmware there can be much larger controls for coefficient or
model data.

The overhead of kvzalloc() is negligible because most control allocs
can be satisfied by the normal kmalloc() that kvzalloc() will try first.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 6444ef1f7f32..dfac821bb5fb 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -987,7 +987,7 @@ static void cs_dsp_signal_event_controls(struct cs_dsp *dsp,
 
 static void cs_dsp_free_ctl_blk(struct cs_dsp_coeff_ctl *ctl)
 {
-	kfree(ctl->cache);
+	kvfree(ctl->cache);
 	kfree(ctl->subname);
 	kfree(ctl);
 }
@@ -1037,7 +1037,7 @@ static int cs_dsp_create_control(struct cs_dsp *dsp,
 	ctl->type = type;
 	ctl->offset = offset;
 	ctl->len = len;
-	ctl->cache = kzalloc(ctl->len, GFP_KERNEL);
+	ctl->cache = kvzalloc(ctl->len, GFP_KERNEL);
 	if (!ctl->cache) {
 		ret = -ENOMEM;
 		goto err_ctl_subname;
@@ -1055,7 +1055,7 @@ static int cs_dsp_create_control(struct cs_dsp *dsp,
 
 err_list_del:
 	list_del(&ctl->list);
-	kfree(ctl->cache);
+	kvfree(ctl->cache);
 err_ctl_subname:
 	kfree(ctl->subname);
 err_ctl:
-- 
2.47.3

