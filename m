Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAF32D0E6;
	Fri, 23 Jan 2026 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181019; cv=fail; b=gJ2pUVLkrNpdWDiN8oQFT4AT2D8uUia7vuaTNGFs+mlC3M6jGVQW5v1X2HRy2YnD6c1tONZeA/pTSa1gC/He7l8kBFYdD71O3JE0EU7NnHvj2UFCkHKr9XHO5nduIOqoQpTDXguXLX3Dpxsu3WGZm/wPdWE34F59wzyi79RshGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181019; c=relaxed/simple;
	bh=RRd8l7mCZTCnChlUicWiOgp/gNI8+6WFecb/j6gcuaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EZihBHiVlJkozXNhCzPSu/ke7y1cPDRN/Zw95y9+/xFcG/s4FUyBNQKjKYMSgcI8N4SM3ThBqZahs5j2mp7nAZ96ltk1KcqDTxSo6onE8h/xK16gb365uTb+62t6a1tXbTBWvDr8om0OGgVUdncfC4oV6T20GkwLSzUTTDghIk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g1+oERw3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=F/FPbtm8; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g1+oERw3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="F/FPbtm8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N7YjJp3542751;
	Fri, 23 Jan 2026 09:09:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6zkibMysS9WRzRkt
	QDnz1Nh5zb0hE1hTdk32E0uugWg=; b=g1+oERw31hnThRnUk2o0//t3yRTr86aO
	iZ/H1bJY6CsPZTThiqtKFZhqBn+HTqQ10NknLfa1DjRrsxL1kj3XsMR0UZQ83PI9
	wCloVZssCfZNwdmSR1A5IAaB8WYF3WtcWsfsU5a38YVoO/o96xetaTVkwQ2BUhIG
	4vehD+uCwLH9bI3GksoUP1GULbjuTzAdV7MQM72Rc62z/8JVs7PxhiSQKAzv8FwO
	7QOKwQIomVE4x29ljZmbwaeJLKGUYQfMGaCh/FJk2dTAEW2XBI8lsFT4SZZPMx2Z
	4JhRXW/droBSKuVGoRdfkTSHTs4hXTkN911F1S3PMq6TLdkgnYrRUg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021101.outbound.protection.outlook.com [52.101.52.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4br8q1ypdh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 09:09:57 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXGyl+3bRpH8vNei6dmEploDCrnJECHRJ94kNiGV1Y3+sQPE9/WWgEHiZLVrwJYU8TXo/ZcZgx3rI17Mzs6C+YyAuNAsvup3PU+MLuQJszybbDCtlkyxJ8EzZSYYW31N8OZdUK8cE0ZawIDiOrUeLvmD7cxRubWNlsiCL6BOPgkPh62jWB5fFcht6+YVX9JYjic1VzUPGlFX2Xp8eLlf/X0K89sV8Ogcf+OYqTHua4RnnJ3Ieu6bzmJh+/RlnVqco9Yu5BVXpNxefU9iQh+EEeJjbeYCCoz5V1HRGLPWcPQan9YuRHXov4hTv3SUMunIhn9qJcvM5oN6SgXoFNPQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zkibMysS9WRzRktQDnz1Nh5zb0hE1hTdk32E0uugWg=;
 b=tfPHnwWC2mFsJwQLXf914JmPoFaLfBHRweaS5Mx0fDhgBZ36hPlPsDMyLe2hwBi2otwIRf7oRdvsFP1B1/HxyO7zq5Q8Qbu3rFsJ7OM+yklqZi2jxqgvcmGJ5i63f80Q7HjR61aUUFciCnXl36ZEjMyl4vgrqRoJ0/fertVW1kijVjQUdWz6hsaqMnq4g2CCppS2KrYJT+F7Q0iQxyNGPfUc+vdd+9AB2etNc2pu13AD9E7L36UZm3Ei4PZccBh7mtk0SamCSRchBH1sU4FYlO/WWVQqBlAvTAcMOIjo1OlBV5n3YwroAjquZu6IfpcSCaWS9wjvscIsJQvumBlYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zkibMysS9WRzRktQDnz1Nh5zb0hE1hTdk32E0uugWg=;
 b=F/FPbtm8WAxJ6av3CBfP5P5EjqAL+G6tAwPmqrLJBIGxVp13KwtT/DD3ohqxLOaif3BU2yfHGVQhnjGlROfCp9K+COuywx0cKrOZPGeshBNTx3AGFRRcaYUCs6Sy2rj8u+3mYgyYwjUpxD7smhA0WlWWwR/GEHtnPuyIJ3H0tvE=
Received: from CH2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:610:60::28)
 by SA3PR19MB9283.namprd19.prod.outlook.com (2603:10b6:806:499::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 15:09:53 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::9f) by CH2PR14CA0018.outlook.office365.com
 (2603:10b6:610:60::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 15:09:45 +0000
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
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8C8FB406540;
	Fri, 23 Jan 2026 15:09:51 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 55F12820249;
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
Subject: [PATCH v3 0/4] Add support for CS42L43B codec to CS42L43 driver
Date: Fri, 23 Jan 2026 15:09:35 +0000
Message-ID: <20260123150945.100038-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SA3PR19MB9283:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 657118b4-6ec8-4d7d-e329-08de5a9175fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|61400799027|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s05BFvpUT/F7PIoAdfyfYThK1VbZEodfOK/KtRmeEgVSjljrEr7QUDNyjaeD?=
 =?us-ascii?Q?ol7n0eQbo+UOBWbkNHjuzHzpB6hzhXRPM0l1dXl3KdkHWASzq+qaZVkl40kL?=
 =?us-ascii?Q?bXGp8SP2IjbtJ87T/C6mgg7dMLTNLQTgsAbN2lLlDMlKY0VTMLRvVJe/FeCF?=
 =?us-ascii?Q?P1A3BtnMPNZuom+m4z72E/H/j/GZ0rEHoVUeyQ9iWGzanHeFBTaOZrSvN7Jq?=
 =?us-ascii?Q?1d44KoUUyWrucj6KzJzuiFV3LnfTts34pzDBahykujqezvIdFGUGZdmklGdg?=
 =?us-ascii?Q?8Np43m19dmkvYn6u/frmBA4SVUGCVtCdkXLBUe1oNkgLeKyWnMYxC5f1H+6i?=
 =?us-ascii?Q?v9tfj2/bsswLI+S6lw7ntn2ljD62e8CV/JBz50giqUn8te12A4K8I+wohViC?=
 =?us-ascii?Q?M4qm8sf7RoYh9qEfmDzW5Z8PlTKZryLap4w/GpPBuvFOqQQGHwDNwuGjbZis?=
 =?us-ascii?Q?jXNoTUYRVAMiDXXk/1gCdHT/I4Tb1j09yXFLmDihCB01ZNXeDX8imW60H/YR?=
 =?us-ascii?Q?CtHP4XO/izqqtJ6RDuJmPBLv+7U8Lup+eJElujXSUllUxNKS4IVTwCF3yQFl?=
 =?us-ascii?Q?YrYs24nh24iIxXRVuilS9SUYQrBQobT/pIho15aq/TPLRCBYPr4F2ds9xo4L?=
 =?us-ascii?Q?MsCuMOV5YK5cdBFH7jlRW9KPz5SRVS0IM/Hk51ThmPgopsCF2AAvOuq9T7xO?=
 =?us-ascii?Q?3uR8Dv+Nw7rxwY7Y8VEISVuRUAsW0DiNYT4i2q72QFWjSnftDcztM4G03Xub?=
 =?us-ascii?Q?daWC2Oa0+9TzJVW+Ra/sxjEaWaJBla8NIEoIIuD5UW83YllnjpCgkenPjhvc?=
 =?us-ascii?Q?+8r3EXD3DIE82EXK8zB2qQMx56jGgpngbvoyAZc/8u8Qhwuo/ehuHHh3us5p?=
 =?us-ascii?Q?5bVVT3pgMFtvQ6Q7riALRoQWr8viDq3RlLVXcyuypwdcWIHW39HNlPEIyoz4?=
 =?us-ascii?Q?IqSchENHyodu93nop0jzyipTZn+clYaWfidMOf7QlBiupZoyoHaais4FR8y4?=
 =?us-ascii?Q?v3CGJLX6qu2Gtdfect6kEC8lTcYCJNOzMjmYt2/4PNqrzO7n7h7C86z+GVDN?=
 =?us-ascii?Q?DLdfa6fpxgB99KamFm4JYDqibwl2ws+P0wrZoAZHYj/Kdus7D/zyrEWRKimE?=
 =?us-ascii?Q?Xe8KDT8JCkF5YjM6mSzq3prYFa1TV0WjgCN6lVLanjaQJwaoSt26LGjsRvwB?=
 =?us-ascii?Q?+a1eSJxQttV1PpxKtd5OcR0lvogYhJUIlK4o5dWbx8gOapNw1DCK/yX6UGi2?=
 =?us-ascii?Q?aaGjnS7IxGZH3laYlnyQiwHRcZl0fhdHQPX7VMcGyPzVdd9TRBln3p49q8Ft?=
 =?us-ascii?Q?BSLmwEnkO1aBcnXOXFMtYDid9+s3rukugtCC2QdjvAQJ7+dUSozJg6EyUsNU?=
 =?us-ascii?Q?SQho920lafiPxYHJIcCRQZabnAy1RZnZqbyCvZEavnD/kDMoMUyfSryqFROU?=
 =?us-ascii?Q?P1PGikv6EjAFDL68F0D8lp9ptDoWk3+e+8wGB95naGv5lOMBYpvDqlpldC8Y?=
 =?us-ascii?Q?VFcgXNOGx7y8iS9xDf+ZCshWQoRqo1QH7H+tYuhoj6lks3QiTqbuxnyR5kO3?=
 =?us-ascii?Q?nNc0r8HSSno00g9eoV5NMOJsaZIQ8CFwkBLbbaj9s1tJ3Jq6R3rhP+qUPs4N?=
 =?us-ascii?Q?Y7niUKRtz9DaQsW2dnbhxlHkcBLmA2zPPhSsi9ijk5FWqxAZkevB7XFWvgWo?=
 =?us-ascii?Q?fq9ABA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(61400799027)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:09:52.7272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 657118b4-6ec8-4d7d-e329-08de5a9175fe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9283
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExOCBTYWx0ZWRfX45AdVdTi9yvE
 EaD6tyGpdMC9+FNVqc0wqsGlk2UzUQmTR5oAxeNpJlVlVk0qCQwTZJ5AZQYIliqLWcS5waCDJB/
 impUmYKar2xAMVKYR1yinFhFELTXVWu1fmXHZRts5VuyqYUgI7ZRAAviTpPbgJc0sk8ydK7+dLP
 c81rO/6O743jUNE1DW/sZNS/0BSz++2XKZKrS5rBrbWwK4ThDVJY9DATxz4WCXNKSCc6Uz5os9z
 cRO1vgk/x6o7XDP+YPDVa9c4yXa0wDnm5yE4h4BS/9FUyBDO8iwWaG0/67Rv8Rf4jzReksX4XYC
 g11K+2xTIMcUNXObTnsmGIA7N5GCvZWzr6wVhIdAUIu2dU70zLEeGQtdR2U9sX2F+GlbZgEaef5
 3Jws/1k1Pq+pcW8c68X6BNz+PVTbwmb5wPtnlWOfbY+mTr2BK6CQIgXdgbaLfZ2fF2eDpXZjI5d
 DNxnL3WwQ7znoTZLLaQ==
X-Proofpoint-GUID: IAZcWE7_W7ShmnmyheCqTUyqQ7hjSjaR
X-Proofpoint-ORIG-GUID: IAZcWE7_W7ShmnmyheCqTUyqQ7hjSjaR
X-Authority-Analysis: v=2.4 cv=JbmxbEKV c=1 sm=1 tr=0 ts=69738f45 cx=c_pps
 a=3cYuoP5kWG2k1oDcrssWdQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3fcK6sipGkM-lnU_H0wA:9
X-Proofpoint-Spam-Reason: safe

Hello,

Introducing CS42L43B, a variant of the CS42L43 codec with changes to
PDM (DMIC) inputs, RAM/ROM memory and extra channels to two SoundWire
ports and ISRCs, and can be supported by the existing CS42L43 driver
with some modifications.
Support is split into four commits:
 1. Add CS42L43B codec info to SoundWire utils
 2. Add dt binding for the new variant
 3. MFD driver part 1/2
 4. ASoC codec driver part 2/2

Regards,
Maciej

---
Changes in v3:
 - fix incorrect type cast in mfd patch
Changes in v2:
 - Rework the mechanism to identify the new variant along with some
   error handling improvements.
 - Added some comments in cs42l43_readable_register() for clarity.
 - Add handling of the I2C path for the B variant
 - Add a dt binding for the new variant
 ---

Maciej Strozek (4):
  ASoC: sdw_utils: Add CS42L43B codec info
  ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
  mfd: cs42l43: Add support for the B variant
  ASoC: cs42l43: Add support for the B variant

 .../bindings/sound/cirrus,cs42l43.yaml        |   3 +
 drivers/mfd/cs42l43-i2c.c                     |   7 +-
 drivers/mfd/cs42l43-sdw.c                     |   4 +-
 drivers/mfd/cs42l43.c                         |  93 ++-
 drivers/mfd/cs42l43.h                         |   2 +-
 include/linux/mfd/cs42l43-regs.h              |  76 ++
 include/linux/mfd/cs42l43.h                   |   1 +
 sound/soc/codecs/cs42l43.c                    | 756 +++++++++++++++---
 sound/soc/codecs/cs42l43.h                    |   4 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |  54 ++
 10 files changed, 848 insertions(+), 152 deletions(-)

--
2.48.1

