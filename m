Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41F03EEAD7
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659831; cv=fail; b=mrOXS+5prp+OoDuzBXfnuQhU3bGcTj1h02tn+E8eCT07vKqOqrIg7bbOS2epTPNl1D1eX7h71Qdfzn7pcEDxZzAyVI9ayhN7fNfL+hULSTbbHYZ6ztd/KZoCUlde1eve4Mw7phhNpHd1poV1p4Wmj6N0VC7EHJFXIRzKBOVIu9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659831; c=relaxed/simple;
	bh=9pzK3d2kI7dd/KqKlPPj74h868KJM1SEwvK881oqz0w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tWW47yIE5SPjhHdPSEmEjR16HAIpBiiqHkUCPW2mnn0JSWqGiLuikYJ2grtODaD7/uUxyhQV/rbAqc4EuF/a2h/5YheKoYXCg4FOamSWiEkV++Rj/06Em4aOfMcf7oTpqAtu21julrTA/umVO575D5PCJKC+JJVr1nQmKVmvunI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C6bY8K1D; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C6bY8K1D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Afzz11Nuz18ScQaPScX0dzFV/1Xi72EcrWkP14723EcDxMvP/7oL18eoo3vJGtiBCRV3+rE7e59QAnaNOy0fg6kW4EepiE4mQMclDoRz9+OR/qs3RHk0qSJM2Zl4PZvLpIzEtwTS1rBquMk18HbRW1F01HcYbcYOmUUM2vPPhFFCz0RBWKre/M31HbfiSyKOjT+07Zz9GcnoEfdl9aYOsELQEbakbZvPYimV1LrjCTUfN/jzcv1qdtwwTuFbJuBbRDeNMKZVx8cOR7EiyZT2LtGMKXwMHPrTPJK4jyNMrGRcYCI02lkOglKKr3JczzwRa5+0jYc1kZDBgYiK/BtAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0EZFBBLm5vcvOXAmkwwVTV7Y+PdLJgRWyfDWQZ1zk8=;
 b=KENFWtAWJ3vhGGgs0K+zSmz218CiwYMJzNJBcfrjcwygKILUq9iy594Bx1WyHuJxdrtWoCfk8xg+xrAIDk7slwsEk+NIPpGoYsnTaXBwuQumQvRYWAjmhHRY0DN3Ks206AGdp1Vi2bz2kRzC3Si0P7oqZ9BoRJG9xD52RLvbw32OpYiLlKO4u/rsetzeiDzWpAL5lhCfqInEDhdRw0WWxmB54LA7GCqPCCZQCzkoB6tMqrnQLk79VDzN1ghFija8lXO62b0DGrBNQIJS9cpWEX3IzFE3oTUapuo+6nLf22IANaZnegjOPTO3aaoVk0zO1s282ke8PJ1dBm2OG5MY2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0EZFBBLm5vcvOXAmkwwVTV7Y+PdLJgRWyfDWQZ1zk8=;
 b=C6bY8K1D/qxbhvWv8BvvNJUqeX2Xw0W3rqn3EinK8KhTXYHhUGKtYDHLUokqI6ZIXHRNRGvQ7XHoip2gKgslVsbNo4QFJisnwxWnYzmaan9Q9/S7msFx1ojhFdxm0ICWPovMAHYl6Ak3m1i8DDjggXGfXKXjCeB3uGQHQ9MOHDE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12208.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:30:27 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:30:27 +0000
Message-ID: <875wzoeia4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 14/14] ASoC: soc-component: rename snd_soc_component_async_complete()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:30:27 +0000
X-ClientProxiedBy: TY4PR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::10) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: 249276ab-7f5b-4aee-1d2b-08df1deac518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VtvAqjcca3Qu6tDK45QDho84D/Nh7chSYynowNHUjXXChs6mpkTl7dA076/qeHM7em8z1kC+qYTrQwK7H9Lutewg87kI5s3X2PvCy/f9SGEMxBT+f3Z95WoJV129neYVR6LaJzEcdgb8iY15yL1mA0wnjC4BDS5eSJNrLYb3YFV37NfhHhxWL4hc8p75CexgDWg/tYjiHcF+lGL/CNG8xUpJjHAv9yg5KSGLUWikq/mwJXSb2TfSu7uLudrbHR4r6oT4Cr11Sm14bdEB4RAFkqwH7NJLN3WWQ22DjQddcKIhl0YjPIXS+wAYc2tAKboGSX8BqRYQ14sb7v/iZhJJcO/P/UBRGl2BiMd0TmvkL0h04d8wtdTOscT3YvtBLwTe84iJA/BeoB7CZu4P+4cBWSqnC2sMrDTlFt92k4IF6E+yl9256oY2CZ0F01EemC5gFxW2nF2C5zCV69Hkr7c6g6K+QK7hJIEV88ylAAe6suHb8E8xnVb1490Rd4vIgdZtwWNpAZK2FgUjo5Hx1GccG10rmceDdTbsoLNQMXoC9UqV9F0TXzfyfLxSsj9fAmbkaI5waPopQ+4F2NlKCz1ohZJg4xs1Dbaj00xcO+s5ynuIQD/1yeazIlbJtR0tLE/b4/qETd44OFhbg4PTYpa7eHiN2lRsRZg+XtMo91josY0rUn4r437UlXP1WXdxN2RCA/j1WnjRD3Ce/uRmu+Vxjxx7kTH2zd8qaiaDkR0Fz+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5+h3s8knOYyJ5NJLpPehuzXmUHaQpWQEodWhWUbmxg3nKsG75UFDWW+bMlTc?=
 =?us-ascii?Q?RRuKa8sC4XgmNcLTXqrAPHPqEdmUvktN9MA6dYoV+HkRCD9H9To0lmoBPld+?=
 =?us-ascii?Q?oZ00BZEmbcqDuZzxSKP0aqL3xi14WqjtvqCiFR2K89s+i/Mgaw+HUo4WhiNa?=
 =?us-ascii?Q?KHb+vpnyaDpAAXLD2xpl6YWncm16NByFVHarsGcqxZb2gUBJDCognPjOhcel?=
 =?us-ascii?Q?3hTfCm8iEH9qtFWsKIPIQUqjs/OUizLwtlurQCp8VOPjeDcJVt4bdKEiPBAQ?=
 =?us-ascii?Q?ZWWiarlEwBa7277IXxVh8ml9Sn6w4cqQmbayA9ZPQYomFu/nZR6d/ahPQZwO?=
 =?us-ascii?Q?DQ3N2YKk1jrX7MFb4l6c5EPpxjrBHcnTp3Bsy96PxLezcmh+rYayLovKci/Z?=
 =?us-ascii?Q?xmEitn0ulLPVf/ysbG9aWJTOS9gPJD7+NFEhA4vBniMslu3Z2UfyhMprkhEm?=
 =?us-ascii?Q?ykhUFBe7imPl6zbhHFS1mA3fgfVMpvDZ4yBwtqdra+SUYMyf2jLwM+iU1Rg+?=
 =?us-ascii?Q?83RtqpWSHWnAY206uC9D609mFxi+Es0lNfeYXFn9gUbAwbGClM8ERrHGwcau?=
 =?us-ascii?Q?KPu1leltyPEOLZmibtOM7D5iCo6ACzzp5kAU1Ub3P/zJvq06Sk91GB4HQwTv?=
 =?us-ascii?Q?OQ5q5Ek+CpvQrw3TZiOHNlGS6grSZyjM8jhKrZUEZKNICCvwW3R0rVIv39Gc?=
 =?us-ascii?Q?hQMXxA7WUjI2MG0JxTt6NRJa2jAAKrsErLDBDOqzXVZ3dKOKczejH02MXRwd?=
 =?us-ascii?Q?aI2tGa9rO0Qs0hSbZtTXyQKFuFwXPPqAn5L0veiLCVynCXhwclulsWqw1+8m?=
 =?us-ascii?Q?7eTioeqpmXKBhp3qIoFUhiWfkvf2546deffzen72/iMnL/isbw1iTuiyqwu8?=
 =?us-ascii?Q?+9mLcZHDXFhwCvrrS44Bfn4JgIr2R1vgQfMxyIPVT68N+OhSpNkZLHSdXCiX?=
 =?us-ascii?Q?4KVp7d72yBHtCh6SGowU43+FMwRjggCcUgUlqkPNesLGpaf44U3Z8TqM4t8m?=
 =?us-ascii?Q?RBOY4SRs5adp3w+wOmqITiw7Ey35N0SKv4csoPlLa5TlUZc8TLIwp2Muukfm?=
 =?us-ascii?Q?CKzT2Xs3X5NGt5agNAGgi/nXor6OAA19EbjyX6MyVpiPzNZlPkP/M0RQ7pc4?=
 =?us-ascii?Q?q0oK1o+ekNap7xTZqt+xOQRtFqE8oxYuQ8HAh62YWVfflRbFXqUWeQ2zGufl?=
 =?us-ascii?Q?f+KVXadRBZi8nLE1280stu5wOUrXvkWGiKnU3DHKK9VXVSsZH/qKL1FPAK2X?=
 =?us-ascii?Q?Qp40WnsuSKLBRkuU81pDBC+aArIRDGi8DsGYb8c40YMAcWpwnMh8CtaKzvQG?=
 =?us-ascii?Q?P7h235kjkG4cM8HvQChcNcPMlod5ofyuvof62SGFOQQnn5jB78YWY4VXGRdc?=
 =?us-ascii?Q?Ibsl16QQJYU8Lmmp/cJa99bIZmIxCUuh9BL5/QF8vNAzqftBjZVQeFPTQXts?=
 =?us-ascii?Q?6yRQwJ7M49nBa41DdYJu6jOB+g0CbPZ7pIj7tacijZFtlw06RBGvhTYsM/X8?=
 =?us-ascii?Q?RvzO+Pxc9jLlBouS7zKDzHhEaL30cTWNF3gCt9XAN2AuAJusIZkjHPFjSm/3?=
 =?us-ascii?Q?JAvO3Ct9fdlGYYbSY+Lew5LcdYB1a2EQIzi2DQR9L6cLm5yLwjvndSt8xKjl?=
 =?us-ascii?Q?RPthiXLBQzbsnBsx+PnbjXeENvYNuyrebI2ueCqKSBnCpDH1WwHim0M110jl?=
 =?us-ascii?Q?oMw7Du9ukD8dzSYEKPL8NbKOUsWgsFTODOrPASJQ6XMeGxbolpDDiHyro7qX?=
 =?us-ascii?Q?8gljNaOMRDBvTFykLVHhB1AEO8FTwznvgXHd4sn7tjpAFipvOLGd?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249276ab-7f5b-4aee-1d2b-08df1deac518
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:30:27.7116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0iTGHprnlhS0rfWOGRcBvHfRLW77+g5BDfBLEuBQGUHDU9KZmxz3P4ADSYt9N4ktAIyu1WRk/MXNzIdcskEdH2xk0wkPlnaaIISpdCFeaaJwujCGTu+ulRO5KIY3NKR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12208

snd_soc_component_async_complete() is regmap related function.
Let's add _regmap_ on function name.

It renames function name
-	snd_soc_component_async_complete()
+	snd_soc_component_regmap_async_complete()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  3 ++-
 sound/soc/soc-component.c     | 28 ++++++++++++++--------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 26d2a4fb9380e..33626d06796db 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -303,7 +303,6 @@ int snd_soc_component_update_bits(struct snd_soc_component *component,
 int snd_soc_component_update_bits_async(struct snd_soc_component *component,
 					unsigned int reg, unsigned int mask,
 					unsigned int val);
-void snd_soc_component_async_complete(struct snd_soc_component *component);
 int snd_soc_component_test_bits(struct snd_soc_component *component,
 				unsigned int reg, unsigned int mask,
 				unsigned int value);
@@ -334,6 +333,7 @@ int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 
 int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component);
 int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component);
+void snd_soc_component_regmap_async_complete(struct snd_soc_component *component);
 #ifdef CONFIG_REGMAP
 void snd_soc_component_init_regmap(struct snd_soc_component *component,
 				   struct regmap *regmap);
@@ -444,6 +444,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 
 /* REMOVE ME */
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_component_async_complete		snd_soc_component_regmap_async_complete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
 #define snd_soc_lookup_component			snd_soc_component_lookup
 #define snd_soc_lookup_component_by_name		snd_soc_component_lookup_by_name
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index cdbe0eb0e17ee..4c00a6411b4b1 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -437,6 +437,20 @@ int snd_soc_component_regmap_cache_sync(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_cache_sync);
 
+/**
+ * snd_soc_component_regmap_async_complete() - Ensure asynchronous I/O has completed
+ * @component: Component for which to wait
+ *
+ * This function blocks until all asynchronous I/O which has previously been
+ * scheduled using snd_soc_component_update_bits_async() has completed.
+ */
+void snd_soc_component_regmap_async_complete(struct snd_soc_component *component)
+{
+	if (component->regmap)
+		regmap_async_complete(component->regmap);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_async_complete);
+
 #ifdef CONFIG_REGMAP
 
 /**
@@ -941,20 +955,6 @@ int snd_soc_component_write_field(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_write_field);
 
-/**
- * snd_soc_component_async_complete() - Ensure asynchronous I/O has completed
- * @component: Component for which to wait
- *
- * This function blocks until all asynchronous I/O which has previously been
- * scheduled using snd_soc_component_update_bits_async() has completed.
- */
-void snd_soc_component_async_complete(struct snd_soc_component *component)
-{
-	if (component->regmap)
-		regmap_async_complete(component->regmap);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_async_complete);
-
 /**
  * snd_soc_component_test_bits - Test register for change
  * @component: component
-- 
2.53.0

