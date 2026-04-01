Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE018FDBE
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 00:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002768; cv=fail; b=BvySZYjHxe3hNStChzZ2WE8Q1fcRMjT9PbYurpVIA2elEeUMutMBU/+qL1tFWr6owWUsiffgVyA0r15D0D3SnbTgcpfNQHmnfm3xNgC60/3LHKtgN9PwrpR3FZDVcxEF5ynz8ZC0fLPf8exycXjeZF2LGYbifFY4yHP9R3l1C7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002768; c=relaxed/simple;
	bh=H74ofgL1KgL9uwDw+O0p7rY8fnVX8b5cRS/6Ratbb9A=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=H0wG7Y7/cZ79SZGo0+1ginUoEJ09Ob8qPlMA0Ci3mkN6ft6nqUMmSC0Hs0ktTFzdkQRYae7s+0+sIvdkhIRaVRR//Dh9+y8fqx6cHE7BTfeLcJz0fVsNT2DiHpt4mDzOJ82hnHWNMKjiuUAM/vn5JlUqmx1CrYxQOceNWr4FWQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P+vySpk5; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P+vySpk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpTuKkjit4+sdaKasjYMKrM2INpNLorlsKM8hUfI9H/Erdkmeirz/SVQQxJt5nJ2OYm+yhdlI3McQW1NFZCfmauNDWWAO2mRnJxEHQjWgyPVgcWK/zIye1Qv8w+m2AizeIB/m4X2uNL2707W2frBUEc7HyNVPo1+DsT7V40gJz2LZX0K50vfcKepkySKnz/gAhyzMLW8AZdhjBChDPu8cUJ/QWRXyUit/sCP76+X9VnpOLEyCZHTVY6sJzg0kQV1cE7HdM7u3mGnfYt8qFcSGR3kwZcLIOZeXzkM1UalCx5gsvua3n13cDDjuwRdIZeg7LXewXxIE+9+5TbVl2RaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkhlnHWZSiarrZxTZwfpieQNFqQKChdxHvI4HZtTipw=;
 b=T9sIHdnfw+cjA6ui2dwbwYlXtNua1VG8lPQsstOY5GIMMQyoq38jnF5L9M+sbSaVGkiAfWm/wbNvXit93G9R5F/2LooPSqp3F9LCecqznisu9yBxVI16Lx88taqhH9yiIIjYUgNAOrVU58EsZAwzRnDZiE3xqqFnf2rfLNJYikB+iO6OehqD4VPjgzIUC5dTCwmplFNim101FwS88V78b7f/K3F8ssFN8UgO0ReCSjhuQG6+ZX3oULTzP+KMBclpgrm8kC9GSI13mX+wFsBPz/kb/0bK//bZYqI8LEGWbnxluGoPipoy3UbGqx1bLzEP8VWtW8aL4RQAqxXvQ9OfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkhlnHWZSiarrZxTZwfpieQNFqQKChdxHvI4HZtTipw=;
 b=P+vySpk5+HV0vi0ksDk4GJZeawpJApHkfcSfmRfOHSMQGVt6rT2qdk9jCukoeW+B/HnWdUuJwcAvUs7TXKp+bOWqMnfmhfyCAfmIOW5H+VUBwkwoeH6rRk/lnv7jLokMFYQlyqZ6r3lUjstrxEDFWqPqO0Dbzdj+0M7ltuq5gX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB7856.jpnprd01.prod.outlook.com (2603:1096:400:113::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 1 Apr
 2026 00:19:24 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 00:19:24 +0000
Message-ID: <875x6bttv8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: ak5558: remove unused snd_soc_component
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Apr 2026 00:19:23 +0000
X-ClientProxiedBy: TYWP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::13) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: cb19adb4-a7b7-451f-1e6d-08de8f845401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YQiq9ipZFIcpmh7w2FoWYBtEHG/9h8fIhO5FFSUHVS5SipQ7gNN7oUL8TqDc4ab4Bjizv5Bpf0iDci3apW9JpK2EhQMjhRUHblAMG2TDh2jBELyx5w3EsAeWynzreTtil1dsmeDyqW5gdCgldFJnhqS4oueTlKw2COMmeFk9/rmNvoIrt7rTJkOabduISO+WGfax8Q+9Ii95gKZ2ODu2bl5yEtqMpzXUYkzUwFcCbvFII53HTYTDLL2oqGUcc0cKy2GPgpyl22v1WVIvG3lAW4yIOAz+/XJRnkIZAvnqH94cOdKSgRODmW+qTBUyfji5Ju1qhVju5qjEI5wjxm4y46LwPHegpT1ToP2FmszbBqQ0tzOAJ46NsPhbC2Y10BtCaHIq3stHIEuVLIPmb4doOFS12Pk54jCS0f42zP9kskdjAH1twkfV1eH7CFqhO1tQPJzWH2Sgsking7EvHvW8ICx6+JcdYm9P1zJ0wLhqiW3neWV/Lmu455jEoRbNuRkMSEwddxxIhICJMy62ay3rrGmiPSC5OI8SlILtCBg7/GzOO4hfDtrmpn1UUC4WRoTSbu4SMbJDCOrIL8xjXF63n1u8TE54NZx4T/xzCOgvcIhhHZcQKsuPB8SGB3QXZ7HLO3PE2Dvm/+3x70D3kZ6krJKtUxvgfDtTWWYFTWcbOjwPfRgz+iH2EL1skS2r6orTL39x6v41YcQW7k27/iFWKO57azm9Z8RcO7yeIP+W9rdNJrhrvsVlCaU69uXgt9DqksoDrIhWbnotnOFV415ZFj1xvE8rTbRk4BUSt5/J2ck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KjXh5WI4xNRQYDQwAZ6UTzAun3DAa1Wq6kzIVXz0JKokFDaPkdeyxzyP1YQx?=
 =?us-ascii?Q?m9hn0fQ3IsfU4pkt6IHvNCTZ2KS3IfLSUSEyhNDs7XzMHhszH7Wxckoagy1y?=
 =?us-ascii?Q?od5lmwBnODVpyrMt8sE22IabZklHK7O+hcqB9PtlDz0tvZF+k+gageX84uUd?=
 =?us-ascii?Q?f6mY3sHERrWxU3DKTEE5WGsQ1+bl0vsezunA/n0eutDThELh6fMHdFjUvjID?=
 =?us-ascii?Q?4HUQU9hCLq9UJhBDQrihI4nFXpqJABXvopy3F8NnRh0Mk3N5AuBd3A6w+0XT?=
 =?us-ascii?Q?o2sG8zSKvoQ2n/z/cdITqXUhPRIuExoRHD2NOsb6ewUPMDLoVKLYxk4+9pDj?=
 =?us-ascii?Q?pk92G4MJLqqKTQYDOwvvzxV2cBkutQy48AbfvoXjA/eJGIoiLaZP453hxIL/?=
 =?us-ascii?Q?ACnULvJwKLmZI9IIZKbLEj4JxgDmOePFFe6bcJ2zqQqVLHmEFhaMyZCoaqEi?=
 =?us-ascii?Q?/DwzG2FnduNQR0H9Q3jht5EIBZWbXobaJO0viw3lNKWhkoAU1/568n190EkF?=
 =?us-ascii?Q?48r3gjhv8YKsxFaROdvL0oeC2EYkBTsv1pEhiBZL9IXWSfBaNPTa/FEIayNX?=
 =?us-ascii?Q?a9s2t7cF5V+uflaNR29+QWWsDvvtWjj+pfyjIdXAG1qA6rNQ3LgS+zxcpLiN?=
 =?us-ascii?Q?Xva0RGLsxKU8prH7qaUMBsEJEF8d14HA9YyH6jpOVwxg3yKYDVzRUWuR6gSz?=
 =?us-ascii?Q?9h38NE4PLpD1fO7z79hkpC+aj/q8UqMzC5R/Q14pY4z2/vpep+OqLxB8K24L?=
 =?us-ascii?Q?czi+8CRkFP9OfRF5QNYRc5SzQXHUVt7G/kkKu9Ykm9oWmOymnCp+mGAleH6e?=
 =?us-ascii?Q?e4WpMidj3SwEKrAeuW7GJw3BNOs+jPZHxyX42pGaMbu85hRdlf5wOhlIhz4+?=
 =?us-ascii?Q?8OSTNiB7/1Ftsx0wRLkn7H93mfwGtj5WaLjUZ1xs+dqucvOaLYm9fHg56cpC?=
 =?us-ascii?Q?eIDRGajmVFiJXQl4On+8zzMGkh1ZskYgdylWXjkLlRvQlYbiCGQRJ4Grnpky?=
 =?us-ascii?Q?BV4sb1JpKCTjLup5lgiiQOCIq14AYTHTgaa9ggB5vf9pjmQXVCUJRG7B6cjG?=
 =?us-ascii?Q?7N3JEbTbtfg/bWwN1GCzSC1nWdGHVFKAAJJ9vEYQH1On+6qSBny5KoAx0f9H?=
 =?us-ascii?Q?qMKY/A7vLtHAX1U3k34BFTExyyJYetgE3B3M6rQkAKMXjVqLAn5Qt7BXBzQq?=
 =?us-ascii?Q?we8Rf/kAB4B79qXoXCTwmEGK/SdJLr5mb8Lw2+CydY/N4HfAd5InSZGL0/XG?=
 =?us-ascii?Q?KkX4nbU8ccHTnOLERr4yEt/eeuNKrcrWoO9s46UvxaHsLnw5VAsCKLZpLrF7?=
 =?us-ascii?Q?X5XdCo0K537R2AROwqkJYxHjEQ65hfW0jaixFBWPR630VaHO4yK087dBTkzQ?=
 =?us-ascii?Q?X/hTrG4KJBM7jOrpjzDotVzRdLbg181OaxaBEbc4x0tO57+xaSW/oRqZnZTX?=
 =?us-ascii?Q?CRd6v2u+lXgl/+onlsS3UhWFC/l09XazNRL+BTaVJEa8hKjIc0D5zTxbvkff?=
 =?us-ascii?Q?vgSYq7DN2FmJahmxT8FQkwFq1NNoamCd33DYg24TtOYx4PAcueeomAEzl/hn?=
 =?us-ascii?Q?dMiYAZasT3zCZzz8s9rcSzPXcBquAGi2RrXUci/92hTq10nWTNqWzzKyCwU6?=
 =?us-ascii?Q?z6Br7R9DEp2+cOuEw8gZovpNh3vL5yT6YNxrxTVgGOGqTbErs+h0Ll8D2jcz?=
 =?us-ascii?Q?3rpfmR7Ra5x7zYGxl5POYQCCudXa04vVcr71Pd3LzgFOVvr+NIkhVNfoZtZx?=
 =?us-ascii?Q?0knJ29TaQWx2I5r/01RElPk/Wb9opIRyKz7Y1b4BKC9W/xZQZlmd?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb19adb4-a7b7-451f-1e6d-08de8f845401
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 00:19:24.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YsqkI3WrlHIf/PKjcYfBQ/UkPKVNJ9/kPDiO+BLYyZSfkboIJYgV92XVb9mVoG2yRDVUatE5RNKG8qNUFuaO+eT/sC1JI0NdcFTVBl9jvMhldr1Adz90Sf+xHWoKxUV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7856

ak5558_priv::component has never been used. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak5558.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 73684fc5beb1a..691db6565c20d 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -38,7 +38,6 @@ static const char *ak5558_supply_names[AK5558_NUM_SUPPLIES] = {
 /* AK5558 Codec Private Data */
 struct ak5558_priv {
 	struct regulator_bulk_data supplies[AK5558_NUM_SUPPLIES];
-	struct snd_soc_component component;
 	struct regmap *regmap;
 	struct i2c_client *i2c;
 	struct gpio_desc *reset_gpiod; /* Reset & Power down GPIO */
-- 
2.43.0

