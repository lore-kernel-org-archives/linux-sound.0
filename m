Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9194C8FEB;
	Tue, 12 May 2026 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580871; cv=fail; b=fCPJLRQ5Lj5ZjAiU3p6S1G4MKpMCjTxHCFjFfOSg8a4IsAD0I+o0pP5/IQKGSjl3KHBGLFo3Adtyas4/dPPB5ptUpxRDu8oRKMW+M1uMlCCpFQpBHsnm/U9mFSkHCcyuVQbC6HKrv5fXLeLVKl8ZovPXQE8ss1VBE4LQUJO1OHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580871; c=relaxed/simple;
	bh=rRkIlSP6rcDoJVn1B9fFkE3JbChvQcUiCspL7SQCrdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/n1028/iCYli4ncprkFerfR778s61Vg6r6TwWJ4dZZSQW9t319a8bT0hpLayQKATHGBpsGoxWM1mtM0DPDBPbCr5ltQOs1/hGMt6oYVFFZgN7CfWOirCKZgs/45Zvfx2Yk9nATb5ZxJ5KNL/pp+gfAEXUYl7J8GR/5Hbsauj2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GzWylR70; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GbbTRNZi; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GzWylR70";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GbbTRNZi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C59jm3818502;
	Tue, 12 May 2026 05:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=U5VTkIbG1WhiHHl6DMoxb9Q0lemF6YyY7PkqVLQ2rao=; b=
	GzWylR70UJqi4nMReZRGJXnkW5Z/BuFoTEJ0azdDelng06l5tRsqHFOi62cbJk2R
	ivZ3GbnoDcYkNQE9JT04hmPpZ1rTtHcKh60dAbx5WmP+RqNlzh1aK/OQ7eR7OCbc
	zhoN0R1P3avbjAf3+DKEiRuXb/GFI6K9uVH3cIwrbr5zK5xX8SWR5fomUVkaEx1Z
	EgcBWyrS50rXFUnMEqSdk512u9Jk+qlZPfpDhBRCdHIZEh34abKu9bXcP8AH/moT
	nd3QEKbVkQ+Zg4k9V/csKJpm99DS8S+R8a2KLnhvaT/Go6F7yQfHtjhPU/340vFD
	BZUlLh+NcDh2v/AjP6m9og==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021098.outbound.protection.outlook.com [52.101.57.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgq6p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNL0zJUIL90rwX5MmCg+nQ2xHSGgMZ+DPXe3prgYcxTnEFg1Hy2wag082N5Gw6PNv7I0lzZlKY1sS8vOkSA5gNFzhU0plnI4D7pmsLBUK2cLfs4PNAILOBCNzkbidB/8AFzf1YSwsDBn9QkNCGM1HtEibRkRkRgA8CGP1w93ldyKNLpFoEBlQyaM5CmAkqDlgu8MAFiOycqwh9mvtVs37+e26fQWbe41Vvgv5XhGVsGZ0BL9LY7+mXZ2XjXNWglx9PVi69McTyY5i0c5wRMcSQBGbpa/mQ+Dg8AyRrllLmZYP2uuwSwB+j9sck5jaPTbUiGelbKN7K9TZ6Z1IlDHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5VTkIbG1WhiHHl6DMoxb9Q0lemF6YyY7PkqVLQ2rao=;
 b=wFMDl2H6FghLy2MZIShbXBLEqVG0BGQWQd5Os4W8Yro+ZX5I4Xdyli1yFblgcOgcnTAe4KdUykIoQ/oHF6SBoihOvmHrV4bYgG/4ffdRwn7EcLeXgETKTaOHzKoHUpxoUmLpEFz/CFaIoTf9w+kxCCj+E4DDJg9cegMItJ7qrVmIJe4Yu8rKqK7pKbt5XhtZ67p5ZKUUniQqfl8LDjf+VQ68cyLQHOfF2WkGvMnTUAhXhimWfWo08yiFy522SWVH2OcfiGj5r4RpZmBorYx+Cmh8j1Ndh+bM3aD8/FtOfmA+aaMoqO2YYvjqBvpu6C5+qHX4bt0zzmO6FAE2nqMCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5VTkIbG1WhiHHl6DMoxb9Q0lemF6YyY7PkqVLQ2rao=;
 b=GbbTRNZiB4hdCmqaQpgwKbAypPqt2pGx0IzzsHHWDK18amNT/HSJlJeP176Mr9amEI5HrLid7vlREu6FR837IZ0sPxYtk3h82dpdLJxfszvxivGPU/nqpit5H5RG2kT4rLba1eXGBn1/vQDWHjZrVFwuuC8GV/526zKYmSbnxsQ=
Received: from BN9PR03CA0133.namprd03.prod.outlook.com (2603:10b6:408:fe::18)
 by PH7PR19MB6705.namprd19.prod.outlook.com (2603:10b6:510:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 10:13:56 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::a7) by BN9PR03CA0133.outlook.office365.com
 (2603:10b6:408:fe::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:13:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Tue, 12 May 2026 10:13:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E81A9406567;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D8D0B82254D;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 16/18] ASoC: rt1320: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:46 +0100
Message-ID: <20260512101348.1138044-17-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|PH7PR19MB6705:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c09870bb-0f9c-45a8-c16c-08deb00f2d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|7416014|376014|36860700016|3023799003|11063799003|56012099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	sbfng2xRESHDyDsyjFj8a/Tp73eaftSLgoKGrvh0XCVqf8X4WPjQuYcLqCI4gB5GynX/Y2GfEcRZAJG5JaoVC5XvNxX22dPJQDOWnl3CMwAgBhrm3tFB79AcTXMMtc18KLVf8UYlY9k6P26qRUnFdND0kuVBmhwsmED9ABC3qogqytf3L+m9wEy7z/NjW+YBQNkd2YG+YfSjvQNur6so0yGZY8wzbZX0tLqjzEInlD/r+nygmCSYLhG4uDW6wIhOrER/N1GV0sA2qR8gISwlqNDxuxjK+itmoPz96nMSTQ0xlhf3Yakbazb0PH6uA6+vEk+pyy51FQxxvKH2wsuWMlsUZWB80plOy1qmImN1hr4dfqr/hhak9gP8/UIPfmBMEiekG88l5qV9JdLaG9Gi1N1qpvnhxjxuBCRrohQfZYICd4udXICwQhA6geyWl5v+DmZiVrR2cCfj170x4Vz+KXodTBFuxDU6k3JEV31qL06iT6eKCew3NTdgIxXeewnLZDLnCGULzlio2PifBZGuwXUOzpi5BtIiaFcnptXjpRN/JIfRhtOZo07tj9IB0im+H9szGROeDk5tgP6Yl6Rbw8iTkUI+p6SaM5TziEkFzhz6MxX/02BOTfw3LSD5Aa0y0bMPR4J7nnqWMDgsItrgSECqdyg+YtooM7OLfdat01i0hKrQ+D7waZNFDpMlei4IQf5xehEnYuyOSBqcnS0N6wWXNaji0YSpAsYsdy7HOAQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(7416014)(376014)(36860700016)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J8Q+0n/wU+gwOfz96Bw+iPeAbp5HhlAxrkZcqgDseB+kXdwOn/jNZF4GZNUA+g54ttuIip4MdEuBvezxFnqBMhY06oPmZqXUXSiy0zHCcosG6avAvWQblh54Qx3r9u4aoEf8/q4DAsyDTwbzGWSqzUPZYeEQriGZqdC/YA7ZEMbi4a4k6ESwhGhNYOuGNXoGmEuUUCdtqQIB5T+upOpz6h1i5Y5lXpZzkaCnIYah6RfgmUicxOMlMZ4mEVJkjFh9kH1G8UiXQx271M4kBEQuH/1TO2VdVGQZ9L8ojbO5IbpnQppXMfDvPTQq9ZKGKg7t75EO94mpZYIfi/dY4ryWHjVWYOE5QOMjEWvy64ymFIgPZ4WUAixccHBgGleCXQ0jsQyZtKtWnzhmT/2TIii5D6HfWjhLWPzQ3NpDcQp767ZdgRd782IJABWfyCuZWYFX
X-Exchange-RoutingPolicyChecked:
	g8rmJawLU+X97DYyMHsnHMwcMLYMvomn9lEP31xfZWuIBY1nYan1/leuL2iNTOu98CZVPnDmBH7ujF5ctI6OqfpxawDhLClvUH1ovNCMv1K0gO4O49OzyGbc8x0T6R5mqMuC//HauyY+9tKUPeS8XzjWOQZxJTngoB8Oa75gOl31BrpTSrDtrSWXPyMX+h+T7RQcwlHgn3zzQQEHZ7/xXaXQrur3xlrdAY2q21AD9gCM1RVscXUct0npM/a4tcplxGiZUe/AJ7rUkyA96OEOTlnSXL7ZLK2i1iMe95cYZT9FjvXMKE9fS6Qtj3bZeq2NxjbPOalOVsbrHhjhK5dt1w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:56.3963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c09870bb-0f9c-45a8-c16c-08deb00f2d6a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6705
X-Proofpoint-ORIG-GUID: pQHkJ2ldWVK66Pi0oX85Yu9RWrwIcOHK
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a02fd6b cx=c_pps
 a=zHc5ipMoJZhVMviFMUShKw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: pQHkJ2ldWVK66Pi0oX85Yu9RWrwIcOHK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX8tBIqRvip1Wi
 N/jUJpngdzsIsZjJc7bRGiRM7oVNp3Q7uBCNHZZfD8k1Wejj8YRK+YTWWJxhbzJ+gspZGdlmOfP
 zzD6Q+7cTLyOXdhWLY1GAPrIePQFINhXPwl7pBEqG8/kcVMBu5PwtUcJNtOi9a02FA5ydqoCmPn
 X0xYHvjXDa233ITRBm6ejGZ7OfDJsZqyH9tN6zJCAVExVxTAbFBBEfzvpJec6b6D98Jqj2vO96u
 oomA/PjlZkJbmqMOqawn+ugX5VmlkURteXJApxKHneU08WPENOTaLPhW0jeS9emtJof0NoeH/go
 i3VbtjjQDS7xT3jlSsNg+7s39eVbwKQpHCLbX79xHWFzKxTFTh0oAu4dUwSVPFmewLgwe2Z8C9M
 U+qS4JKH3pa+vgxH1x/bZ/doE+XFfd6TiSCFlPNv7EzJzL5JUeYClc8YUEQDE9jv26u9GdWMkP0
 DKmmMPd07iLfh4TdPNQ==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/rt1320-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 192faa431b5e9..13493b85f3c95 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -3053,23 +3053,15 @@ static int rt1320_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1320->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1320_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1320_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1320->regmap, false);
 	regcache_sync(rt1320->regmap);
 	regcache_cache_only(rt1320->mbq_regmap, false);
-- 
2.47.3

