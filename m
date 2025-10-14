Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AF93090F7
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415705; cv=fail; b=aLeS5CQpMls6JyZowt+RIMJsnzPoM7wHKJKU4kW2ClGCcbid1wTKW5ODsn8rV/wGKTqhU7hbu8ji8LI/86GdU0yC2x7Nfb15lbG8qSAB5o9JLg7TdZtJ46lbSX+zVhxFLMTL3ylf7cfj/2bQVkrOD4nsRQNaNvo1OFpsoQgaxdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415705; c=relaxed/simple;
	bh=wekvyLMbe/TvIcaeBnS3ZBsLW9nHjU0D3nsBdiWOnNU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=graVM9UaL5RBCZkCN7Lz2Xa7o8g0UmwTzFWsZarsEOO6O3yDNp8XM+kurado9h5iArKJp3PfV3gtP/cEtY9i/OOfxKGOnUfct5V4ld9Q2RroaDkrKERQu1N4/L4zGf5zCY/2Tm/+8FAKMSKaD1VetDmBkBcn4pUc4m7ECQyJFpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E42I3rRy; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E42I3rRy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2gab4EoplFn+znkBsk/hjQIak1aPZFQO25RsB/s9T1HhJjhtNCqOTg9yvo7VuilTNBDK5ZfH3+4908GEmFtG0ILFxJIXIzgIxU9Xoq92w2rJbZQ5eR8UcgzQiMrFAI5AYg4biVQDg+lpqrkQgjW/0eXuXTXV8LpgFplaYvMP/9iJNZtcqVST/rSGcLi43do5NR3HaqruZqK0FoeqDSfXImkS8G27V0NHX4EFI/UA+4h2g3+TDvN/5jv7vPbVFsUFisMCeaW7Yvfx/TLa6jvBYjVtoEJZqLGqQ4ylUdhWPuALGUr9qQ7/6kmGjz3e05Fir/1xmjjPGA5p+B5QefeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FXVPJ91tuCzCPOgJ8Z8EjNEad6Bd0dxiVSQml9RiXg=;
 b=c44tt6K7pBLTSqVEGYDdXSZD2LGTtU2xZuSR0T5VqJVnwoQ715Z20ZYZeDI7eFvau3pNt9/JnhkOlXB6Gct5dA37ObI7DuYK/l5LFPOiYZrKvb9ZFRw5kEjbR28PsBEV28HQvesW4VNMc7LpfvDeXAkhW1qGTNhw4EY2P6XiKyVzJ4fc6trinMn5wI2LWpxIt4fRhm1BpRpHwyeAWFSLxiuL7SWdrN1BBNHPV0IdwJnuX7nClB6CotekKR1m92UbTSLGZN2WWX3VoIe3WPjDwKEEV534A0uID/3EBVoar0Fus3QvJ9uWOMUDqu9CEXUIG6LPhhTTJATXCOk4ndQhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FXVPJ91tuCzCPOgJ8Z8EjNEad6Bd0dxiVSQml9RiXg=;
 b=E42I3rRyIQiS6D0ZMIxAOtKWLINaCs7kTz885Q8FSeKVqE+HPtdYqKb+x2WiCnTQjZI5WyLDNPocfRNnnmRS8MkWCIfTHwuPV57Y0UjfL9QkGmTlkADGmEr/v6HD2r7aDIX90X6I11ydWeHLRXa+aVuuXBpzgM0jfHXihjLFn/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12366.jpnprd01.prod.outlook.com
 (2603:1096:405:100::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:21:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:21:41 +0000
Message-ID: <87frbmru3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 036/139] ASoC: codecs: da9055: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:21:41 +0000
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12366:EE_
X-MS-Office365-Filtering-Correlation-Id: 3555840f-f285-4d99-7b0a-08de0ad92d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ji5ZdIQ+K9Iszf84SknNXRxJa4MJktUcA/tknRh7KhsR64WTWY8sDgu61wF7?=
 =?us-ascii?Q?FfBvMwphwhfsZ6/JjuciN5HpWB5XQDiZZ2sThRphXp5xZj8axUYVk6DKiwR7?=
 =?us-ascii?Q?cScsgRZ0NNwHoKSIuTKLrt7UXDfSKc2HjJRbGB6jkB/47dtlggDpu778E3EX?=
 =?us-ascii?Q?3Jonte5fm5IuLNDdUb9D1lEw+XIj6CL7UgfaGih4+3m444K2RkYxj/hW0nsN?=
 =?us-ascii?Q?3M/caXCOo4UGSsa04SbNo5ux17ioDmlu0UURQwiQ+KlVOay6UOiYbnoxjKMV?=
 =?us-ascii?Q?vw0x1aRumsGh0emctTCirk4NUMosxWN+jNedYLWJtNQmZhnpkQIFaqjdXiwx?=
 =?us-ascii?Q?izZMFVPekViFkWaWrL7poHz62wcb1BvI39jQhEXg3mE7P/YBfmwq72QjqT+W?=
 =?us-ascii?Q?gH+sAuSFibxS9iVfMAL8uDRHHz8qsJf8koNqL0ut8kTIdByxf/bCUew8nUzB?=
 =?us-ascii?Q?y366aBLvUuw8uAxALIGRpERM17R+VW/DHmUZa2H80oh/NPrNyP2F4+hdm7n5?=
 =?us-ascii?Q?trUmQtsApYRCGNWdx8Jdn7MDa7xtoDMFeVePd9qL/O4dEMs5iAwbqCNYo2/G?=
 =?us-ascii?Q?9FtOQUC8sVxeg7nuVDxZf/+bG9dXb2QpgFOY5Dyux9kSJeBB0SNYJJjxZXxY?=
 =?us-ascii?Q?e30yrjTtf/fybhdDzCW+MRyI1xQct9Fqj8nGMYLEdMspM1R3z+7msDm08Xi5?=
 =?us-ascii?Q?OfvAepWc18TkU1B+eoP6Wgot/B8KJ13PGZeoLcMt8+oTKVfbZG9aixlcosK6?=
 =?us-ascii?Q?E/k2vBPLpFvCOsZNcx1//XOLWRBgoW/LG1khkqKHNmOvrIAMJz6veH4vcbkT?=
 =?us-ascii?Q?nYWR0KIMWozdRMWvEm25mbFK9VW5Xfy6ZSMs3O0FXfKAMO0xGX+ktO/9gLyV?=
 =?us-ascii?Q?VgAQz40b3baMvltkfCR2xwzKvqnQ28nWH4eU1Y+zAp0CAeuemv0LHXEuU9KB?=
 =?us-ascii?Q?Q9aMvqKq4WHO9/Dj+075ZVsFw6UBbro01HFN+PcfIhBwvi0cungPuFXnUoIi?=
 =?us-ascii?Q?s+iEh4MZXankezlQg+0avi1Casemt+Lmwfu3Z4vBRGmeS4jNdUbjqtvy29sR?=
 =?us-ascii?Q?Z2PWMWGcRyVwpzzt+30N9FxedkzYmiM1m6r0lNg0rqQQ7iuxEQs3YCj5dsmO?=
 =?us-ascii?Q?g+uoBUE7kJJpCYQslZfGvJKreB71s6yqGAMjRENV28XS+plo95mrD9cl1P7X?=
 =?us-ascii?Q?xJ4hObw9yhPnOZmKdg25xlLP7L//y6z8VovNMGoY8BuSbXggqaTz2GZzX1sg?=
 =?us-ascii?Q?Pypzxt02wN2QL1/yJdbta8KhPHCdvYm2gNLE/7lUliCmY+V3PMbFQhi4g/Tp?=
 =?us-ascii?Q?OG0ZiR48jFutuPtzdwJYPotsLX4s6F7gsIzRDh3ui4jt5TcTwyG8sceUNjca?=
 =?us-ascii?Q?cof0D3kgvATzL9sIkly02NGTBaT1tdpLu/Q53UF5TRD354qc3AXzQ/l6aseB?=
 =?us-ascii?Q?mi9FlGymoh6WzirBa7jcjIb5LShmktsQLEC2tRgJ7i7gLSWJeArZIbnRw36j?=
 =?us-ascii?Q?gFucuzikh5pToQlKNTkyQqymPo1kWxQUl4C8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aQDME5sU9PndR5n+DRgnFkcxs/auzfRY66kSY6ffn87FQ2DrvEXU69U9EVx5?=
 =?us-ascii?Q?Op0xDfsqAK8q8g1nIBUwmm/cvyYOCQbEhtd9B0/8kMuvHRi1HJVmi/SlqNuV?=
 =?us-ascii?Q?2jhgMkwdU/s4r6rbkzkadICN13RPcZsxCG0F3DxtTfXiDhgSdCYPcVRypNqG?=
 =?us-ascii?Q?Y3+8vBVIucfC1jOqxrvY5ljOzEf0Q4Q3/ExGBGj+7LDanL4U04NpYAIg6lGV?=
 =?us-ascii?Q?EnP9HOvAZoDvYqBOjfTi8R5r27Ci5qu++rmm64Hrg6bu8qLEybxcp7Ct/5w5?=
 =?us-ascii?Q?zG5t0TGb29vtccuYb4N/TCjWLTFU1IXw0w/e5TdJcJw+YJLelDR+Y+P9FDnI?=
 =?us-ascii?Q?A+0svOQHJdgjen6AnyBqjtYcHZwiQOlHsjOzR/93LNQ1Y8Gi0DWzFTQyWJsZ?=
 =?us-ascii?Q?z5W2hfPV/hrpEg2hxOzi8BD/iQcsqaIKNm9r9roXGjo+7q/37xwV+22rlUbb?=
 =?us-ascii?Q?1mzBlunLlGNKzm97s3mJlbGNZTrz6q6EUwcPyi571JXrtFY57UK0JEWKxI/G?=
 =?us-ascii?Q?QkZa/ht3heO20TsSla3GfIGc+HYfKRm8FXQnfa7jJNpTOQGcA+VpuCWwzkhz?=
 =?us-ascii?Q?l/uOMZUu30HUXRv1wfOGTGpB6LYxFf4ZYw6ZWFFlY07LHC1IT9isDlrSwC36?=
 =?us-ascii?Q?QfhxbvEJxX4GAAk+fGvTtAYKxZgtkSlb7oRdxyJd6xZm7pXZYfzb3uUAcmTc?=
 =?us-ascii?Q?lRrYQQ1XJ2jDKjWXsRkMLTFeOWuajskQ0SiAOObpb2jHjtbLjaFLcnBFhGr6?=
 =?us-ascii?Q?meS0WT4SYw8gRIXykq8kRmLngdhlH2eiDimfRZVkem/epfwx9TvEER5xLi4x?=
 =?us-ascii?Q?K/TSin/XF6o78nOhb630rG7aqRYjnkXhy2HcylneXmimJkig4ffMHGpiHtcL?=
 =?us-ascii?Q?asV0Ag5taKgDqWFjvzV6tSRMvI+224ZYLpaRMvomPGWVAvDEhgjaBv6SNYPf?=
 =?us-ascii?Q?14p1rJrjLr6MJ86uSeko1okRWYy8cY98VRhFuIuoXni4VWU+GcCN+fHQ/6b6?=
 =?us-ascii?Q?zOJ1Yz7SPM3DhYX87lor0rnOTlEa8OrmsYi4x3jQEqINvJRhNdRDvMlWui7o?=
 =?us-ascii?Q?RedMNS9PdFuTfhayIedjkav+bq/0ItWdZrqBFjWtJ7zmKgILhg1yvEI+tw0f?=
 =?us-ascii?Q?aYW/5OXsYEA1EAwTzUipcyec+tO3CvT+uhibrkGblr2fBO0ZnBuoIcyF7B6M?=
 =?us-ascii?Q?gCk1Iau7SnEsYt+dfzI2SJvH/vA9edXO5LYeB82I6bUnj00RXipuMQJtmNlC?=
 =?us-ascii?Q?oyKZ2hjt9xlmmjMnlGFoCroHE2kyVNAOggVPfpRI7jgryKYhmpXt634nZXBN?=
 =?us-ascii?Q?tw5iadnKkd+4NvaVY5xFq7DFoBLJSoU9OebJnp4fomlyP8SHo5ojD4NEJNs2?=
 =?us-ascii?Q?n4VhFrzgAS6P4zkRHfvDsfWF+lSJZXOwym5IHIZwC04fO55XgbxVxtRITHEv?=
 =?us-ascii?Q?/C5nVfW1yvHgblmHgTcvyVcy3CzsKZ5AhqwFCEK5o1jjzotNZqPSA+ddFAck?=
 =?us-ascii?Q?AVNEOybbFq8BV2W/7kZCO7yDTrNh4jOiZjo8r5CuYKyozuIqlPI8CE/CvTo/?=
 =?us-ascii?Q?8bpByiQDom/wqeFiRYBStRMRSI7/u7WH5knkqvbgtsLosb6iuTZizKlEM/69?=
 =?us-ascii?Q?0Tg8qRvW8hGoK5JRo+Ez3d8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3555840f-f285-4d99-7b0a-08de0ad92d2f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:21:41.6449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQrJcQ2esaQLnt8X9vXjWglXxqJ1U5BR+5v3u7IOxLRuRVoMDRfdWEXsydRhnRweg4calnAIZL2yN5Daa+Y8Q+zSYwlfLwLGEkKAkvPDkF6hC9MhnQycR8nLxygI6EAj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12366

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
 sound/soc/codecs/da9055.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index eb795abe9acdc..e64b510196143 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -476,7 +476,7 @@ static int da9055_get_alc_data(struct snd_soc_component *component, u8 reg_val)
 static int da9055_put_alc_sw(struct snd_kcontrol *kcontrol,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 reg_val, adc_left, adc_right, mic_left, mic_right;
 	int avg_left_data, avg_right_data, offset_l, offset_r;
 
-- 
2.43.0

