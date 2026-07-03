Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF4353A64;
	Fri,  3 Jul 2026 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783083776; cv=fail; b=ltHnbtnEY1WziaAN+c9QBR4Oiwmh58fV8cNZJkz0lKIBN3jF1GrsuC3IiTcF099H4ic5hZjNanH7i5iG2KOQuvW9Jm1qJB3aSuHWgI8iP51QK9FSj2OC62tmOHD0842j3A/9hVDAIti/q955gUroiQIxjush9ztyeP29uAYDUus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783083776; c=relaxed/simple;
	bh=LSYOXRxJhpI0g7t+NcHMbTGg3ImVuUS1nZt2pEv6rVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h277D8MbvILq5wVE8HhwgKptV/0B4OBPsTiTr3sxcJxcsyTa4+NtLez7GxhbukGoRazTF6hITD6KHpAYC1tpa7DbrX6sOcKDqNlmb/7y2tGF6q9NB6w91cjXoAZ5D/QsRYTbBRba03bw7vew57O9hJZp0Q9audHyLSPXRM2v/k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Arh1mEgT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YSZIcsKa; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Arh1mEgT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YSZIcsKa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637PY7O2365422;
	Fri, 3 Jul 2026 08:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=q9bwreUBKXY/abyI
	Gg26qmxryyg+vUy4Hq1X9xS40zE=; b=Arh1mEgTRTTZr343ZpIcOPcSE10Auxfo
	Snk7XI60freIcss+1MkLhrLACw0KGmf6+cEWNhWujo2IdmNhyba/vN+RKwRcWmHE
	qy+CdPI+AFcMuVTpXbnIG+UqeemZ2Pbf4PTeHReeTnrXGmLFEBN/O41ZL1PlvhSX
	eCL9m4FGmJzTPtYwc3bX7HyqhbU9O65ma+lnjAmHXgyUydPJJbRepHSQwjOHp/ET
	4A4zPImeEuyBWMe59MPwn+IP+Wi6PRyGOtl4D9SnBw5l/EpdAWykNHbVbMvvLHBx
	/2W4rR3lsEFeFv76ZOr75A35RKYwJouWOYEe1/so6mb0pODvn05H7A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021103.outbound.protection.outlook.com [40.93.194.103])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f68nd0dbj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 08:02:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riopYx97XV/wzL+qJbfhIdrYIFhEuY2gkgVlxfaBKRhafA4gb4O3NfDUT/9q6olWcPc1hk4+Pzl56eHOfRj04HnrQxwYKaHyy18CmYYhcfmhDHl7Qjiv08xP2bnGB4L9dQR34zlz+UwFCczB0fm6N7IAB1/EXHoknV9O8Kmo/fFNmgq0nf+H5AD8d81Pbk1TjnDPV2AAfcVPdaTiwas6mDUsibQm4mD3gpB59L0gb1QNyA58grUOZ6AeD7M9EWU1opNGbqVI4TrgvnEiECn9KdDe71/KPy7x04W5GPHkIvF/17omFt8F7UGWTxVOywwWr7bZ5uFrCDHxZwMns/T/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9bwreUBKXY/abyIGg26qmxryyg+vUy4Hq1X9xS40zE=;
 b=kf2SkXFBKI8A3EDal8OFIbeGgs4QOJMLGAh+n4ia56oSaRd7xKhGl57pb78lv3b84K13bub+KpxG0Q6sLSmN3hMeqtak7VjiGEvuaH40i/0E7iUWhgbgV98SmkpeQl1F72NuRFdUKUZNv+2LuhipzQzNp0qeMyw9JHmXGLZrz60CHxlXDkUViHL6tnlNkIc7QPuMo/YyBAWOkBUq9/brysIWhbxj8JUIuc0WUdrKYDWJmUQFI48FvmVN6YrVJ9SqmCogfjp+DXVevwCQA79SQWDP8UvR6BSdcuQYgeo5eEV/31N5Jl9+LxM8kAXxKlKytYanyTT92woxTfqSK2572A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9bwreUBKXY/abyIGg26qmxryyg+vUy4Hq1X9xS40zE=;
 b=YSZIcsKaeyhGidte0dSKi1IpTo1NMo5YBbyO2rD2voVRIUg21ybAsZdgge1TGR+eRovemy3hvFYpJMagau3ah6r6NdOluiVyUE45GrKCyXlG5Ue5XW7rc6leR/3vx7uhglq1NO1i8hibmEP3yfWnsKVAcylmKCMAJhe7MU9gxgw=
Received: from CH3P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::32)
 by MW3PR19MB4345.namprd19.prod.outlook.com (2603:10b6:303:49::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 13:02:20 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::72) by CH3P220CA0012.outlook.office365.com
 (2603:10b6:610:1e8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 13:02:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 3 Jul 2026 13:02:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8C50F406541;
	Fri,  3 Jul 2026 13:02:18 +0000 (UTC)
Received: from upx-mtl-008.ad.cirrus.com (upx-mtl-008.ad.cirrus.com [198.90.251.5])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6C97B82025A;
	Fri,  3 Jul 2026 13:02:18 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH] ASoC: sof_sdw: Add a quirk for 0x17aa383c laptop using sidecar amps with cs42l43
Date: Fri,  3 Jul 2026 14:02:10 +0100
Message-ID: <20260703130210.21991-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|MW3PR19MB4345:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ba0cb5df-852a-49c2-a832-08ded90350da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|23010399003|18002099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	rTvgTG4zBjbLFIdPwpUAYUQtIwEXioteZrRQAqn6sg413ql1s3sNDLrs3k4/YBfn5IG0/EapCPdX96/fJVTzUFTsZCmP1wNAhm0HmRWtRpfh/7bTb0nm3mCyCzklL/YWJLuvMgOwAgawpdvf0UqeX8Y8x8fODQrNcFF8I+Y04+SJsxOvnS+uKUEUlvjwYV/w9GTu6gDSkmSTGOEHDytWaEk80ooS+PcylvmlteDOlWtnM9YieIhspI0+hRkOMLs5gGLfpp6u9MoWmxjRkebzjPk32CICBFdrzh6jqyxtv/F9Nh2MHELWuc3y7W+yb3czXrd3MRhOSyl99M3oyuv6JNY3Ytd9ps0u1ygbcXHqeqw0KOh09zYEJybxOjrs3hXAeF6hH2WzOoWdqLmwUIBSft5KxR9euWx5h8x8tOpWgmQXHlnMHm+pies2QfrYFY28Z9WOAq3efSUwUUBFaB8NaXhrrtfMEuSV5kWgrnjJI6LeF3D+pefmhtwxbQ7OTXaIfd28OTttC3SRqUgB2mSaueK/eZTXy+BfoZBkqf4aW3oOPpoWPTu/TXuo1sinQ9xPclDU9E6Xg0VeKk3GJMzgKlbb2ei8o4KMHU5FtGAichE71GtyIWhy1yKdT9p5BHCSJdPXl3WQ8s+H46wpFqMQpN93cRh8sTv7cSE7YscODRdpX8yd5oEI5zrTR3KOQPlrXupsOrd/I1bgLkyhVPErJA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(23010399003)(18002099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2j9d5DnPKjlD2BC7i10KnIE9PcfYnFMhWyxZIRbuS0mzxx3gaqQ5+kpwvFsOoLHxWYnrzgbuSI2ZeRGZizXCGiv8X+Pg+GWGBLLQ8nFLSLMHnxveteHHEo7l3vu4L/oVhmFR/Csy7/vsuZp3i7tIT/VUmPNbigQIYyyFNumrnYPCNtE93tljn9/QZOMofgVL4jsj6kyEGFf4L9O2ZQvrUHDKbJbs6TTI9REb6YOvWHrdxMAPY7QmaCSuwhaPp/LMWd0uB3plNlqu+fd5HFjnjbZPz0vpyuxIp9+3K5Ry5Mkwe27CgL35AkbTxCuXpRsUzJrk1iXhVxKYTRUJlGj5SnMraa3Nf+qt9TMcxajUBkKw460fGp4WrNKTr9HnCqBad3WZbYermgiVGK3huCGbHrqv4cfUXU6DsyixuL2xHVzASK86v5rfTQzA4X3F7LZs
X-Exchange-RoutingPolicyChecked:
	Wml8fKVL3gWikzFI06uWVLA/BxH83HF8NJpz4s3l3IOIFHA86D7tki8vnoVhX7Nw55gOdWMtnlPsOcF7QDtEpGO0R4CpRhLT/jJ98yJpRW+PCe0cUeKy/umHNbtqsTy+trOFGyM2/n5GvKwuPWRXwyyLzxO2OQBiVEcOKN7qcB6w7c7CsTr5Duqfc06/jz5x3uu2B/tY1WlQT2Z5ZmbNCQceKfi1UrO2temVfT5sXq2uCjNtRR95H094eQ6H6epffC0ExPvtan21OrKS0HR+eJRlf3DKLeDfyiOJMY2Zja1wLMg0c8JxRmjtnZIziega/Ii4bFn3fsL0QwmCOBOnbg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 13:02:19.5525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0cb5df-852a-49c2-a832-08ded90350da
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4345
X-Proofpoint-ORIG-GUID: -VQyJgG4XRtl9zlgHHZKHuL3gaKrL-PS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyOCBTYWx0ZWRfX4EYyqLKM8tWp
 1mFFBt1MXIUgKrEcGkuGVQri3wUPTRSUHVZLif8QlE6HUhkjERlSFiw7ma6bVdyfJfXue9iYsjH
 R9D9nxp3nt2f4NnrZFYvkIOAg2wHgoI=
X-Authority-Analysis: v=2.4 cv=VPjtWdPX c=1 sm=1 tr=0 ts=6a47b2e1 cx=c_pps
 a=GZ5nxs7iJwyXCG4rR3qJ+A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=rbS19CVBA7uv6swtk4gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyOCBTYWx0ZWRfX4ZLBF5WirSO6
 gjTFRu3bBRHvTMD6KOF6v5ISXrFbFvmMxdF9RxNqRP/p1wbM5ZRSrVUesFNUHic0wz5Nvf21rQg
 nMEg0wE9bCvvz+IDbh+drOxLRRl0MJxn42FSU1iaQhIUw4LcgTHhe6Fe57yY5mM30EpVbJQ/cn8
 F38NH/53DZJ4DwuBLq/HdrsRLuz77esopIZnm7m4XdCMp2VEOL239S1hK5GPUgGFMch30aCDbc6
 YJ5S66Y/UaF82+QwbeqhZeJ0E6Ug8VIrrG1PAhfWtZiHAJe677N9b6+xaar0c3uw9IWMTNq88cH
 T2Ch101KpXz8p7Ic6WSQMSuQCu4VQCOQAjlwO7iZtj7WMvJ2UWpF0wRVPiiZmULFCElYUVmvd31
 ldRKS64UDCtWWN8O77gGg3mM3IWvny4lcZ8BLD06WIj9aTbkE7zbFESEfj1EGHiQYlg+HnbAkoN
 BiRj2rWeBbgiVLMA4/w==
X-Proofpoint-GUID: -VQyJgG4XRtl9zlgHHZKHuL3gaKrL-PS
X-Proofpoint-Spam-Reason: safe

Add a quirk for a Lenovo laptop (SSID: 0x17aa383c) to allow using sidecar
CS35L56 amps with CS42L43 codec.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 24226a387cc2..acfa34aea242 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -855,6 +855,7 @@ static const struct snd_pci_quirk sof_sdw_ssid_quirk_table[] = {
 	SND_PCI_QUIRK(0x17aa, 0x2348, "Lenovo P16", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x2349, "Lenovo P1", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3821, "Lenovo 0x3821", SOC_SDW_SIDECAR_AMPS),
+	SND_PCI_QUIRK(0x17aa, 0x383c, "Lenovo 0x383c", SOC_SDW_SIDECAR_AMPS),
 	{}
 };
 
-- 
2.48.1

