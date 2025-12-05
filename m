Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9D43128CD;
	Fri,  5 Dec 2025 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947217; cv=fail; b=fsnZYrs+QQ7XP36C4iNoMoRoHa0S7E729fj22aR5PhYjTMRNpbRC4DFMO79D6nORE3n8t7JxNLmDeL2kq+CU6/TEbhSQHO0GLi62y8mgpr3xulyRQYVZTwF4WLu6fkxMT5+y3OvRbQ0ngtpVzxqh2csY+D5VlhxM3zJzwRoEBiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947217; c=relaxed/simple;
	bh=PVXZU/2/Ic1wIN4EgxdjIX7S7tDweQ5rDBRzsafIbZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KEKOxBCyzTfo0nZyq7t9gxgLGVAiQR6flaPr3hmpH+tM8EaluzH9R4HiJeQXzkJecKIAOY6DvN61ePwjqiscuH+iO1cSoziFcHMYiUwLDa1JJk655IMtilf/4hXpIBLfzq9xtonDVqthce2zIXmUegPJ1TlxXFlJfOCUDgdnYSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Szcz7oPR; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GtvsH7CO; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Szcz7oPR";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GtvsH7CO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5DnpMK4121539;
	Fri, 5 Dec 2025 09:06:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2ms4pn9TBcDnHDhh1q6WLlxOk+YInSMoU7t7st8CEJE=; b=
	Szcz7oPRJGJ5JFkU3jIjXXwVRLawsf2Lsrt8US4Bd1vp/sHp9k9/mSJsRJ/JsH52
	FKHU3MBpPlC1LU3SLmHcUBCo/0FOcPGUm2ooS05S20O1gdBx1hfgY59hbheu8pug
	NoYlPbOxWUtEM9wqGxsG1ze/bzRMvzB/ZUgNfPm722drI/zRJy+S5XtxUZSbE0Nd
	szEROQnFT4q9eRLuzBxNUWwDH77xDdoB2XA6+0jyEvSxCfcaovBFizjaNSUc+xgw
	tZhiPNJC2f1Aru3GwVr8womHXXke39cwGoSIpU8UmQCYQCA4ynrpcmTuzeObee1o
	ALs3EwSzNLo0xfHMmCLvVg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020105.outbound.protection.outlook.com [52.101.46.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4av0md82ue-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 09:06:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGnPbSI5cUX99rF6+dnvcp8qmbNJrKxHgO+H0zbsJMmqt4nvuvxVyhAc7BzulIjC3kA/mQzMJcrwh6Y7dO9QGhZz8oGgQGAolAWeWLB0qmdKRzFirmU6JE8jTj6K/xhOmL0ULHzXv99bqqWAT9hUpsNQhkzrka0lebxGidfTN6e/lrnllATdhIHbJu4iICLR+7nBJvgl6S1FP+KX4qjk3xyqdEqmQlJuMFcuCgjsR0GwqBt/QoAc/8LDShkr/M4NmIGefN7URtJ/C7EEe4+3FUlVhm2rL9+zcKVDVYXT2AC2RlGMjjftEswP4flRYti9vcbKRCIRV1Kb8VED5PUraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ms4pn9TBcDnHDhh1q6WLlxOk+YInSMoU7t7st8CEJE=;
 b=bCyvo/wgl5lQfzDfeqee0Gx72+YSvmvgUE+5wKL/wrISt5730ISeIWHDRC7Q/jOUxDszEVZdRz9sEUtivSe5rj8zTezz6aVoWgI2/u5VvFH606MblEOcLuZabBcvYi/Ok3JW/r5naqAmgWF7kOvhioGvg7dX85I5RxgU7pNTavF7MlCYscMLqQMhYlvL6O4jw1VQjzh2U5DE4h73a2nekTgeB8/uq2S2Q/iu3tkQFI4fYSZGOBPaidJezGYYALTHDmqN62C0gjPFWYR6f8iJWRmfNDVLoWV8sAVPy/gmNCojAIhofoTpNAOq5uqcSAwLd46stZ1GNRbI35MwZX3cZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ms4pn9TBcDnHDhh1q6WLlxOk+YInSMoU7t7st8CEJE=;
 b=GtvsH7CONnaqJpJfcRb6DC+45vMd0VcDZmDz7bJ02SBr//JuPrQs09IB2UbiaScK5spQ1M8T9j28vjimydb2WZosRav38LTQs4iH1APRj26AwUwQGyPJlAPGWkOQnMPyz8SuGa4irRkPy3jDotiTZ6eJTXwPfv9i7AggE5IsArM=
Received: from SA0PR11CA0054.namprd11.prod.outlook.com (2603:10b6:806:d0::29)
 by BLAPR19MB4338.namprd19.prod.outlook.com (2603:10b6:208:278::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 15:06:34 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::7b) by SA0PR11CA0054.outlook.office365.com
 (2603:10b6:806:d0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 15:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Fri, 5 Dec 2025 15:06:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EBB6E406544;
	Fri,  5 Dec 2025 15:06:31 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BE11182254A;
	Fri,  5 Dec 2025 15:06:31 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ALSA: hda/realtek: Add support for ASUS UM3406GA
Date: Fri,  5 Dec 2025 15:05:55 +0000
Message-ID: <20251205150614.49590-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205150614.49590-1-sbinding@opensource.cirrus.com>
References: <20251205150614.49590-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|BLAPR19MB4338:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b8e6e6bc-4a8d-4ae8-4fcf-08de340fe0db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rxZmwC69i0LTPNeqT3yrvpiKCLT1eROrNPGWlR3R1Fy1+RwQdGfqZdDR/blA?=
 =?us-ascii?Q?yas6kophY+8Upz7TU72HseeFriSsZgAWVcDxNNzaS9k3c9wxcztBP3KGKv9D?=
 =?us-ascii?Q?wUzneVyYNuFZ3l8flV6wTUCVksnngrbJLz0GR6kzfzrSmQhoN/Ljj9CSSd9N?=
 =?us-ascii?Q?HSaPo/nJZUsW78ktrSGvlE5FuNqXKPOEhHsNOLtSuw41warJncW+3GsnZvoW?=
 =?us-ascii?Q?oDpTqK8SuHi1mOPLe2i6syM24VnmRGEIN/K/G1d/yoJrbka/kMonaciZqI8A?=
 =?us-ascii?Q?VJ6YHNJT94OLEC2hNoBDhB6CjGFBfobTNBN8cH9Cxq9cphEfPLWFmBuYnRnp?=
 =?us-ascii?Q?8CdpnGmQn9s2HDqVD8EtzFjrBJ1lp2iNhqr+KJCoFDn98n89RAMt/nYxXCuk?=
 =?us-ascii?Q?VfLHLVFbZ+l3WXXzfnhYWk0Jhzo4eJYPBzjjkjt8MyQ0KjrWdDDu47jdNb4E?=
 =?us-ascii?Q?s92h4luSD2gkjrKfAjIDqdgZKTeH2vkqmnbafwBUWnZTMTSG7YV+KNmMjlvL?=
 =?us-ascii?Q?NYm4UZ8E/7cPg8x2uEEhO391YbaqYiuZn2AkLLz/mA+H/sWAm5w8ZDV+tljD?=
 =?us-ascii?Q?12CSwJkw1kE2zzLQMn72GSjmK4g8wgwxprST+IkzGHT4x42m16suemS0qlCz?=
 =?us-ascii?Q?rTVPf+mbWyXn2RE07hQDD8w1bbsY597byItDlzyM3IfFwoXEu+Ol4V/VZr1Z?=
 =?us-ascii?Q?g7eBb+Vco7Rb0A7HmKXrSjeUvwEalRCi5spi7PLUY3dZSlyd6p0fRDMZi5yC?=
 =?us-ascii?Q?tlo7bc+P3sXHgTuEmXhI30752Jp8svhYLja+4RsgXjw/t/3BGTaSm2BQuOvA?=
 =?us-ascii?Q?pKh919IFFTSiq7QT9u6OQM2pC/9g5ypH2ZMu0CVUmJ6RrMqNWtaMM6Rgkq/J?=
 =?us-ascii?Q?XPyxtrQJOed/6OAfOF9ZjeYNHDB5utR6+oJAbUOLSauNLmkEeSAGxiFIxLD8?=
 =?us-ascii?Q?XL43wvAARE3BgJkv3oCEEVyIXpZF0g6J+emdqTJPl0RTUxR3tAbSstpXIRPR?=
 =?us-ascii?Q?h9dKq11Fvhbzp+SrReMGNmTPVe2firP5VnSmTz/vJVV1np6FMjuxL6dQrwo6?=
 =?us-ascii?Q?LtSed1aldcsPt4pWmc56F2KCiquPSTt0m3ppMycMPyaiIo3z6mz/KAo4AmME?=
 =?us-ascii?Q?nHFHdDlbuTXoG7aURVXyhI9KkJ9kDXjR1I4lZr6I7yeuFU3wdcJ71KTcg8zb?=
 =?us-ascii?Q?nGG6Ofqmc2Nu9YgVxKJL2NCNJagiMF/V8/9ZIF0ZUzrh/ts8W+VYEitVti69?=
 =?us-ascii?Q?Y1JjZ18W9ukA+7aqgvlC2Se2365grP7MaaQ9tE+lNRdVXnpwVecHnvFQfcPo?=
 =?us-ascii?Q?fPyq5zodF+zY+E2uD0IVFEFhICFgZl7NfyHbCrnrlJOOenjt38kRI6nwoMNz?=
 =?us-ascii?Q?Cztv3CaSLDDOwuST16xEkE74cUBGqr0wtKGvnoRzwxeC7abaexkFTI9eBDfX?=
 =?us-ascii?Q?b1lByP+OZ6gkSfjJH9Mg5XL2DnNRTHYCfG1CwLpW5qbOid5geYa+Bmtj0B3P?=
 =?us-ascii?Q?1JUm8kRGfrDEeoO8JuO8V0xc1/JbTLQVO8cjUiLHItj8d7oW3oCQbHQThDHq?=
 =?us-ascii?Q?bo2tnZ6GP4qWgeURxCA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:06:33.1944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e6e6bc-4a8d-4ae8-4fcf-08de340fe0db
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4338
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwOSBTYWx0ZWRfXxzInMsi4Rzy7
 yAtHoD3Kqbo3AMcNA+QjDgQocomvLU3AR730FKbINhkGrEFLUunN+go9MXofAMQVo9ZnL3XW39Y
 LLn5oafqarfVyEaRnK45vDsicQISLgYZ8F+IG/9OXW8+lQZWGTSIIqzldMQLB+3Izy7/P5BAV9X
 FIRPSIQ3TpKvdQ42cyv/BPMbLzIi2gWHjXubVytcLNcN4oHHXWlGlxBeJqvESPaQnp2hjhA7tK8
 M6ZOE3EXuetd3BdQ7eDPRqGNLmNK1kDPQo4ESHXcD1jc+oozCyVgnMFlURh/1vMztBqSxV+6Q+a
 J1yjYhd6G09UWPo5kNT1M36PtbFA+EpDS1ilMT5WOpTYcsUNDNyg+cIP6zHQyf9BGU0xr5oOMAw
 4622vDI/sb6rbMwSbGE1TeACbtg6GQ==
X-Authority-Analysis: v=2.4 cv=cJ3tc1eN c=1 sm=1 tr=0 ts=6932f4ff cx=c_pps
 a=b2ykEmuCBAXBKoHv9pAjeQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=2lyKzjhrc2nKIjESmZUA:9
X-Proofpoint-ORIG-GUID: 8xVSfePh5-aapOlYzlcJgg_DsI9IgKzH
X-Proofpoint-GUID: 8xVSfePh5-aapOlYzlcJgg_DsI9IgKzH
X-Proofpoint-Spam-Reason: safe

Laptops use 2 CS35L41 Amps with HDA, using External boost, with I2C

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 0172ff22f5ea..9510aa2f1bda 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6844,6 +6844,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
 	SND_PCI_QUIRK(0x1043, 0x1533, "ASUS GV302XA/XJ/XQ/XU/XV/XI", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301VV/VQ/VU/VJ/VA/VC/VE/VVC/VQC/VUC/VJC/VEC/VCC", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1584, "ASUS UM3406GA ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1652, "ASUS ROG Zephyrus Do 15 SE", ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZI/ZJ/ZQ/ZU/ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
-- 
2.43.0

