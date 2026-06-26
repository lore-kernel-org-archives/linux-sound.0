Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8863F2580CF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454213; cv=fail; b=pEJ6uR3W5tsHp5snLHyhZTYlYSIkckWjlgZ44zWnLxCq2o/D2N1z49zOa4WaebAcXBaUHDxu9YGKQHRYL+h6L6aSUZYHkrKQau79eC96fPozkrWotPZgsHRyNRxwN9wWiDK/degvgJEUQCldrMvG4waz3MdHvzp0VbXWYYoTvyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454213; c=relaxed/simple;
	bh=fRlH7vkXRQQHYaeR0SmpPK0gss7ObN+x7gs8ROmv2V4=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jS7Wi7Onqcn4S4BbWtgh4K1eib/ZSdUPMozzSAlfd2lmtCe+Yq87iPrt0i4x9G8RaAU2x70hb9+jYW068S5i++oUrioo/3r+g1VhGrRRHB3gmqeKCT8c5OZckOKShdk8bKK/IeJCJ3r9XQp/tllAOYlnCcSk7zqaPtkBFSnfRw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FfIkhbA5; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FfIkhbA5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWJspzC6P0hPiBNJzjtrTzaXbSdwQD2Q7qjFqA70Wev+JfQd+2ciOcRjRGqaCVaHi2EEcyZ8xTFHSQ+5jpx2KJQne2jka5ZAsEFJZwzBmzbmZcrif2TNzSetBsVBr/zLa7uLySE+jVydYCgfAaBNN6rtoboW6EeNRSOP0jWvLiu841TlV9l5DhWod4UZ86zvSR6PyEMAZK0u33g7KtkJJV0DuEGEGNG36LuP/sIbziLF1KCosvoHfRliooRB/hh56WGdG/W4lL1D1WPdUMFvIrvyMoxMozLouFBHeV8o+Ccw9KkeLQWFXeLDAK7aM7bWAFvme7IMF+z9gYrTfbK7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLB5siQ4NooyuzDg02ZgJmva2ten1NVn0K3fIOKWVY0=;
 b=IEXmgLFtZWkhdh8IMEGpQDLAyyvgNo1kn79CigLAkZ81nKJYFuU2HJSsFkkBPo8Pt4HMbwL0n5Gw+GwXCadAnxHAwR4MhsjaffchHKmyaWc0RMq6uvfq0gHqbj9awQp/Jd0pE6T3VItKIPI/F4rT1jmcycAiGPb24wpmiO19icqABTi3IpT3pyuQL1SBcykzyE/dR6Ldu7Gqlg+srqjJJLNflCC3ae0m/LGBvTKjE5UVPAQ/86CHHmDop7PzH0Jc7xnW3W+s1TnwRfmkUKMIKh7JH5MN8mv/i343xdnKc8UPumsM/ZlV2OqL2H9/sy8hd8qh0HWz1MdCjhPYx6aPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLB5siQ4NooyuzDg02ZgJmva2ten1NVn0K3fIOKWVY0=;
 b=FfIkhbA5vhBa9W+A3HfggnmYJWYyDFlo5mIvO+YjvQtYNDCad3t8KmUHQ94dwyCaNsXNS/DMZvDBzwoTupIKhMjFRSLpHALyZOb42haosRcROrjQcZLrhz8t5qnENLI3xHurMwUWQ9dV5DG24fCYg75/Cm2xC2Uv0bd7abFEdcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16025.jpnprd01.prod.outlook.com (2603:1096:405:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:10:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:10:09 +0000
Message-ID: <878q81essf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: intel: catpt: pcm: use component_name for Component name
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
Date: Fri, 26 Jun 2026 06:10:09 +0000
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16025:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc7ba68-29f6-477c-2b55-08ded349935f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|23010399003|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	G+Q2wlDH4bqaP1NYTI1MabFcRCVKD8lbfbMm6ck2eSJC4tHd6Pli191DZVRC6MswCuUmBZ/SEC3kIwqkS2H4HmUUJc6qIcUuXs4UvD5pJEgGrAAeeN7zfYEMffZzi3bNIPUIVljzG8si7yRNNES4/SF9CWNcRG5HxiVVfwDNuaQRzlo0vobdGHHp/qDd+XscejxxIDwVWyntnOP+e2s/aQ+Yww8dViIx9aWd2Nhuj50CDO+kMC5PACLSjQkLRY0IreujdlzH9MtDNt4e7VgWCIejCxDp79DtMC6bHfafGk4q0ZMWADmLQ/NiPokiSQ99GQeliyvZT7vuEwtKRjF6C7cmTdYRphUZQEcPs0cKt6UENNFBg9x/8iHU4QxmYEL5cxQDdWTkWKu/jyOZi3DjuqS5YkGi6ey6PXFZhlIlMa2AVB7Ms3u7izg18j0oFV2xZgYoG/nigPd2Gti+vNrf3gL6ZNpYoEe1ZibEUTlnD7OT096tJgZR51M4/v4QZSexuuuTlzNp4XhaLvgaS4ZOgjXPI6dRjzutRxCr0YsNxG+R+IW7rBVQdievKEa6zO3UeeUr77uYgBuvYPJ8Oj29LC03QzEFQJPsnGoaaLntbmhN45Yh0Cd7pSIluleftG5+YLK1NNbAnB/k6w2gOmP739XKezwqGHcN+gOpSKECnI+X2bxsBhJiOUAk/L+Vh1gOwPT95yWUOYJaarpWRhznFJbb6X92uyIripHYrscbvANle4ydBQ4Gzmjr+1LpindD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(23010399003)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4AUAQ92WI7wFWEbgj25MRxf30U0oSHrIZxr4SvKwyNowFyBy/7mdwoI27WYr?=
 =?us-ascii?Q?ZIucpSbuDh1r0qxy7GU3pmajZlPEaSLaza+++eXgpfrD0mOm9HnwsIZ9n2+r?=
 =?us-ascii?Q?Gd2lyfFJ9JYaLFlIo8BcDwCCkoYeMu2uQagbh23oTgqHwCedOeNDedCkNKbk?=
 =?us-ascii?Q?Ou4hhgfohuQ37o2YnneBloREJteGLcDOFvSOLZDZw3fPeHyc0kIfQZZcgpOy?=
 =?us-ascii?Q?nYPAUrPXHdaNGyNWV1qdu5ncrqauVrgavf9bwfbpD272FHqLvIHXdZ2QDF6/?=
 =?us-ascii?Q?e37vwoYNFWIWc5V8oC66YWcsMoCuuJ6PVM6ZXQezt5Gp5SjPgcozibHHj0o5?=
 =?us-ascii?Q?IlDhnDhc7ZAFIp8t+lhjfKuCZjf6xQ302oxUYKyx0qx6Rwm5CvfMSYuqjbN3?=
 =?us-ascii?Q?fE6NLHpabfLQmOjaiYGeSIm1QDZMXHSSt4ne26QTtnOUNTlhyCy+RZ+NXVDw?=
 =?us-ascii?Q?u9sqYhj63V6kh8JOKsHMqhGC/MFnsZ3bfmC5asfdHwYenxlFeJQuxkXtXicn?=
 =?us-ascii?Q?kFseRl/KuQzZMuX2qZ/PT8nm5T/7esqam3VLoIVgV9707NIN7c8/nhz7f2g2?=
 =?us-ascii?Q?RsKNnWaxnKHbB0GHaXBz0Q7TgjbUBycvvgaNSCioDSv7AryFxvSq2T4tP0Y5?=
 =?us-ascii?Q?tcGMStxhO0E2/m2/6MsccesHiym5E8kMi97WvlD7+dA5cX8BuopTeCkeTnUh?=
 =?us-ascii?Q?F09SrLiaPvR1NG4LRyFn0YNCOrkCIcLGev7YM/HzvdrZhG3Be4amVucdLnEn?=
 =?us-ascii?Q?jEjOeVJG9ooROqooxbD+EWQZcVizDEhUBn/tHIAZQE5u4iPZOrb8EppbZhCl?=
 =?us-ascii?Q?+llORlIzFHOWlGn1u4BluLcqYrVAm7ct8efunBpOAQe1JSiGG7MdzhzNsbmd?=
 =?us-ascii?Q?I3s1Y1xkXgiCYpZqmBzeGZ42SrzJbm4MkaK9c/drYkwqMlUun6VLEHhg63+2?=
 =?us-ascii?Q?tAGpizta8oOZ1R6uTPnkFCsxyP7p1gfybK75c0PnwyR6x4cNjAbXngmP8Isk?=
 =?us-ascii?Q?AJT36j3DdQNQ5M5vkm909hue7dvL5672rt5tRdNy8xwO9uS9udaN/WOMoX2W?=
 =?us-ascii?Q?BiCQALlHvKR3x63odwYgCqlM37LlCrn3nSbHC4uQENd9Y2v2Ujggg6QdjPNV?=
 =?us-ascii?Q?tYBHQXcPRWXZT5cSDm9+aKT506NTSi2tTIISgxK93/l7ESDZrZO4nxqx3i1E?=
 =?us-ascii?Q?3KhAzuGjgb0FbfVqKHF1M5/7cr2HRh+U8SBt08RY1E1HYUa2LuRtic8bD06t?=
 =?us-ascii?Q?CXYZ2Kvx9R8JYD/JhJBlRaSVWN7jT7B1YOksvwvnwZrPPdEU5DQaOx+C6E3r?=
 =?us-ascii?Q?SQdd5Q5js5WQzdsQXFnQnsnNA7jQDBexvCaMsoPpQZXfNbivj6qb1AUFnyYm?=
 =?us-ascii?Q?Vk9zm5Pm4YoFpa4Qe9HFf6k219uEXcwBaaCfBxQGlKl+29qEV9mBPqAcGt2W?=
 =?us-ascii?Q?wAbdx6x8+juZNxLyRYzORYvuU0s5tpuETJwizykw5dreGhpATDgt0OfQIOWD?=
 =?us-ascii?Q?N1WrWNK/ubNfkQvQ2QyMpaaRKZ1hsa6rDTz9bAPFvKPOqjGzvv7J15qV8RtZ?=
 =?us-ascii?Q?+JTwVEtM+n9pIa16x6Ko0beiqhk7H3PsCTc9tbeMbyfUkJCdfQFad40+xe65?=
 =?us-ascii?Q?Rr5NpuBNG62Yb6E8CTh1uMcw2xHzriDy+3vanYKQym9NH9qCQg+9SSyEjssx?=
 =?us-ascii?Q?aQseb7riA6uNTq5lzRmpBtn0kP1d/5pTOmDmXcW/oUm8VBm5QNR5Kg5HgPUZ?=
 =?us-ascii?Q?mdIP5SfVEsfqHJnt25Z85XPi8yBIzQTIDVVC4x6TTSk0TspOw+ux?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc7ba68-29f6-477c-2b55-08ded349935f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:10:09.2861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfuQVadzWtQTF2Jo1kVczksvJ5Sw1fKiid88ZGKbNoYpm7hvziHaYKTl6h7ZwlEYXJrSq3NH4Ot4hTzwtMxu1a/4PolttrpVS94+Rug1N3S+tcWlcYdY6vQFEv3K0wAy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16025

We can set component->name via component_driver->component_name.
Use it

Now it no longer need to use snd_soc_component_initialize() /
snd_soc_component_add(). Use snd_soc_component_register() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/catpt/pcm.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 8fb0efb67eb1d..dba7ad00f8649 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -1017,7 +1017,8 @@ static const struct snd_soc_dapm_route component_routes[] = {
 };
 
 static const struct snd_soc_component_driver catpt_comp_driver = {
-	.name = "catpt-platform",
+	.driver_name = "catpt-platform",
+	.component_name = "catpt-platform",
 
 	.pcm_new = catpt_component_pcm_new,
 	.open = catpt_component_open,
@@ -1072,19 +1073,6 @@ int catpt_arm_stream_templates(struct catpt_dev *cdev)
 
 int catpt_register_plat_component(struct catpt_dev *cdev)
 {
-	struct snd_soc_component *component;
-	int ret;
-
-	component = devm_kzalloc(cdev->dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-
-	ret = snd_soc_component_initialize(component, &catpt_comp_driver,
-					   cdev->dev);
-	if (ret)
-		return ret;
-
-	component->name = catpt_comp_driver.name;
-	return snd_soc_add_component(component, dai_drivers,
-				     ARRAY_SIZE(dai_drivers));
+	return snd_soc_register_component(cdev->dev, &catpt_comp_driver,
+					  dai_drivers, ARRAY_SIZE(dai_drivers));
 }
-- 
2.53.0

