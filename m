Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01756183CA6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820566; cv=fail; b=g3C+oFGZWUvXJ4N7TGkPRJkdJfor6FjUis5jxPXF3sFy0Hz+DEmLsQNdr58GKu5+7Jm3Px5UkNKyAL++mVdUWFqVz5EGeLS63p3kBa1JcwrENR9xxo7Zb2tx1bV78oKio+jJiKESQt/HBxlpZDiQjRkOYkbQoXeoOjaTxy2X4ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820566; c=relaxed/simple;
	bh=BX1sJbOm9HLAqr054mAmeDIgIRVjwV7Lg6+lSZetbeo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SSBgZYFqMBziFoWC2tAqenLMk2ZZ/LCxkGNrhQiwlGY9/lnMegTEUzE0tVWwezSF6pbCVidShJ7E30D2dpJ4yIpgBFnvnA2kgQ0IGpds7i8VNkaUvCmPOSh3Ae4FwfGhBnp+AHA4AgBlmwLd5p7L0O8+ixIqBAbpcUg9KJkfD5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AOgbsYE1; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AOgbsYE1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHULMKLnJzZh3ZVpg4gYohqBsIlB0J0bU+X8rMjSrhyXwmNAgVBI3+szwAejKiGVXtAwrTk/uA9OlZfvSvHz7H8W/TrDTYNC5ikx3daJf802iZV0RxmLGBPHYD8JaqZ37G+iDmO0+EkZzr+3+6TfMEVBWu/0mHPjfJl1RctZemsdmlU//I1SPyC/fmUQ16Oj/ICIzp0tRQ53P735l1wOQXH8K94u1HjAWnPIG2iIYR0GvTN0/HcdTUP8XHGh8N80QrEeUqTOW6x9RpDGaIqKFGUAe9saiAR9i8EV3n31eT8xt/c3dyAdD3AMJeh1Y7GEwtC1FeDwuwnjvmQqjUM3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9GsuFJaqIDqr+oQ9poCqfDxXA/q8JLl64uWJWuf4r0=;
 b=FM/Z7aFIKdZARJshtM5vX3wiwMdinaKWaZH3L0QrsZCOL2syiONEI6zh/gBM16US3u4ex31EHrzjbQ01sBa+U+3lzggJVk+n6qxj2nqi1S3CUth01sBPyB8s4DQv1AiY1+CBWj48EtztueRnaXS2wffp1J4XCl/x3jKIFF+4CQh1RmDbCi4DnagebVB9wEbbPPwiKOyxlFE30PewWjL63omKIjjyAz/n18ZkFaecU2OFsO/ac1WzxsBTDJGdxX0IjB21hvj8d7nNxR/Mxvg4o7/mH+O2eXbnFSjYw4adznBq0Uc+InXfcWtXUiKP8MLRBtDSd/Zpc9OXEln9oLrBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9GsuFJaqIDqr+oQ9poCqfDxXA/q8JLl64uWJWuf4r0=;
 b=AOgbsYE1GbJQMO4Oc1fjCitW92fcstPgRPOKsy3ZSSp0mnocOe0+3CtWZwEW5YftL3cSEu5mhNfsT1KfUSskjKpXf7k4RvrZT8BwwmIA4wHd4oYxhv0eAQTcxhVtND/84hQxGNdi3Y3RHVHAflF6DRL6pJH9Oqe87ebBzovBzQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:22:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:22:40 +0000
Message-ID: <87jyzx5sfj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 069/292] ASoC: codecs: hdmi-codec: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:22:40 +0000
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ae743e-1110-41bd-5b65-08de20b86cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DPnlA2PjYQYH2IwRVYTC+Zzfkdl3Py5H5wJKZWGpu0qT94lDjy6wX+pTs2YR?=
 =?us-ascii?Q?e6rc0tFqWzTc37KBUGtVWHV5EAx8HO4vOSypRPKdacSddXGiSurdMPaqexp1?=
 =?us-ascii?Q?uSQGgyvvhyqRu4tREJCcS90iauHTsefKB2RRzS23NpXaz/Sa9Utv2+/DpfQY?=
 =?us-ascii?Q?UVn4oB2c4xRnME6ZcijoJ0Isw5A1rw5kgvH/TwbiQJHSeLHTAUKrajq+UWNl?=
 =?us-ascii?Q?4IXUB9rsGxahABJJGitSbl8dFvi11ak3+L6Qv2UgEe4AGINl575KxPpo0TX6?=
 =?us-ascii?Q?J/sv1K/ok/oAs+IscSyzN0wKen4ACRnzDOUZizg7xuudLeIQg259WrcZStyc?=
 =?us-ascii?Q?LB3mieN8OzqwxpIF78rbPe0pQD2V9T3uY+hJ8XWwgBspBGWaphvepv/olVf8?=
 =?us-ascii?Q?v6jp/KQ+JqjS/gSDzO2bIFl/oiwmVfoBURgw0WQSr0sYu67XLIVUTK2n1v3s?=
 =?us-ascii?Q?X9Okci5MUKK4lJilRnI/jDovMHNAO3gwwAHpZGRR/Hy/BjpRL90HdtALvJtY?=
 =?us-ascii?Q?NfyCwzydviUvc5+XGdTGyESOI2V7UlpEQG274+VhL7kPIBE9NvYBw8KzjQAU?=
 =?us-ascii?Q?8zgvHz91sNt0qUXxFYxNcsMfkW0Gxt6Pq1saaLTYGzjIyhe+jvQ8vNCmtsqG?=
 =?us-ascii?Q?AefZq0in1aK8HqW4fLkrypEOTIY1eR82Ix88AEds4FDKw7d66MItHubnqVNs?=
 =?us-ascii?Q?10H1oYcPbuYUFsLJxbX0I6KKrP4G9dJTEdSttqnRk/vDRF38qUZkb5VgR1l2?=
 =?us-ascii?Q?CMB4Ar6JBVppUJpsk+fKQajB5hAQNqoT1392X5pUU8rIZ/JK5/MZ1fPF0Vyu?=
 =?us-ascii?Q?uz4AZIMHKySxbsGfIM352ocAZjr0VJ5Q5lKPAPy5X9RLPT6Hh6EN8JMuGtWe?=
 =?us-ascii?Q?dBbdHyRaXczRJbSrO2q7PEDlA+MS2HfGxzM86/vyfKuoQjvkCQYwQ9sJU9LA?=
 =?us-ascii?Q?Slj6hjAwp1VVM5vhkWbi4vamV3JnUAT8DQ0je2r/Bp/PkRcHKlVA4gLeqXhE?=
 =?us-ascii?Q?4/HH8ttha046W8iGutj+cxC5+Igw5Sqrmwy3+5Gl8uDQy8bf4nAb/NoS6WSY?=
 =?us-ascii?Q?Q917X+DKOS5FJJlf7MoOdPbGORXSiJ9KUaq4s9bCp5MIZkjT2ZGe/2wqo+JS?=
 =?us-ascii?Q?937TZhCT9iRu1XeO6I9RDc4+EJL2uwhwnYKU3ICH5BwHZImNctH7b2Pq5zui?=
 =?us-ascii?Q?3kon8fTUULWPZ6qOSGoVhK9AsG5+iSXplvUb3FtBScRn+H3CWLJoUWf+1pQy?=
 =?us-ascii?Q?SGXS/nr2+3mVLEgWe5PQ2laXQm89jBRv43DgPH3v+bTdDf79nojc/KaFMSrP?=
 =?us-ascii?Q?6JVNRT6WDwy3jGqzyaotS60e7f8c1Fpo9cF//olbiSGWT9r8/tIVy1vJnOFu?=
 =?us-ascii?Q?cz1Ny5EqxHCKlb8dVcxF0078lFJa/BwJjbcrCgMEETSft/CEaTS3APAjYLrZ?=
 =?us-ascii?Q?r5A/wuICiPIv34fbgdo7JV4bX69jydNpBogbKHKU/z7TqAoYuLyWPq1GLB0Z?=
 =?us-ascii?Q?29oQEpcYN/3pmErrJJaj3blwp1o/nXjYn6QL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Co5sH/gz+UUgjuQVwUIB2SwujroLkoAm+RqM5JyydGkjXCPSktY3kSdoOGsG?=
 =?us-ascii?Q?FpyNyT2Dqb6EheIVSEC4e46F87WBbp6EAoPO8P3sZeZav6xPeooEa/Q4vmMy?=
 =?us-ascii?Q?pQLByh13z6G3vJt1l+h25uEr/jKtzWmCBoLrYQhUs3LqM18YUlwGBh+WVjD3?=
 =?us-ascii?Q?1PpVx0PvoMdjVAQed+YAotQMU3LdQO7jP1L5xJlW4RhbZDgh1HmMVoE5A5xo?=
 =?us-ascii?Q?c1dwCKLkWTLUXpRke6I3dZBsKG286jtvtBnY70/FutByJd2oE/mvRl54Zlrj?=
 =?us-ascii?Q?EcSMa9rWKUvi76TacIB/3IC9NPhXYru70TLAQkSI4VT8y6rADcTL4ff/B0Q8?=
 =?us-ascii?Q?snqgbTvEHaNr26tb+kcYCt6PnzTvjb3X52sbvA+2MOu+yRIeF04qDvxHg1ti?=
 =?us-ascii?Q?WgMRAvMZaSrWb+n4FrRgCmlgZ/wju3g8fvnLqTrJ/s0GyNGIjv3HnqOxpYsU?=
 =?us-ascii?Q?8Zf2XS6Vygj9wq3W1hZZlpMeTKn6Hun7HXxdGkUlPMHVsJA+HHwy0A8igzeN?=
 =?us-ascii?Q?fr59eb0i9asmLgA2ttK/7YbHsKjduWoi5LG2dcm8Qwl2JEp7tMUoUUt4PT2p?=
 =?us-ascii?Q?yA1qcyAK1eTgp3lVGjuZkocRatU6RezuJCdZ7wA7ekpXby2BfXSboU6q9oG+?=
 =?us-ascii?Q?+sF0d1LS664ndtwqMvDpk7L9RNN56l7HUjwv8VhjnisRr0QB0jKGW6foON53?=
 =?us-ascii?Q?F+5kUPPJmFdG/EFi8b35eT/MgrTm4VxMZku76ZGJZo6stOBvrPLC+Q0OcAD8?=
 =?us-ascii?Q?INlIP0JgWbK3LrlIsxF4Rav+W18Ah4UThh/4z2FoR/JLKABceiLvW9kqe2bI?=
 =?us-ascii?Q?SWQaRuohCsVFKC8yI7vpNK8urvHyCR+Z3GgcCFLpMnhmIQIrTkqrYBeYN1aP?=
 =?us-ascii?Q?SWJLHu/MrtXUbNZClnalbz+31/uZbQ+leAcs7Uzqp88Wc9QfC7vXVmpTxmF1?=
 =?us-ascii?Q?VSD+n8IfNgtdgkmtJUlNaZG3JxFZKvn1T9Omq9FEySMB0usDwDYRfSq9NORs?=
 =?us-ascii?Q?xZ7ATgaM8rb4xZhET6hRPPypv5pvoBAtlhjYE9v3Ilb06snonrNOa6U0Gwa8?=
 =?us-ascii?Q?Sp8u9QgQi0lc/m1WB4c0hwS5LKdSChslSH2w/9dO+fJvrFchq9qRcDXbH0Ya?=
 =?us-ascii?Q?+hHOrb8nmcHux3GoyV7ieZPN/HlcxJvYP7MWJdHjtofJRxNXHmKLMFOoiu6O?=
 =?us-ascii?Q?ngk8Mop86+qvAJUoO+NWqqcc0EE80KZFM9yADpZ+XIzijAZKcMf4y0ZImMey?=
 =?us-ascii?Q?BLFlC+ibck789SFZrqfmmvwzv6GFMybYkEsBOWfEHwB9P94suPyYEB849bBo?=
 =?us-ascii?Q?+xUjc4qoBvhww/pjUOkbT+jhixLeLYjUEklvzEAeE3YSIS2ZlrU0WMZ/XOm/?=
 =?us-ascii?Q?3dreb/1VzCUy8GcSXdMZFHLwCenvgBqCN+qp4Z5kucvhhWVJhio6Om71GHfe?=
 =?us-ascii?Q?gY7ZqunaUHpN3MzXR2k2x0e3YOziMhJHqm3OKvLHfkScjEd+3LOnxq1gjku4?=
 =?us-ascii?Q?sxolWowyH7jaj4ljuQEt5RCNEtV4j9WkI1NiZxZh9W65yXdd/fdIwDP2I8NR?=
 =?us-ascii?Q?g6slArnQg8uJqMp0+Z8jo6M0IR5u80DlsD07MffQv9FEIsLdHAQ+Uf3p0dBm?=
 =?us-ascii?Q?Iq+vHG75kD1pYs+oayK7yrg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ae743e-1110-41bd-5b65-08de20b86cd4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:22:40.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fP59uvLbKDuhm5vUZyoPeCyOfoDEnI1MTCimnjg6Uf+dRoowpWtUJ7uJjw/ggA+aXC3hbJCwSgTRTRNkF8313oskH+d4/Na/sUZT1jFVK3OIPC6fvgNTCW2eTnUYVXTk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/hdmi-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index e1933f733af10..13ae9e83bc21f 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -908,7 +908,7 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 	};
 	int ret, i;
 
-	dapm = snd_soc_component_get_dapm(dai->component);
+	dapm = snd_soc_component_to_dapm(dai->component);
 
 	/* One of the directions might be omitted for unidirectional DAIs */
 	for (i = 0; i < ARRAY_SIZE(route); i++) {
-- 
2.43.0

