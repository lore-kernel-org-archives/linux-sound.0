Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA7021CC55
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851265; cv=fail; b=lf9IxtK/kz8wFYAW/cSfeQ93+b4ZNX7RDjx12lRBeIzjwhWe7vwCLU7abSZ8NDsxibH3Fs1xiteTyB3apIXYqLPs6jhpoODB9Gyw3HsEXnm7wwW9a25/tUydyCXQI6yvIyPZdbQ8EQO2zzjIeKbDYKxReKbguqPpa9MCCBintuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851265; c=relaxed/simple;
	bh=McgoBtORVnPpoieKBhguNpi9YAgjvAqQOz2fDhTuyhM=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=VrpZSrepYbSaWDHzzuuD9ahXBpS5h9qUCfHeDPywem8/7v+Klqs0BOFNteHAIppHAdP+KedW4pdQDk6mPWqiucZisNx8Y7X1SoiDcl0LgVE+dxfb5eSfMSQF2scybV1M5/gAdelF+xYqkHq7xBzb7fvwGYAYGDeb9mUwupcNmEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=J+oddegy; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="J+oddegy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNzijVqnfLRcaxRGRkFcDkkPA1RhYQqq7C9fUiz8TUnmGj73QEsyg2qv5Nsjjkb4IQUe02FQTXzswGPoDDOEfKYt/fBbhtdfgmIjBDy/mZ3OVg3/t/8L4Syv67QyhLOuYHWvoaNk9xKeUqMQj67fuB0vBTUofjzsaVOLy6zaq2lnUW8iZXZxdGbkpekpv/VvSOPk/5Hc8cfDl9C9vKthVzSGDV04ruyX+DIoX167wp3ezR2gOdANxEHgsd1+ySpArpmAXqd09zRmGQpQ7ab/tlv+4E6667rXstCwcvk67c2VQwscMatxK+1sxwJrJqPtU1eSm7n0vfCd2h1GCsqxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfdb+p63MM/tu1fYlL+R9BToonREtdUGAZQx+kgHNYU=;
 b=tqrnuKa5+s97HbvWI3JQMGkj/cld/KZDqzLHAg7NdJLYeN0g8ib/w4bOnT14fimiwUK4e8aToZ8+zwdJZvZW2rWRtU3DdiabCrlyIXCrZPL6I5WvXBGf3gS0kCapUqwdJ+tENuhOa+rGK0RrJuj3JohExpvcI7VXk1/sCLpm50NjhpLxAUsUbX6dzznC73TKzxCrEY1tKLMCMS1RJJTHLoYumZWPAHWPT8M1z9KOhMYISkgSm29Rd43Xl6YIHAhu5F0Ya6RVUCfNhNpRfyYsgHH9UwOyY4Y2OwCjkJJn7ncEPuHoTAmK6Z+oXK6fm+10A4pQaCQlrzyn92FPvly3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfdb+p63MM/tu1fYlL+R9BToonREtdUGAZQx+kgHNYU=;
 b=J+oddegy/fjyoC6+HxYF8fC4949xJvBfzP26qbNrxSTT060aTqBejbc1FzWJDCg7rX1qNVXHNCFqiDW3bAxSY8BDsHG3wvvCMJl3qrGEAHkFczXQLleIG87Mhd2LZ72l2jhmoZxtdsUF4lHvXqNQcMT/5BhJFoMMk8+nvpg/mr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12719.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:14:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:14:18 +0000
Message-ID: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/8] ASoC: capsuling struct snd_soc_dapm_context
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:14:18 +0000
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12719:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b38230-034a-4e8c-74ee-08de3c48d16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hAzc1AcP9GFZMYelClhiZ4IryBrt0muWbzI1srWppXACGlRvT30gUDhTR0Qe?=
 =?us-ascii?Q?Y8dJdZqQOpVddrIXFPpaRCfZyX9tzwnYaVBXv/1blufYyN5Wc0W2g6825m6G?=
 =?us-ascii?Q?a2EGY5C9/1iuLE8WS0jvVc3rT7uvaXFGKYn66EFfz1j6N49/H7KEA9FrO6Y0?=
 =?us-ascii?Q?aXcF7/Ap/6+KL8QbB4CkNn6uKwesYBZZcMqhFmaaFzDsQPCo+jAmYa42mDCA?=
 =?us-ascii?Q?AuDXouqg9f3vX6DOeUM8k6I4578zvrPMdCRWbVgk39ozhflSeOuYlMywtDdg?=
 =?us-ascii?Q?hpO873KwwmcOVrphLag8nciv5CZnkPviR/B/JcdSDe4nIIqghPegnhqkVcvI?=
 =?us-ascii?Q?Lr9yiLmJL/P4gAS6NYxCuHLvE7BWsd3V22UYmDKRMaVOfx59HXB+tMM1d4xo?=
 =?us-ascii?Q?43NgS+JUV43a0J705xxMxsNj8OzesBLGJe/7IIMBlqLgJg8sPdf2iopmCqFP?=
 =?us-ascii?Q?zSJSyhwVdAglNUa76DHKP/PXc6Tcea0EhA/4DfJPmYREfDN8RB1rvZqSkDVu?=
 =?us-ascii?Q?vwfWsnMbjBfyxDQYUP9IQ4BlWHZ21269BwVff+s2eF2YV0NyzmS/bR4/9UbF?=
 =?us-ascii?Q?etUHogHSX6NbzC7riPuBA/EC33WL4wNc1aocwo4JlNryIVghV8msgWXqOvpf?=
 =?us-ascii?Q?/0K9JvVZxu+s4hqXPQIIKVUuKE0XKvWP5h9f9x6rlyFH+GXp84rfUpR0QfmU?=
 =?us-ascii?Q?vsKKOsNRGVeoQs0CBlONTw02Oe6tQhGdYBeLaHVV6flhAHvLXDlyEJ1xqAPR?=
 =?us-ascii?Q?0yE+LKn0N/Vur1053/DCPR62hj0qW73HaagL3GBiDGnTnzGpDv6AD5SWnhSd?=
 =?us-ascii?Q?DAWVPhDhYJ0kj5Sm83QIqZpNQoL7VexUT/Iz8ooEeFdNR7tZRXRxvJwv7uxk?=
 =?us-ascii?Q?Ig1FBqeDKIaHFFnza8h3olUkWg8X04hua5hMZhAiOdzBE+PmYh6QjZzrdKE7?=
 =?us-ascii?Q?bCyvTyUWmTVUFQzv+7f4mpsAPx5g57OmWkQgkUWpZM7idc/KWakRFzXkVH5I?=
 =?us-ascii?Q?XQd1LtNQloZ+lOm/C77gLZkkHmdE277w+ZS8sdEMUrQ2M5ljflOmIQWxuZ7u?=
 =?us-ascii?Q?qyDeCxU73Rm80R+YEIRrwcKhPaSWnhk92es6YCStVMkyJNmvW1lr7c+Z/EWU?=
 =?us-ascii?Q?OoynY8xvfpw4LskYt4Xc/PA554yzsb7J4TnqBvy15VNCk9e4LN0dKKvMHeRH?=
 =?us-ascii?Q?XB5zh8zRQItc5sbZfF2WlEboRN20qg1cG0n8ntiSWYOYwI3ZAddtbSY7Lvvc?=
 =?us-ascii?Q?Pw1NNIYyuZgoBvfHVyWvgCORziZ4pW2MTIMy/V7IOXpLoFxOHupvDDvO5Fxx?=
 =?us-ascii?Q?JppT5Hr9YwLQUdEe+DbhOBjWt1O2wEG6eda/NEQ0gOh8UTxog0tpKXwBaGYw?=
 =?us-ascii?Q?GqAlF5m9iA2kDHV3wv1KrhXVR6EFtPmu/baAhJWbvQm9vO9xtEVZjG0PP+77?=
 =?us-ascii?Q?e5lqN43X+5fq+uUzC3kTCR8IHS4ln41uMM64ClKCh8eE94k4C30cln/lLplZ?=
 =?us-ascii?Q?xB4Tf3q5sWo21C0lUsrV3QkV0A/cEK324oON?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2uCMMvQcWf0if+3tzPIjUzpIXt07N7ulktWujj+kgYZa6oMkl3HfUdHFsSP3?=
 =?us-ascii?Q?4O4H8jxu/xXrn2AsZP15zjKydrlqhFDC20J266MVTTBTDwn9lh93ebzFnkM8?=
 =?us-ascii?Q?+sVBimKztmDllB0z1ZJdDOIijnImPv5TbMOn1dNbDLTLlBFL2TwuBquURgiy?=
 =?us-ascii?Q?EXHAFy9zvJLfNZljBD+A9JAKvPLbSmjB9bKvzrWmofj6RKQcb9vm7w1y9ZA+?=
 =?us-ascii?Q?JuKZPjmumNO9MUYX2N8w5eo7IxUuf29ssRL2L4eWSSHDxYptd8a9f5cxA8O/?=
 =?us-ascii?Q?La9f84Je5avPTEwZasXs5DpfByK6V0IpyAVev1nSu5O6dygaZSRFDOhdy+/s?=
 =?us-ascii?Q?SB0cn2uyoUGeSP9eN6NlzZ3UAJhusWd3T4ZCmQbyQK0JZEGVqPTS6cAoth34?=
 =?us-ascii?Q?EYvV5tCuNPTWi7ZQbJLZsIbAEGaH8Eg+m51w3fzSxnfMauapEiGfDqkTXlTc?=
 =?us-ascii?Q?ZPP2QEjEtI5Z8hgHsxBNNxh2WqhGjAo2DXfEWtAmEL/jSXE46F5lhdkbGxz7?=
 =?us-ascii?Q?99DBgLgiPd9lp5tNHJfCWTDj0BL3ncHG4kj1SHtkcy6YxX0mKdQ6eqQpan/L?=
 =?us-ascii?Q?xDqdk91aB5W5iyHMBl4dvV8egwPkiQBh30txj/Z/2ain/+Vss7CbBPdMQAAW?=
 =?us-ascii?Q?K44Z8tRkWCm44WZc6lYGo/t05Z+pzAYDzxXwaovEG/dYZqV/MRwJxw5NDQ1T?=
 =?us-ascii?Q?vRfzTnoUxpIlwPAwyUAUTiou3jHoPXZhn6qMZl0pz/nWAb6/bfd3mPxLpDoU?=
 =?us-ascii?Q?ILqjnOQxfNkN9NJYs0CaWXB/7YM1yLGoUrUC7uMdE9p/Oi7tzuJRCuSp6zrY?=
 =?us-ascii?Q?4/4lAIYQ6DcD6N1qzZikedWaHiNvhJArncJxnK8A1zfCnopDf2QFAA8r0aiq?=
 =?us-ascii?Q?E+13Lin0WPytRPGyVsq0GA0BrzaGH8CDTt3KtJD2j0gjFALutYdLSv1PP/ap?=
 =?us-ascii?Q?X4ycw9g6Rf6468KXJUeqgq7apnOY0wQYfZEBavhcr0FL1r7yePPIp2hotYFF?=
 =?us-ascii?Q?cGQEc9EgW6pQ/f0d2s/hMspMv+Hn709I2QDYR9ho7o1x6HfZswi1QnHDiie8?=
 =?us-ascii?Q?5LYxjbRBfY4qD7Hjgh7RoCBva0szg7lyJOkDcaxjLneTud60wGoYjvI0hWny?=
 =?us-ascii?Q?sy+ivKJ4ILqzQ1vhafpBRolzgZNp44JN2WBnSWOnQ7lpfBrx8pVnu2VLRR4r?=
 =?us-ascii?Q?ancQLrRv9gotdCzXuL4FYIijLpWWBAGXCYUBx5JmL+2Fib1J3PTwdiCq4A60?=
 =?us-ascii?Q?jgbUeKtFbBeZ3aWpahJtD+5gXmJonfOvW5YVfRsZ5jBwihY4taI8EhSDmGAM?=
 =?us-ascii?Q?AcRLxU033g/gezhvju2/HwkmaIwb8f4nnckaI1HsEvriZr4mAEJ5cuTb94b1?=
 =?us-ascii?Q?UYAU5eOP4tGDvT5TFWxV7Elq7Ixis2wsOG5YfbIsutMBoirTO4M2AlE470lf?=
 =?us-ascii?Q?OeDrXTmjZD0wTga+cFlCxWx/XiGAs6O96G8Eo45xeGATddSgFAtOF622KSgG?=
 =?us-ascii?Q?1eYyv6FdIeqzF5bsNOIpJi/RpU4DWAsf40/suRq/CFVYJHNpZ5OZg/a04CbT?=
 =?us-ascii?Q?Zfc04/mCeKvO5sqKWr5wfpo/uiqUgV/YYi7z0QjA+vh2LEX2FSYsLQ89HDBk?=
 =?us-ascii?Q?xZj2voBThE4DOSzXntVHFbw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b38230-034a-4e8c-74ee-08de3c48d16d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:14:18.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8c8JjJQQbWmzRa2xcDTdAlr5nUSQFMiD+Sa21Olk5rI/jOet0GHRXeCi0qZbTfYdlf/TN9XbMwESgMIcNQxEQxZQ6yz+fveibOvmFqrFT4rxzRZkv/aCASG40yU1vEq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12719


Hi Mark

Now, all DAPM users are using function to handling it.
We can capsuling it. This patchset moves struct snd_soc_dapm_context into
soc-dapm.c, and remove un-used functions.

Kuninori Morimoto (8):
  ASoC: mediatek: mt8189-nau8825: don't use card->damp directly
  ASoC: soc-component: remove snd_soc_component_xxx() wrapper
  ASoC: soc-component: remove compatibility definition for component
  ASoC: soc-dapm: remove compatibility definition for dapm
  ASoC: soc-dapm: remove dev from snd_soc_dapm_context()
  ASoC: soc-dapm: add snd_soc_dapm_alloc()
  ASoC: soc-dapm: move struct snd_soc_dapm_context
  ASoC: soc-dapm: tidyup function naming

 include/sound/soc-component.h              |  29 +-
 include/sound/soc-dapm.h                   |  44 +--
 include/sound/soc.h                        |   4 +-
 sound/soc/mediatek/mt8189/mt8189-nau8825.c |   6 +-
 sound/soc/soc-component.c                  |  82 -----
 sound/soc/soc-core.c                       |   8 +
 sound/soc/soc-dapm.c                       | 352 +++++++++++----------
 7 files changed, 204 insertions(+), 321 deletions(-)

-- 
2.43.0

