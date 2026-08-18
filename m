Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5D54B049B
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787017594; cv=fail; b=LnsE/O7QSSINyWQzH0nZGN63IeaQau/NYFTowRiMI5q28YOCD1SDxMZQ7xZc1nfB8wE+B+n7TWJHVluanszb8DPs7yUkJnCnnk5Tin3mGQEISZt6FhPg30GPVLbnaVtrvTwekWIp+6+HkXuK2d50i1cKHRKWMpPM+Q3aIc1HfDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787017594; c=relaxed/simple;
	bh=8sOKyQQ35AvSviCOBwc/Vawl5I31xvRbuS6pEg4oPk0=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=Ypn+CTdnZ82klfuXfb7fROE2K6csGLdDuP3ssqyX7qHYcPAd4EexoERuhpBArlGrsW/aT3DEcAYxNktv4iCvE/ZHUL2kbAMGG66wvVpW5xDg/sCYaBcIfUN/Z5UV9yqzSXo1wtQXx9bKROLTMws0XDOzUwBt0Ifkiv2HUeikuiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h87F5xK4; arc=fail smtp.client-ip=52.101.228.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h87F5xK4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFFM/aAkZ0EMrjmtb16bQfikuRcAalDlaSc79N2mCTRYXIV6XIL5/3sxU5dKak6mpde7zqN99uUkAuVR972w9vaWgeXizJek10PMcae/CaM1wWa/xVE9sVeBkSmyqXJuujwAXW+KC9ovHumpqyJJT6q00WsoqxRpS9ytps7TOacHUcxNNmYftTwI0v8B8rNK47jlzCHin9Prky5UZeqo+AcUhafEfrshbcuBaN928lrNoSRzmR1gsszzU44bcPGO+BYHZVL4dQsfWDANaAjTqwSevp2Fclds9T9MZp7ddbOrFdyB8OAmlQcNPdkVaYr+XtkfW4RuPIOH08+CdgwSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d46GDxoSKE4O0BXSmocD5OR1KqPcYIB8QjZwG2H8uQM=;
 b=c14nMUYpkSMF8biCd+InchwVkfrm4aTv0/mmfZAY0py78cuT3I4ZWqhgYnV/la13dWOEuFgFNpdOE/FbNYcM5za7gpFQ7fsAAr/w6UN9UtQeJArZp7ERcWjLEqSGGwk0SH2hr1X2lR+hbVFlvXKv4RYpUmI9jLObndilsdZ+m5jfdz+rVyjd/jWUlzlgpM6ZC/9qqokM0ydwTHCo8Tn6na0axED0GI18DPFr0r6klkx8DaJsJwvlaADHH7JI686Tt2kRypC1pETQ2bpSrbfK2pC4U7cc4gFXREK4/EzzFQ1DGWqrQikxN6SwzllBzLT1zaNQt+anF1vrqLXyepUwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d46GDxoSKE4O0BXSmocD5OR1KqPcYIB8QjZwG2H8uQM=;
 b=h87F5xK4rfU9xvScB1BsqwVWLEjvG/JkHysP4SyU2FR4flCo65Gv5jwSzpwihc3LMW9bkpPXZFRBRv0c/qBTTlB85Rb7oVdPhdJ/QK0SWgThe05agB+5LnkL2I+I9xy6DV1/mZTQPRvWsbOYKgYTvOZiTpwK4FK6Z/3fqW0uyZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB17061.jpnprd01.prod.outlook.com (2603:1096:405:32f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 01:46:29 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 01:46:29 +0000
Message-ID: <87wltomc97.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: codec: max98926: fixup invert setup mask
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Aug 2026 01:46:29 +0000
X-ClientProxiedBy: TYCP301CA0082.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB17061:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fcc19fc-6e25-422f-6c34-08defcca85ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|23010399003|38350700014|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	MjdERL3Qh00enufaggByS8tQOpqOJeP6eg/JRctPGKcs6PKML/GL6x/BJRoBWBQAhsyA33T7XakPsWMGf3QDK0qOAc5xRjj/LaPAmzrQ2Q+nFpiBXjkzj8Cru59gMt+tG1brUwTlH2W44tROGv4zpk9QhSSq3Oa4tUGjMjzVdup4CeTwvbWtBTE3mcMSBMHcI6H5ULJwDCgMRXQOr+bN+iQOEKSFr20Mkebh5G4RJp2AefqWJQfMGpMBg5lPLyvGodvaIEqDUNylrHtzX/Ro4Lhm4WQDWnVChashrSySndfr+DiHPht7+rH7Ac91ryZ3UmKiPYh2SJSInqoD9IeQYVjdS8F0QfnQCWzTF9u67nnaoJT24N+GGNlTGrcOOgDcaV0g71nzmjG6pWZGH2zhirKAsOL2yMhMBejK6jmp8+zuURmJDvcQpzjRnGlUM3Q3YfY1Q8kQw4keiZd3gPFdttJtSACE2zOUhz02pOTPJgb44FuNBGv2toKYauG2MtaXtbuTONNmUmazxGQvvXj20Kjzsh/kJlKTDca0i4CIdH7T/6nm1U5nK/F5CB3isbXbK35+tuxj3lV9uxd53j1TcHa61SkOh4Kym2QlcQ6YNR+AjsOBiMG37Tx4bAxV/FbHefaD8lGQ/HyoyGlf31gvlqWuQt4r/IDrYSAbLEOmWRJITKyW4ueSmDddpAJpoUCZO4793Xhly4Oo3HiaodFLXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(23010399003)(38350700014)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tGMLWgAGk+KgiE0eo/Rv9ZSkSZTDFEghxy1aZen7rrD0Rx3h8ZbMZGpGVB7q?=
 =?us-ascii?Q?lUvG2DRYCwF1jV/X+sOsoYUceg+ga1bLn/c5OC3QOAEUpo+lLrDEaIrKrQ4l?=
 =?us-ascii?Q?zOXtMJ/2m8xowv4775bw+N3Os93UobPoV/NFVRjcwwSQLDqxNPFO06KoVZQC?=
 =?us-ascii?Q?p5ax1MlhBIzOOqk9uA01XPrGik2Zm+sHidUvwq36/wMTgurra1js/kYuCjT0?=
 =?us-ascii?Q?vhylUDLW9HFsURAU7ZMbAHdlEenNuMAzZMFtYpj4HYi4JN9Z016U5gHp72pq?=
 =?us-ascii?Q?AdI5fiIXpmqrthht3GFUWGkOvvCKBxUr1/UsnUrPfBYqQN6S4xjT9RCV5S02?=
 =?us-ascii?Q?kJ13sK3MOH3Knee7oVH3NXwW8ep3Ah6qoXE8EaC+ugVLhwhYhVQc8wfqixx4?=
 =?us-ascii?Q?Pd611MVzkIqR6GwKhXjP3VfElHH0yEVsKlz8psSvPrvRPn3jyKn3dvN/3Xze?=
 =?us-ascii?Q?2SLnWyKvLwHtiDYZbPGj4Md1jUkU6WV+tXSY1oZ3goqHh8koafvd7Jw8vv+g?=
 =?us-ascii?Q?m3HquTOutgxdaLvU8ljqX6iosTvf0PgKHAk+2Uln87C4r0k94ooCxh7xSB7L?=
 =?us-ascii?Q?zNXpx8hPGlY7Zaeqj3qxROTW6uZlWF4LGeTp1EYW/2MftevRGmNOwo3Pcquj?=
 =?us-ascii?Q?v7tqvcNiICxlt6ZXPpIRHuyPgXBAz+dQYsWqC5zIZsepjyGEdXyTS8H4IHu4?=
 =?us-ascii?Q?kfMY0tNUquGSiP8rh9nvmJsEYLELYRfIoDT+c+uL+QMkG3+7l6CkdQsTSrfL?=
 =?us-ascii?Q?9YV42VKSBtjtVvRfevZ+yn1IjwaOIR5Kxu9vXcg3d8LITuXUjWl+bfCSaKqy?=
 =?us-ascii?Q?zqf7kGuxi4uaNwrlafuASDJEnUnL0HzbpoduHvG5eB5r2RVPERu6EvdzC3qD?=
 =?us-ascii?Q?772X135wR9VfJLzGoQI5h6k3IGg579FgeDqCpK4n7/kWmqiqzG0dCG1XJNMm?=
 =?us-ascii?Q?1mSBl1yg8BIkAwAC3R8iZT0HbX7wk2RfNrDMgIdi1KWWVKdgWSkBS00iM11p?=
 =?us-ascii?Q?YrJDXTVGIOzXcNdjVBdW+q67xFbliQVW2O3iKF3ZnoZtuG/rOuRMDv+QJDS0?=
 =?us-ascii?Q?3Vqwu6pUFqyRYRE1/wTS+ZopEKDXNw9sX6LrvW9j2YiBuMBmj5CUX84c0auQ?=
 =?us-ascii?Q?KxEnTUCtOsazDOTXk4ixeC2Z8eIIh560hUxMAstZcP4rzOL9VhE/SeWx52wK?=
 =?us-ascii?Q?KwHE/TpoYW0a6jhNjlrjTBZFBuY5lO3c+AMUxgV2jXelu+cpW94TeyBqNX/Y?=
 =?us-ascii?Q?ajcPQanelaBIaIb0vRMAs7MYo3Hthb3LiX05J4iGTv5znhaStsGFQgZe7tBR?=
 =?us-ascii?Q?75EdrM3oazsSP1GnbRENZLWpfAbatibmRkHpypfSdW3HnX15y4BseVDeUsF4?=
 =?us-ascii?Q?knIDp3SI4a9kypCHM0t91ruJJoTQYu9JaN8DJnS/q4t+Z6dfqgfxe6pwHqPg?=
 =?us-ascii?Q?OU6XKb3852aU9yYgnZ/fGBFuYTz1zeHlwzgPTqzWtlqvuTwfeVgFLHocFWU8?=
 =?us-ascii?Q?HP9oSA78maWnCEL1NqpxMY0ByT9MQJagF91NDFbRUSQ6CBnO7SiP+UZzCfMS?=
 =?us-ascii?Q?JHz4VqHKnPRxrCZ4A/BjauI4GQbQbdU/Tv4nmhhpOBwnGyrVzBXYURqioKRg?=
 =?us-ascii?Q?wmobssxZYNC1NwD+VLRDIwqxnbXJmCTb0N8pllP4/ZgElI9iWRtoM+FiMz/4?=
 =?us-ascii?Q?AkRsRjUq57Hrjl+o5lxJ7odYII9EEKNL+JxYUwuP6OZJZCcLNsol7sLVpPay?=
 =?us-ascii?Q?C6WJqGgGe3Ui3MYOfcUVy1nRITzjWNM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcc19fc-6e25-422f-6c34-08defcca85ca
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 01:46:29.3587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wii1hH5SImN7ZGIBFkA973d48g7S8jJk2tnA+LbEZnr4T9tPontWMAzHwPLosrnDQZAORZGE0QwCyOxwfIp5M8HeaMWqMZ+0B2NqY5Cpigdt6i0Ldq8N05SfRk3WVVkW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17061

invert might have both WCI/BCI mask, but regmap_update_bits() masks
BCI only. It needs both mask. Fixup it.

	static int max98926_dai_set_fmt(...)
	{
		...
		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
		case SND_SOC_DAIFMT_NB_NF:
			break;
		case SND_SOC_DAIFMT_NB_IF:
=>			invert = MAX98926_DAI_WCI_MASK;
			break;   ^^^^^^^^^^^^^^^^^^^^^
		case SND_SOC_DAIFMT_IB_NF:
=>			invert = MAX98926_DAI_BCI_MASK;
			break;   ^^^^^^^^^^^^^^^^^^^^^
		case SND_SOC_DAIFMT_IB_IF:
=>			invert = MAX98926_DAI_BCI_MASK | MAX98926_DAI_WCI_MASK;
			break;   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		default:
			...
		}
		...
		regmap_update_bits(max98926->regmap, MAX98926_FORMAT,
				MAX98926_DAI_BCI_MASK, invert);
		...		^^^^^^^^^^^^^^^^^^^^^
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/max98926.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index d57620a3e958a..5b590a1f00de6 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -360,7 +360,7 @@ static int max98926_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	regmap_write(max98926->regmap,
 			MAX98926_FORMAT, MAX98926_DAI_DLY_MASK);
 	regmap_update_bits(max98926->regmap, MAX98926_FORMAT,
-			MAX98926_DAI_BCI_MASK, invert);
+			MAX98926_DAI_BCI_MASK | MAX98926_DAI_WCI_MASK, invert);
 	return 0;
 }
 
-- 
2.53.0

