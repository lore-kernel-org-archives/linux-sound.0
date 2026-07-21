Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A772641C6
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784596676; cv=fail; b=fOtUIs9NjjTrvANyAch3VIJFS9mHyXz52pE0cTMRXtypOIn4AZmLcKqEENhQ/QEJYl9mJSofAi6eQPxv8yNCrfLCpFtPVsjClCn4choiNJqVxoIZN4onwGNNNEUzKURiQ1dqE2WfCxAESx2d4fA1za7AVcEtyI5swJdZV9laMBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784596676; c=relaxed/simple;
	bh=ll6Uc18Kd7XCYd8OjL+I6rHVUJAbm4T+OagY2YALRAU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=juuaPCbeU4j76LbsoCEhE5f1eJ0mWm54hzBkawq9fKC38Pwb4Nv/cbRmUsuCDmcsiUkPjVaPmT9CsDbI2ZaqKLQTHlSQs/Bs6v0nbOtiWwgShBk6fc4ODpbcKgCI3luj2WuRbHlg+NQQ0l82z7dzPzkwFHaJE1Q0O/StnG0i348=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X5udOG4q; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X5udOG4q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQ6jlU6GZUGvYDcoYlNTxM27mFwXcnCp31E5oNoFffdst+DhkHYXps/8/5LCl2E9ANpjUGzQ2Ar0cfFH2W0G0vpXH00COc5J1Ic15v8dZx0N3N62YeJZ3bgjsgyBsEwqYsfT8Tm3RKnLmXRu+oOYIqnXQyVotiX/xhAVkZjfTGhqwMIBcJvWS5gSJshzoi/KBnjkcPpo6OwakLOsbK4CO1D7iI74kKcrh8W8o9h4+r9tMN8zLksv+DZJkC35YkO11F/JjFv/GqaHghpgTjEb06cmgCWzcEVrgrxcW/eO0D9f4FimTHeqmvTRBwYysdz9BXDItjKc4PLK2B8IXDACGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkvO7kobDpjwznxomZaxn7jzG7rdVfebMAa5Obiz/iU=;
 b=WDLuIbRv/KHYbxQd1h5NzFeB6whWQbnrvoTe2SNCPOwHEqjwgqCrfHdyf48J7G6iWOMb6npRM/2cPH9pHbC0qxXgTzVSlOoVpGJfmqqy4QI73DcBA4Sng1I7S/PEXjWKl7SlMQ5IgkccCIYX/sAAbvwaaonhwMq1Upjhm7znQP3Xisa1+hC7yXcsQXSXKZto8NlqVjnXaya/B6wRc1W/kMCr/Af3UuYHq1vY6vCakyJl/ysvSKktDumlOWfMPeOyIrO7QnDfMVQWZZ7rR4GO0ifBA3N5rxoxeyZTORnr9Y7geYkpnwNcgIO1UyBpoTnLuj86Df0KT/ByBH/n+FBDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkvO7kobDpjwznxomZaxn7jzG7rdVfebMAa5Obiz/iU=;
 b=X5udOG4qjxMG50R9kF/+Sl0YSdbLrfV6bxun+1QQRYz7YZgcQ0pAjggIZpB3RwA08Ofyz9MUB94Le7lExeOv1vSSR8uwgJuxd3gh3dBdtiX1U8weIFMM7dykAQ6Nnzi4XppKlvT1+vAi3vPukBi6GFjfNZe/nIBBlfqJdYY+v5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB14135.jpnprd01.prod.outlook.com (2603:1096:405:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:17:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:17:51 +0000
Message-ID: <87fr1djg3k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 08/12] ASoC: intel: catpt: pcm: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:17:51 +0000
X-ClientProxiedBy: TY4P301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::13) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB14135:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f35fc9e-c372-4ce3-ac47-08dee6c5e29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|921020|38350700014|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	OGR0AKOijcbFJnBcpFWV1aHvrSGoe7lf6zI21DNospfk968nZhJbT87Hazl0panG0AukhfjjIaHK4pvY3ylAtW00FjR1PMzm7WBha+n5wAjYvA0r1uoxpX0sgYNmq5udDuntV9yP/CwswNgL9V/JT7wKK/dPaDg4AobZeTBTFYU4ZQ9l4DgiE0mxU660Bday+YgdB/f9J1HEUIOu2jmNdzyeNjP6sy34TUV0MOOf59WYVqL36qVi51HKWqeQm9FyL9q3LNjPvOq1SUEoYLPV2GtIcLdKTWADnTfvvXey7+Oxj2aqPgbAweIPfWbkuPop0jIAVt6dBpszi+QiIHBA8Hkzi4vOGORPN+QbE9KAHoNQMxzMk/NkX+7/S63MJDCBllRaMapGaFmHzAVfBb4uifN2DvLMqQ5sjy2AXjOvy3M47NSzsQBDXKv1oS4mrDfnaIr3PhHnx0PyYyUh6KeCiwz7dYTAkFFH4dmxgSlmZu7YagOd2VCVROI3pN1eS2gMLw/LV4Q4OxCmyyiljATrcMAumntJ5UuNvYK4bfnfavJOWl8SDvyAnSryaiMayADgqoy5AzPtNwJ3cOqJDDpjJC37y/1m7JftkMG1dJcCOLf4ofLxbNV+x0vErNQVZ4QVgku+No9FATZMLJjpWnaaozztAfj7YZFTiC5pb9mFyjWqHWy8dQkMZxAgv7rvSKgQ4qiPJ9RNhmBo0XAja9xJEVKvug4XFZxY426xQMP/+Hcjm2WYb59PLzJyTt2ucwZs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?glHy1ykmEvib3V6to1ihinM9IvhXOF3NS421fiMlftW3g+EMXA7dQ2gXeZ6P?=
 =?us-ascii?Q?N1OMVyCwB2+XV3jv+S6Rp/sNIokPJFdgk//K5578/E2FpIJqyEN2jKK15mVT?=
 =?us-ascii?Q?nzzOVQzmWCbnpxtWl9OoLe6lRVhcpLDkoBAhJH767spfdIC88duGGwUfcYHG?=
 =?us-ascii?Q?xV8eh74m2WLm7Yaz32inLPoW+CF52TwJAfnEXFSJJAlWTJJu2uf4BlDkFTJT?=
 =?us-ascii?Q?FerDw4yJqYdXhItKJSNeLpxS8g4YlHUq5T1rtvPjcsGmaM85bh6ck2t9nV3y?=
 =?us-ascii?Q?Z996Ef0YBfYTL+Gtvp24+Pkm5E7AnxKGG5yG+DlZm/1kI0cmyj44MQ/cuEJ1?=
 =?us-ascii?Q?oV3eh06J9O2UqJ1GBugYiWOiP1GDdzM9wvsDGAoRzxAAsO/Wr73JDoLQ8dpY?=
 =?us-ascii?Q?AuNtunrMryNqEepUMmywPf1zcfIyVPQqdM6NB2EfEl8JHRj/pHoYn3E0uYIR?=
 =?us-ascii?Q?vBFjRB4G0I8+7aFzhynCEJjhhMPh9BXAUiDKxn3NWgbjP6Cy8kk1GtBR7piF?=
 =?us-ascii?Q?XGmCParDCFPCZyZeGNv1xmAcUfulaCyY5rVJG4T630rF31Hz+jDImlr3EZ0j?=
 =?us-ascii?Q?3zlq2c7nzKsJuOWDpvlViPEEqD7g07f+AzNAtxKmV9zTtlA62mVeNNdHZZn0?=
 =?us-ascii?Q?1Vt7LI8JXPX0vvDPzbkms3v2QOXb2Je1AKlIz2xPj4aWJKXw8WLVOdVJ5f0t?=
 =?us-ascii?Q?pP2bdj9Hc+Ojbxkxbq7pwlhJGvhE83nPK2D6ApNijGgv/IgEfqZTQvLHZnC5?=
 =?us-ascii?Q?6E53EdjA0awPwWnTVK0kWFYjeG0q3jWOpJqmtzl2XYmwePB+eBQKSV2loNGg?=
 =?us-ascii?Q?ppgwI+uQrKWmnDZHcMqNq6TdDyjiXTIMsdvWQugYHCTDVzbES2RBjrzlg8M9?=
 =?us-ascii?Q?DiAuNdI9Ogw/ZFzNUWmUXRnDfVOUMuZt2Qax+kOxDJlvaKTQFwy/WWEUfovp?=
 =?us-ascii?Q?4Ic2+wEMtSPKXABjHI/GSfPeDvp2xLRuBERQQ2QR2Swdxmta4traKyNnNxoq?=
 =?us-ascii?Q?9S26dxVW2osRriR4cUucnY1Zzy/9DfrjAN0YNQ4qPP68vqGHwr7lXnFQn4vn?=
 =?us-ascii?Q?kg0iENgnOAEqYkoGWRMKppp2iR9lHWR88F1+HQJFCMH1GW+sYvJ5FlBVIh68?=
 =?us-ascii?Q?jBDc6HyhF69VVrPZb+Jc1/Plz3+HZUU8jGUSRylRk9z8CoImypRZiU3PVfu4?=
 =?us-ascii?Q?POLKNCjC2fTqAu2jGTEL02O5pac+ARlOJ9WdBx6BvwgwVdfRfs1A7pSm1WnR?=
 =?us-ascii?Q?aJSA0V4mruryyowyqRfjS7jGyvmf6DVvlqaTspsK7puZ43ICMHqucO8Ms8vk?=
 =?us-ascii?Q?SKBJgJY2XLZCbjaDZQYs/SYygoeRZv4F/hLIe0/S1peUikTbSFU8NfpIazfT?=
 =?us-ascii?Q?1DTeYVyYRWqnNSoEBrT/4x0f/navIGmjGcDSiNZwKU3OQoeyJgDiQF6Ouan8?=
 =?us-ascii?Q?JGYvPM6I5ePiA10Dqji4+hThf7fjuR6FptlVCG8OhZNVAQ5lK2FvhUSpNInl?=
 =?us-ascii?Q?rF5XClAxCIxkcqeyRM+gOHzOIu8oDmwhi7tqu+tOPdtyylTGFrf0CN8XnOPC?=
 =?us-ascii?Q?u7nURimiS/7ZKIOMChdOzymIYyPFibmy/vfPiyLpILax61Q+uYEB95txcvYh?=
 =?us-ascii?Q?TchFiofQe6z72lzsCzuRRC7eOWju+iXZLdKjeSc6Si2OgC4H0L+Gu9kevug1?=
 =?us-ascii?Q?5NSCeoQJ/RqKqqp/RxksEcy5ZTEL+ASebpbIXVElgIkUGsZbpAZPxLCd15GN?=
 =?us-ascii?Q?bpMZCMMteZFW1wpybMMRfeZnDOifnFMJk3u2YE/avPMZ0p3taA4Q?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f35fc9e-c372-4ce3-ac47-08dee6c5e29a
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:17:51.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyATb/2U5FKZ80kP9pKGusSQpHdUPW+ePz+mYnPT5NvnL2ZRIH9TnLkHR8nD8U5BI0eP6KPEv81HMR+NZ8JhtIeoNGwjUlazHN6/Fln1PubkaevrBBGzeQ2/pZmTaSS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14135

It is calling snd_soc_component_initialize() / snd_soc_add_component().
We can now use snd_soc_register_component() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 8fb0efb67eb1d..6c1b87d9fc4a4 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -1073,18 +1073,14 @@ int catpt_arm_stream_templates(struct catpt_dev *cdev)
 int catpt_register_plat_component(struct catpt_dev *cdev)
 {
 	struct snd_soc_component *component;
-	int ret;
 
-	component = devm_kzalloc(cdev->dev, sizeof(*component), GFP_KERNEL);
+	component = snd_soc_component_alloc(cdev->dev);
 	if (!component)
 		return -ENOMEM;
 
-	ret = snd_soc_component_initialize(component, &catpt_comp_driver,
-					   cdev->dev);
-	if (ret)
-		return ret;
+	snd_soc_component_set_name(component, catpt_comp_driver.name);
 
-	component->name = catpt_comp_driver.name;
-	return snd_soc_add_component(component, dai_drivers,
-				     ARRAY_SIZE(dai_drivers));
+	return snd_soc_register_component(component,
+					  &catpt_comp_driver,
+					  dai_drivers, ARRAY_SIZE(dai_drivers));
 }
-- 
2.53.0

