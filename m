Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33E81E521A
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752165305; cv=fail; b=Lwcjo9i/R16YxQsQqFI7GMq1J59hgbWe893A+4dGAjLMEoJlYmwBebONX5NRRgH9Zm8cARKLMJtKXAviCrJfwXZGuRe9KS5J5g4qC9MOrif7ZPJ4CasFBizxTr1SwZ7FiIiqVRwOeviorosgWwriPTueyzqUXUtSANBhhMC+eJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752165305; c=relaxed/simple;
	bh=vu9OCGadNO3Svm3L70Ai2EfD8twOvEL0UlZqS5rL3As=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Yuz7J0bwQ/qV1R4exN1+ypimheNhSgxRZnVPEamZvcUndxHMDmTmAtJFLyhxcARhBeLmGaRw1T8TsN9yy//Qlil9SHkxLkf2YI8zrRPbKIrelZMVdji78uRzorvlJB79J1ZtVTpWQ/zPGIbntoVew1UYpngbQ5SZujZIyxVMVwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GQjM9zId; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=n24hV7Vx; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GQjM9zId";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="n24hV7Vx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A4wXGp028232;
	Thu, 10 Jul 2025 11:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=8tWW6i7Z7jl+jrMD
	ZE7/kIgp0iSqSizhk7Au+De9TSs=; b=GQjM9zIdSP/RH89mH+HFdHwE6zKaIc9+
	+gQHGoM1n7RbXN2FgZOEwJ53ZFP/45Bm4EjLUqLCtf1Kt3LwHkcaEDcS9HQXR+UR
	+hQ6P3KpJ/6HJZVAfZa4VY36cefTLYolRSw2Z1VXGLWv+8RGuPPlEFg7J/CiKRce
	wQop+F6AqLQsdNGTK68JAsoz20TPAwrVVTMjhRsoAmVmTXlOQyfjuSNpnjvrE6Mm
	CGLyKKzAJaM5qVWwtjyoEazKEVe10lyUQnGYFSJu0g9oDYZxW81n7ae5bnW9BTQi
	4JnK2bIdNt2Wd8baCOZKkAVFedRp/50FQWNKpCNACwDwxuKDOn1V6w==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2109.outbound.protection.outlook.com [40.107.220.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev6c113-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 11:34:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA+Wx8sVthPlNHUkPQvPYI5by+Z7cOK/7TqHH4jwmI7Ut+QJ3b70yF0f3NqsboJUWDMKRB2uYy7Kie6hkfgjqK3+f2kYJQtT3VU2uNNNY+aWjXMBo9A/vqgQAVEjlUcTvpTksWGUvIo1/vJt3Ixm2FueBzb4R0y3Qdz9P08KcfnOMPhPbND4r5tjXhBmTGtA9j1YU/K0QB3yu3c5pgmVbr8bulwI3KZ1d4smuw1pstBm0ac7n8/0eW6kbuAB4cfcEHSOKNkqx2xW5PtPgf3L/bpW82AbVrm8x7Y2alRIRqud05HevJ3cvlik/MjWRGzoVTXBLYDBD2/OKuemYytUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tWW6i7Z7jl+jrMDZE7/kIgp0iSqSizhk7Au+De9TSs=;
 b=zTuHgE8rXHu/tNhpK6gJm8JN3X9Z/bGEI77vonDVrR0bIub0NrhSvjUlUDYw/1RPJY1Nwcpd0hiaYMo8fr2yrDzcRpL05lCRScFzvpDKUddP44nO5JPAQ2oxqqNHdQmchzPYYbACkk/mV8nexhsZ2wz18NWWLwfdqC24QfD53aYE1XMPYu8WHFYOrYRUfJMWwLZ3YtHzR7LCVwFb5EDwEHTt0hAV+mXiE9XUITYq8HXdraoweAK5o3g7hok0shyXi24A3fKvAAbHzaxnjyiQhvQy7GcL5VGl6hzLUByhIKCeGPJZb23P/ETORkalHdP/JmAyuaqyA5BTPLie0Zwufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tWW6i7Z7jl+jrMDZE7/kIgp0iSqSizhk7Au+De9TSs=;
 b=n24hV7VxYt8kvqo/SMQZB2b3ymKhCL8tQC09zcZbfXYshvee+JPGGLKSBJfV+ypWCMjC39JJ8SNHQuduYFljR9dTbwT/OXlKeO5LQRE2Ed8ZYoxjZ+7G8+kmbqmhoZyVfsAbWF0fWOz+ayPJs5nI8anhVL+C06829HCVVb7s1rk=
Received: from BYAPR07CA0032.namprd07.prod.outlook.com (2603:10b6:a02:bc::45)
 by PH3PPF32277437D.namprd19.prod.outlook.com (2603:10b6:518:1::c10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 16:34:30 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::9c) by BYAPR07CA0032.outlook.office365.com
 (2603:10b6:a02:bc::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Thu,
 10 Jul 2025 16:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Thu, 10 Jul 2025 16:34:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6378B406545;
	Thu, 10 Jul 2025 16:34:28 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 46F3882024B;
	Thu, 10 Jul 2025 16:34:28 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        arnd@kernel.org, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org
Subject: [PATCH 0/2] Update SDCA Kconfig
Date: Thu, 10 Jul 2025 17:34:22 +0100
Message-Id: <20250710163424.1158958-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|PH3PPF32277437D:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b625cce8-649e-4118-72fe-08ddbfcfa4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VX23aloQNNweudkMpwneK6sw0kIC62MBbt9B0rdfnDg+rLIDojHmk8ILHz7F?=
 =?us-ascii?Q?l3bBzgU0VEM1X1oh160/XN+3fExBODafTzSQ0smaSJ1EYARdo8iPBbufFyOB?=
 =?us-ascii?Q?J7oZfwOoEXwL/czdb7GIsp2UY67ognEOOCa8EXk9KWMw4vTDdyt8h9Tg7DH/?=
 =?us-ascii?Q?cXTOgLw904ZE+SmRzqZdEMX75kpqNcssPjj8a98elbvGjjYq32dzEqYv6CUT?=
 =?us-ascii?Q?l7PIl18VA/W+h1egU5s+l7tw5U7yYFX0+FQjBCu9Wke1w0sZ9gQeR74k+sbz?=
 =?us-ascii?Q?UXWSI/geW4BOGTgSjar+YRNDWDkNFK/9/rxOGurDTQR772MM+rTfGFV22O2o?=
 =?us-ascii?Q?gOCRf72TcCeCVMNkD0kG/NqXxWcpABkT2NjH0GTcfwgtSr/JuVASuVJ5HWMR?=
 =?us-ascii?Q?2spnvU2camALi4XH+V5jZ47EkcuOZLfZLu/ZUj4CWuHhp+QOTVAKjh1RUh8p?=
 =?us-ascii?Q?2ztKFuDZffWG1RIHAHIGGTmjor09hWZyjiA4Ei7qvgSWxggUbIUzLk2sBYJA?=
 =?us-ascii?Q?2H9nMmxNqxey0QlsDl78eVCQESVWVyILXFftA0iL+ficuVrEroEiCZUPWon0?=
 =?us-ascii?Q?mGJHuVruE0hATT2UctENxzNuAzfywQg9CSm0337Ic24jKAuGxgbNwXma0TX2?=
 =?us-ascii?Q?YAomCngBgimko1H68P667FgxBKsnYqH/nneVsMPFSLwycZ/CE49KzWk/ONnR?=
 =?us-ascii?Q?Dfp3WdzbtqpSFcNtKEJAThhgaVjF/XS5PyJRxGpK90PISRUpb0csWVg65A44?=
 =?us-ascii?Q?xSFOynXDXA3QaUyUCUVzEwVc94DMXFCnCAOrXIfgkf8yLauWA0vMm2bOjHaE?=
 =?us-ascii?Q?9Ddz4hc8aPlDdTA6uFg2fIBCOZrDtvGWhzSykvniE+0DHC9RTVj8ijx/H56m?=
 =?us-ascii?Q?65vmexJ9ODeibNJTHwk7lLH8664tnkoNDOX3bfgNRjSf7HdsFx+vTM7bR9Rm?=
 =?us-ascii?Q?kZp+6W9NPiM7IvcuL9tpgXs+WInL2cmRaJR/jnixe5UN2peMbYv860DjI+um?=
 =?us-ascii?Q?tI2HGXi+9H7xad0ycUwniZsDxKT6npMyfsf44OUY75gV1GL+u/ojZmJQ3Uvw?=
 =?us-ascii?Q?ZaUXNK3gc6kYghYCbPqYH0uAhgRyjh9XVqj79djjcso4z+LT8Tuxh6ljxqAm?=
 =?us-ascii?Q?EKAvPH2yneG7zniI33588oZZ7F65mXOzjcs6oLOJvo8MHaNZJfqf3pGBX96R?=
 =?us-ascii?Q?hwPRog8EyhCmFGCw7XltlZMvH3yCI230CC89yUt5r5TEampeu6rW7U1Kf2/o?=
 =?us-ascii?Q?CEwqH2VMEcehnnuymMbM1LsBpgx9z5AlYGvOx566RGm+3uOu5JwmS7mEZTuq?=
 =?us-ascii?Q?auHmc37CWcEtMzB3A8cbSJpBvhyr+VqXwZnCfbMx3HWOKRMfNDVuxs3cezt/?=
 =?us-ascii?Q?EFzMDU6m/bhEGwi892p31FQQwOuW/RAckVO8U0oe6pp5k+VV8mW0/GN+zMqw?=
 =?us-ascii?Q?u15NUsivzzh7S4judMauWGljnEh8vhPCBENfbZRgcEvhul8p6CvljmBnD2uS?=
 =?us-ascii?Q?VtaB8phEPNqhlD33YTWktv+UCIryGbqRE/ES?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 16:34:29.8185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b625cce8-649e-4118-72fe-08ddbfcfa4dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF32277437D
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=686feba4 cx=c_pps a=/kIIv5gWBFZB6fafmoujMw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=RWc_ulEos4gA:10 a=hnOecjECFid-8l_UJcgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MSBTYWx0ZWRfX3UsbBHOg1qWc L6RjsFr/r2ID9eVCVTIxK2JwtoAojm3Ix04GX4U0aOtbnSn+7CoHUlz5A7KIjJcUzY8aeeFf9lg X20gRs5kirUkyGTJpurgaJC1A1q6VnlO//Qc3RFiFswMUoXbhxi7woIgfPMy6bGnkcp1Lz02V+D
 nj9pTV2fdH1WgFoLl+lKV8Kz/sDdebBKHdTSP2PgAouxAa32PEvYNcYPZxHR7qZBil2wQYtpQ9u 9FVWO09imPwoE39Afkimu152s5TdCz/t5AAT/6XiIzq3uiGCIREfFQ9LvIDim7AS8pP4+fIx1kY +11Fem5o7OKaW6aWNI96zZpdbhHlS2/Mm2sCFU7hJtcVqx1X/Z47kRSxowfg0L5+R/zqZfjXNA8
 dxx+7wa+QtFsg0Tu4Mg2I3KBz5joungIbYLWYX7CZ3mYN8xZEsEXXZr3XcI8nLx5gWtdm5bb
X-Proofpoint-ORIG-GUID: iK_oquto_R6Ogjz-VbUtBZyb87DhSiPA
X-Proofpoint-GUID: iK_oquto_R6Ogjz-VbUtBZyb87DhSiPA
X-Proofpoint-Spam-Reason: safe

Tidy up a bunch of makefile and Kconfig things, and pull the HID and IRQ
into the main SDCA module.

Charles Keepax (2):
  ASoC: SDCA: Kconfig/Makefile fixups
  ASoC: SDCA: Pull HID and IRQ into the primary SDCA module

 sound/soc/sdca/Kconfig           | 15 ++++++++++-----
 sound/soc/sdca/Makefile          | 14 +++++++-------
 sound/soc/sdca/sdca_functions.c  |  1 -
 sound/soc/sdca/sdca_hid.c        |  2 +-
 sound/soc/sdca/sdca_interrupts.c |  8 ++++----
 5 files changed, 22 insertions(+), 18 deletions(-)

-- 
2.39.5

