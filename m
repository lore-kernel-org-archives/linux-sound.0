Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB72815624B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820516; cv=fail; b=ULjinHq+TnlnkOJ/MkxP7pvf4ykF+bFd8t7XMskfRVBlFi4MWajnwm03SG/DgA79ktfwqDGPb5rDhx5RctHE/E7K53afke11rKR5vKLjLeCUWvS7BfPQs27saMBoNVU+44mvHownoYSKUuYN+4877gfT7do8yoAScChmkJGULpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820516; c=relaxed/simple;
	bh=C4IpBBGgM7QQ8wotqhGoWtRzK5iN5OP4kRxfRSgUswo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=U6wDmnf8Gglng8H6mDB2MH+OTSULRTH7Wli5fhizkGA+1zTF8mG6zLbE3ICXVICvQT17GpI7QodZigp13DIwn7z3aNOUuFLaJIUqBnlT+9jlDfL7g9T1LcLxoi0+kobVPuHqtjHbWj3hc8B2nj7G+19diNEcN4Tfq1gEHNP9a04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jyfP+Cmc; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jyfP+Cmc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O74c3PH+0SoA8hjeNAQpjQP31R4CZQgSH+Ejtq358phImiGy90L2t14BX1eEgZiwU1T+a0TnQvjPsXvfNUrVAEkZv8KvRT/Jx4cd6XaERNPJyQAoSK9edeToEi3YTagkaosRn6XYjVE1DDRONz+2GP0Ni8VMsJTA5DaXbszElfFbhs/JAm93q9EB/ji0CaoprEN2XKDegqQZ5VVe3txK8VPciyCL+f9vODWw8ugPK3kMCN8WhHJkUaP0LpBOKpRoV0v/VPZWmI8SkxBKS4hcmL5mCbQoh8dK9VXE8ZTQvAu/qXtXuqr31a6waV0kjWvd9fVs8Jni/pJR6CdVGZ2cwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+hrszhT4yQeNlKfZ01mOMSd9uQkpAdt1a/YzHbXmOo=;
 b=TR6+t+dAKOQd+OGm7S+ugPAmzkdQfX43OHgRgV+XHkHKBIUyy6Y/vgYKAQOyHgmIWdh/gu2hPKw7FIrGc+wxsWzRQFewHwdIS23c0YyXn+Lfj9AhE1SL/yH0TAKee9/y0RazvTmT/rq0q9Xw+HFslCLDh9j2+EAaJSpGEfdwuMRQBGT/W2Q8eo01Thj4d/6luhir8Rm1hdnzYOjwNUA+bHsPKHSLNpsZ1uJWVdqlBrST23x4/eCNWQgYG1dxtOd9AXkT9s0wog6RmhfLaMdUKakmFbL7YY/VxshZPfpJbnWhpp0nH3EBkcaKRhVW5Fd2hQPFfsipFqxSzERF+2FdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+hrszhT4yQeNlKfZ01mOMSd9uQkpAdt1a/YzHbXmOo=;
 b=jyfP+CmcVd8o3q8RUiF57dNYrx2Q/BFQRxB82JdG3M9TWsoiXc+REcJxctqeQHT32OlbSlprDLgoimBzYpjD0ix9ygvDc/WLXOTqunfw0+WkiAehZLG0leniad6OVM/wGqqblYreE4AvQ4XJh6Wv5nzceZzYeImcJ/IXDl66Jv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12802.jpnprd01.prod.outlook.com
 (2603:1096:604:33d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:53 +0000
Message-ID: <87346l771b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 056/292] ASoC: codecs: da7219-aad: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:52 +0000
X-ClientProxiedBy: TYCP286CA0212.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12802:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fb803c-66df-4f57-7268-08de20b85075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HOCl59XpP4WmW133wjj+dp0qtPwrcYWPlyG9M5tzxlr3hP2UWXmtgTfcRc3d?=
 =?us-ascii?Q?Zqeo35aLILm6zP5gZmhzPfFG6Ddn0hc6aqKEqUrvSpr7xFq+Rdcae8/v1C0K?=
 =?us-ascii?Q?6XtwSfrjYOXJwIDzE5wILOeTmFxh/MQAzuExPSoVNr5Lg015DDKm4eqqQLuF?=
 =?us-ascii?Q?uHTmBmiEev+WXDs2hmuqfp61cBDzZW7e+A+g7Im9nX3ohE3aZWCrnpT6p533?=
 =?us-ascii?Q?FR4r4xAa/PwqaIXCKG5aT+7FaDid9XC9tljFlXAo52R8rR/Ze7CXdWCX5LSk?=
 =?us-ascii?Q?v2HNbXrYDnga3v70vcCG9vTPzNPOTAhehGYXnzaciA1m/uUy0HpDgn0/qzW1?=
 =?us-ascii?Q?iyWsVeL06S7isMUqOBlnXgDeQ9xhse9TVkkGQRCzLmyxFbTOPX/qEfuXHMK9?=
 =?us-ascii?Q?XVsDR7hiJV842t14xhWxcJesczh1fmvQODM28QpwQAP174ZAKUg05hfSgU9w?=
 =?us-ascii?Q?kV28OqgvQaJbt1D8/bTZMNEYYP8tIipgw9PakhThicTkYeFhUWbE1JSNuww3?=
 =?us-ascii?Q?qVteiltr5mDuVEoervMwNIQz9dpWshsOhncDQa6LbRVL8E/Vy5u90HABI7ho?=
 =?us-ascii?Q?m7MHHURIZlx1sOyLy3sq5aBSKVJk3SfRWJXqd3P6J9H1AS1SutRZsxImNTE1?=
 =?us-ascii?Q?L/gvbDxDo03xU7Xfuh/dIQxDxBcywSqPW4V2L9yxU1a7yTIbA/Ms1afYCNA8?=
 =?us-ascii?Q?7+kHa67y+sJZd9O5YqO0uzZFhR+0hrBLzyhNtIsIomy8HS97RIu2MHVWwgyj?=
 =?us-ascii?Q?hHyL+SKhr73DlYEVFP67CrSKRNiVk55Ackiq96XhpxKT6y1TEMFBECCWSQwx?=
 =?us-ascii?Q?ZKJs+AnspodI9GVW69elgfC5nefEbATNmiHxBSsb2rsu7JE9WDi3ivZt/zen?=
 =?us-ascii?Q?nb/570Ftm5OABNX7j8aKIM8VMc2vFyUsEMAvcQDWlURz3ToPKxB7owSEgabK?=
 =?us-ascii?Q?FdZTyj06SC4MiVcYBUOcUknstAT2SE2BsqQQvUkJ9P+rSsVPNK0x0ympJ80x?=
 =?us-ascii?Q?MsW0rEBlxyCONLgbN69X898jPWGX537BdMcY47at1pgGJao1ZfeOpOvp/WXA?=
 =?us-ascii?Q?DICuH9IRbBSoVGI0Ni4XQ8ZDIPkWsgjZ1O9zHpAAfQYuTms1UqlFwHhOXzLC?=
 =?us-ascii?Q?/gaSGQqvZW6OOtJjDLJqUZea9raVHB2qFWjJEANta0OfuO2QySh5ScVDGgme?=
 =?us-ascii?Q?mMoRzcwObBwzGcmmfLPriCgyyER1bDC3JCN/ogSZmU5AHkScZP6CHVO6jdZs?=
 =?us-ascii?Q?heSyuB9ShB5gCbBEfXMU2vielyVGVeYI/NicFcLLp1vcPV3pnQQlLZdwDWkI?=
 =?us-ascii?Q?Bk76k1OCaaHGKl0Gj55hCyoweeGCaqgguU7BP58BdQKG6Bk7WRBvr/bNiMKx?=
 =?us-ascii?Q?MzmGfhcRbfWJVYjIOBGGcolANK/9hT8NYu8L/9TEF0IcGm5f5g/05hOu4kdZ?=
 =?us-ascii?Q?ByuMj6VaHYZa26qs+xwE2b03Vgik1LTi6v1GFAOThImpLtKa4rpgpX9EiXDm?=
 =?us-ascii?Q?7cTmOrAIB24CEIuy0iAQuF3vXxmP9gCkFUcO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HFzid2xH9x7UghGimsz1crc++xw8TgGGm5WWm6lT3nWILqBVDsfweS6FYu61?=
 =?us-ascii?Q?zOx8OFn6FKjSwGyyE92vt3d+bEgFG7DwIznGwl2wrCjzvZvBZJGG/Rzr5hKv?=
 =?us-ascii?Q?fIqPzEw/5ik8EpEP4qZ4R98scaTDWIN9sup/1kLw3PC5tNKpwjnIyKsuragh?=
 =?us-ascii?Q?nZk5X6hX4N17nWLgg2kDqFyOtFpMx8H9nLKxmZnt7lGPqMuBiD6OxKxfHWvW?=
 =?us-ascii?Q?NaKaYmR2SwUlFsiVqq7mNsT0YXRryn6F4sG9xB4YKdhzdvyEQVGze1Ne/gPL?=
 =?us-ascii?Q?xTZbGOIkmLETmt3K3w2ocNbZDP/8UUdtEBvz0PkKzwuPLMFWvRufTm17V7sh?=
 =?us-ascii?Q?qUS8ByyhGzAJdKSX6rPcIeJHjG+ru+LgVHTn56p3bffWs7j+VfC0AQ5oldrT?=
 =?us-ascii?Q?CLMTcem71Yd08heQVZIf6ArYt2Tk0cy6knCqvtZgqId6nHxnVaHd8Am7AGD0?=
 =?us-ascii?Q?LXWmdU6QthNvR6Df8P1g9rpBS0GbbPPMnuSgwAWKyzfbGFsBbnSv8ZCKeazH?=
 =?us-ascii?Q?v5A5qxLCSeNE847puQnHkst8UYZvVMQAvxQ8CGPd5t76pmXFYC0/nhYHHvqY?=
 =?us-ascii?Q?yKo3lYgVW8IZDT63KpnfwHEeV6JT77XDfnB+Owr9rPoRJ0gRCIcK/MPIdpiy?=
 =?us-ascii?Q?ayvWF4tGlEWkBavy5zv/znTIMZaYG+CNpOmL04HjzQSdhDJyXPFIlXUPMnEH?=
 =?us-ascii?Q?0aoPmTC1hfdVrmvVK0B87xm7r8HOT1RFnmyQ5b7ou+ohZaDgJeyAq8GOUVGM?=
 =?us-ascii?Q?6yLNmRAiKEaglqgChNvFiFc6P6KE0E+gwIa3FjzssNl7mAuhYpe/bd8nANI1?=
 =?us-ascii?Q?4bde9mn4cWZR/KGADDc67IP6s4ewV7pmODnQfy17pSfRgLjEoiuwz5zw7j4l?=
 =?us-ascii?Q?valnUmhyFqeeyMQTvDRajK8vErQKW4pF8z4BCsKHi77PlnQHD2eR9VcUenuF?=
 =?us-ascii?Q?vMsi5wM0V1mI5ZnDI/hSa60wDBxBDhEReNlmjkSamHbgNtqh9jmi1ExsBoEb?=
 =?us-ascii?Q?qgOWYfF2oEoI96c9FXqG+2ZqfLznH3IBk9AgkU0aMRrhPhIiUzoioIWFFaRa?=
 =?us-ascii?Q?PuFDNsaGiVpD3pKLEasXaa4QiHw4+weSt2dvcSZV3jY8M+zT5RmvnK1k1qgt?=
 =?us-ascii?Q?WEtgAEEbvI0FoCuSg8Oy2eAcM6XaMXX+FpDPlTf2R/YXS21GmiKidt7YQSVi?=
 =?us-ascii?Q?3t5KimQMm9889jrkmfV0E3seI9oPAi/fkJiRF0FKPYz6poz1eQgaJcMj+vwY?=
 =?us-ascii?Q?LDoinO41g9uXxWnTv6GqpL+vjwY+ZIja1yOJmxWJaezJr2OK9KCdflx3uYKi?=
 =?us-ascii?Q?hoaHzago9yR266VqBZA0V9m9RRdenuullP0fD3rtNyaQ6oYPzjqwxsaslrDq?=
 =?us-ascii?Q?GW4aGWaXOI8U+GXR6AnMhOlNEN6KQjru4ou6XUvXwvdpjagbnWdXA2hu3/VS?=
 =?us-ascii?Q?cXO8FgIOBt/U8h4fKTGhJAUsWXp7ppKgNI3MtMoKheRqAQ3TJHoi/fYUUN2w?=
 =?us-ascii?Q?Vzbn3lgg5G/cFMQ0novCSBwuX4APN/eUcxFKvcensxT3cbGCyqSoSMTMvpPd?=
 =?us-ascii?Q?oKpw009ucPwnc75Tud8dDZmXuckRx4Ek5dACAKdctzue+DSIbaKlERhi1Wdq?=
 =?us-ascii?Q?hKIcc61Ul6QDbFqm/B3gcL8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fb803c-66df-4f57-7268-08de20b85075
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:53.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRWy1CIqrf4aAO43x02gqOYU5BeDytbGicMvBWsYs0kVjyVOYFMJfRpBK7vlFIr13lC77DD9AyaBQVSSU0gITyOmpo9yiGPW0fIgE5MwuoMFFOznte4MTMmt9YPEv3SJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12802

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
 sound/soc/codecs/da7219-aad.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 15e5e3eb592b3..d9d932a78b710 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -53,7 +53,7 @@ static void da7219_aad_btn_det_work(struct work_struct *work)
 	struct da7219_aad_priv *da7219_aad =
 		container_of(work, struct da7219_aad_priv, btn_det_work);
 	struct snd_soc_component *component = da7219_aad->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	u8 statusa, micbias_ctrl;
 	bool micbias_up = false;
@@ -109,7 +109,7 @@ static void da7219_aad_hptest_work(struct work_struct *work)
 	struct da7219_aad_priv *da7219_aad =
 		container_of(work, struct da7219_aad_priv, hptest_work);
 	struct snd_soc_component *component = da7219_aad->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 
 	__le16 tonegen_freq_hptest;
@@ -351,7 +351,7 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 {
 	struct da7219_aad_priv *da7219_aad = data;
 	struct snd_soc_component *component = da7219_aad->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	u8 events[DA7219_AAD_IRQ_REG_MAX];
 	u8 statusa;
@@ -928,7 +928,7 @@ void da7219_aad_suspend(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	struct da7219_aad_priv *da7219_aad = da7219->aad;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u8 micbias_ctrl;
 
 	disable_irq(da7219_aad->irq);
@@ -962,7 +962,7 @@ void da7219_aad_resume(struct snd_soc_component *component)
 {
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	struct da7219_aad_priv *da7219_aad = da7219->aad;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	if (da7219_aad->jack) {
 		/* Re-enable micbias if previously enabled for 4-pole jack */
-- 
2.43.0

