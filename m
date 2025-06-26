Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CD19F421
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903962; cv=fail; b=Kb+uAmgwaWG74fw3eNrOIkz85r+Yf2EduoS5L+NymjIToQjUiDgi2LSW3mYMZzZg5jG0t8q66UmQUtCJp9CTwzPWlrfS5NkadF4GzIekcg/Ie+M5tJ+87chrBShu0rvpG02rKVyqrOx4Rg54RntyfZbZ7ovXsDsLAz/VyhoAgOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903962; c=relaxed/simple;
	bh=A5J5EErsIR5tHRxo866ZJ+HX9ZMKw8olt9ueohNdHSw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=B9+EhIq0rDrae+WfqbqCEHJze2wrD1ZEVi7KQ6H95nNg9nc5Wfp5DcdBE4p6TBLd3PY9pG5bPju48+HuNWurMzlBxtdCyLlcoggHaY2un2cS4v9FZHng0qBNuqq7hzxu/kBhPaIJwQjHp8KghM8ng6cEp7n84h3gX9W8kUy18VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ONDGqYb8; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ONDGqYb8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WV0OaY2GTzaa+zmiqKZyYkp0PthIV8V+n2irZXyGzWRgbqyNAAAniggH9kB3jxes27yf0cq7qLI4t1yXV7xksNLcXHkbbLC5wYq509/zU8S45t24h7s0hlaCIv5hCWbvianLEzX4USyeDiexHGAGCsm1g62jQkM634kDvd0MjlMq3B3GIUEmfsB7r6STnuFEw/Iy+DYwXICbAlOWRnSvSDM+25NeGuRbc6N9FUUwDpSjjEqf15Df3mUCjJaqDA2fPo27ifvyZ4jV1eu4s/67L6SLxtINDZ5ih7XB3IkNVEEirzwOnHNGO21nQ5n3ZpyuS1XxXlmk6MgrGXOT4tWdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq8hE/dLGfMQ4vNZxI9zp5LL6jPBVwq8Rku8+QVocDo=;
 b=GlgCB/dGYZ+IV9KSLSDt+cpPjwnc9UnwdTp+l8LeU2ftbxa3a2mYgdmiAdneGuYQLTcUrGDNwIgDT1p4mMOTwZek8nkLRHAMvLhl1c37yvT+4y6tE4ANkkMXS/4UXSAkVYOiJkH4J7qGSFVlzLgzus8Em75u256qZoevzhhMeC785wYgKRbIoQ+olcnnmy+B9mTI1kh2z7lvVboPLTWVj9sdMOvs4IzlVf3dOBWiKS4iPP6StvdrIThNbvdvHwtJqKuf2KncLKB6Atoc122hoVLC05f6qBMM/YAA5ak+L/fFRQEn5gG23Hpd30B0gMZ9UtXJnGe7De+4miYbxXw5XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq8hE/dLGfMQ4vNZxI9zp5LL6jPBVwq8Rku8+QVocDo=;
 b=ONDGqYb8D15ldPg0dK8GM1pd8yzWjxOVb0tkOAbFIZlaJZd6AKyq4IBC94EU+maJjzMMCvf1T/Hf0FoW1yyca4HTxGJ0cK5iy78BRl+qRWJdfqYOrNDRrvSun/lMn8QQJwgs/A+E0h1Ukp5M0X1UVe8Nyi38axOcE0N5uSMJwxU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB13972.jpnprd01.prod.outlook.com
 (2603:1096:405:20a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 02:12:38 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:12:38 +0000
Message-ID: <87pler1ca1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/11] ASoC: soc-dapm: reordering header definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:12:38 +0000
X-ClientProxiedBy: TYBP286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::28) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB13972:EE_
X-MS-Office365-Filtering-Correlation-Id: a783a5f2-fb7f-4714-e409-08ddb456ec81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x3VbiHlCBW7TTh28A6yNx/6eqpKELqNtBCkIeOtJWJLyooIxESQqu9gsQqCo?=
 =?us-ascii?Q?JusgM9pRJVhTNd8Or4u62YrNGiVcnuJn0FxSk1GxJoXZds/UWdrZ/W4pbbBW?=
 =?us-ascii?Q?eo9hjT8lYfXBlzmsdt2qtIQ1MCba3wdk8q8khQ0tPfbmBU4M9CoMfjHL+z2B?=
 =?us-ascii?Q?YpHNd8noP1OypV0Q0CKdhkc0llXqKOi5w3CBiyqCbfNWSd0Y3LA4tirSYYcx?=
 =?us-ascii?Q?kZ9rQTVNIjzA6OOmPFbKzzd2KD0Ds2LaWn/ji7GCce3QfNtezLkJixXf74zu?=
 =?us-ascii?Q?Lqrt6alHL/jqpmk4T1LjhacNQgHhSz+If84uxRrqJ6LakhpXAf4aGGOIaTph?=
 =?us-ascii?Q?+8gW+SKElJkPgR5N3OfC9HSsAaTbu0Tn0DGzvuIm8UlTuOPGoksLPMShNJHv?=
 =?us-ascii?Q?dK8TcKYxD9swLsR8oVpCQah0q4saVaY4WV3n2caABpgDs2+BPtDnhYoas+NN?=
 =?us-ascii?Q?Z/ZBSJvdhGaWA+IyxR1YIpYzX5C1dH8NWww663qvgcPNbOZhBSUJp5BvoyLH?=
 =?us-ascii?Q?ePrz/oV2uieWiB23no6+dmrLWnt55irOm3uJjUSsab79gry1IkbBL43n/xdX?=
 =?us-ascii?Q?+nlteFbujO7fOAYzx9YV0nAnN5NGePKNaaigtNYe/RQ6KtvLFWXvtLtahqh6?=
 =?us-ascii?Q?pHAfJkZRU/3BPmkWO7JO9kxYfxVZ3IoiH2WDvs/6n6HKLW2k0S3GipFhThie?=
 =?us-ascii?Q?bI9sw2jBPs3fCkxUJ5jdxVvN70Lko84oQnJH6NnVxwZ/bVEY07YShakUqo3V?=
 =?us-ascii?Q?FKfCbKaZt+el0MgrWA9xZzOGJXI8wXzw7bDwT7JWqNbF1wSUtkkp6zd0hcbF?=
 =?us-ascii?Q?5yixniMwrR8xs2byzbQkndNzuDyQ6adKMpiYzyroqx8/nT3ZaULO/7GNJ6Iv?=
 =?us-ascii?Q?p2PryKgaDGMncfsmw3D0iqSnBnxUNv6riYBZFRKb9b7X0Tx1UiWhAgq+FGyk?=
 =?us-ascii?Q?cSjAII/k6+2UXjXClrAoOBvTsxh+8kq6MQkFCiOVJAGzfCSfJLiBiTY0Nm+2?=
 =?us-ascii?Q?UC+zuhUMDqk/Laf0rGK3Yqi8qoQLukzu58FMGKZPPDaxUHKGGntQjLkjqurV?=
 =?us-ascii?Q?BcDLUxgoAyfFqpCJYImjIC8V03buw0vXWid9fbCGQzi5jL8Z9tYzQDKpt5VP?=
 =?us-ascii?Q?Mi3QZjAGnQXREVNpoyn//SAK05eVTsF+KMh1dfuNRkZOUQttqdIzJJtnyDV3?=
 =?us-ascii?Q?cEJKdnw6H7k5hyM4NRLMv9Jw9/W6ULWePxu6s39BDzytD+XdHChh5kTvSiAv?=
 =?us-ascii?Q?kqh1msVJii/6YdFTa09xGwKh6n3UsCrY9pHQMEgaHFoUnE0yswV6LApjnsXe?=
 =?us-ascii?Q?O31IKsza7l/G1J3ZInshuAtH3wMguewOTEKRRrpinzA+x5kphAQ1ooPBT4J1?=
 =?us-ascii?Q?yMLvlK37fCoB7o/W+MwNUDSCoCzhzNXZnbK0Ao4dWoSDSleqshA1ft6lGR0E?=
 =?us-ascii?Q?e7tXLubE44+/7ziInhzIzOqPi4GlWTk/ohm0Ip8xBiZv225Iw4b57g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8yVQVPOeEKisTOGXjRxwUxDd3OGToQWiVu76RtVnZ/P6no4ZPIvmBQn0j4RN?=
 =?us-ascii?Q?rqqerjn90xPKnkCIkQTuwzAYbyC6oJT7tLwpXmr4lgbz2l3bAKDiq7VwxcS1?=
 =?us-ascii?Q?sVWvBk2zRlOhtEEdvJpihAZuRbkawEH+vvHL2i3x08KflmZnv7uAvSuJD90N?=
 =?us-ascii?Q?YlJQSa4GhfEYFyv8zqwa1QYpG/qSDwDm80y50iQyq2LB5w20CpdJQKqYy7E1?=
 =?us-ascii?Q?kkpJVCac+Yo95rPeqy/GMigbF6z7PZDOpzozGnhzIxxhRDcxcXoii6gH3jv1?=
 =?us-ascii?Q?NY7/e+8YzCPEGzjwwT+2XP90ZVNltqQiEd6J5EhTftzyY47NmmJ+ict27zcD?=
 =?us-ascii?Q?ViTQ0outF8ykxslqVL1bjDVwlLy7RMJYJzS5knrA7UE4o9baaWBsq9X1pGqP?=
 =?us-ascii?Q?8W5RlAOt4ofP9t2AZfERt1NDYGS/O/KJRVc0PcFecXWOq98HNR8rE0lQSuED?=
 =?us-ascii?Q?MrWSSMdyHtCzUyLE3dO5XuKjU8dxR7c/gYUNsCDm31SE3VLlbFe4Qhc6q8W8?=
 =?us-ascii?Q?WE+xvMdSs0cboooq/KBDUSaTcC7/cnHyvg+WSERP+wcdz1By9cN/gFHjwlL2?=
 =?us-ascii?Q?801VT3Cz7eubqH6oM/G2NhUAn/kl3MfcCj4lz1zL4pgnjeGBpw3504L8nSBu?=
 =?us-ascii?Q?ZHRGmndvdg8IrpV4NMHxfmMsJWOdtW+igJUP+tnf1mK2E3aDwTpaDDv6qeAs?=
 =?us-ascii?Q?nl0YGda9ELcH1rBUpklzIdoDcLi1k2EuGAhAPGAri01Q0X/lTJXB2PKgd99F?=
 =?us-ascii?Q?CchQz9UQFfLNFi8ju1IC15H8myWxmEs9/ym4UO7t/ezSfVj/bfxShmMPV6XI?=
 =?us-ascii?Q?Egbj9rMRrsUVEsdg72HUwXPozgfd1lWtiIm8EIGr7GuRvl0VkJaXPyhA7A6X?=
 =?us-ascii?Q?AobE4cCVB0gzl2gbH1guxuXM7cZNAhLXgidnMX+Ml4rvYEsk34xqECdTcp2v?=
 =?us-ascii?Q?/T8P5dFDklmhUsyc/RKctUELVFAXKHdqls5Qy4xiv0LaUuNnPnUbJmD0OLRT?=
 =?us-ascii?Q?wj10pjYPGJsZRYa4sw0owtEWcWuU4a/ECP702Nm75/qN6FGnt5d6Tvkw0f44?=
 =?us-ascii?Q?DxPqE/pUO6tGDpgfCULMqLX0X7eLl2Bf5sJomN4ksb31FDkL9/USmuk6i3B3?=
 =?us-ascii?Q?GCt3RUMAaGdmhKMAvt8iT+RB2D11D0ccDYkb+a5DznoMmR8vpSzAuM/sSYcS?=
 =?us-ascii?Q?E2zcPiUNV7ntssM1eooOkqSx1rvtXiRpX5l+tuStNOKvHv0V4yl3K56IAPrO?=
 =?us-ascii?Q?UTr4/cQfIGZAtoakRCn0KFfDdrH2U5FczEUd44Z8NgEwZmJOxoACd3Ml9dEo?=
 =?us-ascii?Q?HToy9wmLTOlcoTI0N+fawHSEfDvOSArglSuaTnvqlniAw83GGIGvysspCg99?=
 =?us-ascii?Q?npEHAjDpITu+692e5J5264OUsIIWauQYe+SW18WBjrfzM+GyRKx1cyobxqUI?=
 =?us-ascii?Q?vM/0rUBGelFCizqw8jx0DnHznGaCqEQTzOprnh173hS9+wC9FoCv4K4AjHDB?=
 =?us-ascii?Q?O92wa9xqAi39ZYUkQs5n8rcaotAIvFxD8w8eFYv8XhqwrWT9v9OOALM5KXFO?=
 =?us-ascii?Q?bCLrA+qBzV+D6uPOEYzmGkYDAs2c5l8199prFP68E2DUSX+aMJqMChtMwrgA?=
 =?us-ascii?Q?6wPYgUYBSJZru60HJJ38jAI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a783a5f2-fb7f-4714-e409-08ddb456ec81
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:12:38.5869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yhOFAsftUeA9A3lSesoODsvoMeH8IxODW9pen7cdgBRyQx/QNMLchEfdC7wr/u5TNM/0UrnAClnhQhfpuA8K34YbaQXtqKkvoTU3t6SgimpcGGCnHeBox8MrYr23Pgx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13972

Because header defined randomly, it needs name definitions on top of
soc-dapm.h. it is not needed if definitions are implemented in correct
order.

This patch has big change from change-line point of view, but is
just reordering, nothing changed in meaning.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 235 ++++++++++++++++++---------------------
 1 file changed, 110 insertions(+), 125 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index d3ded7f5ebf5..1216285537b6 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -16,9 +16,10 @@
 #include <sound/asoc.h>
 
 struct device;
+struct regulator;
+struct soc_enum;
 struct snd_pcm_substream;
 struct snd_soc_pcm_runtime;
-struct soc_enum;
 
 /* widget has no PM register bit */
 #define SND_SOC_NOPM	-1
@@ -399,17 +400,6 @@ struct soc_enum;
 /* regulator widget flags */
 #define SND_SOC_DAPM_REGULATOR_BYPASS	0x1	/* bypass when disabled */
 
-struct snd_soc_dapm_widget;
-enum snd_soc_dapm_type;
-struct snd_soc_dapm_path;
-struct snd_soc_dapm_pin;
-struct snd_soc_dapm_route;
-struct snd_soc_dapm_context;
-struct regulator;
-struct snd_soc_dapm_widget_list;
-struct snd_soc_dapm_update;
-enum snd_soc_dapm_direction;
-
 /*
  * Bias levels
  *
@@ -428,104 +418,6 @@ enum snd_soc_bias_level {
 	SND_SOC_BIAS_ON = 3,
 };
 
-int dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-int dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-int dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
-
-/* dapm controls */
-int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol);
-int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_info *uinfo);
-int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *uncontrol);
-int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *uncontrol);
-int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
-					  struct snd_ctl_elem_value *uncontrol);
-int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
-					  struct snd_ctl_elem_value *uncontrol);
-int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
-	const struct snd_soc_dapm_widget *widget, unsigned int num);
-struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
-		const struct snd_soc_dapm_widget *widget);
-struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
-		const struct snd_soc_dapm_widget *widget);
-int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm, struct snd_soc_dai *dai);
-void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
-int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card);
-void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
-
-int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
-			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
-int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s);
-
-/* dapm path setup */
-int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
-void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm);
-void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
-		       struct snd_soc_card *card, struct snd_soc_component *component);
-int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
-			    const struct snd_soc_dapm_route *route, int num);
-int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
-			    const struct snd_soc_dapm_route *route, int num);
-void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
-
-/* dapm events */
-void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
-void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
-void snd_soc_dapm_shutdown(struct snd_soc_card *card);
-
-/* external DAPM widget events */
-int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
-		struct snd_kcontrol *kcontrol, int connect, struct snd_soc_dapm_update *update);
-int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
-		struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e,
-		struct snd_soc_dapm_update *update);
-
-/* dapm sys fs - used by the core */
-extern struct attribute *soc_dapm_dev_attrs[];
-void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
-
-/* dapm audio pin control and status */
-int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm);
-int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
-int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
-int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
-unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
-void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
-
-/*
- * Marks the specified pin as being not connected, disabling it along
- * any parent or child widgets.  At present this is identical to
- * snd_soc_dapm_disable_pin[_unlocked]() but in future it will be extended to do
- * additional things such as disabling controls which only affect
- * paths through the pin.
- */
-#define snd_soc_dapm_nc_pin		snd_soc_dapm_disable_pin
-#define snd_soc_dapm_nc_pin_unlocked	snd_soc_dapm_disable_pin_unlocked
-
-/* dapm path query */
-int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
-	struct snd_soc_dapm_widget_list **list,
-	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *, enum snd_soc_dapm_direction));
-void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
-
-struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kcontrol);
-struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kcontrol);
-
-int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
-
 /* dapm widget types */
 enum snd_soc_dapm_type {
 	snd_soc_dapm_input = 0,		/* input pin */
@@ -718,11 +610,6 @@ struct snd_soc_dapm_widget_list {
 	struct snd_soc_dapm_widget *widgets[] __counted_by(num_widgets);
 };
 
-#define for_each_dapm_widgets(list, i, widget)				\
-	for ((i) = 0;							\
-	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
-	     (i)++)
-
 struct snd_soc_dapm_stats {
 	int power_checks;
 	int path_checks;
@@ -734,6 +621,114 @@ struct snd_soc_dapm_pinctrl_priv {
 	const char *sleep_state;
 };
 
+enum snd_soc_dapm_direction {
+	SND_SOC_DAPM_DIR_IN,
+	SND_SOC_DAPM_DIR_OUT
+};
+
+#define SND_SOC_DAPM_DIR_TO_EP(x) BIT(x)
+
+#define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
+#define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
+
+int dapm_regulator_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int dapm_clock_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+int dapm_pinctrl_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol, int event);
+
+/* dapm controls */
+int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int snd_soc_dapm_info_pin_switch(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo);
+int snd_soc_dapm_get_pin_switch(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *uncontrol);
+int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
+	const struct snd_soc_dapm_widget *widget, unsigned int num);
+struct snd_soc_dapm_widget *snd_soc_dapm_new_control(struct snd_soc_dapm_context *dapm,
+		const struct snd_soc_dapm_widget *widget);
+struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
+		const struct snd_soc_dapm_widget *widget);
+int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm, struct snd_soc_dai *dai);
+void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
+int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card);
+void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
+
+int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
+int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s);
+
+/* dapm path setup */
+int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
+void snd_soc_dapm_free(struct snd_soc_dapm_context *dapm);
+void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
+		       struct snd_soc_card *card, struct snd_soc_component *component);
+int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
+			    const struct snd_soc_dapm_route *route, int num);
+int snd_soc_dapm_del_routes(struct snd_soc_dapm_context *dapm,
+			    const struct snd_soc_dapm_route *route, int num);
+void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
+
+/* dapm events */
+void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
+void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
+void snd_soc_dapm_shutdown(struct snd_soc_card *card);
+
+/* external DAPM widget events */
+int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
+		struct snd_kcontrol *kcontrol, int connect, struct snd_soc_dapm_update *update);
+int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
+		struct snd_kcontrol *kcontrol, int mux, struct soc_enum *e,
+		struct snd_soc_dapm_update *update);
+
+/* dapm sys fs - used by the core */
+extern struct attribute *soc_dapm_dev_attrs[];
+void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm, struct dentry *parent);
+
+/* dapm audio pin control and status */
+int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_get_pin_status(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_sync(struct snd_soc_dapm_context *dapm);
+int snd_soc_dapm_sync_unlocked(struct snd_soc_dapm_context *dapm);
+int snd_soc_dapm_force_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_force_enable_pin_unlocked(struct snd_soc_dapm_context *dapm, const char *pin);
+int snd_soc_dapm_ignore_suspend(struct snd_soc_dapm_context *dapm, const char *pin);
+unsigned int dapm_kcontrol_get_value(const struct snd_kcontrol *kcontrol);
+void dapm_mark_endpoints_dirty(struct snd_soc_card *card);
+
+/*
+ * Marks the specified pin as being not connected, disabling it along
+ * any parent or child widgets.  At present this is identical to
+ * snd_soc_dapm_disable_pin[_unlocked]() but in future it will be extended to do
+ * additional things such as disabling controls which only affect
+ * paths through the pin.
+ */
+#define snd_soc_dapm_nc_pin		snd_soc_dapm_disable_pin
+#define snd_soc_dapm_nc_pin_unlocked	snd_soc_dapm_disable_pin_unlocked
+
+/* dapm path query */
+int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
+	struct snd_soc_dapm_widget_list **list,
+	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *, enum snd_soc_dapm_direction));
+void snd_soc_dapm_dai_free_widgets(struct snd_soc_dapm_widget_list **list);
+
+struct snd_soc_dapm_context *snd_soc_dapm_kcontrol_dapm(struct snd_kcontrol *kcontrol);
+struct snd_soc_dapm_widget *snd_soc_dapm_kcontrol_widget(struct snd_kcontrol *kcontrol);
+
+int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm, enum snd_soc_bias_level level);
+
+#define for_each_dapm_widgets(list, i, widget)				\
+	for ((i) = 0;							\
+	     (i) < list->num_widgets && (widget = list->widgets[i]);	\
+	     (i)++)
+
 /**
  * snd_soc_dapm_init_bias_level() - Initialize DAPM bias level
  * @dapm: The DAPM context to initialize
@@ -765,16 +760,6 @@ static inline enum snd_soc_bias_level snd_soc_dapm_get_bias_level(
 	return dapm->bias_level;
 }
 
-enum snd_soc_dapm_direction {
-	SND_SOC_DAPM_DIR_IN,
-	SND_SOC_DAPM_DIR_OUT
-};
-
-#define SND_SOC_DAPM_DIR_TO_EP(x) BIT(x)
-
-#define SND_SOC_DAPM_EP_SOURCE	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_IN)
-#define SND_SOC_DAPM_EP_SINK	SND_SOC_DAPM_DIR_TO_EP(SND_SOC_DAPM_DIR_OUT)
-
 /**
  * snd_soc_dapm_widget_for_each_path - Iterates over all paths in the
  *   specified direction of a widget
-- 
2.43.0

