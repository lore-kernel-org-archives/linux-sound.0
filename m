Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368119F421
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903943; cv=fail; b=AtC/xWHS4lwVgpyBiofVCv8J/9f3W72u3hIyeUlqjFqA3B7oxe0n89enIdiJFFD9crOX+VAuxd5gyCMp0oi7mTnNDMlBhk0DOQbWOsmmI9+S1QmFFjaNZckWoJ0TEj6s8FVixk1MNgWQ+VyZOEzJ/o8EDBjpdAQ/hTkKyQrS8mI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903943; c=relaxed/simple;
	bh=wZAcbQ1lnyfFWukYC+5/kOSGzQ7pwCZnLXw4LlFXcxI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oyYYyIJ7YVJcTCUJWoR9sG5495TFTc1uzNEDXqBCWmeYg6BHz0RHoYj+JoUgmS70nyNCr4h4dHq3HMecbtUSKO2+uO+Q6IRIh6KWm1B9uNAzRYPagTnnAhC6nA95SeMuP3gGoeTnI+MU8Cyw83TkFTpTuaVrcHoxOzb/x1XPIs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q5svLpv7; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q5svLpv7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2mv8Nf4dndSQ7VlCP42okGDXo8xYrFMEB6Jhv1gL1yANXwPXTvs3LFnV/5C4RTafm9GpX3v03LWuXtlCbbkGNtJi6vnx9mWKORe38I18AgsmRbpGUL4eO1M/CkTb84+hS2lDE/WBBr4hsHayfb8ALPs7zJByHRVEWgHXZ3KeAsnfS4F4BOCboA76bFZ2fYeDZ39mv7DyU24t0w+tdqMZRUtHGSJfp/2WgguCsJvbVA8UPN5Nko7TJW+dqhFv8P3JERcrVENVmn3OSoW14IlbiyRLPykSO68ohGQkQgpWle572oyFn09MGa/rX1Ft9ZFV0sAIOKNMXzLMuZidintjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0JME7kR0hCN4kX6t+jmzwNfa7jx++ah9HD27oDFPug=;
 b=FAP9WKGT05ekflmuSGkzqfEYOociRa4ENGbffvRpGfENwERzODk3JY+wXPCdi738x5abkb4GGDdUEmbeeVJbb+T88LdoUuFdFEi4De2LmM8I2QgW2kHzB322RGY/LuYGBldPc6WAR0U2xzp6OynjcW+MvZHgbqiUopoSPFYwsGqm0KVyYF43v9QbMKhrj+Od2HJd4+SYqwGk3R4Eez+9eFqDHZYUnGsdbhm6Pdz/bdEr1BW+vt4hAYBhVWwerkpBAuq9FA1x1YI/v/O76zmiVWfJxVcOCdC473qRXMna40bZ15ZfeqiHB+Y74ZPbjo0wGTVQfuecc/pncOt89wiuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0JME7kR0hCN4kX6t+jmzwNfa7jx++ah9HD27oDFPug=;
 b=Q5svLpv7ZnK3t67QWNMk7+gemzqTmoUPEC9YzvgufXn9Whe/9SGBcxuiAUAMZCFArgmTqoZ9w/zYXGoLevWGNvMWH3m2yx1E1mkI5IDXk8/n3OBtCc6A+i90aWSeVvoHwi0N9NTmT8OKMiGFRsmoKF4yI1e7e6eLAE3gx2MXMc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB14355.jpnprd01.prod.outlook.com
 (2603:1096:405:23d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 02:12:16 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:15 +0000
Message-ID: <87wm8z1cao.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/11] ASoC: soc-dapm: remove unnecessary definition
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:15 +0000
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB14355:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5b6b29-06b2-43c5-b55f-08ddb456deff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vg9uMUFfqACmu4TuSE9cM+k1ue3XnkOfYF8OuzUDvTmnTslfV4DwNaNh/LbA?=
 =?us-ascii?Q?gb7s4PfEvxHnOeBS+eHnheDngGnyJ/VdiwC617KmR/4KNuHJFV952qubrx0b?=
 =?us-ascii?Q?BVWz3KBOPlq9W24aBpv7wTlXlIn0j+ClNGVryEvHt5bHHMu91SNIItdeVmEf?=
 =?us-ascii?Q?5dWoMJMVjAuxBq03NceCCeDjzokeG+OqlK6+6pkSLzL03OLGk10trXaWGGvF?=
 =?us-ascii?Q?u+9UFWhzyqEOt3UdLqYMqtaj96kiA1qFPUVovxZ/Uz+SYv0hM4zkLwyzKwWI?=
 =?us-ascii?Q?YktbPtZzgCF8e0oDOBd6CzfA8JP+jElIPVF/9nZbFlfvgIhxW3/U78B6maES?=
 =?us-ascii?Q?tFfaOAMKUhnFrX40vxeXsXjtQsGhI0iSv2Y1hHtmcqx5vHvlZQYnsVC++V4B?=
 =?us-ascii?Q?eSNHWsxniORKjiceGBN6AFwMcT6SSy/Ro2RhnVvjU+PBW1J5qkxKsox4Lfcu?=
 =?us-ascii?Q?wLs2vOQFz91O8fu610jbdAOcAvfIEh8AWZtYRn/Pu++9Y8itUs6/cqLE1v9v?=
 =?us-ascii?Q?tGVqQBtnBgWYj6gzgjZtMCr/9n/rwIrJRjnS/Xt/zat9fUOlJEWBZtWVfFLD?=
 =?us-ascii?Q?6BLOuqgm6AHdcssYNq9EVfw1yvGKoNEUGExLBXblmNcR1azEpCCLIO6KnzRG?=
 =?us-ascii?Q?6NmLP1RuN1Jgdm0VZ70GTNmh7/vblkqIrngyv1R5CO+9x0VctDxkpASABT9r?=
 =?us-ascii?Q?Hlpgv2ByIotBPAgCfmQD2SnUGTCX69QZ8bmmEepkon4VaEAf/xJcQ1I7mmtK?=
 =?us-ascii?Q?DyGOuXbdDdEbpJNli8uSbEkOqtgC8JQjW6BXaOmzzQcMOkBVLMCpzHHSECqY?=
 =?us-ascii?Q?DuzZq4mO1zlg74Gjh2JpW5t2iUNacFQ7RinvI0K469txQ6xzcDtRzNJVIs0e?=
 =?us-ascii?Q?WqjWvj+TlL/QajqlUqNy0mgA6ZyXGdAFpwIjvsCeSCBdhJoUpfq4RYG+cIXe?=
 =?us-ascii?Q?3PKcKqLttaGZ+49CkmglYUOHG80fqP8Er36zEW9WvjUEHE/bXRBAIknJRg3H?=
 =?us-ascii?Q?vCI//G+RZvowxQ0YQkTLzoqcKI+jp43i2KLCHRPkNBYyW+/X5iAFUEPXm/nY?=
 =?us-ascii?Q?2ccHSrbuyvlNM8cAtYNY45eE5Qzi3c91l9K+HVeHvyCbiTzjQ2DT3TLUJ5EK?=
 =?us-ascii?Q?PSg1muEn3jTU15AFsQeCfwRjBZi6qogmaFdEUKF81HUgUaGalAU9uHhOoAR2?=
 =?us-ascii?Q?BoMWqxB3maAFCshLfYrAxdbbXd+iRzEtwc7rlwGLcQ8L0ewBMJsIjPjndGtc?=
 =?us-ascii?Q?3PR0+EyUDPwVoimdAWWoi+Gxk6R0i4uBJYcG2nqH/TeXOGmrH14aHzRDKOPM?=
 =?us-ascii?Q?tzlDrJpCHiWwjR1UntlZsj7k9tHfQawNbU/I6guhnftn2+UOhz7NautXYnHJ?=
 =?us-ascii?Q?zPje83E/nkTtrQOXThFWUlof12Of/7VrExvBEz3rjB0onFMvTpumfyrJTAi0?=
 =?us-ascii?Q?FSC7mg+0OiIPUHXGB3G3dFdyaS8xMMTN2l/3IB1Ev+BRb8Lw5YOKtw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?adB5IBB+iPZPlVrDgl9kr1uBzo1uwZ3zLzEFgUJYT372Wo+X7AMsXQXT35D2?=
 =?us-ascii?Q?bPMG2uNF917MUFXVJRGAQ2Dy24PZr5dtaKAK8THL4lnJ4fGMahQAi+1AJIpR?=
 =?us-ascii?Q?az2go4lGpEvTP+SHKh+BXgkjg6xBLTZ9V/zUa49bXSrpe6VWRRNEzL0M9xeo?=
 =?us-ascii?Q?M3474+mHukQSlYdvw6LkooVGgG+8U5To5M2V6p9/NQj5AKWRM0y6pyVdmPW/?=
 =?us-ascii?Q?0Oq6NsHT0lk43kohKepKkPAGgyZKzQM9VU3r64R7IhETqlCmtTRBYFWHxgZp?=
 =?us-ascii?Q?IYC/VpFeJ7GBuaEhJmpZTzaO37vm1AB5qsbTnvr4dDRsb0K0uD7NYlCZlKlf?=
 =?us-ascii?Q?V5PtHSxWmK71I43T9P6UiEn/PkkPS4mEo7VlAqZsdWBExN3tO4PigDHbwyBi?=
 =?us-ascii?Q?f/8ZadyGY4ZkxiaJnB0oE/Pc7yuUyxkAYH84UeAF3m+siOf6D1jpCW+cU8su?=
 =?us-ascii?Q?9TGZmpftuhSK+anr1pkwyKjoKUepZmrAaipx+HYgLgSR0F2LRyVozeYx5pD2?=
 =?us-ascii?Q?3O2IvhXn9d3wvYnG242A3MqbAicepn9Ojhlmp5tUi9c3nS94ytp178VCt7+U?=
 =?us-ascii?Q?pWJ60nsqXixHBrRqTrBKg1OUnF/+cWVGoG+FoBEXwNSAHwNNwfNLQynXk6sj?=
 =?us-ascii?Q?BeUBG94yiqgppDtyViObjXu2AKmuqWc3PxYv4VIQXeLACTenYGBKjy922emz?=
 =?us-ascii?Q?ZkziwFJ04PWIygFygO0NbRATZVc9l0yfHs0wz86flRn8yJn8Nm1aJgA/C9pR?=
 =?us-ascii?Q?OEKtH0EwCB4Qspc1MxXKkk/hAPd1SHMq2zN4ycr7Yo5XyquVTx2228r/n/sJ?=
 =?us-ascii?Q?X85FcuZ2kfV/eYi9U7y0imYWF3gZufYnk9bWPmANOm2jhleXsZ2QgVaIPkE0?=
 =?us-ascii?Q?1zfnjCWPgbnZzD51AWO586Qf29ifA5jn+tq8nRxGFPHroyfn/QlqTyDZuWwe?=
 =?us-ascii?Q?Vx04atvfGWodFMmEbOKg3470psPC7iI9LqZG25UPAmgy/LTZCBCRgAAKhW8j?=
 =?us-ascii?Q?/jnkoTa3Ab7oLzZFv/tN6lccc5Fd+wOhUvqfuL9cMIporFZAgz2yUQK02qxt?=
 =?us-ascii?Q?uciYobTmVlqb/eY+kEYwbmBjzzqpAoSkeeaMwX3tCu6ZBTfq/XEiDbXqR7dx?=
 =?us-ascii?Q?7p/McIvFeVtR6sg+iABEtnzuY8YUXl5ktw7r25/4IZAISDV4o52w3OBfcigS?=
 =?us-ascii?Q?JfN+ix2LB+AWbtqodDNGP3TjKLtolCc1FSPB+m/QsxcT3mmmA8gNKrTuqS9B?=
 =?us-ascii?Q?ieah8LrQncwraX9FsSO4hBgR6dGj6qK7BEx70/1CS23DvYbwkx9NBFLaG6rv?=
 =?us-ascii?Q?UdV9NhEuqV+7p3uspozcVoKgsjjMhNLunthrvEyQ5/l851kii/3VKYt2Tp51?=
 =?us-ascii?Q?I6lHKxh5yzf9p0hvkKFNq8h6RmNtWpLmM1kincvMjZ4J8rgDS1K9kYj8rHog?=
 =?us-ascii?Q?8Q6fBhNfWg664LhdQsMIof/LTMFSGCYpKkLx3O5ZNT5dZ3BtY+hC0t2bQZ7Z?=
 =?us-ascii?Q?oucKh9bA89uDS7yl9JR2dMp4XVii0BRxwIM2U0Retps+I/6sL2XmJMLl11zN?=
 =?us-ascii?Q?jd4kIj/ZkoYOY92mwVbGh19FVbzXADzSdPKYsfyKgwCiPBVZ6MNnzvdarjIW?=
 =?us-ascii?Q?Q77RvvItySavOeYL9vLWjls=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5b6b29-06b2-43c5-b55f-08ddb456deff
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:15.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nh1WQXlul5pnoj44PhBrV3D437W3Vv95eUriDZHbMDN1UQt/aa69eu5+3HFVcZEo62e5S7ObG5SW70nBYagT/aoO2y0y55petyedJmGWsxCztfmh1QVy2sCAYJXN9exl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14355

Below functions are already defined in soc-dapm.h, it is not necessary
in soc-dapm.c. Remove these

	snd_soc_dapm_new_control()
	snd_soc_dapm_new_control_unlocked()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f26f9e9d7ce7..091ab31ae42d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -55,14 +55,6 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 	int (*connected)(struct snd_soc_dapm_widget *source,
 			 struct snd_soc_dapm_widget *sink));
 
-struct snd_soc_dapm_widget *
-snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
-			 const struct snd_soc_dapm_widget *widget);
-
-struct snd_soc_dapm_widget *
-snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
-			 const struct snd_soc_dapm_widget *widget);
-
 static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg);
 
 /* dapm power sequences - make this per codec in the future */
-- 
2.43.0

