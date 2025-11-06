Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065FA30FC3A
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429495; cv=fail; b=KKiJe3ArMG38V0D05cSIh78FVBxFzBMIhaU/iJGdkqDo4Eyp/QQH0+ubcwlLjvW6k2NDu3IiKT4ZUOKrV6aU62qPOWRXeKL2p3d5LkEX9+sBfI0VlU8K2thV/vBU/TPRPZUJqAYYKefENolkfWgkg/zf/z29X2DadmWkuHZlifs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429495; c=relaxed/simple;
	bh=qNCqOGng3WuEG07v66zNZk9oVMh/Xmz/IzA9dUkJ+vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSEt6MUH7+naCJTWpj4attQI4k8lCemLWeEW1Ga9Nlslke50m85/QsWQjq/lqpr0nThfdGNFkaM2BddekD+bg5LYFRYDdFI/dYe9RDnzY7qZj5Zz6OhoIjcnhUPaW0Zate4QTmCTxHQyHgwDE5O674Rm8KyvoJ8YUshHqhkT0J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OfU7S2Um; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=k3TbY/it; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OfU7S2Um";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="k3TbY/it"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A65vGhD219643;
	Thu, 6 Nov 2025 05:44:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=U9OVO6Wun6K7Dh47UPvs7mvXu78289jMv7zLR/Dgou0=; b=
	OfU7S2UmCH7bYNtnvYn/uv+hnmJSISRUgUpjMslZTsGU0LTeUGyBtJkmX4fKkYvy
	9udbbjYJCDdoCsKeb/iWTu6Q0qTVTeBaN/KFWF+D8qgCSVmU5bwuTx9Tr8DT4mte
	Oo0+cipxkiq2E9V+eiWynBCCAti1vu4sUgShsJiHsLbwzg9MRAeP8Cg8X1U50iT4
	Zx36wvhfMEoE3+W5zc93QVBx4QudFLDU4mjnTt3y1cDdj18tlKtUMlmFouMw+D0w
	gVVc683GdE332j+X0iFa4rHaclilJ7XNhwyLjEo/wUifytjlaKk4xM1tDh3lDx7W
	ZMNWbpbTu+PqQDdd/P2Lxw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020099.outbound.protection.outlook.com [40.93.198.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4a7bwx3b5p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 05:44:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5MBnsATaOI3KlnRTWbqUZoB9bd8Zm7GcstZ0kR3lAyNeqdTa1Xva1m4EBjwvmUgYpGNd1zPUF89nvghMk5TrD+MU1I6h719Ln4AOaIvN37w9y0gB60Bsz1yTncqNoUEJelCi5wtkeqrws5MXVarDUQUPd+1Q7RPo3GhRCDWQgs7q9hk1SQWI8EWAntSoHzJm9YxXS2vnU7LdehjVn0Z+LLDCpsxKcmfnZxsc+eG/HtjDTOrlvuOhLeUfgtEX5NCyCUq6kWdqbZyZJH0LgBfGyvj2s8NezW1JjbXGttMhiqv+TdFm3dYXpJ1E0o3p73SQPh3vyIJVt5vK+fwcBS4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9OVO6Wun6K7Dh47UPvs7mvXu78289jMv7zLR/Dgou0=;
 b=tVLEmGR5OT00lnIvdt2rkiFlxG1afiEUB+WVlLLWx0pvjyynfVUsWkXoVwuHFmt+5Au8lHasgyyQ+mjd/AnZqLa05DaAeFdSizPUOWAuQweoUDw/YDQ/m5FFESAhuRxI5s65mj5XV+nuR5h96+ggRhQqcZZR8NhbpUKT8cRt/V4JmBt2N/iIqWL2VaxArRbYivnFVo26Wk4CV5xSp4ifnkD394Qssc5G2h1WTyV4RgosuHeeXXrDEQAG9rmC/OGc7pIiUrBGx4Dj+j9TiRhPOgX8alHqSNVL/tDFuxPWYIyGE2g/Yy6Kz2wOnMSPhKtdeK5m6ZxHKFqhbuUDNdtinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9OVO6Wun6K7Dh47UPvs7mvXu78289jMv7zLR/Dgou0=;
 b=k3TbY/itpvHwyuFvV/CiGqbQwbq6LSxoq7Bi5SRlfBLYpYlTJS6Uciu/zZjfyCA3ljnIAkElhklGyLowpRePcZiqzYWuREWS8rMuERUZYPFddjrKLuH37siEJTtHxNodIiqjLTBrOGeFY+BDI8PyydaoOhUK2qBWoViMUWfxEB8=
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by MN6PR19MB7868.namprd19.prod.outlook.com (2603:10b6:208:472::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 11:44:31 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::c5) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 11:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Thu, 6 Nov 2025 11:44:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 20629406560;
	Thu,  6 Nov 2025 11:44:26 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F2D7282026B;
	Thu,  6 Nov 2025 11:44:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 13/13] ASoC: SDCA: Add basic SDCA function driver
Date: Thu,  6 Nov 2025 11:44:22 +0000
Message-ID: <20251106114422.906370-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
References: <20251106114422.906370-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|MN6PR19MB7868:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 82160578-83c2-4adc-d417-08de1d29d917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o/IpR+WZv0xteq7Q6P+xbOkM05485mWuIXS+yY7VOXQIRZMezkhhxZPMk0Wb?=
 =?us-ascii?Q?I1mm/fIakS1Ljkie5NJ7g/xDdKgK90H5IkGgKzzu8rEllZI8pL1rR9e8P0n0?=
 =?us-ascii?Q?XTWMZUNdN9wnRaJZVQB4QCxsRcHsTGjO3Sel7HTorNeEj5P8DzlCPqVBggBe?=
 =?us-ascii?Q?DKWjpjNywisE4k+FKczLGvvtNeuzvNC7/Z1d1B5HaV1upfw8cvP6PkZhuJoC?=
 =?us-ascii?Q?ubVUrghFM2R/zE1yVgNlM1enWPVOZY5P9T6FSi6bf8BerWHanCJXPtg0n5Md?=
 =?us-ascii?Q?EfXw76M0YqLfHxfVFPTjiXOkfYEELjM+amRW3qumwRm3MOjmh1tQXMY2+/+M?=
 =?us-ascii?Q?cmP2OYF382uHV02VCYMMqz4auQO0Zt3Z4kI+sCSrOm9Ait39LvY3HvXl79lY?=
 =?us-ascii?Q?MZ912pbQJBH6OUJQea+UNMgovSXOCkxSlZ1/ELuw2Dx0H0wGCI8aAvkdfAkK?=
 =?us-ascii?Q?ef6CZQ9TAHcfUPjHpT4IfBJSg/o/V/LLm5UCs/gOBKvkJW3mihvMoCgJwH8m?=
 =?us-ascii?Q?EMimzyxOdPzCnBNSqsYOICJEuCvGmKuwXN2hqui8cb4MiapanO0OS0aEJ8Sp?=
 =?us-ascii?Q?eW+DBFdp9nAeEru9/UXT0GzEAs9Oy064/Q+UPnHT9k6dBPjLq4X783sKX8W1?=
 =?us-ascii?Q?G1Or9xdJLIn1iGAgv3H+zIjQNKF3kKK8zGqKwxSXguQ4TjMAkf+euU29MOmL?=
 =?us-ascii?Q?vIxjVq7408eU5z2XL83PTNcse0P3YPIDt1DYCdl3Se4chOEy6DojSe8UkxJJ?=
 =?us-ascii?Q?MpG//7QqWpD5wrf/knIO104+Zs3HnbKvsaszrI4wcSRky+vvbx/evgkUwF/B?=
 =?us-ascii?Q?gvrb0+oE5OQayNJ89Ax70FFFcMxeKxHme3ak4KXGr9W3rxLMzYlMdRC2Zhbj?=
 =?us-ascii?Q?naDbvnOAkFYS9GcsS7ujZEtnQ9cw1tYnsU273dIP8IDGM2icuG6xImEbzbvf?=
 =?us-ascii?Q?9xmp6nP0rtHPYEfMj2qtoqh61+OpyoSNfasbjiF0UvYpLhDuz2FDHniFLZHS?=
 =?us-ascii?Q?XkvrRSsgg/ONarSVY2i9dk/UC+Vmw5ROhGH6PtWJ+OV9oZadfArN0Ll33azy?=
 =?us-ascii?Q?8lB4Fr8mpGjFUQLCcKD3rtHSdwm8f7FuG66F2yd6OSgaYxnAl6QIq89QxNhf?=
 =?us-ascii?Q?Uhg0BMf+ga3VEhmq9RVPhdObwAFZGpHrIXc9R+9vFu6KTEHqKfl01BVhRhde?=
 =?us-ascii?Q?Vs8aZqPikUskToFop8eDc4LSLlh9OWxds7Ov7PkmeiKk6gvt6ztuRiJyyHaK?=
 =?us-ascii?Q?5jHj9HGoUqNHVOMG8PiK9/CAMG/mJjigfqwXjrqUxi40GkQd5j5UsU4XbswC?=
 =?us-ascii?Q?amnyMHTSVmBCljDc3+vm98OFIKFS2JU8JrWFc9vj7scH8fzXPrDymVDUs8Mp?=
 =?us-ascii?Q?oyS2vCR3iVb0tI5jYXa4nwgstsdEoTZjdQE9cdl7n2tNnqtxh4ziUDLSndde?=
 =?us-ascii?Q?VYvMOLFSY5FT1ciKqiQDK/ZzV3/its9zurmyNaNUNyZ8FXgvMhdRUxIDPGrB?=
 =?us-ascii?Q?RhEC88dL1RR75/TZUMn6c1VYi0NVGtHZhY1MafItpy7v2eSOczIWsOHbV6vL?=
 =?us-ascii?Q?V+FBCDBJk7QpCR3VT2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 11:44:30.2875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82160578-83c2-4adc-d417-08de1d29d917
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB7868
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfX4WhBAv/kweFN
 Ppt1zNnpoIKaymCmdFCTr++d2IYUVvaYs5PvhEfOdBubh9Clox4q0e6ELHVKZUNzTsuhxJng1YH
 pVRRv6fTlu20CqzT1UQzADYQ4AUgIVkc+VmNqc2jMOU1tYnQXcpj6fDcu48e3il5zyk1jXhlVMm
 5R3Gn1juLFWfLY1EMpuNZaSHPScCs30MCgFpPmYPwUUUkDtF2+cLKFzTsAO3z+u+YfEdp6p+ZjC
 JEcLKR0QpfO7dviAY5ScRLyaKf2oMaXkzZGG6HEz1Fp8JOWvThoODg7YGzLwl+QlrubdGj/fGA2
 DhfwV6Otnr4E4hMUsEta7Ye3OewMRyQ+v94HoBOXmBy8aUUZmVmlPjTgqNHqDr00c8jugYOXfyx
 kZpbF9OeYtdSy4FjWwhPbKDNIravbA==
X-Proofpoint-ORIG-GUID: CnOaX6V5O312UCQjZ_9KlzSXkGtrKKFY
X-Proofpoint-GUID: CnOaX6V5O312UCQjZ_9KlzSXkGtrKKFY
X-Authority-Analysis: v=2.4 cv=FpcIPmrq c=1 sm=1 tr=0 ts=690c8a25 cx=c_pps
 a=GknEWMF7HrfbFJOd498rxg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KJT-RnjOAAAA:8 a=w1d2syhTAAAA:8
 a=JfUX2HHz7D_845OBrMAA:9 a=HE_01F9_QflCRFonrIQr:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Reason: safe

Add a driver to support the individual SDCA functions within the class
driver. Use the SDCA helpers to parse the DisCo information and register
a function driver based on those properties. Manage the boot of the
function, reset, FDL, defaults. Manage the function level register map.

Co-developed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Renamed suspend/resume functions to be a little less wordy.

 sound/soc/sdca/Kconfig               |   7 +
 sound/soc/sdca/Makefile              |   2 +
 sound/soc/sdca/sdca_class_function.c | 460 +++++++++++++++++++++++++++
 3 files changed, 469 insertions(+)
 create mode 100644 sound/soc/sdca/sdca_class_function.c

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 56e3ff8448762..0a37e94a60302 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -39,6 +39,7 @@ config SND_SOC_SDCA_OPTIONAL
 
 config SND_SOC_SDCA_CLASS
 	tristate "SDCA Class Driver"
+	select SND_SOC_SDCA_CLASS_FUNCTION
 	select SND_SOC_SDCA
 	select SND_SOC_SDCA_FDL
 	select SND_SOC_SDCA_HID
@@ -47,4 +48,10 @@ config SND_SOC_SDCA_CLASS
 	  This option enables support for the SDCA Class driver which should
 	  support any class compliant SDCA part.
 
+config SND_SOC_SDCA_CLASS_FUNCTION
+	tristate
+	help
+	  This option enables support for the SDCA Class Function drivers,
+	  these implement the individual functions of the SDCA Class driver.
+
 endmenu
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index 95db4cef34833..f6b73275d9649 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -7,7 +7,9 @@ snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
 
 snd-soc-sdca-class-y := sdca_class.o
+snd-soc-sdca-class-function-y := sdca_class_function.o
 
 obj-$(CONFIG_SND_SOC_SDCA) += snd-soc-sdca.o
 
 obj-$(CONFIG_SND_SOC_SDCA_CLASS) += snd-soc-sdca-class.o
+obj-$(CONFIG_SND_SOC_SDCA_CLASS_FUNCTION) += snd-soc-sdca-class-function.o
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
new file mode 100644
index 0000000000000..0028482a1e752
--- /dev/null
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Cirrus Logic, Inc. and
+//                    Cirrus Logic International Semiconductor Ltd.
+
+/*
+ * The MIPI SDCA specification is available for public downloads at
+ * https://www.mipi.org/mipi-sdca-v1-0-download
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/pcm.h>
+#include <sound/sdca_asoc.h>
+#include <sound/sdca_fdl.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_interrupts.h>
+#include <sound/sdca_regmap.h>
+#include <sound/sdw.h>
+#include <sound/soc-component.h>
+#include <sound/soc-dai.h>
+#include <sound/soc.h>
+#include "sdca_class.h"
+
+struct class_function_drv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct sdca_class_drv *core;
+
+	struct sdca_function_data *function;
+};
+
+static void class_function_regmap_lock(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_lock(lock);
+}
+
+static void class_function_regmap_unlock(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_unlock(lock);
+}
+
+static bool class_function_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_writeable(drv->function, reg);
+}
+
+static bool class_function_regmap_readable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_readable(drv->function, reg);
+}
+
+static bool class_function_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_volatile(drv->function, reg);
+}
+
+static const struct regmap_config class_function_regmap_config = {
+	.name			= "sdca",
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.reg_format_endian	= REGMAP_ENDIAN_LITTLE,
+	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
+
+	.max_register		= SDW_SDCA_MAX_REGISTER,
+	.readable_reg		= class_function_regmap_readable,
+	.writeable_reg		= class_function_regmap_writeable,
+	.volatile_reg		= class_function_regmap_volatile,
+
+	.cache_type		= REGCACHE_MAPLE,
+
+	.lock			= class_function_regmap_lock,
+	.unlock			= class_function_regmap_unlock,
+};
+
+static int class_function_regmap_mbq_size(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_mbq_size(drv->function, reg);
+}
+
+static bool class_function_regmap_deferrable(struct device *dev, unsigned int reg)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	return sdca_regmap_deferrable(drv->function, reg);
+}
+
+static const struct regmap_sdw_mbq_cfg class_function_mbq_config = {
+	.mbq_size		= class_function_regmap_mbq_size,
+	.deferrable		= class_function_regmap_deferrable,
+	.retry_us		= 1000,
+	.timeout_us		= 10000,
+};
+
+static int class_function_startup(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+
+	return sdca_asoc_set_constraints(drv->dev, drv->regmap, drv->function,
+					 substream, dai);
+}
+
+static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
+					     struct snd_pcm_hw_params *params,
+					     struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
+	struct sdw_stream_config sconfig = {0};
+	struct sdw_port_config pconfig = {0};
+	int ret;
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	snd_sdw_params_to_config(substream, params, &sconfig, &pconfig);
+
+	/*
+	 * FIXME: As also noted in sdca_asoc_get_port(), currently only
+	 * a single unshared port is supported for each DAI.
+	 */
+	ret = sdca_asoc_get_port(drv->dev, drv->regmap, drv->function, dai);
+	if (ret < 0)
+		return ret;
+
+	pconfig.num = ret;
+
+	ret = sdw_stream_add_slave(sdw, &sconfig, &pconfig, 1, sdw_stream);
+	if (ret) {
+		dev_err(drv->dev, "failed to add sdw stream: %d\n", ret);
+		return ret;
+	}
+
+	return sdca_asoc_hw_params(drv->dev, drv->regmap, drv->function,
+				   substream, params, dai);
+}
+
+static int class_function_sdw_remove_peripheral(struct snd_pcm_substream *substream,
+						struct snd_soc_dai *dai)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
+
+	if (!sdw_stream)
+		return -EINVAL;
+
+	return sdw_stream_remove_slave(sdw, sdw_stream);
+}
+
+static int class_function_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stream,
+					 int direction)
+{
+	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops class_function_sdw_ops = {
+	.startup	= class_function_startup,
+	.shutdown	= sdca_asoc_free_constraints,
+	.set_stream	= class_function_sdw_set_stream,
+	.hw_params	= class_function_sdw_add_peripheral,
+	.hw_free	= class_function_sdw_remove_peripheral,
+};
+
+static int class_function_component_probe(struct snd_soc_component *component)
+{
+	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
+	struct sdca_class_drv *core = drv->core;
+
+	return sdca_irq_populate(drv->function, component, core->irq_info);
+}
+
+static const struct snd_soc_component_driver class_function_component_drv = {
+	.probe			= class_function_component_probe,
+	.endianness		= 1,
+};
+
+static int class_function_boot(struct class_function_drv *drv)
+{
+	unsigned int reg = SDW_SDCA_CTL(drv->function->desc->adr,
+					SDCA_ENTITY_TYPE_ENTITY_0,
+					SDCA_CTL_ENTITY_0_FUNCTION_STATUS, 0);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(drv->regmap, reg, &val);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to read function status: %d\n", ret);
+		return ret;
+	}
+
+	if (!(val & SDCA_CTL_ENTITY_0_FUNCTION_HAS_BEEN_RESET)) {
+		dev_dbg(drv->dev, "reset function device\n");
+
+		ret = sdca_reset_function(drv->dev, drv->function, drv->regmap);
+		if (ret)
+			return ret;
+	}
+
+	if (val & SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION) {
+		dev_dbg(drv->dev, "write initialisation\n");
+
+		ret = sdca_regmap_write_init(drv->dev, drv->core->dev_regmap,
+					     drv->function);
+		if (ret)
+			return ret;
+
+		ret = regmap_write(drv->regmap, reg,
+				   SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION);
+		if (ret < 0) {
+			dev_err(drv->dev,
+				"failed to clear function init status: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	/* Start FDL process */
+	ret = sdca_irq_populate_early(drv->dev, drv->regmap, drv->function,
+				      drv->core->irq_info);
+	if (ret)
+		return ret;
+
+	ret = sdca_fdl_sync(drv->dev, drv->function, drv->core->irq_info);
+	if (ret)
+		return ret;
+
+	ret = sdca_regmap_write_defaults(drv->dev, drv->regmap, drv->function);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(drv->regmap, reg, 0xFF);
+	if (ret < 0) {
+		dev_err(drv->dev, "failed to clear function status: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int class_function_probe(struct auxiliary_device *auxdev,
+				const struct auxiliary_device_id *aux_dev_id)
+{
+	struct device *dev = &auxdev->dev;
+	struct sdca_class_drv *core = dev_get_drvdata(dev->parent);
+	struct sdca_device_data *data = &core->sdw->sdca_data;
+	struct sdca_function_desc *desc;
+	struct snd_soc_component_driver *cmp_drv;
+	struct snd_soc_dai_driver *dais;
+	struct class_function_drv *drv;
+	struct regmap_sdw_mbq_cfg *mbq_config;
+	struct regmap_config *config;
+	struct reg_default *defaults;
+	int ndefaults;
+	int num_dais;
+	int ret;
+	int i;
+
+	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		return -ENOMEM;
+
+	cmp_drv = devm_kmemdup(dev, &class_function_component_drv, sizeof(*cmp_drv),
+			       GFP_KERNEL);
+	if (!cmp_drv)
+		return -ENOMEM;
+
+	config = devm_kmemdup(dev, &class_function_regmap_config, sizeof(*config),
+			      GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+
+	mbq_config = devm_kmemdup(dev, &class_function_mbq_config, sizeof(*mbq_config),
+				  GFP_KERNEL);
+	if (!mbq_config)
+		return -ENOMEM;
+
+	drv->dev = dev;
+	drv->core = core;
+
+	for (i = 0; i < data->num_functions; i++) {
+		desc = &data->function[i];
+
+		if (desc->type == aux_dev_id->driver_data)
+			break;
+	}
+	if (i == core->sdw->sdca_data.num_functions) {
+		dev_err(dev, "failed to locate function\n");
+		return -EINVAL;
+	}
+
+	drv->function = &core->functions[i];
+
+	ret = sdca_parse_function(dev, core->sdw, desc, drv->function);
+	if (ret)
+		return ret;
+
+	ndefaults = sdca_regmap_count_constants(dev, drv->function);
+	if (ndefaults < 0)
+		return ndefaults;
+
+	defaults = devm_kcalloc(dev, ndefaults, sizeof(*defaults), GFP_KERNEL);
+	if (!defaults)
+		return -ENOMEM;
+
+	ret = sdca_regmap_populate_constants(dev, drv->function, defaults);
+	if (ret < 0)
+		return ret;
+
+	regcache_sort_defaults(defaults, ndefaults);
+
+	auxiliary_set_drvdata(auxdev, drv);
+
+	config->reg_defaults = defaults;
+	config->num_reg_defaults = ndefaults;
+	config->lock_arg = &core->regmap_lock;
+
+	if (drv->function->busy_max_delay) {
+		mbq_config->timeout_us = drv->function->busy_max_delay;
+		mbq_config->retry_us = umax(drv->function->busy_max_delay / 10,
+					    mbq_config->retry_us);
+	}
+
+	drv->regmap = devm_regmap_init_sdw_mbq_cfg(dev, core->sdw, config, mbq_config);
+	if (IS_ERR(drv->regmap))
+		return dev_err_probe(dev, PTR_ERR(drv->regmap),
+				     "failed to create regmap");
+
+	ret = sdca_asoc_populate_component(dev, drv->function, cmp_drv,
+					   &dais, &num_dais,
+					   &class_function_sdw_ops);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, 200);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = class_function_boot(drv);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_component(dev, cmp_drv, dais, num_dais);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register component\n");
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
+static int class_function_runtime_suspend(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+
+	/*
+	 * Whilst the driver doesn't power the chip down here, going into
+	 * runtime suspend means the driver can't be sure the bus won't
+	 * power down which would prevent communication with the device.
+	 */
+	regcache_cache_only(drv->regmap, true);
+
+	return 0;
+}
+
+static int class_function_runtime_resume(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
+	int ret;
+
+	regcache_mark_dirty(drv->regmap);
+	regcache_cache_only(drv->regmap, false);
+
+	ret = regcache_sync(drv->regmap);
+	if (ret) {
+		dev_err(drv->dev, "failed to restore register cache: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	regcache_cache_only(drv->regmap, true);
+
+	return ret;
+}
+
+static const struct dev_pm_ops class_function_pm_ops = {
+	RUNTIME_PM_OPS(class_function_runtime_suspend,
+		       class_function_runtime_resume, NULL)
+};
+
+static const struct auxiliary_device_id class_function_id_table[] = {
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SMART_AMP_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SMART_AMP,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SMART_MIC_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SMART_MIC,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_UAJ_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_UAJ,
+	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_HID_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_HID,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
+
+static struct auxiliary_driver class_function_drv = {
+	.driver = {
+		.name		= "sdca_function",
+		.pm		= pm_ptr(&class_function_pm_ops),
+	},
+
+	.probe		= class_function_probe,
+	.id_table	= class_function_id_table
+};
+module_auxiliary_driver(class_function_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SDCA Class Function Driver");
+MODULE_IMPORT_NS("SND_SOC_SDCA");
-- 
2.47.3

