Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443621;
	b=05ZwLRzR39uReApbOXHCRenf43KzOLf2jsjp8ugVOAgNfyEajW6h5doCTD+mxjcYofr8
	 VraFqOXzFnCdVeEjWwxTzH98wyZdMaJZilXTqAfVaNAYd5peiLTUeXhN1X7SzqNS+YIrl
	 T2kWf19My1EdkFkCU1TzktDo9A9bE8IoewQmGPm+l3V7wJxHc7LeHzqoe2EovqUPP3s4G
	 fxLuCwTlPEyHofYlXjjXsDiw8S0MFx83kN9dcuwM2odMe8w6XmpEWKTN2POJQW9tTgWrw
	 rjR9A60LuA31urr3p/iUt/SgjcDee4BAK8bLTjA8KUhNsT2RS7uxLbiCTjhYlxh95kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443621;
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
	bh=hgoRRELUFhuQisx/M8YZKyAW6mCk9qVaeAJMKaEWjRc=;
	b=L7U0f8eFhxywFoy1IEAyw97/qcjumKZHntzlco2PEg2SxhLZScM6jMSzOyPUO0DtJ8zh
	 +kREqF6bImLwb6YPM4QSqem39hAotpAegwcnL1LjXWOCQI+B6deXElToxPP23lv1alRLU
	 JNkkCv5ZhqHLboTea7Epf8a1yY1pUaMhXE/0uZ4UfPFxwa9RwAhlI8fyYJ9Ha6o15s0mk
	 3rmg00J11aNJtwDnFsJ2DRtw7YrdJiJ7CSHW9Jrf4g/isXqjE0RdtX5RmQM+QU6YX5qlu
	 Vg5ek52UCyvpZ9WWTyT/X6GCoDwCdrQzdYdeO/G5SMtkiFDk7JFrv/AHL05nncu4tmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=R+WvuwlA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.71
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA942606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA942606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=R+WvuwlA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuIz+/BwNmIx8T27B4UNam4TMlflORB7iJF4jd+dC1NosVlxgyDnHZfSbT/xhhgVFt01c56vEZM943vOzq8ETxthn2HdvU0tf80gBF/IDTIz8FhsS8c0162NkphGocVKWlO1CwIlwoZS2PYOdqrBw4ckem4wA3vabIHj2P+sJzyChD+RfyOqEJsDirI7cvH4aBFpDLkyANV3dzN0iehD+peHvLmfxfez8o4Cfo76m6dawHjwYQc96KY87uu4SAry2HJ+agQt60ifo/S9LT2V6awoB5BcXE2KZf0/8iFDlAQl2icZrhACgJ7UOB8DxMcMw8iuEYviYYdhDOTAt9aGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgoRRELUFhuQisx/M8YZKyAW6mCk9qVaeAJMKaEWjRc=;
 b=u0xlrWDE5FDMNpR2PQtxzKul64k7TQQ2aXTHOeuFGBJUtkQW7XtzZ0ZfioZw0D06+s0K4IVlU6iDCT89Qh/VC4OeTRY+47yAuQ+Nd1yHulOZarjTpOZ8dwPRDmSVDO7oBjzULCWt+iCKv9/HfJojPQsZK+vF2l4+7auyTyaHSJs9X+lAeBhfel2CrSosW7PPZ3KzA9ThB8thNv74WA/8aH7ycBr+rxI3BRbt8Ay1lH7dpfsbfcqyvkEbYsV3uRM8lLXxzw+6sqG3Nlyrpu59VseV1LNfKjEiVyqx4D9seP/Nqr70UeGfgIp4p+e4isukb3YS0hCwr5SVxq67vtYSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgoRRELUFhuQisx/M8YZKyAW6mCk9qVaeAJMKaEWjRc=;
 b=R+WvuwlAkHPNn9MuiF+7ImRAp8oZT3vmg2kXZ3fS3kAOYTTQD5QP+J1F0zQD6vXA6/fYohzN0Yrk0nHQDVbJSSWVlMhQ32M1kmXh7xVyqr+ZOCgkTaAmVqpcuhuqCGgAEmmzT6djiyTljkDb3ywjK7/ua8zCU+OxMnYDwKPnd1g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:39 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:38 +0000
Message-ID: <87y0ayzy59.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 26/27] ASoC: soc-component: add snd_soc_component_active_update()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:38 +0000
X-ClientProxiedBy: OS0P286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:b0::20) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 029a7225-a63b-4438-0ac7-08df40549857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|261021123027099003|56012099006|261022105027099003|261021121427099003|261026121527099003|261102130727099003|261026140227099003|261102123227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BaFcp3SpDnvJssz8qQThsm5Y920YQ53f53jFVxP0Lwq/RMtnQbz3rowLRQC0f3PJQ668LMKDQsbL89TwJmO6uy9lCMahDafOLXNMq3PW5mKxJ0ysZCtYHw+91UvkXNtq8F1pSOR+tupOpdGb0BFaqNIXKAu8M/wBUeEt9Vj3ZrP3nZgvphILb9F/K85hJVhoztYbAXK1CCw7EKOhpcyL+9j4+grUgJPwHlkMgVom8sWhjVe3/mvVV+w0nRGuhiSMIyGIkg1pYQ1rvgIg08I2JFIjDwP7TMAl1G5tGG8LcE5jkKihkznBSzjIHGNMOYMXOaqFSqIWBY1eMgriFRcdgCwJHrmJVyWB4YGLdlCF99wrfyUJRnzA3MYYuZN78mCBJevtwQpDQY/fpTzkZG+tubuuBMxjwnbtxG9DnsEQ9EIvJsoI1KrniQzmbxjP/S3uSVNwlIszbMmbLLQiV/Nv19mSv8Eww6RmS3nUgzI7Nh9YihsA+Cb6vgPr2RHanXpGjON03O+/W3hfAe+rrFCsraHSAUpg1Kj2qE4UUc1z6GQFc29V86r937GHSpMw6FVH7Ly9j1vyqQq1EnV8f3IpKoPHDN92BByYB1pGlbu/3qz3IElzL+/cd6cLAockCPgqLcMc1IEI/4SJ0UjJfI8BJoy6wZWO1VC5TKD/6TqAYFOqpbYDWDXgAvj7VOKaZclSfJpQQcbSaHzKP8iaSsNjPYRTCMaukyuW7Zxy8NzKaKw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(261021123027099003)(56012099006)(261022105027099003)(261021121427099003)(261026121527099003)(261102130727099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?r/ITlTaQHTFVHvB/UzS4I8YBsy08ASEU7Nt1hlR4UwMs/GmHbk76z1R/EU?=
 =?iso-8859-2?Q?JPNBDOqM97ilt6hAA2YECjV8fNgZ+b239FFxiG2+FwI6plRUPCzpJx7nIs?=
 =?iso-8859-2?Q?zo43EhovEEjL2DGnXeeys5OhA03gDjFz0iflnKrRGRm0mXnSEDqZmte56E?=
 =?iso-8859-2?Q?UK9NdLdXNKcAkzmJcOMYlpc0SiDA3UWU66QWDF+hDvZIJgKuKYgl8URgja?=
 =?iso-8859-2?Q?a6CAN4tPLybM9uCLdbvfvQq6M4EiUNIKIbzSHnA1Q18203doZ+k71TMJ4r?=
 =?iso-8859-2?Q?ljndjp1v5HYqQlXnK1bpP6PdbQMyzwOBZvZhAcW4fZwwIep8IXU5bUJT+C?=
 =?iso-8859-2?Q?Iney0MIV+j3ZwN6xll/z08FAB6jVmlxhGENuTrNczBKFrWpY5y7MLyzPf/?=
 =?iso-8859-2?Q?8saZfw4YZCpA0vC9OQ0THkyHP6FFLUNRNunJZTbpF54z1x1FFy6CvsJWWB?=
 =?iso-8859-2?Q?5bNb2YoX0EBwE+gqUKUCPgkmFt5mJ5pMymRSGbebCFKINgB9GQ0EFYBipl?=
 =?iso-8859-2?Q?iBzl03oTEFAzpYoxbh9C+/6f93fKSoFRsO008wuGMBnOSI2/B/rs2PF/aW?=
 =?iso-8859-2?Q?G+2X5lBrfM49Qf88LSY7QRmLwSnOQqQcRGu2ROMSSMevXRn5Uy1zAlYGp4?=
 =?iso-8859-2?Q?vZlBx3/C0+arHjr+US0YwuA9hmiUlK7hgCEFYY425TYm4+FTq/pHdv8dcH?=
 =?iso-8859-2?Q?n6wMEBh0eJEffSe3kqvaLBdeC0vtTaL4qlezehwzGduK6sZ058OWtR/gbp?=
 =?iso-8859-2?Q?EDXthaWdk4+hNQ557gjDPEgWI+v6R1du832H36PWNF38fhriysBga8HHNE?=
 =?iso-8859-2?Q?5OHW/JViCXhgTYO7r6mWXPKTW+5Qt+B4ODU/Lnat8+uNG51EPqnR6Ii1mg?=
 =?iso-8859-2?Q?bCBfXYyy9Rp5jkzT3QJq+mLHiCQsLxchX1ZOJ+p6cpiEqMxVaX1ym4YVZ2?=
 =?iso-8859-2?Q?8h4ONq1YbVeZXNWM/7Kc/hL284XZMO+cxn0t/3Uv7HjGrkjUepVHpiwl00?=
 =?iso-8859-2?Q?Xq2KLoe7PEUXlWhnEzlzl9lFFBZVOLJ5VLwcYiEeKVmxJUBHkO6fCO6Is3?=
 =?iso-8859-2?Q?f6XWFbAkBwS+FArTG3QfyWg0wN6YhCxYetbCasT5SQQ0HEQVetotw7+QZD?=
 =?iso-8859-2?Q?F16tLxfw7c3lT9Q7dmeLjaAv40R6Y8Su40uB0/CjphusV7Q/bJMKqDjBUb?=
 =?iso-8859-2?Q?YmEu5Be0r6AIhVGS5vV0qlp78MP2QAYa+vpaOv6nT7d6xZ9hBjkHOMHBIR?=
 =?iso-8859-2?Q?JH8xsLxqTvNA1F9ycOl0v29BoqD01Qu41//qU7Tgyec3epFrxn7ax2TYs/?=
 =?iso-8859-2?Q?BvDYvCn5brAVyijLdeFj+i1H71jHe9FdjSp6DMRoshVmQb8q1eoMtq5uub?=
 =?iso-8859-2?Q?NHI2UYfitQDr3FktwMXPS8cPRw/yc8229OIKTd6sk9xuDZP3KHz0f9ALat?=
 =?iso-8859-2?Q?cmjedbjer0/3Jc/yA5Fi+058zg+XhUAMzj8SCPJhAQN4yMjRNq9Z+rnYZu?=
 =?iso-8859-2?Q?JRYHiafZcSoq8e4maDqSaYx1y9qJu07vvaiwxrAdUjsoNXAPoqdLdFYmGs?=
 =?iso-8859-2?Q?c8RVlsp2/Snwc0irEgiVnOzezW7sbxoy02RulwD4qaoD6XKX2F7i3+ZXuN?=
 =?iso-8859-2?Q?0UjgH5UXOtxAI64qUMYtvw7FL4ysqwsj5z0VouSwvJX9NAZ71ubNzSwvXO?=
 =?iso-8859-2?Q?uRLWRlSGT/WR2C/uIpWPuPqF65yxJJb5Jb2v1Am2m/jMEKx980mFLKyIbx?=
 =?iso-8859-2?Q?4/VoRg7MnQx0XJYzc4F/daDsPeuYYHVqxJNaa3txlDhgGbNRywwqMGPtGn?=
 =?iso-8859-2?Q?/6P5bUb1JejIc71HEVEKRO9LTmJCrYsE8WxNMNZYDBGkgAY2aXJ+?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029a7225-a63b-4438-0ac7-08df40549857
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:38.8570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdaOXL5G3Xv8+Z6isxEgSgvdSKSFZWEp1FHMT8vj1d+M60DBD7nBW/oCedug+DsHG/TiMciYfZAVI2wh1yyYhstEF+WTeYePhizm74FuPClwipTRJmiOngFyhjGCKGMn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_active_update() to handle Component
acitive count.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 5 +++++
 sound/soc/soc-dai.c       | 2 +-
 sound/soc/soc-internal.h  | 1 +
 sound/soc/soc-pcm.c       | 2 +-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 1ccc28ec28e13..6a3ef36801ec6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -104,6 +104,11 @@ unsigned int snd_soc_component_active(struct snd_soc_c=
omponent *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_active);
=20
+void snd_soc_component_active_update(struct snd_soc_component *component, =
int action)
+{
+	component->active +=3D action;
+}
+
 int snd_soc_component_num_dai(struct snd_soc_component *component)
 {
 	return component->num_dai;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index e222268d8466a..dffb265fd38bb 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -713,7 +713,7 @@ void snd_soc_dai_active_update(struct snd_soc_dai *dai,=
 int stream, int action)
 	dai->stream[stream].active	+=3D action;
=20
 	/* see snd_soc_component_active() */
-	dai->component->active		+=3D action;
+	snd_soc_component_active_update(dai->component, action);
 }
=20
 int snd_soc_dai_active(const struct snd_soc_dai *dai)
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 98ff0e2fc2e1d..1190be669eae3 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -70,6 +70,7 @@ void snd_soc_component_remove(struct snd_soc_component *c=
omponent, int probed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct sn=
d_soc_card *card);
 struct list_head *snd_soc_component_get_list_head(void);
 void snd_soc_component_connect_dai(struct snd_soc_component *component, st=
ruct snd_soc_dai *dai);
+void snd_soc_component_active_update(struct snd_soc_component *component, =
int action);
=20
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ef8ccf52798eb..dac353fec4bcf 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -374,7 +374,7 @@ void snd_soc_runtime_action(struct snd_soc_pcm_runtime =
*rtd,
 	for_each_rtd_components(rtd, i, component) {
 		if (component->num_dai)
 			continue;
-		component->active +=3D action;
+		snd_soc_component_active_update(component, action);
 	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_action);
--=20
2.53.0

