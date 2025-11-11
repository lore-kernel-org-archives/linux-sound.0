Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE1223DF0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821240; cv=fail; b=IFwcpHFpS2nYSJ5ILZQrmIqoi73sRPfdLEcq9TkT7z0eSBXcD9T/BIjaSQat8pqWY0TDvqzhIPks95+nfAMTTfSAWCyaWhfgdhWtqcnSbLvjufmWnFpGcFWJA3uWaJIPq7UrV5HWgFCA5jBkrBHbCey/3/XJEIpH7tGBwrh+XM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821240; c=relaxed/simple;
	bh=zFzhu7KnAS+Jn7/PLbS3HSFFwx6XTzAIVradRxEjXGc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=a2btoDRQTNWUXqXNa/R+FiGh6KadsjjKHWheSIN/fEKu5BWDUQuUq0/YAcvuW8eu3KHPeIh9rIZFCqaXjsnk8oWODmiv4wppf0//6iehhmEpV/O35zTOxzU5JgL3ctlrz8L29V9lzwzgxOshHUdKuLdV63qg4dwopuYOC4HaCNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L6b1g4WW; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L6b1g4WW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iA0TF6hYV2IAmJ2O3lmkwz3RLPwWyVyyWC0aAgEF0RxgBHhw4CaKPYaMSdaEuHEGcwn96SNL8AdE81BgCsqmliZNf/anYQ8o2UnMlP9jAoj2zsn2ISRzzLvtnn5HDr1DdyIGX5QX11Z1TtkyrISPzdOujHQcljDX2jpGEkDUUId7Z4qfr9VTwCP3eriynJU96QuVCUzj4SEEKofeyUJ/q4WYW6SxfUAi+kgaakJDnrxlimtOI4kl80cY//Qm6XSQYFrSM2q7iUyRvlCLLAXfLrA72szIPiHQGI6ECAZH5I+qwK6nQmWdaUajK+R28F2hTMf9O1wcYtSlsldfPtjSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRRp1x1CFvTQfbLNs5qBq08kbxXpVX5GuBIUZhDNKP8=;
 b=h93Yr88MxptHOzkwZoeiqJH0P8EabY320Ev5eeqIgZGuo3OXcaoQnJ9kx26/YzA2ILLo8nQoQV/QJ1z+tEtn86kqyWZ5hqaNLiYvKjIjRacW15xocSobva6BYE73MYMJwJCk+okvII0OvGWAFTBRJMJzgqEb9Ayf+88+mcLSPyxJ4jPrcBzAMjjl284TQqmNqbvifht+t2XI0mWZQ5w1dHqpsNDYnS1zho6RAp5+eYuCkZrkDkANeTxkLKNiudu2Ur+gBl7nX8UfvfiXAqNGjH9jmLdhc4nkMeNkWwpQSKAcwuJssTlmq7blhV6g31WC1yWXtVtfs65nSTzGEMEp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRRp1x1CFvTQfbLNs5qBq08kbxXpVX5GuBIUZhDNKP8=;
 b=L6b1g4WWsHCjBpG73H6aQ3ZflftH/6Mdn7CxTQHJmyrfsvFf6YPUi6pJYCYesaENY0td5CYAXEoRw3ZefdzRklgEWc4nRzjHfaAsssGRiZK2+gLwvQNjNGhCPcmAeN26l51jD9UBzF+/5KJ96WZtWvewafgsZ057rByiiRQdxUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:33:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:57 +0000
Message-ID: <87wm3xv24r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 235/292] ASoC: meson: axg-spdifout: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:57 +0000
X-ClientProxiedBy: TY4P286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 64649066-74fd-4884-bae8-08de20ba002f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e50sXb2kjt1635BIEzqnUKgBn58E3IWLspOra74S2aKlcpopk0elzxOKwdDH?=
 =?us-ascii?Q?HV6qrn0r0nyOwZjH9la6NeAfPg7ib6nTDxYi3ivQEk6dO5IdcZsBWMXsUFD/?=
 =?us-ascii?Q?Rcx07aK2ZwndgekOKYaqhnU4Nvtf3vs2afUOTYtUhb/cp9hPCJQQGP090AU7?=
 =?us-ascii?Q?2QAEPDwerTVnDBHJpHPFuYaZoANhcJwixwrBqubmDlYJCsOZcQR+MpQhs8pU?=
 =?us-ascii?Q?tf7BFAfdQPzHvjG62YQkA1+eYgSP77XjHO3pOB2cUSf4CjjxwgWMhnne2l2P?=
 =?us-ascii?Q?2SZaVoEHrhWy8+e1eBKBkLAdr0FRjTcXsFebvvzcica7GHGVzRbOu9whpZEp?=
 =?us-ascii?Q?jEJyZ4PpCFk+gzTwcKf01hwTKQqA1V9RrFdCSTXXN2TTl2lJfNMlSJXGtF5E?=
 =?us-ascii?Q?PkS0WTTrp8mLK4/e95k11cl/cGLIHMn4RYsSJxK86LYZeSkGUF9Qv2HkafjS?=
 =?us-ascii?Q?1srTMjT9yKZzlUF5+9ONPPeaQapGpBAsTql5qrdFWsKidEXevmp79fBJAHae?=
 =?us-ascii?Q?8Ns9P2nbjtM+hFQ67AhNWtJjDqS+MWRE0Y9GLfZLV9z+SdOkxwbunFbqHi+Y?=
 =?us-ascii?Q?vrM+x7O08Tmeo6SEaZPrI9aNokpZ4psQXdu0x9PjajecNd3eI9pmz1m+ANIx?=
 =?us-ascii?Q?CMsYNHGa6A14uiZsbXQZqFpY0PLVO3dq5WUeBODe/br3GaTRWw+PS0GeEinG?=
 =?us-ascii?Q?otju3jT8fPwQfk/bTCfeybl4jHtFbYBEnOiaYnypvwdfvoAvHdsPROkPsi82?=
 =?us-ascii?Q?4dWbai7aIEvjWaZ6P4xWUTMNJnhvFyzJQAEwttR2/uWPE/SHhj73wGOF9uNg?=
 =?us-ascii?Q?jaJ/O1rWZWeTrNteFZKw4wUcR1IqrA93Hd1HacpZymjRwtekJtiU5aEK/+w6?=
 =?us-ascii?Q?DIKTsSJMdTFQYACkac2HnMTqDAvCyXNrXrSMAs+OdeOVo5XVcnK5fbD1nsYv?=
 =?us-ascii?Q?VtNDcVzI9qH7VdoL+C3ZNO1MHKhbyyB/wJ0bZ2+/XwKxYqMLQ/zYNrIVlbr3?=
 =?us-ascii?Q?+p1k9IKDxL9qQU/Cef0Xnb+lP0l22F6IPkx/pCHc0SpQL/EZqazvirTcgDgb?=
 =?us-ascii?Q?C4z26Ft0Iu1lO1yOpZV/4EiEVRzJRVaAqMDW4XqlLm9LB5dZxYvDnp5K0zEt?=
 =?us-ascii?Q?tldqiXLMRBRSl6VN5LHY3UvT3Sc/9DcQWlMd8mDqZ0r8uRBMRke7sAkxeJmt?=
 =?us-ascii?Q?VuJS/5SivTrvO51/iNtckfjrvysLzNhI5FK376xSoJ5bo3Lc6nIuoIT0sEGh?=
 =?us-ascii?Q?oSrhwCKlaE/UTFYZD5FB8G/pJk2ceyrNPhmWmQJUtuQ9ZkB22xN7IKOJ4i4J?=
 =?us-ascii?Q?FQFA9VpBoT3YRl/6MuyMvWT+cn4NUkI5+UDCSysxUr8zBJrFQ6UNHkERRmS2?=
 =?us-ascii?Q?u6+wW7tOU6eVhaKderMm+K/ZCb9KuTyVx3Fyd3CammMxDahgLihm4Xi8L7Pn?=
 =?us-ascii?Q?Ld9KDfBQv2Z63xAeMWyYXRyaVexzcjnFoFJm1RDKpUzPOGEc1Xx55ScuRCiL?=
 =?us-ascii?Q?lOS0rEAVC+TsthfL7aBvVqMG/cFlZL1R9pfa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4k6nflrRoPO/zFfug/jyOjBkyQwpyu1kBu2gT7RsocCpOJXYlcjmTJyKtfQZ?=
 =?us-ascii?Q?iIByg0GbApAv99L5HyEXRfGi1Pkmk1P9jfUYFlvBIU50fvLY3PsWbf69v+Jq?=
 =?us-ascii?Q?6S8CWawDAsHn5kRUH+G0LZuem50qvefdcU4G5jK2NBWokIc0pLdV2LurGGnh?=
 =?us-ascii?Q?rplZNuhhShCxWemNRTBTX91d6hXlo4BshXMbfMe//12mKWdSX4DE+sAa+HJg?=
 =?us-ascii?Q?mlGPQzU1VrHGjf4yAiQTzszxoth/JMfd4IDhjGcIelrEo6K+VW2+vokzSs7i?=
 =?us-ascii?Q?ZLJQ0iHsKBfYFb/zsUAHXYF2GiEDpBe7GvocW7bVqEX6FDSgabp+V9NjLnbO?=
 =?us-ascii?Q?8XLm9lkjOdvFvp+uheXAbKrHrYFL01huTQiPXTPq6TlJvhHNuuXWOLMiCkIl?=
 =?us-ascii?Q?25YWIyv+DfKLqfwKq6Cct50MwvCpa695EA2Sax6wpGRPURTHdTG2vlqzYdg0?=
 =?us-ascii?Q?0ptu2rmeZnQhBzNA6r9s2aoFzJB/U1x+OPnJJoJshEhGyAqqytdqTWXn2Pji?=
 =?us-ascii?Q?Ln3+5bSadHxyOwVrZVfwxC0kvAZJmMfjUrCitD7WMaivR/203ANIA+hcgbkb?=
 =?us-ascii?Q?lpxwKbNaGZJ4R3XCBcK5nMi69bx58rPt6y5ay41V3JHtaEZZ5R24YGKpkAOd?=
 =?us-ascii?Q?CkHbgSQAJ84w9SiIuVfgroElPQ570bevOkLO/ZOEwxdDfn0JBxcup6fsjIxi?=
 =?us-ascii?Q?N+pv59TPYUy2pgJzGBijqSnzZrpw8Y4pxcW+6qUYWiONL6EBcbVzzAHFmoV0?=
 =?us-ascii?Q?tAuUK3ZNwU7ZUJsCltVJgHajtDYsTVAPnre3TcK+PaULwxsBI+BKTi5AO/vY?=
 =?us-ascii?Q?rWaOs0nMeplLf1a8PXQrC+2k0puOcankUvOw8wWUqgRd0WTrtJmpbA5otOi8?=
 =?us-ascii?Q?gG0172BfYeCqdDZ2gyjJgCl+6lKi8G2e58gkYPoQrugj93K0+IPuJKq8oAPh?=
 =?us-ascii?Q?0LtLEGvlpOTTccqHKlme6AYftHL+eL+36Khl2mZH88l2S+vpv5pDVOMaFxS5?=
 =?us-ascii?Q?EWkkUXKtQrsYFs0e14j/HE8n/A98eDL93+uojl6E6Ec4+mPhXYUHeIlVc808?=
 =?us-ascii?Q?Q+dKTpvDoZLAqA5UoOCgVhZyxnDOPpJxa4x2jKxUHyU49BkXhd5pN82h3Y/a?=
 =?us-ascii?Q?xShXe/Cz+iJdOzARjyYShrzq6KThv3poBzumKh7cfeZ6ybCFnQ8iZeMpWuPg?=
 =?us-ascii?Q?jc9lBVOBwxsacHJedZsrxlJ5TdAWqKHPzEfwIyPu6ug1sJc3Ce8H/gGJ1gEp?=
 =?us-ascii?Q?5u5FhVxtCQRzyhabdJYqja7a5gwSLIUDhMDDm3uptei3j9iS0cLaL4QyZt/C?=
 =?us-ascii?Q?ATqJPXx1IWLWJYbPd9rgJzOofx4BCsaO9kY3Ia3gW5aG69We/cgpzfHmTKvK?=
 =?us-ascii?Q?Bs1xzC2NvQIUYakISTVMzRS9lv269dAMOGFPAKO+KI6nNlkyWTHiDbxwYrZ8?=
 =?us-ascii?Q?sSDVBRPMbgEAga7GXKoUfuQAC/bDfdRmZcddLXmkjKPRis7EUulFmZk+99sW?=
 =?us-ascii?Q?r9C6txmsI1QdwxfWosKwR5S0tIu9AwNHj2+yZ9TyCV92DUEgkjm4Uzw+UnQG?=
 =?us-ascii?Q?vAEcSEp2FWcb4A9gNtUsvVFf38Djk0Sf07d9zjhjtqwZsq47AHaYk1q2iCed?=
 =?us-ascii?Q?2rWxZI6vbBFlJ5tiUNxImr0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64649066-74fd-4884-bae8-08de20ba002f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:57.3311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9XW0rMl3lV7BVdMrybCYWvZPUjr3TMG/wWIDg3aTh/RvR9/EYgrdTMxag8ozhlLqOk6YPzpLWnBxwx9D8/w9UQL0ohA2kz2EbCi8KHGRKrmxTnjnmH2gW+bv9SjVKWB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

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
 sound/soc/meson/axg-spdifout.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-spdifout.c b/sound/soc/meson/axg-spdifout.c
index e8a12f15f3b4a..84868fe574e0a 100644
--- a/sound/soc/meson/axg-spdifout.c
+++ b/sound/soc/meson/axg-spdifout.c
@@ -352,8 +352,8 @@ static int axg_spdifout_set_bias_level(struct snd_soc_component *component,
 				       enum snd_soc_bias_level level)
 {
 	struct axg_spdifout *priv = snd_soc_component_get_drvdata(component);
-	enum snd_soc_bias_level now =
-		snd_soc_component_get_bias_level(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	enum snd_soc_bias_level now = snd_soc_dapm_get_bias_level(dapm);
 	int ret = 0;
 
 	switch (level) {
-- 
2.43.0

