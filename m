Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF230C616;
	Tue, 27 Jan 2026 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535320; cv=fail; b=OD44GfhwTGTqMGB1Quo5ylFbhepWQi11P7MXoEY2iziNU/YcKBBqyamXOci+mO/EemFzGtTL1up9PE2Y9FU7XMwUsEVyxKr7py+Z/gJ487XsfxmpRlPlslTwXs9EnghZZnxJHjIBvs1vAhzeX+D43DUkDKnplqZ9Q7P4vDVOUeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535320; c=relaxed/simple;
	bh=9QD7xbSgtsK6Er8ftEzhohG6tybZp7WZdycYiDeuVnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fCs7uOqmpYb/F5rN6oANtMkNxEPecg5lB8TWJgVwWWU+KanCINwV4aLZVhqrY0BY7/X1Qk56D+gFZjo44ZpCScPuetpBx17sUXNRe4UI0EyoTX813ekngg9M8k/cVoebu7SfhHo9Evz2u/GMMuKHBo6e6K52l2YliN77h/a46C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hxCvfyq6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cdiv9h0f; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hxCvfyq6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cdiv9h0f"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R5wLqc002930;
	Tue, 27 Jan 2026 11:35:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=sehxEmIrOMD+Wos0
	2yhWdsftHRzoNPwFX/faBzhpXPU=; b=hxCvfyq68uYO/q4HZBiSfRrHm/sDODGl
	c4C9LEEWWZyBPALmTRpArJ/r76RyT33mI0GgqPEcQkDU0h0l1gvJ81jFEXs2aWl5
	F2sVX4EPmT9IKNtXkiLPoGnKxbVMuHSuGhtya6/QJGTygkDTUceiSjYafCDeysug
	64fJWtiZ2te/HjhdU8YdNSgJfBg9Nt7d7bhTwtdFofcDO+NpNelaiPEDFxftJRxj
	2ZlDIciqdEpw0eaQ4Dr2DO3skhYjydNg7seWaroruH0g/btPLney000U7JJlgZ74
	PkfJcph1YPcUcBPJQBwA7FPNQ7eYVs5Ni6lLsy/xQZQC/fqEQPZ5tg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020079.outbound.protection.outlook.com [52.101.193.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc037ch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 11:35:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aP9e4zUSmg7sQyGt2wqWVddwoRvNChPcP69XFS0revOrq1JxXOse7QOP/tBrSJoMbpCpQDDMyM8lvBaGlTFzMTM9hCS7EnBpp4kisV1Cr65uLZ4TL+CZjJZmCYCEc/0EQHrxSunnn0gF4qKZEJq5LuAYdVon35dgZPo1pH6oYmUyyDAT0UIlKpGJnBcdrGcBzLuZgXleuxm7CkAUxqPjl4jNDv2FX8n3ZxDltwHAKbhb/b1i+1tS1BHYQpUbpOErQRb+VODgANPuO+8gPOs0sPkilAlxPV7CPQxwrKzFua+DjSurI4SRbO0WLMaMds+++Nqx+gGU0c0kJ+NZo+ViPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sehxEmIrOMD+Wos02yhWdsftHRzoNPwFX/faBzhpXPU=;
 b=aAJ+ePq4BrsVFPo7ynBvZMcwezfajURPvUhq96Fg2D9NRMJZcX76P2uwiQ4u+Em2TQTx3U7wHm7GPacz9SCXSYpkBs2J+xV8f+29MDk3kNPeKgVxmbxj+hPFjBZXbpRfHMLpjtIjhaYX29nxYfB65RjrbWCHTG54Y6Y1BFhyOaHyU5ewdSxABA86VAIIJvNXqo5NcF+3GsfhvIWwyEYxjGLcRjCQpScmUTE9nJx62J84IXbNL7FXYtdPIsoaX42XdDn+0XPi/4pCJpHDOP3wbI8GtxsIMneBtMxXuI+ktThHsyNgso/e/S12lEcai49u4VeSadnA1vP8y8BGgYPoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sehxEmIrOMD+Wos02yhWdsftHRzoNPwFX/faBzhpXPU=;
 b=cdiv9h0f7NPU4yTHPJEesDUxaxue0XxuduvFBda7fJpPhn0wTHCWgkDfFGb8/IVOIHiQYrz1+aWcDgn1wTE8xWSUh6PNQrWIJDzFwUDwFlYC05lPmSkmG1m3lykl1GH++LYjVjYClgGh5+G4eVT2IpZytZ5qxDsuivA/PWzOpzQ=
Received: from BN0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:408:e4::34)
 by LV0PR19MB9647.namprd19.prod.outlook.com (2603:10b6:408:31f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 17:35:06 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::17) by BN0PR02CA0029.outlook.office365.com
 (2603:10b6:408:e4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 17:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Tue, 27 Jan 2026 17:35:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C5DE1406541;
	Tue, 27 Jan 2026 17:35:04 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 84352820249;
	Tue, 27 Jan 2026 17:35:04 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Vijendar.Mukunda@amd.com,
        syed.sabakareem@amd.com, Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 0/4] ASoC: amd: acp: Add ACP7.0 match entries for Cirrus Logic parts
Date: Tue, 27 Jan 2026 17:34:45 +0000
Message-ID: <cover.1769534442.git.simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|LV0PR19MB9647:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 56ebc956-ba7e-455b-8ad9-08de5dca68e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wzP4pprM6duNyt3+kdWF2RGkPhkWkWdT8hoNtDkS216Z1hkQBmnvOZBZKozd?=
 =?us-ascii?Q?RyKkvJoOM4PwS1zh3HHrVPjUWAYAV1DXXv08HT5QYEHjt2j9jJZuekgXb77K?=
 =?us-ascii?Q?3BXxEwqyal/s2W/RdOmtS1pbJsbuuNzDNRpgE4bpgPn9H38ENL7cEcWBB/Fj?=
 =?us-ascii?Q?KE6XuaEaxBaer2GI3/q2otrrj2Nas3Kl0Zj1dJgYllNWSsrbAr82z4+K2LBI?=
 =?us-ascii?Q?OwcIjuMvzGmxVhlNBp/P4xiCUghROCBKPW6LezhD6X0WK3+7vF2Bp1ghj3sY?=
 =?us-ascii?Q?NfODVTQTgF4P15z4l5h4JfiK52ZhQsm9TNsgZ7LyWHWzthv1vrMTspil1dhY?=
 =?us-ascii?Q?bzC21qwxLN96wumYGSKTDVJPWQ2HhWo7oGYNvBZzmZQwxdHNEERKVddQuHDN?=
 =?us-ascii?Q?SgehKwRkPKZJ6C3umFusuzhDsS+eVV7Ib6c1V3g0IPpHj7BChOuHNcWD7cf7?=
 =?us-ascii?Q?Of86dykrbh2+ypCeoPRnZiEOp9EXVGMfnYjZaLn+GHyuZkHEYeQroi7r4gfX?=
 =?us-ascii?Q?XA++mzRLsp2wPafKcsULptT1bJ3BgB5i5XSzOiTU9/kQys+yhoOxLzdrpDj7?=
 =?us-ascii?Q?je+Vp8uz+rwPFrNbxx85qArP1Wf8NgNyTriW6liT9khn4hwbUlAhFSavh9Tb?=
 =?us-ascii?Q?FqmIigygu/3wB3eTSQ79wJYSHS2UNSEAp5c+kaf9LZAtfjis6nCaPiaCy/Pd?=
 =?us-ascii?Q?HKBVMjFe1vcfuOjTHutMRjT1RpwnNRBt/28y3e9h5F8m4hefc30wKCmqw2+S?=
 =?us-ascii?Q?13lFOHlf/G/tzGlQcBurU5dYhNVztOIZILZGLfSQRaJb+UiSx+191qdd2WpE?=
 =?us-ascii?Q?XARPJ3DGvALR+8yKL1vgCeJodsSKG41B7dPnTyyuOs9l33PI/JY7wUDNgkcB?=
 =?us-ascii?Q?nRjaaWr6m/sJHHOHTABE0U/g8oCMQKgtHbOxcEOIxOSdUlGLafCVNrsGp5Rb?=
 =?us-ascii?Q?BivCppk+/6T23MiIBCXp00xZcFraXH4sOBuIlMVmxQjro14rZFyOJOCE8Q3e?=
 =?us-ascii?Q?FCmqnru/vl7hqVkQfnJS/nuw/VAtbudTakWhHXhWaS19GOdeE+7ieVfmZoUl?=
 =?us-ascii?Q?3HlNPLq+HT5mGssbufaKgQ6T95weWW1DPcHPXi+lpvG2SlEtWl2ZNkRiv4ZD?=
 =?us-ascii?Q?+0PeqgO5gKz+6/Yfx5Lzjb3elzvOEwkQCS65gny+hBghDWARtJUzzdlwRtsJ?=
 =?us-ascii?Q?6OI8OSUaUaOwML3YPIU6VdUpUWabK/NVdQhH3ApcjtcpQeT9ANc6CozEzY8z?=
 =?us-ascii?Q?WtYfpV8/ueg5YD2dum8oEin7hr2Kd7Uj18zLFDvyR5ZpCDXK30X8FwNTuwKu?=
 =?us-ascii?Q?ty+UFI/PyEWy5D/OwwSkqcioLx92uBiqK+rFsp7wgPvOwxISBimxr8KXvlko?=
 =?us-ascii?Q?JzHidF6MNIvEwnAQdhXadPH6/AtyXJ4KbaKHXroRpZnx76ZY3ZH8VBCr0Fjb?=
 =?us-ascii?Q?DEep79PFRMxIeMpPaUm/ecLRwNQWhXMwI7MrCIJGWlo2mNu99NcvNEDqJC2g?=
 =?us-ascii?Q?K6dy9nta9HYasNFiTQvsRl10KFoL/XNRdPG/V01zMOzk+c+ObX+KeC7r5FMh?=
 =?us-ascii?Q?f8yerF1o6FiidtVLJ1A7G/Q68fSgFXbWIjQxBtg6STQtmWKSCIe39ZCh3am2?=
 =?us-ascii?Q?qYe5i6O2MudljT53eTwBsiCfDZP5Bv59Issrij08F4bs?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:35:05.5712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ebc956-ba7e-455b-8ad9-08de5dca68e5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9647
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE0MyBTYWx0ZWRfX6WYFtFo1o/uE
 tFfHSPCZm2+NDylF8u03j5GLrYdCV33xrxZD6izcA9mc+aipiPy+5MnxXqtqXiXLWXLTDW/F5Ni
 IfWqq0EMqoj0tMp/oQi101pkXrSrVqP5QlXzGbmmITpabBmsawFUrCHyxfpYIOcGCOTx7toc7f4
 +W0uvHacBHW1NIN2B18jHNpQ/b+2Jr9oXRwRdN/SfX5RvkbfZjKRprceXpbjUM7SqDWvmtsHawS
 dTkwtO6EebxeAJFW3nlIkbPpar5C23CLLGXVHx8r45zT69dsC48csN0za9opBEPw8etWLrkK5d2
 5ajKg+LhalRvriRMDiRSXo6xErYo/IhVEjjRSyGb2nEhii8Zvrd6r7exqSZF4O4CpAgR9k8lQRw
 2ZrGWQAXayn8pCyzLTTorK5SMrdwaHMKim4qJvO/6Wpd96UHU0UCCOLixNhWSqJqnePU3+q/FrQ
 +1pamRsMSLYAoEW5+pw==
X-Proofpoint-GUID: fOgcBsggXFvF0Bx-hmib5ZQd6lEIsJV5
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=6978f74d cx=c_pps
 a=eu25Gv8CuaBvrl3+j+Cigg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tK13OnTeZ9FWjPnB_ZIA:9
X-Proofpoint-ORIG-GUID: fOgcBsggXFvF0Bx-hmib5ZQd6lEIsJV5
X-Proofpoint-Spam-Reason: safe

This patch series adds a number of ACP7.0 match table entries that are
being used in customer products.

Some of the configurations are very similar so the series begins with
renaming and sorting the existing structures so that the end result is
easier to manage.

Simon Trimmer (4):
  ASoC: amd: acp: Sort match table into most specific first
  ASoC: amd: acp: Rename Cirrus Logic component match entries to include
    link and uid
  ASoC: amd: acp: Sort Cirrus Logic match entries
  ASoC: amd: acp: Add ACP7.0 match entries for Cirrus Logic parts

 sound/soc/amd/acp/amd-acp70-acpi-match.c | 328 ++++++++++++++++++++---
 1 file changed, 292 insertions(+), 36 deletions(-)

-- 
2.43.0

