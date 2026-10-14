Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7773CDBB7
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946761; cv=fail; b=Dc63G5+pew4xDDkjDCziRJdOyx5uOdilD0e7Q/8o8eif9iFJdfTv4bHFxhCuaFKfhQLHepIhhB4N4PlNXk/h8mPjrXUcRi6MczgfD6pHgKO9LRKAWaqb39oR/bMnI/bOkOmwV+723d8bYizZtIPFmO9ytjmS6OE+FIECathVI90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946761; c=relaxed/simple;
	bh=J6HAnJwUawqJ7O17zd8Ty6JOpH2m4Hbg1t1WNqJK2Q0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Jfcn+SfDTtZ2KJBLSHfzOh9xiI8QLKeyBSYKixVaDWlGA2Ie6kMVwvH9oXEuTxMHJjaF02Lspe8k+/M9yk3j8Ftn/dbV35mf4P1xdqgY+mXTGWVGEksAjcKGSKMVPwMpRv3HoGk5/hMCfFJUH+q4CoPpaecrM1s6RZhxZJvPz5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BIEI4Vid; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BIEI4Vid"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkrZhYdtFmR1lHkvACmnM9urqe3tXo9KHAN16ZDxjg2FIDeoQ+/bgA057oxAoInGBC6IDgRnhi47I6hJnDurjmPt6Ih7wjhG8Gr5aHKuoJIQBZVX9jqgG0PbVTXGOi8L/WvA7azlaLTNPJaMXfBV1zfOAU3clDmKnNZIrFXq0NDqevbcqtSEgoHrO1WGa86bQ9jGVp1h937ViBaXIxEU8nwqFdrYVpBkh5E4IUjLOkIJzPutGNEtXSAG8yUdrh5UHyhLHjSN7dCPYwTd7lng5Sn6LMyPgObRsx0c+j3ai68IxqQ+8Z/Oi4fUK1vrDdZLKEc8LY5pbJIy4DEWTHl82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asDwiun5tZYtiBadu0dJCEZgNVqJRNoIaaE26rD+ce8=;
 b=LR9eiZsk7gfNHmUQwEcw9NKRWsSvw8JkFR6CxSr8P3cbvU0np4+dqD+voSUxjZbsZrI1jiA371OZVXZDNGUzTEaIWe+0cOJoWJW9GFaYYFeo0vIQej6QMOERCVUQVAAR49p46YvnRjBYu4NxNBKnI7QAhKXk7DlNdONqgBn7e2epNa1WRdQfprS4EcD7X6KtaYdbCs9ftwfVcN1qWvCE4JcxxlhujXA35Bv+BT4hs3fcRg4EpaydcskgSEjZ7+txt8V24Xprn2b10fVKdHKrMh28FPGbJn8EWl8YWH2XuSKZ/Pd78xGtFhr2nKFefPI5OfWnbeyJws4enALzfEJDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asDwiun5tZYtiBadu0dJCEZgNVqJRNoIaaE26rD+ce8=;
 b=BIEI4VidMXBuut5fDmWR16+hnuPDrdUA4N4dyFCf+9xbPgA+HxvLU3XlcBbK6ijZmEvN8RGac9ELa5UePsTZxhvYwoJ2qbr/2YvKJc91ae9O46UAPRLOrhap1UXHAgNnQyg7TBmPL9de9Kkr93NpH1B3d8Pffy+2vxBQ2fYJaMQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OS9PR01MB15638.jpnprd01.prod.outlook.com
 (2603:1096:604:3bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 02:59:18 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:59:18 +0000
Message-ID: <87bj8xyol6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 10/13] ASoC: soc-component: move snd_soc_component_active() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:59:18 +0000
X-ClientProxiedBy: TY4P301CA0122.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::10) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OS9PR01MB15638:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c4b55d-2893-4559-5ef3-08df299f239b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|52116014|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	oQ1vbW3HUAf7/6LjmH23MjuYGQ2U4f76DV4i6PzoDy8FeoEjEeknWICkPjMEeUrif6DA9OBrE4coubjurRc2ZDOAJy4QP5OfGwN9F+YD7z0XqQ4ntW0Y17Bh03r8zPywTSKD+/tVKO/3v1stLGklrPDylm9Jk8VPeGN81DoYEDSiTf6o2NEFm9O+FlEvqVzygDyJHmrKq2Z+zyH40ANp0z1LRxEIEZcSnldN5mCnQS+1Yd2+wpFQXBFlSKjpSrBXIV4XAquUmfvhBn3MPUayTLq5v84cMjWYDo7pbT16g12SirHks/Kq95RXoXFTbAwwZxVeE0Etj1ka+14mHFxJLAo6LTPTYLuZntuYtmh0RE9mH5vFLVwwB0SS0wiZ6v7I1NRbcMSAlg9NC8Ku2fsuSG2zq9f6VFe53hx/3meY+2C/LPAvLmtKcMoAjKU4E8kGf/eOrb2LEFImuTzvYCA3aXtOMqB+Urrp/DNqgbmA7U1emR/ZW44t1CaeCT/ljjUk0Nd7VMtEAsWuMg5irIrMBVol0C+F8VEeYVmbg5u5tvM+MiI4Tlexn1yhQ/3fdh1HpwQfzdV+pm73gE5fkwJCawO0wuPj7K6x9JGEUbrFpfDI/u5/nCczFRIj4QTyTCzeFarONk8bvR7WH4b1EaRRm7lfzBZ0+2/dYxTEM/eCOCvim9GGgP9NrqPuo5Q9Wnup9NYnk8bs/jsoAlY708uQm1Nw8NCY+hzl9wuXRClBjY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(52116014)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?8iMB1QDseHKOkB3uDrR+7LHDM9AiHWBsArNujssmoMbVeJmciItsJ3QhSr?=
 =?iso-8859-2?Q?4ROC1xI9ieXRhOjBXmhA+Lxk8UyHWa+g8pc+yISoYuCWpBA/AnPatJf9t4?=
 =?iso-8859-2?Q?Z7+OH/2qb5FIiTIfhknq0FojaRnD9B7FbY91THFmx7U3pGlzbYaC2WPa8i?=
 =?iso-8859-2?Q?mj8bWt2jWNJgiRqZ2DV0ZbdZeLDr5w55Cljo2AgnoLQXnXuvRPp4UK1vxu?=
 =?iso-8859-2?Q?k3V9Tkr0jq76lYFvacMf7YzloikTWdOkdt7+zaaX9fIdr4GUL4iee8U/Dt?=
 =?iso-8859-2?Q?UTCnxszdsm9AI0s15v5fbGE2bS4BByNgkBNFU5pQsETE6pRtmZL8dYtIy8?=
 =?iso-8859-2?Q?7L/f7V2QF0BxJ/fveSAOtKYBKTmx89bFV2pt610K9luBR0kzlxh/71Cckp?=
 =?iso-8859-2?Q?c9mEB0yWX5dspbR/uM50ZdIsgnCEcvcOoeXbZeBtjaNHkvdNrmPfTjtHeD?=
 =?iso-8859-2?Q?99N6FOm5moXX8ekjJOSzNT3buFHC8/uiEWs0mx0VCt8WKyRcjGT/LHjJpD?=
 =?iso-8859-2?Q?my3/2yXhTZba/B3uX5hoidZyqcvspe7ZrpIEEbfg2yGx5Xg5ItWkyKe8/I?=
 =?iso-8859-2?Q?9vi0KGRXWsz+vzd2dA1cKdNo8VhAXexx0PUvvQxxdNBsdxte0DcISGBNSP?=
 =?iso-8859-2?Q?uB2k8puogl5ROMywHJBzZ5/kiEGyvMunb4h6fumt7WiqHXzZGXJIkFOzzv?=
 =?iso-8859-2?Q?AASsVLgnZyTZ0PNOex18lM3asHkip6s978ncrbOu7Ti+lqllC0+DkSvqY1?=
 =?iso-8859-2?Q?6lmKi+CVSs7UW1E9L21OaNZ1veBo04XBXWvdlBLscHLDfsEQDsUonoZRqO?=
 =?iso-8859-2?Q?8PpOGRFRZQpzz71JWQc4F1AZiKhZLqAN8/AiNFSz/KagdTHUTu8qY+t1/L?=
 =?iso-8859-2?Q?lJF+/dF/kcMvqY+56l4kagNUBnmO8PQPPP+HW73BkqlGguJGyxdR9dzfuY?=
 =?iso-8859-2?Q?/CTNvnjMQbajG8rhZKYV9LdLL/sbScvv8ai8cZT5PVelbv0ZHJOAYnlzrH?=
 =?iso-8859-2?Q?urdTWe7mdjNO/Eq4MJnuv/9j8El7/pKkoPwp3onmLRENtATc7veBTMxRHl?=
 =?iso-8859-2?Q?3awXS7xAhj60BLS+i6C5AqqlkZ6JUaArCk74HZHywCdv/vFLyW0+qYORDS?=
 =?iso-8859-2?Q?ngUypURD6WrLEmvuFr95G6P+wjcNGsvH3n3lr4dnp6EibLBeZNmfz/tc0v?=
 =?iso-8859-2?Q?GrlEfOeEv7UKmhvefRgyHm8I+0O0Fv7UQJmbLduGx1gHGmXWMBhiWyrkFA?=
 =?iso-8859-2?Q?rSKOyjuZ1NF+LnsP9I0Iuu0Od2GeA4QenYTkzML+s4zIDtVzTlq50nlso4?=
 =?iso-8859-2?Q?WHLap8MEqiy/fh9IlwK3vVES2BP4S1Y8Kly9EG6jLi0LV4xNhNST6xrk8d?=
 =?iso-8859-2?Q?AKCTguKdZsdA1jucEVJS3fbPJ0jzAeYOgZUQ7d7bACnqESx+nsq7uKIcb4?=
 =?iso-8859-2?Q?RQKcA/9/eff5RRgQKLjUcdm6A1cpbFHpEpnOgfPw09ME2iXMKFmGb45vim?=
 =?iso-8859-2?Q?2jWqyLxtf/58Eico81J0gVe9qfhFbSVLv0LX/33gTw1D9G/ude4hJVX0WM?=
 =?iso-8859-2?Q?AtM+OMfpwnalrmZUhKuoalPyVw1+5Kd/OkEDsTEG1pYLDS6u68BhaBj3Lp?=
 =?iso-8859-2?Q?vppJ7MM7DoAxGwnb1T4srhPO/n9/QE0U/dfMFPwy5X2Gs/pXTARgoswYvw?=
 =?iso-8859-2?Q?cFUiEsyGYDnLvWOzJOfEujso3JIW/5t5nY6x03eaG8ZDbdzcM2KZN3Q87T?=
 =?iso-8859-2?Q?57MJyb568rHE5yu1hO+Jb6biDCXwn6eqUT2pQFMGFxOJL9YDEV+UVsbacB?=
 =?iso-8859-2?Q?vzFpoj4ie7N8PDhsDQlAKlO+4PAyHUpAetIOGBszZBxP9OF274ML?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c4b55d-2893-4559-5ef3-08df299f239b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:59:18.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 25KNZQi4axy5fCcI7iRi7uNXOiuAy5aWo07hARhFAqZ6S+BYGh78rM+rlnXcIelScp59FSANhG+H7S6894HPKQhticXa9ZH0iPdS4B84rrBcx5bclvrXuSqMqVq3z8Di
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15638

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_active() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 6 +-----
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 1a5c9d0d386d2..0f955f5cbebc5 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -365,11 +365,7 @@ static inline void *snd_soc_component_get_drvdata(stru=
ct snd_soc_component *c)
 	return dev_get_drvdata(c->dev);
 }
=20
-static inline unsigned int
-snd_soc_component_active(struct snd_soc_component *component)
-{
-	return component->active;
-}
+unsigned int snd_soc_component_active(struct snd_soc_component *component)=
;
=20
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_compone=
nt *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 737b17ed60d8e..962cd7ab3cc23 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -55,6 +55,12 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(s=
truct snd_soc_component
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
=20
+unsigned int snd_soc_component_active(struct snd_soc_component *component)
+{
+	return component->active;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_active);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

