Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571054;
	b=HK26SIvXrpVRcJlx51SvLeebv311NZBRt0+EsYrGD+4bO9SSBf48S9hhZ2t0bSsZZf0b
	 GEn0ofDYv13qUZAHsNIhw01yuNVHuP8XK7fxSmMbXGZJjzWQoHug49Rjxyn5DfCKfkGdP
	 NoDGolcs2qqAxVb36I/90wPMlWlORtogr99iUem2Lsjb3p5RmhqTntAs728BwQuzm+XaE
	 8EwFboHLL3p8YH9kzvlTfDA684tHCdGV0zUFcYeOem6D077z5nsY/oxnzw3NxM4NejZDP
	 vQu1OrQcLkWa0lBux0uEnkXKapVD+qB7qjxTb5PjVdDYESdO/Lt92+Wyl0jg73d+BOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571054;
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
	bh=caN41MmmVBW8EMyf0CWuTmEETie9Fr8CN6QI9v7j3eU=;
	b=gI6uJp5TqqOo/i2hQ6JvTadxP2WxMoKn+Vkbd63yz9iX2Wk4dRaNidawtztWvhSHp9mV
	 bTsItCpoUka8PR/DNrCBnH+3IYbOvmSERguyv0CGrWEBuZZTec3KMzUZLvTbHeO1WUgDk
	 HkDoxxgdcCWA00Gi3vjDFskXCFTv9alClUQ5nUfOBM4/v4v9acbAjYkmFYMOVjexkVO7m
	 ThH1ibhEighPYW1JkHon0wi/qzMonEjGbkPHpajF4i5oykFQb1U+NUHaR3hxMbb5jETt9
	 ctWH/vHeL3/mO6b8qsa0zKJpZVH2RRgik+gT1HWRiFHJ4b5bEV1rttu0VPyiEptYTCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=MJChy8If;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.70
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A8606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=MJChy8If
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olbtwVENxRqrA6xfJgScOIxdXi5C6EX2leQ95ohO6o9cudDSNDYhFAn5yKk4+DbKFw4pF4eX7JRYhtHPQQhBhd3lkVBm1yG1Y2vnt9E6qMhHVIYbT6VOP0qHnCzAJQUPvw791INRe+JBwotr7eWHASDqS37pcu21th+sntZ2TdGPU2+xp+APRLzMC/jRJrqtQ9eqK3YCexvrf9D4LVZfiTAJ4NZ+OnQ0PGl9Cp64YDHq0FRWA0+WTMBqdzaQThL3cF2m1ubbRZ8cYnjkWAngQzpRiZNEEK1G8og6GtYafGrLMVv7qbv5PbEWwc/toY2sB3T47N49ZZKgo6VtTSTrVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caN41MmmVBW8EMyf0CWuTmEETie9Fr8CN6QI9v7j3eU=;
 b=XxnyL5OAEdIUwlq+px4L1jt/GHoTr0uwcOdYpP1O0d0yL0ke3BCeuIUJWEr+vdBaO9dlSC1KJ8y84Tz/5EnHera3UtTsNt1oVYuyLNhnc5SeJkYTYu3N9Lw7Vs8+zuDfQt5ANZxDj9Bi8dBA1BY8hr/hW9LcbNIuQf2IkEVMtYtjiulCOdo2UZavNw6NICWYhKvVftRz/fDzN68QTJPe/6Mk/yf0Wg9aZqfDRrOKzrOFSXQnk6NmyWIFL478hT/gUOBnCBAMgzHUKVyM5T7ry8sQT2zDVCQz+6OPGP0iqYgqHKJ96LLQGCtuViNgABIl0gL03/6SH04FeWx6BjFnyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caN41MmmVBW8EMyf0CWuTmEETie9Fr8CN6QI9v7j3eU=;
 b=MJChy8If3ej+5jGuFxXcNZ4q1dJUF0xp1nJRh/uA0CnCVKvNN25NcUVd+qcq0yJN+dA5uVOk1kzeX5sdT7itqRdK7t16AUn5HQUu1imd8oL8l/V9tq7iFiZ5Brx99Dm7HV3MO9UR+I4Y5aBsgbpk1KUub9cvvkNLCEnb4tZjVe0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:44:11 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:44:11 +0000
Message-ID: <87bj7delcl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 24/27] ASoC: soc-component: add snd_soc_component_num_dai()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:44:10 +0000
X-ClientProxiedBy: OS7PR01CA0232.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::14) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY1PR01MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: 82231e30-3042-4684-4b4a-08df4a959a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261028144727099003|261102123227099003|261102130727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	J8dyilA3iHfmYDTSX5/AXP74CNlhJpN+lRqnXfW09gUaQl22QavaaG7DnyXYY2Uc8aYw4u6+o78mEXdhqA5dEbjeQe5R35bBiS8SCF11U35vGnWtXdoqOm503S0zL/yYF98X4NSm1wndXFR2FQPAYj5fRBtfIPLtWMU/fY5vx7/Nj4R6Fni90UUyszs97aZ30WRwXux2+BgXUzEBQgFzgK3mo0Pf9UmE41rgelwLuolaQJ19Q6GoOh3Hs3yz5vyNMNJNXTwcwJm9JDWH6u/wrrt4UTP9uFvA7MpbeqEbhqdpZRbGZeg5hWri4/gHtwXr/LAbYSPLChqkdiDr5+WIHymA00CaBuqJnrpuCSpBA2MQ8EOyPA7LIt8DNTQv7F+EM2CXKayyAdzQOdNmg+dnqFfFQaV/C1LzfZoJNMBSyRyJrNm0Yw3pdmJomdObPc6C5iypW/wbuMVGXyPtE0jYLj/f53k2ilwyY3lby8wHUYah9J5WniTmzVBw5NvAkK7uLhbjDKLWUweVUp4oEPvCgJWtBSD956fDkvBHfOtr9MrNPvTSldMCkI+GT9Sy0Y37BobHinWOWUFrj/O5D0b0KAsspiuEinmz5N19DvGDRuJdkuxL1JNQeo8DQpw1J6jSLHSnKQIq4fBix41WMNh/sl2x/dxm2Cl7LBSH6AYejZIIwn6E9LZ4aan5iKq6o9FvX/2Zn0ih03BnXxgPrPsOVBNkiBe+N/7D1A8YluLmwIg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261102130727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?ms0k/c1Y0NVYPTxn2eg75yFrkGdROApAQz+oAMR2m7/luOD48leo9GGJIj?=
 =?iso-8859-2?Q?ZWj+72teRSGpcENqXTnVv+vDQsdPWaAs4UYUipl/B9+n4KgpBGCjnoheeg?=
 =?iso-8859-2?Q?KVGBU7vXKGgj7J8aNMnhfOl61dht3vFWgHVbn3PQGHOB0k/YRWl7ilZxG6?=
 =?iso-8859-2?Q?/ZePelN/XDaM9FkJHeyuLNtwRl8WkgZHW8ngGqYnb/yXAwbA+soQBTHaED?=
 =?iso-8859-2?Q?VPeGEO0E2A3+qVSeJb/YdH1IiZnlOCqSu4wHHglIVlqevKxrLJ0aybOjRg?=
 =?iso-8859-2?Q?ArSQM5Kfj5mQYRPY8EZOpFPVCkPXVdQWXQXLWD0LGP2GpZXRAn7WG8ejFp?=
 =?iso-8859-2?Q?xNSHHiWjGNphuDsJTq/FdJjUX+U0TBddScScyL2GYhVCWlib0OuvUAD3o5?=
 =?iso-8859-2?Q?0AGeKM5gyjvYYvreEVGfHJ9Kli3Lgwl8k6g0lHVwgQFXH0/KFtF2lpuJ2E?=
 =?iso-8859-2?Q?zyrvE889DRSnaKlXDKU5SrBGq7tw18g/yII/es4vCtKIroBJbBKqifHnGs?=
 =?iso-8859-2?Q?7p4L1LZHChhavLpxkpmYgPty7Ixv5RcPBk8u2Dx7y1CriTW7ZFKfDurDDE?=
 =?iso-8859-2?Q?U+Jvkjuqo59a2Qm7kyGwTyiVE5glKfGIupGsZa5m0umo1uRW+FlWjJL2gl?=
 =?iso-8859-2?Q?CrVH4EMvn9ZZjivuvDCKbA6cgol6r9ASrAr35o0AbrB6xts4cO/vCUyUVS?=
 =?iso-8859-2?Q?+V4ap6vqMk+NeqRG+0G+D4dDSH7wFZ462kdmz6aM1joigJIXC1gHcArfac?=
 =?iso-8859-2?Q?bvJC8lg8iZKZCCMOiGd4BIo5y00QVQ7yo2yB5Yo+2JCHbHkCUg7gr6fBX5?=
 =?iso-8859-2?Q?7udbWIDTSENMh20jd/n4XZFrKvh/Gr5aai9cBmwiizeLGZVssESywv6Bg/?=
 =?iso-8859-2?Q?Go0AW3sPOo/dMviiHMz3Nvfus70rtSzoPtYscJDdvTU69JNdKjxfKmLyvn?=
 =?iso-8859-2?Q?OPZJduI/pqgi6Ml0AdgX3F9RBZmJyymiP0eF8EaIrZ0MJ7lpKlyQjW0vI8?=
 =?iso-8859-2?Q?3GeY4hl3QdgpgcMQEHX9bmegUUPTOZv0Miz+HOngxEifKnndyIb4MOkDId?=
 =?iso-8859-2?Q?75o6JRMyAJ6lCNmvus1BascwtMPYGBiiBDkZGwqFkl03scBomgyRPN6iqZ?=
 =?iso-8859-2?Q?tKV8jLyGigrsiZnUyTp+6XDi9F15zM2XlPKwFYdqSmbm+7NdwXy4ITt508?=
 =?iso-8859-2?Q?44hgxsxyI+AyYUVrW4E6ln4/wvg1tWN9kq90BpiWmB4M8jMcyIrMkZq2BW?=
 =?iso-8859-2?Q?t+bw/nTzeG43w6JUAXjn61opDQYtiBs2Ee/4R/FmLOhEdneKpz3UlGwOyo?=
 =?iso-8859-2?Q?foTCcQD+dOnLJbhMQcovNOvwcraNi/NWXTYly+zAWKal9TYs3P3w/ZtLHx?=
 =?iso-8859-2?Q?y3hsm2lNEum+guH2pUd+Joko3tDuRTQzVhsnUnLK345HxlmkozruJd9IV9?=
 =?iso-8859-2?Q?ECLdzJJbS8q+hubp1OgnG6L7vO9cNwAnlLATvGfvW/5O7bwMzhy5QZVjcA?=
 =?iso-8859-2?Q?eg2EcJkrBylhTXqb3QfF8GMwovx3UTnm3HUI1QZ+b4TKKCWuEW/9R3V/nj?=
 =?iso-8859-2?Q?DUkOwSXD0x+gcZyEpQxTHC7UIa3ijDybqd+6g7rMa+CA85g4ZLmrjpROEy?=
 =?iso-8859-2?Q?IksPApF27eRL1rh6898ZDYEFjHFdFyWoOFV80+n2dD08KHVDfrkzgnVq0t?=
 =?iso-8859-2?Q?YI3h3GqMkm9ypZf3F/A02JAfy562M72+1nmJ5LU7pXYZE0OfV4hD9Gv3UH?=
 =?iso-8859-2?Q?34Dy2XoV/qZn38Ok4S+C4+P0GWP6pI346Jue1fm10RvdxJn5tfCcDL+l9z?=
 =?iso-8859-2?Q?0Crc8wzrhEQP8t+ZnlBCuufLP4CMACR27t5GkWdBPpb9KmlPJKSn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82231e30-3042-4684-4b4a-08df4a959a5d
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:44:11.1121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gry84GFVNTcH/MYze/gccSWR+LDgpnnTexDXlaa6DYrg955stNPXEjzAQrrv/bqL97YRG23s9z0Ryd+14m+uGOmfHExA+hHjxCbL3x0QoDg9VYITlGUGT+EA34dyoDTB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_num_dai() to get component->num_dai.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 458fe11a10da3..8314a2e8df55f 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -393,6 +393,7 @@ static inline void *snd_soc_component_get_drvdata(struc=
t snd_soc_component *c)
 }
=20
 unsigned int snd_soc_component_active(struct snd_soc_component *component)=
;
+int snd_soc_component_num_dai(struct snd_soc_component *component);
=20
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_compone=
nt *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 2a82d19b126d2..a0e1a7648b818 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -104,6 +104,12 @@ unsigned int snd_soc_component_active(struct snd_soc_c=
omponent *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_active);
=20
+int snd_soc_component_num_dai(struct snd_soc_component *component)
+{
+	return component->num_dai;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_num_dai);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

