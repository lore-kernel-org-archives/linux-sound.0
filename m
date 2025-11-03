Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151433148A8
	for <linux-sound@vger.kernel.org>; Mon,  3 Nov 2025 15:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182524; cv=fail; b=TxzHDA2Wl2oQIzfDod9ScV7gW6+0kK66wXPCb3dvQ/ltKC1UrPZVWuT10c7qNDpklZ4AKIG4aRMa4whuD7JVCX+EGtm4+r6XND7fsuiK8IFZHMljizJVR1wXZ+HS/mAHchce/4ByK9Dy57qZWYVIHeJ/koWNre42b2rA99pM8o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182524; c=relaxed/simple;
	bh=LPGn5ilen7v8PkXo1KigfV8UKndR7MLI0LmisrMphp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFa7k9rJHQxXh++nPk6HgQOPoPs9EPlAf7cgxkBKahGkxMiqxHJXXD1euf+njO88h6KS1nvkT65RjXTbwF/83LkgDdk8m513FuL9Gsv1yNscP8YGQsWx5pau7Hl8WAjHOrReityfvSJLGvdlAScWeJyaJriBj2bSCk7QY1mY5Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K6FDsC2I; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LVBgX3He; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K6FDsC2I";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LVBgX3He"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A35qbIb2528991;
	Mon, 3 Nov 2025 09:08:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lKAZYQ8s5Ptq51jMVXBtdSc3I4CHNIp3yTBPVppJf3A=; b=
	K6FDsC2IB6NoZve/yYvrSldFUxLZvE2F2Kp3zSspiSD5v2vqbdbNZzrdH49NqKQy
	31ASP95ATQNv5j+sqdgNSc0I8Nqwv6tl1xb7AqofiVM+PKhXOgI5e+vVKI7SskPC
	Cj5tBcvjPJYtsp0tfL6hAx9oxvZ8p3RIBA7t+0A8i0dEgM0gA6w74m6tfZB4RBB3
	Kfkhky8K0TGXGALMRZ8jyxl4ycwr7bwVpXQB+EWrXG3c7UIEj9RjKqBvickwmmg5
	KWn4KCDAHdewC5KD2w8hECiDHsGtGwT2wO+UN7z62NNvhCegZX0foqGMy2Sdk/mK
	PWGTiWDpnF2B+k534HeGhQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022107.outbound.protection.outlook.com [52.101.43.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4a5fkwt69n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 09:08:21 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCE+Asf37927TjiAng15V7lzAAzguBep48CBjyoG5srNv17ePKNQq+ldxFRikZazhhHtWdf9kSfqaUSZZ3INtePTmbMK4+4INqIgVnAz4L2CYvPHFqCx7ThntBY/PRLt7PBEsagMpCBU6OrKqmqanalO4nU/YyRvswFBKGr1qwksa2V057/WVoThIH8DYyiGq1ZwG8rtBmQmZC6zETxs8+ACfW1jXHP2LjdjPlboaUb33uCDUwmNsQfJ/UQepXc3f+IsXOiuKNdWWHDMMAhVE4bR3/W19/lZAOIeb283qQb+VO2aoz1D+FJ0imMGOboOUwng7jdzVjZjFr+6JFZ7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKAZYQ8s5Ptq51jMVXBtdSc3I4CHNIp3yTBPVppJf3A=;
 b=WWcBdjH5gQFw8ugUMN25yGJRI63Eya0/6PZxEZuYM7045+LSeohrO6Xncw1+KiDvApLpViDExXkJ6ubDE3IiHDR79A9MENlO5pksqqEQb2dcj8lhI8ymvvCUDGBNgx3ZaOk0Nms2XU3BmQaZi+ve9az56mh4PtCMWdpMxz81ojpi7oOvZQyBQhVWGJ7i/Xn5a5CMjgY3NZEFY0LdZOoKfYbPhoNf3AAtOZMcc4LOYx378fDop8Uq4eJh+mlsqZKPw7opFycMmkl8ZpVZ73Y7AJNqqrtkHpW1VAoNBjkNdC8UfkQpul4eXkCJFVDgDacPB1/NTpSVXgVYdrih/C2dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKAZYQ8s5Ptq51jMVXBtdSc3I4CHNIp3yTBPVppJf3A=;
 b=LVBgX3HemCTKcY1UiBjO0G5klklNG+4LfQrX9k1rzdS83WTs6a1150WECovSZ9mvJbyaY+Bron2cG2shs/Fn0h8dCqMyQ46DpJLKemEk5lpTJWG1vOgRWDsnhHZloMMqXMadSxB+iOGVyJyb4iyUqINK90smZAR4nkE+NssAys0=
Received: from BN9PR03CA0884.namprd03.prod.outlook.com (2603:10b6:408:13c::19)
 by SN7PR19MB7735.namprd19.prod.outlook.com (2603:10b6:806:2ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 15:08:18 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::72) by BN9PR03CA0884.outlook.office365.com
 (2603:10b6:408:13c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 15:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 15:08:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2CCD940654F;
	Mon,  3 Nov 2025 15:08:16 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8FBDD822543;
	Mon,  3 Nov 2025 15:08:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 04/13] ASoC: SDCA: Correct FDL locking with scoped_guard
Date: Mon,  3 Nov 2025 15:07:59 +0000
Message-ID: <20251103150808.4015208-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
References: <20251103150808.4015208-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|SN7PR19MB7735:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 03b2af93-27b1-4dd3-c621-08de1aead1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t5HFeZ+JC67P11Lxwu2Wi4LQv6RmZVzbsp/CwuTVK0WF38ZzJmMMSMpjyivt?=
 =?us-ascii?Q?hU7OiqNljgoZSP2PvzewzOf0oQV6ZhHU938Yrgq5MV8Qr6X7hAKuntp+crwK?=
 =?us-ascii?Q?Mf6MxKEAo4ssbqyYl1Zz+xBaEBaphVOurubsdXcsECdsAComgJyketwIy88I?=
 =?us-ascii?Q?fW7OM3AxAuBsP8YUPGc7UyJf0uOIeQ1ZrctcxeMgzp+0mcsyNBZrBOrE3OVe?=
 =?us-ascii?Q?gi0ffL+HM/meZfRT9KmA31ptcvychIelVT6/yCRHoM0TA8OqUtIeKrh6Dmat?=
 =?us-ascii?Q?NwtvjKMP5qBdJJ+NxX7Cctcd77waOZ8gI80OOWXfx4+FVScdEmcKcA4YnZYl?=
 =?us-ascii?Q?4F2+AzIA8VoPi5ZjSrGRs+12esszuHWHDD+GaYOrk7THFCKXSO6r6ODZVRUt?=
 =?us-ascii?Q?gR210j9PfJxHuCgw1LYpNvUcRJjAQCipWJqGUHotzk8CDNFw2s7VyabrkY3u?=
 =?us-ascii?Q?Nu/Loq8gv6IXvxi8CyRUToieYCopPYXg0060o88L0xsf0yoQn4HfHK4lepaX?=
 =?us-ascii?Q?2V3qt/0BHkGeo1x3aDlIryQvCkkpVLZEpwY/qjuoe2h/MGW09MOyy8ftwGnE?=
 =?us-ascii?Q?DwZiAJ4g7Lj65Yl4YsW9t6DqtSXOaHQhUbyI8NLCOfZEv3igWhZFqs7nSIeV?=
 =?us-ascii?Q?I0Oi6OfVmbbWaOvmR2nanYpYYQ23w3oqUdmfKnLUzxM6N9TIhsP5AP7FR3kV?=
 =?us-ascii?Q?MS/9Op9rt73vfvcfM9009tKmM2GRxKu76VJjH4HtV1sMpD5/0De9c1zsLzuC?=
 =?us-ascii?Q?iwv9CA4pN2g1XZN96j3aMNL9248QORQRSKUz4ieE1Xjmnc9UWOrNOJEijAlQ?=
 =?us-ascii?Q?pWQFzy3xQQ5M7AKwXAwdQRyPZC7LhTpFkzEPBF4SBSUKGqW1mYRNrp3X+22q?=
 =?us-ascii?Q?K3RNwZsIsQLzFwI0K/Vk+CGoUe2F5XX25+/3J4qm+z1kQxWsJUjrVpWLa/Dl?=
 =?us-ascii?Q?cYu22nAazUh2mO8T2CATc0DV3I0X05VC2gyA3JO8jdnWw39Vh+T6o0Nnp/fA?=
 =?us-ascii?Q?AJIMVBed2pqmiuRg/kRF5xdjeBsWIIOG1nKC+zsAbK+i9z+qAhhZfLdOzV/U?=
 =?us-ascii?Q?+YbvmOKcPe4Ihzz+GVeVDMYdUVKH4hteGPa0Yq4Zoc56uEvsYnJAxg5NMyFp?=
 =?us-ascii?Q?haJ7U6+1X3ZhEzJnVOO5GaR3iOS80CZrXE9Q6ROuniuKz8BEb7pjPDfoiVJR?=
 =?us-ascii?Q?AtncEdY9zArnlkJMPh8dfhCXEAIOLtAu+NKkj5tTGUdFMcdTZu05Md1Ag32r?=
 =?us-ascii?Q?qwmW3qk5EKCExC10M9ajyXE2MfAaHyUIMKUB7hlVfyCPOpCa9VwppgE+WbIZ?=
 =?us-ascii?Q?E3fZF1PAXKRzZqSNkgtFCtMDZ37HO4wHOr/KsM9glDmARwloMT22ANjgZc7j?=
 =?us-ascii?Q?IMpWHE6IaHw6Nh59k4WhfgdINPjBLm2Xs1yfXuUAtViifiKiKyQz4HENy8WC?=
 =?us-ascii?Q?CzQDFbJvNdEMq22Q2yqoVs9/h6D1GJJOMRI4mHXZA+V35+ACTvC8xEXD7PG2?=
 =?us-ascii?Q?hVkJ7ZOBQpElSKYT+uragKCVwagkIk2jWkGs87EaDUPzLY/cprGDTOvSmGUa?=
 =?us-ascii?Q?/fpiam5SNKizKf2hrNE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:08:17.8209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b2af93-27b1-4dd3-c621-08de1aead1f4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7735
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=6908c565 cx=c_pps
 a=sUbwXUxkMQNSWKNRO95rnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=VGyL4Ep1fbuEhtY0TiAA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: S9igY248fl4G8qff5-ANlgzTfk9RaT8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNyBTYWx0ZWRfX44U6iIkgFPQS
 pzFBgmfeQJy17VRI5h2CB2b7Klqngr2rp1ihZ9SZmN7Y4vp4nyUI4tga4euvxxfGYl1hc66IwTc
 qzJ0CSX1s8U3sEEE9Vdd121oCwNLqjIhRod0p/ByKdw+ozJX96N0QsbnErrpO7u3g4fss2zeNgQ
 u8DJNoo2Ttt2+WCxwJEWoRpzRiFMh9dLFzC7IWYiwEWaNtio0FZo9rVna7UQ/eJJxR8bOQBjSPc
 2eHv03WA8VnaGwnHWCJ0LdOk9Ma0vT6HpT50anPwXBngf32mQwQb9PFVSO01+Rnu5VSNIKqcJH3
 LqUPE4NUyiBZvzyccMO6+Pl7mgePHlFbA60RWtMwUwBuA3mevD3q88EVeaTo7axmkp2evEEJTTB
 A/wqvsYWqBb0bCdd8m9rts0Vzy2SMQ==
X-Proofpoint-GUID: S9igY248fl4G8qff5-ANlgzTfk9RaT8Q
X-Proofpoint-Spam-Reason: safe

The current locking in sdca_fdl_process() locks over
sdca_ump_cancel_timeout() and the timeout work function takes the same
lock, this can lead to a deadlock if the work runs as part of the
cancel. To fix this use scoped_guard and move the cancel timeout to be
outside the lock.

Fixes: e92e25f77748 ("ASoC: SDCA: Add UMP timeout handling for FDL")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 sound/soc/sdca/sdca_fdl.c | 90 ++++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index cb79dc3131b82..fe0ef2df4d9eb 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -402,8 +402,6 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 	unsigned int reg, status;
 	int response, ret;
 
-	guard(mutex)(&fdl_state->lock);
-
 	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
 				      interrupt->function, interrupt->entity,
 				      interrupt->control);
@@ -412,56 +410,60 @@ int sdca_fdl_process(struct sdca_interrupt *interrupt)
 
 	sdca_ump_cancel_timeout(&fdl_state->timeout);
 
-	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
-			   SDCA_CTL_XU_FDL_STATUS, 0);
-	ret = regmap_read(interrupt->function_regmap, reg, &status);
-	if (ret < 0) {
-		dev_err(dev, "failed to read FDL status: %d\n", ret);
-		return ret;
-	}
+	scoped_guard(mutex, &fdl_state->lock) {
+		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
+				   interrupt->entity->id, SDCA_CTL_XU_FDL_STATUS, 0);
+		ret = regmap_read(interrupt->function_regmap, reg, &status);
+		if (ret < 0) {
+			dev_err(dev, "failed to read FDL status: %d\n", ret);
+			return ret;
+		}
 
-	dev_dbg(dev, "FDL status: %#x\n", status);
+		dev_dbg(dev, "FDL status: %#x\n", status);
 
-	ret = fdl_status_process(interrupt, status);
-	if (ret < 0)
-		goto reset_function;
-
-	response = ret;
+		ret = fdl_status_process(interrupt, status);
+		if (ret < 0)
+			goto reset_function;
 
-	dev_dbg(dev, "FDL response: %#x\n", response);
+		response = ret;
 
-	ret = regmap_write(interrupt->function_regmap, reg,
-			   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
-	if (ret < 0) {
-		dev_err(dev, "failed to set FDL status signal: %d\n", ret);
-		return ret;
-	}
+		dev_dbg(dev, "FDL response: %#x\n", response);
 
-	ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
-					interrupt->function, interrupt->entity,
-					interrupt->control);
-	if (ret)
-		return ret;
-
-	switch (response) {
-	case SDCA_CTL_XU_FDLH_RESET_ACK:
-		dev_dbg(dev, "FDL request reset\n");
+		ret = regmap_write(interrupt->function_regmap, reg,
+				   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
+		if (ret < 0) {
+			dev_err(dev, "failed to set FDL status signal: %d\n", ret);
+			return ret;
+		}
 
-		switch (xu->reset_mechanism) {
-		default:
-			dev_warn(dev, "Requested reset mechanism not implemented\n");
+		ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
+						interrupt->function,
+						interrupt->entity,
+						interrupt->control);
+		if (ret)
+			return ret;
+
+		switch (response) {
+		case SDCA_CTL_XU_FDLH_RESET_ACK:
+			dev_dbg(dev, "FDL request reset\n");
+
+			switch (xu->reset_mechanism) {
+			default:
+				dev_warn(dev, "Requested reset mechanism not implemented\n");
+				fallthrough;
+			case SDCA_XU_RESET_FUNCTION:
+				goto reset_function;
+			}
+		case SDCA_CTL_XU_FDLH_COMPLETE:
+			if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
+			    status == SDCA_CTL_XU_FDLD_COMPLETE)
+				return 0;
 			fallthrough;
-		case SDCA_XU_RESET_FUNCTION:
-			goto reset_function;
-		}
-	case SDCA_CTL_XU_FDLH_COMPLETE:
-		if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
-		    status == SDCA_CTL_XU_FDLD_COMPLETE)
+		default:
+			sdca_ump_schedule_timeout(&fdl_state->timeout,
+						  xu->max_delay);
 			return 0;
-		fallthrough;
-	default:
-		sdca_ump_schedule_timeout(&fdl_state->timeout, xu->max_delay);
-		return 0;
+		}
 	}
 
 reset_function:
-- 
2.47.3

