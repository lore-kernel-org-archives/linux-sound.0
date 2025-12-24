Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8372E1C84CB
	for <linux-sound@vger.kernel.org>; Wed, 24 Dec 2025 00:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766537544; cv=fail; b=qJNG6mckgc8r5w648A8xKgfwt9iAgOoBxWbui8R4LWzcGjKbXdEHnbTcyImpXeW2Jh59qRq1tlg4PLlT3ravUCU6mIwAqpTkg9hx/VU+XZFhp2dkb8A4q+RHgxHjkPGS2yp/hopJkdEWKgl66VRs0SxE/adnSg2O9hpk/riwWJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766537544; c=relaxed/simple;
	bh=pXuvV+ZvqgNHPpSSGxGBxUyRcQksO6APVkn7d8rrfCE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=KfRNB55qn4mvhwfObdYibYQ0Zpjj6u//PcRHXziWyG1kP/dQkNLi5fydSasHylfF9OkK1GmPNoIXWKBCFhc2QttMjZvi9NRUDD64iL65lpCMH9KOYwqib6gl5DYCR1F84a2onxxl+AM/dKsji6AC2iNFZIkC78seFipcB5tXeY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CrXfm72M; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CrXfm72M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zn7crv7GBzwgQKw2xuZNpusooLNVhk7EKdtZ+qc9iiyXhP+52lchyu3I732PovMotn/RdgMP1SanA0qXrhy5G14GmOg1gSTJEKJenr8KLSaWN724795MzB3VHWvzsN2YGdGD1MPIJcieQO5x6RLxnylz4VU+NNUIzNclop+Rryt5/YeONybdwC9HONMrkNHSKp7AcBF7/55NJHbL2zO7nhCR4dajB2RIpczLLhMfcwTtYzPbbw2xgZn0eTK83AE5K+tJUqj8veEdItm80q72Wa3z6B/r4P3TdOBajYOkn+Eg9wEwiizp9aHG/0LkzCbHdW8vXDTksZy+WWJk7qQe5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16N8AGYTX98fUMlRUYkoUD5UII2ZlD2OC4QIA6Ffr5E=;
 b=wDdP4AWQw045rtQDuwb+YP/XwEmdplv+CefIgblr/zAvCn8nS4sRHdrjUGN3adLevd6oqKd48xjYrPUN81QwFMW6CFooA4/hmvpE+bpLpgOqCXaMIzlWGkxMIWjMWg7xVq840nSN1I3cZPKKHUZ923MeTzcUPre7K+8VnEY1Un+qvKahUSP1lvpY+rQC0SRTpYXaChHyZzr+QzZSFvTujzsnDque5UDHX23Qddbs80gAzZiPxUhfLR7BME/od8iB4LxbgkPCsLBZNnm7iof84NFxYWf7rM5nwemsXBdVaXaQSSjj7OdNRNGqYTSTTG250TO2LJ/FipMSFHDCUq3jGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16N8AGYTX98fUMlRUYkoUD5UII2ZlD2OC4QIA6Ffr5E=;
 b=CrXfm72M0nUJrIcwvdqAM7hwJNA6Cs9YvPpVHbJpl9U820rkWhJUr2movrW+ctQQqe36FqlAc87ZYAnxgOv4JgpmC2MDd+BOm4ww1zwgfgNo9XTBNBL9aj6UWN62P9Ic5yR+iVVB6fxNUGyU3eTIf1vSfPz7rAGGlMyznHkLiM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TYVPR01MB10701.jpnprd01.prod.outlook.com (2603:1096:400:2ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 00:52:17 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%3]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 00:52:17 +0000
Message-ID: <875x9wvgzi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: alc5623: tidyup clock inversion in alc5623_set_dai_fmt()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Dec 2025 00:52:17 +0000
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TYVPR01MB10701:EE_
X-MS-Office365-Filtering-Correlation-Id: e140f222-66c1-4f65-352c-08de4286afc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IdsyUtTOpvsOq5D5I7earus3BRSLJmlB2QdRZ+8gyCf+gCj9d6wV+P+M3aS8?=
 =?us-ascii?Q?tzrDBW/Qx8saAuKdHx6tJ8eEI5TLSMj0puNX1Gad/MH33AdYN6kwSh7/MvYy?=
 =?us-ascii?Q?6XVjq3uDNuapmGua/eSGZHChxxLKKH948puPpu6UqKcEOVdg79tQUNND4rlq?=
 =?us-ascii?Q?z5Aa9MMr9DbUuyx8/edN6V/03qDDa9GKToGI9RGafmaU/NgK7KktNQMy7GSD?=
 =?us-ascii?Q?jAtgP9jxD8XBcx7CG9MmkLzRwmJ/k2fioPec5Lj76zINjalxJoHG/xCMrIBM?=
 =?us-ascii?Q?s6rScDvqEkVSuW6bbvOe5gMD4+hfyMLqBDca5H/2Hmja0gneeTbVRaxHZ2LR?=
 =?us-ascii?Q?YP2MxgTFawLqgOdejVW9EMJZHqdbCwvMDYCoarz+gwCyQK8klCmNc10j03Qe?=
 =?us-ascii?Q?bvAUjm8swrGkFjR1sjI/CkuB+JldUQi+C6E5N1UXDHpWvSAhXFgrnhT6qMhe?=
 =?us-ascii?Q?warGuGwYmYfHXMlFS6OKde7niTpO3MwXMHIgV43p7bImSou/7+9qprEXx6iA?=
 =?us-ascii?Q?kJqeadzfLJHKceBcgXEGFSnK93V63UftGJGWHWM8Pda7lm0Ri/wiHtiV1QO+?=
 =?us-ascii?Q?6v8JRB3AkUAO95uE34IHPro0M7WQ4FbowlS1JvoZFOFfCXTVTKzupPyJ3lHy?=
 =?us-ascii?Q?X1b+hZYZzMXApPJjLgEX9MShsy4n8V+JrlAj1MCnpL7sx98HY77+TAyXfIjH?=
 =?us-ascii?Q?iQMj62G0GfscoieQidBlpydvIF1Uz/7rSr8Nt0JZNUHvCchTJZYRwxzIJqoW?=
 =?us-ascii?Q?du6criOZrPRtb6qOSmbu91JIWQkaov8bNRe6EmQf9Uh7wUccB5TnsNwHPjV4?=
 =?us-ascii?Q?Sr9AdbC0h3mI2HmVlz5D+jr7Dk6HeEEMIZMkOVoAH+ZklMqJPbMggmnkhLer?=
 =?us-ascii?Q?ZTSJ07hjr3cCmriiZZ9PBB9lVH8KQQ6rCYmjWXKnQGsbsKUW61qaJPat04jW?=
 =?us-ascii?Q?GIlsAfWAnxmzEpp0H+6e1LgB/KincWbjgfxrVneykGkz3FP9vyd1HnRFUs4l?=
 =?us-ascii?Q?FUMWP0JFXOWDb7YAQPuJU1L3r1Y8lf0aiFaHSUngDR4o3me63i22APRvQJi8?=
 =?us-ascii?Q?CubUr+cI9nKuob4IyJMPnp+bfR+o4A4tzVx7ILF7w2d0xa3K6+eWj7bazoXq?=
 =?us-ascii?Q?i+MnuR5iABhxwdbmZDm+XaxxvfPjcbp1AVwW4xU3pvjAhUCeOHTCnNfHmUQO?=
 =?us-ascii?Q?D23uidU3QTQS1AaiLAymugpddEFd8EsEA92k/ZsU4ssE5+dsmWohDwICqrSn?=
 =?us-ascii?Q?9d7Osb95I5kpi4XS08KYY0Ol3kk00l8XAPrNWYXu/aE1XvefHG/wipYuwEee?=
 =?us-ascii?Q?hl30dGCPtcWUe7EkdYfHuVRa9HjpXSaPQch6S4iCUXS0PyQEfN/7ApCwhgwh?=
 =?us-ascii?Q?q73LEmksLfSx5knIEngM1/m7jzV2iujIi67LVEliFwfSP8rL3zN04EwbLEAu?=
 =?us-ascii?Q?R6hQ5mj48YEB0UBdCNCbT4j8MVrNLrCjJh6Dbv4g7WHg09TiwlETnnoN2Ub4?=
 =?us-ascii?Q?iFZmX7JEYpa1Em8NTIWSGmufq5uEbJvwrwMo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hTMC4nEa+rgpuEv4R+PX18hQdOG+TUGXCGkeQbwfyfzTlk2D2j6ODIPW8XfB?=
 =?us-ascii?Q?mPLZNUkUv+gBVl4Kf+a0zmybBTAd2vVwQTFNMg0igpj3Kw8Up5rg1a0UTPBF?=
 =?us-ascii?Q?fF06TxMJquD6le3HZAe9YuttfhiI91K6B7peL4NWl8KJv5pKcq3hH55P06Cz?=
 =?us-ascii?Q?vudY20t+w0nr7bWL6rUwxHi5B0lsaE2MX8+aPYCkMBIUhUC/IuiLNoCncYep?=
 =?us-ascii?Q?EY5cPHvvu6b0+74MhGyEkCcCgx+OCTy7k33jMSlspSSjDi8QFSa+l2bQ29Vf?=
 =?us-ascii?Q?pBIp0/wKxQB9WKU8kMVdHsHYTysU2gwJ608Fy5BQW9wv+kPE4M9JeGVwaZOf?=
 =?us-ascii?Q?KA5Yra2kEQ4Lv49aOktNZCYa03vGiBbbfQv48c8bdJNIGL3s9IXaK1VdYhlj?=
 =?us-ascii?Q?DWe/Ds9Tx9bVl0RusamRoi+ctUm/KG4XuMPrn586a/PuRgwm+fGd1mURYi43?=
 =?us-ascii?Q?UOT8dh6Z3vLk/9OB72AZEUC6fm7cSssyZseau16Et0j/KwJ0FZueW9FWuO/N?=
 =?us-ascii?Q?vS8/SD/2Bq3Q5guuwet6WLhyWb72YiuT3GIltVj0/Ms/tYUHHSRxho8RlnyY?=
 =?us-ascii?Q?PiUHoix2fkuOwOb1yaJ72M6Fzvn+/jPJKA4nUbOUEDQIt1c7H24L/p+bqk/U?=
 =?us-ascii?Q?dauYJQfWkB6DocvoTb8kfa4seuJhPncBrmA+3o8oBlba7lL6z6B0XhSpuKr1?=
 =?us-ascii?Q?SMLQ8vzH3M/gzmrlmM5Y+10u3C3ebZS2dmFaOxAFZxPIjkxO0akIyA9P/CZd?=
 =?us-ascii?Q?yWNoUFuKJ+9aXho/Ku2n0UCaXJvBzp8BZJuG7it6uHpRFHqRiDRw7/fOMLkk?=
 =?us-ascii?Q?ydbflU+Rtmr4q7q3h4eLH62XuZiNmH9NfvDD/h4FSIRiWg5CHwdl0iDpUa/c?=
 =?us-ascii?Q?3GAvBFUtJueKs0porkRH3cb3pnM33ecRSu5xrhHfYUQhDgz36GlAvF5iBDrQ?=
 =?us-ascii?Q?bdym+VUr0aGRsSrVYRCt0RjB8hCEreQ3clhueEkWnQW/piRFmTx3gS177ndp?=
 =?us-ascii?Q?q1rPYweZjR8l9G8sY+jFIQBvAWYhxft6f5/y7LBuIZyVxa9g+DdU+0pmCUDY?=
 =?us-ascii?Q?z5pdqQxUxbqGFUYIYYmIJ9w5wuvIyQgnoXOFxMyuRbhEPH4zTJgBYdcPf1QQ?=
 =?us-ascii?Q?OLqCb4DQ8DZenXl5kgKCyUInH8muLhnFnEFb2t/YNmoQlOwMdb85KEC7Z0+G?=
 =?us-ascii?Q?HoVrtlFdhBQ4zgcWvmOHu+pDNhXA183Sv9dlmf9b83+YlMZIHH7NB5hV42+Z?=
 =?us-ascii?Q?+GVFIO1GxPnuzhrpDBIJhpJ7DT+tSUck4+p2N13ojSgriUCLhYUDp8Kg/iUf?=
 =?us-ascii?Q?DG9a66Rg1b773D+/77wtgQZZP2f1/lltsTAOfhC6ydUBvEnM/y96/WvoYuMx?=
 =?us-ascii?Q?xt3/P+ohhyNdgiNwRT3a7ylD9/9sa7AyxCU5VaJ/eG7y1Au4DzBjszvV5JoE?=
 =?us-ascii?Q?GqcmeLddcnZlrN+ZfvpyErW50C+XrLy9s6q9otieZ7U6/suhWTR7QLFJ4SMC?=
 =?us-ascii?Q?obSl69iDPkcL6xh/rgvJwV8Y8H2cbQyg7tMr4KSB4Uxx5byF2Vad7Y2cJQBi?=
 =?us-ascii?Q?4cKWZdtt5Qwt3ja4DKkDwTRHzpJrYvzd51gwAdLKdpeO7D+N/D69ToKINS4l?=
 =?us-ascii?Q?gUtRpD7VCODQgih6qOFzvhb+xt73KmnrpHhCZGJan+BXjmcHIUYIJTgecRHW?=
 =?us-ascii?Q?f2Ag/Q52skWk0q5e6B6qyE/EyG+qjH5DJIUzFkBXkX5IrEOQ1a76unau1Etb?=
 =?us-ascii?Q?UdHnBIEXk2IN3Gr89KYWc7pSjYPNYp3Eqs5SdUV2OHI9zTRnHEoy?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e140f222-66c1-4f65-352c-08de4286afc5
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 00:52:17.6295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPHKv6d0O67CCtzQYDMr7Gd4s3g2qNDEH/QgpnSA2nnuVL0SQzBzpCB49RrE5wIoOETvFa1zZIJXjS8ESG49/Mcg9e7n94SxBE6M2JxXCw11hqfxg8OIRssyxCQhTNiZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10701

It has duplicate code, tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/alc5623.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index 9fc33a5fc213b..57701a8773b69 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -677,15 +677,12 @@ static int alc5623_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	/* clock inversion */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_NB_NF:
+	case SND_SOC_DAIFMT_NB_IF:
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
-		iface |= ALC5623_DAI_MAIN_I2S_BCLK_POL_CTRL;
-		break;
 	case SND_SOC_DAIFMT_IB_NF:
 		iface |= ALC5623_DAI_MAIN_I2S_BCLK_POL_CTRL;
 		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.43.0

