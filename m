Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164A2BE04B;
	Wed, 31 Dec 2025 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202055; cv=fail; b=jv9zoihdWLZ1t03lC3epBmiMYA3zifBFL+I1EP3YjuUeTeqDHFPK1ZH1QKoSlytuk7UjgRb6JBxrqkboNWNMbURLFSThLo0G1KVKXe2s9d3pNl54tPhNn7BPjw2Ka9kWWw+6tBkW2kjVXPauUx+V9xPiZGgO1VdMcBF1aVyTfn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202055; c=relaxed/simple;
	bh=XbfaNCkup7la0sCe189cYJxPcZgUXnPoYmuycU5sJ2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFvj7YNhnIWyNy1Nfsgkm4Em/k65/naWsuEbba720iBJPfKxFYHGkScdEjN3Ygk7ZQ6DnP5/BOILPbRHJ6LBtfmHOZsg5NwTMWhYP/wmwRwRufQ1//6IXiOhxBOlDMQmL6xz+A40ZYBSXJFnUv1dZO96O9G1sQPSzQFZvZzjNFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Q92USz+f; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jrVGmEy5; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Q92USz+f";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jrVGmEy5"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVGglio115042;
	Wed, 31 Dec 2025 11:27:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SniPlsxUFesQtEaEzWfWSdusBpZY2rqnLbzpTLcD4gU=; b=
	Q92USz+frxKI2t/tBKqNlHajzEALjp4k21jKjLAXjzJXgC9xkljFG75atFUk/6Jz
	VK84F1ZOg22EA9emAVFP7Ct5t7sMqWMXd1wVB7fa2MdOE2qpTlQtYoTtOx1zEXdF
	x4AQU/quG41qFjxYVuxPx5DMJmwGCMlRDbPpwVUblMKyEPTmH7VZ7phRZ8Kpa+ks
	AurxeSHWLSzj4YlWfMbNQwQW2cYIwG9KBxSN09dROOMhxJxtk/whpxeGOZnadvYe
	Wck6z3a+su1pSQHYxrsBXQwPXjj6PD85m44fTLgLoG60NTYvJz8827k/jZdyKQQz
	j4CO01melcZ7+g0Kh92Rog==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020123.outbound.protection.outlook.com [52.101.85.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bacrmvct6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5CVQ1Nd+oa4GgPzzuZpez2WSHK8eQgtuDsSCeZ7fHXtXmWBmnDs23bH5dsHu0TTpStozAt1vyv+TRfKd+nOuCHZ3S2hMz5eagkBSAs032VmcfCBaIq/eBBmBFkDy09UoGQJaxT/EdWl2vGhsx0rz2ppEPwrZ1qBsCQV6Pd2y7K7cygiGIEJAeR78qd9HKnj/J9GYgFzYp+V5QORnMnTQf8RqaNoK1FoF+aP2HTZHrE27vYgDnHPXd2vcTM0xPkuAVZAO4D87JYBy1SjLLCUtlgMjL8NGVymELxm0MFOO0IJIZ2qpTLHsYXVTigR+jRNCJt1dJY8aEhZwwzvrIsKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SniPlsxUFesQtEaEzWfWSdusBpZY2rqnLbzpTLcD4gU=;
 b=eC5hXzCEmlkb1sLzuyAYznklb3m2+KbgxEi5nIwgDDA5Adkrp/3e2CpQw/j2rL+DJnbM220iQ2dHpWOmdWqrDCUn0IOp2+ZJqBZDXAaKeecN9YxnlckAE0GD916bCcUA6mDl7NT+D33m2G+6EjWmyldJ5f44t6BxT4O6vaHsXjIerqgjtB2hcL3fA2GpCcpvvUkWut+WqZGGlwQyjDWGeJK8nuR89csNQ7rbT185/6K1NxFSi4GzieEQlRpOsBoxmAL3xrxLOQDdGcSsThQ6Lc84RqQppXgaY7mZG5OWmKS6GHE0JtlBHpZ3z1OSk5HJ1ZbNU0Cn+9HRDuaRAqy4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SniPlsxUFesQtEaEzWfWSdusBpZY2rqnLbzpTLcD4gU=;
 b=jrVGmEy50DgvdPXVZ+e4qcexZVc16guSMA23qZ1Snas0yxyjQMz6FTcDDuP8lnsHGT1tg4q2phzlgF0hmTmz4MIuhpC11JdL1lCwHCcCRclzHp8bKQUz7KFrhUp+ZR6b7VOu4hoE0QsIFxkvU5y/vXdPh2Z5S3d+k0dx7TX+WPQ=
Received: from BN0PR10CA0008.namprd10.prod.outlook.com (2603:10b6:408:143::27)
 by DS3PR19MB9294.namprd19.prod.outlook.com (2603:10b6:8:2db::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:27:24 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::9e) by BN0PR10CA0008.outlook.office365.com
 (2603:10b6:408:143::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 17:27:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7F64940654A;
	Wed, 31 Dec 2025 17:27:22 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 219AC820249;
	Wed, 31 Dec 2025 17:27:22 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 8/8] firmware: cs_dsp: test_bin: Add tests for offsets > 0xffff
Date: Wed, 31 Dec 2025 17:27:11 +0000
Message-ID: <20251231172711.450024-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231172711.450024-1-rf@opensource.cirrus.com>
References: <20251231172711.450024-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|DS3PR19MB9294:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 89949d68-d912-432b-1b55-08de4891dc6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jKtNAW5HjCJB6farm+U/wSXUrA8GnehrI55B9AmyyZpHHLA7r3H+5fkZXYzM?=
 =?us-ascii?Q?Svzfvewb+DHbUhgtquf52baJ8QcpeaVA+KMYlNJXOsRDpfCu/jaeRQVNY4sM?=
 =?us-ascii?Q?qRNxME08BvhB4tWnoM0hCDx1vMZhkXbi1PBNPjLvKTEuPpFmsbHob7r+Y97u?=
 =?us-ascii?Q?OGxxUFAZuZ//LbFkUnjL5l/M2b+Ca5QbYxR7e/LbJsoyz7aROQ6QPo6AqoDC?=
 =?us-ascii?Q?AohW4b6YZhU31vh6uJNMQS8KpWnVFnWieM3ejqi2C5wzr4VTSYdxgraHEgl3?=
 =?us-ascii?Q?QvGwxPi7KbBQ2FV1OzuL6Oc/gsaP3JmiKLwxWy993CBNi37AY5KJwdCV6Rfl?=
 =?us-ascii?Q?NNgxvI8bNEddo+Az+rjM+7NW/Kf9iOM+v22rw8vf+VanfgePGbJ32Vj9PoJJ?=
 =?us-ascii?Q?rI/l2WtpeY04wCRno/NmO/BaGqgXorxi11eGmHaTkE7lWT2UTfdsomyOw7XT?=
 =?us-ascii?Q?QqRhhdKHaBwS8Eg/7F6BBRP/BhzM5Uvj5rRZHl8J33itQHD95ldRX0xUy+qs?=
 =?us-ascii?Q?ARGUG01i2sZOeWWNOT8ZVDBAOSnJS2J1B0qBYCR/WYB/RgopAX/Y4BtDBaIH?=
 =?us-ascii?Q?SLP93kvLagoKsPe6Kj2T9nlgdbcEw4iLLZ5/plL06XnGkR9+T+OEmopH7z8V?=
 =?us-ascii?Q?fUPdWoNi3y7EDjE+J9cu5hVpjiB/hcSWFUqN99H9NDC5+2B5T4DXGO7b4Udd?=
 =?us-ascii?Q?LVgnJY2xv+dvtSg/ITBV368E2KwxJBLcWTTHwleJ7q4DvHZYElg876xfkrRE?=
 =?us-ascii?Q?qcwMT9cD/DVxk2wD4X1J9ypmj/JV6hKTJAqaHbLp8tVu7V2Ybwyhwjw0m94A?=
 =?us-ascii?Q?5Oy+waEh8lM3XUY/IPRiJc4dodmCfa0tlK8lt5AdkDQSijnMDTQA9K8I810s?=
 =?us-ascii?Q?SBkCJoOqudNxzP9TX/txCJTJzt1Zb4p3eASBtrJyZXd7GjCFM7p1ZpKapbmD?=
 =?us-ascii?Q?E06CRJ8Nj02lUkY/clAvGq57CnGbsFismAiA/T+9tJxVVlotSLxiCDhc29PM?=
 =?us-ascii?Q?zfxyjyXWKMHmGXHelxT0FMQq6/WlDE8BB4H2wL1BFkpfPgQSTKNGRHnN1rYs?=
 =?us-ascii?Q?pUvEHbj+NynGLwEwy5FIjfih1GfkbVvTq9lNCWbjjDDmy28xjVbgCQ74CbHV?=
 =?us-ascii?Q?UyNcDuqS+Ip2asqx030GXI/F5r0jyffMDYRagEUgvcrpR+ZAmtWUUXY/eMZv?=
 =?us-ascii?Q?bKslielKQkuhqnVdN7VrPKFFn8BhnN75lBXalScYPq/dU7JkO4Nh1qprFbgP?=
 =?us-ascii?Q?vb13kv5y/MdFaD/EV2/2SUZWwbSn6xpR9d3NE0PJUKAhpXK9YAszg9hQ156z?=
 =?us-ascii?Q?S9GVvktbyuRpKcI/6wzUUrOOXJRXHY6OeDUhR5gdQYikFDB+d3Tk1Vais37+?=
 =?us-ascii?Q?ZsJA0V/YblZvUawn8I875ch5yr8uEofxGqOAfHTO1Mi4sfWMTb3XrGRKD55w?=
 =?us-ascii?Q?srEYkbQXGu0xyic8c+HF2VLnt3evQXfGSAhDVK7BN7hHAndwNmVOb/+rPB2Q?=
 =?us-ascii?Q?rgtTHdnXcwgs7KvofQKv5SupunlfSuxtDoeB9bSHQNUtvDskS7IVF1w/5vKU?=
 =?us-ascii?Q?6Xp88RSBPxdC9NbLLvw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:23.6451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89949d68-d912-432b-1b55-08de4891dc6a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9294
X-Proofpoint-GUID: RQRfwHZ0pXQLenllIsz3MqRVRGaYLoK-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfX1ODv/2rYmBtF
 K0bGpFSadhst9uIc0VqijnqYsl0WPml2MFz7Yoq+bMMEJFS7n6BrUKuV4AD2jAgIEEtdrNc8PVd
 Uxd1AogiObtkzJiwqUNORi8kmJQrnUhPrB+h8uYkDD/kxFy4hLodm/lffFIDw7tPqxF8Vq1OC93
 Yaw4kNw3g9N0is0KWjoZlhE6s6khFiRfxEahrEfVt5XUH9RJOp6UaUExOS90CS8oIAy2ve9Xihk
 CPJNBo4P5Yr+V1rzIBdT5EwRrJz6YjPKThRRkEZFgtxHSiNi6ZiKxN2a7OGaRhzUTB6cxnlN6ee
 7lqtxOx1aOUD3AfSmQf3cErjbljA5qjJ7OD7Uwh9K3TbERRApsXxzoaLc/rxh2qFzP5jL5EBvUD
 Wwdla3xiwGvi1wdVm9+BmrlEO7lpO1cn7Q7vBFjWuyxceYWmR4syuZeqsHXIemn7FXE6Elgg4dj
 hJEvkPS2CAQ4+vW3LGw==
X-Authority-Analysis: v=2.4 cv=bJgb4f+Z c=1 sm=1 tr=0 ts=69555d00 cx=c_pps
 a=ERcN8ojmLF2LN6E1fAlUwA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=C58FxD2BOZMRnAzTm5kA:9
X-Proofpoint-ORIG-GUID: RQRfwHZ0pXQLenllIsz3MqRVRGaYLoK-
X-Proofpoint-Spam-Reason: safe

Add test cases for using the new long-offset block types to patch
memory that is >0xffff from the algorithm base.

This is just adding entries to the parameter data that have larger
offset values.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes in V2:
- Fixed inconsistent commit title prefix

 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 67af7da4f8c1..99148ea22df3 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -2326,6 +2326,7 @@ static const struct bin_test_param x_or_y_and_offset_param_cases[] = {
 };
 
 static const struct bin_test_param x_or_y_and_long_offset_param_cases[] = {
+	/* Offset < 0xffff in long-offset block type */
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 1,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 2,  WMDR_PATCH_LONG },
@@ -2336,6 +2337,7 @@ static const struct bin_test_param x_or_y_and_long_offset_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 21, WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 20, WMDR_PATCH_LONG },
 
+	/* Offset < 0xffff in long-offset block type */
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 1,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 2,  WMDR_PATCH_LONG },
@@ -2345,6 +2347,28 @@ static const struct bin_test_param x_or_y_and_long_offset_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 22, WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 21, WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 20, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10001, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10002, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10003, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x2f003, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x2f002, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x2f001, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x2f000, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10001, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10002, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10003, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x2f003, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x2f002, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x2f001, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x2f000, WMDR_PATCH_LONG },
 };
 
 /* Parameterize on ZM with a range of word offsets */
@@ -2374,15 +2398,31 @@ static const struct bin_test_param packed_x_or_y_and_offset_param_cases[] = {
 };
 
 static const struct bin_test_param packed_x_or_y_and_long_offset_param_cases[] = {
+	/* Offset < 0xffff in long-offset block type */
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 4,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 8,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 12, WMDR_PATCH_LONG },
 
+	/* Offset < 0xffff in long-offset block type */
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 4,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 8,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 12, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x10008, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x2f000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x2f004, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x10008, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x2f000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x2f004, WMDR_PATCH_LONG },
 };
 
 static void x_or_y_or_z_and_offset_param_desc(const struct bin_test_param *param,
@@ -2449,6 +2489,7 @@ static const struct bin_test_param offset_param_cases[] = {
 };
 
 static const struct bin_test_param long_offset_param_cases[] = {
+	/* Offset < 0xffff in long-offset block type */
 	{ .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .offset_words = 1,  WMDR_PATCH_LONG },
 	{ .offset_words = 2,  WMDR_PATCH_LONG },
@@ -2458,6 +2499,17 @@ static const struct bin_test_param long_offset_param_cases[] = {
 	{ .offset_words = 22, WMDR_PATCH_LONG },
 	{ .offset_words = 21, WMDR_PATCH_LONG },
 	{ .offset_words = 20, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .offset_words = 0x10001, WMDR_PATCH_LONG },
+	{ .offset_words = 0x10002, WMDR_PATCH_LONG },
+	{ .offset_words = 0x10003, WMDR_PATCH_LONG },
+	{ .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .offset_words = 0x2f000, WMDR_PATCH_LONG },
+	{ .offset_words = 0x2f001, WMDR_PATCH_LONG },
+	{ .offset_words = 0x2f002, WMDR_PATCH_LONG },
+	{ .offset_words = 0x2f003, WMDR_PATCH_LONG },
 };
 
 static void offset_param_desc(const struct bin_test_param *param, char *desc)
-- 
2.43.0

