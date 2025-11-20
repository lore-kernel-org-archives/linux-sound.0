Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4277C3A1CE5
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652654; cv=fail; b=uR69JuxY3dxP92yD8OwItRkI+AVlF2rEsDDK8QleqFBS/Rgde+86clMQYIrdJEBxXtprmG32Pr2arz0ZY6Gu+ZcSfT4FEGXjlxt+UftTnN2MevoAvvVF0nHh9WzRvlsF6gicMuRI1j0g5y1oJtbiEp3woF69f6hnyi6XsmqaHO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652654; c=relaxed/simple;
	bh=4coc8QNOG/igeB30XRXp+ncIuY1rh8ycScSBs1u6zLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CLX1RNR7wskHpbVU78nOjQSuVPnEEfbh67VAxAvy/azJxiouPfh9t0/Qs/TheU3g5BAxT4AdcD7NCNjypEKYyWOY4iog7tFiSSIQslmqOiQkUI0LUjpcowGzUPb/XsL0vZ0qG5YhV6hW7jFmmaWA1Dy25o7NTbkrhm5F2HiIl0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=igOQPj+S; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=j/I7szW2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="igOQPj+S";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="j/I7szW2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5sZPq451043;
	Thu, 20 Nov 2025 09:30:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=H6T/lETz8eW1FwqN
	EE44rlELD0LSE9Z8WBZGIaQfwIc=; b=igOQPj+SkXx3v6JVNAVd5Gv68RMmdcY+
	EYT+aivFZO8K1aIs0BVhR7Mxzqq0KW+RM7908bbeH14cdeHSG6/7O/Ffy+8cMrCR
	DAZdFCPyMcqaLE79XkiQpHGkwQEB1v56CGLcxOsXH50Imy5x8bcZkMEc7fRR9ZZ9
	QlkdIlBZSnngtZ2LMK7mHkzdMaQdZ838V3bPQk/H2l244rYVPo/iysF4lNTb28EP
	9CWUzl4tNWOO7MGPXybJBS/hdK+BgTgTlaBpWmS9VV3VBBb2sA9y5ZbXMBwviniH
	tgh14VkP1q8IdovZsrt06qnX6hMSF0iDH3Zfset3Wbm5+JZNcIdFKw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023128.outbound.protection.outlook.com [40.107.201.128])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1enjp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+P4ZV4+MpfZzYhWkHxrC+ZQozrTgs3ENk2F+I/oZX7Ls3CTjV798zFJPyfvIIhnKzGOtmc73LRe7YHPy7XCJ/P00/i5x8rTcaxQB9pO5Bqi7silxpELIkoxUUJaw8flJ2m++FRFXSzwedic4A2GMVmDMWHS/roFMrbHIpOFB0PAc4hvh7YPImobciId+dGkob3exUWMuCCM6pfidDL/EVaJxS/5y32E/tgGJCc0yXSvr7HKj7lJiuhP5w/+to5wRSIqJ9JAenaV+C3ehq/S9CiBHIM8tLF4PZ0fVtra62OjTMxhdhTKWvUp3wGzBov+d7DoBjGwudjQatWZ+XlnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6T/lETz8eW1FwqNEE44rlELD0LSE9Z8WBZGIaQfwIc=;
 b=aYp0ilKMOpGwZwminzxL3lvUe6G7mE6Q3y8EOBPrnLEZ3LaQlm0ttLB3amdsW66LeC7Fl22uGAqGG1h3OEwxbuH+9pCHDGyZfBJYiPlBmVvwFo6k0ENJAHxFyF8JXkp1Z54KGJi1VR+L9rtQ2Q9S05kVf+Rk7obcmLiWXSgFUSrwwilpNtr7R9Gm01z4PJPbcnvURqzeBJgPQREdAS6VwLv9N4gov/0c5j+1twkeKQIXfCpnux/tUI7+1ch1ryfcR4TMhNs2l88CInNe0nPmM+OVTooAvr0sJSw+Dd4Ow4eDQCqUpglFpfwpoTF/vWD5J7WWVLXNuAl4OYNKNPutBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6T/lETz8eW1FwqNEE44rlELD0LSE9Z8WBZGIaQfwIc=;
 b=j/I7szW2syEtj0ZCKHKTlDASyT5LdndqDwA4e7gLu6aZHAvnVNxf048gbXiiatYtn3Jov1wAFB5ba8bIjrWQ9kjxU4Sz/97qZz65lXBpxlo9NV85hfU/Ar/3THH0jJRs1h/FUhZKlp3xZBd5rbsfdgArveDtTQhOGf08LkUaj8Y=
Received: from BYAPR04CA0018.namprd04.prod.outlook.com (2603:10b6:a03:40::31)
 by IA1PR19MB8924.namprd19.prod.outlook.com (2603:10b6:208:597::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Thu, 20 Nov
 2025 15:30:33 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:40:cafe::2d) by BYAPR04CA0018.outlook.office365.com
 (2603:10b6:a03:40::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 92E86406547;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7EA90820247;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 00/13] Add SDCA class driver
Date: Thu, 20 Nov 2025 15:30:09 +0000
Message-ID: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|IA1PR19MB8924:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1700d0eb-989a-4a01-6ce6-08de2849bd7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q7J9smTzzSxjJEoZzagTzUnNu8dectNg+3RTA8L16aM4TJz3lv0TyycaLJ+7?=
 =?us-ascii?Q?h/leeRygjOX3Wq7nJ0n1FusXaRLYnLcR3LEoXScjxnjmrdBslb380WkO2V3S?=
 =?us-ascii?Q?RNQhdNj65pailJwC1uUXUSy4KEAy13NMnm+wqs9eJSuImb0tK5Kuv0tx0QK6?=
 =?us-ascii?Q?gAJfr0PHqTww6njyQiezFaGeKiwTCos1DgmdDIBHmCs2pVsRFTqXDJB8nKVr?=
 =?us-ascii?Q?ib6F7xvUIn1AeFDidQG1lGDMJI0B706wswpJqaacn1Z34xGMhS8P1MMqDGm2?=
 =?us-ascii?Q?0kagJOvfnanp/rPjBsogQ0n3b8GXQhztuwtxn2O4ElmXyWzWiSOj27ctFG85?=
 =?us-ascii?Q?wez3i47aGLctcmG33/dF6JEV3SrDjOkwv6jI+tR3f9YH+Fs045pFCYQaEY9P?=
 =?us-ascii?Q?GVqUPnJALkbGlcoHsI+aRcOEjPcz/bJEdCClw9RFOyttv6oRm5waERiPqKFV?=
 =?us-ascii?Q?AGMyaIXKCbat+p/MvFscx1f8m2dVF38UQt6YYFU77JFfPMx4kA3QQPJVvpGH?=
 =?us-ascii?Q?WBUAL+eUeATLLOcRAtP/yRTb8W1CqozWuP0eKwdqS6jN+LY9Oo8tcGFw7XO4?=
 =?us-ascii?Q?KbMGaE1/9ZMyrkyDN8hGfGxoJcHEiyCQerYQkVexWe+wXpyVp6jA9sPd4CFz?=
 =?us-ascii?Q?ijd78N8QQfRlZ+JI07dEqyqEmODzDouy5d9fsDzOS6JBI6HqZMJH8PcjHSDR?=
 =?us-ascii?Q?NuELQ46p3litzhBoMPDI/zUcaQ3uGuqPj2oXA78rOmh/eIUU7kV4LtAqLExf?=
 =?us-ascii?Q?sMoFuJc1/tEthIepS8Yh/w9axRAomH7L33QMn6+G033LSp/UqGBRRYjpVbID?=
 =?us-ascii?Q?DQZXZa3BKIwtMAsjCoRRf9NeFwtnvAPoZDYbleyM3hDnBX/4LME6cu58s/4F?=
 =?us-ascii?Q?fN9kMxUOaXplQ1ZSMHIAlgX65unDo0MpZS0rfy8mgEoFXk2Pj+Wpc1OkprpN?=
 =?us-ascii?Q?5za3afrNn7xvcbZGGjNHvMIu7k8cfuvsYRwqK78mn0yRAg2oMZZ5l88ffTeJ?=
 =?us-ascii?Q?FHfTKBzDAWaRIlnB4jg/HpCKB+/O8P66JIwNWQSPM7E4RPcyxHr6EDElvaOn?=
 =?us-ascii?Q?+80Hm8+t6LdzbtsrLzNLQaBAfuDckJ8fwBEA8dnnKsXKSHjeJxRKdWPl4fTl?=
 =?us-ascii?Q?55y32JAUmOOIPR1frFG4cPU3vo8Muker/RMkkPQQR8S0BLjYSLRKMTq4X3TD?=
 =?us-ascii?Q?j/gU4eWsNdvrdsUnjprqPtPsHM4Q8MGBF6YXy8KKwNe1Cn9yJ3VjO++c6ya1?=
 =?us-ascii?Q?Kw14zZRrhULOvWaATkAIMXfnRNTWH4dyjDfCUPSI+UJ0eVXANyhIFG1ZO53I?=
 =?us-ascii?Q?csjwPgaeLaFudhmEQ23xsY60pTTggTFz+SfmhnwnA4a8vCui5IAde82Ef+pr?=
 =?us-ascii?Q?R8mRx9IQ+eVg1PiyCCbh9qtPzg+ItjSQ6CsF+uLFMR1Bq4/lfQRHiYYpFTJC?=
 =?us-ascii?Q?JhbUkFHN+L+2V6+e32RgDQM55CuNdjdFdzliYp9/SWOg/VkGab3jxlZctoE7?=
 =?us-ascii?Q?UFDHzX5gMgJO+yZp0Qr48xv/cEH7heTKkpHoJWSLJiK5Gm3I5YR0V81ypA/T?=
 =?us-ascii?Q?2Wlja/T9eP0L2Ek7TQE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:28.9258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1700d0eb-989a-4a01-6ce6-08de2849bd7a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8924
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f341f cx=c_pps
 a=oKUGrOEB3UyG4cVvJxNfUA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0VqtTrD6c825z-Y2eb8A:9
X-Proofpoint-GUID: wG18TgvYp6pq5DuqMZEI4SbIu2VPg3T4
X-Proofpoint-ORIG-GUID: wG18TgvYp6pq5DuqMZEI4SbIu2VPg3T4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX7dk1Vgk0Qab4
 dy+WS7Y80Dnun0R6r50vA07i7/l/8ERLj4sbpNwO5pBA9c+g09WGkUgufjAvzHro81zA5kzxLp1
 yvGHTUikD4QxmhVA9lqwITKe/mDBT3QTZ4SzkaOxG03YOfIBY/iMAPH2XDGLquiFxEVx0zLXZhY
 2JQo9zxjB5oO7Eg4AB5yDbvV3AlECoSwXrds5m7zoxKbEAh+81GpaN3cjIxFq2fpfx65bD4+JDi
 GuEoppBhOfE5kCfEQfkpevzR8MwbOpNPmQPPHYiT68mn0Op1LkKYO+sdz6o2Tk2N0kzkrdZ2eE0
 HJzTbzeQoLnNGGCXivKXsU0RTQM+8hx0V7I9PcvyMpBQ7gZsPftSgo4bH5+cbbVYofXGhjg+onW
 854NP71TiLbvIT8RMhb5JXxe7zxbgA==
X-Proofpoint-Spam-Reason: safe

This series adds an initial SDCA class driver, this consists of a
primary driver attached to the SoundWire device, and auxiliary drivers
representing each of the functions of the SDCA device. These drivers all
use the APIs added over the past series's to provide the class
functionality, as such these final drivers themselves are quite thin.

Also a few fix ups at the start of the series that have gathered up
whilst the last SDCA series was in review.

Thanks,
Charles

Changes since v3:
 - Switch back to scoped_guard in sdca_fdl_process
 - Change select to depends to avoid some issues around being able to
   select non-building configs

Changes since v2:
 - Updated the locking in sdca_fdl_process
 - Correct some spelling in comments
 - Renamed suspend/resume functions to be a little short

Changes since v1:
 - Add a bunch of bug fix patches
 - Change some prints to dbgs
 - Add some additional comments
 - Flip order on regcache operations in resume

Charles Keepax (12):
  ASoC: SDCA: Remove duplicated module macros
  ASoC: SDCA: Fix missing dash in HIDE DisCo property
  ASoC: SDCA: Add missing forward declaration in header
  ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
  ASoC: SDCA: Add comment for function reset polling
  ASoC: SDCA: Move most of the messages from info to debug
  ASoC: SDCA: Use helper macros for control identification
  ASoC: SDCA: Factor out helper to process Control defaults
  ASoC: SDCA: Populate regmap cache for readable Controls
  ASoC: SDCA: Add helper to write initialization writes
  ASoC: SDCA: Add basic SDCA class driver
  ASoC: SDCA: Add basic SDCA function driver

Pierre-Louis Bossart (1):
  ASoC: SDCA: add function devices

 include/linux/soundwire/sdw_registers.h |   2 +
 include/sound/sdca.h                    |  14 +
 include/sound/sdca_regmap.h             |   2 +
 sound/soc/sdca/Kconfig                  |  18 +
 sound/soc/sdca/Makefile                 |  10 +-
 sound/soc/sdca/sdca_class.c             | 304 ++++++++++++++++
 sound/soc/sdca/sdca_class.h             |  37 ++
 sound/soc/sdca/sdca_class_function.c    | 460 ++++++++++++++++++++++++
 sound/soc/sdca/sdca_fdl.c               |  93 ++---
 sound/soc/sdca/sdca_function_device.c   | 117 ++++++
 sound/soc/sdca/sdca_function_device.h   |  15 +
 sound/soc/sdca/sdca_functions.c         |  52 ++-
 sound/soc/sdca/sdca_hid.c               |   3 -
 sound/soc/sdca/sdca_interrupts.c        |  39 +-
 sound/soc/sdca/sdca_regmap.c            |  89 +++--
 15 files changed, 1132 insertions(+), 123 deletions(-)
 create mode 100644 sound/soc/sdca/sdca_class.c
 create mode 100644 sound/soc/sdca/sdca_class.h
 create mode 100644 sound/soc/sdca/sdca_class_function.c
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h

-- 
2.47.3

