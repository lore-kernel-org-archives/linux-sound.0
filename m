Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2037339381
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909538; cv=fail; b=E5or/dzVjNoEwxlMaHQ8xW56yxD1XyBl+svAacGRqeIHSTmW518kHsqFdmZvW8xP+foQSXT2WBAL1GdshiV9AAre34nowhHo20fOrdTOmSSp6uwaL+JyxiX7ZGZu7F1RvLdY7RLsrzk4YbFND+J/pf/KKDyKbNctwYsbFK8bqA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909538; c=relaxed/simple;
	bh=Mkqzrkzy/V3RRyxRpKtNwpaiuPYpG18awdJihdEJsiY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ya1ezj1JVhX79dkh2YHahosI1jvtkbUWETFA1EzV/3sUslOH8s36kSVTgs7VtHHQ2ECdhQVbdrYoQ5/KfV0sJ/kAsPJoYeRwubOHAWJ+0sUDbuakOhn3Oqm2zu1qwKviWuBCgOwk9kZCYxy3wzCv4ZRnQ9xox46S0EMX8fRahHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XXdz+OC+; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XXdz+OC+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8r2qDho329EKr6fOlCSHOLNj1V7xpB9hl2E6NwOxwzy40kntzWpVn2uYINigHH4C4MZiyWR9TvLTc5NCTyXzEyLQSh5r1QF0l0360q4drzQaoOmKZBnRnEaJYizqZEXPL8HL6nCjb4bizwHDVlPSKYbaJsDELctH8o+GaulVWXopod54CYC48eDckncCu9hFLGTRDaAGGDqdFnrNE+o9+JsISaiyS7v92Qk2uXIaMMukJf06GNtXxVoGiLo2QVR5P+K52HY2vWqURYN/qATtNoEySW2d+2NR7SPxAWlGcuauASNk96HcQUC0Oq75Wp2mwFQk+OaF/6h+g9zlZSYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bPvQJMAZ1jlsGRI1EY5CPQmM+YKA7xdgpmRlIf1fAk=;
 b=ETmy41Qz8HmsGTXMPugMb6bp9qcQhFwzzaXbERhsuVH5CLijhfgOw9Oqt7XYkTTxK+3KYUatbxrr3Wn1aXI/JTdE5ou7agMx9UvdbaVJWKblvP/GhKN/g4D0w6zdaaXfBau6ebrhPl8KlI2ouUM9ERz+uwWWlFUFP038f4YKbGSu8dcwBdP6W+XNY9UlBjyL/EEOqsd4onkt0YZ4tyuwIviLaDTqDlqWVfL+Jqigr0qjVT+yE0l9bIiQ8tcTlQfc4teKzDXCQuz0BQeQM4cpI+BlQ5GbKsxRRV1WOZq3xoidzWySI2EBjRvLuqO7beqDjnx7UhXlT7oQDQj9phMGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bPvQJMAZ1jlsGRI1EY5CPQmM+YKA7xdgpmRlIf1fAk=;
 b=XXdz+OC+v0XW6H+hbHxaI+vdp3xc6XJMczTWG4KBLjgFAFtr1cwtm7f1BYizx1XNH+W3MN1WQjl5cYj3es0oU+hR79qnuGcuhGL3AJOohHfQsOhbZo8hgOkLaKmr21uasBZIcYbOaeEoguniXzsIltBqFZgwzf7NI+KlShPXFqM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:52:14 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:52:14 +0000
Message-ID: <878q4g6cgx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/13] ASoC: soc-component: move snd_soc_component_active() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:52:14 +0000
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: c5059c84-7a7c-45ea-4cb4-08df203029fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ho802YDX51yzFdwQmdkvpZ462qXB6t8caS4BPOoXiwm1lFg2T40Q7LIvLd/c+AbiaRYgIKr495gCWaX9J6OHHcnYROMsIz+jlZ1ytSfR1mwth0QeFACssGGWuLc2gxor/ZQ+Iz+4iWcdR+tqyamtTNSzHh0O9XuQ9uEoDBhVbaLM5wpCRqpYGklJxZ/NiNebWhPUOSSwpHc+qFgBh98nANVKPXzak5/9wAxj1TIJxPZIyA0yIpgNLQpsJvrN4758BWBDcKwuGDbBjv40XX55tgloG3pySU/aEyF+tZKiIO4Rn4I2p0jfxx6SWCIsIC4cbmF7IIXh9GP99HRmLNP3qsgtrOe7NJeRxRUeDnX/yZMSc0IJeK13TdkEfkEHvohUt3pGAjRholOQKNn7ObsX2T9jP47L9JTZNu5vgxkxz0eWft64Pu8ZJzNpFEhwTnhkEqKuUtO/fR3d4igYAC1q5J6kQFbSX6TOvkVRGxLoB51tm1YuYfZXaZWkktBGqBkIGPXbwTE2I8Oxs7KpLs6/T1CgK3pFrYZ0XYAW2fi7zomzWhOMnKsezv00El/qMVKnkfL5XbYqyl2NFGIqu9U3NwSdlWZq6h2BRE+gKrjKvwNQju8x1XZMXDSsdbm5niYq41pgzS//xqiB9PR3h9DhSdRimaRY8NUeVM3YbzB75LfE2eKugqcqhMG2A54mj4RT58kq2FMWGxP1NuT1mTqz0/sO0wlp6KwuPDnmsneYNRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?CljPFz4Vp83vThVyVCBrhAn6LqhSegKVhjJWO4zERH4vqYNYvngVY8yJJg?=
 =?iso-8859-2?Q?4Ycr7PTYEXf4AoJsh8NisFQz7jwfTKiBbyLNU+KzQr9cCD6CLmB2fxQlwU?=
 =?iso-8859-2?Q?XBMWj+7UhRnwiE0GfNVNEyLA2aXbRZWpOCYCA1Z4gGn3UdpGramE7Oergk?=
 =?iso-8859-2?Q?05erGqFgBqktUZr8Nr47tEFPgRbOdSf26owd/dRn/UWcAbNV4r0K1ujyzl?=
 =?iso-8859-2?Q?0zaLse2ptGRpyB/pylGSSqstnASWvLZr/Gr1oE9chZJC5moUaApPMgtsXu?=
 =?iso-8859-2?Q?RhS2QN2QgcIrQfbZEz/VdcPxQUkdye7qqqWQ/ttklPo8L5TQxDxcvh46Au?=
 =?iso-8859-2?Q?DsiWn8KL29OkqCQfjI25Mue5iiCXN9tGj2UXC9VeqyrT6PjWAvaRAj7mjQ?=
 =?iso-8859-2?Q?obFbzflw84rzF6HoLarX5LFa4QH6sMgeRIT+ORqI4i6VUlJv34lZr/phFg?=
 =?iso-8859-2?Q?Rg4Xp+mVlWrGmS9YcRtdbkGGP/g6eenVvng5kjPdLudCun6lZtwChIDP8F?=
 =?iso-8859-2?Q?ZjykrcMr8twjlA0NzX7iLRIMCmTnPQCTbXvvMPUKN63yiL23IkOscJycFx?=
 =?iso-8859-2?Q?VuyFeWJUsYJex/3pF5qKHoKYoSAQELbDR55g0jVQB7MCamE4i/DYiimRLh?=
 =?iso-8859-2?Q?LAHWqolYCGqtbE4ZiiB30ldHthbN/J5fDJCIaRYtxJ9X24qgJWH6LoPv8z?=
 =?iso-8859-2?Q?/ydpQkjFmxtbZCwq7RJvL3nV4WRLtM8/LsU9l49jxOVzo+Sr7zxWuzkVWV?=
 =?iso-8859-2?Q?hmlLnh+OALXq+lSgD/Q8fHsHz2q2FUFcbpoo4GKzhUJqmrg4lX64mo3mj0?=
 =?iso-8859-2?Q?LP0tCio06H34KpcOr8iuILwDRx93KT1gdD7JSJIQnfGqXZHhNbnAj65xF0?=
 =?iso-8859-2?Q?ntU1sApzaOUa/MVmMGsdHtwew/trGNQDmX9uD0weO3van5Gas8TVuMfWWk?=
 =?iso-8859-2?Q?5vEJzPgWjD6Wvx4r/jZ3LY92tcBQ71o7YHVmZFN61uZpsYuaUIRGuPIDoF?=
 =?iso-8859-2?Q?C8fyPQCQRhqpc9qkJgiKhN+21o9L/QuWlyFuX16IhqbheZ9gKG2NquwzQ3?=
 =?iso-8859-2?Q?SaQBob8YlU1wHsS67XMMrbKDUWblUf5CklquTZYy56vvcYEvqh0e5uNyy7?=
 =?iso-8859-2?Q?wDTmmQYxa595tYTbQ7MFHmFdeC2oCtXmNuZCUvtLqlcxxUOp6o0O41oCca?=
 =?iso-8859-2?Q?P5tnCwLS6884mNGrseApbH3Gp+bTrk42G4OQMKTY35PZgsYk/911VxcjbD?=
 =?iso-8859-2?Q?bNR3CVApK43O+hjZZJzsk31iJmxH8hD9pTIs0avR42wpYdq95rF+24OO4D?=
 =?iso-8859-2?Q?fXiuP3c4Ki/9BYu/60PFXpYHA3Gj1goozrSWCwfDekdF+XWZfpxG2qmajd?=
 =?iso-8859-2?Q?i9GFqf4s1HVY02TbZpHVvQ/b5mRIQHVtlyYf4ibfMgKhIXuiuOli5LDq1I?=
 =?iso-8859-2?Q?w9blowJpFXOj+DcGq7vTDtkkPCnbH7GTgk+uGgNRb3W9hd3AayjdRDNkwK?=
 =?iso-8859-2?Q?2ufLak9nPFFN+ANSnaik7t2rmsBgRjpHajyqA+IDqNPfDaluE4CKKwMPDL?=
 =?iso-8859-2?Q?/LEKGEwyBNbxmMd4GUOPjEpUFxmQg3m7KR6YQNtJSBgz/hEcYJMHVMDqZr?=
 =?iso-8859-2?Q?+dWM+Js0zB9U8lhxG9Y1HCIxXZb9jIWJ56Id0txrHQq7Yr90t0aPNOn5m+?=
 =?iso-8859-2?Q?jZrNWi3eWbjzoPc8fDcaHhP78OaSebmd9tK+I8CxsO/tFUoNHFqcHyhG46?=
 =?iso-8859-2?Q?URzbOKNmOrNfJj7NxeeQbC+85o5F8jCs7mdWTLtZl4eeUsyt5bTYNQC8Ax?=
 =?iso-8859-2?Q?/hmchO/Fra2HwpiAj/ARobkjVnvTw80IECBsUN9/CY+HkpHIAOKf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5059c84-7a7c-45ea-4cb4-08df203029fd
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:52:14.5828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HeciMB7DpbrfPkI0IM75R1ICz1PQ5Tzj9ABxVe6jouaWb/d5Ngc/x5rnSKD3dw6S5ql3fjdQSaofR8jBBS4n1HFy8NUmuPya5nrJ7JyKiMX5YBiJ7s1a4z6gcWHDXbYc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_active() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 6 +-----
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0f5738154a23b..f5249de004942 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -363,11 +363,7 @@ static inline void *snd_soc_component_get_drvdata(stru=
ct snd_soc_component *c)
 	return dev_get_drvdata(c->dev);
 }
=20
-static inline unsigned int
-snd_soc_component_active(struct snd_soc_component *component)
-{
-	return component->active;
-}
+unsigned int snd_soc_component_active(struct snd_soc_component *component)=
;
=20
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_compone=
nt *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 35c48ccb352cd..381195d0fc78b 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -74,6 +74,12 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(s=
truct snd_soc_component
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
=20
+unsigned int snd_soc_component_active(struct snd_soc_component *component)
+{
+	return component->active;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_active);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
--=20
2.53.0

