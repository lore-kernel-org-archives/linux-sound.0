Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D124366061
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315991; cv=fail; b=OhwQFk9guwEjpSUz2c53ZRr4ABXTn2OFuSWi8P/99YpEBHxhqCdPZY3MsAf7XrqCkkzTy6xwqnYGeESnKW0/s9IKo/W/6JbseFAnIJSvDWAg+Sm86U+l69rffhJgUNbjlbsfwGvv51vUh84lej8Bs+M9Wxfm1m/wKAvHovix5Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315991; c=relaxed/simple;
	bh=YFteBBwq+/y2L/42Bp2B7i4KxHjnDxTmllXoF51xsCc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Nk+9E5IVXrEeGK0+avTTRetpYAc4z6B8y0RErH3+o7L9TWVVXZlz0ik/ncHhDvyoliHKv7AIStNY0uPZb09VXCxo1KSxAerK4e+vwF3Yu5Zzkx3iXamLPQlDeUYF+7F66ImdfuPwQvoERYsijrU9OU8tLqmibC9vGLUbBoE2X0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Rfico7Nq; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rsBTd44e; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Rfico7Nq";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rsBTd44e"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 681MQf82693785;
	Tue, 1 Sep 2026 21:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=9Jn7YJDC037qM
	vagCJxewqIqnSERvh3YH87mJ00GqKo=; b=Rfico7NqUytPxIngo7uc8KV9umJo5
	T7WVgJUafAa+aIEEnafCdtzx1k4FpHF2CJaCapCgrq2MW1znQiVdyCFnpKTMcoFr
	1fev9n8hbFZtsLVSeA68w+ACa+ywAFtxjKucoZ6R4tDo2/NwMAyCOyn01kIfWvu/
	C/3wYAInMe4mak0KPNuHE1VPKcmffD2XtMKGMcb9aM8z+ld2qrpqbzvELsop5e42
	bzytRGL/GUfM6ie19WgBVwZtCUzjcG9noM0GrmeU6GjTHhBNIJ59iSXyWmQfjSJx
	XBh/0tNu9wqw5JXho4NI4JiQ77s7A20rC/j5tQtBfH6Q5814tYDhEKv9w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ge7gq8yte-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 21:25:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmSaBp7tj7JoF0AMClEB075UJIEKL9fhiVHU0CLtvaxgaFRbA6eMBs5AHCNLRxntw9rJQBV3mjHhcBa4XYxxT1uAk/E40iz4FJQP/iPSbn2GhJ+EAMTG5NqEKUGb90VMjrOox+ibIhS9HLkCzgZaN8zRBfsoQK5lngjbWGQa747X1QY2KJq2K17V3L0R+5WAdVA4BeqSAt2ECK9XH8NC0cA3crhJSj75DVzTCeE+/7Jho39ETEwrjniYPXn/b1T1YQ4KYSFDPN0QD+SHsEEWM3ZL0H37cuDTH1rWJhievW8owrjsaqrP+npnc4hziG/ahEZRW5cFtjIcNS5nmtAfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Jn7YJDC037qMvagCJxewqIqnSERvh3YH87mJ00GqKo=;
 b=rCFGrQMoHjc8u1M6OeHfHmaybfDByn6vNy3WnFQj80+2mCCuGQUFY4Mtff//ZFuNmdUcu4dz8dzoQ+uvU6133Y5dht6hbwLMWWuCX3ZCjFFEZCv5BC++nOEDrOOzCk7XKSUCNPqE9jHcUXN/C3Pqpe358Ob8hgWJiJnEx6owuvrkhs7pmluUaVy6ESq5I5BEGBImhXwZSm+FtuD6c+YzMh3GuLC0r2O1xvJkqSmC0i9Nmgp6CQXBhCWbAzmHKODWPX5CpnZS2615uQU6lUirf/Ocla9TMfBBG6aJarkYJDBJNL+dHc51CUw2w6MuJwnWuqWFrXWIxU8YAK94StS05Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jn7YJDC037qMvagCJxewqIqnSERvh3YH87mJ00GqKo=;
 b=rsBTd44e4ebfHCXheh17TCAbxE4mZudgZvAUKtMmT9X++sVMW6yy3uBgdTtuo9GQFUCQNYPpPX2Ct0pia0ALF43nkuks5S7Raa5/5MYCVyRaJVKeNBf9+h01IO14z/VF0UKR0ZWL7wofJiOPoJk1SILkUlIFmwlq0zR0g0d6YK8=
Received: from SJ0PR13CA0158.namprd13.prod.outlook.com (2603:10b6:a03:2c7::13)
 by PH0PR10MB7078.namprd10.prod.outlook.com (2603:10b6:510:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 02:25:50 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::11) by SJ0PR13CA0158.outlook.office365.com
 (2603:10b6:a03:2c7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 02:25:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 02:25:49 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 21:25:08 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 1 Sep
 2026 21:25:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 1 Sep 2026 21:25:08 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.162.116])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6822P47Z2888416;
	Tue, 1 Sep 2026 21:25:05 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Protect volume get/put operations with guard(mutex)
Date: Wed, 2 Sep 2026 10:25:00 +0800
Message-ID: <20260902022500.1182-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|PH0PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: c6875f1b-b76b-49a4-5a9a-08df089980e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NAwFGiQaHrkX+6sxUqU1F6HVN5l25QkVRyu0oOLXDm5cB7MXL9iYR+DjJYLYqe6YFAjm4vVJ83QRcvc9pc4KUm01cxwkENGrf8oB5QwHRZgKTSSv/qhTjxJA1Q1kMV5Z30QcceTVGvQqMLHJTApZFFsYxJ5ARGb6/VZV5MUn98cSv6kQThTAlY0eBLCEQJWLLSJg1bgX+lqSDh9Sln2PA1QDopXfU84T85MLbJyL0BZw5ydNixouH2IZCkNkTH3Kp2I325F/ymdW7c7+pmdnWKTsj235s3jm9VwPc9rRPpruvPBNC5ayG1gcY/8ksTJq0ObHPdIQB9PQhlEaPTX7BtYkmRr4/Yp0H43EqA0pAD4C4VfGDLkObS7cNgLMkfF57YDPgBDaPD1TkGZ4G6WOoBDrTVdygrr8TGfA/+8FDFcJv2YrIOMEJNYCqYcFIUraJp0riQKbyhaDTZYYHeIXAhxFBQ/mlhonFmrGrQsXRK487LYihM5SLuFjJ2SMRDOvIyEWs5jMpbn8jGdXn4cEVEj+QzZDff5E1Pv8r6Y6teZO97HSGrWty1p0DnE39oE3gcwDruMoyjwNlfBb5IRLXl/+BVbI0Q2KZSIoRQ1/4moZjUXLBuDTpLly2YhG3eW2OoqSymWD//p2nW/zpLj20ijW7Syn3PJOJolsJeOJjBiMLeuuGXMzuYkNbtqHlIcnH/79Y/A9CuRIv8r2YQOsvA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wWihZfuM6q8cxWnj1KPDdcAL273ROr22J5AkPOESSH9iN3zElfeACJv5mX4MPWUoHZoiTaZB0cF0lr4/HGdmx7z9WyL1kxnHTUflznXVnagB46FPUPCVlWaYdfVOTA3xBy3xVMIN1hNF37VQbH4zDUiHbiyfL/nD2KkjWGE0l+X1lncN1GdthhYDo/CIgGqdXuL4GDXpu11LXqprf1/3yR3aWkryJL8Jc5uziOo6dvOOCgQXk2wPRs1ZLkUpif9HETVa3njZPupEs/y9Sg8pWNiTr/dZ5eX6G4YXsBf2WVmiu6lGMQS4i58FC1y0zOTzoVvCaguDoJyJaGDdUbrFKQ1V9OZDjNKN05blna+OJP8u0JCoiFQVmgiBG0Db9WZVPeu9/PLNDlL9VCaA/jvI0jrmIMgmx0QTQRL6qUSAexRHuZ4879lpoFmZydn7QcoB
X-Exchange-RoutingPolicyChecked:
	sT8OTlNwyA4CgOaDYfO6nwwKJh9APsDaO9hvfxr7YRN3osthmbTgeXzS2nBcyOVmkN311JcAopwpqnTh5dUDjFp6WLpnocuKJ+ycHQOYJ1DNQMWTznuHjsUgG3O+5a/oA2OU54dvonR3YrF2JSPM9p0H9L+x4Bbl5ZHlWWyy7pcdqNpql4fiUsFVPorYryWUiae+m2LsoQzwOgQxN5d7ukpPO2Z9YxEQtPoY1cvRfeuN5KHgMH6lFhDhkftRZZb4aU73lvhNV46NhF6Q/X6fk8bkJElJDsvy9jpYLVe5bzBKEEqHPqTH9fW7fzDrQU2F9/mL9/JPTSfK05AqDgNGug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 02:25:49.4073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6875f1b-b76b-49a4-5a9a-08df089980e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7078
X-Authority-Analysis: v=2.4 cv=fZ6dDUQF c=1 sm=1 tr=0 ts=6a978933 cx=c_pps
 a=atoSyIAEYEcRU/7H2q9pJQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=K3CtxiFnayQ7lOTptt4A:9
X-Proofpoint-GUID: VSpOzto4YElddiQNkdCASCiGu0-oLF-D
X-Proofpoint-ORIG-GUID: VSpOzto4YElddiQNkdCASCiGu0-oLF-D
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxOSBTYWx0ZWRfX2w+6GXGseZqW
 hg7d/CSpouh48d/2nMCvwXLjmBgzM6h4lmOf+iwtYO/vL2YjzNZcWz9oX3fb8Cv7TOS+/Bv95jB
 J/xpNqjGQyIaG3q103rp12HKnvMCnKY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxOSBTYWx0ZWRfXw3b57xpXdLtb
 rPzfV/tTfSO++sVWE5LjX76vmRmA2FOxnGFPjjQ+LKIZJGbcfo69/oGr9h6Ypufoo59hdXOQcK4
 XTSRS6+sfmd27JreaHWLZAPKlCD8Wyvzf0gHEEA+Pn58P3W5sBYW9vqIYRq/sw85E7UP2Lv3lES
 CQZmcQHruP5rfLQH+wy38ZnWa61e75COAqIWj4xvBwhxwNsL5fd/U570EHM9GPnbT2me+l4Ht47
 30o/SApFGtg8okXKsybFOzFm9VvQSL5RlN0BPWT+5o2PpQxdu4pI3QdYr/mk+JGS0n4gygQ4ckm
 Cx8590Q4pCGxrkYLOFMnk4BDbdugMc6Ud0P+7VFWyKAXL7XCQNbaJrRY0kkiL08Xr9sn0WwIs2J
 EY/a0bsGYBawe8OK3i0Cm/j1puglTsFsBt7ag+0/XFfDCk1EqBLvZLFh52XLQvTi3twtPH9nlwt
 z/dowaE3P/Byo1noq6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020019

Add guard(mutex) based codec_lock protection to volume get/put kcontrol
handlers to prevent races between concurrent register accesses and
firmware interactions. Use scoped guard for clean auto-release semantics.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 6f349f88f194..2c5d6a1279e9 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -170,6 +170,7 @@ static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 
+	guard(mutex)(&tas_priv->codec_lock);
 	return tasdevice_digital_getvol(tas_priv, ucontrol, mc);
 }
 
@@ -181,6 +182,7 @@ static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 
+	guard(mutex)(&tas_priv->codec_lock);
 	return tasdevice_digital_putvol(tas_priv, ucontrol, mc);
 }
 
@@ -192,6 +194,7 @@ static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 
+	guard(mutex)(&tas_priv->codec_lock);
 	return tasdevice_amp_getvol(tas_priv, ucontrol, mc);
 }
 
@@ -204,6 +207,7 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 
+	guard(mutex)(&tas_priv->codec_lock);
 	return tasdevice_amp_putvol(tas_priv, ucontrol, mc);
 }
 
-- 
2.43.0

