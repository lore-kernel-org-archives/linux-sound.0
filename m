Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B361D30FF2B;
	Tue, 16 Dec 2025 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903743; cv=fail; b=gthxmrRE5LVmGi3d+zuz53KpmRwU0RmTSJAJESdC+yjLgYz8enBdu7xSF47aJ99YZ04M2bzdgXmJFHxB3rljEnWo+MK8dQeSU0DLJ8k9NRyhlVBS7zRNiA2J8sNl6QuuyOzt9b7mu8TcmxnsOW5wzCYnky1JLGSHAwljKN/CFa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903743; c=relaxed/simple;
	bh=hmAcDd/WopMAhtK860jfnI2WDBkhf2EIzS0qQf6Ul+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UZ0Ea2lhcf17DMTZ3k8OBzXEt1gOZ1zoJOggtcITDzQ2UOVyVpvm/OFQW5UviKvwISMADZQQbSI/h4XyT/E8RZB4LiwnK0LbHOItbF0IDaRVq26VLmXzT3JqHZtutIUrOPskgWrWyNACFkPKpYSQ1J2vI5SIeKjMTBSGKeazM/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VaRu3XQr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZVXJXIiR; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VaRu3XQr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZVXJXIiR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG5koYL328239;
	Tue, 16 Dec 2025 10:48:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=SUZYHPyeNzVCypj1
	bAif0hp37PWMSeZ9cPNJNBaVWIs=; b=VaRu3XQrRnZGzBE5tv3ZX9i1iCSX40dC
	Y69Ql3xm3Mc3H1J+7sBNXG7FzDSGnfD7jTnV1X8ney2sn8W8U86pA2HwC6Dmc+rE
	hXqjk6qCmL9bXFNgnyASezYlBg5w4zapvXq7eVTMhavdohZ/a1xFHvpe8bm4KRbK
	nFDetRLIYjgwAK6WRuNmuHHfdNUgo79RNgjowfZJlhyGIRuZCUgNgUWS8BmD6oD3
	M5szi/7RA6C6fFNFcRcZb0671QKWJ4RX3GT0m0CpNcpbhQ6CQW5PlCKsQgSYVFmA
	BgNpUSG/MabXfYfRb6iHkNRmGzuQgITeWgww4EJ/Iqi4HzZYbxe9Hw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020128.outbound.protection.outlook.com [52.101.56.128])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejbq10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 10:48:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3FrbuLRGhkGnZX4DkNSk1Jc6cgm9j68Xa8O9NGeAKe2is+C4wPjVgfiBTIBsnKwICS4veE9/DlWbzst2SmU/KLydu37dfFO18ISh0PA6XWowCFEz+hHFevGIOJzUrlyk9anUi9SH96kw1l5NhJehdoqGQtRaMSBs5+3gJszhyAhOWph0o48p+XCDge5yLVKXrqyQT7iSsJ/ALFuHJWBvpy0nwNeP9Y1K0SQ/Jdf1G+aG295Pg6/nO2aGtIOEIl0TRa2r/furnq8Bm0twi9vjBCuELKswkLuKyjzxlL4KY1BJ21xJnXTO3S5XfnOwZwrMzD0Ja/hMrehOLs1tBXrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUZYHPyeNzVCypj1bAif0hp37PWMSeZ9cPNJNBaVWIs=;
 b=lHnrc8aYlSlMW/S7tjBMyc0p5ZbRPXUmta5xwHuZVjxO9JlKhzHFgU+x1P1mTRaeFY6VS+QIUmOMj49bCAgXpIXmYRsqsjOBWNjTW6BG3QS5hrFoPYwajmxamTHbECGA699p1RUr22rwtbVyrD+Vae4pcfCEwAsibOOrlhiSWyJOVcV+HGYizrVxF/zqLPdgGiUpxz5y/nPbKmkjg8jqb56Z/w2/Va24Rm8+E0P3ilMSk0Vtia5fEYktTiCoG4nHzQnxe10VPY9318yLVPzx+h7rj6EaisoXWdyPisBWd9syeG2+5A7eYUdBoy5VyNc1s8EoItch6gmmJMHJM2L/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUZYHPyeNzVCypj1bAif0hp37PWMSeZ9cPNJNBaVWIs=;
 b=ZVXJXIiRm5nsIxKgbva134EXkPGH9IAbPf5Ks5FUSg+Ns+xacB/iCJ1XfjBqwBd/Nz4pP7/uZfNF2sa8wK+LTeXD3BE+tW3TV8KB/kxdpyz4lqSp6XGWFW0KUD/C5+uTmnJO3/kdpFZ8uHlJqnz1hMMAx0hxZR79AJvJnKsxQGc=
Received: from CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18)
 by EA3PR19MB9448.namprd19.prod.outlook.com (2603:10b6:303:2b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 16:48:47 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::c1) by CH2PR14CA0008.outlook.office365.com
 (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 16:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 16:48:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8C5C4406540;
	Tue, 16 Dec 2025 16:48:45 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E982F820247;
	Tue, 16 Dec 2025 16:48:44 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] ALSA: hda/realtek: Add support for various HP Laptops using CS35L41 HDA
Date: Tue, 16 Dec 2025 16:48:11 +0000
Message-ID: <20251216164830.832148-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|EA3PR19MB9448:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0c9785a8-7226-400c-dc66-08de3cc2fb70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8cazh+BMDfy8O0g6mGuWyAxt0tqNPUzQtuWyzC6o+bbEWNmiAV1RB6jRdKqC?=
 =?us-ascii?Q?PUN6AJTsGHCt/5Z1vJhf+EiKx7Gn5F7MXTLEJK2tKMcT5RVfXHAs9zfxn6j0?=
 =?us-ascii?Q?2oYgFjez8Qwjc3lsEwQIuZ+hB0DKLZvLKlghw+41ZjoAmnWhTtiQBLgGECpQ?=
 =?us-ascii?Q?u/XQgRxYRp0XVhJFIam+hVMHX39OMNSkUaCn/hAgnCo3QpLCfvz71RfFQh86?=
 =?us-ascii?Q?gI31RLhe3LI4sbZ0F1vn9pFckah0P2qgLYuePfZIxvJKQwYAaShkzUHF4qU9?=
 =?us-ascii?Q?e8WuncC7du8c+Z3elccbp463n55AZStqhVfEi2Yjj7oeV7faL0nPaw21Uccy?=
 =?us-ascii?Q?QzCXqbRVt7Kf4B0IhTFB1OElneGgQhxnv/8S7Hi58ZX3HiaA96YBvCpQl75V?=
 =?us-ascii?Q?V0OOrN5dJzaTPipcr7lHgRElNhjXQh9FEvjrsK0j9IGHLT9vGPa8jjNCoKmZ?=
 =?us-ascii?Q?oG+PIuhiBxdsldvErij7Yb0lm7K0WZhv4SpGjCV6CC6+pe9zkFWavbquMfVJ?=
 =?us-ascii?Q?S4AAVaDogBcWQlmHuLaVvLksDcqbfOZuFxF/wqvLe+BDuujW354wiHT8eVbh?=
 =?us-ascii?Q?DlG/3q+A+jjIat+0oBAyYpo3cmUMXCeSzjg/V1PI4YOxxxk6sJYdwiSjqQsu?=
 =?us-ascii?Q?c9ZTQnqSxTKGH/ojWXaZ0Ectexk+JHmGNO1Wc9k6K7wK981/MWak5wxdD2F8?=
 =?us-ascii?Q?y66DinVkNJCzd4YewYy562qhNgVYTCNz+8MUUPLcEca0y3puvA36LHFQMINA?=
 =?us-ascii?Q?bB+mbYHHRVAc1DX6T3ewWmc89KoKy0/Hlca0vw5WQWgplXIHzmq0kGfhgD3K?=
 =?us-ascii?Q?TlZZCk5n05Og1+jqj5XlzZPjOQSwZ4E6Fgp/c5oVbq/in7EdjuOBuQWQ7TeJ?=
 =?us-ascii?Q?KVsn2jhbygDZ05kL54N5Bsb60WC2SXHU3KSp/n57gS+10m+Qs8aDpFPQhCQ2?=
 =?us-ascii?Q?hP1Xqu8Ydw3gEMVbr7CC/6KPTOnrMFa7ZkJMJlzg1NQ2LER7coDB/lOBqMWD?=
 =?us-ascii?Q?rz7s0T3022jJgrhH9ncM7ywa7THFuEtpln++t2s5fPkiYEGDtPL9ULPOkLzl?=
 =?us-ascii?Q?uiMTKRNCUwuGf9YTaPnIsw6BDKpDDpzjxd2pPyJ5KQwpPEPvVQ5EGY48TA4D?=
 =?us-ascii?Q?VR5I8ArdTuj/bXjgbZ+TipwYlxQdzlN4OHhHtqdzVJcUGf6NeReWF8F1gF5d?=
 =?us-ascii?Q?KhlBR1tkqt50snRvNLn1kdRHwm9Jt7q7/eBEV3otXnl6lOu31xr3jke+bor5?=
 =?us-ascii?Q?ALnwcdGAq7/NT+PZMIWySz/pqaCn4EnJeKP3ie0cYoPOrPOGCog0XuBccUpC?=
 =?us-ascii?Q?vyCH1j1GxH+3l7uFMRP540u/GGsusVvuuQrB0GPZYYWxq5/Qg1Byb50fQ8HV?=
 =?us-ascii?Q?Iq+TltdxFj0zFLJS1MC0bqRHbrjmZ9OfRPrdf9Jrk9cjc9ZTZFrUi+PYymEL?=
 =?us-ascii?Q?dv11+P89/1P7JGZ3Qqj4EeJPj4/PeF2ehrh811sRRBkkvEtigeOmpCgyZ1kt?=
 =?us-ascii?Q?6FZ9zE1h3HgrKg+ThYRI5a0EFY5YIb5kT5vYcl+Cu9lnyF6165FwrOrHsVGy?=
 =?us-ascii?Q?48gw5ZUCMqLSBP0ymJw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 16:48:47.0553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9785a8-7226-400c-dc66-08de3cc2fb70
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9448
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=69418d73 cx=c_pps
 a=4P4HcNC5cxRy117rOhkqbw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sjYqxfSsFOBtVnKSRhgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0NCBTYWx0ZWRfX9ML7lHLLJfg8
 wfqoI3BlFqqns1KNw1itO21WrLWUm3je3lEvy3YaV1EGBpIYIBZlWDW4ybrdqgXgYOZyeubLT4F
 VhoweRuP1nEFOys6nLjsJ9SmJsYLYpGs4pkV/pT/z5K95fLZZQZQ68da47WBibdcJdVszenWTJ5
 7RjvseJLiiL8p1xCnH6uAVrfwucgixwR4GB5G+OyvxSDons1+Wge2KM9kxkEKzEjYWgevaEnc35
 o3ixfrpFQzYX0tW0Gt0lKd6L3EZ2cMmAHOcf9+4//gcGe9MeAUNF4Rt/jYsfB7ZD6pUOA7oyprF
 hKUTBD1Z0MJSouJAbcanjXng+6FLhbg0uirvXMDebvbh96lAyygcmctw0dGPfl4t1qN0gfRS9R1
 0jM4t7RKZZvghRYtSrUe+C45FoiZjw==
X-Proofpoint-ORIG-GUID: 9xhd3KJLAcTogd6F0XsV-jLSjjKkYzsn
X-Proofpoint-GUID: 9xhd3KJLAcTogd6F0XsV-jLSjjKkYzsn
X-Proofpoint-Spam-Reason: safe

Add support for HP Clipper and Trekker laptops.

Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C

Stefan Binding (2):
  ALSA: hda/realtek: Add support for HP Trekker Laptop
  ALSA: hda/realtek: Add support for HP Clipper Laptop

 sound/hda/codecs/realtek/alc269.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0

