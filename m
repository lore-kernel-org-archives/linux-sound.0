Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D13090D7
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 05:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775454715; cv=fail; b=m+WL9oIL3yg/nd9tuampnclz9rMRLz69uMBZPrKHHP/OLa95xdL7r/Wovci6QOXYlueheM9kl4h8xlF8xt/s7Z90njVsc8jebnEhgQFp0kjf62W2UO226qjQ5ZjmZkVKmBbR4HZsdno7ry/B0q4WwFwn+opH9C4KatiwMmqUAbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775454715; c=relaxed/simple;
	bh=CTvjMRRc2gR4tgMFOBM4PcmMCjQezcvu/88lu7PlPFs=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=QNlrBQQ0RDqaaY67gwSZoJvtDRBAXO+I6d8rt5ISJdltXnOsGIuHKgMLzcQH9UOdxxM9gkY4NAt/jbW/vGrTI6/sgFLQTI8FNaoxmW/9aaGLnxzU44qVKA8v+JOXnSo0pyInQE2nfbEf36uZvLciDgGccphw01tm62X03f3rT5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GGNODYmm; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GGNODYmm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzHjHIOtHUqarIoqdsf2lD7nt65mGpBUqWbcOa9xtrfZBaEchiMTDlUX5dckkgUneCAIUlXPC4haW1BCkF9R6J3UUDDdmL0vhe7p6/qb+k+zsqWpingRatfGU5yff2YPAsSBMrE/0onOsmKUODgolPO7HnpL1KLCgkZRl6ineLUAL1h2kO/uR6HvDhpdYuVgVC1So1CK0fRYpVp4dUwkL4qvZPoy9jv7CQISrdQyAJCvsm2jflUMIZRo0if5QOX2FJNwFLzrpl2ysW9+/85TfYUCRzNvtRF3+QUX/MQloijl7mrnovsYlliV+xsXDjjyDR7a6mwX4HIavzcBPc+7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrPvVscOqZa5PiGYjBiyvjWXUY+0+8EydG+/Ljh31Cw=;
 b=f2wSTOwYoHOk9lrrUXtcU16eJTHFsdZ8BTC9QsFPeL2wav40hIFs+GGySau2rTfELS+dDyQ0ksMiZnYZt0mSqUyH3JiWwDYHQjbfoyEPLTcQWxPZw0k9zLv9SWfaIMmOfeVtmILvzQRwKm56DUW53QPG02KM7WESCRpQSIfbVJPXiVzLReAOBEROHvgvbjpprIsQdXDYUUP052mDPNAxuN5AaRUBd57GG11gzBBF36AIB7QRHae/gBm2yr6eajviht8clwAuywcxiWiAsKHkKaoyloDmK54Vkq54+k8/NeUqJwjkax8kijealk/hhzSpo4AyrCJ7KRDA3X1p68455A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrPvVscOqZa5PiGYjBiyvjWXUY+0+8EydG+/Ljh31Cw=;
 b=GGNODYmm00kNo4Ize23kQ+cb/sQe2Xws3Z25wshYI8KJl7Ld4EE5yfi1MjFCBvocWS4cV3A4WCTHITV1MF/aMmced12DtXcDfCrCGkf7b7VlcrsSCHRcVvWPzetoxCbH4muSuViYbuoeyc50pSPUPJqJvdOe5pM4L8P2hOJQ5/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB12954.jpnprd01.prod.outlook.com (2603:1096:405:1b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 05:51:51 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 05:51:51 +0000
Message-ID: <87eckstz49.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc.h: remove unused card->pmdown_time
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Apr 2026 05:51:51 +0000
X-ClientProxiedBy: OSAPR01CA0256.jpnprd01.prod.outlook.com
 (2603:1096:604:29::28) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB12954:EE_
X-MS-Office365-Filtering-Correlation-Id: f54a9f36-beb9-4d5a-d30d-08de93a09970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vfOJ7CP9WKH/oH9nl9+xJEl7D46dJXLFD+R+kbRWJj+1OYP6Yqpz6BV/2feDG4bIbT60cG6rKcwIg3EBPG+364GAdNH/sLQSVD+PCMFJDgNllagW+C8Ip+p9BspXQw8WxWeyOS2EJCU0apTdZRPifrE11CTDwp521VB8r8flanZMlYEOFpRN5aaQ6vPTMENdMPT+4RFZyR6ZARFV8I4X4+lBv76wickXJEf0e3OhTSThvrXVSuhmws0oh+Jhfuh5R2ZarVWRh/JGS4EQj7gHN6sebBd1OY4PVeBC27xaJsp5PraNNlpT5xCz5IqoPSMxG7hvvu0RC8H3gNSkxmmretazQwY6kZN/vNtpLl+M7591762g4ctWkvC1LkSuhTfl3Zwt/Z+RZg40tFbCLSLN1xtoggrWW0szVokJZj0R+sxtGztHhw6urjwcHomU1lJyebop0H2Fdc6Zs3yf7TKzNYG5g27m9HsdFxJBCcvQGJlah48GUe2+hgCHH4eAaCpwy3Zs0PvRw8Aj6olO623zXjJ5XBluu+ZBOHQJRFSpx96n3dip4Uhu9sUVNDTPTBfrENramWaICSQojxD98QOb9tOpdhDvn5+3LNIXyH0EUt8zokpk077tSp86tzSjgGExbd4pmKRU09mFIh6BD5/du84O74KyTRX8Wp8vPsnV5D6cC95FFyFl3PMTUalONR+3icrqlME+si6zmr9ZGPpziVaDUv/uYdheO5wrWhWVlQZ1Sa11kqwKclhp5a0bsQB9DzPreoq1I4FZcisP5Z7coO7/EVKvIakeFvT7jNv4i2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HC8nrw0U8Lqqx1PZjzK+Po8os1aN5Y4JNgKtPywmViMh/t6fI4zUVX7+Fykb?=
 =?us-ascii?Q?dTA35aVyzKwP63myTY/JGw1gdoEqO/76dmshgM8LoSWZ2Ak17rfaZErzROlz?=
 =?us-ascii?Q?qrwhrS6rlxnoupN/VMctOTuLinsYI4nzbiKix/PU0A3tGx3DesuMtkPEsYec?=
 =?us-ascii?Q?+0qLCKIP410ZB6uBxBrpLvoD42UbiczAEe6kHJ68hA8LDaRP59/SwBrH4/71?=
 =?us-ascii?Q?xpRwHxgab1VtYUlh1VamHX6GIqrbeFTOEtEQ4IbLmJe5G48P8HizxVsY7T7I?=
 =?us-ascii?Q?gee6Lt01xVCSbN6fS6CMmdT000iv4BxpJQ0nHyQMRWsEBz5V3l6NGvN37qU/?=
 =?us-ascii?Q?55La7KiiaV1OsjHJSrdoJzeoj5yB1xaBRyerzMMJqw4KF/8Gq56F0Oya+nbe?=
 =?us-ascii?Q?NHVr2zVOylgybfrvSAZu0r/8gTeFu/ellgEj1YRwM3H3TEKvTMGTJcq+9eM5?=
 =?us-ascii?Q?N7NHSOMj012KcC+rm44oF0Kq+UI3G2RgzY+PqLBDQKkyxpXvw6AfQOLIlEvn?=
 =?us-ascii?Q?72mE2FwV/CsR64pALSkv+yHUdtvHuiPIFhbTY4QPu2X3nvY5dMiysuxUmbHS?=
 =?us-ascii?Q?IDwVH9AyKOsDGW6Cse+0PEwIV0B0CP+pVB3KgMe25fp+K9ucBtQhtNoPFMUa?=
 =?us-ascii?Q?V3G6NRHJknVtf1IdNCq7mXya6IrnzUgrFj6xNJ1gMYCsAKpLt0qHHKDaB0J7?=
 =?us-ascii?Q?t+v4YaVV7vzBNj9zOkyIOaKLLqV4AhgWHb+eUbEBfxYjD7HjRzpNKl8Qo6Cu?=
 =?us-ascii?Q?ggcUZlcvKvCIwBVNTkOb5JZBi0o7NpVy+9P3Al9Y0K3ftwd+0npEkdSGS+SK?=
 =?us-ascii?Q?pzPaymPIQPlzXBTPvpbbymXH8QBRbpNfVtLzQ08PP006DiFxT3Ku45B+FGnL?=
 =?us-ascii?Q?OBbuKzEdgqd8ZBoEzfPvQP0sroXsSgXwRt6rxcCpx/V4OV5r6Jd1eWCN4YXD?=
 =?us-ascii?Q?Qc7LFVqWqwXvrVlryWeXG9oldIQLfcO93fFgUsK9Ni1kXhINAnUkMvyEXlgJ?=
 =?us-ascii?Q?7diTk4fytcEFAPg3ZhEFTGuBmNNfDgkHhIgS/NqpMFea2FSgAXJFSGVISHFO?=
 =?us-ascii?Q?Ky7kVCNqiJwxoMmIwrYN+UVu0TXHdr/f1rwXTziQWxfgLZFDPbkw/h9JA4YS?=
 =?us-ascii?Q?OdU0zt51itG0E6dHHtcDtWkquhhadx0YSo3QFvlr/+CzCI+7144j/rQBO95u?=
 =?us-ascii?Q?rHtA3yqxwDvzVYi9+xFedJtT+TdaaIM0i2QBRtYiXX/SMGAPDF6/A98Ama1W?=
 =?us-ascii?Q?cI4+UfkIDbetL8XgB183fahyCc49ySLw+DBjTAhkfgqM73Tn8mci42oHIOqu?=
 =?us-ascii?Q?waLI2mBkUR4nmccLRvn2pkIw8T3F8YqwriDG55mBNN0ZXSVRxdGp3TCkOsTK?=
 =?us-ascii?Q?jovnaTbQWKOwLkmCL56iyPnT1Pew9V97IxE5kAsOXgiLa4LPMx/GLnKpHpT7?=
 =?us-ascii?Q?fBNZ4qWQj3e6rOLvPLpjzPMmYNrkTIpSHNSXQSH3QyjJh4qnLrCMB+1Ttmle?=
 =?us-ascii?Q?cXCYuA3h5y/vdl3T0/LuVaQTg/CP8KYSpAzSKDr9/XmD9VvNMFFFHgQf0xWO?=
 =?us-ascii?Q?nOQFHKj8lVWLMElqeUH3N11jTuLBH0PFZtR2TFiboqpIzY/GlW2JoljVaogQ?=
 =?us-ascii?Q?xORWjP22xngFG3dlKwJHcB/kd5+78y+bwNc+Jv1DxB9ywgbShT3CSxGLTOrC?=
 =?us-ascii?Q?nE9lbiAqNOhn572AUiRW2cFP4GhAyu+PmYaEkzwdXbw95krkCW91hYAU8k1Z?=
 =?us-ascii?Q?cjnJMLLuYgQTyaGFxWhFO56fNLNWCUWx0aHWS1JhhsZ6UGgoXSCW?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f54a9f36-beb9-4d5a-d30d-08de93a09970
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 05:51:51.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDeAb74DPec4V/UA1mw6H/rlfjRIjB2+PxHQM0iZmpZrlKquhdaXKfT04Bnf8Q/OzSdm6Xck1leD4mBVa+NqQFQQb5j7C9SngePW90ETcfQTWe9koU+6ajpKw8an17WT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12954

commit f0fba2ad1b6b ("ASoC: multi-component - ASoC Multi-Component
Support") has replaced "card->pmdown_time" to "rtd->pmdown_time".
card->pmdown_time has been not used this 15 years. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f70edd9c23b27..5e3eb617d8323 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1027,8 +1027,6 @@ struct snd_soc_card {
 	void (*remove_dai_link)(struct snd_soc_card *,
 			    struct snd_soc_dai_link *link);
 
-	long pmdown_time;
-
 	/* CPU <--> Codec DAI links  */
 	struct snd_soc_dai_link *dai_link;  /* predefined links only */
 	int num_links;  /* predefined links only */
-- 
2.43.0

