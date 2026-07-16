Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CD742A797;
	Thu, 16 Jul 2026 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212948; cv=fail; b=H3PRhgg1QU7+ol3mrdu7uWBGKQGLyghN6G4vbgLxc02EJFcdwLK3NPM+yKYIaoO1XjPmkP0wa3bhuDAOokrO8QwJWYS/pjZ/lCdXp55c99pjXw5ljyIZX0eKPjaGUX+pSA9WYyLqWBh/Q11sdzX35X1hc8Zw+0wfpJ85xf6iHFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212948; c=relaxed/simple;
	bh=8pY0YkysGFAD+CP/BqKKXgQYiMO4Wd/T/MNixM1LjDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y5Dazds/x3geJ4I6imdBSbGq4BEAgRxfHgp6D7fftJqCeGdNE5pM4k4M2696qaieFcHzW86zf1NJh8SArCGG9FcEhuy1ngHdO4ggY6gq7HZglzcNXkPPIFkHiLO5d9qBJr8+iZx6+oIWu2M+z7xIZceakO/D2NMCF6iLqcwTyE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JApCmFWm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AkdNo5d2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JApCmFWm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AkdNo5d2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G6mTMV2864766;
	Thu, 16 Jul 2026 09:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=AFXKvukN843PKqX7
	nsMIj3SOzf8e8roAJWNXscSQe2I=; b=JApCmFWmf8YYjBto9wSAFdtgOQ2INwBU
	VcMxehvLbylhlo24Kv+f5NqSYRyE+5g8J2Znw/IaTHsiaJD86ln7B3m+Sjoqkw1I
	9yGh1IQqa7JzMZHnJGiNKPxczyx/TXnaua/ogBEnd5Kwp3QBizDyfUb0RgQJ2Pe4
	eGGEHxZDQTdEAFIWb05tbLeafDS18mFtXcBVVVVjO1Z0lE5vx99VtDwtwgXsFwYw
	ejD2qQhIXcO/Kpn3W40JLJIB83zU78PB8H556m6Tp8PTVWI6B+xNWkUeLIpFKgma
	XIoqZqKydrYzE/OzatezUVr0StcQ9G68OP+svf+QInL11Fgrkj0peA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021082.outbound.protection.outlook.com [40.93.194.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vyafp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:42:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohKnb/T/qBOEk5CLz/0H5i4Ha1nrXJXuD5Fwx9icjklBSssVR5o0gv3SsBb08ECf3ZlCkWBlHRV/scHIqrSCw57ibdCHIQyWD7Fpdk+ENuij2tnpIrNjN3Me6p+ecc5ZGgu5XUdWd+K2BOBl702TGUZig5c3lROGJ0RwdTKXC3PD/aYCfbjGvB5f3/hdEF10HoZoN+A7GSmE1XgTGmw8e9GghC/HWGTmf5BvVJQa3UFxU+GbypUZgUcfTJKjheeubHlGiDWRCYzRyB1SCoQKlkrEBjKAYBb9AoyS5SLKtMVqCmIHQAt3lpqkrnDLZ3a0pQpM35Em2mX1iaZacViqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFXKvukN843PKqX7nsMIj3SOzf8e8roAJWNXscSQe2I=;
 b=uP4I7PHkZ8AawuH5yOhmzBIJE1nWB7i82zNatY9fpXSKUt3Y03RU33l7yGbmPCbsxqskIe9BFFWR4TeLXU4gMTo8E+3eXLLrlziPKs1W3XUczPcvH89NSY2N0WLzaxiQbfv5/U6xIbkGuj9jYBhAWt/KlHjq1URJidVICUkhtVkYBuhD7EhEhl99qOXthaq57davS9Yn2lPqctssOpQmgUT2W4l9HwHn/fxojagWSgxTO681hoFrsapY9Uh7/1KndPjnvYyu5dB1lVBs8uHz6SLV9zTx17adToWsxYCpy8Y4C1nCZP/8Zys4VH4yUv3eh7xGQxKF0OH+uXDsEg89QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFXKvukN843PKqX7nsMIj3SOzf8e8roAJWNXscSQe2I=;
 b=AkdNo5d2kOSh+QD4EaRQQ12zG/+h0VOtAXV3l02QIE+adiykjVhcLV4msLmH1ks+b7I+dBEOd7geyezzNV4cEkMixTc9pfcWAcIzHdBQztUYwAaHfRnD7aZnhsVnNYkd17DMY0zVFbNR+0XbR1U1gOzLo0HfutYDCBcHhHomTK8=
Received: from PH8P220CA0051.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::34)
 by DSVPR19MB997428.namprd19.prod.outlook.com (2603:10b6:8:459::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 14:42:15 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:2d9:cafe::4d) by PH8P220CA0051.outlook.office365.com
 (2603:10b6:510:2d9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 14:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.3
 via Frontend Transport; Thu, 16 Jul 2026 14:42:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D0C4F406541;
	Thu, 16 Jul 2026 14:42:12 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0C59820244;
	Thu, 16 Jul 2026 14:42:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        kai.vehmanen@linux.intel.com, cezary.rojewski@intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: Intel: sof_sdw: Add quirks for new Dell laptops
Date: Thu, 16 Jul 2026 15:42:09 +0100
Message-ID: <20260716144209.2411523-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|DSVPR19MB997428:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8bdf510d-ce46-4adf-0500-08dee3486d5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700016|23010399003|82310400026|11063799006|6133799003|56012099006|18002099003|16102099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	JcHeIK2mz+NV3Rciy+bPOdRgqsWPsOfGjmJXD1lnbkV5pARv4b5SUNpmbg46H37IS52xXfGwk1sIjDkeOoLnry57J/qUoRFaVMW7w/bVdR/z/5ndZiNSAdVgVtYzpNm6EwcD4nzLvjAG6+GDKbqHEmXnnjt8psiypwiQ6WxDDccR2QUrHZowTiyXqEtxiOevraqpdtgOeqIXZjWWDkK4qdFOJDPLRq7QHp3iXWeHB5zhe1NcfJVYN4bpBtTzJqhTXunCRkcP3gmDUBMsEuYoh2Jn3T7X5Idgf8MMQQ7//P5npY6Z9Ix3CdtqFV1YuH+a/Tr+1G/MNb8lGJRo8e4HITrSYUuFT/5g/mF1E0syD0rZsmzJZ/KaqXflnecM7GD8W+kIB6x5uCXEu6/RyHDbPR0BY221CU9b0XwsIUdCqWCfydHWhUOivGxSnxemKHJywbbz2vpCwFPVJTH+vkhn2JrKse78ZqWXOdmieIsheh63GJLgzPrc/WdU/hEiCgbvPGxqPCgv81BI55W4++h0va/8w6tIR4m/UFW0/bPefw9nRCS3ENrR8QqTiz/e7sEOjN93pQJjbxH7V3jkqP5U7tT2wnIj7ZaNqEm6tINF5vpT0p8mlADcduZx2IrkL1cZxWjDiL1HvfBsbOFX6pMkCJMBrt6leMRweeyVc2DKsM5i0Ej4mvi6dWWUrASehubm6D9tWk7BuFd+108tvZ6C4Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700016)(23010399003)(82310400026)(11063799006)(6133799003)(56012099006)(18002099003)(16102099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6biuJtGu5mJX/PrVurUocJs/5bHowIXd63J3O5Wj3WY0PNHmCI1sIPRbVH+1ssddE/22DruC9/vhf9SOwwvMiIfq7QSeqD5cQEFfKeccWJ8i1aQpKePooPsH2aferoUK4kuzsrrxKl1shy9DV7hBTT291hlIFYg9E4cL5+rJgya51EqAyl7+JZ/et8H9I6PDwFEZ3EWqOSj7REPZOFeTqBtjantxyKEddnr9GkLjIZdghaGnGWSllx0YxVPk27lPS986w5JmiSHCwuU1gcrfjxMV2O3lFkSA7ygM52kCy44aUTs5IjR+xXXNqUK79CTZbh2CCTyKo8OkDBG6IQFFT7YPSOnWiHvHsbrr5ZVcGrDZh70isaYBHLSLiNgqueewRk40pegf9DurLaORRRjxhT2/iX7hv3ZiamvpKmtOBk7LvK2srWAkGJ1RbPrytEZN
X-Exchange-RoutingPolicyChecked:
	brMj/3Oej4qoKZlejyyqlshiLG54lb3cHwdJZxqlzEKA87r5WNzfR5PLRS5CtyNnmXU/rZgeNEwtAw61mZk6aTQ3JFvU3deLSx4jSkPdXE3W5j//+DCO3uyaMO+85k4gnfvvot1Hx9VesFmAvtXUWCUz6jfEZ2NbQca3p8wj0HTvLm7KZ28v3c/SxJubSEpi0COWdXGx/9tBy4YHbMR3KsHJNIQf/snjvw0Xh54p1mOKul/mbYiv7QtXnYAh34fUgFzFLEVZdF6YIDtbFDfClTT898RTEwwVv6ioDlfhEC1fJmUw+GSDSxXAWQISvslLp48NRu4naa0v98dJDyELLQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:42:14.1753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdf510d-ce46-4adf-0500-08dee3486d5a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB997428
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a58edca cx=c_pps
 a=A+KY2CRJZE6laZNMCPYSqg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=pDWG_dGb3OyzkZlLTCMA:9
X-Proofpoint-ORIG-GUID: Z-wfCAEfib1R1NoBWCzsX5kVzyAt3dri
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1MCBTYWx0ZWRfX7Jkh1D4LCgKr
 1I4IoZ6tdrT58rDa6iwdEOZmLv18Exld+UuMhDWtGo8CfHn+PSsOs97IcZ2zOMHrLKF3AyeBtp0
 JqFwy76UPptyvm1TAghkZeXoTT7Aemw=
X-Proofpoint-GUID: Z-wfCAEfib1R1NoBWCzsX5kVzyAt3dri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1MCBTYWx0ZWRfX/LyIBIXTagIm
 y6LF0mR66MTDolg+Oqv48MKMKFH2iOzA7O9X1OSwEeuAejfFAOQZ4TZKA3ijhLn2GDuMT5YNXTU
 eaFOHHBVbE5HJ4zjBfTqw7j4Eszcu+UT7GpR7LaE4AF8v4yFPJiF9QJw5xmeMzqc8yiBIIgbCSV
 ThuVeRJjaKNWiljd+kcjQOid4j9ROKd3XmEfBc1DxvAG93j2S1KPLuagcq8hLWBJyhJSbRj23+7
 KC/pNEFQ90zxWT+B86cRSRc39+H/4RoMLkKy9MeBiuGwbRaEk8UuU2h4DDGu8tLpqq4O2Ck8uL8
 cDmD9+uS33Gzsu2FfPQwccmT6DStGdhARoftlCtrO8NcOqrCUpKEslwJUALGR4tP7iVk1IK7Jaj
 6+vD/QbhrXcQjibvFJ11WkXZJeV+rJhbk2kB2xyywSKJe5jX1Iq1r2bdUZibyT/WWShLXtOw8fG
 r/GAeFcUCXUL177TORw==
X-Proofpoint-Spam-Reason: safe

A couple of new Dell laptops are shipping using the sidecar amp
configuration. Add the required kernel quirk to enable.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index acfa34aea2428..1013e07052a37 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -849,6 +849,8 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 };
 
 static const struct snd_pci_quirk sof_sdw_ssid_quirk_table[] = {
+	SND_PCI_QUIRK(0x1028, 0x0e53, "Dell XPS WCL", SOC_SDW_SIDECAR_AMPS),
+	SND_PCI_QUIRK(0x1028, 0x0e54, "Dell XPS PTL", SOC_SDW_SIDECAR_AMPS),
 	SND_PCI_QUIRK(0x1043, 0x1e13, "ASUS Zenbook S14", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1f43, "ASUS Zenbook S16", SOC_SDW_CODEC_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x2347, "Lenovo P16", SOC_SDW_CODEC_MIC),
-- 
2.47.3

