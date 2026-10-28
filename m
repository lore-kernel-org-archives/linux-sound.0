Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156575;
	b=QOa5MOxTGggjNKqwhHTfXc3+js682G8neTFMG1GyF7EU7laVi+GaLVbmpnGw8CEEkbjq
	 +zEIMOlAB55KLvTeUNC57z2dyekRRz2TJ//UbWqjcL4dJUbfLzuQiaKokvNIOSa+fTzEp
	 SxUKYPkdG82wuvPey/BVGWpBnZF7rWr14cnY3NdaMJrvJO53KbY4jb9gzxE2Hnj1AbZQR
	 CyoCVRGNGlC5Kr5ivQ/7nlZ4eyHMoBcKTsFWJbQVSEjAeMalYTUOGF6LTaUqE2vq9QnkA
	 xhRZfLQgf4sWhvGf2TeeJDOp5vNpQmDWrsQtEvcsFbgdx3gb373hCOutehjqr/cJh3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156575;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GcHAzcVVk4NNUGMNo1jAwrDPoh+fiCQexEr48aa5KUQ=;
	b=Mxmtlu9XMxqovvmXMDdx+XfEKDZb+5+rymoD5p7Em2Iv3tbLBRsTqbJV7d4lyi7i0XTU
	 +D2UQ8laxcnrUEEeeQcogGaUV7Ibyrm+NWKy/Mm1I7z2tX68RCQR0iBgXl/doa62ez/qC
	 oQqAC+VvCKmUtp7ofJbebtQq8ZNgy2FOYb0iYdJXPbLqidlto/04M13LGIVFMG+j5M1m+
	 qnKbrHJrF/be2JicPAIlORdIV7AAf3Uk3o5zFVCPJFZXH5/cwuGrE1oeR8+6pAjcsEEg7
	 EN1naESuoSrIc/aeHF+JAFndq4y86pg9JkKkLHtd68Wc9WSFUci0k4z6kAXcexYja4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Zg0s6FtE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.5
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7244606A32C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7244606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Zg0s6FtE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTrJCCmulkd587PnJQQm91vfcZdx30EyXfq+MpiFCdyUhymG8gCaE3HlieILnS/Pihvoq8zYHsAIAxQc4cFpTHFuQHg9wulWohBHe6Z5HZxwy6spNba3No12Bz+wlqGiczMARikIbqphifMCD1Z/32gxSCVAoH8rHkiVv0vF+xx63Fn++F7EYr9ulZXKQyTDE51ViAqfAONSi/65SvR0DMJILaaQAv9kuQ+mxJRa7Y1PaNEOfK91k0+Mk644yPLcc5/Ad9LbEhkxEuB3fjkWbggElmmWzJSlzP78dhQeO8nhtbsNB2fCODRSM9rBczHJPwGMhZhW7gplris9ioQbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcHAzcVVk4NNUGMNo1jAwrDPoh+fiCQexEr48aa5KUQ=;
 b=TDOHni7uk5kxvFR18aq+JyVIsdQ6WktrW4hURiQwRn5ts3WBPaUrvjsgu3LGGFErmMVCD7ETKlbD4qctl7QCN5Phs//LNVA856UpVE+z/mtXrx+zzYI0Hu5IH4q+Go7jNTqPz4l4V7k0kELnHYJuH8K6SapOeD6c3jIr4GiSigvEIvV7vsOBa2lB233wAnFjGBYgpv+uoNN85jdXgvIdoF1k0vdY7j5xv93YFsKD02EQlt3pv54C8jqiHMFfMOb9ag3Lxs2Db9BqldxS40sPGXu3YasFox9ke6k/BY05eKEugobfrRmvNlGUPDNHPtdbmBlYTnfIFV7jOrq06QyetQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcHAzcVVk4NNUGMNo1jAwrDPoh+fiCQexEr48aa5KUQ=;
 b=Zg0s6FtEaa9I5OkH3qVvOhKPdRbA/MoBaZQpEC7nZ/2D6C5Ykl7r2DKJ0oS0HTJ2uhAUwKSFw6o0LUEHodN7a499LUvqI0YW9OPa8XihtCi4oApVaU8lKgJjhWymt7GjacLjpwxox/gsi/AKLv0pRgUUjmh7PKAd7kyTGIorYAQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:02:51 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:02:51 +0000
Message-ID: <87a4nyttlx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/15] ASoC: soc-core: fixup snd_soc_dai_compress_new() return
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 03:02:50 +0000
X-ClientProxiedBy: TYCP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::20) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: c51c827c-bcf4-4c36-c65a-08df349ff3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|261026140227099003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	NQvcRSvE5lBff4gOLRpmYJmVFGUfP+QRPTiwLeMZtyiaaDWJ6has35I61h5HPEzEAMdJJ1sRiq2h299xcQGSXEPqcY4ZCMkmQi+xVJoziNBTbr4XRgJOikz8HG84HKNzjqlUhlPIaNLDvQaCOBlkJZJXlvx0qcyp+SQAH2mORWVPgbqL+aOg/tqgQRQPs4MbHTOIDO4qqw5zVey0P/B6IfXem+/wOCtiQCRVEYh6Pp6+WoumD8nUAuqRfUJ/9WVMQ/c4CEtwHBbrvVlQwks9rsg70k9Ykrt5m6g94hF61IvYj9Y4+44msb9mgngi7PzQhM7swywzxYJ28aqcXQQ1qjeBbbDrmtz+78A1R62X9pPh8DZy8MliwlevL8jGbjpuePWwr6KhaUnE8n3Q70Tgt5iwpHMD3FXtpx+N7hTOvHekbbFL6599ttdnIoI6i6B/xg99HS6Gbmg74Cmc2iR6O21ENORVvaSsXwaa3YXuGKBpKcthfhs0+SGHd6VQne6Ayo7TvR+//yEQCZHZSWi8VBQ53fzSET4qHExIKai8iLqCWucvYrqL2s1IUprCtN9GD38HtGSQGQEjAwYZemTFJI5R0Zz8v6dJI11ecmd9AzNiBV8/cERypgBc0e8F5xxEZtvsahAD1Q7ns1Vdwy/HpZIGtDXBshKVHIhKy6sVhM1sQeJQRYzXO+40iU4u3/L0POT+MlPuidlFb+VAYXpb92OvlsrRCAsmwjkcVlNfh8U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026140227099003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?KXWe1V6zsHMPWAfZ5EpyXEtgdG57gKfDxYJVDFiM5kkTafvBVo2x1Vb0LA?=
 =?iso-8859-2?Q?62K1J6NdkTpP7FDxexlR6Nk9FXZtyUOUl8tiai5Gvs8I1+KU/CDK1/Lajs?=
 =?iso-8859-2?Q?MdCLtP7+ylBtrSNxuTLA0epZ1sbn3ZcIy8XmX64k2VG8bbeOMbQhOcroLT?=
 =?iso-8859-2?Q?MOoNlpeNjLXc6iRRNyUtD1bjSUU44HCHdrqYTljioB6nsCdhLs2O0zevo1?=
 =?iso-8859-2?Q?Wzt/bXp8Vu8xw+BtTzlFDP+IuON6NB3nAkSzzE/d8Fm/84VoGa3+Zl8yEc?=
 =?iso-8859-2?Q?yK3khyAOtbDOcDTvB8BKHxT1RP4EWGP7xA6CH0b505ATjDIb06VjiEUSXd?=
 =?iso-8859-2?Q?yYb4jYflkuZ2wPn5m0PHj5LBWF02+Of43CCdWWACMmUDW+Oq0Npqob3wC4?=
 =?iso-8859-2?Q?hz0C8ttltACthy0LizCAbIDcz0b7Xr2ozDytkANvURex1m+4t4cez88jnx?=
 =?iso-8859-2?Q?qPVsT5BtMutv9xdgj6yXFjHa2M6k0yIENmi2VhzKPZ2NYmRdJqiXnjJFtc?=
 =?iso-8859-2?Q?5gdtPhNGX0wDIhKQFXgQFtLp+hiZepHdePBYKbbwy2Zrk4ojEqBX2rrsHd?=
 =?iso-8859-2?Q?8v+PEgBgHEjqPM2/1NLpk5B0qPdaMJMUbEaIIu5mhlGURU33JQK2orSLma?=
 =?iso-8859-2?Q?bXmJDOR5EnR+3wAIXiz/a91xx+PVGjFNmOKwd+JZnHkKP8UjlQCX6679Es?=
 =?iso-8859-2?Q?JbH0HVA15pLOkfR19TLYaMeoB+Dphm9UyW1uF6LGprP4G7PJ2I1t0/0bpw?=
 =?iso-8859-2?Q?2W28ZArI2I9JZgXoX2Wzk54M0t/a9zToBzdzfSETQOPnAfr0UX72WIJZaW?=
 =?iso-8859-2?Q?Bh/Lpn1HvYU28eM2uyDytsNsKU42CmliD5LgPvxSZolLxfGspzyb4R6dw8?=
 =?iso-8859-2?Q?XoKuu4AtoM7pkwOz5jrmi/JIfixXiNptJSlmOYJMXFopC9d+Y5ggl6I3nx?=
 =?iso-8859-2?Q?zUUb3KFBDv57+ssiBfPjA5BvL1fYse6yKkP5eDZtpSb4bFCKp/mtIrJOTo?=
 =?iso-8859-2?Q?jo6ghBkL2Cqx+L1unU4Sz1tEms+vE3r5rGg9iAnJrquPcIR3Gtssi3ccoT?=
 =?iso-8859-2?Q?Qc5FcxtXJ5rOSeQpkuOEedFaW6f/6cw6KkhL0Z1fyj99EixCdrt5xIEx1c?=
 =?iso-8859-2?Q?lf3/uGZ//p5Uk314eymEv6l4u5LRDtc9dwDq9nere0Mv4UV59IET2YmwIo?=
 =?iso-8859-2?Q?HQd1t3dbnoYnGz6R/5xpaun4GFY2Bog2pCjsl+UNr8JWfsZ/FXHfrO2dGH?=
 =?iso-8859-2?Q?g6Y8wpcHM/ER/ecrU3c0O1BWiuW6o487yZhw8GNnD3rM/W0/BzRGE/HVYQ?=
 =?iso-8859-2?Q?nI3MEUu+e/HRbmaJ82hZhwuJ8MR1C9Nu6N1z9kCtrdZp2Opn1aD6VQMTwD?=
 =?iso-8859-2?Q?4J+9vH4OlRaxEwgolqwCMK5Sx1Do8B3rpXfCMHB4v39KY+lDjQs619akVl?=
 =?iso-8859-2?Q?hlyf/8kAu27r7FhVs3SGTyFfVvAesnGx6clGk4P7KzRp6+Z55ZcdItNX4q?=
 =?iso-8859-2?Q?qvVV2pSMwvIYxFWfCAQmIRGhG3QnqNA3Xy8/ju11y9tjT7Uyv5Zre3nzh4?=
 =?iso-8859-2?Q?yVWyFG+8rEnizf4vex4x7LsRrytCM9lbx4hN4exYbiXQ4ZdFqddavnNTqW?=
 =?iso-8859-2?Q?bS0hFKtWVqVtRPMVOhstfwiM3OTQJM3GFuxlAuvrvmwIlXopN2N3B9lj3b?=
 =?iso-8859-2?Q?fGmcWGHEQonwnYuARZSE79Zh0Sq4QQ5i+ywkx4D9fXfTrlX0ausTggBksZ?=
 =?iso-8859-2?Q?2CN+wF9tOBxe4E/KleNajwz4+t/zFfSzQuBLSf7yxg4GqtXSCMMVrBTKrP?=
 =?iso-8859-2?Q?xUcz2LCNtiduVo7+mZgKjIoT/hnFxPo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51c827c-bcf4-4c36-c65a-08df349ff3fe
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:02:50.9247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n09RZzSC5KuMY1PGHn3RcC3I6fi+usz4wkxs5ClcnuYN+RH6gVh8tHJq5n9i0B8SFErGcMJYbeK0nxZcWZATfT1PffE9RXwUI8MEXs9XwlAE7VTypu4HKkP+ll8NH4Vg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

Original snd_soc_dai_compress_new() return was below.
Here, snd_soc_dai_compress_new() will return -ENOTSUPP if driver doesn't
support .compress_new() callback. Will return handled value if
callback was supported.

	ret =3D snd_soc_dai_compress_new(...);
	if (ret !=3D -ENOTSUPP) {
		if (ret < 0)
			dev_err(...);
		return ret;
	}

So this means, it will return here anyway if driver supports
the callback even though it was success/failed.

This was updated by commit 62462e018220 ("ASoC: don't indicate error
message for snd_soc_[pcm_]dai_xxx()") like below

	ret =3D snd_soc_dai_compress_new(...);
	if (ret !=3D -ENOTSUPP)
		return ret;

It still return here if driver supports callback.

But commit dd9f9cc1e6b9 ("ASoC: core: Do not call link_exit() on
uninitialized rtd objects") updated to like below to call
snd_soc_link_exit() if error case.

	ret =3D snd_soc_dai_compress_new(...);
	if (ret !=3D -ENOTSUPP)
=3D>		goto err;

But this looks like error, but is not.
This is very confusable. Let's tidyup them.

Fixes: dd9f9cc1e6b9 ("ASoC: core: Do not call link_exit() on uninitialized =
rtd objects")
Cc: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
---
 sound/soc/soc-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 97269b4ee4ca5..1c3ed2975cac7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1184,10 +1184,13 @@ static int soc_init_pcm_runtime(struct snd_soc_card=
 *card,
 	/* add DPCM sysfs entries */
 	soc_dpcm_debugfs_add(rtd);
=20
-	/* create compress_device if possible */
+	/* create compress_device if driver is supporting */
 	ret =3D snd_soc_dai_compress_new(cpu_dai, rtd);
-	if (ret !=3D -ENOTSUPP)
-		goto err;
+	if (ret !=3D -ENOTSUPP) { /* driver is supporting */
+		if (ret < 0)
+			goto err;
+		goto end;
+	}
=20
 	/* create the pcm */
 	ret =3D soc_new_pcm(rtd);
@@ -1200,12 +1203,13 @@ static int soc_init_pcm_runtime(struct snd_soc_card=
 *card,
 	ret =3D snd_soc_pcm_dai_new(rtd);
 	if (ret < 0)
 		goto err;
-
+end:
 	rtd->initialized =3D true;
=20
 	return 0;
 err:
 	snd_soc_link_exit(rtd);
+
 	return ret;
 }
=20
--=20
2.53.0

