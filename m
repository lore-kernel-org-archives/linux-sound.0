Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B983F23B2
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210018; cv=fail; b=pLjeyJ3LxF6HRyeh5BfM4vINP+gOwkYWuhKaW8BkJWKdv7gl5bQ4kezKCDfF/V7Oxn0igJFOqyy8cN5SJLCauM/vVyseEOx1AICFAhcebt/OlGASyx8/zhvUu/4EKbSdUVxSDHTB+6zmBSjPtGb5OC4i4zWVRSBrJ08y1O5NyiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210018; c=relaxed/simple;
	bh=TQPnq8J1l8grBGAhet1h5d6PM+lSnHmnN62DUW9LD7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A7lWKRF23UAhLcVRDgTfIvRnjTXnfh/DdpTGqHZN/Yob+DyVcv5RfkAtlq48sdzZK+9/z765IMRv2Y4MA+Ntob1OeASAtIEEBwN3XcwMqwPnfaG4ZylEb6TkCOq/04hmNUm2uatsJVSUOCMbZAAePZg579XeYWLeEeadhJ7Ujr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jPrNANrl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Q39LjvdI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jPrNANrl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Q39LjvdI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6143CNYG626587;
	Wed, 4 Feb 2026 06:59:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BuRfGts4K7oj96eWCyx1lMH3HtCttoHjtSpHgLLAaA4=; b=
	jPrNANrlhcTxQGDdNjVmVXV80mn/gdy2P+mlz9YkNTpNTEavX1B0RV+TZpYNsNTM
	3aP6u52EmVBglTU0PM8412bgZICXPGdHWuvpr9Db9bUEWYum3sWtoRVaKcXK8I5T
	VLQc2G++PGQtwRrXHDbd78OfySpqm8YFzOMsJhjXQYSuP7C9XAgnpCgwkqdWn5SY
	+l3ee37YvjVHNNW9s0oi18E/F7AjZ93+iNflhC474Q9eCiorxvdtI0eMa92Z0s+H
	WMLNRqTI5RzBIb8PCdZuBommSEBcM9RZdW5ibd5FgML76QZl9S46hlcrrkyyj7x1
	YIDppwR7t5jY0dVg6tS/QQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020133.outbound.protection.outlook.com [52.101.193.133])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c1f1k4kqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 06:59:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1zzAUSaAwaPJ16sRRVhEr7RUy6inXYw42YQ10QAl4cRATmAn9iWVE3OinXw8le0qzrWtrngaogXR80rvDSiQJB961faQu2SxQjqWGL1wsxRdXfO2VtnFl3acflXeGK3uPLpY5u3uJUS0ZHnQ2/iP3s2E8yfW8D09Pbai9OajGs3BRtHMgkoqsF7PmmMo+SZhe3HkpZo5CuORVK00x8zdArQGVfjKT8gL9ChEhVW4fQmWAUDpMmjgtxfL2Gz7ASac9UAYrf/vUSK+lRbf3EvdnuYO6YlP/V/1g8cjAGX3ez24fwW1ov3R4yOIultQkS0U3NHjmF+IpsSpPNRbGzhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuRfGts4K7oj96eWCyx1lMH3HtCttoHjtSpHgLLAaA4=;
 b=SHPD50dmTdBTITwb3hlVjDbiGr/Pmq3K4sirwxCiSzbdk7WjdxAgeieCTtsI28I7O2ughXGSmmTjqrgEyBlWoKm6vPLlrYq4c4lanKmnENd8x7+UxSq26F4e9Gvl/aTTeDIyptzqTECB8OLN7CU2tEWyLNQM73HUudlBjnLm18JK05ouTQjPIK3AR5BTtQyQpJqGirUR4gNxCU1YrSPaPltxdu5hsR+vwFywnx/xPg5S/XwWDK+lIihtG75ZTuAtEU9XSZF6UaEy6nXAVX/FfQr7wZYXWBCBUUrDbmt9AZL6ixPd4OVUvrUw531w1Jrh8IfedNc8ba55WC3EQ3wJtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuRfGts4K7oj96eWCyx1lMH3HtCttoHjtSpHgLLAaA4=;
 b=Q39LjvdIDLVwlQSeIh3lAK8iu8SFOqgz9RoGqB0dCYiGa2B7Yc2xs8U1x9r0/RF63x6upcMhNlP7veYzhnnpVZDOQCCwiovmCsHJuTZKsECdkU+AWUwPdReZlUChoG8EQH1V4Sd/dprS3FWc7slsIO9++XU+vl4vOoZdWsIhKOk=
Received: from DS7PR05CA0018.namprd05.prod.outlook.com (2603:10b6:5:3b9::23)
 by BLAPR19MB4210.namprd19.prod.outlook.com (2603:10b6:208:27f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 12:59:50 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:5:3b9:cafe::54) by DS7PR05CA0018.outlook.office365.com
 (2603:10b6:5:3b9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 12:59:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 12:59:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 22D6A406559;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 031A482255D;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 5/6] ASoC: SDCA: Add regmap defaults for specification defined values
Date: Wed,  4 Feb 2026 12:59:42 +0000
Message-ID: <20260204125944.1134011-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
References: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|BLAPR19MB4210:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 05294dde-5429-4e08-fc51-08de63ed47bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C29ZqMQgBK+LoY7eLRm7qG/OsvqJLYbmE0bGYCv+mszrouVdkx+7zVM7915d?=
 =?us-ascii?Q?ThA2fT5zayLvjajE3rk4y1zfsoXIgRwRRNb6zn4DtWL0lZqvzTKRsZgXqzgM?=
 =?us-ascii?Q?+YW+wQmGq0HuHU7UtCfffJq0BmdR0sGVZ4aOIzGKdGYcZQ+pOExuNI9oib6y?=
 =?us-ascii?Q?fE0sAzumK26QBYJwqNOo7oYb21GjSnZKHmsXHFyM9iLwLsz7WQvDWk8Eblqt?=
 =?us-ascii?Q?wG8TZnrg7wAqw+tuqSzJHWKim8Oi+ZSp+wIEI6/8jbBF3081k+kkRc1eyR0p?=
 =?us-ascii?Q?1GHp8MCwc56cOEvfzGTso9Qyk1cVgD9pqv5wS18rhf5pD78jWBKfqLOMzEHI?=
 =?us-ascii?Q?/E8i9lBnr9f8UdP9uA9ZyYbqn+G2TsBtIYKdftcwZp9Tlaq5SG1OkZzZ6PtP?=
 =?us-ascii?Q?smo7HZQRaMIKdBl7ivd2L2dBr+ccobLlgz+Pf8RnTvISv1bimxs7DuuBP/s7?=
 =?us-ascii?Q?hHkcIWsn4yxgFbfbNrr2cGOB3iPMXlbtTEFEPEcUzjEHol3ws0LT1ZWW8+cj?=
 =?us-ascii?Q?AOez3g8JFgVwSR6Au4eHOCGqQytu/NWzOWW4H6GdYkDD8vV0rP34JY2YI/2L?=
 =?us-ascii?Q?tuNEZgTLSNq9LU8HOucPYJHtziMzDDS0cpCX7q8HmKX7ohK8YzLm0TZxSfKK?=
 =?us-ascii?Q?FEuMbr0EqhRCZwmV5o9JicgeWTXb0h+Dt9gzc+ql6X1Zf5hN302HFFVD8MZn?=
 =?us-ascii?Q?Fu13mh7E1FUZwN5OPJEpvFQRniw+cryK98i/TewYrfiAmc6GUzOLDc2GHREZ?=
 =?us-ascii?Q?Rq4ZALFZ4l3JiN5CY3zFxZ6cxnaR5e8KqJaWLKBM3y70ZTF5rJZsZBu0C2PL?=
 =?us-ascii?Q?O/n3UiAfwpogeTq4JHprvpMubwhHM1LpyFbNcLs0q4tVt/9w7drauiHuZ5dG?=
 =?us-ascii?Q?XKjo2l8eolRzOCqsCBJnfbNm8rD3W17CGJud3+aRVQiGJk9SHBH1IkRU1v0P?=
 =?us-ascii?Q?WOM06K35qMTityjXqikTR0pTFlxzr3poLQyrpzQb68zyCWeIVar8trqJNmp8?=
 =?us-ascii?Q?RZ+6SZr/diP4uE3J729U3X5cvDOvGOQFUOH0cwW629N1ky85q8BD/DZyzkLz?=
 =?us-ascii?Q?fLEdGr+G5r6t1cMbx27Y8XPmtBMm99fIdaa4kMRMx3l6Ymnj3+LRjDJyDAUj?=
 =?us-ascii?Q?+8Npr8X+upDGzTypWE21Zp6sEKHWxNMG4d0I+013C6fx+ESE99eGnu1hLjyJ?=
 =?us-ascii?Q?HowrUQUcwDjL2y8xweEo6UcpVHHM9gHoXSbZ3w1Hvr+oADrDWmcOBLvzooVe?=
 =?us-ascii?Q?dRGpcBV99WSwX+1g+8MFbDzB3ByytWDyz49dmu6LmjGeXpNW6MrCGSfC0CWk?=
 =?us-ascii?Q?zikC7CKbbGvWBIpw6j+upZvOjefGk7rbtKjr0nsM3xJLCxNHVIH/YQ++hkDs?=
 =?us-ascii?Q?tlrsbfOw9IwyBqspHeT2HPsIm2BTEKRSwd9/RNVs+0iNrZV6lGFAZYBsGtGZ?=
 =?us-ascii?Q?YV1oGd1DlCgDXZ0AM8+h2X3tbuZTuFwVv5gguZtZHeHI5TGPADP9zw5XfLJb?=
 =?us-ascii?Q?+tp0n9UcuKT9LlSiG3v/JgN+3+44XxF25/DTW162oTD3kg+MMkhJKKk4XbRI?=
 =?us-ascii?Q?BcTF23zzizolLSB84XODmcaA7/44uu8VqMeakyo2mY2qfCeGrBAv3ulJLwiK?=
 =?us-ascii?Q?kbSU1/x5Uszt2BxMmRIGwKVwbG1HC3dzu7HOLmGe9dmyS23Oy5iPSnisrVwV?=
 =?us-ascii?Q?x7UgXA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L6NH3UxUCjqrr/IWP434DJ0lqs7FNiRj1pB9kQG5fZqk7y/QoKzW/5+/Ts1/DaJB7eD4WMeBrg5p2mPSUZd1u1umCYCdlkJp3VAtRvpZJ56Nkl42eTdJqV2WkHq0u1R+4Sf62JWiWxPja4OfwJgcK8JBhozFhvPJkCVWt/N6o4UiCW2gOikf30ls9cT/3zpKXl3XWtNg/fAwC+QQzEQUrkL/ew6AUmCMbj3fxS+/4dv2OTZWwMfhy7Jy6RCFuhCzs/tXpwvLo3m2Cz7JlrKGJwfhfOp7iebcPcy9AvkKrFV7DSEkOae9L6ILo3dq6RJCtQYoJxykfeojXt4sHpBe6tGkkIMtxAyua6ulgN1RrD3LPcRHj4iKBlJW3BqodzSemsC/nJwemg8j6Ll1hYf/WhYMbBEtlcb6EAft6EU6QyF5TByFqqB+Tcw6+FbpRAFA
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:59:49.2605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05294dde-5429-4e08-fc51-08de63ed47bf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4210
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=698342ca cx=c_pps
 a=OkMMD3sknCYbbSSSOfdz/w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=KnU303uXBO9gXvh5N_kA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5OCBTYWx0ZWRfX5rJGCyC1sg9p
 oQHGkTHJIu1hjLT8NoQyv1CPHp9FyAQ3BholjhamBB50UuuH0eAonzMK/5g62bxd/7bJ6S8r5sg
 YBSAfhM/ww/cOu1mCvr+xr6rZ3p13Gf0oi53sUpwZYY04loN80lZzQW3/o2kooC9myIKXODif4o
 0KL435YbWbJaD2BqcK2efXnQDLkxjgb3RWfkpSctbznhziXjBm4pyjHI0EoQ0kLQKyzo+4Gz6/Y
 w3Lz/UDAYRsfb3uw2wgrKk3Qd6Yu8yIVWVnjsIqefxcCGnukCWukefH0D5G65JwKUa5nH0Kvw3v
 dAm3VLVlkwVWcVv/Jl0nzkhW7SlStpKXgZSbZzmEmBBrU6yoTVEzI+02ylEc4sUqSxvS8aH9BCC
 ETCXkYW9g4++vKkTfHaWjfUnSmQPZV9elxC0tqCCepTAQ1yqKvZRDrZXxnTt4cDILvuRmAYWyAH
 +xgUYZGasCte/ANdpfQ==
X-Proofpoint-GUID: -ygXCFMl6nDgGGHBLnPMtASHeLgfxaC-
X-Proofpoint-ORIG-GUID: -ygXCFMl6nDgGGHBLnPMtASHeLgfxaC-
X-Proofpoint-Spam-Reason: safe

Some of the SDCA Controls have a defined reset value in the
specification. Update the parsing to add these specification defined
values into the regmap defaults array. This will reduce the number of
registers that are synchronised on a cache sync.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h   |  4 ++++
 sound/soc/sdca/sdca_functions.c | 36 +++++++++++++++++++++++++++++++++
 sound/soc/sdca/sdca_regmap.c    | 14 ++++++++++---
 3 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 6e9391b3816c6..79bd5a7a0f884 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -798,6 +798,7 @@ struct sdca_control_range {
  * @sel: Identifier used for addressing.
  * @nbits: Number of bits used in the Control.
  * @values: Holds the Control value for constants and defaults.
+ * @reset: Defined reset value for the Control.
  * @cn_list: A bitmask showing the valid Control Numbers within this Control,
  * Control Numbers typically represent channels.
  * @interrupt_position: SCDA interrupt line that will alert to changes on this
@@ -808,6 +809,7 @@ struct sdca_control_range {
  * @layers: Bitmask of access layers of the Control.
  * @deferrable: Indicates if the access to the Control can be deferred.
  * @has_default: Indicates the Control has a default value to be written.
+ * @has_reset: Indicates the Control has a defined reset value.
  * @has_fixed: Indicates the Control only supports a single value.
  */
 struct sdca_control {
@@ -816,6 +818,7 @@ struct sdca_control {
 
 	int nbits;
 	int *values;
+	int reset;
 	u64 cn_list;
 	int interrupt_position;
 
@@ -827,6 +830,7 @@ struct sdca_control {
 	bool deferrable;
 	bool is_volatile;
 	bool has_default;
+	bool has_reset;
 	bool has_fixed;
 };
 
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index f38791eab4f16..95b67bb904c31 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -911,6 +911,38 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
 	return 0;
 }
 
+static int find_sdca_control_reset(const struct sdca_entity *entity,
+				   struct sdca_control *control)
+{
+	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+	case SDCA_CTL_TYPE_S(FU, AGC):
+	case SDCA_CTL_TYPE_S(FU, BASS_BOOST):
+	case SDCA_CTL_TYPE_S(FU, LOUDNESS):
+	case SDCA_CTL_TYPE_S(SMPU, TRIGGER_ENABLE):
+	case SDCA_CTL_TYPE_S(GE, SELECTED_MODE):
+	case SDCA_CTL_TYPE_S(TG, TONE_DIVIDER):
+	case SDCA_CTL_TYPE_S(ENTITY_0, COMMIT_GROUP_MASK):
+		control->has_reset = true;
+		control->reset = 0;
+		break;
+	case SDCA_CTL_TYPE_S(XU, BYPASS):
+	case SDCA_CTL_TYPE_S(MFPU, BYPASS):
+	case SDCA_CTL_TYPE_S(FU, MUTE):
+	case SDCA_CTL_TYPE_S(CX, CLOCK_SELECT):
+		control->has_reset = true;
+		control->reset = 1;
+		break;
+	case SDCA_CTL_TYPE_S(PDE, REQUESTED_PS):
+		control->has_reset = true;
+		control->reset = 3;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
 				    struct fwnode_handle *control_node,
 				    struct sdca_control *control)
@@ -986,6 +1018,10 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 
 	control->is_volatile = find_sdca_control_volatile(entity, control);
 
+	ret = find_sdca_control_reset(entity, control);
+	if (ret)
+		return ret;
+
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
 		dev_err(dev, "%s: control %#x: range missing: %d\n",
diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 2cca9a9c71ea9..4f8a685dc43d7 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -218,7 +218,8 @@ int sdca_regmap_count_constants(struct device *dev,
 		struct sdca_entity *entity = &function->entities[i];
 
 		for (j = 0; j < entity->num_controls; j++) {
-			if (entity->controls[j].mode == SDCA_ACCESS_MODE_DC)
+			if (entity->controls[j].mode == SDCA_ACCESS_MODE_DC ||
+			    entity->controls[j].has_reset)
 				nconsts += hweight64(entity->controls[j].cn_list);
 		}
 	}
@@ -255,7 +256,8 @@ int sdca_regmap_populate_constants(struct device *dev,
 			struct sdca_control *control = &entity->controls[j];
 			int cn;
 
-			if (control->mode != SDCA_ACCESS_MODE_DC)
+			if (control->mode != SDCA_ACCESS_MODE_DC &&
+			    !control->has_reset)
 				continue;
 
 			l = 0;
@@ -264,7 +266,10 @@ int sdca_regmap_populate_constants(struct device *dev,
 				consts[k].reg = SDW_SDCA_CTL(function->desc->adr,
 							     entity->id,
 							     control->sel, cn);
-				consts[k].def = control->values[l];
+				if (control->mode == SDCA_ACCESS_MODE_DC)
+					consts[k].def = control->values[l];
+				else
+					consts[k].def = control->reset;
 				k++;
 				l++;
 			}
@@ -306,6 +311,9 @@ static int populate_control_defaults(struct device *dev, struct regmap *regmap,
 
 			i++;
 		} else if (!control->is_volatile) {
+			if (control->has_reset)
+				regcache_drop_region(regmap, reg, reg);
+
 			ret = regmap_read(regmap, reg, &val);
 			if (ret) {
 				dev_err(dev, "Failed to read initial %#x: %d\n",
-- 
2.47.3

