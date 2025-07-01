Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5E7494
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328637; cv=fail; b=sNm55G4Lk48Ox7i+nwnoLgDDG1uDjRh57gaT74ZZIulRv7GagIGoIlJyD//ay3O1kp9chu1lHt2tu3BkN2VfkUJGk6RyEMn3riblnZDU1WNbbp0R6N87UEXa/UO9TViYjrMQfPUX1na6CXsteGQeKEoyG1dJD12HcxZbRdOLtOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328637; c=relaxed/simple;
	bh=x415tiHvwmb8vTgoDdahsxL9huPFhevsV4/CxET1BUU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=j4tev2cH8QNeIp1pWf10LeqLftiPoYnUmCb0KIZERVGAYO+4PbgG9UHrIcUJunTFNGVH2QZJCh/7O47b4vJZHNreuDMxqAOnDr2+GBhDSO/ZIx1p/m23rnJgCVDe2cCoJz0eVhVd1edNJiafQNK32FhcGrtxkcMElrqmrfDcEUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Nxmb0PK0; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Nxmb0PK0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkppMIz+puYWP0ht+AAr4LX7aiT2pNVslJG92a36V3dtM6CEiwb2Aq4Msar23PW172v2WgTnfLlCBc/S1zbJTKpmnacZ9x4o9HIko91A6hw4Dq66Ua8WYJHrDzWa6g7RCekTwHINq3qN+8vqRdqR6OpnZTm6Q2pFAppvpI4tixuO6oBV9VjL9uRbu2w8NZIYd0p7YlBrnaMNj1w6rivdc9S6LpuJM+KmdkAKTHkH+bLW6Y5C0ngpYQsnQk5sAO/dsb/w50KgkR0V3uFQ24ViENwjTL/ckLDpfL0BONgT9ui/lz3k/oOwm/fboHNtKGKzoSL80CPKBPWL1CRWq5mbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6GC1jEOMjQzPOZ0mIUc0P8jvkXDrM7qEeJn6Z7yjbA=;
 b=KJZRA6uRs2qhNMsFrbV/EoA1OPc4oILODwBbVkLGUcPkTt5hQElj6G7gkU2GJ7QSJipzwFppW8S7kqAYqJSFzN1l7wcvGOwJw+XDyejB6ezts85jb7tbGv6rXbvCczqI/qpKYh3e2N2rbTRhLnXlWk6z1/O2c2Hjm3v73vfKB8WlTmfaZHEnS069hxTm/LMaD3XZBOWdoKzU8HqWwxsoAPHkaTu2ErJAjYmmaPftISZMsTZlMRo9utN+svkn7NA/5Gn4yDLHUxpRt442x1Nol3dFNYApH0jmeydfiPR6h7PY75V+SjEfbRA36Btw68+hbFqhHIDgh6LxVUgML4S2Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6GC1jEOMjQzPOZ0mIUc0P8jvkXDrM7qEeJn6Z7yjbA=;
 b=Nxmb0PK0YUQO8D9siD4qUPwwihROsvueJySDKI/PDXbP89sJ1lMN1QNNpHO5brnA9WOnXMXJfQlwrOW5OGhhe5eObelP/s9e7EDMk0C5uE+ChTmlcrb+rw1ZOjCS2WPQSq9vhvKOpLisvy2U+1cyRLexQWrdxn7ndfVsxij3wjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:10:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:10:33 +0000
Message-ID: <87tt3whitj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/11] ASoC: soc-dapm: remove snd_soc_dapm_nc_pin[_unlocked]()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:10:33 +0000
X-ClientProxiedBy: TYCP286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: b969cd27-ff2f-409c-d353-08ddb833b260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/SKvKuxkUMC9x4cB0Wea5MSYrP2UkhJIQSmevtIAdhvbyQxLSiSEHPkSgVPr?=
 =?us-ascii?Q?qRT+90dSFAgSybKPEuIQUUAWpdJKMspJDrB3gEJhqL88HLhVA6vXOwtLTGfj?=
 =?us-ascii?Q?kKpuSzQPDOzJvnl6axwhhp78959SHLX1GasTBFDfIVOI13BAbin3HeaupBOo?=
 =?us-ascii?Q?7NfTm3OdzaZYTLjWhd64O4hPRYXn00XFxqSRJuKHiI9rZkfjC9qanlBqH2c2?=
 =?us-ascii?Q?NLF6eIBw9tT1PDUowDh3mywXLlsWJL+xVR9L5rqy9I0aVhcZ0unmcy3se3KK?=
 =?us-ascii?Q?6QsZX6iYO/O+ccdQQlHeGIsCmLTDcujFnZFSdGXERIArudCCJm4+iCpKAWaJ?=
 =?us-ascii?Q?6gGtXRRcnAYzwwXfdApawX+DYVaMZHz0tUdbnP6z2nDrz26DPh9jfaVA0pPJ?=
 =?us-ascii?Q?Yn6XzXtrKDNgqhbItvha0UUyGBvWz2JQfp4l8C3fIJC2zSbJ4KUJpRVihkrK?=
 =?us-ascii?Q?qLyJq57ctTOHCcozqM7ozZapcApWSnSFjYqGfbxJk5j1Y6tNfsHENbTCxltc?=
 =?us-ascii?Q?KV1Dtu5h3cbRAbM4vegOB5309kWeFd//zuc8bm3p8UmmNLiZIsuGVOF0RNgR?=
 =?us-ascii?Q?CIo9Bu2p9TlWhtA7Uk4WabQsw3VS0oHKjAqb3oEAwAReWT3De1/8GMlAZeZ1?=
 =?us-ascii?Q?CNHOIKT3Pv/c+jpr6PwZQ54DNoBbzVKtPxXktABnoYR0JgfHrVQn5pmf4Bgy?=
 =?us-ascii?Q?vJQA4SWl/HYZ6A1hW4S3q6tyNjL205/iptrSv3H9AlJ54BBR63qBNr3BNgSD?=
 =?us-ascii?Q?8eUSi2/6/lT7mttEnYwhFo3Fao3/2mRukqY35TWh/qxJ1E48aQxkDAjgqmtr?=
 =?us-ascii?Q?Xn+QjWJ9cw9vHIihZIeNUAEJrKGX2CUm+X3TcCJJDOuJJG/OZhMi3NF1Jby+?=
 =?us-ascii?Q?SmB7XtV188Pqaup79SVV8DklFVOEQz2VsiPcepK0gyJetTXmVG1DcqRqt1YY?=
 =?us-ascii?Q?IvxcCwqTQ/uCbBtOFbV7Vi0u6fPMnpK5ZqWcb7Vy+Ysf84Dz2uwYIDRO/S0t?=
 =?us-ascii?Q?0g2XeS/ng/K5YmQ9ZJkIZug1iFw70BbFKQqMKTFsiTHwqs2Trp1ncSrYWVmM?=
 =?us-ascii?Q?I/R0P4r+wvBT+Z3QM43DvGWJDZM7gHRFEPZDZiHzlT6rKn+0BRZofwqYm8dJ?=
 =?us-ascii?Q?ilZ83oF2iCCuHkWT2bWJDRUqfpL7zEAcIfBC/Q85BSOtjR0dbTB0bRLmR1al?=
 =?us-ascii?Q?u3IUsbZ7pP2Dedax42HracVvZ7gIiFWFJkLoanoMtWzkrBhpcypouSyym0qB?=
 =?us-ascii?Q?JWsRb8Va7mQBpoVwdMOFNE5qMEGvhrHveWpY30TD/IBNJP1vRwmglF9CEc8u?=
 =?us-ascii?Q?X/AHN7rZITqbhzRmnEz68L8lKHYe7CbMVbHFblrssr1gQgmjSHXEZx2+pJCk?=
 =?us-ascii?Q?NafYxuDcWzGy62U8NwJROJS0R7QGQDncBJvkPKnercduyC1a0zyeaucGZnrb?=
 =?us-ascii?Q?HICdL8JQQxi8sJBwUuNl70ySxF/2OJtkm/ajWjWhrIZ50VWvQfVkYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QIgaMiktVwY5hudU0rB8YVOXhBi55T0Pm9u1+uRQzcexN/c4zT351C1BIz/9?=
 =?us-ascii?Q?imIrYv3xhpr0GZCc70xi1kCwzZpOM5eypYHoBgm3E7hG8HdglnkOiUjZqitz?=
 =?us-ascii?Q?03rJ1m6kW8FKTtoSBaW/9ViliH/r/1pne8cdFKQA4vdIk1sUQRVnkW+0O552?=
 =?us-ascii?Q?TkRzT5aEblcpQpRufMVTseLtb4jXjoM1B3lh2KporzIcv2U0qupBMJHTGmy3?=
 =?us-ascii?Q?d6xMgZIQ+UHFZjNcbl+UXL32wOD1d6KdY0yGesEfeVb8RjHkSdWlC3bDBynV?=
 =?us-ascii?Q?mr7L7glM5Kkxg6vbNFfCOtriB1c1fvRIBDQV+uKTppAdhwtUeIoGP3Z2T0dl?=
 =?us-ascii?Q?U8i9UyINfAr8mpj7trHInafz3c5TAsq6PuAs8p35Tx1QBqqaqIHDhdTQCwjd?=
 =?us-ascii?Q?lbKWeMA7vvtw7XEmp5ry1FVKarsdAiyl7skEWmnTHFoGg3rIsY2kkTCIPCy5?=
 =?us-ascii?Q?8SpQNNI18fTKIBlQaR9TH94sBDtVobH5K8kOwWAWzBE00KJ/68TVK7t0Wxem?=
 =?us-ascii?Q?AJJyIE7j97k9jRQ90jqtIZAWSBVx9VPX/+xoZFfx3ktUlyWnZmfKdkEHvX5N?=
 =?us-ascii?Q?sWsPGDbuxVCRKqkJvonc4NzssoJ16iozLAd98ff6eWm2dTLuFv/SoLSV+9Jj?=
 =?us-ascii?Q?cn7FOVfFxx3TMXVMaSKx+MXIKpkzkmzZVNoxKgCVOLZVTZ0ShtmQwuXvyrI0?=
 =?us-ascii?Q?SzmaIqpBOgfWcyi6PbPWpPzXSrlRt2wyuO6rApSK684kiHaY/Bf+3IKNLifT?=
 =?us-ascii?Q?p9S7JbzUr7vsSZbjFDoFCvEfZWK4rx3Mts0Ct/P+13abeqEeLAR6eAGBWnLh?=
 =?us-ascii?Q?wDqg+SeLopF0pZRmO5JjWN7mC6uYmR5bE+4/aA740myPaKXynznlJYusiRSR?=
 =?us-ascii?Q?qzffRkQ7jhBNhUcf5ohLFlVCHzlLqk6NI+WO7XAGTb2OGC68y/6CfX91aqUA?=
 =?us-ascii?Q?HpYV5v4U223kW2CC67Q7TO/4It4c0qsN1dPuDCm+g2KJ+/ZdPjsSe/q2rDH9?=
 =?us-ascii?Q?SsYqDiT4vRZryFFPM7CoevFase5ENbkQeyizywXlCsWpix68epWJDQpRk1xF?=
 =?us-ascii?Q?6ARTu3VTisqeSe467x4CP9pe2nYg0YAM7TCAdBWqAdRWyV+4ZVVHGqUFQdsI?=
 =?us-ascii?Q?Xm9u9Yw+JuyZMHGWDR+BKtsKayx5kZIoYa7LZBujbLA0JUJ+LUQhNLbcMrzz?=
 =?us-ascii?Q?jb05vl/BljDjUS3ky1N6ING7JMXsg3D8p22en0v6twYwgCw6CuJeqoQZ8+lT?=
 =?us-ascii?Q?vo/0h12/0xf8O2C3nnpT0pQvftd8KZhqC7miOIHjpqZ4UgajrkpaNmGAj4Hy?=
 =?us-ascii?Q?Hr32YWzWgtyAhtusZliyXiROJ2Jo5mFZiggAuquMZFjvZ1QK1GVoi8tHywhP?=
 =?us-ascii?Q?Rm9/PW4Xiuc/CElWQu+AkruF2lACmWwyf44Ak5hlfPFZ9GSgdcCnwSnO1vCB?=
 =?us-ascii?Q?sk/LlZtueT79KlN0g+buJY9nEhjUic1Ac+MHD804BaVZ5tFXzhIBzvXHF0y4?=
 =?us-ascii?Q?DWNz8mTGIdLHzCAMlwcoQpbA/hXRdpwmD3mfqSWngHl0wpX5vmzbjNnOp7b6?=
 =?us-ascii?Q?yKo7e2njYwWD0Mf5Wcq/jC6zqQBO3L6ps5URvAGKwlDrLH6AJXU6fOUim/Wc?=
 =?us-ascii?Q?dNuh8rWXt/LR64U7whqn5M4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b969cd27-ff2f-409c-d353-08ddb833b260
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:10:33.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0lzVMSAosPMM06oNtY8fSkhWXS5O/QKNVkntEnwkx9AtrwHIuBYrvJEmIAI9VwQYbajW0SwHjQmVHN7xB2gJhfMiQLhQ5sXNl9HGVaVMujMc61Q2LLZnu5yftNDUoIr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

snd_soc_dapm_nc_pin() was added in commit 5817b52a298a ("ALSA: ASoC: Allow
machine drivers to mark pins as not connected") at 2008.
It is identical to snd_soc_dapm_disable_pin[_unlocked](). It was expected
to be updated, but were enough as-is for this 17 years.

We might update these, but renaming function name by define is enough
for now. We can re-create these if needed in the future. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 12 ++++++++--
 sound/soc/soc-dapm.c     | 51 ----------------------------------------
 2 files changed, 10 insertions(+), 53 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 400584474bc8..2a0250fff9ba 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -498,8 +498,6 @@ int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_nc_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_nc_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm, const char *pin);
 int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm);
 int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
@@ -509,6 +507,16 @@ int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *p
 unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
 void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
 
+/*
+ * Marks the specified pin as being not connected, disabling it along
+ * any parent or child widgets.  At present this is identical to
+ * snd_soc_dapm_disable_pin[_unlocked]() but in future it will be extended to do
+ * additional things such as disabling controls which only affect
+ * paths through the pin.
+ */
+#define snd_soc_dapm_nc_pin		snd_soc_dapm_disable_pin
+#define snd_soc_dapm_nc_pin_unlocked	snd_soc_dapm_disable_pin_unlocked
+
 /* dapm path query */
 int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	struct snd_soc_dapm_widget_list **list,
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 98b35600904d..e4c2feec6e39 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4772,57 +4772,6 @@ int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_disable_pin);
 
-/**
- * snd_soc_dapm_nc_pin_unlocked - permanently disable pin.
- * @dapm: DAPM context
- * @pin: pin name
- *
- * Marks the specified pin as being not connected, disabling it along
- * any parent or child widgets.  At present this is identical to
- * snd_soc_dapm_disable_pin() but in future it will be extended to do
- * additional things such as disabling controls which only affect
- * paths through the pin.
- *
- * Requires external locking.
- *
- * NOTE: snd_soc_dapm_sync() needs to be called after this for DAPM to
- * do any widget power switching.
- */
-int snd_soc_dapm_nc_pin_unlocked(struct snd_soc_dapm_context *dapm,
-			       const char *pin)
-{
-	return snd_soc_dapm_set_pin(dapm, pin, 0);
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_nc_pin_unlocked);
-
-/**
- * snd_soc_dapm_nc_pin - permanently disable pin.
- * @dapm: DAPM context
- * @pin: pin name
- *
- * Marks the specified pin as being not connected, disabling it along
- * any parent or child widgets.  At present this is identical to
- * snd_soc_dapm_disable_pin() but in future it will be extended to do
- * additional things such as disabling controls which only affect
- * paths through the pin.
- *
- * NOTE: snd_soc_dapm_sync() needs to be called after this for DAPM to
- * do any widget power switching.
- */
-int snd_soc_dapm_nc_pin(struct snd_soc_dapm_context *dapm, const char *pin)
-{
-	int ret;
-
-	snd_soc_dapm_mutex_lock(dapm);
-
-	ret = snd_soc_dapm_set_pin(dapm, pin, 0);
-
-	snd_soc_dapm_mutex_unlock(dapm);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_nc_pin);
-
 /**
  * snd_soc_dapm_get_pin_status - get audio pin status
  * @dapm: DAPM context
-- 
2.43.0

