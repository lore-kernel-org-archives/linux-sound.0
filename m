Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571008;
	b=yA7cvL2TLAyIEJmGMkcnYOIzkrihyFargig13BOP+MVyJ3SX4CEFBDuwB9ck5t2Y46qh
	 7O81QsmJiNViY6KJTmuh1rVcI6II5jHe6G0TsUJeWqGICtgucYI0e4kF5gciKgvViGGWW
	 EJtogS14V7k5B6EdkFR9WGnDuZpJHEbmay4KDoKkkTlubtKKjf9DzaHiwzKXgvF8qQmjg
	 ivMxC/JRe2QXd2wLe99xmFdJ8tRWAZZkwvI9StyjjwvSfNzV8eOiOegcoTUCHvql4SJXv
	 pXJ7lSXmVvmqrusrAf9YpYVg9Am6ksJGXLpBu6RusB9DERrc2mJ8hf5jlQFJuzQL/oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571008;
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
	bh=jWcgXUNnXu2gyyEJhokucM0t61Sxn4yOo7JR54thBbM=;
	b=4e5Gu06MMlPwhS0GyqOW2l9yvAK+87WAzZA3MEr2Z+TGARCKe3LXU9BuSzVjyDrniOE6
	 a7a0DBWBy+EjjaPP9ykqpBdKBRVkxz8+E/7DXMOF6NsG+j67SN4YfssK0BIY8s9DP8PC/
	 PeVzn23DVY0RDIz9O/gwP/3+jQLN2mLTh9Dzd7C5oKWFVLksruHlOtaMRhA6rcPPeJSLG
	 6r/lnE0zW+bo4FH0ZVDOzzwUV9HJZnluT8vxPcfFGjkPJSmG03SoWkV/oKcXHrg6qHW3m
	 cDWysJY/8HQpunzuVfiVEhrQKzQaNOhIj0dP6X/anEQNYMDg7jrFwfoRc7OWup4/2xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=d3+qqRwk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.13
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE6F606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE6F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=d3+qqRwk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcrDKIiAPE8L5TJaLqZF1mba+EFYbi8Rv/3wHBrJWXHQJbBtJM8f6VIGQ3N82EjZ1pY3OwkqNzmR0l/5tb1+AtSZvF0gGWqhap5juRcoG+cm7I6idCRX0p84tgWdPpFc+LgVlHVaCMOcD81VxvR1OscZLxSs62V/M6VT/B+T69tGynqoY96CJE+dPF/nb1DC0Qaa2PFA3fYfAttPvS7id2acHAXc3UZX2XtRulAe3pFpcPzBoOuQi0dEff9yyaskqQc74iqxQqdJHb3d6/EnHWHhwHwAVEra0yG8woUoNORos9vcetOlmiEuX5867/ah8Suwjrqk9oGksJ9VUK32Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWcgXUNnXu2gyyEJhokucM0t61Sxn4yOo7JR54thBbM=;
 b=XxpuEDcG6zV9bMjZNBdIuOQpQiW86FtOsR6zdFgAdy9ArjW7idI3HSJTNr2kpLCGGI7U21aJbeWH/Nkv8CgtYHuh+BFX+Vi5dqb7RGHVfG65yUErkS2zmzVkQzDyCgRaYVhWZ+I4z70ZKdWPx0eK/W1BjUUiaj1qFTbYbRkIg7WQsnSyswXt8IMZU24I07HxDxt/bgYtGxJ7D0g8sYAYeND2sDF70deiegBFHRpD1YnKPyXRZsMLorG3/1xqx/0WdVl1Xju4/K1EBLRAKwwIWlMPkY7Q44IYEnf1bTU5wzA4UKTVKqm2r1vP2/lJzPEm0ALhO7In9tHTOyUmojqKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWcgXUNnXu2gyyEJhokucM0t61Sxn4yOo7JR54thBbM=;
 b=d3+qqRwkXC/pBzHpg1zzB+Z2So1L1lCiwlVHTRSEyjfvDLuvnnIIaKtFB72Og7/i72KNW3IHGfyT+afmigamGtJpQ11yrUTCX901LiQzhyxxbpc99puEmPp7bwRtiFm8QjD2km26TUvontlU+C3kFerUVKJenCeR0yXNb1yRbPw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:43:24 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:24 +0000
Message-ID: <87pkvteldw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 14/27] ASoC: soc-component: add snd_soc_component_name_prefix()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:23 +0000
X-ClientProxiedBy: OS7PR01CA0296.jpnprd01.prod.outlook.com
 (2603:1096:604:25a::9) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: fc8a0963-e587-4ad0-15c8-08df4a957e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	sVVyqPKUSn7VblidCKTOD46E6pDE8NAVXztH0/5QCJBAzbohqIWLKa5kkZ9cy4+WbZcu076o8Gi5ZlGPtPWGV0yBKyMIpQw5UNUcyJFsVzntEIXTjfAS833P+o7lSUADCxFnXTNl4bSBO93ndVzT+MV+4pkHJzxJkfRlq3I670MrhEELjFu7cuH6jb8bChKRCHkRdr6t+xzCqVXDTdlzLUQs8a04Kz90h7G9wvKnAboWULuqhrFhz0BGuMxv4W9HTvVcKeFTW8NvgUrqffAdDxQI/rGYw7g3Xq5uzTGci1zh9hM72guc9JqY2qkHEVQxeLZt28WRoIJMZpzMFH9o4qo8rVSADpZXsRfx7hPOI5erXDIG4vUuukj9ojiVd8XlNmrbhM0HHPBmi8hgQ5XUTOIyGLG36KvqWbu8JkeqJk/wKmxb5XTsGumdrckjTXPUlSHxm8CJft6kN3QtA0j/tiMc2+S5idCIZZiJaPrAaS/uQmtdSvHIFN3/6YVexiZQ2zV0ORKblpW2Ij2DPHMk2uwZZiDr5uX0Hk/XqT+qRmi+NsGfks9U6y8QVLsHh03rDFdJ5W5xGMAP0ENz2dCCwjKPqhOOaV6x4Z/FVXV81yh99a6rMArzzQrXU6qac1yEogMhnHqmsSr8O7lnXd9n6KmR/hPdxbzzT71iAL6qzyGpvxfEZzor0e7ssTzbA+1IB2vkPmfjaAC/FiMZP+TARA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?xo7z1/PiNN9PlZM1v5UDr1m3tRTcMP7Xw6GupSlTjuYopm641/EYvXRHdC?=
 =?iso-8859-2?Q?nu7xvYYd+094rKGawIqaRsUpWGPkLXwjTxY0pDk5v5D2FV1aTufk79OGEE?=
 =?iso-8859-2?Q?NgmyjD835nT2TBuCjWDXY1gO0anOwiQ+7yhH0GjRp9qPQ+bJGd6rE774DB?=
 =?iso-8859-2?Q?2G7yqTcB3SsPudZEsVvICl2GP74cUbotOfAsJtbCNe3mnbmuK4lQaG6IGl?=
 =?iso-8859-2?Q?SV8WzFsKU+d4VIy0NfFux+y8pyAZh28ErrAJbqZuzNX7XCkNrU0Evxed+t?=
 =?iso-8859-2?Q?hqopSksLwCDUZheiFt8beWpRwH7PMXkzTeetd3Tu6ODlSwmuvR8Ts3Ega+?=
 =?iso-8859-2?Q?oCBTK00g8WPH9NUZdJmU3PJ6DuN7j2REd230XqTmH0Bip4F7n3la46um1w?=
 =?iso-8859-2?Q?K988TiIe4gGDYxDbi8V1kaSWRDna9/byDGXo8cJJ4y9XXSI67+Lj8GP3ju?=
 =?iso-8859-2?Q?J9EJDeCDzLi4TqDuGy3UtkHeMpLL2LPAsx4aLOH0T2+I1xEhAHzRtgQ5WK?=
 =?iso-8859-2?Q?henG/skci7OTROhwNuWgrHr3NWbquIlRzHe8ACG8HqK6+PONSM2v6C7DpG?=
 =?iso-8859-2?Q?UYGbw+yIqG3EIm/9k8h6AdKa/ycEFVJZQplg9EXKqKH7PYChTlRMewQktz?=
 =?iso-8859-2?Q?eCgl3l+G+5DQcMfCuxTMA/VNDYww4I5MprxJ43VcJ5DabNK4asFrY4ugvg?=
 =?iso-8859-2?Q?JOPa4fqa9odYFsTKmmq/TFexh9pr6bRup2pWUiVDKYJBZUcruWanF5mHgd?=
 =?iso-8859-2?Q?zw0wU5i7OQG6mLLrXDDwMahoqCJJFmfdaQvH7X+lMeX2Gf0h8yF8nJ1ktU?=
 =?iso-8859-2?Q?R384BMDMj04MkyQPHOjU70dqQWCh6Rg+VcXqeQXRhAeZePreBpgI5F0j4O?=
 =?iso-8859-2?Q?/Phe9QiVkTACbPpbzk//e02xCdk8VVPC2KpwQCfDuPG6JZ91Gs8KNtlt9P?=
 =?iso-8859-2?Q?xwKxtPPOyjINLtANvFxOSTVViEu8nFPGemCU1cSDkxP+rTSn9FqBvb8y8c?=
 =?iso-8859-2?Q?TmtHJQ58t6YY+ebQbwyQwWtwQNpeVNkIIuEZYFK1zHAk0OKNfJRHRWoz36?=
 =?iso-8859-2?Q?/Vaz7Fa4hiUhkq3wT5q8r9Vgv0NQwJam+0B4WLqmJxfMp9iXll0fd48A7s?=
 =?iso-8859-2?Q?gLBUtIhQlinlkI4y3vuRz/m4f5dBMRXnUvSamI3nlyekQKe2IkFLd9DyGT?=
 =?iso-8859-2?Q?jXdMbXPyJTjyZHjDwmJY5igeoEPXpI9hHnenz6ivEtqO4BxXDfdEv8saS8?=
 =?iso-8859-2?Q?47Tk3vVFoI2i5aa4FALZimvmfPym6J0+eQVuohiZoeje1m0GKaSMFHfJCD?=
 =?iso-8859-2?Q?hhImaPP+UIfhmLhvDtewc3WIDsVRdBpVhV+tr6RQ0hrI7Wmow14NCpVXCE?=
 =?iso-8859-2?Q?4BQWFqZRin8ofxx6EN6ocP3nkSL3LF4HaU4D2Ui2dBFfOUdPv5iip1NDGN?=
 =?iso-8859-2?Q?a4Pkv0gxLhc02nnHQHdws1cXIVeomjx3tn/bp9CNwOo7BmneHRkvJKWLg2?=
 =?iso-8859-2?Q?m65HLtMiysTVrABqYHwdiyagnVTyRbi6995G7S9KTUs/7PsHOFv9uMxsS+?=
 =?iso-8859-2?Q?VDoZxG7zwqb6o9yw9HAYYfYDJKTBrOv8G+xf+yqLsV9viWuy0ggZjJD1PD?=
 =?iso-8859-2?Q?Zg6TBD4X9Kwu2iZL1M9V+oCdvLdBY83Bmg05trjoUFzdMrQnyI3Lyv5/QQ?=
 =?iso-8859-2?Q?aEJWoUhkwcmLSwSd6mwqSnbKFT6S3D3ll6eYMHyxxaBeUkMcgqQA9JLiWK?=
 =?iso-8859-2?Q?OV9R9MY+bbcVfYa30nERFNE3Y94sEaRL3Jv8jkrCaWd/xTUnY6WVAylePV?=
 =?iso-8859-2?Q?JrMGYquwL84i92T5mwOKr33BiDLHWOgnPRrC1nB4Q7bIIva9yYzu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8a0963-e587-4ad0-15c8-08df4a957e5c
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:24.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTmzWuoiAS7AzsGTJEyv82ta+gPL3+fo2n2/9RlquBKTfasxwN0chZoW1F4VgSdNOGsZFudmuSWW7L/CF4rRodBxGfp7PZxBRYHYMjoXAMz3dEVN3vS1fy8MIPki1Ebw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_name_prefix() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index caed32327daca..e78e0c9cc9d0d 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -289,6 +289,7 @@ int devm_snd_soc_register_component(struct device *dev,
 void snd_soc_unregister_component(struct device *dev);
=20
 const char *snd_soc_component_name(struct snd_soc_component *component);
+const char *snd_soc_component_name_prefix(struct snd_soc_component *compon=
ent);
=20
 void snd_soc_component_set_priv(struct snd_soc_component *component, void =
*priv);
 void *snd_soc_component_to_priv(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index c1f90a47e182b..e6c0a66c7314e 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -43,6 +43,12 @@ const char *snd_soc_component_name(struct snd_soc_compon=
ent *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_name);
=20
+const char *snd_soc_component_name_prefix(struct snd_soc_component *compon=
ent)
+{
+	return component->name_prefix;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_name_prefix);
+
 void snd_soc_component_set_priv(struct snd_soc_component *component, void =
*priv)
 {
 	component->priv =3D priv;
--=20
2.53.0

