Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF635CBCB
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 00:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680539; cv=fail; b=mihOnPQ7aWPjSWGSiZy3+KIPMRqxlOkKzG1hCyFGVQAr9ktLlDSJyfwoiKav5TH0hN0Ps2aezIREdnFbbzJU7lt7TPJC/M7eSKb451JI3zy4pWY/CQ52MnxGzmxfhLccnrieg4zKg3Vzp9zaYI3XCMD/eSG+jgGGGDcEf1VmSQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680539; c=relaxed/simple;
	bh=GcgW/xPA6EhFfaBLTZJgyvuZaDP6LBoJKvTgSFto6wE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HHYw9Voz+mgkNgOVGn77NmSPG2aN+gsfepo6my4coG7YS6IBF2uK4aQx6lNY/uPe41XcC2omXQXDz+ir/WQO6aTbBSDX1YDydsharRzQ7I/ifne9gRMnXC3tSleSZBQOzQsiImsYJ0jqZz0EyNRhrRJEGz4uMoj7rd36kPjdAGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cZeHc/5M; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cZeHc/5M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOHKyGGf5eR0yEa1Ktn4D98jvK82fPJfvCoZ+aEaW2v3t9D77S2kJL+s37k9AcfLD4SSdeL5CeuLs+IKSlYz1hXJs6WPuxG0vfuyMVqR+6u3Gj1RhEajdF+pB1ZRQCB3fmKMBvcvC0np4R9kJoTJ/Y4Au8RBo67QzNdnZp/6m0rkgJRK23AQ/zBqub1dUpqD+4k7cVTyrQc4fes7OeNXSWFBtbVqs9t8663HgBbssvvD/9EKdrui4Lw+rlj+79X9o8GB7WUtegnVyAnbP16ojfnDH00k0QJPdl/DdluWKlRxrbndOnoRULUi9Hw1rZtNdq/OevNw+awq1WYw36ej0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=morEBjjsUwE+XuV/NPiiprZJ8rs/uzyn9lklMnp2wCA=;
 b=dFwB95Jcc6fKL1zR9tyDYHOe8QPTbBuDNdrOi75n5YZDQcOwKkFjNRwQZGA84JEWJ84T02jNWRazTxgGKP8G5RxaTYfp5K+pbc7WtvwmQGoIprsyEgaOZnFMdDsncxiaAiI1+h4sz6x5JeEPGtftRErdsJyxUdCxeLB8U5/ao5rIGhiUJzep/zOJlSV7C5Vq1t48xHul+g4kizV6FdllC+Zi0+kWjGP5+OR+GEXdfU6Z9ITJ/JVWCI6Smi8ei1VAOA+enWxg/8k75deOCsiB16heWjEvg69krqwub3XXzvqS+iGx0X5HvKrgMPYJ0L6f/6ev/GMD/E2YAi1u36aJFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=morEBjjsUwE+XuV/NPiiprZJ8rs/uzyn9lklMnp2wCA=;
 b=cZeHc/5MbgXrV+YfRniWzLhZFTlw1/mcm7PTSQ50VT+8p+M7S0rJmgypcomt6Q4MpPdfEgvZ7+ZMgVHQZpLZqGveohTaklU2ULyaKos6tZqUiCG+7zay7Z5E1deobIG+E8lwlEKQ+HXU9y7RHxZYs24XrPzkabgQJoL52oJ+Kvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB17371.jpnprd01.prod.outlook.com (2603:1096:604:43e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 00:35:35 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 00:35:35 +0000
Message-ID: <87y0f3zwrt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong
 <neil.armstrong@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card: use priv instead of card on each functions
In-Reply-To: <874ihs0vz3.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
	<87se5di0n8.wl-kuninori.morimoto.gx@renesas.com>
	<1jfr1ceqx5.fsf@starbuckisacylon.baylibre.com>
	<874ihs0vz3.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Jul 2026 00:35:34 +0000
X-ClientProxiedBy: TY6P286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB17371:EE_
X-MS-Office365-Filtering-Correlation-Id: 1082603d-3275-4cae-743c-08dee78924cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|10067099003|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	s/jswkf9fCKwD9eJ9yVRBLnQKNncPTRg0yEc4NEzZfuyWGMGgcHIiUPc+/EQzZDpU4MqmkGdcc5tBbvSINDKVzxaah3SKXw+7QsZmGSqpfWEFJdHxG6OH70nCNTCzxEOGyCimqVJzVb5BYPYW5qph+TkrwjxZBe1AUYsAahpzhdLsVEtrxWOz31klqYTBIr6sWyLoyROKoYnxiYGsPRsq6QrRj3QSZI+oeS2FvMZIw8LwJEwiigE5Lmbq7INM3k99A5YbE/GJFKAPGMNJ4lMyL5HlOmGDJKRy7517p/mXYISSKTuN1M6V8RFYeNSZDTFOp9oFAZ6uCCHISSamZ5ficHeO/GOh1cCrGK5cLJU0pgIKVoBbKuV1vB/NLPl5ZV4SYrFYetMu9wbkijPYxBCi96H9Tsqu6Aiwfss+SopzDV0mh13gWLdR02hhFf+kQjWhT42t0B10uM3tT1tKaSPx+/T6SpSoZjOAMNNE35vfagIvFng++1ls8JZ7jaY33ctZ5U762XpD+dH9kRfOYHKdvxpb1GJg4NoiJMp728n43tH2nGAZ43qOLLDOPgwjGXjxhkN6IwMCJneOLmANqR+jwETeCTrI9uzYnDru7qe1ps/OYo7aqB/l5ILztsw1NU/Ryyxyli/Bn4Zw5XGKGsTDIGEIzo4e/9dAY+rYVe2r+hr5zSuEQLb2lXMw2JNUQRJ6IISFGtA51cswT+1yi/AWVn4vbohx8CPSyo4fc0/Ahg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(10067099003)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l8+396EhgjdwNExbJ/xUhHYm60+8n4CW/iNcdLXQmhgMLF7WFqe135H3txf/?=
 =?us-ascii?Q?ocRDtQIRVr40ybvfwrtr1g6hVmm7hkxeXCzDNITES2kRxjRvQgRCLJxUsvcD?=
 =?us-ascii?Q?ruU3pdEOqQy1lJ5jxS3V+vNEs3La8g/RqWe8RlCz2inGrB2O/0VrIeb8oTZa?=
 =?us-ascii?Q?q2+MbPBU/xPYeonavID1E2rA6rvB1mUpQns1v+RHKbUD0nxPJ/leeFggyYTn?=
 =?us-ascii?Q?oCHFqWV3+8Y20KLUY8u3tHd/2NCWV91/YhU5QbjtC7GWbVb1wDS5h3iewRCK?=
 =?us-ascii?Q?2m2kBnwVmJ/FqCQYqnYz306zDds/je8eKYS1Ij5ZH54Dd7jNViFdPcx3BVkf?=
 =?us-ascii?Q?8WdrIwgccGYTGtLrSe9r3X/tGANXUJU/2QmgZxIOqAi9U1y9Wsz1mWBTDwnt?=
 =?us-ascii?Q?5IXGBBctdr0D0kg+iJJLvW0VKCp4VgJ0czpWosYLQbQeMB27qQ/zzvJrO4Hu?=
 =?us-ascii?Q?OnAFjXGqaHsE59oj6ZGXaiQGlOCEZhqn+Jrhn8tKGOdCLT5x+eS4mwdd2TUO?=
 =?us-ascii?Q?XM/MBn6AW1C/e0sxWFPP8a1nTZ6QcP0rZx+9k0fvL9GOTrUfsMqEaGm6Fydn?=
 =?us-ascii?Q?SybLyPMlcbi5n2oskrRcVHZY6B6eYuryKZyZQJ9wfW54fN2hJBAdNjquu258?=
 =?us-ascii?Q?3ZSjDfOmRKhcea8PyFGXvPs9wTfbBPs2jLcnyPa8jNjDxRjjGTCGhIcQcscZ?=
 =?us-ascii?Q?dqh5+3ASgfRST7+LfAFucPeTmVdb9NhgYsprbfNd/Zo8Py5Vfj6+RhWcGGCF?=
 =?us-ascii?Q?UFMCo1UhvG1CC/qHpZfSOrGEHAKsrWwXr7mrm0x/xfcCWeIWT2P5lMCKuMHo?=
 =?us-ascii?Q?bBVZ7hZjsMSHiarw8EFrCJCvKkcXla/JPdW4QDQZmOuim5aH28kSWNE2OREg?=
 =?us-ascii?Q?3ltuzzIMNfWIzstFNxr8N5aJxaqP0mepifvRJKxTzrMFy/nbtAsz/94yFoaq?=
 =?us-ascii?Q?JuqTbTCj58KZ56duJnOJQyryyx9O0VrMemcSy/Ue491W1B3hopSIf6VKjKeq?=
 =?us-ascii?Q?GRiYakcFvqyiyKZkl9EHqe3JU9Qyv8ZCemgc5U16y9lHVpkyqdgRK/e/eG+l?=
 =?us-ascii?Q?oKc1j1bBorPw/8+vjnzzfi4PyzPff0V0UhU2tgYrLHVau7X4f5nOGTbGMetr?=
 =?us-ascii?Q?5+839zwBN7XuHFsOQuiMLjbNLsJnsoUixOf6Wtcb/N+tb4hsOe7MxggJlXd6?=
 =?us-ascii?Q?xS9zNyeXRGLqT4BHz65GIbDCa/ggV+cbbuoLOEk+HQDDn4PTPRfAj5/Cz+5V?=
 =?us-ascii?Q?Gug56dlDDSFEyVGVcsDJmMIv2Mi7dA2SrFJ71LBjPyeCojUvHJlpuAMaeG1W?=
 =?us-ascii?Q?13GHG5iuGXqgtLnz0sDZqq/oFqxVVV0vsKI+dlVe0SI3Mw+XljNMy2mVk/1l?=
 =?us-ascii?Q?mjT0zbridYgiyrF3muRqWtiqVTpViBD1kuS6Cv7let3ljSnOcwy/3BC0mjaq?=
 =?us-ascii?Q?YmbcJbaJ+C2F1xUeliNEPK04SSUnsg92gTdLYa2xSGOZ+HYmO88TbTFM1tFi?=
 =?us-ascii?Q?UorifI4QbT/+CI22GG5g+k8l+o0ahnivtKMWMXpMv15K+rWXOc8ud7rj1Xp3?=
 =?us-ascii?Q?23eeN6By/HtaerqNSlOivFefcgnbmb3flek3qbmw8D4wU1tgIj664f2W3hI2?=
 =?us-ascii?Q?LBEEA0nFbfH0U9Ic58Cx1jCINj5jLGTwiGsEAm1C6vgUcaPOIgK856907PRH?=
 =?us-ascii?Q?nRV7+HBqDgSVuPNA6fpyUvkPbZD1m39QLEpscTGgjbSLVhOlIXxlP+EpYShP?=
 =?us-ascii?Q?yl9tyF+eTEqfsUY1W5W4SfM1b8DAnptuKrHatJLy40Z3YByna5cv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1082603d-3275-4cae-743c-08dee78924cf
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 00:35:34.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sj+4duF5L1aeLwtHDm4rFdHLhtBeoa23FmyGyV8t+fEjBPEaD1CBomXY1Xp/uRY3hgW/wouaDJqBkIIVglKHjg5F1hN0VGUCw+P8qZppruqHntCSEyzny2MVusU9X04
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17371


Hi Jerome, again

I now double checked.

> > The change is simple but it will make more complex to backport fix an
> > older kernel once this fix is applied. So again, getting more context to
> > understand what you are trying to accomplish and why it needs a standard
> > card variable name would help.
> 
> Basically, after "Card capsuling" has done, we can't directly use card->xxx
> anymore. So we need to update all of such code.
> I would like to update such code as much as possible in advance.
> Otherwise, "Card capsuling" patch itself will be more complex and difficult
> to review.

Current functions get "card" as parameter to get "dev".

	func(card, ...)
	{
		struct device *dev = card->dev;
		...
	}

After "Card capsuling", we will use "card_driver" instead.
But switching "card" to "card_driver" only is not enough, on Meson case,
because "card_driver" don't have "dev".

On Meson case, it don't need to keep "card" in priv anymore after
"Card capsuling". So I would like to add "dev" in priv instead, and remove
"card", like this.

	struct meson_card {
	 	...
-		struct snd_soc_card card;
+		struct snd_soc_card_driver card_driver;
+		struct device *dev;
		...
	};

Then, we can get both "card_driver" and "dev" from "priv".

If we can switch to use "priv" instead of "card" *now*, the diff will be
more small when "Card capsuling", because the patch will have
"Card capsuling diff" (A) + "switch card to priv" (B).

This diff of (B) part is doing very simple things, but is big volume,
because it is sharing the code on Meson.

-	func(card, ...)
+	func(priv, ...)
	{
-		struct device *dev = card->dev;
+		struct device *dev = priv->dev;
+		struct snd_soc_card_driver *card_driver = priv->card_driver;
 		...
- 		snd_soc_card_xxx(card, ...);
+ 		snd_soc_card_xxx(card_driver, ...);
		...
	}

-	func(card, ...);
+	func(priv, ...);

If we can merge (B) part first, remaining part (A) can be simple.
But yes, the backport will be complex.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
