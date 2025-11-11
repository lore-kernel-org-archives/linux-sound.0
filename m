Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A901A08CA
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820715; cv=fail; b=dalgovB0c5mA8eVELHEugkzpCJ8ZdoXps0vYjDX7D8O6OPKhbGeoHWbrDKlNjMpqie0Oxr4qKeE3m8dXf6OtqXUdzJzvHeHBsGa6aZW1wr/8kEuL6PtH1PtftJ7SAbNZvZpYZ08y6nJvH26GIHPlLDJEjs7vj4+hGn4XeG/rJh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820715; c=relaxed/simple;
	bh=oGDGEuKZAURbSqGOXkruu1sxQIaaNdkNVkMbXzLExs4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lwg3/PJAgf2ySGAtq+Bql0ASeSIOhDrhlMYtHVg5VTi3OmnJI7VKYwkGXq/5lPtNl7kto1EtLY36IjJmsyKo2T728CY226aRVmrEGBgTQ9C/qHqSFFNQDXcBoVe1CIgJGJ/qCbgW/X0UBIfO+4zKYcMR/sG9yM4VPMZA0JOcrEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=L6btHheg; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="L6btHheg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD6yWoEW2NOwuSuHHG0WdgoSeyjSDH66aSCMO+VXrG5Lg/pq90+SCuXuJW1ULO6iyELZHF/GKhAlAcIcHOcPedAV3JJB3g3Y5oQyCyzUeNLdxSGOTnR+tme0yg9wBeLNGzLO9/FRLMSTrlJDFT7KZeJ2xRpjz0M3yRxU03YDfpsAmgBAmQ9CI4y1wkRvbQ8OIxrBXTelCgzaL8F1Faa3agiqbuNAWgsYkn+XkelwTnHJUadxnOw4LJKg+9h4qBAhMFbzs4zawKk1uPfVlpMBqPrjJhxJTgYLeoTEywncFw/wMzirQUI44Fv3n9CB/AOXU0ppdxm25j79/CANdaezTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+XT7I8YgSASlRTWAALsEgWdV645f37sAXGAE7NRC68=;
 b=LuZxMgv2fPbG7hjhnjn69dlUciuI15xwA/+yl8Hv45jdg7YhmZoONhvtGjbx5oDPbyxavKw4CuNo2ILahJvIOvhY/HI35ZqPD8SbccghbIeD4k6RVV43b5De+suSN7PRSdpsyWVDyqQm5dTAeUKwIHo2TRthVFkLVqdZ1lqefSsf2mgUstQguFYaGuOeO1fCh4xPUHbLKPH19UiGVf1tRQfmFLqZ3fE967iXMt83K/mT2pFVN3kz4LrS5XkD3E9FB/u0F1YYhcRDj7/1IzY5Zb4zQrZdHFCM/I0+9a6Vk9XKha3cpMhAeDcf9ZtK/F0BP5e77zE5/dgUlnSwUDwH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+XT7I8YgSASlRTWAALsEgWdV645f37sAXGAE7NRC68=;
 b=L6btHhegVfocxyKde+GW++MVHKxewB0Xy/UUN1aiVvZm0uANBNFRS2Ej9teaSz3UO83A7hZ54HS3uzb2OuV+7fiR6ePQIyRTYUa+HQiSHbb0i88RourqkLYHgyFg/AuLIpJE4hBGUOwUGKaI7Eae4nVH7nKx71w94wy7hT82QFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:10 +0000
Message-ID: <87wm3x2z6i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 110/292] ASoC: codecs: rt5659: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:09 +0000
X-ClientProxiedBy: TYCPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: f9924494-c79f-41a4-a7b9-08de20b8c5f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hHvQPclNfQ03Z6iI/w3uB8mbV9d8683NoW4pftIWvkM6r1RfKGio+M9m0c+y?=
 =?us-ascii?Q?jpfxSnwTk6Y6Zw+wQWkFHTUUHwux2bXTwEv4z4vowa1nOxbttDlrWCrt+7uh?=
 =?us-ascii?Q?bYKrRHnEfbeXSWq+sJNTS8QTL/aPgwe3BPDSnwa7K/tGXxw7m7zMyB350REL?=
 =?us-ascii?Q?bo0i/RaecwrrsohbhSRtzmI2qhPuI+4CjD5bVs5BC4iMo182sIfOICgQOPxz?=
 =?us-ascii?Q?zGK+rznng8NHkm+h5Hp39VACUrsds1+Jnv+lm/wz4KftSLLiezCVyrWXNAiD?=
 =?us-ascii?Q?+lGcZlAyOtcuMu9fCqBLy0UsLzXN0HHypt7dGvDKNuBJOnNoU2F+a4OZfnbD?=
 =?us-ascii?Q?y9gZoORV3RKMHks1pKNK8rFa1Zs+zdRtsyUDVV6mqvUI5cf11jKMI8eowvWx?=
 =?us-ascii?Q?hAUohVsx9/t3aA1eWNBJa5QjFD0mwBehys1fwyv5huE4lC+DgARNxAEFvPPw?=
 =?us-ascii?Q?67dNPNymJ+/0uWBVrOdNlnmYzwkx/2Vow6G/vehsVEjvWNUy3hpA7fThHXYq?=
 =?us-ascii?Q?qZ+vxfcrp1rVARGbx0ZGvaMEEafs0mXS6iXUK88f40I4HUzmeEVhu5RVXG73?=
 =?us-ascii?Q?+hpCzDlCm9929cpyaYJvTTmSPOrYP00M6Y3C7LiDExEZAzKryU8/QbtJKd4y?=
 =?us-ascii?Q?7+TRGTSPUralD1r3a9QMjFM8C5OfOafxI3jNUTF8kd5IDKG2HbzV3ju8f8AJ?=
 =?us-ascii?Q?n9AEOmG1EdOZCR7PS+BHKphzLBS/4n7kVkoUVgOJAPlKiVALD6wf5n8XP6io?=
 =?us-ascii?Q?vMDtpyWcg6mW+WdgwaWO2GBteTrgUb1uCpvX3PBBmU2nRWgZqFkyQu+NVaNi?=
 =?us-ascii?Q?S0vNXycNaKnPOAgg3TsNJaWxO5+eey6PrY/MHEdlbOoazJlnmyiZWcEzygbK?=
 =?us-ascii?Q?ApZCAQ/r9pUsXJEG04bMB8nI9R4DSvYnYYrMPzPziCHt5i90x6js/FtnXjGg?=
 =?us-ascii?Q?HlhkUNKsy8usuV/DC6SuzVa3l3JBk7swcMJyX5qBxhuFO/SNpt30n7gnxcY2?=
 =?us-ascii?Q?Ca4VUmK8+NW9tO9Df7BRuehsv49tauiXicsDZVDPhlBh5jx1Av/xCEKkJdRq?=
 =?us-ascii?Q?t7mJilFSoieUbSd6Bly6qig2zUXhvzep/95ihr/govqC6cbMSxUQ2DDwfmJc?=
 =?us-ascii?Q?NRuxPKHkYuRVBxfVRF9yDFcx+M5fScH/sjeiRoHlrPtfsYxaDaKC05m6QY6W?=
 =?us-ascii?Q?FW/l16ngU0+YlYz9+JCAB9Q2YwK5jSE99k+KBsX2ssKBHTkMXXznAFvUTX5g?=
 =?us-ascii?Q?zMyskZJqmKRXgMPCNonk1i5Hnyu1RBJ2SkTZzBFL7MQ7aWXU8SgplRlZivcz?=
 =?us-ascii?Q?d4zeLHZ2jVI2zMTo7RrKc8sYMSpwVsXj/Cp2o7suBEGFZFZ8kk1ytK1XPg9d?=
 =?us-ascii?Q?JTyXQa7NhjXIWw7AyKWfxFNWskCRvXNMbDCKQCZ8fNs9kDFO8p5VmIwuCEob?=
 =?us-ascii?Q?oIzCe2/MDjRh6Y/qdglXKqtxLwcGxztOQBVjNrkCnV1RIRERzRTol3tyNTEX?=
 =?us-ascii?Q?M6sRU4w3Wu12DNYzkHJudHtARzgqmFVmPXpk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BA0CmpPvPlS3Gy0jh/pMgYx2XB/5kfxQmw1P9WjK6RSof9oWS40aLsK+ipDa?=
 =?us-ascii?Q?YrsZ9coxvYiaiYStzOlE0R6USar+EwmnsMwUdi91MiGdXkPHDokBDkDpiKev?=
 =?us-ascii?Q?1H4CgRgrGoXSgd2c+9svynYACzK8/CxxBx6a5oMmvF/C3FEAmpaWqpF39aol?=
 =?us-ascii?Q?KVwC0anzC69pioBYlYpfoXBds+XDr75GonVgk8KZkfRX9lmaPkUg23jNauRJ?=
 =?us-ascii?Q?Ke/sxTa0Dl5lXHb9kg/zcDKIJmUWHV6FzOte8Oyw2qRW7NZG+TuG9PLdEZnq?=
 =?us-ascii?Q?Iou5XRtKXoEIUX1aSikKZN3g8Idq4ahPniroAsLDLwVSjRgq0/sAvt23MxWl?=
 =?us-ascii?Q?RPHvPUqJwh0cGjFjIpXnAtu32ZrqANwMPkkoA6qcG0urv5kz2xpaEA6spiKq?=
 =?us-ascii?Q?IpZn1WyDK/4Zj51CUQ2xE43mF25gEF+dln2u7H/+SVBbs1TD9WeNV5M4B6LI?=
 =?us-ascii?Q?kZ0Ny5KiklE91BrBl1ZKFriMHrXJeVGCwTsKIbYDFlzBwS7huMGxmlnryu2p?=
 =?us-ascii?Q?/uAC0GelYCckmgY/kdm2iBC8FEzroVrQiGRfT1P9lv9rDCy3S4tNnJ0lqqNz?=
 =?us-ascii?Q?f1pFn6CWandbPc4QpQ3RlHsOO9kEAcKtwkQKzzuZW+kfnGJHEe14khXGyO3E?=
 =?us-ascii?Q?tEWIsJCXTrdCCS2y0co/s/jb1GdvT7xkxkKVToy2AvY3x45jJ1iYmSiyJUd6?=
 =?us-ascii?Q?Hm5qc2lj143J4mlcaCkds4e6dIHGMrN3W/+Ifhqaq5u2Yyfsxo1jXlIbtQQ0?=
 =?us-ascii?Q?4fKJ60oFOyytAUz5+s7AtUjVMt0Pr4YD1L4AY9+Fni5nmYzKeW5qkLUnsxQe?=
 =?us-ascii?Q?6NRRIOfFq2eg5MqjjskweDOuRHvwhKX1eknwXwJwY+LMoYHVG0dDbELCXB5G?=
 =?us-ascii?Q?fKZnDen9zbW48iSjjv//71jZe4G3+lUf6X/U8HdvBA/ibJlUWthC8qRCiVu4?=
 =?us-ascii?Q?zdLXqqdoUXhetwY3NVRdyxUDj8VR7XXRSxJYQztuJbwUT15WhVOwzGOJ7FVG?=
 =?us-ascii?Q?fOab7fXElseCmybKeLzeKo+iepXKSVHG8KYqWVFc+dgvZlTV2T4RsSw0kjzO?=
 =?us-ascii?Q?fF1nmYxzL+RKH3JLmOsWTHrZdU0zjucR5bgzask/fnqdw9soici+o8R/WvGj?=
 =?us-ascii?Q?eTUxW9/hvkYzGM8QyxVGowTQqVKJwmSl8+47L9q8rpInLidMT328skPcWeFd?=
 =?us-ascii?Q?TyGxiZnHLmJeXBaRvXaJTW6t4v/h/t6MYCbV+gX7qAi8oVsynAVSPPjuKmOq?=
 =?us-ascii?Q?p1lfINCepqI45wR0wtTzVk5ov837F9IaiDU4rPELUQRAjFtNHwyA8Exxrxtu?=
 =?us-ascii?Q?yXxHH6UKD4offVwFRVyoGcT8BQkExHEwqOLk/HFlNE9UqvRIYgPfNHiydlYG?=
 =?us-ascii?Q?oq/Q8gXpFN8EdF7ZDF4S6L4EzkBDrL+Wx5Xi/F2Yu24swKduXfHzLbXGuKyr?=
 =?us-ascii?Q?9F0cvjVYajAk+qV6TitzE0MZ2Rd4Ifn/pn/vI4xRLHWbLjkFkcqsfeh/0mg4?=
 =?us-ascii?Q?oNlvtz+8Gq1E4fTor1Za7yhHiCWwXyN5gwFHcJA3Ur8oj4AZJBG10mYampgI?=
 =?us-ascii?Q?mm7wKCJxXKVbpOJNfKOL7T3Gzu6Jxd8lJTMqYBUDSK4znjxIyICgaG0D5XYV?=
 =?us-ascii?Q?32e7dkZKzZ9/qo+WuCJSLvk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9924494-c79f-41a4-a7b9-08de20b8c5f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:10.1541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS//gherLxR2UenOiHHwnhRhFnzWhWzqSmXJNJDo0KFRRlFjiDDSoohJdgLDj3ZV2Phkh+KWW7RzWEJmKlwgHQuQ/pFxGUA4pVpi9k8LxIEM+neQqiZY8sm7GdMGwNd9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt5659.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index da89bdd2310d2..f5957470652c8 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -1213,7 +1213,7 @@ static int rt5659_hp_vol_put(struct snd_kcontrol *kcontrol,
 static void rt5659_enable_push_button_irq(struct snd_soc_component *component,
 	bool enable)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	if (enable) {
 		snd_soc_component_write(component, RT5659_4BTN_IL_CMD_1, 0x000b);
@@ -1257,7 +1257,7 @@ static void rt5659_enable_push_button_irq(struct snd_soc_component *component,
 
 static int rt5659_headset_detect(struct snd_soc_component *component, int jack_insert)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int val, i = 0, sleep_time[5] = {300, 150, 100, 50, 30};
 	int reg_63;
 
@@ -3611,7 +3611,7 @@ static int rt5659_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 static int rt5659_set_bias_level(struct snd_soc_component *component,
 			enum snd_soc_bias_level level)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -3631,7 +3631,7 @@ static int rt5659_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (dapm->bias_level == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = clk_prepare_enable(rt5659->mclk);
 			if (ret) {
 				dev_err(component->dev,
@@ -3662,8 +3662,7 @@ static int rt5659_set_bias_level(struct snd_soc_component *component,
 
 static int rt5659_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
 
 	rt5659->component = component;
-- 
2.43.0

