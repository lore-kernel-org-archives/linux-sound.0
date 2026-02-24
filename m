Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595573A7F79;
	Tue, 24 Feb 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949929; cv=fail; b=b478DaFlxPT6W8ikUXO0Cd2TBD0sNtXiXmJjBBXbMfp+irBbhLtSFi1hK6/tbne85fFuroRRcB6x9Tt7gYBFV0gRtaAnQ5HVmtPWtXmtVU9GiraBEq+8tso8LmmpJLwhGK0W2w/fuOItHL3kEsqLxxJ5I8RJwh7PbQVT8wLug3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949929; c=relaxed/simple;
	bh=Gia1CDKsWRIKD6FzfWD5JGafKKlgoeoIsDgaH1ZjPXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/9nDsmffdghdZJm8PB+E/kw/ziTy+kqPfKukn86+MXpI0OR5SGII2xfmw0pSzcvxusbjI344Wd2ZBGU7f11ZSD+CbZ8poIsj8pP4hw1VFTON2ihyUnjzYRwjIRmbV4m1OEfpjsR28AAB9UvFuOmhjJ8jWi8Ot+SupGPq2CiFBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IpSu3fiH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O4x6+jEN; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IpSu3fiH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O4x6+jEN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3wMXE3426023;
	Tue, 24 Feb 2026 10:18:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lqeA/wJu1VJc6zSGuLSkCm63qp30hybfY4gQjsoAMZY=; b=
	IpSu3fiHeMyOqSvIvhOyGrDwtoRT633HNrfHZq/p4E2obhYNaZf1F0PS2cztSIY0
	ms9SyrfGHJ8FrzR6aXn2TCwQsEzI2qpQMFfyAt8NDKrhDbU0hL+sbpZRu3tiyyeC
	y1FQ8gGudK0Sf93JUXzY70QHTNK1cpLl/AXSerGXNEmmFiADNVXfvF46qaOLObVJ
	OZRZAWj8qYQVR9bYXlbdvjpcXDw/MlfvV+JtNUy9kgu6/ddZnCwV7ASFrzdh73/Z
	f8SMfJND+24QiYpUYuPgU7Fs0oNbvdA6bBeGPuN4o5HHx0/VqfZur7/aiQxoXvBI
	CvhrKoPczuodOprxyX8GAQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022083.outbound.protection.outlook.com [52.101.48.83])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j36gu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 10:18:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkGJ1oV9M6ez5mxeQZmN54CWNk9gQ+qcse8KlLFxjfRfPWqLGG7BybjtVlnGON54c8Q2+dILla+1K1vURtoUwY4mbmGsh91Tclv4lPq9yBibYRp4xS/P8cgA4EodeWD/QdHloZzSaV9v/U8bDU7PWXPEt/ib4TTeXjDalqKiplHV2MXj0+bCFef9vKY0iuuQG0QWqRAska5sArU5ae2SsQUZuU1ucFYZhfKFHQIpY+JElVXT8kyN0ofw4ej4TD4DQhloWxWHqWIo3x5fd+NYobgObETZw4v99zqlW9XOlAx+hPGLwoIpr0ZfztXswHT2mPTKmOlIbZDalVfuv1Ob0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqeA/wJu1VJc6zSGuLSkCm63qp30hybfY4gQjsoAMZY=;
 b=fOe7I4akfh/ytG1vPhnBkivuYIWyqORwEnJKBsNixmdcyBznJBqfc+XXIifN2OgvaW/sqpuDO7s306b8jK4J3U7q8M22nrmJ8xoGIP85rncfv4F51cinBq6ISGb5UE2E5unt7RhmjRCsahw9/n8I0xFDbrIx4fF+X0ANzQRsQdWCwZiPjFFDm30XYvSue60wC/VJhYdCKtZ0+SyBu8jLBmuPkQzOJ9YZcaydWojqNEkhMZ2Ex18K9F6wI206z9cmmWCf+S7QPlh/3T0MLXr83grAcF2rxD7nvyRsmhXpZ3rvMOo8H9jcKQ2Y3kusGU5KxXziuJZbDJA4uMS0fYRUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqeA/wJu1VJc6zSGuLSkCm63qp30hybfY4gQjsoAMZY=;
 b=O4x6+jENNGeOoALNFDz2WPUZ7uiJe7VAT5W40wDYn+0ludB2qh4Uv+N/U0vBuFdI64YpNRIIcypeEOJz7kzSXmQPCTUCKRysCNfzD+UGRjfQkX6FKl8HhZYW/4yOL4cSTMXohxepE8Heoev3OAFRwyyUCZoJbQ3kUYjsrQULizI=
Received: from PH7P220CA0079.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::27)
 by IA1PR19MB8851.namprd19.prod.outlook.com (2603:10b6:208:595::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:18:39 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:32c:cafe::7d) by PH7P220CA0079.outlook.office365.com
 (2603:10b6:510:32c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.0
 via Frontend Transport; Tue, 24 Feb 2026 16:18:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 18920406542;
	Tue, 24 Feb 2026 16:18:36 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0DA7482024B;
	Tue, 24 Feb 2026 16:18:36 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 2/4] ASoC: codecs: wm_adsp: Allow wm_adsp to hibernate without stopping DSP
Date: Tue, 24 Feb 2026 16:18:06 +0000
Message-ID: <20260224161821.93365-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
References: <20260224161821.93365-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|IA1PR19MB8851:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2120267b-6b6c-4434-702d-08de73c05e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bOQ2yfVq74in0vGprY8/ESBoznsQH5hpZxoG4qn93JF/IBe6k1djXSw/4PXS?=
 =?us-ascii?Q?tsbBC6UzllxyxqM1YxhGQTa7o954mW0jxQdlIK8Tlc7p7ABvSY65Xz+KEAdA?=
 =?us-ascii?Q?Tbp1NM/nBa23ajwOWyomXwfvb35Wmm2RGt4JfV6Grln3GexE2JwtPWb4TpXt?=
 =?us-ascii?Q?UF4dDuEbj1QUKWSreB0DVc4EGpQeHEVmle0e1qGJ6PjHrj5G0eUhHkp1r2U4?=
 =?us-ascii?Q?itryEGEmFoIsDazLnuzk3ibTkctzVQZUBYL0VS+R0YgYCzMQLZwu84PW8fz/?=
 =?us-ascii?Q?ggO7dmEkA0lv2ju7pploLS8/ZryMm9Y23xzhQAilB1cLe9WZj2ngpp/r/O6b?=
 =?us-ascii?Q?VDfWTCE1wkU22BIC8v2KSWgtL9S0UC05fml80QmtIj9caXXKo2Mt5MeKDcRB?=
 =?us-ascii?Q?DDqyTOVO4vnYjCezh4SWAxsSraUArtp1vk4EkGDgfxmouilU9zUYlmnja56C?=
 =?us-ascii?Q?R2s6hHjTcBqkn54r9kDOSbOc87M2y5Lq5I3JwWagsqFhy/tFFef/6vScle1J?=
 =?us-ascii?Q?w0zoCyBG6y4Sm8jSubQExRK6hPC6bOdDnkwqSkX5pLGmaPyduGINbpwnm4Vj?=
 =?us-ascii?Q?NzJ5VslkXediF8LXOcxX5PpEIWlKGae3Lrxw4i8mDnoVroW9gngVAH1JgKuG?=
 =?us-ascii?Q?KbzWe9Qp42AiWqgZuhW1c7sGzyz1ptKQRdPXu4YjPV8wGYsmlsznu/NOInrg?=
 =?us-ascii?Q?AMS2nPHfBnDiy9MyHZ+MC12qKpjjju7EGNyPfeMzIw4l1YfGC4K1IujClB2J?=
 =?us-ascii?Q?uawZ+QvH4CwmfakNo6Ax5BxTih1YUYJ9HtKCV8m0B7xuaooN+Q1cXawOahdR?=
 =?us-ascii?Q?CcsYUP2Otvk+Oac84zxP4cGEafvyXL9aweYdc7DScG9tBlml11baBu9oYWw+?=
 =?us-ascii?Q?4WXXJycN90Sys/UdWNVrGttpIbO2Yye5gIG05SOnGfiy5G9aa2Mkmh4xFGzq?=
 =?us-ascii?Q?1u8mglHb17uL0bSsEtiERt6bJqpwwQ6Alie8pnvLa+jFjU2FEXmICPvS6ZQ4?=
 =?us-ascii?Q?Meqv/A9kd7C+/aC1YUvCKE/fo9MhS4PAvq9VQHjATXwLgiqLewQD6ZbKB0B/?=
 =?us-ascii?Q?k+5I/Z5Eh6tRss2hnrryGdyIKKuh4GO16hy336p6vyonlHk9TlRVIzhfMA1l?=
 =?us-ascii?Q?dfVhsdx11mMvFEBEG7mpUqo7JpB+qNsxyC4nVbbaoBowL8WAr8ocxkVG3/pR?=
 =?us-ascii?Q?1YpuBxMqGf2L4eRU3vgAzJO0wLVzWo3Ph7WI1m5nAXujDGnu721v7drJ0Mwh?=
 =?us-ascii?Q?sbo588dJgGD9QFg9Wb+2xutAAFuKLxJTT63qx6bnDDRLrnTh7vXtqDf+Y+Cl?=
 =?us-ascii?Q?Hf6vfdin6tStu2Wdu80lod0x55lIP++QL9OKIRa3LypP5OmnQh/EfWgmjMRV?=
 =?us-ascii?Q?RXaaAzNMZ0DtfJnv0l0NZJwwWqlqaY+Yk3tQmQpehnUSFTp2IFEw+yXPHY4k?=
 =?us-ascii?Q?xfNFR56ZFBO2pLytdS/Pw6BK8jaC/dlASXuS+nF0EXT4BSox1URuoD6xekYu?=
 =?us-ascii?Q?F/V7YH2NuX4VYjiFEsLksv7R13rafoGjaV7Cq18/prOuXhL3Mo+21z3/C2eR?=
 =?us-ascii?Q?nExaadvDtN7+ij/MXa13iBxamwGIur5wWHbHpk79U3lr0iSH9kqAI/3vDITK?=
 =?us-ascii?Q?mutr3A/fNl5mt4t2H5c9L5wh39lHX9wnozUaWyYDlWVQVt2uacaURNdtLEtC?=
 =?us-ascii?Q?fcjb6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kj++WDq3iwLlRG1xL/uplyKbgMZC8ssZPtl3+EnUuWnwmuAlJLtxvVYMsmJd8lzx6FE/3W+pA02NrGGSu1wxWJjxtvuhDy3vHlzYSD5THvddwslinhahK5Nkpny8uewjHOWb7LWfjuyOhqyXPIbn1M5INXI4ZArXth9vbucYE7Igwh9ux4Aha889FQOVMVfDw7xYIfgRo9T1DUbs/IyM5tyxoZoCPqJjoXsKwgzdXpaPN+H5WDU+rbe760EbG8Nn9+YjTqKPININ4F83EE7bW2+l3eaRmLvGUVlQZ7g8rfiiITCb0hs1/+6YfGyYkCtzJYZN7Gig7hGqyhgOs40Ej/gIaBN6MzSgX8KJ1O8OgGw0NZVukXhwSfNDLFFzn6CKayz9vmku4LGFVMDaMUx5hp+Fm2hmIi2qTpXwWGYhjRYJqGpmBjxIWgOvhUCzZ0dt
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:18:38.0868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2120267b-6b6c-4434-702d-08de73c05e2d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8851
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEzNSBTYWx0ZWRfX1ah2z24UI8Xu
 lrjqGbfM3Hl0clWVX7CF/OrsubJnzdL87zk5EJ52UDRDcoBmdqJweUdH0TIus+M93kUwyCZ0sfU
 lvWuwkbXxVRJxCuuRrjlCn0ehpD9dS6/IuKD/d3gNH6GQz4ynRvjwF1SNOyK6gIM0cmUH7MsWlF
 jcF3ch8I6d6yQQ406SN6YJ+0cwjmwT4xtEdoP/L+ZxEMapz6S/5ICCRPSBO130tQ/v0sPwRjiUu
 BzJ1EsxWHGBUO4t6KU0itsIH1kgzOwLJhqzeNpwG2qsI3PA8OIDz46r0E7K8Kuhe1tioxPrDHn0
 XHA4k6oE7NmAh6IA5Svu6xSn403L2OIohHkDd3UxhiaDY4d1vYzDJdNOYF4T60jfwqF5O18E4pa
 JofgK95VupWgSh1WsDulofPqs6X00y+OnRd5rFXTIsdx9vM5O/x5unjQbPg9/YecffeRw8TL/uI
 NrDk78+wmd82qg2k8FQ==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699dcf65 cx=c_pps
 a=80uo2vwcsYp3yIYYF8sMvw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=sbEEYNrql6nwSTcRNn8A:9
X-Proofpoint-GUID: QuN6ZzDE4ZfpocRQ9ymcOxvfX-ivRzuZ
X-Proofpoint-ORIG-GUID: QuN6ZzDE4ZfpocRQ9ymcOxvfX-ivRzuZ
X-Proofpoint-Spam-Reason: safe

Some parts do not stop the DSP core before runtime suspend, however,
this leaves the DSP controls enabled and accessible whilst the part is
suspended and the regmap is cache_only.

Add new APIs to allow for the DSP to hibernate when the part is
suspended, and the DSP is not shut down.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 6 ++++++
 sound/soc/codecs/wm_adsp.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 2e23848e1dce..d95b54275b5e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1100,6 +1100,12 @@ void wm_adsp_stop(struct wm_adsp *dsp)
 }
 EXPORT_SYMBOL_GPL(wm_adsp_stop);
 
+void wm_adsp_hibernate(struct wm_adsp *dsp, bool hibernate)
+{
+	cs_dsp_hibernate(&dsp->cs_dsp, hibernate);
+}
+EXPORT_SYMBOL_GPL(wm_adsp_hibernate);
+
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event)
 {
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 8035fda71f8d..a9118be793d7 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -103,6 +103,7 @@ irqreturn_t wm_halo_wdt_expire(int irq, void *data);
 
 int wm_adsp_run(struct wm_adsp *dsp);
 void wm_adsp_stop(struct wm_adsp *dsp);
+void wm_adsp_hibernate(struct wm_adsp *dsp, bool hibernate);
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
 		  struct snd_kcontrol *kcontrol, int event);
 
-- 
2.43.0

