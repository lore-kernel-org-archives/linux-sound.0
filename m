Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB2F9D9
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 04:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775709451; cv=fail; b=E43VMLMjMkMT39bLtl5kIDFZqJTW+y48S55nejNYuRax/HP+4Gh5s7jOdovuCH5wGBTtEngRgIRN/0JFb45ztUOboFQ/CSQAlmAs7UFNL/jmdTchYuP8VGgfdyo4BmgoxP0DfAni/pMs5E/etPssh0WwDsEobEBrs31S/wYBwXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775709451; c=relaxed/simple;
	bh=hwQc7hN4q4FfKA5tdj1BY3vMFi1NtaMRl8hY8yjCbkU=;
	h=Message-ID:From:To:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gS4JsqqvgT+fS+hecyD3cyvsjNyFSdlmEowvuAEuThRd3S5R+dpmvqnWapT8iYiEWG/+ywESRxSqR1ACf+iBbBuss+vKFy3Lr223S7A/Om9Q2CzZFUPggO4sDdRQs1Ts2IQAIrsZx33d3CKroNnJ9ZLmIrx6Zw7BFeK+2uAh9VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o1rMHov3; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o1rMHov3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRPuDMSOFPhDK6RA4Wjv3vSFF8HU2FEehSDFCzHfRMkepTJPd6b9VLvBWmPOsBzgQDjXUsk1jDo7E+YDnZAxZHnOowXI0RcRXGVI2NMVqHkKkmyu9BpK9hewQYWFSvw7ljevGaWzd4c5GKIwuOI6cLipS+uQVwBNPB9GCNsoDcNxP+7M1AzjvDoftRRWc3I3o/LcuJtiPwhxgmM8Io8ViTNxXPGL3y2rRbDYBEMYCJ9miqMph6n7KQ3F3uSbYB6W6Hln5rEtOKLM7PDP7DctdeLNAJdAABLxE3WDHO01X5w0GoQgU7awzhcGrhv8xP1JCfNLMQK3FFyhD0uzOJahjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgtfNgQGTgOG5+jsU7nzJzEtp4SKnuR0siPenxaXG8c=;
 b=kvqFT1kBDFSQPy3XxsDDvVxaah1WJrSLEFF/enpWGYqLdbrTbLrn4hxVLynm+1AGXcCXoezld28WnhrqkV6OWSM7RRO7YciIH3i3ToRewRHWnqgw+G/eYHVKrPvh5IUgUq2w9EfHsH+zm/QkNC+gFiXDY0tPD/ddjnnOW2edjoizWGaPRJadMrQyJWA50HJl10iFnK/mBn41W/N5M+x51Ek9ngiVNBkWXCJt/F5+BlAsmIbitBJqlUp0D5Y6Edog2SJybfgAtt1tGl8WXdFQ/VxDNVyCyL/3uOcg4g3LuDFV5BkJRJOfedIfVoMBcRX9Foym/F4wNCq+i2ZVYHj7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgtfNgQGTgOG5+jsU7nzJzEtp4SKnuR0siPenxaXG8c=;
 b=o1rMHov38Jf12f/b8aNN0LYTMUMegWhXhxLaaCV7XCGFtreTyh0qGVgWwZB8SdcjWXGvJOF0rovCio3CX/DBTQkRO7VmYD/yE6pLYBiLqtJlIiyemAE+t9c++28TkJ2BVOhAm64NgWmBLy7HEiQ5rF3Q0LiCjOl90kpGnZgL3Zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB16304.jpnprd01.prod.outlook.com (2603:1096:405:2dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 04:37:28 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 04:37:27 +0000
Message-ID: <87eckoda0p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH 2/3] ASoC: cx20442: don't use card->pop_time
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
In-Reply-To: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Apr 2026 04:37:27 +0000
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB16304:EE_
X-MS-Office365-Filtering-Correlation-Id: f53bbcfb-df6a-47dd-ffcb-08de95f1b431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	DV8vIPhFCbPz6O2sZG5b+kR1raEG+fWRr87juxAz71hKOtARofEAo1gAMyVK8JNTiq5kTipAUw7zdoh4vvGsWMsmOE/WJ5cdoAxTquPXXeopBsNYOuQ+kAp8SXCKmdMGUozvw67s4r3/0RnR13lfYSUI1koAGxEpIMSa8Sdra8Et8SvbzpMt3GCLlPq0WdaOSHKp41vikeQij1+xQb1gVVEb+bbtWY+KP939yKq4r+qwFG2dABHX1HtyTQm1G5Nyb1kaOPGn2+opjAs+SHkFMGsL188diqZpkGrFLYqwsz4DdlMqmRoZcWtnX978kpuxcKXFr+ak9KWpxsqg8NcjKx5Fb1DikTohEtYA4YzwgpclCfziNA7OqXFtxC4XUNYm7QG7D7QP+RJ5/mnuotnVgtIPhEHFXoAZNL/rVK/ht2C8Ms9N7oYovrA45QU1O2ofuoQ+jRjbvfVt/B95ypR9qOYIHdPLcTuIwmynsKTMBKakDWPRp4Cd8OybW2rXXH5Fu/Tvm2G5SuBT2UTkxMjLUhZ6v+LjAoZmjqfvauLs9nU0NmYELBMh4D5hfRcUFMcMclLDJcdl4+tn0d3EKzUMll26lKoeSz77ol28rT1HYH/8u98+ihHjVIbn6YPGpNJ4rrP1d7SeTl7V4hFR+S907BEruhJvbq8nGQNIWEJve+ZyYJWBRJUrj0DzNvLIFl0mPIA5eRErIQUiM+056k8elynMttb2HOMOMWZ4YfdtVDuUkaTi5vJtf/bQEX1XBSS8DpHfK0taAhJlUzi151qU8yHUCGN6L9PTAkFP+itynIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rw78RXZSdSEFiyzxmbEAYRDxftJ5EinlE6pY1ULRPETCS+WAbiV5VAVEUroY?=
 =?us-ascii?Q?+XXqzDWWMpo1Nqcrpv19/ZOHgFFMkK8GOZKuAYVTGzwVO5bwej6zqiffr9ao?=
 =?us-ascii?Q?Ly8GFHWZ2vc6q4J4PTjiR5AS2x6g8rbJqHTnKXIetaG+EAksLBCLwNvWVYtP?=
 =?us-ascii?Q?lf/rDGOJzESfQ95u0T4vYwZehW1wj2igV6+bPKinHFQgn3dMZy9aDiJGebAd?=
 =?us-ascii?Q?z31Rq2PE34z7KcM+0hP2E6Y/zGY25qxSHZkNkggAOsGcunoVfHQTMDmPdJJ6?=
 =?us-ascii?Q?Jcy+CdqQ2LtDKnvX1HEXL6cNrmHlJObvkMV+Iya9N9P++O0BUD9fGNnkmH2u?=
 =?us-ascii?Q?ypbPjlj4pSg7ZReQeM1tUHfjGo3N/4PLTpXxGOz1OsIfCN4AKcmXJ6IHaOyb?=
 =?us-ascii?Q?9nLiZPVgzpzJM0BgzR0W3lmlz8zQpvv5AJLWYMH9NXiOSpyRXm7S4Gp3Rozw?=
 =?us-ascii?Q?Qez7A9uLZ2BmCmEXxxZDyZSetJCHUieIC609UF5tFoUNh0CwhgLAf20KKY+y?=
 =?us-ascii?Q?MLdu3iXLGWzvHudfCzSxqkZvI7EU4qr/qCdaessaEDK0OJT1IW1Gl0h9JZHq?=
 =?us-ascii?Q?uLuJ07hy95y8Jbj7TEAdxouOnXXOn2qVyewUp987aas/OaYewG/t0PhTCs+Z?=
 =?us-ascii?Q?up+CcdsrQ9zeAvPmaufoK+c3xTQP9lPiOI7eCuJDVdajNBQsic0Zpf32lnoC?=
 =?us-ascii?Q?21nteRe2eBTGWrCEauDjny76VEkFensKMQVX22H1s1uMIB7aD/3gEkKH/fDG?=
 =?us-ascii?Q?SkDx7vX96iH2xuGSeLo04RB8w8hxms2lWYIRH6Rk7GSXKI48rL1MayX1omeC?=
 =?us-ascii?Q?y+HiXAljhVUWYuVF1oUCk43C45nECznr/zNtLSp4jZ15I4I1wivWlRIzzKdA?=
 =?us-ascii?Q?n31J8UzXAzDfYUIbBpt7+IA6txeFSiS+kEnrbYEE2pQYMsMMDmsBFu1rSJjE?=
 =?us-ascii?Q?CDp8MN/XuPtdFS7aPpjP1hRzbX++zz/JAjcxFbeYC/h58T6eqY5kRk2k3IRQ?=
 =?us-ascii?Q?xH/giM2VFsVrDuwfDii+0uzE19q+PCsP85FGCzzdMtlTDDKc3+PJsdmDmv2R?=
 =?us-ascii?Q?S53tSXdeuscuwdbw1aGBnjkbwEcso06VtEjmdD8AdBcYVASip4SW51/eLYcc?=
 =?us-ascii?Q?kyHQP/BKQHYUDiF3YJBaMF9ympDvWSHa/QOvezSV9H2mGcA3VqKBJHAQYbMQ?=
 =?us-ascii?Q?CYA8WIZrgo5fS83LMNcwSBIzMmbwBSieU+OwfILsshD5GDP4J5hZ70fCA2VB?=
 =?us-ascii?Q?FJpcUQT73VOPv1szp3gbVMLvUxi4JchJp32+Jsj13AbYyc8V5Xl8cKr48PB0?=
 =?us-ascii?Q?V6inaqYA7M1SvOsXAe2eMOivF6O/rjJX5v/XFhw+k+IRVJf1gdkzbdJ6x0/r?=
 =?us-ascii?Q?My8rBhTnv/ZiORJdNjFbb1BnU7bHJ34g3Ad0iIEOPTlTHEhOo1XjwvCRRBIf?=
 =?us-ascii?Q?4jxXJT1jXao9ViOGtIT+zT80h0GK11sm6Dgby9n9WHfA7JK3mufguTiHU5xA?=
 =?us-ascii?Q?PHnv9cKopQNo2Dh02USjfdcHe7/stLbPj8kUFpkc2pYrnsnG9y+IUc5aP/SA?=
 =?us-ascii?Q?h0QKmNeWTksn5vItrAHZHErCmXcPU9N+zAkFWnGcU0BMiKxbxr1QeazQncWK?=
 =?us-ascii?Q?cDCi/iePTGQJZCIH8y/RUAJkNp+l9X9fGklD8rm2aLmQq+h3IYL+AT2chLEM?=
 =?us-ascii?Q?XG3dEygh8F8qv2/E1xCtfLiSlVGDQaw2lfxzahORKwZRzkkcN40wa/wFNDhZ?=
 =?us-ascii?Q?J2kxccKq/abIFKoqMQuhzlxiXTqT3PZLXRShqowIp5bzaavsOZwJ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53bbcfb-df6a-47dd-ffcb-08de95f1b431
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 04:37:27.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITdnISvpFZpZxWaTg5Tvt2tJGmlSIGLG5VyLo9HaGCmk7cJWlaPNM5+pOjCIoiAqCLqGXjZVpbvUZlchNucS3y8VsY/agcJr/4BX6bjZSRlg553iQX1NIKhyunA/11Xa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16304

Very few user uses card->pop_time and pop/click stuff is much less of a
problem. Let's don't use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx20442.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/cx20442.c b/sound/soc/codecs/cx20442.c
index c0dc69ce4d0e7..daf3235eb9337 100644
--- a/sound/soc/codecs/cx20442.c
+++ b/sound/soc/codecs/cx20442.c
@@ -248,7 +248,6 @@ static void v253_close(struct tty_struct *tty)
 
 	/* Prevent the codec driver from further accessing the modem */
 	cx20442->tty = NULL;
-	component->card->pop_time = 0;
 }
 
 /* Line discipline .hangup() */
@@ -274,7 +273,6 @@ static void v253_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 
 		/* Set up codec driver access to modem controls */
 		cx20442->tty = tty;
-		component->card->pop_time = 1;
 	}
 }
 
@@ -375,7 +373,6 @@ static int cx20442_component_probe(struct snd_soc_component *component)
 	cx20442->tty = NULL;
 
 	snd_soc_component_set_drvdata(component, cx20442);
-	component->card->pop_time = 0;
 
 	return 0;
 }
-- 
2.43.0

