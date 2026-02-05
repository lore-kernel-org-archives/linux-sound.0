Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888B2436372;
	Thu,  5 Feb 2026 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310143; cv=fail; b=d+UjqfS6OiCRinp7hyYD29ntKuRPuDkakVPP62ivV9w8wqU/3Yd8+xf4VDDsaU4UPhfoKJlAARYS/fcoIv4c8GrBQBhCftcQc+35H1cBrNUn3x37ydekFC7D81H7894YMiGNlJJqDmWkwELg2eNBf5DlepTEupqG2dcRrWVolQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310143; c=relaxed/simple;
	bh=tKdg2hYhrvlFOLZ8f4i++L3VJ2WvdXWEImh1Sa/aNOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRAivKDs8eaEzMqt7ra6P5TSQGLKR/zryHzdXna2CGEU+2r0RlyBkPyRNvZ6WjNQQFwGhdcsi2VpTsP1qVqsOa2tTk5X0i/+xJ6p4bO6DXE6d7gyJT9U15NfPv7J/TUI6ag0tGUkxTcBzvebyONxUfYLVFku6qmbON0VFCKI+b8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZcbM9u92; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=P/H4/oxS; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZcbM9u92";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="P/H4/oxS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6154kNXL3192133;
	Thu, 5 Feb 2026 10:48:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=EaCijJC8t99tGo1GVhMO76ATfy+8n7p2sQn9PXa8GEg=; b=
	ZcbM9u92bST/5A4WyybJZIr83qaw0c31tYV7OMRBFi1RBQFOfRB2gpNY5b485m3S
	wIRr6wkS3SPYJmH7cwwOYmFuq6mrhpSEiIvfr7gBYrWt9LhPJyLxVOLZgXFpz52A
	yzJ0YDSzFbkitsHYOGoIHb/Z7CPATaX2r96gkwtgNVcIAVYKwcUmKhITPZLBizPi
	Z9Bwee41iNalQb4Cy4UKlM/iOP3p6PNB4TqfjgvZbESmIZI+kbt3/qhVItYXKMZd
	BK2BMd8h01j2IhfpoAqOaAVwupBQ7xy27kVZDVpRDFBDbVXxMwaJC0WeMb+gBquk
	vBHUskxXPXHdIgCUnouD1A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021073.outbound.protection.outlook.com [40.93.194.73])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4c1f1k6bsu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 10:48:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg9/u6KLwZT5IYG28LslBwKeIc8FvnJStOKlppF/tuaezoGCu5fHEE0G1pb2h5PW5ichqO+ixM2euD/jVcgioYTppdQBUvgbFLHmr3lNM71n1ldN7nQNafryKSAFrsy7ezXhaReUOSBuKXKwq4DaLEFe2FUSaK151ju5TljnVz81UWqwXwLEv/dicwL+mklXzQdrjzfIPqLVm8ADgciB9iqH/5ZA22HLtTMS35T0ikNcT6LF9+DGnGR8MeAm1iW3IFe8UFA9oRTQDObqge7ByJxFk3+5P5xJo52xxXA3LaDpPc/eTTkDRVckzYSCwsU34TxiG7rpcPJFjkSYLWeaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaCijJC8t99tGo1GVhMO76ATfy+8n7p2sQn9PXa8GEg=;
 b=Q+l88ca0mVfL4yb18FADhuQo9z/qiTymKIw48xHIbG6yti+YWn6K6570RBJFpR3HxzmJS9nAgIebwvc4h0Z33y4G4q1uEZVs41HgB5etOTlPKLlbCksYNPftEeGYReKuJjk6Uw1NvTiR3SnqF9Q4rewjcudleDZ4O4wG5dy/VOH/Ik6ELUSiRa2U45+O8842zrFZH6crOUorl06Irq4ZZ9fp6VgSiCL2Vb6i/BhOwAzFqzus/r0FAR9kPKPBdKrYtAQJ4B6mYK8IwPsCxQ63JxZjjqHimpk9juw18fhkpgcB5gdZ1j/LPDjiWgDUwnGDmlYY4CWk4x5zgG9/VJ4YNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaCijJC8t99tGo1GVhMO76ATfy+8n7p2sQn9PXa8GEg=;
 b=P/H4/oxSVbYo8T3U/m3MSU54Kp/e1I+chLt3SEWHEXFAsGmoTKfA7h97DEzhexH4f1DqCwaNoCr9dNL3jVrsEaKdy1okg+nUMpJc8rU8enqu3GOFMjCugKe9C2p4R9vtjxgy1bg+VbwjIy5qXCm87EGhqxHD1mVEsztTP/5DmZI=
Received: from BL0PR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:91::11)
 by SA3PR19MB9550.namprd19.prod.outlook.com (2603:10b6:806:496::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 16:48:40 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::7d) by BL0PR05CA0001.outlook.office365.com
 (2603:10b6:208:91::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 16:48:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 16:48:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B7A04406554;
	Thu,  5 Feb 2026 16:48:38 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9E77D822542;
	Thu,  5 Feb 2026 16:48:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: cs35l56: KUnit tests for parsing and using onchip GPIOs
Date: Thu,  5 Feb 2026 16:48:38 +0000
Message-ID: <20260205164838.1611295-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205164838.1611295-1-rf@opensource.cirrus.com>
References: <20260205164838.1611295-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|SA3PR19MB9550:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0dac4287-3c98-4aad-2e13-08de64d66a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W9xaermtmTyze3GOCIvX4g6iH55WwRqrKLyXShOQtgDe8lykocNA1xHXZ+6B?=
 =?us-ascii?Q?5DR9jk3yD2dZQ/FLEUf9LzUMW0IjP8vJB5OheK6EOOZ1mSwmDs+8S2JSJ7xh?=
 =?us-ascii?Q?cZnSJjxyumHeo6ZVeZptUG9GJENwG6aIoZss46aNHOfpa2x4RmKMyQebJ/fH?=
 =?us-ascii?Q?2yAqbBqLj9RyWUjM06dGxDOS5BDaHtieXgQb9J1cRz9cxB+KPEKLjyjWA3w5?=
 =?us-ascii?Q?fJDzDbGlOxn1TQRdsW6QeZPJsa9uU6v1nueZVaiM5D19StJgm2gbs7YabqIZ?=
 =?us-ascii?Q?lBCP7ROlAcaXIvtrxfpO37nYPxB2sEjD/5fUuV/sGpGHOJ3TihZy/aqAK4h+?=
 =?us-ascii?Q?uTGR2NR//PttiTZjkhZiGo3HjQKwi5RQuMYhFNbsM3QcMgCF6HdUSrdk1RpS?=
 =?us-ascii?Q?jcjMruJekFRajkucDIP3g+a3aHi9bkS7IGOSNoDrLfCzPKWDGGLsDLpXN9Pv?=
 =?us-ascii?Q?E9XLsWkJouLykwLf5xJsDLuK4UpfmaLgt1dJutERAQoB5h667X+Z5ioOScAy?=
 =?us-ascii?Q?N/iNmkzESftm4c7oIghd0JGPuMvLEjufGp6R2cmULFKCBCiodDb8OMX2qxCK?=
 =?us-ascii?Q?Gjzt8mDSguir3jHf+t0j1pvsIKg0Ac8/O18qivibNiwldm0rx+ZFclkgKM9H?=
 =?us-ascii?Q?C+l6HlVuRbl5VaMeEJgpzL9ir0cjSq01ameXtFaZeruWD2q/+cyprxroI6qW?=
 =?us-ascii?Q?QkY06gveQCt72L/p8VLHXi3oZDWpK4KkXQ/caU4EhI/47JXVFOrTB+SQYyF6?=
 =?us-ascii?Q?ru1QnHdc7jAbIba7XSeQcMKMkaCUAQavMD1UBQ+AL8Sm4GEaus4mBXMzLNKy?=
 =?us-ascii?Q?r8SQcIBxl+a42PY99sbKVyvQApkrW6ng0IrqImZ5UfHXkXkDIBRScCnH9aat?=
 =?us-ascii?Q?86YrA3aJUUCbsAx1itLpF+pR++pj/wZQr5r1wO1j/3D7LpzdIvXEz8BG+3Cn?=
 =?us-ascii?Q?NHGxhHG2wUMSiKZsCA7nK9GMSACTR/JqnrufU9v1iqDMZt5fQ3Y+Zxtax9Sl?=
 =?us-ascii?Q?sqcq1srn48p90pJdhnpoSpP8sXHW5fIjfwgnTZWGjIa9bAHn3W4oJoDO2dZm?=
 =?us-ascii?Q?TMHZSdMZVA/mWkXZZ29skiy1pWCU/Cw82pePUCmXMq7KaMHg1dhYmcBVZX5l?=
 =?us-ascii?Q?AFvUdP8GbMeujWgUnHP+W4q7cgHpaEpwnSyCUbCeBGYu2mHEYcTPIr6Q8awG?=
 =?us-ascii?Q?lqxXLa1PydHJF0Z9ETiHi4yD+WYPaQiOujF4VVfhjBxUeJZVesdirQjGcrBc?=
 =?us-ascii?Q?i0LBrW0t9gfh6SQF4770mG+4dBMdU+yubSMuPJNifttT3nUIfvClrkRZAYGe?=
 =?us-ascii?Q?c95l0cs4bNoWGjpYtpYvsG8wAAKa7tLZzpJxJokGVBiRuJR6bHfpOSpkSBzS?=
 =?us-ascii?Q?DtBV9/4p9U3Rwv5fqGkQ+3fs3pXW3Auh9smybYfTYi9+mX4+6YD76DU7+Yvm?=
 =?us-ascii?Q?6ydnzsl9w5/egYrooEkVZBQZCu5x8nqwcl3vkKjCpgZYHA906GESwWjTAo1I?=
 =?us-ascii?Q?wFTdOh0cdmhXmjTXTcEdUVt/AN8l5MlK6smBzl7RjlMWebjmcIzNzAhd415e?=
 =?us-ascii?Q?R0FypI894vaHCpXnLWrXIkA8qWJNOlmWBYtrr7epcDxsKcy9FiH9izKdddoc?=
 =?us-ascii?Q?BBilxiGShe4MlOI9AQRMJKv+rZKUWD5nXwryfjPABw9JCTzd0vfTbCi/Qer4?=
 =?us-ascii?Q?6qiVyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZdqH8qW2yko7nXklCsL8mxC2Rtl03nFxt+XtBqREV7OVJYGL13iD0qXBnZcQIvH2VE8C24mrpyecInITGSsutsccJ0qC7PQNJj7saqGjC+j5g4fqC20J3FGaBNWxAQHFyCoxVQTDU4uVaAXt63UGuff8nXowhs4/ihUZdrPoXqHGzK0t5LuSzM6UYp3Kx23ojO4uda6NBnZ0Zb/QzGmwxBFUZPFya7GV1lOb90a8FZvrvK/JugK0l4Z8VhfclBirkPEPJXhpsj4WtpFyeKpqRLYqEsCzUnceNXHPhxX82Qu0xF2zndiUY+kCwYXxzedQLs7FqX+gkoMOk0FxR7C3w6/uLHbXK3313oKg6UwXRXoXbkYtNV5eeDvbwNJ9TsTqtzZ4L0yiTIVuxPRO15tKu5KPJhhtUNpQlvVCsDpB5GAaKJGWZKJdmfMpoSYzZ/nl
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:48:40.2055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dac4287-3c98-4aad-2e13-08de64d66a67
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9550
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=6984c9ef cx=c_pps
 a=tL1cjTdHg3x6ttwi1NwRWw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=xMh_egJBMxf9Zk9P8v0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyNyBTYWx0ZWRfX+6CyZdlA71Zn
 1gLJKaxTXN+0Q5aW0JHL01at/GA6c7Au6BBrtVl1/1SyR0yVZC5al/ZtAtBzq1z2TfRgzY0CXz3
 rCI+XBzwLVcy994DB7ak3PsZ4AJ6wYFV/1N8lrhsc3EUmsS9YM6ifjdnvRe3LYyhUCSC9SjDdyO
 fh3flfBeDVV3UoQwHwEIW0ZOJeBVS5OhIYk4Uex5BZiscYwRML5vpb8YIxsoYwaiKKa4vx//K/B
 FW2Ff19CiG+KkE/LwZSjuZdYTK9frI9ytRqiEFImHNZmc+lDFVncPj7ZZiQq56n2c1RkAoSIQxy
 ytbb8XFXySMWZxqceeHUMherBvHDm3k8/N/kGI3oTGox1asptPTR5jgF59NUPOaIfoG7emKfLQz
 zGQ7o4RiGkp3e05vLdOcDSqeLL3hH8nyZfntF5hqIhaHRoTObKjOzbEh2lvnyoqF9no/xqLtm4Z
 ZvrjuAJ4hYmDm42Njdw==
X-Proofpoint-GUID: tQFLLuqQMOnHgKFQ7pbd-yrxpf4rEyxs
X-Proofpoint-ORIG-GUID: tQFLLuqQMOnHgKFQ7pbd-yrxpf4rEyxs
X-Proofpoint-Spam-Reason: safe

Add KUnit test cases for:

- cs35l56_process_xu_properties() which reads the onchip GPIO definitions.
- cs35l56_set_fw_name() calls functions to configure and set the GPIOs.
- cs35l56_set_fw_name() saves the ID value in cs35l56_priv.speaker_id.
- cs35l56_set_fw_name() does not overwrite a speaker ID that was already
  found some other way.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 273 ++++++++++++++++++++++++++++++++
 1 file changed, 273 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index a7b21660c402..b6c8c08e3ade 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -15,6 +15,8 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/pci_ids.h>
+#include <linux/property.h>
+#include <linux/seq_buf.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/cs35l56.h>
 #include <sound/cs-amp-lib.h>
@@ -23,16 +25,46 @@
 KUNIT_DEFINE_ACTION_WRAPPER(faux_device_destroy_wrapper, faux_device_destroy,
 			    struct faux_device *)
 
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_node_group_wrapper,
+			    software_node_unregister_node_group,
+			    const struct software_node * const *)
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_wrapper,
+			    software_node_unregister,
+			    const struct software_node *)
+
+KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
+			    device_remove_software_node,
+			    struct device *)
+
 struct cs35l56_test_priv {
 	struct faux_device *amp_dev;
 	struct cs35l56_private *cs35l56_priv;
 
 	const char *ssidexv2;
+
+	bool read_onchip_spkid_called;
+	bool configure_onchip_spkid_pads_called;
 };
 
 struct cs35l56_test_param {
 	u8 type;
 	u8 rev;
+
+	s32 spkid_gpios[4];
+	s32 spkid_pulls[4];
+};
+
+static const struct software_node cs35l56_test_dev_sw_node =
+	SOFTWARE_NODE("SWD1", NULL, NULL);
+
+static const struct software_node cs35l56_test_af01_sw_node =
+	SOFTWARE_NODE("AF01", NULL, &cs35l56_test_dev_sw_node);
+
+static const struct software_node *cs35l56_test_dev_and_af01_node_group[] = {
+	&cs35l56_test_dev_sw_node,
+	&cs35l56_test_af01_sw_node,
+	NULL
 };
 
 static const char *cs35l56_test_devm_get_vendor_specific_variant_id_none(struct device *dev,
@@ -232,6 +264,190 @@ static void cs35l56_test_l56_b0_ssidexv2_ignored_suffix_sdw(struct kunit *test)
 	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "l1u5");
 }
 
+/*
+ * Test that cs35l56_process_xu_properties() correctly parses the GPIO and
+ * pull values from properties into the arrays in struct cs35l56_base.
+ *
+ * This test creates the node tree:
+ *
+ * Node("SWD1") { // top-level device node
+ *	Node("AF01") {
+ *		Node("mipi-sdca-function-expansion-subproperties") {
+ *			property: "01fa-spk-id-gpios-onchip"
+ *			property: 01fa-spk-id-gpios-onchip-pull
+ *		}
+ *	}
+ * }
+ *
+ * Note that in ACPI "mipi-sdca-function-expansion-subproperties" is
+ * a special _DSD property that points to a Device(EXT0) node but behaves
+ * as an alias of the EXT0 node. The equivalent in software nodes is to
+ * create a Node named "mipi-sdca-function-expansion-subproperties" with
+ * the properties.
+ *
+ */
+static void cs35l56_test_parse_xu_onchip_spkid(struct kunit *test)
+{
+	const struct cs35l56_test_param *param = test->param_value;
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	struct software_node *ext0_node;
+	int num_gpios = 0;
+	int num_pulls = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++, num_gpios++) {
+		if (param->spkid_gpios[i] < 0)
+			break;
+	}
+	KUNIT_ASSERT_LE(test, num_gpios, ARRAY_SIZE(cs35l56->base.onchip_spkid_gpios));
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_pulls); i++, num_pulls++) {
+		if (param->spkid_pulls[i] < 0)
+			break;
+	}
+	KUNIT_ASSERT_LE(test, num_pulls, ARRAY_SIZE(cs35l56->base.onchip_spkid_pulls));
+
+	const struct property_entry ext0_props[] = {
+		PROPERTY_ENTRY_U32_ARRAY_LEN("01fa-spk-id-gpios-onchip",
+					     param->spkid_gpios, num_gpios),
+		PROPERTY_ENTRY_U32_ARRAY_LEN("01fa-spk-id-gpios-onchip-pull",
+					     param->spkid_pulls, num_pulls),
+		{ }
+	};
+
+	KUNIT_ASSERT_EQ(test,
+			software_node_register_node_group(cs35l56_test_dev_and_af01_node_group),
+			0);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test,
+						  software_node_unregister_node_group_wrapper,
+						  cs35l56_test_dev_and_af01_node_group),
+			0);
+
+	ext0_node = kunit_kzalloc(test, sizeof(*ext0_node), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ext0_node);
+	*ext0_node = SOFTWARE_NODE("mipi-sdca-function-expansion-subproperties",
+				    ext0_props, &cs35l56_test_af01_sw_node);
+
+	KUNIT_ASSERT_EQ(test, software_node_register(ext0_node), 0);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test,
+						  software_node_unregister_wrapper,
+						  ext0_node),
+			0);
+
+	KUNIT_ASSERT_EQ(test,
+			device_add_software_node(cs35l56->base.dev, &cs35l56_test_dev_sw_node), 0);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test,
+						  device_remove_software_node_wrapper,
+						  cs35l56->base.dev));
+
+	KUNIT_EXPECT_EQ(test, cs35l56_process_xu_properties(cs35l56), 0);
+
+	KUNIT_EXPECT_EQ(test, cs35l56->base.num_onchip_spkid_gpios, num_gpios);
+	KUNIT_EXPECT_EQ(test, cs35l56->base.num_onchip_spkid_pulls, num_pulls);
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++) {
+		if (param->spkid_gpios[i] < 0)
+			break;
+
+		/*
+		 * cs35l56_process_xu_properties() stores the GPIO numbers
+		 * zero-based, which is one less than the value in the property.
+		 */
+		KUNIT_EXPECT_EQ_MSG(test, cs35l56->base.onchip_spkid_gpios[i],
+				    param->spkid_gpios[i] - 1,
+				    "i=%d", i);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_pulls); i++) {
+		if (param->spkid_pulls[i] < 0)
+			break;
+
+		KUNIT_EXPECT_EQ_MSG(test, cs35l56->base.onchip_spkid_pulls[i],
+				    param->spkid_pulls[i], "i=%d", i);
+	}
+}
+
+static int cs35l56_test_dummy_read_onchip_spkid(struct cs35l56_base *cs35l56_base)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct cs35l56_test_priv *priv = test->priv;
+
+	priv->read_onchip_spkid_called = true;
+
+	return 4;
+}
+
+static int cs35l56_test_dummy_configure_onchip_spkid_pads(struct cs35l56_base *cs35l56_base)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct cs35l56_test_priv *priv = test->priv;
+
+	priv->configure_onchip_spkid_pads_called = true;
+
+	return 0;
+}
+
+static void cs35l56_test_set_fw_name_reads_onchip_spkid(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	/* Provide some on-chip GPIOs for spkid */
+	cs35l56->base.onchip_spkid_gpios[0] = 1;
+	cs35l56->base.num_onchip_spkid_gpios = 1;
+
+	cs35l56->speaker_id = -ENOENT;
+
+	kunit_activate_static_stub(test,
+				   cs35l56_configure_onchip_spkid_pads,
+				   cs35l56_test_dummy_configure_onchip_spkid_pads);
+	kunit_activate_static_stub(test,
+				   cs35l56_read_onchip_spkid,
+				   cs35l56_test_dummy_read_onchip_spkid);
+
+	priv->configure_onchip_spkid_pads_called = false;
+	priv->read_onchip_spkid_called = false;
+	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), 0);
+	KUNIT_EXPECT_TRUE(test, priv->configure_onchip_spkid_pads_called);
+	KUNIT_EXPECT_TRUE(test, priv->read_onchip_spkid_called);
+	KUNIT_EXPECT_EQ(test, cs35l56->speaker_id,
+			cs35l56_test_dummy_read_onchip_spkid(&cs35l56->base));
+}
+
+static void cs35l56_test_set_fw_name_preserves_spkid_with_onchip_gpios(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	/* Provide some on-chip GPIOs for spkid */
+	cs35l56->base.onchip_spkid_gpios[0] = 1;
+	cs35l56->base.num_onchip_spkid_gpios = 1;
+
+	/* Simulate that the driver already got a spkid from somewhere */
+	cs35l56->speaker_id = 15;
+
+	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56->speaker_id, 15);
+}
+
+static void cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+
+	cs35l56->base.num_onchip_spkid_gpios = 0;
+
+	/* Simulate that the driver already got a spkid from somewhere */
+	cs35l56->speaker_id = 15;
+
+	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), 0);
+	KUNIT_EXPECT_EQ(test, cs35l56->speaker_id, 15);
+}
+
 static int cs35l56_test_case_init_common(struct kunit *test)
 {
 	struct cs35l56_test_priv *priv;
@@ -263,6 +479,7 @@ static int cs35l56_test_case_init_common(struct kunit *test)
 	cs35l56->component = kunit_kzalloc(test, sizeof(*cs35l56->component), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, cs35l56->component);
 	cs35l56->component->dev = cs35l56->base.dev;
+	snd_soc_component_set_drvdata(cs35l56->component, cs35l56);
 
 	cs35l56->component->card = kunit_kzalloc(test, sizeof(*cs35l56->component->card),
 						 GFP_KERNEL);
@@ -299,6 +516,50 @@ static int cs35l56_test_case_init_soundwire(struct kunit *test)
 	return 0;
 }
 
+static void cs35l56_test_gpio_param_desc(const struct cs35l56_test_param *param, char *desc)
+{
+	DECLARE_SEQ_BUF(gpios, 1 + (2 * ARRAY_SIZE(param->spkid_gpios)));
+	DECLARE_SEQ_BUF(pulls, 1 + (2 * ARRAY_SIZE(param->spkid_pulls)));
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_gpios); i++) {
+		if (param->spkid_gpios[i] < 0)
+			break;
+
+		seq_buf_printf(&gpios, "%s%d", (i == 0) ? "" : ",", param->spkid_gpios[i]);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(param->spkid_pulls); i++) {
+		if (param->spkid_pulls[i] < 0)
+			break;
+
+		seq_buf_printf(&pulls, "%s%d", (i == 0) ? "" : ",", param->spkid_pulls[i]);
+	}
+
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "gpios:{%s} pulls:{%s}",
+		 seq_buf_str(&gpios), seq_buf_str(&pulls));
+}
+
+static const struct cs35l56_test_param cs35l56_test_onchip_spkid_cases[] = {
+	{ .spkid_gpios = { 1, -1 },		.spkid_pulls = { 1, -1 }, },
+	{ .spkid_gpios = { 1, -1 },		.spkid_pulls = { 2, -1 }, },
+
+	{ .spkid_gpios = { 7, -1 },		.spkid_pulls = { 1, -1 }, },
+	{ .spkid_gpios = { 7, -1 },		.spkid_pulls = { 2, -1 }, },
+
+	{ .spkid_gpios = { 1, 7, -1 },		.spkid_pulls = { 1, 1, -1 }, },
+	{ .spkid_gpios = { 1, 7, -1 },		.spkid_pulls = { 2, 2, -1 }, },
+
+	{ .spkid_gpios = { 7, 1, -1 },		.spkid_pulls = { 1, 1, -1 }, },
+	{ .spkid_gpios = { 7, 1, -1 },		.spkid_pulls = { 2, 2, -1 }, },
+
+	{ .spkid_gpios = { 3, 7, 1, -1 },	.spkid_pulls = { 1, 1, 1, -1 }, },
+	{ .spkid_gpios = { 3, 7, 1, -1 },	.spkid_pulls = { 2, 2, 2, -1 }, },
+};
+KUNIT_ARRAY_PARAM(cs35l56_test_onchip_spkid,
+		  cs35l56_test_onchip_spkid_cases,
+		  cs35l56_test_gpio_param_desc);
+
 static void cs35l56_test_type_rev_param_desc(const struct cs35l56_test_param *param,
 					     char *desc)
 {
@@ -331,6 +592,13 @@ static struct kunit_case cs35l56_test_cases_soundwire[] = {
 			 cs35l56_test_type_rev_ex_b0_gen_params),
 	KUNIT_CASE(cs35l56_test_l56_b0_ssidexv2_ignored_suffix_sdw),
 
+	KUNIT_CASE_PARAM(cs35l56_test_parse_xu_onchip_spkid,
+			 cs35l56_test_onchip_spkid_gen_params),
+
+	KUNIT_CASE(cs35l56_test_set_fw_name_reads_onchip_spkid),
+	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_with_onchip_gpios),
+	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios),
+
 	{ } /* terminator */
 };
 
@@ -339,6 +607,10 @@ static struct kunit_case cs35l56_test_cases_not_soundwire[] = {
 	KUNIT_CASE_PARAM(cs35l56_test_ssidexv2_suffix_i2cspi,
 			 cs35l56_test_type_rev_all_gen_params),
 
+	KUNIT_CASE(cs35l56_test_set_fw_name_reads_onchip_spkid),
+	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_with_onchip_gpios),
+	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios),
+
 	{ } /* terminator */
 };
 
@@ -360,6 +632,7 @@ kunit_test_suites(
 );
 
 MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_DESCRIPTION("KUnit test for Cirrus Logic cs35l56 codec driver");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
-- 
2.47.3

