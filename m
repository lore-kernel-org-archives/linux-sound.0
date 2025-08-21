Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BDD2EB85D
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 08:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764657; cv=fail; b=Kd0L/sdZTT72aH92NLpargdBgnPAS5grrky/S3QbixW7w3I4MUol2lQEJ2G8Zv9KuFt6ATaQePlVkCwNUSfQdZvkpBmuXQT8vBmIRY8cakawlRiZiY318dfEebBVwfiNxz9lSt4QGq1NalUKI8CJPLwjQQejibfmhyNGvg/15IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764657; c=relaxed/simple;
	bh=g7MbF4jLjDFzY47Xyv80hyyoa0R2nQetzPZ7EYAygG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FO5VJGDo16HfvZq0ScGcIdISAnbmmmUSGnD9XZlV0LM/T7KVCa/0PGqZhwTScOEHp/icYMABfLRluKwyFkIMA5Xuj3Sjk64bA4fkIrFMNAfzzo+uCl8u2BPVmMl+LB0En+h+DJ5c9/SX7NEgPlrcyoHcuitOb+EJleFkLvw8Emw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UAF8kXgF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EAXmMaLX; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UAF8kXgF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EAXmMaLX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L57fNg3599515;
	Thu, 21 Aug 2025 03:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=O54WMGLURgAKbaUa
	arJAwRwoE8wbGgH+8tMMFKdUIx0=; b=UAF8kXgFNTTKdbXAqmWtqvdKq776X1qx
	OvOkbzaHiQRSUoZQcxQOa7b4ruRXe4VSvbjJ/I55xEceZRadxZgR0Z+cpBfpoHnd
	L0ZbSvRDVrUnJVqylunFBiBGlkmHS9B/VmvoeRZJ4oSY3d2YbgNYRzfjr3K4p9BR
	j7Re12KTCUwnUDu8wJytOoHA6/SHtQTr/lXurMuyjeZAAmXnhc3XiMxO6ELTML4b
	JQcXhSuW4qSZOepiJYbIJEL46PeohdrvPS2L5UY5TwyzFy5toZ6XOuloFztoC6Y1
	xfWgtSXBoDQlNWgs/WYkvemJW8+IC/EFGhZ2Q/adSdqCQWM0PN6Puw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2107.outbound.protection.outlook.com [40.107.220.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd9ajdw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 03:24:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uItY9Rh47fvDYd0BXWVkZkZlGjzRN+sYBlk/d1zU5GkE0BOGVpYZIup5qyEBOg7h/7xFnrY51bL356AWzPli1aNGb/gS/D1xwRDX3zOAmobdrcdJcEZa6R5JhS4Qwh7K4AnquMhH3uFStLNEU/RTh3dQ0vZG/yvNoeAVowPg182XwG/drh1FrmBkFEJWXlvjsfJU7GKpMaem8NFx7lBdjOkkNqGub9tf+kQj1ENazJ410WSLjd/i6uxIHQ+vYKN/IGBrtgWfvADzRxKmHoMn5+YD8TWqk7cSFzr0gZG01Jlb9uxBs6d+spGqABVRNetEwgXYks9t8gkC+QFSFSRFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O54WMGLURgAKbaUaarJAwRwoE8wbGgH+8tMMFKdUIx0=;
 b=NIzaViSuRyiEqlkRLxcR0uFP5mTBCZMKYDOptrNUzrQbj5PQPrgtDeemTJDBxkSrewFjmgM0P+HDZ20tm0WxhDPz5YyyTgULylq3+wFuGjMYgKNR/vpqZexKzWzwKCcpf4CKX7s95diX7aBOL/hwgs5kqPMCfJgXN7bl+XnUc7XhDE5ByZeOt9InO24s8HP96u3qOqTc3c7ErPPZ44RG9sj2oAa4U3C0Dhp87FucBCyNl19VkmaCr55z7/860MQ8MBRhwhkAWTzksh40j3cjUPCxLZrwAp3F/6VoxCDYikcv36RVuXd5vtopew5PRr9tOQO+/Uy4FnKGex9CkHOYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O54WMGLURgAKbaUaarJAwRwoE8wbGgH+8tMMFKdUIx0=;
 b=EAXmMaLXq3BbwwWOl0qDj/XCWAZ4KYaqaHe6Lpz8FmmXiqmZ/zbY/9cGvJ+HdZUL0Uq2u9PtR3rj/y/0YnAshVnMelWGG76aPqs566Z/2Tk58U/grO+C+0e1EC05FTYLG6phGzzA1ikQb67qCASvrw4K1W7Wzzz7Z375a9HeNWo=
Received: from BY3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:254::21)
 by EA3PR19MB9254.namprd19.prod.outlook.com (2603:10b6:303:2b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 08:24:02 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::83) by BY3PR05CA0016.outlook.office365.com
 (2603:10b6:a03:254::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.6 via Frontend Transport; Thu,
 21 Aug 2025 08:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 08:24:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DE24F406547;
	Thu, 21 Aug 2025 08:23:59 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BB3EC82024A;
	Thu, 21 Aug 2025 08:23:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, lukma@denx.de, mans@mansr.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/3] Minor bug fixes for some older Wolfson devices
Date: Thu, 21 Aug 2025 09:23:53 +0100
Message-ID: <20250821082356.1301202-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|EA3PR19MB9254:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d71ffd42-cec3-44df-31d7-08dde08c1587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72kaYcLk9++cnU6Wg6hQSWIec0SjkJtS/N9H6FAx5THt861dWKMML8zi2I71?=
 =?us-ascii?Q?kcG7Flt3LEmVNb6Am1vyHX0m/Wq8V/bJDJIHbYpDbcqT6Uua7wXWjWyCOr4x?=
 =?us-ascii?Q?sIb0J8otgq4owvnD3i70H6FmoOxMuBIFYgj5AUQ9LCevE8x+0QxVf2iXLr9N?=
 =?us-ascii?Q?oo08fcSm9bv39f7+mlHq/G2z6h828ZbErEDbKqMj+20ZPf/mE1DIy/17JCd+?=
 =?us-ascii?Q?pgWjd4hJ+KC0O1nZlk/HogLiDXvT5rCxL2KW8Wdci/w9E5pdDh+o5q6BC/lO?=
 =?us-ascii?Q?9nWRhkfJb8WGRsns0FRqvcVwLxsWz+YDjvZuqdJXlwvhrWfm5gE0FW2GaCBs?=
 =?us-ascii?Q?Geqz//VQ1/PfmIADmEWc4cSIb3KC/fRaIj5WICcmxfx0ISFnt+nAXshor4Kn?=
 =?us-ascii?Q?DHV1z1DfAK5ze4bU2hYojAq9femu7WAKZsgWsKmr2tMNb86CydOSDRqDqoH5?=
 =?us-ascii?Q?fqt60AzNFdlD307V/w0a61yrpcdNXctMHktW7Y8xgo2GlYQlHaDD60b9WRnT?=
 =?us-ascii?Q?6S9u1mWPtfikMW9N7ig4y5Beqi+32FVgY5mXHzLUhQfSeW06pVDlpHLdZy0R?=
 =?us-ascii?Q?BQvSn9v43gwkFviWCqfyP9+MJDHP+0RyWcQKniGgliTPVx7LKmUSBfmMD7Vc?=
 =?us-ascii?Q?pwRNbmTqMKrT1Ro0wtDPX757j6QWbWSNyLwJ2uWycm5rSsDV+3i1QSRCMF1t?=
 =?us-ascii?Q?VKkE1GitvnLVIIhtUXTnQxZMf+s9tb1mouuofJgOxIi2YhSPJd2C07QQp6s1?=
 =?us-ascii?Q?M/RGiHev3gFktz2urr4TJFolpCz/dF11gH8iNFUkiAna1ICjDP1daKhIQBph?=
 =?us-ascii?Q?9Uuh+QkNOsDQr1SBOVIdjIkyQLhQdtgtUfZjOBzukN2quBAl7imFwtIOBb1i?=
 =?us-ascii?Q?CFW0weVBHDnbcjbKbWp9M2UzW8dTFemZHF6yidUUGaCrugROgiuy7qvl5xcu?=
 =?us-ascii?Q?a/WTr6K6icJ01aK4LhAuSpkrGuHKiV3CRdH4Thsi8zw+qRRf0/zdSXo9uf67?=
 =?us-ascii?Q?bdqofDiWGpg89OLDJQIRdI2Ic/qFemxQJy0FoxZmVGrXxwjhjqS/C5E30ISZ?=
 =?us-ascii?Q?FdNlGKMUJVBOc8bwSHQb1J4QjgChqaoA7JaTIAStcHeea9eI9uLZ3LirDo5o?=
 =?us-ascii?Q?c4lSZlIqHGvR8SAbY4ujNpypJ9UDLpZf2PXmq+rOwswMzazCLBxw6ZF7LgIE?=
 =?us-ascii?Q?ny6h6sxU7gEngI+OSmc3zI7EMEptFBL1bLO+DAxsk727YRsdjnGme3I+orhF?=
 =?us-ascii?Q?tOK8OqTeV0QEVcVpMBH7j8eJpkEXdSTbtemKvtxe3Uu5fpKe+BXEM7WSXdn+?=
 =?us-ascii?Q?jig2Ro95fyk3QugwTrEaQ/23HhoTlRE7IgHg+XOdVn/5XX4VcM8lmKvPXMvh?=
 =?us-ascii?Q?aq1XmiL0fCVOfaeWfPi7ZclXaEFRnqWHWFCE/cypTgtmLDonDA9CM5/svkHF?=
 =?us-ascii?Q?yfh8m9khI67xYU9zSZZmbyXJixlxRUS6Udzu702+gEaWNoHkT5BJMa4TLXVd?=
 =?us-ascii?Q?tUj+T+mzWyz9U3QmWR5syU/woEV6OI/ApFQT?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:24:01.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71ffd42-cec3-44df-31d7-08dde08c1587
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9254
X-Proofpoint-ORIG-GUID: DuPUEIxcCZ8MViqrHZ64g4EE4x_f3bHI
X-Proofpoint-GUID: DuPUEIxcCZ8MViqrHZ64g4EE4x_f3bHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA2NSBTYWx0ZWRfX/SycIO3UokPR
 u4j1jSxamsinlDZ4UvK3LDlPdyMKXIrfquWRADRTV1SCOFpI6sr+SH6Yey+78XsLExhHrRDnLtm
 LnrYaPw6DcCnZL8sHRhBCbywwMSgGzh8cA4ALX3YaQcvmuXGOyJG5+DMQrB8U7jzbP9/8fVzWCI
 FeVPHROVj4iQGmwARmYj2uWPxGI8Vka+ZpPMwCbdil5z6944zqoTKt7dDoYB8n/YCHPZ3UMXXjr
 pS4HMTH5/guP9Jw5LmOJT3jgStGB7W9NJVRSp9n/OEtfKI8w2iGJvYh3cUqZzLqhTAN1PNRgSD5
 Ia1dHnQKvbRwq1q2JWDbhCLJdyCV+hlx5F5rhCIgkiSVPyf9y6Z7SFN6A20iWpWiRw1KeW2PdbT
 /LA3lIx3NAuvVm2x0pVsQ1hupYnb9w==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a6d7a5 cx=c_pps
 a=QkMd9A5hkDPJHF1mgsh70Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=-8dSnDlTCbIuCDlLowwA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Minor bug fixes for a couple of older devices reported by some users.
Mostly this centers around the automatic PLL configuration getting the
wrong values due to rounding.

Thanks,
Charles

Charles Keepax (3):
  ASoC: wm8940: Correct PLL rate rounding
  ASoC: wm8940: Correct typo in control name
  ASoC: wm8974: Correct PLL rate rounding

 sound/soc/codecs/wm8940.c | 9 +++++++--
 sound/soc/codecs/wm8974.c | 8 ++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.47.2

