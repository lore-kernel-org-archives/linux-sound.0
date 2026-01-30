Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4645F33C18B;
	Fri, 30 Jan 2026 05:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769749857; cv=fail; b=Z1UXTRcPsS38VsvqjUQSvhWPP9PT7qoINgwdBZyMH6e3nXr+YJP3iHw5zrbA2ilfQ1zphBLl6vaRb0Mg0eQbCECMTfJa1n+msnKVW3Ki+xiQBIoJvQBNGs6s8etJDhmYq7QLFJRgWXaZoaC0GsDhDG3rrMyyubF1MGjh4/AdBkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769749857; c=relaxed/simple;
	bh=3xhf3p6KShdWxm8wLshve+NrLUH3RKfLSICMdKt0VHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjRPoJeoTn4tjPHXlRm4A3pZAdFbgM0OvkRSvKQBghJ/40IYfxmSsGvIqB5F4uzqpBpS91/SVCW3bCOffpmyJVL1nxXPOWBF0T0kaC+d5ZuLn05vZu+HIiuxwtxwC60hCIxcgiRyJAiqoLDrnuTGXQHozWX386VfAKTQuTa2+C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=M2MhzS3X; arc=fail smtp.client-ip=52.101.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="M2MhzS3X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbcvUqVLW4g+QCv/1Hnx7bgfMFafwtIYR9B7ZnNV5FF3LNMyqLN3N9lnbTVhjhDAV/oWeiTot7CkjnDwipqpsHb639FLknP2MkMNnYZtdBMaP5wOtS+AYecBkNSkYC6p23F3CB3Fmv5xiEjfyReN1lNAD/PncFkjcvw0CSKiZdJAKOCY87k3Xvxn6Jm4un7fRt7iQjIXiONtXUveTtfpQclrwtLKqXObiIb8o3gSd2e759vYBOlIL784VxI4sxkOYKx/a5MuFXdOm4VgOmd28JgjYuQoiAlqmmniUvs3oNjnJZVmdvEDCQW+7diVP/y9XvUkjpnOJ0ng5UVWRVXHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fx6AUV/eZi4qaJiMhrZVMKP1cKHaQGAATmLnnOELOz0=;
 b=rfm6wJgqs5wK5H3ETJSUoKTQLl3Y+s89JWS9HTGbo6mv71yZ20H1kOahzsB270vHYfXB7gkflkHVdtcw15k4rn9xpOAb8JlqDhe0qKU9t3IrmCZDuZj3mE/da+vcP/2eJ5aI1f5C4NUMNuvkIVh/aGtKQ4ulqQHGjvm/ENJEz8Jb97CMm3apGSBafUfJ8M6KXhNKfBkeeO6EHzFM5bLhawhqsPeHXUaBqylDiHJN/OgWiY8/xe8tZAcUJ2Hx+3Lbn3aPFQI8SQbRgBLx3WP9t1K5pyNQ8h28OT514w9MA0L5bhDx4jQdjYsIgBuyHMnAXAUPBG99vpSLAcVh87CWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx6AUV/eZi4qaJiMhrZVMKP1cKHaQGAATmLnnOELOz0=;
 b=M2MhzS3XXXYN3tj4/eIY9WkZ/BZGTMhsdEJzMUSw/VCy8H2Ps+SfMt3dhxIw/YVamahgT3k77zQBzlwyGM+cwmpxgmXm3S8jdbW6i5me7+GpqomQshDzX3o6g4+tNhUPRDXEo2xfk6bhm4DAyt3zyB5H2fDSQDXXulZr5v3G/ko=
Received: from SJ0PR13CA0238.namprd13.prod.outlook.com (2603:10b6:a03:2c1::33)
 by SN7PR10MB6497.namprd10.prod.outlook.com (2603:10b6:806:2a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 05:10:53 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::1a) by SJ0PR13CA0238.outlook.office365.com
 (2603:10b6:a03:2c1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.2 via Frontend Transport; Fri,
 30 Jan 2026 05:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 05:10:52 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 23:10:46 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 23:10:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 23:10:46 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U5AkRj748615;
	Thu, 29 Jan 2026 23:10:46 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH 2/4] ASoC: ti: davinci-mcasp: Disambiguate mcasp_is_synchronous function
Date: Thu, 29 Jan 2026 23:10:42 -0600
Message-ID: <20260130051045.1898892-3-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130051045.1898892-1-sen@ti.com>
References: <20260130051045.1898892-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|SN7PR10MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e65fd6-320c-43f3-6ae8-08de5fbdf080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3SpB3rUCqaQF89pAGuA6yWA7yf0oNI/aGhMiICuy2zlJbM/BSthjBmDshxuz?=
 =?us-ascii?Q?N3BRx8xxkp9p85Qx/D/F2UmhahYz9s43WnQdSwGZeEgPfYoX98qLajXlq1d7?=
 =?us-ascii?Q?+AVyAwIOqMA6NoWVXHYRrd2Bq59UHUGXn8E+wI8TXsVA+K6+JVv1lkbX/vPy?=
 =?us-ascii?Q?aQi7tP9WpLEx/32Z2XCtohGV3RXRDgYR4yzwOsWCT5O04AksTLqhIdjw4SIa?=
 =?us-ascii?Q?52Lzsnm/eoQDIkYZMd+b7qhLf3050wFQ9AzEymgFrNu7EDz8LtJ9b55C+6+h?=
 =?us-ascii?Q?eUWddkuNLl/B5ff89QyFUVxvd7wvysMzZ2vh95QT5kZad0TCCPETZz4qpWan?=
 =?us-ascii?Q?onZ9jxe2ydqi1Odv0Pz+xZACiuD8Yq0DB64pn6Um879pMoy+UWmyGbQZHXxa?=
 =?us-ascii?Q?dDz8IlpbXzoyjsfoVMETaeJNIR++uzguBMLNLebABgZ6lV/fdadVBKLN6LuQ?=
 =?us-ascii?Q?BvIHfkxxnUUO8IMkQvygmdF1iSlH5cRj6g7+1vjGEW6hMMjd40OnP+SgEu1l?=
 =?us-ascii?Q?41GZ63/L6//hqyjAd7fDOfZEH52KqV6zK6+mz9G5bnIhKYW/3J4ENZJ6yFH7?=
 =?us-ascii?Q?uVxWu/Phdf+f4FH/5Xmk+Hc4Vgnbj8zDUW91TFpmZWYtrDFA2j2YKyQVlucB?=
 =?us-ascii?Q?IiHxPQ0FoqeYckFgabb3GPCuCzOUP4tdILUKVA7aRUJzzy79wBc8pGkQ4Rqp?=
 =?us-ascii?Q?z5TnDj/N2b74Tim34CfCFEvcq6FYWx/0cT3uE72RIXpGA6zeo/k9Ui+Zk5RL?=
 =?us-ascii?Q?qiFzkbSltWWeka1VBcBOfmuj46wqPhxmekXmF8CNAlr073OqZEQ6BsO1Fcu9?=
 =?us-ascii?Q?Lcp1LwaRVfDkTKmnyT9I1FEUzP2sRsZkS0VcU3AOf10J4j8xP58DsCygLwje?=
 =?us-ascii?Q?YwnjGdWrzfZo/Xdsw4XKWz4iiTDXiv88UUEGbm5kFnzccTFOVF5ehZOKp4yJ?=
 =?us-ascii?Q?YmXVNaxWBJaNku6uDKrBygRZJTK1gEhqGEH3q9ek6qQMtLY96KOvDg5m47cL?=
 =?us-ascii?Q?/Kv0WsMACd9fr9jg/7eNPfoL3A5HigrbYDSIOesfsRNIpXH81SWO+fbFcgdG?=
 =?us-ascii?Q?9Yc3b1uursm2H5qJR71rzwWP+uWn25AuS+q5PcNDlvohnHf8Z/X2HQ+62GAT?=
 =?us-ascii?Q?TrvFsWHl0O3IBVat8MkDjziGHqmdhPcAK7AGn3PTQ1xwwg2CUYSPF/HbtVLj?=
 =?us-ascii?Q?/CI1HHTZL7Wn4wx7RiJWpUZTk861Diw7kur8WaoLthHz9/vs3UjDKS2RRhVG?=
 =?us-ascii?Q?rqK3C9jF2Ym/RKdcqqzaBpq9uawWoNwX/6ofVRixqFFRQR/qd+PF5bw6EZuU?=
 =?us-ascii?Q?pcb08UcY5ybdF4oh1dr6poqoTlDVTf59CzVTi6Xtmq9nOxIH7Jz8OwRPOUDp?=
 =?us-ascii?Q?lZtSJpB3c/sjeVq5NMumOHYMvJPdQ0cXSZFuVI3tVfqziTmNYI7QbsAEYfEc?=
 =?us-ascii?Q?EKjbVdTR+UxZOMy8WJbYRHnDQPfFJ/0SncyqasevkOWoNXIILE01lhQkB2g4?=
 =?us-ascii?Q?sc33UvSufU5YtvsCj15kQy6BF25WxIuM8Gih1B4j+62ygc0gBCjPQGZ9BoCD?=
 =?us-ascii?Q?0ZnJLolMQMbMyNcBIB7h4E2zE1ZrhqOT9km/sN/AK5XNomygbUvBhR8TQ4jU?=
 =?us-ascii?Q?f8nASerbNk22reM/LZ+cKv3ZcxqPxr1vaqfOZti+EgF9i1MEe7OOGEDEke0I?=
 =?us-ascii?Q?fOy/CQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IpfXV2DjQ2qWAwVrHX51uvY1OIoJJNtFbsrJrEaXv/08t+/fvRX5k7q1ojZ1neNFI6XkFVt2+sr9L74uwBuFk5V6j+35mkmG7eS9J+3gvJK/MXF1kCVDzctet/PXuzMv7kYIaEMieAYqtkhl5ZSc4q81GV4mY5tnoldKxTRdEZXRy17LWLl7jN2wKhMRUZxT2jTS9VepjZuqvpCA0lhQ0vSswG9YK9RA1GL/gS7eBSxARr0fhqlI6lDY/Qfahet28A6VTGJ+rZm9jM+MlhR3OKZyuxFXZJvkF7njfCaPZ9yY2LABACiWtCa31IXeHtH7XnFt/0U0KZu9L4kdoFnYtNnvnX6CKM78lNukuiejpRB4/iXbvbcUbHvm1rRZYEyBfImcoBLciAKW0sZWxxIEAYlsnxqpX9CohJzhlNXCGh8I6oeqk4taYBfmA0n3uLgD
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 05:10:52.0286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e65fd6-320c-43f3-6ae8-08de5fbdf080
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6497

The current mcasp_is_synchronous() function does more than what it
proclaims, it also checks if McASP is a frame producer.

Therefore split the original function into two separate ones and
replace all occurrences with the new equivalent logic. So the functions
can be re-used when checking async/sync status in light of async mode
enhancements.

Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 621a9d5f9377..aa14fc1c8011 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -179,10 +179,16 @@ static void mcasp_set_ctl_reg(struct davinci_mcasp *mcasp, u32 ctl_reg, u32 val)
 
 static bool mcasp_is_synchronous(struct davinci_mcasp *mcasp)
 {
-	u32 rxfmctl = mcasp_get_reg(mcasp, DAVINCI_MCASP_RXFMCTL_REG);
 	u32 aclkxctl = mcasp_get_reg(mcasp, DAVINCI_MCASP_ACLKXCTL_REG);
 
-	return !(aclkxctl & TX_ASYNC) && rxfmctl & AFSRE;
+	return !(aclkxctl & TX_ASYNC);
+}
+
+static bool mcasp_is_frame_producer(struct davinci_mcasp *mcasp)
+{
+	u32 rxfmctl = mcasp_get_reg(mcasp, DAVINCI_MCASP_RXFMCTL_REG);
+
+	return rxfmctl & AFSRE;
 }
 
 static inline void mcasp_set_clk_pdir(struct davinci_mcasp *mcasp, bool enable)
@@ -226,7 +232,7 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 	 * synchronously from the transmit clock and frame sync. We need to make
 	 * sure that the TX signlas are enabled when starting reception.
 	 */
-	if (mcasp_is_synchronous(mcasp)) {
+	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp)) {
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
 		mcasp_set_clk_pdir(mcasp, true);
@@ -239,7 +245,7 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 	mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLR_REG, RXSMRST);
 	/* Release Frame Sync generator */
 	mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLR_REG, RXFSRST);
-	if (mcasp_is_synchronous(mcasp))
+	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp))
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXFSRST);
 
 	/* enable receive IRQs */
@@ -305,7 +311,7 @@ static void mcasp_stop_rx(struct davinci_mcasp *mcasp)
 	 * In synchronous mode stop the TX clocks if no other stream is
 	 * running
 	 */
-	if (mcasp_is_synchronous(mcasp) && !mcasp->streams) {
+	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && !mcasp->streams) {
 		mcasp_set_clk_pdir(mcasp, false);
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, 0);
 	}
@@ -332,7 +338,7 @@ static void mcasp_stop_tx(struct davinci_mcasp *mcasp)
 	 * In synchronous mode keep TX clocks running if the capture stream is
 	 * still running.
 	 */
-	if (mcasp_is_synchronous(mcasp) && mcasp->streams)
+	if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) && mcasp->streams)
 		val =  TXHCLKRST | TXCLKRST | TXFSRST;
 	else
 		mcasp_set_clk_pdir(mcasp, false);
@@ -1041,7 +1047,8 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 		 * not running already we need to configure the TX slots in
 		 * order to have correct FSX on the bus
 		 */
-		if (mcasp_is_synchronous(mcasp) && !mcasp->channels)
+		if (mcasp_is_frame_producer(mcasp) && mcasp_is_synchronous(mcasp) &&
+		    !mcasp->channels)
 			mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG,
 				       FSXMOD(total_slots), FSXMOD(0x1FF));
 	}
-- 
2.43.0

