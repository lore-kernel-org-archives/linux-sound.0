Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2463EF658
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597629; cv=fail; b=Htvx4+1Uo+n3LI2FTjBtYIgkbkd04WDlpVULvofhXkx+jFDhmpfjq6PhQyH0FGYbMWN0Ej5PGehSo+X1M1UIA/5tiYyh3o4kBFBp2JrTBQu9+/MDIZuGsYr24ZbBliaX7SuLVXop1x/sBDPIvLmzdw9aFi/qptZN2em3MAuyTCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597629; c=relaxed/simple;
	bh=W7fBn22W22oYZtuZJtDByMd2gdsFsp9a6G3zPeeakKI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=V/MFbB8fhZDYgd6HKE9Lbl+TMQsi7dnxwEOAN9tGMtoJfLlF67SCOfXaOEf5lfZNK1Fow7gZCW5Wnty3jP2jLxvcEjg7pwBnZLXo4qLNlfFlOmAuUiK3WwV+SKQdMJo5MqV1mrzajTSCMny+70PHZmln6hLXpudSCe6bwngDDrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AiS1qjMp; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AiS1qjMp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhxU12TNEtAY5ireudPsY7Io5TFuMEJbBbkwkmJ0EjW/D+6hhFOcIJFuTd7TwPm5AY0eqCtWsfbY2UmG4VmEhpCJEpNyXaaWolOVMYCbgk4ucPWesGFsHDXYBJ45higTMomnyp6QhxgklpfNVACrk3Sz31x8KzDSib/1UbRzR8uIM7V+D/M5SB5a8U+X5RbnZzgX7UrH6nHXkoyIpR75IYlGVz21k5mQLBo9dqQ0wKnhmtm9fEw56tWt2pn/FHMKFAy5d5kL5HGUZUmIDRcNtL5adUxw33ShRPfjt2H7vg8SzQ2xDzbAD2LBv91rEZz/monxplWX4TteUXoKi6G1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpPtEzV/+Gi2X1I2Dza5JyygccYtN3fMA5kmXJlmGAo=;
 b=hZJD4uo6YuMJw5vT2sUV+917Qf4wk+dGZPpipHHSpM1+Q6Q58BuyBOGFCDNL6USxxyTs/943xgSZwGAPJX8Ah9JoVoA/hsXxjg3lqKuIdJOWO9WBq5dMOYwMvNrKnMHcNRXhHjjCfrwXwCY7yWfa/w3tN/aiVlnxlHLcKUedFiv8E3zAPirJV5NmVeuU/35BR/g3fFnnYLU0jWXVmmObJkur65tDH3BWdJPeM5pKlJw4BhEplzz0rvkobRRbIwJRrqQ+so1RttF+8+rQ8UwOJ3zHcmyRXzmSXeJDXBvaznOT7zAONWV8IGQR7WNJeT3hW6lMdD+/u5993oN1tsFRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpPtEzV/+Gi2X1I2Dza5JyygccYtN3fMA5kmXJlmGAo=;
 b=AiS1qjMpUH9wZyKZ8HdWE7v60bkxjyc0cFHEBVjvnW6UdqMzg+cCabvoOpbvmTkRwC0+bm3kPdBxHgzY4oW+CQf3Z+KvvYNILFNrr0Hgvc5lfhHTwxPC1tiO49iinqqzzgf+Bwfrd7eefkhIY9qe7vgdIRQ65KbC9wYDogHTJME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB7282.jpnprd01.prod.outlook.com (2603:1096:400:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:33:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:33:46 +0000
Message-ID: <87y0f5i0sl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] ASoC: mediatek: mt8196-nau8825: remove unnecessary declaration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:33:46 +0000
X-ClientProxiedBy: TYWPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7821f5-ee77-45b3-82fa-08dee6c81bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	JTeCHYG0l/Cx/JkcaSOfzuKYhmYM7Yhs4xWaqj8aYdu4egy9WeThG6pV5e+QO03GA5er7T/B3cZVbOtxXd0sBsQ64cqN0v1cURKVrKBAuOC4gTLPcASLILD6Jel1tES0Vl8Dk6YyelLBxUNCOP+t6tbQYWdeO+X11Q0EeYYUItrpIVjTKJkK0E5Mva0GPkPED9oDkjoqSOrok+oX1gRls5WOML8wX7rp8G2aDWgtCLVpQ3dRR99TqGR/z7KX25ukLK1x9Ni37K+HJgeWwEMajssxxAtM21ckD2M/zqbbHSRVHgO+bFG5LFgCG43OkmEmQ8BaeYmw9LQvr2b/652gUJR0C3HQxC3wjS+p4FuO5LTvH02EGfvf5rzMsD0O2U3bCo+JHWuo14iIpO4WE2SH9fpds67oQxfBzVbszc3GItJC1XC7uBxPj4Jvhxo911fi8E9Cza7KS5wc4SMwlwB9JVVQyBCdUeYAzXsABvpGy5lL4rRZoJzxdpUPo3Wdr0U1+3ODfhGy8bkuss06oMYJ011/vM5jc/sdWTXHXwFnwXdO5e5D7TwqG0I/VjG++Cj0GyIlCSjYqyQmDCdjR4E5oGi9ODRu1uZ/4DNVjmiBxHnH/JUg0qEZBWdW6D6uv5yHFeOKbO0ufhnpGQVMTN8mNpziSx8ax+ak5Aij9pdTICff054cjTbX7BmZMeJVMZXyaZkimT05wymXSROpdy7nEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mmay5e65YV/4FTLg9QhoKqMUyKGAOEEOfyO0Vu/BNR1VbcvpOX0omjbWR5WQ?=
 =?us-ascii?Q?vnDXtrzI+oEwKi8i7+v6UXiR0yt4ofQ1g+bXTrNPTcA7q3SbjjWxiekiDwqR?=
 =?us-ascii?Q?gpUNwK0yCPxVq/TGa7j750BoK2GK5hJpHF1jFjF1XsUqHwTJrGAhOWCLGwTR?=
 =?us-ascii?Q?d/od8REl10GB6pvKjyj4WNTokVKnvY0nA0zzG1E9nj/F+W91r7w1bCTxIrcd?=
 =?us-ascii?Q?zbERrakvcy65ifRnURekknbZx+by+9qtIQgusURU33uTIDEO1PhnKPUZ/HO6?=
 =?us-ascii?Q?oFhEXsLeKPYbSaqRjay0HQ9DWIpBy18nf8eEEbrmbnGT/tUGFKnEjocmST47?=
 =?us-ascii?Q?Y7S7iPJkcRPxinwzFjzXk873a1BK/30Z29ZC3JL/oDZzcJJiv/yNehf8E7nd?=
 =?us-ascii?Q?cwE4+iAt1ZAfxrzsAyuBfROD+exa2A1mSLRndNMTGAmUE/sFlG8IQQ18X2Q0?=
 =?us-ascii?Q?xwvbjE178nusxRM15pMqYeStBIX066a29EeEKHUgWu+eFcPbbnG4UFTc55dH?=
 =?us-ascii?Q?YFzcHm3HBLkO0k0/p1+dHrtJ1diRYQoLYgjzHYNeR1dy/y6xUCsET63Cwz60?=
 =?us-ascii?Q?65BEo1PNDn44dPK2C+tL5ze6bPvkc53ePy92Rrn3fcG/t/gZ4RbHuok3xhf7?=
 =?us-ascii?Q?Jg7LJAHqGZuXEr7Zly4WLXuZoRQZzOeO0apv5/mGv3IqJvvWCc3Eg+dPX4lw?=
 =?us-ascii?Q?DXebs3G84DfIDiIAj/KVVLayFS/4KipZdHVjY/ZNX7C1RjDYKrXtWn0ffQ7e?=
 =?us-ascii?Q?EoAlCV8//fyTyWVn+MGG2fxlGV2SNJ3EQVSwJUcDT7LSxVemqD1UuJeUSqHV?=
 =?us-ascii?Q?wa8XBBCZ1cvdVDu3ZAdmoVglEYBZuubtsLJuF6d3b4wMl40mpmbsf5yKf/sj?=
 =?us-ascii?Q?rMuPSWfsuGVZxKEG3DnVEvuoHhY9fAyNja4AIhF7iWHvs47QZ8AdORcoFUL4?=
 =?us-ascii?Q?a9n6lodGy4i44VVWxx5nelnCJZ8izVJKGFwVQA8xBCjnO8cCfuaBlImxervX?=
 =?us-ascii?Q?HBO583ypE9h18KIwd2J78Pwg12p0DyhVyKP9k4muwZdlA6lgxW1Cb0rzex1R?=
 =?us-ascii?Q?nm2gmdmw+ecEsuziNgUwFgAf2cvyCWWqQSTeJ01PW68NhaSG9pcPrP9ZplHn?=
 =?us-ascii?Q?O8v0gBgxMlx5r+JQ05I0Gx64dRrpPw0jibY0xSSDfkxzlasM7whhFh/iC6gx?=
 =?us-ascii?Q?PuNNvmmILkg0Fd+o2gn4i0E1XY98K23Z20j6DHBVLoPopoU0t0sUVpfhkG1/?=
 =?us-ascii?Q?PoGTnkY1eNGSqr3LTdS1fq/7Bq3SWCm42JgBibo1qbtsT7A10u1L5nxkrAiI?=
 =?us-ascii?Q?92SZfxlOeSIlBMzorkiQ1PAqFC1Uz/M/N3YczKzREX9Jnb9yH/v+sv/vB0/d?=
 =?us-ascii?Q?gsukn4ZlxVmqwnmgdYLYUKoMkxRhKDYCfNzyrnt9VdWAWMXkrGeBDwfh8WTQ?=
 =?us-ascii?Q?y6xFY+mnv3ZmWYvJR1jVu+uh/zTtELGBwAeCB3coNDi+a7mi16X0wXTCmQWg?=
 =?us-ascii?Q?Zr+M1IABY59mv7ZQsfOvShhh0/S1r9b3RuJEZhGmexfs64fJhMPjtIak4XCw?=
 =?us-ascii?Q?j8aSpE+c8JDSp2ux777NyUsEEYiHGgYu+6tJ8AZB66RYErN3jEFD87wCQ277?=
 =?us-ascii?Q?9bRxrnLKdqI0x2fIQzETz5Tg+WkjEoyrmIcnnDyffnJFWUgf7ruJxVrI+Av0?=
 =?us-ascii?Q?DecE3qiMni4RT4qfh2mleUVvejGPTb5gDmf4hNCHEDL57g3fZwSxGpv8lINO?=
 =?us-ascii?Q?ODGsmwX0OEqS9gSWvbg5I7FJDFdRKy1/LV76kPkIKhXCl8AngrxO?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7821f5-ee77-45b3-82fa-08dee6c81bac
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:33:46.6694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KzCDSOjFyholLiLbzZyRS34+1SIMEYdz48vPxhy/d4XLteJaXgHttva8H6RXDmr4Msn9UsGMlXIIKYdgCBO5zHPAwjcL89J8fCF/cd/rzreVqB/T6bJCfJ6KEQRJYpF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7282

No need to declarate mt8196_nau8825_soc_card. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8196/mt8196-nau8825.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-nau8825.c b/sound/soc/mediatek/mt8196/mt8196-nau8825.c
index c9424786c53df..8303ab960f80b 100644
--- a/sound/soc/mediatek/mt8196/mt8196-nau8825.c
+++ b/sound/soc/mediatek/mt8196/mt8196-nau8825.c
@@ -104,8 +104,6 @@ static const struct snd_kcontrol_new mt8196_nau8825_controls[] = {
 
 #define EXT_SPK_AMP_W_NAME "Ext_Speaker_Amp"
 
-static struct snd_soc_card mt8196_nau8825_soc_card;
-
 static const struct snd_soc_dapm_widget mt8196_nau8825_card_widgets[] = {
 	/* SOF Uplink */
 	SND_SOC_DAPM_MIXER("SOF_DMA_UL0", SND_SOC_NOPM, 0, 0, NULL, 0),
-- 
2.53.0

