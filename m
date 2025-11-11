Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013DB1531E8
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820461; cv=fail; b=IJzawXeEOAZD8njmRwKYUp9uQudaF8kdYC7cmrk/UiBbcrhNnalfboCoImsdSF8tZxKupPC6ZH4TaE14OiYCBbz97uUnxcCCFrqbGi7AoPq3M9jjgJCpl4oflvCKzjYTH3iuqwNKNNv5rMCIpiu9xS6tz0NcizH29gtbF+W7jXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820461; c=relaxed/simple;
	bh=EpUervnMRppJDDmNh2xlO9MZI2JU1JjijuxR6+iwTMI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fApNRRqom5t7buJIU33R4j8QDwsTtBlr4HU2yZ+OjoRGfGKU9Syc072CFrWD0yPSazlrtg2xpGjwrvg18K6bdlTs1FDiRokhMUh3INdJsJcSyp5U7Wy5q9LAO9yn7stWiQYMOl8eH9sHPXXrVgwzg4D4u/MJ7sib16PfpGWU2fM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AkFXoGvX; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AkFXoGvX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8UheiWJw3zmb47hOJyqX47DeY3+Kypz71qgZXJ4gvRk/EDOD8VIc/3Y45MZOHg3nJ9QM4UpDZk534AfjWIuFs4bI3XTCwGqVP1qyyORFP4R6X4ODwQZ8/vANPMTt1CHUqqXOZIdUWuydf4CTDhOiF7glADWgM7eb+Lv1sru5gd7oUbfI21CSwNRNGIMofIzw73uh5Gsz8EoUQQjL4V6qUmsI7Eu96wQEiN0HLibf9aRNxVs/vU0+XOSsLP9DV/nPSXZbFTRMExDCpBX7z0kyifcXsbm3H6MXbUNIsNUP52uI/1MP42nOKJPc315CWUU8sH/xW7dkw0YxCTg4pgM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH25XCoy0OufHGOiCeP9C0ZL1vnhTC6VSTLhTYDaKAE=;
 b=ZVvqQs0YTiPFwi4r4BEdpYiSbEL0Qd5RZ92GiJB3pDakDtNBiPvJaeJF5ZWsxMTj4MLLJAAHrbExO1/pxbLJAMx+56xw/NcUf8lkLnWWFNUUXY2wQxjfdm+d3U4uQSZMeD0Or7j8Q5RPwhqGTURlKRpkyLxHjkLhehJVe/DhOI31LeduEw5Yw4dZytcm346t281NRgeO624ORfmIPvfpUGcjme2oAUeMmSh8TXMag0fvS8fn8PRqNPf08NzfdsqJVZawBXUCR8n4pIx6fifYFv9Zu+kO5abJgTjLq0pY+yTLvqlG19qGsQUU4dATvsqHF3qUz4qFUreIKvzpHL64Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KH25XCoy0OufHGOiCeP9C0ZL1vnhTC6VSTLhTYDaKAE=;
 b=AkFXoGvXfpuHaA2seyFJwsMj8dBt20whvC8O4pRWvivIQ0cbKnQfaKVKi2ZNcmDRJTxhCvUsWEu6HkXALG6oKMiVwDwSADZUeqqUbhoqOla5xhwR180nhze1xXKHEzp6oddswnteA6nWXtQDbLYQu3Oxw30BJgFhu5ZTKlM8GSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:59 +0000
Message-ID: <87ms4t772t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 042/292] ASoC: codecs: cs42xx8: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:58 +0000
X-ClientProxiedBy: TY4P301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b67fa6-9ca1-4f3a-15cf-08de20b83041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dX+UAtE8sYsAuKX0qnlO4l7YQjUfZ6UGDaojWXHztv1rQxdmvUXtKdmC8cR4?=
 =?us-ascii?Q?ChHZL+Za5ADyJojaOJbd+MCKT1sNWk3HYtCoWftupAxC+lQeUiNFissde4rs?=
 =?us-ascii?Q?ECvN/zO0ZFWG7loNG/NfS5mn6XKH45q1PjrtWsvt34qhUbcWY3oAlzusNYCn?=
 =?us-ascii?Q?Cp+ik7HubtyktMYywnUCtigH5Wkc6x4fZPBPRwT3Fa7MyvuNxMSbSgEIa3ar?=
 =?us-ascii?Q?AQpPHF3kS7eTHkJBNdiuaKmoltBglRHRRGO11OvXiRSeJypGyirkcyUClsrk?=
 =?us-ascii?Q?S8LTFDxidOjptrOkpS39EgHElzNZqoJ/2hnJt4s7AIJH61CwxYN3si4l5SK9?=
 =?us-ascii?Q?cEM0dYuu6pTtV5dLZkf5EUxFcsIUBGcllQvyi/KyB/knVc7HkmO6gC4YiwdN?=
 =?us-ascii?Q?kO7tB6tBHi5XHzmhzyKWqjSA6vAzYJu+bNWADT6slhpCx/URZQhzlgQW8n/k?=
 =?us-ascii?Q?D1EPq7nZBu4HnqjDahL921luvMG+PP1Ewe55edy1IAu7f+LIxqxp5/D6URDN?=
 =?us-ascii?Q?O4kmGI45WTP9PIeik9JzZkZpUvqlCyuFcYgJ5+z7YgSFcutSurb8F2dVx2dF?=
 =?us-ascii?Q?8ISIHYTU4ssG3O0v2I/OnfQOLr2MpGGDShk9Bm7LKik9up9DK5L+9zPp2wiT?=
 =?us-ascii?Q?W8mKZDPsOJzMPnuYCuto6yY7gHWLC85bxeLxutbiHbjnTQNF9hk9dnxp3EeT?=
 =?us-ascii?Q?dZeFuth3B1Kf/Db8ITRCk9n+2Mmn+YP4Z/qL4g/MXa6Z5q4ltm8xLFbNu15K?=
 =?us-ascii?Q?FX5qVlFiQVrHbY/pNTkZ2WQdH84Tj2oVp6xtWfk2XGet3JVbV4yZyglZDz+m?=
 =?us-ascii?Q?YR1DU6F1aK6Ip5MEraONNvynYOwyAUuEErpgXpqeKvZDPUJADHuMw/WOUpDm?=
 =?us-ascii?Q?fRkMa3fxBPuZa3aczPuJ82soaAArMJ3OUeSkbI6qBHAS22ADFN6GIUtBAjA2?=
 =?us-ascii?Q?Wv/XA4Wmcy6uH4d1xjhOFjjM2f1tfk3q17X7GnWdzjsYkT3ugsuKjBlWeGWZ?=
 =?us-ascii?Q?Vd9v3KsozKPw+SEfsW0SwmvCO5ffIcN/zKEDwOgTrxKw7vdKYYt65ozel61X?=
 =?us-ascii?Q?/D6GQXfRJKBw6O2BLwkNAUNh9JKH9oAWvVYwyIEvXiY8MJrN73lwxbgI0plc?=
 =?us-ascii?Q?FqCoiDrdOOhvK7Dhs+dW3aAcPKo1rWL9cba8EKH7HlwY+m96aS9jMNzAFbUC?=
 =?us-ascii?Q?bxze5rWt55H0xcYS3DCCU1irEvsma5ICf7H56f8VGGy17EBhPzcba+InkO7l?=
 =?us-ascii?Q?2ae0QoJkybKEyWk6DyQ8O3vghrAkcgdLADuzD9oRUXNy/R5j8OMF7WcECVc6?=
 =?us-ascii?Q?fV7V23DM3CZSpQFsbSprXmhA2zXjkSV9RzZWdCAocd0qctXX0SrQJZe5a2V/?=
 =?us-ascii?Q?blhy6xvNIxDTUDWrp830AN519Noup4JKzZwYtn75LVxs91MMprJFK5a+E5V9?=
 =?us-ascii?Q?8Qdk0xsE0txWyGlMqBvz3wwWHPpoFOgBz3eUzDcjd9S+E30pz/se8wjJZomR?=
 =?us-ascii?Q?RfcmL1dmJ6LMbRFCwyZ+1zHvVIVTMRoBE8J5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g/FPyWRYtVcArs0l1Ro/+yyb/Xc5YGk/p+TfUyGytiD+d9WyzReCGfkiurDQ?=
 =?us-ascii?Q?2aA3WF3mzMoaejRM47KqcDTogpJJQs93KwG7TFYtzmZCUgYJI6hUHYWAMpaf?=
 =?us-ascii?Q?mjysKn2ukdFA7V2SK+Ndxg25hREeIGfw9nNl6ZVOZE6JUVBybGxpK/h2jCbI?=
 =?us-ascii?Q?B9uTuXqaw56tydlie9C+gWbSOhTqbmcm5Of8yPFDXN2uVjPMPcamK0sp76oM?=
 =?us-ascii?Q?R3p0j8rQ5skI2qhADT/neJAAAz6AxHonosQ5t1D2pvKnQJHTazyW4vriFASe?=
 =?us-ascii?Q?1PwH37fjtOY+VNQ37nbTnd3uT4MjnVAukQfQQN16vgBvGewnbq+wDbt7IXoP?=
 =?us-ascii?Q?O+t3Gxgllotj8CMWzWsWvk+LAMesCj5ZiSnrwi7aiL4CPFI8Ts/Sr1R8xjGo?=
 =?us-ascii?Q?IELDZOVxsd2Wj8xGDAa2F7MQfTZCCFeqPfh+8c63SZBNjZV5HrVeobcmgclL?=
 =?us-ascii?Q?IcK+u0MzVnrebMLJV+rzAX1CiUBQoWdK3i5ZNL5HeSCudf4pElRHP4E3Qehm?=
 =?us-ascii?Q?qQgbNfLuflIvM0TKjXMVo+cA7sfNmNjkNXGTXcmHvGAjjPuLqUhqHe2xeTSQ?=
 =?us-ascii?Q?+LomdShP+E+c+pNHu5qdaxKKwvoBQMUoyBtdSY1XPIzq3is16i7qlQ6nWglZ?=
 =?us-ascii?Q?0StGXjx1P707oUuuAgJClVwQcSouL6+wW6YWZljpUDdxCFtpnDt6JSPuMvpd?=
 =?us-ascii?Q?HDPfpR0QWvHdG3j7xUjzl3gkB5Gojgzw6wC5zFERfw3ttzexGGWUQiGD7d0/?=
 =?us-ascii?Q?hitAzU3vpp0dw9FpbyU9u/mQ6uKHghbnqEZXMpy7QQOPNy1UsobXgnVEyd2k?=
 =?us-ascii?Q?VRCX2yRl44LemevyLR+4cGAyDmH5byLWv7H9zwN060Q6QFMVOom+D1Ig3Xec?=
 =?us-ascii?Q?/7IA5i1N0NPH4tOjLgghF/XePxOrPvf4WQUUJ0RScK/vlN3YB/MeEucMV64t?=
 =?us-ascii?Q?4RjnusawUMwiQRUWusXVDu6rQOva/kAYLFFN7fyBiSAwj3xlJMeBwWSPDBmR?=
 =?us-ascii?Q?NB09uhYE1M6ZRlKGVWGf1Uan97JGnybqpF0Ho19m1jEpwFNPqWB1WOso768r?=
 =?us-ascii?Q?kYSrYbAoR/nxRo0l+haTUBmzOIWllrXFQAA1dvvpLCp816qd7ZYjTxmVNYNz?=
 =?us-ascii?Q?lhJDFUBJY+foL2pP7ztGVBWAmGjBfN6KhDTPzHat3L2EpuepJIu8dwAi5pLm?=
 =?us-ascii?Q?uqSJz0BlzTjC4w8CAm3rSpeLDP85oaOUYG8Ad6KXDvQ4yJBnhI04XKC5BBjE?=
 =?us-ascii?Q?y99dTJAEYUuG8MIVviuTbRtSH80++1/LncU1MIhX6fG3i1wwv75h/xHvTLhx?=
 =?us-ascii?Q?E2E6IiJyrFZvi+xnTdyhGwKvCLHCGQcnEcc0+cKUSoZlV/s+uu28ULsEn5dN?=
 =?us-ascii?Q?XvGQvF4EOAXqfYR4NgrN/9kIYnGUZKXElFWpLFQJyo8kcxBvYz0WN9xz6ryn?=
 =?us-ascii?Q?X3xoA8t2DDG4xOinvkPc4aIH+XCAnCNsePpPShh5cb0wD+W1STkwE1WblEU1?=
 =?us-ascii?Q?qQ0dKgZkmr1Nihkv7SE9mogtKK9Zu6NfZ43MjUDzOFlQlzVfiDltSmoofPTQ?=
 =?us-ascii?Q?FbURded48HP8lYQL5dblOGxIqg5DUW/DF26B4wUDR8SRe90B4dAh08Rtqj1E?=
 =?us-ascii?Q?Ee58Dwn16rCyA7GaLPkqlZw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b67fa6-9ca1-4f3a-15cf-08de20b83041
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:59.0175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V4+6/4cN5VkYblMiziGFMUT3D60Pr+WK78JdGV0f6+H8WIurHsAu1s87/iqTxTEaUU5nA9yJYGZ92G6HPut3DJ1JVIDcX7P/CNQDUQOMctj5zo0vEgJ+gEsBgL4nrK+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs42xx8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 6a925f3f7137d..d14538c49b976 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -465,7 +465,7 @@ EXPORT_SYMBOL_GPL(cs42xx8_regmap_config);
 static int cs42xx8_component_probe(struct snd_soc_component *component)
 {
 	struct cs42xx8_priv *cs42xx8 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (cs42xx8->drvdata->num_adcs) {
 	case 3:
-- 
2.43.0

