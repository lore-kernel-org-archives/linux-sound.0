Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8758D426696;
	Wed, 21 Jan 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001776; cv=fail; b=SQvLhVYcgNoJyt4Ab4OVq2gsnsJctOEReq8VW5FLhIpC70F82C2tiU5ZcJXs+SzkNN0mIcZzsbQebHKIDmzWLSd/mRzcQ6VRZz61jlLTb/hz0A4b0BirfdDjJSJ2XWXbvW9n8s/2lMm0JZMP7fLT5Dq/MMVNkxgE2D48psH98o8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001776; c=relaxed/simple;
	bh=xLPzHvtZzc34zr1dsBe4OrCQPHIxr68D/Gexvk/8HjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nw8rbLp46nS5JYyg6wFu9T6y7O/OszlacUZE6zLxAJyHdUg9R5zziuRtXV7xNP6f+yu7uekYILAGA6OUaZfPRJ+baSM0atdgw2EjmvjTVIP5VxFvqtDCGQWp1XV+NTgeZKDvE/fr8myzpBowT/B3i4E4IhXvvcEXxxFdJc0pLCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l7/7GQ/H; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dO+cwr39; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l7/7GQ/H";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dO+cwr39"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KHsKBL1381583;
	Wed, 21 Jan 2026 07:22:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dR/gZcvVkbzM18o6MnxcJhUN6s3AILbVoWibyUy8G5M=; b=
	l7/7GQ/H+cmerlNCDHgWgA7bWaVPtdLY8O/DYdPeuDhwStLDKxdJfDi5sV7LP3OQ
	AXXLvEbQD2n6JyGklSNflG2fMlv8BrGu/ZxCKukHR/AzBrwD9QMUT1vm3v3y88j9
	5NfFGejDUVKDiLBkT3vZm2GmTnaxy4iS3ADeZQtGImx1JhAwydnj84J9aLxdOVWZ
	73sblUusFdS+vZ6v259Rq6ueoHOt59tTETmzWWxdhhR2QcHet1lBh7juObdrEkUZ
	3o+u+Z93VrhIvBQ+asDm8z/DGU5xWw0xCuXTbDAik+jBL1Uufa6AcDypuHR/UTxn
	4iD4/9puHeactuQHcrkkDQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022097.outbound.protection.outlook.com [52.101.43.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4br8q1vnxw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 07:22:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meBfTNGdkGasl2J/sPd9DbIXvoc8mkmcYUrjNvNYNd4fEBUIAhxhzwbtlarTIOXzWC66DyAG/LP5B1MRcO/C/r1q9EBo5/4dNJ4xhmU7fxfCQiwDTUtKCztaYh6qdlyOPxOOfb8KoLEJaTH177Q9pWLrGhz5Xd72AtsdtCpM4An5ErX8jw0NKnZ9pN8vOOLw+sTKz2bksN1pl8OkjGsPOuSAoSf3rV5aeZy4E4zJBrDsiqUiZlc9HDathOWjbAv4qeHvh3M6dhqK0bIiorREYL3DCKkruHbxVMSLG5vJQKDHwJIsrrVVspAKa6dSgYDXSYEOPnPAis3Vx16MJy2u4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dR/gZcvVkbzM18o6MnxcJhUN6s3AILbVoWibyUy8G5M=;
 b=X2HJ3zaYJuuxkW+/4oLeAjccoD41aXMY5u3sm3bDKNgCmCBO4/Hmw5Mjp0ccH0Q6ILZS6pA7a8BV5YZEPRQSBlk4YKxtAfQZ1d08QL+6lps3ohXyNpFVIZaznspPJpKqO3jtALteIWv9OMb5NOGtFDWH+r0ltVaWgIvqnNC9PQe6yPmB2jsKfK+vomaisMg8c7IQ8ccX7JhWW5f9QslouD3M6o69FqeSiZcI9nli1mNOIUBv5X488yC0zhcOn+d8qWdgkV1x8xoOks9Ppfqki2kb4M26Ar7iu6OFhLczGTIa8SnYYN30540YNhjv5YT6TQFC/i9OAnfaHO1TjenjYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dR/gZcvVkbzM18o6MnxcJhUN6s3AILbVoWibyUy8G5M=;
 b=dO+cwr39TeWMKLlU3LaEQj901n748LES6lULNWOyYBvUr0xOleyCYl+v5hdE2rCAlqHKl/YEnEji2EKi+Wf7yJ1BfYwTuFO1yEJqri+bzaci0zSmYEVgyKXVMPGj0YkKgNBMk5SekdxIRpXwYV+I27kMh+5AdYssEizCNedryl4=
Received: from CH0PR03CA0226.namprd03.prod.outlook.com (2603:10b6:610:e7::21)
 by IA1PR19MB7181.namprd19.prod.outlook.com (2603:10b6:208:41b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:22:46 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::a8) by CH0PR03CA0226.outlook.office365.com
 (2603:10b6:610:e7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 13:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Wed, 21 Jan 2026 13:22:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CC01D406541;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B9C7082024A;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/5] ASoC: cs-amp-lib: Support Dell SSIDExV2 UEFI variable
Date: Wed, 21 Jan 2026 13:22:39 +0000
Message-ID: <20260121132243.1256019-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121132243.1256019-1-rf@opensource.cirrus.com>
References: <20260121132243.1256019-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|IA1PR19MB7181:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0fd59b13-9f3a-47af-ed2b-08de58f029f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FpU9+fXtJ1KHV/hSH8v1gQL2HJCLEn/42KIumcd0lkZ0HOxsbij5BquaZYAz?=
 =?us-ascii?Q?F+rBvgn+oPgROZlE7DK6N7OowznrSt8kT5+LzjgcfAVBOyy79bZLGETvXwK0?=
 =?us-ascii?Q?Xwkqd0nS9cgO//KjF64CjIgyKr1XC/tYZfX1S17TMkSNS8pE6zGW6XAUgjbT?=
 =?us-ascii?Q?DK72OfDDYpl7JoYFGkenzE57TpbwNlF0PZNt8NCkGvxAPmQFDoKGlcawbb/a?=
 =?us-ascii?Q?joIv8EM5rp5nts3y+lQaXWJspR0eo345xYULHnoXIo2SPORiv7ApWVn+kt59?=
 =?us-ascii?Q?sm3JjpysyQ8D/ObqBzCn0FP6hvYhaRjP3yLl5pGlLmNgoEe9aUULR2c89W7S?=
 =?us-ascii?Q?7RvTVE5McrfU5MG3xCsNX8hnWe7FaRj+SUIUC2yZaj7/z1Ml/ABqxQKWSD8o?=
 =?us-ascii?Q?Or4hpaexMk9o9i4w9TCD4LkE9m1c8b5npjwkfm3S7JCr8CG2/bXHIgKWSLco?=
 =?us-ascii?Q?bqMEAaXcxf6KvEOKD4rg2F9fzBUMuXyTAL55YMNOh+Fxt4x+RfYgcwVOzwWA?=
 =?us-ascii?Q?vowf/9YL/3/wOuyZTNwI8Ziw0U0uTmA1dWJpCVhxYo85HWNFrEFb+jrI99CT?=
 =?us-ascii?Q?OsTOy1ebrhRiP6yXZfW59fJq/bmMy/E4D9hj612ich/gQIH3JpfAEyJ/4QDZ?=
 =?us-ascii?Q?6RXZG8htDhKrU6F9KjGN+6tuS9n/cL/6iY2xQxHmoM3cs1Em4bFPpJGenw8Z?=
 =?us-ascii?Q?tWgnHGhf8BEDJnw1qEnTlsAqvEbGgFIrz2EjdKPVj5AgvwiOMHF/G88dAlor?=
 =?us-ascii?Q?OJ6I+H48Sos3AN9xtXDqASwLrGZ9pQl8iCHB8qbvLBDqFKKoDNoAWp0Vd8+o?=
 =?us-ascii?Q?CXN3kDctc5eooDrSyf3yF8tYqJH/9R8hvLMpg5CK4WmX/ip1/k8jKexlqHZW?=
 =?us-ascii?Q?fMS5R9zvpSG3Xn4Bgyol/UVWfW9A8XZxEgC9VORxdb966mVEYJOHyUxK8vE8?=
 =?us-ascii?Q?YoQgNmGYS9LrKwtM6IDTrLrQZD4kVtwoNfNOLwFxoz3OH/wgGLomsHC2uZnj?=
 =?us-ascii?Q?0O075XfKIw/FPL81lv6YGqHB/cqMEyP9esa8QDjzKXK8xeBwL3FpsLkXlng3?=
 =?us-ascii?Q?iPNBzCYPlXu07abM2nVA1PUez5amTKUtWNqlo8hKPFniB44RpWyVhqxqdYGe?=
 =?us-ascii?Q?o/RrESaEqxOeZ7+8hV093d026w+rcjV0qLkpmAr+CfqTIq2S2MFhxmju2hn0?=
 =?us-ascii?Q?R4WQ2sVe3s11IaUCHyM8p2MuXmkhQxusHYoXs+cC8dDcm0O3Ufbycs332ZTC?=
 =?us-ascii?Q?MwGRJr32sJIrGjr0Ltu4CBk31bTuvQj4ldFuejfLfHEsVyBmXkAUibAwD/Vg?=
 =?us-ascii?Q?1e58zrUl8OdWe/9gVF2CXQGZYlmjKKKWJZ1Ue1WXd+wUB+SOWahYKO7G5m9G?=
 =?us-ascii?Q?6r8/I2iKHAi/GJJZWGyPO4Zrz/QCIC0V/pLgJaocZP2D/WLYLP2JTTL8De4V?=
 =?us-ascii?Q?EZK1iRr6t655114711aRyIzLvOhyvz5d8H0zBcQ7YJV9jC0t7Gb9IfpI5aUI?=
 =?us-ascii?Q?cNyD0HqPpC5TWhw/Rje4mdRQhVPKcPZv3+tiTzI88wyMY/6RKnCTjfhL1ZIx?=
 =?us-ascii?Q?BsIenetpIODPvrB5u7VqTqQCV7hAjUnKyHZONbijPZy7AbM7IL+nXZW+CiZs?=
 =?us-ascii?Q?zMVe9WrkK5nGF9j2/7EK5rcCHBuPupbELS0p1aLxHrrg/qRHA21DC8gRScJi?=
 =?us-ascii?Q?fAUVGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:22:44.9630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd59b13-9f3a-47af-ed2b-08de58f029f2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExMiBTYWx0ZWRfXysMzRAcd7+HN
 o8+j7DNqBOyDOdcQw0Jhkt/TICJV+7W31eW7TTM9PhfKzv3d2DC/SukdXThVqxyDdEXIoTSvi34
 9kSb9n+TSaIvLzzuIB9nowns09Ky479bSulZRnspFFvqu60PktIKNuwNWIDGh9f/jAT1/rEBTnZ
 ie6mTxhOSWC+CHKN1LFzp60lKJxSiJdqAdQgvJTrUycxri+3g1/vIoO6b/oo21OAYUxM+VJE9Ng
 lpJ344crrIq3pq1pRRJMOEJzpcJ1lHgTGC6cTbz3/Mw/K2xAXkKZltIlL/qPKIBGjulda8z0+UC
 6rwAkN2B+rBoErBkEexSr23nvJu6RDMVPcPs2Mpniy9UH9X4AfZ+OisnkBRqib+GuHaQOSVhSaf
 xxB9Qs+87ona/ytv/juhUqhptNZ1ouFle9/I065WpCnC9uxv+89Jt5Eu5KF/Uf0N6DUbS88TRJ0
 RW56V01onQmsSVHC4sg==
X-Proofpoint-GUID: T5mySIv2dbVDvKY44Ryth5lT3RuTmsmd
X-Proofpoint-ORIG-GUID: T5mySIv2dbVDvKY44Ryth5lT3RuTmsmd
X-Authority-Analysis: v=2.4 cv=JbmxbEKV c=1 sm=1 tr=0 ts=6970d32b cx=c_pps
 a=V6sUqnxsgDMRanywjcdTsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=Ki9jH1-v6WY7DfSfT3IA:9
X-Proofpoint-Spam-Reason: safe

Add a function cs_amp_devm_get_vendor_specific_variant_id() to return
a vendor-specific hardware identifier string (if there is one) and use
it to fetch an identifier from Dell SSIDExV2 UEFI variable content.

Dell use the same PCI SSID on multiple products that might have different
audio hardware and thus need different firmware for the amplifier DSP.
The SSIDExV2 string contains additional system identifiers, and the
second field is a 2-character audio hardware identifier.

There are older Dell models with Cirrus Logic amplifiers that have the
SSIDExV2 UEFI variable but do not have the 2-character audio ID in the
second field. The SSIDExV2 is ignored if the second field is not
2 characters.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs-amp-lib.h    |   3 +
 sound/soc/codecs/cs-amp-lib.c | 111 ++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/include/sound/cs-amp-lib.h b/include/sound/cs-amp-lib.h
index 61e00017c9aa..e9aa86d76049 100644
--- a/include/sound/cs-amp-lib.h
+++ b/include/sound/cs-amp-lib.h
@@ -58,6 +58,9 @@ int cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid, int amp_
 int cs_amp_set_efi_calibration_data(struct device *dev, int amp_index, int num_amps,
 				    const struct cirrus_amp_cal_data *in_data);
 int cs_amp_get_vendor_spkid(struct device *dev);
+const char *cs_amp_devm_get_vendor_specific_variant_id(struct device *dev,
+						       int ssid_vendor,
+						       int ssid_device);
 struct dentry *cs_amp_create_debugfs(struct device *dev);
 
 static inline u64 cs_amp_cal_target_u64(const struct cirrus_amp_cal_data *data)
diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index b4d183e7501d..9f8c99dfb798 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/overflow.h>
+#include <linux/pci_ids.h>
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 #include <linux/types.h>
@@ -36,6 +37,10 @@
 #define HP_CALIBRATION_EFI_GUID \
 	EFI_GUID(0x53559579, 0x8753, 0x4f5c, 0x91, 0x30, 0xe8, 0x2a, 0xcf, 0xb8, 0xd8, 0x93)
 
+#define DELL_SSIDEXV2_EFI_NAME L"SSIDexV2Data"
+#define DELL_SSIDEXV2_EFI_GUID \
+	EFI_GUID(0x6a5f35df, 0x1432, 0x4656, 0x85, 0x97, 0x31, 0x04, 0xd5, 0xbf, 0x3a, 0xb0)
+
 static const struct cs_amp_lib_cal_efivar {
 	efi_char16_t *name;
 	efi_guid_t *guid;
@@ -304,6 +309,29 @@ static int cs_amp_convert_efi_status(efi_status_t status)
 	}
 }
 
+static void *cs_amp_alloc_get_efi_variable(efi_char16_t *name,
+					   efi_guid_t *guid,
+					   u32 *returned_attr)
+{
+	efi_status_t status;
+	unsigned long size = 0;
+
+	status = cs_amp_get_efi_variable(name, guid, NULL, &size, NULL);
+	if (status != EFI_BUFFER_TOO_SMALL)
+		return ERR_PTR(cs_amp_convert_efi_status(status));
+
+	/* Over-alloc to ensure strings are always NUL-terminated */
+	void *buf __free(kfree) = kzalloc(size + 1, GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	status = cs_amp_get_efi_variable(name, guid, returned_attr, &size, buf);
+	if (status != EFI_SUCCESS)
+		return ERR_PTR(cs_amp_convert_efi_status(status));
+
+	return_ptr(buf);
+}
+
 static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev,
 							     efi_char16_t **name,
 							     efi_guid_t **guid,
@@ -705,6 +733,89 @@ int cs_amp_get_vendor_spkid(struct device *dev)
 }
 EXPORT_SYMBOL_NS_GPL(cs_amp_get_vendor_spkid, "SND_SOC_CS_AMP_LIB");
 
+static const char *cs_amp_devm_get_dell_ssidex(struct device *dev,
+					       int ssid_vendor, int ssid_device)
+{
+	unsigned int hex_prefix;
+	char audio_id[4];
+	char delim;
+	char *p;
+	int ret;
+
+	if (!efi_rt_services_supported(EFI_RT_SUPPORTED_GET_VARIABLE) &&
+	    !IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST))
+		return ERR_PTR(-ENOENT);
+
+	char *ssidex_buf __free(kfree) = cs_amp_alloc_get_efi_variable(DELL_SSIDEXV2_EFI_NAME,
+								       &DELL_SSIDEXV2_EFI_GUID,
+								       NULL);
+	ret = PTR_ERR_OR_ZERO(ssidex_buf);
+	if (ret == -ENOENT)
+		return ERR_PTR(-ENOENT);
+	else if (ret < 0)
+		return ssidex_buf;
+
+	/*
+	 * SSIDExV2 string is a series of underscore delimited fields.
+	 * First field is all or part of the SSID. Second field should be
+	 * a 2-character audio hardware id, followed by other identifiers.
+	 * Older models did not have the 2-character audio id, so reject
+	 * the string if the second field is not 2 characters.
+	 */
+	ret = sscanf(ssidex_buf, "%8x_%2s%c", &hex_prefix, audio_id, &delim);
+	if (ret < 2)
+		return ERR_PTR(-ENOENT);
+
+	if ((ret == 3) && (delim != '_'))
+		return ERR_PTR(-ENOENT);
+
+	if (strlen(audio_id) != 2)
+		return ERR_PTR(-ENOENT);
+
+	p = devm_kstrdup(dev, audio_id, GFP_KERNEL);
+	if (!p)
+		return ERR_PTR(-ENOMEM);
+
+	return p;
+}
+
+/**
+ * cs_amp_devm_get_vendor_specific_variant_id - get variant ID string
+ * @dev:	 pointer to struct device
+ * @ssid_vendor: PCI Subsystem Vendor (-1 if unknown)
+ * @ssid_device: PCI Subsystem Device (-1 if unknown)
+ *
+ * Known vendor-specific hardware identifiers are checked and if one is
+ * found its content is returned as a NUL-terminated string. The returned
+ * string is devm-managed.
+ *
+ * The returned string is not guaranteed to be globally unique.
+ * Generally it should be combined with some other qualifier, such as
+ * PCI SSID, to create a globally unique ID.
+ *
+ * If the caller has a PCI SSID it should pass it in @ssid_vendor and
+ * @ssid_device. If the vendor-spefic ID contains this SSID it will be
+ * stripped from the returned string to prevent duplication.
+ *
+ * If the caller does not have a PCI SSID, pass -1 for @ssid_vendor and
+ * @ssid_device.
+ *
+ * Return:
+ * * a pointer to a devm-managed string
+ * * ERR_PTR(-ENOENT) if no vendor-specific qualifier
+ * * ERR_PTR error value
+ */
+const char *cs_amp_devm_get_vendor_specific_variant_id(struct device *dev,
+						       int ssid_vendor,
+						       int ssid_device)
+{
+	if ((ssid_vendor == PCI_VENDOR_ID_DELL) || (ssid_vendor < 0))
+		return cs_amp_devm_get_dell_ssidex(dev, ssid_vendor, ssid_device);
+
+	return ERR_PTR(-ENOENT);
+}
+EXPORT_SYMBOL_NS_GPL(cs_amp_devm_get_vendor_specific_variant_id, "SND_SOC_CS_AMP_LIB");
+
 /**
  * cs_amp_create_debugfs - create a debugfs directory for a device
  *
-- 
2.47.3

