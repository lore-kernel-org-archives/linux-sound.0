Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443586;
	b=Eh4wMJSnJ8F9YHaarmRvbHhiJpcjf1rIpb3t/M/ZS2cIuNU7KJ9BPX/yFZ1SBfCRN8Wr
	 HsotZSn6UCQSOdSO/yg20VuWThHZytdTibX7xoL4Kt4dVAF7FLm03JS1nsD7QRn/8SiLm
	 n+NtNd2tEhYru2X0URLRO2O3gr7CeGDsQgzxsyyDs/LL6p+M4NgPziCFC/a9FWSumCWSH
	 Rjo56GnVRvl2l06LTQq4BIpZlGCajzhmP/icyWLoj2ieHLJwiK/ULRdKPpMQYA70pPH3K
	 9DjU1Niigup+zdl5P5O8oX7R2X028eb5MItlGDrelsdk/fMAHzZUYUHQLMeiUZalp3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443586;
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
	bh=0rhwpiQrQGQ8+CXhFzdCtCePrZjGUKq/9HnLKqAJVns=;
	b=iEhJs0H6GElw9t0xCHB+qIGiHjIakC8umunWdMMgocCJbYd8wvb3FdO7Q00PUMRSb2+R
	 /QjvnUUlNmwBUks6ibrnBMco34gFS+ZcbdKkSdpEZVpmmT+M3XagZqnaXBh5Xs27kYMnH
	 f1d+btSJMdvW7ijmJRCPt1d1nj5arnGPoJkV0/S3aMNDdGG3lSrWu0WenVzH2XZIp4uXf
	 JnSXaycrs769wpE0IjDRLUOgGxVrhGg8kei+5yZZ5G0NFUb0vjt4xXwoPGvPPn2XvcN2b
	 61Y76ww9EXJLMDIZwahwdz32f9cr3hxG5/Gyzo9zvv7CiaUQNilWptPPiP054ibsPgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=LifDhbMg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.41
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84AF606A324
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84AF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=LifDhbMg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+q2jZ8lCTrb9uRbYAGGRCZvypiJkGy5PcOf9nwM5FYE6Ai99GWNLqS2/dCgT6gaipYGOvppiajp6XQuo2gb6Uhckc8X5/F9GVMPAEQn1nHZgBvLWZdAQ0CITpJ0EzoO4uovSqV/mZG3C75nChUnD6JCL+ixB6efiltYydq6B6TbreMA30xW09QMJY8IaBz/8tRPmnq7Tgl9vzquIEehU079gd/4+e8xgB3oF+0sQcGmuhq+s5MsOuUbuQ0TAVgEsavdPQHmzO56pYJ8qYtq7DwexdoTgpzhs2UsnnMdU79aOuwmlAc1jAV3Yznedw6sM07Gl1mcxRjeT9HssOmBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rhwpiQrQGQ8+CXhFzdCtCePrZjGUKq/9HnLKqAJVns=;
 b=G68w/r3qKCQMRZpAH7bM+cvaxuzCDNUHEzuFBnqQl7OB2eqPUpXl02SecVQDOjMvyfQ2pmAYfsugPRZKX9S8HChjFuXrPntE3u4EMkvmAyoKEizaxI4MqaRFmavQXxGdQxIySDcmMi81LPdmp0oXGRZzb/RxZxaz5rWseV6a9eGlB0LcIazLXYXnE/x33bLjpr4Z+j0rnKSPUeaDCU2aDmOYe2EkdsQxwUu2cLaK/kc+C6IKfnwhodesnmzWx5Q7JUmApLXV3ysfjADBajFKN/Lxc1GJIgoMn3JwfHR6i7dstUenFNBube8kCuCs3zpMAj7qFoSjlKc0kJ6W/l4MOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rhwpiQrQGQ8+CXhFzdCtCePrZjGUKq/9HnLKqAJVns=;
 b=LifDhbMg8Zt8lVN0ifaQjOVpHW2Y+sQiF/wDwaVGUMuQRFX+BmIPJrud4kqG2wtkSAWltkcZaJeaojUign1O3CkiKOck/MZzgq7U0vQ6dmIqF9FWAA8sRWyZVkoQ56yySG6RoNR38VObmdCs6+7AUnYcdzEfmDI7MV/u28VQ9Zw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:33:03 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:03 +0000
Message-ID: <87cxsa28jk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 16/27] ASoC: soc-component: add snd_soc_component_to_driver()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:03 +0000
X-ClientProxiedBy: TY4P301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::6) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eb7f49e-881f-4084-d112-08df4054836e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261102123227099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	sGRjs7U42cDf+HJuBwLxdGIlQMgoicRniln7bDmvSXrNsSV2r8iRgZHls4qaLwBqjUcDAEvgOu9PzwhYeOiVudEiJYOdo/jTyvg25x+/zo2g0cCqhFWSkpQ+eJPVwwv8uzJL9lcPBYSrR11t4Mjm8XLx8miXZexNBpT9e0zU4ykdLhMICBbFqXZplacbpPiaItjZwTK5UIxfkD+d/XPMxmHmiNH5x6h29t+VZ2z/DvtVyIENVe68Cp2MT4RWSTcUiOmtniUl4jWklpmek2Kg8VXnR0jQus6wgGjsG6DqBXhjrvm6QVao1D7lHSuOjD7KcvrnPOE8UwztHwBu5jQr/GQUXRcP1ch5iqtwUwIKUzVRw6rky0T2sh3/K5G3leewkxSbriakd4H+FEn/GV7mYb7StIc2fiXAsCFGghmVx3ayaypvhEsrx3Lyl6EKBvRe7x8pbsC03UVpgmS9YUC+ROG/qT2SaZcEQYcVSX93ypKroWu10uGkKypGtuoGb8c7cuSC1ByxkmTEjtlPcaCiVgPD3dXxt+1WHivPhggdtuYoR6rc57wqp6cp4WIZk5qeP2ZDtwVZugAJQxPuVgGjRrkzzKp60lkHxJEQ7osHeeo3CCaePMnVphw7tq3pTHejJoF4rThz7QkG3FVDfLSYIyxaxYoWgrolAc5X9mFk+Zg7yPZWor/jplTxg6Fuv3oOv8UA0PKcYRQ3R7fol3HLXZ23aYqplY7LQ8RmlpZC/B4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261102123227099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?Es6EOB6YOGnM6D/QX6CoLWSEoHQ2U6wxZu+5HpFYQdatHWgSn5+dJhDq/t?=
 =?iso-8859-2?Q?Wl27Nk55R/yQc3f66ZWL76tQtpKePpPysRtMX6iwrA9TGJDsy1/mbItNK/?=
 =?iso-8859-2?Q?4eERyiJGP4kz4wCpj3rpFhHyF+eKAgmbg9sQYLPC/SoNFPPzNHMtKHwCdh?=
 =?iso-8859-2?Q?6LC7LT0XR8iha2vOljNNBGkwtXjW6o0owmLi64G9GZR7R13bbyeV9CAWqU?=
 =?iso-8859-2?Q?6omrZvHY1xaL+ranBqAEi7U87tiGQpnTNJRe9W1P27ALLyqIITlvMHb9oR?=
 =?iso-8859-2?Q?wk/PIKlQ3mw57dUUyh2H4tKpqxYg7mp3isjUIT7dgzmRldZ5wypt7Hc4M+?=
 =?iso-8859-2?Q?nNu/NpisMOj2E8SXxeFIdM/MsZw9C4QBBAFZUQlvMdwGemUtrJXI26byMM?=
 =?iso-8859-2?Q?m4GlyLNJJnIWmp1dmO2b8gnMeLAgOxTFtyCSHiCBbc2CW/t7LZSWJFMiIJ?=
 =?iso-8859-2?Q?nUfNDBxJuNxzd3RRiPnz4YVsEQhNTzvLTVtd+EcpmV0Bp0EgAAtbyX6u27?=
 =?iso-8859-2?Q?oyNi0Fpx6gTT8P9lZoSt0YBr9XCsT+3Oy3heXUer4/thgR1e5gEAZcbRPv?=
 =?iso-8859-2?Q?6IEFQJ5UPsJUlt/1ppQwEvucoyVbqa9IMAsaXVnb1b8ISt2ORsBHE7z1rM?=
 =?iso-8859-2?Q?lJT2cA96X7TeM7duyOUjSQ3cxDgbr3K2D4uwxVU7QPWO1VaI6aDfKOtApZ?=
 =?iso-8859-2?Q?YziYSeTrtvuuwCHFiSSLIT3ubWn48X9F7PDdhM9Ywv3AEaKEpwbRa1x6gI?=
 =?iso-8859-2?Q?HhliS23g9uzm1vHrMRTB7EfiwvSbuv5IsnQi3uJ6GrH/bO6cGwCC2Bf1oj?=
 =?iso-8859-2?Q?o/Px2DeKZP+DdYSSvzxysVpqqO4bFsl4whI7wm1yULCrgS8w4iEeeS1MCh?=
 =?iso-8859-2?Q?AzOIuJal4XnFnQ/W3HQbWWC01ffde9dz8yKl3DxyJfZOswdfpQ3XOu2AcL?=
 =?iso-8859-2?Q?xO+QoTbdqW0pwdm+n2HQI2wCVnV2iasF2OJtoU18WugwEBI4QvL7V9kvy+?=
 =?iso-8859-2?Q?8L3HtIVJFjhxCeF5qZE4t5qffiOJEZPX0on/j8blmUFri7KbkCo9km9Fr2?=
 =?iso-8859-2?Q?uZc9EsS5eTqdU80+VV3DdCARPcHHwZy51MUResl4gyPgoJQAT+IfyZfgzD?=
 =?iso-8859-2?Q?5oyo7ToyTx+NRhqv+crWfcM98OesxMwojIjo0So+dXsYtTeFZUmYsy/7Rk?=
 =?iso-8859-2?Q?yV25H+57eRtmXUz4XR/FjNs92JCn6aoCBXtj55k1fJ3wSB1e3WRyNhNUeN?=
 =?iso-8859-2?Q?YsZjFHwLgdg/mi0RWYjTbRyFyaaMUg6TnCZR85rMD8Oa+fCLIvkRVTZR8Z?=
 =?iso-8859-2?Q?P8K5tIi2ylDUFnnrMVDyMoRWV8Wm4og0kOtE1/EJXLdslz+M5FXpOe0xeH?=
 =?iso-8859-2?Q?R8MbzZZ6U4buji4N1pdRqNqw8s4BFga2lU1xxIwzas/3GeYZVBx/vHui2a?=
 =?iso-8859-2?Q?1qyq6mzVVp/dlmKo61caB97P/LxQJZlytFQ7aLv0ysXqn7l6J/aYngJaT7?=
 =?iso-8859-2?Q?GtEBba9NgQ7KMCt99Vrav7wGMgpSvmtBXFi4V1uBnYMmkFl8w1Wi+Vf8oH?=
 =?iso-8859-2?Q?bhLVb6huWM0yAnr5hYdjrLNCXq95WOqXGgAWWgHAwJn5GgsytJHdK9+/j6?=
 =?iso-8859-2?Q?kfZ/teOJQ6MwIrcNpjLF66tHKcWUfYJMnrHNfD3hkIrDATHLKUIyMplnsT?=
 =?iso-8859-2?Q?KamoaSlG1m2hjUtepwzkhQvmeicZtQNIa+jBJzW0TdmnzWp49DDdJpAYhH?=
 =?iso-8859-2?Q?Z08qzS9dXMloJaLPbq7Phd/VK2iJLGa3J/jvI5lWwkFWT7uQFtLBNFaUF/?=
 =?iso-8859-2?Q?GggmuMINz0PzVkZUfn0AurYtKBtUPjRU5K1m1qHDHluqi0zRshPF?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb7f49e-881f-4084-d112-08df4054836e
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:03.7590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSXEgezvrZuaS3HSpXPwJQrgQBY/JGdXBn/6nHrrZzAwEXGf2VuQ+/1KGigJyDCr5BAVa9VHwLzKf+PmB3UvIRDSF0xP6XMGEAfxZa2Cj5jltQAQ96+PkGuNffp/xICo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_driver() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 2 ++
 sound/soc/soc-component.c     | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 8a03730a2e54a..d0b82374f2801 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -274,6 +274,8 @@ struct snd_soc_component {
=20
 struct device *snd_soc_component_to_dev(struct snd_soc_component *componen=
t);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
+const struct snd_soc_component_driver
+*snd_soc_component_to_driver(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
 void snd_soc_component_unregister(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 9a5964462af78..b501a7d65c68c 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -73,6 +73,13 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(s=
truct snd_soc_component
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
=20
+const struct snd_soc_component_driver *
+snd_soc_component_to_driver(struct snd_soc_component *component)
+{
+	return component->driver;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_driver);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
--=20
2.53.0

