Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A82765DF;
	Wed, 31 Dec 2025 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178227; cv=fail; b=LYhICnbHzwwsPkzDw2lKJrk4cEnlFQRJaKKyu3T2n2gMJIRb+v+bHKWDQmrr4c6OlnrO7EbIkPPcMVmigJgIHlJ0GibREr44lWF6w2n2fxHPRiQrY3SpZDY9z8eHLBgM2CT5x2NF1vyiRDM0oTK0Et0TaRrB3y+mKJx6OnnWVCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178227; c=relaxed/simple;
	bh=V8dBQ8SAbg8cb9oJRdHAzXUy508tle77pfNR3wkQejE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KxiVVKgu0VdKHRu+hFvlLO57jEPT5Gh1S7bIrDkFZWNaZJJcwwDL4dncTNiKzisVXX8sfJbkV7u289BL0oRXI7pOWaJz++3kV1J8tmUGD6R8mOgWOyxK1g53tKo4qI05dDakPdAnFD5/IaA/etwc3Mmj7wwAodd9OGwYVAPKZW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Uam4uwjE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O4hArr6Z; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Uam4uwjE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O4hArr6Z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAZRCX331591;
	Wed, 31 Dec 2025 04:50:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xWy4L7oNRD2N3vH3lGNflrULEGRmEB2ZK7NiG3TZcB4=; b=
	Uam4uwjEJNYueH+GXhgf3XpIjfihCqArPs+EsKtTva9sZq92ZPd1hv1itDFDtW2N
	okuj7KMFyuNpx83lJ9kLdrL38OWKg67U44bzKeKH7AEBNCobNbyjXmPF4VPgv1+o
	1Q0RqSV2aJv2zlM6ixS8eRCn9CeQIXr/3vv+zaXjCvuu9r/nKpZ/1lT9yxofdEo7
	tVnRXzBqTJPEd2M4XIs+SJCNYZVoWyryKTR381my7y9rQCpnMiI4wzsvsengGJ66
	oXL9ODrk70Y6Smq6n3TjJsTUw9K1WDZ/hFBY+4lpdn4du+JmY1Td5sga8ZUBp03g
	jr2VvHb8SSc/A2QrjtQsRw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021117.outbound.protection.outlook.com [40.93.194.117])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3c1q7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 04:50:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqywBRDMWn5xFXs+KCazRnq9ajb6QH9RedPEoVikmaHlOwE/Ql3d3fIZDVFOoXoOM3dnVdQtnlJKUlKIsFn66lVf8ZY6aQgPgyvxaf6IfZk0kd0w83YjUI6eWoUEiGF2nLl1FvyREvuiRtiD4sxGfqKgEF9ITfWcGtG7NtS3/wpbpJYtTrFBP+sm351LIgwYdQn9rv2jpuvKgCV8zx7J/q3pkekzTCXS6GziuubG/9w/CXPFu7XYULW0nPD1+Oya4uHqqlb4zDPVHnRCoOL8RcR8GtkfWXyWAM9jNUQ6xD3QIZXoIxGVXbHy87WZPWKkOEUvozWSQCzSjccqR9P97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWy4L7oNRD2N3vH3lGNflrULEGRmEB2ZK7NiG3TZcB4=;
 b=ZKXe1RvdlyGoZyt1dWJsDZv9kk8RItVRVSjAt1HYw/F7kk04Rl+k83B2mHQTgZ1rICIN+yP6P4uE7cVUHcpC+WUyTVnGyqdtkQ6vSWzlJHdh9omKBmNFqT8Ue12mIWuABe5NkzZLx5gPi+VzIqQcOcQMz2lIyz/GeJBj3UU9aJTU1DVTdRITIiGpxZutHKSaZpWzDM3Uz4LWdC9rBRIp7SYCflgJhlpkAv3FF02hELEGVLTBMUxxvS5RBLqK0PhV3tlxU+lfL6zfj6UhMqiNJdquF267BU2RJ3LQRb82GJ5uTxKnX5niqvdynsxCC6fXiE5Z5CsydiMv6f8U9M8NPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWy4L7oNRD2N3vH3lGNflrULEGRmEB2ZK7NiG3TZcB4=;
 b=O4hArr6Zt8RE06DXq0Tc65xunDX9twfQes0+QGxKNXTqUiRM4Q05kuXoP4cqK/4XuT9UsQqzuDKNBFPZmj8+zbu2vlT3ShW/wh5UB5d+Etvc6FRoVYFYgCGHcX7E/a6hXBKzXzoA9PbieY11osaRAwrJxEQy8q4DP7SUHLB9tTI=
Received: from SA0PR12CA0025.namprd12.prod.outlook.com (2603:10b6:806:6f::30)
 by IA4PR19MB9137.namprd19.prod.outlook.com (2603:10b6:208:54e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:50:08 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::92) by SA0PR12CA0025.outlook.office365.com
 (2603:10b6:806:6f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 10:50:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 10:50:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D1070406544;
	Wed, 31 Dec 2025 10:50:06 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 78B4982024A;
	Wed, 31 Dec 2025 10:50:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 8/8] firmware: cirrus: test_bin: Add tests for offsets > 0xffff
Date: Wed, 31 Dec 2025 10:49:56 +0000
Message-ID: <20251231104956.449696-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231104956.449696-1-rf@opensource.cirrus.com>
References: <20251231104956.449696-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|IA4PR19MB9137:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d676aa26-b88b-4508-fe05-08de485a5d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/zpXkeAacg6eNk2sOfe736TzPLo7JpoWRIY0lwzYRClnkU3wjJdFBV2RVUAx?=
 =?us-ascii?Q?2/CmuF/XKYPsNM5W2Ch96E9fTpOpQ+G+TKoCdeXpQ177GgjriaJKX6GMbIxt?=
 =?us-ascii?Q?ccT/nvZA4EBYo1xIWphBl/YI/GOkJAnqFVBWpGf/tG2xGOcqv46J9c9Q0MTM?=
 =?us-ascii?Q?Iht2ijmzrhemTm6GKpSAHBkzK+mczFhiq6bCGKXrFq86imrI3E6ynN+O4Of4?=
 =?us-ascii?Q?hKVjty2LSLcUZLQCr2WlbEHshph39g9c83+Zls4EhTSzpU0Op76yusdi5B6p?=
 =?us-ascii?Q?9L/A2pTh+XKoiaJwjXi/TQd1brKdNWTIOOWDXJ45bU1OFhFhTvcEf2DQI0JM?=
 =?us-ascii?Q?02F1WoFS02zM8KSF+vzJXxs7B3gXmdeYH0FhC6+dKAgbms0psu48YkJUJXFJ?=
 =?us-ascii?Q?I1NRmBCHMCs87P5X7L7xuqlDQXDrNOMeguM2LXDby6hJephOu6CcKtiJpxkL?=
 =?us-ascii?Q?nuz5bUmnmpkS3vOSZM4SSvm5DgLpXy4DGc7BWnsv8CZr6Kq+qw5l23j59Zjd?=
 =?us-ascii?Q?KunLZSkjgIK+9oW3SKazBj7EESyTxMz9+HdLpyb3LfTC0aJwGI0zh6fsfYV9?=
 =?us-ascii?Q?+HDrDBb/OK/0e31SPhe1y8CoEbR1oQrtBv++iIJbrzdVc+vVF2xamjEkKdjS?=
 =?us-ascii?Q?BlwWpgTkW1g58VbzOvfFmIZsSWSEZTNCeiO6tVD1IuBvAoGVNhKZUGT2KQIa?=
 =?us-ascii?Q?q8E6b+bmu73MN32a8DgUD/kUxHuAowOhibf1A3Td1KFUALhT1/VKPIV3AAuY?=
 =?us-ascii?Q?bwiFjACYqFy42SFXioPoH8arzneduTOmMSaytj4orqIWL4xfP13ixgOcKd5P?=
 =?us-ascii?Q?xBh2u3HdBcv+YIgn8dMsEHGlbd76ivNOmIPiPWcR9Ka36Pp5jzaAQLJedrSe?=
 =?us-ascii?Q?yEtOUhtW15SllC/MHRJ2bw5L/VGp4cTYfbPLymohh+n6s78B+4FZRfPl23KY?=
 =?us-ascii?Q?CGdNiAntWuCp+bIG6ysRg3W2ctSTjBH4s9AfbxO95RmESS6vb9ZFY9y0wx2n?=
 =?us-ascii?Q?+b+utLeDVPZY/Xa6Zt3t/mPk7kvvjlbO+TApOU6MwIc9rWtlY1aQ2VvJA03I?=
 =?us-ascii?Q?CLTmAx6dG2wpe3ZzGtA1usgzK7SCKJH4sACeqi/kMXhsPGplDSZz31extMMK?=
 =?us-ascii?Q?m4OMbLWMm0L4DjL0dXPGdIMASrUVzbzpMIlrFmksLFf32jQx9vo0gYMFzez/?=
 =?us-ascii?Q?OruWCm/F6bhrQZ5bQXCUmPmGRgSGLQQ6RXf8RHIUnziXUqX+XxuzqOXQMvIq?=
 =?us-ascii?Q?eAWyxz7Bmk6qx0u9MkJtO/rQZp/JfFxot1tvzjIBRffBNAkbwYtSZyySDuoq?=
 =?us-ascii?Q?vUzqo3V+WhqOg2rJgnhqRTc9GLO6GU8CqqgnbzVgHzbNrd5dB+o8AhwtmjXx?=
 =?us-ascii?Q?ZStjaoyt7sIKlVZ/JixvxPy5X3fGoDwh1aBo640FVPXDtv0UxrVNv4QyN/Mz?=
 =?us-ascii?Q?TWJ1085+8Zb0kGSw0DQfpgiU3qaM6n5fQ+sUhdZeEswo5Elq2xDiKQns0EKu?=
 =?us-ascii?Q?RqWwdTO1ihcTMhzBTY+qViAFFgtv/+eVu0hKa/NMxmDVW7TynKicek948XCo?=
 =?us-ascii?Q?z5IO+vlj65bjdqnBDrs=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:50:07.8958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d676aa26-b88b-4508-fe05-08de485a5d3c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR19MB9137
X-Proofpoint-GUID: oWQ7VDM6zLvn_BMtL51pAWcfuxGWIrXv
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=6954ffe3 cx=c_pps
 a=gR+jnx00JS1rzJoXDrw7EQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=C58FxD2BOZMRnAzTm5kA:9
X-Proofpoint-ORIG-GUID: oWQ7VDM6zLvn_BMtL51pAWcfuxGWIrXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NSBTYWx0ZWRfX7LLOjEvkzOUb
 E2epfxxEgrJyuBNuZz5IMBxlwtVoDXtrqVNQxUEEEMc5eWm3wt6+VtqK/Cmqr+46gfO2NZIKqdL
 JqDgyMzCKJsDpWZJJhVs4ExFc6QU/DklP2KJfu6F69L3fE9rCekyAMbvRncTq9xKl9LTZDrp+Ma
 uIW1nyAyiGvGQitTmd8gTvPapFlD2qDhBYyUGeiML9EakMNZS7765uy5Csy5o2t+fxJrNRg9Apj
 W6VE1sefbFU8qGPDrka54NjazuwBAL389NmvpLnvpaZ0CZP12jkbOutvA9II9b/fYcsZgXJ0IyX
 qU4buy4KIYQH5/yfWLSBcGQuuRo1hJpUWkIL1g25yJWRa7P7us8bzBcJcHEJpCGQAj8ujwcRbfg
 x0sdZ0PlujhcD6/3McZkuG93mENtuD3LTUVfV316xrdXIxtE1Osq+cfVKKfLm67lV1zAFmiJy6s
 zueGT6by6x2991epXsw==
X-Proofpoint-Spam-Reason: safe

Add test cases for using the new long-offset block types to patch
memory that is >0xffff from the algorithm base.

This is just adding entries to the parameter data that have larger
offset values.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../firmware/cirrus/test/cs_dsp_test_bin.c    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
index 67af7da4f8c1..99148ea22df3 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin.c
@@ -2326,6 +2326,7 @@ static const struct bin_test_param x_or_y_and_offset_param_cases[] = {
 };
 
 static const struct bin_test_param x_or_y_and_long_offset_param_cases[] = {
+	/* Offset < 0xffff in long-offset block type */
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 1,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 2,  WMDR_PATCH_LONG },
@@ -2336,6 +2337,7 @@ static const struct bin_test_param x_or_y_and_long_offset_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 21, WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 20, WMDR_PATCH_LONG },
 
+	/* Offset < 0xffff in long-offset block type */
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 1,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 2,  WMDR_PATCH_LONG },
@@ -2345,6 +2347,28 @@ static const struct bin_test_param x_or_y_and_long_offset_param_cases[] = {
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 22, WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 21, WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 20, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10001, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10002, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10003, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x2f003, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x2f002, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x2f001, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_XM, .offset_words = 0x2f000, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10001, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10002, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10003, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x2f003, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x2f002, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x2f001, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_ADSP2_YM, .offset_words = 0x2f000, WMDR_PATCH_LONG },
 };
 
 /* Parameterize on ZM with a range of word offsets */
@@ -2374,15 +2398,31 @@ static const struct bin_test_param packed_x_or_y_and_offset_param_cases[] = {
 };
 
 static const struct bin_test_param packed_x_or_y_and_long_offset_param_cases[] = {
+	/* Offset < 0xffff in long-offset block type */
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 4,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 8,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 12, WMDR_PATCH_LONG },
 
+	/* Offset < 0xffff in long-offset block type */
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 4,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 8,  WMDR_PATCH_LONG },
 	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 12, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x10008, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x2f000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_XM_PACKED, .offset_words = 0x2f004, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x10008, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x2f000, WMDR_PATCH_LONG },
+	{ .mem_type = WMFW_HALO_YM_PACKED, .offset_words = 0x2f004, WMDR_PATCH_LONG },
 };
 
 static void x_or_y_or_z_and_offset_param_desc(const struct bin_test_param *param,
@@ -2449,6 +2489,7 @@ static const struct bin_test_param offset_param_cases[] = {
 };
 
 static const struct bin_test_param long_offset_param_cases[] = {
+	/* Offset < 0xffff in long-offset block type */
 	{ .offset_words = 0,  WMDR_PATCH_LONG },
 	{ .offset_words = 1,  WMDR_PATCH_LONG },
 	{ .offset_words = 2,  WMDR_PATCH_LONG },
@@ -2458,6 +2499,17 @@ static const struct bin_test_param long_offset_param_cases[] = {
 	{ .offset_words = 22, WMDR_PATCH_LONG },
 	{ .offset_words = 21, WMDR_PATCH_LONG },
 	{ .offset_words = 20, WMDR_PATCH_LONG },
+
+	/* Offset > 0xffff in long-offset block type */
+	{ .offset_words = 0x10000, WMDR_PATCH_LONG },
+	{ .offset_words = 0x10001, WMDR_PATCH_LONG },
+	{ .offset_words = 0x10002, WMDR_PATCH_LONG },
+	{ .offset_words = 0x10003, WMDR_PATCH_LONG },
+	{ .offset_words = 0x10004, WMDR_PATCH_LONG },
+	{ .offset_words = 0x2f000, WMDR_PATCH_LONG },
+	{ .offset_words = 0x2f001, WMDR_PATCH_LONG },
+	{ .offset_words = 0x2f002, WMDR_PATCH_LONG },
+	{ .offset_words = 0x2f003, WMDR_PATCH_LONG },
 };
 
 static void offset_param_desc(const struct bin_test_param *param, char *desc)
-- 
2.43.0

