Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CF14C8FE4;
	Tue, 12 May 2026 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580870; cv=fail; b=Hb05SGcnJLt8uwBwvkBFq6mz3zluTBYUu/MPfSWjZT8UunhVHGggzXrLKS75/N/I6CdzAnQEzzHWTpxt01kHNeRFOqgbqvxg34Scp0CmuHOAibO9Z/Xy+EIpCN0SoitE/z0XBiFxayZriA+WRd++TUGPb3niYLR63YL2veQ5F3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580870; c=relaxed/simple;
	bh=lPOzQkih92iJtbIjvWBY9kRQw4JIFkLmz688SLDBgVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/ya3LoG4WvEcq+R+dYSU9e2254vJhNVZiku5m97f5/5x6eSunHbZa8MYEHynjz8p3p2fK4usAS+hMFXYda2vpoR7Ukn0OhANejtkJ72ZOfwRSwWSODqSNE+ND01vwMXsUAcjJgY8qJosNby8xriSDzamsNoMRTVNlOreVdrQz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BS84ilJZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DtFKAjf7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BS84ilJZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DtFKAjf7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4h1QJ1491325;
	Tue, 12 May 2026 05:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=y8H0Y8pNrj5K923wL3cXg5B2aXQer6v4vl73xpUBYIA=; b=
	BS84ilJZiN08L4Slm0pns3lQ9zEZ/RgvdFWH/MP9q7dJocuQlyNfCPEVs9KeOUkX
	NZcjflU8WCkl5PoGRKk+pmVS223/Vk3O6YjECBkgnQ7UJvEa07f5moi6YSGdBJVP
	FtkbyE1hbfF6GLIheK/97KbIiuDCZjzofgFKnS+sF3WfSA1UQ81eYtQSBfV4k1zM
	zAxb9CvozX9meIKA5tNY6OmlkNb0HiX0RNSK/x85wgB9aBiKdX0aGNjCxtbj6L2y
	Tuajs/ZlazJ4HhpYd1TmuNITyyuWsjEHkw1993JqWz+u8SFFVCuOmY22TWesRvCH
	aHBY9BECbe4yzhZ2DGDYnw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022079.outbound.protection.outlook.com [40.93.195.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q8k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWeZfFFzMG0vLf/NropGQ1ikuNE0k6wxgT+pWDuF23yKzLqqA/PpMRQJZpFqcrdHp0lyaCvu1IWDPXKXmO1CwQkxovYg7VVZQDcGme/3hLF8AFT4k6dTF5wE7QNF1YhLgcVnbDKX/YdX8bw+SGTg+vUaIkIvqi5thxidl/+u3iprZZIw0/3OVXW777w8i+OCCOZFY1sjxfHcHz2WJmi3wvxT2cZsvEdgKF9Tys52z3WMv0fAO7XwDh8ox/vD7w0L3E4eSuBcGi/Wq4InFkJTaNNtPDcyr63IyZsOzrrHlc+Bw2goO6tV+tRmUZzl7CKbRSqF2CmXFskwBuC3io7Gvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8H0Y8pNrj5K923wL3cXg5B2aXQer6v4vl73xpUBYIA=;
 b=GHArF9STaArZ7F2YahVTPaLNzgrJZAJ/rxbMCfJjsDxUG2aUuC2I4xVXiH8DOr6gpNOsyx+j++WCwBo9MwX8+2G2BiNw/y0MXLoSkoe2wa8VfSTVxxYmfvwczBGBPShh9vGasW7zTwkJq9nvflDu9OHV0PkhVNFdI0cEqSOHqeAB6LncMbRKxHxuMfVghP5uAs3nRRSSCkPxrNXdu4Xu3wc22OA3GiLMxTYrljDesd6rp73hhMo6u8o+0/5GzqH0vySoA9Nc5VHrz2BEDXOI+I7RrG8pta1d4lUlhoKwk7gASCsNaJ93GC+9vOTkw0UADscWBQYJ/ADjerj+FpExmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8H0Y8pNrj5K923wL3cXg5B2aXQer6v4vl73xpUBYIA=;
 b=DtFKAjf7rsPvPWfZcqtvvlsah/n4G4NKDFmsHpW8mus51I6P7x2ZTahl/BjizXY8qkggGNj/QUKl9uy6AapucngKlM/K0JEthcyoStxTjLX54QEmGgDM4anvsW3nFy2C0YDpk/tzSRpNbmNJWtDYWCUOA3xFtQNaB7j6BZYdJ4o=
Received: from SA9PR10CA0020.namprd10.prod.outlook.com (2603:10b6:806:a7::25)
 by BY1PR19MB7821.namprd19.prod.outlook.com (2603:10b6:a03:522::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:13:56 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::42) by SA9PR10CA0020.outlook.office365.com
 (2603:10b6:806:a7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DFCD7406563;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CAC38822554;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 13/18] ASoC: rt1308: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:43 +0100
Message-ID: <20260512101348.1138044-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|BY1PR19MB7821:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6200fc75-e61a-4cd3-8c24-08deb00f2d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|22082099003|18002099003|16102099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8/SNAfxcKUxOoQ5koASMwGBZlY0i1V5JqhhyOamWOOMMP0JZxb2LTx6VZz83IrEOO/6skHY7CLqaYOc+i2bG5NLqWirCM1nNIuc50XD74AGk02eaiLGuciIhpFv09oM/AXeUITtgfz/8pOPIwJRdK6JliX0JGP5yUHZGJSxI2yGMF1JeCv8QxFz9DYZEBNB6DglZTbxDzQOYYi9EP9giPhzDgmqqU5K+Z2bLng2upaIazagzUYq4/nM8PC/xqnE0OLxYFtOhXrATu1/VU3A45NQLiXVRg7BZUz0XRjJkTO3gs1v+Wk/l3vDjrbjMp6sRr0RziXMAnBeJaGJj7irsFGDWTzGTuXRY6txOUR+ka1qXW1S8swiE87wz0GY9KaJgqQ427if1bBfcOv84+p9PA8N32jFEjrNgv3JOgl/oX4X6V4udbokE1i0tvkkmF9jHizYLUVHKI/0tTfZznxlQwDIcP5FP/x3qQJXGWPGLsC1i3UNJfQWuGAtBBOgYsjQijbdeMMK+f8NHOQvYMyduEgn5yDaiajfTcY9mx9kPnJbvK63LgUXLOFiHdN9+6lKkIWnEXg+6wFkb0u0/Y4dwF71GBuHqGY9ocupYwbKmTkx9CoJ0HHYljC6vgTJ10Ny4vT2lVvc43VWyE2ptksYoGTu67JKCnS2WLPfJWP+W7iG+0MTULbXdt8NN43gf/GRdiKzHuLEyCpV/rw/sqsKA7f5CwDgoKse8YSF01ZztnX4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(22082099003)(18002099003)(16102099003)(3023799003)(11063799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n6ipmxEMeGZS4dWuPeUD8V5PgDvQsKsl9to+c67IKhO0hPeAyjlwleVtJOP5IRUrSFFs3xCViINN+EeR+kXt45ApiuIjAYy3s5Xa3H5PQIDQM9qfXs05ZSzyzhF3yGscPRBHw+UlM+Ju6nmRd6NaHFyw4SBqOPXBN0hq7smYGE7Nv0LB1RziDt8Y8Kwwgiife2FxIZWT1RyWTa9qULFdlmIrdhx2+ajRxUJnwhP96FZsQaVdyqC5PHvLqbaWmFx8MueyOnDJuveWa6TJgXve0y0tQ3rL9FMjG5SnypNfMfEwDoL0wX1Gn/UjwY57rU/KQWE/xk4TwPnuhcbwN3oSAoaehpnwMLdUZLqZdoeLH43vVfmBR2wmHG7mVcQKdSksfJp0USr7nN2trTbacitbWM/H6LdPrmXYZ6JI8iGRWiWTLofQWFhB2N2qE5046MkA
X-Exchange-RoutingPolicyChecked:
	L+Y8eF66YkBVwZOiWrqzzPR0MMaqm2SvL1gefsRO3w+cy3aDrrSs6cgxap/pN/pN+W+29oOdJDqUu80qv18PD6u7iWR1iFDxNOdJogmmvZwihTPNaI6ojriNoFQFPaU/Nka/6/BmvvMKi9zzRSrBoGKIdnilNi1TNbtV6D715ApnAGKI1P0FJh26m4Zl8ScJwxyGIaPoHfkSQLo4iy6XNouXp+PIRgitUb5sViGRqR6yyFPYS6BZl5K4jWsQuEliJFzFEIG2LwDA8SgKNmXgMKmvICEHagKEcgkwSD23mRJE3ZKsq5/Ldc2eT87/YA4iT5BNXrZlj7FPReojEFME8w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:55.6531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6200fc75-e61a-4cd3-8c24-08deb00f2d01
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB7821
X-Proofpoint-GUID: ZDx0dRdRWzMjU6O-tF-eZi4TqU6HU8gW
X-Proofpoint-ORIG-GUID: ZDx0dRdRWzMjU6O-tF-eZi4TqU6HU8gW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX4xhpZX7kn+no
 vve4iP2IKL7riJtJQPJ223oT0+FkzR+r+4yddu+pLgilG3+dR3aCZ+dUtC6QFcxaf+PsxRBOayM
 8OCFOuzFHYLN096rOC9UomQ8B2Wjg5IS1Qp55hfsDa1X8meD0RAqzgQ/ERT6M1vya9WMG6coaBu
 DrHCsk03L1v5gjtfrWW+RmT/DW3jsRlVcXrH17iU+I8VlC7vP6hBREBV5rQaFKP9vgj4UXXIbJ4
 T+hu/nWjKVWzq3U5qsXKZ6HsoeCpqvX9IvmTnviRxatGQHHIYMmhwSdtMXB+a3yS608EoQ6SbWU
 TFsjWsTPO16hCUC+4nK1RjH0ks49Y/KZKqe0w2XDDhiLmjwAF+BkGGrC2liIseHIWQQzsK+Xw07
 711p9DEocfAj5DXysS7WU4T5PKRvf1/L6QW3tGG4kPjsjdHuPTONHkQQ5P6qgIYju+34nEJccBh
 BRbqBHQiLSOiyg7IdAg==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd6a cx=c_pps
 a=ON2AtRasCbt5Ww1V1qMYlA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/rt1308-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index e077d096bc239..39e06a3a75609 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -768,25 +768,15 @@ static int rt1308_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1308->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1308_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1308_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1308->regmap, false);
 	regcache_sync_region(rt1308->regmap, 0xc000, 0xcfff);
 
-- 
2.47.3

