Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C3E19E992
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820693; cv=fail; b=bokgb7pG0wS3eyR7i7Wg2gF6wCaZvg83q/TBRa8wJ1IhIt3k7YYWa/02g4EUmXrVhPa8aW7CLgsV/DAr1mENNyg4gywluiznEWaqTQleL7dkGdYh4umu1eVNIm7h3b/J8M7J5PwpnUM1b51/UBK30s4kCl4bWu7qysc9k9G1OmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820693; c=relaxed/simple;
	bh=IRLhVV2mIlLvI70flOZBnj+4oKfQBj0cyThjtt/o2SQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rHAJ0L2Y9mR4V6hmsAs4wYSdskrDjMYbbUA2j1wRtWGt9U0EPnM5CvsMmGjuqCJoaQAmCx1frpZgbjIh8ZAanXOvynRK2Al6xRcRLTKDgHuIzsxxvU6QmpYSYJI8SvEk8s5GHrmTjm8jTDfqSPQOZXWLIPiU5Jt1drWs4FX8wbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=enzRINpo; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="enzRINpo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqiyAxKxJPAxhtESwXrYPoDKcOuQre7u55Wb9dm9P83v2bRWOGvTWlRHrm2ztExUTldXzDWjXI2whYWZFTuNG+eXpgtcD/P95w3gqNs8LNN0+2bes4rIheg5b38IU2PkPMrBE4/FR+kE+eT9vQa1nJVu44jQkiwuHgeswvLn8iSqjutnh1KtC8OLAso6b266bvSXPpXJe7pNDPlR3WypOirvOul5DhUUMqk7ke89eL4qhjWZlcTo7H0gzb530JumddaqSblmgO4zXnqrmszxlNYgiiLN6C4fxsWQsMIpjSnC000cuGfmwEtXHbWW8VacKwV25ZFaTMBCx+li6vkUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rbks3nrzmE6E9rr6/agenn7PBkRj9OKanFfXbxu8Cmk=;
 b=Tzgl6B/+pCDlj7xjKafcnivMN/4squYDoIdj7isdVt6VH2m05ZlHyA7fL+2L2jK3Id+ltHRKnAUQpht1pv093k0cjczT3PX2J0dY5T6GyJF7JHEpDfQW+W16FV/KFGQpDddAR4t2eb5a1Ddwq8liaIoo2wmES9AOsID9KuyzROiCeRhLx66MjdMOgu8Sc23IeWAf7ic7Rf3kQMK3/CdMNrYqVORkcQ/hfvTO5sOkwzMeEjTU8atYMUmhMtb8zkJDlh2YhNF4TgY9OlOkJ+tj7qgyJV7ijxi2ZXNW1SLrdpGQ/3CF6zl3pLojo0uHQMzi4W1mRl3XjyBkzMf3EMtQfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rbks3nrzmE6E9rr6/agenn7PBkRj9OKanFfXbxu8Cmk=;
 b=enzRINpoLV2VyDfovFVVYtqckTKa6EQneiia6xw7EusMDzajuAMwSjopiA+Khe13NHWfp34ODLamI8RjkdutEcmFQcvKK0rQOODZFStawsgA+S3T8CTRpoUPVcumu4Of2RkE2twfYXBg7i76vjou6n53z5MfjSCsMsijRSLu4CM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:50 +0000
Message-ID: <874ir14drh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 105/292] ASoC: codecs: rt5516: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:50 +0000
X-ClientProxiedBy: TY4P301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 04bf395f-ccf9-4b02-6eaa-08de20b8ba49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L99nO8cK235oIl3Par33b/UjlPv18uBOSK6if8xKGvM6r7RuZTlJxMr9bSEs?=
 =?us-ascii?Q?KuAg8j9WAeTLvyGP+xXzb4kfKZ/Ua33iaVVBzPns5NPImdYaXD1WN+wevMxb?=
 =?us-ascii?Q?fzsCwDQ+DSWB0PoC6vv2IhjjeK243MrN7A9p+4iMjtHvOo3rGLYgwJghj6Qk?=
 =?us-ascii?Q?YNku5WvyTPCImwsUIojHXeG8xslKcS6VyuopNcdwvyMcU+I24gf0JcDNNt+0?=
 =?us-ascii?Q?7+xD3UOROb5ZlXkmcdz4S0xD2TwSV8PKTWqMM4IGinZlRoRlaWZoDEdglWN8?=
 =?us-ascii?Q?x0vjtN7tof6NV4VFd3Vet8kgu8pyN/VnVW3SRkArvlJs3l9051xEOpiXWIbe?=
 =?us-ascii?Q?Qfa7X5jHF397N+3kLLr8zk9U1xNJ2s3o0w1pb9eRiOnoT0W9x7YtiwpxYOqF?=
 =?us-ascii?Q?ypBeC8TNvRvNjVTDnU5BjalF70mJ3joTmJhvTiHGLHEPoQZXHpJXYPTR15zM?=
 =?us-ascii?Q?4VvS/IUyYaiHlX/Q9LjUtOBZU3o150cpZ/qI5tNkz3v3pJLzhtHAEAT7CRx1?=
 =?us-ascii?Q?MlqUBAoG+R7ZsD/fIi5mkU+3t1kUCtCG6iBQqIvfsdcx7srHR9ORrCQvTRqc?=
 =?us-ascii?Q?ezPPrTLdb5x58r1VgfiZ6rkckJwRF/zbrxtQpJBjDmDlxnyRvWPin/OcerTn?=
 =?us-ascii?Q?zMJn9+Q2bbZCLBM9KUbEbg4wua3B6x/STodgjWI9MPxIwi78RgfB5P4xBRJV?=
 =?us-ascii?Q?bx/SYpAWdHLg8ZejgEFM/sHiuYmeFPjJcJi7sRMAz/h6i/S8YSfQGKrhN1Cx?=
 =?us-ascii?Q?QadbSWmqQrffdfRfxyhtzH1CM3Mh2pfSt6RJfSHzWrS2XGAENIzLVS19S/hk?=
 =?us-ascii?Q?1UzrlSyWvRQsg8aQc80OU9cEgi88PsGF8YhNamUs5+OVjXnwcJljX4Dnci65?=
 =?us-ascii?Q?eCNpoPZL9ijqCPGThYyMtLKHCMNAh3Jy+dHAGqHfHPbZg6rv/cut762IwYIR?=
 =?us-ascii?Q?uQWWk/u9T4jTQiBTjm7nB0QZr9v9mpVRSo0wq8MmlnmaItiClrLbE3SEQRap?=
 =?us-ascii?Q?rY+r1/+28sS5lyUdrd4Ddh6XGP91q/8OEXKqLSuwxcPbTVTyfEvBicE0Tf1U?=
 =?us-ascii?Q?yFSEMAWO/rY4Uu8ozw6nGeUgap0RoDY8WCu+s3XqGgQgiKWOfW7HtWjuPqD7?=
 =?us-ascii?Q?0Oh2DCu3PzDJFX54jw3FD2e6VWk93WPlSTc5NDC2QY5EbMqKyYUthPe3P5iS?=
 =?us-ascii?Q?KqAKWDn53es63xoPPZE8VcRa2+wfCiT9jtR+dZKYagq0+XFihPECe8JP/qAd?=
 =?us-ascii?Q?SbyK8VZmUgslDXy6GXco0LQazE79ZHXZlwabDo+QQGZB5CIDZm1TioMOivZz?=
 =?us-ascii?Q?uRkTXID98PelA72t/mn2KbGRBQD67wpXh1oyaLl1CfpDUHnKCX+z+bVT1N8b?=
 =?us-ascii?Q?4XM1r0Mk8XeaxZN7LRAiztTJDEaHHM5UA5Ph22eSUt6FYNtiVk9iJO3SC0uA?=
 =?us-ascii?Q?34oqRG5vcyj0IApsbTH1Si6D91AjssdSBJd7YF8KqYJRuS2Nq3d3qjLD5bzg?=
 =?us-ascii?Q?M/tjxNNBNgEBt5NSF4JyY8BZ5oE8svN0hSLc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l1squNOvtLJ+v/CqmLgiVzQw3jVJeX5xdazdoTV3QDF+rqizHQ7yWVMuGFyl?=
 =?us-ascii?Q?cMoLTB8Pj4dSFoR+87b2L6g6BQEBMgJeHiSsJDtE4i+KwRZhf22x28B0LfiA?=
 =?us-ascii?Q?mqGEsxz/lvmt/HvPHizW0Gd91dCOFW2loUqo+U7w85f3Nfcrh8eYZo3H5rQ8?=
 =?us-ascii?Q?7QdYWr1mmzb1fybRXjfKtYBoS7HRx+PPJyKI78Mhso1w4vsLgyRmSawAGGpd?=
 =?us-ascii?Q?QmX4dQTqJ89iplgkV17KzGuL1el0VI/9hQ1zRRKt85U0PDvNm+gXIC0YDKZq?=
 =?us-ascii?Q?LqVOMrG1mDJ8YYNozFVVXgXojFVtIPLX8wGd7ET9fGxiJyYi376hG14fbBEO?=
 =?us-ascii?Q?1ga4gKHP5Tz28LGVSz4JpIfzg5tqLTpLlZH2ohgLseJNwxDInqrnO5MCK318?=
 =?us-ascii?Q?2d2fmj8Vpa4MmoelreZtfP1rMp6PLpvjsio2oeYlCImJv/gU2oG51PgkNAzl?=
 =?us-ascii?Q?Bgh+9kzb5RCl/XHX99bNAHMnoFqFGod5XqZPDrvpVHDQ7UgxiVWhTkEegQ/G?=
 =?us-ascii?Q?+0NzICjbsRInFXBSlCOlOi3dovXvcjlPAEg99wxCNmGNaMfaP76Pqyr1ZJg1?=
 =?us-ascii?Q?HVRkvg9JsBS3lgjXOAB8TQBsYEsKhhEiUJZ3wl2qiTTL4DePFqINgZsTUOBc?=
 =?us-ascii?Q?Fpqx17ABvxu75V40SogYVVDLOJqgzDw/3OYlFgEbHIwp0oO0trsTwMBfVwbn?=
 =?us-ascii?Q?d0p16rKoC+RwlI9aN6zLtEmbkdp0UhnlOZwlo9IBHMw4v5zY/0mQPswozGV5?=
 =?us-ascii?Q?y343sRYmvFXNkaDXqxQFlGGL5Bv9FRFUk8CEwKwP9LaZ/ZdJrRUuDu/4iYpp?=
 =?us-ascii?Q?OX+oogBpZzIP8u61fKMb8FS+2cJsqVbc1AItpkCFzUdRyWdBytuGXyo4IIcP?=
 =?us-ascii?Q?BAygoZWkCaa33KprNR3wtanalNG/77GmcSJnZgumRpyYzZX686PwfXMdHJaB?=
 =?us-ascii?Q?3y2Ec+L8MGCGilHdvRvoraA2KxjDGP06odVexqBV7ZgC6xyQS5y/fGviLftJ?=
 =?us-ascii?Q?1crEBo+hAn3u014g5E1iXIPDaTiIhy7iaQyiwPpsQzF6RqNzjPewrkf3wyDc?=
 =?us-ascii?Q?ZjrYIKSCZ6Bf3OaQWlrxgJzIu544fjQ6DR/wmIzybMj746zPXA2hp7/1a+/9?=
 =?us-ascii?Q?i1QDZPN8MgSkDRSE9e6rcOhPbKNIJW4iEhK4OSdf2dRUXbAXPAppU8OEX/9Q?=
 =?us-ascii?Q?ZvR/5XjMk+uo9qpr1eUThwhc8vmbpuv1lKjEIKIQFkS4bqRYfGO1sWKBeXfb?=
 =?us-ascii?Q?PaKMfpeIUT6dbfZcydXq6wwZRvI7Ezt9WHqBZ7RXuwswvLe5I1J8SGbz207G?=
 =?us-ascii?Q?7B7qFCFozGPWgDhHnZuytSEMmOlfuqdQvm5WhXzW6j5LVcAVseBu4pF3BA/Z?=
 =?us-ascii?Q?HJ54TerpqBEIHCura7D5FIADQdMjUUiTvrXyZcshfAsTc5QH/+R+Ddul/zwd?=
 =?us-ascii?Q?9S5gQB77Ejzkj0L8YrnD44nosJb7PETvQWnAczUDn7kuYCQHfgQyv/8br3f6?=
 =?us-ascii?Q?wq3q9ElDMp+aYpyMEiJApAANwCzQlWMC06H9vDLsmiODWCro/Yqe2FIunHqD?=
 =?us-ascii?Q?8AG6rgpt+G/AoWnxZmlIujPgtHk9aBDoGQv/KgWL/MXblrT7suwiJuRTpKkb?=
 =?us-ascii?Q?JKbZublDjV/9rHQKEE8JmfU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bf395f-ccf9-4b02-6eaa-08de20b8ba49
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:50.5789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0MmmW4yMDg3Q3RhQPwAmOEXH6tjkH/K9Nzmpj29xZOvG0sqisBzXO1mKL0fXQ327AxnfKig+hPZEm7R0rkxnI5yDVcF0gBzdiQRlAfuAwU0OWD/ZH5C0uukYuyzoOKkw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/rt5616.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 1ec486707ff94..fb9cf127e3ff2 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1159,6 +1159,7 @@ static int rt5616_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct rt5616_priv *rt5616 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -1174,7 +1175,7 @@ static int rt5616_set_bias_level(struct snd_soc_component *component,
 		 * away from ON. Disable the clock in that case, otherwise
 		 * enable it.
 		 */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5616->mclk);
 		} else {
 			ret = clk_prepare_enable(rt5616->mclk);
@@ -1184,7 +1185,7 @@ static int rt5616_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_update_bits(component, RT5616_PWR_ANLG1,
 					    RT5616_PWR_VREF1 | RT5616_PWR_MB |
 					    RT5616_PWR_BG | RT5616_PWR_VREF2,
-- 
2.43.0

