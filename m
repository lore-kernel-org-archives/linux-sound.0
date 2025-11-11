Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA130223DDF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821275; cv=fail; b=sQOPOVbkp28dzougFB/STXnnqQ6lhBg6AUyJ+hpD4RdX9591kF3A45lu4jVKQmi2SQbkhc6ZO4mDKo0v65/fdVOx6EHma8oWg4RpWWx42npDyUwqHEgiCFCQTM3SZ/s2GvrtgMm/Lu/awR6eCIC4oaIjCXzJbR0eQtWtwQSk7Do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821275; c=relaxed/simple;
	bh=CSStvGKnc3mu3/T4mJZe7QnQG+nwhqwO4L2UpBoK+50=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BmNMoajbYH0bs1UwhlQDhMYCO4UehT2tmhl7GNMS8qQW0MKy4nnN0t2hAG7xCZMkRQHJmAKvKIMSE2upFOh3EUQf38zZw+cUwqI/nvOX3ByVhAduhRDPpVZz3V28CDipAZyNxtFPCn5E3PxT5a6yIttzL+InB8cEzL6Wbay3wzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VbO4Ziuh; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VbO4Ziuh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsZKngoAgUGyhZCS1vOVl8RLPYRdbQxvsXDzkKVbngfDgTXBaWR1X2KTxMU9RngGFgisYAeoK5jwTjBk4XUM7mHi6wSRnZqSf9dcMKvGfn4TmpZH68MnZDRrWY6hgG4Y7ffQQb9G8VEG5HoPoBEF4Uc+ffYRyLgjh1xKHlHHrboUtbBSQ6i0gOo82rRO9zIrfbYFLpXhQl/Zk3HkGwT5HtfbvPYq09QcItoMWpP/d2yNyp/YyTDjYRQKjlE5ruC8BI59bBhosjbS0YnuhTJf5mZfHsW2/ewRO3OgGzSfqY3BurQOcipBH0z4S+ofIdYg+eqi6+CZHzREPDj+pei0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfMBq/qDr+r870vpPN8RxWpgEIhEgfulOZJYZ3kYiyU=;
 b=LefCED3QLbODbH/aWzbINFrnibjvyxq9ZbnNyM/n63RQrHa/Ocsa6WZD2rthFzi845XC+aeqH+S8ONndsMqYI36hdoAuW5mSf/DI2Q4p8XiNCC4Z+wM/p1mkpIHd1D1boyTacg3T0MFIoNEQvqAELg3UzDo5jD1VYP+/rRerYXTVrgdoDcE48l5Yb0ZaZhNh49vAH2xVnvibdWg5oge4HLn9U/o6jJtLAcQZ0YqY9k4VsEKTzOaed2j2cKy/pwZAlL5KAxr45yW0Nz3nhuWNiZdfqod0ob7WldZ8y0fwGfHMpDopDvth4t4aGt+q74+gRl1Kkuaa+qpO9SzTlANjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfMBq/qDr+r870vpPN8RxWpgEIhEgfulOZJYZ3kYiyU=;
 b=VbO4ZiuhIBoxPQwQiiBmnWXDahr4ybnlJ5COaSrQg5aJK4rG+2Df2hoy0YF4N/5QPgJWjTmANAWsZAqvdveYefljvMMmtYgc/o37Rgv1h9182e/Ut9mQW3gZmWuapilHuBQHuRrABrE4BEEGMjQhksI7VzY1Z1bSquOYz9sYoD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:34:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:34:32 +0000
Message-ID: <87ikfhv23s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 245/292] ASoC: rockchip: rk3288_hdmi_analog: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:34:31 +0000
X-ClientProxiedBy: TY4P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e5764c-f09b-4242-9d13-08de20ba14d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e9lRnjvWF8yJcDf2ULUfggyN/AXihUhoTtcfQ9eLrKmiySvzTjIqgxoSFo5o?=
 =?us-ascii?Q?i6K9VBsMoa7qsqSpFkU9cbNpUVkSDlEneKjgdNWAgael1izPvO5vdHEAX/yP?=
 =?us-ascii?Q?dch2jRlXl6gZY51zcCcio5p5v+FLApQsSrMR7UHlCGsN34bYxsFmPiJtPa5V?=
 =?us-ascii?Q?23xkc5rS/PDSwydlYsh/tfGpcGHPX47Tp9gtu+IJ1ABfNROnoNMQUbLJiETp?=
 =?us-ascii?Q?wGAQAl3IIK9g4uhBQadsoy++7qdwb0hY0G3UWdRxDZuCyxCIDHSdAtM70VBo?=
 =?us-ascii?Q?mvFYhvtGdECQyfFLRyoB6peVOkL8VOC9Mt6JGxP1pp4yHq71JVvc/7jLDu5H?=
 =?us-ascii?Q?hEo81TF21CgJUHhdnuab1GGdBLPqt0wyoA6o0hq22LBY8x21g92iqSx/WiIG?=
 =?us-ascii?Q?ig8ibkCaYmnu6neOOCD7rOkj5rgKIGicNfI1MJ8dOzuhYwiUS3oKKS6C43T6?=
 =?us-ascii?Q?mOeOjs71qLrcQNc6N0CzNAUuzAIag19A7wlQOurAHKwg7ySvfI3IvKmA38kj?=
 =?us-ascii?Q?4leyuuCVQ7FxrSdfYAL2RL54UMhsMRjQGI6pdzWe2AmqOjB216ZY8nRNnb1N?=
 =?us-ascii?Q?HWA4rsOY0lCDnIPlBi79m2p5/EJs8re6n69VixILYKV7u2Gu6nstrAiA2EZH?=
 =?us-ascii?Q?MjWq/B1YnYWIb4PsjOlYOkgnvEd3jaAf0SFX7Okfg2DObwumJlg4ij+4PceB?=
 =?us-ascii?Q?9XkFOmqq+rhu6Jd0jP6NlGTsicC/3E5YODY+PeLkUPQDsHE5AOiotwcU0xHq?=
 =?us-ascii?Q?pwRBlHfpa1yOyo2VAXD6ankT4YPlMYo8PcGWDyF28XMBzs6pzpyJMhxYEjge?=
 =?us-ascii?Q?IGT6Jf0hLCK/Gxyj5uLuqRr5v6i6YcQffQfMyZAuwd9UhuV0CAfAcfMgHT2d?=
 =?us-ascii?Q?Xc8mQ9A/98HOiTm3JEUuGZ0k3opccJF2olD83gaS+QJwgiLD8QFiHZAIQbeF?=
 =?us-ascii?Q?2ouSeg57L1xeO4Vy71mierFbougQqW8ZFoKhr0K7I+93K53GH8fGQoVy97O/?=
 =?us-ascii?Q?h/c355Zlpy5aep+NUg7zi8FV9x+E9rt/2WrcsVeH5cT95uiYQah2DqHNSndU?=
 =?us-ascii?Q?Tcdd6g7mTO4V6vkCMRZ8Bc0tXOfGJMtWVkh0WmPjX96V+0iHoNKh8oTGxFXT?=
 =?us-ascii?Q?rOnV3Eh2xGhNhee5sSBNXAdoxLYacUibHjTssWS6YayGs8Asob1qBUJAIiOx?=
 =?us-ascii?Q?1NWlQ06wVbmK4DYYfif5PSts1baozMh39ic5OhDYN1ElLxVRcQqTpW6nAB/C?=
 =?us-ascii?Q?1VZ6GFfpa3iWy/ZHs82YaVpatq3tMuOSsMoSZt2dxB+TMqTF3lTUqXDu5lKR?=
 =?us-ascii?Q?/xXnhq2c/0m673Yo9UofJ9dXDpj4VQeHb4NDFNpVx8ogAlRvdNpRnuN+v0MQ?=
 =?us-ascii?Q?lOasTRXVHqcerUgi8NApCErXlYERgbdlwdKgQYhw2pbjBvtqtN3hNsdkOMpY?=
 =?us-ascii?Q?p7cgvS17109fO4SNlxdsIQI6dLKMOtMnHWTmVe2ADPfQepnW2+l9HjIuQODI?=
 =?us-ascii?Q?mHzht+fjVQnif+GFxu4ts/fxX7gWiMssAwS4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N6NyzhWs0BswKy+5qsWx4HKOZQpGbhyTrtH9mx1Fg9tfRSomC2mTqXjKgfL4?=
 =?us-ascii?Q?6jKBJwvpEsVa4JwlLuWZ8k78SzNxc2sVBvi3OPUI0OqVMn8ChxETg31CfaYa?=
 =?us-ascii?Q?atIDNingFLuRlsw8hjgwABA4TTyTWj4caFNJil9CzRjCrnUEc1dGHLHTMovo?=
 =?us-ascii?Q?hVZEjcz8GUAZVMmkrxszmMRCSmPLLM0U0Y7KYF+ROBoqllBTd7LoK5gBOUjr?=
 =?us-ascii?Q?Xq2z7Kd3BbMOlHAVPemVqMnElKTsoPgZ0T93f8doadp9cS/xw1UXhWsliXN6?=
 =?us-ascii?Q?hL08dkz3MqE1mlKTtyhOzVckHJxFSmModI7JcK3VXSbUv/TnrkOjVnu2duQy?=
 =?us-ascii?Q?8P6KADk4baxSm69LlKwLduJWlfrask8DYuHH5jfERqf4mLahVvVC1EpEFNwM?=
 =?us-ascii?Q?eYW/NFGRGlxRhWfTpxYacsn7cbOEL2XjHTAHW/C2/N2quw/Yuq3d0KHw+BdJ?=
 =?us-ascii?Q?ut2eUTd6nkuc8PmjcyN7wT/5YJP1WT/ageWnDUxWM4DjftsRuYpYnf5v3vlg?=
 =?us-ascii?Q?2i8Cicj9GdAoR1kQqGbu2dPSU64Q/0IL8YCLMLDg1/QUFAH6+ZVAKaM5xdtg?=
 =?us-ascii?Q?n43j5hfIjlJ/OpiH4wn8svfpdhRf7ABAFBmMbuh3567M3Kg8qJxs0TGSET8E?=
 =?us-ascii?Q?nlF8U080DH6LAZi+oQnMAqcj14bzQ8rzaCWkxsaUqZ+La7zFjPZOKV4gtQfs?=
 =?us-ascii?Q?xwI6cdFHNqtYF0f3usVxnoETwh9FP1gSCFrk/Tl/+OKVYBMumzqkHaOrsOYt?=
 =?us-ascii?Q?dAsx+kIpaF0DUm65P4krg4HemfcRnskdw0mTcjL5rX4mJv5N0wti+HA2gdmW?=
 =?us-ascii?Q?XlVSHAeIpoAsjiVZDM6Aue7+mL8AW1Uv+M4piO0NwGrjxvDTv66+Amh0JsHS?=
 =?us-ascii?Q?AvDrNzcKJf5qzRC/YmxcjuUgS+oAdQgEvMzjyo8WZhsZiFpyGPD1d5AKU18y?=
 =?us-ascii?Q?zWbxBOU+vA/sY2Q20b6vpdHcsXU7N6YT8vNmGSMvfNCUEkedJ2W7Xb/GTf0Q?=
 =?us-ascii?Q?coetNAajRMaIQZf7zVYz8w8VaBfmGSluG1GlFnCyTNDaeUVjm8FKYSWl5QEt?=
 =?us-ascii?Q?185xkIug1J4i/rYHIKbN20ZBQSV3M0G22a4JwBBk1IBqG6dDss8p0UAu2ISa?=
 =?us-ascii?Q?dSZfToodCWWZ4H/AzQQektB8jMp3YPj7TEBKcWmAUb/7vAbhAKUaihFLtnuC?=
 =?us-ascii?Q?3o7hGiyfSX7YZcEfxyPRqWPj11yeGw1sj3TJPN94mmPQDsh4bJXs8QmbhWrP?=
 =?us-ascii?Q?10GkkxUEMqOQFzB6mF7fJQKhC+0sQS4lc5zBjmexU2FQ/C7FQcWr6wVRQ0C3?=
 =?us-ascii?Q?JZUuiNmtbOrWokpjKlyI6IKhmhlHvYaDAbIduBBzTPFAOEwLwP830Ly9i2i0?=
 =?us-ascii?Q?6pDuxS1xNPzbtvySI+WjUQxeNwYfmpkiQVZQZft/Vu1A9RQ+careR48BHlq7?=
 =?us-ascii?Q?pMj7laCooHINmtQ7s1abICz8DLunlU8q5eGLLNX+0dXR0QJHN4r72rAGF5PA?=
 =?us-ascii?Q?500URCS28wkfEndUSSAtAnoFKH6YtoYdNLC9GEdiHF3QXQX+LRDoJbW4vJ91?=
 =?us-ascii?Q?I/f5g86GjkJEZG1XormMlZanlvxIKNbtv1y7rmmxPqBsVXsLWm5lcT8vumEB?=
 =?us-ascii?Q?xd40qyjWSCqXmoXAH5vmvn0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e5764c-f09b-4242-9d13-08de20ba14d4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:34:31.9639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3J4sD53hhmrgOj/Hu65M+3tAKLmfBbeOtba1AsYuBIxmFy02OKr3R/jR8tn9uuL/WAy4qsy2MN1KxS2w0OqnbkV10X5lemoUGFYrV5xSpv0izCPeoAZH2wTSD1BPIVG
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
 sound/soc/rockchip/rk3288_hdmi_analog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index ffbc5a39b493f..cf642a23c38ad 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -31,7 +31,8 @@ struct rk_drvdata {
 static int rk_hp_power(struct snd_soc_dapm_widget *w,
 		       struct snd_kcontrol *k, int event)
 {
-	struct rk_drvdata *machine = snd_soc_card_get_drvdata(w->dapm->card);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct rk_drvdata *machine = snd_soc_card_get_drvdata(card);
 
 	gpiod_set_value_cansleep(machine->gpio_hp_en,
 				 SND_SOC_DAPM_EVENT_ON(event));
-- 
2.43.0

