Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13C338592;
	Wed, 28 Jan 2026 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592298; cv=fail; b=JTybyVn1iCyI9z3neoel3QqZzGY6dAy1eN1fXdCEvpdHmSacRq3BZzP4am/SZbmxdnnD7cYLjbebA2cIlxOt0s/d7Mt6u7fdkmX5PFaZbH58mzLMIO0PDrxiqWAeNAXyqCvqbtipwd2JmrSvuJgGPvJTY1/uilpY4M79tSJ3hvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592298; c=relaxed/simple;
	bh=HjIwVP1zq+d4cMuOOOE80poTv6duYcl1buJXUccWZpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s9JJLreXPRV1gn3zQUM063AXlm3RAtZsUI2wS2Mrb/UWMojprt5rEV5jDI1YEKrx6Gx/TpYH2VuXXbMNXYD+S1ZEU+SqexC+4irR7GsR/zMyJ9amXzTu1bVvXE1tOHWTtphgcukQSBSwBLBZ2Rh0lpt0hfz/jIsUf4rdMMB+hRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OC27OgdX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gnn6EUNQ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OC27OgdX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gnn6EUNQ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92K8v686465;
	Wed, 28 Jan 2026 03:24:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ToqkyZBqmSGJYFkR
	iwM7SDIlrlJ6/CikLrxwRI2KjhA=; b=OC27OgdXNZNsQHQJiI+CMcZz+Tpq2O1J
	7QVVfPgXD4H3dKFOdknioSTjSqRDLlmuBN2rMySu4kF8oUHDjyfNFoxspSA6LQrS
	o/sIDXcTrgiV6i09wQX0eJjKB9nym/WHsUM4pavg0DcuRlKMes2RoINZpIyrQejw
	n3gNacNzXyCTGhCDYKdjwkiCI/lCv/SY+tQD4f5GzXgntOAZuI0cTQCvjefjWEIW
	u+7WcVajBdKSyD85JLAhdmg4C87x3ctuQ9Ep4z2hqFkdD6TX7fCujKYlVqtFou1d
	WiLFtCLstPh8KW0L43rWaaCDvGZdhgjVqIzianQE4nuVJfyJwO6Dyg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020087.outbound.protection.outlook.com [52.101.85.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bvuckc1cg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 03:24:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKlj8xB5jtXPmgxxuaQGQMgaj3dHrkBGoH2xKWKWkLmk3n73cXrpTqEiXgoblnjC214i+X+VnHfZ8Ote9owvO21D4w/dK8GEbLNw1Cy07IgC82mpncCjbop8OLzou7XFixzX4XHT6kFjQYSPIjEWIfuyp6i3fpHlLyeuhDAV6pW7+JzZRph+qdTGTgdTzhqnmArTSt7GIYoqOtCknf3gVP+x73ilUrSMHDz2x9hv8X4WxWnM3z/H+G/kx2P8Q1WQGc3hWgzgzIMs+xuwzn/wQIzAEovsqPScLyeh8FuBMDHl+G/DEEv3Uu6dP6bTb/pUf9OeUlhOtyF8SdnlHnwa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToqkyZBqmSGJYFkRiwM7SDIlrlJ6/CikLrxwRI2KjhA=;
 b=QhL1V+GVsBDkjY3JXIr6bTYFzu+lzDXE+4v42jnBXIK2hqsR4mqS5EIllIkFD2uL0PccJ8r47ux/RkWk2JVZSk+KgUDYDekaibMh8cY3hnrlOgMmk/zNU6yvnNWVye7jB+188uPaJQyTusbGCsMGXctGRodqXRL0wGkTV+5gyrzbuqDD0OPu1Zr4u65b8qhFoQaJbEX4UijYSYp3vcyKBtVc9saW8qmhERiXOLX0vNzHH53YkcshKfph9e4Pch8dCZ31H+WowAgLHZg4BXelOIiHDD5KQAAcCg9bEpcIhE2MtIaG1oEUDr/wkMbR64PgQiNwZVg0NNb5mw6nGJSQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToqkyZBqmSGJYFkRiwM7SDIlrlJ6/CikLrxwRI2KjhA=;
 b=gnn6EUNQ10RbmCm9AZtB+q9mJk6nw+Ln8LyOfuDf+BBVDep5e3Eyt3bk+V6aTMa62Cl55lN8H3RKAcb6YJDPLjUr+5LgfdCElE+svofMYcrRxJu3sAVoXsEFok+Z5F9EPkdv5xDOPHFm90iH1YJbRlLIf9ArZpYNxlJgNxoS7No=
Received: from BY5PR16CA0007.namprd16.prod.outlook.com (2603:10b6:a03:1a0::20)
 by PH7PR19MB6505.namprd19.prod.outlook.com (2603:10b6:510:1fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 09:24:36 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::62) by BY5PR16CA0007.outlook.office365.com
 (2603:10b6:a03:1a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 09:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 09:24:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 10FB6406541;
	Wed, 28 Jan 2026 09:24:34 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F19C3820259;
	Wed, 28 Jan 2026 09:24:33 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: sof_sdw: Add a quirk for Lenovo laptop using sidecar amps with cs42l43
Date: Wed, 28 Jan 2026 09:24:05 +0000
Message-ID: <20260128092410.1540583-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|PH7PR19MB6505:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b64f9563-5ac1-49aa-1753-08de5e4f0dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|7416014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ejga6ndOW7aWMiqZI2aDHBaxB0drjpJn/j2g9wZr/51sJuUH2w2TDwO+c8Bb?=
 =?us-ascii?Q?C3pAkG61ndyt1MzzpCO4JSVHcUixAjw/WkFzj4C3IdhAawG5qoF/6qCC6j8E?=
 =?us-ascii?Q?8ipMEiSCWX/Vt02pm++c4T9DBXxLoL5+I1GgfjsDi/Mw3xRBkeqSUYdz/iWT?=
 =?us-ascii?Q?xHGB588EKieVb6fSnml2E7bqlIK1nfFHTWeGgAY3CBoMG4xADOGZi++CwJ57?=
 =?us-ascii?Q?FIq8+rTk21LaEBmfpWx8tCPaCfGxrQgIOVBs//GD2yc5Ay75OT4iKPAxYKgy?=
 =?us-ascii?Q?yF16bYbzUj+UYWtcpMwVjSwuhRki7R94V+BikWtcvpZs1t1+qR/obJjsLETT?=
 =?us-ascii?Q?Gn48opExNm0g27zYrboZfOkndRzQ36VHkgBL5MOXCUP95JFCcQMPi2n2d+0+?=
 =?us-ascii?Q?z7KAfRwAeecKEntaWJdwhfjDjYZWD7YFNZLZy7PLMQN/fctlAjH+QY6vhs9D?=
 =?us-ascii?Q?k8BJZOdJBXBUO7Ec14buLOnbDl+JXYuf2JwTmHTvknOGYCizdcn8WFXlowbv?=
 =?us-ascii?Q?15Ioa/NrMQj8Ux5niQZWDAcsGqcV5DLuWP5ubb8sHe8Tfj1b6KLJDZvstArQ?=
 =?us-ascii?Q?vphJVt1Il/m1G+SiaJ/5gxN/1gbzLX6vAk1LGi2FIdX7FHGSHg9REQ/ZgOk3?=
 =?us-ascii?Q?aEJ1THVpgijckGJf6MIu5vAdLUthqpt2WH3G3fwFxW9B85bMrX1XK/kue79l?=
 =?us-ascii?Q?z7jY/TLCpsB0xtvNMjXCS2J4eNtO1b+fbTe3UsOA1B+Kbqg7Sx23FWz3wqXI?=
 =?us-ascii?Q?+gOGsCejJgMq24yxRP7T3XkgI/kM8uf1XrEauasFGCK/clSZHYwQN0q6lmPL?=
 =?us-ascii?Q?N/Mvh/DKbOeoGfUW0fGDX1fhz0gsS4Gf1IbcvawHgpSwD68AlJ2C0tU8W+O6?=
 =?us-ascii?Q?Mcp6J7HV+DKJKhduVRnKUqLLdNt7s8anwdaWtwjmWLKufqv8kV/tFuwh//CJ?=
 =?us-ascii?Q?k7f9U5gqQkkZlZIO58keydU4UyWbZZ1snZ60+/H3DB8/Dqs4pt23BNPM+G7i?=
 =?us-ascii?Q?jVT5+zdUOzN0tDLeoFUaKiCugJ7D6j4LO5DWJDOTNlRzdR7gNlSPUtg8g27A?=
 =?us-ascii?Q?0rAHOERXidRnP4rgd5m3E++JbBnAGBMwpmMV222qqXS1mZH/8Uqe6/2VnyT2?=
 =?us-ascii?Q?mk+rlt1CTv1AFJ43V7TsGzve16qYNF1UB4WGrStOtFM4Inti0hb8o5C1r9s7?=
 =?us-ascii?Q?mG8NRqWxPE5VFNHLGH6SW/0Y5Bq62jlvut4swb3HRkvAtGMHPUxR+re8bKeK?=
 =?us-ascii?Q?e/NtJnLkwH4i6Duhql+6vYE5GGYvfr4kINHJ9L+LUDSZRlKtSQqYJg1S7X84?=
 =?us-ascii?Q?G3pESyGHS43djbLuyFHouXkCNZsuQ8YHpWbC9//DFKOHflq4SuP8aHZnfBb8?=
 =?us-ascii?Q?+XGq1EnteeTnoG2CIgfa6kyGkFGUSvEpNOs1OlPpZi1074b4s9nwlJJ2n0hS?=
 =?us-ascii?Q?7bz/44y+1uG1eLUxtG0s8FTPwKph4zyueyWX3/DXatTm2mkAW41Oo0auBOlk?=
 =?us-ascii?Q?3y+gQYtAFO3CCYrtG/futp6ODYMoRgtyWhRJUm3NlobN1nIs/y2/59WGnfNw?=
 =?us-ascii?Q?NBLshqAWMpmKUaAnaKiy5EYQYcGMB8IPAkQxbiBk6FCj/2vZ0KTmkUhX6WEh?=
 =?us-ascii?Q?u4VOFhAx/ESIAvVy4ndnh8rUsnbe/sRCRM/nF1FL/cgYsRy6HkasFMSGRviB?=
 =?us-ascii?Q?tVLn6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(7416014)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 09:24:35.5888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b64f9563-5ac1-49aa-1753-08de5e4f0dc2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6505
X-Proofpoint-ORIG-GUID: pU_SsAmBKCcjjhzbE0nailRHU5VKuSGV
X-Proofpoint-GUID: pU_SsAmBKCcjjhzbE0nailRHU5VKuSGV
X-Authority-Analysis: v=2.4 cv=Vb/6/Vp9 c=1 sm=1 tr=0 ts=6979d5d8 cx=c_pps
 a=R61xy7Sxgg6fOHg0EL+J9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=g7q0kSdTfiXSywdjglcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA3NiBTYWx0ZWRfX/Bpj1x4f+jjP
 loB2geABBZeXQsFR1Fcs6LS0U0A4Yv5OjGvOGc8YjFnP+e+WR0B5AFbYZ6aR4EWE8+TeTvswpRp
 RMHFZed4wYVOSpj6Oe5H80SLXIwORjSUNECzAMEDyxTdetfjCtQm7/DOfA0bFlKra/3haL6Gjvn
 EEFsNou00A425dgO2rwY9mtuRXVxXSg3ObENwVvZGw6qhqxtfV4j63yaPB4OQCp0DAw/9Kzs5KJ
 ZslMil/PZiSJ+JQDFZpQezPvY26OP2z00i50d7KfKAQjf9+FetZ9ohYXFExGMVIpMTYKVFVFsME
 wPkncJZ9rytj3jRLJdss4oBNKDjVwBnOXiGmBK+xl52CePM7LXaHx+MOOKCT5np62IU2CNU6coJ
 zUlT5zIipd7WZ3YbhOIAHBIapDztuANO7Nh5NBJb788F6sqbh8I/xCGYlO2EOKV79r3DjQQncof
 Zh4O9LhEa9OwLr5FDBQ==
X-Proofpoint-Spam-Reason: safe

Add a quirk for a Lenovo laptop (SSID: 0x17aa3821) to allow using sidecar
CS35L57 amps with CS42L43 codec.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v2: Added more detailed commit message.
---
 sound/soc/intel/boards/sof_sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8721a098d53f1..50b838be24e95 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -838,6 +838,7 @@ static const struct snd_pci_quirk sof_sdw_ssid_quirk_table[] = {
 	SND_PCI_QUIRK(0x17aa, 0x2347, "Lenovo P16", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x2348, "Lenovo P16", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x2349, "Lenovo P1", SOC_SDW_CODEC_MIC),
+	SND_PCI_QUIRK(0x17aa, 0x3821, "Lenovo 0x3821", SOC_SDW_SIDECAR_AMPS),
 	{}
 };

--
2.47.3

