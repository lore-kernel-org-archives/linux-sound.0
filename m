Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4681E9B3F;
	Tue,  3 Feb 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079152; cv=fail; b=XaKDITXnVIT+34vVoESn8cQjoyhnLRD7jMnoVWuJjet3P+FBCMBq9qZRfUuFTo687F+k3vxwdxyDK9EZCVt46N/zerPslOvigBfHrjvWs2PWrpU6YR1t2sSpN/vSAP7kOKQFVq2p2CMsc5XM4DbPLKur6ILwpourJj3lptd0Eg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079152; c=relaxed/simple;
	bh=TcZcuzLvfL1HFYWZfx44YyzPx/DmbZbNj2sotARGkQw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJHcCgP6kEIfPz+7iamJaGRd5pp9yy/H17erU4KQN4JfWpZNcItjCODwzl4J2q9+wld2uOpJppMI0RJXrn7L1quRAcTQns3+PRKLQTEgDYE3Y275g4T7aGHVP77y/5KJhWRsuwuPviTdW6BFTpx2G1BfeTFCW0fc4OSwoGd//4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pZ4TlfFz; arc=fail smtp.client-ip=52.101.61.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pZ4TlfFz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbH77j7IyNqiRIHn3M5VYZdZTxCD8v1QGmtciZJeeXHJTj8gGymcpqZhENUpkgkw2BA83a0Hu80/u0NIHYSwKLFrDytGIcaegzrSawYAcq5yKAdZ0vRxVZSIY0NuACyLGCc9sLBj2zg00dB0Jq9x90CxTb1KIN0t3P7bdwIouy3MYW9zY1i9hXWfH/lqSOmCtF+6iYkCRmqPwTFCluCNBMemOWFlfG20/xEbDKb7AnY0PcDvSJSbjg6/35fdannM8OcLD8hMu9F0FFAyhxtwdre/psP/D9MVG4Mk7xs0oMM7PieJ6m6OxhDdBx7uqFU+o/7BdmbcMXlCVA0N4tBa9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/utXmdmqyQNsAdNXvotPEPA/dPXE5q7X7dktrmKmGog=;
 b=f8ht1B2muslwhd/4E5YZGCjt1mYn/WfMvM8Zg2gshNFMR8QjEcCdGAW6LcI2MdIl16hBElEz/URKlNkLJIZEYounqER6ehq+YRBl5Qz5CEqtsQG1hc65YaFUi6Ne/W4BTW8n1mWn1tkRPMvd7KSVDAdRIsJKr/DLmC8BP7EXM9JsotJ/F8Od4zjWBQFmNqnRLX2Qu6DQ7DgU8gZP+4q3xTWM3HacSjbJ5yVX/x7l00LrXAQpgPwKQ0ulboC/6+Kx1XMw54lZ2iDAcP+vwGMJkTkMcqV4m0wHTn+5yOudEUZgwSfFkdf400WJdhXXqmGQFx+JHgT69dpqwiVhLqT4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/utXmdmqyQNsAdNXvotPEPA/dPXE5q7X7dktrmKmGog=;
 b=pZ4TlfFzp2k0endYxm5FFj8Nfw47aOOZ/CEDhputWhKsEauR+KBJ4ZeL9upYYYjpL47jeCz58t62lxxbZQ566aM8Mzl6dUKB92GzhGBxHlANZ2iPCFbIBC5IbyzGpbKosC5UtPrBBOglAsR6n3/6biMh7rplkE/6NN54cX6TCX8=
Received: from PH8P220CA0057.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:2d9::17)
 by LV8PR10MB7725.namprd10.prod.outlook.com (2603:10b6:408:1e6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 00:39:08 +0000
Received: from SN1PEPF0002BA4B.namprd03.prod.outlook.com
 (2603:10b6:510:2d9:cafe::37) by PH8P220CA0057.outlook.office365.com
 (2603:10b6:510:2d9::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
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
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 00:39:06 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:05 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 18:39:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 18:39:05 -0600
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6130d5GV2625678;
	Mon, 2 Feb 2026 18:39:05 -0600
From: Sen Wang <sen@ti.com>
To: <peter.ujfalusi@gmail.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sen Wang <sen@ti.com>
Subject: [PATCH v2 2/4] ASoC: ti: davinci-mcasp: Disambiguate mcasp_is_synchronous function
Date: Mon, 2 Feb 2026 18:37:01 -0600
Message-ID: <20260203003703.2334443-3-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4B:EE_|LV8PR10MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 674f2aa5-7370-477f-0d0f-08de62bca325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1/SyPz4ZhF3cvDVnEzXHNPmJbWXMdXWwpQcLMMFvHG32ykL6POtQe8+o9J8u?=
 =?us-ascii?Q?H5WRJVcKyS83vY3SswGecP+pIvCWJPTo6r8IfrIw0ObIoDGlcUY9cEDWewp9?=
 =?us-ascii?Q?SuGHf9dsdJmQYdS+3lyZoN0DF01EQggFcNvhgweEGAC9VZ20qWoscCCreGuj?=
 =?us-ascii?Q?0JMyWqTs2mR3oNofE4D5fYcUq0ZxgQj58Uvz09av0IBsNf2iMASFIZrMQECD?=
 =?us-ascii?Q?2iYR5DSruUi1I8HqM6r2Tq5xa8NaGcSXe3gdH+YNpVB2CC4foKc0RIEsQvEV?=
 =?us-ascii?Q?P8O8yGCtMzlN9RT31RbeuuJaDI53WHBSMBRti9sjzfjO0KRhMkDIhRUAhQDa?=
 =?us-ascii?Q?M0fDRT3+aNeErbq0yEdi6x+fkCHtjZ05VnGph7Px4h67Y/WeHsHk1fZCVtq0?=
 =?us-ascii?Q?G5/zm8UTjwPBrDpJHF40P+MvVMOaThNKwFfWh6BkATgsMWVrAnm9QkHiri7R?=
 =?us-ascii?Q?YBYOmDxdkrlRBho6xC1WKcS1KJ4QUydZ9IslAyQnG0kmvjXhgrFAXNHXPDOv?=
 =?us-ascii?Q?hBQieMWHuK9VCajOdRRlb0YnceckriWqLutSSG4raLyH4MImV1hPJAWR9hRd?=
 =?us-ascii?Q?v3AZfvguL1pxdRF+nDfXw4YEOGU3cmNZPLcCQDZVEX9D5/QmWA0eeQMdwrEy?=
 =?us-ascii?Q?UfjlMp2C3uaYfzG8cXoTof5jwck3CM4Jf6j+JVseHYim+IKWeKz8SxbvZ3H8?=
 =?us-ascii?Q?2w9zNxhmhB8SEHdw8fgM7oPYlvnN8VTT0/5hENXEcbi1gRXnTBTVXJlaNv7w?=
 =?us-ascii?Q?LCSTYSjBaw6ErwyI/EL7JmqiEimri1M4PiApXeMTOnlK35Tq96itoud3nZnb?=
 =?us-ascii?Q?VJ9yRwYkC2rXAlxF71/o3z4PWCOJv9XJqytSFRqXlBAeZU52rxKBzxeE+R7u?=
 =?us-ascii?Q?4Ll+MkTbJyJoPRpaek080v28BfEZ46tOX0tuSQEZQmIg9nC53swgVwfC7SOI?=
 =?us-ascii?Q?BJRJNiVs3bKH4uemDLSWdWsG9iClucpyumNLGSMth1qe4BlioE1sUsS+kkB9?=
 =?us-ascii?Q?vjLTHPc+srtNDsVBUOQZy5TT7TlGxGr4igMg/q3BeOkTW1feJ2vM2MrFyY2f?=
 =?us-ascii?Q?8hayuM7WOKgVToDyeZUCoC0pGDwtxIJBFT2g8iACsHt9+yVOv4c1jDo6oGmi?=
 =?us-ascii?Q?WA9nujZqVM7KzCFaEKwmljdGCFzxh4Vtc2fLaAjhN21HnOWMczixL5pL9/f/?=
 =?us-ascii?Q?BQLmDyU4Yi2HsF91XgdJtb3+aaaNd9qnH0z7X7aVI6VGFBdar7ICX8i42TsR?=
 =?us-ascii?Q?n2J9o7UJpp9ztDFJuTHpzA8XjVrOikSet2qwTTKWxdRHDbX5yw1EELr3qEjV?=
 =?us-ascii?Q?h8j7WMffMw4DxbihFopFgXJIrahv2tc53PyJ5IQJortq+ghlfpHYxVo5TJMY?=
 =?us-ascii?Q?nGfpzW+hJj71YvbO3/m9dr+T9ennGEg1Ej1VF1CA+M9raTNXxNnpls0L29EB?=
 =?us-ascii?Q?GDrsneJ4y498WfZFldS4sHhmeddyv2FoMpwdO73+zGUw2PbLBjaafnOWL/yg?=
 =?us-ascii?Q?09gMqgTjlrYEcz0eMhBuyw9+8zXtvtoJO3n2326fYFs47+iCKbnfpSDxpenw?=
 =?us-ascii?Q?YdFQfN5K8yEacAsjq4IdsiyLBN9s2iHN+bj0NcsJoAavXFLUWdYrJeOxUSqB?=
 =?us-ascii?Q?kSBSMkGkSB1CekCFkiauDydcF9mj75cyLEM5PceRRZ6TDkJ47INI3pqLjJzj?=
 =?us-ascii?Q?STnnlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GlygIu5us6GFQGGXXmB/NwO+vmeLa3hcxNllDoNBNu3SIFn7Wn3zs+IYzQPjt7Rh5None8TvqB/tEggn1QXaceDXHVLMjeTsU3Q5GHqdKyDurn6DZ2lxuPvELhYP/Tff9Drr7CMc2yg2+wrhhgZ3joiA+lab1lHZifH0YaLZ3vXGvbFfiVyA1q41bsTNTNAFa9716MMWMOczoKB7R8AgPRI/3Q9Oh0Pmg/pB+gLmqeXJ2wpn1I7zZt5xbl8EjGy2csOJXbFmUqJemqhece3xma3t7LJzcHEStbC0woZMaEUpdyKiSYljdD+hRvCCJU2l0bFXyaO/v2h6Ks9QjLLULp7vhRpYC4y2X+mwubwkPA4IfZHoTocSbKDBmQWC1sVRDMKgF/tpN+gODi6kGg0YH5OIkofCOIPJ+AAV2E1hsUbSNH2eUiVWD9Q88K24ZyKQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 00:39:06.3034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674f2aa5-7370-477f-0d0f-08de62bca325
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7725

The current mcasp_is_synchronous() function does more than what it
proclaims, it also checks if McASP is a frame producer.

Therefore split the original function into two separate ones and
replace all occurrences with the new equivalent logic.

Signed-off-by: Sen Wang <sen@ti.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
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

