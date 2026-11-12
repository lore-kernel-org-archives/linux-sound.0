Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443607;
	b=t+eCRSouhJosJM9FATBUgv0DGvm+OJRuWaWdYvFX28pnx7WFo3ldqtV4VkYrcG0WXvMA
	 NuOfnlzTDyAR6kKDJw2H5qIkK8yu1Mt4zeJzAon3tweop0ZfGPkhQzIxWqLs5Y/o/DnvU
	 5y5hvlGdT3nfVU3t8rnqmzAjFvwx2UkocpEibJ2UPGKax1VW5U/5Xr6VS4nyDeoPx3acC
	 amw/0Oq1gOv9F62qf7ctTBEgJMMNqxS6UpfB4Eba65FSFXf+KJ+edyFgDM7CJWcToXZLq
	 1nLV7zgTqzLdkuLHwYLBQaaBX9HI5MRL0af081y1Zbn5z1JtPMXP4ANu2O/+53MQhCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443607;
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
	bh=/KR2sGYiBkszl4jEKBbFtpVsPwv4pE7m3oyshNhIxjk=;
	b=4hYBGlMRXaMv9kDagimzQRmTknVAYkuTRhl1LyHoSanP676hhaeS5CjuhWG6tzRO5Qzi
	 MaePvN6ZtvCHLbViyBX3sULoXli8DTDjBZWiJ0p7/3fb/ueSqVmGDIqkXy2TarxsIqwtk
	 JmU/zJDLRk4iVfjL7rThALStczx3PHXE63BnCpR/D25Gfq20wMwO78mIcPEXWDSnyvTIJ
	 wbSEwG6vRyCWKrrsnOjpr49z4CQTbIpq6Plm3Luj3ytTLNv8Rij4anIMKNMCY55nM6PVb
	 farmq/R6/KqJ9dgwU4mc3KfeOJDjoVxjCU91mkL/mGKkVIjPFaXpY2eKvnTuoJRQVQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=V9VcWgTD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.38
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F6606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=V9VcWgTD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIxJQsmbqvILhWop0sSZi9AgLgQFc28SN1kPgr3qDky+utqHooKFtAbNbVLJQ/kOY74Fam1BwsdCgEnToLN1d5oeGjVZiBfO9dZfurAo9WonhcpjqqhIq8jVu+h+DJAHnPWCCbOcvlz6/6JiXCilorRkafAlMgXX2VBi1NFpnXZVhSoxR6fOJs4GI5L4cXyoUsSNGMba6yLLdmYPHShO12ySoDDsvZz546foALVnh4tLAxXwX/ctyA7vvAgLtRWlD8u5mpfkzdmYLnHZRtxvkJF01CiHpCytsBeis/ZJRW0rqnBgWa+XZYM/ruGlHArixgZzdW2pS0PAXxF0eubFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KR2sGYiBkszl4jEKBbFtpVsPwv4pE7m3oyshNhIxjk=;
 b=yWqHUQS43l/H1HICcNsyectHLS0PHFrGRpnpliIjI5DQ/OUO0PFWMZ3qyQAwPSnyfS7Jm/Rnpd+vB/0WsCC+aKH8fDddv6Vpu0EMQNz5XD/0wHhT1oIdKIfM7dtKLCTsuIlaBXf/5IKVMCYPV2fGcsT15YxJHDPZOuXxhdr0skVKxDoPHUry3Elft7AaCwQlG3D+QNLNRtjYQYTcIS4bZzaTyxl2YoW1xAUiReD54I9ee3VHAM74utKEpPpgroJ48hSrsVshB/NeYADntvngEswpCdN3p4DxH62ZCgHJheunUHbHJdJx2MoxpdL9d6fgbNdxfMcFpZ2gL0f2WR0p/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KR2sGYiBkszl4jEKBbFtpVsPwv4pE7m3oyshNhIxjk=;
 b=V9VcWgTDm5/rKKXQnN+TMR6r6SNAmjiBdEzAcECtWRYAw6Mox/viJiUkDDi9uPxpSufntE9Lw/olOfmuc3pEGAEAnJjPndzxhiedJs+vM+gsJ0UaHGy+HOVkuwyX1ddDZW5fvx8AhG2k8tavE6t3JSc5dwBsIB6hhiTdxZweC0M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:24 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:24 +0000
Message-ID: <874idm28j0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 22/27] ASoC: soc-component: add snd_soc_component_regcache_cache_bypass()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:24 +0000
X-ClientProxiedBy: OS0P286CA0119.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169::15) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 68eb6321-217f-4897-0fd6-08df40548fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|56012099006|261021121427099003|261026121527099003|261102130727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	H/8TCX1fdnQw3/yoTPK68PGnYzMICDPVHzVr3rnSbdeYjO0nU1iuFQ6yPWkGPiNEK/L8G/zhG3O8A8UF4+d3OxDB6jcjiiF4kPrv+T7JTNxXnD62/0pBRR7vQwORrxI3Qna+XhDZ9camBwSCVoaAr6NrIUezrQmpp8+es04l509CA/2vvQn6kg6KEj703n9Zaq5JJrgeOgtth7POh87u2a4z1vu/VVVsiKvSFT3L8wQEZBLC+bWd26Y0ci+o1Ai+Zc+rkEdwHR/1JxiyC4ZDbzayiQhqdCRdlfdafq554/WsPCmpjrz8EtT8QH4nhiDgWIRaDQEZEmDwqhUIVr3+jl2TMWNnyd3W6mz6c4MxRGEvzwUmz49DQx9t3vZ0c74SzBz02+S8ghdiK4zjqiEpfNcgeF48CQ+O4CW+dntnq6RkfFbcek3aTkOAeMIuJ0IJcWcpn3aW7JbAeZsgeiCZhlW48SD7bsbwSaD5FWa0hCC3SB1qRPM2bCX7KH/510nirzZwicQdNy4ZVhBzxls2D21pISDN+3ZHKjLvYdKdaYQXywL4yjFQbfTqx4d2XvgUGoDmkQgEoykgHzmtQVLnj4FHO4Yz/BByLFlrDZcC+ehxxHVIrkSLkgR6VPk1vZ+h3u4aQFLtJPSFPUvhADfmQerXxRc1EyNg2VKIgPrEwiujI1C+lp/B3X1mtO8NSsOqSOJI13RpCXtJ5waQxNwmlmCa90Fa3ckn7YqNYgbxH3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102130727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?UkuX1eaCr8TiBncDHNJJ5RyZAVWZgrgwQJj73XEuptXeuvEWILnT6ceJgu?=
 =?iso-8859-2?Q?6guCcrinrWl6j5VEGhDk6MlChXk5G+KIuWm1iFy+MbHMMSmzKCPd9vTntC?=
 =?iso-8859-2?Q?+wMz2XPGitk7ckm5e9sWcbCQg2FhXlN5J9qP/8lCpUdYLcvKbdC6L5i3Kf?=
 =?iso-8859-2?Q?596TuKAuVNInPCkAN+BK6DHOQeaODzgIzQv76YR5+GupujQ7K08CQ/7VxD?=
 =?iso-8859-2?Q?ECdFEOgv6mo/gF6nfKXX5uQBwnI92KJ6U7obLmjwHss/Xbh8nT76SRGk5T?=
 =?iso-8859-2?Q?SgnQzQWdu26hsTQWjT9WeLi5E6ktvYKRefDleKXYiBATQShL2q8NfsNVrU?=
 =?iso-8859-2?Q?G1SWGxeyAFZ3JfVCLbmJp9xanzuTi/Lw3pjxbosPig8iVGUQxoJEAO07z/?=
 =?iso-8859-2?Q?v/20VWx8FiNo9mma6sJvdfLec7GkHlaVR7ipJpIMlfqOpa7PZPRQmzNNTM?=
 =?iso-8859-2?Q?RUh3c2T6xoN7xyifrnbEpOKYsfqE5etNTW1Q4+LYaOlTRGe0ig2M1AErwY?=
 =?iso-8859-2?Q?ORyrySWFQOD7g/ZM9eE01SfeDpGh/KCvgdNuhUF23F5n3tLG2vYaEqItpb?=
 =?iso-8859-2?Q?nVaiofQ6TC3VVrn52NEekV/9dfDUdRTsuxicUtSIgun7jGgHnHL8yi60qA?=
 =?iso-8859-2?Q?2rWxBf5S9/0m3x8ocIj/qTMKFxxZq7ZiOCRujOWe4LLdTbjMoW9mLcopsM?=
 =?iso-8859-2?Q?yXb2PAhxCaVPZDN6mQCQne6SD9ADte3YiDEbzGx9DQSjzjtbKjGn3ABvDf?=
 =?iso-8859-2?Q?V2xkcOYni8ESYf6LrcQf3HDBHpbn07sLzVMVHOm/KyO0+YLOmtxNP6n4Ow?=
 =?iso-8859-2?Q?Ovt0DKggxpvmnhn+CxXw0ZqLwviQAI3xti2YtoDWyH/m3DUe9j3ftrdeUe?=
 =?iso-8859-2?Q?mfN69uSTEpg+a7rE2hzIZ5JLV3ThJiOhh9eK4JOOkwbkyc7y2BMwEvCVhE?=
 =?iso-8859-2?Q?z1ezE6pJWRLvimtHG7hLf8mr/xd+cv/vbqPNAhbarX6JcY688UWdNOTo0i?=
 =?iso-8859-2?Q?jOEZgdTDtmpx6VTYVjIZgN5n1Xg23ZhxpCIl+ZaHeKG0TTAS2p27pg+L2w?=
 =?iso-8859-2?Q?qnyibkL9h5LjhOzNs/v2yQpPuJR8YFIIVjm9SjFjtf3SI4DVf3sR5wF/42?=
 =?iso-8859-2?Q?ViWq6XidJ0vUmUmWkgR2IVsySXu6693gt/amwA5bH51wqtxpmdenlEHMUw?=
 =?iso-8859-2?Q?kb3AaSZUdTQg6FLYKPvzwp3KizsZqG67gSIG2FFoQkL2d7enuDDf5REjBE?=
 =?iso-8859-2?Q?8aEofBprjBMmGPuNdLfDi/GnG3pTstmxZP39NhgF2+ba1uKvoW5HwXNe8K?=
 =?iso-8859-2?Q?oU1BGvfCak92xcTDSp5er2fxHE6aYJ0Qy+d0/wpzhC36XFC9ImMwWodWQs?=
 =?iso-8859-2?Q?iasZg+gOXmMaKuwxFK8iGbspJ4x8RdLEIU8vJpXEQhM549BmUz5IN5PYqQ?=
 =?iso-8859-2?Q?lYR+9gIHbQ3/Nxq6fCf5/yOwxmhsGRlEgPy8MyM2m37xavvg+M7D0Dm7oR?=
 =?iso-8859-2?Q?8mKjd/17QTSrUPy8j/CaZsj6NGuk+KKaBcePt4ptN4vxQLoC2T6qy5PfIy?=
 =?iso-8859-2?Q?Xn77uLAdgIXY+nEJqkVABOvrVg3QAigB6deRlsCiZAh8rUBnNrMBMwi12y?=
 =?iso-8859-2?Q?YgK5DXUEpR0S+Jcdvr60GtzTruU2oYBR+hpQU6afr2rd/clGslCZkHGaZe?=
 =?iso-8859-2?Q?4wdHJUaI0G2HmLqDor+mhPc9MrXAvhdCwO9Tacsz91p5kOwHSuoMH2gXAy?=
 =?iso-8859-2?Q?xKgc1Rx3CJCDHiK/7UadT+fuwSNFlAZSChL/p2Yk6NoUstETXO1zekp3Y4?=
 =?iso-8859-2?Q?eCleZ82+8d6Mm5r+6fqUUyRyh8AFJlYhIrpEC17WvDRJ3AZyYUX7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68eb6321-217f-4897-0fd6-08df40548fd9
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:24.6458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbiGMwwsStf5GUey3cnPZb/KpbO0yXzhUznRoaL47Sr0iDy3DYo7tim9gbZWTgz0easrNVL+OFRj3LusZ0lReHSOXXpxuTQZAe8CpMXGse3Pyf4BZN4Ki4rHG1crIeIt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Adds snd_soc_component_regcache_cache_bypass().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 3427f2f094956..7b1d9775422c9 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -359,6 +359,7 @@ void snd_soc_component_regmap_async_complete(struct snd=
_soc_component *component
 int snd_soc_component_regcache_sync(struct snd_soc_component *component);
 void snd_soc_component_regcache_mark_dirty(struct snd_soc_component *compo=
nent);
 void snd_soc_component_regcache_cache_only(struct snd_soc_component *compo=
nent, bool enable);
+void snd_soc_component_regcache_cache_bypass(struct snd_soc_component *com=
ponent, bool enable);
=20
 int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 int snd_soc_component_add_controls(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 983ebd705569a..24c983c9cd1de 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -527,6 +527,15 @@ void snd_soc_component_regcache_cache_only(struct snd_=
soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_regcache_cache_only);
=20
+void snd_soc_component_regcache_cache_bypass(struct snd_soc_component *com=
ponent, bool enable)
+{
+	struct regmap *regmap =3D component->regmap;
+
+	if (regmap)
+		regcache_cache_bypass(regmap, enable);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_regcache_cache_bypass);
+
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream)
 {
--=20
2.53.0

