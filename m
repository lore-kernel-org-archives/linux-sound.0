Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C393C943A;
	Mon, 30 Mar 2026 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774869911; cv=fail; b=g46+/l7jDvQSpGgHT0EScCBXcG0uQDlA7nZ+nyeH8nx7ncWTluhyyZaMdQnOPCmmhNumL/uQ0aIWzZsGZqYB93u4QcfvybSebDodfSdYf3b0qbwyxk2h0kFMEU05H94m+B923fjXcZcEWx4qp1/X2s//qnTyBGHZHg5hfkjPVHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774869911; c=relaxed/simple;
	bh=72BKGs8TzH7Tv6r+rEjW4XSfQ3tWbwVnDZlIzhmbrRA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mB9m1LaNdwFEJwMoJg5HiyKuAZVYYm44khyduR627xsAsm4rXwLLmv50zHLoqki9Fsk1WksjhiTL8zSmwX5ZNNLgDKSBzy1ziwzADsIzK8bRDLjAW09OQwGSIFAmUaEap3/G+LDg1rsFmyuVegf1SCE9VSVDfFBKhlIWuyeV1vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nERbBAnH; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nERbBAnH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9CsC7vO1ibuCqtKR2/L3Yu18QVZTyv5eZWrlbYEzLjitOY/cp1xkOpP3GdLSpzxiGEPydGidWWRIli8fMcdenDVO33m0UlRO7U115L/iWBTuUmJUZ9dMUHUGacgu4vj7biz6DSDhAmnqlpQXNqjgdh2pp7W6ADo96MfsWxranm3mBExpjnu8oMTAR/TFUgfoX6taTejlH0zq7nfcg6v4sDhBk02+O9tn5JXrMTHxw2EFwfj2hCPlVF2wn1ZpEP6lmcF+TZCYWilBovFFSxXw9MuW8T4KjDCqo9Fr34T64fVbdmQ3iJ27y2dVFzB6Htw8p4kcbnrtR6l4f1HAoFkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1W8Z6I5k4qC1og9LoTkBGolQOg+dtplXEcqMJbQxjaw=;
 b=WQGIeWhGRzKtB5mlMlNYo85y+buAbx7/vSfqdaW/FOCLBw3M5L9KtZ42/SkEnV5PdRZ/nuKpdkysBwY/19L1nLgiZRjE9Dn086dPaIrHzuup2wl4X1XaymxwiCRyh2oi4ik1q70VyH+N33kKXpbRqjRVA0TFQ9HbQfaiAvV4bezkRGQjAjmZOOXqv66z88xiKazXrKintyNHu4e+v8TwG/gnF23S9kKb8vFRF0xuZIuaeI+NWv7GZvgsmNcx3Pt9Vcq7Nt/bxxx0eB1Nsto68MfErJeF7AqMaytfCqThcKJTXIFvyeqqZ3xNFiyQ5C0f16FOzOhag+jE1csKb2Trsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1W8Z6I5k4qC1og9LoTkBGolQOg+dtplXEcqMJbQxjaw=;
 b=nERbBAnHSaoD463/yO90kc3zh9cznEFA3VCoOVi6YsIrTbnfZPJ+JFNKURMkgR9wVxcPjVZEFWXHcY0jjCuIaroduV9USbpeTOL/O1vy9VMxWKhJpbhY9iufwKdMFxp+Mk4siDmHpozOrKlghwwMA0I9+65XIb9tm0kk3p5Xhz+decJDNxjhz1HYoJ2J/dHAewXhMF6xw/kLFbEbJacSImaePeiVeKTcILHXuawTkzm3egswWscdpkX8msxxyVsJdVkqtLn0Cd/STMrC+daMJjK7y4FAGuvpSCQA73TYSiLtxQ6v1FU6XDAA8oJvTosM9XgJUsTCD/UopHTgb9nb6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by VI0PR04MB11481.eurprd04.prod.outlook.com (2603:10a6:800:2c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:25:08 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:25:08 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] ASoC: fsl_easrc: Fix value type in fsl_easrc_iec958_get_bits()
Date: Mon, 30 Mar 2026 19:25:54 +0800
Message-Id: <20260330112555.3637002-11-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
References: <20260330112555.3637002-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|VI0PR04MB11481:EE_
X-MS-Office365-Filtering-Correlation-Id: fa90fbf1-ea74-4b13-c05d-08de8e4eff7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|22082099003|56012099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	+p+v8OsXi73MpZ38CMLesrn0lsAJyHSX+2DOxFNmbJUYT9S3x9TOhSWUYiNbilHh0FloP6VnmKU5HbhJXKnIRi5B2/6b5feGXKSEwbZsTw9BggcEoBn0K54OQf1Cb+1b1UkSDjVMKypdVHOhfJnUraACzwREaUXoDCPhaCjGC35krhhJeyBnu0Ob1dE3+4S/ZSffLXgp6PV5FOrCWe3CCzAMu21BfwPv3pqgioAp41xHuAKc3U50iBATn/K0rKsAv197XLguktbIwUOCxJ0gYE+t6o2h0sAzesfYn18Hx2pRpjEF/dGDYQaeN0TMq5ij8WM3xnVm6I30zOWW+Fx4Bi38yNjnbVPO1Xss25NJ45yFVx3lb17WBZzz+jEmCJhNwN8Oa2kkj5+pYpyH35PW2ohzGuwXXayP/N4QFZvmBaLDD9hOaZtYjjagNbepKPvU2vy0lSs9UiGcofjmeRVU+5bG1u/Z8UM9wN008teGSkiAQW/raCljYhyfWzBZYejvh4UPH/6FWYz15kc5qe7MfRZKSm3fz+a8KYYv0doha9y97fahD0Lf2w9G+cZs1X2iiUCPtsBKtx05KHfjvwuXah4zaNQNjgAKB7Pn/JZmX4B3SbcqSayZVyet2LWrePOje3BGMTOlnA8m+lncwLDujYbDTkXgNB2qEServ7ZKfN2oDHTiUjogN3ngy2OV3wO0PPyEtrcTemCXvBpJVPtExflUNcnyA8nwxzzHJbj7jCZxLcR53gpO98P1E325umJB3NP+32NdcJBGIAgo+Csvg/ltsOC2XM2Kpi6pjtJ8TSApui6ire0pP1R6LgQcKQ+E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(22082099003)(56012099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZHBQX/1IZQbl2XZjiJ09bhujhBjz5wz3WTyqH6+pstaWzvVOd7wKL89OQCw?=
 =?us-ascii?Q?6C0tdzTv5pN+L9oEH5BiZqCdCKbYqVddlvMV23eFWExZ8tQzfYmSwRMzDYno?=
 =?us-ascii?Q?/BictuELbDLE0cCxhb1pmW3I+EuSH2/XGmcnLwVQCMmBtNbcnF9yyDdb921p?=
 =?us-ascii?Q?+ar0E3EZiBUON22w1YsHdM2NJYmPhZCpeZXvRdonpXwYafzk/3ykkg+mSKjU?=
 =?us-ascii?Q?aVXt6A+tj9D/djP7R6PAzXrPoeAP7XygYGw18QrChtxycXJt+MKjBh2JE3em?=
 =?us-ascii?Q?1dJDzYnmPbPSQyW9uITnJtzUlDVpgBZW7XoaFO+zbp+TI8yf98vin6kBsGR+?=
 =?us-ascii?Q?wN5wgOGCVxN4ElueGDWll9XfkG8gueUt97vdrHK+vZ0FF2XcneID4/JpyEQM?=
 =?us-ascii?Q?dPV2xAt828i62t7BgeBMtefIdnYM9yGz44Z9GhdGgskXpEDSpPPIUhurZMFn?=
 =?us-ascii?Q?kcbIMoYt9Js4Sf3txbXqCoyIrBWV70YV2m2mIjEVArJ6bvSPpTXJ6D1HajRq?=
 =?us-ascii?Q?KzReStTnuSrJdgTa6T/cxhrVJP4tYarOAy0Z5AmApfS/XSgp5kPltreE10hp?=
 =?us-ascii?Q?ueENsyYptpEi0MpdtJxdWJ7OTLXmH/eZzuFNKQzi3///OeFnj5PgbC3CmV6R?=
 =?us-ascii?Q?YAdnAwYxccKQOJfob/auBUUHtAFPEVIZiZ+bQ2AuFGflpyYAvkYH5I/RNg2j?=
 =?us-ascii?Q?7zQ9UTE8/gi5LsTznf07Quy2K+e3suBcZrv/VRXfjPmpNnTYqcgeolSHVMsR?=
 =?us-ascii?Q?PT/B2MNG5SgV9GTLfoAFFP54A5tp0YNlrIG6ir/JBuWl11kMzXx+BRhGvXvz?=
 =?us-ascii?Q?nLR8dk9hMsfW3KQUL+XAvIrfGd0HcqwXFGRWLHSLrmqQJXe7KbD3qXb7rzhU?=
 =?us-ascii?Q?5rejiVA4RtrZsbm+jFCwTpzvQoSOToXjIVCLuKX9YMJq52SmLyBfwVObIqtv?=
 =?us-ascii?Q?ALLQMvyQ0zLtt0V/mAP1HYIplPkS5VYN6Xvk0afza1anV8qne1YZT1zHRJDZ?=
 =?us-ascii?Q?BX/O/pCjopR/oX/DCdQjRHktYZWY5Ggh7bTyju56VuoQoFQ/zUSGAOyoQS/0?=
 =?us-ascii?Q?LKlZ1xln0S92iuujyTqiOJlnZT4zZ8P7EJQpbi+hkfv9dQdZSe13NCgIS8rC?=
 =?us-ascii?Q?+yVxgfZgo1EYU33QvCFjj4L46wdMS5PpxkK85Y7+6t2jm/pECfrHqlycs/TI?=
 =?us-ascii?Q?ZIBqD6O7NRIRP91E6XYlgNXbk1yeO0jqikHHN28doPW14YMt2jIoTPLawI57?=
 =?us-ascii?Q?zt2NcaefZXGk5FVFHIgPTLFSSi036qfU/btW7DFI8HGddI5BuCBgrtKSYrx3?=
 =?us-ascii?Q?y6neIboNzaEHl4RdtWaKZ8Of7mnpOPblDOkr6YRfCNFCezWXOJrYw6WRBjfA?=
 =?us-ascii?Q?sbI7o6p8o4qFkGOjBy5DAsZWPXBlkT+I6LcHisy3alUbmJW+hg/ji7lqsV1h?=
 =?us-ascii?Q?njhltMPz8X2pZKFQMLa44+ZwoRQuzspqKJeEidaEB+aDuK5HozccsTubcdhi?=
 =?us-ascii?Q?3wS8bIMgRmRAR+Wnpt1eqdyl5s5TCnK1cK/BAXD/VIoBf3qcxXKb5j65Fj2W?=
 =?us-ascii?Q?c+g+hp713r6JMdfPrJVMaXQONnKcs7ye5cEpH6uX7jEuozGIS4JNWEJk1KAf?=
 =?us-ascii?Q?gT2grHQp0faBx/fXskp/L7p0G0FowFv9Z1LqGyUK7s8i7s1QdNQbiDZa88D5?=
 =?us-ascii?Q?Q/qIxGglRM13QCdEwYNMKJg+rPA1w8A0kSYzmbn96x69R6QKYkmr/F7BFuo+?=
 =?us-ascii?Q?95XvJwE7MQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa90fbf1-ea74-4b13-c05d-08de8e4eff7c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:25:08.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWKVPtU67dkpq/dsLv9eB7Oe9aoNN2zrrS1WrdF4srq6wtvbF8nm9T6jZnP+wNN16HamSTSvfJ0Yln5mds5W9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11481

The value type of controls "Context 0 IEC958 Bits Per Sample" should be
integer, not enumerated, the issue is found by the mixer-test.

Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f48e43a0edcf..3086cb758beb 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -73,7 +73,7 @@ static int fsl_easrc_iec958_get_bits(struct snd_kcontrol *kcontrol,
 	struct soc_mreg_control *mc =
 		(struct soc_mreg_control *)kcontrol->private_value;
 
-	ucontrol->value.enumerated.item[0] = easrc_priv->bps_iec958[mc->regbase];
+	ucontrol->value.integer.value[0] = easrc_priv->bps_iec958[mc->regbase];
 
 	return 0;
 }
-- 
2.34.1

