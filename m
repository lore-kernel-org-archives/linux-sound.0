Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032F52FDC55;
	Fri, 23 Jan 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181039; cv=fail; b=obUt8qdN/XbhtX5vYQjgwE2uDwODtzIq5uZ45VTxa4NwuiUuYcTwz8qvxekCTIJ04kGP7QlRLlQoqROMOifZ90wnj2XbzbCXGCHof9tbv5/YLrVORl+SWGt4aLPz5zGThLDvZshO+w0ijR7oeorsF6ioHUVk6mdMonh9K19n57U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181039; c=relaxed/simple;
	bh=gLvQlX7xkyxE6K5MoOmZK52PrqGiORJ59Ppv0Ufshho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVmqbvy8enOq7SKKwn5l/Msas6X4U/QYlZtDfu4Ca855shKdQ1m0a4ZH8sPAyToYehDCHweNu5IQJnD795YZ8KXN1Niq4Mv2UMtrJo8uNU5n3nnLSfYtpM7+ol33Gqb3tF0m0RhSlpxZoq86oehL7O7uvg3Kg0T6UUxXm3ZxZWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kNItIIhN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jS/g565X; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kNItIIhN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jS/g565X"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6oVT63471213;
	Fri, 23 Jan 2026 09:09:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LMgcV28TJJ3+7IKTVARQ/P4aiMxT8g8N/lh+vQFVfUw=; b=
	kNItIIhN2egz+SSuq2n7RsfIeK819qXsBsuUhN3JNMIWXk5wHH2NO2dFy8CcPVwD
	Q6cgz5yzdx9H6hYch0+IPp9pnYp5uDIFd8drZPNgBjObac5vC7GtY+emE6yXMlK4
	Rtfv2QrjJle3aNWBK2wM1l0dz6ImfTkZTINmPHXc6ET4KGg9XuBvceqCJwM2rWD6
	8dqo3GaH5/BicZoAqjy5+ZAUSazVZWmjk2z+OhrXhrZJrsqPfWdA4f37u68KWfRM
	yQNB6w4w53U10D+ReiCrBCtdV4trd5bLXCawujiXcUAiR/V45e/HMfsTe65Y3O0P
	DPEylu5lmH1c1DyCOifUiA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022105.outbound.protection.outlook.com [52.101.43.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4br8q1ypdg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 09:09:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VScqhl2yr3QYZyDSZobRndM2KEpywAlh4ocqOjzrZE7f4k84s4yEjnM5hnZ8LgNX34DcbP0WwgY6lP5winwAmQffn61q0A70ldv9Sfu27v+iHhVZ4UBDPxK+P9ZdnSOysr4YtQxqrbooV3myhAZb+/tGKFEpwr1ILmNqTqI5jxkRJrfQyd4Q06I9P7Z8pz8UDP6MKkHhPHTNuwRusLR/7UDYxYcKm1oD10p4fQgMo4PjarK9MVKqMvFO3Hw4rygM09Fzk7B4Bzt02jPcO12gLZgiaAAKaA3V1Hp1P8GnfnNOQ/a8dwnvpWKVdC+/BXldkGQ+AO6WQO6JMDrWJY1BGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMgcV28TJJ3+7IKTVARQ/P4aiMxT8g8N/lh+vQFVfUw=;
 b=MRRZjA6i/RoNj9WtGmVRs7//md+DwWRQUPCMgJnk1lhbI0xsyqobISWBoa2yNUSUDqYCSGZzxV6vKeqONUcp75bRRlbrCuSP0oJQFjZRrHw4gqd9zun/AMzJrG3c2X5WuUaypmBy0EObJIXahWmnKKrrXa6P3mP/pAR1eHdx3/TqeXx4FicjRfJD1y/Q1sx7+hzxXMN/1JKWRZZPL3D/arvx8BDPpPY9qmbPRU6UkqTv7wvx+fYOYjnrdHuYZG0E1zpnMAYDHnTpYwBfbGqmyjrI34A2vsxtzT09v4Ukuk4vR+lY04wtFx6XSabj7a9ubzFe5pvChE4KV2tpubPi+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMgcV28TJJ3+7IKTVARQ/P4aiMxT8g8N/lh+vQFVfUw=;
 b=jS/g565XbJjh+3SlH5gol2vBlQHbD8Bvwl6oifFOYra0aHSAS2XtQYwq7khb6fzh1L3WuMqmpQ6bDB2ZwU63w+y2RF7Y2EIu5U0Q3P3Q3l8/Qi/z+ROLqb8gA2ykcxgYta4OqCW+vEuAEQHs3C3ZSxnmvgdxsPUXED3wJndPpjs=
Received: from CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18)
 by BL1PR19MB5770.namprd19.prod.outlook.com (2603:10b6:208:392::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:09:53 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::b0) by CH2PR14CA0008.outlook.office365.com
 (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 15:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 23 Jan 2026 15:09:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A35E6406543;
	Fri, 23 Jan 2026 15:09:51 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6D975820257;
	Fri, 23 Jan 2026 15:09:51 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH v3 3/4] mfd: cs42l43: Add support for the B variant
Date: Fri, 23 Jan 2026 15:09:38 +0000
Message-ID: <20260123150945.100038-4-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260123150945.100038-1-mstrozek@opensource.cirrus.com>
References: <20260123150945.100038-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|BL1PR19MB5770:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 770f84d5-eb01-435d-0852-08de5a917600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M/RJIrlGuncqBB8uVYr5CwEnBmuN1VAG5rFZ8ACZYfAWpy+ZkOJ52txPWWyB?=
 =?us-ascii?Q?tY0hvRBySHs10CQ7rFiSGH8MaZjaTBPyl4VtdXQYxC3UeCgKvyx3vv+fjM+j?=
 =?us-ascii?Q?Q9tFRFRn47gar3PFJFuVQROH/vtODI7JlwhZec/UjjzoPvwS5sZzNbixt62U?=
 =?us-ascii?Q?iEo8lBUiJFN69VQsBvrR9EHlrYXU5rr7XoahAHbZ6d8+2CfnLbxMqB6LR8ww?=
 =?us-ascii?Q?ZX2R0lqnO4EUT0RYpGRmJX06s+Wrdgj42twwqtSDOHZ+eNHoLSXoZFo045Qj?=
 =?us-ascii?Q?FrSemOmNed1pZ9TQwqNXskbWqFJaU8IJq65P+clO4n5tNc+KwesPC6ep+c60?=
 =?us-ascii?Q?1BljU15dbI0d6zusjz4t6AKAwCpJ+rUFSFA+UxmAbnQk+N0tkDnNJccAI4dc?=
 =?us-ascii?Q?7/xN7hbv+UXnhQu2zWv3kgtUEMwevbkzORT/qMIBBLUCORbWHsZqSBFKubLj?=
 =?us-ascii?Q?U/I0O9tYkEcN7RBlYHABuUY/XVL4S5BLQWmBAWksTqNLChtlVspg3/ttwZXG?=
 =?us-ascii?Q?8FC9ukP04L/5ZikY5LhfYG3suE3OUWuAY3k+ihizwVEetvGyGjKMGr4H3akU?=
 =?us-ascii?Q?MGNsQk+tF7sqYC913rB1wUFUBazYl/176L4xYCoa842NlWn5a2jOtklT+KLX?=
 =?us-ascii?Q?d4m743LKX6wF5dlXsfiFQHU3Lf9H6gBT2TLAdl1I8YsUAh0AM0VXDKR0T/t+?=
 =?us-ascii?Q?ns/PuA/PahPhUzYqVCXCuv6t8d8LkbLJ+HaZMILK/zexF7WfrnAtTWtlsfID?=
 =?us-ascii?Q?m+VD69SbZJ05JOidDqwPTkcUDVnaKxgbuk71N57cdDmAaGnWxtUrwVuZl2CN?=
 =?us-ascii?Q?oR1mWprT5wKz5vvKDro9ocA01pih5djYx053X41SRWSJM58QL5IPd2G1e59L?=
 =?us-ascii?Q?wJd/ke0Hv+pg7UyNOSrCe8F3GcsE0Gp2ObIw+MdKWXJ4WXs+AQvwapeFkoot?=
 =?us-ascii?Q?ha1C9mcDfmofS+N/SZcSxTJQqKW8pn5eNucUQPrgoXXZvOtf6nOI9fvnudRY?=
 =?us-ascii?Q?8BLR3pAJXVoZzYIHzAnE6mPc0FizCRg2E61alb9UnIU8VtYFGf2ZvZ4EGY3m?=
 =?us-ascii?Q?LFn7LgKpL1A1oA7gaYkURMPP/Ku36ucfvyruZMnyFPKfFPzb+py2A5A5H9KS?=
 =?us-ascii?Q?a5w8tNgECuZl8d0KnON9Etz+XnDdPZIqrNKqsCw8KOTkG+3poRPLMI8M9S3P?=
 =?us-ascii?Q?KDcVMBgFa8Cb2m6NSPBYuHQBA/mNkn8hlOFcfAhO84Nvu/UzqECJOWFPgYhy?=
 =?us-ascii?Q?a0/tpCd8TSV6oASuMbtl/ccsk/AFe3XlUno5g84QEajphrmvBuKjkiXjWj/f?=
 =?us-ascii?Q?EYpou71zGwaKoDQLG8Ld5Lg4xdr7Xw0UimQbceoJ+1mfiSJzMMPCnxWLw7s3?=
 =?us-ascii?Q?YnBR47XStPGIi42WRDTjI0uIlaq97AwMbUzB6i82jhD16dndQoLmCA6qJ3OV?=
 =?us-ascii?Q?psF9xMS5c45laQgsGqkBWFy9uxHqKsAfeZhjs83cvhswz+6oggwJzEa9QLpM?=
 =?us-ascii?Q?tfJY7ClWjeHCLqERvtiTtr54jqxhHpFaU9KmocnnLKoL9mTPqMeRnhuCn4/d?=
 =?us-ascii?Q?qa1peB1Sp8JqhePhNDnLGayaqeeB0gr+GVarQK9yNdASUdFCSMP1BKYN/jVr?=
 =?us-ascii?Q?68eK3sFFjF1R2bfuKlsh7+163rqDUN9XYf0DRZXecYFxxLbnZnmiNe4Ac8Ak?=
 =?us-ascii?Q?SD7+ww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:09:52.7343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 770f84d5-eb01-435d-0852-08de5a917600
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5770
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExOCBTYWx0ZWRfX7NbpxlBp4Axx
 V3rio2i55q5nAdn3101AFf33fDb+nMVtzKHA6ADw7mEQgQGvGkyToxs30oHWoE4mjZL7G+N1o1B
 RteigH7YwqZs+VknPv9WaQs5YwC5ju7x0z83UQcVSOA+KDD/pZGFOxUx/knJoQb573eKpk86AIN
 lIEWcvJl78nMt/qckuGCkjqvRLHLIVo513UAifIXxSwoDVjWVdsTHgVzpOuTfxQxmFHoceybil8
 nlkfsvzB9vQ9agzgc4Hv9Ddhx5ayy2Yy+WBmHBMH8OY/dy2u7/wEacRkgERYrZE5zeFBaunHg9V
 EW8+ePBdHkY4wZGXtZYuPVCqxFygGsfQv4jNNgXMgPt7XdBECj3V+0S4zzhwyjOobdiPJpdmTpF
 spCi4Ng7o32kpbFq6HbOp2hl6j4XrDsgWlNDFJhW6emt6GOSheRdtLJg/ZnW95LINlzPbartzFq
 150lka/UtoShUsy2Ofw==
X-Proofpoint-GUID: ySWqqaSDCGyA33n02BmXlpuQ_nP-Kkqj
X-Proofpoint-ORIG-GUID: ySWqqaSDCGyA33n02BmXlpuQ_nP-Kkqj
X-Authority-Analysis: v=2.4 cv=JbmxbEKV c=1 sm=1 tr=0 ts=69738f44 cx=c_pps
 a=x+YQLAOB2Ab8tpUMZgnrtQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=w1d2syhTAAAA:8 a=XPwATKmoEvXA9jVZorMA:9
X-Proofpoint-Spam-Reason: safe

Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
the same driver.

Changes in CS42L43 driver specific for CS42L43B:
- Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
- Decimators 3 and 4 are connected to PDM1
- Added Decimator 5 and 6 for PDM2
- Supports SoundWire Clock Gearing
- Updated ROM requiring no patching
- Reduced RAM space
- Each ISRC has 4 decimators now

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
Changes in v3:
 - fix incorrect type cast (long -> int) in cs42l43-i2c.c
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
---
 drivers/mfd/cs42l43-i2c.c        |  7 ++-
 drivers/mfd/cs42l43-sdw.c        |  4 +-
 drivers/mfd/cs42l43.c            | 93 +++++++++++++++++++++++++++-----
 drivers/mfd/cs42l43.h            |  2 +-
 include/linux/mfd/cs42l43-regs.h | 76 ++++++++++++++++++++++++++
 include/linux/mfd/cs42l43.h      |  1 +
 6 files changed, 166 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index a2ab001a600a..7f3bf05f2fff 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -47,6 +47,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 	cs42l43->irq = i2c->irq;
 	/* A device on an I2C is always attached by definition. */
 	cs42l43->attached = true;
+	cs42l43->variant_id = (int)device_get_match_data(cs42l43->dev);

 	cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -58,7 +59,8 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)

 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id cs42l43_of_match[] = {
-	{ .compatible = "cirrus,cs42l43", },
+	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
+	{ .compatible = "cirrus,cs42l43b", .data = (void *)CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, cs42l43_of_match);
@@ -66,7 +68,8 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);

 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id cs42l43_acpi_match[] = {
-	{ "CSC4243", 0 },
+	{ "CSC4243", CS42L43_DEVID_VAL },
+	{ "CSC2A3B", CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 023f7e1a30f8..4b11cf5de614 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -178,6 +178,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *

 	cs42l43->dev = dev;
 	cs42l43->sdw = sdw;
+	cs42l43->variant_id = (int)id->driver_data;

 	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
 	if (IS_ERR(cs42l43->regmap))
@@ -188,7 +189,8 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 }

 static const struct sdw_device_id cs42l43_sdw_id[] = {
-	SDW_SLAVE_ENTRY(0x01FA, 0x4243, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *) CS42L43_DEVID_VAL),
+	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *) CS42L43B_DEVID_VAL),
 	{}
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 107cfb983fec..57980b3388ac 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -115,9 +115,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_DECIM_HPF_WNF_CTRL2,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL3,			0x00000001 },
 	{ CS42L43_DECIM_HPF_WNF_CTRL4,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL5,			0x00000001 },
+	{ CS42L43B_DECIM_HPF_WNF_CTRL6,			0x00000001 },
 	{ CS42L43_DMIC_PDM_CTRL,			0x00000000 },
 	{ CS42L43_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
 	{ CS42L43_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
+	{ CS42L43B_DECIM_VOL_CTRL_CH5_CH6,		0x20122012 },
 	{ CS42L43_INTP_VOLUME_CTRL1,			0x00000180 },
 	{ CS42L43_INTP_VOLUME_CTRL2,			0x00000180 },
 	{ CS42L43_AMP1_2_VOL_RAMP,			0x00000022 },
@@ -155,8 +160,12 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP3_CH4_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00000000 },
 	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH3_INPUT,			0x00000000 },
+	{ CS42L43B_SWIRE_DP4_CH4_INPUT,			0x00000000 },
 	{ CS42L43_ASRC_INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ASRC_INT3_INPUT1,			0x00000000 },
@@ -169,10 +178,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ISRC1INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC1DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC1DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2INT2_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC1_INPUT1,			0x00000000 },
 	{ CS42L43_ISRC2DEC2_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC3_INPUT1,			0x00000000 },
+	{ CS42L43B_ISRC2DEC4_INPUT1,			0x00000000 },
 	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
@@ -269,6 +282,8 @@ EXPORT_SYMBOL_NS_GPL(cs42l43_reg_default, "MFD_CS42L43");

 bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 {
+	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
+
 	switch (reg) {
 	case CS42L43_DEVID:
 	case CS42L43_REVID:
@@ -292,7 +307,6 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_ADC_B_CTRL1 ...  CS42L43_ADC_B_CTRL2:
 	case CS42L43_DECIM_HPF_WNF_CTRL1 ... CS42L43_DECIM_HPF_WNF_CTRL4:
 	case CS42L43_DMIC_PDM_CTRL:
-	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
 	case CS42L43_INTP_VOLUME_CTRL1 ... CS42L43_INTP_VOLUME_CTRL2:
 	case CS42L43_AMP1_2_VOL_RAMP:
 	case CS42L43_ASP_CTRL:
@@ -387,8 +401,16 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 	case CS42L43_BOOT_CONTROL:
 	case CS42L43_BLOCK_EN:
 	case CS42L43_SHUTTER_CONTROL:
-	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
-		return true;
+	case CS42L43B_MCU_SW_REV ... CS42L43B_MCU_RAM_MAX:
+		return true; // registers present on all variants
+	case CS42L43_MCU_SW_REV ... CS42L43B_MCU_SW_REV - 1:
+	case CS42L43B_MCU_RAM_MAX + 1 ... CS42L43_MCU_RAM_MAX:
+	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
+		return cs42l43->variant_id == CS42L43_DEVID_VAL; // regs only in CS42L43 variant
+	case CS42L43B_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43B_DECIM_HPF_WNF_CTRL6:
+	case CS42L43B_SWIRE_DP3_CH3_INPUT ... CS42L43B_SWIRE_DP4_CH4_INPUT:
+	case CS42L43B_ISRC1DEC3_INPUT1 ... CS42L43B_ISRC2DEC4_INPUT1:
+		return cs42l43->variant_id == CS42L43B_DEVID_VAL; // regs only in CS42L43B variant
 	default:
 		return false;
 	}
@@ -597,15 +619,27 @@ static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
 static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
 {
 	unsigned int need_reg = CS42L43_NEED_CONFIGS;
+	unsigned int boot_reg;
 	unsigned int val;
 	int ret;

-	if (shadow)
-		need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		if (shadow)
+			need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
+		boot_reg = CS42L43_BOOT_STATUS;
+		break;
+	case CS42L43B_DEVID_VAL:
+		need_reg = CS42L43B_NEED_CONFIGS;
+		boot_reg = CS42L43B_BOOT_STATUS;
+		break;
+	default:
+		return -EINVAL;
+	}

 	regmap_write(cs42l43->regmap, need_reg, 0);

-	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
+	ret = regmap_read_poll_timeout(cs42l43->regmap, boot_reg,
 				       val, (val == CS42L43_MCU_BOOT_STAGE3),
 				       CS42L43_MCU_POLL_US, CS42L43_MCU_CMD_TIMEOUT_US);
 	if (ret) {
@@ -644,13 +678,25 @@ static int cs42l43_mcu_stage_3_2(struct cs42l43 *cs42l43)
  */
 static int cs42l43_mcu_disable(struct cs42l43 *cs42l43)
 {
-	unsigned int val;
+	unsigned int val, cfg_reg, ctrl_reg;
 	int ret;

-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG,
-		     CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
-	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION,
-		     CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		cfg_reg = CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+		break;
+	case CS42L43B_DEVID_VAL:
+		cfg_reg = CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG;
+		ctrl_reg = CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_write(cs42l43->regmap, cfg_reg, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
+	regmap_write(cs42l43->regmap, ctrl_reg, CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
+
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, CS42L43_CONTROL_IND_MASK);
 	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, 0);

@@ -740,18 +786,32 @@ static int cs42l43_mcu_update_step(struct cs42l43 *cs42l43)
 {
 	unsigned int mcu_rev, bios_rev, boot_status, secure_cfg;
 	bool patched, shadow;
+	int boot_status_reg, mcu_sw_rev_reg;
 	int ret;

+	switch (cs42l43->variant_id) {
+	case CS42L43_DEVID_VAL:
+		boot_status_reg = CS42L43_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43_MCU_SW_REV;
+		break;
+	case CS42L43B_DEVID_VAL:
+		boot_status_reg = CS42L43B_BOOT_STATUS;
+		mcu_sw_rev_reg = CS42L43B_MCU_SW_REV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	/* Clear any stale software interrupt bits. */
 	regmap_read(cs42l43->regmap, CS42L43_SOFT_INT, &mcu_rev);

-	ret = regmap_read(cs42l43->regmap, CS42L43_BOOT_STATUS, &boot_status);
+	ret = regmap_read(cs42l43->regmap, boot_status_reg, &boot_status);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read boot status: %d\n", ret);
 		return ret;
 	}

-	ret = regmap_read(cs42l43->regmap, CS42L43_MCU_SW_REV, &mcu_rev);
+	ret = regmap_read(cs42l43->regmap, mcu_sw_rev_reg, &mcu_rev);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read firmware revision: %d\n", ret);
 		return ret;
@@ -918,6 +978,13 @@ static void cs42l43_boot_work(struct work_struct *work)

 	switch (devid) {
 	case CS42L43_DEVID_VAL:
+	case CS42L43B_DEVID_VAL:
+		if (devid != cs42l43->variant_id) {
+			dev_err(cs42l43->dev,
+				"Device ID (0x%06x) does not match variant ID (0x%06x)\n",
+				devid, cs42l43->variant_id);
+			goto err;
+		}
 		break;
 	default:
 		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index f3da783930f5..a0068f6572e2 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -9,7 +9,7 @@
 #ifndef CS42L43_CORE_INT_H
 #define CS42L43_CORE_INT_H

-#define CS42L43_N_DEFAULTS 176
+#define CS42L43_N_DEFAULTS 189

 struct dev_pm_ops;
 struct device;
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index c39a49269cb7..68831f113589 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1181,4 +1181,80 @@
 /* CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG */
 #define CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL		0xF05AA50F

+/* CS42L43B VARIANT REGISTERS */
+#define CS42L43B_DEVID_VAL					0x0042A43B
+
+#define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
+#define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
+
+#define CS42L43B_DECIM_VOL_CTRL_CH5_CH6				0x00008290
+#define CS42L43B_DECIM_VOL_CTRL_UPDATE				0x0000829C
+
+#define CS42L43B_DECIM_HPF_WNF_CTRL5				0x000082A0
+#define CS42L43B_DECIM_HPF_WNF_CTRL6				0x000082A4
+
+#define CS42L43B_SWIRE_DP3_CH3_INPUT				0x0000C320
+#define CS42L43B_SWIRE_DP3_CH4_INPUT				0x0000C330
+#define CS42L43B_SWIRE_DP4_CH3_INPUT				0x0000C340
+#define CS42L43B_SWIRE_DP4_CH4_INPUT				0x0000C350
+
+#define CS42L43B_ISRC1DEC3_INPUT1				0x0000C780
+#define CS42L43B_ISRC1DEC4_INPUT1				0x0000C790
+#define CS42L43B_ISRC2DEC3_INPUT1				0x0000C7A0
+#define CS42L43B_ISRC2DEC4_INPUT1				0x0000C7B0
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_SW_REV					0x00117314
+#define CS42L43B_PATCH_START_ADDR				0x00117318
+#define CS42L43B_CONFIG_SELECTION				0x0011731C
+#define CS42L43B_NEED_CONFIGS					0x00117320
+#define CS42L43B_BOOT_STATUS					0x00117330
+
+#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
+#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
+#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
+#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
+#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
+
+#define CS42L43B_MCU_RAM_MAX					0x00117FFF
+
+/* CS42L43B_DECIM_DECIM_VOL_CTRL_CH5_CH6 */
+#define CS42L43B_DECIM6_MUTE_MASK				0x80000000
+#define CS42L43B_DECIM6_MUTE_SHIFT				31
+#define CS42L43B_DECIM6_VOL_MASK				0x3FC00000
+#define CS42L43B_DECIM6_VOL_SHIFT				22
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK		0x00380000
+#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT		19
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_MASK		0x00070000
+#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT		16
+#define CS42L43B_DECIM5_MUTE_MASK				0x00008000
+#define CS42L43B_DECIM5_MUTE_SHIFT				15
+#define CS42L43B_DECIM5_VOL_MASK				0x00003FC0
+#define CS42L43B_DECIM5_VOL_SHIFT				6
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK		0x00000038
+#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT		3
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_MASK		0x00000007
+#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT		0
+
+/* CS42L43B_DECIM_VOL_CTRL_UPDATE */
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_MASK			0x00000800
+#define CS42L43B_DECIM6_PATH1_VOL_TRIG_SHIFT			11
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_MASK			0x00000100
+#define CS42L43B_DECIM5_PATH1_VOL_TRIG_SHIFT			8
+#define CS42L43B_DECIM4_VOL_UPDATE_MASK				0x00000020
+#define CS42L43B_DECIM4_VOL_UPDATE_SHIFT			5
+
+/* CS42L43_ISRC1_CTRL..CS42L43_ISRC2_CTRL */
+#define CS42L43B_ISRC_DEC4_EN_MASK				0x00000008
+#define CS42L43B_ISRC_DEC4_EN_SHIFT				3
+#define CS42L43B_ISRC_DEC4_EN_WIDTH				1
+#define CS42L43B_ISRC_DEC3_EN_MASK				0x00000004
+#define CS42L43B_ISRC_DEC3_EN_SHIFT				2
+#define CS42L43B_ISRC_DEC3_EN_WIDTH				1
+
 #endif /* CS42L43_CORE_REGS_H */
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index 2239d8585e78..8313f9e8c722 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -98,6 +98,7 @@ struct cs42l43 {
 	bool sdw_pll_active;
 	bool attached;
 	bool hw_lock;
+	int variant_id;
 };

 #endif /* CS42L43_CORE_EXT_H */
--
2.48.1

