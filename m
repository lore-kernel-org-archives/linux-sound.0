Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76143436367;
	Thu,  5 Feb 2026 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310143; cv=fail; b=m/pEttShU3rgVgyNu5T+5s/2vIt9qvF0RtTeIb2Z2D3ua+HgVFP8EVVujirAYgamdQLayrrzyyVVVB59W+JgpEWfN4ft9a/cyOU2clWymw5GqHWKeKdDcniQyKAqD8mWYstL794qhteP89T36P19x4YN0vGMZpp8LVA9l90oDio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310143; c=relaxed/simple;
	bh=syeK5qRhMWTmAyEA0HOPIFBsDPT/C4y2bSDaGzRBDus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qeyJDKfwIvLTqjzCh0vXcuuvqK4dIrPXdmjUbBh4eiHltAdUC2SwF02KtjtxstMOuV3j+pwGMkFaKWNZdVTUjd96Fqp/1CYx0hMjnvLyv0IwN9ykCuP8zATmiRfRtYuEiFftZ1nxzDiqBLxjdMfh2CCS0fe0dLb+NASvuDDAkE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fJJo1Krp; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=s11H5H/V; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fJJo1Krp";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="s11H5H/V"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6154k5r6552672;
	Thu, 5 Feb 2026 10:48:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/317Fy2irVb8Pjy49zOFXC/WatcjKK+1SLxoRtQusOg=; b=
	fJJo1Krp8yOD6my3uxdQjYzhYPLEY1lqcsNqK89TC9Lbp1BNMLIkhoNDHJTUHycM
	vQp22A8I/ETL7SmPQxdPv0dphiJZ7S5b5FJupm/59IslUoVl+Llh21xEVCYeW8P0
	RZuhSUPvMOEtBr6wZ+DMcVTFDyPU9VLzycYbMdkp3lHZPH/uNlla19IVR3VLYZIZ
	zlBJRkMr5xUgfjv6iiTldQ4Q4C7ZfXxKkA5lbU6KyQhydKD3DUofhO/7g80+gI/m
	k0iC3RW7ffn6oB5DYeyqedf2jx4jDT/UHLDFBTBNB6pNjlEZqDK33HL5pIGrz72a
	D+WhlnrFSTqBHBbbEm9oMw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020078.outbound.protection.outlook.com [52.101.46.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4c1g12x7vv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 10:48:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNYOckYJIUAldzfdtfi8RzoLduqYXAY/iDcWV5qwp6q5rJauFFRmSrucer1eilxPJ9UswuwHlB7A04w3H9o+MdzcbPbck+E9dtav/7a7wZON7RIpaL1rcgGrUoaB39cawACai786/T5FBlavNzGwA62OsPMzA1YwgKBcWfzcoPmd1QjlFz+Acis/pHZTGd475fN8MkSQY4Ayl1+CWRh5Y3QsAXlBIVPfJ4LZMw2xxHs+meyviT7ijTbyp8+/2Z3DO6/ySESmbzceCBXH1HK2XuewRMZMZjSFf0kTrrF8qK8ft7Vg93a0DexBF7/15L4XdJ7darJ69lLBswokMo/mLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/317Fy2irVb8Pjy49zOFXC/WatcjKK+1SLxoRtQusOg=;
 b=kaZIYvfVxAC0KijtsxuQLUMcPUwIP4KbPUg0ggdBNV17hmoTYL9PPN147uJyPyQNpXZm36d8SONkRZvoS/PmOCYAJzkTsKvrAxFH6Atx82EQD5kFsU8MJp+3AWEZJZ32m45yHoprvq0UXrkKS8bMcA/vsw+gYw5P1uOQIRD0lh3Zcyv9B6Dys3fnkq8Dlofe4hEetr4az7LKp1kUDYf//I0c3H3T9ruWt8JvnGw/6Sx6fHgHEPL9up2B3U9nlkxu71JSa2xfprT+v5vBye8EgGF12dw+hPH1PUcLMkiZjvNkJGwtQ0UhAg2JiwpOQvTodnXpWNpEmVd+gdVvxGN6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/317Fy2irVb8Pjy49zOFXC/WatcjKK+1SLxoRtQusOg=;
 b=s11H5H/VBQ6Ixh/9cs70CDO69EFhGUS2Ehddj7UH4nV99/UUbuVelP8moDXRofWGFZjjBr60rfvyxCH07dA3uPLADelPQUDk9CTNSsTYqZ9H4L/YtLnuQcqcF5cNs6xpFlJbEO6tNDTu71tFRIdwqr76Mo5XozqH3INWKhCgOt8=
Received: from MN2PR15CA0065.namprd15.prod.outlook.com (2603:10b6:208:237::34)
 by LV9PR19MB9184.namprd19.prod.outlook.com (2603:10b6:408:2e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 16:48:40 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::8c) by MN2PR15CA0065.outlook.office365.com
 (2603:10b6:208:237::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Thu,
 5 Feb 2026 16:48:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 16:48:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B83BB406559;
	Thu,  5 Feb 2026 16:48:38 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9368C82025A;
	Thu,  5 Feb 2026 16:48:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: cs35l56: Support for reading speaker ID from on-chip GPIOs
Date: Thu,  5 Feb 2026 16:48:36 +0000
Message-ID: <20260205164838.1611295-2-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|LV9PR19MB9184:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b593693f-eac6-4b34-f802-08de64d66a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R6LB2e7uJvTKWjDae04FKJxLcfEFz7IZd7WUr0dVos/VPnDS18YE+2ZH4tN/?=
 =?us-ascii?Q?AhG2tkbG8uysiNudDQEaJKbJtz2gTUGS5Zp6A9HpJZwhXl3e+M3niADPkuYx?=
 =?us-ascii?Q?xcNK7BFXE8/cPETqmNW1H5M9xf7u44LVd0LSRW/RMnrXK/GURkEKEDUcHYM0?=
 =?us-ascii?Q?k3CcuFlytv77BS4xfX6QQRVBFjMN1BFVOyUsKZsAhR357uCtmrfj/sPi8D9R?=
 =?us-ascii?Q?Udp0T+qO+j+6Bm8waONypmjrh5XpvusT2TmbnbZtMKfBAeXnqs8Tw1vjqE5T?=
 =?us-ascii?Q?r6Vc6d83Jn+/aWe8H0+buF3WAiDKsDCetnete84vQj763izrl76cUJMQg+JZ?=
 =?us-ascii?Q?rKYqBjAqQMNwyXLO6fWOAbVJYtGiAS+sSz68NLYT5h8Ulv+xWJobGPD00qzi?=
 =?us-ascii?Q?4YJlQmAOatxhPQ2HJzN1LlQ2tLQD8pX30tTo28shEZnC/sG4kD8ty4F1uqMs?=
 =?us-ascii?Q?GclYSs/xLeRT0pIBwqSLQefORan4WSbZ6XBW1CXsNrRh8M1iWm10gOXgnj0z?=
 =?us-ascii?Q?Bo2OnnVaGd4vRoCJ5a1lRCedGGRCcnviCdcrIrx7BbxvlZEfNTC63u+frQrS?=
 =?us-ascii?Q?Y0rUryGTvHWduIj9VYylW+M6aE6o264EZ0MyCJw1AT9eU9+Dth5nrQQ/97n6?=
 =?us-ascii?Q?401+G63Qu3S4aMQpypsV9eL3FItDxG8zJZ3WXlbaEGSGP54BIsJ9CbwrgImI?=
 =?us-ascii?Q?dtalbguXQCQEQ7CPgbgOcIvCOZcEWQ0GbZ+pNEFRAnko4kK+mwmUZhP+Za4Q?=
 =?us-ascii?Q?OnhJ0aXI3AlApO48tHcePPdv7AvGQKkK8riUaRcFI060XpKES4E/w31tHCWz?=
 =?us-ascii?Q?Iya0Nq188XC7FJSAlE07N9YoLenGCoehUdzHS9SzmxeJGnQs3kWfZlOlPI7e?=
 =?us-ascii?Q?tg4qxeaoY9CuVhbE4A9z0p+AZiHzzyM4JXJ6E8QiQOw/04DU51RiCF97Hl1z?=
 =?us-ascii?Q?OjzhgGlKRvSVbybFpAgvCKyByJWzJWfwyGgEGXMP2X3L9PL75hYTAOfXHjLx?=
 =?us-ascii?Q?NYAo2VmETSWmxkETJcstbMMD50V17DhTmTvD5uf/jlt+QnbO5rvzSRpoJblP?=
 =?us-ascii?Q?STCHWKRbAbmtyiGfjfyCThcPsVpeojua1cZPZLVH+pE6wMmIw/CvKcsW6cZc?=
 =?us-ascii?Q?fz1y0KfE5BkNiyaUZP3MmLXk1nyI7ACR8ulYNc2+XOZPpfYmRphUlPtz7ISJ?=
 =?us-ascii?Q?6ZQE6fzRmPiZ/SRAjjdErybBlhu6VAaSmasUc/nZR2JBNtVenSvmMzRsvsGL?=
 =?us-ascii?Q?0nuehdyrGNd09Ocn10Us8yx0x0PqaWbKt/NhPaAO7WYLIVMgx95bbsjAthil?=
 =?us-ascii?Q?5H3F3ih45DrKG8TAmmWTYGPU/vPmaTGCs0Fmrfw9yn8cKSDSmjyFV7209cna?=
 =?us-ascii?Q?w/DQ4gfMuNynpswzZIN2RlkQs5iG8HCZXBQJkxsJfzgDWH4rTHh1Qw2MzX6i?=
 =?us-ascii?Q?smpyYyT3X9Fki7WTkHa+tOKXMx3oBtELwBlAejBlD8QuEY8ZjRLsypfvUeVq?=
 =?us-ascii?Q?KqMy616U8tX6Qh37N3zsK5Wr8lI/wyQTy6AIjI4lFABLOo9AsU0GfrE/ReBB?=
 =?us-ascii?Q?d7aEXJnItWZU+Kbv93sNnYId5BmqyvHVEiBWfa4wVRhwYDU+6pUYeXjthNhC?=
 =?us-ascii?Q?PwcYD+ijJ0683DlCvJ6sntYNciISX5Y/cZH/ym1WnbzIa5L96XCXuRuwV5ue?=
 =?us-ascii?Q?rBji+w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qYnz/gmeQdESlGiMaVL3YkkhDc4xTaBt3tJk04l7DcG/zOSaYNGCv8bL5PliDz51zOu20pkTFHeWZjpH20HY4MOS0Q9xYSGrFI6nKio9VyNJIOOLwXqO7h9W2OAFy8Puco/iY33sdjXP6hQZw04uBzWR0lIZ3XvDQfwU3QYNB9YTh0ZXS/I3VHrjdAQXR/GDqeqqqiPoHH5QCRQPpFza8wtQa3TBJah3USv60B+F1+BfBJBvgcbRb5ZcjljpfJZqL7cvN6uGGYN4x3CS+UFfwjtZmZi74WxqV4dWNa1R8jHjg33aEQv4I6mYoPL8FEp309FLuJkXQLC8t+QirdZhSiek8SUUQuY+LB8eSli0nThXbgiHEIgI+/1BOUHhq3BSFghyS8mCEsPgxV4voiw3Kf3YRvodpLzZ08ddguVDVHBpxwPrMcRTwkiAcERygiVt
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 16:48:39.6214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b593693f-eac6-4b34-f802-08de64d66a0d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR19MB9184
X-Proofpoint-GUID: 8AYQLsH2WIgufb7aY9PhzQBMdX36CsBv
X-Authority-Analysis: v=2.4 cv=Mdthep/f c=1 sm=1 tr=0 ts=6984c9ee cx=c_pps
 a=x8fXg9NzY3hbHNzXWQS9+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=RfwS6-uD395bjvBFnvAA:9
X-Proofpoint-ORIG-GUID: 8AYQLsH2WIgufb7aY9PhzQBMdX36CsBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyNyBTYWx0ZWRfX1xJ9hyNAQQXE
 VfNxJ0TQUaBoyZbcplj4UtWS8Vyhp62Rhnd0BvL/vsjrTiAbOnI31uJx4K9l3jIsFyGekMnjDcp
 wVk1KTVf6Na9xY9fanPvAVB2ZprgATXkEYn3ceFmnKeoO3iepcyezjk5YKNcUQt3KtEtpSkvQTw
 kJhf0+8B7kG2c6ikSsTrkUnEwrk+qYA9y7L2qxokNmSyac+Y1F9ds3ouQfKhGAJ8rlMBszVInhw
 gLWR0535f9aIiIveTZHNehCw6STgZvZw2jG6sv55PKszFcilULpzfHGSm9Xj1tELHV6jhJtGSwn
 wM+og8Mv5Swj9mhEkpKN7kEY1k5vlcR7MhllUWl1gFgjrPhNYOMKbT2OulnUr3dOD9DarxrlkVy
 3Uk2OyAo6W5gsLVYJ3pigUf6KTOXX494ALxwungbNlRal5F2Pfqo7At4Rk3vgWL72PRUbC5A5Bo
 GYysCu2qivOkZOs8E8Q==
X-Proofpoint-Spam-Reason: safe

Add support for using the state of pins on the amplifier to indicate
the type of speaker fitted.

Previously, where there were alternate speaker vendors, this was
indicated using host CPU GPIOs.

Some new Dell models use spare pins on the CS35L63 as GPIOs for the
speaker ID detection.

Cirrus-specific SDCA Disco properties provide a list of the pins to be
used, and pull-up/down settings for the pads. This list is ordered,
MSbit to LSbit.

The code to set the firmware filename has been modified to check for
using chip pins for speaker ID. The entire block of code to set
firmware name has been moved out of cs35l56_component_probe() into
its own function to make it easier to KUnit test.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  37 +++++++
 sound/soc/codecs/cs35l56-shared.c | 167 ++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        | 141 ++++++++++++++++++++++++-
 sound/soc/codecs/cs35l56.h        |   2 +
 4 files changed, 343 insertions(+), 4 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 5928af539c46..ae1e1489b671 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -9,6 +9,7 @@
 #ifndef __CS35L56_H
 #define __CS35L56_H
 
+#include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/regulator/consumer.h>
@@ -26,6 +27,9 @@ struct snd_ctl_elem_value;
 #define CS35L56_GLOBAL_ENABLES				0x0002014
 #define CS35L56_BLOCK_ENABLES				0x0002018
 #define CS35L56_BLOCK_ENABLES2				0x000201C
+#define CS35L56_SYNC_GPIO1_CFG				0x0002410
+#define CS35L56_ASP2_DIO_GPIO13_CFG			0x0002440
+#define CS35L56_UPDATE_REGS				0x0002A0C
 #define CS35L56_REFCLK_INPUT				0x0002C04
 #define CS35L56_GLOBAL_SAMPLE_RATE			0x0002C0C
 #define CS35L56_OTP_MEM_53				0x00300D4
@@ -65,6 +69,9 @@ struct snd_ctl_elem_value;
 #define CS35L56_IRQ1_MASK_8				0x000E0AC
 #define CS35L56_IRQ1_MASK_18				0x000E0D4
 #define CS35L56_IRQ1_MASK_20				0x000E0DC
+#define CS35L56_GPIO_STATUS1				0x000F000
+#define CS35L56_GPIO1_CTRL1				0x000F008
+#define CS35L56_GPIO13_CTRL1				0x000F038
 #define CS35L56_MIXER_NGATE_CH1_CFG			0x0010004
 #define CS35L56_MIXER_NGATE_CH2_CFG			0x0010008
 #define CS35L56_DSP_MBOX_1_RAW				0x0011000
@@ -130,6 +137,17 @@ struct snd_ctl_elem_value;
 #define CS35L56_MTLREVID_MASK				0x0000000F
 #define CS35L56_REVID_B0				0x000000B0
 
+/* PAD_INTF */
+#define CS35L56_PAD_GPIO_PULL_MASK			GENMASK(3, 2)
+#define CS35L56_PAD_GPIO_IE				BIT(0)
+
+#define CS35L56_PAD_PULL_NONE				0
+#define CS35L56_PAD_PULL_UP				1
+#define CS35L56_PAD_PULL_DOWN				2
+
+/* UPDATE_REGS */
+#define CS35L56_UPDT_GPIO_PRES				BIT(6)
+
 /* ASP_ENABLES1 */
 #define CS35L56_ASP_RX2_EN_SHIFT			17
 #define CS35L56_ASP_RX1_EN_SHIFT			16
@@ -185,6 +203,12 @@ struct snd_ctl_elem_value;
 /* MIXER_NGATE_CHn_CFG */
 #define CS35L56_AUX_NGATE_CHn_EN			0x00000001
 
+/* GPIOn_CTRL1 */
+#define CS35L56_GPIO_DIR_MASK				BIT(31)
+#define CS35L56_GPIO_FN_MASK				GENMASK(2, 0)
+
+#define CS35L56_GPIO_FN_GPIO				0x00000001
+
 /* Mixer input sources */
 #define CS35L56_INPUT_SRC_NONE				0x00
 #define CS35L56_INPUT_SRC_ASP1RX1			0x08
@@ -279,6 +303,7 @@ struct snd_ctl_elem_value;
 #define CS35L56_HALO_STATE_TIMEOUT_US			250000
 #define CS35L56_RESET_PULSE_MIN_US			1100
 #define CS35L56_WAKE_HOLD_TIME_US			1000
+#define CS35L56_PAD_PULL_SETTLE_US			10
 
 #define CS35L56_CALIBRATION_POLL_US			(100 * USEC_PER_MSEC)
 #define CS35L56_CALIBRATION_TIMEOUT_US			(5 * USEC_PER_SEC)
@@ -289,6 +314,9 @@ struct snd_ctl_elem_value;
 #define CS35L56_NUM_BULK_SUPPLIES			3
 #define CS35L56_NUM_DSP_REGIONS				5
 
+#define CS35L56_MAX_GPIO				13
+#define CS35L63_MAX_GPIO				9
+
 /* Additional margin for SYSTEM_RESET to control port ready on SPI */
 #define CS35L56_SPI_RESET_TO_PORT_READY_US (CS35L56_CONTROL_PORT_READY_US + 2500)
 
@@ -338,6 +366,10 @@ struct cs35l56_base {
 	const struct cirrus_amp_cal_controls *calibration_controls;
 	struct dentry *debugfs;
 	u64 silicon_uid;
+	u8 onchip_spkid_gpios[5];
+	u8 num_onchip_spkid_gpios;
+	u8 onchip_spkid_pulls[5];
+	u8 num_onchip_spkid_pulls;
 };
 
 static inline bool cs35l56_is_otp_register(unsigned int reg)
@@ -413,6 +445,11 @@ void cs35l56_warn_if_firmware_missing(struct cs35l56_base *cs35l56_base);
 void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp);
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base);
 int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base);
+int cs35l56_check_and_save_onchip_spkid_gpios(struct cs35l56_base *cs35l56_base,
+					      const u32 *gpios, int num_gpios,
+					      const u32 *pulls, int num_pulls);
+int cs35l56_configure_onchip_spkid_pads(struct cs35l56_base *cs35l56_base);
+int cs35l56_read_onchip_spkid(struct cs35l56_base *cs35l56_base);
 int cs35l56_get_bclk_freq_id(unsigned int freq);
 void cs35l56_fill_supply_names(struct regulator_bulk_data *data);
 
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 60100c8f8c95..55c75b9e4172 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -6,12 +6,14 @@
 //                    Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/array_size.h>
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/firmware/cirrus/wmfw.h>
 #include <linux/fs.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kstrtox.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
@@ -182,6 +184,8 @@ static bool cs35l56_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L56_OTP_MEM_53:
 	case CS35L56_OTP_MEM_54:
 	case CS35L56_OTP_MEM_55:
+	case CS35L56_SYNC_GPIO1_CFG ... CS35L56_ASP2_DIO_GPIO13_CFG:
+	case CS35L56_UPDATE_REGS:
 	case CS35L56_ASP1_ENABLES1:
 	case CS35L56_ASP1_CONTROL1:
 	case CS35L56_ASP1_CONTROL2:
@@ -213,6 +217,7 @@ static bool cs35l56_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L56_IRQ1_MASK_8:
 	case CS35L56_IRQ1_MASK_18:
 	case CS35L56_IRQ1_MASK_20:
+	case CS35L56_GPIO_STATUS1 ... CS35L56_GPIO13_CTRL1:
 	case CS35L56_MIXER_NGATE_CH1_CFG:
 	case CS35L56_MIXER_NGATE_CH2_CFG:
 	case CS35L56_DSP_VIRTUAL1_MBOX_1:
@@ -262,6 +267,8 @@ static bool cs35l56_common_volatile_reg(unsigned int reg)
 	case CS35L56_GLOBAL_ENABLES:		   /* owned by firmware */
 	case CS35L56_BLOCK_ENABLES:		   /* owned by firmware */
 	case CS35L56_BLOCK_ENABLES2:		   /* owned by firmware */
+	case CS35L56_SYNC_GPIO1_CFG ... CS35L56_ASP2_DIO_GPIO13_CFG:
+	case CS35L56_UPDATE_REGS:
 	case CS35L56_REFCLK_INPUT:		   /* owned by firmware */
 	case CS35L56_GLOBAL_SAMPLE_RATE:	   /* owned by firmware */
 	case CS35L56_DACPCM1_INPUT:		   /* owned by firmware */
@@ -272,6 +279,7 @@ static bool cs35l56_common_volatile_reg(unsigned int reg)
 	case CS35L56_IRQ1_EINT_1 ... CS35L56_IRQ1_EINT_8:
 	case CS35L56_IRQ1_EINT_18:
 	case CS35L56_IRQ1_EINT_20:
+	case CS35L56_GPIO_STATUS1 ... CS35L56_GPIO13_CTRL1:
 	case CS35L56_MIXER_NGATE_CH1_CFG:
 	case CS35L56_MIXER_NGATE_CH2_CFG:
 	case CS35L56_DSP_VIRTUAL1_MBOX_1:
@@ -1552,6 +1560,165 @@ int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_get_speaker_id, "SND_SOC_CS35L56_SHARED");
 
+int cs35l56_check_and_save_onchip_spkid_gpios(struct cs35l56_base *cs35l56_base,
+					      const u32 *gpios, int num_gpios,
+					      const u32 *pulls, int num_pulls)
+{
+	int max_gpio;
+	int ret = 0;
+	int i;
+
+	if ((num_gpios > ARRAY_SIZE(cs35l56_base->onchip_spkid_gpios)) ||
+	    (num_pulls > ARRAY_SIZE(cs35l56_base->onchip_spkid_pulls)))
+		return -EOVERFLOW;
+
+	switch (cs35l56_base->type) {
+	case 0x54:
+	case 0x56:
+	case 0x57:
+		max_gpio = CS35L56_MAX_GPIO;
+		break;
+	default:
+		max_gpio = CS35L63_MAX_GPIO;
+		break;
+	}
+
+	for (i = 0; i < num_gpios; i++) {
+		if (gpios[i] < 1 || gpios[i] > max_gpio) {
+			dev_err(cs35l56_base->dev, "Invalid spkid GPIO %d\n", gpios[i]);
+			/* Keep going so we log all bad values */
+			ret = -EINVAL;
+		}
+
+		/* Change to zero-based */
+		cs35l56_base->onchip_spkid_gpios[i] = gpios[i] - 1;
+	}
+
+	for (i = 0; i < num_pulls; i++) {
+		switch (pulls[i]) {
+		case 0:
+			cs35l56_base->onchip_spkid_pulls[i] = CS35L56_PAD_PULL_NONE;
+			break;
+		case 1:
+			cs35l56_base->onchip_spkid_pulls[i] = CS35L56_PAD_PULL_UP;
+			break;
+		case 2:
+			cs35l56_base->onchip_spkid_pulls[i] = CS35L56_PAD_PULL_DOWN;
+			break;
+		default:
+			dev_err(cs35l56_base->dev, "Invalid spkid pull %d\n", pulls[i]);
+			/* Keep going so we log all bad values */
+			ret = -EINVAL;
+			break;
+		}
+	}
+	if (ret)
+		return ret;
+
+	cs35l56_base->num_onchip_spkid_gpios = num_gpios;
+	cs35l56_base->num_onchip_spkid_pulls = num_pulls;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_check_and_save_onchip_spkid_gpios, "SND_SOC_CS35L56_SHARED");
+
+/* Caller must pm_runtime resume before calling this function */
+int cs35l56_configure_onchip_spkid_pads(struct cs35l56_base *cs35l56_base)
+{
+	struct regmap *regmap = cs35l56_base->regmap;
+	unsigned int addr_offset, val;
+	int num_gpios, num_pulls;
+	int i, ret;
+
+	if (cs35l56_base->num_onchip_spkid_gpios == 0)
+		return 0;
+
+	num_gpios = min(cs35l56_base->num_onchip_spkid_gpios,
+			ARRAY_SIZE(cs35l56_base->onchip_spkid_gpios));
+	num_pulls = min(cs35l56_base->num_onchip_spkid_pulls,
+			ARRAY_SIZE(cs35l56_base->onchip_spkid_pulls));
+
+	for (i = 0; i < num_gpios; i++) {
+		addr_offset = cs35l56_base->onchip_spkid_gpios[i] * sizeof(u32);
+
+		/* Set unspecified pulls to NONE */
+		if (i < num_pulls) {
+			val = FIELD_PREP(CS35L56_PAD_GPIO_PULL_MASK,
+					 cs35l56_base->onchip_spkid_pulls[i]);
+		} else {
+			val = FIELD_PREP(CS35L56_PAD_GPIO_PULL_MASK, CS35L56_PAD_PULL_NONE);
+		}
+
+		ret = regmap_update_bits(regmap, CS35L56_SYNC_GPIO1_CFG + addr_offset,
+					 CS35L56_PAD_GPIO_PULL_MASK | CS35L56_PAD_GPIO_IE,
+					 val | CS35L56_PAD_GPIO_IE);
+		if (ret) {
+			dev_err(cs35l56_base->dev, "GPIO%d set pad fail: %d\n",
+				cs35l56_base->onchip_spkid_gpios[i] + 1, ret);
+			return ret;
+		}
+	}
+
+	ret = regmap_write(regmap, CS35L56_UPDATE_REGS, CS35L56_UPDT_GPIO_PRES);
+	if (ret) {
+		dev_err(cs35l56_base->dev, "UPDT_GPIO_PRES failed:%d\n", ret);
+		return ret;
+	}
+
+	usleep_range(CS35L56_PAD_PULL_SETTLE_US, CS35L56_PAD_PULL_SETTLE_US * 2);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_configure_onchip_spkid_pads, "SND_SOC_CS35L56_SHARED");
+
+/* Caller must pm_runtime resume before calling this function */
+int cs35l56_read_onchip_spkid(struct cs35l56_base *cs35l56_base)
+{
+	struct regmap *regmap = cs35l56_base->regmap;
+	unsigned int addr_offset, val;
+	int num_gpios;
+	int speaker_id = 0;
+	int i, ret;
+
+	if (cs35l56_base->num_onchip_spkid_gpios == 0)
+		return -ENOENT;
+
+	num_gpios = min(cs35l56_base->num_onchip_spkid_gpios,
+			ARRAY_SIZE(cs35l56_base->onchip_spkid_gpios));
+
+	for (i = 0; i < num_gpios; i++) {
+		addr_offset = cs35l56_base->onchip_spkid_gpios[i] * sizeof(u32);
+
+		ret = regmap_update_bits(regmap, CS35L56_GPIO1_CTRL1 + addr_offset,
+					 CS35L56_GPIO_DIR_MASK | CS35L56_GPIO_FN_MASK,
+					 CS35L56_GPIO_DIR_MASK | CS35L56_GPIO_FN_GPIO);
+		if (ret) {
+			dev_err(cs35l56_base->dev, "GPIO%u set func fail: %d\n",
+				cs35l56_base->onchip_spkid_gpios[i] + 1, ret);
+			return ret;
+		}
+	}
+
+	ret = regmap_read(regmap, CS35L56_GPIO_STATUS1, &val);
+	if (ret) {
+		dev_err(cs35l56_base->dev, "GPIO%d status read failed: %d\n",
+			cs35l56_base->onchip_spkid_gpios[i] + 1, ret);
+		return ret;
+	}
+
+	for (i = 0; i < num_gpios; i++) {
+		speaker_id <<= 1;
+
+		if (val & BIT(cs35l56_base->onchip_spkid_gpios[i]))
+			speaker_id |= 1;
+	}
+
+	dev_dbg(cs35l56_base->dev, "Onchip GPIO Speaker ID = %d\n", speaker_id);
+
+	return speaker_id;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_read_onchip_spkid, "SND_SOC_CS35L56_SHARED");
+
 static const u32 cs35l56_bclk_valid_for_pll_freq_table[] = {
 	[0x0C] = 128000,
 	[0x0F] = 256000,
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 31dd2f7b2858..2ff8b172b76e 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1179,15 +1179,28 @@ VISIBLE_IF_KUNIT int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56)
 }
 EXPORT_SYMBOL_IF_KUNIT(cs35l56_set_fw_suffix);
 
-static int cs35l56_component_probe(struct snd_soc_component *component)
+VISIBLE_IF_KUNIT int cs35l56_set_fw_name(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
-	struct dentry *debugfs_root = component->debugfs_root;
 	unsigned short vendor, device;
 	int ret;
 
-	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
+	if ((cs35l56->speaker_id < 0) && cs35l56->base.num_onchip_spkid_gpios) {
+		PM_RUNTIME_ACQUIRE(cs35l56->base.dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret)
+			return ret;
+
+		ret = cs35l56_configure_onchip_spkid_pads(&cs35l56->base);
+		if (ret)
+			return ret;
+
+		ret = cs35l56_read_onchip_spkid(&cs35l56->base);
+		if (ret < 0)
+			return ret;
+
+		cs35l56->speaker_id = ret;
+	}
 
 	if (!cs35l56->dsp.system_name &&
 	    (snd_soc_card_get_pci_ssid(component->card, &vendor, &device) == 0)) {
@@ -1208,6 +1221,19 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 			return -ENOMEM;
 	}
 
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(cs35l56_set_fw_name);
+
+static int cs35l56_component_probe(struct snd_soc_component *component)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
+	struct dentry *debugfs_root = component->debugfs_root;
+	int ret;
+
+	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
+
 	if (!wait_for_completion_timeout(&cs35l56->init_completion,
 					 msecs_to_jiffies(5000))) {
 		dev_err(cs35l56->base.dev, "%s: init_completion timed out\n", __func__);
@@ -1219,6 +1245,10 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 		return -ENOMEM;
 
 	cs35l56->component = component;
+	ret = cs35l56_set_fw_name(component);
+	if (ret)
+		return ret;
+
 	ret = cs35l56_set_fw_suffix(cs35l56);
 	if (ret)
 		return ret;
@@ -1532,6 +1562,105 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 	return 0;
 }
 
+static int cs35l56_read_fwnode_u32_array(struct device *dev,
+					struct fwnode_handle *parent_node,
+					const char *prop_name,
+					int max_count,
+					u32 *dest)
+{
+	int count, ret;
+
+	count = fwnode_property_count_u32(parent_node, prop_name);
+	if ((count == 0) || (count == -EINVAL) || (count == -ENODATA)) {
+		dev_dbg(dev, "%s not found in %s\n", prop_name, fwnode_get_name(parent_node));
+		return 0;
+	}
+
+	if (count < 0) {
+		dev_err(dev, "Get %s error:%d\n", prop_name, count);
+		return count;
+	}
+
+	if (count > max_count) {
+		dev_err(dev, "%s too many entries (%d)\n", prop_name, count);
+		return -EOVERFLOW;
+	}
+
+	ret = fwnode_property_read_u32_array(parent_node, prop_name, dest, count);
+	if (ret) {
+		dev_err(dev, "Error reading %s: %d\n", prop_name, ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static int cs35l56_process_xu_onchip_speaker_id(struct cs35l56_private *cs35l56,
+						struct fwnode_handle *ext_node)
+{
+	static const char * const gpio_name = "01fa-spk-id-gpios-onchip";
+	static const char * const pull_name = "01fa-spk-id-gpios-onchip-pull";
+	u32 gpios[5], pulls[5];
+	int num_gpios, num_pulls;
+	int ret;
+
+	static_assert(ARRAY_SIZE(gpios) == ARRAY_SIZE(cs35l56->base.onchip_spkid_gpios));
+	static_assert(ARRAY_SIZE(pulls) == ARRAY_SIZE(cs35l56->base.onchip_spkid_pulls));
+
+	num_gpios = cs35l56_read_fwnode_u32_array(cs35l56->base.dev, ext_node, gpio_name,
+						  ARRAY_SIZE(gpios), gpios);
+	if (num_gpios < 1)
+		return num_gpios;
+
+	num_pulls = cs35l56_read_fwnode_u32_array(cs35l56->base.dev, ext_node, pull_name,
+						  ARRAY_SIZE(pulls), pulls);
+	if (num_pulls < 0)
+		return num_pulls;
+
+	if (num_pulls != num_gpios) {
+		dev_warn(cs35l56->base.dev, "%s count(%d) != %s count(%d)\n",
+			pull_name, num_pulls, gpio_name, num_gpios);
+	}
+
+	ret = cs35l56_check_and_save_onchip_spkid_gpios(&cs35l56->base,
+							gpios, num_gpios,
+							pulls, num_pulls);
+	if (ret) {
+		return dev_err_probe(cs35l56->base.dev, ret, "Error in %s/%s\n",
+				     gpio_name, pull_name);
+	}
+
+	return 0;
+}
+
+VISIBLE_IF_KUNIT int cs35l56_process_xu_properties(struct cs35l56_private *cs35l56)
+{
+	struct fwnode_handle *ext_node = NULL;
+	struct fwnode_handle *link;
+	int ret;
+
+	if (!cs35l56->sdw_peripheral)
+		return 0;
+
+	fwnode_for_each_child_node(dev_fwnode(cs35l56->base.dev), link) {
+		ext_node = fwnode_get_named_child_node(link,
+						       "mipi-sdca-function-expansion-subproperties");
+		if (ext_node) {
+			fwnode_handle_put(link);
+			break;
+		}
+	}
+
+	if (!ext_node)
+		return 0;
+
+	ret = cs35l56_process_xu_onchip_speaker_id(cs35l56, ext_node);
+	fwnode_handle_put(ext_node);
+
+	return ret;
+}
+EXPORT_SYMBOL_IF_KUNIT(cs35l56_process_xu_properties);
+
 static int cs35l56_get_firmware_uid(struct cs35l56_private *cs35l56)
 {
 	struct device *dev = cs35l56->base.dev;
@@ -1712,6 +1841,10 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 	if (ret != 0)
 		goto err;
 
+	ret = cs35l56_process_xu_properties(cs35l56);
+	if (ret)
+		goto err;
+
 	ret = cs35l56_dsp_init(cs35l56);
 	if (ret < 0) {
 		dev_err_probe(cs35l56->base.dev, ret, "DSP init failed\n");
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 7187885a13c1..691f857d0bd8 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -76,6 +76,8 @@ void cs35l56_remove(struct cs35l56_private *cs35l56);
 
 #if IS_ENABLED(CONFIG_KUNIT)
 int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l56);
+int cs35l56_set_fw_name(struct snd_soc_component *component);
+int cs35l56_process_xu_properties(struct cs35l56_private *cs35l56);
 #endif
 
 #endif /* ifndef CS35L56_H */
-- 
2.47.3

