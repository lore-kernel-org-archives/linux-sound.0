Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247D931813A;
	Sat, 20 Jun 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953391; cv=fail; b=JEbnQSsn8qVS7WmORNMJQAVmQgJRcpxqA6FMlZkJd7ItNbKFfWkN/8ILTb0gjyeLMtNddoZWas0G2KpK5e8n+peRsoT6ta7j3yToelDET6XUyqGVKx8xEFiYYZZUroMobBaBFXqbJWPUF4zoN9De4N81SQXbF8GGfFWcU+3WC9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953391; c=relaxed/simple;
	bh=oao3Uu8mK54csk1vfuxzHeHu/XjTQ8Qz9XIMiu2luiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MyTBvVXymovfm3kgOrHGpie/c/TP05ZojBviA49wIQft4Je3blwGZ6sN2qttjz6nBztV36khcjEICOHzC6dGV8aB2bSxceQx3iLtDVFe636RINiuN3o5UaZbHSJ5L8CVamgGP2moWb1AJqi4bZr6/3S5KtScHW8H8RgRgE0RXu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Tx0S6bo2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CuPRhbSe; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Tx0S6bo2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CuPRhbSe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KAumbZ2874154;
	Sat, 20 Jun 2026 06:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+07cGTOJaHc08CHX4A1nwEbEMcqxQLXUxbpZpuCU9XM=; b=
	Tx0S6bo2e0b3fR1NWszAm3vjJIbr+VLPtEgriJiRlc6XU//rsPpkhwXWdyO5JGQP
	wJ4w+CECqXRjIxI4yrDQKwUObLBRQ+tb/fmCrvNS+8Fx9cMTEJqCki6Z7M9eJqsu
	NO5MA92JzU9EVMmDvvxK3e6NFWXFF+R/mMXc6/IfX7kCHPtlMn5X5ZLgoGBRFuaL
	h+7cT1tAuW+reJPooSZR3acWdmNzrFj1PG/X2zAXfiGgv7KNE9Mz1p+TziUsFYvr
	OImoL6CgJXd5YoFF7+9rEt96TZYf8txpy6uLcDZQdy/3adWixiWhcu7S8FIEq1Go
	V7tnOcyVB5M2vswFu4hdVA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020119.outbound.protection.outlook.com [52.101.46.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jg3vb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 06:02:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvwBA2pchlchI9/bZw2MAH3DAAwhFiTwEm9Hf1U32Cka9GQUej+3C2EXnwKHxIb6MywbA0XBuzSiZTWRWtL9VLdEmKeiizRqb0eV7WrlT5FgqFZ7Q925FyLeXsl+IE0GYzHmo7SSsO7ADZPBOmn2s1mh7zcH/AX7HMzGxr/PRylZ7CohfjlwC/9I7RZEqzdk/j+LvERIHiZ+6W28YnnfaZKUSjJnI8mTSR1utj8lk9TS7PLaGDs24dWyVzmGFVcoMMLsyuuxdyLOkCNVxxiFMTylMQMvd1zIj5Eh09Y2IrUeq7Z//BxpHoHPnb8dwvwimj3gJ92eMIU91J1EvyJ03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+07cGTOJaHc08CHX4A1nwEbEMcqxQLXUxbpZpuCU9XM=;
 b=VrWY4qgnL38bjTF3rvRRkPSwQsuwGamvi3oS7MacTYrnumYpmNntQ9Zpnn9Uaej35jIcvmfId/XjhAGAkW3WWn+rFJwsJD26ddn2IHHzS9s3Dp+q0AaoCjn82awyD6Sof4kVapkAtfBdhWWuyoxOVI9Kvgd5tB+u0iGYDtEfZqFE4BZEb19un/o+WybcQ4DZPJeq6m73NkD8aTnD08dPL1nKDPj9f3hqCQccksDLD0Kj/CVeLwxdAY9lufw3jxFGlDxvTayYKl8dWs3hB6LWLF6kYO1GFDW5Epz3/5RAON1ozY47myJKVYNFLFlgj4KY+kCD51BF9Qgt8iyyRUA0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+07cGTOJaHc08CHX4A1nwEbEMcqxQLXUxbpZpuCU9XM=;
 b=CuPRhbSeK9p+7Z+tZTCgLfhio2uoYJ2q9J+oIHzdVD02TlUw4He/s/EJNdInT6c7bi/RsTn2e1wpYRMlCVVg+bgHf+gyYK3FOIT6nwVXAUH1s2euJp90WaGUu5u6bjj/dfXJElPhhkmxwh8rTHujTRw3Z0zlrK/ScofpmwvRKNE=
Received: from BN9PR03CA0372.namprd03.prod.outlook.com (2603:10b6:408:f7::17)
 by LV0PR19MB9211.namprd19.prod.outlook.com (2603:10b6:408:323::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Sat, 20 Jun
 2026 11:02:45 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::41) by BN9PR03CA0372.outlook.office365.com
 (2603:10b6:408:f7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Sat,
 20 Jun 2026 11:02:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.0
 via Frontend Transport; Sat, 20 Jun 2026 11:02:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 69C5D406553;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 60A3182026C;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, arnd@arndb.de
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, zhangyi@everest-semi.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 5/5] ASoC: realtek: Add back local call to sdw_show_ping_status()
Date: Sat, 20 Jun 2026 12:02:37 +0100
Message-ID: <20260620110237.2684234-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
References: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|LV0PR19MB9211:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cfe3a750-59bd-424f-f56b-08decebb74ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|36860700016|376014|61400799027|82310400026|56012099006|11063799006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cP6RfafAWY3EKRY3pbzNOL28w+jAYdPwN5F5Es5Krno1mOF/scmr6EmOE8dCrifousOFG48MOw+0pIkXQlENG+Nu/Ngb1KlYwks0m1LfmOD1oXxbPoMeyZ1687/Xa2LfHNuGWPWDCrLoita3kTHHJIMG81U/mLYKtn9umueWCqhv9oIaCPvKFs0qG+FoctcNg+RVjx+7T21y2sTawHCvsdEupD7gHv7CKlF7V+aYh9CqRmVPoDL8+HOidYwdoWfYtMi6hOTp0cZxlIF2J/HDKe21iw3pU5SBU0Lahlq46HElBIBeUSk2/vGwEW1NJy3SZAF3602mambUArUBotMhIrKUPDC/vgGmoazRz616A0v+z5ZRCbUXMrEopK+28oCAAWtjsD0dJbjvXjywJpPpiMyjgTiwQUEohVD7l00EUCTW0dNVUNri/PgMl2VTAETkVZBE0jXmepWCys8AjDupJAX3nZI+OBbJdQGssHt9aWJg1hNgFc8q00HisV9dzn/R6qYE7QTqbIkg2SlyEZOA+/dumpZpe0HN2eJVJxYQ9ieiRhG2VAMGV4LA6EwwJ7TwE/k/g6zYoLen5tuvN+BUJeYJ5Osgt6Ja/LlPyllLK/arT3i3v6nV/qdxUR4YGf3S5KXR2WiSsvn2uNuofnPw2Zih7oKu3n8b9iCA7F4dInVV7loEjFFfj8FXzN+QEHQ80seCsOTAiQKK9r2lOPtNkg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(36860700016)(376014)(61400799027)(82310400026)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uj3O4dsJMPb7CZ6wOSZXGAnE3GVG6XHxC09jy66ffZ/GjSfI1EBnxHHu5BvLIkR2poqtcEL+f6yRpCTO5VG4Gn+UCfWFNOk1cX3S0U6uqXgCf7uwiFlycjZQ+X4b3rYmVxh21r93p/oeK92Gl8dIap6dMe/KEbiYs+75DpSE5pHkxBJn2iVTsqHVUQP9kWMZyx5SNKZJJzAMydC5gQZEd3DBibrN+3S+kGhRxFgp8t/47LQpGEd0lxhzf1p7uFmJefyN3MtH3LMWJ/oU5VKJI3+ABWSsGmr/RWu1nVUMcnKJZxawecgbq4GdfzeIB7B0QRViwPKMDdD2+EHzwFNiNN1PCZasuoYKapAVFfuv1keg0yrsJzqOPFWQxnPFutOi85Acpa9xDgcSZlU0VcxMyfdW4ScZ3L9whXdZOg+txPE1MWBVAE4wpG2XfiLdXOeG
X-Exchange-RoutingPolicyChecked:
	B18p0QsPgGjBD0m0pGFWyA4BDveF6AMJtYEIRzqWIf8EwhR7ypYBOAtw8tZxl1Jcpw7lvmvNjWcLRkUWq3c7ylU6cQCJviDnmQ6Z0RVX9iH1ihI+imt3BlMXrbtQ6kPIDDI+lUEdqHdPLIqKJeFupNai1USHsmdd0htEIyUsSNe+kAZOvmNVeLyYcKzTrCit48xU9cM/Ci18stZYviU2dqAelQSYVdPEVKsE5RdqA7Yobik/PS322n/uqungbbiw6GP6L8Kt9BLpXMRYUyfoBuw9bqDVNRKm6iK2Cb6Y4zR7+98Dj2N23jl7f1Uc0ZrOiAtGFzLuypfNw6fnEVJhJw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 11:02:44.6823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe3a750-59bd-424f-f56b-08decebb74ea
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9211
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfXzO9D4P1UJvVD
 aoePuKgq1mwTXtH5GCobwQLHTOjg3AVY7iPKskPPD28iVTbMS6LPTIFuFUY1CFUDM6c6Ey1QtU3
 0GRLJWEffTbOOhhVo2DWgiJVgtISFYaFx5JgAv26hSb+SP5LOvNqoikNoa9Z8FPejAKhs7oEp5q
 fsOMMB6ikmjgYHlNfI8/ZXpDRSZd1SOAZB4quE6nJNhlU7LQngNMHyJ9QM886Ql1CPkxBy9yq4p
 HugMMe2l0K+RaHeTwMp4wLxeGlzTePnO/4u1cckt+JMs9V3udWy5818UvWNFgiA7JWUUUSrwpod
 BsDPzszxBVUUmO4irBQUJCQsiOX/NbbsGiHRgcCW8njUMbdh5dP3hvZrUNxTx+s9qbTFvqc7J8+
 N1M+oHLVli6lXTYkBbB067giUhswihmOC6S66wMGxz8tlaBji3yk1ppnLXZi8GQWX+j+dnm1Qmy
 OcOjz4k990Btg2dPX6Q==
X-Proofpoint-ORIG-GUID: 9nsSzsZDB6bMETn_hbpBC_2JFu4Gltcw
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a367359 cx=c_pps
 a=dV5UnTNaioTBtvBhj0ZdMg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=Iwp_KT6YH2838DKibAoA:9
X-Proofpoint-GUID: 9nsSzsZDB6bMETn_hbpBC_2JFu4Gltcw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfX2gfVJqU7VOzA
 4ZfrH3NU6Yy1nEdNl/7obTWG7DZ1rMAZVscfQr3EcTnTFMhZe/kfG5sTxgxHzq2idlpDHzHY4hw
 XERezlxaM3UfBuWDFzf7ikL7Jmzi+dI=
X-Proofpoint-Spam-Reason: safe

As the core no longer calls this debug helper add it back to the drivers
that originally called it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1017-sdca-sdw.c | 4 +++-
 sound/soc/codecs/rt1308-sdw.c      | 4 +++-
 sound/soc/codecs/rt1316-sdw.c      | 4 +++-
 sound/soc/codecs/rt5682-sdw.c      | 4 +++-
 sound/soc/codecs/rt700-sdw.c       | 4 +++-
 sound/soc/codecs/rt711-sdca-sdw.c  | 4 +++-
 sound/soc/codecs/rt712-sdca-dmic.c | 4 +++-
 sound/soc/codecs/rt712-sdca-sdw.c  | 4 +++-
 sound/soc/codecs/rt715-sdca-sdw.c  | 4 +++-
 sound/soc/codecs/rt715-sdw.c       | 4 +++-
 sound/soc/codecs/rt721-sdca-sdw.c  | 4 +++-
 sound/soc/codecs/rt722-sdca-sdw.c  | 4 +++-
 12 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index d62e8a2536767..91d3d43cd9988 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -779,8 +779,10 @@ static int rt1017_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, RT1017_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt1017->regmap, false);
 	regcache_sync(rt1017->regmap);
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 39e06a3a75609..60e5040b6dd9d 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -774,8 +774,10 @@ static int rt1308_dev_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, RT1308_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt1308->regmap, false);
 	regcache_sync_region(rt1308->regmap, 0xc000, 0xcfff);
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 1828fd9d5af6a..5e8eda6a5f7f8 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -751,8 +751,10 @@ static int rt1316_dev_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, RT1316_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt1316->regmap, false);
 	regcache_sync(rt1316->regmap);
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index ec2a35a0cacde..dec8c2147d684 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -769,8 +769,10 @@ static int rt5682_dev_resume(struct device *dev)
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt5682->sdw_regmap, false);
 	regcache_cache_only(rt5682->regmap, false);
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 30fcca210f051..6bc636c86f427 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -528,8 +528,10 @@ static int rt700_dev_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, RT700_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt700->regmap, false);
 	regcache_sync_region(rt700->regmap, 0x3000, 0x8fff);
diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index a8164fc3979ab..461315844ba99 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -454,8 +454,10 @@ static int rt711_sdca_dev_resume(struct device *dev)
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt711->regmap, false);
 	regcache_sync(rt711->regmap);
diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 4c5c2f5ba5edf..8b7d50a80ff98 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -911,8 +911,10 @@ static int rt712_sdca_dmic_dev_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt712->regmap, false);
 	regcache_sync(rt712->regmap);
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 5817321804736..2787524c796e8 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -467,8 +467,10 @@ static int rt712_sdca_dev_resume(struct device *dev)
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt712->regmap, false);
 	regcache_sync(rt712->regmap);
diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 4b9815b5628db..fabd21bbbe5b9 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -230,8 +230,10 @@ static int rt715_dev_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, RT715_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt715->regmap, false);
 	regcache_sync_region(rt715->regmap,
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 7f83a8f1a06e9..a4a3945522e81 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -507,8 +507,10 @@ static int rt715_dev_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, RT715_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt715->regmap, false);
 	regcache_sync_region(rt715->regmap, 0x3000, 0x8fff);
diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 58606209316a4..02df04a0ddad4 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -505,8 +505,10 @@ static int rt721_sdca_dev_resume(struct device *dev)
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt721->regmap, false);
 	regcache_sync(rt721->regmap);
diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0f76492ff915c..284900933ebf4 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -552,8 +552,10 @@ static int rt722_sdca_dev_resume(struct device *dev)
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(rt722->regmap, false);
 	regcache_sync(rt722->regmap);
-- 
2.47.3

