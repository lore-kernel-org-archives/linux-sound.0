Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B951A9FAB;
	Thu, 27 Nov 2025 16:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259632; cv=fail; b=bV3rmV9KyE0r9Sy8+ZU0mWddaHcO8dNKKhYjGfPd6bQLq32OvFLNPA47wZQ7ABA1d52UGm+EToi+1+nJYOm7/wCKqHM/yKRXdRDB+3v2n8Mg/Pc8tiHPQ65q2Deup3oClT1umkuCW5DbIq3cLeOJpOt3U15OhcFNiZrBIhlGDug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259632; c=relaxed/simple;
	bh=CvAeDVg/LAp0jOeC25w8jvhEYQqX02C1E9tv4X426Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Je168dnUhKSCEEzIj+QGvtnBr6p92t6PI/aJj1+0ZvCg9u8d08Eyt1m1XDm/IvBP+KxpRTZ4EK4X1qrUChVwUL32eo2H++0EfF5lVnHYkCjiYk7+JWlhshYJTYDt9phqv0PGz4K105SiGtoBdKBl6iutXIgBbDMA1UEa793ETiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GhMeE0hJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jYr1DzX9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GhMeE0hJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jYr1DzX9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5NNT2624890;
	Thu, 27 Nov 2025 10:05:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6a7Dsa+JTn20OSX2
	LQ1y08YRXeRRxpVQDla2aiwuo48=; b=GhMeE0hJxe0lqkKj1go+htdfixPtvp2E
	xB/gW6/xX7EpaWvnsBi0DqfX/szb0lB1IpgiwB0NGlC8A1dhMJ9qYrX76mX9K1lk
	6kGnf2vfVgbKJt0938pH+//XqORwZ5t74wsBKSYahkqhGeq/bc9VxSmndW3Z5XIY
	dWg74p1SKULs+LisU8Wz1iuiG8QF3talv73o1Z/hvgvVzS1VGiSYoAMVUMrFbPHZ
	BBqW2HhtUhq8u0sPDSGRfkA63gEzmY8IE7xfy4zfbs+vilrSQ8A5KvV9C/5tE2IU
	2cC0AznbeLP7zkjsXGh40vN5puYw5+q+s1rA3SG84GLV4qjOwmAaLA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020105.outbound.protection.outlook.com [52.101.85.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4anjvwtdee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:05:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kizSWG0c2CBCfKu17m5Q8hQWh4pscAIpXrpdWof4mPEG0zoQhwuCbCyEptwXJz5xgzc9M6h2zLguvKwAzDxD0P2/FuV+urLAvzqQGUZ4gHT2ysfppHFllPg6L/sPw3oqmEGs19NspYjUMVtyxv4OG81hhLURNHIOVc7IcyZHHT6pVQIn0bR74xtdeXcSQFeSoNxkmVk3AspBvZRmZrmrAQ0RE7EkpcCY2qMjvyz/oL6WCLmrRcGrBq4pFYX8hPYGiQmbneISSdojImKR+Y5dsmC7WqqM47jvekv8F4RE5nCRcMg6zS+pu0uGsd4vQQVMm/zDF5KpV7OvZfPGqE0uRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a7Dsa+JTn20OSX2LQ1y08YRXeRRxpVQDla2aiwuo48=;
 b=ZEWYXzqiVHxRm7LJimorUNPVS2RqCpKvJ17x6MhtIwXkzhtTcvoUsqwa4sTvGh2wS+b7eUDlNzrR4vwUhKoj5WzrAjHdKX7inR3dtg4mFIOpgxkGzFQlrXTqgaqIeZpKhSJTjQ8HOo/KVSj34Y3m+i90WSSUkVefrp+X1jui6nemif7nBn2VN9A30Jv9P4qd0J3jeDGTEpRD+KuMlHD/LwSJEOFMo4kqOfOikZGmPL9I3d9GoN0e0pEu7eJ5h1yb/NSPfv7bGPhUTYHTQsc6BeGQGlrQjByEnBaUqOcpqkm6bs9nSxyIoGILPucgCR/8Kgfx4ViIup8fcd83fCw/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a7Dsa+JTn20OSX2LQ1y08YRXeRRxpVQDla2aiwuo48=;
 b=jYr1DzX9mWbtPtXZjQtEw8KwOHmfoyM8rlbI2IzCnGOYSG9OvfeLKL5Ctlq4v5qhEsmSld0PaAx6VIkAEupQ2Av8FX1OCw10844jLi/DTzzz3GdSJlrzBiIjLYVXTdy9frpssTEBytnaVRlDYQgsiaBFchzGDqWPsZl+zLNB/lI=
Received: from SJ0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:a03:331::20)
 by DS0PR19MB7500.namprd19.prod.outlook.com (2603:10b6:8:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 16:05:38 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::aa) by SJ0PR03CA0075.outlook.office365.com
 (2603:10b6:a03:331::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Thu,
 27 Nov 2025 16:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:05:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 53906406541;
	Thu, 27 Nov 2025 16:05:35 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4481482024D;
	Thu, 27 Nov 2025 16:05:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: intel_auxdevice: add cs42l45 codec to wake_capable_list
Date: Thu, 27 Nov 2025 16:05:32 +0000
Message-ID: <20251127160532.2314856-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|DS0PR19MB7500:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3b208d2-b179-4ee8-7b89-08de2dcecdfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O+fknn4u8rpfmXgStZjcFTqDofXF5dhohln0dp/deid2gpcZwolYiZVtJr28?=
 =?us-ascii?Q?cvqrJ91hb6X9U1xixcQZ1DL0Vhbj9zkPtWmSQJ38f/9cGJyb4IfkU3LukIu/?=
 =?us-ascii?Q?XYTNX0U7VrNpaUOe9vagtOBIS91/l6VEZkgpGQC71duzoLaq5wdUWthynE9X?=
 =?us-ascii?Q?eeQw73O8G508if9apaZI9rTpqvgkBgP47hXv/hCN5EpdPAWPOZswdN3VNFUR?=
 =?us-ascii?Q?FPrrdxXr0CBqTQHLp6V2S+4x6XP8rLr71eRtgslsrN/oRnvMiSwA19rCzA/Y?=
 =?us-ascii?Q?F/Cj0+W6FEhVv9OLuhrBOYREY9X76fTGFGmNTpk8/l+T8i9sLUtDIl8DIE5O?=
 =?us-ascii?Q?Hx9EKWbDL2RjoVkKr9nSNJDq5d6DgfEOA1bH8524BwT1Az5EnkBK2/wkzwjr?=
 =?us-ascii?Q?WYQDMurWvZTwnQBpI0dgfJ+LCF+e1D7qz0s2wRCMR0nCKu7NG7k2Tczj2X8u?=
 =?us-ascii?Q?2rAoZtK7lzrvccVH33nWhKcwJyihtKqHRXmrzpVvzH7NABk3L064r3/szzmd?=
 =?us-ascii?Q?+SqN7Z4z48VvZSvYkoqOB2qBAXmI+5491MpDBGp/Mlqs5cW2tVwoaZrg6fOe?=
 =?us-ascii?Q?4D16ZhXOKVgza2kr6pB3H1dX8jYgZiuvbrnkl2upQu+tHyL7BXv+TKKTy4dq?=
 =?us-ascii?Q?SJYJzyEEMNcbH4vr7xWM1vdGvcp6QVKfkC1EC6FSzJ1JaZx3p2cDIvzPuxEz?=
 =?us-ascii?Q?bgNiE3PRNcguUNMX8l5m6BLh44z8Bxps2TXeYQXp8nstTuqIUXP6cD5OIjUh?=
 =?us-ascii?Q?xWQvOnYcJmNy0XWGATfYQMPkoGPjxxlWSIo8psi3ys4f5DZT+rMYM2bYwRrH?=
 =?us-ascii?Q?11w66sNclq8O4FYmBOqRdie3LjjwYZ4n+UeNScFVljMMdFbgM/HeUB+yXhkT?=
 =?us-ascii?Q?pm3+2k4qhmjSIAfSjdFY18aJ1J07lQZXKWpwy+H/UDgIkeHdCNXQTYjGE2A5?=
 =?us-ascii?Q?afKkhcv9nEsjigksRtD9DjfuS/DHt7PrPNDspr/Wrq4YjJjeAfdHzXoWbJb0?=
 =?us-ascii?Q?QWFz6hfZAM6c76MU6atcIY2jQprDtj692hM7SiG3hfosN2AbMW2a20khIhyP?=
 =?us-ascii?Q?jzLTlyDvs9hlDde92uXZPVKiE1VW6lFzO+6ySXv6J1EymHaryS5toM9xL6yf?=
 =?us-ascii?Q?0RaKd8QPvcJwLgsDj0101fffhtjzaMls6QkSeOJ6xRemQMAh6aHfEDl6i22k?=
 =?us-ascii?Q?EIKj2PmD/qmN9LmZoXcJ1GkA0qDYMt/ool81E3D96Emk4TwLlbu8g9i94kwf?=
 =?us-ascii?Q?RCcOZL7r9b6e4d1ErDA/spo5s9qqfIS7Q9WZeBhuq1sdx4/+ClMisKkwuKtA?=
 =?us-ascii?Q?Vrpdw5y3ptBusJ1v9Ks+J4d2YocHeA0ABavOSkd2Tf946czU3n8xg1BZ5wDX?=
 =?us-ascii?Q?7pOOUJ3KFXDwMUwCCEzCXEZUZzTr1z+dwj4DYWLTfuTu4xfPOkQGUzBBqX8h?=
 =?us-ascii?Q?LFY1k5u5WSOKuUR3VNsk7RYZilSM8Zll0/YJoqS7thuNQ3829DJ2YNlvWWCH?=
 =?us-ascii?Q?Bzd/15Cm5P23fNOabcmbmPaT2TRRBmvBEXLenoTg+j4Q9W0RRdF8yWhkx9ut?=
 =?us-ascii?Q?jHDcHY2Xl2UXFfjPmq4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:05:37.2093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b208d2-b179-4ee8-7b89-08de2dcecdfc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7500
X-Proofpoint-ORIG-GUID: OWSMCICVm1WvQpai2NLNd9dckQB_ZKXT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyMCBTYWx0ZWRfX5lsqHBzfCZ6p
 1Qqdf3qfgYuM8kZfPDCKscO6+JfASLneAUlpSfi++KE7fFG5fAeKs03djJtTcmZ/eMMTlpnim15
 x+ZTRGTS6ySq2sYIzBYKdpZ9EPfEdbdkjgQ3BhmprGb0sPsURfr9uZ9+D+Wx8NHXY91gr80jICy
 0xih44ABcedeOtMuC/Uinkltmn5Lwj128Ge78M0GUk3fUApe2W4cCZHKwcNeJfIS8wwTYuil98s
 Jdd5zZsTOaQKbEyqyLn7eY4InSBYzn5uUk616WvS8QJhzOQ4TnERFSUo5H5mVBWMy7EpJ8Nhkjs
 IPKAgO+y7gu+knEBRxt5eUaFT/Tf8u3s2jU6aUhGgGJYlR344Bosnh3nlrnAhPmJ124VjD8nrHv
 j4aCaj4DC8RBA4FHWPPNrHhU3+DB0g==
X-Authority-Analysis: v=2.4 cv=Vvouwu2n c=1 sm=1 tr=0 ts=692876d5 cx=c_pps
 a=KI7s4FTSNOfRXFB7i9gQ4A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=QyXUC8HyAAAA:8
 a=LoBzX-eTAcZSRYp6TZEA:9
X-Proofpoint-GUID: OWSMCICVm1WvQpai2NLNd9dckQB_ZKXT
X-Proofpoint-Spam-Reason: safe

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Add cs42l45 to the wake_capable_list because it can generate jack events
whilst the bus is stopped.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 6df2601fff909..8752b0e3ce74c 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -52,6 +52,7 @@ struct wake_capable_part {
 
 static struct wake_capable_part wake_capable_list[] = {
 	{0x01fa, 0x4243},
+	{0x01fa, 0x4245},
 	{0x025d, 0x5682},
 	{0x025d, 0x700},
 	{0x025d, 0x711},
-- 
2.47.3

