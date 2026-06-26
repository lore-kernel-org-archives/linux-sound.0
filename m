Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA572580CF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454208; cv=fail; b=bonLL3BPfjjruumPoiWdErndihgIV02al6xzCicjs77cmrmTStQ+crvAOI2KkfoxSyN0N/eAPysFPq8GvypV49Cmy58G1VD2kx0AG6uvHdyQu0r1wP02iHI+/26Ejr+d2PM2OZS0qNB7bE4IAYw1k9hWjP8lwTKC1EZNF9lR1A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454208; c=relaxed/simple;
	bh=GJi0I0H022NicHlhyaGnxi8Et0CBPUxMns0XBqUx+ww=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XdfVWBsyBIA3DTvjfvJuL9vdWn/4fP/Tr/J3//MFs6XYkaLoEql/5tYPXYwOfT/RxnUN2Aj60x+3YCyTWtAcwZDo6Xc8a2WuGdcg9HvNSNNrqqgPnwDjDuKPEf5hrFkHwGIUf53+aGRTgorZ51psf5ap1MOgiyK1gTtzdVw3yko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U8uo/lG9; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U8uo/lG9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEUBQ+43bOM69/QX//YVAOckrBT0CjwI1yd4lOc/iFE+k5vmyrDOLOb9a4/NCEYAmFUMY4WmE/LD05RME+AfWJZf9ip7i8ht1VRNm79ix4wWdqHjghtiP/zgb9pq6QmCfg5Npo8SCtWLNqvIbJ48aMYXsqBKMCidIVCcszUoQax2fygBl3LKn3KY9DVzmasL2t4BA0mPyeQqkIMWqQFEvWbGicIrKuBv8VGwRD2AqYnTSs9JpvGuQwu4+aoVggGLfWyBmkP+63TnGEqtTiW8Xk4tm2EbtllZTZuxoncW0D1vqLkOnvri4NGNfXEh5ilxXnxHkn1645h4PGVlyx53+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZBsgFq22ml+ocdHvM/fVl9ACQdydqmax38pqVPPNDI=;
 b=YdTxtWF2v1bgzTqku4T9inRVKFocR8DM0qwgwagtnyZkEQS34LqpkLm9dInXxa1ro3+i2SjPhEl2UxXdT8rCXo5cmZQnXLe9/112fGQWK3mUIyaD1kbSGZUXmKmWpHH/h8iM3djo9CyoxqKw1Yq/5hlmntdRXOWw5FnojXUJY47daDG+dtW8TDolGPR8gjCjzyGL+1DA3x145+2UMbZCcQ254Vgmo37SU+WWATAhlrAbdH2yxuzvcIQZi+6uSY334tfK+0YxGJ0dKNhMx6ouRNzxuM/7bA3Rh6Ptaee2YaAy/HqsssjtgpYOfAPLjn/+SLDujl3Bu1cI+80/ac94gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZBsgFq22ml+ocdHvM/fVl9ACQdydqmax38pqVPPNDI=;
 b=U8uo/lG9uX5mzaC/rwZScZextzjsYi7SOzbBLwaLYgZBzsmVhk0IrqehserH/yoW+WuHGtQM/GYRa7vK9yl9S1tZB0eci6nbtM/aV2t5xbedBYw1j7PjQWm6Esps6njMcJIcf0amy0xwT7aLyJcbQM5pY+wicE/zF0z2nae0TJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16025.jpnprd01.prod.outlook.com (2603:1096:405:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:10:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:10:05 +0000
Message-ID: <87a4shessj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: intel: avs: probes: use component_name for Component name
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:10:04 +0000
X-ClientProxiedBy: TYCP301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16025:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2d084d-4165-42c1-c318-08ded34990d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|23010399003|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M7PA6+W85ugIyF44jwJ2P0+ALqqOMIXCZBgTY9teU6P/f2ev/tSzomE7yoodEC+h+rwslZ3TuBEvCsKwmgjEHIQTRVcbOh2OwqguGMQD5o3oaxLeWcPyM8YzYkoX14HI8oIv3Fg4cjGfjWXG9Asnpsp5Dpt5G3iamR9brYf1jaX4ai5RwzqjuFvKO2vIdb3n3lx6+zg6nzh1SPesB4hsp8e6hInbSMflsngVUlsyZ841YA38dcAH5PKH3wDkyYX7nB48kA/KRPsoUnPzEJNTPbH2pJYma6/glCuDdZZzk1y8ATVzAGCXVVtoZLfHKEPEqQ+V/JW1UeF6KWlkhFMwNHJ674k9hOU6tPawrwje3weohi27bweRmyUmYrT7IQmtd91/9WI0LK/23iZpzi8eIIGVomUP4ZayB65EPXfFaduhEBl7l5IPSbguPpitH456WfACk0Fq1kKf4M9n0bpgceHuSlMS61uJJKFkLJ2tjQXIXFR+xDdIyCdsOGtmMErkAGgvjSQ54l05D5m6II+SHiU5CxIsKl/kkaX5vTHp04LUYQaddhUj/FeXXIvYEAaQatLHAWT2P1mDqAtw1v+p8CmG+pLxMdCng1j1Vt3MddwEWI18+zVMPorEeQyhy5K057pWEbIzmaarbFTG/M9M/d13S2szGVuk+SdacqGOSs2scGy/Qlqycn3HGCJF3uj7ZL+WsW5hAXK/2g5J3Cxq8q+RqqVLh19hoHwMIk5OCSE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(23010399003)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?khjezcncY+zn/LCMBtpaJdMHU5FZk//8AiZUHhmd0W8hxIUA1W4TeJNJZUef?=
 =?us-ascii?Q?JVEDMGwdoppjoO//IkJQmO+kr+QPRJx7O7qzvclKTj72hLTiCbx+1G4+V8Ni?=
 =?us-ascii?Q?rJ51QgdAdGp+1fhXPDG4f2G9xR3Bczn/aixbWbVMfXqzTvirPkVdYyGbQQjI?=
 =?us-ascii?Q?SRdpUfupQSEDDNyb9apz66tdKVaeCOMjX/9PeoLd26N66Rh0zFuh0olIClAv?=
 =?us-ascii?Q?mVJoU1MAGXZfBdYzzQdnXqsfR0MtoCc6S6JqwaJDhQYqen7FNe2dxOiCzWnV?=
 =?us-ascii?Q?DllxbM1RLsbwS2BDFOAgCzC3yJ/wGExZn04jwDoKYPdTWYhOF1BuqQjIwwsd?=
 =?us-ascii?Q?QjVuQl42Soz4PAlrKW833mivLBra1tUNjkbNSaddmduVaNAhyqeY3uy/G/P1?=
 =?us-ascii?Q?Vc7uCQFGbJ5OKRcWKgIiu3eW2Zx3ebN25o3cHcl4Zpocy6ZANVcS1y3ES3s6?=
 =?us-ascii?Q?/jdGSf0I/lgKlPCv0BT9gWbcc943WDVVKczEHu6z4gSkOv6mwK8oxDDHWoiH?=
 =?us-ascii?Q?t1PlApS54BeTr7drRuvPo2tW6LYtH4pMyVhpiEV50wImDylfRvfX2Z8BbKfT?=
 =?us-ascii?Q?xfCGRKrRPC0/5kYIknNa5IutS1Vky64l8Yd1/Ci3JjppnjWdS/yXLoaErEDy?=
 =?us-ascii?Q?Zfb28gu0TvnIjeGqqcpGwyjdrMDSU7DtUYdXH580Kx/r83VFwasxflNFC7Pw?=
 =?us-ascii?Q?gxnFQdbWzMa3oUwDe3rHwFLxeG9GLf6Zm+bbOxePlBTI9aHuXH9LlaqlZwru?=
 =?us-ascii?Q?LHHJHCBiioZXgDRrpT0PHtSWauu1C9x3B1po3sMY5SCCJCZkP4ypfRyPq7Y/?=
 =?us-ascii?Q?YS90OLJPv293Uka90npDu1ftgboAM2eCEa55ZhqoNrDRANjS+PYliqWFZrTI?=
 =?us-ascii?Q?aJrKpXwdXfFxpm2cw+ie4Ohr4Ct9Nl0/o2LZlgQjRVCqaAnq/k4XN12zoZBU?=
 =?us-ascii?Q?kGZaGz6IWepLpg39e43nzrBrizctIjCPFnyVNyTyqm381SQVKPYJEiDurX+x?=
 =?us-ascii?Q?uRgOA3qUSILM+K+bzpSCR66e4QpIQJ3I2avUIijz+YlRfIDMjI7DKu9oCABk?=
 =?us-ascii?Q?HctXjtIqxz7YIssI3OTN9c9dIXTvNllpdTbfJqezoAjL9Bra2Vv4TffKFN8O?=
 =?us-ascii?Q?m/dcy0HO5xr9akXv76rhTH85SCxI2F/3ZvmO4rKOo7dvq8ahNGRnYr7DsS7V?=
 =?us-ascii?Q?7Q0vVtzgMv1lgNqp0CFsuKHTL7sGFjIRImrbvxrbqGkpNGpvS859+35a4QSC?=
 =?us-ascii?Q?8ShLvU7obZxc5XEtTH8H3Ib2JNNdu+TCcW52FEzvlNNs8CceQ+0D90fB9cZZ?=
 =?us-ascii?Q?KxJXzDmMaK1M5fSsEvcPJwAXb2lWMm1yb30s1bEPSQUNwXUudhF3jCGAPp9+?=
 =?us-ascii?Q?giTz4wZShkYRmCJJfVN9Lj9B74dLzXv2jdo1dw7QyiurBTIl6TpmfBFyVtkN?=
 =?us-ascii?Q?XdEqchG/x84HE+LPsekBdYkFagKqvmbvoZ+Tk4uuXTuFpzCvvjNFiG/zR9tk?=
 =?us-ascii?Q?xYdJqkJqP0CC1xFgthqXuvN7G0GBwyYoy7hTnSYVF/xnBO+I0BQ2BrslUVAZ?=
 =?us-ascii?Q?cOtch54a1vCjeADJe12qbmXuMpj3xzaLQPs68iOl1tiM7Fx8SJ0RKRgW2J8L?=
 =?us-ascii?Q?WJnIxBjGS2rmgcLeV7MUUSHhtknW64620xr3ECVTdismpU8mtZcRvzz2vBTF?=
 =?us-ascii?Q?/1AMSkLinMGTzkpBo2P3KPPvLHghIB/K61aG5sOcVB+5tu3ln4hk3bnUx5U2?=
 =?us-ascii?Q?cV1fxgDjQBKUjxrx0hNoyFcVM9ZdDOnNjQNb0y/OrB9i9I+zgzp2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2d084d-4165-42c1-c318-08ded34990d1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:10:05.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2y5D15W8K/SWLlvjN4vkJvbDjI1JFJ/pYgOrs7nl14DZf6cU9YSmx0O0GmwMscAvmfhBdUTJEr0Skt1FNxiekLCdvkAj1R9Dwn2oMnI4sq5TmV4dT0M7NuT3a/UG56Y8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16025

We can set component->name via component_driver->component_name.
Use it

Now it no longer need to use snd_soc_component_initialize() /
snd_soc_component_add(). Use snd_soc_component_register() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/probes.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 099119ad28b3c..322e4d79e0ac9 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -287,28 +287,21 @@ static struct snd_soc_dai_driver probe_cpu_dais[] = {
 },
 };
 
-static const struct snd_soc_component_driver avs_probe_component_driver = {
-	.name			= "avs-probe-compr",
-	.compress_ops		= &avs_probe_compress_ops,
-	.module_get_upon_open	= 1, /* increment refcount when a stream is opened */
-};
-
 int avs_register_probe_component(struct avs_dev *adev, const char *name)
 {
-	struct snd_soc_component *component;
-	int ret;
+	struct snd_soc_component_driver *component_driver;
 
-	component = devm_kzalloc(adev->dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
+	component_driver = devm_kzalloc(adev->dev, sizeof(*component_driver), GFP_KERNEL);
+	if (!component_driver)
 		return -ENOMEM;
 
-	component->name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
-	if (!component->name)
+	component_driver->compress_ops		= &avs_probe_compress_ops;
+	component_driver->module_get_upon_open	= 1; /* increment refcount when a stream is opened */
+	component_driver->driver_name		= "avs-probe-compr";
+	component_driver->component_name	= devm_kstrdup(adev->dev, name, GFP_KERNEL);
+	if (!component_driver->component_name)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(component, &avs_probe_component_driver, adev->dev);
-	if (ret)
-		return ret;
-
-	return snd_soc_add_component(component, probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+	return snd_soc_register_component(adev->dev, component_driver,
+					  probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
 }
-- 
2.53.0

