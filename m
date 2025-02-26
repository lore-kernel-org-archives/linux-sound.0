Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C966019066B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533679; cv=fail; b=b9NyQcP4K6B04EqylTWbwEFlCJowODUgOJb6vGx90qVh1xkDXjsEYPG4bzDm2nGygF0EH6RZysp8mjodA0FLL5wOFOD3uPjQet10CtNYqfSgeWLJ0gDpus8W1px9qJa7kN/NUXx7Aw08Xq3hKVTVqEwhiI/kYdBt4OxPvy/+3nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533679; c=relaxed/simple;
	bh=9F7HVB1/vOoWvsl4dL4Szj83VPbG/6huGRSFe6zAQC8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fUD0UcwxwgykR/M3yABNvzEu+AJNcVtsObWtGzKk2+PVPECAuK+wz6hy6T6N8khw42Dt5Cr8S8/giV6yOkOUZ18/qMb6JePAmw8yzXyv9NqrSWKCjoc9kIZwq02kffXfGjd/iwUQrRcH0lE3uoZTtC4P1EQj4h19LMLjzXLTYxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ArmL+cND; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ArmL+cND"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2oh2+SzGYfmqz5DiN03rlfx+bV6OTnVzZVwC+d/ShB+B96khWI2MeAv85ndyaZHaa7MuNdmBb9+xuenH1u8gyx4+309jpW6WVJynZ1OL6uFbC3gpJZcE4lQRxWiJ6UZY0/GReDvwJStVdEwsrn1nYJs/v/DlCQAvElygMp6JvDIhjntIBUEayUuDctudQFUwHMHJMgv4LaNrhGKa/0mElHTtTI39HPfpxlMar0kNNu9qyD0D7gv6FfH2BYUVtGyYrt8YWUxMG+oKWdWebuN31KBvXkg1fsUzg1PN/kUSLf0z33aYNowtzmaLKOhUufVHZNy3DFSU1R8pijT7GpgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ydlx/xbjHtfFeaWUY52fGFQQve6BqfEoWQih+0RZZg=;
 b=m978SBftUPdK8n1tyIFxzxC0j5XOCz/B3HGju91GXTGN/UNa2xrVsEEnviJoc4aYVSXqxRbQ/TpZcks+/+qzrRohYKPeFqfH1wEfZYbn235dOOQ+woMhlMImY+giYMPfT2MKzKJZZcxnDxGQ08K0JzAMNMaJdvHNkSZQ5sqCCBJuO5wuAphnyU8PD/T0E+L+TIT+yuDo988LEQiahh4ip2gowucEqMl05yq1ur3PJD9JChfqv81SKT6Mh7gKJsyqCmr2Up+6rBduWw9kEIgLUH0zD/gvuK2PliXIvaWY4uwiPqJWIyCuVl25g6Wd9a8OFT1GcCYBDoFg1AOktkRT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ydlx/xbjHtfFeaWUY52fGFQQve6BqfEoWQih+0RZZg=;
 b=ArmL+cNDO1G8hIf5+TH31/d+O50LDAlrsjdASbWfSAUBKT3fRuPbe/yKh2lDzfX6Ao4HJMAnQXzQ5FcaxIZbckKC2O2egIgJhQNzrh+GND1FGIqcz/kmZ0l2lwcZ8GNLTxxr4h+a0YkZanYJrKKn7FnKK9CDbzSriHPXOlXFG74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:34:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:35 +0000
Message-ID: <87ldttcwut.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 071/157] ASoC: codec: wm8524: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:35 +0000
X-ClientProxiedBy: TY2PR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:404:a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ca342e-6912-4134-9bd2-08dd5605b9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2fYs7BmTcaPOHLuNLaHzF8H8BvLJe7/EtgLmjXVeqjQK+2RgOCAcviC5KgsW?=
 =?us-ascii?Q?c//otmHlxTVDG9sLqRt0cMHKb/ASv3QXTyQ8gG5FwxF7voYZW7bqv4SlI4CZ?=
 =?us-ascii?Q?ouwHp1byU2pgcCp2XoQACw9PLmkt2x0I+IcaRn4/0nsP3dDF9lQcGe1V6bqb?=
 =?us-ascii?Q?Qvfcl9yI1Bu/Q+YsiOzn+I8/vVSZ6C/kl8bTMtrR7q9Z5ORf2YKdypMVzlIQ?=
 =?us-ascii?Q?w8D316NskgrmVckcOCzSdAOn7oh/JM7cAZRZagUtLdxWkgjh57XiMimN4Swa?=
 =?us-ascii?Q?vwDJAWieUTEmiz4nejcJEdT5J04Oe37+rT2eD5amEtkmYYLWE4TokfyalfJc?=
 =?us-ascii?Q?7/xxO4Hbr5gWK9jJZzGknKC2Gmcvbn6Dcu8uRXCTOMXyRl2o+vt5Wq53DbMY?=
 =?us-ascii?Q?Wk0ddgj/O9LubUPcJoB/T8KIs5APcmN3TsekdvZgeGQQbtislMvwt3Gyfz4k?=
 =?us-ascii?Q?VMLuf1puKQkZi5yCMaajsb0AdRiS+UQ8CxLEmlHCx1fY99/P/Mzmd+s5W3p5?=
 =?us-ascii?Q?qIjZ/EdENVUdgzH3DdARWB8TJs+7pXJWSag/ig3hzQIiFa0FjNLJdb0DJEA1?=
 =?us-ascii?Q?KfGFY5xPEl5LaQTZfLdPpd52kDYMoqRCfJ0HBW16PGqbbeJeHU5cEmIG8v/9?=
 =?us-ascii?Q?bevjTGdrDsIuoCYivqtP+CMBizbHsZ6K4F/iZz81+oOMxXfSFqzYLgWmAx1l?=
 =?us-ascii?Q?wY8VpagtjipcFFqOiGrUxwskvgqMBlYe7e46CtVV7vkLAjY0dn8iGtpw61/8?=
 =?us-ascii?Q?MSyacS8qsOhiGu3xjzI4UeO8sdMNxC8w40IPUp5X8lyjyrx6nzW1oEbNwcQ3?=
 =?us-ascii?Q?AA5Mu7F4IE/ROUhbSXzV6IHtH8BdGsYSpbkW7XklsX4w1wM0988q8Dgv5f6m?=
 =?us-ascii?Q?ed/K11lPy3nJb5BPHFwfopyao+0H976bvMeKdFtvvSNS9cMic+MVzHZmhT1d?=
 =?us-ascii?Q?Jr26sWjX9n8yQHrsBH+NA9xei75ApVlTzr2ziFai+qIDVDJwcZrFol9NmIAI?=
 =?us-ascii?Q?f/F0bbSvc3hx3Cn+wtUjq55dd5EgyfBTA5eK2ScMcdHjXSz+HAgzJFeANpY3?=
 =?us-ascii?Q?9s6/IU6kBKjq7mwF2ybHqTlNRcuhzu9um/V5ezRGGf6xQpGi+7wPAJsv0UNr?=
 =?us-ascii?Q?egVhqSqo85gp2lzxhQiKhUzDBmycSgjRYPoco3AnCDQw6/M1EZcI6E8uJ0Qi?=
 =?us-ascii?Q?O6PE/0NvOES1AlIVv7GaFwlKe78biwsc2+O66hGszwntk2oWbW18OYslDEhl?=
 =?us-ascii?Q?XUS0IcZc2aYAIGZBABPAyT8CcOLopEOgvogUXqWXiV90/VZ6x3A3vL6+ZMYq?=
 =?us-ascii?Q?X4FAwKVjpPbgBVs8AtGxnqBO5Woc5Zfg4nwi0feCw525R8x6p7WOOxqHPyye?=
 =?us-ascii?Q?LNMW+Nr4DVo5I6L+qoJb650IqqzjESs2lDKweNra3L7IyqFX74PSN8L/Hkj2?=
 =?us-ascii?Q?1rI/prFC1m7YdrGnSPAhs+m49DXQ1RI3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z2370Wfx8l3UameJReavJgUZT9BX8CMh8TWQCqnR2dKLDFSxFqyY2qVzfVFX?=
 =?us-ascii?Q?fzDZq2gRAs+MZ0O2XP+fh3WR8wWbWKQEg0WGeRornJSnSGBxs2FVzeyBWi7P?=
 =?us-ascii?Q?wtH4RnYbm3wbNdwrxeN0ZU0NoOVyIvakVIK0AhTAErA0FsLpvyNHtUQjhMER?=
 =?us-ascii?Q?StFUhbzBEkrXafPffZ0ajKX0Sne4e0FrZAzUGGATSeo0xntinpxk1qNMjgFs?=
 =?us-ascii?Q?pbXDFPg0XPWffCtbJBTcT0Q8Le8mO8PMIFZp/l0itM07XTuE8BhdzdcGP4KL?=
 =?us-ascii?Q?an3ukW5VbDZGBC/M/N0fxAPE63TJTRdbtd3XXZDHSTgf9fkNSi9FN+qQZjUT?=
 =?us-ascii?Q?GK2Xz95Nd9sSGno1pHy6b0WntzLLgyintSYXZxKEh/K70StuNVxsRy7WJyLV?=
 =?us-ascii?Q?opWnS2RnWkjI9L2otWwnPj14QatGFc2yVIf/E4PRl1QRAGo/iW7HpXmYxJ9c?=
 =?us-ascii?Q?zvt2TFxH0biswfpWispT78kYJXoSF38l2Ckmn5sIPNPLkW5XwosH5NS7mgME?=
 =?us-ascii?Q?TwdeS+Rzi6jHm2zGHXKL3735MK6MGJJ8jauIK19A/9L756IZjC0bwEAN1AMH?=
 =?us-ascii?Q?SNRQlbDMVeJ0YgAz1j7HEelkG3VlOlRftZoMTGvgpePKsslNkK7P+VDxA2Ww?=
 =?us-ascii?Q?e/2oSMELMvOowxRHdsdO56QRSDsyjaB6PpsHgLiJseFZDcRVqBGjEu0U6ZS8?=
 =?us-ascii?Q?UtTstYYDpvlopwjHb+t4hzXP/FM5HBKIa5N7wYpKglUfypFXaFOMsEfxOVgP?=
 =?us-ascii?Q?UfAhRj+A0RwHsybWgeOA4xdNsnb4AQ7p2/QCZDvzmtajAZA9nPSXcRA3dyHH?=
 =?us-ascii?Q?ptO8RY9PZHXDM9kGTTYuJ0frGt3QRRt2nW6v01o8qKoMuijQHTYzLyHMuz6L?=
 =?us-ascii?Q?5Ahh5GyfyFs3ff4BOVMKLSVNXhA7fxlXRGy5POyFw5vHkRKvu05a4YOvcSI8?=
 =?us-ascii?Q?idJbltdy+qGZMO5miLAAN1am86ZRhv8qlNXPeJ24gzY32YF0R9ltUHZ9H1sy?=
 =?us-ascii?Q?qOJknUmyibz1JabsuzH6PAhYUdcsVbOoWFlYtMvxa3owyuXQobAqP4LSpI41?=
 =?us-ascii?Q?ioy6J3sJwaU7SgcAJ1G6rSCgorKCwPBwhp6XF0QSxYCX4lUA4bUcWjztbJIu?=
 =?us-ascii?Q?Q94eE9AnjAphEyVVcyfoUXbry0Fd+xz4Kr5qjzEPEL+JtjHX4K7rUuSF8ZnS?=
 =?us-ascii?Q?JD5K+ZWVRrA6EvWABG7oo8Sez4BOfWSQWEqLZ/SwinScb3zXufjXLNta2Nh3?=
 =?us-ascii?Q?dPuNJ4BwKZexKa3VmLCdFHV9ARdKym/OBb5JHYZVrYBSmHCX7v8BOrApXiiM?=
 =?us-ascii?Q?xpb1yabp4YJ4WkzvT9MekY1JxwS2oxPu+07pxcrYr/iAFss/Jy2b2pkdykXG?=
 =?us-ascii?Q?xuX3gZlpfZJiOmNkXsNhwQC/KB5dh1NDH44sBk+bT0KXK/5F9KOZaawdk8a2?=
 =?us-ascii?Q?6AF0cg0DL4zO64DZgpnS0VJ4QFdOIPGRcZ4MoKLLHznZ0eq6gJI8eK7s+7Tp?=
 =?us-ascii?Q?L5JtDDL1AXlFtid5O3VndAF1T9svzWlhIhjnU3T/F9FPo0EpEAjQaPeWVCZ6?=
 =?us-ascii?Q?7hRS91ceJ8pbWgtCZAYBZYryAi06V59GGMb8XdfCBBFNzDAB0pVrwpy1lcXB?=
 =?us-ascii?Q?jOSDbG69ZjHqNwaqfgHWMS0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ca342e-6912-4134-9bd2-08dd5605b9fd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:35.3172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54M1stMf2AapIKwOSRUZi1kklA+AyX5Vn9OSB+DvtWHHWkA3c4QnFGMIVh+cGk1DpU6RuHuhS8ftobzw3tS/5EHahg4fUKORYNm2TN8VrnaKl0IR4GsOYDNLwtrj6D75
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8524.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index fa9942a08927..403e513f3fa8 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -139,7 +139,7 @@ static int wm8524_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		SND_SOC_DAIFMT_MASTER_MASK);
 
 	if (fmt != (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		    SND_SOC_DAIFMT_CBS_CFS)) {
+		    SND_SOC_DAIFMT_CBC_CFC)) {
 		dev_err(codec_dai->dev, "Invalid DAI format\n");
 		return -EINVAL;
 	}
-- 
2.43.0

