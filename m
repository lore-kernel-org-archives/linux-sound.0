Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A30341061;
	Thu, 20 Nov 2025 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646287; cv=fail; b=lThQJPm1cF68JVIeewl987c2afJB0TAf8TIk7BO4CfSNd90CcRKO9TZO3ep59pn7tqK9dJIxcY7vSwdhwu7V2IoynYgezKEdY04ErIV6GSWnVI9h+VUIntku4u+mQiEGuie0eIy5sDkROrjbQjzQwp9MIfjOclyJzx7BechIKdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646287; c=relaxed/simple;
	bh=hdOpCkGzmp6pOwm/ziw0nuyj5Jtt7QdQSaOkevLayPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsqKb7NfCwT9EbyvZfLQPZSyGcHDPa0hSC2M2JMmogYuNd2nWCQpEFBxHJ097RzD4o1lpRDHRC3c8oOsd8jIOQvYkbXd+mIOd9zlC1b0xmWgARy3CO564X3ruTUt3TEgAPKAKwa4Ox0Zr2YU8LVeD0wZ8AK7EwAVqz8LsAV9oB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Si8hMGO8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RoQTzIYg; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Si8hMGO8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RoQTzIYg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK3soDC262792;
	Thu, 20 Nov 2025 07:44:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/sotpVrywc4pCQVg9bkQjwPiX8nXUhLIt0Yb9Dfm6sc=; b=
	Si8hMGO8csDPplasDc4HU+hyjrnZETAjI5Du2B4qaVG2iR1KZD7JUmqjnyZtARxP
	jBkMOHBmUTXMhO2vWwA7YeEnqPVnFwU7jYgg4IKlLnaU5e5Aj0MHK8yj5iG8VCQ8
	KzHa7xCb4XievMRmGain7jfg52+jn+s6phrHknsmEaklGJO4iQvmPKvxBKNKFya4
	UbLxpkn1WpvlLd5EWkYdhR2CMqRhZGqKMKzUmLfot+PVS/qL4kmEGkT0GyAiwrVM
	yK4CEAaxvQ+RzTZE0sWUPgKzwLm/IHi2xel4lL/mhV5LueFNrzUmjS0+tPBryMqD
	6Zi067yznMn4Eehnjyw2nA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022111.outbound.protection.outlook.com [40.107.209.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1eg5d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:44:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqPXHyWurcGXO5k/3tb+YPAYkkx91iimExr/9cJ4s5buymQ9dxenB5ZM/+F7YXprPGRzMbNV6Uzvsijfjygg8f1CAtVEJaHkigz6dEcLJSVvdRbNMWIFGgXjtdyNk9tfYPu5qtoM9vLU69kL5ofRPJmjNpfFEwpGGwj5y3jxbab58+wBTWtIPAYmxHWP9lVKMpL0myGVseYW6gECAWessmRcquDHo3GVtHf6vtv+CCGW9rR31dr6P9kt3YkzOAwB7QqExIhDr9KBK82gavthXPzKCgw6QQVhOWHO6xTaVfnzVPFZVV0oa+cTn4rtyqQpYAaK0qgWwDyPizegA4Ge2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sotpVrywc4pCQVg9bkQjwPiX8nXUhLIt0Yb9Dfm6sc=;
 b=lU534nbgGP2lFJN0KvJXFcy2TNreLCkXDBRmnjPfQlaWsTCRxbdzaNe1JuN3Vv1R1ikt61OIiCgECEvOhEm7aRoQDtqp1rGCFdsffuyFfZBL/eiyRvl1TXkb7zGeefRmy2Si3OmX1orLrMpHRNRqU3dPQ2Ih6vS8z3HSj/d2Jejbh4eOHoImYkl7b4Jff/tnlbaByRFix0aoCLiuveZN16xJuKKUW+wKygYYLt7SxOuk4erTZ8JbIB+r6Rtl8X03YDSn38ZvqN01gO7Zhm8zWmoACPGb5O2Srxud8i4u39fH9kML6yHEkdokkYLAy10bT86NKW6enamrkEVhRUteeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sotpVrywc4pCQVg9bkQjwPiX8nXUhLIt0Yb9Dfm6sc=;
 b=RoQTzIYgDMLthokK7XBJ4SQwO7aNDrzHND0UVMLGWXoWHPhdbXr/GQ261PkS8Pgkgv99VKe981kyrMa6PRNxE+LJHph9KhaLa26oPgbSjRo5Zh579WlguOxZ0RpFnteVTSnhL7d/B5/ZSVzYjAZ+e1oy9ePR0YVNPQXgitEYY6k=
Received: from BN0PR10CA0023.namprd10.prod.outlook.com (2603:10b6:408:143::20)
 by LV3PR19MB8420.namprd19.prod.outlook.com (2603:10b6:408:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 13:44:39 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::24) by BN0PR10CA0023.outlook.office365.com
 (2603:10b6:408:143::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 13:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 13:44:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9714A406552;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8AF48820247;
	Thu, 20 Nov 2025 13:44:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/4] ASoC: soc.h: Add SND_SOC_BYTES_E_ACC() to allow setting access flags
Date: Thu, 20 Nov 2025 13:44:35 +0000
Message-ID: <20251120134437.1179191-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120134437.1179191-1-rf@opensource.cirrus.com>
References: <20251120134437.1179191-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|LV3PR19MB8420:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 65cff45c-c325-4a7c-53db-08de283af360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+B4LKTAwhXwIZ2x7sdC2M/F7bS8LBogYfmu9l9wXgd3JvuK7H1OYXSHSz7dJ?=
 =?us-ascii?Q?oQ2qX+vXu6PPKN5VgLu+kfAmATeokl6/W8bz5Vs2tAghWah7l4APVKbGqXgI?=
 =?us-ascii?Q?gHDxNVviIfeJwAC9siOOFVYc3GSOf0p5xnhVpmfNoZEl5GciHg1J7WQa3xBA?=
 =?us-ascii?Q?D/p9fViVrudoeluo0gfLaJjfRT5wByhEYD40wzJyupboDXM089GElQc9CYfe?=
 =?us-ascii?Q?Dn8O7u0n/eSTYkSVxKI0FJys02eV1dm2tSgh/cDkZbv2RnxwEprv8FbEOrqU?=
 =?us-ascii?Q?SgnqrplDuZsSVl+B2BEuO8iuZVitA08kjEQ51GBPkQXg0yTfTllE9RI4IOXw?=
 =?us-ascii?Q?P7Lxfm7eZiear6LRWL1Q6ndWz8DJTriZ3wSR5CKpudi1azT2l7tn6g5qgv/C?=
 =?us-ascii?Q?a/nbAlVd6/3lPag1iAO/vUHRLtrATz0E4LAjlwBP5aDbjBAxBztoSr3BAEdA?=
 =?us-ascii?Q?3XPDJ0SFA71J+IFQ/+ON0L3vBqgURUvpWFUJ42nxncAUMc+IU6rKf3kNjE74?=
 =?us-ascii?Q?Q+K/wom/hbaeEBtVONTAkRa7ZQGpCjUsiJo8Hj1+f8uURWdWkKxgaIKpOxob?=
 =?us-ascii?Q?T0mYUI+vBb/L/V5skxYxbJZTXBkWaNd4BwUkk/Bu3NmyWQUvtzdgQWl5Vw53?=
 =?us-ascii?Q?v9Aqc/CwMLuiZTs6yDYijNvFz8yiRgxbV+JwFolydGlJ29Rrk3VURJHDzzd+?=
 =?us-ascii?Q?nEmfjsJXNDqRjx6MgKNN7DbtCm354eIAlKd9jMQ9v8tXmErm1XhV2km/mrxf?=
 =?us-ascii?Q?oYtB3XYV0AolVBlOxjM+YvuO2GwESzg98Kj518FhhpdTw3maEgcE7K7j3Kzn?=
 =?us-ascii?Q?ANPrmmmTvzXlAQaoIiNsjnjjwCb0C6/46iu7PDIPg+qDMJGrrahTpJ/mvb4J?=
 =?us-ascii?Q?tfgMKfYpEO/2JDWyW3dVtJJ+K62kEn/hByf5CXV5+TAxp0u1hMJAiyiB0E9P?=
 =?us-ascii?Q?vwclT1DkXTngxIHQoZWXAsN4dsttuBK9aTicnWubTJ20kokeCsSFMZnyTbs9?=
 =?us-ascii?Q?9h2cxpC/7bNwTqNwnpGUGfk8VFhE5FeidrU60qhRygOGHXZAv2O58pM0ggCE?=
 =?us-ascii?Q?4TUFVx3vcYYFrPYirkyct8tH1ettxThUdkxr7LroVxoh/wBGuqo9scHDPkhe?=
 =?us-ascii?Q?XRrv5ZCd/G8JloYzelLUslZ1+lkd1b7E8NdueflOBzC02oLsxY6bz7w9sVH5?=
 =?us-ascii?Q?vlE1cWvKgAYPmeGvpMzpY82bAEpZp+MdlM3LDbJMkCNoP+xPgIFPTV1IvWDN?=
 =?us-ascii?Q?Hn3B5O3ZzZHF0eAmkkxLVuC6BMEMFDMQzX4UiCXCyd0Csdh1NBuOsDXxwozW?=
 =?us-ascii?Q?yrwIkAlRuEsF4MseVqugeY1TKHcWJhXCx2gzixkolGmQ+BWSYyCfHPQ+augt?=
 =?us-ascii?Q?Aro6l+NrYsuytx9KP6R/PbI/3PzIkjzqTIxTXLZEFMu/JwU3p3f4qDiztp0e?=
 =?us-ascii?Q?a2v8Ijdr5ydeutUqReH48Zf3dl+BH3UaGyoCs410nj/+f/15IfcCRwyj9QUG?=
 =?us-ascii?Q?B/3tl4CcxOIlrlMQJSCRsBjWs6jUdS/fZqpcuWPeesYfV7iJUbNsJHfVtdBL?=
 =?us-ascii?Q?LRrSHNMvxbw3A8KfTiA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:44:38.7460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cff45c-c325-4a7c-53db-08de283af360
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8420
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f1b4b cx=c_pps
 a=J7ZdHMUHR0uI/sEcOv84ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=1CAcU0HOnAuBGusv8tIA:9
X-Proofpoint-GUID: SxIZgtGR7v0iRIIQxHeX__KeRR6gZC7J
X-Proofpoint-ORIG-GUID: SxIZgtGR7v0iRIIQxHeX__KeRR6gZC7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4OCBTYWx0ZWRfX3kLugr7cX0Q9
 qZUBQqtJg8O0zjh6CtCTEz4rkfUOlgJ71gJNDtZ6Ro0thptaqWrOeViSA5pqTqOUaPCnYxJkkbo
 uf0or63AxaiuzYkWzzWB3B26nRgG7UzOclm2FfVLONgrebm4QdLHMFbAVE9JNhBFc8aXN4GvA0e
 5o8fqZwoGyUYV0G4ZAk/lzbDy2f7rdu2Pqv4KNh5yRL7/1P98XI+Ug9CA95z/S8tI76t/A+5HRn
 o8v4nDy4a9xlyEgUtrUSpDkfNqG5koLFbN7FsmKHjxn4Omj08yzAcqYJPZXidf7xVqwYN0Z3MUw
 t28OLvM1OBOzn4wmtBer4j1xsejpiHUuvPZ888ahJWhhXf4Bx8t2Ojwf+kG1RcMVEGLUHuvWJpB
 knVnOUrQvtVoAw88hr0O7O9ZDKbFQA==
X-Proofpoint-Spam-Reason: safe

Add a macro SND_SOC_BYTES_E_ACC() to allow the access permission flags
to be set. This is the same as SND_SOC_BYTES_E() but with an extra
argument for the access flags.

This will be used by the cs35l56.c driver to create a read-only
volatile byte control. It's preferable to avoid custom control macros
in codec drivers. Code maintenance is easier if all control macros are
defined together in soc.h.

This commit only creates this one macro that is actually going to be used.
There's no point cluttering soc.h with unused macros - that just adds a
maintenance burden. People can add equivalents for the other macros if
they need them.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/soc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index b1b6b6a497da..aa0fe6b80293 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -338,6 +338,13 @@ struct platform_device;
 	.put = xhandler_put, .private_value = \
 		((unsigned long)&(struct soc_bytes) \
 		{.base = xbase, .num_regs = xregs }) }
+#define SND_SOC_BYTES_E_ACC(xname, xbase, xregs, xhandler_get, xhandler_put, xaccess) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.access = xaccess, \
+	.info = snd_soc_bytes_info, .get = xhandler_get, \
+	.put = xhandler_put, .private_value = \
+		((unsigned long)&(struct soc_bytes) \
+		{.base = xbase, .num_regs = xregs }) }
 
 #define SND_SOC_BYTES_MASK(xname, xbase, xregs, xmask)	      \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname,   \
-- 
2.47.3

