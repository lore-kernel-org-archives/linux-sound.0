Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55318DB35
	for <linux-sound@vger.kernel.org>; Fri,  6 Jun 2025 01:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749175161; cv=fail; b=G8dqWBJ6AvFEY/i6e3TrT5ePB7tLmqBURI3cRnOYi8hhrLylAx7QsvoauSkr9/RJOVPLLQHsb21DpTxt0UPoX4eyjhKN5BkOTiseOSacq/X0hD3wvA/f6gMdCq8fO9KTgDyyY87rwgxAGFLRGJejOhNj5zOP4VGudFC/YWMrhE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749175161; c=relaxed/simple;
	bh=bRh/H2ga4RnQ1+46UEpsuiF2Z9gjeFSlCfWBqwvqHLo=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=k1LjHplI6TyHOCHqZAVBoHVp7x0d+jIfoIQ7Gyc9LnTJuElTTnYMtXqMoNcsR7mmCT60Gx9K5ANo08B7a895aS3/jjjAgywO7rdv1k+rjKtmyB2tzevZUYFxCw347gWWEiXvSPysook037rInGXWp8QpSx6N5Ely8S/UHAUQaqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Nk2FSLAJ; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Nk2FSLAJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHPhQcq4zdjMWpymIfT/GCI397CzY1xIAJQZRwzXub5L8E8sy8wbvks1WCHwsdohpbkl6crNWOuHKNNS5+XYkDAXrnHXXiEfQAuld+BtajZ+WsCWw3uCTVqUi69ocSURoTinTzRAbuzGcclBiidvq6fWgZL4ZVvIdFJGMUx7fljALPFrKK3Mb2i2M+zzPjpYYmniBul71+dkp1Lbi91AdMvpwSseH+jb0Gobh1s43/hFxEDuIUb2YOrbKIoLp3rmaIDr64d2Yq98kmhBymdhc3xDuOIqh0lL7g4UuJEqK6JxRjnXLyAuxP21PGSrU3rXyUZ2V4VMsoBPmi44rgSAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7dpHGDZfVSSj61kT9jN6BKIXJhNVJZ14I+FG+X9U/g=;
 b=BA/G8cK4zGNkBywbaqaUJ6sEHnEXWT6Vmz+Kg7XHHB344kV/Awk52zRpHIAycoYYMKiqBoTdfR4iI1UjjJAYZMknQ3mGTtikW9yAsn/uQp9zjR3F6JHdtYCimfdsVzusLG5w6WQZux28bDqzrsiQyu3Ak1m16InG7U/ShDnnJ4vu+l4cW6x9IY8KYQv3YEjVvIOKRqPg4X4N064NIQedeus5hiGO5HOaJBXxuJ/VyA98RZrtxpBmKhw0zCswZU3GJj45a7M/AelMab1URr7yGOIsso5H0k8nQX8oC6VGwt68vTiG3P/ysPA7pAmLidGuQVEuligKEwzXNIkzbLaxPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7dpHGDZfVSSj61kT9jN6BKIXJhNVJZ14I+FG+X9U/g=;
 b=Nk2FSLAJXJazRS2gOXhjP9mAtoLvsewZotBHejxEvnRHvfFpMVXCu8wCZIGhEFkmFw6+oVv5NDnOLzJJRb21goc1ylqnvMWtWKjamPlwdy+08d0FEKtv35mPCCzOpjs1RaBAke4KEfFIBLy/jqsZ1H9+Grm7vwpU13dmQD1EK1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14468.jpnprd01.prod.outlook.com
 (2603:1096:604:3a3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 01:59:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.021; Fri, 6 Jun 2025
 01:59:15 +0000
Message-ID: <8734cdfx59.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Giedrius =?ISO-8859-2?Q?Trainavi=E8iu?=
 =?ISO-8859-2?Q?s?= <giedrius@blokas.io>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2] ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Jun 2025 01:59:15 +0000
X-ClientProxiedBy: TY2PR0101CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14468:EE_
X-MS-Office365-Filtering-Correlation-Id: 41cf8b85-ce23-4148-4614-08dda49dbd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-2?Q?V9czPkbe3uC3QuooYkQVUyq+NRzLGz8sbLNycap2HQuqdGSVXGKGOYKNQH?=
 =?iso-8859-2?Q?B6ssLOD+Jx0Cv74VJ+RQEAHlS3ujTlePl7LjGwugYaTxrM1y+ykV9Jw4rf?=
 =?iso-8859-2?Q?IqCglCqlcZ1Pfsx1LBrGhQaIWj83EbiR4slJR2qGDaU6k9siJvexbZDs3s?=
 =?iso-8859-2?Q?WlKgDoThwo4PPx4UY41rHjBf93MqllH7tofDRua4aDdcl3hz+7U2FePrjM?=
 =?iso-8859-2?Q?ltRMdBwKKRKCHGAfWI3a72AO3p2052lntxSyhrjaaP2ALjXyeFYT9GA+wC?=
 =?iso-8859-2?Q?WzewRVxO9lWlCX61yKD1q5vacps8O20Yta9/ckONNbotrTwAR9NBxo/edr?=
 =?iso-8859-2?Q?4FYo2Lo2hC94ADjh/XQ/dYdhFLfSZGO9PWZ+5WmPwZAzxgV1QYxQP5AddE?=
 =?iso-8859-2?Q?J4WueU0nf/lL5z4gmmGwejkvepWWXN40Ag6ecPEekjZ3t9885Rj8XidgE9?=
 =?iso-8859-2?Q?/Mv/199CzvOuEt+EbxlTFUH20lfF+1NCeW28KJhMnUBGgiP6MrrWAVZexr?=
 =?iso-8859-2?Q?gLjDWtimjEMK5uTqcnYuqFBqQW6LZPCrh9stv4xhRtEe3eu1SqTlXLH4YY?=
 =?iso-8859-2?Q?M2EEhtKs4qMPaHXCSKZk1EOhjowlQnskMHQ2DGng0lmPCXVfKbR1Bs1J0c?=
 =?iso-8859-2?Q?hkcw5BEe/V36qYB3c2Rat8Q5jF8I75eic4KXBbR+MXMdOn4gUA+bcOrh9J?=
 =?iso-8859-2?Q?Q3XOUT81/GLJpKapniJ79qun7J8y7LyxO2nehyfOEKW2SUfhN4Rp93uq/E?=
 =?iso-8859-2?Q?Egsi6lkxKIPaoKxbI0B5YgMKHVmpmC+2jEMgaflwIayzj8DpyXWejCZ081?=
 =?iso-8859-2?Q?IxPLf8IJs162mRU1qEInipwbTUIkySQzGqEF/Mx/P547kYSttiwJpdkoJS?=
 =?iso-8859-2?Q?3Ip5Y6A+Ucm/SvuNdolS+bX8hIQQzm5zq2dZu7DOZpxkLT7gabixDdAuGn?=
 =?iso-8859-2?Q?rMhv9giYIS2e3GX3XI62FopI5vuHcCKWaSjmTxSGHmIqg5eRAOelhlWftl?=
 =?iso-8859-2?Q?lxa7sKz4+sOo2kU+ZzoHF01a3GREkkNsgkQhG0SQPjoCjCyx3vCqB4VtZN?=
 =?iso-8859-2?Q?RyAs9dI4WepCxwvng5CrmIjoMgk6KulySkBLa2p7+aiFc/DPoKHoaygRQS?=
 =?iso-8859-2?Q?NZ4SbIkI4kAfftNG/8uIlGc5XDsJzFg5gmaaK5HJGAx8+dsvnOVw0lT+a0?=
 =?iso-8859-2?Q?rQTdOQOh8c8rzG/o3VdnujLcbLq/HJEQPGdBIx7A2W8/smensXgoVCcbSu?=
 =?iso-8859-2?Q?UXWO59HMwVOHLscEiQgbjLlqbw8+vuHeZ8U+N5nUKsFEpPkJhYQsHpAfoO?=
 =?iso-8859-2?Q?Uiq1oKkd+OFEmwGYqdg55/FF9aVTs5wptKNwNAxeNZme+zHyNfczE0yLY/?=
 =?iso-8859-2?Q?+svj0UaN5ITTUzyJgwtvwgQmm35UX3ZncITkWSnHN+xIWQELqrMqyBnn/f?=
 =?iso-8859-2?Q?ANEEFVf3E5U5W0SNdFZkfPP5eRXniAkSstigqTYTYi9CA/4OoSd7aDcuDZ?=
 =?iso-8859-2?Q?4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?8JNphNTVm3C4U1OJGnLmLmyMEX84MXZUst1F7qjA+4uKlRnW0H5nTb8uHZ?=
 =?iso-8859-2?Q?HrQynv/yXfMC58skBS5icBvUgyGceAG5YMy2j4K6dasad9AiOieeg7XoOm?=
 =?iso-8859-2?Q?PinrA/nnCH/ZWKBviWhHDaO6JcnlRAqEuwndzwqgMI7qXy5hPfg9ycqyDS?=
 =?iso-8859-2?Q?G57pT6w4kt4UQ2Z4D3fZYU9SO7W5BHpo99rOWLzvaaRiOWjekMhQD5BrwM?=
 =?iso-8859-2?Q?36PyvUZgyA3NR43XZ8IzfYAFIvtio0CV8LnTAtdkUaBWc18gABs0R0NjAI?=
 =?iso-8859-2?Q?Flslkq3wYoGvgeKEV3BjZn+FZLzOK1yGVoZAb+5T2Q38VEKfygjgM6vHsk?=
 =?iso-8859-2?Q?ckpQoNchB4g+VC0vIrSBFgBqXveZ4TrEtsZIfHrc8FrZTcEcFGLHk4nvTj?=
 =?iso-8859-2?Q?ostXjhq8paTKNL4ZgpRLjfcFlKrD+3BBZrBhGvm96lPA/wp1difpAiZ3gP?=
 =?iso-8859-2?Q?T+X548uiJ6P3/fT8xfVbeD4JGaK8X0uXUaI/gOttthvPg8oC37UThVbacC?=
 =?iso-8859-2?Q?V0rYGtDRW67vUWGuA/QxoB7E+tA0kkJeVXpVMfmxudx5/0a1pBPQYwXcJp?=
 =?iso-8859-2?Q?bsoGxfgFV2e4oEBy6dIYQXB5eBh8P8cJgf1bTSFtJS+K9eGwJAzQ5YjY6k?=
 =?iso-8859-2?Q?oEV5uHKTEPvNnlIv8IcdNnVij5C8PCZZY1KLcvLJvMdpmwi6qFYImR2jtL?=
 =?iso-8859-2?Q?OJsSJPcZaZx/tVZwZxXZgCuJ7SVNUweiQCQ6iYI/nmrEcOFL0CT7yLhqLQ?=
 =?iso-8859-2?Q?pjCfhycBKt5xmxCNycN+8aEXScsgFGF1/v7FoH8yfsp612KfVOooi4cVxj?=
 =?iso-8859-2?Q?0GbFnBHwXs1ePPQzGI+jwZglx5E1g8Rxb4wDEILv63zEwnCsskPgc45gs/?=
 =?iso-8859-2?Q?5p1U7PM+amezN5qc+/eeeo5mrKeWPlrN7TPajal93lioW5W/NrzYqOt8hn?=
 =?iso-8859-2?Q?N911nTkbSIC0iwAAV5gaf8tj2XcG3CtH+1kU8cJK+4F85xRkjoT1Xlqi6M?=
 =?iso-8859-2?Q?lsabRIgpvP51Y/2+DMN5sfSGwLiKrU09RaAoyYnMeMQYcwiWxbY3lhBmHg?=
 =?iso-8859-2?Q?YDIy+PhkMTd1aD3m4f7q/cC58dVLPuzhgZRwVlG6Uk2qNMqhV3DeaYAwQ9?=
 =?iso-8859-2?Q?E4cxsKYaqtSr1nS63GjkA5ARfkS9G9G4cmW6EegTROXmtmie4i0Py3pbrT?=
 =?iso-8859-2?Q?hVnl/vltaZcqDt3lpF5o4I/cuRnR87NBqUqrwUtXa2O57fNUbCUdUnPZZd?=
 =?iso-8859-2?Q?OzDdiG/XreqtAvUZBigfJxOj1kSU+MFSE7suLDANNuokh2kO1EqrRmwizF?=
 =?iso-8859-2?Q?uw9ZUMKp1u5dkpy3ddyj9Gzfw/cIsa7yc9jmg27ABXGrZwLLwPjWtoxmL4?=
 =?iso-8859-2?Q?+iU7mRBjP6Z6P3+xyIw996oA+9dRzc2u0MFB9cwrhxMCikvyEo6mPlVe7B?=
 =?iso-8859-2?Q?MYeaswWufiQ489xWP2uQ5kCBqmcKzGAZg+w70hAYFyAz0ZgOKOS0R/1TuS?=
 =?iso-8859-2?Q?HgBrwQ3uRxGFhpfYxeEVRqw7OzhJcaTht8kd1x6F9IXzneJMNuiBG/WUDi?=
 =?iso-8859-2?Q?8nNIcE4HXM94hxpYfY7zS6U29T+cChM4OsAMaMtXX9aM4WAeDKq5B1DDfI?=
 =?iso-8859-2?Q?K2Zhk7fjPAIBmtumP2xlAt01vgy4CJxYWrBkl9K7RQPBRFR8VCLm1QzQ?=
 =?iso-8859-2?Q?=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cf8b85-ce23-4148-4614-08dda49dbd68
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 01:59:15.3091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXcYwXKoyCCx6KHCMsn9VhOvRuFbeghdAMgs0iB4iRDczU5GHrJeiBqd3bA5jzalcWIoRfDuThIoxCBmbmgBmU/AEKyKKQiOW2nTWxMP96lH5spwLns628yofNRJM0gh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14468

commit 7f1186a8d738661 ("ASoC: soc-dai: check return value at
snd_soc_dai_set_tdm_slot()") checks return value of
xlate_tdm_slot_mask() (A1)(A2).

	/*
	 * ...
(Y)	 * TDM mode can be disabled by passing 0 for @slots. In this case @tx_m=
ask,
	 * @rx_mask and @slot_width will be ignored.
	 * ...
	 */
	int snd_soc_dai_set_tdm_slot(...)
	{
		...
		if (...)
(A1)			ret =3D dai->driver->ops->xlate_tdm_slot_mask(...);
		else
(A2)			ret =3D snd_soc_xlate_tdm_slot_mask(...);
		if (ret)
			goto err;
		...
	}

snd_soc_xlate_tdm_slot_mask() (A2) will return -EINVAL if slots was 0 (X),
but snd_soc_dai_set_tdm_slot() allow to use it (Y).

(A)	static int snd_soc_xlate_tdm_slot_mask(...)
	{
		...
		if (!slots)
(X)			return -EINVAL;
		...
	}

Call xlate_tdm_slot_mask() only if slots was non zero.

Reported-by: Giedrius Trainavi=E8ius <giedrius@blokas.io>
Closes: https://lore.kernel.org/r/CAMONXLtSL7iKyvH6w=3DCzPTxQdBECf++hn8RKL6=
Y4=3DM_ou2YHow@mail.gmail.com
Fixes: 7f1186a8d738661 ("ASoC: soc-dai: check return value at snd_soc_dai_s=
et_tdm_slot()")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- use if (slots) instead of fixing snd_soc_xlate_tdm_slot_mask()

 sound/soc/soc-dai.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a210089747d0..32f46a38682b 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -259,13 +259,15 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 		&rx_mask,
 	};
=20
-	if (dai->driver->ops &&
-	    dai->driver->ops->xlate_tdm_slot_mask)
-		ret =3D dai->driver->ops->xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask)=
;
-	else
-		ret =3D snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
-	if (ret)
-		goto err;
+	if (slots) {
+		if (dai->driver->ops &&
+		    dai->driver->ops->xlate_tdm_slot_mask)
+			ret =3D dai->driver->ops->xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask=
);
+		else
+			ret =3D snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
+		if (ret)
+			goto err;
+	}
=20
 	for_each_pcm_streams(stream)
 		snd_soc_dai_tdm_mask_set(dai, stream, *tdm_mask[stream]);
--=20
2.43.0

