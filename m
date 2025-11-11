Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E44713774D
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820274; cv=fail; b=ltxfZfQNQ6ZRFMPocbUkZ1PfTK9O5H1UwggqOpt1QIJ0AJxao3x2u22t5O3MgKAz71qCsaXJ7Gjzv4ePbaGxl6y4/fVqySBiTsxkJuyRQWt+O/FVHfPx2zZEHXO/1nL7HscoOWZXNPg+Sgvil00QhexN7ogB0l76CW7KCE7rp/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820274; c=relaxed/simple;
	bh=cRNraZs5HK/2O4b0Qw8NnMvr0hFe930P4Tz8b6Wr0qM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TolTtEbAhHrAHnxjdxmqSEMlWqppuEjIaatcV/wpICq24dETTjyjl7Zrm78RNPIEwfoiOr1HRGbpFq3K/DrIHHYWQSDRrIop+UOhFMPas1rDdybQ0Gd65oO3Tq/Q5eSeT7YYDD7PVWy4LuWvRTDpDetmWc1PKXEJeuVXSqYghEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=V/RoifDY; arc=fail smtp.client-ip=52.101.125.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="V/RoifDY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhTunoPXcQIPMtpkvwpYXGtgzDgJTEzaHaoltAKl0X6V/xrHJZCwOXJQ0sVfHkp1zdb/M7hhXcrx9QdMwd2Z+4kW6CQxaYRSGuvaP252UQi20iAWJrTmZrUYIk+2bxqGDaz75M4EcC53h9UKYn1Sjq1RLdxD+wVHfWY58E5B53Bk9djxZ3faFhMpPwNvJuqaiJtjzKjB63/WK1hR/P20S4h9FJcDKUm8tW0uFQnS00/H5dHmvGLa2ZY/AyXGrToQlZwLMQjzAIa8tXqfn9fQJmGH1rkFypJgfP2Dh+w8RQZmf5wLx7XQH8btS7/Gn1QBL3QA56ZRHVsEuuFjv5S0Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAbzuSQEEkbXdoYqk60Mjc9JxnV0mCeEYpm7x8Yvtsc=;
 b=LmEqbkkPTS8RPNmWZ+mzd+ig2FcL7wtQ/44LBd8IUwNH/i+LXbq7z0BqvmvSyQwAFDfrzabf4Vp2JbiZo9dYLVQvs6Mn+YT/5pMTCf87ZVUY8OcQh9HNoXZXUqOk22fTWswQ5uNUQ0HN/ak607vqUK+DMS1W4IdiaK01p+enzkj8tb1pV/VvLltc0zB4htp5aL0aN9TI+37lZ3Zyolgopyd3m9m//w1EZMnE7BmTVzTThXT7iae64B2aTgMi6XOzgVGjqac5ZWEZehFjLzHwd2md4ba6N5FybE0O1k1kiaJlrIcGzDyg1PC4hme1Tv/xd7eoV9tTyzRGwU0IzhthZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAbzuSQEEkbXdoYqk60Mjc9JxnV0mCeEYpm7x8Yvtsc=;
 b=V/RoifDY8YOR6rYTAA0dj25nPk+YMYdMWDL1ecrtnQyCw/iZAfgnDEEVZBQQMGwWpA3eCjnl6Y/IXjg/ftY2aUytVXz91GKIYz+FsziFbMkiopCdfcfEGXnXDR4CQPmO7PXDTGB3GSUFh21FqYo96cqgc27WZEJmzsx+amzKYz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:49 +0000
Message-ID: <874ir1a0cz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 006/292] ASoC: soc.h: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:48 +0000
X-ClientProxiedBy: TY4P286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c22b43-3689-4f4a-aea7-08de20b7bf07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?axhljHnICGuW9XqMNN6y3QdyBiwyrv1qr0qih2ajqZPNOIZ3ip//2YsIB3yb?=
 =?us-ascii?Q?xXkPfRxdbyV/mb1tGFoFuPRStgA5jwLwcoIXl06oqZBGKiTmMS2Ert1FJBh3?=
 =?us-ascii?Q?yOhcxfSwCzELG5ihtlJ/UfpQIdNUgDQDNLJE0IuGjba8NkWs5SUgjOzWtvjF?=
 =?us-ascii?Q?clRXesehY//0Bg4UxZbSvoOUAzKePjbrfGfxzCT8N3Y/qeJ9tQxssk+ALic+?=
 =?us-ascii?Q?UhD8oxMj3Zqp83Txf71J4rpGLVCQ9JljymDL2/0ivwG8nXUMCqew8sx+NvCb?=
 =?us-ascii?Q?E92XwIT3WCYNH4tFsNUeik5fdzVRXJlCUFvtWQh9vXHQbzeLAsnQ1ynpt8M0?=
 =?us-ascii?Q?ZDF7Lu0sikPHdIcV+ZZtHLhEuclIX97M0NxF9oufopfz0nz/Sa1KsffyO1s6?=
 =?us-ascii?Q?Rug3TIOz+eAEO6+4DGn4RKfIB/RejLPVAln+m3LI3qTa7gjvkWyCJXDXFqHr?=
 =?us-ascii?Q?ZTg4QqJdP4YpGX1JxhOiauVVD+Qw+z9pZpf9zADsv6Hqm3GS0QkmO1nfhwhK?=
 =?us-ascii?Q?kuEHz5ffALZILiNsoO+udSSf99eL4FpYW2wDK7BY9eZjimQCbzjTqFOeUbSe?=
 =?us-ascii?Q?3v02FBpX1qhpC2hinkdq92RuhBdcT2zimIuPU5yk0xZBxElpt1mDonHv2mz4?=
 =?us-ascii?Q?6gUeD0/AdCiXK7/b7tx6c0wN+KThnrSc+hQNAUNF+regye7ZIH4T4E3VFKiU?=
 =?us-ascii?Q?wK9iq53pWYQ6p4iat7LPzy1I1Ke42U4owpJsUdzh60s8DAJ+AyS1OXo9Z2+7?=
 =?us-ascii?Q?WTHiYDqoMTU1bSSJZrE119uV8V26igNB/jtNM585nnmxK0+4E32Gb15WR8/C?=
 =?us-ascii?Q?zwsnL80dZX/B9M9WrzH9phxEd5kG0SMGzP0m1Ji1xUpaVluo0c81x0ld1cYc?=
 =?us-ascii?Q?VeLkUbKZD5fY9JhrDUBDfG2tJq18zt90mYuUpJu6faU9lYY35Cxdf7BvZO4G?=
 =?us-ascii?Q?2/1Cd4l33uvcoFMVtB0b61MbOoLzSz3VIu740bP3tKasg7tl3TYYbzOs/6+e?=
 =?us-ascii?Q?VV5jvg85CERBg0KGEzqj3r/2EMLNKeMoyBCy6MkBJ7dKqFmIpLl4pfw8E04o?=
 =?us-ascii?Q?+ypB+NlyvNvSNne/BfJOSqUOE0hWNoh80FuiqUqGD1vMutSwfvjdOtKx2PMo?=
 =?us-ascii?Q?VaDBErD3bk45+qwmB/sP4WIKsVWeZseHA9pZqokPiBBMW4YXJ7RIzQ8E/Pcp?=
 =?us-ascii?Q?4hKfu+l1AVRTYhkOwIW9gI7g7wDk0idUJBx0u4NdPg9FSv6JQvn1AmDg7TGw?=
 =?us-ascii?Q?NJkQjsCXv4b58s8slCuNUbHKgrabdeH8Ionce40dGhv3TaxJdiyEwFgUTBCX?=
 =?us-ascii?Q?PFd+2uT5letAbJAqsWgB0NNDbFGpo6DT8AZTfQPoJ/l8ss1HKWe5GZ+rBKX+?=
 =?us-ascii?Q?ZgAX+unQtZ21pzes2tv8zaEanQIkl2D9mruPkUUPF9wIs+2HGXjWg6/qJONQ?=
 =?us-ascii?Q?UTxPCloKm/zOnLuZhgeGdyQuFVy6sALcp8Q2glgGdhntmcfACE4lF1AugH+4?=
 =?us-ascii?Q?Y5NKUrP2CaU0BOWFfV1jgtajrsrvqnN4j1vQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N2ES9kqL3AwrNGENXlzSKDcShf4128UxXa8ElfUGwCjAgVN3qRFXulTiaBe/?=
 =?us-ascii?Q?mypIi8mjWYsBrSZ4/3M82OXs1LB6Kok7Fe4LUvx4wwCl+sXm/uqY/u63pfOx?=
 =?us-ascii?Q?vPlLnYkkIU8oKObAigUPMEEd8TQiiFyQrLp8btZxdYuMcPVnHOXKPmxxXezC?=
 =?us-ascii?Q?Bcv7ocMQ1/dDE/wdEm5R/QRtH1tafpjpVwaw8Fzs6w72wEFk8GsvPM4f8Mz7?=
 =?us-ascii?Q?k7fVAjiufFqZ3np3VRImwM60Z2IYzfZm+jWA3blVLKblNVlDKx2ZrrURlb/e?=
 =?us-ascii?Q?j6bYeanGAusdLezE/c1BDNwv68GZzzHhMkschvxxutPDsATmuNBtLtil2A17?=
 =?us-ascii?Q?YFW4todU2KjwL3bbEVqYequBikymltaGPnXu9LANwWvmzI0OWtykwyfrAurE?=
 =?us-ascii?Q?hmehJFPfezF1MP6hDoX8rc0u1Ns6AZXAwdk8zDJBM7wqY1BnUsDVJw0e/UD5?=
 =?us-ascii?Q?9uansbzjLEGvqJzcdKybDqIVKueTSqNma4byWkZO/XCZ+OBxfoNNVfB88jDK?=
 =?us-ascii?Q?/40SK98dCVLq2sUqXhD1kA1BmBYATcUTd5/OnmQgwsJGQHaKQ1TITnj1we95?=
 =?us-ascii?Q?pX08xUTjwhOKV6If4AsPrd2szLq32KSctEaY0+MYdTiJawG6soKu3rfsjHAf?=
 =?us-ascii?Q?uLQmpiCLapaxMNn3/StvKdLtYYecafldZxfXuRDJ3XWN1dkxQaAMJSYk8lY6?=
 =?us-ascii?Q?X47tlO49P0tAycnrfctR3bx5oLG4Utykxs0yJld+szyAwiJn3yqAfKDSlewc?=
 =?us-ascii?Q?fYWHhCanEENCrf1mjlXoKvZdPM+Y3ZWywW57VKAsPlnTEt/S3BH5nDXVzwfv?=
 =?us-ascii?Q?jA3iGXdUvyE4CGAN3plj2rJMyVOdNY0la2SSl4ihlmg3lAd7bnuPOy3i/WE7?=
 =?us-ascii?Q?ZeJNvLvJoYcurhk25i30xxSr7ihpal1MDBZT4hzixLbGo2DqnoqaU6/Fz7Gi?=
 =?us-ascii?Q?S9r7jZePQjC7EszLSSfMBtIRyRt3yi8CojpvSj6g0h7uumrh3XwT1zQpsLSL?=
 =?us-ascii?Q?l18hOoEnQ12rP+uPmG+5/avu2UuaNP6YuAa3fNmMidvPAZmu/A8w2CaSvMyZ?=
 =?us-ascii?Q?DQZjZfNNAAenWLK3ZUGgtdG1GRnjDXNMqzi5JuiZPDZkqvoC1pIoxNohjLLM?=
 =?us-ascii?Q?+QfJbTIKNk5mH1Jf2j/ncOY7Rbte50dlrsVXOxu38/t0Qk2GOsUoC8IgXdCc?=
 =?us-ascii?Q?+SjZBctwRHuaoDxa0igNzMsrHL5hfdMoAkVQ6YT5kal/R+dyMbLIkWlLnvEU?=
 =?us-ascii?Q?b7p+PDxaP9e0uqEVu7Z9hsuyesYzsgx3Rqq50dkny8xGYz1RAM7429AzWzVM?=
 =?us-ascii?Q?Qb4PZ2CiPBBw5gNZMcdYpwBmhpy0Ki7bQ6JIUyOWY8fqcW6tZq0gWNosxXE0?=
 =?us-ascii?Q?65xrY2C2iOvI0+zaGPrUtIX1KoJZp5mY7wZf7hfz5TvoxGDySO5jf/aTw7pn?=
 =?us-ascii?Q?8HiQPL/aTrlhs2MG0liqi1K7CiihLTbJkBfS6K79vHkmVboMxBBBAIRt+lKK?=
 =?us-ascii?Q?kP58mjvKBuq+M9Wra+ZdhJ8MUitAbDBrM9eXZogWysiuuDN7VYSwcNL/l6Lr?=
 =?us-ascii?Q?fZxhoPeYTMjcVM6Y8ImI3lnfvFZiiNttm6IwNh8l9vyFHOJt9vzhQYIvTE6d?=
 =?us-ascii?Q?bqWSphBLWqs1EWUpZLxyQFk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c22b43-3689-4f4a-aea7-08de20b7bf07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:49.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GK94pvKrVUabjWoyLVpTK+rDyBLdwlakRNVL0FBE9+EBF4AhmbddQrh9Mywf1/Z6nDqccR95P5nmf5Hc3nwXlM7NO5WdQ/UdUj5WAQvi+3dCpTX0uG/klqShP41rr/Qg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7893

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
 include/sound/soc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 53b4129ee97a8..37dc6f6fc63f6 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1467,22 +1467,22 @@ static inline void _snd_soc_dapm_mutex_assert_held_c(struct snd_soc_card *card)
 
 static inline void _snd_soc_dapm_mutex_lock_root_d(struct snd_soc_dapm_context *dapm)
 {
-	_snd_soc_dapm_mutex_lock_root_c(dapm->card);
+	_snd_soc_dapm_mutex_lock_root_c(snd_soc_dapm_to_card(dapm));
 }
 
 static inline void _snd_soc_dapm_mutex_lock_d(struct snd_soc_dapm_context *dapm)
 {
-	_snd_soc_dapm_mutex_lock_c(dapm->card);
+	_snd_soc_dapm_mutex_lock_c(snd_soc_dapm_to_card(dapm));
 }
 
 static inline void _snd_soc_dapm_mutex_unlock_d(struct snd_soc_dapm_context *dapm)
 {
-	_snd_soc_dapm_mutex_unlock_c(dapm->card);
+	_snd_soc_dapm_mutex_unlock_c(snd_soc_dapm_to_card(dapm));
 }
 
 static inline void _snd_soc_dapm_mutex_assert_held_d(struct snd_soc_dapm_context *dapm)
 {
-	_snd_soc_dapm_mutex_assert_held_c(dapm->card);
+	_snd_soc_dapm_mutex_assert_held_c(snd_soc_dapm_to_card(dapm));
 }
 
 #define snd_soc_dapm_mutex_lock_root(x) _Generic((x),			\
-- 
2.43.0

