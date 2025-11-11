Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF482153FB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821189; cv=fail; b=NpB+kfawLNNZ/p4Na64/Yh1LDRr/r4WnoHtDS7tRVXWjsHCT6/elWSPmIIy+9bf7FJD/1L6GUI5O91mu3uaC5E0OmiyycSxncCH0hhBOXL6PaW4R98F13SVO360wAtjfvw6ZDXh//7G5y7hDBAHqWnqW/hwfykVunFi2uLUDT9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821189; c=relaxed/simple;
	bh=KwypdQONcRK/A9qyAYqEeAzVviJMOrbvmEcFI6Ybgbw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gJ5L7HHoao1lWJnx0PUBO5I/bDMG0d0bXJsvqFA3wTXzNL5kQ08WkJmh4lhDMVfF01dqwJzSOsr119hn7EH5fmSMdRMgKTNTa45o1p5Qq8wC9qtWMtX5mK8TL2N1ER/5zGZv4EfxUQNyP9+A54FXKBL8zNxvco1pTUeDvrebGPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Crk0rX5B; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Crk0rX5B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o31CisrXz5otYO5VGk/KgaO5Sz2NGMtvEaaSBgPu6tDiLNqJWKIxakGYxECVWCGuFD92T609e41bK1n2N3iqefI3P+CXPFfvVDQ8cJyeLY5OtX/LUROCLqPfDQzC02VNmmCVB8RYvEGR/CK6Tk4hbBNcZ+O+5nLuWaNO4dOtsE8go98RrsBRqHNa7NEjsYMNub+UatsTD9dETKfbGIrde2xv5M+BqxonzkV/I6qr4gpAaKcr11nY7a/ldSukFFBYDpyR84O50prGVp2e0VAno39lAr999OhqhJbFnLL8AX5hO8tw8m51vbHRaEyURVGL2Rn3nSBCGEFWmzEMzUbcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pn1HyLl81cD9YiqHrecczkLLufYo+20XPg3bvsJ0WjM=;
 b=B81rATWDMBQm+ps0dNoNHQVSuuPFLCHoRny64xlSyG34LPEcD7F8QdzOGE2TSnkdC7GZQCBQQGIkHjOHPlYdgbkgfCHE30zfHmhoweSVRPX/EmR6dV+Dk4Ux2Nd+EN1rzYDHckfS2r1pTI+kc5uGDAIF6SLHr9U23aEH1ZsxcZitys+R6D2A21IBx6Ir5SpZ2rLbfQKGnxe1sduJ8fHMkZ2S97/hiYm3pwvrtq6LurGQznQRl7uQ/B+BK3enZC1oVzu7W2OcB0Rv4XWa7Pq7AQeQaO2dEkMC+mqsUUQ9cskriCao6YgeTCvQYBUdXnoCHFDf8+hG+RG90Euw+WoKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pn1HyLl81cD9YiqHrecczkLLufYo+20XPg3bvsJ0WjM=;
 b=Crk0rX5BAoxOpxa9EQqZLw0ZG0kUZYQFRpq9HTTT1L3lpwkQ/dUQtTHpJXTEX37YRU0SQAMnpCgtYCSu6c2UkvhcECai3jO29cQdSNuhMULyYBT+yeW80m90xv3sRY+soUT1U6eOMPlnQU1QdO23J9/7pHMmcwVN/Sffa65GvRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:06 +0000
Message-ID: <87h5v1wgqm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 221/292] ASoC: intel: boards: sof_nau8825: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:06 +0000
X-ClientProxiedBy: TY1PR01CA0188.jpnprd01.prod.outlook.com (2603:1096:403::18)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e42f668-e3f6-46ee-706d-08de20b9e1c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GpjLmjJvtU6LBwh783+pEZTjjx513p8bfNVjlBsCkr0DuSq9nebasPeYiQmI?=
 =?us-ascii?Q?J6SMSYsLrZzNI5jjl8sYX4L6LUIpa/4tYH5iivx9//maubRYyM7EEyukWUpS?=
 =?us-ascii?Q?TVL7m+B6b9DhFkVz8rfIw+Ea8YCykgIPNFRTMSl4UkyJtx0zIIa71swMrkDn?=
 =?us-ascii?Q?OUGZcpJ9vIP3X4mERNIHn0vUdGwffjG1u6YSsfnFduGW18sGWo7lQiS6V/D5?=
 =?us-ascii?Q?9ehSj9yFGYLqXwmmuYZgUAU8SNHyOg0LYcs5uequDkZhqeMbq5OHDmenAoBJ?=
 =?us-ascii?Q?+7StHgC4ein9s99Mq1TtlJnydeRsO8IuFbj37Vqs84gUdgaTDD4+7ngekPyt?=
 =?us-ascii?Q?AhFm7fr0r9yV22aK8lGk5pG5VjvPTDFUJnCz2NQX4a7jll4m0UEav32WJJim?=
 =?us-ascii?Q?0sIs0H1copO69906xpDd8sdIIy1M4yLSe04bXGr2zy2120xkuWc47IdQuP6b?=
 =?us-ascii?Q?sqviJ/r0IZML2c0+zY+dhQ3zpQCtpDlW5hARsU8POj3/c2oHhPKDmjC82nmm?=
 =?us-ascii?Q?Jy8u9pQ/0ctGIuEzkUckqTrUz/QRSLsEimOI2ZRNh1PQ9LGksPTUumWWnGqS?=
 =?us-ascii?Q?MUdidZkwTs0nVm/ipUEdfZvgqQud701ddMRcgWIkgIvNQPJVp/hv9P1IOoOn?=
 =?us-ascii?Q?c75LRnzBOjX8NdKH0YyyxAzY0OBcdgryoooTnRHT67DD+XkJnvJY/zUD6i4e?=
 =?us-ascii?Q?8DQm5M4ZeuRQDH1eyuZ1U1NgIq+PQ1outBqwVRaYLYwkqBmNgSojt7/3Uo4R?=
 =?us-ascii?Q?cbvOe3gQtBcgOgUDUYLfqhCtBKNy62xgCqvUOo1gb+JRMnoF7D47TOY8Sa5O?=
 =?us-ascii?Q?z1gplP3zappsyr1X1LdN9LMzIlKqncX/Dse5GtveObDW6If19/6Ei+M7qwTR?=
 =?us-ascii?Q?DnEgwLuIF+71mCDcuFSYvuxP7YHtb+0DanyMaSEw04gdMm2oX8riwWpIdRSz?=
 =?us-ascii?Q?LP+pnzQzWBVb8zr9NbtUmJW87w5iNfpPl56wjzEy7RADui2YdoEStMoJCbye?=
 =?us-ascii?Q?hPDRleVh8dIdkMGkYZSahAfwgfeafWUMxC3QrXIcv4/yoWtZ0+yoQv3o8XsQ?=
 =?us-ascii?Q?R5vidjNMGs6dvhcV7UWaF6dGwLVodJL4wfGYM3DdKlSmqMpsOnrYg3LdlZUn?=
 =?us-ascii?Q?Lt/2UL/T6NsxsOpNaqUvZc0cOd4DyrQuJmMfdwTuFbr3TDsRdF/4JaUJfedH?=
 =?us-ascii?Q?bSt7mjv4VEhz00xjHfLUWv0Z4aCNj2l2Xwaqdh0xUIk6oHkcYH5Uz3YniPc2?=
 =?us-ascii?Q?dY4qDZ6zgHMOgNos9zSAN53pXkQ+fkAbZwp6oHWS8IqIpmoLR40jX8VZV6xW?=
 =?us-ascii?Q?l5LXYCQMpExmB0h9WVTMccKdGZ6SKMDkvplPdnfOr8okth//Ln2jjsRIPkNv?=
 =?us-ascii?Q?gYBnJxX6G50+YHLFvRBeM1q7J1re4KSkYabqLYE15xpRFCbjXkRAhB3gi63t?=
 =?us-ascii?Q?fk8O9dCoZTxAyvPWoBZWyOhbe5vAhzOzzNuE+OF44bEo7uv+ZkmDyBiRKCN3?=
 =?us-ascii?Q?VqLz0AG67M+9g3Gz+34IYvp+T3tdU+j3yUbe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iM38ZjF/aXKCddaJ4ab8CeDfUxnuKTK1ZeRTY0np3jcytDeaS7+D/441Dked?=
 =?us-ascii?Q?P4qwAf5ZzdhRR9SMukhKH2d42OwjOwEWc1zQaUjRj9th4Ttdv5Y6A7M7/Jid?=
 =?us-ascii?Q?ib5Yh2T5DwCkbDDNr0kVWuR6axqo3Ab8LL5E8rOa++HvrY4eVeeg9ZTLcSm2?=
 =?us-ascii?Q?0d5E+bVq1roT986UFEg3fgAaUWMNnn/0chumMJLJynRfczUFA47Vr8Q7cbTV?=
 =?us-ascii?Q?MCyGUhpg1hTvYJOlbPOflMgNthl5WYrNOGeSsSUjinc2X7ZFvg6oh5oBK1UT?=
 =?us-ascii?Q?DDRMKiJi75d47kNq7lxOq1nxIDAyshUlbA1rHMRtKgVKFtKA3SGWQhHHcDTZ?=
 =?us-ascii?Q?qQGW9Cuj/DZJH1ixKZYGBWKM7A1WQ1hwIgOzEvdsaMT3icVMGio69soBMOZG?=
 =?us-ascii?Q?l0xQgXbx2wz0VuA9lDWMeH6nsJaF5m0ZAFeH3O4iyW8N59k+/H/ZdrD3FJL2?=
 =?us-ascii?Q?LiLreG0YlNdyeDFJswMXzUHclQPm+jWGro9QyFITXs3K6yFoaIC+G5iuPvLS?=
 =?us-ascii?Q?3TiC1necd06AaWUCxvWiHlPGZ3gmwRVRG6ixUoonRegHIvB9WgmqUD7YGjYl?=
 =?us-ascii?Q?zlgLBDjLrFpwcgTCt7X5kFufH9X/tZYcg9GOywyksQgUIHIr2ORqi1hd6T4J?=
 =?us-ascii?Q?lkUiiE/a0g/I95+Cn/3Tftc2uv0uDdv68Q9ySpSXoy469qfhgIV1N0Rlf7Ow?=
 =?us-ascii?Q?TKR2sdJWqC4/NYNwTj7zlH+UZ6DWO3DYacUYKJKJxCaVCFwmwW2wxQMgs8+k?=
 =?us-ascii?Q?PzsZHpLEf9ccoCMAtmD0K4Z2wxH/9d/7paEn98QqU/syOCp96Y/m4lLd5kuj?=
 =?us-ascii?Q?t42n7e7SJ8NNkH55fGAhvt0CgwrYDIODkx/c1SRAtm8cdYn5EqNDYD7Rf6+p?=
 =?us-ascii?Q?NZpZvlk6dGn226WFBLkTbaiTCU3C/AkYi3eNzVNAfI/PfRRYZDlQgccA8EQI?=
 =?us-ascii?Q?K3lc1dv8NiM/qvPkccKrtipbkoGqny8npBq2nSmBguXmskQoV8+kMIsdRjVr?=
 =?us-ascii?Q?XLElY7+tEgdFwWgGtfAUky5AG/vXzW0QIMy8MSUFKwyy/SAptcPCz9sACzpN?=
 =?us-ascii?Q?wG2YUmDhJULqbjhXpjgPlX9pVaOgnxhyVHjKzR6/aFZOkWoqGJflB8nmHT3q?=
 =?us-ascii?Q?VD/t43g0HMkY2PI5t0cj2ccKHCVGLmhfeCu3TTGYsI6eMQXGAxehqFylz+bt?=
 =?us-ascii?Q?cfoAtToVgR6XbOllCI8euxqS6XQqaNuHmR/nWgxVDoQdtK/Kh4Li8DUoXv2q?=
 =?us-ascii?Q?19IJIAYj9Ow1FAMpRHQygLtu68EUzwvwHhXh2Ur3STUiwDeZ8mgo19RpBPec?=
 =?us-ascii?Q?aoFxAXbr7Um0/FKmNW1m7HU3G6pFNsMwRTETKqr7i+anxB4qN++OpFXxbMFA?=
 =?us-ascii?Q?QJvkolEiai9yaAtCj0IVtKxlthlFmg3VBrjZyixhkuacyAKoZs6V1qxNNe5p?=
 =?us-ascii?Q?21rnoeItmm+2sOW6T13dZAxG32faKtfEeBZgCqaI9Zzoo4C7jqu7gWMo9Xpe?=
 =?us-ascii?Q?99csSS+BoZCJbejBMZPYvNoI8HFcAI3D/zi3pLexxWITeA55sgWFt16L8Mxd?=
 =?us-ascii?Q?+PylUQ+nxLxGEIXHjZszhSTuOugw5vHpq+C+NaWYO27g7eot7YavGJ23eYtb?=
 =?us-ascii?Q?s3kKdhekmOmjmGtN3yeSOhE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e42f668-e3f6-46ee-706d-08de20b9e1c2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:06.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+pKUVuYEGoWCcxcVAtSsIl+qAVCBe/4Qg9EnSRJGY6oqiB+hLdNc0X+EKhp4CDnWHfZ7p1k5MjnI2m9TKk9AlNBmnYDeDn4vbivXdpAAfnyWXeNHSK+6EJUQ8fKMXzu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/intel/boards/sof_nau8825.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 72ce32e2cd57d..15ba6f5c697c4 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -122,7 +122,7 @@ static const struct snd_soc_ops sof_nau8825_ops = {
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dapm_context *dapm = &card->dapm;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int err;
 
 	if (ctx->amp_type == CODEC_MAX98373) {
-- 
2.43.0

