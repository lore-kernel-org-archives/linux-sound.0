Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59191A680B;
	Sat, 20 Jun 2026 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953390; cv=fail; b=MzWauhliWlXaKb8C+YBx22gnNFNjJYNUE/OsFUQcKh+ToAz+lCCKyopQCx4LWJ6+li0wU8HXgF2eKcsNUpIpcmgtfyscf+ptz8VPxWdurEaTlMTEXGhMIl6eWEg18Jg4XMKc4tXmn/gREofWxuE8yhYrrl67/j5SAbxztQtioWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953390; c=relaxed/simple;
	bh=miapxIeKyNdsod3fqHpyA2TB9e6avrkjZ7xJCdyBlZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPufNTblqhOLktFS8eWIiatzV/8BWvktbcO1chAjgWtEPrC0ZiONno7Sbtw+u/9LFmgnBRTVBKErZVYyXhZGehZuFXnLrSRDrMrnUd5HZ+w1V8DUZgrZBb9iXBpEXXHuVz7DL+ibnGmCQ+Tt918+/7ppIrhPNd8WEmftPQ8N/8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Is6ZpsdW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=S8CPHNwE; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Is6ZpsdW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="S8CPHNwE"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KAx9hl2878933;
	Sat, 20 Jun 2026 06:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=3oi/9PRzeKTl7v6enJMsCJCsA3R81w3T4vW7CEySpD8=; b=
	Is6ZpsdWrOb8eoiJe2i50OYuqBSXLLNLRqk5lzXI5WpuyDp3CpqXl4aBwrWCuUDH
	VX0MlvVWhds5i84NJuhnEJ9SYhm+Q+0zgssIQrFHsyEh63YRK2Y0xc9vTzjXTDKt
	T4qZBXBl0hYlvQ52UtaJbZExh7U7e6fcvdIDi5MNRX4HOdqFa3vpaaXH9GBqG9hX
	ujcW6/0deOBAGVrgAq9fQgBy3Ub2NA+wRl2xpfzpOba9zaEFMmtDsPerappoDh17
	ANlsMGW9WwatM8iOxKVDUjmUQOavtApUSJlNhUuR+pF6IZ7e95MXilkXZgHc+YjH
	DTIIyQUjL5XB2/q7dofoOg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020115.outbound.protection.outlook.com [52.101.56.115])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jg3v8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 06:02:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wymy4kT49sCpplUnKQ7GhcpNNLiER4sUqrzsxwwA8qJUrlrhHQ9Bm9CF/i1i6Lc1MGnFuehL62mXled1dMnxt3B6Ke4Wmb1SNdQgoX7yybs6ZWm6uRcpbPtWabmV90jta2XTY5ncbAFG9o3mDCiSRHxapfeMxOH6vxfVE3WPTSE06OarZdNexT52dULLe2XSu5xfhCzbvA8MRy/eRp9FyPOBHmBkYhH+FX5GyBH02IH+wfnWPJfapxnfJK8leRUZndoNRlFzAbWGpNUci/2lm973b5UOCJpqVeY07bkP6QCyPch+5zZmS8ay973EcxJbMl6gZ6o899fDyeUW86P00A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oi/9PRzeKTl7v6enJMsCJCsA3R81w3T4vW7CEySpD8=;
 b=gaRL533PXhgacio2OnB8fR+W20/DzEA+OqKOCn6u0URKgN+IUpu+zVTORrO0Vxl1oUj+K23SGqYkfkyEMJrh4hhc0okIbqL+w4+ZCecR2joiaxQue5N/xHdiNYyLvnFCfDEboEEH/cYrJKTBOIiDAyu6CWqlWQWUasE3HYgqCRIXTIAL7R5tu1KI76seHkQsG8JarJj7lcjQPlyDxBBoixnM+vchuj3bNVugpTUB/X+0KTmDVR3k812ss8g55xwnpfwC7Fo7NXAtdyW4cnXnyKR5uandnbVkFlcsbCL62tN5zz92+VzKZ5oi8eSeOOxLq1p1AMGN6caOuQk3X6A3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oi/9PRzeKTl7v6enJMsCJCsA3R81w3T4vW7CEySpD8=;
 b=S8CPHNwEBvEMF2w1f3FmG814exl8DCuY6UMnShTjVmrvRSR8A+cFGdRKBPprwEZOTwhIZcBzm7IIzSn4PVkhikIiF//CYJy9Pzm2PSTkOeGgFeUlOK8sO2/pquWVI+UBQi9f6cXKBQ34cPZjecgNnKvuzpQxoJchvap7YCbPQWI=
Received: from BLAPR03CA0030.namprd03.prod.outlook.com (2603:10b6:208:32b::35)
 by DS7PR19MB8853.namprd19.prod.outlook.com (2603:10b6:8:252::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Sat, 20 Jun
 2026 11:02:43 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:32b:cafe::96) by BLAPR03CA0030.outlook.office365.com
 (2603:10b6:208:32b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Sat,
 20 Jun 2026 11:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Sat, 20 Jun 2026 11:02:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 613A3406550;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4CB16822544;
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
Subject: [PATCH 3/5] ASoC: max98373: Add back local call to sdw_show_ping_status()
Date: Sat, 20 Jun 2026 12:02:35 +0100
Message-ID: <20260620110237.2684234-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|DS7PR19MB8853:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0585e0d5-c39c-4e89-9ffc-08decebb73c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|61400799027|376014|7416014|11063799006|56012099006|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3WhkhDTo3ykh/sF/PEJI06pEz0FngVaeWvBgo4rzGnvtsDpIQ+i00ORh1W68ckUQ8pk+b56h8rA644RYuh+Sj7TUP94siEN0zhiQJG4deWvl8W2Nx5ZXTcIf6x3yQJ3E0c0GKzhca2HZOyPbffEU08+NX0VnpBN1FJjZ8ogq06gRDd2eY/vvNuCGlAAel/n6X1b/vfavqDgOrA+2ZQA+VbyE+8kxhtItmb6TizaTiZuQI/jAgnl5MYsZlSmi42s6ME8uwR1GC/fZYZklKV780vBLwLyj3yFfrkT2Aidh21GG0SRpDUD5iVaiZuzxQcTCjslh48Ou0Cg9fkVd43859YT9C+GfOcH/73NloSZo6bEqqDI2E2XiA3x2yCgxW9IDdXHHJtHrnPZgG0RGeAt/TmnYOFsvbPgdzjLDVhSZZm8haorBeywr4+9SDjXjarjeqT3I9ooWdQ+RsPrZNA7r4zolBWeDiGqWOA+7amYLyDPI7tfanLvenOKgf+A6kyaYVNShuVyVbn862ZHIlsz2eruzDyLtqvV+yelEtJcibA9DqqtMRIpXCWQ6FSY/IkcMRiFoVzmiudX5UW4GnqZFbFQ132FglV6tk7JXEP67FJrfaENlLlebmgDsx44oBkvc/hia1o+B75vaPMWa0cLVV3TLuFYcoNS0C4U5BTWXj0aQamoY9Dpz4usBPQt5booRNpOxp4M2IeAL479y5RPd6A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(61400799027)(376014)(7416014)(11063799006)(56012099006)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+fgJQ3Wugcxz2Ucp/t6xsnkyVQlhKPa511qcheobiff6dzsKVvu0Ty022p3b/yKdPk+QXdBnx1/PZCPzd3XNef1lASWTIb1DUU47VcQ0qg6ywJ3lDV2UxgFsCaPlISy+QbdMXFlJgq+/o+wof0kVgDjgk9drO3LRkShf8rW8PMWNg7oD/QmXWqOE0b8Yokap9/XSUsCo5/enz3WhtwCS7ML1cgals1B0t1RSzhHrktTrrppRLBoXqUtv1j7HCbxOD3OD2pVABColFeRgs6iCtTzHJRlyrrBDY0pE5QMJ3l3DbZvEMZ891dwljkI4qMSrMXFEFZLvX+kpql9SU7Wzr4+w5YhGB7ebkdcWp70CN0yHehNKBEGQkfAo1MdKKWS5jRvOihiYleAJWjr5qdyOp9XusUYEtjLfQbJ4QZjv6uWKt6TGl5aiT3yhM3ZDCLzI
X-Exchange-RoutingPolicyChecked:
	lY3hCSr2bDYPpNH6y00SWheaf+FVz9eZaIZrTCayHeG+zAvNdLE0BmE97jw7BpvCQIJZS+XU0hkHNgduoBnjxA2EbU62B71IxNDhpWwiuMBWimWzShAeUizRzGwMyHA8DFAKNWMsVND3qEHrh49LkfYQd3v0goenRk7DruKlKorz5V5YoawzKbdKB3VAKJj90JbzFxHTjPT56GysdQ1wPg+hFYLGq4kCV0Xp1XdPPiMhP4S1Qo2BGN+NEFC1QLkjyfWJhZ0MT0CMQD76/Df+V6dBrN1HTiZ/6yHxwyJyN7JogGdCfsAP1pev1tSAoWZypLKcUIZ3znJ5eU2OcNAfUA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 11:02:42.7339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0585e0d5-c39c-4e89-9ffc-08decebb73c0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8853
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfX6GLnW+3u0Jy7
 rD18aX/N5JY1Wdjc9flb5yWfKxthBHu10S7eGEdWsTzzu5+m+xg2GWJMePG7ZOOYEdiFzxK+tHF
 WwnWeKABtTKuTgh5rmbllg8JbtiH3yUS/hvBgJ73KXWfBRa/Oc368aALHPg5ZKfyBi2DWLtxj5v
 FnYA6H19+E2YlWrpUJOZsS1mkV+Lxb+i3lzRixC7TxKtpsOHVj2Uds/DJLZr+j+yvLBseeypIK8
 S2ISJ1SalgpkPc1MsPwkxNTk8V3KkJ5Arw0D/r12I8nzP1bxez4/kwiyTy6q3EDp1KAUtf06xfD
 3dNkas2HJ1obsso0EdghV7I0zXOe0fAH1bxPNqlf0Pbaot0JqROdIhczXGM22600Vn3IyaNO3NU
 m+uj0WKIaGBoF6vOIdy5HzJXANZdPPQoOwseuqbmHVBsRdWAsyoaLga5bPB0P4U4GMreCnAEEdB
 LOgw5vp9JZGIEyfFJTA==
X-Proofpoint-ORIG-GUID: 8MaeMIeRgcRCgWKH5_AZnOyQczjbwso8
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a367357 cx=c_pps
 a=Oahh2kgEN5ymB8sO0SiNEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=ewec-Weh1CeDKDJnTlIA:9
X-Proofpoint-GUID: 8MaeMIeRgcRCgWKH5_AZnOyQczjbwso8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfXxj3V7r7E8wdp
 wyHwEvkH0DAn3rnX3KZwDkHZringITspzcI0Y0B2ClwDkTj1d0pm4P327HHp42EYZiI72nBFgDk
 b3keDOlLwYHqJ7W2V0OedR7FRiJwdwQ=
X-Proofpoint-Spam-Reason: safe

As the core no longer calls this debug helper add it back to the drivers
that originally called it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/max98373-sdw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 6829fa07c9ecb..7a42052dc0516 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -272,8 +272,10 @@ static int max98373_resume(struct device *dev)
 		return 0;
 
 	ret = sdw_slave_wait_for_init(slave, MAX98373_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(max98373->regmap, false);
 	regcache_sync(max98373->regmap);
-- 
2.47.3

