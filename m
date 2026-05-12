Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6433839A1;
	Tue, 12 May 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581900; cv=fail; b=ggU8tPc8UgUQswxQb+NW0r1OpETk7IMCIfjVDHS91Ao5NhTH7XMrGcMFU/ofH5bl/d6lWZ//gHNyNHN4woH7GftlmWVudkGgRuj53GKj+5OGxmt06pCOlOJT45LkhfYsZ9k9AjLwEVYeIyymsoUNeave7K+2gQO0e5a9fwaB3A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581900; c=relaxed/simple;
	bh=6hHdoCye6A5/PQ0CaGrCb2qHx/uDLC7I4FyKIwYM2NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWMBmYGjhN8ThuUYRDItJpdpWn25u8Hi+9jEJIDPqRDY7yidNKfbySqj/h9+yh8tUJ99dar/7CMoFkyr+T7Sl5dudZfloyVJHCqKurYAlKyQU0O5lIYIHTRLnzFQutr7WVGbJmn3WumrQMXBPXmFweu812BdyBKQFbH2ZWg6Kx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SA3HjxAr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qv7xXBC6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SA3HjxAr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qv7xXBC6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C12QvZ1137580;
	Tue, 12 May 2026 05:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=JxVpEAv+ixn1VSUMqJc4syQROhX/CFdHn5wCWMBX8/E=; b=
	SA3HjxArWcKxLyRs6S8btdGM4BPkaKBo/ArsAobA9WzMTRmWLR+gMhFi8yAuHY1Q
	QlZ0UamzfLrYDy/JQK5HIRo5YEZ81yRMJAbG/y9MbpQdHznIhiciz66O50eN8oao
	t0X/y+ERFN3QzGGtORxzcURZSbd1nSxn//azEAeGfxPeQ8YOVlwnJFjHzNpbJvI3
	Vtb/Uz5erT1OIHXX+y8PJdo0Z2QaQlqj9clGLKYsivtGz7IAoQLQWRy4QUfM7PBe
	wAwB30xYuF+1z1oRivdFQ6hio/oCPZ1HWPjSMF6q5vdFpdAMPEZ7Qv4tY3M7r2Q8
	KbsXFm4GZSbbD5H9AFLTnQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020103.outbound.protection.outlook.com [40.93.198.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r7v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJ1mr5JaNb7dNszgZvmpeagkfM4b1c51iIbn4sDGvMyxEyWUqJTtlVjDYUMEr66L2pujAoin98BhwPN5cLOni0BfkisWNSjvZs/UYDohkMFPF/VLKDGyGYUAkOn/0dvgHnijklQsquNg+ONrJmJIpNZ83JUdqwqWUELqxQ3NQUSRU3D08Xz3lixncw3ia56Ddk9rNN7dA2mxV7PjwxPQ5XPqHptkxoZd2AfCbuTTDa/Sh/+/qsw5dSRl5ziEcRDkLRq+WBpBtzeHIeQCkT4vAXExJorTUsvlJs0IbiD432rpBeUw+gWpE6ERe4GwzSfW4FDUYPlmsNhkbMx2Dhw4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxVpEAv+ixn1VSUMqJc4syQROhX/CFdHn5wCWMBX8/E=;
 b=YEGuWRnlJBiIpgJlqxb1CcUSsIbtcsyUfrdSOrmgS4+UeKOcPTyet/5djEZgx9CI7mRp1e8DU2txZyRtyhs3/3XOgfpzLnuohiB8BM+61dng7cQeBYyTIu2UKvlJIptTism6xL+mC71hZQ0sU8M0kw4darBZ6q+A1lOfqRvVfD2n9Yh0iT7VUYmfnENKzo1ndi3+xSkRrC9Ljydq/oE4krjXD1oF82Rtr698CQ/k2xE0NxyYyFUFShTmgOFECdTulJzKRBavMqPTLCxaVFhbw3W+8vrNV8CMaF9xkzd5bBO60nAlMxGSmWmsY9mokIUfgRhiBd4gJEzjQZ6uvcFZAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxVpEAv+ixn1VSUMqJc4syQROhX/CFdHn5wCWMBX8/E=;
 b=qv7xXBC69+6C+MPBL0fKMTzWzA6BezjkyULNQQvWBtPXfAgKVtPjuDGsFHWKdlRAH+1qzbh4dXFI0MTrFgcNtrUp73fIp4Sh8EUQFpquAr8sMnY0lcBD2U7elEKaHEUVff0chRBEk/BHDEeYsxN/l51ORLKmtLNBkir4ieXQLa8=
Received: from CYXPR02CA0026.namprd02.prod.outlook.com (2603:10b6:930:cc::9)
 by PH7PR19MB7121.namprd19.prod.outlook.com (2603:10b6:510:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:31:06 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:930:cc:cafe::4a) by CYXPR02CA0026.outlook.office365.com
 (2603:10b6:930:cc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:31:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 91EC340655D;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 56DC8822555;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 08/18] ASoC: rt712: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:12 +0100
Message-ID: <20260512103022.1154645-9-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|PH7PR19MB7121:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: df55046b-4e5e-4dcd-4f6b-08deb0119314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|3023799003|11063799003|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MJiAA22btt3Z0qkBPyD8MX13o7Jlt2t40TpHN5KMLYmk2mOD73lhdUeE1QrkqRJqhfDaNvqIxQkdq9jxrJnqrW0XgPNnCksURlvHFfSpRi+ikx5IALtuwcgm3DWlTWfOatMTeJr0Daf88CEnqEcgez7muHhqAbEXLFwBbsJyULeR24B8xRdSZ1NwrgvORznMs/cX3wSj3gZWKZFKeDgGCkTQ2TaxOEOXUAE6z5OBW7shgvsW+Eo51qQ+eotahkbb9lxQa5feeN5/MftzG0AoejsnlckRm3J3uc9DezjWXIvusOyzLaBSDPphz+AUOrVpGyF6EQDSP9yjp9XJViHR9tjvVEkVOInItSmEnteLrLlwxFT12hSycUVdjmQSVOCEBSW1OKJ9DzYJGjejZF2QchrMXKge3/HExLHFavXkP8MJ3oAKqvFRI6A02Y3z8oLG1oskXiN1n4iiFOjwYKSgyXCpBsNjo7z1Gl+3u7nTb7/lsD31R7HbByUEWCNhszaJMblqoT9Yd2J4MAdhU66ygxWosOly+7pLYlKsq0Ab3Xp8VgFFMOCm52r2Y+Q4DgAQDXrbb4tFrOl2ydH/KXAEd8n78Kf3aaconrtmvpP35RhycyWw7PmmOEf5Ub3wpX5nyjDTV6k4QKcrD9K6huFDfIqpmi2eaTWjYvtrsB/tCJxETLL18TP2/Z3y0QX+DT2HZ/sh5fkyHArcsCf4n4+bFiks3Je9DJXW7knLMz17F4k=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(3023799003)(11063799003)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H6LjHg9vShvHmloMt/RgHk0o7if2zz06NVM4aasAWp9oYWN6nTEKrzEXp2h0tLiCzt84LTZNNP9pll9+dJJrolvlK+HPIHzQl2S7+P5Nm1ah+RpHDUlybx83EmsHK6N5xO4zBQMzuj+w4gToLQXbXtKXXo1peuLPqB3AJDrwdNKuK/ZcmtxK0/zVsjdNQ6j6MNiFfDeH4CulY99zS1MI3pI4YwRmz+cC+nDcNUWLX0dw+uoobmOye0iT4jVVN02Fp4G9QpQfKabMkSUL+DACdxwzjqpbfMsQcePkJz/UTDdnFyrmxsobm0Ekl1xkpRf490aAlAH/MRs5HEuKUCJSRETHcWl7rMZlfj0iUyNQIUra/GUmBk5ankg8xDbfYZ9sCkbfpXtf3qrlpZ9eUorLJWFGeR9/i05wv+qLjdtPdMvBwEs7g5CKQK/R+8IHFo3g
X-Exchange-RoutingPolicyChecked:
	pUijXkXvdd5pZH+WjM0Pint3oJgZnoCc+myhAXVbPqW8q/9XAhm065UPterbHpjAQDqZBpb/03qTVP4Uw73avCoq5+StykS/lPSz3a2j7U2DryoMCCPyY5XngzO9GfrS7MrgC9K3z6TjL/XztZ3CUYKu02XcvMZ/xYF3UlYbpBfO+7cHYT2nd5nxKDsJoEZJDlsINS9kGlMN5XX4iofbV7AMFfK5CMfJFuludEiq6T1SBlAqg+qptlMvsSBagRc9fb0xs1iVHIifQfSi37NZVQFjTq3X8VnVu0tV5RKR1LNZ6v3QXCdSNmWI9cYYWnnX80HBAa76sv+9xFVvWz8UUg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:05.9140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df55046b-4e5e-4dcd-4f6b-08deb0119314
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7121
X-Proofpoint-GUID: qCFOJTkP8rZyMx0Jgkk0VUt3SSX0_6J-
X-Proofpoint-ORIG-GUID: qCFOJTkP8rZyMx0Jgkk0VUt3SSX0_6J-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX9/MCiD1Zx9VX
 ZvpKR3JKaHQg8dguoPTl/481ZWMJQj8d4ECpFLjfxrBe50Xt05+wgQJ/It1KIXiO6VeoChIHYHJ
 suTAZLIcc5gaxF6l3G69CIUQyvQYoXOuhxA7QOgBZElb0ntEMMEN/8vaUDyofNc+z4etyC7lU4y
 B5bBEGdCRqk4MJ9FLfwOqRBrAk+k8aAHCkoWeGJyCISUPCjnEB2eOdu4SpSs+oSjt37Yo7oZ+3Z
 agv4V/Tgo9qDyHR+21YfwGIPdwrAj8j+7+Jbji4BzYXyCKeOY+2RYYM0tqDvUrBMWCqQPS3clJX
 fpoB75k7UIMdl2vjkkWvb443Q4ETN0UhmGulgRKNzWvitEhBOKfhk4IqtQefDyJ2+g7+yXHNipF
 oQLhCkPWujevtNVwjXRhgWlasgxbLtYHfRDI0Xf1DLQDs27hwOIgJNsISdS9r2Y9pCrQPabSmdt
 8V1pTgvJwZxZiBB+6Bg==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a03016f cx=c_pps
 a=4nRh7bImp0HScQD0nwvrcQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/rt712-sdca-dmic.c | 19 ++++---------------
 sound/soc/codecs/rt712-sdca-sdw.c  | 16 ++++------------
 2 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 4d83544ef2049..4c5c2f5ba5edf 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -905,26 +905,15 @@ static int rt712_sdca_dmic_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt712->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n",
-			__func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt712->regmap, false);
 	regcache_sync(rt712->regmap);
 	regcache_cache_only(rt712->mbq_regmap, false);
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 8c82887174db2..5817321804736 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -450,7 +450,7 @@ static int rt712_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt712->first_hw_init)
 		return 0;
@@ -464,20 +464,12 @@ static int rt712_sdca_dev_resume(struct device *dev)
 			rt712->disable_irq = false;
 		}
 		mutex_unlock(&rt712->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt712->regmap, false);
 	regcache_sync(rt712->regmap);
 	regcache_cache_only(rt712->mbq_regmap, false);
-- 
2.47.3

