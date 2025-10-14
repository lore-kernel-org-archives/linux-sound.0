Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154D63081CE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415646; cv=fail; b=UlWTCZx01s/UhuhTSdOWrD9HqWNRWW7TyWAaqCtO5XUguv97kY0ryRwOyAhxk7hNFSvoeBImLgK6nd6p/YtKDwl0yBSMzwZjSFLgTsrHLUn0YfHw5/KWKYCj35nP/OGLESf8S92VkU61iPrhImnFQow+Pv4bLNQTfH8JCKCfvJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415646; c=relaxed/simple;
	bh=uBeYdGiFJQSsmyXDN9MQpscjAAoJZGgl8EY6sziIyEE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iu1R3yvtAGsS3N7xYisnBhg7YAXQR5MVdsc9OajZlxC3lhN5B3bGXQxyEIvc5gPy4vulyRYKOKF3QCsQgyF8Jyh2c1hcBLr2EW5Fj9gQH7tGAd9yJasHOlfipLy5dj9nS8DkfhjxG3whu73KSrvdK8A7v/d1KUcewuFRBqG5v6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RIe+hG20; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RIe+hG20"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwCn74Qfu7xTqEDj5eDY7l2i+NMg0y/u+++i6D5t2v0pbq0l325iz2P/6WrkgcBzO9hhostKgRuNlD/6LTTvYVicJhUqS3qmE96QCuM0/1rd26mhIdJ/FD/SUu3VXjAHYsEXwVFwz/NqGo75xD3oqczBMEzcbCDZWdCg7eudTTPaak+CH54eyxE5mVroa3ALyx7a9QE91wcg0BBw3cVXd4UltIVRYOpHW91AB+naDbkZTWZT3Pm1sDtPCRzoCnGV3FszAMXTQitZsy6PPR458aeF5tJTY98qcCOluHlleb6g34EoqL1M4a2H0D/0ogGLTMGfNsLmMFO/6681JSRcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvPTywsdP8mygftMActUbIS8PkI2QsWZoKRfen1BwNQ=;
 b=gEV/WiDq96r14JMJtEHidh3N4sgGR+TE+XSY0NDo3UzNtv2PyHHT9wD1su0QM8heOSpY5OR9ztv9oI46HbzHaYe4hPUkCaGQCLuCoL1YbpdVd/JiJiDuBiUhSxgx0ugXhuuTP8YGraF6+ojPSBw+S5UBTrLijdxdp4VPh3sPSXT7DXz/Ut3DwOvcaa/3glEjxQTdf6WDXFiWT1GoW0XEhn1EF+1CPvitc8XxL8c5VDfc0AmTc9SQ8b+46I4XMeoR7WKndWgZTGRo8audIHWxPsTs9bliIN1/40KzyST1R0qhcbI1dGP2KJFUCN9zGnwdd5czmv0sQG+GACsAX5VNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvPTywsdP8mygftMActUbIS8PkI2QsWZoKRfen1BwNQ=;
 b=RIe+hG20MuKgJI2gqxE0TaqL2S872nZLe/fVhGYT/+dBbk8b/d/2bVIJxMMdV6K8pNcOLHjO4/wxf+5X5PYyy9Naw9sTDzDgg+PGuNfnOOtGUEgzopIVSPmqMDyVo2g38E3zUd6iIL30zjdl175+Y89T2pxK659BUrSTqxuSk78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13995.jpnprd01.prod.outlook.com
 (2603:1096:405:205::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:43 +0000
Message-ID: <87347mt8px.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 020/139] ASoC: codecs: cs4234: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:42 +0000
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13995:EE_
X-MS-Office365-Filtering-Correlation-Id: f2aa3685-02ba-45ad-6951-08de0ad90a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0/u5rWi1GqIK9qFMiXUJMj7rtgHIpMv8pZQ1/fE0FaxUPQhxtP2k+bISg4HR?=
 =?us-ascii?Q?NQGZcbRfYC+U4CAz7BSW921nbYzX7wVJWhlVreAl3ppjl9ugWqIzJR8mEXQL?=
 =?us-ascii?Q?x9zhd6hWbu5LKmo3j6x3HxRLvNV/4o6mpfLNU55gfux4U+btuD8DfWSa+aaw?=
 =?us-ascii?Q?OrWH/B1EEql92dCab5Lj0feMNyqwvY+ajQEiliprimohs8rXz4kBs5Xa49e3?=
 =?us-ascii?Q?3/lX1FwZu3qoTTgnKR6WnjtRojv+Tijoera0ZxMjMgtqNyEvfSivL+nK4wSL?=
 =?us-ascii?Q?oUfQt6GF0zvTruHNF7IsrC7zI0GAzJDwGkCHLneEAupe/Jr89xWq+PSdRM/Y?=
 =?us-ascii?Q?0Rv+Z/5B4BjAcp55sqX2aKiN0kKMoT8kCDf8YKnXRLYJkbjenrCSrWtJ8l6/?=
 =?us-ascii?Q?dnW8R7e6q7BahAeLNFqZd5WM0E2WZea+xmvybSF0/1yedtF6L5kIFeibjgTG?=
 =?us-ascii?Q?JZ+Op7TElkiuew4DbC+fSjeYdAlN94FCE55rj2F7m11RgzkRHy7olvCxTpt7?=
 =?us-ascii?Q?eeAy0xnY6LXkpYisTdE1m5uIi+xA2OT9U+Ulshq8IbiFsZscDBcT/mlqErPN?=
 =?us-ascii?Q?6lFRm0A4fQiF2m5fX8ZJJhnZykyb+Vuk37sP/fjIirD3YaG8NDTaNbhfkMKh?=
 =?us-ascii?Q?08Jc4BpGHu8IMLb+fWT7dkmMkR5vJMH94uErtnNAHSWsvsU8uh11TpJLRYpv?=
 =?us-ascii?Q?GFUPOi/muRTDCvku43sSq0R0P0U9G24HOWFOQh5ODdzwI4SJVT6bZBlralgu?=
 =?us-ascii?Q?ypKzt7HOMu8XXusCgcdW8d6Gk+p9smHcK1QcMUX5KoBHOjv+NWuT+JzIV0D1?=
 =?us-ascii?Q?Gdw4R1OCvbxzl0NfA4lRxtBg66UtVgQArmnKHynkbxmm/7NM7hx8Mlvq7AnD?=
 =?us-ascii?Q?l0fttubkPd8HZSnXhAyQQZGZ4iTBH8VNKtyYVkP2ycdEiDzO/pVMv9Md5roy?=
 =?us-ascii?Q?KbjM3nu4iF88jzJbO3xY9627bldiPxfv1/1Vx+T06uYeBf17ThvfSuc2NiDA?=
 =?us-ascii?Q?DhWAajoRzp7ydUX8vZ6iRnmXttnPX37qXy0rRP+Z8d71lPnieBisgD7bQ7YY?=
 =?us-ascii?Q?21foPtmeFzy+6xGiZhQ4gwQ98ECnyDI6Vb6Io7AfiAKfM05hO5WDmChKOV18?=
 =?us-ascii?Q?FdLuL/sADQriIhDGZQQUY9Ul9L3rTFe/lYWxFelNeWG2kBWuch7clJ3gRNQh?=
 =?us-ascii?Q?cfBNfMeCF/BrlfvihgIgmvPs/WZhzs/5llJDMdW1o8HXKgv6P/K8oKGKdLoD?=
 =?us-ascii?Q?AGi6PLSFYKuyn5GFI6oCuZx+5zbDSirvkC8mUOvmqaQhY89d7/M2IcnttTpx?=
 =?us-ascii?Q?T9cCXi594TAwNVnLNvck8ssA5t6cXnvwnVQYkd8IGsB64WMh6SPz/QZevTaN?=
 =?us-ascii?Q?EwycIPa0WmhE5PNJkZs5ugSl+9jT2F2O7IN/mmZgKpco7+A+F5fiehhckws9?=
 =?us-ascii?Q?UorqXPIIn0QYHvMjR0+XExjFfqS4c6LNyRTBQ/tbfWvTGekM2Uf5+VPOjjhX?=
 =?us-ascii?Q?pKjNqyS5vTC/W5+8qMgCwaPswR6IKqQ0zc/N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qor2AIk5LvpQLE6yFvwIi2naVCmWOH5yWtBe0VLQNU+7VHhY/lZMgZFCbBQL?=
 =?us-ascii?Q?KvtNYAWeYHjnKGh9hofXCmIeSZ1BSrigyDNQGcHSj8pHmmb/X3S7BblX760Q?=
 =?us-ascii?Q?KEtUcxEbD/JDiQrJ9mFmSDP/E13SyGoKTspbUJNBjej1eCdjjmnzrLlwp0rL?=
 =?us-ascii?Q?I9IIeS8vNDlnt+JdSilbgy9ImPreiXdCzrj0rGm92mjHv9oHZjvAqUlrZmeg?=
 =?us-ascii?Q?mBWxOCF0TQLF5b8GqHOWCaQgjVbEuWkbZxBAr2cg3r4MoVfFJGN7kfyYrk7e?=
 =?us-ascii?Q?nmOvXWv2bolsRi9mcy2PAHSwClQH52mwWDJBr8i3V0g5LGFkX9hnohA2tcZl?=
 =?us-ascii?Q?36lvpppy+mBvT8G10v7yNIioVFR8jvy9xsdsAqKOTD4uchvC7enyu5nHEXxG?=
 =?us-ascii?Q?72ScIcLyZxbtrwul2I/t6nsFvtnvfEQtacEr7wo06rdN+Mc9vC1U4BS2rPSM?=
 =?us-ascii?Q?aKTlKb28FwzogcJk8GVRfG9RZDkeMNc5jjnYeNRPn4Fd/8qWXoS+sIO0quwH?=
 =?us-ascii?Q?cAV65EECNgOJA4tEK72VlRqVsq3o1mLrf1Y1B/kWtpJG9S1AIOgRLxD2neMf?=
 =?us-ascii?Q?87Ml5+q/DKWNENFvh+etLuTSQoSUUYfYwuf5WuJlgxTbEN1dlp+mvPIdY3yj?=
 =?us-ascii?Q?xEfz7K8ORmD2Tht8isnh6QfkMNLpnC5NT+Msz1E+4Yvl08KO7gUgT7AkShVY?=
 =?us-ascii?Q?yypdVUh7La7Ej31qW8sMy8eqUvpny23Iwr8Sz5blIzxx8fLEc9YsXjKV+I2r?=
 =?us-ascii?Q?7ucIXycBhSwnl8fB07q8/Gmuqv1N2xI27nI2uD1Fv4b8bpGtRhABBnfPQxW+?=
 =?us-ascii?Q?F9E134CLU6D2GQJKxMDxVufpvOqj0EKTotyClGaboA28hiDqLsyUmNkAW24y?=
 =?us-ascii?Q?khmIrR/nk0bUenzlpLRwtjeYMztKu276pmuuYGglOz3hLj0T8gPOW2xqvhUG?=
 =?us-ascii?Q?FynqQg+CS+2pMgprL1f5WIL/57kwJIReSPySSJUbRMnh6KTuwyOAL+M89OW3?=
 =?us-ascii?Q?dOuJJEMXtea39FS96miAQG7wJ7UVxmOCYX0m1eQ/hQu7PwTj+5Ax/4ENhcCc?=
 =?us-ascii?Q?sZXDEo9s75mWyd38PcxNP0m3qOVkphsk+aiEcQZHBnzAVzkLGwa3xctXJQ4t?=
 =?us-ascii?Q?IOJEJFJg3PrW5lveg+wOtUj+/0OVjnE4mhUVdDMHNvSkEAoZs2OMIZ4wz8A+?=
 =?us-ascii?Q?XrtV7lpeyQfmpY9Go7eNbQ+4bWxGTeeIP2u97dPLJWNPS6+mD58RfiyuOX8G?=
 =?us-ascii?Q?/LqIsffshZUrMdZNLoYd4VxD6G03SCi6ot9h1yQp/dmTzIV4Gu8CBrTxFPkL?=
 =?us-ascii?Q?UjYzXVFknnziHxbZbkSL4Isb+YUKiSf0ktQvcZtSNe7hbideGMlP4zlDJtbc?=
 =?us-ascii?Q?A1yCgJKSjChG/IhBY6CLLqtJjVhIORb7IjCwhApRmHjkOc2/1A3A2mUMHoYB?=
 =?us-ascii?Q?Uxrkyhck1uvIw6dnJuIKrnQfs8Qfop5SsCx4CU2zyCssp1DJtfb/5Sxf33+z?=
 =?us-ascii?Q?wx4dUQ2PdwHbhZo1hPmeL+paOIfA+w2jbSl12L4dt8eqqBi1qSINc79ZdgPv?=
 =?us-ascii?Q?frUXsbPfxV+Z9RgkIDkjXSsCFfVS1Za4mtQoVp3FOWVxBSAvM490QEHpoNs0?=
 =?us-ascii?Q?ASe4UQrx92OkItsQXnKxK4U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2aa3685-02ba-45ad-6951-08de0ad90a42
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:43.0943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xK21ubHm2qUepDKdGJrRgLjPGV6yuD6YsELWdc19ePkZPth8/Z2SiurwvcmfscOk+bl4jMss5RhcvIwwrHITQinmsnFrwi3hTtQBJLhcTTISq5ucw1D4n3yIHKPCXpLn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13995

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
 sound/soc/codecs/cs4234.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index dda7f5b4f2fb8..fab4695644bce 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -85,7 +85,7 @@ static SOC_ENUM_SINGLE_DECL(cs4234_max_delay, CS4234_VOLUME_MODE,
 static int cs4234_dac14_grp_delay_put(struct snd_kcontrol *kctrl,
 				      struct snd_ctl_elem_value *uctrl)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kctrl);
+	struct snd_soc_component *component = snd_kcontrol_chip(kctrl);
 	struct cs4234 *cs4234 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	unsigned int val = 0;
-- 
2.43.0

