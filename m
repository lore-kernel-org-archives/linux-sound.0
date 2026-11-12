Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443612;
	b=f/b6DDNnk7oEHwfXFM78ikP9Zao088NJ7r7HZnYuSnukEauGMnSN45PA7IZExdyJ5V6Y
	 yPefyN2R5bkOyyTi4sP2tRKEt6/epHhtwzoLJtd3HusjSCv4/KSDnZGnzRe+ZSG30qjg7
	 HFrIH8+qOmJ0UDeE0IEeLkOAMWqUFLe9OyRhivQClMEzM3z21PhJWav5kv/aK8KJKIe6S
	 j/rTU471RjpcdGbhLjEFrmBr6O6/cXQC5kFtBUi0BFGUENhe5ABKAjFjhpLRE93700CQy
	 kIqO1JJ4P4EVvZfDmZ/ldZnopEWs1cO8pmiAL+jI5lvhf/zQQDzcb53cXV8d9CuEw7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443612;
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
	bh=Aj2HshPwiKwGyJf/0qxZ7kQhnYAhoIoLL+vr9p3LePs=;
	b=riL0uWwP6ibMT453DpWGQQgo1dKEAaFrFt+Mr2cl1K9+xbmifcu3bqWLD37jd+uzS9cA
	 u1ULcHI1wWZ58jO78HeRWK8g6U5721LFjaeT1P6dv8ZN02aBsE1XfDy1OC3TtRy9e6kkP
	 FsgyPVCJuAmeM6R9CjPB2MvxApxnX7Zq9nmfJHBmY12ztviuODnp1bN+EduWX+XIt/BcN
	 ldH80IpIteSpyWWbYp1++0/gUTuSGfcLtj93XhNHe5TuB+eHqgsdXFn4N3XvZlsGfG4zm
	 NQ1VVHVeOuh8vvY0vokg6T2T7kmNfnSWJKqPxXNEvPvUcRAxk4ui2WFUKDHGMnaV+Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HDnAcce8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.46
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F5606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 474F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HDnAcce8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfTIGidCrjy9cBT1yrgkkGhyfmIKuyWOtzfxtpUwa9faqIqlZFhZxCX8wTDrgvK3kyyxttnX0tOlkGsCHrC6fjBA4AsHg7dGl2Hq8qHC83Tw12cCblmruzMUKN4V5ayqVE23vKdWf78MK1ahiOmCSSvhsq4FNUIRL08o8wuvqSuDXM8xF2iInADBIfEAwjGhso2S22XcUAr/W24lyIIxuoJrlgT7Qb4bWIFD8/Bs/26XuCFfTsjd4Wd1RU0yL+weT/FGdVH9XX4daE9jJmoSFuiCaPPuYIxb0Fszquavqlm6aRcyycjDVyXGL6+7xYyoid78B75u6mlTYrpEhi8Ssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj2HshPwiKwGyJf/0qxZ7kQhnYAhoIoLL+vr9p3LePs=;
 b=k0EZQbLDkqoPc43p2m528jKx6GvysgJPNA/qLOfoqq6V+VSmY21rEu84NvN678e+vPyBXVcSF+bunpbbOMeenC/0PuHyBozhbJpdhSv4cERm36sLZFhJjl824fYjescvopRWHyKy8bmGK5VfvZYmg/AupYdCbRO9n+nsyRxFnAhlYqg5gk4Zu4agtOgwMVYLJ1Em09M1T40v5eaR3kd4ZmZyb7uN0u/0DX2ee03Swwm53F7EKiVw5QBroKIWlWM8LjhaC7b+gdWF6ZuZDy5Bip1xG7A1eav85StzubJ59N27h0zFN1DKtrSpT5dkPuXmR6j2wLJgUcht8GVOjb7z5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aj2HshPwiKwGyJf/0qxZ7kQhnYAhoIoLL+vr9p3LePs=;
 b=HDnAcce8gF8DKAVQyNribC4jxhF6AEjgTPqMF9RF44Kb/VEsvOhbGAtAufEP5rxLQReFekYYdGDrvkwZ72Mr7YpFDHjxIIOVND+jOo5zOWyn1Bv/z4XNXTozZnad/y4PnKEkybGtSpOtS8cE4GLS9mIIoOU5LIVDEGZwxrcXusI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:28 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:28 +0000
Message-ID: <8733t628iw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 23/27] ASoC: soc-component: add snd_soc_component_regmap_multi_reg_write_bypassed()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:27 +0000
X-ClientProxiedBy: OS7PR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:604:254::9) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB13263:EE_
X-MS-Office365-Filtering-Correlation-Id: b7fbded6-a425-49db-a395-08df405491fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|56012099006|261021121427099003|261026121527099003|261102130727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	stPn55UPvWgkaj0sauXFeaDxEzfSnbrRflZQ7OwU+ApVhGhQjxjfBHDhhxV/7GM8NlWjnLuO3h3kQOzsMn+G+eBVIvMc7jml9WKu6wvjm4pQ3OoCvnHOndJR8o3rVQL5MdVYlR/fAyVKHGg8Rb5aWzs1yRqnjUaFWKONepxuL/k6CduNT2/vm+HKJnxWcUDkGIiaYU830dEXAb0Iw9A5+r5csOryUlYNLcW7FDhn1EGYYKnHKvYfIT4ocBbtkSBRK2d12ebd7h0s6aY6lIiyiTHmLriaNFCMZEFf4iL+1ifIUkVrFqnTmwLxD+QFgRx6JAYJy6t01vgBkF2fQc5OnIULB35rnmHW5YGLty2x/1nFg05Zba5CFI2FtAFaza2rD/dJNFCoNc/Wy4WZlairg9svPIb6vBeYanDL8UR6W6FQS01sDngX+xc0B6mK+XS8Xxpvg/jFCgNJ+dB9FGIgI92AGv1C9AjcsTEUDGznaD1HWwzchmXYDe0bVdxE3yi8cOWSlGBBCZG6p9wFpiozQTZvpkXJHq8A8MfKzxgAYNWeDejotZpq2oXNSQuQHZAvF2ZMdbdB/1+85BCrJu3P5NZBXvj1iUvBshZdzEl+Rvc6G3lRRmNKAR6LaET8RU+qUbh0dAq/1FgnDpHI90M+74Eaj3d2u440IWL6I5M/w6CPK3b28TSJhvZYZ2HHPYPTV1ym/LbciMZn5LI3Spjnuoqd+vu0i5EbjMr5YIWgkx4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102130727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?cXR43t1PjfNPCDNine7/4XXrQy8D2teWAyABXFYI2yGezl9Q8ziw1Unca9?=
 =?iso-8859-2?Q?5u2vy/4gha29z+rVF6K+roKP5fRN2PFa5DH44fLzOgsVvYyZQ9Kqot1osH?=
 =?iso-8859-2?Q?Gw6rlTXC/D5zeFFCAcSk3ElJUHvF7VTGHRqyJBn4H64pGZ3Ww972lPDNGU?=
 =?iso-8859-2?Q?S5a7MmGw3z0OR+2f4owfPgUtNPalmCORg19MQI/QQf35os8Vleg1cpbHNR?=
 =?iso-8859-2?Q?Hy+JliUkoTEpJxNXTThuAJ7y1mUaVnq/rRKSdVii79BllDje7+EAt6syzz?=
 =?iso-8859-2?Q?69Q2H7RoQsbaLFV2tWUcALiBlXlXWU++0ZrTFx+3VVOom8q/Dn9cuhkmaf?=
 =?iso-8859-2?Q?+MhqhaQC8M6Bhphr/DJBgojVZsuH5Pn6uRcGPotj1CfbKTOIIq7LlBHJbZ?=
 =?iso-8859-2?Q?FqyffyGo6YE3sJknuWM6HSjx6ooFKbKXsGRlQtgqaRyac1T7YgHoh40FfY?=
 =?iso-8859-2?Q?q2TaDxQlkvX9edU1oa947nRRo72PmlTBJWkiEbJ/VwzvZ3GSY6dLDgZEBB?=
 =?iso-8859-2?Q?lDmR6TirDIKhOGiYBke7K8uMmPqHu1RIPYjPksutW79LOcYOumXAySRE36?=
 =?iso-8859-2?Q?quJSxLjAo3siysnEwB5fsuVf5laVb+p1uj+Ua/PAXgTakClhYJMYG75G1A?=
 =?iso-8859-2?Q?r/ZBpLI8aqTjYRPMnbBchSXpAmlYHBh1e0IhnK35OxatwuNXhsP0WuHaHb?=
 =?iso-8859-2?Q?yt1bcr+Z9AyL60nVfk/vgG94nu29UncF3bOowakt00nTOJ5h+kse3EZ7Xk?=
 =?iso-8859-2?Q?749ljB0cAI9eC6jiVbYeD2pW8cyKfW1NoST/WB1xFpMHiSdXX5MgSP06XI?=
 =?iso-8859-2?Q?ExkOSkcwtUxLuSExnzOPcyjYVY/z2kkaTlYdLiSOYoaqMgjajZyDR9a/de?=
 =?iso-8859-2?Q?dFITRmF53y4Fl7ycwkEIN+PcGlbiw1ZYlyyAy6wpeXC38m1RQGcViyeVfJ?=
 =?iso-8859-2?Q?UWP2C2yYdd55EoJFPZl2IQD54A8wp5tX0w4A4Xhkse5NXCuWU5W81UHiSy?=
 =?iso-8859-2?Q?UrKWK47NWuhlBc1XI91a3gvKdwB/6nMsqRoxBkXynDYtJ+F1ApsX22jCNc?=
 =?iso-8859-2?Q?/0gIB0aiivEZ/6LSKsgjT/s9SnbFJt0WYLRPrw/0I83OIR0blgJ/CCFOUZ?=
 =?iso-8859-2?Q?g8DUcSvRDfSzjUQfqgvUn8WRcoI/WDt19udM74SIC6pVg49ddbh63SMngt?=
 =?iso-8859-2?Q?prKPljLdk0OWuhF3e0jKvOV45yFgO9ii/JrISMMmhCdvMGDibuAFx4ZanG?=
 =?iso-8859-2?Q?ZpDpWoPxYkNDvFxEAjux8jlI2yKq/tlDsjenZw697wXEVGm8yfOfLtGCwa?=
 =?iso-8859-2?Q?xY/m3UEiEFWaFOYX6WfnNUpRPmc3xyT3G28rYvEaBveoIY01OtVAPLdeW9?=
 =?iso-8859-2?Q?+awC6LYH6ZDZKnS4dlPO7R3ZiS8lb7AtJHOoag199+faW7ZRpwhpBMyTy9?=
 =?iso-8859-2?Q?tMwwWYjKbtqqPGFPqmo8dIL4EZmYnuEx8DrL9FsgZvMJ2N3440H3M2IkMS?=
 =?iso-8859-2?Q?vzxGkSbB94BWqC0wV4OiPK1yDyf04sCmNDurH3/nLqdacrPV7S9Ngfv6xZ?=
 =?iso-8859-2?Q?2Ww9aukq8mpAaBHavHhKAVHVG/0SJ4vVkkf/E9cn1RRwkuRNeUjnctPBT8?=
 =?iso-8859-2?Q?zOX2uNoG+vzK9Ur8oMnMU2SOxtOxtZ/XGllbgcSfNHi/5zMJk64EyD+w3D?=
 =?iso-8859-2?Q?XpjiuV/NdMG7H5ENMmJqo8Z+lSm6ul5OBEULMOD90mdVjZyW20jgars8YP?=
 =?iso-8859-2?Q?O5ZB+u/eb9EwxKAzoVLDDFg6yZNHN9g7LBG1yojUA+M1eixO9sEP6DKPxr?=
 =?iso-8859-2?Q?xwLpdnTpo7e5YYWNs4ipaUn++XOoPlT0MWA1C5eb/lPrhr/F/v69?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fbded6-a425-49db-a395-08df405491fd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:28.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihSR6um2ILp9NGSamnWTULIq8xdynPm+HqwdO4+UaGBvTkxwAIeHi99aa4FDuACeYharPsnL3uFF4fW5c+zL57Y4m9yz9KFRGG0dOHf1hIAXpQKggvwgdf/s2t5gGRca
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regmap_multi_reg_write_bypassed().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |  3 +++
 sound/soc/soc-component.c     | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7b1d9775422c9..458fe11a10da3 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -353,6 +353,9 @@ int snd_soc_component_set_bias_level(struct snd_soc_com=
ponent *component,
 void snd_soc_component_regmap_init(struct snd_soc_component *component,
 				   struct regmap *regmap);
 void snd_soc_component_regmap_exit(struct snd_soc_component *component);
+int snd_soc_component_regmap_multi_reg_write_bypassed(struct snd_soc_compo=
nent *component,
+						      const struct reg_sequence *regs,
+						      int num_regs);
 #endif
 int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *compo=
nent);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 24c983c9cd1de..c0219d9f96ea7 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -461,6 +461,19 @@ void snd_soc_component_regmap_exit(struct snd_soc_comp=
onent *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regmap_exit);
=20
+int snd_soc_component_regmap_multi_reg_write_bypassed(struct snd_soc_compo=
nent *component,
+						      const struct reg_sequence *regs,
+						      int num_regs)
+{
+	struct regmap *regmap =3D component->regmap;
+
+	if (!regmap)
+		return 0;
+
+	return regmap_multi_reg_write_bypassed(regmap, regs, num_regs);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_multi_reg_write_bypassed);
+
 #endif
=20
 int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *compo=
nent)
--=20
2.53.0

