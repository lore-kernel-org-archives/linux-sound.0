Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854CF40758D
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210065; cv=fail; b=U3XtxXi8jfJ/CtpOJ5dxh1o5xLCztKVdJ/ak5/h5kTqOIk25ybe8f1fckpCbvrvwHLdLcaONnDkPRqXb1R45UE4MXaZENat7c926Zli6oESFT/wj/URB0Ei4miUP69iN61Fy0V2RRjPcWMOilt4UyLhOWX4k1jzabzjL0AT8nNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210065; c=relaxed/simple;
	bh=DPDFfrSypRl3+FdGhoZpRr18p6DvcqvvpowuR+kzzwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZnG96Jw1jG6rcdwSspmGmWpJ1dFR096vtgw0mWWi+1mQvaaORMgb28qwKixZ5bzkDSKKhAjDn4cvyK/GEVfOUQqajKIS8KOWuA8BgHClV2lYqWVxAV5TEcYPkBeVCjkL4F1YJzgfuCJgVUBGy9CxW4HnqHhIZ1oJsSTgAeJmYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dkakb63L; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LOXp7xa3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dkakb63L";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LOXp7xa3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6144jvLX2414928;
	Wed, 4 Feb 2026 06:59:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=N/OwE/ncVMWXetYKaS9isdjMBpRJnH7ZYn3urdeD0O0=; b=
	dkakb63LrFeUMitC/4eAvWZtGrqzEwrgZUs33AWX0znmisHume9koZIu19g7H+I1
	ToyO1yxbdn9w2F4gcmUqo4fdm+cnnqiqaoQ37iUDLXlovnNWttYdtBm1Ob0Ptvmj
	WNa0c+VTnf39w4AEPYb6hw+OnEFUNMc50bNVfPEIkXBLKu89KaraCWrnU63BRVkU
	d9YtFVlkRocYhoXq/QjS6i+hof5+KIsoIXTKzLK2iuyrFIg3FJGyJLePpdNhrMTg
	vn1vS525ZQz/OojQ4GtWpUjXIlhpptnDDknl7pTAX9e43EdIyLHFstX4td4rvvK3
	7qOY42R07YAJm9/5CoJgbw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022118.outbound.protection.outlook.com [40.107.200.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4c1g12vh3d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 06:59:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8P0GAZK2V/kxfAZmiUN7IOwjtw5HaEyjSp771rcJbFCUER78+T4TyrWgu68cdInoxpsCr9cL+/trGOYWoZLEZHDBRWZKwXATvPtEj8guUEHLsQ22SHdBKyW1Ad1viau/D3SvcsMGtsYwIZdyX0Ghtpbt9OkbaLGK3a6anQYpQFWjsZ9Sswk5R/wxmLt3LwDQKVUvqyOqSVIIQgkzUcS4P12U6aaURJ43Z1++yqn5AcqJ5fUndT/cIZ1yu2UMK4TxJYY1kMVFw2iCnUvH74VlgCiunamiZvcedXjDWqapzxVhggpA+q34iOrf9FeHnZYnsttOMgzicg5z4CdROOLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/OwE/ncVMWXetYKaS9isdjMBpRJnH7ZYn3urdeD0O0=;
 b=kbpRcDpomM4hr2yzt2KYN+CV9Bpr8jWLOQn9SL6BuuMNX17+XydF2KgnTxpZ3t38l5hbm3ZLJt2WAa28PBN7JCiU8gT9H6NUj98m+5hp4/JejbRb/Jtl20xb4DBx7V2H/FhWbu7ykr34qR93cp7U0XZCDDpbhSIQzvk7wLgaFTWPaCizBQv0JuzWL8UNE+eLS7ZZ1tlCYykJbD2gS1KQov08nCv3WxyUAdiEenS1tqh3Fvah1xiWDHVDesIbBNeeZ+2zX7mHTMI68SQ5u9Ty5JMS+2L4bxYmlW9oT9rJoRoi1kUf14L6nfxOcgA0M0B/Vje0WdEA4SN+n9FcIoWmjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/OwE/ncVMWXetYKaS9isdjMBpRJnH7ZYn3urdeD0O0=;
 b=LOXp7xa3aloT01eGvT867I49dGco61tOVzbipnwxSXVAXzPu+wFM9/bfhmyaF2cLoM6hjFrUsyiBvhBd6RDb9jrhBJMUWD9pg6rIkN3uLfparZM1I2N1SuI55I9Wt32tEDq1DSrf71Fa4gevu2HqmjKkfroILZDgYWNuevRbLug=
Received: from DS7PR05CA0028.namprd05.prod.outlook.com (2603:10b6:5:3b9::33)
 by PH0PR19MB4791.namprd19.prod.outlook.com (2603:10b6:510:1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 12:59:50 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::6e) by DS7PR05CA0028.outlook.office365.com
 (2603:10b6:5:3b9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 12:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 12:59:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1E38C406554;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F25D782255A;
	Wed,  4 Feb 2026 12:59:47 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/6] ASoC: SDCA: Still process most of the jack detect if control is missing
Date: Wed,  4 Feb 2026 12:59:40 +0000
Message-ID: <20260204125944.1134011-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
References: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|PH0PR19MB4791:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2b5c6547-c17e-4b6d-fbbe-08de63ed47ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MrYNzKP8tT6S/NmX1noZVKc/X3IwJEHFpLZ0qkxXBrEgmHgyz3O76fztFc9/?=
 =?us-ascii?Q?lhtyleWY8GL+zu+gqhhbcTwHoZ1pfDKOzwg5bEkRJBOBVyFswoQJIASlr1kl?=
 =?us-ascii?Q?4MNjYAvmiXSLs1rQoHk/ATi1lWKbj73wAuELFHY/fSpWiXiEmYRsR1oYdeGa?=
 =?us-ascii?Q?lgdVzg0CID6ivO0bbLbSm1+FfAiCY/AdFRbWhfhnFX2mckMuIRPaO9VBEa3c?=
 =?us-ascii?Q?AK4hONuI1EFMntG7pXazzNVf7SvzSnH2U/+lum6+Ijxvm4vVE663wUCftWKm?=
 =?us-ascii?Q?5DmkSrohZgjqHsTaj0HQWeG7ed+XH0mBJJS0wLAG2EJYyT0pkIRhp5Szrex2?=
 =?us-ascii?Q?nRu/+dFKsDtIUQQxRtvm0pWks2g/mu5sTWZjmvjrZybMRkZqHZRtZscjniYl?=
 =?us-ascii?Q?+pGpZQXT5Fu8mh17wqS1z8K30flZuAK57XtrQh+SP9jktox/hd2HwmxZSKUt?=
 =?us-ascii?Q?Nc0glpz9eawWubFe1Ez+IbiDxoZArdKKbhOjqtkqbw3A4gNu/X9UXphef1Q4?=
 =?us-ascii?Q?HwB8ROWblk4Dny6xLbe02sgzC5xfgV1K/Cqx+VwuqBngfEmDqqjRsVRdcVOU?=
 =?us-ascii?Q?RfzTKEk4ivLvQHFleZ6omRKF/OSIZahcbuCV1v9PPFiTDJ9krF4cGaxYHmAB?=
 =?us-ascii?Q?Kel1PuLFiov7qbY+3/6tNZf3blJyrGx9ICCekfQznl2oLp3SapRS4trX9t7U?=
 =?us-ascii?Q?Fsj/B7SifgIekS3bX6PhzfKVKVgMAnagSzh9kcHPGyOZJLUGD77I2c+4DJbH?=
 =?us-ascii?Q?oeD1MCnIp3x6eU9blU8pUoFrmCCDU9EOJX8IDFvEAod0lp8zTz0PvBQsunUp?=
 =?us-ascii?Q?9/E4ZRy8/JJI4q3tTmEPVLKwLptA3TNtgUfHiXXFTfbU4ALEEd0dchMazQeB?=
 =?us-ascii?Q?rEsIngM6aRDce5kelPAG+OwkGn9NNv4UPxptWS3bUVhr5kVamFVpVVa76KeC?=
 =?us-ascii?Q?OhAqQURr9nQCXJrbgFbIHt3EFfpaRGjFHJytzjRf+zdPMLxk3CESanCcqIwN?=
 =?us-ascii?Q?sDLr9mmRzSfj8DOO+4OPteksgh0OG6YuEh8oxOxJBM+ncSzG4cbDXKekp4aX?=
 =?us-ascii?Q?vqby3w18j4H+c5e8RwY203/x5y2sLpnZ1SLfskWkXaPjltCL14V1AyM/HPXf?=
 =?us-ascii?Q?nJo9l98m5I/zgKlS+1pM7yNfCnfONfX4Vxa+ODo2zEBy23pp4yPksSY3HpLs?=
 =?us-ascii?Q?SQi5CTxmUj47Yts0cuJ/B/gjJWQg2C21FGn6Z3PcElskKBPeiyCKweiEhJFp?=
 =?us-ascii?Q?ycJ5CW7xsk72/3YSVFQRNPnQp65wRkIBQDZS9JYPsKwg6dcC4QA/ho19pAGH?=
 =?us-ascii?Q?sdW4hP9PmT2KDE7Icf6qJz0+gyckCzRevNsB63BDppyXIFBdRmeWwzaQcff7?=
 =?us-ascii?Q?l54PkruzEDg9HqIamJ16qoQaePvQAL5R7rQWokT7deEs2zIQ/CJhH36FWJj6?=
 =?us-ascii?Q?maxPN0MC6thY/n9o282/nTeBy1NmkZUZW9hDwU0Vtm+zxDyxdQjVIJedIrdc?=
 =?us-ascii?Q?DaAERjA+E8gjIADsKV+l2ahvVZ4C1/PGmJ4isygkVl0/JNe+KBdW0gqREM30?=
 =?us-ascii?Q?I0OVTN/hYuvreayCsPSWWbxCBSBpMNYpmrSN5gnpArEm3HPGISziUhZhlFb8?=
 =?us-ascii?Q?B82u3rXqSl40NjqbkberFYD8KpQLQCdoHFSK5DV8RJCMb7hFIrAG9cHEMuIL?=
 =?us-ascii?Q?/m8okg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5fEd1Yzz+nhqc2xrtOoc+xbtDY6AwCvw0QwiM3Ay8oaOWsX/W+mlwBclNiwyuPrRTpXLTXiDql0X9ruhqRDoB1o5cYsYr0I9DATvgq7ABWPOeRzt2T/LTaamFP5rSG5RL0v7NhVR926np7mUntZQh8QdpzSp5f+jhcRekI9Dxu2N8zZH2m2MKujAOInKSArf2jeBiLTGE4n6aVaDKlZFzIVE7kvjEvQGMeDfCo9VBBq4Haa2iqgc10Sg2Njp5m1eD+UwTSNhTY375cEr1ODbwcd1cZwqAXm3IoKt8A7jbJlQ82mlfjHtSUoOv5bo/ApG8AbaRD/zsxHvK7XtWKzAAdudlalQkuTACFJRTzcsNjUB7BVWAxvms+pSgf6yi5RPa/uLJKc1ei0yguoGQGQySIGB6jZXKXE3ES/a1ch5ESvePO69bHPwICJ+b/EJUfcQ
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:59:49.2289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5c6547-c17e-4b6d-fbbe-08de63ed47ba
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB4791
X-Proofpoint-GUID: 8wJmQhLpUOFA-vJ8xIDZrRl5wAjHL0Nv
X-Authority-Analysis: v=2.4 cv=Mdthep/f c=1 sm=1 tr=0 ts=698342c9 cx=c_pps
 a=XvwqfKrzn4xeEGDWI/eySw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=nEkwoYgMWw7C0dl9XnkA:9
X-Proofpoint-ORIG-GUID: 8wJmQhLpUOFA-vJ8xIDZrRl5wAjHL0Nv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5OCBTYWx0ZWRfX0inAxc6c+bpO
 LdDXAq6BGqLZUUrAAfMjwb5+xY4YWku3Tu5wVFMLq4OcdrlQTH+ZiYaODhL0X5xGcQRN2DAsvg7
 krA1w5yg5Q5v98uldlk5tv9voNhu5CrcKfH49YNmkbVfxHXsYQQ8yzoGaL08HLT3KEP1YUcsLZU
 FO6EGBMN6hiTNJi6JkAfgsvMSH8mV+Tt6k42KtPgkyqNIcYaxXYQ4rvMZOaphztgIYIOPjjc5K2
 FujpRplVoXOdJPspP6UhS0c7qcWQcpbRbbUOcoWDkwQZ91R4REhix42bQ1OpoQeD5wzYz8+2jDg
 2wz+x9v4h4+0istuygGn/GG4rMKz5tAjplj0lZc7UQuBe2K4+nfCVDHvLMjiNwEOJ3gSIgoyb7m
 uAfKdDKr7Z35GAMTu5Ufrq1GGnSrbU9i92kka7sJgt1nsmgsv7M2TePJIVKfA+42TIx9DmUw5bj
 AtEcQwYUo/1t1zjNBkg==
X-Proofpoint-Spam-Reason: safe

DAPM creates its controls very late in the card creation, so
there is no call into the driver after the controls are created. This
means the jack IRQs can't be guaranteed to be registered after the ALSA
controls are available. If a jack IRQ is received before the controls
are available, currently the driver does not update the Selected Mode as
it is required by the specification to do.

If the ALSA controls are not available update the Selected Mode directly
rather than going through the ALSA control. The ALSA control should pick
up the state once it is created.

Fixes: b9ab3b618241 ("ASoC: SDCA: Add some initial IRQ handlers")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_jack.c | 52 ++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index 5b9cf69cbcd6b..bfa621b744e1a 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -41,10 +41,11 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 	struct jack_state *state = interrupt->priv;
 	struct snd_kcontrol *kctl = state->kctl;
 	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
-	struct soc_enum *soc_enum;
 	unsigned int reg, val;
 	int ret;
 
+	guard(rwsem_write)(rwsem);
+
 	if (!kctl) {
 		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
 							   interrupt->entity->label,
@@ -54,16 +55,12 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 			return -ENOMEM;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
-		if (!kctl) {
+		if (!kctl)
 			dev_dbg(dev, "control not found: %s\n", name);
-			return -ENOENT;
-		}
-
-		state->kctl = kctl;
+		else
+			state->kctl = kctl;
 	}
 
-	soc_enum = (struct soc_enum *)kctl->private_value;
-
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
@@ -73,13 +70,12 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 		return ret;
 	}
 
+	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
+			   SDCA_CTL_GE_SELECTED_MODE, 0);
+
 	switch (val) {
 	case SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS:
 	case SDCA_DETECTED_MODE_JACK_UNKNOWN:
-		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
-				   interrupt->entity->id,
-				   SDCA_CTL_GE_SELECTED_MODE, 0);
-
 		/*
 		 * Selected mode is not normally marked as volatile register
 		 * (RW), but here force a read from the hardware. If the
@@ -100,21 +96,29 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
 
-	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
-	if (!ucontrol)
-		return -ENOMEM;
+	if (kctl) {
+		struct soc_enum *soc_enum = (struct soc_enum *)kctl->private_value;
+
+		ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
+		if (!ucontrol)
+			return -ENOMEM;
 
-	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+		ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
-	down_write(rwsem);
-	ret = kctl->put(kctl, ucontrol);
-	up_write(rwsem);
-	if (ret < 0) {
-		dev_err(dev, "failed to update selected mode: %d\n", ret);
-		return ret;
-	}
+		ret = kctl->put(kctl, ucontrol);
+		if (ret < 0) {
+			dev_err(dev, "failed to update selected mode: %d\n", ret);
+			return ret;
+		}
 
-	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+		snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+	} else {
+		ret = regmap_write(interrupt->function_regmap, reg, val);
+		if (ret) {
+			dev_err(dev, "failed to write selected mode: %d\n", ret);
+			return ret;
+		}
+	}
 
 	return sdca_jack_report(interrupt);
 }
-- 
2.47.3

