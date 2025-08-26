Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E052F6164
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 06:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756189315; cv=fail; b=kB3USJLe7M+QKK/f1RDKhMc4iBInEN+/KJDWTI5ti4W/Pc/CprDNPWaPzC/DHtcktFLS/KqqQmBaoL3tHf/2DGN4gHmuUMV6RjtdePRVs5uyhR36C+9cLItRWC3cDbzyUnb5HLWNYKEzboVXXiEOPsiF8Ld3GFgFZY3ewYNFze8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756189315; c=relaxed/simple;
	bh=DjgijX2D76cSHdg6blj10GVvKMsWndx93l4e7jtaOfs=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=FnFIWgcPKfsTq/Ld6+LRVe9bMclwU1UM3PocKWKB3fxnZk5g1UZhakFrY0/wKBCQjpQ+KP7AQdtQm2XvOaPNfmYSWFhTawb1rdO8f4oaJzGmFnZqNuFTg257Pzv/q9HwTsw6toNiH4nKqbHJdtMhKTDBBhoCMpe2e3DG3jyqnIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NPo8lctd; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NPo8lctd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZmxaFw+dpAHs5a7WDnKxIW3SEEhFSOxE97jjAt8RvmI8rFhDx9FS0BwAIah053DzgP9gZR5IcllnVa2b8GuVbRcnm0t6VQpJuhFnFISO60x6CPxpFQoSCl5hLe9RWhkQKifCCl1gIFMYt+HEdA8suulQ+SPxl4TlXQlr+Sv3RdoIGCPFrxoUeYzf5o8mOaQeX2GcLNUKmpSJHWZ3Wv15DUdgfJo7rwAu5xKCjEdqFrbnFlrZiuoFi7dZak7wDTr3ztryLL53ybpChuuyslUOY2DVpjBMqhGZWhtejMvSE/7RgDAiDTjkS/jp01eQVBIEDaLSjzOybjaZ5lt86lPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14jqqwXWjX1DSX1BX6qjXqrcbs+/Jxr0NMTPXT56T8U=;
 b=Pi/AZBR3d5rMHNw7A+JbM4zqWAatZstx4uBJaVIrLGjtTn2drftbpPBTkzB5JxEXfg5ahNnEsbGrYgl2YRBn60iKuPwVdC/BGU0J7zUK015pLVI0ATXeLDN97s02DCavt2XSu2ZfaxVk8c1Ljr0F+PrvI8E6DcdGcpXt6upYlzzSFmTulzyvikmlODqKZATRPx9fUzISkSDGY0EN1AmearlyJWAjzVI+MpXIu9Hd71aum4Beg0wA/JWui7cAX98DdbJ0VEWFmomYCmxmZm6zU/114Glp3SHHRNuhR5qrkZQnyozNAK301kRuvAbaLD0hwqBUbMK9iipRDgTUrgnnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14jqqwXWjX1DSX1BX6qjXqrcbs+/Jxr0NMTPXT56T8U=;
 b=NPo8lctdwj7LrvnO0thmky03Mjv8FZngovwOoUi7hUHLuvVUY1TTTsX1fgA2cWk5W0ku+NZ81B3/7vXGJk0jVVXWeVBsO3PjdlcTL2oFW29w6vskGdFQVg+R2TF3hkQ+K/4a2DI2eiXJkuGBAjGKaws5a74glOsj4Od/wwrPg0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB17440.jpnprd01.prod.outlook.com
 (2603:1096:405:354::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 06:21:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:21:50 +0000
Message-ID: <877byqy54y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] ASoC: soc-dapm: rename each functions/macro
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Aug 2025 06:21:49 +0000
X-ClientProxiedBy: TY2PR0101CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB17440:EE_
X-MS-Office365-Filtering-Correlation-Id: dcee0ef6-08d6-4148-0ec5-08dde468d79b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cn7v+Gdn1NuhspfdBUPvJEA84ZZ7Nli6d6LrRcgUcr3fTNyBX773beLvu05l?=
 =?us-ascii?Q?LSJioImEVgK2IiDVV2uUI9A0vEH9GP3yuA8Ab9vfOztPt1CVZRptplRoqq07?=
 =?us-ascii?Q?vXq3yxlRLRPdbC0sKlTZDPxJFo42RDah/+6rYkOFh13u1R61V3qbHFE2XwsE?=
 =?us-ascii?Q?wbG/oyRpDgsgBtUbkypg1I2yebhgsQtm1SbZdTTMiYzOh5Z5HSBmljBWa55M?=
 =?us-ascii?Q?1IUm/t+iTm/aL2ndbV7u/udbLrPsK+6rEkfN22dileyOPcyf1nYuX2zkCA+y?=
 =?us-ascii?Q?Jfvc12HYLtoRFrel8FSJrBrO5+sPTsr5LKPahvx9srGTFl0FbEZX3V6vyEZA?=
 =?us-ascii?Q?K64Fh/dumfr7Ax3J32KA7YkD32DCeY5dRC8eO8UeSt7kKKj9yrlDbNesszIO?=
 =?us-ascii?Q?ck/tu7ZEIA5drCJCLpm3O1sN3ZttsHbuato1WTO+/auZldeCk5yuubjjabCf?=
 =?us-ascii?Q?cJFj3MP7FO4784qPC2q2CqMjR5gIHXDR+LaAJU0ot1jpFEYV0i/5PmJT7Yll?=
 =?us-ascii?Q?9mFNojAj0BII0BqZRoBWtxzOyPZXyyZthRNopH9w26jSlJU1I56C+Ybx8SXy?=
 =?us-ascii?Q?gnm9BFeGHG7bHz+QO2ssH1REotDQ6yH+QaA33eg+8xoNBvq3ndEkFYyJ5X4y?=
 =?us-ascii?Q?OH0inFVFnEicqWGoYil+fz+sNgDs0/ZKw/eZ8O8/RCOhCIr7ChwsBKp4O4KK?=
 =?us-ascii?Q?WU5PA4Q1MZVjXuruEd8uK146irRXjpR3BALiEObCBBTQxy+MPQ2tYLm/uy4f?=
 =?us-ascii?Q?bu7hByS/qzt/qXOhQQRXBz1Hsjv7brC6WyaJkYFhJELoDD04r9IKj6ZQ9+EI?=
 =?us-ascii?Q?13/cGLpK94lkZWeced4yHoLsM+zg2CNH/MRemQHUR4HiUaAtTdYnLjVn2Rrj?=
 =?us-ascii?Q?BDS2Bvzk7yldZzK6H99wIwJjbRLig0y2SCTHP4wviElOQLFxlmbi+MhlAU9g?=
 =?us-ascii?Q?UlgEJ9SzvQB+3f0eVP7q/yjVb+WiLfAxjGIODuSgy8LhnqmT9CCXENvyXned?=
 =?us-ascii?Q?Aiec+2my608osN1Xataura6Iyb+56UBn1AMK9QkgKQbkya0arKR24z7hpASF?=
 =?us-ascii?Q?84FRemgFobwPi2qv2ZbLEAeIM7NB6K2QS4k06QeBMb1ciEXRtSkYnuArxvfJ?=
 =?us-ascii?Q?sYO/wFvVlc98p6iHAfMRzdBoX1nGYidtFDc03krs/pitpfIWISPbUt9KIHX+?=
 =?us-ascii?Q?1G7WASOYtRTw5cvNcuA2FtIUXjS2UVQ/Rg8PqSAnDBmBibJPzgUe/+4NF1Gj?=
 =?us-ascii?Q?C177Pb5L21vDNK7HLh40Kyyk1xpAfOhIyabuQHZeTgj1A7yl1LUseumeXawY?=
 =?us-ascii?Q?GFd7G+uJpA6MbVH1iceOHNJUc2tf8RoRz+KatdCtGLyzlZKnfsua351Zuv7E?=
 =?us-ascii?Q?KlVwNuuhQHXYC/UaK/faagGEpCFPdlAQaOztevaZEg6ZGKds93Cl/2VzHrjd?=
 =?us-ascii?Q?P7XjNAktSDZmwZ6EoIjlGpfVjnk9QHMtJF/PgT1X3WXjMjzrjJnyaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QYepZAR7diItoxRs6iq8Z4mO+aaLXOHEZshbm5NDaRJ4d06IYQljbSdL92Jq?=
 =?us-ascii?Q?CHOwxTqOjypDPOAWgHeOm0aiTLMoPCQlnlF9qQsJQaJ7yswvle4v4S0V9ju1?=
 =?us-ascii?Q?qvbtPcCuUintf02S725mAAFGA3vbsj8Q5oOZ5HeGs8wbqadkZt4FH+PdO+wo?=
 =?us-ascii?Q?LoUsybxzI+cK6Vj1k1LLSwmYCSMRJKB8lZrPXDv+DeRIIwpnwbX89A/2AtBo?=
 =?us-ascii?Q?MxvAbZVUYO8ntN0AF+cRLX26+VjX5VUcscj41zJl379h7VSlcDxNqc5NAj8+?=
 =?us-ascii?Q?iypxf0YjRxfthwgn2mf3NjkCEkMnwz6dWfKwTkW+FhvldNOfKvIWZSfpM1rm?=
 =?us-ascii?Q?bp3pqYAi0MbdQwdWRj+ry6dyN8rSpEdWd7+mK+aPLTWY66W3NSF8Jy2drdMM?=
 =?us-ascii?Q?LUe16/9V2ONOfHPqwJsvKUzeV3coAtSp1W2HlZXvARNh3Of/jgYlFKWYi7Na?=
 =?us-ascii?Q?GakwQye/Lq4GDrNx53KnCjGuY/dxhnW2DwBT0Qgc2jteJzVH2SsnWEPvvKgb?=
 =?us-ascii?Q?Oxay6mcNeS97TbxbV+K1i5tAY11yITysDShrCGBumQsjagRD3CBlcoXSZjVq?=
 =?us-ascii?Q?Yz+iUluRH7UONdIbPfMpLFl4cEQjXcjkFLkt1xnJhBkqzHvvhpjQ/p731xmp?=
 =?us-ascii?Q?pp5X2isDcnhEgBQ68/HXvdhA++6zJQ99JDRhdSZ/2j1QnPTaN/HD7VhZpICr?=
 =?us-ascii?Q?sDCptY6sKyeZ/p9vajCyQyeXVc41S16kZWfV82O8lTpEvtKC6hmViRnA0K73?=
 =?us-ascii?Q?PMCbAze56YWXMzwBfaUPSeyNNHQVf+ab6SUozd9ytduekNFCnZEmpwfzu3qD?=
 =?us-ascii?Q?KRaXNArF1mP/48Ez6f3gR37/vyv70C0kRaqIqIJJAUyr/9ApFUWzFoIgTISs?=
 =?us-ascii?Q?UFCb8A9KVLxVzLSEugacwAiM4uHvJpEXPmWRtnA8KTeUV3j1rvW6xExx3GI5?=
 =?us-ascii?Q?3VXhQqKfyLempDuYh2aAN2jxf2wjOv6+kWO68SGVgubRvgsZBEOeEQF/uiAO?=
 =?us-ascii?Q?aehzVirbi+qvVLb/HhTUNn2zeOfTYiQKMRtFDFC2Bb3vmxcpPJxGuuqDah1e?=
 =?us-ascii?Q?s7w52LYabUrS4huGHL9sXdlDOYVjxdZDNP3NUlnggdd85pdRRWVja9LEDVkB?=
 =?us-ascii?Q?CrwPH619RmGvDuB0De07NgiPj1Gg4oVZfQt3mo5L/BMHNU5Yn1QmTySh4C6G?=
 =?us-ascii?Q?28WPSmeOQSHM935N2/eYMtvF3fe5GiWqYRVb4GNeW0tONrfK9TBecQdzYi3J?=
 =?us-ascii?Q?H+cgj4hRpKpLZ1TdHZUwX01ScP+I4/o7rIUfzzVHuCQK7uaPKjso/4hadQcJ?=
 =?us-ascii?Q?0HzHjbuxUJvlWY6E/jWF43RTgLDLTVIbXosGZPx3aq/NJ1gSYwWFctqRENNx?=
 =?us-ascii?Q?SB5uRjSRgnYRS7n6Up7Awzep0q7gVsktO+/XWpYv+ZeRk3jP8NSI3RfcOFHm?=
 =?us-ascii?Q?Mmds2quE27mTn+aNYhuTQI0Zg+j5LjvDj7IvUCoXlw/7hXpNUDP5Z9DLwgN/?=
 =?us-ascii?Q?Rdfa2ZOZW/ezc2MVToQOTxbZoI7aDOi8BZTQ1D6ZRNqd6fMQKL2Gqd1QGBF7?=
 =?us-ascii?Q?drIgn7OPNM1PsWa9tFF52OFm8l3FO6+QSjZAmBvj7NyBqINgv6m2DhWepQEP?=
 =?us-ascii?Q?gaOe0o17v7gqnGp67q41h60=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcee0ef6-08d6-4148-0ec5-08dde468d79b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:21:50.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GASvftbpbYI7Jq/yumglwTbBK0Tiwqgzj6yvj2ZeAVLzB9OJ9B52aKnuA1OqvLav9h/XoxWBwAji4Ots51teaHQWoHhjGHXhVLcKQBPPbsYuh9iJztGQttpHSNQHnmVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17440


Hi Mark

ASoC has many functions/macro, but the naming rule is a little bit strange.
I'm now posting many patch-set to makes snd_soc_dapm_context local,
and all drivers will be replaced to new style.
I want to cleanup function/macro name too. These are just cleanup patches,
no feature changing.

kuninori Morimoto (4):
  ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_widget() to snd_soc_dapm_kcontrol_to_widget()
  ASoC: soc-dapm: rename snd_soc_dapm_kcontrol_dapm() to snd_soc_dapm_kcontrol_to_dapm()
  ASoC: soc-dapm: rename dapm_kcontrol_get_value() to snd_soc_dapm_kcontrol_get_value()
  ASoC: soc-dapm: rename snd_soc_kcontrol_component() to snd_soc_kcontrol_to_component()

 include/sound/soc-component.h | 14 --------------
 include/sound/soc-dapm.h      | 11 ++++++++---
 sound/soc/soc-dapm.c          | 33 ++++++++++++++++++++++-----------
 3 files changed, 30 insertions(+), 28 deletions(-)

-- 
2.43.0

