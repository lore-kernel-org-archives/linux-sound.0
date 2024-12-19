Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC999320F
	for <linux-sound@vger.kernel.org>; Thu, 19 Dec 2024 00:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734568474; cv=fail; b=C59GY8JGgPQUjkE3CODckJ2Px/rXXP6BUC5SPAVzFaAlC13hYJGistdXC5i+kQIPbiH9s8zJ9ejq84kDDWy8VbrGKObXVFNAV7PO9PmAkYbNPZhmZe4sJzoekTrS+Z1YtsKoSwV89/OcwxMtBKuOVdkw77bU49WczPHbUnoQjHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734568474; c=relaxed/simple;
	bh=cIwyEZq5S1Ni+Legu2InYkjdF9UrPWSCC+7SddVq4FM=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=sJxOO5GoFIYJc38xv2sbRWz7WP4Vtty0PDxYnqA+CCIOsabBvuQPOsHtHRwEelkqQU4ShCIWxDHq0rzBOVpDywiXKXVyf/4wA8guyl/dhP1RR2rFrjT0coz0ORye3kgRX3jVMn7ZJRMzUwJ4v6E8M8eEs2hV6GJP/KExDl+R4B8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Hcy2p46P; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Hcy2p46P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHKplTIN3SmjRZKI1TAy1JZfXQpL89mx9YRWVdPgwTFlUq4AKq4v6X0t04IxDL0P8zzGuhDB9MVCa4yKoU+zcDPReXdc4zhPi9boaD7GjWRBE4VogElWiavosnIH8QM+UHAmFcN8kh4e2qshN1mbb82MDJUWiOfM42PXXIoHMcTX2jINaN/iu1u9AkuOd9Sdc2KSAxmB6AysVBnpOseM0gEc2LzoXZpVSQQsqQY1ueReuNYCnjRUQEd3t8+T4QDixfyiaJfvntcBoZnrB1aRs1QaENqniyUjN2jTbTuKYDTXZICykjWxU5UMQZ6sugheISTpJqQKWFrUPbjWUDfjuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+bqZ5k0Xh32C5LusbFZoHVEf3BsN32ID6teukOXlfk=;
 b=MXSVwp3e5x1rMcBvjcme5u9r6jSzVqVzLIMzkCHdo7ryz+eaO5CkG+7eEpNfm9b9FD0M7nhJ3LuNWEOvlinTEuppwrK7RdzRbdjLS3CKWWc/ueYVLc6mbEUpi++fIObaYgErnu0Yf85MF+SfgKBocd5VAEMPX/9g3FqXPUdXw8OsO1vZKzEaktvqC6VGMQH2R3d8sTLYPVHj8HJ9ENAa/eAGa4lY+L/wONTMluXwrg0CF7Lwtpy7EAO0YpSy5OpO4QcmmWglABUe/Ho9PJ+FbDAgtf1w5+Of3VDs1A7vV20XbDZcTPRST0oLxwhfCu1kHyNq2h4hx5kF0CYSrw2XJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+bqZ5k0Xh32C5LusbFZoHVEf3BsN32ID6teukOXlfk=;
 b=Hcy2p46PwQYkhXknXrebavvVQALDsfZEZe1QapTffZsptRuJk1eKBY0wiwBWUQVpejpDKccAy7GMiG9PgVXHAXOM1sG2P3bvJperSLLbrCcwS1BebBCYmnUkjJRw/ifvXIUUAxGSkzHhwNC7hntM26TgqTkHyVgGgUmCF954gc4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB14144.jpnprd01.prod.outlook.com
 (2603:1096:405:221::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 00:34:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 00:34:28 +0000
Message-ID: <87r064cxym.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Stephen Gordon <gordoste@iinet.net.au>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/6] ASoC: extra format on each DAI
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 19 Dec 2024 00:34:27 +0000
X-ClientProxiedBy: TYWPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB14144:EE_
X-MS-Office365-Filtering-Correlation-Id: 32287fbc-eb78-4e88-5d03-08dd1fc4e55e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hGqYgnf/y//FGLjSBFV2oIew/cGqWfxl8syOXHkcFWkQ+U8CFmDtl4CABVMy?=
 =?us-ascii?Q?aCe39WMwhR8C//xLEJ5AkOKNFO1HvOCBFHrfizRweWHUcaVlZz1TB1AMRw7j?=
 =?us-ascii?Q?1VhlLKxZYUb5R4FJ3g2grc0jHwx62WuO5KrWaW6aEYZ05RMm0e52xQ1DOrui?=
 =?us-ascii?Q?4Nxnk3giNvXfhtoaxkOYzNANFITKV+Gc0sffHL9TLSehZuUiP7lBmrVbMnLD?=
 =?us-ascii?Q?BEcuKy1il79aLGjOpp9Dy9efOvBL6S8XpMqaVTbSa+D3Vz99WECk/ptJNt6M?=
 =?us-ascii?Q?TVnkgAi2yzzozTGclMVSJ8bybTshVW+bJgV/iXzmA9HwIH9Gr02srQEJmdFJ?=
 =?us-ascii?Q?2gtfr3TepS3FU+PhnxZYELeU/EEGiSaK8uXcHGYiVmVmN3Q28IT5gmcsTZeA?=
 =?us-ascii?Q?3I5c15X4M2+NyB1TN2tbHtXHU3e6SXPI/tOKav81YoK1noRXGic5fuiQq6gI?=
 =?us-ascii?Q?1I+iw3M3AjnLP+EmScgsXLC1JgaJ+gn7/XEk+pqW08MRfvvI36uyfr9fCwyT?=
 =?us-ascii?Q?Fc9sklGftrn3+H2rMiDTbWpXtowSM72YBL+uV7rFs39CP+SQsT+D8U4FH0dK?=
 =?us-ascii?Q?l0fZ2q0LkGkXVBcMxZqWYEL35BJlqKNnvN6XYie0bk5tXz2UugnFCR64jlVP?=
 =?us-ascii?Q?QP9oPoodgy10V4122NsldNqiuAGeyI01kPwnNSzfUeqTRTp6KRYj4vYj/wOe?=
 =?us-ascii?Q?u3tPqahlVRHz2lsFbSMB8ldB3ziGS6odzOF5HxJGzGuWh5nzh9AdaJP78LAd?=
 =?us-ascii?Q?FykKNeKGT4Mud+qCQEB1PFaFxAqnSnMSjM9NjznVN1qpxdBQnLFiON7xhfLM?=
 =?us-ascii?Q?ipg8pQTv4Lyzz6M/0Lr3ESscXIwJiJNisMMLCa/5Pl1msmtHq3PavzGi8lly?=
 =?us-ascii?Q?ZUhmbRomXtCDPiacIDS2vDNr5e6GNQhRlyc2d1y6FXge8b5LCZatVQY4DWUd?=
 =?us-ascii?Q?CRU0KntlOko3v78kf17fMQS4qD833geaOJMTm8a+G/JRRfeFworndOtRkFdS?=
 =?us-ascii?Q?j2H7JWuZ6L+0m2MySIqbsTlB/Gei3SIN7stBBbej1W7jd09QcDph6enT7FLH?=
 =?us-ascii?Q?GfnlMmTi3mMaJNw0bb5CyKZ/MWp9TPdjtgS6Jl5F8NFXM2INd/gp+g5buTNZ?=
 =?us-ascii?Q?2ovHqTW+Ntqqg+W7NF3iv98U8MBXMKShwEyrmSzDscnkRPhgdZNLIF28uwBi?=
 =?us-ascii?Q?dYMHgXba71CYdWrSld4tQTpI0CH81VYB3M7Peg089BOUoqkZWy7uLUKr6lid?=
 =?us-ascii?Q?jPzqvUPMc+LI4YhJgb35pTqE6bEVvaWxL0Pdac3vxydtR5Juq5dRhMi2/cBn?=
 =?us-ascii?Q?6PJXscLb3mTmAkzlboTaN0BsOvKZ2auFibDJ0tYJv2uA8D3dOximzTukiYfE?=
 =?us-ascii?Q?pucSXyKQpTWtzP32iJSqsDgy+RPoczdxG4JoCV6m7roj3/X9m19xZeYR0RrR?=
 =?us-ascii?Q?V+qeo2cDjx7UyqcMoDcnIkUy/qtBm73G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gaKlAmRY66SX+N/8h0iAXdu67hBrOdCUAQaq3wXNJ9N7DK6epJ9vdmHGuUSp?=
 =?us-ascii?Q?Z7KnjUxq62bitawqSkFPOiQ83BeqkkTvh0hU9yk5NBuHo0xE03eqlYXS5vbW?=
 =?us-ascii?Q?b5cJwkMfeL6VqWkvbn1w2QjrlpvhbKjU5a97cwHpBOiYGuvrHUmFWQcHvlEW?=
 =?us-ascii?Q?UFzCukQ7Pds+fjE0GgGYgU0mMbEPjyEgwf9qAZk4vRiSsvukzUCQ+P20aGzr?=
 =?us-ascii?Q?BW3chJoEbfRzPz60TQRfon86PGZRUXwE6LxaOCmuQwtETBgJfDTN7Ge1tVLH?=
 =?us-ascii?Q?09YmKaOR2gs+FgGYl1GOP3BHctukF1IAi3WnuefoOszwJ9VaURhFpOF/V+mw?=
 =?us-ascii?Q?1QLuH9wS+gg0ORC6uZ2VxpkjKG713IBp1TFPCA3sMhi3RhHumxE8rk1KgHfa?=
 =?us-ascii?Q?Kr0TbaTg2tg8w1H3yr/Ukit3HjjhS7hZbmjXYn1oX8Q82ve724kwvNA/DTsw?=
 =?us-ascii?Q?DNSNLo055MP/yijQ0hW1OpGXPOxK2zJ3+u9yHRIln/Q4EN5GE9Wvwp6i00OJ?=
 =?us-ascii?Q?eB/W4N2zuzodzlXes+U8A+3t6FOhMz3mKp+LgYwImIljYsfMkTvQiNu4Iaka?=
 =?us-ascii?Q?jSummPDA8rGhqP343Oe4Nic6uecMSuMPakYWvFqYaWbZp3vhDltA9IoJsY80?=
 =?us-ascii?Q?MYwUlD7tgTBzNp+EoYONVarJ50fUsBJngiie11SklIMRXeu6YgHO4M2s2Y/G?=
 =?us-ascii?Q?F5TAdhUDAKYwR4fRL+FQtq+nZUpTAkArah4djW8BTk0YlWL6H7D8NEaMipoM?=
 =?us-ascii?Q?heWeKoV77sCU7V/NKtNSY8nSLfpzMhzYgRtI7evT6Ce1FIdexbGflCj/r+Rv?=
 =?us-ascii?Q?XNnOA+6nUDwifFxwO9RwRBtXN67aReM+6I6KIpzlT6+jhK+GGjA/PnItwI6F?=
 =?us-ascii?Q?cdaomoxyVTzYeZK96ABWCAHEG0QalHCBgsrBBmoYba7qP9+xi+3T7A0nT7Jc?=
 =?us-ascii?Q?EnQ4P40jnTIvDDdMHbxuQXk/G7lRVYKOXJqcBlQF5ghMXSUn6OKTeXUzSL1M?=
 =?us-ascii?Q?gY25fGp92EnJD3kGdaYmPakLLSyRVmREDgGfy/2864ENElqq8QvV34jPMWDq?=
 =?us-ascii?Q?DFXgEq1j+OHcgQWX1PU59FLs3P2ZZDsgw99KzI4oQq7fn8yYfXP7Y+yZvuFS?=
 =?us-ascii?Q?IWbnUXCzS5LJLTzGlrNF61p4Sh2Voet0iTPU7a6HFWBYl8tAMzP1uSLRuYJ6?=
 =?us-ascii?Q?roqL+bZ8CO6Ds4VVoa25KX348g3ZaSdceF82pzxIQYa50B9A0K0IsHxQ7orn?=
 =?us-ascii?Q?TLb4nOM0/zsJZQ0TsMF3d/rTrdAGVv1neaYCB12kdaiE1eyX9rhV9FBpt3CR?=
 =?us-ascii?Q?D5QxQSeBxZq2dEPBdhYBSIRcFFYcH71D/2nlJ2cSCOslH/PAbGvD5+qbnnzs?=
 =?us-ascii?Q?ap4l/A7wZGzyHnltwLA6AiboMMZ1wsY9EI0Jxh2Eu+tgxij8utUtHBypzPLE?=
 =?us-ascii?Q?QjqXJ/Ns4cxI6h+/kVX8raFs3Sx1q6UAkHcw9VqsvodtqUVuKElp1uqCsCEX?=
 =?us-ascii?Q?8olCzl33EYHEhssU/a9UaqGhr+go4gZih5UJ/igilWCvUzp5njjaFOAZ93uA?=
 =?us-ascii?Q?uvFS1PyYbV+7fMJIl3D74xd9sS4JKaIjIrzWgzguipWpypXvUVzoapt45axC?=
 =?us-ascii?Q?1k8CGU6dIY3S3m7wSnFOfvQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32287fbc-eb78-4e88-5d03-08dd1fc4e55e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 00:34:27.9835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYD2P5f2/F4gnRTtUNO1xeEuvR7L7TiVBDfuMm+2HcKhkpY8hK0/d/h2AQqCWzmk/hjHnvb3S+jvqDm16OLkGtrqZ/YAUZW7my6V7g6oQ3HlmAcxa46JW7fTChCyfdi5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14144


Hi Mark
Cc Stephen

Current clock provider/consumer setting is set by dai_link->dai_fmt, and it
is Codec base on Sound Card driver (= SND_SOC_DAIFMT_CBx_CFx).

Current CPU/Codec drivers are already based on its own base
(= SND_SOC_DAIFMT_Bx_Fx). So, Codec clock setting uses dai_link->dai_fmt
as-is, and CPU side clock setting is created from Codec base setting by
flipping. Because of this, we can't set both CPU/Codec clock consumer for
example.

To solve this issue, this patch-set adds new ext_fmt on each DAI.
It can keep compatible with legacy style.

	1. SND_SOC_DAIFMT_FORMAT_MASK
	2. SND_SOC_DAIFMT_CLOCK
	3. SND_SOC_DAIFMT_INV
	4. SND_SOC_DAIFMT_CLOCK_PROVIDER

	dai_fmt : dai_link->dai_fmt = common settings
	ext_fmt : each DAI settings
    
Legacy
	dai_fmt  includes 1, 2, 3, 4
    
New style
	dai_fmt  includes 1, 2, 3
	ext_fmt  includes 4

Audio-Graph-Card2 will use this new style by this patch-set.
By this patch, Card2 default behavior (= no "clock-master / frame-master"
settings on DT) will be changed, but no drivers are using it.

In case of no DAI has "clock-master / frame-master" property on DT,
it will be...

Legacy
	CPU  : provider (because flipped from Codec)
	Codec: consumer

New style
	CPU  : consumer
	Codec: consumer

One note is that Simple-Card, Audio-Graph-Card don't implement
this new style to keep compatiblily.

[1/6] - [4/6] are just cleanup before new feature.

This patch-set needs Stephen's Tested-by

v1 -> v2
	- based on asoc/for-next to avoid conflict issue.
	- Needs Stephen's Tested-by

Link: https://lore.kernel.org/r/8734innkpy.wl-kuninori.morimoto.gx@renesas.com


Kuninori Morimoto (6):
  ASoC: audio-graph-card2: use __free(device_node) for device node
  ASoC: audio-graph-card: use __free(device_node) for device node
  ASoC: simple-card: use __free(device_node) for device node
  ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
  ASoC: soc-core: Enable to use extra format on each DAI
  ASoC: audio-graph-card2: Use extra format on each DAI

 include/sound/soc.h                   |  11 ++
 sound/soc/generic/audio-graph-card.c  |  48 ++---
 sound/soc/generic/audio-graph-card2.c | 248 ++++++++++----------------
 sound/soc/generic/simple-card.c       |  58 ++----
 sound/soc/soc-core.c                  |  30 +++-
 5 files changed, 167 insertions(+), 228 deletions(-)

-- 
2.43.0

