Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571050;
	b=Z7awCLG/seNgLpXubfAJrr91VOTafHOcfE1ugg6x0Nc37VyXVWW4e/aVFN1nwddby5EJ
	 dK91CjFMqVbjWj1VphTbXoWt0/j1UW8GJ8kVXabukszRLLE1vUiF7RQB3CAiMYKyTECbK
	 tW6k86hJaK2XtKYTVbjsWKCnG1cF15MSE492loJiqmTTwfRV9LTvVopPWFDweMchkJxnJ
	 6squ9j0na29ITx1940huz0hCGWFWvwj+Q7pBy/9XGZgPKCfBxJbr5e8h8aMC3wJJAtjiL
	 5tdfFp0WXHwT1ez32lCg0fcjutASzKoinbpggD79gxISJUKyikWdARcpySQXwJHYynQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571050;
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
	bh=jjXNd9LERQwjA7Ydd4vSM9YQ5zZrJul+WGKzBZjoUfQ=;
	b=pJAXtFUtuOmhE5P+wjjSAy3S+AeRnx9boHpGgacobqR9FEyIPMKklcTMVLQ/eyEIMBLJ
	 42zO+WBcsGQ/oW1qAsuBaAsvt5AC+I8zI/etEgcrj74Sx6P3evKeFO91Msxisk7Kpz4gZ
	 tWn14hcJ+FZXBjFjZMPRd0s21NM15aKxtwzPDWYPDNur67cqRUi3LW9p5mGlHy5f92BBG
	 O+VASsidMqXWZoQU4PPQ7dzaN7S/dTqTDUIZ0LTRHgV9KwWdj4GDVuhb5zJo3BHCUXQf1
	 kAvkozgrJtG9/oUn0qeu7B5YKOFoMHY/Ooc4y+USundQ1twtcmQ86aAWmj9TZZ397lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=V9QV9oAZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.46
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9005606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9005606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=V9QV9oAZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5iPPlrBT5HqCz+rseHegDzy/nDvg+rePELARQhxZwNMs/P1/XeoQqPZvvANE37A9CjO5s7zCnEbjWX7bIDAAmzxlAO+pFYtxVxh5ISkyiDh+t/DjV7Sv+MTyI5+MAJfT0xLfNjxHs+eaMU4d8cAF9u6i1kiTmIoCbZQSkZsOAquikIGTT8d2mvBkym8uXh2xvw4gWQZremTExazzCBD3LfY4T9yyck07ejqMk3TYTjJoLfo+0TcdtAxU/SyqGqd5g3cGn9sbOwOqRQMh3pAlQ41XIpptmHtxiFjLmu9Wv6buJqQy+vyMVKN7L48eFiqMNHJA7Xes489mCl6reEIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjXNd9LERQwjA7Ydd4vSM9YQ5zZrJul+WGKzBZjoUfQ=;
 b=X06K5hWWljzxLonk8PIajuj0ZispRRi3QlxvKj7UdfJ1wkWY/XxifsiBlQn1J3VGWSOiQhqUSFnCuu2JgxQQa25TDDsEVNLNH2VVxi2E3TA7oIKPlV9sWpWCmrIWq38hR7AbdnxkhU+5Q2l3as6LRj7j1gqvgUZZ9oPwnCW1auWrRkVjZc8m5638TrtlLqpM74TvILxGrgLaNazT/T8vi0WSdLZ2GV+f7JWboXw3LdRgzZntCnC1JwJhoOAGPgLgSF+ixtpiU5uqtd5FKrPz22/BAQgbYb0CW926i3b0nB0XbRP4EljF20XnzxH72vVC3mQuhj/1bblT/TJ/kkwlvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjXNd9LERQwjA7Ydd4vSM9YQ5zZrJul+WGKzBZjoUfQ=;
 b=V9QV9oAZRM65JgxW7AP3aPU5JNT9aItzw0NEJuyNzHXb59U4ueM4EDbWdN09dKLMiG+voKrf7c0THWv4Ar9hCWww2SpfMYKToK1TLLpJZNvXa1QkoFkyI6mL++oltZjYciiCpocxsFUGbC3hX6VsOyxc71vkyfhlISAPIo0o55Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:44:07 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:44:07 +0000
Message-ID: <87cxrtelco.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 23/27] ASoC: soc-component: add snd_soc_component_regmap_multi_reg_write_bypassed()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:44:07 +0000
X-ClientProxiedBy: OS7PR01CA0257.jpnprd01.prod.outlook.com
 (2603:1096:604:255::7) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0822373c-35d5-4ec8-9bc0-08df4a959850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	40UVCTavhKcfSaowglkF1QzKMzR4EpioLoctocpYdw4xdJX9y4redSO6r4WMufVNP7MaqoJItthZ4Uunt6bMMHPomkt40MniAf/CK2IgTBPXACcEnHcaTbU4t61mecIgRD+FiYJol4ZVAOGY+5hO4KqRbTYZGh+JP1TJ0W4P0suBb/qBNB2SXSHy4lhLh6u5vMzDFkgchl7dqv3CGd3zO6/kaiShiVV57pN6v5+iUi/3sVkuMDnUvs2AlGRaHEySKSGEmjoOy7xunRtpSNT6SiXo4Pj4Mcl0SGtVYz2NKhKUUe54KMt8DnQ/ZoMa1KHdTkWEde27xv0u5nJqZjrofwwFDARogdNW6Dx9VfsLW65pkopPLenTLoUpxYFwdMjiH33tJev98XOvRGp5LXB5a8CnukBtuhz6r2OS7noOf/DTot2902HsZoIp30Z9HPMkLywFPFr9ylW/XBeZbtjx8uqxw+Hp3qbq88WrXXtdv55Im1W+no4k8VtNqCsZxvOzU6XR+YebWxd/Eb6ixlosT5MHpd4C1olLkKFGSIeyVvO5pHglSFGEUHHbAQQGAtPDWW/EAekRBRlFd1i+FzbWeDeYIsv6VIEQskJD85v4TeSxtCjhhu2FjM03mWqKXBtOAjYFESu7obGU3GoV6rriRgNqRYYYWxY25Kfd0O8r5NcLTgBeaizFI4T+nU3l+Ldd8Ni8TJ0lfzpzqQWpw9LOo6kx9jaJmaVSHRcRiQyDE9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?Q2H5uvz+0+cbWN8UuBaHoisMRHL1KPzX03NzZK3FlJ/xNCQr+UOALPEk0j?=
 =?iso-8859-2?Q?dIkxA5QQtQuwy+7zLVEdFRT0WEpKMWLKzoctbFjvfSNAWCwIU9HKFX/yvD?=
 =?iso-8859-2?Q?ejeWAIK67yJ/qN9KZJGpmEbjlYG1q/ZEJtYAoumIMwyMDWWbv3nWLYsWES?=
 =?iso-8859-2?Q?Ue7VE1MnWg9brdaxtqrhxNZbJ2Yq1HXtD1seZgfcNtEn8OGXLv07QbYOmN?=
 =?iso-8859-2?Q?StNxnVUbIR8e+6wYmsQS4uzpakqv7GxTMsZyTHT9SGkoL/7dFcQBg5Imyl?=
 =?iso-8859-2?Q?AuQn4s3DeayLPS8rWqSftGHLnAbXl7Vt6rLa+V8qhZG5/0Olqigr3fe2MR?=
 =?iso-8859-2?Q?zbGqe7cW3wAJ5Y7Sz9653pGqsexg1OB5KzweO9+HbYUDPzRD5taHjwaXrJ?=
 =?iso-8859-2?Q?je54QRrs7llID+z2fEt4XKJAdVaEh/MZB3ma8oIQ32gftLPfkjJSj77ZgY?=
 =?iso-8859-2?Q?1LBSOMFXLAz/IcrV0VqZjBKj73odv0gXyy0h8XquikwQ1kszIg8OLjzqHk?=
 =?iso-8859-2?Q?Lk2GZxGArMjD8tIN57GMVZISBqsmwqK8c7FJ/YbTxifDK/MnnvEO6r7QOs?=
 =?iso-8859-2?Q?sZOQTqNdL6a94lBrLmw7gJ5RmgmFLjol1l94+bhfBs19+7uD+tI5sJOlHJ?=
 =?iso-8859-2?Q?5u0TRvgglH63Fj0zdu9NECKVzv/HTIiP/NNY3adVR6vRRhvV1bR0Xa7Q1L?=
 =?iso-8859-2?Q?LGmsw/IBgYNNzUBMHikB3SjuEmLU1yYMInz4I5+wEquw3mBiCb+EohsFqg?=
 =?iso-8859-2?Q?AszW2HtQWggSXnuu9kTb8TugvdTpyNkF01KbBSRJQZ082MYTEsSRXadWBp?=
 =?iso-8859-2?Q?DHMnI7s+OLRyunJ1zVD1LLNAECOoYQ3FICAyKpW6OfFsDeYepYOGTcktyY?=
 =?iso-8859-2?Q?VGrUUFc5h/v6qVy+yFX6UEiPRw4GxTb4eAJRVpT+JPVxN0v4ofY6bfZ3Ry?=
 =?iso-8859-2?Q?S1Hp+8Z3VzBE3WF0UX+1pFpT6swFv5/9pEO3hCrdb0aNngKkx/HwN5j0Jz?=
 =?iso-8859-2?Q?TQ1OEB7fGLmgT+iH12V6/EDzsZHE2nSFyDJiVd1ROAUtqjwH6OkgLIaS1l?=
 =?iso-8859-2?Q?GXtss1QWmG57qkjV/9LE4S22E5SXJyoFPc+A99nBlISRAwqI6Q1+FSYTJY?=
 =?iso-8859-2?Q?4mEEaVaaDr68m4qbzwJIt5zhO6NNtR5Xq4wiDrL6JLJvp2HSTkVIaAmWrq?=
 =?iso-8859-2?Q?6VGwZzp7UnV6tnOY5aLwlPYjQa6WFer8H7xof30umdGTuvp4QkGWf8lvNb?=
 =?iso-8859-2?Q?bBxhO4TpzXIG/57bbD7uxSKs5mi22XgUT4sPQwHzbWA8eTbRlYytmPWiDJ?=
 =?iso-8859-2?Q?+j66yrs44AFE4zdy9yXCVhpsyz8HXwJ671QSbmZXU6vEMf/8q81L+RwSoq?=
 =?iso-8859-2?Q?bIAiRH1BLv+047qegmrV77xoe+08n2JLQq1aIutPvf+kIYM/P7KJKC1C9h?=
 =?iso-8859-2?Q?g663JGWu6IFdwRmOFhbrkxJj1A8+NQ5qQswv0W0fuINrUgBBkOnzrejyVS?=
 =?iso-8859-2?Q?asfoYS+43P7OJPOJYVXwUSgnH5C2AXW3sxcCWVsKK0V97ejalzcvUk+6Oz?=
 =?iso-8859-2?Q?i+BKw1XzkfPCSnqJQHAj5Mgj2goT1qvN1YjC708rJAY8ZxM0P5PSoi0kWs?=
 =?iso-8859-2?Q?8Z9dmpUO0Zj0zo1ZWfNOha7/NEsWdi87r7jI5jWC5yhN4mcL3kaA4NNgzs?=
 =?iso-8859-2?Q?RCk1SL46F5uD2r+u9NSetvD32i0SzYZ78UgT1A/8ppcCR+2j7C1QksWGCX?=
 =?iso-8859-2?Q?uyarYedHk6K2SSrcp1INkCdgixzRPBiqNds2w55e1gXlINfOJNfslR1ZMv?=
 =?iso-8859-2?Q?qf9GSXnH0qhHW8vrf4jDoIdHLZPshO6yd43Uk2BIgGb5+XGK4+L7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0822373c-35d5-4ec8-9bc0-08df4a959850
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:44:07.6921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/yC4eMHAYQ9hpO3npzAhxs2txY2nlVKKCCHdv8DtxmBkBCRXyB7owvi6M3jWJLXeJaPbQp8U6mN68o70J9itRq2InAiT1TzLKtc0SLogwX0bn7nQlToWsE/2/Jefphp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

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
index 996b66188cec1..2a82d19b126d2 100644
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

