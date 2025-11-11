Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5171E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820982; cv=fail; b=sEj+trIrMQMMHmJ7ZRLqsZGUXg7Q4XH35f37SxGG4TjMoNS+B+b9PYb/jlZ3nUwlCIjDbuaNzqUaRgOnW0LmS0DvNim5OvqD2re1/LQm403+FlFkakj0kdIUpFDKdKQi7r4iKy9+hO34L53uyAVf/fYvwd2vFJho8Ao42jeya8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820982; c=relaxed/simple;
	bh=s8gC8dzV/I7aNRAqrvhI75TI9Mzzdr29zW1VUGdT2KI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dd/J23W85f1QsnxsbvtmeFJUHnbfRLYJB9O3rmNq/y3vtGnKJ3dmGoQO2dwfM282M6APbtj5HkFUzNG16geDy5WSMR7MZranqCI03NLKCDoOl2GVb8WQbUVhttEiJVIXzi5CHs0WyGV+Kn5MscHihejIK6zQhHdTya+zEBRLPc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jLz4HkvE; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jLz4HkvE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7L8Ifbok96kMeKm0BTroiYnfQcXqeekk/IuDHs+dytts2r8PF2keLP+7JQKRo6WymEqcyfELsY5xLY8SMSXdc+jG/7WBrpbC+WGKAXEyYLmL4a8yvosqoFUn4OwI02ZdaHNl5o7jSRyH/WQAuwSNMkKrTEXIkqjIituudOYlm/vrQwbH3BLsLEVaox6mi80+xEUOuzzi/5yO3ZuJ7qfKDxCzMI4mxHPrgPYRE/K+pQ6ThkoDjYSNFtUfYSJqLV2gSIqDk3CGmZfnGFLRS9M7YNsaxkSk3cdnboxv+oGUXvHmqBgptA54CM6e9SCytDucVQOY3jUZDrFScw2J6eeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSzZ/xvt+F6WDBe0qpVqGQGWLuQep65qhkG6q1pYdM0=;
 b=VBVDThNwnOdExdVIRhsuXFAX9YL5fr+XIpCsPPyBicYAU/oG1iniIoDSl+Ek0um080Bfv4x6RzmfS8VKpd2ozyKNwniy+qLL5uwg2/3NjQFt+5KnYykTVHdfS5wrUMFqEj2San5hXwTtzRFZZoGIQWM5zoekbn2qa7F7rFgYkOZ99BGo/Z9r9lc+Cnl6lSTdlF/fa5gyqiqKOEkXmwXNRkE52OntmS7cturpWLA9tvV3WVgPTyyaX+SBhRCBgovaaQ6aUBFYnnuLY5+Fbhe5Lq5XNgr7KPlF7hMkwqHwqr8gZO1f3qSjwf/ZYHMaSbtEu93N5F65tfeZ0PbVK0wQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSzZ/xvt+F6WDBe0qpVqGQGWLuQep65qhkG6q1pYdM0=;
 b=jLz4HkvE3b/B7DTivdVsnKT4MNvKphBE8vf1jC06JffnUYixj7Xcr7P7JwMfw736l2OX4MwAz//jNX27HT6XMLh160XGQEtuyCPWkcSN1CFOCDZ6uUglcc7fJjczQgaz0TygCLPKA2/nzmJfuetQQz7Uz/8GQFTo6viQjcwTCKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:38 +0000
Message-ID: <877bvxza1a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 178/292] ASoC: codecs: wm8983: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:38 +0000
X-ClientProxiedBy: TY4PR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 145f493a-06a2-4bcc-c821-08de20b965da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mU7DRPbte5WYjwyCEqYL0j4BDM676kGWqQ7OwNMj9utBgR3rRQ6kOggOHKcF?=
 =?us-ascii?Q?VNRcFB+aVoYPA6bIVbSxm5b+5yfIUvp/xOEWFhQQTMBJbi3wFuDScQf/bLdo?=
 =?us-ascii?Q?VhdaFIYrBbt3e1f8kOSAfiL2BllGI8mFFTjxEZ+1A0BRegSvxGvV5rYwGl+a?=
 =?us-ascii?Q?S7GSilMQgOs9BZ7DgXtyVxPVMWF0HT0985kC1UyZvIZ4eOV9u9CWTS8+DHlU?=
 =?us-ascii?Q?mwLj3tRcwTnlawswrRmuVppGnKTLHTMuje1kGQxwNmekK95hn/C1PxVZFkeF?=
 =?us-ascii?Q?mZez7EaZ4MllRyEu5oql8QuKkDhhu/Fw6MyROK4J4D61ZMR2oo+oU+HZEf80?=
 =?us-ascii?Q?fzdJmcuY4czEfm3mq7XXr5G/p4n/Ckm99uuxH/FaXwr4cjvIxVWwrT3qWzRG?=
 =?us-ascii?Q?rIrzVrxSqEe9IAx1VFQHGiWebPJ6p2Nsity1Qcz7B+MP7D/zu42ESGew62rz?=
 =?us-ascii?Q?JJPB8ig0vVRmpwgio8zOGqGvfF5JdSRJNBufXeRXYMarsvU1rcMewf90HpVZ?=
 =?us-ascii?Q?JTPP2ExrZM7WpxkHBg78Rmz5mfUoWOLJnp4YDIJFD+Dg3vi963rqCmHLbsut?=
 =?us-ascii?Q?DsHoCbI76qK/8UC4LEWKX57ycSuQ+p++Fz4y923oLVSgHJEqxdQ/kNyUYjZA?=
 =?us-ascii?Q?Vnjy16q7qDASSaUsale8I9voYlA3h01gGZjuEnj60tJq0vk5Zls3RZKp39r0?=
 =?us-ascii?Q?LZHupJQ2Itjxd04ThdRW3vLcDkH37FYgVfgOhYWm+MXv8gjMs/2AnNfN7niQ?=
 =?us-ascii?Q?/og+T8IIeYtUQ4AY371iW4s8qV8PbG6pcrwExOE0+9MHBkFT4qC2nAt1vcVi?=
 =?us-ascii?Q?uWa3LZvhfAUZDY+rP4ZyKdiSNN9LW4/Fq6Kic9D5GWlFb4a8HUniMhAT5lZr?=
 =?us-ascii?Q?phIrT23Lwyb4GGThHUnLmKxnvvRI5JbcTQ0Y1X+3Pw5LdY2Vz4upLj9fD3qF?=
 =?us-ascii?Q?mnGNcWt8fnSBPTZMiZPXh7emLU3vWQGkaN9W9dGxk8ooq3eWfXPPIk0jvj2m?=
 =?us-ascii?Q?Kh730mNSlrLi+9bF+cfb5HoFRpnGuI2zCuGFu4g0LHhJ0VxjXgaHWQIZtP4F?=
 =?us-ascii?Q?gnKiOw43V+Mk42nTFA76wsioVJTF6Edf+ZR2phPR3VfkFK+zKcO22F9j6DO2?=
 =?us-ascii?Q?jpbu77gegKNsh6aWTrTtuAT2xeB/K06A+yOBGHIwFvEnC7X1onhFtc5xfK5P?=
 =?us-ascii?Q?6G3znZIj2M20uL9eY0wq7eLF/fFOc8eHK4fPDUZEjCiSbFt7UGYiNnO9eqTb?=
 =?us-ascii?Q?xee2Uq938BuafxT+pZsdedTC4tbQ1vjijPOiYA5uubVbEKYqtP1qCcXnBBIW?=
 =?us-ascii?Q?xnROAHIST6URk3czw02dISdSimiKMMcl/MevcpFaUWe9yKhM3I/7lbtDfkhI?=
 =?us-ascii?Q?8xe3ehuen2JOx3J9tUhD3r9ckIZqOhvX1wy84jm7O53IRuml5v3PrZoXLHqG?=
 =?us-ascii?Q?nGKyUmtMFzvqNEjVtBcpxV5zbPEjNZi6KmDPCgl4EFOUjVtjSCeVh+mxI0Ir?=
 =?us-ascii?Q?/BcvH9p8gg9E5XU00fIfEH0FzKDIp8SHZJZQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RaqVJXrNBN//KkuKOKK0gQ1z+btyx1OKrTFC7pJ1hV74P35oGB7wI/wExF/A?=
 =?us-ascii?Q?/i7CdXGIra4ZhTLX5r7jEsxvcYF8ojhxyacrUCn2SUm30aRJ6PyHgQ8yCpZJ?=
 =?us-ascii?Q?cctp73rSN4xTdyiSvStuLN8jBjFGyp99WOOdXmdVyB/KbZGi6svNxfEILN7R?=
 =?us-ascii?Q?ubtlmBucHrACkcV6x+HU+6eoRO0Nm9a/SkvRNogrKps7TbdUzW0O6uf6XfDH?=
 =?us-ascii?Q?xVWW724OQsMSyZzY7DBUjgXPTgz1YGNdKkejztJxprHeYhREgQE0WVuqNGLi?=
 =?us-ascii?Q?jUdWG3Ebgjbk4XFeMwiChJHV1LYjamNjv3WmKt7UTp4abzoUtHJwRs9xDJAZ?=
 =?us-ascii?Q?o7b72OVSrK5EjeLACrmtBKm08AlcCjFWdgWwVXCmzRKjHCkVYQ29RbOBnRyR?=
 =?us-ascii?Q?Yhepxe/dNbF21c7APb2550PUqnAvljw/15o7t3izB6T6nRVlCUTvFQXsEfwe?=
 =?us-ascii?Q?GkIWHI3KvJoIxFBZXZxSZ2AVHDo3bkhsuSkHJ79oazEAtTy4eDlVCsKGM0Q8?=
 =?us-ascii?Q?sTcm3RZNmzacopxDFmIldYurjUdohTVi38/OXQ+38UULDh3vCuuNYwIyEHZY?=
 =?us-ascii?Q?OOt+NgTE8Gtt8op8REmtd7ARXIs2YUY2FG4QThHfkWuu5vsiMOQiM3tTHqjG?=
 =?us-ascii?Q?qaAY3gYRX1uXaeJis4G3XNaUjYTWFKFRW9F9D+0sa6VBUJURn4bGUPooE7Pm?=
 =?us-ascii?Q?dUd0G6O3Ko1hkaDkrnzrV2O4p+dWmAgyI55Y5WNXsfmDZP65RuEi/oPQMVuC?=
 =?us-ascii?Q?36/Fx43K9fCvKf3MIEEdmJxMcZ1IhMwIxwEWNHKj2KciuA6v7zmvoRxlsJWs?=
 =?us-ascii?Q?2YBC+qLk3BHDtcJ9MJgRQymTbkrV8dQmJWf5YAoRtkhNYP3GLVKowZog3Vad?=
 =?us-ascii?Q?RDsAhZpayFkTkDnw3o8vpyqmvCj9V/Xk/7xAPtslN03IkJBYIMyfKdSIY4RL?=
 =?us-ascii?Q?jTgdstGZplJGybZVgc5Y+q6El/ga6739AuJFNokVZaW9X0Mm1mq33rJx3jwx?=
 =?us-ascii?Q?JPLcJmuICNUm04eD3YtBe7mRyUSlt/2kgR/Do1xKE6xkLd9vPRyWaIwU9C+b?=
 =?us-ascii?Q?eT3APWQnlk+YoqDS2Sh826xU4DNK20bp8yKjF+qKag04oBghETpYAB8kgjGg?=
 =?us-ascii?Q?Qh+DFXOvJS2MF+fJt5kfN4dCC5H79YzmhF93g6xg+pAFCINvio71+pG4T0GB?=
 =?us-ascii?Q?1v0TgDzVvmYn7BNlo2jZU336BDFlIsY1lJae30VP82jQBVm0sqx3kn3c93Fi?=
 =?us-ascii?Q?+zrNz1li6o6oO6NDjGWNGiJhCfiYqZG/MgFP4X/eGkMSeYhTohh8H42rvaLw?=
 =?us-ascii?Q?MPbNTyPmvpeyxv72K2f5cHp7T+DYDQlo2ZCJmztPeeuNWc2QFHSZe3h5YFNx?=
 =?us-ascii?Q?eNtoML7of9hVCNYBmz/GB1nQ2BIUzDyfxsVlYgem3qeH6OgkGKD85U8t+Lkm?=
 =?us-ascii?Q?OUXlU8U644VJA8z4IJFgrzzKDT38+PjfpEkaEGthS3W2rkoAknVTrckVQLHJ?=
 =?us-ascii?Q?de8Scbs0kYQQTX0uHtrzttNXal5+ZlUjnUhTCRk3239Izs99ln4eogyYeFzR?=
 =?us-ascii?Q?ZApFZE6OWzHwjV6gn5c9LdHQGMIwzl2wSFthpWABct5YDZFpnb+wjixCY/rM?=
 =?us-ascii?Q?irGggZrAHUEGRK+idFgXPtY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145f493a-06a2-4bcc-c821-08de20b965da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:38.4286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZS9Wb340/lRbcR2N3fNKWP4oIM7PJzfif4/eJ3WwHaNV8xhxfkxyRy9GRKL1Ysb7lnAr15AWQzeNtbIFbWfP91F0zxpuX5X0v3xoJWEIDX3O0Vhs94bC73VBdC+GMVt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8983.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index c9e516f17c363..cd34f71cf42ae 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -848,6 +848,7 @@ static int wm8983_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8983_priv *wm8983 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -859,7 +860,7 @@ static int wm8983_set_bias_level(struct snd_soc_component *component,
 				    1 << WM8983_VMIDSEL_SHIFT);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regcache_sync(wm8983->regmap);
 			if (ret < 0) {
 				dev_err(component->dev, "Failed to sync cache: %d\n", ret);
-- 
2.43.0

