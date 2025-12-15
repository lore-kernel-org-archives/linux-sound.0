Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5E326D77
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813099; cv=fail; b=AhO5m3sNfDfeZ9go5D+t3Nipmx8GQNrz1lZVvZQmd4TZLkF8BFkpHSuZBBrJJPP9QGDa8SJ4Sh9z91zTgBXqHkigX7/cEUdD2TUr3PO1vACRBVrvIDI1v1WPAyANXEfrhtylnfm88iiqqG3dci5BnO0VYyT/vMOh0sCLYgw5l6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813099; c=relaxed/simple;
	bh=r4fyhYTCTiFCMSWLHKi2+Hr1yV5MjFEUsz8kkXREiTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hYCYLkv2a1OCV9Vg1NqIMdiMxQUx1XjfJwD084Z4Rr95mSZF6erxDxegmOI4RVyZmswaraDhXX2yO6TpHGqOX/Eu3S4UAzwzODybIgmS4jZ5Wrk3+Ho5XQmriE8VOSp76LnEaWtkyFnbPwc1n3Co5PPrJgRjEfeAWEd5m6+KNsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=T+zDRsWb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DpiM6UNA; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="T+zDRsWb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DpiM6UNA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFEuUbd1043325;
	Mon, 15 Dec 2025 09:37:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=iE4BYwrAE7B2spYz
	3bR5AKMRQDdttHAxja0z7eDv8o0=; b=T+zDRsWbUiWp21HnLOnBX6d97KISWH1A
	5VdtOonwMoVMdoJAGQepVpSmM6iqDnEm5Z5hGNBOgy3GJbETlCxzpGwZwu7nI8bv
	m/qX2EYnYToTHWHo8/4X508ES2LJQCf0ChZU32VjpDjYRobcn/IONETZ5H3ZzDsL
	25L17u559MALVBmMqTR3IF6E4JusAUT4Mayc8MjkX8VKie/yoJqE2swvbuM1uzAW
	WJjo8hCk+PTcSqVG76rof0OuTc9wZz0cOlRZqsEy1QwxznOSTd6EK/WX++ztz14Q
	NYAWkWgEdhqvo356h+P0QW9Yorfll5Kqxg5rQkZxWc4v/yPquMrS9g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023095.outbound.protection.outlook.com [40.107.201.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b16e1t13h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 09:37:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS7U7ih6MENl/O1cvObp1EVkAzzy+NZ/QC6i1z0tjIsBWozcxMubKyGO4aw9qnFY+dOGbkZNTsuSPoiWQbV9dXeKoKStTRuJTov4AgEHJ5W5j8VSVujxArN1dXp9s2Zzzzae1fuc6Oec5tG7512mwegmXzwZZ5bX+HFl0/HJz1DT/bOISXO1oCrMD9Hxr/TsuQ5s/1miqAcg9Xfxv3K9W67SzqIPOnf2MzRRUuLZt9E32sJ+MRixBESMvb3j3GEGeZwgnumOOdX+yztOZl0kOrKK5pTYAokoS77/2KCBgllDJsaqFGcQ/TNkqM1hbEATVLsdKRgNI3d9j1cwuckU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iE4BYwrAE7B2spYz3bR5AKMRQDdttHAxja0z7eDv8o0=;
 b=sJFVf31AG5wlVHinbtnNZNlKjrhwp56ZRTBrOhD9cETwUJFJrZKIXJc62DuPD5U4ab8vYoMD2RCBUHXwKRw7c00HsB0+6nNYCfTiCaPDiWvMH91YfuWkNS9OVHhRWVqMBKTWnoL3KnrDo7qIsG4FpLn6tuqH5uEUbBAlGqi4glioqsN4JDcOer2CnCUpN4Bi9wRac+CNVgAVUjongR51BVcu7lrBMZ03tei925u/rju5dKOT8fMO4locT6/Kf9nTW0mk8NyNtsnEGY5yDsATAFge6BWmrsyPgzIr6Jep27DGZhxfK9+wLm3qqOK4Pd7IGlLIi5KM3tsu8H+czznRTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iE4BYwrAE7B2spYz3bR5AKMRQDdttHAxja0z7eDv8o0=;
 b=DpiM6UNAJJj3uWx2j3wN5lFpYoyWstWWJjqoFHeEoD9pLfEkr4S1mvtJXI5IpQDv98VObAcPz175CzTsp09/LobTjFnF9j45AviEU1z8m77iSNFUIqs5PvHjsu5JYEs6T2y2jF5utmJN9Ny1WXITyqc10xCOc50+70hW+tHvFt4=
Received: from CY8PR10CA0005.namprd10.prod.outlook.com (2603:10b6:930:4f::22)
 by PH3PPF79B86B634.namprd19.prod.outlook.com (2603:10b6:518:1::c31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:36:57 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:930:4f:cafe::e2) by CY8PR10CA0005.outlook.office365.com
 (2603:10b6:930:4f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 15:36:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 53C87406540;
	Mon, 15 Dec 2025 15:36:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3D0B6820247;
	Mon, 15 Dec 2025 15:36:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/3] SDCA Jack Fixups
Date: Mon, 15 Dec 2025 15:36:46 +0000
Message-ID: <20251215153650.3913117-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|PH3PPF79B86B634:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 63ea8cf7-29b8-42e0-e3f1-08de3befc6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U6oAVwPySUxrnwoEazlFfZkAIeemaplO8Fs4Cb4WBQeRTjcmhHiuiYoJRW6w?=
 =?us-ascii?Q?T91pa3XQWJw73j/0flhBPjiDHMxBWcnFwWBMKJS3btZ13a2EBqN63ouU2ukj?=
 =?us-ascii?Q?5xgVmjx2KnD6eklomkbzWT78k+p7122lpzBooBTaWyP1/lYLo+wKnsjfaCqu?=
 =?us-ascii?Q?WH9IZylo60Bst4pxlOPuvXBbfxfGhtSxF+0g6YGM9BDilxem6rF2Bn6CYfec?=
 =?us-ascii?Q?JNOdBE/eCQrvSgggTiNqLhXVAv9PqV9W6urD2NIOvAhCxbIs+oy1OHhH5jZW?=
 =?us-ascii?Q?nA7FGkcuFGUlfxqeEGBqfFYY+2xiP51pIo9tE6vRCEu3GtV3mpq3I43GPt2J?=
 =?us-ascii?Q?bST/pLENiO7NFLSydcKnyxkp0YgV5Wx60vy5/cm2BZIl0k2A36k0hGV+/QQh?=
 =?us-ascii?Q?eLdlJ1VShZZZX5uOgid9cx41g4aPbxFOV0B19LBv87VNV+jN9GKy1AnJfeRV?=
 =?us-ascii?Q?eFrSrI0LQZvyhULVGa9HGs8EIHsclgF7c3FVb9X/IsG83oXqTeDJBaX2Az6+?=
 =?us-ascii?Q?gQL6TviRMQNyCvHfw7fdhq7QDejJUaNXPIwM/bzdGH3WOa+w+HBzrBvn5bz1?=
 =?us-ascii?Q?GX7fr1A4noGhWbNsyKf9jofMcrewe4btDq5jy7QxVA8fj2fTGls54e/2LtX8?=
 =?us-ascii?Q?p1t/smm5EUSGbn4PtTsKrl2JykouObzGsFR8OGZ/Ux/Q5P69zsl4xRn2JFT3?=
 =?us-ascii?Q?BPaRg4PxFNzQh+TbEdkLypbIJ3iRW/4SS5BwlT/mySYr6M/xQfbnebi1juoM?=
 =?us-ascii?Q?bIPKR6Z8OcIrJC9Elr//IKQIJzGIdVtLYnd9aormsgIqToVrIT/lNG/Ry+9v?=
 =?us-ascii?Q?Fnb8U9P43rTYgsxxFJbRxM4jcVinDjykSFvvt2HMlUH4L9U827H4MblsHzXv?=
 =?us-ascii?Q?ayQ/zVRRzg5nTUkd/R88CEFzOCjuVULoy3lJasbPcE387VSwPuVkPn8RfmNM?=
 =?us-ascii?Q?BXg6aAMy12ObrSpKwLBzG64JURBQ8vLx4vLbTpWSd7oMZUWEAuRi1ZOyhGq1?=
 =?us-ascii?Q?BJGUrMS1hVUEO3VTaSHoyYm+Zccj5oyY/XLYilQH3sEnXuftNgYPldAAhZ2V?=
 =?us-ascii?Q?g1hYUZQIk2BtQXLvuwGJqVzthtOzVI5gH6VoIP7seIo0RW5HfhvAdrSuSnlN?=
 =?us-ascii?Q?5by4UvMNKw9jylUNFDijaj1e0lVw8Qw6mC7kruSuj8FahmnozehciszxjaM3?=
 =?us-ascii?Q?wM7DQIDOa5dRD/fjCOAFgXRmsgdm1X9nQ9Bp9+R0KMLy28u5ZQVpfoUPC41C?=
 =?us-ascii?Q?Kdez819EBI8XqKrpakSZv4I6FHIeIYRz9dRz0RkhzcQ28jFkcj/71JaMt2EF?=
 =?us-ascii?Q?UTkwx1ppjasHOmpOHNgtnkl8j/SBfCIgoSOdAtkdtYl03WNRxaeu4OYZ1+IJ?=
 =?us-ascii?Q?C+qNt8MHd5ozXSghidWLKodxkJJL+bWxVa5V64kE8WN0X6EC/Zk3/kYHGmrw?=
 =?us-ascii?Q?zMB+gluQbG0BDGcAb+e6McL6e8YK7snVmRKV09QbAZi1dhS6HGIrI4JtuD+j?=
 =?us-ascii?Q?SSaKzZ05uXBXLeA5lcycQKMaLurI1gaqfqqc0EgnapvJuTRYU0GA2xw7GLC1?=
 =?us-ascii?Q?l+t9Cs3rCLAqgQ2FEuU=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:36:54.7935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ea8cf7-29b8-42e0-e3f1-08de3befc6c0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF79B86B634
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzNSBTYWx0ZWRfXy9Z+gfP1lC97
 HCyb7So6T0+k/OtmflYdMbG/04xQoZn6OOujYVuJEY0nIvZKodxemnvpG6VFkQJbeKx9ffT2egT
 ffafGMN00niKFeDz5taCDo+tCnVP88TdpibNGe7I35ZU6lS25ZDQs2C1VJuy87j8Q54Kh5WMqxq
 IUUsezFwchYqPdNq5i4+QucjFp0IIN3qNvPMDRLtVTV1ac4oxkQqWkx22oMq5K7PS20F+F9ogiL
 fpJFXcPosz+UiRH6gug2bAsBUuxiYYqjDtuDhOZfO1FbuEf9Mg9WmvG8DF5Njn1sXhWDo26vWlf
 V+h1y41nLJf1QuNERzYmezATGQMKc2iE6dWzHokDFy6WGotD0aM6wBfLOGJnc6vlSwYa3CbEfwo
 nOLKnZ5wbEnfMFicVmJ0BhAI3HXsaw==
X-Proofpoint-ORIG-GUID: qaauhkH73qYu5r-EGJOeE50gxo0lTB_x
X-Authority-Analysis: v=2.4 cv=Qdprf8bv c=1 sm=1 tr=0 ts=69402b1e cx=c_pps
 a=iE0qjxSwE5SXcvk24aZtBQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fn88FT8S_8L-ibgbL_oA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
X-Proofpoint-GUID: qaauhkH73qYu5r-EGJOeE50gxo0lTB_x
X-Proofpoint-Spam-Reason: safe

Some fixups to the jack handling, adding some necessary hooks to connect
things with the machine driver. I have split these out from the system
suspend chain as that has been generating a fair amount of discussion
and getting these 3 merged is far more important to get basic
functionality working smoothly. I will do a spin of the system suspend
stuff soon, if either no new comments pop up, or we reach some consensus
on how to proceed.

Thanks,
Charles

Charles Keepax (3):
  ASoC: SDCA: Factor out jack handling into new c file
  ASoC: SDCA: Add ability to connect SDCA jacks to ASoC jacks
  ASoC: SDCA: Add ASoC jack hookup in class driver

 include/sound/sdca_jack.h            |  32 ++++
 sound/soc/sdca/Makefile              |   2 +-
 sound/soc/sdca/sdca_class_function.c |  13 ++
 sound/soc/sdca/sdca_interrupts.c     |  83 +--------
 sound/soc/sdca/sdca_jack.c           | 244 +++++++++++++++++++++++++++
 5 files changed, 297 insertions(+), 77 deletions(-)
 create mode 100644 include/sound/sdca_jack.h
 create mode 100644 sound/soc/sdca/sdca_jack.c

-- 
2.47.3

