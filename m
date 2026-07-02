Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE1266581
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955299; cv=fail; b=sBW03jjT1cPMgQ4K5LR+KN5MwRKaU7k1hpJPleTnymSQusW0x89xMJHhSZi0ms7xdnVgHmdvEwKyfy33yDM3+PSVSGhJVrNlqz0sCbLLfVgBQFZsQuY6NEBKkGkHoD59pp77yc7Yn6puo4LG07Uajiw0kr8sAc0F8sXcktR7anI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955299; c=relaxed/simple;
	bh=J5yjMqqM+A6mfi08MPfUcP6Gc6XAt5cmUWLegSizy4s=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qOk4p3i+ExMYImDad7Uvj1WGEJp6VADUyP5ywlnjLCXql7vXMYfmLs6OrfYSKHpoNos70EjbN7Khv3TPy32YK1kQAmSXgDHaLjlhT3oZC3Idk/WFyvJwbgfCG7g+XadwCh45rErXj5JWKUceGso5Lmr58rmz2ENg/qV0s9Zc6cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cOs5n00P; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cOs5n00P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+pPRJnBk9WKptNhup0HkH//vuijrGaICgTSQEUa+XdgPWvgBxev4VmBe3YZ0a5PSn/pdGX6UhCeFQQM1GVmAKDGV7PJF/vwHIIi9FYoL/7THY8En0GiLVeho2uTRQpfgGsH+0xzytUvvjkBzqSyHtGiap2YvbTfMe9UGR3vCYxuMOZOun/L3nfyAFTyhXO8DWQWbkLC+LR+IZcLhbSRAdjdlzUafvvtSZe1xUMZ0qsrDkWOFPNvZRxCspmPx8EZyze15AOqT/RTIZLck3oiK7ql7IOcfQQn4s39tjRMPoC1cHpRxpgvqrcMX+EBPMumhIiC5P070feeJVeheQ/BAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP1z7CgFhz0DPbjccQc/tPWkiG+BHw8a/n+ec2XJBZA=;
 b=iAFh3LVyVDbQ3lv/VL9friuNXDnFKuA1muwo5iQg1Yo+3vajEnpP1JpbTNUoXmV90kdLjpIHOTlG52EDZaupGXy60gmPQ4vgDIhQUn2Xq1Bus17eufUe2cFZ/DE6Q3XPduyQ03r7Ve3PPQUtb1Y8zg5rjbSJNYh8J7K/TNAZip5Crd5wHsOGfP4eP9LaoclyjPJBJtG8UDCIf/BGGuL9TwHU/xwzzkzMSRR8UOFhk7uCQROmbNT7E7CoX6o0vRSBgK0qU5+uctg+69TnWDlWcTxiWYVIbcMvHcJ9f1GcPLoCPSGfcUP9cqyZwWK20iSF2dLqsCstihibo+3gi5JTZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP1z7CgFhz0DPbjccQc/tPWkiG+BHw8a/n+ec2XJBZA=;
 b=cOs5n00PWdnTdNtoF6QzE1Or3tJ62Vd+4U6kt1h5RpUGKepHuFajOhE9mnT49yKCKuBnmn8tL1Fl0AalxtEZJ501UEG2z/YwU6H8pEjLVEuWJngtcsKw2xbKvS+4SzHDHe168N+rmA/jtNcaRX6o/+mCsbG+vk8jJTeSWmTd1Vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB16080.jpnprd01.prod.outlook.com (2603:1096:604:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:21:35 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:21:35 +0000
Message-ID: <87pl16xk2p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/8] ASoC: intel: avs: probes: use snd_soc_component_register_with_name()
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,	Fabio Estevam
 <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Liam
 Girdwood <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:21:35 +0000
X-ClientProxiedBy: TY4P301CA0111.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::10) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB16080:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b55ce0-b8e5-4cc5-7bea-08ded7d841f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|52116014|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	gSx5z48oKN0wzd/A2VWqmGckjL7eGalaa7mKrG8zXrwChdlRQP3rwTKLObLN9g2SpK10N66HNuDSI0N0v75TNA3G0KYQnXO763hCHzjaeBCyEW6EMi1cea4ZMbIXdE87sBNGQIkTTgtDoNRBdokmyyW+tnGndO9Gk/JdoGkR8VeXgT3BP9DeczTd5m28NyW0Zxjq7KEzYk9C0qwZCn9fA8ZTwjml4E4x++fc8sBCuzqHFhzGYiuTR7S+K/aOdjHjTNTEYVxr0v43dYyz18V4o4sq3Vqgk3dW9WdxU/zwsJ9qjLGiRIH3qNriuhsoyh6JsuopgRhopd1ZxNFoRYIyIaYqPMQJVCWnGHk8hgyJXNGZEepS9OLBNXn4tLLcSS+CSbAp6qTZh+AWXzr+mg09Z4Vy1ckhM21ajYkh/WUSDt3yA3TcyKfbcbpJKGCH5sNRrw6fV/FFjstyZWNq+csH45PYk2Q/Y+6NJOsrczdbfDwTus055Ewoq1RJhhgb+72eIneQ+dEj/P4LMIHCPCYqUyzFJ2kHbk3okKQdTgz9kJIYFskrv4NAwHBSC7e4y5z1ekKmgzV9FwzkcfN4dCO2/8Ej9CDPKmvIZjwQXJM/261pWObvOtHOxFkIox0JREUHEikc76P/rmJx70r5Tky+RHjP0YPF6qR4jHt9Wn4tMiv7sz+eSDIW7InfDFPefrm4mCkz5i6PoH5oxHqXlKwjK8wxGYgNaKbAOvoNwkugmWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(52116014)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5aTZHvxf4hJVMv/PmWPC+7eJdhVKUAyYHjHNKHu5sFkm61ETgExqxg6N0ot1?=
 =?us-ascii?Q?rUQ0Ojq7cWTpcbAiwzVYiWXVnAOt76ITyFgwrSq2iqLz37UMPx5nD8iUifDC?=
 =?us-ascii?Q?t0dqsbF11ESsBC12rY0pzLYPrdOZrEMB/RKF2znOfLmwRG0XvctApI6MWuAW?=
 =?us-ascii?Q?cc2VMITEAMuJQ10RyQn6CIYoP0c9/vQNzIOABosWimBhaCXSDxB2uSknQExn?=
 =?us-ascii?Q?gsErp/CziC5a7ZTMOGmWLSScNq7hdeRP6g0LjxTp9oZYxh0mAMqXuFWLYaZQ?=
 =?us-ascii?Q?i40NMZys98Kl1cjCgalaFwRpPGRSOJ4MxXcOMLhH10J8RkSb+BqIEjtf8qaY?=
 =?us-ascii?Q?rZbycgNmCHZjVlNlYHhySwL1UlmQP+1GfqlgenDZJ0l+kBYYoSUP9Dpbd/Xa?=
 =?us-ascii?Q?RHl0a6oVw9zLcyaw3JRsNYt/W3YCZuF3sofhyMaE12ecAkuyB4uTKJM7s1qh?=
 =?us-ascii?Q?8AGpJIB8EeF4rSpIzu8Cc6gzYaOfJuJ8AFZWwVCjuXSrZe8kBrpMkqQZZZoN?=
 =?us-ascii?Q?zUxqL1c2wopx097U4UsWgFsrTDSAFJMSnmkoUgi/rMaIgOLru8VJ1SP+WWo/?=
 =?us-ascii?Q?Hr4ydTEfuGjvFcYXQokysSTxCgjqgAz/WkYv6Ils4rUX/iXveQ1v56PFheWl?=
 =?us-ascii?Q?BPolxPi/DDndLyE/qR6gxInRrPLJE1ALWM9AHLYf/O33Zs9x7/9iYOl7amJ2?=
 =?us-ascii?Q?NYS0VzqMarN+O3Sxg0tR5xTer5VAbHeovdgmZ4GbYYsStEnttNL+41lenX1S?=
 =?us-ascii?Q?puATxgLgNHz/kh6qpDRyfZEoT3LsdZs8QiuXXRoOwGCAjcJwbVWjzcbUd9pT?=
 =?us-ascii?Q?aeObbmsrZgSV5DaIi+CNNUMCDaGOQhKZl1/dgIL1ij7LU1QLVlqco6Mi8tPQ?=
 =?us-ascii?Q?mUkYvdPRcj8d00c0fZjzMH5CtmlF6lg3nzxyqpZy4/duaSItgu07OM7uTL6G?=
 =?us-ascii?Q?sXRi9Z/SLXERtL+XpbzCdiByFiPHzjCoazAB4d59TzdD3cl0IH1TfRubDmZL?=
 =?us-ascii?Q?IJES1WtVFlHCXOm1xrBure3X+3aN+u7FWITXHLv6L/QwGpjjV6xZELsDkmgv?=
 =?us-ascii?Q?BrnDKHswXnQ6no3055N4bdaNXP0zMVOyK+vZnwQhA+B4nNC9SYZqqRFSr8A9?=
 =?us-ascii?Q?XCmH6LHVoDGXHyshpcEBqRE0nFh3OE9E+FPrUWIIziLFy7eJgJYvpzin3bgq?=
 =?us-ascii?Q?kxw8cU8U0lwFUhQ907g9myQ/qg8B0Maa2BMDNryAPlMxCjm0ZMBX26RZbTE6?=
 =?us-ascii?Q?2XPW50FCqcs73sV4/3rpB7HLh6MKQxSCfnQknUHKZi1KmjiZdphvsH4/LdP6?=
 =?us-ascii?Q?bTj88N1hAee/EtByIM1B/6ZvphJ0zDaH/ns31bsbTFu5Hkv/pBEi+py8LSgQ?=
 =?us-ascii?Q?78gVYPf8ww70uJd+k/LpEdJvvnb9Tqr+Qcp06Fo18tB2iWaMBz/yGqar86nB?=
 =?us-ascii?Q?l/9299eb+SPe1rkPPTdPLfCkOI2fn90pj2pY8MWw+W9GnVCFDKQqHN+ZT2oO?=
 =?us-ascii?Q?Tpt1twBpGi+IZKbwlVc+t26oWh2gJD26CFnri8uDY/kUTgbBWhUU2XMHKYry?=
 =?us-ascii?Q?scMfwY2IYm8xL7Tl4RcBQ4QNko52mdnlhE1HF/THbdayaukjXFuuWHY7JeLT?=
 =?us-ascii?Q?/Dm4O+PGOQvCkT9YoXc7/oHklcOZFjvxDPqf6+nQO2uLrQBFU799hlp0ltas?=
 =?us-ascii?Q?wlGVYCSuIsp2I4s1N//8m6DpEwHSxGKyneo8IoqtAh/Ys5aXX3ZAGsSP/YZJ?=
 =?us-ascii?Q?ZjN+mukI+BOEAbw/72z2b5qIyLfr2YuSOm5O82fD1OrHlQ6HJor/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b55ce0-b8e5-4cc5-7bea-08ded7d841f6
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:21:35.4183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1kxoMke39rS85nQ8weAn9E0kcdrPGpEcZdV+olatFg7nz0lyT9BfUQNzFKKFsXifBGJLHNvVDt3DX73BpJ0cPx5Whv8G+HktFimBsGYeybdRZX96IgPMeJrNXzSN8xD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16080

Current intel/avs is calling snd_soc_component_initialize() /
snd_soc_component_add(). Use snd_soc_component_register_with_name()
instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/probes.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 099119ad28b3c..aa3bd90523e9c 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -295,20 +295,13 @@ static const struct snd_soc_component_driver avs_probe_component_driver = {
 
 int avs_register_probe_component(struct avs_dev *adev, const char *name)
 {
-	struct snd_soc_component *component;
-	int ret;
-
-	component = devm_kzalloc(adev->dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
+	const char *comp_name;
 
-	component->name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
-	if (!component->name)
+	comp_name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
+	if (!comp_name)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(component, &avs_probe_component_driver, adev->dev);
-	if (ret)
-		return ret;
-
-	return snd_soc_add_component(component, probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+	return snd_soc_register_component_with_name(adev->dev, comp_name,
+						    &avs_probe_component_driver,
+						    probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
 }
-- 
2.53.0

