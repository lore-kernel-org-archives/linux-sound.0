Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5BB307AF2
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415774; cv=fail; b=Cv4TLPesNnF5h02djKT6PUQztLkqfzoJzBN94xKxKPluWJLeEspybNLjn2hT2fMa2BC98zZ5Glf5Kxe9j3JLDfzvAywxxS0cicW+1y9rSPjKJDJTf+Dj3FRgyK3GANcO7UE9Iv6n/IG7pB0HpP8Zjz6HTfbxegzH7MWEppcK5mY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415774; c=relaxed/simple;
	bh=YylMVIW5bm/mH62YqsIGVNzhAHazKjsak/jBaLYf/Nk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ShzTfyJVWm01htSAciSdd31S8dSzHMPDQd70dD+bm81N3f695Das0G2l5EC/+wVrq8l3XmmIaoNoVDSMoqLM76q7biQf+V5aiEakk210THRO2THeAlnTG4dsKYw6txTYaYSmEYGjAH+f7cwDqXjXnkE4DCcVmY4Wac604sxg2u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K86YCC+3; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K86YCC+3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq8nDG9BAoPuAYUXhNxIV4s2+FwypVJlK8idAJ3efZtflwYnF9DWONTHLlt5B5nH1ZimptYaKDEXu9eMphrT02ak7q0wmFbZ3cOtbHR7cxBPb8qHJx4MhoB8IhIFyv1PDkKnp8nXd9xAwWQN+Pkq5xf1EyoH46DZnwq66Z2wu0ox/b7+Aiso9omJIsR7QsmIVwM2dB6r+ijU5iD3b0hHmWwOHz4x1l9ay4+S/1A4hH972Yn507B5FyaWskCTH8VvTswg+7mVQF4x/5pGq5fu66EaXC1bpNHSv1TKw7NKaVHgvBKGypizmQOyXB8+W1jRAIoXuQJy/h9tgYG7jptEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3twfCij5K0DXuTDLoYU+gqcCIh5Ofin7nN2watesg48=;
 b=qzJVaLjW6wDncUbln8qAXai9zekTNpXhlD4wz/rIwunlNaEmGP9yx7/9lKSS1TPgp0AG5XejkQ6rx6iYnhIfqWB2/KLuRrgGvOLzY0xCVAU8rJA5fLoV44IYW1ItAns65l36SEAGsWpvpNVBqECMl0/htyiolzWfRDHRtrHkkzYGljbgikZMwBSwxpAg2fsDs0dSbIDM8uy34GVsZcq6ezdkeKaBX2m1jQQHFVetNfHPz92EpbBJDNB4ld3yiTuHJfd3rv9qmbqRna8Qt4PsqZrxuM/pw4yJBTGyht5ZaVNxdkZC5Fm6Jm1+vn9D9twujFhhgdO8vMa8bYn7NQKVPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3twfCij5K0DXuTDLoYU+gqcCIh5Ofin7nN2watesg48=;
 b=K86YCC+3GwBCiBMjmCLjAX5rOXo5e+ObSxagMq1wiaT00p3wOpQDc0dj7KNwUnezmyofkdE3JdKwiETBFCITg1G2k7BNxtmXNg7PTqv/fxZxwqHesT+tbm2eT4vArIC6hWOoxDWRhh3zaUsd3PXmlkbC/wS4+bGqyXQMQXE4rpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:22:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:22:47 +0000
Message-ID: <87qzv6qfhl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 053/139] ASoC: codecs: msm8916-wcd-digital: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:22:47 +0000
X-ClientProxiedBy: TY4P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a60e2c-20bb-4ac4-f344-08de0ad95454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6PcYf6Q7dPr4C6W4ck1Vw6jODXKj8Ael09/j3tmw7rRqWBfs+oG0tnP3EB+4?=
 =?us-ascii?Q?X0gPAOLtXWPCCXF67gfxGMbQsvtW1VP9y4+2y97j3fwEprZioh9aLKQzC4Gf?=
 =?us-ascii?Q?tLbKRh7N5B4hggfOl80dysEEEoO+zfX5muf+Ag1VCIkYhUcHiOLW6GjIh7Yw?=
 =?us-ascii?Q?9PLQ6l0fASF5AEsAehKLnCkNlrOov8XNkyAMRElELjw/Ek8Ac6khIw3yOCCJ?=
 =?us-ascii?Q?IyQp81AM2DkCQrpE0gusulGriCf8LUi92KqE4OuUymI6inVCrYagFLiHIOHc?=
 =?us-ascii?Q?9HmRMgq5GbbG0vcsj39mv1rSfuPIh3ly51hmHxYcjQfZKC+1c7qBMUhMATkA?=
 =?us-ascii?Q?xIE/yz8My895pf7JE1ErDUlVbWTcwdv3+3bXI+GUB9Q5MQxiPRoIqlg5zd+1?=
 =?us-ascii?Q?hyC0P+MP49TuJ1E/PNueTmfnqRSQKzOqhq2u4sFnjLm/2GkAOm1ah9A6BxaP?=
 =?us-ascii?Q?hIEyLnd0LFXQKyxOzw8By2wpm4ARTbkRIhUe6LMQlBvwFUxZueSnmzOubCM8?=
 =?us-ascii?Q?IJ6hQ1805Ee1GP7ymPSsXEm2Pykc0+X5fdcU4G3h1bfU/qYOJxQXVOif17f4?=
 =?us-ascii?Q?1R3jbNdPG3ZlJPOMWHLZO49itJgG+zYt1cYQ/aqd+CT7rCRZil8JouFF5Nhn?=
 =?us-ascii?Q?SQ4pcVSe6dqNK3GuucEpBMKhN+lX89cbbiMoDbF6RgiPP13k4RT82RUEd1Vc?=
 =?us-ascii?Q?RlSWKyMJSdYUIeFtoXN4AtQD9OcyxwCFotgFqDUY+G7P0uRWWn58OLcQBoJ3?=
 =?us-ascii?Q?xv2Mxpgvo9yQHs6QUiYCyck1rosHaHK+OOTxQL6q1wU+Hp8d52HnnabntQIR?=
 =?us-ascii?Q?VdAwFxgzuBlOKFHBtjt3o2HGS8aVTbOOsqdWus8iPoFZQDjZFi5PxRv+MdZh?=
 =?us-ascii?Q?5CvsHij72CudJM8fsT1D3F/MylXcJ3KQoOUceiOA3zLX0nbBiT42nmB96+Uy?=
 =?us-ascii?Q?PwAAOSwjOkHaazIVdHzeOEJSSHNytYbyRAjQTSgLWQRNmL3Ex/1hrW8+cfrv?=
 =?us-ascii?Q?HRX0ZFn8gqrm1pr2OlUiLPB55hir8UduVfGZgQX0N8FYDRRNMWOdzWen7zoF?=
 =?us-ascii?Q?D+O4cPMDTVl+nPAEZljzdj0kvL8cE3GESz7sOYDC7RElQkQa2a3NGqZHzRe4?=
 =?us-ascii?Q?j9doFpXvQxlA2d9cHEilAn5eZ60/NHkjjGsNg5YdXRR+Z7by4Of6NlFimt5/?=
 =?us-ascii?Q?3BSemV9Z3BQFF/tZ7mlrd4c505edZHLUMNCHX+kKHXd5vXyZoRMIkIpdogHz?=
 =?us-ascii?Q?2mQlvPflWLprbiTUFUdHiEjsbwJNnR2KL7ajeT4byZxWNZkvLguxOIy2KTVN?=
 =?us-ascii?Q?qafNpO4yOzSJwjsh+MDntl7HYOjqOz3zu6olrXPtjFRlP8ek+oA2MhyO81Ey?=
 =?us-ascii?Q?uE7piMOpneMwBDkbaiB3TGEHDgvvk9+T5AmH2p+ZMPkx8mRf2AHYwudzhXjb?=
 =?us-ascii?Q?MtVfbuBGKFc7J8etNrWqNi88/TvduqKmmVUORwvVDfgplRd2w1zKsE4bOG8t?=
 =?us-ascii?Q?h0qvfyTRbRQ/AF0z3LxI8ny4yIKhzHYU6MWE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iBre5l3cuc23XoEOHexpv85OZ1R4vshOuciX23mdqPfjufZtQHaDiMEPQv2K?=
 =?us-ascii?Q?0BcjaYSo60fWxQ/tflQhDStvUWISWSQ9XqJUt8nL8ndiu7RQZO6jnAdPTTe6?=
 =?us-ascii?Q?hBMK2TUtBJ8QsLUYW3E921vKg9a8Y/MLQAk4DieRvSWsgSqrEePipp9q5W2i?=
 =?us-ascii?Q?WIv09Sx81yIz7anNMereHFayQshxhEf4snGyDZXvnXroIVRkFvZmQkvqabiv?=
 =?us-ascii?Q?On85Ur60jC+O0kGiHzol/oJp89Fv9Q7BY+yfR46ARbjpA+Xih2hK+IVfV6Aq?=
 =?us-ascii?Q?xaahcA8wUt5JKYBOHdX84H6RQW03eAs/MrvYCAXF/XFglBuD+VvD65D8+eRn?=
 =?us-ascii?Q?olIOxUQJPfeC9low9Ej3Ylh5cfTL2BeWTx9yKPN636YnTBoQe1gekY5t8J76?=
 =?us-ascii?Q?a3ammFBWP/UUEw2HzhFJ1gXNn2cmzg0Li051fpS5JRs16eeeqpR/LVL75oFd?=
 =?us-ascii?Q?VBnYxHerw1h+6fFk0OrG6KogL1fCQB3WfpftHP1MaAf+yZZXO7bQ3ZWLXZ/t?=
 =?us-ascii?Q?JtsDmpM3GSIHz5zMYOrdWYp36689n5mSMIDwpm/lc/p6xUCT7Uuo4ftukC2O?=
 =?us-ascii?Q?bxt4zoVA+iUlPiFdPJDnyoL7vMtSbaoWBZ4MxkTirMlPtdP4FtA63DBKow8h?=
 =?us-ascii?Q?nwGO4dZGPC7Sajb6w1y2P7V3FQ6MOFiL42hZczaZOpXru2o+ctlnEjmAErGq?=
 =?us-ascii?Q?Pg76Bf01n9lMzK+mmsE6m5xB1OQ3e21Mcr7YU4VAzpCvRZC8UNp0TwgejOKz?=
 =?us-ascii?Q?6ChIAwurggx5xyLJNpqV3/WaEDUWbllHHYCqCGObjqEEv9vGv7WiKIECAnyr?=
 =?us-ascii?Q?yK7oGuhgctAwg9srO1NiAAQYD/daSodWX45tn8E036xGq5DTam7D6ogLxOaR?=
 =?us-ascii?Q?+a10skH1iyLfLE7HXlHnm6c8PzdIXeNv3fuxybQP8YEI/H1Spb3NC0FOqLzZ?=
 =?us-ascii?Q?S+5/Tos0ovIGsQK3iDCXJNzCNibB1mAYG/Ia3UobkfOEOW5V62sEil2/clyE?=
 =?us-ascii?Q?6WrVJ7HrXwkbipbk8qVFRtJ5YTob1VwCM1gtdTNZ2TJqJz4SiuGCWkRD7hfz?=
 =?us-ascii?Q?VUgqfQFvDGWzgoL0En0slp93u8DES4BQ10o4/wmSCZwGiIo3b38G4kh6VvnO?=
 =?us-ascii?Q?nt03UO7JD8EU/vJqJy6MCD936Z027L/WPhxwPyzFWxOG2mdc9gm+X+g6CXeP?=
 =?us-ascii?Q?vYfHYV8RrgOkzfFC22VMwTJMgfr3K1btphQKl5lOm2/Fd0W9nurU0P+BFxpz?=
 =?us-ascii?Q?S+tNwjjXSm39UsmUXNWwDION29Fjf0wECkmPc2NZ8jDtESLr0bIbz1m8NVbf?=
 =?us-ascii?Q?atlUbhZ6fPAOXxjBCKMFj5vYiArgY6TriARWHsVl+HR5oO2NmqfsX2+L8XjX?=
 =?us-ascii?Q?s6rM/UQuRyYIOmOB4JcZMNDnUNHqV6tfmn7IJAvIMBlifzO4ARqWYcAsoeFz?=
 =?us-ascii?Q?dumRcRnEngSGNxUAjO8yJD6YxYguZkYk32rRJdPkE9jGFuPCxoqUKIYK8AAt?=
 =?us-ascii?Q?uxkq12sVjIbwHtcAm/PxQP3dqFyOHaivcHQ48bgOMPdwjF0TUhqSo3GsNTXZ?=
 =?us-ascii?Q?P5jXDJkNZWpM1LAX0bBalvODQ8bYNujQgs9ox4M1DtrONn/944Z4DRSOvGur?=
 =?us-ascii?Q?ptqwfeDzsx1QFeIgih7Sc/s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a60e2c-20bb-4ac4-f344-08de0ad95454
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:22:47.3474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CM2bAXng27HEvypi4RIAqcKX/Nawt1rK1sDSE5OFPNSh0jU7VMh4pEnbaxAD3O+KL5Zu2AqLfIEZ5BwlwHLwfZ9Y6xJpBpmGQXV3YbG2RUP1xxlpsniU3+a/SPnASoS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index ebb6f2e848182..cfadea2aa1f7e 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -423,8 +423,7 @@ static int msm8x16_wcd_get_iir_band_audio_mixer(
 					struct snd_ctl_elem_value *ucontrol)
 {
 
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd_iir_filter_ctl *ctl =
 			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
@@ -469,8 +468,7 @@ static int msm8x16_wcd_put_iir_band_audio_mixer(
 					struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-			snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd_iir_filter_ctl *ctl =
 			(struct wcd_iir_filter_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
-- 
2.43.0

