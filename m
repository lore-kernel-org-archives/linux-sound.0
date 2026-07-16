Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012031.outbound.protection.outlook.com [40.107.75.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3F4423775;
	Thu, 16 Jul 2026 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784209037; cv=fail; b=QwQVnn8nE96CPCb1oWo7NjGmQpQ1aSSf9G/Qn1/JP20NbnbDnnK/YF1fpt8PiRtQF3oXDRmLjIcHc+3ge2M/kNEmnuYBPlE1Smzu1RiED7Hc5pKGa419Q4tyWFZuUnnCN3B5DtkO2Pz+tt/IbtXtuxJEYNMhW7mlvduap7R2IiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784209037; c=relaxed/simple;
	bh=gvhnny3BxgNVCe+OiJMJS28ZExCCRGXy4jzGXfwrDCc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jZfCx/Zk6zIwaPjEvwPzldwweWiU6c84XRq+nX6U1uzSD22SO40tGpWAlgyVivYaUUt/P8CbZw8ZJ2AEthci/G9IKSfSmtd7NCiu3+qENKlqNhO0ZvDOXHQHJHE8WyMzvpyHcBd5Nqvtb2ZRAEcIXTgdRIDnuF+6gdm1r5WMALs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=e7+sAaZ+; arc=fail smtp.client-ip=40.107.75.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="e7+sAaZ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1XPBQ6ThhqGTu1lLqugxQyfYTPsOHBfGZUmBiUMFyxbBcOWdEAECOdULc/X+FVFfR70zRynworEJhy8C3vx4IK925UG+eRfBtImvIeG37y3yLc0YPobdctcfYymxBvifSh6X4KT+4DGAB9zBcRwM5++3A39dbo+bIzLm8wpmfB2AfrvhF39H9USXuo5fSUEMw95V3JWMYxfDGUXo0W+5YGgjgRHcAzP+VRMIUdFeXNQdGYeYSg0lWu/QQ/+MOFqH3JYw5v8kJnShhYpCo5v/xnkMYwLzOhf3N7sa4rDgVcLI8t3vGmiVFKFlUTJHc7BYQolXZ5ebJJjrwlH1iwc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfKh5K3CHYV099CGQMVRw1xfNORcEHFncQbm7fmpVKM=;
 b=WTJ63dWNru3Y3K913l1Nutsk3Hhg+xF7Gq448155cIDJhi+EN+yMjuA71xqDx15HiXzLwCUbtDrvuhu5CvI7rwXMIkJK3LglNmOF3SyyHm0O1fmf4SzDzyECNWNVfTrNshX8dTxOnMYGSzWwgKEoQMPXrs2qSTsIHM/gBNk0jjcF/bOd/qttfwQv8I+njqNQ5l7tpF6pLfov1IvDG0O3EgkiCtFNGEZGVPhrlX6zB9kEAwRtwDsQ0vrAo5dB3FApISzLuf7yzwvFmBtrEFz4n4ZNpRvTOTYFZvDR3GfKb8AXWFqaWRVCegUc9NtR/ur1GiEwvW1h5ifCdNWAlb/YvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfKh5K3CHYV099CGQMVRw1xfNORcEHFncQbm7fmpVKM=;
 b=e7+sAaZ+UhFmp7xBiXroAZUIzVmvpaBSvNGEeAKgW84RNXVIqXtgGmCpBKZh1gh9klnRV76Shmus/xqhrG83i8gFeG4Efxw1lEzA/C90rshTIgl/djawFhJ55LwgGmgFpDMwlt2DPGpgV2EH5crV/5TVZ/aelqworPQR3Jz5zvyDjLbgNMKlOge6PpZc1etU1XgI/bCDBAk+TxKIQFkuk3Ryq/79BpR9DnbGyupgOqOcopt8BQnT/tvgGqKbx6bIs6gtR+jecc+hcyz/JyeRiTlY6rn3Zh+Q2olfWkUjFmJxbrjJL3IR0/WCwyFXw3dihXmo0vQGXBLQwWef4L2oXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB5648.apcprd06.prod.outlook.com (2603:1096:101:c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 13:37:11 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:37:10 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] soundwire: qcom: Remove redundant dev_err()
Date: Thu, 16 Jul 2026 21:36:58 +0800
Message-Id: <20260716133659.7600-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::12) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: 582b1717-9098-4d7e-0d29-08dee33f5683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|11063799006|56012099006|6133799003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	EMlKssAQ0g+3K5uJNCSin+7upFte7ik1Eo2OMBkbUfsd75p5SHf3PL5DjRhqugy6ub6H0iNpuVNS1blk839mYt9zprFH2Jekbg1Gp74gkNpLwezB1P/W8VoEigDszhou8dta0Sg0rusdMNPf69Qg3cDjVdoDH3GldHS6ELeAtPhL399BExX27AwjMXRdFRv5fRHWTDZHFXNOKwtPmRgV6PIPyn9G3ocKSrAZ+Qhe7oiQMk0CUzhPVMiZ3clT5vUdmaka9gx9mzKSH1OgmdM0Sn83EfZgW+7yfjjR+gM0QNATJh4PmdnUt7rwoTd2PIGm3HTkCKXBzinQLP9JqMMK/ncGGa7MB7h2KyY7pgEreKxEO9/MpCeNZ+z7Ju8R+p1fltDR6DDrk8kK0/RK2hUrtrlWNPMBOMlG1PyQiDH3UwFtRUTfNsFcBvOhR3tZxaN71BdS4xzkC0AGcZIel/FjP0cx51Xa4911udQ52lImvsHkKhTUDNsLM7npe5YRek7QpaZLgJlkuWh2vOkOFACwGOYLEcdaiDwxVfCMs9b/gwwX3g3TjLlM2c+dRI7T5aNIjiFYk+f7Y6fKoYwtc8sq28ey9pP/miE6K91ntzbp/3a2sERylEsOZNod/zvwN03GHPPyBEWTnacpF3A78YChKh8Ba4uy/GAkdn1iAlLn5XTxdBr+HZOu1ihV9UHo9paBKCCel1MICj5J+xfVYesq+inGwhZayYJuymwg8sHnwzU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IfZ6SmkF6t8uF1Ccbzf3GGVJpgNErKFCRRe4f2i2Lxj0YjdltE2dihiMZRes?=
 =?us-ascii?Q?bJrWzq98wiriT9OD4Nsu+UtvVlfh/GgleopL6PEv6EhQnwtsghukdmxnboC3?=
 =?us-ascii?Q?MhHXLH9bM/uIESXs+s9FJRNwDiLBht0WJlgRjowe01bvfpEwZgfVYyQ9kl68?=
 =?us-ascii?Q?URpDZwmbrFJhCc6WXs6p+Xim8VWMB9gRS4kAbLEPlyhQkjz1bjVM9IQQZHKf?=
 =?us-ascii?Q?YGItYbo6u+3dmuwLRee7u2RyZwvcSZKJEreenmaoKY9kI42x+sla/uX1lk4j?=
 =?us-ascii?Q?CuxXpow4i1LH6/5KEpHLMoMCC2zRjR2JWVcHdw+5KltJ4t9o6E2L+MVDvpMz?=
 =?us-ascii?Q?d0F9PMAsOFZuI6S+zMkExmtRotb/qKqCqKcMD5mC2QMFT3ea0xjuEEY8KJQe?=
 =?us-ascii?Q?Zk+FiETv1PMJ6vFj+RK47nBPep3YU1TdRYaaqtNXd3yM9FrVKUyqE/8Q6WUs?=
 =?us-ascii?Q?JKlnAkf+QCBujK4NuTdqeXxgI768Tuk0duEkZNitFC97p2aa7vbUf+z6r0Ch?=
 =?us-ascii?Q?8n3B9YuDP35qc2ozUNcno1YK1TJsYu3lek4vdTwQYP33KNhta5kDvSRH17o1?=
 =?us-ascii?Q?zh+bbDI6oVwu7jM5Weqi++8ckrfnXGrQlmH8anzT/f8kiWXiBgDtm2HJYmxm?=
 =?us-ascii?Q?HqNfmxIhmMSIzn05Qx3PQVspJbP1wgPwJgjaQX7yzzN8j7G+oYogua00HzWO?=
 =?us-ascii?Q?WxpBECO4CsR0t/VbsMb26yIWTC6qkFF6OSt8xzEJ7WZkmuZ8hDSx4yNjU2SZ?=
 =?us-ascii?Q?jhCGzYIgVQL671vawOLnGo0kH7eOg3SgkHPRTay+1wotZWUsoS1S7DAgZlK7?=
 =?us-ascii?Q?7yS9cc6W9wR08J8bCYCvbsxNZmyzsyLUDQdgoZYP71Td1PGAtNTJy0IqgSy5?=
 =?us-ascii?Q?IexoyeazQPhSalZw2olZegTOEsDuLLSR6wmL8fL7BjoLlY+R0WGF/Pz57lJH?=
 =?us-ascii?Q?mSWgww+YhBzRv7tMWtwGQ0zah8AfJQbVGsd21PsMxG7oL/D3nqY10WtHTbfw?=
 =?us-ascii?Q?NQ4cxCmmC6T5D3Z7j1E61B1/nlnahAz2LbqG+GUaMuboPZKTSGMEIdRw5nfO?=
 =?us-ascii?Q?P/5m1MhllxXAdzAxWgfOVq/LiWD3FrftpZ9fBEwC7t+oKvkJndbhHnd76H8y?=
 =?us-ascii?Q?LYvX6zg2nK3OMcqn+/qILPAanjNdXr6ltGQYiVzy/rPgP6yeyRGOh2KoYKCW?=
 =?us-ascii?Q?NNmhFmnq0Uk2uf6l2EQbxUUCbvtUSsuBAQgS7/US+3t0f2R/bwkd9JEdjsxH?=
 =?us-ascii?Q?pnUjXZlLC5ydgXSXQrIdsXdV7R1voVEyGg4ydj3Llj1nsF3v4c9nevtlSV5Z?=
 =?us-ascii?Q?gTgfQKcFlmtKSz4Ps0wUYAfXS1zxPR9KFXvY4j45EYx8gpX+4j3wAKQc7Zd/?=
 =?us-ascii?Q?PEpmb//eQooR4szGzQFNu/nSkPeoFetArbqhjcynlilrQpiPiEAkcVq3wx5V?=
 =?us-ascii?Q?QUZwWnuOtpd00uwD53HBKZ7/ng+ISBxwHvYvoAteFDYpOyl07JQhf4gpmGbS?=
 =?us-ascii?Q?QUAtoDnj8dJ8KCOxCDznmXOeNWdSaq3kEcR+8BAQDNvokDkJahfbViZyc0GW?=
 =?us-ascii?Q?VAKWvjclWRSRncyNrzfgtuFs/mv5GU3OfWZ7CfwZDmp1uRLW4ukuWXv2eROo?=
 =?us-ascii?Q?+06JS6QeeepnqYDfLXmrDoAAQooktur0yw8sOTN+1teRSy9Yh+ivasrPhgZb?=
 =?us-ascii?Q?Jho6Sgwqy6wr4rv00rLaNbbAGmH/9Pm07EROlA7+Y5Blw+zmPgwBoyvIS2Hj?=
 =?us-ascii?Q?zb0estwdrA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582b1717-9098-4d7e-0d29-08dee33f5683
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:37:10.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2e1uGsPfnc+nSw2Y4znytG73W3IKyZ3ybm59G0WlAZEGLDobuTrJsKlrtW4PTZ8LPN79955TV+jFWDgb00z+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5648

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soundwire/qcom.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3562802f4204..934b4053b1e3 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1646,10 +1646,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 					IRQF_TRIGGER_RISING |
 					IRQF_ONESHOT,
 					"soundwire", ctrl);
-	if (ret) {
-		dev_err(dev, "Failed to request soundwire irq\n");
+	if (ret)
 		goto err_clk;
-	}
 
 	ctrl->wake_irq = of_irq_get(dev->of_node, 1);
 	if (ctrl->wake_irq > 0) {
@@ -1657,10 +1655,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 						qcom_swrm_wake_irq_handler,
 						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 						"swr_wake_irq", ctrl);
-		if (ret) {
-			dev_err(dev, "Failed to request soundwire wake irq\n");
+		if (ret)
 			goto err_init;
-		}
 	}
 
 	ctrl->bus.controller_id = -1;
-- 
2.34.1

