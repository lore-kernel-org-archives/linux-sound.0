Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3717021D590
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772692377; cv=fail; b=pYzqHo+egmKa0wBLLQIO4pSta4GmsDeI/yU1f9Xlpmi9ecTpSk4EjQwtAGCWsGLW6FdSQ5gN+MgmPaODmu9rm+m2AbN5rzFzW9pVNwPLIRskq9eB9eiBB/s+tGryq8sWmdV+3csbBVOraqtHfj4lF55iaJ4uPdzQfb6B73xL9Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772692377; c=relaxed/simple;
	bh=iYQBLDKnmgwzAMvxUIYdA3xIRnYoGbGzhUGS+eEf6rU=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=XbOL6Khxp0vRq3/5Eq6QMfc2HjKtG+E1sVwgjG5Eh6FsRaDdgkVXu09Dw3EQdDBhC/rl0iapxbqD8gaU/L11i/xq0irHN9CYhOXtj9U0ucCkiKM7dIE8jHhXxVBjjjmhTjQANrVSL8APM4VQqBNWJXg0nneUR9PPMVPXqPKpNb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cnsSsL3h; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cnsSsL3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLSr4uVku56Vv/6UHWuX791VjtJrAOzOSJKVq2J/7Q1PyAF3InZCOG80iQy8q5pz43jonu+Ws8QY4XN56ntFgA5Zb3dPEni1KO1m7HkkxCZp0Iv1eLd3Y4xFfBtAweepzK3VdipAJNYlCQ/nUY4MW61Tn0gY1um5LnhlPPQSBkfhE0MsCN1MO7vP2YMOSasns802BcFMmlOP9d5Mu0tmpYVuz0l4w0YbDHb6WuKbspQyqi0ggmWkIKINCTlgISdvR0Lzr3qlZgwhlGNmOpI3TsBtAThrBPuqLWsqYACm4S99WdoCEyORmvDJ9zfQxBMHLN7FDLvi/qVoyEoQREf+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xts7mhVFr/ROtZPD3nZ6OXYFvgvKFjxlpHSfr+ZxYso=;
 b=hjVodWdQcJvtzzqGAQnfGxBMzdGuSatu79K0sCNFctn5tyYhNDgv1MDBw/xmrU6aFPWOLAlPKNyxmPC71bAAsRzR/57KKc2YlPWTxBr+6Yf8QhQeaVjbw0GWwY6cYdTiyqT6XOTJxZ30PGIEnCZ/fq+UQehGbcYvIiXxVmzUv30VR9e1P4beeIoM+XeVZjsjKTLrzMrMlyuGNGNfF/q35HG7ZHJ+XfobnH54b/naku5hm3mxRVbxoJyBrbSC01ZHjpdhALW2JaQBPghAT+CIVS5GBsJ0/5sl5V4JIEc1ANCzXzeCcIM5gzMirGdG0hlpSCS2bsCMQHSfmbwFYvVZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xts7mhVFr/ROtZPD3nZ6OXYFvgvKFjxlpHSfr+ZxYso=;
 b=cnsSsL3hI4aoV4yUocD2LfzoNhRmAjm6MB5qNZwnL9ynl5N2eoE+xqb8q5WnND6+7vFw1rzGqj8dAe1KE/5hu7MDTQXF1adHBXioxyhrhpeol+ztLoA+9pXG3BTXkOB2IiwW8z9qRrLJ3uK7aB6r19KjnBc70qwKz3uHr0qMq8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by TYVPR01MB10796.jpnprd01.prod.outlook.com (2603:1096:400:2ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 06:32:52 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 06:32:52 +0000
Message-ID: <878qc64wh9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-component: add missing #ifdef CONFIG_DEBUG_FS
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Mar 2026 06:32:51 +0000
X-ClientProxiedBy: OS7P286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26c::16) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|TYVPR01MB10796:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a75509d-42c2-4b7e-d053-08de7a8106df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	n/Ak6L2m4m2YHm5bJPgo8dPaPFV6kJ36VdfTXtrQ1fCP/v5hCBvR652JlYuZ5FxAq4PTTE6Uyg7bAnz+MUs91t9kh5na2up9WZ/JRgEZz1kZxAWKqAQUeX+S6LP4Pz3kNCL2UvGWFkrQ1OOHdzq2fLJgjndiWnkTPUWCylq9D6ex2mOPZE/lisQLiRuqaDLnV1wNUaV/53dWSbhR4Qvaa7VG7S6dOs6jp+oAbCQokxJB/atewimG/PeSCCGOtxZIPALNRkyulBS1lBr/fOJTPcvEYxAXi/bPuTWRwCPzbryZfeiQoVuULKsqUa/QZTdb4rWk83ikV+mszrb3rdeeCA2l27+eF/9ZUnnTLQ3vZitJgIqFfHa2dlqyOzlKrAYlO1L8vjepYh5xZE9uiLUMmK/a7mC2JCjd8ZaYx1WQsh2jbJHGJf4Qh2/TtopDoe/axlhl2PzJnerZhls+3a8Um3+08C3Q0W/cI3HS4SedouFM1M1JsgTjZGwRzdZpMPLYI5GT3HXp1xw9DL9YcL2Ig7aBhNBjOptQZla1x39s4kxZxhWQVlcbsudR23b3Z2k16ty5NhpCEeDZLEjXniQboktwMdlz+1QIpal/r4GDBel0ZfiB13HEzE2bIo3oql5XloZpcMakrPXdZDj669jHcsSLLdGlQP5hMUvt3ix77w8KwvESSE2rKvv+cy0Kw/cNATEXqDIqkMoYXUj/Z5qxt2vSsLOivARpk2cq8wqzXGV6Oe6lj60fwHYObZbUwI53QPi1wIs9Zkd0zC+f4kEJpsmJCTlhbP4J1XPitv0daac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vcb32fK55AnD6Fmul7NEWdCbxsvEJnrnIl8vniKTjISaIsFGIEAkWrVNaGgY?=
 =?us-ascii?Q?nJR+EA7UdGp6GW16mLcNKYW7I/N95N+k63l+SAFjIcbP4b9gWTubZLLyMPrU?=
 =?us-ascii?Q?Ty5F/7pAFcjXD5m2sHuciHud3e2WIavkHu5+wFfwxru3MzbJfYzPULk6R/Vd?=
 =?us-ascii?Q?yo9SBVBtKkxaLHrp34VsI5z8R82smYpwaQTVeJZZF1NM6E1EHyJKbhEBkXvG?=
 =?us-ascii?Q?XstGT/D7Ei1Jf6ag0P2AXQtWVpgGh+odGpRdjg/ca13e0dw2xA6Q2YS99b6I?=
 =?us-ascii?Q?bXnx/mTvz37HrDJmnWgYP0yoqveeRA2jBhIegHzibXdNucnjZLZXJLcsDIaU?=
 =?us-ascii?Q?1U0n+3OSl2JRBT/Hay/otKBj+GfnK3GuiqxGoeO8++102z6BLzP/H5mSG6Nz?=
 =?us-ascii?Q?9mKVOvrRCFDqw0Cr+fg39TXY33n9/QIHE5FJrQvzQ9IX51qd19pA8Z2GRa7B?=
 =?us-ascii?Q?WAv+qWhjaCLG22jZ0FFRSX1j8uvMpQns20Q+z87A3KG8dq2brBVXWuKLXpQ8?=
 =?us-ascii?Q?OoR1JPoKm82/FbaxZnre+Zn+SntPdbGJ2J7+NZmKeuJ6MhaYOUM2F2Na/sKp?=
 =?us-ascii?Q?NHsrnaFjhiIT4lwFF9LUd+zWhFM2+cmf2bGZS8APXaS6xp0ONRx0F2ftQ/gW?=
 =?us-ascii?Q?DyTb6/HAKW/gKSkgUdd0qZRBMhH/h5yYi7vXtp7kmaFAh+TVQp7IrCSNCqrz?=
 =?us-ascii?Q?IMy5vKsia6g6OoZlAqjDgqEt4gBdTNIg4DmOsMuznSzczs/tpbMusYiAOvq/?=
 =?us-ascii?Q?lCQubM6pcL6Z2AjBuSYM1tBti1PL57mWya778ojdA2N+j0lOHHQh0xyfZSp1?=
 =?us-ascii?Q?P7rWqCtLUhJDjep9yStw8rpU9ksH+14gT3YZGs6vZmSxRDPTvgGir2yuhYUf?=
 =?us-ascii?Q?sm5ehYeChjU327GnZNBXHea9mWS/f7y2+a6Y4sAYCrsMUtXSrqSvF6rHc3wB?=
 =?us-ascii?Q?+o+Z5HZOAVS3pHmwen0KxnFTAXAkE/vmrRDsYGghr9IqUV8PwAlZqI9pe3wD?=
 =?us-ascii?Q?1SXkMXScqiShilDv6Au450CA0kzJ33UM4GvMonXbvaiXwjnvUcuKoe6siCRJ?=
 =?us-ascii?Q?rEr8dn1sEI/TeNl7g7adPndC3qH6kRCdChnYZ1XwKadJBjZS+6nCbTlRmhwK?=
 =?us-ascii?Q?hiZLR1sKQYxfhSMewOcxLZJZDWDyxuMMhqP5IBHV1D71WYtUj9ggUHo2OM87?=
 =?us-ascii?Q?J8ipJEcYY1E7Qozs3bVe2aRQ5QkciWg6zQsMF/rkRRwWyeVH31vhVWUgdVGT?=
 =?us-ascii?Q?u2jX3AhJHudoIp3cckVA+Pd7nkPpq0BSl14MQ6/+1GsZT+qPgg8o6M/1B2jQ?=
 =?us-ascii?Q?IUk4OiXBV+/yX3Otf33dngCFS8Dx8B5ByouFsVtToSOEDAgRpUvbHQXxfWag?=
 =?us-ascii?Q?xPGHoG3vYtZ0jNkDKL51gj5+Glbax3VpweIHRmV7AAyLITY1eoASmw4dfeZr?=
 =?us-ascii?Q?Iggy3QdwepI/3nelkz2KWZjPrq+TDxno1DSstvvipGZkj57zK253nIn3lYPg?=
 =?us-ascii?Q?vBC5qIIejdO72JAl2x6L2DckOeDk3h1VeEJpvA7pqp1bDluBVZSmKqyH+Zmy?=
 =?us-ascii?Q?T0ZWVXUK5bycQEJ5W6+MByem6pvlC5LHKI8AXk6GQvMjJqv+OD1XzGMP4Klp?=
 =?us-ascii?Q?8/xZ+05JX74PHM2iA3SUwBJ6/9xMSAsUIndf1NBwh6cNM5J3ov7V+LoQEfqz?=
 =?us-ascii?Q?DrYKGYC+Han0HXz2YQbhYB/6Z3NBeqiaDlClZHfJfbmQnbFPvDXi1onWRT2o?=
 =?us-ascii?Q?QQ3ue8zOz5nHem5app0NTBe0lxRYTjORbydBKcPZktcMH5xcv7BQ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a75509d-42c2-4b7e-d053-08de7a8106df
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 06:32:51.9722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpzJM5m0p9VANiYWgReXPCs/32ZgmjtCia8JLhYq8e4EW+NAXfYszJnQRColz8SgdETjWh7CS+eHo+isQek9kmCntlnRfTMT6sgMb9oj7LfPL9QL3o0B7MDec0N8c5Bz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10796

Many code cares whether it has CONFIG_DEBUG_FS (X) or not to access
component->debugfs_prefix (A) / component->debugfs_root (B).

(X)	#ifdef CONFIG_DEBUG_FS
	...
	static void soc_init_component_debugfs()
	{
		...
(A)		if (component->debugfs_prefix) {
			...
		} else {
(B)			component->debugfs_root = ...
		}
		...
	}
	...
(X)	#endif /* CONFIG_DEBUG_FS */

	int snd_soc_component_initialize(...)
	{
		...
(X)		#ifdef CONFIG_DEBUG_FS
		if (!component->debugfs_prefix)
(A)			component->debugfs_prefix = driver->debugfs_prefix;
		#endif				    (T)
		...
	}

struct snd_soc_component_driver (T) also cares CONFIG_DEBUG_FS (X).

(T)	struct snd_soc_component_driver {
		...
(X)		#ifdef CONFIG_DEBUG_FS
(A)		const char *debugfs_prefix;
(X)		#endif
	};

But, struct snd_soc_component itself doesn't care about
CONFIG_DEBUG_FS (X).

	struct snd_soc_component {
		...
(A)		struct dentry *debugfs_root;
(B)		const char *debugfs_prefix;
	};

This is strange. add CONFIG_DEBUG_FS.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 2a2b74b24a609..74f3ad640bdcc 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -250,8 +250,10 @@ struct snd_soc_component {
 	struct snd_compr_stream  *mark_compr_open;
 	void *mark_pm;
 
+#ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_root;
 	const char *debugfs_prefix;
+#endif
 };
 
 #define for_each_component_dais(component, dai)\
-- 
2.43.0

