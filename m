Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B95309F18
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415887; cv=fail; b=IxbO+VfuzdowEN6DZ/uMlHuhFEEulJrMNlAmu7pAwBumw4Sl1K9YGKucNnSBOLFlU2bJVseLZzQWgNag9mLGQs1OicHgEEjQtyrMZw4aZfRmWQpOH6ACiJ9wtgpl9eCQFs32UnPhPlimRANTbEDgxphgDrynNP1/lzXbzPECTFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415887; c=relaxed/simple;
	bh=F75cR/igPdJkG1Lp5jCFFq5FZjPTgQo+alYggE/eaDg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PqnvgOysDp+Gc0GSqoauuQIkQD+fJlY11CJGxgg1MRGhFTemjavW7q7YpnsD2gqNh87DhyKuw3PBilGvTdqCcxHJNivsKbGS195/nSr+PCPK9Npd7BKTCS8ubIdEaQhWLIw1O1n3xDZ5DGfs2edqDa51eHXY+OFWDZ8lgCBO3r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PAhOM3AI; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PAhOM3AI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jseop3fxqT8Rukr51HGO6giChggm/mUvB6pkpOGAeUHDegDVpb0op/4ztrsFmA7bO4CNXOmEv7hSGbMFM9hi5KKB+siIGnhVB5MX0630vBVQowIWxrkbktoAvVhG3shKgJffGw/PuMaF11vImeikhaGr2otKd06NP8qNkInxYOxBhDFR8fYdN5hcRS/S62UxTFAOhq8pGgj83+udZH8qWd7Xy7Ietc/7oA+e5O3j9diWiljRFxuhuGgbBO+13ValDj0xUlhzaVk7I+NrNnBPBxzruNm5Nta9N7VfTib8XJn4BIGxLlj4DpEaUqSvc3MYcRxd+uHrDWVAasziCJ1cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDOxvymoepE8PhhJRhuO2C7zyF4j0z0CkcxWYZRCxCg=;
 b=GdEQAH8ntahYJecEEU8Ksh/RKV8SjmjQmCfwP2tAQp4ozp9cGpndUYtooQ+xfBU9+mXNX48TyI/Ji2orjoKKJGAGdMfoIhPep6IWCvbtP7JHSwteAvzq43Hx3woJtbytSwu7/16X/H1P/0bfNyWdiPJf+FKIgKLvcRzcQ30C8ll6wxXJDWPzSd0NMXH9jclBzlIDNhu1QSDS7s+xiDd98DyhQsVKCABUb0ttjoAdp7yGAqM3wO6tFG0eH7FzBBY5ZN4jZSS8lamHqOSXcQgRX3ivtr81wuHt5UyG+go5LfjEtHtuKttgveaoiOu/p3WFQxi+gfWXBmoA6aFa+TRSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDOxvymoepE8PhhJRhuO2C7zyF4j0z0CkcxWYZRCxCg=;
 b=PAhOM3AIjinlp7ae0qlKxwZIfVDVkRJjyNEzI81zIVKEw2Fqhnn5ETECUxL0xAke19EQi8iXlFy2hv+Vd1q+ys8LKuLCUn7hmHv/BgtoBw5JD9vZewaqq02Ub5MhzRx00h7+XrxzrnHP2Rq7HR2ujmsco4UG+p2OsZ6qnVGQo8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:43 +0000
Message-ID: <87ikgip0tw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 084/139] ASoC: codecs: tas5805m: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:43 +0000
X-ClientProxiedBy: TY4PR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fd8114-5e53-42a5-f7ea-08de0ad999d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lKpVJp6NiyRoquMo3MqZ4pnymOPYIfg97XKC+acdixhx4/zQlb9Lkl1OWz7n?=
 =?us-ascii?Q?kW+Ex+KEBwFOttKATDQerZqIPTpfPKU66oqxHg1fg9DzxeM3v7b5iqyQrUjY?=
 =?us-ascii?Q?gxSnV7Y8L6lGuqcWeV4xcWa0GEINEdfFgyscNi775ql0GjYCMOhkP9J9OfzF?=
 =?us-ascii?Q?4neI2Zeb5/r9tokdD0JKdwrv7cl4bmm6WV7JJa0VMboAxBBOl39FnhJPllYB?=
 =?us-ascii?Q?l3MyuxjE/l/Sm1PpBiB6zcEwtA3dczq3moh30hDS+T2LexDwvwsR7w1i3ezs?=
 =?us-ascii?Q?3+VgbBMS3WRe5m1H1haRbPVcnOkSV4vcg3ri0hIGre4HpIXNKTABLzuml5O/?=
 =?us-ascii?Q?m5kj2Tjgne5wU7Ja+N6Cxb4PGJAX8HnVJ0anV2lj6715ZbAkt1WfZ5+G0mQ3?=
 =?us-ascii?Q?dWeDCxfcmYKgYi7C72dOG1NN7hVGJkpefTanHvQD3Mu/4j95FloGmbE3N3HD?=
 =?us-ascii?Q?ZiTiVlDViEK0VrQD5jCCrKj89VsYGrRafm67KOyQxyEUbenWAUs84cDB/PV2?=
 =?us-ascii?Q?YlU2D9Ia5gYZ+yHncWxCz8IDzwo+UfDjBCMNzw8d56JwYXvOUf6kXSRDc5RF?=
 =?us-ascii?Q?G7aMdF5nr+Qo39JIY7po+PPPeT6CzkJzqBBfmhzXHIVwTuOPSPp9LvIFP2ij?=
 =?us-ascii?Q?djR+h5ufAi5aYIuixexfE3H1tBZvThlQqYST0P7uFXoMvKWEZIwZxCTm8IqJ?=
 =?us-ascii?Q?uW4mRH10Ct4YIZxTtyex4AvGD1+B8QaObYA53TEWz/ypvrpbaLBm3gOPiyuS?=
 =?us-ascii?Q?Z4UvV23v1tDBuVKxYdZhZCsvT+lSE2Ry6uIGDKcLDxeIDfC1ZzhPDZ+vmlQ/?=
 =?us-ascii?Q?JQSTfHILFfiXgrdTBhVbEB6hmlXU42aRIC9EZBu4RXABdku8jAjZJUboPiLD?=
 =?us-ascii?Q?pgEP4lvSiCU1bUVwhVdz4ncqYH7a8tbsmbnDvlYNwW3027esx2ntg3mJorPf?=
 =?us-ascii?Q?ioTMNoE3l9bchl4j8hnMwR7Iv0wp8LY6Jl3Nfec5/lSHad2XuF6RvaT5sMvQ?=
 =?us-ascii?Q?jcfqSDXqEPbcMT6jhTSnbNCo/re/MeEaMBzxow2sDyzaibRgYtB9rdpA4NMT?=
 =?us-ascii?Q?Vi4dCfUxqF67HUd+rDUqumu2Uwe224ehmztIwGvJc6H8qbQutuvv++7rvTph?=
 =?us-ascii?Q?jr2hM8BbD0bqx2sjt2P+ySNZIl4BetBjb7msULxfe+YDNZDQPrGwNWuLqC52?=
 =?us-ascii?Q?SLCU4to1hyvfisCmwJeZmTfax/+nezTv8epbvPb/j99Ptb4i+cUE0YZkrFjU?=
 =?us-ascii?Q?pmBBmRO6ZlCsO+imB3dygASWR9CQb1YFya5TiYIWhY6yILkAKWAM3H4HxRiv?=
 =?us-ascii?Q?dHEKeX9lCT43KTOoVSVJFnBRqSXJPDb10zS+6adGS4VQZQWBYayEQAjwJMTT?=
 =?us-ascii?Q?Yxe/b8Bk/0zafkMzbiaJzj9t0fX1UbeTlWnnUbEIIUWgLa+VzyUSLtw+15ZK?=
 =?us-ascii?Q?ZRgP9eA/Lf5bqvSDq+nQOeTiFBxsT6CC1G0/ptD0Kp5j0FN/gD1s5bpfLJBQ?=
 =?us-ascii?Q?PdH8AMD5gRFV3+TRpff4sHSNL7tWfmgusTvA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zTDHehvNC6kl0bP1MWAQPxF/i3ToFLqU0NIBBXyBrjZqT9PEfNblwYTIEuyw?=
 =?us-ascii?Q?ZM4gdoClOKvjkGt+otcZojPbbYcl+yz1PTf7mOsIfcEUJxl4n3RaXMmO5V3U?=
 =?us-ascii?Q?yEM6B+Hkl0wR7nQUgJU8UVNCQZtcbemCdUB2r2npNZzABfRZmPl8BxD6Ob5d?=
 =?us-ascii?Q?OUyDGdzbzpWfc+ZEU7b0+6kmVZfQOotWU18+rGqHmaTMqyA4JDGmfejAzVmp?=
 =?us-ascii?Q?VIAKuFSbCgDy9O8pJc+RVYpOMW4i46DOaX48obya1dqFI0HvGV2myoGhfQzZ?=
 =?us-ascii?Q?C5aDhi77Dbh0qBCOSsAMYF4N1ibcC3Z+L8JWbxm7/Qtbwra4Gxourt5LMFFA?=
 =?us-ascii?Q?yonLAYXgilS7LigWjLKdoSeS86LLRiqJHQHQ8uSAq1mmt7W0fHrbCS48mkO7?=
 =?us-ascii?Q?Ge4LBKFzwbsVKw5FVQWx3vRguLc2qauc1fzDtYGnRT3Lq8GOV6F+4vORf9ol?=
 =?us-ascii?Q?EBc28RmRCWA3/gbhEmtKO+laE0QHtfz1ITGMKO5yGhsMorGeS6nbfjcsLgVX?=
 =?us-ascii?Q?0QP5KER3R6Yjeu6bApTR7zlvLZQ1On5diarYI/8Le7h5nPTnT35BEjPD4j+w?=
 =?us-ascii?Q?7rEsCnKOKrEcYH1VZmci8rqd9chcrafYGLQNwnNc8W9BvXn7C3PcsrsBTgLX?=
 =?us-ascii?Q?uQBiYE4aVbtVr0KoG+66/yu+HDX56XWPwSVKA5+DzN3azuc1GEvXza4cV/D6?=
 =?us-ascii?Q?82Qw3HfGk9Ix1VBPIc93o8nDgumifDsr1CZtD/cp+fftQL3w2ORYaBvIUAMa?=
 =?us-ascii?Q?+PMxaD1tKvagYzmonE0RcCKTMXLsBV44JUhHHhwLD7kMWzczVPl4m0CKBgP5?=
 =?us-ascii?Q?6t6tFKuIqhNN36mj0jKGKweoE4yFAv99fFTzaAzXmT4pRgQ+QK2dBl+L0vHx?=
 =?us-ascii?Q?d+dhF2Bp40WWmA9CuFjw5kPKFmwNwq72OpCEHsrPzNwwetTZ7Nhed10Bw7Ak?=
 =?us-ascii?Q?BymMk7qUW5/EWGqitTQKmUMiaQX9a8KK3tJBOeUAFDSOvQdRnMqccGOpKjwY?=
 =?us-ascii?Q?kkO4NBRu5jyxRcKjPqb28RbvjNuP+hJ8KWibn/xclOsw15KTsDK5gWbTxo2B?=
 =?us-ascii?Q?rcVmQBfl6GAnAJpaWUhPgcC3sBSOsj8doS8ZnhoYxS/MNmL+M5fj1ZB2WW7y?=
 =?us-ascii?Q?2oKosjAOtKsaajzMq3E4xz8pqJ99KJSC8zYgEqiYz+P7SrwXRHP8Ym4tYH/S?=
 =?us-ascii?Q?r54YvtADRJabuZwpvuoSB+r7Noapvp5R0wIJiczxKmI4gyFAIYaEEMoaKsc5?=
 =?us-ascii?Q?FyBJUzsuzMTQkhAL/Whjd5Lo7dW9BV/A6rOz+1ru6z5XSR/jtVNIy/un6/iY?=
 =?us-ascii?Q?WT3kKApvMXMmQHhUGWlQkW7YIgzFkxqXgzssSRiiv+Vo39YIf3FGW5InCvvd?=
 =?us-ascii?Q?hW39g1FyI8q9eWkpc44FLAgPB4dTbnOAgGxiR2LEjmX4oPV2zU1RI0m8dwed?=
 =?us-ascii?Q?fiKdVaOzXL7hxaSLh4p3SspJxg+qKv75pC2Z6ZQaC6mtOP6QJ1vwk93pPdmz?=
 =?us-ascii?Q?pnjKKTjdje/KoqowGLuoaJHHbV9HQY2fZst8wdSJyqLLWRoZ5Mr/yJ7Qp4Cg?=
 =?us-ascii?Q?LgBCZNnhQTaEM97w8GcAbp7B9KarzmAe3FaSGz+1NgU4p9GOGSsPgY7L4WgJ?=
 =?us-ascii?Q?Y4I/KnbCSRWEzo/Sc/1mYCI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fd8114-5e53-42a5-f7ea-08de0ad999d2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:43.8825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAt66+Dfonn/plZi4NBit9y4QbZ/X9wVklY2ftKyZp6CIhsKUT5WUUh47m+tP7QoocRybXizqbA1pMGtIyAQD37TiKvY+5WtrMZtdOMpn6lDZoOJfuYfo18xib+0Yk2m
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
 sound/soc/codecs/tas5805m.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index 4c32500eef3ec..867046b7aaa0d 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -226,8 +226,7 @@ static int tas5805m_vol_info(struct snd_kcontrol *kcontrol,
 static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
@@ -247,8 +246,7 @@ static inline int volume_is_valid(int v)
 static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 	int ret = 0;
-- 
2.43.0

