Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010059.outbound.protection.outlook.com [52.101.228.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1A41EB5E5
	for <linux-sound@vger.kernel.org>; Fri, 13 Jun 2025 05:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793424; cv=fail; b=lNtgef5MG9tGMV0M8+/gaENJ21qW3SD/4N95ffErDFLQAydqVhHuOO5O1SbCCEEpEv2jfC0qKVfooGB2MEynP4mtx9S6RAKR8NcTxIWyZ6NQNEfj4SFKcmP11USwmX2sG92c8ZMTUCOHvo8fnQZyplQgTwIfay9gwCe0idtZt4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793424; c=relaxed/simple;
	bh=tNDhrcc8WRMtQYg7d3GaHjZgki8h+A4vj1AhyModoBA=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=ER08olLse5+eVxZyaVoYlc2sG4OAQTngI48lUJya3XZEIlJfrKSoIp+m8EfRmscNfqx+BUXphdzT6kr49y4llvWysEP14edRB7Job8D2W51BZkgzg2XUbXT9nED0yqF86CG1NrW+qF+S/JxsFw21O8RhZPb5tS3TqktC7IIdqCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b+Ehv5LS; arc=fail smtp.client-ip=52.101.228.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b+Ehv5LS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eepFMRIK8EzGCOrX6MfDrI3OJPvQbzcrkOjg/oYUEOfKAMlUTitVsWXV6h7rT0WLNcsrS2O1BOpFR9cFsLP2pnT8Yyl0l4D1Pnwc40u+TlFVJappjJ3VMvreWVtD8s0Xp0fmMBgBfIQglNZgbC3JyCcvAdDheFM/gIaOQTF57lYUep3M5CJFq1/qDjaRtyG5ILs5kj08AOonYcjmkshdW6ye97YGszNJixdy65dEzqQxMS/1vfIcB6Eh/Rkf8MzGDVdY+4RVbKtZk6jSyIBdIs7FmUi0A3VMK9y9EBh/GKmiQG8sqyr9k7p2TNsbc2ZE/3i62QxED98SrZiLnucYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfl26KZELySu7ngRHHpSb7HzHml45/IWF3ZRUUZqr5k=;
 b=n4Sgx/bdm2Cp9KvH2iZISu2SxxOQ6g4eWlbdiG0kZprKO2CzuOWu3lrYGqxIiB4oCB9HLObS+4K3uYlZuyRhSpbr9Lb4I0p5h/g4Ks8OcClr3OxLrlVObkG+VH7fLvL0S63Qd9wnzv7YPasTH6wcdq93nt1KeT/J0abzlrQXE0RvOhdA6lkqvb7eBQwauEspJSkhoI9WOfsweZm5MPCN7TZw4gC3exPGA+Usvh4zGWqe0l3MVaKAOCfHJcyTsNf4F4AlJ0F4Z9lqng7+AK9P21Q6Zp9zsHeyUemzfX5jCab8yzv/U7MWzzT+RgdOYlo2gVMPXnTtZ9vC4YdbT+0YbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfl26KZELySu7ngRHHpSb7HzHml45/IWF3ZRUUZqr5k=;
 b=b+Ehv5LS0bWJb7kO5TEthcfYNbjGhoyeNF6dP7YwR+s24uQwYx0s28iPIM3HjsDmOXxo7wH4kZU9WjweiMFRbugL5bkj9jwZ8r24WmAytRL0Ydst0L3ZaqCTFcyZlUa9tYsxli9JGYcaimQjnRGDvAmG86qVikVFV3LTUZLvF6Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9825.jpnprd01.prod.outlook.com
 (2603:1096:400:228::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Fri, 13 Jun
 2025 05:43:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.019; Fri, 13 Jun 2025
 05:43:39 +0000
Message-ID: <87v7p08ad1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-ops-test: dynamically allocate struct snd_ctl_elem_value
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Jun 2025 05:43:38 +0000
X-ClientProxiedBy: TYCP286CA0323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: e3000e04-a6c2-40f4-261b-08ddaa3d3f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cVNZ51wHuObVdZklI8ceAevfILNshfJA/Cw1BR2rHBC7UrEaZf0fDlkfRyh3?=
 =?us-ascii?Q?KSN/dmQGD+vI0qIJgFr7f46uftwWlphA53PMpgRQ0hAASSHe2pLygKMnSh0v?=
 =?us-ascii?Q?kzJ0uaJi/4D5ZAuzjDJeODNRqSCOCOMlLlkY9sPMMJ9R1cEaQxtEV8iWHP+M?=
 =?us-ascii?Q?HONfG/94I9aaSDhEtEvlDdrlQDE6JkeIfcALBPysQFXGbj7F9TUyIgFBEBtA?=
 =?us-ascii?Q?f6FbZS8vgQ/9Gxij56IzUrCoCkrIKZF5BCXc8E5qXJQbxBYi03YNzDLPJNpl?=
 =?us-ascii?Q?nWl0JAf+2skpLNzIjgGFIk0jrsO+lQFsOt0L0472Kpr8DLkaeBu5RroKMX5m?=
 =?us-ascii?Q?a9U5qpLWV/duFWViAjQYknx8707Y3NcgwBF7FVOVm2xHBSTBKgIW6GHmLY01?=
 =?us-ascii?Q?FNE71hch1ZmICc987OvDnH8BRoLFrxnBQ3GyHsCnHZVd+QKNe8YCAstCrXmk?=
 =?us-ascii?Q?GXmZgwZtfD3Ihyv6EYSX9jYhpmQznYQ9db19YS4tkdxl1+H9oFISLMGRJmzr?=
 =?us-ascii?Q?UUI7l3TXp36V1B7s/92xxN2sijWLxhucbNnpQzfIKwJRBkf8DZbN1slulvur?=
 =?us-ascii?Q?AeUcJbRAS4h6bhxPgK72DfjBPH8O2/FHVQzaGsJ21BdUhJzU3p7JqMUWTGiA?=
 =?us-ascii?Q?vtGuePDKOj7BVB/6rYdPP7rfjoQSetGYcJiYDxCnF4B87R0+nT2G4yNektPr?=
 =?us-ascii?Q?GQ2xoSHuP8QzTf1WfpGlWil4INzCLFtIdzro8rec05xKV9INDAQ5As9BvKfj?=
 =?us-ascii?Q?/ID8RfYccUE9Z5bF8d5cwdlDIGQAa8YxEhZPHQzq9ltYzvID4aXlPQp1Mk+i?=
 =?us-ascii?Q?VsFR/1iHnIVItETlbhL0PTk2RoekDgbkNu9TC8tjpEkgijNQjBrd+5H5ZIJI?=
 =?us-ascii?Q?N+Mq198CElHHtfRBjXNJx7U4Xl02R1MAlnwQs1m0CwJQ8/ACrL906W8EOBPE?=
 =?us-ascii?Q?eJPZbIE2ubN9mueoUX4pIjW9GPXCMNcKkThDt/oHWkrT7HpAq3p1Tdf43NhZ?=
 =?us-ascii?Q?KyQb3LSnZQ8MoDGAd3IH0YBjj2QSF+bFoaWD8C0cBW4nKrL1zOqhJrPZHvff?=
 =?us-ascii?Q?V240AkXcgDwcvWIK8B95Cydbqith4XVLiQJ5YilXn+T3bupCim9hjI2UKMvv?=
 =?us-ascii?Q?2pqC4NQiKJB8exiKZv2Xkwk9tiVtH1I1NIjZrGW33/FMBv16+UZaiKgwE/U0?=
 =?us-ascii?Q?ydYuSHhu44kLjz57Qi7Te+ltm6cZ7aJuP+JNuGpHJtzvmHfKrqaS5Giq1ePT?=
 =?us-ascii?Q?rjvjMViMHQh7D5PtRfku3ZWaAh5qIFbutWL9kVHm5d9dwqoixsYQ+FV7Axm0?=
 =?us-ascii?Q?Db7LTcWxEDieGcQIUWt/P8HlGAWNZevl4lpP98KfH7TFVjGztR7bg5lKx7pf?=
 =?us-ascii?Q?G2E32ADuCUSqEyec97yh4vszvk1Mgp41wEb0mgsGz4SDfoFknj9GOxoLfghS?=
 =?us-ascii?Q?ca/J8PZm3uH+NvB4nA3eOjc+Qtskhh/m9L3A0KWfOf525LRGT1FTqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AQp/Y7OyFvEeh8ZVl/ByweafTVtB5zrqdW9qny2lKlO5Up5Kcs5lxaIMcLpr?=
 =?us-ascii?Q?/pirOl16gzRzaUhZnivu09n/FIfBlbFrusc0+12DjTkS+z2TRquBtx4OpG8v?=
 =?us-ascii?Q?NhcDx5KdFprDjzGsayZjKm57THONGwxANwtndI5oo3KR7qMxv9CYzQtrNLr8?=
 =?us-ascii?Q?bLouY2+/q0op3rqck34xHYqROrNiMzAAadYO5UcGfnYHGQz906bGd9GDV0dQ?=
 =?us-ascii?Q?oEXX+AhQ3PB/WXFxSHKe9maUdAoNXgoo8Hy/seEjOBepB9hV/4FLFwhRufEL?=
 =?us-ascii?Q?vtpc1TbKShZR7T5Tqj5r2uTx+qxUkQJ7qERpzTGyXGCkLdKHXVSoL0G1AM/G?=
 =?us-ascii?Q?Op2ikm00U0sZS49wUWSW35n/qghzR4hC9fcM7x9q/jyy+fbk7yZc8Db8NJDl?=
 =?us-ascii?Q?27cbAvbYFs5LfkHzvFU8DdBzaj1ec9NKydWXyM9HuNR41zHpP3qqpwhkeRY1?=
 =?us-ascii?Q?ZHbv+D9gFx/MqSPlMb5U8nb6hldbkAkmLOEkrmmNQBm+oxTZHAyavewzGap+?=
 =?us-ascii?Q?BtKoONawvhYUi2J+6FaYFN/dNgw5QuJybdK/vBgJEui4wePkUiPDrQOXO79L?=
 =?us-ascii?Q?DPos6fPrSeTi/1nlA6pBDG6z8slGjg8hefNrpqh1OSByfnldYxRfRi6W694B?=
 =?us-ascii?Q?nS2WnmkgB6MLzRBp1/BsRV+HrjXZ1Nhyt3fBvKk7EcxN31/LPUvyneFTpIZh?=
 =?us-ascii?Q?ZBHmyRL+RwzCR5WMnNOP5I4a+KoaHnLqWsxfPD29fVnxV2uZmNrkNC5LXoYG?=
 =?us-ascii?Q?Q8hofeC3sy3VbOAWNcRlBzpaHizw9ad1o4+rbhdwmiol1e1Xp8ApkHXe3q4w?=
 =?us-ascii?Q?ZMVIK+PVK6qNo5XKk6BQACFYvlvRuon3xj6I9ruoRkUvWAOVZSVRJ419+ee9?=
 =?us-ascii?Q?1jgiXtM0TA5mErOjUGkqeKc5d20io+Hux64qjVjVcjp2rH/8VS81P+0Hes4J?=
 =?us-ascii?Q?HPzdoLFk2nChDCbhxxYDv5O7i3lXnjEMtA+s0OvHZFNZaTkVNKGrL5IHaExQ?=
 =?us-ascii?Q?PR9cZXF3NLxEh3KZHN1aU0NN5eom1Em9DBoV59KwQ7Q+Wh78UnGNlIsJrjfi?=
 =?us-ascii?Q?4MSPpcoZgKS9jpPaOT0eUM0ljqkBFS2ey88YfGkQli4KtbD/rYSirTpbKbAn?=
 =?us-ascii?Q?lO5zFOkPIX6m7oqFUHFXVIivNnBP1jAlAPwCT6xwNwrQBvX0zfPxXd3lOauP?=
 =?us-ascii?Q?eOaXZmmiya7kYJa3P3uSmW0jCqjqTWT/BsXMKvyqADM/30rR0YwfzjnV6jDs?=
 =?us-ascii?Q?wYgVX6pCtGfQkcyfsKLoVe5x2La/Px+6LW0vHQG7RjXfB85PcDgZ2KnPyXGx?=
 =?us-ascii?Q?eM8RE0bXGtZZ7APiXyDyVoL/WgUmu6U/cZfeS426/cfdvXg/XgkwMLfcY5y4?=
 =?us-ascii?Q?hDk+1pG69m/1VyIl5Z2336xE96Pkw3CuMWhhmEFQRLAe4M2FAB8ikLHoqSNw?=
 =?us-ascii?Q?KPdGMal62saCHbkcLuwVUf2G/ZOZDOnkTzMPv5JA04TLwkpy9hOWztiG3KRS?=
 =?us-ascii?Q?8Q+kyH7b6GbLJu2wLMb+vmAfev2jUYFwoWwYVDWgUCTpv0hVuKMQtr1N6P/Q?=
 =?us-ascii?Q?1oW2Wzs0YQqUh5u2Su80fU1zRkFBCD9jT+Jxb9optnbAHmq7CYfs4DypJIYr?=
 =?us-ascii?Q?vo+/7Na+mFzICMvWArwZIZY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3000e04-a6c2-40f4-261b-08ddaa3d3f66
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 05:43:39.1217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeFqfZY3iSO4Alz05JuXY7bCEenEP1UFte7FAi8wpkcfl+PkWGAMDYj6Nf1WN5Y5EnACYwbKsSqUeMcBE84IvIo2U/TlEq5k1LCxB2K0GGeiJPPhbxvRuUUnYOc3khrW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9825

This structure is really too larget to be allocated on the stack:

	linux/sound/soc/soc-ops-test.c:520:1: error: the frame size of\
	1304 bytes is larger than 1280 bytes
	[-Werror=frame-larger-than=]

Change the function to dynamically allocate it instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
- I did compile test only

 sound/soc/soc-ops-test.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-ops-test.c b/sound/soc/soc-ops-test.c
index dc1e482bba6a..172c0ee97aa5 100644
--- a/sound/soc/soc-ops-test.c
+++ b/sound/soc/soc-ops-test.c
@@ -481,22 +481,26 @@ static void soc_ops_test_access(struct kunit *test)
 		.private_data = &priv->component,
 		.private_value = (unsigned long)&param->mc,
 	};
-	struct snd_ctl_elem_value result;
+	struct snd_ctl_elem_value *result;
 	unsigned int val;
 	int ret;
 
+	result = kzalloc(sizeof(*result), GFP_KERNEL);
+	if (!result)
+		return;
+
 	ret = regmap_write(priv->component.regmap, 0x0, param->init);
 	KUNIT_ASSERT_FALSE(test, ret);
 	ret = regmap_write(priv->component.regmap, 0x1, param->init);
 	KUNIT_ASSERT_FALSE(test, ret);
 
-	result.value.integer.value[0] = param->lctl;
-	result.value.integer.value[1] = param->rctl;
+	result->value.integer.value[0] = param->lctl;
+	result->value.integer.value[1] = param->rctl;
 
-	ret = param->put(&kctl, &result);
+	ret = param->put(&kctl, result);
 	KUNIT_ASSERT_EQ(test, ret, param->ret);
 	if (ret < 0)
-		return;
+		goto end;
 
 	ret = regmap_read(priv->component.regmap, 0x0, &val);
 	KUNIT_ASSERT_FALSE(test, ret);
@@ -506,17 +510,19 @@ static void soc_ops_test_access(struct kunit *test)
 	KUNIT_ASSERT_FALSE(test, ret);
 	KUNIT_EXPECT_EQ(test, val, (param->init & ~param->rmask) | param->rreg);
 
-	result.value.integer.value[0] = 0;
-	result.value.integer.value[1] = 0;
+	result->value.integer.value[0] = 0;
+	result->value.integer.value[1] = 0;
 
-	ret = param->get(&kctl, &result);
+	ret = param->get(&kctl, result);
 	KUNIT_ASSERT_GE(test, ret, 0);
 
-	KUNIT_EXPECT_EQ(test, result.value.integer.value[0], param->lctl);
+	KUNIT_EXPECT_EQ(test, result->value.integer.value[0], param->lctl);
 	if (param->layout != SOC_OPS_TEST_SINGLE)
-		KUNIT_EXPECT_EQ(test, result.value.integer.value[1], param->rctl);
+		KUNIT_EXPECT_EQ(test, result->value.integer.value[1], param->rctl);
 	else
-		KUNIT_EXPECT_EQ(test, result.value.integer.value[1], 0);
+		KUNIT_EXPECT_EQ(test, result->value.integer.value[1], 0);
+end:
+	kfree(result);
 }
 
 KUNIT_ARRAY_PARAM(all_info_tests, all_info_test_params, info_test_desc);
-- 
2.43.0

