Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22130C613;
	Mon,  1 Dec 2025 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592759; cv=fail; b=De5mZNqjx2jdFktf2tfCkHJRTxJbbpd4ApLjQ6xe7OErxD8JU8+k6uxY7a879DXdjGyFHQuIv6u9cScZQG5+FwjuzPWnisXxO5wJ6HDljm4wFTx1Qyf7HZwk5qVSZVwTWhITxVU69KB1t7BDWx6Lw+Gy6I9/o/8rpEXlnl+VC14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592759; c=relaxed/simple;
	bh=A+4E4+HZpGibXSjOsVxhjafPmc5oHpUQ2uUp8wDm3sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rUte5Nsr1fuv43Wapx7qVMij73+ne1hc88QKs6+ZM5Hy0kSHcZRaQoHSHFbY8pssjwLrYa8dzCqV3yKhNolL+5fSmG0Xl5T3XGZf4kp/vmOXBw3kVJBsMAy15Pw68xFyYacWNOkvD1dFV+zSfjkI3oTBDuhUELm6tDluObQ90ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bbFY+d2v; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lfUrmAr8; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bbFY+d2v";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lfUrmAr8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B15TeT2793326;
	Mon, 1 Dec 2025 06:39:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6Y0Lso1nfeu87g0/
	7aGDaY0qmO/kVbcPTaDEqb+Sge0=; b=bbFY+d2vLY64KNY9MRiaQBKc3KiZ583A
	FpGiErtakSeTV7LlZwvFUbndmiB4HAdiPkohjXFty7xyTAvqHV+ZW0NXbTG8u40i
	ZA3YNlMN21DVOS6+TsU9gniNsANMtecclq8VaQA03c2b2stgtH2agyMXyJ2N7a/+
	oYogvVkEO/A57n33Pdu+LBH8Fc0k1ldg2OEUAfIx6WgI4ykm16hHggHPj/4jyHin
	2GFLR6LmsD34QIJgW9Ecn0W1RAjrSbg1lhOCNeYchxAy61rYW9B61amcEo3ttrsm
	Wc9bXhJgpGwSKAVmuCwZ3Iv0/t5ZBFN0oWSScDMSJVbXN1OEjEybIw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023080.outbound.protection.outlook.com [40.93.196.80])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aqy441t2n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 06:39:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvgEdEin5464MCC9lXd3+ctlDvgCAmqWqwES+paSfBLPdULyBen1J+XEm7r9EmkS5agbR7qfMvcoy06ATmXtRqR5jxGymOHiRQ9nI76MtR/Z8IQnWtcZeiUEug0uNvxr8W53ws22i36bkXNnR12WeyXrhD3QZKhwBajd0XJIef9FSs6ZpZ+wvEtf02c9RCpvOOyz+CTmctssJFeNVOsagfG7XviFgMiscn4zEIYdNIxLbW6XK29xs50PFoo2i3M62VBmdFpi+PxSNp56YzPLdZ2/PgMKLYSHzfgpaWxVT1S7OU40mnt9bLelHrn8SS7KMBWm6UZEulXf/ZLKGgPctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y0Lso1nfeu87g0/7aGDaY0qmO/kVbcPTaDEqb+Sge0=;
 b=M445hGXljqB0I58rYNO/0Smlsz1C0i3Lp6KTIc+wlDhoybL1GgddgXg4Ppt9FGJfhaotDQ6Nj6tfd8MS04uwi9BF1v9z1sFzFRKvLqDN2GBmebzJ9230Uch875tiwJEMifTgK9cKUMSkcADsgUTp16BIdYErkvYXQ3pgIgpDAwHXu6TeeX/OZZHJf2sM09wD3/mTUZDAd8lyGpKttN2qzgCAmgGJ3UUXiUIC2Pw0NAtU/e0HcY5qED0dgqQmhDetDKNWIqhei7KdnRNv34wjoisi4co2JAJF6xgkP0hB+dHNRpYC2lSYm4stF/QRSYBuvHmeb6948TvkFM13VcNU1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y0Lso1nfeu87g0/7aGDaY0qmO/kVbcPTaDEqb+Sge0=;
 b=lfUrmAr8t5nygGyoEiKrUBfFIDRrVNndRYIs0moUyHIBiqjX6HG74AbEZxuSGocfboGS4oSDR43h4F4c4+s0wqQiId8evcZbfu9ebUhcQjS+sdX2mstsaeMvJzqNWY3OFrSEqdOeaUbM76ziejGdTWEfBsAsprNotaZTjACBxyU=
Received: from PH8PR02CA0021.namprd02.prod.outlook.com (2603:10b6:510:2d0::28)
 by DS7PR19MB4389.namprd19.prod.outlook.com (2603:10b6:5:2d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:39:10 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::29) by PH8PR02CA0021.outlook.office365.com
 (2603:10b6:510:2d0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 12:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 12:39:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A4A09406541;
	Mon,  1 Dec 2025 12:39:06 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8D7B582254A;
	Mon,  1 Dec 2025 12:39:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib: Replace __free(kfree) with normal kfree() cleanup
Date: Mon,  1 Dec 2025 12:39:06 +0000
Message-ID: <20251201123906.86876-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|DS7PR19MB4389:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2874be8a-ed81-46f2-9ae6-08de30d69f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AlkIA+/NPqIjpjvGxRH0f+uUTgkOc7qEUlW5JJwmWAH6Ij7nreO++CmncYk+?=
 =?us-ascii?Q?UF73wypLmfY2QBpExGZ2r0gQdWZRdCD5T0j2E0fc9SZTRf2WNouhZ+1aVyAY?=
 =?us-ascii?Q?TIa9un544yRXGBBa2iGZj7oewU6TX7fktmXup1Rhd0HhU9gipcbl1YZX8Rdf?=
 =?us-ascii?Q?dXAV22v6/ZGOoTQKWZw1p9I+m2j1GDlFVXBKcn7nLczWWy44L3uUBO/Nbw8k?=
 =?us-ascii?Q?/hJxsLSV13EMUkYziw9y1jM21k4OY3P34UwFlm56FG+PHEXO8Knt+6tkgtZ7?=
 =?us-ascii?Q?fKgJgvlfEOiLgqxWldp5GAru7CeVsvM+F5EqYnt5fz/ZkjhNjNAewgiG8+Bb?=
 =?us-ascii?Q?VkOGmOR3Q/6C12lCfZoyI7e/j8uftLXtQBg20B7lOQws2KX7t/LFENqUpJLk?=
 =?us-ascii?Q?NW5WOmPepf14p9DWFG/+kNATfDwLlilgHNc55J6NU/6WgD5wZM0gL/kvWVGJ?=
 =?us-ascii?Q?WtTaboUPMZ2/Nd0Nl9Xha8xB5g+/IegUJ1YZP4LBiicBQc78znQvoOT2BYIj?=
 =?us-ascii?Q?ueC8XujQMadZxQHJweClQQjJf+Eq8xW+ZMPc0kaeMW/sseh8fNRFMBuywpnm?=
 =?us-ascii?Q?DecChVob8X8kgIV9+RKDyY/XdML9SddMY53C3BTvb300k9qAR4c89H4xtekI?=
 =?us-ascii?Q?4zx5RmyanAKMIUp7jIkjnm1CMFB3kwBAc3uVrublDDo93K5aWPg2oFed0wA/?=
 =?us-ascii?Q?Onrcg8cS+4wJXqzf5wBQM8l9NI/otk1fOxo0WCgZx/RRbiuGjh5Fr21oj8dO?=
 =?us-ascii?Q?nAqrDoHY2OF7bPOUdmF6Bo86XDOzauiicR0WvpwQJk62B8U6Nb0pAsHI1xJu?=
 =?us-ascii?Q?gFZl+YLSYk+UtJNn3c5h2Y+gVS090/GU3gxg6jkuEk92bL0VfUxAKdtdz3+i?=
 =?us-ascii?Q?dms8iX6fd5hA2P/+acE9Jj8IF65MTpkE/FTC39x/Fgq3YRPigxeCtRQoovAX?=
 =?us-ascii?Q?P2jnoGZZ6N7tqxwr3DQgNwsUq0H3CByjYLzh/yeT72JBDHPv9CqTF+S/WN8s?=
 =?us-ascii?Q?Bv/4BsNhfIIFG7Y5Yimm3kT0DdAMw5TRtdzOizKN0gggMrFYPCH9/hzqZm3j?=
 =?us-ascii?Q?4smhrlx9qbmm1z4K3XqdMpcv+KpwLuT4mWe0/Idct0D9tHuqMfnrI6mwk1yx?=
 =?us-ascii?Q?GDwJJ1Pu1PagA9ppUZ3dEbggGJX8FJAyoH1DFCouXEmJ86EJ3Jm8H57mZVPP?=
 =?us-ascii?Q?o4RlOAyW//aVVHv6/M1qFznBxDvA0s61jyrlsPLDJERAnWnWWxNUa78sRPoW?=
 =?us-ascii?Q?WjGq1oRRClwLw7UmZnQ9wpww3UrxmKwJwBbRFl+hgK09dcI594EAoeTVL/nm?=
 =?us-ascii?Q?uY8NRHs0B1u6BOZAR24MrhgxXO94a6JDBuf4t4Xed//+yRlW3JVW5YO+h0J/?=
 =?us-ascii?Q?xm9Lx5qHlDJmQ7b+nh9Nh9D6DOrQ5qAa90FIKetMSojxtoMkBZ0vm6ujEPCo?=
 =?us-ascii?Q?Q9xuDqy/UceqExmEY5jAI69D0piV3x+wDli1f6DcSU/5JACUxz5BTqoW3VtL?=
 =?us-ascii?Q?QxPH6FpxPfLxihhj8Rc8TYIG0b4DWu5ikaewQagCatjHXyCjcEwn7HhZSmNB?=
 =?us-ascii?Q?Zo/YX93pkcClQiATI4I=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:39:07.9103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2874be8a-ed81-46f2-9ae6-08de30d69f01
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4389
X-Proofpoint-GUID: iw8_icGQhwQaxZxgVodtBRmS0ajbwmBH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfXwnfjCqhVaPAF
 ZIFOzrfnlxl/OZQecltzs4t3xD9U6S8qgALxxmeZh7HnEI8/Lbcc7fRKUhqvcHih5k3FdJDvaOG
 zg3/D1EXeojoHMOgKXO8kd0aI2dKSNFHYtHkAT7LJ0yUN7h6yrAiej/11lPvSzhLTvUJrrXa+p0
 v7htcd/WRgYhK2xbnHS/c0thXkcrp7/sSbAk/dQ81Ogjz2djB7F6Wxqjcf33AYRmGHfCsiPQaqO
 cVr6bqFbSnOV4GjfSkmZWAXsJp1tEaCE2UiRiox2RItGjrjt1Sv2sxhdgXjUUfx4M3nCrxhpRpF
 Swdz+CGM6eUNP7mU6tut+tqxa9k588CMwidY1v6/BDtQPOzAJQDZHIcDgrYhlZAx63Na2RXCzfG
 SNFeNVh6I0bUBXhJrusG+PECM4roeg==
X-Authority-Analysis: v=2.4 cv=FK4WBuos c=1 sm=1 tr=0 ts=692d8c72 cx=c_pps
 a=/NegMjZZPAh+U+cVAxWD2g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=GMVij_U3cL4pjJKsLskA:9
X-Proofpoint-ORIG-GUID: iw8_icGQhwQaxZxgVodtBRmS0ajbwmBH
X-Proofpoint-Spam-Reason: safe

Replace the use of __free(kfree) in _cs_amp_set_efi_calibration_data()
with normal kfree() at the end of the function.

Krzysztof Kozlowski pointed out that __free() can be dangerous.
It can introduce new cleanup bugs. These are more subtle and difficult to
spot than a missing goto in traditional cleanup, because they are triggered
by writing regular idiomatic C code instead of using C++ conventions. As
it's regular C style it's more likely to be missed because the code is as
would be expected for C. The traditional goto also more obviously flags
to anyone changing the code in the future that they must be careful about
the cleanup.

Arguably the traditional approach is more readable, and it avoids the
manipulation of __free() pointers when the buffer is reallocated for
resizing.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs-amp-lib.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index d8f8b0259cd1..b4d183e7501d 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -452,7 +452,7 @@ static int _cs_amp_set_efi_calibration_data(struct device *dev, int amp_index, i
 {
 	u64 cal_target = cs_amp_cal_target_u64(in_data);
 	unsigned long num_entries;
-	struct cirrus_amp_efi_data *data __free(kfree) = NULL;
+	struct cirrus_amp_efi_data *data;
 	efi_char16_t *name = CIRRUS_LOGIC_CALIBRATION_EFI_NAME;
 	efi_guid_t *guid = &CIRRUS_LOGIC_CALIBRATION_EFI_GUID;
 	u32 attr = CS_AMP_CAL_DEFAULT_EFI_ATTR;
@@ -515,28 +515,33 @@ static int _cs_amp_set_efi_calibration_data(struct device *dev, int amp_index, i
 
 	num_entries = max(num_amps, amp_index + 1);
 	if (!data || (data->count < num_entries)) {
-		struct cirrus_amp_efi_data *old_data __free(kfree) = no_free_ptr(data);
+		struct cirrus_amp_efi_data *new_data;
 		unsigned int new_data_size = struct_size(data, data, num_entries);
 
-		data = kzalloc(new_data_size, GFP_KERNEL);
-		if (!data)
-			return -ENOMEM;
+		new_data = kzalloc(new_data_size, GFP_KERNEL);
+		if (!new_data) {
+			ret = -ENOMEM;
+			goto err;
+		}
 
-		if (old_data)
-			memcpy(data, old_data, struct_size(old_data, data, old_data->count));
+		if (data) {
+			memcpy(new_data, data, struct_size(data, data, data->count));
+			kfree(data);
+		}
 
+		data = new_data;
 		data->count = num_entries;
 		data->size = new_data_size;
 	}
 
 	data->data[amp_index] = *in_data;
 	ret = cs_amp_set_cal_efi_buffer(dev, name, guid, attr, data);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Failed writing calibration to EFI: %d\n", ret);
-		return ret;
-	}
+err:
+	kfree(data);
 
-	return 0;
+	return ret;
 }
 
 /**
-- 
2.47.3

