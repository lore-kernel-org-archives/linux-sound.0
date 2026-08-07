Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24745345EA4;
	Fri,  7 Aug 2026 12:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104903; cv=fail; b=csVs5rTG1KF6ePPXVw5eAILIbrirU51TneP5ezc9tJTqjfL9JjdtDxy90ExraARGuv+yVWFLLz+7N91I7qJqiTvS18h17/Rf6FRH9zQ+uEzTkQ9nULnGxrG/+phdvkE0cE6J3ppJN4/lUKdF54QgGrHYVCJgdho4fKpB5FWgBTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104903; c=relaxed/simple;
	bh=jsWp0WoyeW0D1k48JJIAzEkOu6cdt7nBLDP192hRsqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sVim6/1cSKMfbaE9yitNQTEaF0g+gVfdOokb3PJtVj1UWOYCbH845F1VwuiFv/PPSGRbkboGPR6frkg37+IWxoazpzcpHdinE/Jn6NplPKLfX9Lfr55w4m9VqylaiKqEkwABCegsZjfuHkpRlJGHo/7eKRVigzTdtC/fYxoxYXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y0T1D/iP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=H/Ubsw1U; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y0T1D/iP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="H/Ubsw1U"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6772YhK53719720;
	Fri, 7 Aug 2026 07:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/yecFgamO2Z0pfSo
	6Vw1gC4mLjc7Z3TCJCsGRcOWeQw=; b=Y0T1D/iPK+ad1ZEotsomfPwKUryC55kQ
	gf96ZEZh7A+QojfM7bBv2uox3hQSMBNxb8qadw/VYpKyE8M3hbxUL7QBShfXUl/g
	Eu0GYbQNY9GB9hvJfHsyrjOwNZ2FsuuoH1IV/gnApf0wnrcpHHS9s+9VeHgYglGg
	lp76fP2th5E/XX99+Cnx8BtU17sVQs7UQgcm70SXa0w2UXGynQND56gnsTiXBknG
	+epDxqDgwB6c0jJ9Mtvf4fYdaXxwhd+HzYxgV6GkzGJ21d/nO5SbkNr7+24ZHeAx
	SFLUlng/OrQx54nLKC0/K0D2yoBZSqN3bEd0xNkn3hGCCZj5i3DN4w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020119.outbound.protection.outlook.com [40.93.198.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fvxu69g8h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 07:14:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5N1KNFv01aKSRln9UokPL9C3a4hau4WtvEWuIy5C3P7HNtksV/ZqvOn1ye3l6kqe+VN3qGpHtm5QPUwMnmuYQeNFAMJxf4DGkYHhBjZ8MEFSlQScjaeHmjNpfcWtXFd7rZcAjoTXB/WhgGuqlbsjVCnGmVXPmUH0O0ES3PmOHDrFAT/Hq842wL3kYlZ/qSgICNsbQjOuA0Twn4d2DClolbF4pSmwv5/KsKwh0eKGuNWuLN6H3ELEotPWxLFY5eEteR+b//okQldTwMQkIWbX3Pzc6X6FWHMlLv1Lv8nwuVsi1zk4K+ca5+yX1IBCQsXpPdzum65xsXeNbdswr4NAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yecFgamO2Z0pfSo6Vw1gC4mLjc7Z3TCJCsGRcOWeQw=;
 b=De487F3uWnimY6BsEUnqHBHXqFGFAxpuQ8gkFGviY8GkvZSddABCbc7AbyILW6qOK8qEvK0VAvUg79xyKdQM51aLuZKSqY/ePeVB9wS/SNpZK2gRSlO0TdxRrq9LZabe7BGjBh6fwowpT0qvTvcYnPeIB8g23+NRlaiydytFoVS0MFdoU8fOn3sTM0h2J2NPILA3QNpbMMEDSJ1nuwsaPqf3tsfBLrLxXZY7mPriEJp7IrdNDB7mAI8mIXyY80YnZnQ+o/UPouZK0Ly2y1zsxxSX32KjV2IJukqqzlL87MLQkZhAUNujnGAo7bh8fkBQHjepv0ShALZ1TfB+MAb6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yecFgamO2Z0pfSo6Vw1gC4mLjc7Z3TCJCsGRcOWeQw=;
 b=H/Ubsw1ULf6zooWCm9cbCadsDwmQpWljsrkiSghN6VWKFGWtM9ct8EUGPWgUWQzBxbBf8Jr3WUR1PnZ9XrbVPZB+Wqo5tUpWvcXrzpWsRHnl6UIlQ6l//7TuZipTFPZe9hVd3OsvNFycpdAy2Xm+SjTrcdDZiOwt2eKkstgkWq0=
Received: from CH0PR03CA0401.namprd03.prod.outlook.com (2603:10b6:610:11b::35)
 by LV2PR19MB6007.namprd19.prod.outlook.com (2603:10b6:408:14c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 12:14:31 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::7c) by CH0PR03CA0401.outlook.office365.com
 (2603:10b6:610:11b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.23 via Frontend Transport; Fri, 7
 Aug 2026 12:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 12:14:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 80C7B406544;
	Fri,  7 Aug 2026 12:14:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6842482254E;
	Fri,  7 Aug 2026 12:14:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Asus ROG Zephyrus Duo
Date: Fri,  7 Aug 2026 13:14:25 +0100
Message-ID: <20260807121425.1952003-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|LV2PR19MB6007:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f8d4e120-c945-43db-913c-08def47d6f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|61400799027|376014|56012099006|11063799006|10067099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lqw/HEALKlRQjN0PTlkVVyWQKkrD0wrx/AdvryY+jMequYi75AaxuVGF9RE3yMInh1374Lfcmpc+diO/YDogRvUb1AjxtBtYGIF1CuL8UgtzvoB0xK/911f0pkiKynu+TwftBG+xnexIFRV1HVE/iZD8yivej9rF2DF/u1QtzeiFdBPaoD9ZU1Iwk+4Z++HeYwr1wPAQpxOFnNMm47aors/B9Xe+53agj5hrxtZsl2ZupuwEb2MxPnfReGaErATysKgXmBPrspDzAThNgB5pgulRZslyDrGPDxTnAS2OfDP0xI00k7mr6uxHTxq5duPv9AoFFY3TQ0lSH4HnANLdTL2pbKp9ZZj0bIXBbFG5UmAjq7h+CC7AmH33gNpp/c1O+GIlEvbOI3Yq4VbqQwnw8sZs3iqdJNWOqI/Kc9SE+fw9PvYt437I8rfu/0mrMYlzXG4f3sq6bDUArTELjm6qpb8dPsVKti2LIe4y0jFeYMQ3t53LUDZQ9VfxDQneEnxn4tsDupflrOTfsg5YERGYVKiN+fGkyguobT2yDmAv11z2AyhZaS3vMF7MFdWw97V81FoHwZNnKzgNSj9VZzQDG/QLwlm8up+w3CX5SI5992Y94SEfP6DYL4o6sPZlTEDZB4lVAfYTXjifS5mcDKbh4++wfvbNj/O7f/UV46vEQT1+vOMVHe2qb3XAImOJhO2N+ImOvI+n33zSMg50Hk8lqQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(61400799027)(376014)(56012099006)(11063799006)(10067099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	35AKsonvLe4VtnY/0xx6Fvn0sq0LhZj3d8dt+tmStdsrzQ/f0CWWFoOpetVtLRil66lPenXoq7dsvT+cDizK8ZHUEVPrCV7Wau+4wuDs8oYLOATFYhmvzCu40rve8QU35xpOzb/rbAqAYQp/THc6loTKqOr8b70mLaAv/02sXzjL+XDVBNm2UdegcQ/8HFdab3aEs8ouRY16yRcdQKThKgftpwT6gFRv4CzikS8ZrIDJhFAvfgRBmXKUfx2lLAzPCU5bojerZTBH1jg6GNraKnM/ah0v+STbBUzh/85WB66hcPoYk9ufr4ZDeRy4UPaOy/QUuu9iXqswn8jVzhHKDHxdFtUBnmjftuLnOWsJ/YpSJM6X+XUqMoPZNHF7ocCj9sdS5VW9fG/HabZk46ed4jMMzNlmwq61V/qVjPtyrR449S5r4wB0EwobNNcqfOUv
X-Exchange-RoutingPolicyChecked:
	geKDYKsBz83ppSyx2iFglLRbutykDvuac6dUotuI6iV7qpZH9ZGL48/vWGOD6DBghy9iwNceow5Rd3y9l1InGk8e+5StRt+GY8N79Bi+9Fo8RpBWXyu+aCZwD4Q9e1KaSCguLn71gNnXA5pSeLDgsBn57GxhJ9ow7o+CyL3R2UHxulDY8EB7rHRDV3ipXQduaQajMTQsxkoR8x34m9Bac+DIMFK/AdX8WoQJLZFgrhnzDxB+O6BF/fCS2TTf/9p+TBayOWUX3qHu+N82ADo6+S27ZOJYuLGv4xIUtu4kI3YVIQ2Tj7Tt4/7nKqCfbunAjHLOCkSLB0a/SCCNbt5V8Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:14:30.9878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d4e120-c945-43db-913c-08def47d6f84
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB6007
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5NSBTYWx0ZWRfX5bz94363F5EF
 2Po1+db2PWoDyY/sXECKYlnHmlRQlHblMoT5jpZZcl/UWsqsiffwW/8OH/0YQMjz6iScaBnP95O
 caEitVBdggUQHdTwXUATSF2mSA5OV50=
X-Authority-Analysis: v=2.4 cv=JurBas4C c=1 sm=1 tr=0 ts=6a75cc35 cx=c_pps
 a=su6dv7EX1thkUT4YzH3YWg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=pAsLfGwTxgLzXW1cXkkA:9
X-Proofpoint-GUID: cllrEuRMRYGgHe1uOtTh3BU-IioygIV1
X-Proofpoint-ORIG-GUID: cllrEuRMRYGgHe1uOtTh3BU-IioygIV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5NSBTYWx0ZWRfXyH2I6djoeNBT
 iFcRCHlx844+E6wubHV8rfa4605hd7patEVNsqXNmhaGCh6JujIxuycax5luDwRq9dvx8CKjIUq
 s95y3TmD4+fngKF99y8K6QOt2PYS7JhCY1ITjirIpakN4f69u/FKPiqB3/LKZyO/Z85suuQafiV
 /hRoKoHSBX+23MRf0ZgcgT3OeHwbVct0GIvQNqkxF1NXWu2E/W8cqw7WDryU/A5+e7Ve1S6IDEs
 X6Jqz9ujAeU0EpI3hgRPPaHW5ny/z70UrRgDzYYbIXIIZ9XUZAQlhuL/H4wyssBjWuh76RD+jR3
 XSYruIVwR74YXVsVKZ8EvgWA89mcxXN205k4p36MI/frOpe+80IdYQFHcz/GXVzlSI94AIhx5Ig
 2A8Cf3BZkXsHJqk3rzKX+VXvVjdUmBGElp8gCZNH8sjUN946U9MEzw8XPIpmnrV71Ro+xWRMsqN
 gv1/RZPp15x2Pi278AA==
X-Proofpoint-Spam-Reason: safe

The Asus ROG Zephyrus Duo also has a Realtek device in the ACPI that
doesn't exist in the physical hardware. This confuses the machine
driver into attempting to create DAI links for the device. Add a
quirk to remove this device.

Suggested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index f738e547a1f30..768255dd12db6 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -193,6 +193,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)ghost_realtek,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_BOARD_NAME, "GX651AR"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
-- 
2.47.3

