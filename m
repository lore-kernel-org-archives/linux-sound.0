Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982DD33A00C;
	Thu, 20 Nov 2025 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644013; cv=fail; b=bxjaixBtNHE3iXmCyA1zWQqibYpTkYqwI31PLYdYxBg8GMY/V44/n6E7WAeVK8I2EKehUztlHJaLDJw3WoXxLR/zjTUbB6OVGtMa8HmZzkNUB7aGdE1X0RwFR3/w+/rVhkyOIn666u52DkY+OleLU+MV/+9htc3rcM6N3sxvGUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644013; c=relaxed/simple;
	bh=g3fZafAc4MVpsRfBvuAOwn4VBeN3vLMLxUtXXuDcCQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JD/bDMkF7miMSAsFC0nsqRrtvOtSwpXZoJMj9xuAchD7H+OpWi+ySwWmxPY1HIg8AwWLw3aw9v0Vo5SLwTvKBid3D3VdpiZ8/SKisqCDiPA3WFBAWGJ0Fgy1o9TAnlsAfZYo1mVMBmho8J3zujQdRSyDheLasjDkw2V9La04BGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hM89hYQS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=u2N+LMjC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hM89hYQS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="u2N+LMjC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5sZHF451043;
	Thu, 20 Nov 2025 07:06:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+JyYvMGq6CwAlNfc/N+CZnqpFbeLj/74k4SL3lu8s98=; b=
	hM89hYQSCtMUNK6lvN7TEEcvEYy6OamjPvDS2GSpYfZTjtBPlB/YJSa7anHQeRx+
	mGPKRbOd4Gn37BLLLz0rTtt9Iwhy5w/DNiZsFXMk7mM2ncamghUythAuKePyKV1F
	g6m+BlWKoIeg2Hd1htTOuyeFNyqnpdKE94qx/YQKmvMFVZdGpqThRp1D7Vc4KAWD
	SNAWYTtaSTyOHaGoPk8jwalqybQe5TqEtDZnJO59Oop9MUyjxycRaMmeENsMTyid
	CamzFC4ra0nw/WzuOiOhzqOO5wxhmwKYy9l03DA4cF+mDQY6ryIOUCwGLD2/vM7m
	8tC7l7yrQBzp7teXLmTnMA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022143.outbound.protection.outlook.com [52.101.53.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1eejk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:06:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dy0XUqEzL7bjFbMjZbIf9lFsX2kVDKSb6N3g1cB2YahXSOJlOJjGH2hrAGfIVLzJaEFUr7ZxsQVf9RYQefDg1BXjsv4Wu+3Sy6AlhxMw9tbz73ExYRYMR5ae0Thz0c29nu9n7oJ8Sv1RSlvtd3YWURJfuFZSvrSSGmjb/oNuqhL/8YvXhtM3BSNqGYCRbcpzZFsnb3hxhIq+k6CasmK15SQDjioTM0FIPo8sneBzHucPNfHQ8uIOAKun9CpiJ0T6cvHNDykrb5u0T6npBb6Ac8Qzyfq5ZMsPk+g2+YExUKKPKebKHCuSaOBCzXKgcEBFrgAgTCKsXk4qoepqO+WEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JyYvMGq6CwAlNfc/N+CZnqpFbeLj/74k4SL3lu8s98=;
 b=CyQawXGXHDtJd86zVideLin8qVblIkUds4rRKHGNTwwy91lPUQY4PJbG0njNvh9fVTD/n3rzsqXRSyDXkRXJ0upspsWmbFeC9RIy9opcMbZmMkuw5lHk1ktQLpFWmOVwMJykkb/ubmrwZUXOzhFdJb+0sXDZdpB6sb+hXB6bhUk/QmjE/B0cGVC4dbYx3zGqStutoLIYRoiO2xwjh85h4k+70KZWWPU2gA4LmlW9xkaafoxwD/6GmprjplqhW8X64oxuxiY2t8gRJiwFxu8qVUsMqBokWjCt8UkNaFEnsrKjbGSInwDc7+wsjCXaMsZduYZDCBAngJiHXZmis2fi9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JyYvMGq6CwAlNfc/N+CZnqpFbeLj/74k4SL3lu8s98=;
 b=u2N+LMjCip2lRjRYD3N75tJGKaD3LSsgLEFZ62qztkHwE0QYgJJGoCLAgswwmFPzdey+YXRFI2EIBjpJUynNCNthd+QAU8G2ZzNGJtBFT9B+ETjqVvnKHEG51Istc1M8aYGO2WGAz2TxtJ/aS1XCVmC9vXGKFt4C9mx211QP8No=
Received: from DS7PR05CA0088.namprd05.prod.outlook.com (2603:10b6:8:56::14) by
 DS2PR19MB9699.namprd19.prod.outlook.com (2603:10b6:8:2d3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Thu, 20 Nov 2025 13:06:43 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::40) by DS7PR05CA0088.outlook.office365.com
 (2603:10b6:8:56::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.5 via Frontend Transport; Thu,
 20 Nov 2025 13:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 13:06:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6443840654B;
	Thu, 20 Nov 2025 13:06:41 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5215D82025A;
	Thu, 20 Nov 2025 13:06:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] firmware: cs_dsp: Factor out common debugfs string read
Date: Thu, 20 Nov 2025 13:06:39 +0000
Message-ID: <20251120130640.1169780-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120130640.1169780-1-rf@opensource.cirrus.com>
References: <20251120130640.1169780-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DS2PR19MB9699:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 46885381-1745-4422-2df1-08de2835a6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s4eOFemGsxC85z3sXKgWjXKo879066/578OSCAjAIzlOpuW34pxrjzH5Qr/k?=
 =?us-ascii?Q?B7keQtLP5v8oc4xfOb8kqgAFQEtCG2VyOzqhl1Ey+F+cqe6vF8IaCELlRfAk?=
 =?us-ascii?Q?WPI8hA7xexDPZnK2C8wYoh6Aqe/tt3XvOdRVLFxKa3pIE52L+5/Wn/OAKruD?=
 =?us-ascii?Q?8Mi84Pmx4vDsFpCaBeTBZSpz4uV8ge2KyHsIRK/yWeIGyQdoNFc7ECPI0S+/?=
 =?us-ascii?Q?CnPVxxpZ9bV+0YE9YuMqO5eDugj4+itRa/4iDZiwIhqQuX0vTGlT+ZR9AzCj?=
 =?us-ascii?Q?VcxXf4XfyFiA9UwCxH0OyXQmLSmVBbgoIZKWyGmi6LtK/pCIsx8xKH0dqMPZ?=
 =?us-ascii?Q?06h1nNdJMAG0HzROgdWHak02YVgQG2qAlNlxA9y2V3b6aKTYRUgm1LWcXSQe?=
 =?us-ascii?Q?y06kwMYuWygTNEEndR/Y0O2VX36mTppkB9b4duNbiux3YGh9uQqTTIL8Fax+?=
 =?us-ascii?Q?dREjGqCaOb6sSYyeB9766IW5XvZ3uk1rD5UC6XbD5D6G1isdtSha4Lne4Vhz?=
 =?us-ascii?Q?jfPkLeiYtd6Y9Hl+Km4LehLWsVzp2jDHClM/PV3p7aqehfwgirnrtNrsq91F?=
 =?us-ascii?Q?W+kbH8BD6lFuqbZiZyxv80ghoCvDBxCQq10ALjUxZSHVyj5IbQmz+tGB/Wc4?=
 =?us-ascii?Q?XZ+ynTxUEIFrWcCO3ZweY8X4yllgeCwr2LCyAt5zCuVwBN5AKoL1+Kal+kGJ?=
 =?us-ascii?Q?i8cXYbVItFmYL1myIxRfXDhS9nD1LhuNBgWO9Xxf9t0+xkdByfnT0BSKaGJX?=
 =?us-ascii?Q?owX02nzef3zBvsxavlLaScpcyZ1qDo3Dd1DINksH/wzbBNXbvUBbN/+LLKhM?=
 =?us-ascii?Q?7OvbHJUH4sv+n2+MDwrUSZdSjx+VCMQw4FZmuhxu6xAv7oVuPCqy7O89QB0W?=
 =?us-ascii?Q?GYJbfdL0RooTtRIMWj01WgiLGwrbU0FX1Xo9SsCopai8XfTHw1kflg7YXv9/?=
 =?us-ascii?Q?gdzJuFHVYyh83+0F2+UugoIFbnxuMJ6tf2Mo/RpIbp3rtYS21Ktvz1jc/diT?=
 =?us-ascii?Q?THRnAggTPEiP2dcHsgbuQiPVbI9VrENoz9dJ/7kTJ9belQfcRkrH4l1hqGmd?=
 =?us-ascii?Q?HSBdyAbt5yD5wFFzzSXhE2Ra/2vNXeYKdQnl00+rsgtIMY+qDeV9Kb1QwlWo?=
 =?us-ascii?Q?GwUE63CvpjdawUNfcwoXUsIJ883kHHiI41uBU1mwB1VovfUp73KgiydpsPR/?=
 =?us-ascii?Q?5qDwcaumU/2zeTQhU2y0ShAES2VMihjKly94CIkcUHe7276Mk0IXkjtmqRRL?=
 =?us-ascii?Q?XZcu8YQ6m2nLs/N9wXl4gTc4GUw/BH8w9437bqxTtgMYUzxAFcFrDMaUsOnC?=
 =?us-ascii?Q?TqAJ74CyxdJ7cH7+Dd0stzjmuBiT8gizQ0LXTb4GwOQyuDThS4mHfXJ6vOLo?=
 =?us-ascii?Q?mzXBcRguPr2LsyPkPfNTF6t+WbZntHiQ46Ay3zlxjXYgbNwB1dAjLBzCj6/B?=
 =?us-ascii?Q?5if5f8D18D9Gl2CDJycDhtHbI/xy3UKGJUWXLIegR0GAuEhjf7LpAt7er+WI?=
 =?us-ascii?Q?Gc/smCNI6Eo8oiYv0pXLMPRknnnTyOOgonx7rcwxR3zLaBxJJWwKNVHVjq6D?=
 =?us-ascii?Q?3e72V+1/JERTZeNIamA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:06:42.8703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46885381-1745-4422-2df1-08de2835a6e4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9699
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f1267 cx=c_pps
 a=taCrSF+MhsyXuYDq+ZG44w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=01PES6M7ozozrA5H5moA:9
X-Proofpoint-GUID: XO_0gTJ0MQqSp_PgIpM90Fc0KuyXxf1U
X-Proofpoint-ORIG-GUID: XO_0gTJ0MQqSp_PgIpM90Fc0KuyXxf1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4NCBTYWx0ZWRfX3iZbJRs42z5W
 b2Ww837O6Wmq/7NgViLPcSn/NUh/c4luS1gtB+TGuKQ8CiRfJeiyb38Ian5Jx7aNFP333FEywfU
 MgRH2xSqhzDPLIjj51JQG7UDbHX6p+IyyZiSyZpEmaPzgYimgQm/wiZag87SwUYXpeItj2mYNX3
 iGFonOrEtLuSP5fbk5JKgZk8iYQUxS3iHJ4jwkSAYpujA0E0DgWhOx2ryDrITvnWMDQVfNMw9aQ
 VenTPsjG/k+D8Ft8cd9D8OY4WkuG1Xvk7+0RHpnyWu5q5beva/NprP8+m+ey6pmC+7jT0z8vxY0
 kwa5CpMvQ9UUhPchmBj3Zrrt1qe6TwhJXGgpnAhgs3HY0XCaPyt/Gg73mR88amP4h+TDyFLLSda
 03elDIH+C+/9YylSfvznqy2U4+We4A==
X-Proofpoint-Spam-Reason: safe

cs_dsp_debugfs_wmfw_read() and cs_dsp_debugfs_bin_read() were identical
except for which struct member they printed. Move all this duplicated
code into a common function cs_dsp_debugfs_string_read().

The check for dsp->booted has been removed because this is redundant.
The two strings are set when the DSP is booted and cleared when the
DSP is powered-down.

Access to the string char * must be protected by the pwr_lock mutex. The
string is passed into cs_dsp_debugfs_string_read() as a pointer to the
char * so that the mutex lock can also be factored out into
cs_dsp_debugfs_string_read().

wmfw_file_name and bin_file_name members of struct cs_dsp have been
changed to const char *. It makes for a better API to pass a const
pointer into cs_dsp_debugfs_string_read().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 45 ++++++++++++--------------
 include/linux/firmware/cirrus/cs_dsp.h |  4 +--
 2 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index f51047d8ea64..58e41751dbc1 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -9,6 +9,7 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -410,24 +411,30 @@ static void cs_dsp_debugfs_clear(struct cs_dsp *dsp)
 	dsp->bin_file_name = NULL;
 }
 
+static ssize_t cs_dsp_debugfs_string_read(struct cs_dsp *dsp,
+					  char __user *user_buf,
+					  size_t count, loff_t *ppos,
+					  const char **pstr)
+{
+	const char *str;
+
+	scoped_guard(mutex, &dsp->pwr_lock) {
+		str = *pstr;
+		if (!str)
+			return 0;
+
+		return simple_read_from_buffer(user_buf, count, ppos, str, strlen(str));
+	}
+}
+
 static ssize_t cs_dsp_debugfs_wmfw_read(struct file *file,
 					char __user *user_buf,
 					size_t count, loff_t *ppos)
 {
 	struct cs_dsp *dsp = file->private_data;
-	ssize_t ret;
 
-	mutex_lock(&dsp->pwr_lock);
-
-	if (!dsp->wmfw_file_name || !dsp->booted)
-		ret = 0;
-	else
-		ret = simple_read_from_buffer(user_buf, count, ppos,
-					      dsp->wmfw_file_name,
-					      strlen(dsp->wmfw_file_name));
-
-	mutex_unlock(&dsp->pwr_lock);
-	return ret;
+	return cs_dsp_debugfs_string_read(dsp, user_buf, count, ppos,
+					  &dsp->wmfw_file_name);
 }
 
 static ssize_t cs_dsp_debugfs_bin_read(struct file *file,
@@ -435,19 +442,9 @@ static ssize_t cs_dsp_debugfs_bin_read(struct file *file,
 				       size_t count, loff_t *ppos)
 {
 	struct cs_dsp *dsp = file->private_data;
-	ssize_t ret;
 
-	mutex_lock(&dsp->pwr_lock);
-
-	if (!dsp->bin_file_name || !dsp->booted)
-		ret = 0;
-	else
-		ret = simple_read_from_buffer(user_buf, count, ppos,
-					      dsp->bin_file_name,
-					      strlen(dsp->bin_file_name));
-
-	mutex_unlock(&dsp->pwr_lock);
-	return ret;
+	return cs_dsp_debugfs_string_read(dsp, user_buf, count, ppos,
+					  &dsp->bin_file_name);
 }
 
 static const struct {
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index a66eb7624730..69959032f8f5 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -188,8 +188,8 @@ struct cs_dsp {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_root;
-	char *wmfw_file_name;
-	char *bin_file_name;
+	const char *wmfw_file_name;
+	const char *bin_file_name;
 #endif
 };
 
-- 
2.47.3

