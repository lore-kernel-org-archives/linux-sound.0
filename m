Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC0253950
	for <linux-sound@vger.kernel.org>; Mon, 12 May 2025 02:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747017204; cv=fail; b=it5qJHiYpsUynbpEbxIAJQCr6QT4HuA0uGM2xsj4VCLSLYihYxPghK/XnUojMR4K2mzLadATfZKbV7zwp9HAulGz1qWvVGjtoX0HhmdEFpL+6T+w+Gh1dSRx3WDF3HFy95zOqbB+8uHHmBBq7ORySgVNUs6dY/NC1WDsHlgBL4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747017204; c=relaxed/simple;
	bh=qIRlNftKDSsHLsUx23kgGpUUMbbLF5QIP58TF3Qn5OE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=h4wanLI9KxBDVDMs4oy0UTZXiVzCbNvmj3p0Fi2KKBl0Uh6d+kJnYXsSGiHKY8fJ4n2P+ko2HCAph3phlWQNO6JLE9mGjXYbgh35YmNxOBowm5yE9R9gso8tMWqd9LGmDA0RrHTm3sQlnL+41blJFVAPAb2IZgPyaaL4Hv/WwVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PnkOVtKq; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PnkOVtKq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVk9DWGS1U6iArZK+seJcsgQjfMMVMjz7V6V6Br6do87dJgOCpy9LaHmFbRrKR6B66loRXw3laECejVvazkTT8HNnpcICpnTJaIJD4Uw8Kp+/y2JMKwMxYeapr2dWqWlOiwIdLlaKggLSrv5lIiYDPhJOVq9HFhPYPzAd0yaKFgYmGUAIWtLsNDLZkNdnwXvm7CJQKPr2VMomrgtxY8i0+312NHJUz5ON2hyxKmV2uWtpYeGD0cXHHhDSNayu70Dorec9IcOK24Lxr0QhpBYdgknyLv+CrK3Vkv8VLOlzAXncE2ZQ57xB82vMoK/1dIV77l5ZQbLy62MGrfl0gLWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00jIdWgmuMtz4MDWRhRm/feyvLitHqp32X+8ijVoIjs=;
 b=dRIPYXwnwxGGA6liDLKeXtYc0CozwoufeQFyz6U2zcKIlxi98TvYqAt508D5CmYf8KOQlsQ5XVZm5evhiBujAlBCL4QfWiLxvxmj0A4jxAomrmNXMo+gu5jBvCVVjUlmb1R6cnUjrqqGDauZM4h6X3GZrZEk7LzJCLdi/6mgHTVvTKr34IOp01ci9C7jWAbra2Mfro400rryMLzGccQ4pj7OdSRWUwIxhpK4ivIw9gwzKRdf7tV1Ba72wl/ybzPqVuGfznY9gSqqpWs7DmILlu5bKX0b04bwDeUwU215JdqLBzcMigKAyKeGdYLYtI97FcgHPJX1qoFkjhXNGF7rHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00jIdWgmuMtz4MDWRhRm/feyvLitHqp32X+8ijVoIjs=;
 b=PnkOVtKquwpCG0J+IUoEqTMjZ4ekF+p3L5wPmmZTOnjINGwp2T1sg1QSDZOqDxNrUVPSspUr4q1bvdnJcowb2t1XIMo3yUzHPisAki2hgll1EQieF4ibh1HrZj1DqS9gUEKlqVr85mmhKgTVA3or542IM6JrD470Gf93GkUYYCk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10948.jpnprd01.prod.outlook.com
 (2603:1096:400:394::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 02:33:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:33:17 +0000
Message-ID: <87h61qy2vn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 May 2025 02:33:16 +0000
X-ClientProxiedBy: TY2PR06CA0044.apcprd06.prod.outlook.com
 (2603:1096:404:2e::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10948:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db8d60c-6db8-4f66-4983-08dd90fd5a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eCUo0um8TNc7QkJNv7rF4UBL8YdMvARcPAjk8TOcywhwm3XEfKjsHCsDgbpu?=
 =?us-ascii?Q?4BvfdQMMl4NnAn+1AcwTxtaMBEg3hhjGIgHQf+8NlU1thpfcYH1xHGDI8shJ?=
 =?us-ascii?Q?hzatIq1Vjuhaa+HixyoyuBdkgJH6jJKPERj5uMCnAxi3yD/xQKgUAp02b0Nm?=
 =?us-ascii?Q?WPFia5TelgODizITZZvhqe5WqJMOKo1MMAFB5msGxfBrexp5Cj5lBMetVz9w?=
 =?us-ascii?Q?CZoCYDxCAoC2h+fskTPjtSHzNDeDgo+qqrm7/8Ww3qNE202265fgez48lIFk?=
 =?us-ascii?Q?GVaZAIJUBXlvxtPMpgYQtEXHt4wxKoEDWn/e5A2a45yYxBaRhT7zlP4I3s/F?=
 =?us-ascii?Q?LJHqVY7/bhxxVEzDojhFCjLWb92AFQ19kqHOWSLVKHS61pKen3ivypmWk0pN?=
 =?us-ascii?Q?kUz8UBq3oO/Ikf5ZLhMDJ8TgG6OBFveS0oy0FqBRA+VH2cvjysAU3R2nE4O0?=
 =?us-ascii?Q?zJaOIKeOdbnTZfiWbQUUaXsZAqSJD1xAGBrqIbWbHlVwZWxqe7MAqi+O3xve?=
 =?us-ascii?Q?IhKqc1iBBMFz1XHoVSYn4710caHQIJEH54ww/CpQV9qtfmJTzenANAlKr2QD?=
 =?us-ascii?Q?FJS+7DIeR5jqyRI4MWy9kvsYE0Ov0S/FjdYOkycwv3PQzWYI6VP4I4QjRsFg?=
 =?us-ascii?Q?AywgcjGkuSGHQdZfAxEG3O6aiHzbC6p0n6kfeIRlyWHH06RQLH879NuNr0PQ?=
 =?us-ascii?Q?ZgRNcSRhtrvsmhawTEUhawywhyrzumDW5+53voFD/LG+k3CtD2ifBCTY8bkE?=
 =?us-ascii?Q?dTFqxyPQn8i0O+smQYtX6wWIrbiCZW/hdYaBjjsx49PaD43omIVls86kq1gF?=
 =?us-ascii?Q?j14JlbB06/KaGOIWiukG3Fx1KeUAtd4iVaYcdiZXp7sCu8ajSeBukTvREFeP?=
 =?us-ascii?Q?kaYxc66ksbnEp4W/FVt5VasufOH//YiLJZTHTwCyCwuf2bDQslY2D7rHuUKX?=
 =?us-ascii?Q?LOHgybfY3hb/KtxtpwrM3whDLVi50SvXZumZlqi3IF0QOXOqgU7emWN3JH+z?=
 =?us-ascii?Q?bVRI5mHBzzWLDePyF8qOi2yd/TmzyfNtxtPkWjbKt6aSP+EnfHhssn3jt61M?=
 =?us-ascii?Q?VBVY91ilL8WzJNn8ym3Q+XHjWFxDtOPjCNu3440g7t7R62AhaAEWoZFbCg/K?=
 =?us-ascii?Q?zMsUN7dU0vgfwcYZtNfAGAxJMy/9k3B9qcYSAhtWjyq9wXBCJs1Ca+Vqx6kZ?=
 =?us-ascii?Q?bRZdqCAGvJIbRU9lCo/uzgFzxUHgR80RgNztkmHSpAlJkk9vOBbST6+arKjy?=
 =?us-ascii?Q?gW+e6xcQRSXrsD+SMX39M556GqxT9YR8kegDQHsxRk8VgJovZ/qXd/ByfD/2?=
 =?us-ascii?Q?A2mRQqdgFopZ0CLLyvUI5XOYgxZdoeWsPC5F/yROya5qDO6Oev2JRDMYcorO?=
 =?us-ascii?Q?TkeBGdcyLcsMRr8NjN9FMfVAqzDCIzkLn4ia1RA2Zm5KRqlEi1QCHdLDzErW?=
 =?us-ascii?Q?PX9B0yWQPNvW1j6QiXdaCwZ3Lbo+tuw5IxECiNVcgxGiKoK1fQ4RuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Utid/BUARvcQWiGpHKy5X7SnTOk3PleMP11hdqP3DXkz8yXGgzfAlzfubc+g?=
 =?us-ascii?Q?DvtWlteGOpZgJMyWAKHyYVZ3EsWuOnMbk6Kx37M0ao/qY2sAiH5GjP3ENFxl?=
 =?us-ascii?Q?jukYqAQFqSQ0K0vJu/n2eOOhQvpSTp4wsb6pfwHnbMfWix3JnWTU1QHa2tHw?=
 =?us-ascii?Q?ccl05t8cK6cxOHssAOHBwdy+0cr7MBRAOYJ9ZcbbkKcrW55mfLwHOMIMxy1y?=
 =?us-ascii?Q?bj2+Q0+I0+uDIBnP0pc6FAW45UdFQoHsNhPtM05hmuSZm+7MtkkjzYaChG18?=
 =?us-ascii?Q?WWBpRQEJG8nmV2C+N2sVg8nL5D+ESo+h9YZODORW7iJFHXC4ckSg6OrGePHR?=
 =?us-ascii?Q?GzmUSwWPmW5GqshOCwp+DIzS8vMqME7TFoeFEqvyFbyx+yVkgmD0FXH+wr6k?=
 =?us-ascii?Q?twsW7gr3+ay2cDwaxJF0rPz3kpAkMrTdnHlyTYjrO6quZ2J03J8sPolFtwjK?=
 =?us-ascii?Q?xkRiVh/rdkSqUs6WpmZ5Iq3bjXGTgrSvLqEXoQ/CwCeInsNHeurTsvbrQBup?=
 =?us-ascii?Q?NkPoB+temlxpt9WMSWhkIRnnIXxGaC0RU/XhWWvefEGq22MAKHMRtEA3NL7v?=
 =?us-ascii?Q?IhUHP52bO81v7enhqQdTjk8MsUAEMyCI2Nyj3+bZEm8PTH26uhJ0NsHFEW4i?=
 =?us-ascii?Q?JVGMUczMjHzLHS4XzKr7i8zb+z2vOnHAcRGIbpNY0RPGcOmdoVps9RIFTfyf?=
 =?us-ascii?Q?o/AR6Li0gwu2+NN4bwikvVhMU7LxrvJsxaEWcGYvm1SC/icP+gSx0roxYecX?=
 =?us-ascii?Q?tFJtSyvkTDx55hR/DkAQir56rM7hNoLGAJdzMdPwmaR65uBOVWBWerTwoYBx?=
 =?us-ascii?Q?A1xYg1bcpMnPervg4BGArk7gD5C1oC6JeXSOZEINZ8Ny+ZZrBDEdFyhPf6wr?=
 =?us-ascii?Q?WwhWtzY1eVmIbauCzHJh8Tet8ZhHasvHfgBJj/Y/PsA94ZdU7THuNeQbNqER?=
 =?us-ascii?Q?VCYuLPygvbIxHCP689OU3twFuaqF9qWU+9qAoaqaFa5t1C3ql3O9kDFBQ0H2?=
 =?us-ascii?Q?R6WMBx6p3gTDHL7D5lJe5Sv0wjSXlPr/HulJ9GJSx0FW2J+dxHu2RM6nWmUs?=
 =?us-ascii?Q?1Sn+zJYlesAPqCBwhFxQjztMM66qToeKcMmwZPqYA/H26k9OAsBECSmX54pX?=
 =?us-ascii?Q?U/G8xNU2o26ceNOLfTY3n0HLZcAlir9XWeqrgPBJmbhdJ3MEqQRmqgswU8tL?=
 =?us-ascii?Q?qnqS5jDCSduJ07cEQ7I1wZsQ74PwefkzeHNN9E5qjTkptonN8cI9ud4ZUtZf?=
 =?us-ascii?Q?KYCUGsAL8rIwGYWTPAmwE0jxtEo5uyf7X2udQiHfy6PG9FGwyiwBl+00KaOt?=
 =?us-ascii?Q?qOtYbBrI6xwtPSJYfuLW2TrEUFSEobZRqcYmK5h5yPqk3VzgInyZTVxF7QiW?=
 =?us-ascii?Q?IUi2STMRbknJxgeO8eB9Lrvzjik+yyDfzgSaJBhcbDrrYhxErMIXgEEw9B4j?=
 =?us-ascii?Q?FEyH/zSKJQcvZmiUWSNHuct/knEE7QCiIafnvy8Aom01g6fe7PW64RqJa/7O?=
 =?us-ascii?Q?lJRVEVX2AkLUp+ISSkKz2ZozQdfKbMYd4gHIue5dmMWfcyaRAthbez31F77O?=
 =?us-ascii?Q?ZPusCvb//zUBosrTou4P+JvDobKOE7gUDQY2wIf6Tq9GPsjeMHT3xtFPOi3i?=
 =?us-ascii?Q?Nf8AeTCvcEdZGA5lwKldvtU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db8d60c-6db8-4f66-4983-08dd90fd5a08
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:33:16.9826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRF2jSKhMXcdi+OH106Lki3Q6uptUxYrTQ+fpw7onvu5GcUHceeJ9x7i55yoAyoSokh8frx+ptfXKKH5IU7jKXtCEVD0c7J3U/OdDM88K3BXXNtWVzBf8QKpsHt3nAHg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10948

We have below 2 functions, but these are very similar

(A)	snd_soc_unregister_component_by_driver()
(B)	snd_soc_unregister_component()

(A)	void snd_soc_unregister_component_by_driver(...)
	{
		...

(a)		mutex_lock(&client_mutex);
 ^ (X)		component = snd_soc_lookup_component_nolocked(dev, component_driver->name);
 |		if (!component)					   ^^^^^^^^^^^^^^^^^^^^^^
 |			goto out;
(b)
 |		snd_soc_del_component_unlocked(component);
 v
	out:
(c)		mutex_unlock(&client_mutex);
	}

(B)	void snd_soc_unregister_component_by_driver(...)
	{
(a)		mutex_lock(&client_mutex);
 ^		while (1) {
 | (X)			struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, NULL);
 |												     ^^^^
(b)			if (!component)
 |				break;
 |
 |			snd_soc_del_component_unlocked(component);
 v		}
(c)		mutex_unlock(&client_mutex);
	}

Both are calling lock (a), find component and remove it (b), and
unlock (c). The big diff is whether use driver name for lookup() or
not (X).

Merge these into snd_soc_unregister_component_by_driver() (B), and
snd_soc_unregister_component_by_driver() (A) can be macro.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  2 +-
 sound/soc/soc-core.c | 30 +++++-------------------------
 2 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 8d113ee8c2bc8..1fffef311c413 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -444,7 +444,7 @@ int snd_soc_register_component(struct device *dev,
 int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-void snd_soc_unregister_component(struct device *dev);
+#define snd_soc_unregister_component(dev) snd_soc_unregister_component_by_driver(dev, NULL)
 void snd_soc_unregister_component_by_driver(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver);
 struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device *dev,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 39ecf0123a444..cfafdabcdc888 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2931,34 +2931,14 @@ EXPORT_SYMBOL_GPL(snd_soc_register_component);
 void snd_soc_unregister_component_by_driver(struct device *dev,
 					    const struct snd_soc_component_driver *component_driver)
 {
-	struct snd_soc_component *component;
+	const char *driver_name = NULL;
 
-	if (!component_driver)
-		return;
+	if (component_driver)
+		driver_name = component_driver->name;
 
-	mutex_lock(&client_mutex);
-	component = snd_soc_lookup_component_nolocked(dev, component_driver->name);
-	if (!component)
-		goto out;
-
-	snd_soc_del_component_unlocked(component);
-
-out:
-	mutex_unlock(&client_mutex);
-}
-EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
-
-/**
- * snd_soc_unregister_component - Unregister all related component
- * from the ASoC core
- *
- * @dev: The device to unregister
- */
-void snd_soc_unregister_component(struct device *dev)
-{
 	mutex_lock(&client_mutex);
 	while (1) {
-		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, NULL);
+		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, driver_name);
 
 		if (!component)
 			break;
@@ -2967,7 +2947,7 @@ void snd_soc_unregister_component(struct device *dev)
 	}
 	mutex_unlock(&client_mutex);
 }
-EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
+EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
 
 /* Retrieve a card's name from device tree */
 int snd_soc_of_parse_card_name(struct snd_soc_card *card,
-- 
2.43.0

