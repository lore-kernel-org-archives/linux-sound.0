Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ECE309F18
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415894; cv=fail; b=YvJeRdml/aHoV1FCQNZBFhFWd37AQhymVky+vm42MHIbfEjxc2L46iTyu9yROT5/hAf5MobPCKppl53LQhBtJ5xSb8HODKiD6si6ocdz622QO9mzqbnOTnV9DeDVU6k8ZQPYuRcIeYCpT3aREdgeXW4+uSYe7dnD4pSGOR5P8Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415894; c=relaxed/simple;
	bh=j7LwLpuU9FEqrGfUn43MCmJnQsUx5B688SQpJz0cpX4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=W+yqpvU6pK6gEpU44VXSpP2JJ5FyQK1ao4u28OqyvVi78VVajjjQw2ys+jmAEFy5j5A/R1jILxaayYY8dDpUDXHrmHVWSbcK1rUlDw7rZ4tCpacr5VrWR9QqxlR/HTUY1SrhSX863yMeG744nX9eo1vg++dI2Quc+LxdvU0yo3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O+lIGLbz; arc=fail smtp.client-ip=40.107.74.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O+lIGLbz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMggBl8HI/2Cnv64Y4oT1iLGeNx0BjYXvgnD5zDrX2KOcp/Cgbus4JPCKNxMSRlju8PZqf/wG8VVGZyPjpDEdkhFErNF8ekxNcAEnttSToUlTB8+sELvbzf+niKE92+G8y1F0CwEuXS5jxECB8AAxzkP+MEuylfL8PWirzyZW/1YzOzrP9kKb8YJ2s2LZdmJFtOoeF1D8CCGu/7jnsHnnrauvPAHLikJiF+vwiN7Bd0d3MuobiQLYCN90lteGPV2tCocc3QBK4cHzug1R8Dg9yjSQ721+ws2xgj82mo1c2235IfKTY3zCUSQ17lOLlJ56zzlTBkn5zc1Azm9DnFhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83ebvHT9YbQ5fo013HRWLckZiqXBjLwt2TDMVX7I0o0=;
 b=jFP+zcfjop8iuKDA/3GdiBpgvHdKeW8gxqWuK2izrsnEFl+2Ggvzk1F+FfQKyA9C+IUmMuT9EwnlVHL7+Msv5+BE7vHbEJRn+aJgHoV8kccq4Mp7Nk80xQpgL4Kbs0nTWL/bi4GZro5xEp9gwB0KrQ2OWf5sKRUHmQKiqV/+TINDjZ44Um8UAiwnToqDg/FeBsSSP6zA7Pd1F2nMxq/ial/Ovk2NDAGwWIx8WD/oII7nX8SbMmcOl8HjV+dhBQrJDu76lWXRD0M90cyN97Tm7aFOsCUp/pAkEzGSgrUUz6k3NyGTcJoFUgaHfmsXM6iyhmcHSZhvgtsrjhVRf+/6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83ebvHT9YbQ5fo013HRWLckZiqXBjLwt2TDMVX7I0o0=;
 b=O+lIGLbzDOicJ9U5GdYxmD0x58mAs2NBpzJurdWyT1ETR22AwWN/Sr6qOTiQbV5IpWxoOdZwesCeQw5tUoysKmTAeuhoL6jBxtkOQ0N0PV5N3z9mwTXQSELd2nkID299rJ98ANS5FALoZof34CTuK9yuXUCOkYQULj/HaCdV2KQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:51 +0000
Message-ID: <87frbmp0tp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 086/139] ASoC: codecs: tlv320adc3xxx: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:50 +0000
X-ClientProxiedBy: TYCP301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a76af1-caf4-4fe0-a2f1-08de0ad99e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HgHcN1/iZwggUuzxrYINC1qMNaXF3T33qxX5weLESiLg8YGX6F1/ToY+1eoZ?=
 =?us-ascii?Q?E8Dhv8giXDR1r7cVAKKAo5IP5JtJ7s4Sr4r3hhclEEu6jrPNcaWo7GETIqgF?=
 =?us-ascii?Q?RvWRqRSk1dVNYzLf/eIW40yiQXMrxAEBm/wt64FjPoSf78UtT3Zhn8JJxGln?=
 =?us-ascii?Q?FJSFm1VY1VFvm7SPGcilAycPfcwGDbYIxYWJnYHzXxxqQ1JZfymNVpDGlre9?=
 =?us-ascii?Q?kZQzpFuycw2tDAqEkHYCrXSgxaQ5N8SrZMPSTLebIpe6tMrSuvIBhB6jWvMT?=
 =?us-ascii?Q?++C3tvduQQTRxIcByFxhrcVFHw1bWuBS72oetvOnZ+cVGu7BZBOIQ3mfgiCp?=
 =?us-ascii?Q?XK7QmAPVmkCm5xs4ueLoa3BZStkEbdriPhzskZk3Q/VvjEjAjmWB507MrOTU?=
 =?us-ascii?Q?WolsfIwpVqkhNpJPrv/JraQR/T1pqhFPPBORM3w3z4Qx2XKusOf3o2ehvpOr?=
 =?us-ascii?Q?k0b/jZFe7CFyNVkutZXRxxLI9GzWw5HKUANFdOvfcxbhWjrfNVLZovR8s190?=
 =?us-ascii?Q?DXASBcPw1NZ/+MBBczKrVztwjkN6Y5WYeAcIBsAAeMpgRyprMy/eUiG+on8o?=
 =?us-ascii?Q?en5ZVIuN3hcCd6SNa+iHcgNbntHuV7V1rEuXlVPb4wyXLhM0ha2tX/DRv0cF?=
 =?us-ascii?Q?/QlE5J2xMtompJ8kOYoQRJH5zwbs2+SopP26b8+6Mlrny9fG+0svNFbqwFCo?=
 =?us-ascii?Q?RMnGXPw9tkTAXqB/NvofvjbCWCdYFENmSs7U0Ci2F7GvUvcb6IT6/EvzB6BB?=
 =?us-ascii?Q?0uQw4ryMMaFYW7DaK36lcgAtVA6qz9plR8D6KjVRe5KS1AeB8QPr9cQJkLfW?=
 =?us-ascii?Q?gQGdRlXXwWGP65dD2oo8YxCI6dEdAONRWPM+KkuJupZQIcpJhwMebCtU5z64?=
 =?us-ascii?Q?6OCLQirZFdiMWsFf60i4ZzlwDnchGex3199zMwRUvlL69tdpBjJyhOxRParK?=
 =?us-ascii?Q?91KaOUqQexU9ki/f5xrHY3PJtGqrlsRcBSJBQ+NGSDLyMqdpSpq7lpAcy6f5?=
 =?us-ascii?Q?NCZuQDT0hViNEoIhgaJ3FKDANRPOKxmeZDFUtpsXF/vxFeWy3GfZOH3LYyBo?=
 =?us-ascii?Q?D8P8BnOmgam7P2P89NDarM1dFSbVh3E1k8icQdy3nt6TUuoVUiFEZnByzvlY?=
 =?us-ascii?Q?4qsuZBACwQInGgwsTmS4Lgs5ctvD+RKbsJmMdza6j+XuydkADx9jtf5Wj3Mc?=
 =?us-ascii?Q?YBVadA4ccNpekUxLcmX9UWYdaKWVqzn/pd4p6hlVgsrqUJusmrxJqZIgQ5rB?=
 =?us-ascii?Q?nVEUs7AGgyij4QgM3+La9Ih9DaSCf42nTxIQZ2jl70q2rWwfDZrSIMFjkufa?=
 =?us-ascii?Q?LQvQmSbx9SEKJKVcsRNqA8cAYmk2bxHf8dtPvYNM7QIP+PfLeuZS7Jv4nPJN?=
 =?us-ascii?Q?ZvH3aShVJJeJq0YkhSuHsREnqTXg54oh9Vhqhie1Tz4f0Y62JV3gDQQo4+hH?=
 =?us-ascii?Q?7NJtlzxj5UQOVrhcYVbXKvLHXlccVFhcggkKniIeVONOevUPCIsGtyuHmk5l?=
 =?us-ascii?Q?n4Zt9gw9md+ZLo4JVdFa071dN0sqd+ABc5Xw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aLZspgLKZgMnNRnD1a0/ieAJvztP8RYKsXYSmuk/Wcyb2k5eY+hLLjn7Zw4H?=
 =?us-ascii?Q?CWKocvnWiVghl+ikUaCkEgq0mNaqaZZVGU8rn0m34jg1mfW0FvO6VvD6z4o3?=
 =?us-ascii?Q?F9Q9XFChq0E/dExk6DYEzSyQgYrTRw2mLCS9ufL13ep57sv5ZhgGDsl1usXt?=
 =?us-ascii?Q?tD2SxyOb+eqU/qCHy9D/5sAy2US9C/zNUlQSbXZIU0fsoAYmMqoIGafQs8rI?=
 =?us-ascii?Q?gLuPpV1eJ9bSrg/N9bGpj3kz/3RsVL76edvQlgHWWznQFEqlTF0h3HxEKXsI?=
 =?us-ascii?Q?+0466efFNDviwxG+YJYU/dzoHuupkNRLsdKbgs/Mc2VBEdyLLp+F43J4PjKQ?=
 =?us-ascii?Q?YHBFURT3A97gE+uRoWgZDEiPn30zXddb4S89d6rli5akQPgUm5IyT6eKCDaY?=
 =?us-ascii?Q?2V0qcAP0HzyaTagws0CKrokKThvgyzX6/TsOvq9D6+4ESE+phM3oL71odqLI?=
 =?us-ascii?Q?6v4J+cdheD0nS7CmKhnb4tPTaBZbdV63ZdficVT7y6IE7+mKXEdgoSjiW6M8?=
 =?us-ascii?Q?N8jJroxnZD/2EfwHBg2z6ac/dELuakhzKVqRI7XRdofAHEwR8ut/ZLznTbXV?=
 =?us-ascii?Q?FyZDhh2hk0cMv0xYRXNVbmAHtFZyg0ybE25bfLnaon28cHDV/Wo1zWgDb4zc?=
 =?us-ascii?Q?a23RMmVvbOsGIzSTHFcrT3Sk2VOAtGy2W6uGw6DJjUOnW+rcmF9nSiXilAJ6?=
 =?us-ascii?Q?HhjveMHlFrcpoGX+haQHOQsNsYNwrwkGSq7515r0SPPgoLBdUyBFUXTHvI96?=
 =?us-ascii?Q?K/YBZ4jus4kzAt65whlsbYDnmujssiIH/S1HBwq5OEpu/RaTRRT95HHbYQCI?=
 =?us-ascii?Q?cIdoF+0WQlen7TfSzalhq47NY86HWmzmb1KkspI33FaqsTURRxv52V02Cqnj?=
 =?us-ascii?Q?WHT1OwzZC3ghhx8g7iI0lk4Go7QoBxZsJQT5nj9uO/tpxWvEZ2VTbcDBp7wO?=
 =?us-ascii?Q?Xv6XmPtj3yJzzF0AMAtQ7of5Ueb0mjpLz8aH6LvyxD6uT6aEzjB63rSp+lC+?=
 =?us-ascii?Q?nW39lnCER6ZOqyV67LvnHCyncGJ0oF2hOqaamBG9Lu6MO3izvZItgMi82MSb?=
 =?us-ascii?Q?kdbY7CdVhhcZJy4VflNpTrcA9QVE1wsiJ9pHu17bbSp99VeMa7ghJlAdsyti?=
 =?us-ascii?Q?Dzuy+vPIzpapU2QJESoS/BH6wBCW/7IAliMsUc5NEYsq9ozNVItYj2TSIqnn?=
 =?us-ascii?Q?1KapooETdRfpn5ln3n8UCmpTzxmGuQjFYpf3I+TUwjQod/6LFdu//h4hZTNJ?=
 =?us-ascii?Q?5UySwDaKgJW2PEHkZwzZSuG3r58iAHWySSGyc5iJjY2Ny74S9iNOwxfXdFQ4?=
 =?us-ascii?Q?JLQQEG5dWYekLmyYqwOuhjdCMgL5/a+LuYNNyPxuOi3Cppx1lzlgBO0pp8mc?=
 =?us-ascii?Q?OEnAYcrvWHPB98LaHpVAO7wyS4Gi/GMN2uEtdeD8jissjpNPrq8aSi99c1wo?=
 =?us-ascii?Q?nckP3bzs/K4xqD4E6HyEq55wUu3+0lDhoAOxlXr4wNMQHG7aFoT+2daQUvEN?=
 =?us-ascii?Q?McdX8855kp8qtMPbyRkQeAbMA7rI0rzxr7aVOrqCk62BI7xR68c5ZN4FnAzw?=
 =?us-ascii?Q?PnVuF8vhhDATKUuGsYbX/uhZCJ8/mEhzImf1QDjDCqAeKEOn3ElJeOI6MJ78?=
 =?us-ascii?Q?cD/HSfM38bQoDwiqIv6d8KU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a76af1-caf4-4fe0-a2f1-08de0ad99e08
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:50.9920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8A4gH5qj+5MaVSOQ5C+sEz8maeVRnhr/SG6R8Uhoaxv0YDThiEmiWrFkhUODhtBY8xByA9HIgR4Il9qFYdNsFrrEj86PONdVX7en2kEz9ULu5K23G4iRRlc+36od8Sx5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320adc3xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 258fbcaf345a8..02ac0dbd9af6b 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -565,7 +565,7 @@ static int adc3xxx_coefficient_info(struct snd_kcontrol *kcontrol,
 static int adc3xxx_coefficient_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int numcoeff  = kcontrol->private_value >> 16;
 	int reg = kcontrol->private_value & 0xffff;
 	int index = 0;
@@ -591,7 +591,7 @@ static int adc3xxx_coefficient_get(struct snd_kcontrol *kcontrol,
 static int adc3xxx_coefficient_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	int numcoeff  = kcontrol->private_value >> 16;
 	int reg = kcontrol->private_value & 0xffff;
 	int index = 0;
-- 
2.43.0

