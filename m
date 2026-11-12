Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443595;
	b=E8HknXQmpikYjeDWOYncdnIGwC4k8Nt4yyacsmGwO6JuSA4MG5ub9Un8i23Y7D2FbHa1
	 GM3ZZ4dufLAt4Di0Ckr7KfEg4sb/FRCG98ChXiwYOol1+V+YtL3HEuZsyctOSaSsmTTno
	 /ZzFPkkXQY5cAqBTu4tpl9VItu1btfN6n1wgUMt3pg5i1k14erqC0GUgI37tbyC13Dlpw
	 WTP3JTxvibayo/0x4tt2UwD5Znj6xjirBdkfZQI9lbCmqhqwZW9AvB8sFbs+MIIh6sJsT
	 CEPHcYq1tQpqpQKaZv+6xVjcO9mj37bvSb38ZKL7sk2HvOONsHzAZo1ng3TCl301Oog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443595;
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
	bh=b+Bv0iiseyeQB4TO03pAXqp9ve2e92pscIt4Ty46rxc=;
	b=Ru2Et0cEojyOYexFCP5W+rmpk1qRUUOV2y9Af3AJV9iivPuABYpyhR9eh4yHF2zVCWWI
	 biqgy6Xy2Lt9RtesAW8Mx5LZPOJqEB4OrQnuG1SvJWd1oRmZ8q04x1oiRf0AOUbQyjP5z
	 UZxcCFgga3j77LKkbQUovuAtWvM1nGaF507+6QWybAUTdgxg5ii9g+SyRW6qHLixZd2jk
	 uCRsNNm4FRFLPVRrX8Z7n6ULcxyNJCKGa10qriCcdBfHvBrCrrr4m+v1SGbAOPM6mxp+C
	 x1ZnqrDwIu1ekhyvJdWgqqapux0PRw/JyUOwUcUh8LTm7CqpNN6CSettdjHys180+qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=f6Dv2AjO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.70
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05332606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05332606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=f6Dv2AjO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zmusnmq8yIrZw0Ecvk/R1rBtQB9sv9UgN8K5e5V1pmPK9zk+d162SBQ/YIS6SmVu73VX1dElyGCQ4iK4xLTT3SzgykntOCyLYxuc7X0gEv3bb272BzL9E7rWcNojHfDDyik4uD+RKi76ddSD67kbUhwk2Z9YSxg4JXAuHaJ2X7CNatIy4GHFT9SpMV4Cxc0cG9RTS/BflZWZ9seOypvrqJwTQuZK/fuNspwTtj965nzsJJmJH3CDc0SlbcOlvJsHxNtZvPBUh4fVB8W3M/jYcOWa7JOmRG+RGeri3nbofVTtvJVRLxRWi9+YHSqO/iVPbF7iH4jTcQ/YKozef1LZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+Bv0iiseyeQB4TO03pAXqp9ve2e92pscIt4Ty46rxc=;
 b=LcJm60mQbTjR6zq+8Rplp6wcPBH3kHQTvbHj83oHqlKvRC8UZTqjt9cNyJeR4+7enl3B5V7aMlZh6GsZVT9XwuJDdFCGfRV4aTyJdn5GNE4Wptm20hNTbcFr2ExuMcrC0ZTWrpojcS1i2GfjiHt7aysYEyom8pqd2YcfkboUOOIJ0q7/xXeJIFxMKBghmMiQMNCv7KsdoFJMqbSiIlBSU6t6HJWl58x25jMaXVNPHvzFVhnHWJaS1cntsxRcZiZ6V7WeD/rPqm0WAlhqhzF7737zlJOPxvDwpo3fmL8Y8o6kdAqypxykyYtrriNK77AMSUGj11r4CnkZiAWh18Zbyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+Bv0iiseyeQB4TO03pAXqp9ve2e92pscIt4Ty46rxc=;
 b=f6Dv2AjOX5M6rbEDHGI7y07Dr/wVaMNVS12/xmGHOj6OWCfHIU4M+kYnJ4jCQf4FUN1YFf7D5UMZgnTfh/xG2rFOh0DMp6sUK5DHCPDgQMs8QYJ4o+v6UmlpxlY5vsjMzAwY4JptBBurW9qq5YDJGXYfm5nGySQy2CrKe36iehU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:10 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:10 +0000
Message-ID: <87a4ne28je.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 18/27] ASoC: soc-component: add snd_soc_component_to_debugfs_root()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:10 +0000
X-ClientProxiedBy: TYWPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: f1414739-e1aa-4686-5ab0-08df40548758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|56012099006|261021121427099003|261026121527099003|261102130727099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	n90adpDsO9vVt0nG3/eRv0wXcwfQ5OSY2Yt7c4JbaDyYUe/hPVW0eXw6rhJ2pt1UI1Bo65BnEGqQSwWHVb2fS6rlIgBeq7whLFr+l01DJqqsszGpjM9mA7jtbxXrH4cgo1QWN2KbwZlJgrL6EvUK3Q5MMElegnSsG0hNBRueronaCkCfdsdytv4S5vyaNjsbrXv9M6M9uHfPNZ2HugVDl78SzfwLM1nGZ7JFZ0+Wu5tXe5RAyoKJk62h77evHLJDj3N0Pk2wdJovebSceHChUrweBIsCLoUcgzq9uY0dGRMDD+5twtYXbHOXDZE9oSQ8a/1CZR0QDBPjMy6s57t5GoFVATf7f4QvPEJFaDWLT7O7HPMBg4YTKpbIAj4EvAkwvtDdyMES/JngcKIU7nfoAlCirnszwg4qOTVQfc6qSXFP/I/iWHfNWtd2AhkY6xCup1ymZsugdq/WokwxCPx+kHrbUB3kYmtjccVTGTNI75hLvAYiI89wElWwbDo4RnKx+vdwzwRl3kuKgV7tJbt+Yaprnn6Xs45G/nUCUygGnKoi242nEFfHapBQY9VM6Td/qbgZJO82iruJQx7C7Qrg4htF3e1QF0RYSNIOoiK/og7LaZAig9Kp/oFgBBxXVPJwKymdUA/JbeS36cb+wjfch1Ha8L1A/lxLoJVJLFiy/+LkTHghykrGmy4RmHHGu2FAAzk1ZN0RfnblQvnnV3i6Gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261102130727099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?7HsORLggg046CX6518/GXXUgDpPaEXQIN4jxkiwiSqxnM0zC+2D9K00v3X?=
 =?iso-8859-2?Q?OoVNTYGaOxqWhnINg40Ubd2DHVx45nNbnBHORuHYTfDsJ8CllZZyM1k4kA?=
 =?iso-8859-2?Q?O8YVbG1wKBcm4EXbcc5pMhpxi8gjmDXAlpT4Z3529cVnFDuT6gd4yTTrxJ?=
 =?iso-8859-2?Q?r9yScN835e9DvQ2byRbYhoIkvalN2AzUgV+F5fcc/6Bvic/owHD4J0Cnl9?=
 =?iso-8859-2?Q?IoL7fDmOBscus/qI0y7h6MKiKEuNBHSN2WyBNNgwaM0QjYgEoOi/llHdK3?=
 =?iso-8859-2?Q?swZ6Cd+3j6Dsywvbso4HaOxccRXJiKIpvUtLV8y9XHIOLJMI32AsHpm+V5?=
 =?iso-8859-2?Q?1BiQNDI2wy9bGTNPscayOdxkprGyAfGxZEQPGA4waxhf3zzFPp6IxVEjTW?=
 =?iso-8859-2?Q?b3LGrNVxRLPSb+hNKYtfOrHxYM0AUh850LA2Kj93Cc8U1iqTK0TaPQH6VD?=
 =?iso-8859-2?Q?v5P0ksiQeA+eprrm6R/C1x0vX+MmnSRZTqqw1LOnG9IbxNaBvbIPwgOGzt?=
 =?iso-8859-2?Q?G4h6xR6jGAlZYzm7LoI+jA+uES3ra3RmkXKLUmJ1KFNYGpNyqzmDlotZVB?=
 =?iso-8859-2?Q?YmxynFO9AZk3zELoGn1U/lwkQd84q8yLxmlCcnVuMcAgziANw8AazqdknX?=
 =?iso-8859-2?Q?my+TQ8yt/4Gyq1+I1748QHAXpQXDT1PPuQnpBwd/nHF74JRVePX1XPCX00?=
 =?iso-8859-2?Q?l/YpcL4q6scqBiky3kY2G0YduaHevYvNGXiF2UvUbKlvb1ma8J42ARMjpw?=
 =?iso-8859-2?Q?mA9s/ycG2gQxL1nNWlDmfWgbxaijcRatqMj6KNbaRzBu0IXT+QewRm6xQK?=
 =?iso-8859-2?Q?0Xz0LcH5OI4OdzwQLL6L0SMEfDMjARPa/FYa0D8VuN2ZhEenGVYajF3R17?=
 =?iso-8859-2?Q?TMoypWriYNqvtXaMk1CTaweeL6ofsprX3zAcfE5n5Zk4QtD+UISXqTPowq?=
 =?iso-8859-2?Q?pyBfV+FSI2IoNFcz8C53ApiMAEA66MDh04NGCB0X+Eingvfcu5gjWkMSRW?=
 =?iso-8859-2?Q?pNYLgrrrzdU+z+ALNuKfFaf9FAzSr43rJI3wpUOhUCgOJ9B+XGGDYuFExW?=
 =?iso-8859-2?Q?OgTZn/oUgwak/sFqwQtkIWMrSahkA13B7aL0FCAFkq0oxEaIvucJERPs64?=
 =?iso-8859-2?Q?R7JkCbvO4x8NJPtoZK3JiPAWp6nYRaib3XdHisbe7fLWQp1ONjsV2l3A89?=
 =?iso-8859-2?Q?SGdJAqrFm4huYbpycDDDEMF286/8OcuBSrbEbk+SbsLlM8BbKWy796QMS/?=
 =?iso-8859-2?Q?Oq8PBg97XhEVHTLFJLYOy33HFMEPff90phRSgYzJuksb0IIdc2+IW400YD?=
 =?iso-8859-2?Q?d29zXW4T3CiqJ1xHAOzcFWi8AmB+tanrNgWih9hOXYP+6tmeSk77ZZRr+P?=
 =?iso-8859-2?Q?KRXk+tIdW9Knp5vb7wLYvSbAW+Xl3I8ZnJQFJAOP0mGwMGOJYygwZ+Z6BT?=
 =?iso-8859-2?Q?Xa0jGT5aQ4XkHuPjMNy5e/hF4bf5Jc9qx33MsnIihNlW5B04242gbSNfqA?=
 =?iso-8859-2?Q?RxQXG62ZY8aY8Ev5ApoXb200XBP5EgKBYaKaBoV9xucFBAb/57oxZp53+9?=
 =?iso-8859-2?Q?Lh29xHxFNF519+oyU0sPCCb9YYgwEfO+x6ICSFFK1UorRDrGxJe7uDtpbS?=
 =?iso-8859-2?Q?2OHK12IPDEXRy6LSxyI+fLafscKzAIkQ0Oc1wPmrinB15/zuHEH8mjidCn?=
 =?iso-8859-2?Q?RewML96Yfzd915CrEaS+v0fNx87UJP6Pc0pwkB1b5VTEcX+ICIDG0+MfVF?=
 =?iso-8859-2?Q?SCG7DBhlfh8oFogetYjOBQV6Ex7+awzJwlHlSFvsSqsgXjwHAOGK0Cizka?=
 =?iso-8859-2?Q?qwBOTecfUD0vgskqP600X2yHf2ZcOK3EZVbcN7Axpv5TFCNP1yVK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1414739-e1aa-4686-5ab0-08df40548758
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:10.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08xTH6+lMDctm80aWW64WL9rwBmS9s6gkNc2A9Z+7CiWiYmninbYWBnjIIxVh3zIUIWnJBYGLVWG4DMGPffJ2tCAVT3v7hei/badLynOrWBNp6jf4QjfSypvV69+QCXy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_debugfs_root() to get
component->debugfs_root.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index ec0e3d7264cc3..0bc84c9c0e7e1 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -277,6 +277,7 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(=
struct snd_soc_component
 const struct snd_soc_component_driver
 *snd_soc_component_to_driver(struct snd_soc_component *component);
 struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *c=
omponent);
+struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component =
*component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
 void snd_soc_component_unregister(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 74d9d59d4aa03..88822e0879744 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -86,6 +86,12 @@ struct snd_soc_card *snd_soc_component_to_card(struct sn=
d_soc_component *compone
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_card);
=20
+struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component =
*component)
+{
+	return component->debugfs_root;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_debugfs_root);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
--=20
2.53.0

