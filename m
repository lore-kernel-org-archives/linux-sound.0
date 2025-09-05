Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3211B218EA8
	for <linux-sound@vger.kernel.org>; Fri,  5 Sep 2025 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082730; cv=fail; b=tKyAh0apX0zlNM/dkiDbbLxjk4UwBIpZybWjdzuOoCoMB3TAgaiRlDu2Y9yrW5T8ezHRfq2EKF6En1vaufFomzPsAhj4ZOD5D+BvrnShLmAIJFXe/AW3AdIMDfFAFolygL5lMx1nbNivV6NVweqFbmdM5rke3/fQ/IPB8tzSzk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082730; c=relaxed/simple;
	bh=HV3tKl2/wuglEVHE2yMaZsyDTGnKAczlpF7B3pcSaSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u4HYz2YnJUUchhYi+FNlnqH6fITz2m8GB1Gym7vOeL1L8ojU3795BB8ULzZM4E4H+iTWs+4wHhNSeHxoVgyxKhR3RpvMD9aOzz/BPayRAK8fqzUbwZ8ErJMi6zIvAqTs3DpDPdV23YbwFhdBGawcO0RlFxJCHd7d6/1j3K1pNV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nwnQo6EJ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mfBEaKne; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nwnQo6EJ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mfBEaKne"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5856KPYt1451153;
	Fri, 5 Sep 2025 09:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=y46qkdHywJduJfrQ
	X66a3saeq9K0wUPsiB+aFCNJr84=; b=nwnQo6EJNqgfE/SU8QtxPj70AywPX86H
	wNC+K44H15imHNKARY5JQwgCJe+FEUXrm/Vu5ZmxlPcJf3uA3bCPniOdCMQmzZgO
	13C0BQannZ4ZD0NBiPQgu0SfkEmE1GtTJSAe1KeCSRnCgSHEYjWwzMFb21ILCcA4
	Ny09eMSsoVITZ8SKsd+HD1iJnhYJPoKQM9R0FU8t1iiw2KqgRwKJwuGIh3grjtKU
	xHXf2MV+FiDu5dMoQwvwcsNAww3TA+/kz8kxmfpgkrPastU7r32lHfqmrwllTJFe
	KGczoJmu47UKIvtGd5vrrl/r2zieiv0+7PqB1aWn7NpwRxQOHXz+RQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12hn2248.outbound.protection.outlook.com [52.100.167.248])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48vensfsvn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 09:31:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecXDi4mue9JoVnDCPzd7AF2afgsIpcKOH53fNwFAR3itf5guaJ2lYYqiMAAk5m6nslIy7TpuFZEi4hv40xmrat7aMolszGaO5NniHaZXNNF4LquW88Xdh9n5UTKdypqyIcBreOS8LzuHO/si1qJyfvyKJnnswqCn1ISho6VQ7K/Yo0QjgefvOvpelcM7kXpho5IbzmR49GQKuoYHJrHjh0sKrt2hN303iXVfJDccOQfBuX4lbIJLj5CJVpH1I/Qcyv0vfxvFTyyi8oc1p5XvcZcUqp1jOwT/5KZIqYDfE7Oa+llHzbHtbcwvndd2dNpVvv4EtSjNC4KYTqoYOS1hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y46qkdHywJduJfrQX66a3saeq9K0wUPsiB+aFCNJr84=;
 b=FKMVwTU9T/fORaO0fxrVRtiEnCdX88LBe3wDFxu6FsoHKS1B3oOjCGxgj90ryKW4nWSru8IhU5W74QYYl+G90VYY3vjZRturTegrFv0rsWw8KSiPGpTy6TVFNThL65fcNU9Cc5Bq8t8aKAIoIQSQ7qUw33AD5yjj5+h610tHIammt3Ft0cQOVk+XAnzFvOO3RIOvZVQNeZg08x2HyYKxZcytHwjKdgW88Ihp5LAU47VH4kECX4Fyjl90DMDaBq2q9s9skTZT3ltUV3GSzN/nxBEkUV8mdGQVFe1N7bzfPIOTafeDdTOVuMVIZAuOrdvZKoVM4vl1OuANjT1QBkKGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y46qkdHywJduJfrQX66a3saeq9K0wUPsiB+aFCNJr84=;
 b=mfBEaKne8KWDHdl4KQEcLsayilfLghY2/x0uQz1mzZZeUAKJgt0UqxKX2wWoqX9TMClQ/tz2XQSfwVRsFJZXzqcVlJvehE7bnQqyJY+D59qg9+Ue0bJvOFh3aYLLk0UGbqovIndvTwjmi10cmF9+fx5b7UOsnLsw2fXg2wQlNUg=
Received: from MN2PR14CA0001.namprd14.prod.outlook.com (2603:10b6:208:23e::6)
 by LV2PR19MB6077.namprd19.prod.outlook.com (2603:10b6:408:17e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 14:31:31 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::1b) by MN2PR14CA0001.outlook.office365.com
 (2603:10b6:208:23e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Fri,
 5 Sep 2025 14:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 14:31:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ACE44406540;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 90963820247;
	Fri,  5 Sep 2025 14:31:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 00/15] Add SDCA UMP/FDL support
Date: Fri,  5 Sep 2025 15:31:08 +0100
Message-ID: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|LV2PR19MB6077:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6952b374-833a-4032-aba7-08ddec88e722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|376014|82310400026|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U5AgOvIVuhx3czqnY3foHsFmexCghTciq6ecli+ugaHTie19YrDbtplge8/L?=
 =?us-ascii?Q?raTjIxhUsSKAFmgsTqQ2uAYdMzaF6rylf0D5M99HyVvn6fSBzB6Fb/iBK33F?=
 =?us-ascii?Q?pl7sjRwQMUq7uTQ6tUhGzDfK2eR8sd4Aqcuc9L+Xn9SU7z2T51TqK+ONGv4C?=
 =?us-ascii?Q?okM30NENLflSp9T1EtHfIZ46jkqyJfjs5ABAYgvzfmqGeEht1vmtdZI15Xt1?=
 =?us-ascii?Q?HVOQUTIxQbC8xBnCqzH2E6LvyRwr6LKPldH277Z0tkzDYgGUF/g/ikKRprAh?=
 =?us-ascii?Q?BBy51Z4UBLY3AklXs/dibkp9CLCR77PBEU2QbxAjs7eUXMxZAaASmgRby5mu?=
 =?us-ascii?Q?9SEHKBic/PZAu6pjDvT87f4zeBPF6s7QGDiNJf0yU7oWR4oIgGIUt0zVubJ1?=
 =?us-ascii?Q?gd/3Z5eIwG/8w+eqWn6C7Nyn1FUqmQlxSl4mvs9poCm3LDZaoPiIxX520gwR?=
 =?us-ascii?Q?d8O/7pQ3Rihb/prZsa6TZC9sZpM9tGrqevdxEz/P14UfaZaaG4oDMh9JU4Ni?=
 =?us-ascii?Q?UkNPjof70TTVqQELkY3etWPPNPnnWm5CyDdpFT7XOuOaHKnIt/ys6pm45miM?=
 =?us-ascii?Q?gq5lRU/qyP5jkGNYjCsw7o1iiP6oWCW0/GWcqZ3x4Hp0hhpmIjUvX7YAfdJP?=
 =?us-ascii?Q?cHOMGgm+4ojVFZvaQ4jLmtVxtqVcESkyCAlaXU8+tc4j5DxlCdpMu0NjgikB?=
 =?us-ascii?Q?qKRg+Cemy9BABxYcAkmeFM6LlpRuOb1kiZocqUoh6bP5hnbWdmsfP5WHmlZk?=
 =?us-ascii?Q?Vvr+fvrEd3d3FuftBFKpwhmyNCmRXW4Y5EbHZ4bR6Gg/vgfrcoV6WRAxN5AU?=
 =?us-ascii?Q?XEXVHpWeLDwQMbm5MH/Dpr+TLe1MPDGoFEAT6cNsbr5MzEtuWCeL0Ce/8z0T?=
 =?us-ascii?Q?FX9S743LWPqAKvPWF5n49rb7IHCOAkakQEU8ZXKNBcifFwirLcqmDGtPDk7Y?=
 =?us-ascii?Q?BCS4nCvvck/ji+zeus5i13WhK1186r/jGrP9kAhwQEEBlOegMISM9RcRn6Gp?=
 =?us-ascii?Q?BDNmOEC/L4QIHrTtFWZfw6qquSlkM33gfpvp248xcnxBVJOnbY/84jAOwqjr?=
 =?us-ascii?Q?72PtPL22YCfWn8v72+/pCu6WkQN0+hDWm5MACH85L4dRZJqVkd1K5s9zbpO8?=
 =?us-ascii?Q?V+0ikKmC24Uxbv+xj5c5mVzmxTDMLQc+dashj3TXNqKpBJChPTZ8aRLmj6Vu?=
 =?us-ascii?Q?h+7H2UrINYaOA+0wcTy/rEqhSra3ip3pAYy2+yPMlp0OyOaRbxnt0kJTV/4x?=
 =?us-ascii?Q?zKTy/slBDxTxakTcaFeb0vUeWh888UnfX6cRN0ko39ABfYmEeXfuO9Ly03dK?=
 =?us-ascii?Q?5WfZ9z0qfqyzzV97SYAd5Md8J9APVA+jGjlM8+IylnrAwj+BkKGgcRLlrQ6j?=
 =?us-ascii?Q?OkFyS00XWQREs+SwXiBTK/bgKtr9DsmM7TmaZAmehZCO3nAgQcUlxOru85LY?=
 =?us-ascii?Q?I8y+/uAEzzDmcvnef+Sb24egbO0vApS+ZAwPReVyOQG2B/1Xvm3fN5IhE9om?=
 =?us-ascii?Q?eIKvAQxMLs/vXB1XiNVVc0WxRv13a3OVrqiT?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(376014)(82310400026)(61400799027)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 14:31:29.1843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6952b374-833a-4032-aba7-08ddec88e722
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6077
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE0MiBTYWx0ZWRfXxOzje34XYwX2
 s7DqYhQLJCk/VA3vUBRyV/xB7jREjTOZmwlGkOkNSa4/ELyt439dPZfyl6i7eBcOYp5knQc/PhS
 nsuacS7MnYPifg86+hcjr/tj1+OLu6RNHDi0W11mryc2nTBEOVijj1FvZBZL1H53PQY8GCAKLN7
 nC0Q+yQfRy4SuP4T4lRfvpie5oTFSRkya8/d9Ki+7PKRPPKQhCcz9z1aua5JwBQRdqANueFFMRe
 fjlAE3H04VA/Kc1ydCFqDZg0mI68rBO2f5YnRArXjxi4KLRlVeGqAGlvXgZjhOnSQfK7GNKBOLs
 urJ7uGJ+usR9gz8GwcEzBTNdkFYINEb0jnx5TWXhraNHUoRjZ+2q3PA3LDjM/w=
X-Authority-Analysis: v=2.4 cv=BY/Y0qt2 c=1 sm=1 tr=0 ts=68baf448 cx=c_pps
 a=gh1jqm2MOxAIhrYR8zpDUQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8
 a=NX2PRUKTKYJzq1xaoV8A:9 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-GUID: va3mhHmOh-98cDVSGuwVOZ_zT7jTbOEi
X-Proofpoint-ORIG-GUID: va3mhHmOh-98cDVSGuwVOZ_zT7jTbOEi
X-Proofpoint-Spam-Reason: safe

Next installment of the SDCA changes, hopefully the next series after
this should be the full class driver. It is worth noting this series has
a build dependency on a patch working its way through the PM/ACPI tree:

ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT) signature")
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git

But we can probably worry about that later, as normally there is a
reasonable amount of review on these SDCA series'.

This series broadly breaks down into 3 chunks, first there are several
changes to remove the assumption that the struct device used for SDCA
purposes represents the SoundWire slave. This is because the SDCA class
driver will be made of an auxiliary driver for each SDCA Function, thus
the SoundWire slave will be on the parent device for each individual
driver. Then there are patches to add support for UMP/FDL. And then
finally since the rest of the HID support is there and UMP was the last
missing part required a small patch to add a function to allow reporting
of HID events from SDCA devices.

Thanks,
Charles

Charles Keepax (12):
  regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
  ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
  ASoC: SDCA: Pass SoundWire slave to HID
  ASoC: SDCA: Pass device register map from IRQ alloc to handlers
  ASoC: SDCA: Update externally_requested flag to cover all requests
  ASoC: SDCA: Factor out a helper to find SDCA IRQ data
  ASoC: SDCA: Rely less on the ASoC component in IRQ handling
  ASoC: SDCA: Force some SDCA Controls to be volatile
  ASoC: SDCA: Add UMP buffer helper functions
  ASoC: SDCA: Add completion for FDL start and stop
  ASoC: SDCA: Add early IRQ handling
  ASoC: SDCA: Add HID button IRQ

Maciej Strozek (3):
  ASoC: SDCA: Add SDCA FDL data parsing
  ASoC: SDCA: Add FDL library for XU entities
  ASoC: SDCA: Add XU-specific IRQ processing

 drivers/base/regmap/regmap-sdw-mbq.c |  23 +-
 include/linux/regmap.h               |  21 +-
 include/sound/sdca.h                 |   5 +
 include/sound/sdca_entity_xu.h       |  63 +++++
 include/sound/sdca_function.h        |  90 ++++++-
 include/sound/sdca_hid.h             |  21 +-
 include/sound/sdca_interrupts.h      |  19 +-
 include/sound/sdca_ump.h             |  45 ++++
 sound/soc/codecs/rt722-sdca-sdw.c    |   4 +-
 sound/soc/sdca/Kconfig               |   7 +
 sound/soc/sdca/Makefile              |   4 +-
 sound/soc/sdca/sdca_device.c         |  20 ++
 sound/soc/sdca/sdca_entity_xu.c      | 384 +++++++++++++++++++++++++++
 sound/soc/sdca/sdca_functions.c      | 171 +++++++++++-
 sound/soc/sdca/sdca_hid.c            |  58 +++-
 sound/soc/sdca/sdca_interrupts.c     | 257 +++++++++++++++---
 sound/soc/sdca/sdca_regmap.c         |   9 +-
 sound/soc/sdca/sdca_ump.c            | 247 +++++++++++++++++
 18 files changed, 1353 insertions(+), 95 deletions(-)
 create mode 100644 include/sound/sdca_entity_xu.h
 create mode 100644 include/sound/sdca_ump.h
 create mode 100644 sound/soc/sdca/sdca_entity_xu.c
 create mode 100644 sound/soc/sdca/sdca_ump.c

-- 
2.47.2

