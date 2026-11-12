Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443582;
	b=ziAhF6Upc2+eqbRR5m097U/Kr9tmBu12fHizdoplgoyY8zMxuN9r2D+iJSNR0rkuzyoV
	 DuNDtrR21xyveFKc8LIgb6fifa7kU20k99+pCI0HSri7rNNbMiLYjvcV393sB+hc5h3Db
	 Hi1sBaJy6ScNG0y28qMaF5xyMAGXAaJRqZJXzJgRr/0CyrCj0Bi4xitdKNNYyZVwT7uU3
	 huXkB1l0Jf4psTApVKQe1L0Rt8BVKex5eB7HTtoXW7jYB6P1Sp7xZyIcgHM4HmBxYkgKp
	 Lyn+vtipTPYgZzXZajLjmZfEtLpgdZsFBvVCUzNPDbLwMGMRlveU1YWYu/t8wK110aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443582;
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
	bh=V5D2B5ID8DR9uX+3Cf2QsIJ2OZVZObQCClxAgsUHs9Y=;
	b=H5U/KkWOu9rjiZwqon0CvAiU+I3nJ3oI9/LA/A/u8RWHQwEfxly2arhxp/CtHU9jEEjO
	 we3CKfJS7/LMfqFoT9HkWIBzKGCNaaBsSD4IuEsomjgWJEVOcwxXhbp5OyR/1WJTKdYKl
	 F6iAHW89LFTmgTv8NvTsxhnbjS9NOfVpM2Z/hfzbAw4BmQ8KKLftuRSBUAz8NDMFMCVWJ
	 ccBuJPaH3osz4GCVRgCml52hB4n+mCNaG0jBNsxKo+CG+o7ATMk1+kUpj9OrXsmIwLThC
	 6oss7tN8GTFkLdTsc81RIaWtU2IK8Mu1A95Odl/6f3QZ95rFgnhwbaVP7mifQMRbblA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mPVBLtnC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.26
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7B606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C7B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=mPVBLtnC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIJHlrXzAum61HdtsLDe1dlN6LWOLtJgOhr8kU6yHIvkMIHjJPv8u1hlHHhLc52qWBMWVJwtZgiw0hU5yTIKoUzy5fzul2PWoop0Ae3l6zodtXF18wF3fRAOHJdMkTHoc/cZwIMqv8VZRcxZXSEju8IJGfWKuXrwv4HQ+FVasMOIuW7LfZxEnvya1ooeRvZO2zEi36pGlGCe8AvMS0ozIDBZbcnEcE0QDmXHuVoejwEQ1Tx9p8NE6t+gx5CEcpgLjytL7E8LlH4c43XraNf2q99eoN/0QzZPW2+oy4papebTDy77altqbpUbBxL7Cd5Z4IwMRCzinD76GrwlvYP2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5D2B5ID8DR9uX+3Cf2QsIJ2OZVZObQCClxAgsUHs9Y=;
 b=PTMhmVo0y7rERRrnv+MAUy/ZP32Btw7/0mQPOR/hVHpr8n7e3pDTbRqJ8xjCvkO+HS1viJbpq5vHMEtYjERLNmh9/BeX3H3Upf1wpHz96bSXlnzipKFwPagYHnDHjdMqNvibdaDHfgHKs7MWb4UdvlopZJrRozkThu2BBjthNlA9Mxwmc91l5+zyBBthW1VdmpUn87RO0GIivqvuLgTkKO1T458NljPJpHEMgTq75Ja9D/DsoUBcUemV9K9z19zfTJI1LiMCeMta4zA3RKwak7xnl3+SXrPLsdynCCgL61+hrD2glQM9HZZNQ5Fpx2h1xPFU1Chy6YQ0rm/7zyRsGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5D2B5ID8DR9uX+3Cf2QsIJ2OZVZObQCClxAgsUHs9Y=;
 b=mPVBLtnCIFtOUZpsyzghevrjr/VK1s4q1PYAwqrvzC9pqW51fzb2r1FIRa7DQeubINDUxtp88HEstdW235bYcBA8GTSd3siaOf8HRgSosYYNT9zMynIPC76mMkyUMUFSKw95eMjuaHYmXuudTWfJYj4RhnN9Pt/n0JTpmVsUKKU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:33:00 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:00 +0000
Message-ID: <87eccq28jo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 15/27] ASoC: soc-component: add snd_soc_component_to_dev()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:00 +0000
X-ClientProxiedBy: TYCP286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::12) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d318d74c-baca-49d8-6600-08df40548161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|38350700014|260925021311599003|260925022911599003|10067099003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	wUfE7ySAtDJwjEviLuuloHCml9kEtu+FXu3FDTgxjXsX7VBK/WDZml4nM3Ran2R8BHdWUtlb0Quz5bNSpkuH2/T9WfU4ZFbjaGqJ1uR0MReh2OJA9aFCRcWWJ3dgTVkYs0mgdWFW8mOjz3LKQeLqH7KGow63nOTiFosEaibn8BzWvFUZhXLYvcudGmTjf8Jep94xSdy4jhV76oF8oaZYGDSM0l7FZ+WNejL2qSIJE6KVOb0s3TUj0yoSAs8NtcaWaPlZxmxE99IEb5MUF4KP+r1HLTxykGupOeNJZvnvM4Ew4FHQ7u59G3leJuzyXKo+p7PBQOSEmFfnEXGAvrCQI7levz1G1BFdNg5vJ9yWgVW0xQ9FUOeq4xImSBqGi0warBMco/MS68LXmAD6whCU77NtAiCewfjMurnXA0O5Z3VkhBFBAPEcahRpf0qGfsWcK12LEn47LFCjz9Y+Wp6wrx4n0HzP0/rZTlzh1D6VN2DeWzxC5LLT78JyFoL2k/Fv25Pg9WZMw6mGB8eI7EdlpXCR7qCj6ghXG/lThh5hQJCaqgqx+4cqXJw4PMWKHdGSxdqvqOWdvDKOyb/BZ+FQWg1BdPiLcuRjBvefLlqhN6EPbcU7+m3D0vPiqvobSPLWm8gBaAVoMENZgz77ScvIXSNDG8mot+8usQ47vV98NX5hgXok2G3EIlJjUZum/279PwRwV8RdgS/XZabDh+wLHtyQO0S88b34stvA+qVOvqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(38350700014)(260925021311599003)(260925022911599003)(10067099003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?nhbfJ6cUUyo3E14CIfJ0MsSAnjETfOx7QpghAzygY55F0gtwFdiAZSjCGB?=
 =?iso-8859-2?Q?yu+QhtxJ/XsjQCtCXOjGDfXzLfpYG+U67CVWW9bXCpOdrYDTcAw5gLkIip?=
 =?iso-8859-2?Q?TqdIPeQvuWIOyuE8snGRn6TndoiRyX2kXFFu/DlDZJsrcVH3b3odRyTogV?=
 =?iso-8859-2?Q?OenjkXw74ISHjfRnmVFqPmxxrCdrU9yqDXrBPfmT6c4PQcTwQlgWiP8NSi?=
 =?iso-8859-2?Q?9Q5sLw4h34Hqml/81t+PI07UckadF2wDSCccFL9lakhtdNdBUCsJIjlZZN?=
 =?iso-8859-2?Q?4E+v0LWEgZGEzRORPubJVLxG6Gbv0O2FbDYGCc8jPR1IdqFCok0AF5iV/A?=
 =?iso-8859-2?Q?aRQPWivs7raetqf6Zhl+e2IM27wwx+X852xbaTMi6C0ESIY2LsxvEJktTw?=
 =?iso-8859-2?Q?QK3lPIAWUaviCe0Idkibbb2xe3SZteTgOplBdgVyma3QygoX47PWsu5pFv?=
 =?iso-8859-2?Q?JDfIZpCSuEjNODSRKieAso7OAtGSXw8CZLBvNuGvVnPvVAFJBLcm0gQmw/?=
 =?iso-8859-2?Q?FFOWxvWqAhSuWpqnO5oZc1kHML3/QXZoI8dRXDz7oftUnze+sRd9JxlICq?=
 =?iso-8859-2?Q?EvVhYwpqNpmtlNKicOUaYrMnEGqtxLb/iwsK78waPQiONSnBABxRQPQPEm?=
 =?iso-8859-2?Q?wYtranYPQXz1tM5ohYAZI5a6PU/2lMKUIO7gb4/IqTiGjLYyqDG8MewQTI?=
 =?iso-8859-2?Q?KQKKRH1QmVonbd9DA8Wa1nsaULlEorkfKYmfOkdkVRAz7ytCnI1B06Qx7V?=
 =?iso-8859-2?Q?oS0vuoBs9LzlSv5VTB1ZCGoA6YRhT//uXqUun8hydlEJ/3As3A/RBV9dMi?=
 =?iso-8859-2?Q?aQ+2ncTg8WpB+lQHwXy+KtiFmgQl8vyqM+KcXYYXdMlwKHQmRgWqlsbSha?=
 =?iso-8859-2?Q?oqzrqjc3ZCvks8S4nXLHErf7kk2iMU62bPAU5UnmjU/cta8JRDMXzoAF8Q?=
 =?iso-8859-2?Q?RtyrPEYK5yWeOw8UZRi2UknhTRYq+6zQYec/k+YjPPf2cVRwxr9+wmFB+V?=
 =?iso-8859-2?Q?Tg0bc5rrqAzOPyGJDhzO7jglvM22p8ZkzPX5FKwDNVW0XR8NxiSsVKd6sT?=
 =?iso-8859-2?Q?Khfl1e9ywV3hKp3iVBw4vQHNn2nIx1PtPgpTdjvjJyTDnym4rxTCm9hK7C?=
 =?iso-8859-2?Q?vP6HmAfskXjq46ecr3cvij8NBmkiG8G36TQ5Lnjnl8g4YHsxIEB44BJowN?=
 =?iso-8859-2?Q?QD04wPkYC+HSJ1vtNaxyYRbyp4B29tzBR1CwBVXFxOGLrle2fiJFrOxaYh?=
 =?iso-8859-2?Q?sRkqNMfv6pBQNAq9ZggF419nm1gbWCRqdA1/FMCUUlR+pv7dKXnSp29Yjt?=
 =?iso-8859-2?Q?bUl48VqqhTEy+ZOV9rM7foqyzwCryr2JwENJ2VX2Mejy7mMs2ihFpYoGLP?=
 =?iso-8859-2?Q?4nTBREdeCiip6v/cV2mT6j4o/rj83nA63uXl6SH3k/CXS8SnY3nWhHXQl3?=
 =?iso-8859-2?Q?pNqhKR7YpuKw1b2WwrO1A1E6yjAxim4HG3AtCU/Iczzuukm3Lpky9QudhG?=
 =?iso-8859-2?Q?UawBFUTfbkZR0U/rtFwfV8MDoJtS/EwASbMv7IdMwSQJ0TccXloI8iAvUG?=
 =?iso-8859-2?Q?uPfdT+WudR0jADCV4Ov4cXiR4e4XJOexK/BJ4ORlux8LD/WyMHrM2VrETD?=
 =?iso-8859-2?Q?kqOBvcCiSSgmXYJMsijfKVEFbaq2W1mCIWk2HCalK5toUJrF+nR5nRcNQZ?=
 =?iso-8859-2?Q?g1cCY4DAs4cafYOFWfd8SuoNWCB0Fr7SUk8VLpyDFZEGIsAc7ygD4xO0/J?=
 =?iso-8859-2?Q?G9mrg6tk6ySt6RdkdsSt1D2IqhPBPICNtriS20s1vhxG6ljc8ZI2cMJDo/?=
 =?iso-8859-2?Q?CCIKdnoqsppXLVLNGjDv34FyQafQQ4AEfLne9YBA+VyaQw3mVYpH?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d318d74c-baca-49d8-6600-08df40548161
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:00.3574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVxnJLTBwLN0lP6WV3qcO02+ZovVHNXhejfP1pFpccXC2QnOx2sSbgfGFA1//Y983DJPO9Wh+pHsBlm7B+3P+2U4QdbsW8hrIZzvoFciQd2vtX3R7tgFbuEYXr7E/Pbr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_dev() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index e78e0c9cc9d0d..8a03730a2e54a 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -272,6 +272,7 @@ struct snd_soc_component {
 	     snd_soc_dai_to_list(dai) !=3D &(component)->dai_list;		\
 	     dai =3D _dai, _dai =3D snd_soc_dai_from_list(snd_soc_dai_to_list(_da=
i)->next))
=20
+struct device *snd_soc_component_to_dev(struct snd_soc_component *componen=
t);
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index e3156189343fd..9a5964462af78 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -61,6 +61,12 @@ void *snd_soc_component_to_priv(struct snd_soc_component=
 *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
=20
+struct device *snd_soc_component_to_dev(struct snd_soc_component *componen=
t)
+{
+	return component->dev;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_dev);
+
 struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_comp=
onent *component)
 {
 	return component->dapm;
--=20
2.53.0

