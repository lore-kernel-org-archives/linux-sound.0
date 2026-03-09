Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BA33D6475;
	Mon,  9 Mar 2026 14:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068003; cv=fail; b=Dx5Bjqe2uZORPjHK3aySbNi8gOtiKoIcB3cVL3KOTfawKtwDyxl17VOxcRiDJp08vQ83sh+tIAng3cX+YzfgZb2HiOz462z0wl69kBcdoskW/nSYKMBmiGrOReyC7jby9+KWYP+IjyN8lfibw83pAuHNn2t+G7kxrpGlUFKZIy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068003; c=relaxed/simple;
	bh=YlBGBHguQFz8oeb3yYWGBrRYrMF1KQLX5NSHNZkI/cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JEUH62TZ3/I2y2G9zS/Is9NsID6mE6vDtX62D9pGzuO4zbgDADLMwPZBhFDnyFyEeKpnVekowHL/OncZ1/DTUZIQV9BhI56APMhrMhReihrrNZvql3f3hsDyn0aeRm4mdjfvQbvBWUv+YiQnjbLWTJME01zJkk10pfXbykyD28M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=U/NnCQA8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Uvw0n0sD; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="U/NnCQA8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Uvw0n0sD"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297UJrO984806;
	Mon, 9 Mar 2026 09:53:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=p6ucPXVlDuTlj9z0
	Uz6j5jlc9ZtYDrTu86oKjzcBFvc=; b=U/NnCQA8wQTY5El9jXK8RP7wL4xtGCyr
	aB2b39CJ5NH9b/xzQ8rr/YDsTaUsnYax4aQ4s8peH8QATiGCePB763Xq5za3kShM
	W+p2NwaGTcTc30QRng4+fB6vHjIctzhBLVrlASPymhzRUkUq/unEADTHZCiB0SKH
	9kSqNnWauB9TP99Y4N60FjGrgPubexNb2F6amvbNoKdIGByuLDT9uCtI7iyjtBVM
	ItOgDwtcb1YLj9kFXS7itExBKWJKX69ujgvCDEntMOSUqlCZFG8KDWOqiF8Wiz5q
	JsHhTktOCZvvbHwUPvzk0jkQyrPeGPTj/F9kmmyR00f8ReCUR4lb1Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021095.outbound.protection.outlook.com [52.101.52.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja49x8f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 09:53:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqZ1qGGCmo+5Q/olYoE94k4LUJhStm4/uvyTkeiinbsItWZCrEldSQzJWARPO1kLyfrUsAFQFzRwUISz+3Ayr5Y48yXt8+zIcq0Z/PA7CfG8vcVbs1mcpgPYg4sAFidnAPGNHJZ2O1omhpxsi728q5ry49MPvLHEAJcze62Mhb9PlMQF6gzdcDc3B6qLxppTHnAvBeSJarhElnUaUm0xfHdS7VpDqe0Z9WBIVuusM+oSCtszjC7WAnIcSOyFD2hWJqykVMUYig94xWfcTw5Fbae3a3BkolMVLQ6zoXZQhLiB3IqG/WAtN/o0jgJ+/zbUSZDtkrFBYeFikXXs2MpfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6ucPXVlDuTlj9z0Uz6j5jlc9ZtYDrTu86oKjzcBFvc=;
 b=QQQQVLX19vMN68EVyxq7ETH+qdPVT/2scZUxZSbFCAfHq7Qhn7rnkw4ZfhTaT6bhcL6z8Ti+RIuwDe5LtIvtoWjKXNoRki10+m+drAHDByf1PPeZ/6kPIfxwH4LwB1WBlUWFVDOv82JZr3cIHFlRnux/Ffxi6DnS90oFltLNv0vb/IvLvyMeWu8r3GZRjg6VqU/Fw5Dl5+FE1C86uBOQyYdstiGoSlYV3q+rjFDEgzGSBRUhNQaVGkh2vD1qB8n6sDW7cTkVOaZ24ZeKxUHOM6AsIVuX97IaqT6eOSCTnrA22mtm1sbFUyNWKBS7eW7xYcv/z2fQSA31ke0DP8/rBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6ucPXVlDuTlj9z0Uz6j5jlc9ZtYDrTu86oKjzcBFvc=;
 b=Uvw0n0sDuvC/JELjVxpoe7+ieX5M19C7ULVhFSbdkk7Kot3O2uL90KJFc84PnnDYP7NafEY/NctRdIgcUT5u/BE6jmUZheKaNFDpy9qhR4/sAlFlJ7gpetOYKfGPDlVZUpmx2EKrb/7/L29zaScjvwwLFrjygLGGhaXR5drVXt0=
Received: from DS7P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::19) by
 BY3PR19MB5139.namprd19.prod.outlook.com (2603:10b6:a03:361::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 14:53:13 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::d0) by DS7P220CA0027.outlook.office365.com
 (2603:10b6:8:223::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 14:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Mon, 9 Mar 2026 14:53:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6F5A7406542;
	Mon,  9 Mar 2026 14:53:10 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5578682024B;
	Mon,  9 Mar 2026 14:53:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm_adsp: Make wm_adsp_fw_text[] const
Date: Mon,  9 Mar 2026 14:53:10 +0000
Message-ID: <20260309145310.1199583-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|BY3PR19MB5139:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f226f29-c18e-4f71-d017-08de7deb9612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	8Hjb1IzdOBRRd+K9Z1oEJpfuNAgpeKpxsSGzH+qTx5n2Kr9eXTfUwkCjnlnI+zHZDrip4Q02SCQbswE2IQmMa3N9m9gRx72DtlzsFHP7gbCl0YO6mgmKRo7N29AZXqqFrHCLWoOz3M2h15tAXXTaQ3HO2XMeI6iFzArwl2RFTYPSBWSnt08c0PpM3C5Z1sttVb1sRxeKwvuPT3Wd1KT1rq2sufjXE5XY5vCJiL7zq8E8+if4AS6cMtpa/GvPyJEMOXD860etiibV9s6+Y+77yMvvzp5OteTrlyoWDmGkeLMbtd6ssl/wRYK4TH7kJ/cS/osIHru9r9yuX7qQ8kPgPpQfGoAwJ/arAHMOfNgvZJAvEFtMrCfBid/AC8XgrZGqI/SqdQsVRNCeg7+x14ykN7m5JdJQAG61KuojfReXfQwNFjLLoP3wlxODYkofdS5NaCuaxVHb14NG9yfSZ3FRvInhGVyFKjCU15xQsgA9JiejbuhJBFB1B3doztXWUb0h9CrK7TX6PmI62ZYs4o9HM9So3yEFPMEwBj23pW2c7Z8iKZ2yzpaAbrQhoqDpuZyVdTPU+bhAizf1VGSofP8/F/YSpF1MEUCZ/5pL+GjY4qcd+OW7GT613Tj5Ksr/16DpuYUp0bonMspC6bPQYUAdZCuuFVTz9bPHb+RN9lMhHQvttqM4Yd+tlcRGbxnlzLAkmAYqgAKhgxPHzeHQ+A/YPNt+NM0QvhUyCA+5DYi8+hnl0pB2m7qoy3Mz4AtWJBYesz7JQQbNTw1d4odPY5cX2w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0VCujrCl3KyAaNrYU5BsC/QDk+2IcZ5JI+pVO9fLojCMKv3xA5gYpLNmYLYvTIc1N8W4yy6igbJeBkA9p3CgBKg3dFX2u02DQ84zwkdbKV5fe6YDayZbCLq8bGdJEpGVtRYYCyAPfOHy67g060nKKI4EohKx3JLaakZFkN1er+DvPbbvJZ/KGZEu46e3Vc26X8FxHnmQTCboSCeewGN1ow4xGOMzD+ukW2qURmQDEBmrsw0DUsLvAPqdZ/8aXrzGqTLJVExzflzNQgz0Z4kMARDtTadpD3kbvkWQ9/w4k3hwqesYpfKAiGp7mRWh/QrytrPXF/bQZFWXyAxgJA2TOnhCt1rZz4EiYqSub2nnda/mKaiqDCW5SpNidr9J0JWdbqP77WrHU8krX82K0smagLAKQfd26yngBX5z6o6aMm+FlfS2Vz0IrTudJ/ra+uDv
X-Exchange-RoutingPolicyChecked:
	TPHnU0GXv3zR3L8CsxfyZGcGouaDX22dtw1VACqEEXmegBvnA6SCeLp0N0DINgRWfcdPntJrCYux29TgO5Nn56XzPsFxgVEWFln6tth8RLRT5KhVJ2KXSdrBiplzB3pjlTn/0wlckI+Se6U3kpIIRUnKMwWPN4wPjR+g0IrX1qdqgpUMHz+3vFRg86V8q2xKIshZzWLa63Swz8DUtfjJFbuipqr8X8hiNZKzQIQNwGbB4XgMyXEKj+zVErxOhOhQoVatOvTRcbQcGDG30CgQ0EE5/yjAPHk/5VX06S8m0ostfdztTKTMblmSGQ+MG0onWTCXMatbKTGIEp/QQmADCA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:53:11.8929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f226f29-c18e-4f71-d017-08de7deb9612
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5139
X-Proofpoint-ORIG-GUID: t9MOuOoOu4aazqnTgaiJizhDEevLo4YD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzNSBTYWx0ZWRfX5AdhAv+lZrux
 SbYO0OfOEH4okc8eA+TYY1Z6KUnrbcZkSx+pQJWAHp77xNK38nB6YJETRjsVuw1uL5pkuL8KuoW
 usWVT60jvAqI7yREFrwcCiMfq5YWZ786IJFeVLE3gtvEsXC/HWNiX3Xx9uqH2k6ETFOu9dxXcYI
 AXRpLzzK1PUIUvEkmY+VPJXZFYb2uhqmxJrmagrGNbDT0z8zFyQqgohAlsdv6GdFodHWXyTeqJJ
 b/S1e+nLmmevrfYwXxK2Xhlub+qcoLf0FT1/zYYumqpiTmVwMa3KCH+pSBPybovp2VNvNxsiE1Q
 K5I+b4inzBfdQPvdxfk5bKc3yKjIzKd+28Ig28MLkLZ5jXqszz3weOvhKMza/Gf/8GTzju0f0FR
 FHhtD6lwjsTaL9mLXTxXf7qH+vmwXnATT+ZivV23ECjek4cqm9s9zSt5kGdB9Hyo5kUYZxNY64k
 nuIN8EYJ3JPyqacZKtA==
X-Proofpoint-GUID: t9MOuOoOu4aazqnTgaiJizhDEevLo4YD
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69aededd cx=c_pps
 a=bt587MfGbFRWKA+CNGb3fA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=bWhJIhqw5H9CDD_3df8A:9
X-Proofpoint-Spam-Reason: safe

Add the extra const to wm_adsp_fw_text[] to make the array data
const.

This array should have been const data but was missing the second
const that is needed when declaring a const array of const pointers.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index d95b54275b5e..f0aa6e3a1cfa 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -72,7 +72,7 @@ static const struct cs_dsp_client_ops wm_adsp2_client_ops;
 
 #define WM_ADSP_NUM_FW      13
 
-static const char *wm_adsp_fw_text[WM_ADSP_NUM_FW] = {
+static const char * const wm_adsp_fw_text[WM_ADSP_NUM_FW] = {
 	[WM_ADSP_FW_MBC_VSS] =  "MBC/VSS",
 	[WM_ADSP_FW_HIFI] =     "MasterHiFi",
 	[WM_ADSP_FW_TX] =       "Tx",
-- 
2.47.3

