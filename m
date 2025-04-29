Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3F270ED2
	for <linux-sound@vger.kernel.org>; Tue, 29 Apr 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917160; cv=fail; b=ASirie0nuuTcqwBPATKTOkrqPyfAywEiF2cwR8LrRxnG4S88W866699cqWm+39g7ry0Ne/yO/ZTtnUXg4gbqInWeQ9eU8aHUM0CLPpqzlgYLkPji6szeylyUsKrvHVrZLB1+1D3UfgZ0Bv+chT3SBdItmuLyXsSv226rrEfU1Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917160; c=relaxed/simple;
	bh=xL7fRSZLGIsLRXQ8jbKf0gDXJb9AXpMnaH1ERPM8k1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hV+Go46PcoXGFfG7a3ova7KvF28Fx1p02AMhk8zvYv9mmpBTVZjivJMieXmDJbvst+ise+b357o31Xfbi2iw5aqV3mIwlWZ9Am4cALqrvZsYzPp3eXaX6nnar9d9UqOnAhVG+rQFjqJiWLXywikiOmQX4q+nAYgW9DH+FdW7kag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a78BwRJc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=uKMdWDZn; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a78BwRJc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="uKMdWDZn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4QfCH022415;
	Tue, 29 Apr 2025 03:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9TocIhortBxmyvs+XbPL6qhCrm8XkTPFGyA9W4Gvdos=; b=
	a78BwRJce3iEaXxn5fP3EHkw5BKOraq67fHPL88R0z/sz7mr+QKyxgbY466Kh4NU
	YaEWPAtnFHrFY5+G0r3pHJRnu1Zc4ykWCn3OgbomKIa0EFVpaylI+0wgdtQj7Ybc
	uLPKF2FEo89YLyYyCes6Q7FDlf1sLEPdTVnhNcLLGTja27M20bDJ7tw0LVeLU2bG
	SqM//OghlNYDhww8vVjKY9GQtGPVRKo5UWnNAgIl6RhP9XzcGx2fyD84fnEBS7Kn
	81XZ/ooJdMe+fXhj+NapgJPC4Qi3NeqF7dcizsD/FTrRbtC1nssSMICnBTx4vB4q
	dslSPgk5X3Ieeih5rIS+Cg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1bccm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 03:59:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSMMWdBz8/yYU2fSDMefgVIgE4jt4OTy4NUjMmRK1ix0bizVS7Asz9sILh+e0SuHeUJpzgn7KLp/rCjJw5jtyRRpvNDQowaD7yTWGsPKsc1eGLIqHLzqAPpvOTulVw3OLm1CJnxFL+B0ajBhQwmtE/JZMhq0FhZIarDWOd1BeAQHW2ORaOmE6lih5seDFEbHCVs9rBjfeSzy0dR3nvQp97OaBJipvjVpuDcgKtwkNkek8O7MpH+BuY3SuVvnulAiPt067OEy4vwm/8RXWcd8JdD359O7+iP3+3WUEBIHD6mnHF6slrwqSh06jcPyFNgtACvoBsOH+jeFRQvTrOuhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TocIhortBxmyvs+XbPL6qhCrm8XkTPFGyA9W4Gvdos=;
 b=eDlEMp/dRhoe4UGIR3T0LKY1e7AKsCHCYs4zJGAE65eOTh60rM7MtGMXrPoWQaUlVMf4zLxQoy01SSkqY5LrnfUVTqi0B8P/zZTVBUxTHZkVOpYZb75l9SFJ+Aha0252Ez3RcUmPaP9bA/+Z414336RTBtR3IUntn+5RyXtgDD+NAF5io4cSUd5QDFFEeLV/1b3MK5zGgwNg1xXS6YqV2TjCmM81xyTqYX/KgemU7iR9XN/Hp3b4WoMxo+jN+jqVXWzg02E3nvfx25NLer9qfd2L5Sq9MiE2qyVkMtfOyiJRx0Z2IM8t0y8mYogED+9e5ARIcCakNJnUdYTWhvbFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TocIhortBxmyvs+XbPL6qhCrm8XkTPFGyA9W4Gvdos=;
 b=uKMdWDZn19UOrqTRSHrltpmE8UIyhssYHX4bDxGa8TbkhcnBd8kmPafmt3nqu9w65LEE/nBs5SS0WUDAaHk8R43Acg8PmApzBgdiuSQoi8PHz+dvi8WOulhnKdX8MtIxj2/hVy/jmUbM7sKhbG0lBqVFCVTxseYGUk19NfEHSOE=
Received: from BL1PR13CA0080.namprd13.prod.outlook.com (2603:10b6:208:2b8::25)
 by IA1PR19MB6396.namprd19.prod.outlook.com (2603:10b6:208:3e4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 08:58:55 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::79) by BL1PR13CA0080.outlook.office365.com
 (2603:10b6:208:2b8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.26 via Frontend Transport; Tue,
 29 Apr 2025 08:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Tue, 29 Apr 2025 08:58:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9A7F240654A;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8464182026C;
	Tue, 29 Apr 2025 08:58:53 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 2/5] ASoC: dapm: Add component level pin switches
Date: Tue, 29 Apr 2025 09:58:50 +0100
Message-Id: <20250429085853.258038-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
References: <20250429085853.258038-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|IA1PR19MB6396:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0f5756a-4199-4a2f-eae6-08dd86fc1231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mLmNJu3BF3cEo3FuVlkhOvyDPHxKz/PniSFJ40PeEQjx/Zc9akvnuaD6E2KO?=
 =?us-ascii?Q?TqG2qQtihWF5Zo7IFF6ghhaMexpDHO6b+L0zTqc4RymlcQvrNEIBj/vxB04d?=
 =?us-ascii?Q?pLdu6eSTKTfkB8RP63Q3c3XG+dMmbbavoLn7I1SDgc0cm066flppMjrpXZNt?=
 =?us-ascii?Q?jr9xMxNGw5kDJupxV4XRtkr7viR9OWt3wcKqU96Y49VXc/ACisuUiBlHbvZ7?=
 =?us-ascii?Q?uWDNnWZ6xBAVeAbBS5yQtX3xhrKgozd+EQ8Ln6dVERJXUewVcibX6JZGGxgW?=
 =?us-ascii?Q?cjwP7/94a9n21tUMpqpMlY5QzpVKSfHZ2uMSZuSUzGlYRw2O8sa45DhgtpnD?=
 =?us-ascii?Q?xQWWHNY+aJNaQjFImhtYeUjdY9Y2Vv+ot9ok0hBoDypO6Tr/8ZMUTNjmL/7s?=
 =?us-ascii?Q?QSKtplDzH+dQ5714ucrhlKh6th2yZSSVKfE+TC0VxdUWdc30lCPJeoq4tWjD?=
 =?us-ascii?Q?CtlPmA3UI1AsKMk7lhRWuOisySO8ytvOjksG+j5H4EUiCWD6XAUUzGNAzw8h?=
 =?us-ascii?Q?KLnD8oygFUt7bk6oiE2nDnt/9EmQkBrML3VdRnQ+Vun532Pw+SyKC2PJ3PEy?=
 =?us-ascii?Q?XaSYc9/g3sMPw/9My70gEaTXWRVGY3iUy2GNk1Xs/DRriIwN+PjQoshuhwzM?=
 =?us-ascii?Q?7RxdH2JFgY3GHrVNttb5snfGdVWXwKxIJUx9h8oAYplR6MVS2jfu9FmazNoH?=
 =?us-ascii?Q?/tQo5bgyZBSaUFe3tACY6ebirXQcKz/LJYg8Bzxj2OySXz9mij3KHoCr0D3u?=
 =?us-ascii?Q?MwkI5ZN4yFt/B4tiYiz31rh+DzkDL7sjSrG7dLdYi+3zizmi5FCnQB0y4IE3?=
 =?us-ascii?Q?1zeqPTAOlmePmkAtj2siLFGfHpsvi+gl+vSqBbEyIvwtliVWq5l71YOQSLYk?=
 =?us-ascii?Q?xZ/nYJFP0eh+GxTyftxpX6BybMkZIJg4toNuj+ubIc8fx2+OTv6Goo8EEi13?=
 =?us-ascii?Q?RY5FHBKSfqmVms7/8anJS8y1igLJjGx2qnfN+VpaD2gCLa/T5HncaTSP4v3X?=
 =?us-ascii?Q?wDdbTOMs1Si5AKl8KO08ftjdTz64DtNOvca3v9GXa0Xl1i103UC55ClL9URg?=
 =?us-ascii?Q?sGLGgOJ0mJdrpuuKHLVNJVh+tjQpXQc3+JcQdkLZbBrzUDqGfCS7Ak1wonMy?=
 =?us-ascii?Q?3DVGDsGbwIBQhETC9tqylRNpgaX9v8nZ4rHpwvnKYBpa/VYWs/MPBwNkG0fz?=
 =?us-ascii?Q?ypGW2H62D4KVIx4cgD3bSs4wdGU2y0lU5HZdVkKjAf+n3vxq8SELccJFiCVB?=
 =?us-ascii?Q?6IiXNpGssaeJw/lp+B1UflhGGiPrz3jYYijmObQUdoWvzGZcXzVcBN8MNgH7?=
 =?us-ascii?Q?GHM6T+/srh9mDS8xPtg2hPolwR9CRk/QlI5+VFnws7LlqQCn7abdP1fuf4dM?=
 =?us-ascii?Q?PAmDERVOUrLr+d+L4dreQ7OdpXQeTCjZIrNP5xkU73DwgVcWm/pxTQf+MZo+?=
 =?us-ascii?Q?l+FxNREs4ewzoXgAgC6SdXZQ9a900yTYerCmeFWqzp2oR5DXer3Sq1ntg+rx?=
 =?us-ascii?Q?RiSH6ESoCjGLjHyffS7f1FKwTKHYAEdnivi9?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 08:58:54.9550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f5756a-4199-4a2f-eae6-08dd86fc1231
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6396
X-Proofpoint-GUID: IqP7lT63kfnN2ThpuDopmoz9Qef2zPr8
X-Proofpoint-ORIG-GUID: IqP7lT63kfnN2ThpuDopmoz9Qef2zPr8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA2NiBTYWx0ZWRfX1fuKpNDKfkbY qyODr+kave+JC+DRYEtk1NcSTkyFs+MtHIUrXdwq1Ry04o/eAJNZJpB/9WMw8uvFG8Dqi85kaeU n4marTZNVo6yHaKtQucYJEOumv8Y7KS/RZcuKkmLI1Beu0/gsWEQ/FyTrktu+jISoX628N23LIq
 HbIldGh6KQbEqB+6tbI0D36aBwQMMJ4mJaitSAT/D3ksrCZ1YMvkE92sVfAB6ixhPdS1c+tZCCm 5Hmclyhek6mN+QdWyiTp9u5fL4Ou6K1xH9NNU46SMUBPZB/4rJpOoNna6NMfRfm8JaN9h5sZTwi K4wWIYuyf6lY62hSMylXYD8MgmlMjp5uQDz7QPe+SVMGIA1sfVZQSJpZeFX4Ihb9BcaVW9QsDBC
 v0c+tbJNe0jgxR/TRIQg0QGCdBnv+38xJu0KeSNa6VyghXN4opaN+V/3NK9MGpwopLFx+Ycg
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=681094d4 cx=c_pps a=F7QtyTBSWJEVkVFduP+sHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=SW88HgwpE6hd0ow_NxAA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

The core currently supports pin switches for source/sink widgets, but
only at the card level. SDCA components specify the fabric at the
level of the individual components, to support this add helpers to
allow component level pin switches.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v3.

 include/sound/soc-dapm.h |  4 ++
 sound/soc/soc-dapm.c     | 84 +++++++++++++++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index af802ef536e7..400584474bc8 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -445,6 +445,10 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
 int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 	const struct snd_soc_dapm_widget *widget, unsigned int num);
 struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b7818388984e..f26f9e9d7ce7 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3626,11 +3626,25 @@ int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_info_pin_switch);
 
+static int __snd_soc_dapm_get_pin_switch(struct snd_soc_dapm_context *dapm,
+					 const char *pin,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	snd_soc_dapm_mutex_lock(dapm);
+	ucontrol->value.integer.value[0] = snd_soc_dapm_get_pin_status(dapm, pin);
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	return 0;
+}
+
 /**
  * snd_soc_dapm_get_pin_switch - Get information for a pin switch
  *
  * @kcontrol: mixer control
  * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the card
+ * level.
  */
 int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
@@ -3638,40 +3652,82 @@ int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	snd_soc_dapm_mutex_lock(card);
+	return __snd_soc_dapm_get_pin_switch(&card->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_get_pin_switch);
 
-	ucontrol->value.integer.value[0] =
-		snd_soc_dapm_get_pin_status(&card->dapm, pin);
+/**
+ * snd_soc_dapm_get_component_pin_switch - Get information for a pin switch
+ *
+ * @kcontrol: mixer control
+ * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the component
+ * level.
+ */
+int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	const char *pin = (const char *)kcontrol->private_value;
 
-	snd_soc_dapm_mutex_unlock(card);
+	return __snd_soc_dapm_get_pin_switch(&component->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_get_component_pin_switch);
 
-	return 0;
+static int __snd_soc_dapm_put_pin_switch(struct snd_soc_dapm_context *dapm,
+					 const char *pin,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	int ret;
+
+	snd_soc_dapm_mutex_lock(dapm);
+	ret = __snd_soc_dapm_set_pin(dapm, pin, !!ucontrol->value.integer.value[0]);
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	snd_soc_dapm_sync(dapm);
+
+	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_dapm_get_pin_switch);
 
 /**
  * snd_soc_dapm_put_pin_switch - Set information for a pin switch
  *
  * @kcontrol: mixer control
  * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the card
+ * level.
  */
 int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
 	const char *pin = (const char *)kcontrol->private_value;
-	int ret;
-
-	snd_soc_dapm_mutex_lock(card);
-	ret = __snd_soc_dapm_set_pin(&card->dapm, pin,
-				     !!ucontrol->value.integer.value[0]);
-	snd_soc_dapm_mutex_unlock(card);
 
-	snd_soc_dapm_sync(&card->dapm);
-	return ret;
+	return __snd_soc_dapm_put_pin_switch(&card->dapm, pin, ucontrol);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_pin_switch);
 
+/**
+ * snd_soc_dapm_put_component_pin_switch - Set information for a pin switch
+ *
+ * @kcontrol: mixer control
+ * @ucontrol: Value
+ *
+ * Callback to provide information for a pin switch added at the component
+ * level.
+ */
+int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	const char *pin = (const char *)kcontrol->private_value;
+
+	return __snd_soc_dapm_put_pin_switch(&component->dapm, pin, ucontrol);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_put_component_pin_switch);
+
 struct snd_soc_dapm_widget *
 snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 			 const struct snd_soc_dapm_widget *widget)
-- 
2.39.5

