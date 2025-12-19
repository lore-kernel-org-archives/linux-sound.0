Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0DD31B81A;
	Fri, 19 Dec 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766139353; cv=fail; b=aCdzSBwWmOlxvG4z/wz3vY7/WK2ERihj1/gRUTYrxDQwpppzOI2ZQ7b2bARf55lZi6ZEaVhaEXAFQe1rHakcg6JgFGCYUkonCjf3ZRgXSB/Dfmy6QKfiYhzFR/djOIxFgP7BsrNUe+ZRHnNnQM9LJzlta6oafP/33rKZvIL0mlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766139353; c=relaxed/simple;
	bh=YCU3vp+DaJ3ICBarABYTH8DIYR9q2f+LzL7/EC2Sy7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xck1pcHu/iPwFW/C9Nt4xWThmzdSogWqNdA8G8R8QVorKu4wrcsLPiz/Qydo4z66zIKt3CJ5A6T2lGVhiYySwnmR6Yxv2M3L0MCnC7MRPOnP9YjdBjiQl6AHl6k4U2prU6clkiUV4P2IvCUJjNiYgLsPyQ91brF3qH+z8gNJcDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SjFFmmak; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oAmIsbPH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SjFFmmak";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oAmIsbPH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ5sStQ1417943;
	Fri, 19 Dec 2025 04:03:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=v3INX88iTtFYk43viQl27UXvosScNtiLIQON8jVDMHY=; b=
	SjFFmmakmbBEfp3WBJ8Z7QT29WvZjF2yF06rYg2YLKgsK+nWgMNV2RUG8maKV8ak
	MiULA6kiDKfWx8w2CTKuvyFyCObQhKtioYR8li06waj1qLOLmrbfqe3QiSAktfgP
	nGmQAL4pGmMUSQguuo0WWFWTP6tlxJjGojC6PHAb5P2D1jos8r+ud1lashUxpM/S
	npWkk1u9o6kSWMU4SMgHEhlPzxa/8Uz00WvnSYcfUTQm3ATdeREh9isAf+0Sk2q9
	5Qn9/0cR0VAq/SYfJKM2HKNDYBUdGsKs/RkvoNMVuEYzFd+Xj5XWkCdpKCRi2Wfq
	+dwC3gZHyb4qsvlv+HCu6A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020112.outbound.protection.outlook.com [52.101.201.112])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4b4r40gp3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 04:03:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmZ10mH+d4Ua5/vfLhhQcqO7jrrmDjlYgbx8jxWtiiqN+1LI3XGsZnZMBB3WRQOD4BNn0qrUAadw14xIk6vFjKclN9aEpD0ijPvS4xxMS7fE1vmK2XfmPzVHlprTNpJ9JRnLPSbQ/7fqSsIiJtYZBkYBG7qB5sRG6ZUHKO9ZYM1vQ1PfXFq0ruib4+f7gKNGOyhmxfbT6yeeffqBUsgE/9KDduRH2hD1GMsNoyTfpD6f/31Ak8BLNZ4sgOp9roGqjr4QcrN0fqN/q43tTDbljUBsWvyH5fEspUoGp43C+rrUHe/us5uvX1k955CtV1GS3JoRRgCThoIht2+9zxG0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3INX88iTtFYk43viQl27UXvosScNtiLIQON8jVDMHY=;
 b=xfRHFFUvNDfZEH1FbMMuWn5t8ZVRk6c0hgMVdLUMKjfzP61XR94qVT1vQE9mPtKJvgTUI8FKfai5MbIER4DShg1TKdcB6KJf5JKDwN10zY3wSdder8SfyxbxDEq/lSTXVX5jjo2d9qLu6Nd5nhhBp8KseSy9H4cGvalzKtpTl8CAKVGYux5u1tEo7ZXnsw1kQ+lz4/U1zca0R0T/4vooliBmQPlyIVG2pJJpp4W8bWugQIDFUGFAnIvh+ryVw7tBOWdso5yA1zRZuUK6pGSx+ChXI40RKkl/ssxAOXTDwa2O5eo5zA25Fvhnf2RfANrTsTqCzM+IcV/uJNk1g6aNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3INX88iTtFYk43viQl27UXvosScNtiLIQON8jVDMHY=;
 b=oAmIsbPH4q6FSdxr95YBcgqvoZeUUjDEhgI5Uc7Fiu5nngMvybYUeRvWiSU7mLfkT7a4AEtFvdEB0leK4lNMgrL3Wmd7aoyJ5Ll66sSt3LI1feg5mNmYuPdFyiavyYT2LfTZ9pGkanVW+9XA1inhdvsFg3EqSrxcVKaahSDuFB8=
Received: from BYAPR11CA0075.namprd11.prod.outlook.com (2603:10b6:a03:f4::16)
 by PH0PR19MB5193.namprd19.prod.outlook.com (2603:10b6:510:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 10:03:02 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::26) by BYAPR11CA0075.outlook.office365.com
 (2603:10b6:a03:f4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Fri,
 19 Dec 2025 10:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Fri, 19 Dec 2025 10:03:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2319A40654E;
	Fri, 19 Dec 2025 10:03:00 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DDA0E822542;
	Fri, 19 Dec 2025 10:02:59 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Lee Jones <lee@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH 3/3] ASoC: cs42l43: Add support for the B variant
Date: Fri, 19 Dec 2025 10:01:55 +0000
Message-ID: <20251219100235.1247053-4-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
References: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|PH0PR19MB5193:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cb80677b-5aea-4374-12a0-08de3ee5cb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M4bTUrdNNhc016n2ebhqRN1zd8DuFdeqRfYdktR4BIyCGHtFsr8mLGWCtUam?=
 =?us-ascii?Q?HYHLwNmhOh7FnEOXpJEMc2+xXZwPYu3/WgnoEYBjL8ShiNAyfFr50yUzptPl?=
 =?us-ascii?Q?QCjfXCyh8fG2fRpWw0APNfDG91W6fKRDgzGMheOp9ND8jFTELCYgIFje3RXP?=
 =?us-ascii?Q?KNDQh55xv9zhkkS3CHbPo+ibqvB7Bi+p+87O67BV8cJUGWF9a9xQada39kd7?=
 =?us-ascii?Q?xYo4VLW6v9aNkjQ2MRqApgaWivL62YxQVVoQzCkby6BGSaDxwL5egjL01Sxp?=
 =?us-ascii?Q?MwDa94PihRwoIgGgliZTbJLDECD0y8m1U21VWJVa2UWuozUmEnMMYOLk4UzV?=
 =?us-ascii?Q?knkGyBWozOOaaJ2XJvxgdHSxTURI/3U5e2MgbR2+toZ42T2GcikCe9J/d3EO?=
 =?us-ascii?Q?2Ds9W2g5xVERhY6mo8uE09L7ymgOUOVLcB+oOnYq6h4KvAnSRtqaHe81NU4X?=
 =?us-ascii?Q?dPy5w/bfDf652nVns5uzfKgUyA+Fp5SP/5+DOi+pTyL9I7GbPBHszYsV40NZ?=
 =?us-ascii?Q?kk8F3kb4ruFTaHPkJnW/remYxbNsd2VL1Z+ogHqbF1M9cDNdxyDiQ/Xn2cQk?=
 =?us-ascii?Q?Tm5eFvpaLyJzhjy1Wh0XlyR21scpG9Momva6MlVK6BmdHQ8m8tCbsqH+zt3E?=
 =?us-ascii?Q?MDwzKZ1OfYlBEHf5ZoV8sK9avUd7o3BA2M0udwarxspDeIbDsuZt43LY+RF8?=
 =?us-ascii?Q?YH6BvMntZJe1OQppBIgO7NaqtKXEHdVEBANhrONyQT7Xyb8M18MVYaNPhhsa?=
 =?us-ascii?Q?ks5/u+GOL6znQKgmjyMGGDHD9porcDlFmrWZs4F+X1k0Sls1Z1cpP695WCOo?=
 =?us-ascii?Q?39eyIMhavSI4XEFgQxJwd2swwKZ16iudRMDDnSi2NjRe2mWVDHp9MlYHxJYH?=
 =?us-ascii?Q?zfPDCHZZ/LP7DHpRMk1E6LP40phvzHHqiTTTQpfRl76LWuBcaL7agfdcQzFB?=
 =?us-ascii?Q?b4dbdxdODqyEwf8z8+y3UpXyEdUbO0VV9LpW8B4vFfTcw1SXL1HC0FHpKcm8?=
 =?us-ascii?Q?+OX+3/owPcJNpFbGPodQAkg9uH89H41WeCd9jLc6fhbdOsDwNsDB+HBF4i6+?=
 =?us-ascii?Q?mp8aOiVlDL2FvqAg+TVGpGDWNHV3oc5o8jFuoQiLZ+wReg+3J90gxiQFzfS2?=
 =?us-ascii?Q?mY2HIbFW6fNGLfq4eHi/rYjMhcIK5Ef1x8BQTwszRCSYeVO94zaIsXNLT2fC?=
 =?us-ascii?Q?PQ2U8KUKAf9IBQAKs9Q9LKwZCWKATuSRpqx561bJSVU8rMs0p3Fsm3Dob6td?=
 =?us-ascii?Q?NXOdosM9K5lwoGwLnFVosuGvoTijg0//hNf/UyKm0l1Nxdy8ulwDc8QhTTYS?=
 =?us-ascii?Q?3obKN/rEEtivFmbY7rUaSr3fqvQnSmU6L1WzR4J7TmZntx5jn0xX8y3HMiOL?=
 =?us-ascii?Q?ayyTF5+jVBKQRLDowFecFvzKdC2bj5C0P6PcbF+1mIcPCdEzNRbGemrnUTPb?=
 =?us-ascii?Q?kn/S8/XJ8Z6Wcb5RW3aolOqF79e1re+j2lrOuW0yUPlRfA9xpXDTaOp4do0i?=
 =?us-ascii?Q?8prAjlcKPyAz1E4k8ulyQo1Mvz3dubGcLQ17U4HlnkUZL9NdJ8NpfhNqgZCE?=
 =?us-ascii?Q?JmGf8HS5EuGLgdFVez0=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 10:03:01.3923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb80677b-5aea-4374-12a0-08de3ee5cb95
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5193
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfXwRfbeOwSdl2m
 urQkqgBRQ+BBNKhS6StgaZn+4QZp4fvZqJ9f86HNukE0cdwL+9NN2rQkTHQ5vs18kIpj2gAQYfH
 cE4itUdu4jVl3lJc8nrs6B9ma+5TLIhD0vD2hUllFLmDWZnic9niGiLizsF/Xo9kngH8L8K5YXW
 Nni526eZbi1BakLQdDkjW4fQeaErPJzq87vLlhJHBfuiBhCSGcIGZRZDMxXhgMxZdjpH2v6x8fo
 3v7g7ebpL1a40HhYFaWqm2yB77GUL5KXze0hBI4qgjbyX/+weYEZQp11HM802cBRqJWRITHyCV3
 Q7uoX6iZoBByrI4UV4phWm+EEFkFSZM4Xmgktu3DuG6YKKe6CmDcmyY0l/MBSRwd2HbOwQ5/M8m
 ACJqTdByvmvmueDjknPgU0txd6EpgpirCEIckMH06J3gxFS2gfrsv61LCjQRBlzZGT09Cgjlpge
 pPIYlJOIv7GV4ZwRUqQ==
X-Authority-Analysis: v=2.4 cv=K7Mv3iWI c=1 sm=1 tr=0 ts=694522db cx=c_pps
 a=cE3fiHRxMl4nLvvI2vbFbA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=kQzjlAsR8i2kcuqZbFEA:9
X-Proofpoint-GUID: fhsrnq9bBsOaqLW8p-13cLKjyPp8TwC6
X-Proofpoint-ORIG-GUID: fhsrnq9bBsOaqLW8p-13cLKjyPp8TwC6
X-Proofpoint-Spam-Reason: safe

Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
the same driver.

Changes in CS42L43 driver specific for CS42L43B:
- Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
- Decimators 3 and 4 are connected to PDM1
- Added Decimator 5 and 6 for PDM2
- Supports SoundWire Clock Gearing
- Updated ROM requiring no patching
- Reduced RAM space
- Each ISRC has 4 decimators now

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 745 ++++++++++++++++++++++++++++++-------
 sound/soc/codecs/cs42l43.h |   4 +-
 2 files changed, 613 insertions(+), 136 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index fd02d8a57e0f2..02d8eeaf031ff 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -45,12 +45,25 @@ static SOC_VALUE_ENUM_SINGLE_DECL(cs42l43_##name##_enum, reg, \
 static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 		SOC_DAPM_ENUM("Route", cs42l43_##name##_enum)
 
+#define CS42L43B_DECL_MUX(name, reg) \
+static SOC_VALUE_ENUM_SINGLE_DECL(cs42l43_##name##_enum, reg, \
+				  0, CS42L43_MIXER_SRC_MASK, \
+				  cs42l43b_mixer_texts, cs42l43b_mixer_values); \
+static const struct snd_kcontrol_new cs42l43_##name##_mux = \
+		SOC_DAPM_ENUM("Route", cs42l43_##name##_enum)
+
 #define CS42L43_DECL_MIXER(name, reg) \
 	CS42L43_DECL_MUX(name##_in1, reg); \
 	CS42L43_DECL_MUX(name##_in2, reg + 0x4); \
 	CS42L43_DECL_MUX(name##_in3, reg + 0x8); \
 	CS42L43_DECL_MUX(name##_in4, reg + 0xC)
 
+#define CS42L43B_DECL_MIXER(name, reg) \
+	CS42L43B_DECL_MUX(name##_in1, reg); \
+	CS42L43B_DECL_MUX(name##_in2, reg + 0x4); \
+	CS42L43B_DECL_MUX(name##_in3, reg + 0x8); \
+	CS42L43B_DECL_MUX(name##_in4, reg + 0xC)
+
 #define CS42L43_DAPM_MUX(name_str, name) \
 	SND_SOC_DAPM_MUX(name_str " Input", SND_SOC_NOPM, 0, 0, &cs42l43_##name##_mux)
 
@@ -99,11 +112,23 @@ static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 	{ name_str,		"EQ1",			"EQ" }, \
 	{ name_str,		"EQ2",			"EQ" }
 
+#define CS42L43B_BASE_ROUTES(name_str) \
+	{ name_str,		"Decimator 5",		"Decimator 5" }, \
+	{ name_str,		"Decimator 6",		"Decimator 6" }, \
+	{ name_str,		"ISRC1 DEC3",		"ISRC1DEC3" }, \
+	{ name_str,		"ISRC1 DEC4",		"ISRC1DEC4" }, \
+	{ name_str,		"ISRC2 DEC3",		"ISRC2DEC3" }, \
+	{ name_str,		"ISRC2 DEC4",		"ISRC2DEC4" }
+
 #define CS42L43_MUX_ROUTES(name_str, widget) \
 	{ widget,		NULL,			name_str " Input" }, \
 	{ name_str " Input",	NULL,			"Mixer Core" }, \
 	CS42L43_BASE_ROUTES(name_str " Input")
 
+#define CS42L43B_MUX_ROUTES(name_str, widget) \
+	CS42L43_MUX_ROUTES(name_str, widget), \
+	CS42L43B_BASE_ROUTES(name_str " Input")
+
 #define CS42L43_MIXER_ROUTES(name_str, widget) \
 	{ name_str " Mixer",	NULL,			name_str " Input 1" }, \
 	{ name_str " Mixer",	NULL,			name_str " Input 2" }, \
@@ -116,6 +141,13 @@ static const struct snd_kcontrol_new cs42l43_##name##_mux = \
 	CS42L43_BASE_ROUTES(name_str " Input 3"), \
 	CS42L43_BASE_ROUTES(name_str " Input 4")
 
+#define CS42L43B_MIXER_ROUTES(name_str, widget) \
+	CS42L43_MIXER_ROUTES(name_str, widget), \
+	CS42L43B_BASE_ROUTES(name_str " Input 1"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 2"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 3"), \
+	CS42L43B_BASE_ROUTES(name_str " Input 4")
+
 #define CS42L43_MIXER_VOLUMES(name_str, base) \
 	SOC_SINGLE_RANGE_TLV(name_str " Input 1 Volume", base, \
 			     CS42L43_MIXER_VOL_SHIFT, 0x20, 0x50, 0, \
@@ -300,6 +332,7 @@ static int cs42l43_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	struct snd_soc_component *component = dai->component;
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
+	int ret;
 	int provider = !dai->id || !!regmap_test_bits(cs42l43->regmap,
 						      CS42L43_ASP_CLK_CONFIG2,
 						      CS42L43_ASP_MASTER_MODE_MASK);
@@ -309,6 +342,14 @@ static int cs42l43_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 	else
 		priv->constraint.mask = CS42L43_CONSUMER_RATE_MASK;
 
+	if (!cs42l43->is_b_variant && (dai->id == 3 || dai->id == 4)) {
+		ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+						   SNDRV_PCM_HW_PARAM_CHANNELS,
+						   1, 2);
+		if (ret < 0)
+			return ret;
+	}
+
 	return snd_pcm_hw_constraint_list(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_RATE,
 					  &priv->constraint);
@@ -590,12 +631,19 @@ static int cs42l43_dai_probe(struct snd_soc_dai *dai)
 		"Decimator 2 Switch",
 		"Decimator 3 Switch",
 		"Decimator 4 Switch",
+		"Decimator 5 Switch",
+		"Decimator 6 Switch",
 	};
-	int i;
+	int control_size, i;
 
 	static_assert(ARRAY_SIZE(controls) == ARRAY_SIZE(priv->kctl));
 
-	for (i = 0; i < ARRAY_SIZE(controls); i++) {
+	if (priv->core->is_b_variant)
+		control_size = ARRAY_SIZE(controls);
+	else
+		control_size = ARRAY_SIZE(controls) - 2; // ignore Decimator 5 and 6
+
+	for (i = 0; i < control_size; i++) {
 		if (priv->kctl[i])
 			continue;
 
@@ -703,7 +751,7 @@ static struct snd_soc_dai_driver cs42l43_dais[] = {
 		.capture = {
 			.stream_name	= "DP3 Capture",
 			.channels_min	= 1,
-			.channels_max	= 2,
+			.channels_max	= 4,
 			.rates		= SNDRV_PCM_RATE_KNOT,
 			.formats	= CS42L43_SDW_FORMATS,
 		},
@@ -715,7 +763,7 @@ static struct snd_soc_dai_driver cs42l43_dais[] = {
 		.capture = {
 			.stream_name	= "DP4 Capture",
 			.channels_min	= 1,
-			.channels_max	= 2,
+			.channels_max	= 4,
 			.rates		= SNDRV_PCM_RATE_KNOT,
 			.formats	= CS42L43_SDW_FORMATS,
 		},
@@ -808,6 +856,10 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec3_wnf_corner, CS42L43_DECIM_HPF_WNF_CTRL3
 			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_wnf_corner, CS42L43_DECIM_HPF_WNF_CTRL4,
 			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_wnf_corner, CS42L43B_DECIM_HPF_WNF_CTRL5,
+			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_wnf_corner, CS42L43B_DECIM_HPF_WNF_CTRL6,
+			    CS42L43_DECIM_WNF_CF_SHIFT, cs42l43_wnf_corner_text);
 
 static const char * const cs42l43_hpf_corner_text[] = {
 	"3Hz", "12Hz", "48Hz", "96Hz",
@@ -821,6 +873,10 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec3_hpf_corner, CS42L43_DECIM_HPF_WNF_CTRL3
 			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_hpf_corner, CS42L43_DECIM_HPF_WNF_CTRL4,
 			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_hpf_corner, CS42L43B_DECIM_HPF_WNF_CTRL5,
+			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_hpf_corner, CS42L43B_DECIM_HPF_WNF_CTRL6,
+			    CS42L43_DECIM_HPF_CF_SHIFT, cs42l43_hpf_corner_text);
 
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec1_ramp_up, CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 			    CS42L43_DECIM1_VI_RAMP_SHIFT, cs42l43_ramp_text);
@@ -839,6 +895,31 @@ static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_ramp_up, CS42L43_DECIM_VOL_CTRL_CH3_CH4
 static SOC_ENUM_SINGLE_DECL(cs42l43_dec4_ramp_down, CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 			    CS42L43_DECIM4_VD_RAMP_SHIFT, cs42l43_ramp_text);
 
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec1_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM1_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec1_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM1_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec2_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM2_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec2_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+			    CS42L43_DECIM2_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec3_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM3_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec3_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM3_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec4_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM4_VI_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec4_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+			    CS42L43_DECIM4_VD_RAMP_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec5_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_ramp_up, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT, cs42l43_ramp_text);
+static SOC_ENUM_SINGLE_DECL(cs42l43b_dec6_ramp_down, CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+			    CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT, cs42l43_ramp_text);
+
 static DECLARE_TLV_DB_SCALE(cs42l43_speaker_tlv, -6400, 50, 0);
 
 static SOC_ENUM_SINGLE_DECL(cs42l43_speaker_ramp_up, CS42L43_AMP1_2_VOL_RAMP,
@@ -898,6 +979,37 @@ static const unsigned int cs42l43_mixer_values[] = {
 	0x58, 0x59, // EQ1, 2
 };
 
+static const char * const cs42l43b_mixer_texts[] = {
+	"None",
+	"Tone Generator 1", "Tone Generator 2",
+	"Decimator 1", "Decimator 2", "Decimator 3", "Decimator 4", "Decimator 5", "Decimator 6",
+	"ASPRX1", "ASPRX2", "ASPRX3", "ASPRX4", "ASPRX5", "ASPRX6",
+	"DP5RX1", "DP5RX2", "DP6RX1", "DP6RX2", "DP7RX1", "DP7RX2",
+	"ASRC INT1", "ASRC INT2", "ASRC INT3", "ASRC INT4",
+	"ASRC DEC1", "ASRC DEC2", "ASRC DEC3", "ASRC DEC4",
+	"ISRC1 INT1", "ISRC1 INT2",
+	"ISRC1 DEC1", "ISRC1 DEC2", "ISRC1 DEC3", "ISRC1 DEC4",
+	"ISRC2 INT1", "ISRC2 INT2",
+	"ISRC2 DEC1", "ISRC2 DEC2", "ISRC2 DEC3", "ISRC2 DEC4",
+	"EQ1", "EQ2",
+};
+
+static const unsigned int cs42l43b_mixer_values[] = {
+	0x00, // None
+	0x04, 0x05, // Tone Generator 1, 2
+	0x10, 0x11, 0x80, 0x81, 0x12, 0x13, // Decimator 1, 2, 3, 4, 5, 6
+	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, // ASPRX1,2,3,4,5,6
+	0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, // DP5, 6, 7RX1, 2
+	0x40, 0x41, 0x42, 0x43, // ASRC INT1, 2, 3, 4
+	0x44, 0x45, 0x46, 0x47, // ASRC DEC1, 2, 3, 4
+	0x50, 0x51, // ISRC1 INT1, 2
+	0x52, 0x53, 0x78, 0x79, // ISRC1 DEC1, 2, 3, 4
+	0x54, 0x55, // ISRC2 INT1, 2
+	0x56, 0x57, 0x7A, 0x7B, // ISRC2 DEC1, 2, 3, 4
+	0x58, 0x59, // EQ1, 2
+};
+
+/* A variant */
 CS42L43_DECL_MUX(asptx1, CS42L43_ASPTX1_INPUT);
 CS42L43_DECL_MUX(asptx2, CS42L43_ASPTX2_INPUT);
 CS42L43_DECL_MUX(asptx3, CS42L43_ASPTX3_INPUT);
@@ -946,6 +1058,63 @@ CS42L43_DECL_MIXER(amp2, CS42L43_AMP2MIX_INPUT1);
 CS42L43_DECL_MIXER(amp3, CS42L43_AMP3MIX_INPUT1);
 CS42L43_DECL_MIXER(amp4, CS42L43_AMP4MIX_INPUT1);
 
+/* B variant */
+CS42L43B_DECL_MUX(b_asptx1, CS42L43_ASPTX1_INPUT);
+CS42L43B_DECL_MUX(b_asptx2, CS42L43_ASPTX2_INPUT);
+CS42L43B_DECL_MUX(b_asptx3, CS42L43_ASPTX3_INPUT);
+CS42L43B_DECL_MUX(b_asptx4, CS42L43_ASPTX4_INPUT);
+CS42L43B_DECL_MUX(b_asptx5, CS42L43_ASPTX5_INPUT);
+CS42L43B_DECL_MUX(b_asptx6, CS42L43_ASPTX6_INPUT);
+
+CS42L43B_DECL_MUX(b_dp1tx1, CS42L43_SWIRE_DP1_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx2, CS42L43_SWIRE_DP1_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx3, CS42L43_SWIRE_DP1_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp1tx4, CS42L43_SWIRE_DP1_CH4_INPUT);
+CS42L43B_DECL_MUX(b_dp2tx1, CS42L43_SWIRE_DP2_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp2tx2, CS42L43_SWIRE_DP2_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx1, CS42L43_SWIRE_DP3_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx2, CS42L43_SWIRE_DP3_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx3, CS42L43B_SWIRE_DP3_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp3tx4, CS42L43B_SWIRE_DP3_CH4_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx1, CS42L43_SWIRE_DP4_CH1_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx2, CS42L43_SWIRE_DP4_CH2_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx3, CS42L43B_SWIRE_DP4_CH3_INPUT);
+CS42L43B_DECL_MUX(b_dp4tx4, CS42L43B_SWIRE_DP4_CH4_INPUT);
+
+CS42L43B_DECL_MUX(b_asrcint1, CS42L43_ASRC_INT1_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint2, CS42L43_ASRC_INT2_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint3, CS42L43_ASRC_INT3_INPUT1);
+CS42L43B_DECL_MUX(b_asrcint4, CS42L43_ASRC_INT4_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec1, CS42L43_ASRC_DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec2, CS42L43_ASRC_DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec3, CS42L43_ASRC_DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_asrcdec4, CS42L43_ASRC_DEC4_INPUT1);
+
+CS42L43B_DECL_MUX(b_isrc1int1, CS42L43_ISRC1INT1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1int2, CS42L43_ISRC1INT2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec1, CS42L43_ISRC1DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec2, CS42L43_ISRC1DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec3, CS42L43B_ISRC1DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_isrc1dec4, CS42L43B_ISRC1DEC4_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2int1, CS42L43_ISRC2INT1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2int2, CS42L43_ISRC2INT2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec1, CS42L43_ISRC2DEC1_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec2, CS42L43_ISRC2DEC2_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec3, CS42L43B_ISRC2DEC3_INPUT1);
+CS42L43B_DECL_MUX(b_isrc2dec4, CS42L43B_ISRC2DEC4_INPUT1);
+
+CS42L43B_DECL_MUX(b_spdif1, CS42L43_SPDIF1_INPUT1);
+CS42L43B_DECL_MUX(b_spdif2, CS42L43_SPDIF2_INPUT1);
+
+CS42L43B_DECL_MIXER(b_eq1, CS42L43_EQ1MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_eq2, CS42L43_EQ2MIX_INPUT1);
+
+CS42L43B_DECL_MIXER(b_amp1, CS42L43_AMP1MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_amp2, CS42L43_AMP2MIX_INPUT1);
+
+CS42L43B_DECL_MIXER(b_amp3, CS42L43_AMP3MIX_INPUT1);
+CS42L43B_DECL_MIXER(b_amp4, CS42L43_AMP4MIX_INPUT1);
+
 static int cs42l43_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
@@ -1174,44 +1343,6 @@ static const struct snd_kcontrol_new cs42l43_controls[] = {
 	SOC_ENUM("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corner),
 	SOC_ENUM("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corner),
 
-	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
-		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
-	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
-		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
-		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
-
-	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43_dec1_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43_dec1_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43_dec2_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43_dec2_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43_dec3_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43_dec3_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43_dec4_ramp_up,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43_dec4_ramp_down,
-		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
-
 	SOC_DOUBLE_R_EXT("Speaker Digital Switch",
 			 CS42L43_INTP_VOLUME_CTRL1, CS42L43_INTP_VOLUME_CTRL2,
 			 CS42L43_AMP_MUTE_SHIFT, 1, 1,
@@ -1601,36 +1732,80 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 	unsigned int *val;
 	int ret;
 
-	switch (w->shift) {
-	case CS42L43_ADC1_EN_SHIFT:
-	case CS42L43_PDM1_DIN_L_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-		ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-		mute = CS42L43_DECIM1_MUTE_MASK;
-		val = &priv->decim_cache[0];
-		break;
-	case CS42L43_ADC2_EN_SHIFT:
-	case CS42L43_PDM1_DIN_R_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-		ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-		mute = CS42L43_DECIM2_MUTE_MASK;
-		val = &priv->decim_cache[1];
-		break;
-	case CS42L43_PDM2_DIN_L_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-		ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-		mute = CS42L43_DECIM3_MUTE_MASK;
-		val = &priv->decim_cache[2];
-		break;
-	case CS42L43_PDM2_DIN_R_EN_SHIFT:
-		reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-		ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-		mute = CS42L43_DECIM4_MUTE_MASK;
-		val = &priv->decim_cache[3];
-		break;
-	default:
-		dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
-		return -EINVAL;
+	if (!cs42l43->is_b_variant) {
+		switch (w->shift) {
+		case CS42L43_ADC1_EN_SHIFT:
+		case CS42L43_PDM1_DIN_L_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
+			mute = CS42L43_DECIM1_MUTE_MASK;
+			val = &priv->decim_cache[0];
+			break;
+		case CS42L43_ADC2_EN_SHIFT:
+		case CS42L43_PDM1_DIN_R_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
+			mute = CS42L43_DECIM2_MUTE_MASK;
+			val = &priv->decim_cache[1];
+			break;
+		case CS42L43_PDM2_DIN_L_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
+			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
+			mute = CS42L43_DECIM3_MUTE_MASK;
+			val = &priv->decim_cache[2];
+			break;
+		case CS42L43_PDM2_DIN_R_EN_SHIFT:
+			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
+			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
+			mute = CS42L43_DECIM4_MUTE_MASK;
+			val = &priv->decim_cache[3];
+			break;
+		default:
+			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
+			return -EINVAL;
+		}
+	} else {
+		switch (w->shift) {
+		case CS42L43_ADC1_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
+			mute = CS42L43_DECIM1_MUTE_MASK;
+			val = &priv->decim_cache[0];
+			break;
+		case CS42L43_ADC2_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
+			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
+			mute = CS42L43_DECIM2_MUTE_MASK;
+			val = &priv->decim_cache[1];
+			break;
+		case CS42L43_PDM1_DIN_L_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
+			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
+			mute = CS42L43_DECIM3_MUTE_MASK;
+			val = &priv->decim_cache[2];
+			break;
+		case CS42L43_PDM1_DIN_R_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
+			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
+			mute = CS42L43_DECIM4_MUTE_MASK;
+			val = &priv->decim_cache[3];
+			break;
+		case CS42L43_PDM2_DIN_L_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
+			ramp  = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK;
+			mute = CS42L43B_DECIM5_MUTE_MASK;
+			val = &priv->decim_cache[4];
+			break;
+		case CS42L43_PDM2_DIN_R_EN_SHIFT:
+			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
+			ramp = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK;
+			mute = CS42L43B_DECIM6_MUTE_MASK;
+			val = &priv->decim_cache[5];
+			break;
+		default:
+			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
+			return -EINVAL;
+		}
 	}
 
 	switch (event) {
@@ -1722,11 +1897,6 @@ static const struct snd_soc_dapm_widget cs42l43_widgets[] = {
 			   0, NULL, 0, cs42l43_mic_ev,
 			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
 
-	SND_SOC_DAPM_MUX("Decimator 1 Mode", SND_SOC_NOPM, 0, 0,
-			 &cs42l43_dec_mode_ctl[0]),
-	SND_SOC_DAPM_MUX("Decimator 2 Mode", SND_SOC_NOPM, 0, 0,
-			 &cs42l43_dec_mode_ctl[1]),
-
 	SND_SOC_DAPM_PGA("Decimator 1", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("Decimator 2", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("Decimator 3", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -1871,53 +2041,6 @@ static const struct snd_soc_dapm_widget cs42l43_widgets[] = {
 
 	SND_SOC_DAPM_SUPPLY("Mixer Core", CS42L43_BLOCK_EN6, CS42L43_MIXER_EN_SHIFT,
 			    0, NULL, 0),
-	CS42L43_DAPM_MUX("ASPTX1", asptx1),
-	CS42L43_DAPM_MUX("ASPTX2", asptx2),
-	CS42L43_DAPM_MUX("ASPTX3", asptx3),
-	CS42L43_DAPM_MUX("ASPTX4", asptx4),
-	CS42L43_DAPM_MUX("ASPTX5", asptx5),
-	CS42L43_DAPM_MUX("ASPTX6", asptx6),
-
-	CS42L43_DAPM_MUX("DP1TX1", dp1tx1),
-	CS42L43_DAPM_MUX("DP1TX2", dp1tx2),
-	CS42L43_DAPM_MUX("DP1TX3", dp1tx3),
-	CS42L43_DAPM_MUX("DP1TX4", dp1tx4),
-	CS42L43_DAPM_MUX("DP2TX1", dp2tx1),
-	CS42L43_DAPM_MUX("DP2TX2", dp2tx2),
-	CS42L43_DAPM_MUX("DP3TX1", dp3tx1),
-	CS42L43_DAPM_MUX("DP3TX2", dp3tx2),
-	CS42L43_DAPM_MUX("DP4TX1", dp4tx1),
-	CS42L43_DAPM_MUX("DP4TX2", dp4tx2),
-
-	CS42L43_DAPM_MUX("ASRC INT1", asrcint1),
-	CS42L43_DAPM_MUX("ASRC INT2", asrcint2),
-	CS42L43_DAPM_MUX("ASRC INT3", asrcint3),
-	CS42L43_DAPM_MUX("ASRC INT4", asrcint4),
-	CS42L43_DAPM_MUX("ASRC DEC1", asrcdec1),
-	CS42L43_DAPM_MUX("ASRC DEC2", asrcdec2),
-	CS42L43_DAPM_MUX("ASRC DEC3", asrcdec3),
-	CS42L43_DAPM_MUX("ASRC DEC4", asrcdec4),
-
-	CS42L43_DAPM_MUX("ISRC1INT1", isrc1int1),
-	CS42L43_DAPM_MUX("ISRC1INT2", isrc1int2),
-	CS42L43_DAPM_MUX("ISRC1DEC1", isrc1dec1),
-	CS42L43_DAPM_MUX("ISRC1DEC2", isrc1dec2),
-	CS42L43_DAPM_MUX("ISRC2INT1", isrc2int1),
-	CS42L43_DAPM_MUX("ISRC2INT2", isrc2int2),
-	CS42L43_DAPM_MUX("ISRC2DEC1", isrc2dec1),
-	CS42L43_DAPM_MUX("ISRC2DEC2", isrc2dec2),
-
-	CS42L43_DAPM_MUX("SPDIF1", spdif1),
-	CS42L43_DAPM_MUX("SPDIF2", spdif2),
-
-	CS42L43_DAPM_MIXER("EQ1", eq1),
-	CS42L43_DAPM_MIXER("EQ2", eq2),
-
-	CS42L43_DAPM_MIXER("Speaker L", amp1),
-	CS42L43_DAPM_MIXER("Speaker R", amp2),
-
-	CS42L43_DAPM_MIXER("Headphone L", amp3),
-	CS42L43_DAPM_MIXER("Headphone R", amp4),
 };
 
 static const struct snd_soc_dapm_route cs42l43_routes[] = {
@@ -1963,16 +2086,6 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	{ "PDM2L",		NULL,	"PDM2_DIN" },
 	{ "PDM2R",		NULL,	"PDM2_DIN" },
 
-	{ "Decimator 1 Mode",	"PDM",	"PDM1L" },
-	{ "Decimator 1 Mode",	"ADC",	"ADC1" },
-	{ "Decimator 2 Mode",	"PDM",	"PDM1R" },
-	{ "Decimator 2 Mode",	"ADC",	"ADC2" },
-
-	{ "Decimator 1",	NULL,	"Decimator 1 Mode" },
-	{ "Decimator 2",	NULL,	"Decimator 2 Mode" },
-	{ "Decimator 3",	NULL,	"PDM2L" },
-	{ "Decimator 4",	NULL,	"PDM2R" },
-
 	{ "ASP Capture",	NULL,	"ASPTX1" },
 	{ "ASP Capture",	NULL,	"ASPTX2" },
 	{ "ASP Capture",	NULL,	"ASPTX3" },
@@ -2060,6 +2173,261 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	{ "ASRC_DEC4",		NULL,	"ASRC_DEC" },
 
 	{ "EQ",			NULL,	"EQ Clock" },
+};
+
+static const struct snd_kcontrol_new cs42l43_a_controls[] = {
+	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43_dec1_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43_dec1_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43_dec2_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43_dec2_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43_dec3_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43_dec3_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43_dec4_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43_dec4_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+
+	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+};
+
+static const struct snd_kcontrol_new cs42l43_b_controls[] = {
+	SOC_SINGLE_TLV("Decimator 1 Volume", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 1 Switch", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM1_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 2 Volume", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 2 Switch", CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		       CS42L43_DECIM2_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 3 Volume", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 3 Switch", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM3_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 4 Volume", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 4 Switch", CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		       CS42L43_DECIM4_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 5 Volume", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM5_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 5 Switch", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM5_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_TLV("Decimator 6 Volume", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM6_VOL_SHIFT, 0xBF, 0, cs42l43_dec_tlv),
+	SOC_SINGLE_EXT("Decimator 6 Switch", CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		       CS42L43B_DECIM6_MUTE_SHIFT, 1, 1,
+		       cs42l43_decim_get, cs42l43_dapm_put_volsw),
+
+	SOC_ENUM_EXT("Decimator 1 Ramp Up", cs42l43b_dec1_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 1 Ramp Down", cs42l43b_dec1_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Up", cs42l43b_dec2_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 Ramp Down", cs42l43b_dec2_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Up", cs42l43b_dec3_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 Ramp Down", cs42l43b_dec3_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Up", cs42l43b_dec4_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 Ramp Down", cs42l43b_dec4_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 5 Ramp Up", cs42l43b_dec5_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 5 Ramp Down", cs42l43b_dec5_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 6 Ramp Up", cs42l43b_dec6_ramp_up,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 6 Ramp Down", cs42l43b_dec6_ramp_down,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+
+	SOC_SINGLE("Decimator 5 WNF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
+		   CS42L43_DECIM_WNF_EN_SHIFT, 1, 0),
+	SOC_SINGLE("Decimator 6 WNF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
+		   CS42L43_DECIM_WNF_EN_SHIFT, 1, 0),
+
+	SOC_ENUM("Decimator 5 WNF Corner Frequency", cs42l43b_dec5_wnf_corner),
+	SOC_ENUM("Decimator 6 WNF Corner Frequency", cs42l43b_dec6_wnf_corner),
+
+	SOC_SINGLE("Decimator 5 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
+		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
+	SOC_SINGLE("Decimator 6 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
+		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
+
+	SOC_ENUM("Decimator 5 HPF Corner Frequency", cs42l43b_dec5_hpf_corner),
+	SOC_ENUM("Decimator 6 HPF Corner Frequency", cs42l43b_dec6_hpf_corner),
+};
+
+static const struct snd_soc_dapm_widget cs42l43_a_widgets[] = {
+	SND_SOC_DAPM_MUX("Decimator 1 Mode", SND_SOC_NOPM, 0, 0,
+			 &cs42l43_dec_mode_ctl[0]),
+	SND_SOC_DAPM_MUX("Decimator 2 Mode", SND_SOC_NOPM, 0, 0,
+			 &cs42l43_dec_mode_ctl[1]),
+	CS42L43_DAPM_MUX("ASPTX1", asptx1),
+	CS42L43_DAPM_MUX("ASPTX2", asptx2),
+	CS42L43_DAPM_MUX("ASPTX3", asptx3),
+	CS42L43_DAPM_MUX("ASPTX4", asptx4),
+	CS42L43_DAPM_MUX("ASPTX5", asptx5),
+	CS42L43_DAPM_MUX("ASPTX6", asptx6),
+
+	CS42L43_DAPM_MUX("DP1TX1", dp1tx1),
+	CS42L43_DAPM_MUX("DP1TX2", dp1tx2),
+	CS42L43_DAPM_MUX("DP1TX3", dp1tx3),
+	CS42L43_DAPM_MUX("DP1TX4", dp1tx4),
+	CS42L43_DAPM_MUX("DP2TX1", dp2tx1),
+	CS42L43_DAPM_MUX("DP2TX2", dp2tx2),
+	CS42L43_DAPM_MUX("DP3TX1", dp3tx1),
+	CS42L43_DAPM_MUX("DP3TX2", dp3tx2),
+	CS42L43_DAPM_MUX("DP4TX1", dp4tx1),
+	CS42L43_DAPM_MUX("DP4TX2", dp4tx2),
+
+	CS42L43_DAPM_MUX("ASRC INT1", asrcint1),
+	CS42L43_DAPM_MUX("ASRC INT2", asrcint2),
+	CS42L43_DAPM_MUX("ASRC INT3", asrcint3),
+	CS42L43_DAPM_MUX("ASRC INT4", asrcint4),
+	CS42L43_DAPM_MUX("ASRC DEC1", asrcdec1),
+	CS42L43_DAPM_MUX("ASRC DEC2", asrcdec2),
+	CS42L43_DAPM_MUX("ASRC DEC3", asrcdec3),
+	CS42L43_DAPM_MUX("ASRC DEC4", asrcdec4),
+
+	CS42L43_DAPM_MUX("ISRC1INT1", isrc1int1),
+	CS42L43_DAPM_MUX("ISRC1INT2", isrc1int2),
+	CS42L43_DAPM_MUX("ISRC1DEC1", isrc1dec1),
+	CS42L43_DAPM_MUX("ISRC1DEC2", isrc1dec2),
+	CS42L43_DAPM_MUX("ISRC2INT1", isrc2int1),
+	CS42L43_DAPM_MUX("ISRC2INT2", isrc2int2),
+	CS42L43_DAPM_MUX("ISRC2DEC1", isrc2dec1),
+	CS42L43_DAPM_MUX("ISRC2DEC2", isrc2dec2),
+
+	CS42L43_DAPM_MUX("SPDIF1", spdif1),
+	CS42L43_DAPM_MUX("SPDIF2", spdif2),
+
+	CS42L43_DAPM_MIXER("EQ1", eq1),
+	CS42L43_DAPM_MIXER("EQ2", eq2),
+
+	CS42L43_DAPM_MIXER("Speaker L", amp1),
+	CS42L43_DAPM_MIXER("Speaker R", amp2),
+
+	CS42L43_DAPM_MIXER("Headphone L", amp3),
+	CS42L43_DAPM_MIXER("Headphone R", amp4),
+};
+
+static const struct snd_soc_dapm_widget cs42l43_b_widgets[] = {
+	SND_SOC_DAPM_AIF_OUT("DP3TX3", NULL, 2, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP3TX4", NULL, 3, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP4TX3", NULL, 2, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DP4TX4", NULL, 3, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_PGA("Decimator 5", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Decimator 6", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_PGA("ISRC1DEC3", CS42L43_ISRC1_CTRL,
+			 CS42L43B_ISRC_DEC3_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC1DEC4", CS42L43_ISRC1_CTRL,
+			 CS42L43B_ISRC_DEC4_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC2DEC3", CS42L43_ISRC2_CTRL,
+			 CS42L43B_ISRC_DEC3_EN_SHIFT, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ISRC2DEC4", CS42L43_ISRC2_CTRL,
+			 CS42L43B_ISRC_DEC4_EN_SHIFT, 0, NULL, 0),
+
+	CS42L43_DAPM_MUX("ASPTX1", b_asptx1),
+	CS42L43_DAPM_MUX("ASPTX2", b_asptx2),
+	CS42L43_DAPM_MUX("ASPTX3", b_asptx3),
+	CS42L43_DAPM_MUX("ASPTX4", b_asptx4),
+	CS42L43_DAPM_MUX("ASPTX5", b_asptx5),
+	CS42L43_DAPM_MUX("ASPTX6", b_asptx6),
+
+	CS42L43_DAPM_MUX("DP1TX1", b_dp1tx1),
+	CS42L43_DAPM_MUX("DP1TX2", b_dp1tx2),
+	CS42L43_DAPM_MUX("DP1TX3", b_dp1tx3),
+	CS42L43_DAPM_MUX("DP1TX4", b_dp1tx4),
+	CS42L43_DAPM_MUX("DP2TX1", b_dp2tx1),
+	CS42L43_DAPM_MUX("DP2TX2", b_dp2tx2),
+	CS42L43_DAPM_MUX("DP3TX1", b_dp3tx1),
+	CS42L43_DAPM_MUX("DP3TX2", b_dp3tx2),
+	CS42L43_DAPM_MUX("DP3TX3", b_dp3tx3),
+	CS42L43_DAPM_MUX("DP3TX4", b_dp3tx4),
+	CS42L43_DAPM_MUX("DP4TX1", b_dp4tx1),
+	CS42L43_DAPM_MUX("DP4TX2", b_dp4tx2),
+	CS42L43_DAPM_MUX("DP4TX3", b_dp4tx3),
+	CS42L43_DAPM_MUX("DP4TX4", b_dp4tx4),
+
+	CS42L43_DAPM_MUX("ASRC INT1", b_asrcint1),
+	CS42L43_DAPM_MUX("ASRC INT2", b_asrcint2),
+	CS42L43_DAPM_MUX("ASRC INT3", b_asrcint3),
+	CS42L43_DAPM_MUX("ASRC INT4", b_asrcint4),
+	CS42L43_DAPM_MUX("ASRC DEC1", b_asrcdec1),
+	CS42L43_DAPM_MUX("ASRC DEC2", b_asrcdec2),
+	CS42L43_DAPM_MUX("ASRC DEC3", b_asrcdec3),
+	CS42L43_DAPM_MUX("ASRC DEC4", b_asrcdec4),
+
+	CS42L43_DAPM_MUX("ISRC1INT1", b_isrc1int1),
+	CS42L43_DAPM_MUX("ISRC1INT2", b_isrc1int2),
+	CS42L43_DAPM_MUX("ISRC1DEC1", b_isrc1dec1),
+	CS42L43_DAPM_MUX("ISRC1DEC2", b_isrc1dec2),
+	CS42L43_DAPM_MUX("ISRC1DEC3", b_isrc1dec3),
+	CS42L43_DAPM_MUX("ISRC1DEC4", b_isrc1dec4),
+	CS42L43_DAPM_MUX("ISRC2INT1", b_isrc2int1),
+	CS42L43_DAPM_MUX("ISRC2INT2", b_isrc2int2),
+	CS42L43_DAPM_MUX("ISRC2DEC1", b_isrc2dec1),
+	CS42L43_DAPM_MUX("ISRC2DEC2", b_isrc2dec2),
+	CS42L43_DAPM_MUX("ISRC2DEC3", b_isrc2dec3),
+	CS42L43_DAPM_MUX("ISRC2DEC4", b_isrc2dec4),
+
+	CS42L43_DAPM_MUX("SPDIF1", b_spdif1),
+	CS42L43_DAPM_MUX("SPDIF2", b_spdif2),
+
+	CS42L43_DAPM_MIXER("EQ1", b_eq1),
+	CS42L43_DAPM_MIXER("EQ2", b_eq2),
+
+	CS42L43_DAPM_MIXER("Speaker L", b_amp1),
+	CS42L43_DAPM_MIXER("Speaker R", b_amp2),
+
+	CS42L43_DAPM_MIXER("Headphone L", b_amp3),
+	CS42L43_DAPM_MIXER("Headphone R", b_amp4),
+};
+
+static const struct snd_soc_dapm_route cs42l43_a_routes[] = {
+	{ "Decimator 1 Mode",	"PDM",	"PDM1L" },
+	{ "Decimator 1 Mode",	"ADC",	"ADC1" },
+	{ "Decimator 2 Mode",	"PDM",	"PDM1R" },
+	{ "Decimator 2 Mode",	"ADC",	"ADC2" },
+
+	{ "Decimator 1",	NULL,	"Decimator 1 Mode" },
+	{ "Decimator 2",	NULL,	"Decimator 2 Mode" },
+	{ "Decimator 3",	NULL,	"PDM2L" },
+	{ "Decimator 4",	NULL,	"PDM2R" },
 
 	CS42L43_MUX_ROUTES("ASPTX1", "ASPTX1"),
 	CS42L43_MUX_ROUTES("ASPTX2", "ASPTX2"),
@@ -2110,6 +2478,81 @@ static const struct snd_soc_dapm_route cs42l43_routes[] = {
 	CS42L43_MIXER_ROUTES("Headphone R", "HP"),
 };
 
+static const struct snd_soc_dapm_route cs42l43_b_routes[] = {
+	{ "Decimator 1",	NULL,	"ADC1" },
+	{ "Decimator 2",	NULL,	"ADC2" },
+	{ "Decimator 3",	NULL,	"PDM1L" },
+	{ "Decimator 4",	NULL,	"PDM1R" },
+	{ "Decimator 5",	NULL,	"PDM2L" },
+	{ "Decimator 6",	NULL,	"PDM2R" },
+
+	{ "DP3 Capture",	NULL, "DP3TX3" },
+	{ "DP3 Capture",	NULL, "DP3TX4" },
+	{ "DP4 Capture",	NULL, "DP4TX3" },
+	{ "DP4 Capture",	NULL, "DP4TX4" },
+
+	{ "ISRC1DEC3",		NULL,	"ISRC1" },
+	{ "ISRC1DEC4",		NULL,	"ISRC1" },
+	{ "ISRC2DEC3",		NULL,	"ISRC2" },
+	{ "ISRC2DEC4",		NULL,	"ISRC2" },
+
+	CS42L43B_MUX_ROUTES("ASPTX1", "ASPTX1"),
+	CS42L43B_MUX_ROUTES("ASPTX2", "ASPTX2"),
+	CS42L43B_MUX_ROUTES("ASPTX3", "ASPTX3"),
+	CS42L43B_MUX_ROUTES("ASPTX4", "ASPTX4"),
+	CS42L43B_MUX_ROUTES("ASPTX5", "ASPTX5"),
+	CS42L43B_MUX_ROUTES("ASPTX6", "ASPTX6"),
+
+	CS42L43B_MUX_ROUTES("DP1TX1", "DP1TX1"),
+	CS42L43B_MUX_ROUTES("DP1TX2", "DP1TX2"),
+	CS42L43B_MUX_ROUTES("DP1TX3", "DP1TX3"),
+	CS42L43B_MUX_ROUTES("DP1TX4", "DP1TX4"),
+	CS42L43B_MUX_ROUTES("DP2TX1", "DP2TX1"),
+	CS42L43B_MUX_ROUTES("DP2TX2", "DP2TX2"),
+	CS42L43B_MUX_ROUTES("DP3TX1", "DP3TX1"),
+	CS42L43B_MUX_ROUTES("DP3TX2", "DP3TX2"),
+	CS42L43B_MUX_ROUTES("DP3TX3", "DP3TX3"),
+	CS42L43B_MUX_ROUTES("DP3TX4", "DP3TX4"),
+	CS42L43B_MUX_ROUTES("DP4TX1", "DP4TX1"),
+	CS42L43B_MUX_ROUTES("DP4TX2", "DP4TX2"),
+	CS42L43B_MUX_ROUTES("DP4TX3", "DP4TX3"),
+	CS42L43B_MUX_ROUTES("DP4TX4", "DP4TX4"),
+
+	CS42L43B_MUX_ROUTES("ASRC INT1", "ASRC_INT1"),
+	CS42L43B_MUX_ROUTES("ASRC INT2", "ASRC_INT2"),
+	CS42L43B_MUX_ROUTES("ASRC INT3", "ASRC_INT3"),
+	CS42L43B_MUX_ROUTES("ASRC INT4", "ASRC_INT4"),
+	CS42L43B_MUX_ROUTES("ASRC DEC1", "ASRC_DEC1"),
+	CS42L43B_MUX_ROUTES("ASRC DEC2", "ASRC_DEC2"),
+	CS42L43B_MUX_ROUTES("ASRC DEC3", "ASRC_DEC3"),
+	CS42L43B_MUX_ROUTES("ASRC DEC4", "ASRC_DEC4"),
+
+	CS42L43B_MUX_ROUTES("ISRC1INT1", "ISRC1INT1"),
+	CS42L43B_MUX_ROUTES("ISRC1INT2", "ISRC1INT2"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC1", "ISRC1DEC1"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC2", "ISRC1DEC2"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC3", "ISRC1DEC3"),
+	CS42L43B_MUX_ROUTES("ISRC1DEC4", "ISRC1DEC4"),
+	CS42L43B_MUX_ROUTES("ISRC2INT1", "ISRC2INT1"),
+	CS42L43B_MUX_ROUTES("ISRC2INT2", "ISRC2INT2"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC1", "ISRC2DEC1"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC2", "ISRC2DEC2"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC3", "ISRC2DEC3"),
+	CS42L43B_MUX_ROUTES("ISRC2DEC4", "ISRC2DEC4"),
+
+	CS42L43B_MUX_ROUTES("SPDIF1", "SPDIF"),
+	CS42L43B_MUX_ROUTES("SPDIF2", "SPDIF"),
+
+	CS42L43B_MIXER_ROUTES("EQ1", "EQ"),
+	CS42L43B_MIXER_ROUTES("EQ2", "EQ"),
+
+	CS42L43B_MIXER_ROUTES("Speaker L", "AMP1"),
+	CS42L43B_MIXER_ROUTES("Speaker R", "AMP2"),
+
+	CS42L43B_MIXER_ROUTES("Headphone L", "HP"),
+	CS42L43B_MIXER_ROUTES("Headphone R", "HP"),
+};
+
 static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 			      int src, unsigned int freq, int dir)
 {
@@ -2126,8 +2569,14 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 
 static int cs42l43_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+	unsigned int num_controls, num_widgets, num_routes;
+	const struct snd_soc_dapm_widget *widgets;
+	const struct snd_kcontrol_new *controls;
+	const struct snd_soc_dapm_route *routes;
 	struct cs42l43 *cs42l43 = priv->core;
+	int ret;
 
 	snd_soc_component_init_regmap(component, cs42l43->regmap);
 
@@ -2139,6 +2588,34 @@ static int cs42l43_component_probe(struct snd_soc_component *component)
 	priv->component = component;
 	priv->constraint = cs42l43_constraint;
 
+	if (cs42l43->is_b_variant) {
+		controls = cs42l43_b_controls;
+		num_controls = ARRAY_SIZE(cs42l43_b_controls);
+		widgets = cs42l43_b_widgets;
+		num_widgets = ARRAY_SIZE(cs42l43_b_widgets);
+		routes = cs42l43_b_routes;
+		num_routes = ARRAY_SIZE(cs42l43_b_routes);
+	} else {
+		controls = cs42l43_a_controls;
+		num_controls = ARRAY_SIZE(cs42l43_a_controls);
+		widgets = cs42l43_a_widgets;
+		num_widgets = ARRAY_SIZE(cs42l43_a_widgets);
+		routes = cs42l43_a_routes;
+		num_routes = ARRAY_SIZE(cs42l43_a_routes);
+	}
+
+	ret = snd_soc_add_component_controls(component, controls, num_controls);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_dapm_add_routes(dapm, routes, num_routes);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index b2fa2cd1d99f8..fd50feb26ae99 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -61,7 +61,7 @@ struct cs42l43_codec {
 	unsigned int refclk_freq;
 	struct completion pll_ready;
 
-	unsigned int decim_cache[4];
+	unsigned int decim_cache[6];
 	unsigned int adc_ena;
 	unsigned int hp_ena;
 
@@ -103,7 +103,7 @@ struct cs42l43_codec {
 	bool hp_ilimited;
 	int hp_ilimit_count;
 
-	struct snd_kcontrol *kctl[5];
+	struct snd_kcontrol *kctl[7];
 };
 
 #if IS_REACHABLE(CONFIG_SND_SOC_CS42L43_SDW)
-- 
2.47.3

