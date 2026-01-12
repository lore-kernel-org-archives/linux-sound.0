Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6EE35CB9C;
	Mon, 12 Jan 2026 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768226892; cv=fail; b=FMEdYz/RmlPmMq7dEY51Jvd9ND1AicVB0gqafbwUWRsgQNywmAxolkeZ746CNPkuXhFeMHFI3v/gs0gp0iciFRezV/6/r6rgzdKGJSyqNGktZvYXzDAzXF7pYD3ONJLz73mkHbmYnD8SlYENL+Cfg979q6qt1lxDpRS9L5VkHus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768226892; c=relaxed/simple;
	bh=Fo9wZcyufshmuHcrcN59+l/Ycp2osF1FowoNyea+FPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqLQY2sikstPZpQNHmU9QuBP/hxFnWIsGIjXAPvdCZot1pgvO5Kb8jx3pIs6Kiobt0JgRteRnH5wEwyVDm/RSluK5fwVJUwvDVR6RxavbXAWhtPVVWbYZiIEJ1J/O3OIlydO4v9wdn+Wz/XXhAPb94oBucM5tdI71fb8G7aObiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DHwNCunQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=abmBn0/6; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DHwNCunQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="abmBn0/6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C518Pw2267328;
	Mon, 12 Jan 2026 08:08:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lJ+VTp++Cxt2fGlkAidWiU19jH2LAX0O0bE2XLmd/50=; b=
	DHwNCunQtyzV685c7qAZV4R5kxh+tARHBDCYHVihTaENhxC/ByAWwmvx5ieMi0wg
	ZaGQdKrTaKOD9aVvbmtna6fvjgFN0lFQ/rZFtPEBm+ZEQdFD0PUQkW4QXmUBR3DJ
	UWS8X220rn3SL5ToDMrwoJxM8V34lUn5eNucj6VWa49h3CBOblhGMfrQ6+9wP3Tb
	WYr8+yBdgcZGKYv0NtmqiqThTvf9+/S0PNUHG2AAZHxTKmGS7S6FS1ZTGR8fpJs3
	tI/6JmsuXfrtZFRy4fBagCFO2qPchYmh9wows0hvkSQ2QV+ljISBT+FXNRop0kcT
	iiWvP8idE+uqpC+cYHzUJg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021084.outbound.protection.outlook.com [52.101.62.84])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n1r3s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 08:08:07 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=py4y3964NsUfTLIrwd1QnfsPEFmYij7+A2PDdtFsi7i+70eyV3kE8+ayLW7etoibeXGfTNp71bue5AtnzLyTq+QeR+VvjM3uNtQWtOyUeNf/qIZjgujwdFOPTknaS/CoUd8Jk5eOXgH9yUXNCXpJtSdfKIuIB1zqR1p7uBPYI3E9CLuGXkzj+4ENb9MBw/QwRXf68AgUQ98D23fg6/V1cfhBjDrf7BGg11QsnHKG5szKDFZTPl34tO/o1aEl4YqB28y1ttr66CB/AU3IAZ2DkIBJ2IlVCaKlKky1T+450MlEHQPJGFAQ+eKnXwvveDVbKJBsTn+sOWfWvILhxhYLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJ+VTp++Cxt2fGlkAidWiU19jH2LAX0O0bE2XLmd/50=;
 b=AZuFy9fEqMtYh1BCCjrbprh8erI3wbZFxqt3sAfqKIZ5ZuxEGJOWceVlQZeuRW0bd/TBdRHDCQ0CRXOxshHkhjsnLslw73urImtGayXZH+Wd/RT8aeCL+JbBi8Xqw7iVxF+j9H9o83izcTRFXSGci1rFQCvwvJRA7jZHc5nJwn3HqLQInEhidlZ0Yp7YQXU4odSAlDtWi1XHauCfWH61XehjSS8JH2JWSe4KI3TgTBKpaQzsRb0TE2i3TUnSCQHO43FHp8hThNgykiadGaUSJWIlQBxU9gyUj2heDZD5AQj0o5oVzm6fkxAuhGeEb54iRH6J0y+0Zy5J2jFe3YXueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ+VTp++Cxt2fGlkAidWiU19jH2LAX0O0bE2XLmd/50=;
 b=abmBn0/6jqGFYnE6toq3S2AfuoxcWBni2PDpkiRiFsuE60uyvoIejztQzMSSfnOTy3me0wPc6tfdxSNaS2lRJY7dJPioMGCmvHVkSfKZgrz1PGmoQ8LYm4mNV08gNxPd7X07zNX/BcM2baQQHm8QuYgj5IMbimzlOtDVVji4vWQ=
Received: from PH8PR21CA0019.namprd21.prod.outlook.com (2603:10b6:510:2ce::9)
 by CO6PR19MB5435.namprd19.prod.outlook.com (2603:10b6:303:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:08:00 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::d0) by PH8PR21CA0019.outlook.office365.com
 (2603:10b6:510:2ce::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.1 via Frontend Transport; Mon,
 12 Jan 2026 14:07:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 12 Jan 2026 14:07:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 795CF40654F;
	Mon, 12 Jan 2026 14:07:58 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6CD00820247;
	Mon, 12 Jan 2026 14:07:58 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] ASoC: sdw_utils: Call init callbacks on the correct codec DAI
Date: Mon, 12 Jan 2026 14:07:57 +0000
Message-ID: <20260112140758.215799-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112140758.215799-1-rf@opensource.cirrus.com>
References: <20260112140758.215799-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|CO6PR19MB5435:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 40796f94-e042-42d5-9cc1-08de51e3fe78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fcSPI4UkkR/lUZvH42K/K8vFBu4SzRld/FKBU+KwEDMLv0ljk3umZiNVURrN?=
 =?us-ascii?Q?LFIOK/N6cqRScwaJIoMrCsFnDvsOlbO+fTnD5cZgAA/ta0NBZ9yaMcFuFGQ/?=
 =?us-ascii?Q?I0ZbLb/UTNC0sibSj4om09uCWerC36QcohskTTitprKft0440upTGFUmCRyy?=
 =?us-ascii?Q?Vp64tmJBd4oy7rS9eAhMcx92nLu9FcPFEFxJzpC4t2Z5gvTRYRsN5u3YBJGO?=
 =?us-ascii?Q?TJifx+LUwDHLdLmU2G6dSFZ061S0KkES5Bhpse6FW3hD6JRpdVjIPslmWNTO?=
 =?us-ascii?Q?kzBR67Y2B6cmS33/YMtcBRUsx8xJzkv/xDXC5bVpHjzU+kX1jzsoNMusbs+F?=
 =?us-ascii?Q?HHd8DvQFo+oKZlYZlKae+CWtP2xrGr2toSUuBAWGDPaKMPLbyp1Dpwdi3n58?=
 =?us-ascii?Q?mPieRGLWh+VZD7DgZCyV2PNQqt0u6jmZNT220jIRXWVi0JYXSMbZqubYAQNH?=
 =?us-ascii?Q?Itj9DxqcYhQeHMGCVfgIiF2jA9bD3OjWFiGlN6sqOnnAhQ+wGoPeSmMEYhn5?=
 =?us-ascii?Q?KUrd5s7A7xZe64OrHNR8SEN25bSb7nxY/q07whyjPW0XFJcqUKMYEel1d2lY?=
 =?us-ascii?Q?NkHidsfQf7Nj/VshEvrtgpO0tX6TgFSLdBMZxDgp9DhT9LkuJz8Bh5ZOs5gk?=
 =?us-ascii?Q?2osJrxq2anqjyzejmBGhxdAP7p4dFkw3AzktxEHn/3KUK5/XUQHoaE6LTjgY?=
 =?us-ascii?Q?R8nNc77+y7JsuYkzW15qLgmFp036UQSsjy6HiXebKxI9H1Gx2DX4M81TFHxo?=
 =?us-ascii?Q?DBFFXqVPRrz40JQi0IRyZaop4x5SCVUKmRqE31GGo3zqKfOMgQ6d8jdi0hiQ?=
 =?us-ascii?Q?ayE6naG4uGDcnxx47TiO56n878oiPoQBQ82xjYRax70yO4QAO1xiucfle7rb?=
 =?us-ascii?Q?O38aFODUXsT+jHohtNKjEIK9dvdmlNzBioeHwx84cXpXpgktzoDRP5ko6gNF?=
 =?us-ascii?Q?HcMyiS828TAgx0BBbTHkBDlMTrKdGtEXX0BVfW0K3WDFlEO4WTEXFAzVaqE4?=
 =?us-ascii?Q?6Nv4RRiHAm8gZvruNzcD2KQ2R0IKFB1OlGycYFUviaFKxHDVDWJEmbxqGJRO?=
 =?us-ascii?Q?MQR3ZTwlCAGQju+P5hyud9x2xXxVi6FvPiTHpWiT2fAfgdDqtMVChq6QwNAV?=
 =?us-ascii?Q?pTFLnfVf28e3WZ12+lak2h7+r6pWB6v6P2BoX8cRNsukMugq8T2I6iCZccAN?=
 =?us-ascii?Q?4E1HZZw4xVkcpVXXEx5SzwwRPju9QuNHDbi6RC0HJlBTM2sFMQAOBwwfZ8oY?=
 =?us-ascii?Q?A8KB8uda8NTR6sAUB7Sp2lL6kwjCKN418CjfBuLYb+tPundwHgHHTLbqKZHI?=
 =?us-ascii?Q?SbqTSW+bKICgYSFX1OTH4JzczHA8nOZL/mGhwcVOhy81b494zydcDTRNKOPn?=
 =?us-ascii?Q?5oSZ4XrQx8QNLPZGzPi2Nl6iv2F6eRmVrkYn5M4GGPknxb65uxXCrCk4g0Se?=
 =?us-ascii?Q?onE3EJ97pklMxGog9lvuUs20rYkgTSXcFqIP3dc8iYoytfmFMhcumzP0V+UR?=
 =?us-ascii?Q?H121RQouoE79vwB0DV1mKZyn39GgmqsiQGs6eK1ybHtC6wEdlYntwQVfg56p?=
 =?us-ascii?Q?zHHcj5O/78BSxQix9nI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:07:59.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40796f94-e042-42d5-9cc1-08de51e3fe78
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5435
X-Proofpoint-GUID: fR4G4eGoZk9i4vwZxzBhenSJM-MjHK7Z
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69650047 cx=c_pps
 a=0yFM1XxYkakKyygSKIuBYA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=f-gj3fMKOvA30gnKizsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDExNCBTYWx0ZWRfXwe/eI7phKVfT
 L/F74OxB2xIsZL6B4XATZT2PTHX18i4h92c7lBQ4jK8INAeAd7ikZ2Ck9ihg/PKS44DzCusr4P7
 vAlIwDOJS3hHeoAT2Z+dgfp1Y1hqHqXpKFpKgS9HNpMgsUd2AWMUdLHGZQdvNezfNwZ9Bgz1GSu
 bz33cJNRROv7Qo18MZywNSK0bS/VmuNKQ/UIeuS5ZAUrzcWNjqX/Cbz2d/x0OckllN14PO3yfk0
 YCIw8uC4vij6wvMTFwo2fOZV8WUGR251iovY2Lt8g+PvU7xY4hTJjnKGRzYFyibAo0tC8sTV49m
 a1nXwaC3bbdTeO4EnwqsoEz7PvBcNSY0pk2xFkXuVexEisxeqAU62dQYFLirk/oSbI4Rq9t10oL
 oTJBVghfwhiQ1Ui3iqM0GQ7gXZpcmtiZvyY0KEdOUBm3ep3GC0IPhDAZvNI/VnHg2kFx00sONJS
 bfkcnTI/w1g1eT8JImw==
X-Proofpoint-ORIG-GUID: fR4G4eGoZk9i4vwZxzBhenSJM-MjHK7Z
X-Proofpoint-Spam-Reason: safe

asoc_sdw_rtd_init() needs to call the rtd_init() callbacks for each
codec in a dailink. It was finding the codecs by looking for the
matching DAI name in codec_info_list[] but this isn't correct, because
the DAI name isn't guaranteed to be unique. Parts using the same codec
driver (so the same DAI names) might require different machine driver
setup.

Instead, get the struct sdw_slave and extract the SoundWire part ID.
Use this to lookup the entry in codec_info_list[]. This is the same
identity info that was used to find the entry when the machine driver
created the dailink.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e377c9477317 ("ASoC: intel/sdw_utils: move soundwire codec_info_list structure")
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 43 ++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index e4ce952e56aa..6bf81ed132d8 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -855,6 +855,19 @@ struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 }
 EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_part, "SND_SOC_SDW_UTILS");
 
+static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_sdw_id(const struct sdw_slave_id *id)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+		if (id->part_id == codec_info_list[i].part_id &&
+		    (!codec_info_list[i].version_id ||
+		     id->sdw_version == codec_info_list[i].version_id))
+			return &codec_info_list[i];
+
+	return NULL;
+}
+
 struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_acpi(const u8 *acpi_id)
 {
 	int i;
@@ -887,22 +900,46 @@ struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_dai(const char *dai_name, i
 }
 EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_dai, "SND_SOC_SDW_UTILS");
 
+static int asoc_sdw_find_codec_info_dai_index(const struct asoc_sdw_codec_info *codec_info,
+					      const char *dai_name)
+{
+	int i;
+
+	for (i = 0; i < codec_info->dai_num; i++) {
+		if (!strcmp(codec_info->dais[i].dai_name, dai_name))
+			return i;
+	}
+
+	return -ENOENT;
+}
+
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
+	struct sdw_slave *sdw_peripheral;
 	const char *spk_components="";
 	int dai_index;
 	int ret;
 	int i;
 
 	for_each_rtd_codec_dais(rtd, i, dai) {
-		codec_info = asoc_sdw_find_codec_info_dai(dai->name, &dai_index);
+		if (is_sdw_slave(dai->component->dev))
+			sdw_peripheral = dev_to_sdw_dev(dai->component->dev);
+		else if (dai->component->dev->parent && is_sdw_slave(dai->component->dev->parent))
+			sdw_peripheral = dev_to_sdw_dev(dai->component->dev->parent);
+		else
+			continue;
+
+		codec_info = asoc_sdw_find_codec_info_sdw_id(&sdw_peripheral->id);
 		if (!codec_info)
 			return -EINVAL;
 
+		dai_index = asoc_sdw_find_codec_info_dai_index(codec_info, dai->name);
+		WARN_ON(dai_index < 0);
+
 		/*
 		 * A codec dai can be connected to different dai links for capture and playback,
 		 * but we only need to call the rtd_init function once.
@@ -912,6 +949,10 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		if (codec_info->dais[dai_index].rtd_init_done)
 			continue;
 
+		dev_dbg(card->dev, "%#x/%s initializing for %s/%s\n",
+			codec_info->part_id, codec_info->dais[dai_index].dai_name,
+			dai->component->name, dai->name);
+
 		/*
 		 * Add card controls and dapm widgets for the first codec dai.
 		 * The controls and widgets will be used for all codec dais.
-- 
2.47.3

