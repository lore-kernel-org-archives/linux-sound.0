Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0384199931
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 02:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347716; cv=fail; b=V8zO8XylTF4ItRIjWm+BAegMAPyQ6JzLiUNP2rSF2VcJMo6MbgNnUS91F3jxKepIgWAUp5Px3BerC1729aDJ7TcSJmQRioGRm6fzBGHClzosXNezLGDzs2Np+R/QRnDob6FrED+lx6i5k5oryotvCmYLKKyaN4ih+kXEqmppDos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347716; c=relaxed/simple;
	bh=KVowuXx3uK8H3eoin2Jk1JZvghuZMkWWTVz4ax4+vkI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=psbk2KA0S/enIA75hKnOsGDs8Y3aTZMoVex4gBWTZVatk8rcBzLh6513rkzG1424QO8547Ysuoaxu7uVpIwEiQQBz4cvslkG5VjywD59cL7SYk1bwrbtv8nR6I3jE+SumyJEyPspltRx+b4ZGkcqqOo34FZxOwaxnO5zvD+WbPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cGAZVZWV; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cGAZVZWV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SshixdOwzoRkX/oUvOp4GzSZ0ECrUtZMXtdhCW1b/dk4U8MKLizMn8HwnI96/4A5ENv3luvG8i1YgT+IjiGS8wKW8026UICPRxdl+laIMh+mNHSZWDGqQdWU/FsLWFiNRvoz0U1jahyp0XgNE9gJha0WBfJGQ8HX/I4GMl/3M0xd8vxeM/9Z5HySSwwoq1zSkjr8VGJJiBr0n6tGyvuGQpdGUeElGCoZgZgy/lYHdn8FAlfBDwJAnHz0so4sdfNwEKWety8oeoL1Q3DQD8Bv02JBs3cru3a8naxStIgj4h2hbAEkpzy5Od9Cd9mCfjb3VBlcOtRu0CMzhh1nu0brhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+rY7mmP5/xkISniUdTkbbU0ho/baPH92eER/sAtT2A=;
 b=YErDha06LruqIcDq8ltQtNYmEM7ChuVImHC6SotB8IUqfjG2MzcIg45O0zOWnyvH31RNrm6KeLOat/c5h62X9sTHFum2dQqvKEs7hvfaXKu832xldTjzL58/RGzTmZugJ+FkFl+oEQl+C9lMFS4seHV4lJ9dXPPbZ8VBLyUjSv/a0gEnhH0qF2hsM2lSbwJc6dRWXfk1g9rhhsD078leQyWsEp4O3MrqdNKIOgfkc119nJNdaldolsnJLaU4pzaS6RxlzndNc/fb36RSgPiKSklD+RhPHsvGaRDfzx62EOvQtv+r4M/eVku7PL7giyVBFw23Euf2bWIknh6EVieLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+rY7mmP5/xkISniUdTkbbU0ho/baPH92eER/sAtT2A=;
 b=cGAZVZWVcpbx0zRc8UHPWUNIhOo7512Y/kb0z80Ev90+AvL2IzquEjd5RdWBAlrkv6IbVklepbRxeU5gpqA0dsixFZsxA2nt0Zl/fCRwzyc1AlusLC96rVZOsp9lWZhrinkNCzxxfl/ceEtWY7ew8xtIHRYrV+tCZ79L+N/6P8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12429.jpnprd01.prod.outlook.com
 (2603:1096:405:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 02:21:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 02:21:52 +0000
Message-ID: <87frdcuqww.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] ASoC: renesas: msiof: tidyup error message
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 Aug 2025 02:21:51 +0000
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eff8f14-5bc1-411b-3bfa-08dde5d9a650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NTEHem0YJEtPaUpaUnqKiJiNf6BhH2xgSEt4I/Bfr11amPCS4ySB/Y4YtZx8?=
 =?us-ascii?Q?K9Q1o9ufKATH5VRDJPk3JD+uiZLx0HTCBfrM1kPSUxvF+vSqV0VVOoYN7aYh?=
 =?us-ascii?Q?uYGgAdPY8asy0Rg0LQgG15hVhnl26jel3sSen5JGNO2fexayn49xKJFR7J6L?=
 =?us-ascii?Q?pPMd2y3vuS2RHnnNXxMoR6162SBwI2Hn/ORnjFOIlDdl1EL/gFao9uSZ+8RF?=
 =?us-ascii?Q?5BeEc0CStO7+OXtQlJsWuYthZzl1b2aENKWlBw5mAUyrl8ICW9FNkz8hEOdJ?=
 =?us-ascii?Q?ILa9R140G9Drx6bQn4gPMfZaB4/dRoOVHBydIA7wcB+Q/AhkleIJ6/jCxn+L?=
 =?us-ascii?Q?kTX0KN8/rSXyr9/CUx+f1K6HDOo9Wl2XNyWX5xmgWBAi2m2J1/9KRa9unkA9?=
 =?us-ascii?Q?8wNI4O0KZp0DLXdlaaSpw0lHIOQyxhVQrs3XVhOLE6hBEQhyvG5YcTxRlvce?=
 =?us-ascii?Q?jrzzEmUIYQ2v1dEzbhGnLFOo5uNs/gPGlsWB0tcoS97G9cq7esEzQuR8GXTO?=
 =?us-ascii?Q?QYKkeqV7klaEw18MBy0UlLrA6fFEzlN2iu8JhLSqOyUlMW72dpaBjR3Aa5N2?=
 =?us-ascii?Q?emViZsmIeIN4QaMhx93zblBwElfNm8dw8eZEtg7jfgcoNt264E1LaIL5XtOx?=
 =?us-ascii?Q?L8yT4abi1t01vmUlEB7gNQG7hEsxWmGHacmX0QR3GQVOPQ09TKiFFYRLpt4V?=
 =?us-ascii?Q?VMuVjfQ+UMoPjExzmLPEyFdLum2XtznycbI382UiikeX+d+lAbinz73tb/qo?=
 =?us-ascii?Q?owOLQtTb+I05DzulRWgUK1o1hZTmb3mvt9r7uJvZwE3XO539yNZSwII6UWHX?=
 =?us-ascii?Q?prtPVVVYkOD8/jYpyDeHFS6wqzxQwojIAF0HlsQVoWk1gHpBoUp5z2twf4u8?=
 =?us-ascii?Q?TMiMHwRf+k9FYOCguaG0vE33NpsZZG5cQ73frqsPDbEAlCi0APytg2WH12T1?=
 =?us-ascii?Q?h80YMIJUJY1CcB01QMM77KIu/5Ieb6kgGI6XxjKeeEybSR0jIWHWbepjRI2C?=
 =?us-ascii?Q?lRzDL5mi2JSv0m2GRQM4A+x2x2tDFhWcDJGM29TfZo0zuTEgTlCnoyysZ3TR?=
 =?us-ascii?Q?Io4CPSJsYsEWjdXB6Xm7f39s4TR5iy1v90jP0MB87Cl/jj0+X+Buj4QecaZC?=
 =?us-ascii?Q?3pUe8+wdYfAq7VhAvLydMyq5EUv51Dwh0k5fHFpm6dr3ZY9mV+LcfSGqYn70?=
 =?us-ascii?Q?IRhU1b+pL1OjQnhiDqiLoaA8XjcmeoY7G03ZtbI1Wey3snZD7AW0O4Sx8MPu?=
 =?us-ascii?Q?ty7bIf/hF08i9kB5QOzGn/bLCGHgS5krPeUFRHAyOawnq0eYy88ZZQ44lBLN?=
 =?us-ascii?Q?eMfvJ3GsdoKrOufJyd3hi3f67g8KM8+Gdwoe98uxhjWtYcAa5yrY0v642cP+?=
 =?us-ascii?Q?MEqyRC8tQ0TFmMmNKGpqE3KRdMAk9XI/xv1gW06LKgg8xoVUQeDP7Uxds6kb?=
 =?us-ascii?Q?8HLNpdXCEVTTIFsLJcVSej8Ot7BTHIUtTeGubqedIOh71CyOxxV43Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WGOmEk2Na/veGTx+oGiAOCxMfQf++yi5IsBKHwqYuUJri4H3B5pEc7bHXIjw?=
 =?us-ascii?Q?38CpJXo9Q0cKelReuRoYirAVksqvZw8Qnk58l4+dfDQBMXrid36FGYryfBVu?=
 =?us-ascii?Q?4h64mgap/lQA3LOn2a4A3NUYD2C8VCcmeiJcWo8LuMF6jPiIk5OiezZ6nwjk?=
 =?us-ascii?Q?DUeRiSHWMhq1qeY4jy1XRTfBqwiNBu7dwRcZ6FRJR/vP4aJLGkEqyU2UTCQG?=
 =?us-ascii?Q?HTjGlBcnjjZ0+qMs2Li+JRfSRCti76NYJDyrgAMethhk3SVtrw/4lDgfbz6R?=
 =?us-ascii?Q?Xlwt3kykb3OjV7FreOES14rwHqwR5uFf8mRWrCP10GpXFGQm8h5r6cYn4+c2?=
 =?us-ascii?Q?A3at7KWwFA+zC1XCORYXWH1K2lSJPCRrMTYpZYMPmxP1ZlAm3PKzsyOKG1dx?=
 =?us-ascii?Q?SZTJGhaJkFzvaELRAfOvXz0kAZLIb3sINmqpjicTk5bVdjile2spYM01YsDU?=
 =?us-ascii?Q?Z5cRzDi/ANaivN+0QjNsUq7EYH5n5+a1s8Q+SZbSIt9nZS8MvBop2SwGucGZ?=
 =?us-ascii?Q?7DxE1lvdItd8PXrsLmxSDhgoMcqqdJP91vY9h2e7aGCuqRzC464nXMN0f2se?=
 =?us-ascii?Q?RQvpaS5VmLL9mwv000lL11qKsc/aVq88oXVFtWMfAh9siFrmZ8790zxsf/3A?=
 =?us-ascii?Q?t4abe3NH6AVLKinkzIOiA7OoHjfKmVXENckuzsHI8SFA+3tio+2fryVQsFAN?=
 =?us-ascii?Q?lmGOzSPAQegc+os77AEspreklENrmjzUqblrWyfbs747G9vFmfdKnDvzbgJQ?=
 =?us-ascii?Q?j4eEyXEa7zT4z8fShAxkYD86+X1xkOq2KIwnmeum5tNgBl5mSDoprlp9B7jC?=
 =?us-ascii?Q?PkbT9ULLqDLZOh0oaID1TWPIyUzTn+qYc1IA32icPfRPjDuQNLJv8OI63xMm?=
 =?us-ascii?Q?EdrPq76ZGtHZAzcdYzIGX9A3q+C0vzk/+ttGK85DCvfHX0HBtdXepuAbca5T?=
 =?us-ascii?Q?KWAlVwv8wYZgAcw+xWdQ4eCI63SCOUpkTpa9x8dFPgpkdaRHMe9qkXq0FrqU?=
 =?us-ascii?Q?e9VBblx9f4c46sz2SzeLPGb32ks65ZzYbpfOvWFIp5wO4qVgjlBqBeUY9OBo?=
 =?us-ascii?Q?UxWp/XyV95xTVC7UNU2biHvkizLFVn0jUzi0L7En3ZzH38nwsVjIARo8P4gD?=
 =?us-ascii?Q?Km4yYUBeruFoEdMgFrdglHV86cYnDnmorAZdK45OMu4Itqwr5ujBumdZ5Pa2?=
 =?us-ascii?Q?Gd6FMkfCyuhkbkO+dg5SczHTLjCmqrRuvrnOF45npmtSGCO2GZ0LetapPwFf?=
 =?us-ascii?Q?WIHVr32pDPkkLERpwg4oZCDXwnRNHuiVG6JwKcKJ10yZQkqAgG+tqjeaBHP/?=
 =?us-ascii?Q?2y9owsLl+wOf/LaOuzw7+OTW86xyHn6E6FYieuTFr12iN3Fv3R1c3mshA6Vv?=
 =?us-ascii?Q?0MEHOQAJszRy+vr29dYrKzMJC8S9mrwe2TqxjsFqcu65EczJ5GNrKAPhKGCu?=
 =?us-ascii?Q?4YmkG0pG9jZ1YcdkxBVPeWVHtoC2e0VFF3SwJjS5vqcQbFP0l+tAl8Y/Gpaz?=
 =?us-ascii?Q?1uYKqZODUB1jJjPOxJzkPvKDoPneT/H1Tore6o+azeqIL41Hqw7nXD1H/i5F?=
 =?us-ascii?Q?4W9/V8t/K2nD3yaXhrCHnJYc3eIDM2T6FfCjh3U8qB/Jk9oz5Um5o9i0bbBp?=
 =?us-ascii?Q?dtmD0ApBJWkg+gtECHstEOY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eff8f14-5bc1-411b-3bfa-08dde5d9a650
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 02:21:52.0176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eu0vhUhlYa0Fb8ioHbN8eaQc4wkemoXa0Hid+8Wq3oXIEsWxF5eVQQBtI6DWsqhMWwf7xZ4V1Kyru/hrizxYZLq0FoJagKuotQZpmGRjcFla3h4/CvZgQ5X3ehveCNuM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12429

The meesage was strange. tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index b7633ed3e3f0..56bf64e55ba3 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -218,7 +218,7 @@ static int msiof_hw_stop(struct snd_soc_component *component,
 	if (priv->err_syc[substream->stream] ||
 	    priv->err_ovf[substream->stream] ||
 	    priv->err_udf[substream->stream])
-		dev_warn(dev, "FSERR(%s) = %d, FOVF = %d, FUDF = %d\n",
+		dev_warn(dev, "%s: FSERR = %d, FOVF = %d, FUDF = %d\n",
 			 snd_pcm_direction_name(substream->stream),
 			 priv->err_syc[substream->stream],
 			 priv->err_ovf[substream->stream],
-- 
2.43.0

