Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86972238C06
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672078; cv=fail; b=hFZJEGzwBQ0M9+E3NhMTLL5bRgOu4Rzn1Lg9yXU/X/eIO+5OX45bGSDNAeXvLmbwVJRkumsg7c45J4Wzs4gmIoB+l6DLLS7VzcBvaOoYdQrLKr5TrgxQ00KCd8FRJikh+HpGmug+aox/HlAPZyQ3vdD+AAz+WMXHVwwh8Vou3Q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672078; c=relaxed/simple;
	bh=5gCk4ougCZqH3pryv+G3Tp6usGnMmRoRQqoJlojlbZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uJGvrtcQt8b3PBMKOBhPNlHBFYMSZWkJBuk79WkDxXJQjnBkkPN0hJckHD2qBGhDNfJtLFWwGGdAmvQAav0h8a01Mkzn8UMArwe78AQbQsk2c0AI8hnfaNxFZNFsI0PLZFP74SbIe00+zlJvkxW7oIURksUPfEqqn/J0HjmAwWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fw8Qdh7w; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eRzaw02D; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fw8Qdh7w";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eRzaw02D"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N56nSB008880;
	Mon, 23 Jun 2025 04:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=J/SAT3wL5E37kNdz
	wqqD0ncYucmurwNcgMDtOz/dZ08=; b=fw8Qdh7wkch1hX5Zfqi+z85E91+OQK6i
	q+Gj6vfAKlLTB3AnlfKQ8iixUEBEHOdKGtaPNJg7TwUcAYjJNCunvQllULW3adAZ
	MMypQRtF9xYB+TGFg00Uo7bO7KvUksNk2d42nt5AFX5uCrgSpaVtti46IZDLkHF/
	nzSt+DnAwqCwIUVbVoysKbnN0G+jWLpoK+nT7HdoK57v+9n40u3o7om8pcsT1eGc
	8R8yW1dlXr7sjw3yYabWdg8WuZ6SLI4sta5V7ayVymSzx4SIzcr0hXHpEy/F2+9x
	yEHI33Qnj9QeKn5j5IFp8TjL2xXD0Ap5V9bTY09TyusAHrk6OqWROg==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2116.outbound.protection.outlook.com [40.107.96.116])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47enk9gt8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:47:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taN727l/H49fBhWpbFPXRVLjnRtjCd3jMR34cCX+oCDH243maqVygBydeq0HpTDMP60kdcHg+f3X+UINlOx9cBgUgErJ2n3PlFtshsCTTrwkqtM2GQ0x+aN/c88ULraTJGHFMLuJmhFfgnPw0JbQH5yKJTDePq6kTopSKKqkyFXI99bLeAb1gUaoyjabhVvmzCpudB1Zl9w9tDlmW0TI8PnYWGzjy3J71D7BTlPQT7hcmoQFedAfZPIzExiyswMQGcPx7L2BdEjaFDCS58Uzdr9m8peaI+FSXNRwjEea2U4Qa4qkNbXN5V1y62Lc5D+ns+dBvlDuzPxmK2Y1KNvtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/SAT3wL5E37kNdzwqqD0ncYucmurwNcgMDtOz/dZ08=;
 b=A00oG5hZpfa+2vRjPYFw9F46NJOSrF5e6Z5rguWyoHGjeL6CNs/duvPSm1yao12OgDpK/gns7oCfps1bAm35OgBRkh6PkV4WTzDyls35ObVbyr6wkxZF+aXE+QaBHr5oPQRiJRsGSJgUYzk2A3rfui/KUCjHpMrW1BqyG/4pdhO9zxEJvCcf1/hKY4FQ4jdKOrLSjzQ7qE6JEkFdZbVoVIrKjTHb9TynBH9en6VbNLe0Acc3cQxhz3HFy/dYuEbV9jEy/0sNsKr9RY2bl5R+uxbEbPLymt6z4krZKUilDKW2u7jKIs7rShRfBh6bAevSGIevGz6mguvRXgc/T5riPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/SAT3wL5E37kNdzwqqD0ncYucmurwNcgMDtOz/dZ08=;
 b=eRzaw02DO4IuUlodAMXA+j1a4PpnkBR0Vz/NcTYVsIx8GmPk/gSQMhE2L3dN6qonGzGgKeMbDiAn2By2GgufroTHiGx4YsxfBGsQOlc3i0sLvGE6w/oYmCpnJyY27n/B69eP4LdRYSX0sISeOSaE3NZJY6BZfBaW6E8zpgbCkIQ=
Received: from SJ0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:33a::29)
 by BY5PR19MB3859.namprd19.prod.outlook.com (2603:10b6:a03:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.17; Mon, 23 Jun
 2025 09:47:22 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2b) by SJ0PR03CA0024.outlook.office365.com
 (2603:10b6:a03:33a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 09:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 09:47:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C1914406540;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 97D9582024A;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 0/7] Add SDCA IRQ support and some misc fixups
Date: Mon, 23 Jun 2025 10:47:09 +0100
Message-Id: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|BY5PR19MB3859:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 39e9c43b-fb64-4e1c-3885-08ddb23af403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vCT5ySkwtQDmg0OUyBpQ1k+8QrI9ianyx9PLxAg/SXOSsduKeSjx8seKruGl?=
 =?us-ascii?Q?5ag3KKgdv0kOY+mrqzaBhCqzwVDVMLDBfV8mgWzUsbryWmpANPpW/XbQzdZN?=
 =?us-ascii?Q?6DNSOkUeoTKaQtohTXhbrpDoqCTPjImfwuHpfwrDnBQM619h/92E6kOtCNUh?=
 =?us-ascii?Q?zSk7+fBttzmhgsj1hJxUSplSAJcegWT+wSGZpwwoDqi59ZVfnnkcdju+OZ/w?=
 =?us-ascii?Q?vvwcC81RXAmER+6DHSLabURwkPW+ptNVa0ewkVHl9DIH8IJovhtmrY2/AKad?=
 =?us-ascii?Q?8BsoRMeT0SCJmgqo3y5n0BT9cJBs26z51C5Qd2qXFN7EvU+iKZ5vqJN23Nrw?=
 =?us-ascii?Q?s2Udn5EZ/yq4It+81t5i2PnqPWbTaC3Su7NXUgp1t7SQjQllfmbwPhpxNXR3?=
 =?us-ascii?Q?iVF+t0VsoxpIqDPaQ5ncAntuJHmyl4vOXnwvGdA5Gllt1vIViRjm5qZ7vLCi?=
 =?us-ascii?Q?uq4CCNKbbJxHJIdxt7iwcbthFkuXO5cB7DtEtvjpNP1YK6RD0NxBhkuIk2qz?=
 =?us-ascii?Q?CSNw1rlmO8CAGSxlGDXkeELSD3GhFdpNErpOQKpgDc3n22zKI48+Uwv9kPom?=
 =?us-ascii?Q?rDuJTd9IlLpfjbBy7u/9td5LcLv/CeinDrNBH8VVJYKSZGAFcdQn4gAc2XvF?=
 =?us-ascii?Q?D5ttti5B6Qr1RtGXhWUTdHEtaOLT3t9EFU/xPiWxQvP0usjZxeWSg7u3KQ3F?=
 =?us-ascii?Q?OVwM8synUKLDTy6xuuPyb6DX9JAv/Nn75bDwviPu1jmSx2Ls/gC/Er/weZOH?=
 =?us-ascii?Q?0FND3XzzBj3ZNdKUa/MdR+7t0SVSBG8wR8rYwLo5GC+JSoSMyaYuzEfNLHjm?=
 =?us-ascii?Q?7YMtVxtjiLVGmYRUJhblxVGWMd6MsV1vaukiMW1FMVx7f1f/u8uvwseFC3Zu?=
 =?us-ascii?Q?dome6CTfGM4N1VJxNMCSztrVKN166FtnOCXLQuD1Ef1fELJg4DHlQTeFwIz9?=
 =?us-ascii?Q?RAL4CgPpnFBWIMCPy5A7yEy+6pUUnvImkKmANYugyu7KlVX4rvIo5NCtnMA2?=
 =?us-ascii?Q?GhGW7gQiOR3BJdVoxO7PKBOjUPfV1ClHxHPg+/9zy1MqpDctvw/ZUWTQl1AI?=
 =?us-ascii?Q?aHZ99UOuSCCcUrvygYSzObOdL2gw/H/ZcBAeVQWwT/s/JWW11LylWRO/u8Rk?=
 =?us-ascii?Q?UmhuF6br5F7JWQTVT/Vdabews0C3fkLG0i1Nq6VJ1Hvkmzqs2geMSw2DIDdm?=
 =?us-ascii?Q?ycqg0vHnNqeJz56/ZqfFr9UBOoOxg+4Cjb0/ARxnzfAdUoqlVp1ZNDMyGYhe?=
 =?us-ascii?Q?QsbZbU0j79Ua2r6pqddQQjEr1Bc++G/8yiKHRfvs8SRuszAPPckzSP+GaqkC?=
 =?us-ascii?Q?7NR6ut7DOL6vSBe1aIxQmbpNoSlLGeBzGMM5X+DFzF48ZwKKYjBvFI3P17tZ?=
 =?us-ascii?Q?l30fL5brwmTCOiprS0SDNI4T3DnFWR3rEU8n2xDnSm2l0I8E2xX3yyO3uaf9?=
 =?us-ascii?Q?k0whisMFM/7vg9svFMxV5q4pmtR9P24pZtnvQUZhYfbg41EIeW65Q7D+6vne?=
 =?us-ascii?Q?iN4pF8EAcgPIwjVp3Re9mFXU9KhVGQSCZyPE?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:47:22.4783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e9c43b-fb64-4e1c-3885-08ddb23af403
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3859
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NyBTYWx0ZWRfX4bKYlMzG4vk2 BabDK3F1ex8RYk/WODrEpufcDU2hkro1iVrCmmlmD9PGkBaubhpBz2EGVNgaA8qx4Yt2zQ5JQM7 MH3LfwdFCOMHwQdxczePu7p37lYsQLXMOihoAde/xINmpNNmi6feMqWSsLoGtBbSFZgJZrv+m+7
 k8rhkOZ6dyX9bqbuUunxb+wwc7rNs1VeCQBYLfTyU3zVIOJahcIlE/vXcWArYwKJ228H7j6AoAm +DJRjCW/W2ZJivltdhZ9jOcBX/Q+p1xjs5ijb/dOP8dCJ1/a5BT6osBYM6GThKX2vAHQ6eCaSVJ qS9inN+0WD0/DwW+keYzJKKOY4HyGAwrIT+7/4xQVCd6k/M9+XI/ZVR22tvMDMfO2WI14fiJn+9
 1DjZukAM2TCL5a6LSNvwGzCbs+BktzZR8IptTGOHxexGETMxfaMLPM3QJRwAcNejOxw3PtTr
X-Authority-Analysis: v=2.4 cv=da+A3WXe c=1 sm=1 tr=0 ts=685922b0 cx=c_pps a=6Fdoj4xkdyvJP+GhaY74rQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=MoMhrUrNNs-eAUOLZUoA:9
X-Proofpoint-ORIG-GUID: sxcNz2GDVgwUYu9yMGhALVbJfgCZfrC-
X-Proofpoint-GUID: sxcNz2GDVgwUYu9yMGhALVbJfgCZfrC-
X-Proofpoint-Spam-Reason: safe

Add a maintainers entry for SDCA, do a couple of small fixups for
previous chains, and then adding the beginnings of the SDCA IRQ
handling. This is based around a regmap IRQ chip and a few helper
functions that can be called from the client drivers to setup the
IRQs.

Thanks,
Charles

Changes since v1:
 - Update comments on externally_requested and irq_lock.
 - Drop warning in base_handler down to an info.
 - Added print for function busy.
 - Updated comment on SELECTED_MODE handling in IRQ.

Charles Keepax (6):
  MAINTAINERS: Add SDCA maintainers entry
  ASoC: SDCA: Add missing default in switch in entity_pde_event()
  ASoC: SDCA: Fixup some kernel doc errors
  ASoC: SDCA: Minor selected/detected mode control fixups
  ASoC: SDCA: Add flag for unused IRQs
  ASoC: SDCA: Add some initial IRQ handlers

Maciej Strozek (1):
  ASoC: SDCA: Generic interrupt support

 MAINTAINERS                      |  11 +
 include/sound/sdca_function.h    |  11 +
 include/sound/sdca_interrupts.h  |  78 ++++++
 sound/soc/sdca/Kconfig           |   7 +
 sound/soc/sdca/Makefile          |   2 +
 sound/soc/sdca/sdca_asoc.c       |  19 +-
 sound/soc/sdca/sdca_functions.c  |   2 +
 sound/soc/sdca/sdca_interrupts.c | 439 +++++++++++++++++++++++++++++++
 8 files changed, 563 insertions(+), 6 deletions(-)
 create mode 100644 include/sound/sdca_interrupts.h
 create mode 100644 sound/soc/sdca/sdca_interrupts.c

-- 
2.39.5

