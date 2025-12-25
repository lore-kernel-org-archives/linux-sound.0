Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42B3A1E70
	for <linux-sound@vger.kernel.org>; Thu, 25 Dec 2025 00:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766621159; cv=fail; b=MnWWznUDZ3eisX5AL2va1hO7zHtSYUm+/wUQliiSb94a4sR/9U9Di8emFFOucg00FALyEIoWGJwWgsCT1aLBsLHvS0kBzRyIsvovrA9ZpCq+ITqLqChSGDAVEjTCpCOnpIVdPUF1Y6ZUfZoW0svDjx9IPGYU6CHClAPYABrRraA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766621159; c=relaxed/simple;
	bh=8NjvSBIC79deDaoHoAqgNwG58FgvHrXGx0k14PbsC14=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=WQBB3qiZlJiGjc/xiWtyzuWJ38XAGbEoU8adswjxSLo1pn21QyvFshvhn3Xoid5sTaEdlGDQeikW1BoBt4oYNWNCSglFS3nZGofQ/08k5jor7YmxEX560UGcHNaloUxrk7XSoNg1iahH20qgtiJ2D7gbExl2XvDdEf94YVbLVH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CH/f4YYr; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CH/f4YYr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTnXz48aWLDKwVUsioqq0OD039lJqKH6/PEGhAqX/b4SFooq9Cxwy9pXjhLPBl+EyAt91xp9dLko7m0sVGq8OEyO0iHlX5i3pNz50wWpYtNUu25IANgxG7Rz+TLF3YSftJLmM0HkDYGO0OJvKfkCKQKJ2dpuhjnKRKWMR3C3XuTs4a6LA/dFz2UspVb4g0KS64R1jENRzzaST238TqXaZxM6NZr+274puQNPJ+ECMwKxGMv6xAX/ImWAZsrpYqZqUifYn/4QBeHdxbDBh+/IEzhKXnlZiyhlrZxHlfxKM4zWG7o5P6smM0ybPYlc3VE08GtQVWl4AKOvkglz9a5mHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEnokV9ha1ASSIegbvBZtjJ3Q2yS8VzNE4Ca5fdEeQo=;
 b=Kqx3JV5ESkZzYZtg7W8XSceUP52rlQ0rgpJdZewPpOt3TikIAXcXch0tF9p7QECxeQqEpXJmO1/OmTJm9zP206zk7QAIQY09R0vlYYpK2NQ+HLfQYC/+csC3xCliAePyPhjPM9dzqDxyL5M7TGLWSmg2u7vx4G8GrS+yy9InrfdrLBSWCKqv4hVIrp7AO1Latbxr8+CIPLchqfQ9bjz4z7wM+BIvM63TcIvzm+reKQERscRAV7B66sj2kizrb9pmQpMwTG5bvvAD4VRF2G41o/v16c7+Vu+Ci4OCE8bA0BXEJiunXcTbRZNjQjGaNGWYuiqEHK1Zoa0rlj4szx8+bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEnokV9ha1ASSIegbvBZtjJ3Q2yS8VzNE4Ca5fdEeQo=;
 b=CH/f4YYrx30csbcD5lwUX9HwWVThROyDLZnlPMpWeko+0Uw30DcnC5jHbIXcm0KeDggg0XAANU8DnjGvkWRroXLKFXUuT6XiH6PZ4rqZMPL6Kscjh8BL+u/FZBDFisGhCII4FRfuBsCUsbDEBe4wclEPId9Tb4XNq44yRAtcYms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TYWPR01MB11109.jpnprd01.prod.outlook.com (2603:1096:400:3f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 00:05:51 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%3]) with mapi id 15.20.9456.008; Thu, 25 Dec 2025
 00:05:51 +0000
Message-ID: <87y0mrtogw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: alc5623: tidyup clock inversion in alc5623_set_dai_fmt()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Dec 2025 00:05:51 +0000
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TYWPR01MB11109:EE_
X-MS-Office365-Filtering-Correlation-Id: f3eeac24-e457-49af-ae0c-08de43495d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FzmCaPP9yQ3WfiDN/uXcZXeUwvv6sT9MeJAU/8yywOnTaPz6yELonbA4FncL?=
 =?us-ascii?Q?E7EWjyfVNXQQ9IXUhdOFKqeuQUwEWMKpZzl43B/pFId5iOoIJV20/O5Z5jF5?=
 =?us-ascii?Q?SaPoafF1j2QZ/pyR85Cv+2IQ4StbjhwgayBl/BQJW6UmL+GuP6+Z7bldPx6/?=
 =?us-ascii?Q?ONXERGTQ0WvrjlvqFqH+eDF76CKV8bFkZq3i2a176EoiM20uJTQ26HCfcsuT?=
 =?us-ascii?Q?f9JBBNn0fhZKrklzUIzTCMs8T1KmhQSr77C3ZLiTwRtnNhZamM/UMD80zrNi?=
 =?us-ascii?Q?BbmPGUEIRXEHO/phfSgyZSsEmUgbqjXyCtn+kNCgl43zcNRUtFhrbECLdWTQ?=
 =?us-ascii?Q?KQ8kXgLCcF8ar44cLfxdP9pZbV250Vmq7NzkprqTUqiR4sahyxWo9FryaGM6?=
 =?us-ascii?Q?2RezClI3lPUVZhHuG6i52/5LqAvlYF1iKwLiP8SqWbs1cmO/5S/1nCy3C48V?=
 =?us-ascii?Q?yqaYknsTlKeehaTbz7WCDY5XOvLsWnELghXpDMEy0p2rbwGRdUfcoQHbmP1b?=
 =?us-ascii?Q?W2lWDu10HF/L4UR+G/kSdr19owSg7CUbUj+8E+Wz50ktPVkkumKCrl/4dQjA?=
 =?us-ascii?Q?TvvVzeJlwDHds4eHvzmxV6rpfVPx6JpoyvDUKr+KeI2roM7QA+2M3vYwkdxw?=
 =?us-ascii?Q?DUi6hmrIFnFMHF5hnO28x5lfHhJNntieMUhoBdGqJiWa9WQ4cYQxWNo6b5bS?=
 =?us-ascii?Q?KH/MFp3o4CIbCX/Q5FkDJoQxoRcaLlO9QE5IDLMSVie8pSsIxFQR0BIrhp5k?=
 =?us-ascii?Q?i5QEPXaZFiEY12LaIBxmjZbNz53V7NyJ1xAVO+3ZrzgmZx5YOsCiAqLuW47/?=
 =?us-ascii?Q?NrwFWS/TDGBoqsty+fB2QcQm569q+UD2HX/9unwBu76lU2cPIiIbpGg+8h5K?=
 =?us-ascii?Q?93cRcrfYOU6mQu7TGmEe9yl2deIqNbDgybocGa+8+ZSVAL3KaNfjwjV6ILdG?=
 =?us-ascii?Q?42kdRoQVo0p0DSxLfbOOwYqql5PfTSsE85xkyvVcOHu++aq1f5kK8IKArV4G?=
 =?us-ascii?Q?l11vshFr1l6CJFW9iHJoJwrUrj3mES7j6O9P8Qw3eiG9QC/cwZVvUNCzT799?=
 =?us-ascii?Q?90wj4GNKCD3aIxcuTisfMogxe7o3QMmc6jkm9CqkD5wgtW891+G30795irrK?=
 =?us-ascii?Q?vqV5l6+ClsIISGe1n8xDR0zVD4G9y+V7E2vn/FICaJCB1UH+gTbDxZI89rQl?=
 =?us-ascii?Q?IoJwhGnWK0tFJ4Ect1caEvePtZ4/3dkA1L+azEz5Dn5nKMWrrQwfxdLmh9Om?=
 =?us-ascii?Q?TexedHGsTAmL+qaefpDwpVWaJb/JrpKwDkAILxrQ4MKzHVIEK2ZNG+6VWWDw?=
 =?us-ascii?Q?I7pcbJqknMxd3EjxqpsK7VoYiIKaArxjJIUg6xwxTCijZg3kKzpPwiBMdWiz?=
 =?us-ascii?Q?xKdpPqb19ikVbTYqOFUFRokEmZSYOQXtCE0KS7pvVjC5ZU5css/m0XS7+0vS?=
 =?us-ascii?Q?bHGDu7V9S17iUmBCDHN79G7WxDCKknCYtflABTxH0DEYCnU8Dcy3mPAaMJvW?=
 =?us-ascii?Q?7ldGRf5tFnVR0u/85zjsc5d5OFlNBbfRxZ8u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D2omFOsAXJNebGdeXrzzzPmYtM95nqB2QNapbH5saH8o/OtqxaUPsP5gdVlP?=
 =?us-ascii?Q?tbo+dXaFlCBk8BQaE8ATWwZQy3vVWAhzAjNEPz5iApAgcTUKMQt8khPO3Qdu?=
 =?us-ascii?Q?jMD81T73l7JfK1mcmrFO2pxd+Vp1GSxAolcXWtOg3E6x4Z4EONddfKRcfXjY?=
 =?us-ascii?Q?z2Ys/7ShUpat8ZHUJBE6+ir78aytrvdDR42kOR3o5S8G3cOUNW+p+dLzxxny?=
 =?us-ascii?Q?SOkMIUwiWeP6lUWkvVhzpJTHz5VcT6mtzDQ8fj/gAZXhMmf8uKC2JHM7lW7k?=
 =?us-ascii?Q?9sCqi/7Ty2tC4Mt6gImxiUZ49ZNvDIrxbEAnLAYTrDkisrNOEKICSfSKAtY0?=
 =?us-ascii?Q?pNw8QGsQnezuoh6BisjGkg+u4a9F1GDWz8I028H+XbS2WFpnbC/2AKluJl2L?=
 =?us-ascii?Q?sSWWYjrZRzXA4gsYatjfgJvfC+UkEGCpie125SX7lHHZhdfLJ5lvH+d7tRUZ?=
 =?us-ascii?Q?cSUjQbwzCWiuHBZRVPPQ3ILTt9KcamTB2fOssXyL/7uX5Qw1Akvawsc6vxPy?=
 =?us-ascii?Q?0MibFMlcbKuY/kV054c4YHrl5TGZnH8JuKcs2lzssa8RPqQmjXHc98/+KhWN?=
 =?us-ascii?Q?R4iKTFjWfc4QziUevze48IXgIGwOKs0O3xa1oZKp2g0ojVTVPxqW9QWrz9Zs?=
 =?us-ascii?Q?TiZYREjI12eCgcrAq4506IVzMjC7K4cHjc/Nhd64YmTqZjq3mgQ9MOoxKgE8?=
 =?us-ascii?Q?gXPA205B4/V0mY/8m0JVIeX1Uq0PsyjbnFXUMcmEUfSFAssZj4GhqyIfSMAy?=
 =?us-ascii?Q?g5abTMVq0ikDrPSKpItynL/L6ZlvQfNpuVa3iqTzVRkIMyiTcjqD4+A0vqow?=
 =?us-ascii?Q?yAMwoAeeLiKFY8Cq4tiEoeKr0BKN0xqLWZxsP65T8eKNC3hZf63Wwldr7qGk?=
 =?us-ascii?Q?ENpcj0nMuBhSrIDpFdlDYvs1JikOhwJ2fv7t3R7izaTTMF97fA0GLQ/DjbhB?=
 =?us-ascii?Q?8UrWLZbZKkhAUfF67c4Ub3qOGOe/tlqSUJW805f7lyZ27tve/SSQ2VGgVzHl?=
 =?us-ascii?Q?SCwJkcKOQF1sC09te0gpEyYChoMVHodtY8yLPTTtN9bIowY6E2mAUosvJ7F0?=
 =?us-ascii?Q?90BQ0UHpeuSY/N7NZpQ8+JcphBdpkUeZMT29EZmwgHTMBBMg3dKjigaSj7S4?=
 =?us-ascii?Q?uAdAfH4JO0xAXWVbxydDDAyX4dmVJZSsquYr/scqh/4OJSUtA09pRboh71rk?=
 =?us-ascii?Q?H18dKVtDAUzU08YLfJYb3k4Vizq7D0GfM9s2VlhjMKwuiy18HrFC2UIYr3pa?=
 =?us-ascii?Q?7Y4b9DOmvDYuEUd0So8mA7RRqVzAV1PMQ+l+QjmQhQxIfqbespREuM7FukBY?=
 =?us-ascii?Q?tHR+EzQrfz/xBdF/4Fy2dApGq6Ydp9i4ZwOs0KNCuMA8jlufbReqiO35WuNm?=
 =?us-ascii?Q?no8ayubdVYo3izCRm/DGnV0/QHxnMQ5xnBgHn8YV3ewUnaWe3VKkIzGgvrbz?=
 =?us-ascii?Q?CIadIoZakwXDOsrHrdVhwSsFizrnvOkgdpJEPPnNsjIaIvZ9LQjbIly3uqlN?=
 =?us-ascii?Q?7TtZcILKgq1VSJgQ7itSbCOq49RNlTaLWR0xCII7W7mAW2S3W5NOfkLp2zKQ?=
 =?us-ascii?Q?PmoYnOFCllaNNc2dP3BO8egi7m97dpdakvITD+nmTuKaLoHtC5pChN7n4zjS?=
 =?us-ascii?Q?pG7azxDWwK+IOPPbO0QcIG4ZJ48QQiWoi3Rst81LyDfcKT52e7pSNj4hMbaT?=
 =?us-ascii?Q?78riLI0WXGM//CuQz7tVR2RSW6T/SFQQQF/cc74exLiw24TnfvGM3w6S7QLX?=
 =?us-ascii?Q?DYbMTyVWk9tkB9cuB+ORL581U8ivvMI3H4hy7FptUQYgS+zm7GT4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3eeac24-e457-49af-ae0c-08de43495d7c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2025 00:05:51.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmmbiBiPFoZ8QFYRDCW/Va4xP/1jRox+FatSDXAGQCp2Zk9mBP1DTiraTFAD6fOSuq+YQ3dPnA5IQGUiNOZCQQ3seZRi30ZIFSPGyktBsz/Whfe9QzStMtk6zGgaROmW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11109

It supports inverted bitclock (= _NB_, _IB_), but has no control
for the frame polarity (= _NF, _IF). Let's tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
It changes the behavior.
It needs Acked-by or Tested-by from driver user.

v1 -> v2
	- remove _IF

sound/soc/codecs/alc5623.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index a433659fde775..c9eebb84c5958 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -678,14 +678,9 @@ static int alc5623_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
 		break;
-	case SND_SOC_DAIFMT_IB_IF:
-		iface |= ALC5623_DAI_MAIN_I2S_BCLK_POL_CTRL;
-		break;
 	case SND_SOC_DAIFMT_IB_NF:
 		iface |= ALC5623_DAI_MAIN_I2S_BCLK_POL_CTRL;
 		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.43.0

