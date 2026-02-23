Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F1361DB5;
	Mon, 23 Feb 2026 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858989; cv=fail; b=Vyn++ZLs54aWmHu8UlmHUBDdJb/HytSxmmwSGhUKkwKjWRo8E+5lEcvG+ZDAyLo/zBSRfkIEXh2j/9m9V2iujM3NHRLNX8ChrBaFZjxI/0tPPDbMNY0dc/EhAmprk2hLVaxdUYFKvk9TacyNUu/05NNS5gs03etI/TRk2lgEaWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858989; c=relaxed/simple;
	bh=fz1Ah4dzabV0QUs/evdJqr2EIWzCfmdpNa/FV2dzi60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4vaDx28JIy8ByYtVrteaXC+G1ejB5i3DqFhhP+koWBiSCfBE6J0sZHqD4OZwDLjxFOS8vN51Mum6TSknCPr75WE77hw6hLAHA2lU35hsaGDJDrHWWOxtInozCp3O1ZAIkf8fik4GTwX8faLKANK9I0hGJpJJU5ENXkw5QOXfjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XzM79gNM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=haEQoYjk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XzM79gNM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="haEQoYjk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5gR1B1077394;
	Mon, 23 Feb 2026 09:03:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7iTwdDptELJZUO90g/w4c9t0PwtuAJc4W1XjmKr7SME=; b=
	XzM79gNMyZDqqM057IH7k9axeSP30UewHseLojOTYCJuNTkFFZMBs7+1Do9sg18a
	ENYGOAXwxEWbeIkVFMh18T4WQK5sd6auoc2JCWDIPAVSKG+YWHNyt/rNwlH9iHIq
	qoqvKZDRwPHiAyuFNRvhcr24Yv9kC6WudEFvfJB3x3K3Hmd4QhesUX+V6oeGgHYU
	/AMB4oo08m+VH8U1N9xc0SSUrazyWtCr87SXQwYDuWqeXo/JKAkVINClwMv6rQL+
	7JJEFQXLTR/qyShjOJyL/REj1R9itIbZJTGHFRWd3pMXZ/bgIpLj4wyet9I0qiiK
	WBbmmhW5u3hWQB9kn+ir0A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022078.outbound.protection.outlook.com [40.107.209.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019my0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:03:05 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uS+M8jVIWR55gzS+I9SyzR2Kr2lg4JCRgSNgUfB6IkTlGwxCu63RTbT1IRYScDFJhiKxz5KPSQu8A9N8yGaOa/4FL38By1LycWbuUqWevdViwtOtIh6bKOh5hkJtBq2Jm/JVSLqsWYJhjDGHoLGFOAm90UwDGhaehpg2O6NSFQROkqgPbTq2t+5q9CUL5ScUuDvlYi8alw42TCvpQLesttvWBFJk7TrlEaL4mX3CuKaeBx8f5T8opcuKyWwCOW1xssrJyQXyDmVUfce/sxF3TPgWY8c9f1NLu+HLdBs+kXkFqUJCrDMtc2DZDQ4Wjwq2GEMXL9XzLKO37f8ogd34pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iTwdDptELJZUO90g/w4c9t0PwtuAJc4W1XjmKr7SME=;
 b=t5guXrSKsn+Wy6Aicl8sZL6R80nAhNiHWxf74cMDvkJ9Ukb9vI5Be2gPL80wzhFNEiCKojAEF2If00j4QftMhqNqfF7d+5mW8M6eZDwYCSr+l9mLVEcltRDUv0hqeYZ9HhCweeCoQ6hVOWTx3iJrVU8gLG3ynJ3cynHObbKXVgi9jlxevNp20qACQ/TOQqH5GrjVKe9srrCv3lLurJpjdu1thIVt1ubVbepVr5eZZS6z5pfB1VQzrU5NJYKNc5lk9rFGbmnUlVxnzeU0cEt3UJTnRizUSBndn0acQQ7ewIWPw+580YcGw3n33jpu/pLayLSG1C38dYOX34YNB/w7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iTwdDptELJZUO90g/w4c9t0PwtuAJc4W1XjmKr7SME=;
 b=haEQoYjk3GlpnLCuvY5Qx/8GMF4GtUdqZ8iXKAatFBHFWV7lDHDw5UIKSYWlKGBkKBc5fSbrD9Zahn981/XCCnea6Vs+71sEFRN1J1fz3zMxOF/aBV6PPp4gg4YQmk1fSAPvuDFirna67DpokerWdI56/p3TuBVyrnjfR0z6RwE=
Received: from SJ0PR03CA0189.namprd03.prod.outlook.com (2603:10b6:a03:2ef::14)
 by LV8PR19MB8422.namprd19.prod.outlook.com (2603:10b6:408:20b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 15:03:01 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::6a) by SJ0PR03CA0189.outlook.office365.com
 (2603:10b6:a03:2ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 15:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 15:02:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A97CB406543;
	Mon, 23 Feb 2026 15:02:56 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 96F49820258;
	Mon, 23 Feb 2026 15:02:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: soc_sdw_utils: Add device info for CS47L47
Date: Mon, 23 Feb 2026 15:02:55 +0000
Message-ID: <20260223150256.326143-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223150256.326143-1-rf@opensource.cirrus.com>
References: <20260223150256.326143-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|LV8PR19MB8422:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 661b2861-bef3-4497-3d70-08de72eca220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ggfC+xcPRlGkffjiXaAageA/6yW2aA+zhVAbpn6wOw1DEPl3/0vMa/XfrNTL?=
 =?us-ascii?Q?ifBt0mHeo1o0ANFJ8uElVIP+u39IFMpN8eusVa/px8sLkTp/lIcodpE158C5?=
 =?us-ascii?Q?ABZnijiEjjjeDftRjVbEkSMSzn1Bc88G55ApkBeFwpXxKMIKWenEcoxAqMNb?=
 =?us-ascii?Q?Bxe8mmP+7B405UDUmXmcbaDAGaObqonwsy7Bi60q/iu8AGXbJ62nzFihxKLU?=
 =?us-ascii?Q?6bPbeqv9FIxi2Z85PVMpS2YYe8LEMF/XspcwWX4w9eR0AcgBq4wL6dGrm5Eg?=
 =?us-ascii?Q?DJabVdHGG22Uf61ghTHZ1YFGH++bNZH9BUunSDwb0yC1A64OFVnK0pEkTh5C?=
 =?us-ascii?Q?zd8e8+Lh/r0PozZoVrGYwS69ynadm1smwaqwL0FKm1UDW/zKVbB/Ot0TQaFR?=
 =?us-ascii?Q?C4cpKnw1xAyXIxnIUuu48jpX9v/+4AKcTwFbMEsyg43j1sfi1BVqZq18f67L?=
 =?us-ascii?Q?sa/yoslTyvPnhlcn2DkMufxn93Uvs9rTfQtC/Ney/4P6224zA0NfXaYYR0SG?=
 =?us-ascii?Q?T6Jl3bilWAC0Nsqm1Ata705hqDvYLYjtDLIoxQNFmG3useyZakBHaAptmFF0?=
 =?us-ascii?Q?CIQ8rP8buuK+6QZ+ideZl7Agenau13vAo9RoNjSy4efBq7ZPlNd6x/ql3+HT?=
 =?us-ascii?Q?o5mWXs9hoHVykk7zfUrMsTYAS1ZN3PkTz3iBQ9X10KZ+DDK0q0yOOQu4VtPy?=
 =?us-ascii?Q?aBMe6hT3whYla9GtotoeZ/gFuNilj+cHJ2DX5sYu4vAxWyUhbeYuqtE9X+Hn?=
 =?us-ascii?Q?0LoqUrd1X4Dksi+hUalmko8fZ1Cwvnu8iJPJHfCDstgEtg1jTmEjA9b/L2m1?=
 =?us-ascii?Q?OWu+qPnHHFkExh5KMsrPV8LencZYC7zAqMx9SRM54+lZhQw+dJjobyMUQcm3?=
 =?us-ascii?Q?DnWNu4Nl4a0vUDndMpdeCLk0JTGawiriHnJ3z3MTcpIqstrHE0SR0vI9nm5v?=
 =?us-ascii?Q?+VJ9LaliPPEOc3GeDGvMIYry0jPIJX/Psta0vvIAv/EnkCvrYtrrYu7HG6az?=
 =?us-ascii?Q?jzR+5ZFiYIzbRpx7PF0o/gWofoaBct6gckd9v9mwVfjCkt/M6SCH1KJWrfdO?=
 =?us-ascii?Q?E0jpSPsKGrKJyISBdFI9GsZ0vyhb4ve0JA1hAVXuZKxap5MKltI86IQAxw73?=
 =?us-ascii?Q?GOxSfJ/l4zhoPuEXamGvjWd4EzC4NziVgxnknL5H+D5VjitQC9PvnRuvm0MQ?=
 =?us-ascii?Q?JJJ7umWhYPonNdcRZVNDpEWjNG6EI1mq8r+SS7cgQ58KE4zmfZn/RZ43E5Qo?=
 =?us-ascii?Q?h39y+95hcBW7E2g7GQjBBC9/JpTOuGqY0NQXWoA0FsZOOKb4qgm724IDleBs?=
 =?us-ascii?Q?pRLeJ1Q9mN6RaMpYKdzTD/+T19NDVjtcvUhgusuAkjFiDwpk+PRCrGN2fyxI?=
 =?us-ascii?Q?YlGXlJF0GCKR+M2n+ZKRNjZU/50LhAFG/4/5x4GXx8XXFx5TMaIBAfnYHrpA?=
 =?us-ascii?Q?bGVky4sFKLng3atF9XLkrISOiNSRH9keAUD94jVXckEibwEO2CvbExvb2duj?=
 =?us-ascii?Q?pc78dfcSDM64lcZhhhs8gJAPuTA4wPVOrCUiYsHFPc0JgMHhLGF3g0mhx7s6?=
 =?us-ascii?Q?9JKz3o4sb0i4eE44B8C6eMBvmSJXNs35xB4f/7w1G6+OZ9hrFUGAcov9IwC/?=
 =?us-ascii?Q?L3ZEzWy23BD98v8e7wBBjgYNGffDXTYaLrk0DH5+cJ3dniTT9fByJNx9fsn9?=
 =?us-ascii?Q?Ofwgfg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4yrRRKu+l/UgppjDDR+qeIoLM9Kye+fiZwXdcnFptcVoReYwzuEL/1hPgBBD0+p0R8L7khd5zAnSnH/Ka0nb5py4A91rBXRZszXS9cSJoeI5E4DwNJnE3DedDMpqbycCrem8zTBDu0aKBe0Lx5oDXl+KRJ2miZWT3m7F0lO2Dsg1mWARzjFcM7W4shtkRk+TImM7JibTFTw2gfKVJoB27yFxJz86p6bhyIKoGMyoWjdybJdNglwcglQQVl5fMx/iJUuZmW4DgTAyN4ZM3rWBMlL0L8NbbH26spZawgwl9IO9HiIKHnuvSLhTQRYe0K1cULaXCPLuceLpEfOoueiQh8eMX5yVvdqzjuK/z+ZhuIetC5pph4B8Q51HRNRDKAyzybf+59iZK1uUaigSzZrOAbACHAKJnnyA4fPUtoeWItECTRXJFACTdkSFS6k0jczc
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:02:58.7782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 661b2861-bef3-4497-3d70-08de72eca220
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8422
X-Proofpoint-ORIG-GUID: eiuTlVv3iLr-15qgaZmZIXSxrTWaO7gk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyOCBTYWx0ZWRfX4jml6mz83MBz
 q1B73Sq/aN9nmzpxKL2otqiAIaXFRkLEtZdIXXtw+npkXscSkXZq/5v2gY3diGKd781gK6CETvJ
 Fv7C0k6hJRcDT+2GSCTrugkIY+scRzs2myUziBI/PxPCI18TuOu2cNRiggRaFSyE5Oyp1TEvLD0
 W3c6V8lTLSHOi4Bq+zdUxfqt5ZoX10p/zMWjYbXVe9m8+yb21z4dM1HEfnuxxvR81byFrA0UsoO
 Fii6dwJnNQEZVNq5mbF6Ufukn0l0z5x1PcRSZfRa85JRcaAiMQ3Wr4AcKy6T2kyAsPM26nkOIDp
 7tRqE2t3qTbEyAEpHEXM5fGRChFYAeDIv3qw45bFgMwpDkKzhKF6fne002QcC0glprYBZvMYN8n
 pZ042iztzZXWn0Y4XqSoRl0KOKI/XewbLHTinqnUaoSJfxHGRC4CoV2yy+v8ebhW9Zqt4nwJfEg
 ZCok6lsuptmNV55qD4A==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c6c29 cx=c_pps
 a=d12s6WLQALnS74XQi9GLPg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=JtJDKkjcAk77xkdeeqYA:9
X-Proofpoint-GUID: eiuTlVv3iLr-15qgaZmZIXSxrTWaO7gk
X-Proofpoint-Spam-Reason: safe

Add a device info entry for the Cirrus Logic CS47L47.

CS47L47 has UAJ (headset speaker + mic + jack detect) and DMICs.
The audio ports are similar to the CS42L45 so can be based on the
CS42L45 code.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc_sdw_utils.h         |  2 +
 sound/soc/sdw_utils/Makefile          |  1 +
 sound/soc/sdw_utils/soc_sdw_cs47l47.c | 80 +++++++++++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c   | 36 ++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_cs47l47.c

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 227347c8f0b33..98531e500cbb3 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -259,6 +259,8 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs42l45_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs42l45_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs47l47_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs47l47_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 /* TI */
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index e8bd5ffb1a6ad..a8d091fd374b6 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -6,6 +6,7 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_bridge_cs35l56.o 			\
 		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
 		       soc_sdw_cs42l45.o				\
+		       soc_sdw_cs47l47.o				\
 		       soc_sdw_cs_amp.o					\
 		       soc_sdw_maxim.o \
 		       soc_sdw_ti_amp.o
diff --git a/sound/soc/sdw_utils/soc_sdw_cs47l47.c b/sound/soc/sdw_utils/soc_sdw_cs47l47.c
new file mode 100644
index 0000000000000..259ecf1e0a71a
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_cs47l47.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Based on sof_sdw_cs42l45.c
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2023 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
+
+/*
+ *  soc_sdw_cs47l47 - Helpers to handle CS47L47 from generic machine driver
+ */
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/jack.h>
+#include <sound/soc.h>
+#include <sound/soc-card.h>
+#include <sound/soc-component.h>
+#include <sound/soc-dai.h>
+#include <sound/soc_sdw_utils.h>
+
+static struct snd_soc_jack_pin soc_jack_pins[] = {
+	{
+		.pin    = "cs47l47 OT 43 Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "cs47l47 OT 45 Headset",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "cs47l47 IT 31 Microphone",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+	{
+		.pin    = "cs47l47 IT 33 Headset",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
+int asoc_sdw_cs47l47_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_jack *jack = &ctx->sdw_headset;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s hs:cs47l47",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_card_jack_new_pins(card, "Jack", SND_JACK_MECHANICAL |
+					 SND_JACK_HEADSET | SND_JACK_LINEOUT, jack,
+					 soc_jack_pins, ARRAY_SIZE(soc_jack_pins));
+	if (ret) {
+		dev_err(card->dev, "Failed to create jack: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(card->dev, "Failed to register jack: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_cs47l47_hs_rtd_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_cs47l47_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s mic:cs47l47-dmic",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_cs47l47_dmic_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 0e67d9f34cba3..eeeb91dded9da 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -759,6 +759,42 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.aux_num = 1,
 	},
+	{
+		.part_id = 0x4747,
+		.name_prefix = "cs47l47",
+		.dais = {
+			{
+				.direction = {true, false},
+				.codec_name = "snd_soc_sdca.UAJ.1",
+				.dai_name = "IT 41",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.rtd_init = asoc_sdw_cs47l47_hs_rtd_init,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "snd_soc_sdca.SmartMic.0",
+				.dai_name = "OT 113",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_cs47l47_dmic_rtd_init,
+			},
+			{
+				.direction = {false, true},
+				.codec_name = "snd_soc_sdca.UAJ.1",
+				.dai_name = "OT 36",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+		},
+		.dai_num = 3,
+		.auxs = {
+			{
+				.codec_name = "snd_soc_sdca.HID.2",
+			},
+		},
+		.aux_num = 1,
+	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
 		.name_prefix = "sdw_mockup_mmulti-function",
-- 
2.47.3

