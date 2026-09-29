Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E63EEAD2
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659817; cv=fail; b=cSGuWpp6iE8jAku5etl1Hxx7iKJAvnM734Z4gk0fomQXMBWi90g78IPqKEZ1CcCSuA6LumWo52LQift2VlGKogoru4Iu0fZ2VhMIYKrbubcSmATSNS77X6OEPM7RmD8GRj8zcaPl9BKLGCHfJYcX9duJoklNsWlYlqI0A/wQW+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659817; c=relaxed/simple;
	bh=QRUTwJVQm5PIn/HFyx3jYULUFpL+/FVnImVulehWh3Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ns+zwUcTi2XVj1Oz6JsyKlhrTh3EF4yPFjC8Menvl84RmGanTyrOhcrAO3xmPeHrF3sWM+6rOER4oXg3fEVrcauhgBCJXagAjP86Hzm8dTAlwesLCBS9uITqIUT6o6Nyo/I51WpKJgVwt5LTmeiDy1K5UfEfH2+6rygTct1c3L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MSrH8jJS; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MSrH8jJS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pX9AW3u97fqGIvUjTXAUa6Z7q3ZaxSsk+A2MHSW487IhWXTCMBSVH2lWK3xMhaLf2KdLpyDdwCvay7cSKCYaS7s0EOi8DFeUSvFW6WI90RhQ96A6BNfFkKlh8UPN+Ee+vWh2arvnoR4ubwceUx/KV/bl+nEd0ChJw5Ab8J3bGh2JqQ9xQ9qworY+U7lGH63YaSItOiMRU/z7vi2AsrrFc6X0ymt2qD2HCkpTOF6/UWM7sAp2ecFMFOZKgaWIeSUD2IvDwH6ovsCEpKaxgr5BKGNFewXrHWk43ZVyVv1AL0O1WhcdlmnukFSHHTh6rXsv49OlzwjV4YTmIO030zjguw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njb6+cFvFdMlEiUtzmyWqU3iywmQ0w3FMBEpphMQMTY=;
 b=CAYVoxR+ZDprKUNt1mHzj2JwG2gOB1c1BhUbyzuji+QsUbI+zwh5ONe9JJ4mPGGeUjkcxYcaD9UP0HpYoGHUn6QpLF9kCsflUYifO0wIYjaXAM1oWc+tN570OhLwUlD0Y5VkRFzJGKUCKOwJUXkZRK5a87ic/bzl32FxsA/h2PTPttnuNmPnuxHD5Ts55ehoWWK2WakKtYMu/DIDLwIjnVkAbWKTRz6FI+4Xc2Qv4Z7tmQD0LKneXaGB1ex1p1JLLEB5rCHxQTkBAcF8J6LUeYf9dHOIjtrJV8jqpMxoazh1LQKtz+DHaWZTaz+VehnlGjCPLriiGOEp2V6fYeVbUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njb6+cFvFdMlEiUtzmyWqU3iywmQ0w3FMBEpphMQMTY=;
 b=MSrH8jJSPB9XJ9aVWolQ1qJIaOBdEsvVUhoNaVeE8sVMayFxlGfi01lGo2sVPkVKWD0a6Fs2hHWZsM+t1vTwmFjr1vATEmYLdOpi/QflngzpLJazXJFdn2R8Eh8PM6DVtlgNvE94wUVBEDP1GlPHUbQ5GGCeRtd+nIlVLWjypVY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12208.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:30:13 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:30:13 +0000
Message-ID: <87bj9geiaj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/14] ASoC: soc-component: move snd_soc_component_active() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:30:12 +0000
X-ClientProxiedBy: TY6P301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::10) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb4bc84-fea2-4713-58ec-08df1deabc64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	zDblxZzV3WjcCwskGET0zuXbHd01TsU6iuLN9GLwP2WEft4iICFBdLHVbzaaRekImMhDCtr8SLedXCfgbH8C7Uaon03KiPHNSlBbQb3WJgMeVo9Kp0tptI9zcW+QpYdXM0a4yhAlQLO1of07HFp88ZYLZcUF8igqZZTqVRc4Asm2Jgw+QxFP0xI7fJGMxj92Ec1gj86k2ypttBms4HAoieGEQ6yf/dttaiCYwtQzRblduHp9sZ4OpC2w0AWWcENtB4qg5xMj6adI/FrJrbRICtqGcbwGfHytp1KwfgZ/xcuevaU8rpa9dlKiOavacX6b7RVFfARhRyE6DGK5P76oqxH8GvnLZuNmUBcbn7fn6n6XWoND7HIXCkQeZMlKFiU3uxW5+54N4hLJ9ONDdlrOKWga2rovyFjFXVYRSH+owS9sV+4aFnjg/njdENm4bh79D+knaMfVLVIKbww7PvGbPKKxphrUjoH+4mung381jUChHqBciHRq4G9AxNx8lo6Y9YF4UVelYwI7UGa/ikVjMIrxnCmH8PhlCroQEXo1yZo4jGweBXTi2aROAIMo7ie8q8KbQiIbfDw42uydeyr85Oca0eSxDgmz8VgsJb01gkL+oaKgFI7eCaYul/yeEl1CYWKuX+p86VOxvRP3fix7dcjU2htlxdr7DAyrbgFgHqNSsiNl44iGvpOiXpe+qAyz0Iao31bKMBqTRN+Tnjneurf8GJT1F1NBdr8K1TDcMl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Aging9jlKQRPYzmfWYmCfgPH/RTC6oWcReRq6TX9TDbVaK0/Nc19bCL/VJ3I?=
 =?us-ascii?Q?1MvXZkSV3vP95tVoiGuglDsSgXo8WjvIJhvz0AATcdyCQeCoZF+qiLzuxge+?=
 =?us-ascii?Q?F0nvd8PHGXPZCF4gArPeaYG26uF4Jjr4CKLvu3x+hE3FE14RfG6J8zVsjcGN?=
 =?us-ascii?Q?14/z1zqe6Bx0L/T26QHx8o/lpI3stJyU30XwwQmdUhS7MpO3b/O5r2rlkv7K?=
 =?us-ascii?Q?mbu0gJclCejcwe3xwuksTWeZydCOUPk+Z9gqpINggklsYhu41yR1mOpGV0Ht?=
 =?us-ascii?Q?FUpT5yr55pth0QNMTFYKCDCaevqqT5xBVNUMJnKnd4ctS6SUNFAvfUhNZLHP?=
 =?us-ascii?Q?TWMneLlX1MrYbn2TLbYlWPw914JUoOTfLPSnUZCEnrxMR/ci8aa3QB4cTBxF?=
 =?us-ascii?Q?rMhpTEj1KQRl4qr0wwFeAkGNkq4wnHh2DlcoMk8FZAudOaYcFZ0YnOigXqbo?=
 =?us-ascii?Q?AKZOgGOtczLe+hAIXxBMtm4NxdWWvhxM9/XptJfaiT++T+jytEX1G92aQIGe?=
 =?us-ascii?Q?WS9Ct71uZQdfHxwXng10GKpTlNsLXjSTmCa+swgT3PUNSuFTtqarOywoy16Q?=
 =?us-ascii?Q?J/wOQkO5rioJaKCkjm/tgdNz8Mwil3NQYyHmKxHtv0ZTtB75Q7bTpZLtAqI3?=
 =?us-ascii?Q?kXrBmSgrFcQVuuQHrM6Te3JzROaju37W0E2RrZQISn8hQtfIJqapDaRZXtKS?=
 =?us-ascii?Q?exo2vdfv3TS5bMwQLKPHHRR5rABAT5yA5IojMCFt40+DzqJOX5yeS9aByKOl?=
 =?us-ascii?Q?RavQNnd5bChm4Z0viLd0BQg6oX1Hwqv8hxLqYLInCcfJqGtbyXLo+jNbKtdJ?=
 =?us-ascii?Q?I5l1abMObqO/RmcGyMOE15mVgxLRUJ8SoSAMs+PiHOaUvisRltz0lfA8VLQ4?=
 =?us-ascii?Q?U4VoQc6buVZxsfLrrY6xfYCIvHVA1rspwRGG/Z4WZ4j7kFo//AHLUyq8A71t?=
 =?us-ascii?Q?iqIANdfeywbqtI9NR4m3S2fi3n7QWXK33LL1a7m3Oi5Rl8aAbCr9v0ImWSgB?=
 =?us-ascii?Q?VRQELApMK7eYEnww9tR58euFIVvo6ZAh/B1hTh+OjnRNbTKH5RdXz0uFNTpH?=
 =?us-ascii?Q?aW2tF431FHikv7vEa2wztcxljP47UtKP8gR4Wew6khhypOjBNQxdtNXPp2nM?=
 =?us-ascii?Q?N+d0+ytHaWCBGpqxwJORQOeJIeAmx1IWvEGvsh+0qpmkY28lWVx2wXH6D7tM?=
 =?us-ascii?Q?uhLt9BxTZk7ziHjxntl6RdxRsMrKjjCDlc9YZ2cvVjzpXVEKe4oSsH0w0d9u?=
 =?us-ascii?Q?GG5tOy1Xr+rlkwLw9wLApoiYUpxXa/17y4Nd3a+CfKL2B/uphfG8OXeGFB9Z?=
 =?us-ascii?Q?r4pdWjAfiwM54wcEimubBdo+lFd4KOAmr6Esm0wNkqRMB6TCgiSwbwr0gPrh?=
 =?us-ascii?Q?3lefc290pDZk8p+sDR2GJYDKWCgW/eWKOOqA2xV8esjOFzE1YuMGkPsNV6/7?=
 =?us-ascii?Q?+KkjRDckFZFNY/QnaMDdioglfOiSpXSyoSY02norlrBaaX6dIYbwGfnnG9b5?=
 =?us-ascii?Q?kr38QyPS8LlO29PtD084N3bePntGzxz1sO2cs+Ql66Q0wZ9Z0mX9dA9Fl3T3?=
 =?us-ascii?Q?AsgMC4q0Wz/9qN/MUpvRfWu1QHxzLa8YJ+VHC4RPULyTh/m2+1UJR8njoJPp?=
 =?us-ascii?Q?izmtKc93VxW6iVz2WciiFaBOScUYV/LCPH324yyuMJqEcQ5AEPS0QgQaRt/p?=
 =?us-ascii?Q?5L1HGE54lgNWDtA86GrCdyGsj3SrRx+YZqOuX1/0beSHFup3n8sFN/y1SowV?=
 =?us-ascii?Q?FgT2h33mhF4Ulpn1t43SXpeUZmko9eVjjgv9JF1hvz3MdQf2UU8h?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb4bc84-fea2-4713-58ec-08df1deabc64
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:30:13.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+fZ8PUygYUaNfPRWMccnmMm07Ux/Ux7VHqd3APOrIqpw5o5QY0Xdl45bMXgu0O58cxPFfIZB2lx8mOV9HzSy7JmyvosiaqQMsKKbgLKxFWZBEviaiq4BcDfKNVo3DLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12208

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_active() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 6 +-----
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0f5738154a23b..f5249de004942 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -363,11 +363,7 @@ static inline void *snd_soc_component_get_drvdata(struct snd_soc_component *c)
 	return dev_get_drvdata(c->dev);
 }
 
-static inline unsigned int
-snd_soc_component_active(struct snd_soc_component *component)
-{
-	return component->active;
-}
+unsigned int snd_soc_component_active(struct snd_soc_component *component);
 
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 00f7d412097f1..236675e6e75f6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -74,6 +74,12 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
 
+unsigned int snd_soc_component_active(struct snd_soc_component *component)
+{
+	return component->active;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_active);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

