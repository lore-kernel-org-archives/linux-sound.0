Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537715624B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820507; cv=fail; b=L4UG2nWQnw+txXlU7x1LyToLm/dBJQWDr06+8BMoFTCHtJ3Vh04kje9P8Tb64nkK+SPsEXSChIxpXLg+eUSodVsb2Su3BZt4KSyoufncQz/8TzruuDkaS8uXle/V8xtwBcxgCj1Ya82CjGvmYQdXwBW9W1aDUDwY9bNkSIOvXAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820507; c=relaxed/simple;
	bh=Dta7MNtc10x330ujFf7agkY2Ju0aOGtnz1RB15YN5l4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=MZmjhD8Kdgy9RaYg3ELzcoo1Rov9v9pnwGJkfaXLX6/qW5QxKVSA85xzVzapdw5m7TZD5GO9waxHdFcc3/gWwnMvN2YlimCjGgg6zaLEHqX06uVx1W+ie0KxRPYxn95TOs4hZ5j+6Vx3gw7P4hPfq/l4bpKPBO88gBUXoz1kY/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ciAoZlJJ; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ciAoZlJJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eow3I39aic3IeEYmOwr9g+V5/wosa8x+JSl0Ymtq3ClVZMZLXHtNxSLYx4/vXUWeBfG4g2/gX2R/oN+/vytP7jalWyZ8NLVPcQVVHT03/VslNpTdqOsNyr2V5tD9klFIcmRMzegIn6Jy2QFMth0GUA1JGoMOwtbhj6PkBWhy699iLdcv0Z7YE/2zBvbUol1fXpTLxalYsMWEM9dTlt/kymNTqbyrkU1RPP0+zBNOBQyxUi2kxop2B2xn+ZwW9jd7G4UZ6gOeAm8qdcszEoZtwdYCZpVECDxjb3iaY2Hd8zw1E7/6tSxAsqdtd1EO9TbEzpQ+ZJaFnHBXiyoGiJ73xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61w8CUPL98DJ75pgMHdq8AucW+BT2musFFdLAtZ3fDA=;
 b=RSTcjfLqHbWaCm3uV0OkpUg8VCQvN9BxCvu2rthq/0Zr6/mbxODzLarPZV6/S13w08J9fS2pvi0DyJgcrWYq45v7xMIE1OwKxdo9+4HvjUPznaaEDEXWevdosJihnzyrGSCYTF1eMUnTbgctMvYb7v7Ec2uu4ffAVjyRYKCZP4U/xipV7y/UwJJ72ZREsGpwJDB2yGMznsMEVmtSy0Wo9feeD+XR5EzBGZNgNf1flsg1d1M4SZjgDyVXtLZqIavsqrO/SqLEW5bNXm/mHMPBP3f1T8IJD4Sjhxmo8mzEiLcHVv0qiT+IEav/VtvD08ovJ7y5xgFTHeIwz09Aag2tNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61w8CUPL98DJ75pgMHdq8AucW+BT2musFFdLAtZ3fDA=;
 b=ciAoZlJJSun72U5YTUD6h6neRH1DGjCDhyaijPAX+86MWc+4zs4atyQy7wEHuL6iQoJKC9Q8eDcT1/l/jDZoZyHXqwBsMJ0kWb1b95OENuJfp4vUxGLPMLX5WHhYwV1l1FUZLYqS8LXQvUIvYd/0+3Bqp6MB3LdFv6TIAXL9AZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:43 +0000
Message-ID: <875xbh771k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 054/292] ASoC: codecs: da7213: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:43 +0000
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed09b1a-df08-46fc-b5ec-08de20b84ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wXYjh0JUh2Ig5T+WXCZvvv+dcXZOp1mqqcBOyno4SIbgGPVLoNkiJH2Wa8IM?=
 =?us-ascii?Q?Q5YQvJXr/zL+XBfu6rNaza8bfGR5B83b2p5lk19J1mVfFmTclvjtvaX9ogao?=
 =?us-ascii?Q?GUgq23UE5Cg7KS3FRC6DGcd1J9RdQlGa4KUfANaAD5m06DYT2ne9TLO00jex?=
 =?us-ascii?Q?mgjvAjK0+6QfgHUv6iXOB3A2/qnKU18otV8j3v1gpQo/yncJqHUSb0tjlU2s?=
 =?us-ascii?Q?mUVShZd2Kr0SYfT9HEr7FSJHA6VwkIEMCWT8PotB2hRkhvUfXzmGe4/S8bJg?=
 =?us-ascii?Q?VjQP/iwv7Ozs2HLJYdWVlv3e+2TfL3roPy0sFyChslULczmJLsRTD66jXPSM?=
 =?us-ascii?Q?Vyo/VdqdVZOePVXCtz1mVaIBBA10ETE/0O0Ck/Dj4ib1UXDape3LYMmzUiyW?=
 =?us-ascii?Q?cJWcnJWrZqgqvKCTb83PkFGQgSYTFdrVAMi6buO4tH/OPYyG5270YggwMdeX?=
 =?us-ascii?Q?EQLYua+RM5jUTeVBZIVjvO8Zb06hzuLNPAxZ7gAAIG+e/6NVkvpYtAQo7Cn0?=
 =?us-ascii?Q?Pe/765ucbgKnJHCDsMQ5jORtEWeOS1IcSAGCfdLvrPUwJVcVDlLqXP+ivTFs?=
 =?us-ascii?Q?Ijh3/OG38lg3FXJjvcKJnbyw1rlDuu16HOrTyVT5eeP4tgAeFC1GBllXBJGl?=
 =?us-ascii?Q?7NQB1GXrjoa1qW4ov8gfnLJa1lkdBzY+2qusRYO9Csfc4C2KO/QqnS55k+A3?=
 =?us-ascii?Q?epg4eB1xtFpZ4MNPZ8vOi5mcx5Vep3AlsgMHBGeSTcCVW3oYRjd92m6tlLmv?=
 =?us-ascii?Q?J/hHo9FSN4RqiLsRDwxZuiY7BEpeV0nIHHIeiGO0fF4g1WlYYQOjWIxELqeK?=
 =?us-ascii?Q?WmfR8BnEfWy85rC3/dYjmlSZV+9sHZNOc+rq63J6FRY2xP+w71bvKmharuxC?=
 =?us-ascii?Q?754Rw1EkSV7a/g9djEtuOIoEI7qGHHgBjwdBxtafDrO0mHQZ+1nH5sh2E7op?=
 =?us-ascii?Q?NsWsDAoOwbHUh6ao+VZmlfqGnAPDHP0rfKEhM+rQ7DmHami4l05cwPnr1QrP?=
 =?us-ascii?Q?9kYPVsVDMI4sAUOQjcJmoXQSwy6nI8tLrqObtQbIxvhwb4C1FkOvbvcP/2bL?=
 =?us-ascii?Q?YWOEvA+FTA7nImftNncWjM3vEpAuEXRctWxqIhMQI2MO10YuKCcF6V4QWIge?=
 =?us-ascii?Q?tZu2T8tXnVsn/grDzjgpW0dxxN4GHuE2jQvxmXOSztJIfbz8u+8nTbGcld7H?=
 =?us-ascii?Q?QNZILlJMRMiBIt3+kO6rI+b7p0EbYPABpf+GcVrvSzUP2baBZspyZHpsuuYd?=
 =?us-ascii?Q?c3tzgPfEuW174C3qB00/hBPMrr0NZ2zmrit4fyiUlFxcfW5a/0DIz8FrIIcy?=
 =?us-ascii?Q?fbSCPjJedI3zymNNGvax/VrnDmBAjZDxlyNgLgL8qCf8n4mVrpKJC/WMi2y6?=
 =?us-ascii?Q?oOiDW287OzEffy+2upToc+7DQF/DGgIZbhslMZ84V2uReLyjZT10uJISMeKP?=
 =?us-ascii?Q?WAEYWDpzgyB2Bd/39mKAJ/DMoSi2Du+myRPY+/W3Fh8Vp12sFI1ioLUDjsiS?=
 =?us-ascii?Q?zsM2X3ExvQUzv9Q/1jgKV9d8XbjB9yTsGPoT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YIpDgMYYCw0+SH5izsIbfZ5doRGuh9Tir6nbFAa4jp3QfggrUiGXHDB4rXf8?=
 =?us-ascii?Q?3PkG6it7SgVI5b9Ra89Eid/G3J9ZRlRdzeR4RFyy7J3U9pyp376ZFQfmMBk6?=
 =?us-ascii?Q?Zqj2cdPb4eE1cldEJ84uMSKYiUIALhk4flfyfId5WhLhu2yK7rQgTIRsIWYx?=
 =?us-ascii?Q?TisGjSePA1BW5JSVi9vTn2JPqIa400qoyjrelEgLM+Fq22SlBaUASsOpKNjS?=
 =?us-ascii?Q?042cVLWuG9/0xyTC6aWRzILY7elZ9qJIO+3TSzEhZPYHK6YajKI/TF+d15a2?=
 =?us-ascii?Q?dNJDoiG20JCVSglqNhpwyvBTqQGSqZ+CxPLehGSJiQdeFaQtFqqR9nWZ8TyY?=
 =?us-ascii?Q?KrETKkYlc0BR0e0/YOGmgkTFr1pWBVWTXWYOlaxeD4v1kU4VWmjrtbbrKSgP?=
 =?us-ascii?Q?q3VvJp2jb36j3WiqrVsJBgNQyqFiOVWhQi3qrEU+ypexwg6VJPriEDPeHhv1?=
 =?us-ascii?Q?/4QyPICDN3e9s5Ih5vzGtFUSoSce9XX+xWnDwQT524TPaeQkBykt6zENGkrG?=
 =?us-ascii?Q?HXkZpwuRIBfzFHLZBH2s7F3nhWaR5caecruZF/z+eU8oM0uxfrvCgqotWwWx?=
 =?us-ascii?Q?ZvDuWm78w9UHd1eWBCYh0TB2VKfr6BL46KO0Cvncgy66ZKGxPO8SBz6BaN9m?=
 =?us-ascii?Q?klfW7cuhILdQjCued4TMTxIUoG6AB/OfHrtToLsTp0YkHZDkr5WfdTIpqnv9?=
 =?us-ascii?Q?6X5nYPgAaG9vR1L+DZjqbsSawOMKjabzENVDVC5tnGVeZJYVy0+hMcisw7Tg?=
 =?us-ascii?Q?ZKp2ceFze2r0iEDA9ZVOds4pONb+hJWVtW8trIGJ/jCztUsqizvStxnRABZ7?=
 =?us-ascii?Q?2QT1FdcdyPWTY2PgaAadankN43dtcT+gdA0lixJWggYJk8FvgbIObLR6ovao?=
 =?us-ascii?Q?nAIa7Ie9SlJ/nsnqfVnUUzYcieRjclZkrK8X53RwbO2WXvVoZdKxjR+Y7/VP?=
 =?us-ascii?Q?Ke3Xs3gluWNBCX86MzY0A6DBFHVdp36o5sXruY8Hni/QHW0R29TKT8jXgo3t?=
 =?us-ascii?Q?GQJNTCZabgUZ+/WhhN0Kpc+t2o/ZtaQN7BX5SndMWSDQwpLPUqiFokGWefnm?=
 =?us-ascii?Q?GG9spCuNeR2OGKdr+OGwf+DNLcT8b0nhFo+76vk883cqeBsddXw2lLUPdRMr?=
 =?us-ascii?Q?w6P55362nHMy4ZslVsDwzOkFS6RWaSOpKne/wdN1vvWSQH4r6V+tiEiLOa+x?=
 =?us-ascii?Q?EaMcqN77d4pZ0v2Zmz3c3juWf1JfqkAuQnUa7FXc5lHEFpjK4gagN+wNypjZ?=
 =?us-ascii?Q?jPJ4yeYCwGAoYv2m/I7O6QuYr3uALtgV6Gwj3HT83Fs5b4QBbCQs4KdzXNcP?=
 =?us-ascii?Q?piX4GSG1wgnGyydLruz2vLDbY1/o3TZbDtlOlFuqSnr4HfHzakB67JVM/dSF?=
 =?us-ascii?Q?NWMJ/Jc4xALIZdjsWHmKWpc4zFqBvKZ68vdHXoBt92GTSBVOkFemlXQ+awp/?=
 =?us-ascii?Q?7m4ro6MKo5JpK7mM3eCa05u6u0+BbBEC8PIXRg42sQbGUs4la4rXeaIGFues?=
 =?us-ascii?Q?cgpcFMV7C8hvs/Zc7NsUC7tS/u47eBH3qIhtm+K+EB855735anK5IN77evqe?=
 =?us-ascii?Q?RKld8RKhbrxRf+uV40rR6GCh+imAx1iCB1wEHNA4SDgOX0OfHpp9gPHedux1?=
 =?us-ascii?Q?HUFRJol1n30RuAMuoAPU4dk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed09b1a-df08-46fc-b5ec-08de20b84ac2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:43.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zc721Qg3Nq03lTCotnOS3OoNfOFLqOOUvC73VhERXs+L4BTvjl8b5vodAG9PMO3RNfgWDxMGVh0C5jYof5uZlHpC1AlrUg1AvAtADP36hpet+pNwyDVz+KXW8nFKLy/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/da7213.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 81bd5b03e2b65..0a2b50cdea95c 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1816,6 +1816,7 @@ static int da7213_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1823,7 +1824,7 @@ static int da7213_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_PREPARE:
 		/* Enable MCLK for transition to ON state */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_STANDBY) {
 			if (da7213->mclk) {
 				ret = clk_prepare_enable(da7213->mclk);
 				if (ret) {
@@ -1837,7 +1838,7 @@ static int da7213_set_bias_level(struct snd_soc_component *component,
 		}
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			/* Enable VMID reference & master bias */
 			snd_soc_component_update_bits(component, DA7213_REFERENCES,
 					    DA7213_VMID_EN | DA7213_BIAS_EN,
-- 
2.43.0

