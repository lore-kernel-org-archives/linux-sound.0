Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584801CD2C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 00:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786064030; cv=fail; b=ok1kWUTubP4sEcKWJu03nTLORQlQZEWmDlHZYoTDiB5IBy/X8tDL640+dBKQDtXd6EmLlTiuIauqR7gnMJoxNE8NOhkk1xk/1RrOzMHg6sCguudNCsLA+LYxogezmm+/wdBfz7KS2JEM/FnNoi3HRpz01W/CegCh8oF0GMU5JeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786064030; c=relaxed/simple;
	bh=u9bZNm8AVFLEl1CDM4CSrt4hGItUsm4SS2EDLWtb0dw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=f9jun9C1mmgBF3r2HtPD4E4xdF/rryuqek2MxDARaTgNa+QOR08xQerxSQllMz2Ya0tt4vaH5FpAVlN5RPwfnKIBWQr79oZltNd4SWmp1i+tVINKEYpyaCYTBf59Tta93hMUy4M/9v8LunikEMnpHmRAY0grfVgwrIa+FPMi+/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Etu/8GWm; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Etu/8GWm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGOcZoe6aQXHlZTD2oJoVTBH4Z/lo7pSFSbSE/QZfY8hErWWsQ/q/DT3YNfD9LtAPKXouKcbsAIuAzFNFpAdXt+FluuYCp+vERd0Wh+qmjGzGleeSNfm6AsFekZ3i17XWCaxSK80AKvQ3Qjh1fzmYQ62F/8obejQan3ZScZPPDYtux7PLBaNZeBa7mHIbjlKVZ9V7B/FURdPDy5VOfvzy1KRPZWkpTAcuSuD9EvqkJwSaosfJx5gcW09/ZlxvXvxEUVNHxoFoURzYsqHjXNRTfjirtDzChcsWn2OUJgbm4vJzq6cioiVM4XKbWA7VlMzqP3GGflKj3CgTYuQ+n4QDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t23oHaU+M9zJPEbB7AJV2Bq1okBRim5lPFeW9ijzahw=;
 b=bH0dMjDnXuaxfRcc8NDOpes9Bw+t8QdDgQiPZ2Pyf4M6Y3BNe2JBVV1R7haQOk50XNEzYqcQS4C90qN905w46SjWV126UgOJ9Lera/WRdbp1vc7dKGrintaMBxWg7ZABJAEiXxODIwV2vm5UkMxP7Cz0L7CFH51WNrMOUYfEfoQHucQNvgYcko3IfyKFhoU7ag3lX343Im2pleESJmL6L4CFO0RKB1ot+/tw09Ysai6BRn2ycBslzHyOxJzk1rSHdPlj73CXxBBfsMwh2IAYtwOoEslQVWUYw6ZDPH+K+Ygfka3/ByLf3aO4bsl1Nfc1b6NZ51F3GhumKGlRR6JA1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t23oHaU+M9zJPEbB7AJV2Bq1okBRim5lPFeW9ijzahw=;
 b=Etu/8GWmkOIR0EWKv+JSknganzqURZ0fS+7qqN63tZDX2/XOWEgoiUxoqP1xyuN7rQIlLFDwQ4CGHmhjAW/6dTgyBNyC0M0aPnwlFfmuRxhmh1E0LA2IdtVpZDkpoDTjmy/Yi4bi+V7rASzwN5wkyRoYibDicF1zzia4cEOtUYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYTPR01MB11044.jpnprd01.prod.outlook.com (2603:1096:400:3a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 00:53:47 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 00:53:47 +0000
Message-ID: <87tsp6u4x1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 09/44] ASoC: codecs: arizona: use .auto_selectable_formats
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
In-Reply-To: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Aug 2026 00:53:46 +0000
X-ClientProxiedBy: TYCP301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYTPR01MB11044:EE_
X-MS-Office365-Filtering-Correlation-Id: dd59ef42-6fbf-4133-7bed-08def41e567c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LPfnnnIM6KYXoyezikaIml2nQs12pTYebL3qmObHBXQ8RiuVaanMyZ+NR9q9Mb4UEXpYPMbJeqv1wYGQRKDKTfwUk1HM8Iu6GPro4flVF6gX8tXKv4tAGg4TMPrJ4IwM/0c0a980zgwzz7LkKP3TWFcMp6ie0DZuHtp0zA6G8j2jzSzAC+SMrA00B8O7vbBGy0TmtihJEyaNqlhiiO7of+fLUSE256x4Abnoc5ReDvPmgIw9vZuUaj+Ixmb4v7B3SiUHb5uWYdbg1HoiACQa2PpDcGpxKKmcdaTkMK9NrovFSrJDUE8o7r4OWKp+76yW6Ksihcsa+ffzgQLhd4vj4Rv6inBns1QNdwyhmkoktCUDeFnY9uwGMWEiifyNX7Wsr1SymKVUchEa2/ZA56iBM1aPcxMRubgtdSeJidU9vQs3F3e4dfPz7QuQfSCIWfidiez2ze/CBZigfge5kbGR0oZf4TYgHkRnDm+0JzaahqR9PXt7kQNvWnjcKS8VMPIfhoH29Qlzi8HnUonmnKSb33ONZ6m8H2T03mDs9/SbyHWXMYl4zj5l2O2cfCa6z/v2/t3v4el1z3tat1/5d5AZme/7l6CXplC0sDsct7u2qZJBOuApYexe4Euoh4cw0x8XA6mD29CQIjmg8/ouSGZNoaXvjDTvY+VeliP6e1TzaGymq6TfwAqlJvSDa40Q9DQXEB+PvoVI+AXglaTQRpqouCmhVGHoiaED8zbyxG0RNYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nnupVaC2hNVwUnSSf6IslHXKLCfuxJCcqawwn0fCL6Iu2z+Fx1lj1Sv7sgxG?=
 =?us-ascii?Q?HhKzvNbaJDxVXLK4U2+Cd7ePEXhFOtStvaPAH12X70sM+q6J5m7agdijftgP?=
 =?us-ascii?Q?opOdQEZ36wHn37iwP9yZAgsxlIjFv40LqulHa78NF2AzOgsukpMLWSzn4O6l?=
 =?us-ascii?Q?gBoY9jMm5N0qEuKfWzHwaKJwzixHNj24CaS5L34JHXKtZ68caImC85t1xedO?=
 =?us-ascii?Q?/c3eNxPpzZMKJbgS5ubAmmhxmZF/3tBNUe6TzqDbbqP9fazRBhQ+McAX+wyH?=
 =?us-ascii?Q?+JTeJGM6bPNmjbE/X5ZpVwd6k3ArQwvOBmuaCjzRomPjGD/B/VS4uL9meHN3?=
 =?us-ascii?Q?dNqP8RoUXX0up7j/ttZ0tdmdJiQ8rNEgaFZLg/aOSW2KdRPsoRYGQw5bxEf/?=
 =?us-ascii?Q?a8c9DjGaNI77jVWZhWp6envHIh1qE0GYOteaBogVFMivplrNhf8q5ZCq4YVG?=
 =?us-ascii?Q?me/3+THSy8nOMUJbUTtYectyY4VocT76Np68280VFrLD74u4CSCoIz4Fc4T4?=
 =?us-ascii?Q?AjiBpCa0FM1ymj5q82i+601Y6GjtAhYbnheMyJ5tVZgR3PT7ARdQZH/PoYk9?=
 =?us-ascii?Q?EUlGk6uRGS9iQhSqod5srdc0fyNBrvsa+Ml8zn3eaaw0Y07arduRi+iQpnOz?=
 =?us-ascii?Q?iKSgLLCKyYKUDbzUdg4RswpA6u9uo6klxQeiNt2Y9OwjQt/DjPtrnQ6mBDEg?=
 =?us-ascii?Q?vUZaI/Pzd+FL+WbuXQJlm+PmboooASz5+pJ5lIs7T3FjYW5e5DvoBxDoiyQ6?=
 =?us-ascii?Q?Dxc7XmUAGOc3ssoR3ZtnymWVipngRkXgrjuCa5hMpA3TALDJ0AF26chPCVCJ?=
 =?us-ascii?Q?mY4YBaopKBGHbyiarmANwx/iNjQXxmV0Q6dpgo3B+N+R6ZEScW/fFgFy3cwx?=
 =?us-ascii?Q?X3OXtZM4HreT3dhpjuutjE1/h6vFLwIVyZGSi7E4VZwCXPl+hHu29NXVEYSp?=
 =?us-ascii?Q?XEYFbuTC+Pup953WW6FpMJfSBlE7DVtbx3zEJ+j1N6ias0fvNtt6x9IhDH5z?=
 =?us-ascii?Q?UsbyGSP9SfFi1YOzDFyFLELqeDFnYxxdQiKQcpx/0S16cbPstRAUhoMcBM25?=
 =?us-ascii?Q?lENRTXNijdydhRVkw+rY6gJQXYtgj5t8wA1NnSiv9I6+Egsc7NGoxi7jwqsc?=
 =?us-ascii?Q?hwoyEBXtg4cGX7mznNOgUmU/Jl68Jww/MFBfk8+2/8kDtHNqDMdV5UBLpqEo?=
 =?us-ascii?Q?7yOHOXwDIRmmtwbfVKi+b25yE5E0XCyDps3/I52Yzgzmqjwba7E3dS5a+BfQ?=
 =?us-ascii?Q?8LyvyTDMEhumJGfAwVHc1gcJJ39bp6ykLewGpF4C0VtaKgdctlpzMF1ovipT?=
 =?us-ascii?Q?aB+o0qLlbKibjp+4B9EomKDPLCRGo6xcE4oTuL3w13CosQCDol/45cZ7FPsh?=
 =?us-ascii?Q?R3mZdvQC5emol29Wf1Xsf75B3hZQ/KVR4wjZn4McTR+zeDovCZ5YikP37l0G?=
 =?us-ascii?Q?1g/R7B73OCmreHjySGvSc7cfSAoJDP+9Iq3jBnnrpY7KACNzkgEiDQs3g/lr?=
 =?us-ascii?Q?rKqeSOhplelFF47g9Vn0Q6AQqDzYiVerH5Pwoap78/5tF0zLut6l8D2zRkfJ?=
 =?us-ascii?Q?t6jCpYJloGelVQUvRUZxhWGJiJPG0YEuXc5dGy5SXeRTCunWHB6V+4uBgvHN?=
 =?us-ascii?Q?PFNogl54RL2aHGGvx7lYMyLs+dGH95/4jGk4Xmyjx/1ypmXjVh5SRHmgZBjw?=
 =?us-ascii?Q?LjzZV5d9YvUk6RQKA10PQrBs4rYxgVKACvNUbJ20gxGtC5tNDbqF+jwh3Tle?=
 =?us-ascii?Q?1ojVchr2iLR5i4NZIuM+5LAkuVQxkBRTR2H4suM6TBVl1/ZwMYlz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd59ef42-6fbf-4133-7bed-08def41e567c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 00:53:47.1656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Fv8F9bYJumDFjh3GLjbZ3n80//HXGu0DdDKJ9LePMFgLF5bMQkKrCkkxySpm0Chz4SbVIpOL1Ncq0Ec9zaD90Mdh5vtXuxVFnYU8el+8cDPMGLKmASkweToTnX3HejV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11044

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/arizona.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 4411165c37345..5cc9ce03c83fd 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2016,6 +2016,16 @@ static int arizona_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
+static const u64 arizona_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 const struct snd_soc_dai_ops arizona_dai_ops = {
 	.startup = arizona_startup,
 	.set_fmt = arizona_set_fmt,
@@ -2023,6 +2033,8 @@ const struct snd_soc_dai_ops arizona_dai_ops = {
 	.hw_params = arizona_hw_params,
 	.set_sysclk = arizona_dai_set_sysclk,
 	.set_tristate = arizona_set_tristate,
+	.auto_selectable_formats = &arizona_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 EXPORT_SYMBOL_GPL(arizona_dai_ops);
 
-- 
2.53.0

