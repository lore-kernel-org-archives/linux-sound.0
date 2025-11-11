Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC131E3DDB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820986; cv=fail; b=DoJYirxX0/agZ/Fn56VCb62Uga2rNUDvcAUObByBNEvEJL4+yBevhEGzyw244QkagLqKpNmlgdWGSTgWbt7JabvSeidJ9yVuo79QVwNNHLOMZ5QAN1zuPzofKbrbgm7FZyvsX3YlrNtSml7A3qW0hMtogjOCepz+qmJxtstiMWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820986; c=relaxed/simple;
	bh=y2juux0ggqSu/TLGF2jv7qSRtJhr3XfafpBE7bTmqzY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AKEb/niFAc4mZzWJQFJ0gjaVWPUKyVmGIoP9LUt9VhoqTgIFrj/DiyQ6FvuFVEyltE/A9nuC+kThxUyohoZ8kE5S73AbDXG91xf8hc8i5UhWHA5KvsmFK18hewj6jwdCprQrGo6YplOk81hzRFLYs4jyX5RJo5v7cjpmbLR5Ejk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NLU6iJvm; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NLU6iJvm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJNecj7F+c04f+nSmRsZKvRWKQdwK9VZrswvBhhGdpo7OAL4VR+d4ABamHEZ4hp/hjHKTatbmMN083XtlNIxb4tFLbgCZFsCBBt1cLVQ7c14zxBZ3z7OxMH7AMqwY1DarjzVgkXPw2eEHWsTCPxJ4KgALcR1NxfdbbCKDwdktbn2uJZz3e3PK+MObkoExZypBpi6lTZOk8sAC2DGyghMsWhSU+qWvbQVbWNSS4WjfqsuOW9eUiEThz6WftKtbsr+xvwgKEV65+azqJDOHB3waoJlSPsNxG5GXAG8CL8yVvRZemY1UmqdnjHJc6ZGVPfuyvpk052nj8qronbwWLgB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pecMrRqUTwfgx1i7gq8ptS75VezIRmN2jGTn1JYJ9xc=;
 b=nCguHlQ00WhL9ski1Gs/ujZ1a4SM7TOAHf+WviJaAR/FqC2IZBMBxkREAxy5I+zFwp7WH5d1wspO/l+kKqbKDS9zWzQ83rqt0TnJXsUAIkK7c6tWSATXlKEdS+kxuZPJzsmaQ1qNvnd7+f2ozWKv1SivgfjRtJ0j1U8e/rc5zLIgiHv61T7k50BwQI/yBqdQBROcOKYbtm5zk+ZupND57b+orNK/YVLyzYJAP2ia4JdXU2LUnsgrk8CHXwK499+PYbOcSnFZlnqkWVZQ0ED5uQLhuOcs7O4YkD4Z4lEzOs7QBBS074YNxoC4Z3Z55shEnn+ca+T/6jIyhewdoUBL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pecMrRqUTwfgx1i7gq8ptS75VezIRmN2jGTn1JYJ9xc=;
 b=NLU6iJvmk6wBsO92v1rJRdr4RTL1oM8xPW4m6lxhahUNNat3dz2gup2woR51xryfw4ooNZi06R410NJ6YRxwz7GeqKDbOSRtN3ZYh45I+EnTqWzl/gBeQYvmzRIoGgykG9MN6ZhU5I2MVSBvnuK2clMNX9bzOXF+FfFQQMGEISg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:29:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:29:41 +0000
Message-ID: <875xbhza16.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 179/292] ASoC: codecs: wm8985: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:29:41 +0000
X-ClientProxiedBy: TY4PR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: e84b586e-53b8-4ef7-c5fd-08de20b967ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v6NUcyjwI3IZ76g9+zFu2wYSxBYXpCSaprr2avAchfOXIhbNRxGvztBuyZ//?=
 =?us-ascii?Q?LXAAYtGM/JeUHQYf5/gwHaSV8iruP4+AaL9BNYjkmcu0nPwRwR3c5L81dO49?=
 =?us-ascii?Q?xSAHMAmpRBr+9HLSIS+33vV03CFHEUbT2vUxKlkxrL4n1cUknncgUO9WL2qp?=
 =?us-ascii?Q?rAH1Jg0OnKqYHVKKUCkda0ZVBrYfwVsFvUwxdQMKQt3TlpiN8tTnbVZH2oMj?=
 =?us-ascii?Q?RoOnrhllqAZZ29HBZ3pFlRs75paBjkkq1PDRu8Hxuclux7fZ6C+Qsr7ARCKc?=
 =?us-ascii?Q?AxZMuddHUGKsOXGQ7v5Qh2tZKJAoZXH0i3ilv6HX3Jx388cyru9ViGvDoVG8?=
 =?us-ascii?Q?0QZaUwrgoNBSof2H+oLx9g24TyiN3IRrbu9v3HNQQShL0mdMfnzyLOAi2QJY?=
 =?us-ascii?Q?ocogCcbcGSP7EVrjkQCkpvYNMLYn37Eu8GFeavT/f6kIKBLaaH76UXqNesp9?=
 =?us-ascii?Q?zovI09MTKtjb5160fSTeE7s6epbrb6NjSBXThy2b4rQG5eZkCk56Yx6sAAoa?=
 =?us-ascii?Q?DIz8ATl+XxmfTzjtyN1c2pLuOhXR5J/iX/86AQa5qVqXP8q9YFEuZb+aMFsL?=
 =?us-ascii?Q?FE2w5vkvNeRtPcI+BvFHRn8AcszejUF67XEiOhjaF+j2CO2Rj+diCBs4Y2zd?=
 =?us-ascii?Q?2JnK/RH3KXv3TL8aYl84Y6Q1Of0uvO533p1A3fG8HSu56HVXmf+oeRXoG1Gv?=
 =?us-ascii?Q?eTAz3ow3oTqs2bs6qYDaL9yjDk0dR5msZwO4fvs23Ul+FZPmuVqAb4Q7P/Ez?=
 =?us-ascii?Q?9LCIXc3F0fmeiIsQI7qxYidINnEJgfpSwKX79uYvdzcN5b6V6jF2g51B9ept?=
 =?us-ascii?Q?VaBABYHh3sQ6V6FKV3FTGle2CDo0sP3zaqkcA9kiv+/RfvP164BgchY/kIjV?=
 =?us-ascii?Q?jewU0s9kS6IkAyHsAySCroollXoUS6UAYo8s/jL4wL5MWHTi83cE9ZcZobXc?=
 =?us-ascii?Q?aTyjOcemOstA7kP/irYhdhoIJqa8cGML3jDHkjwmsxZw2utbxgg718MhosDc?=
 =?us-ascii?Q?ZV1X87eJSuj/S/13sTuPw0sNfmZ20AyOzyUOe+5fK4iUwH0hs1KhbmsiNqs1?=
 =?us-ascii?Q?TCAjhXlfxdEnEDld5c2zZwKDCshehKk3ORu7Vz3pGC1dNoG8XLoMocl3G7jY?=
 =?us-ascii?Q?Jb2CIqngv9D19zadKZOdweuu2p1zHpzMzEMYtB65nmeIVhGjoeBUoiekFnde?=
 =?us-ascii?Q?MnDzgbey5Fpo9aY0q+OmQ9f/uuK2JXxKXRm0EU9XKxKqT4nSrTiT1G70/nJ9?=
 =?us-ascii?Q?s+U0TdwZ16c6g0+AYAxQIS7YAiJIaP9t+DDA7vWVA9W8MAnsDkKThj/gQtgW?=
 =?us-ascii?Q?ULs5lQzDPQdbuPt90rPRwmcyG9dIs5NSsqyCneF96RuEDHUTlCcKUd5ioaCy?=
 =?us-ascii?Q?iB93paDwJSCAU/sY+wtiJkljEkvOnX4G7hwwu7uC694CAJMCc++sKTz2kteb?=
 =?us-ascii?Q?0rTSvwYz8VAdNF9pkjkjkrmfkhZtuTLMX3NVHeRighXh2jYimvgkfpZdXJb1?=
 =?us-ascii?Q?KCSPB6/kELlVykxJ5jlGDu/Apc2u+uAlp8gl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UjIt0gGjEA1UiyIHJNpB1Y7P6aY5f3ygFjogmZ7d8tqVw3JBLJtB1FLn4u3W?=
 =?us-ascii?Q?gJPz/aibujqUqfAdZ+ofOcES+V3B/XJ54SUMu8QDxuBkONO8BkHH1cw1Xokr?=
 =?us-ascii?Q?fXCwk1hNDTcQ4RgX2bi48efB4JT1B89Ph1vK5RnqSuCM3nN9tRVaTkNbTLyt?=
 =?us-ascii?Q?JHRG52GBH1QPAnd+wLtb8Zq7gkY14xHT3ErWYf11JX2tj+YAiJPyJruG0oIL?=
 =?us-ascii?Q?GS24gVX7snEk4MYaVQ+I2HXyl1rnY7BoyxAsbLvQY50+lC3N4uogrpZFe5C1?=
 =?us-ascii?Q?Gesasiyj6CP+/XHoOSKHXwaasgwOaxKs9OVOiSx97SLnzFU08S4JjprCDfA+?=
 =?us-ascii?Q?9Db/66cKXT/AwxxLUaGPc01ceyyKry3VZQGWhXf9M7K/6d+k+ARYmAe8x++Q?=
 =?us-ascii?Q?b3UH8kjUU8wST0LhGt6iJB88PND/n+BYQ7fTke1a8z4Jy1hk/dg/S5vKDxyP?=
 =?us-ascii?Q?ozuELCDKb1dnwo4NrNaKKBoV+fDCX12nkQErRWmt/aQqTw1Ovo0bQVOalOb1?=
 =?us-ascii?Q?84ySGM8odDIOjT6/BOlWHIRWpL8BU5zhT/eK5o9NpImBbxPsYKKNZqprt+eg?=
 =?us-ascii?Q?G++bsCnPQnZihSN7Nj6JGDWgK3WtfJskBgfDf2mp3Z3NK5OTGSF6S3+Poqhq?=
 =?us-ascii?Q?acj0F2AYX8uyNfS5rNTvirxhZH9+RGk1GA5kFeT6kI0HvIMKZq8nNAqbM6io?=
 =?us-ascii?Q?GSLtejQqvH8dk9yY6wQvdl763urITsGo1XxU6D/rlH8MyYsXUq/AU6J4RQ6W?=
 =?us-ascii?Q?Tlk4KTjX2dyllhgehci2MJ9wfiMtUgiB/ODsE4CVlpeX+difzYQb3DdfZdQ4?=
 =?us-ascii?Q?KYzt6Iclif7yei74tOa/BwI7GVN/nwR/9TCHsoys4jfP6yQLUZqRH5XkIqA5?=
 =?us-ascii?Q?r9jYlGIa9WjgrBhTwGukMhnS9sgEChngvXIaCnsvKXLUhS0FX+yVL94RBG2g?=
 =?us-ascii?Q?cMmtgxBEKZk4jIVK/qypOyzNqhJbFvVXHojRgPXhpJah/TObcD3o+t7c9hLq?=
 =?us-ascii?Q?KNtJko/WTe3/+umpJV7vnVjeY9SL9lI9svQpZOXE8ewfijEzjaRPSyEjGoj3?=
 =?us-ascii?Q?X52aXHGbDnQz3pg1hcchJfjjjVVlQd0ltMhDKJMra0sFIkzoHOllFTZokHbY?=
 =?us-ascii?Q?QKOscQscZxENuu/63ge5JI8h86/G82P27xCaFkuK8YPtIwrfu2cw5zw/Dwrx?=
 =?us-ascii?Q?XFirmMSxoZS7NboLqoDYWNwI2IqMffKWsHjmIm5cod6JlUKbwQENRfdy2tqS?=
 =?us-ascii?Q?pntsio0AvFlv4H4wF4dJIQ1bZxnEGmBCNUq96RwHRZS7xb5D0b2skrYSkPgx?=
 =?us-ascii?Q?Z1NkBFGK2x82r0RJSMmnOAXWCOaMoo14SFWe2wZDU9cnKjhmhi0tB4/58NK8?=
 =?us-ascii?Q?L0YsocHA4z+EOcW3qXaeT0Ye0w9PspMrF0H8E3GlkkUKhLoXwGzb9lJKwHvG?=
 =?us-ascii?Q?5Oz2sDmtMHjsd0vtZd5szK9TNySp8sruk/Yu1HOeVigajL+LZN4KMpViQVbg?=
 =?us-ascii?Q?l6FZCWM78AqHPs/ONx5yUo5K8lFCc9U9K5l026dSLsK2uTowjdltTzPHgN+v?=
 =?us-ascii?Q?SBojJ5ZkEiIAwJ8nnlpr+Z0dpHgaSBeP5WCgiEkk0LtlnNnjc3cd2hfuv7SR?=
 =?us-ascii?Q?ywoiGrXW7RPb7rJWwEIKyqc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84b586e-53b8-4ef7-c5fd-08de20b967ee
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:29:41.8966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqS8TfUvjR78LDDkt/J0b7Vm3OI4SI+9a012mDFvLh+3dX/RQkm8C2NSHk5Vi98f72VfD3lR7Q0BRSy0TGjmXyT6jwzfpe2ZJq5c0Y0Ha6E9vZuNqkcdi1pSa6J34uFZ
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
 sound/soc/codecs/wm8985.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index b8b161c777ec4..be23c0c608d14 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -564,7 +564,7 @@ static const struct snd_soc_dapm_route wm8985_aux_dapm_routes[] = {
 static int wm8985_add_widgets(struct snd_soc_component *component)
 {
 	struct wm8985_priv *wm8985 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (wm8985->dev_type) {
 	case WM8758:
@@ -948,6 +948,7 @@ static int wm8985_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	int ret;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8985_priv *wm8985;
 
 	wm8985 = snd_soc_component_get_drvdata(component);
@@ -960,7 +961,7 @@ static int wm8985_set_bias_level(struct snd_soc_component *component,
 				    1 << WM8985_VMIDSEL_SHIFT);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8985->supplies),
 						    wm8985->supplies);
 			if (ret) {
-- 
2.43.0

