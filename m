Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756641E98EF;
	Tue,  3 Feb 2026 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079157; cv=fail; b=hU7UQXRl64R37ABMNhj7zfBKLcyNf5OT/xrQmtzP80pe8ZzaEp84cbT83md6tz+aMiofLuxv2vRGXL4slaUTiODVOSzkWo1tqF70iP/4hpqJGp8PeOnAibSyDNlxqO40NqITzehWTIOlodEY36IRe+2dtwB3jbg/88PFBfPSWb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079157; c=relaxed/simple;
	bh=5AfQp4OOwtpZha3LJBXAdCFoVJpmCfoQkXlfAqmgZDk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XnFTn2mJLfpiQ01cc43aPd1cz2QxwZA7D1n/Jne37x2OrOgBfQXRKdbPkDU0n9HgCGOhRXcCDLtsy0yHsBam6EuxM0hYmOJ/lMJY+RNJMieyYZTSgCHt2MEvPbeX4xZiAzzGsf1ywvAP2LbizgrK1V7wMYgq3LrZJXpS+rO7E3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ixvvonOe; arc=fail smtp.client-ip=40.107.209.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ixvvonOe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QD8CtEdtmWlcYmWLj5jVSpWRSw5c4y7oZmDdGNfo2q/Rys536byylkGvNSn4NyHgIlJwYV7dsQ26c+eNttbAfmJvNGpYenBpzhZmSBQl4Y2MhlaO23mZXAuTsBI/FCMJenG1U3BQkta4ftCzvlZdUUjPJL0q6UUeDcJzPtxgEwJodXJS3It2TTC/ArOsDS1occ+0uHGvZnyTMF7KQ2aK88AlrXt/PArzJSQZ9IxB/zuEUcrdVCY74KFv3nxvw+hDGEl3xJZMYd33wS7q1XQkX8Lc4M5zcyW1DHw8iHgn4utzWjpuenQjZHYQ5wlMXLRGicuN3JFe3CgWmwV/acchIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bD+aRaoHRdk09lqfWtRTxTdJENMhAQeMyC3hoYQrZ6U=;
 b=crtRIdtQwPfJqYlckZUAqBIQ58z9DcSWiJrCKA+rbuXWmGe7Bjay7Ipd43a4NSSZzpP/QRZheh0Albq/5LDa8LemUjqB27WOzKzqP1rnQv5vXvFLZPfmS6Uu46INpnQ9+4OzwMPXc3F0F68jKYstKaSAPiOWbzVJbXdc+2H+02uPYVw4Z4GdrYf3LQOhsyImsxAET4nobJTMsjqtahhoRrY5H8AcDcaWP77nqXhNLDcrmq6GkWptv47eEoXfvzqN+16r43AA0ZCGbyefULIrakBsFViN93x4HicPdW4L0aBpo1ThhJpX0xSRt2j0Ne0/JqvXwOWZRaQ6PBnZOD4uHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bD+aRaoHRdk09lqfWtRTxTdJENMhAQeMyC3hoYQrZ6U=;
 b=ixvvonOe84lJL6GITmJae8nRrDUy5nzCYA2Z6tg18xi4u/HnqX8akjJza25hUbmQWSsKOKWNj+eJQGZP/i5/wx/vn8Gtb3lvT0eBOtACM4U0iwyQhQGd+ube7bpuikawJ41qqd7hfYzL1snk8/3t+VVlvHfVbGNiO9tbgqDzGRk=
Received: from PH8P220CA0042.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::14)
 by LV3PR10MB7964.namprd10.prod.outlook.com (2603:10b6:408:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:39:10 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:510:2d9:cafe::46) by PH8P220CA0042.outlook.office365.com
 (2603:10b6:510:2d9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 00:39:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002BA4B.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 00:39:08 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:06 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 18:39:06 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6130d6mX2625696;
	Mon, 2 Feb 2026 18:39:06 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 3/4] ASoC: ti: davinci-mcasp: Streamline pdir behavior across rx & tx streams
Date: Mon, 2 Feb 2026 18:37:02 -0600
Message-ID: <20260203003703.2334443-4-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203003703.2334443-1-sen@ti.com>
References: <20260203003703.2334443-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|LV3PR10MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: a5dbdc09-3819-43dc-f257-08de62bca48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sx75/9LZSL1QHL2/rYW3zxptFvzFPTfJGVZH2+7wCtE5Ko7v2Dc+dx4l+BiB?=
 =?us-ascii?Q?DQgAc1sIL9ASha2llSTma732oYBsQWss7ZlKtB/djNsBLgDLxL9aa4twesP3?=
 =?us-ascii?Q?7nYVYBeEr5NiXx8M44Ipk4ylIiIUVLj42LCQSlCTA83MQ3LextwciF8xA2u/?=
 =?us-ascii?Q?bkkLze6rn2mkh8n8n/Eg9ub+KtWG097+0jcbct0iLf9tbo9PmJAjvBWSspVC?=
 =?us-ascii?Q?CXHdrfwD6YKNcQFS4cCJC9cAm6mGRrAVsOIaj2tFYqPX6nm4ySseBLV5V/N/?=
 =?us-ascii?Q?5TF3LWruNN30eqCsUPTMy+wmpA0vD2e7nudXxgRlV56qXkkJaaNEIzVaWrPf?=
 =?us-ascii?Q?Unz1ewN8A+RDxTbLCFw1XJqm7lmZDqBvx3GXfVPy7GKFZuQnkmb0uMBECrqe?=
 =?us-ascii?Q?05UhYUKLKDH3Dcx0XSmhgkQ1iFHLq0ZXyVmW/B+l7kSz81vEIBIiTWXxiZTA?=
 =?us-ascii?Q?2b1HvXXCKduMzVOo7lLm93Y83gZl89d6rX6jCzrz3fxqKrIeot+z3c0/POLI?=
 =?us-ascii?Q?RuUy9lRAyl0woA4AY7rc+nJPmLf9fxe/1RqEOAOhIluWKJTIhLLGPsqsaS9M?=
 =?us-ascii?Q?EWFcbXCw921tUKpjFqiAecME8y6ds5TqYrd+jaJwFeKMKOUdGkteTdVPuePu?=
 =?us-ascii?Q?ivgMbyyxm8+LzJ6c5pIPnPBMBPrAcLYBfZZeLo5MCe7K1Xj4fGhrh9Rg96ow?=
 =?us-ascii?Q?NGSAs2FjZb3SBRJVuA7BCzTpq0Lh4o+50zdrZUG5DAhs6iT67kkrF9yL1Qe1?=
 =?us-ascii?Q?mqAKdHblocvsNOyWyEnzmv5TsTgaZys3KCNKEWMOXSPJeffENUPMZbTk6B+W?=
 =?us-ascii?Q?N+eOZ9/JzB6L4vxkyVx6gNY3FRY5O3PLEWna4LKerCbpjCoxMctPAGTbn6Uz?=
 =?us-ascii?Q?tlovuIVYTfgubbgtcGrLOtaumcYENqiDfxsIP0vbpEdlHL6gGVwYmyUgonv0?=
 =?us-ascii?Q?+O3bXRqckIFUZw65bK0+Fc1z+KD3XNh+QdGJ4eqwohpIqKUz8RtVHbiO/1M0?=
 =?us-ascii?Q?d6r12L3Ny1BoCPK13HZRXbJUsAQ1GELajq8jwF7wzAivUWNBLMFu5QtIbVW0?=
 =?us-ascii?Q?DT9NrFDs5JgfmIFTK8Ygtn5RzVTneokNJimKYe7X+u1cNExy7ZGVPFF1HSBj?=
 =?us-ascii?Q?6HuRNAdSM3ZWgMf36M+au0IuI//DsTpSGtSL4oejvXEj+CcUN0JraSleH/33?=
 =?us-ascii?Q?846cV09XfFDAluBdBdlmhgCpInwWpcZRP75gkuMEZuqoWDQt4oJLOg+QMuvj?=
 =?us-ascii?Q?8+mu6PC04ltW7IVgbtL09ubK2oUmzK0owf7AHwhyRFbY/lcZme9kuitcfp+M?=
 =?us-ascii?Q?pRK5FPOhDQ5gtD3WQFdE07VrBhIcLEMjm4W7r1dosT6sEoY/312m/tOxx/NL?=
 =?us-ascii?Q?DwsfVF+mRZl3LL2XfkHSKaZVMImH0KDuSb7tok6u9xNYfKean034GpP7t+Lh?=
 =?us-ascii?Q?uD5p/IdY45nb6oKjiYDm0l82oUpdfSyEncxO8Wg1R6z/Y5+S98ob39Bl1V2n?=
 =?us-ascii?Q?ekH6Zr+3nwDwhp/5BVEMTqeob8H0KF4qqdCpN6272EdrAp1PBiF9rsqkYuJq?=
 =?us-ascii?Q?aLu8tI2ZgI8WjEYgNOzPUNhuJzgXVkYvx92uz3qQuEpMXSYC0OMgb6fdQcDb?=
 =?us-ascii?Q?f9V+mtZvDlUz2xHjhvSDfyjprxi8N793YzQAdYnn+8Yp4TlcUMlVmVDdQhTt?=
 =?us-ascii?Q?TK1azw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/KabF2k+/eJbPBwTZJRnEchN+6u8JrasdmyxwajWw1+bGAi2by6XBQlpNfsEPw4qO5XY20EfRVXn+2A7jijsnw+TLNwy+RaKvJ/1HmkQ+ptB6gHxLoaHSXEazesg5bG572DBQ4Q0NgLzjGpbiGR1XKHqB4K6Bx0vCVw7GMBgXIw5myWAIWQezqjeZN1kIysudJ/Ag6NbR8Crgqwq0jZNQ3vjBZe6COy3aFnvrrs7OVVyahv+I/ZMe8m5Mcfiy7Vg+8zoK6lgTaQGCfx5ncj8jfpLPaVq+l6yleSUdxGBQ2lJICjjt8t2WfvbD2CC+dLP1jp9RhIn21Q+kyKQAfAmkRuJXWTflhs1Z/SaOwcXLpmTRTTwEIxNv0PHs9VW8bmj5ENiIokOaWRYbA/ihwSZ+ILWX1AaYloG1Q/pcODAUGlSxwtmpAOu740JNK2OvOJp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:39:08.6561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dbdc09-3819-43dc-f257-08de62bca48d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7964

Simplify the mcasp_set_clk_pdir caller convention in start/stop stream
function, to make it so that set_clk_pdir gets called regardless when
stream starts and also disables when stream ends.

Functionality-wise, everything remains the same as the previously skipped
calls are now either correctly configured
(when McASP is SND_SOC_DAIFMT_BP_FC - pdir needs to be enabled)
or called with a bitmask of zero (when McASP is SND_SOC_DAIFMT_BC_FC - pdir
gets disabled).

On brief regarding McASP Clock and Frame sync configurations, refer to [0].

[0]:TRM Section 12.1.1.4.2 https://www.ti.com/lit/ug/sprujd4a/sprujd4a.pdf

Signed-off-by: Sen Wang <sen@ti.com>
---
v2:
	- Retained original order of operation in mcasp_stop_rx()

 sound/soc/ti/davinci-mcasp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index aa14fc1c8011..f9015b50e99d 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -235,8 +235,8 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp)) {
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
-		mcasp_set_clk_pdir(mcasp, true);
 	}
+	mcasp_set_clk_pdir(mcasp, true);
 
 	/* Activate serializer(s) */
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
@@ -311,10 +311,10 @@ static void mcasp_stop_rx(struct davinci_mcasp *mcasp)
 	 * In synchronous mode stop the TX clocks if no other stream is
 	 * running
 	 */
-	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams) {
+	if (!mcasp->streams)
 		mcasp_set_clk_pdir(mcasp, false);
+	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams)
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, 0);
-	}
 
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLR_REG, 0);
 	mcasp_set_reg(mcasp, DAVINCI_MCASP_RXSTAT_REG, 0xFFFFFFFF);
@@ -340,7 +340,7 @@ static void mcasp_stop_tx(struct davinci_mcasp *mcasp)
 	 */
 	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && mcasp->streams)
 		val =  TXHCLKRST | TXCLKRST | TXFSRST;
-	else
+	if (!mcasp->streams)
 		mcasp_set_clk_pdir(mcasp, false);
 
 
-- 
2.43.0

