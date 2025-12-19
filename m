Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F1135950;
	Fri, 19 Dec 2025 17:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165961; cv=fail; b=Rn50p7BikE4es5vdBAPjViAtipjpgBv/h65UUrlPXA+GCFSuEnhwbZj27WobdlzQs8VxV8dknQL70vlFF/m2cRl7njd3rO02KBxLFA4VxTb3UTM2irHqCfRUhv4iiYnWZv9OA3BqL8208jDFGHQb9RYZ3jnJPdXTs2y9jpQejDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165961; c=relaxed/simple;
	bh=iPCc4ZuTsTt5qaSD6cXLbmvrQ3ddRFzNxhE8M9WXHFY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WuTcpOhaWNV/68kpGE2cAXsayY02xn8HkKPovSqxoaamqu2ak3Elq/+Rv/R+di+zoJKkbAF7+J+ENzxsSII/J7dmacdj2ZDnr/KwLn/s+sSCa3QRxZRVn8T0iWQ7AQ+PEnPJivoNyfJ7YwSumFz2kSedHRNRUv1HhWcl/YFYX18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ASUeYv2r; arc=fail smtp.client-ip=40.107.209.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ASUeYv2r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeLQuXVgVH54adzg1ldbfDG3HeWzjp1fPKVQrDXYi+ETjm8f+JgBu6aoG/UH0yygAWNAdR5auoqR5Z0GGqKed7tQS7ERkw8n7/0sd6A+mxP4e/mFYhyf87lchQB0DMtfTIjTRmLVcEdLSzKzyJtrrIGiLj94j2V2c2mmx2rLrPJmYXcJ+Di5lam0DCvMXtK2GhFfrxEN6qvmWk8Evua1azEDb7uCKa2Egl7nrDEEIgkydOwNg2cypGO1Tsalp2jcyaM0t9PWW6Gh+hDXzU5YjmH1MUsmVgWzo3CYLNdS3wFVPILPq6Pv+UXpqZAvAtnLoahuZutmxV8uIUsfMo5MKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6/Rr7L92nhv3F9wk91MyhdoPVy77+p7VPxg2WmiRxE=;
 b=ZCFlw4QfT8IEEdlOaqSzUvRpnHMjLs2NXU2yAehibdEeyR2y6zGcDCk5VXhm3j1d27sc5Mb6suJwTZWtrvnfVvNtsEddDKScHCV4EsSRMDqLZJQ1AMN51d0kfcy4Fl7ZpNjoByLiT35JY4i8FLdp/qr2nBintQoBVaE/ir7iSXPVGnqfcGe3crSNnmikzaITM2wOwDOYZkZIjFZiBMW1YcetirqYHf9AU0KH5JoIr+UnErIA7kJfgpBaNCy+St7kDPIdEa1IdYknrRcWtUu4siRJMbwDrO+HmXzBKquU7nUblLxhagrFbQHSKJ7Mh2Q4aaZwXEe+W9t1GOGDDmMWZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=opensource.cirrus.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6/Rr7L92nhv3F9wk91MyhdoPVy77+p7VPxg2WmiRxE=;
 b=ASUeYv2rFb8Cg61zQrMwPwfQEz4n+zz31vm+akuesIxaA1zIQVK10w3LWME1/Gn1nuzJAgx1fZY7iSCC7LvK2FN7nZHNrxFqQorDNyoU9sJU8x7d79MmS6FncLthhl6JY+CfEYaDZVGCuLfo9RChPKsw15UoqMULX6d9RpwuZ3k=
Received: from SA1P222CA0047.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::20)
 by CH3PR10MB7931.namprd10.prod.outlook.com (2603:10b6:610:1cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 17:39:11 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::31) by SA1P222CA0047.outlook.office365.com
 (2603:10b6:806:2d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 17:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 17:39:10 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 11:39:08 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 19 Dec
 2025 11:39:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Dec 2025 11:39:08 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.134.85])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BJHd3qo1214374;
	Fri, 19 Dec 2025 11:39:03 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yung-chuan.liao@linux.intel.com>
CC: <pierre-louis.bossart@linux.dev>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <shumingf@realtek.com>,
	<lgirdwood@gmail.com>, <ranjani.sridharan@linux.intel.com>,
	<cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <vkoul@kernel.org>, <shenghao-ding@ti.com>,
	<baojun.xu@ti.com>, <sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH v1] SoundWire: Allow Prepare command for Simplified_CP_SM
Date: Fri, 19 Dec 2025 23:08:30 +0530
Message-ID: <20251219173830.407-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|CH3PR10MB7931:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9db618-7910-4609-c156-08de3f258487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bWclPelmXyyoFxi6bKFRbfK/oQjc22I+j3N80Ke2qTOFR/3jo2POjH7sHCUN?=
 =?us-ascii?Q?lW2l1GbdNj2Kr3xuOh0lqNoaOjaHuD+zMzwpAbI8wtgPv2zYGSlaQJyI7wPL?=
 =?us-ascii?Q?xP6ET6+lYQ6W0RcD31d658XiFZP+UDWGsoEO0f89EvecvE/+LlBueptUsYfl?=
 =?us-ascii?Q?1n85bDNOuadI7XpPreFFN8XTLeQovVc4X+UG45vQXDUn/OzwqP2GdOCvizDz?=
 =?us-ascii?Q?6hTH80YcPpRk99bQkFLctD10VTDG9TJbkVILm+jbGdQnRiiwL0BDdlqXonrm?=
 =?us-ascii?Q?Kw2BCiu3rBXa8e1TFxxVAXHeE00wbRKABhR2l91zQHwLsmSsqhnIsWgk1esH?=
 =?us-ascii?Q?E44nrKfAUNPpGPhrEEiXWRbTX13iWiuYBG4pIOBer358EryQ/Kws+ov5roSJ?=
 =?us-ascii?Q?KzpKZOVjq2EYMD7g4VlW5KmTszRM4yYu03h60UfHE/O14r+LWqs9hGgfWQvQ?=
 =?us-ascii?Q?ORmwpvfaL3H0YMuD/Bk4hW9NDWko+XlILpMrzVDctE8Mc8OauE/Zn+iEFonh?=
 =?us-ascii?Q?11D4voTjZ7I8t1kzhj6sF6U7ugnElFQ/lmYNRj8zt5CMo1BRQ10h4zP2kg/c?=
 =?us-ascii?Q?dqzpotX/N9hUD3f5VfUjIrRMmuxmzHY53GxwQEptfdhDGNBb/4Rbh7vPr0lr?=
 =?us-ascii?Q?Lmjnsv1o4eqqvUGRwHgnv5zRvZ2BWVtQDwt5eBvPaaIkFY4GaTBAQCb/cA6l?=
 =?us-ascii?Q?BkxUSiKL2s1L3CaHIhrLjt31SeJsy0AaFz5k54Ac8nwkuc0acoii89m2d940?=
 =?us-ascii?Q?1m9pzGapRAX47tx/cQSdHVmE1z7Nyof6PtVJUaD9b4gLLf6/B31Cy2VfhIeM?=
 =?us-ascii?Q?GqILwcRESLnxZDsr8Av8lxiCG5j43HqTMD/gK1LB4vpTlvEHqJHEknr9U1hL?=
 =?us-ascii?Q?FnNAb4V6oWzlSHajaeltqkhix4PQa2wV9YkFywu77ushM6dHaRByBTb2zSoa?=
 =?us-ascii?Q?04bgYKfoobiYCrGsN2eiO9shjItF3fGxoBy5HBhsIgt+R9B+jt5mjbGN7Plz?=
 =?us-ascii?Q?yA22uAwkHe/ZbP7qPlxi3unJK5GL73OcCFC4NBBJ9MIYFEjgypj8EeayTeOB?=
 =?us-ascii?Q?+sQ8hhk3bt1RQielTr+HY+fVRLdb1svZbCvPUQWKw5pRYCX4M5c/axFSxmcd?=
 =?us-ascii?Q?65VBgTdOhSorahg51VDkiTaJzgMBGbrslHir9MoLvrvYr3a7XX+PGf78/FOT?=
 =?us-ascii?Q?G9fp5qBRfPQT0fU3yK/U8dpbsvPqkq78jlymyL4SZuWVIZsTB4Pwq1AfZD6Q?=
 =?us-ascii?Q?ybkxvPrByhM4AzojImuAaKA3Fmkcv+W1NOYkClM4TuuYEYhrCFU1h7l4hTjk?=
 =?us-ascii?Q?lsmfx93mjJOv8XU9XKIeVhhu96rKZXeYrc3MZdAF5rnroRacjZGSyIJrvUCZ?=
 =?us-ascii?Q?CecJYTXcc8MfI4QOGogSlGHNQsiOnz3IdveQPW7dEyD5vSXv/dMhZIas1zy1?=
 =?us-ascii?Q?1MemTiXnp+eh4D++itSP6V8SPUlf3Yzu9CjqAghJnvF6ntZVezZG+9uAd4nD?=
 =?us-ascii?Q?1HTO1B559zfSaYbC4af8YpZDAHxTvAj/ZSeeIkbIz7VPbNF6dCJJsVaOIMeL?=
 =?us-ascii?Q?cxhitym7n+X2mHmG0Hk=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 17:39:10.2600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9db618-7910-4609-c156-08de3f258487
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7931

As defined in the MIPI SoundWire specification v1-2 for
Simplified Channel Prepare State Machine (Simplified_CP_SM):

* Figure 141 for the Simplified_CP_SM in the specification
  shows the "Ready" state (NF=0, P=1) that can be reached via
  "Prepare0 OR Prepare1" transitions.
* Table 115 (Stimulus to the Channel Prepare State Machine)
  indicates that Prepare0 and Prepare1 are read-only/"write-ignored"
  bits for Simplified_CP_SM.

In TI device implementations, we've found that some devices with
Simplified_CP_SM still benefit from receiving the Prepare command.

This patch modifies the code to:
1. Send the Prepare command to all devices, including those with
   Simplified_CP_SM
2. Ignore errors returned by devices with Simplified_CP_SM that
   might not support this command

This approach maintains compatibility with all devices while ensuring
proper functionality of dataport operations for devices that can
make use of the Prepare command despite using Simplified_CP_SM.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Shuming Fan <shumingf@realtek.com>
---
 drivers/soundwire/stream.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 38c9dbd35..33605dc83 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -504,14 +504,19 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_PRE_PREP : SDW_OPS_PORT_PRE_DEPREP);
 
 	/* Prepare Slave port implementing CP_SM */
-	if (!simple_ch_prep_sm) {
-		addr = SDW_DPN_PREPARECTRL(p_rt->num);
-
-		if (prep)
-			ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
-		else
-			ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
+	/* For Simplified_CP_SM, MIPI SoundWire specification v1-2 indicates
+	 * Prepare bits are "write-ignored" - this means devices may ignore the command.
+	 * Some devices still benefit from receiving this command even when using
+	 * Simplified_CP_SM, so we send it to all devices and ignore errors from those
+	 * that don't support it.
+	 */
+	addr = SDW_DPN_PREPARECTRL(p_rt->num);
+	if (prep)
+		ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
+	else
+		ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
 
+	if (!simple_ch_prep_sm) {
 		if (ret < 0) {
 			dev_err(&s_rt->slave->dev,
 				"Slave prep_ctrl reg write failed\n");
@@ -530,6 +535,11 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
 			return ret;
 		}
+	} else {
+		/* Some device return error for the prepare command,
+		 * ignore the error for Simplified CP_SM
+		 */
+		ret = 0;
 	}
 
 	/* Inform slaves about ports prepared */
-- 
2.43.0

