Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C591DD889
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820896; cv=fail; b=IVi3RHqjl/sxD5OoRveThfVUvObk3WQFtHeXEDwqiObCzBs9Wp4x7VsgwO79qq9sJNTZ0gC59k1FHoLma1ZXJVZtjsumM/sxRCY4Tk2bPOKeDHOaQuWF3Uz9uYa8ubNdI4aGhNyCZmsKLhK6k8MV+6c4mkJxHCMcybV16eyJYa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820896; c=relaxed/simple;
	bh=pZlxv5EGfy1X13iCcxkWzYGMUa0uA+wgnwYZnPy4NXk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=N1ZdpAiM5w7SmjZdGu1Y9oYPfVA7fU248HG5DlX4ezQsyBNXSwUsWVqBaPkBTUE7sbu5+7iQ4nMF0PsSmxUsbdgeaPTeRg4lD0fYjXofoDqA4YodTEFtHXpgot87wbRlQatvdOsjTSRi03/qkiwhGdvU8qOIcyrCcCe6+fSg4MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A8T1ysPD; arc=fail smtp.client-ip=52.101.229.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A8T1ysPD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZuSXQq21pkEzNE1rBvYEIgLz520GYUxc0j7l5A80srX+x7BNn83bkuZHtgmyieRykKJbTbiALTi81WB7Y0hPZVZwToztyv56i1D7eSW6EKTHYEjuKXhQl98GmMrxN4labkLnUNT/B1cON/PqPpCuq0P2zBY+TAsMNPUF8YmbkVjHN2/Gs8l8ezR3r4lxcwSma8IEZwv+z37sL1+Yhw31EBo8mrZwL8OC3ThADFn6/OCjKUiZQj4J+RbtRKO/5VkVDWLnp3c2c4sz0Z4dFB7m23sYB2UCRMDmDYM3H3xMi1P/JZYciWY/P/uzps/rQaxaSRfIIUqpu3nNgCaSUVTug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdWdW4B/zLMMs3NkL7nQHu2auK+bUCR9rasZZrW4h5A=;
 b=uQpCBABAaIwdqckh0zEmGKv3Sa9B78fKBcx57kCRZxlZb4VY5FH5SeNPsbhUT+xTjDLt/DrRESR8XU9qwBoiRgnnEoy/k8XEI+h2577VzSCXx0P70o8U90LBeqeUo2Ah7YTqtUE2HCSKR0gTqUX1OskDwDFkXOLHz+Q+Z3u6h1FrEYV6S2OZOMaPkURFvX1CKlTraO9A/KpWA7/8WSd8dXj0JOtr9+XuxokoqX35x6sDyPEG5NHaiW1hfa5h7ZOAHFL88XEq00ohIf/YokmfFE2EIi19agOMa18J3aCQb3i20Wa/WyvG5SzjsXSyQWXy0htGzf3+4V1UqiyiUWbYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdWdW4B/zLMMs3NkL7nQHu2auK+bUCR9rasZZrW4h5A=;
 b=A8T1ysPDW6lGUNHXAU+i58rj9CSzF2dPeYzNt+y4WYskNmTkPftEqhAnFm8g0Onph8mocUiOJP27AsrsmCD2RQI2gmSDLCkdwmIEmyVhbQ4UfWi9mOOjsk+2MMQ28oeREOf5OflXazuP6ZVB5RjkAyOd6XPEw4UYiYJ8L4ONEu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:13 +0000
Message-ID: <875xbh1kgz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 154/292] ASoC: codecs: wm8400: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:13 +0000
X-ClientProxiedBy: TY4PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: ae33293a-4021-400a-517d-08de20b93313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?voC2oPmh+S17+rxsC5+WK7d/89xFRmKTsDjn8MWwdOAktwWeAYktmmL4Ova5?=
 =?us-ascii?Q?9f1wBYF0smAeo6EcY9V7Kuz9lU4NAqgKzKI1Jd+gQhzY/0OEM4bhjDcq5IRO?=
 =?us-ascii?Q?FgtqqT8i/UMJTCR6E1XX9Rz04SsiKj1JIiWSvda+Aa1SyYky1+TJUJa3gy1S?=
 =?us-ascii?Q?b1CfqyGx3FvRnybRxoYf7sMA6q5UwYaJvDBLdRcBS2oOfsOTIvFZsledD8eG?=
 =?us-ascii?Q?iz3FAEgzAwoJtyFa2bvp5SyV6YVRUzfCtN5x+yYfkq9n3f160p6yPe5jKLun?=
 =?us-ascii?Q?X3yhvlxkhFqFqtJobZw+f0IgexBFLUU7ewzo4NbEL9JXFyqJeY3rS8a7cDLE?=
 =?us-ascii?Q?epSBJ1k+8cfIELuTAxS35prR/qZtRFzX66OZunBjSlR+YC28cNvcg1q8U2Er?=
 =?us-ascii?Q?ouduivckp6nJSzIMHlkGS8NHegfRR2sEfvzZGBxNRFXeEJzO7ya+Zvq1akLk?=
 =?us-ascii?Q?4hwHvUOd4VBdckx84euq6qyXTdJTS3sVSDapUVDBStEW+h7FF6i8nWfGzBSC?=
 =?us-ascii?Q?zZK7vpK63FCMKphihn+ebieaGMenZ2vB9LP3GzVOP9PoCdwYoaQfq7/PQis6?=
 =?us-ascii?Q?WL+NgV2wJvLYP0bPx6WD1Oa2sMuMLduSRQGgPYsQWu2GsJxS0efEgBKmQFcy?=
 =?us-ascii?Q?e/q3MobvlrtIvth22xSnZ3qwkT/mP+gS+PteI0xx8LOTObsjU1uIXWXxFrdU?=
 =?us-ascii?Q?umeb72S7wguEhq1xSKcd2EZdbZ2VwCC16Q8jF4fFDztEH847ekUbAD8ET6J7?=
 =?us-ascii?Q?2gVaAzjkgCPMlqy7DlIdqA/q7WHzHl7TbAEWLS5U4EYFXVHK1Qu2uY5Rp79d?=
 =?us-ascii?Q?YTTTlcrzbC1sIg07FehtXeZXl0ysqoyUf0gOgkY0LFgimjnc3jqqm9K75EC8?=
 =?us-ascii?Q?dCKxMofnoNkwkGrJ90F/FtAG0SS3J6lJbgE3botRHZyuqvAtOH+8IOy3O0K/?=
 =?us-ascii?Q?YP67yEyNdI3Byoi8oWRXqGWtgOG3Db4pSuDp/wmbLZPu01IAeMfFATqeVhGe?=
 =?us-ascii?Q?WbST+OWzsCfbfy9Q/ZqPCmFjRg1fW8vuw6UNRF97Jb8qb3Jhy7vYOS3jP4no?=
 =?us-ascii?Q?RG7fwrxWhSYwgb3HQSeXsBD1JSXg6zKM5B8LU6bsEnDWKY41H89le1jYZG1B?=
 =?us-ascii?Q?0egxlDTIqkmyv76PezWI90zezZaqEJ2q6ep2Wlr1qa/kUwdRbdGO1WyUFTkx?=
 =?us-ascii?Q?utqBMUV3yKJMAv3ypnZI92AkX5Le22uf8JpZRSdOfuqOA0XBYNwQU3R6lt4q?=
 =?us-ascii?Q?pv/V2h16pOBvultyQ/C/vhq1V4v/XOfMXgIrFBTPQwU62epjZDMgYqlmpQ8C?=
 =?us-ascii?Q?9ywPxG82ZfgOmUzjf9UGPqhBP2g6c8mG7ziDk3TEz2yMkJLJ3q1Ji008yZkN?=
 =?us-ascii?Q?LxOJBTo1BTXBY5rKRhg/qTcIz+73dkp7iHhcksLTxbds6RpQi3IdDDf9QiSl?=
 =?us-ascii?Q?fRV46+rbFW4veiqa0mtxwSTc6Ju3fxwJWpSHIz9cozFSE1+WVSIygHpACrbw?=
 =?us-ascii?Q?uBzRlRdzMXI2fzeSSgGECtGeVPa2nXs7OoM1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IuBVxuoeiT4KsC4pxFaCfosjjvqiQZRTOucH4CX1loNLx1Y9iA7ZELIQY0n7?=
 =?us-ascii?Q?v5rdfaynuFxsQbLIlUZraHbuuRlRdMeMaoZrlnq9+PMJDinYBPkAP/y9z2by?=
 =?us-ascii?Q?C4biMnHFeAe4kzabI2rok6bcNDgs/7CpPo5bni1x3ePU/Z7LryZ6ExvckU+q?=
 =?us-ascii?Q?jOK4qIPki8DB4QcIjgfhktL6l8hFQBkYoGSjn/YmhP6+aIfI9pETZzA8K0ay?=
 =?us-ascii?Q?kPWDqKYGKfGdvb3ah9RJzP4S1GV+dCDUQQ08pN8t2TJJk8gmhDc1PtX9Vrro?=
 =?us-ascii?Q?FyZhoydB2IEfjp9zC+zccNClMPLkIrt9Qaxq7820eaC+Tjeai5OBWmYE4nlN?=
 =?us-ascii?Q?1dgYG5eVCzStciWS2enJ6cbOGcdNztuHbeyK652Ql/JQmZ4bfeqxx3so6QVY?=
 =?us-ascii?Q?lpRpTY/NhWEEztxUjPi3B8PqD1E/W3IyboLqsMupdhwhY/NvvxmJiZZhn7qf?=
 =?us-ascii?Q?HQcUxAlxBu6ftlMB1saSttfhNKa9MAb8J1oam1ohKMrN2hTa/x/F6dDQHoca?=
 =?us-ascii?Q?joQqK2LQznsJpmnA//2rfaa7KBsWJ2CHLJNsFM20X8OWOqV9zy06Ptpk4/+y?=
 =?us-ascii?Q?pZ7Z2mPJxHEWFfyymqt1KTvCr8lwWV59XD6xkU6+svymaU2aY7yrc/5rA2r1?=
 =?us-ascii?Q?EG8sr1QuMW88U+3AwlCKYUcq0WgliGizP3NMVccJpd5KUTUXsTBWPDa/FBHB?=
 =?us-ascii?Q?NhzSQmwKYnDpVr8QqIXp4+Xa+L7M2DjuNQ2J0Kc0iB/hoq/G0f2y3dy+K+M1?=
 =?us-ascii?Q?2imKx6MDJwPsGzrKmOnekCZkC7gfQcwl2EYE968isogJI9uG+YRZv9geZ9NF?=
 =?us-ascii?Q?tgYOiWRe8FBYzNcQCXV98p8Yy2dgH7r6CI5usYhmrSuib0tDNob9HuoAa6Oo?=
 =?us-ascii?Q?vdNGxBM7E6Yigb9dTDnZkcy8jsvQ2EEaUZ34HSzauzHfj3alrqOJJBOaRsC4?=
 =?us-ascii?Q?a040vJbeCE2nFzNZ4FSDmaUJwwKx+1VjP3FHl7KJT+Z+c2HQz3z1qF4EUrD5?=
 =?us-ascii?Q?pvn+FwATKaahq63nMPjDxf7IjnJp0jHozpJES1xe0XJF6Zyozq46Gs3cFITx?=
 =?us-ascii?Q?BwVrLJdfqApbbzAM96g3ad+GUStlcUxH9g3hKhQhXInrQmouh17ogOZG83QF?=
 =?us-ascii?Q?sbdVOdDt8dfhwrMCG5DVFHmImiw9LZ/RUsUhsEK924w2YoW9X9ktMslRzaEY?=
 =?us-ascii?Q?qWupe4t/30m1oehQ1BrvxZ8JTAhmbQFJEumu//lwiXDk6A9db7k6fxYEV4hF?=
 =?us-ascii?Q?PGZ45DBOdc/1IcqMwmdOo5ROS5zAl5RtgyR9yxEsn+51U5gK4evnXu0caRK2?=
 =?us-ascii?Q?q9/4FkPrxd0EeSM+0u4OMVzheRgtKuqyPZweCMUQZFKM4q62y3ZFgQh3jHjU?=
 =?us-ascii?Q?ED23BAEVuXW/7QD7GPSAl4OlbB8Z0d41O7pv/3UDHEO5I4vzYZ50Qf3RvGIX?=
 =?us-ascii?Q?0uRVT7CvJqmGB1IKJ6K8ykmWQamgVv2283ptIls182qiJE8gVarV72uNIzSx?=
 =?us-ascii?Q?69vDBcpyOzQQNKjf60m43rJrXflg4XnXLN/qQhSpklMtkVROX66wNSgC7rMQ?=
 =?us-ascii?Q?ram8b8knBvzU3570NWvvZQQGo6im4qUoOH95s/+EfxNBYEvFIhq6QO2GHUYi?=
 =?us-ascii?Q?LvZOOl6H0TUPZqEra916Nyk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae33293a-4021-400a-517d-08de20b93313
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:13.2104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eph1Yp7nTvRSNxxfWx8sqmlmUVqcMXOqp3tRVFdAnYO7is6E4zVbV5MdGKIr7CpQhFz7p5Yge/1ZWnr1pkF4zErjvLR419p/TEswEHrbXtEmrWVYtvtRa2iuTJUjlk3d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm8400.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 096f8fdbdff54..0eecc8657a38d 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -1111,6 +1111,7 @@ static int wm8400_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8400_priv *wm8400 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u16 val;
 	int ret;
 
@@ -1126,7 +1127,7 @@ static int wm8400_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(power),
 						    &power[0]);
 			if (ret != 0) {
-- 
2.43.0

