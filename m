Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286AC340A76;
	Thu, 20 Nov 2025 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646285; cv=fail; b=eLkoC5agaYt72Ut24Rmuh/XwGlrHhIVsHVoTr17o8p3fpEaMwZTEY5dBSUUU+J13DjxbeDx0W+mm2n8GvM4QvmjpnXv14Ry5hmIicMxW2S00LGl3pOcEgDGZdX+dd3a+6E0a1+Nmj8gAMoRK9VSpefvH5Jk/WIBuLXUNcF36Glw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646285; c=relaxed/simple;
	bh=I7PZ3ndTxiWGW6qvgY/Ni+qlt2TDNDrLimEaXrouvWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ENu4akfNbWUxHP7KuWpLr9vdpXZCV4QAlFV5NRFDcN4zxp4B98eaU2bp3SHlGI7WHImiyukeglnEEWKB7Rz2CmkTxPsVGkAUY4DGXulef/u5P/xa6l+duYLYnXE2XvPcM8juoupaO9M1+VogLL08oDhxCweiZaaaM2lPBksavqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mIZRxI8t; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GbMHWJhu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mIZRxI8t";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GbMHWJhu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK609YU460858;
	Thu, 20 Nov 2025 07:44:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=p4QBK9/qOtZikm2O
	l+CzauOrOlpojvbrDnzkZ0SgRMI=; b=mIZRxI8tn+vB5egmAALqePwz1tWZNA8S
	o+xR0gNMtkSBDrwGggRug/TjGH1+wshWLjJsKLGdmNnQbh/b/zPgWAaK/oXWBfZD
	pGHmOTFpNkHw9C2nk8JjLF2ZO1BsyRjSITKwp1ZvFXd8mt/R8yCj+DvbX3c5+ZIx
	fP5L5MIJlZIT5m8yFC+Vn4T4esD0TOD6e22r3EbYv2bnEtGWV1qVz/+77h1YLtXL
	VDf+5sQf9fUtIUP+a0g2/D3q3sfVlVVyl4LyaKamLAy4ePhrVbviD/bykh8UdT34
	1mEp83zEoek0H5p7Vht6d6zNpSROoxnaaBcPHcd6403zuK1UV2GyKQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020134.outbound.protection.outlook.com [52.101.201.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1eg5b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:44:41 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhHbQSfYIub/eSI/DiwT8dPemzbXICBk5+Gbvqod+my/2MAwImRlog+PM2ozJMFd1tzjkwN7gM8Qt0z94ygn/USuy8yMHKkHBafrbNXfARh1U2C0A4pOFHWh7IgGJTiZq3MUJlLS6wQZsOlI+C9BJBk90VbLE9jV/cEugKVpAvV5xqlf0dRUrktBzuZYtWYKmWEo6sh6qKVheleBBAxVERNaRK4fAO9e2zou5NIqCHPgkX4PihOzWUFaYfj+DZxRcVXAIoLXdl1pWxo+9ulHe1Nor1btVBRt/5j+lCH3I1jDZeLsKRrq2Cyfnlx8NhrALBfMRG79hEi2PvlaY6/OZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4QBK9/qOtZikm2Ol+CzauOrOlpojvbrDnzkZ0SgRMI=;
 b=Y/urpzUkdOgl1H21miuEgXI0oMG6YbBt0MpTjpehBzRwur5wNfU4ixEKh2i2JtD/cWoSYd+Kw/V+BVEcjDeOZYLhi6c4WffaiNixHy61mCU+KWDoTFb6VvthyEa4sAT/Z5AgQvS1r0a6E5S/aqmY/y3gDkEdTX/hrSOPUs0GFMxlxzzyI0N1GblBUED2S4fE7ywQUDLQY9dt0EHxNnkyUBbU0bAvOjjM6fveGgHHahrKyBfrj6xGgFf/CokaeSKn9MFBkkPwwudIZ8WqYFIi15Xv4ormk/DIsoIpFUwt3cAQ2st6E+nXL6j4Hn9Klc+E9AUi0PKArFSG4KSPypw6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4QBK9/qOtZikm2Ol+CzauOrOlpojvbrDnzkZ0SgRMI=;
 b=GbMHWJhuuMJX1B0k3+kZ1eXIf9bQB/VtEkVykWtveMAEp+bjm8X0mOVkbGyMYCzAa3rb6UfRZhSWRKOnz4djWo2JadmztOtPblpy5z6um2jzzw87PYs1dMkf/ISoL9CKVt/YQG1683ul4aS5RJNGtgzA2/zhrtyd0UB9X5MP0/U=
Received: from BN9PR03CA0387.namprd03.prod.outlook.com (2603:10b6:408:f7::32)
 by LV5PR19MB9036.namprd19.prod.outlook.com (2603:10b6:408:2fd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 13:44:40 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::5b) by BN9PR03CA0387.outlook.office365.com
 (2603:10b6:408:f7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 13:44:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 13:44:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7F066406547;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7935D820247;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/4] ASoC: cs35l56: Set access permissions on volatile read-only controls
Date: Thu, 20 Nov 2025 13:44:33 +0000
Message-ID: <20251120134437.1179191-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|LV5PR19MB9036:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2a18c3b-15b0-490d-0c11-08de283af35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dAIqcKWbsa/BevAV3pjVrtFFJzo+HFZNGNIm+U9TgNvmrvs0FE1gKLtkMH+M?=
 =?us-ascii?Q?lAGtcOX3vPy9ecq0L4UrmY1fzjcqH9wWINhr3259wfyo1kVq+8Xm8DR8QDgf?=
 =?us-ascii?Q?69Kj1/a/7GV7uLimV5Mk9OR4p71U6jrezMPufPqVZ6oMCNwqrTflrj86ej6L?=
 =?us-ascii?Q?dIEZjNGkgKS+966l4lTWixsIr28PQbP3i2K2yVsS9Oj9oXsQzxpT5mbrPi4l?=
 =?us-ascii?Q?Ntfgpxcjkkt+YJNvEsE6w7VZN3eWFcfdges+tWviT3LylKOiM9MBoXe/DoFJ?=
 =?us-ascii?Q?5T4DyOSTmt/4tkJiI4fdpcPoHp9ubVyit4Dzrl9otsZaJCNT+zWCYVsMDJPv?=
 =?us-ascii?Q?p9M58GmVRDkxUrM+Lznmo4jJDZcQpeRk/h0NqU7ir4MIyGkzUmAtnfMkPwVG?=
 =?us-ascii?Q?kutsOnmlC7/F1717TAU630hygfZAzuBNZuv9YYQE4aEk3LGeEotlfZvhHQhY?=
 =?us-ascii?Q?CWq0xEMdzBi+qiQ4EzWbFMDZUgLg3P6tVZZlCoFPSh1Okb4BExTfLrjtkVGH?=
 =?us-ascii?Q?t+4xBvtyzFcT9Kda2GYzhgr5EVC2sK/V7jy1nTSHtN66WYFPTBmiGsZou3OV?=
 =?us-ascii?Q?18yRuYwK7K9uC1KQNI79/ilf+vEdOIzLXjoNrAvDRouSM+giJlvh4KGK7g8L?=
 =?us-ascii?Q?PiOtHi24bmXHckzLrVQfhN3eDYsbX/+ZSPIIJEV+9ecElWiU+U+0vgl0sYQn?=
 =?us-ascii?Q?GK7ltFpC9ly8cuJNumQoTZsjB13VBUOmZ6jEz4U9AXJJV6jcBU5pz9TRO1DQ?=
 =?us-ascii?Q?9Z3DCAAerF99ALGvlYRx7+SX/qce+VwIblTWy91f4YJ6ZCRvMdXfQYc7keQe?=
 =?us-ascii?Q?ZSGDQVeTdEeK86ovdbqgRWJd7oUjevrHx2JOPXvuRxd3+4ikcVboBtqIE6Bf?=
 =?us-ascii?Q?pLc7pq38CjME5O1SWYfD4Yh6ZwVyLu0/KOnUJ0YUzIjATkru0RVoMcgU+Zjb?=
 =?us-ascii?Q?+Lq15/np93bLXk/vhWFdohKM/t899eZJ9G1dcihQfx1wBzWC9ldo3OdVmR0j?=
 =?us-ascii?Q?eEfGrn19HJiMJDFvT6UNdwo8Cto5IizOBIYJ0aMyNjU+p+etoFLgsKR0bAcu?=
 =?us-ascii?Q?m3g6U0tomkPyS8FJKLcpisVh6IVNnjOMDFHmF+aJVq9MpuzjkaDWBlt6DKh4?=
 =?us-ascii?Q?WOLTiBdjVtPL3fWlg3BhTnOIPj4/799zQXKyplESjCRkHiUopq8R24PM2sKL?=
 =?us-ascii?Q?sVw79IKVCoMYBNYDFvGSgB/5br5EsVzYWh2mNOrBePMBOb3DylAbro2nYmns?=
 =?us-ascii?Q?mYJXv/1vt0+OZR+zn3c3o5EpdThj2BzTYHex0/uBKnkksKvPxM9qo+G+9dnP?=
 =?us-ascii?Q?sDnNXUSTrjbIWylTg17NbVyzsf59UHo2R0zVB0/4pwhB8sZRZ58RaTEqMjMW?=
 =?us-ascii?Q?M5osxzWqn5QOhWoIjElY+CRS8Kt9udWf4V8Q3hUNaGCgOQ6oKebupGgXzo8D?=
 =?us-ascii?Q?hRFVz75zt2yK9LyP437B2Pyqcf2FyGR4rqRDxGjM2o+SOVnXqtffWRXbDzzC?=
 =?us-ascii?Q?USIFznQTVE44UX58v2f4N+a331ZG8lPLHv/JCI5rrz/Vi/vBbbaxGRVorlnH?=
 =?us-ascii?Q?sGmp+o6B9hMi+bF4jWI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:44:38.7120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a18c3b-15b0-490d-0c11-08de283af35b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9036
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f1b49 cx=c_pps
 a=h3Jk+6XEKCuoUZR+ZnWw9Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JI3wvMPb9kskofO0gesA:9
X-Proofpoint-GUID: k1kyjmL46PWo4886iU1U4T_g-7cJCSBA
X-Proofpoint-ORIG-GUID: k1kyjmL46PWo4886iU1U4T_g-7cJCSBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4OCBTYWx0ZWRfX35Bnx8OybBAS
 eiIK7E1zyWnFLyDcoqpe5KYb5GUs5AxeHjaHaGiWvZdtvfQ9mBO6GP9IhG0eH8CBg4UMsDynZEn
 Tw9zuHJBVqpEI+GL/hPHOCd9izzDhmibM/2qO3faf5N9ccXyIHc4oyMv7lToj7vbamhdC99do+Y
 3Y65xwSSA/matXyZ4T3huuTiBO8kW0Mut3z60Hhve2JEzSrlpLY4wuhR0QqGiQ+ZftzV3VIEGIq
 bBHNgKf7rVhFamPXbvyRCMVzhMHrDmd3zleNV3jODVj4Nghe0d/2UoqELlULhqJmXb/4t7MsCSX
 CpR9tU/VVkKNElxaw+ZO4QpPVcvqbqx7gBzJ/fciAu6WA2UeY7KRxoKMHZtS/dqhX6A+mgN3R1I
 dUekEk5ZvPkCKGY5ZxUvgTCIOExyag==
X-Proofpoint-Spam-Reason: safe

The CAL_SET_STATUS and CAL_DATA_RB controls are volatile and read-only, but
the existing ASoC macros to define controls don't allow setting access
permissions, so those controls were marked as non-volatile read/write.
These four patches fix that.

The first two patches add two new control macros to soc.h. I really don't
like codec drivers open-coding a kcontrol_new content for a control that
will be managed by the ASoC info/get/put handlers. If a new type of ASoC
control definition is needed it's better to have it in soc.h so all the
dependencies between ASoC and the kcontrol_new content are in one place.

Richard Fitzgerald (4):
  ASoC: soc.h: Add SOC_ENUM_EXT_ACC() to allow setting access flags
  ASoC: soc.h: Add SND_SOC_BYTES_E_ACC() to allow setting access flags
  ASoC: cs35l56: Use SOC_ENUM_EXT_ACC() for CAL_SET_STATUS control
  ASoC: cs35l56: Use SND_SOC_BYTES_E_ACC() for CAL_DATA_RB control

 include/sound/soc.h        | 14 ++++++++++++++
 sound/soc/codecs/cs35l56.c | 15 +++++++++------
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.47.3

