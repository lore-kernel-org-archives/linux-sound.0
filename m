Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF3123D2B4;
	Tue,  2 Dec 2025 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664569; cv=fail; b=qpMGY6Bq/8oCRPDZwenGeHvNjbtPrmjs7T7bSXLmEXWkHl9VZ6hkpRPuxMiwS1mGjRj2eWc5pUxWLWiJ0OhL8b28vfJvDaZcq4R22Nr/t2dofAkkyqu37eTjk0AKXwEE8VDF9SGdDXEwLAeRK6ZuwXZ8dFXkOLKfcRskmMaeJPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664569; c=relaxed/simple;
	bh=R0ZcnWeuUwHmfZSYj9VOENJFINFDZyB+VOuQq9BS5eo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jW2vgNGD5Dq/vj88Ox0FNclVAebOMHe98NQpbDYMbRXqAAHc2wL/cLzWJvlWZAXRA9lePioaHsD4xmHhHxJa0GvN6lRgji9Lrqx5KeYdQvRDxHSF5DiikOrDXPtCSQ/1W4VL5zuHtWYodctEsaZZvsjx61svO6TaL5lXltBJ4cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XDtPc1Xv; arc=fail smtp.client-ip=52.101.70.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XDtPc1Xv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AK96wZYw5G+ElPskR0eUpQMWsy68bVOsaYA0xImGmslH2vE2RobiMatqFBAHwUh9/XOSPk8ZTrrcVizGFmXjJaHoOyBPmeewkefXs5h5UsTy/Kbv8SDvsAcjSn04glfTKIUlMM6zJFkcNeBPEzZU3UliolPKdMDXgVa+AXkvIqN3Yml13wdX6ydUoi7sCPLmeyhS68R6jnfKAQcwuQ3ESkxNCsJsINAKUUTfrdahKQLJmAX+K9DL64RlCXMDUhfcTtxV49mmsy71rAzmvNaYh3lJWASYVvucYipwR04s1gSzZj4qxlKUNxC1W/jdLo0FpjbkDiDIKW55gQOwwKhzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8avGXgJIrPWdpt2ZRRf7DgFw3V0cPmFi5/BlLbX5g/Y=;
 b=goJ8t/IYIutkLGRt+BNTT5uYQVmb60XE4/4If0U9Qwi7K9d9EyJ+/f01byfxaeobOmcWIEJ0MKMmVlc472a5IFKTTc+O5f/+K+pxQMhTVGEsM7/SCM7cpWw1Hi2vjI2U9JBDP5xJkquGcXGhEs08SBDx/7KwHy4PGjJYEuv6lktN5pDVGToDCUU5LXHj7CyilpOiR3Lim2+PzeRZvi3eXexd5szmpzzj/2x/5gsJ+ujI3d2DSZUH6vGeIGl9CHs43z4aaNPg6cASazAPolLMl9eddS6Ih/I1hKHIM+/TIGlCcViyK1Sfhn7+tsvtjRabJZzPiuMvrcGLEQxe9cW4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8avGXgJIrPWdpt2ZRRf7DgFw3V0cPmFi5/BlLbX5g/Y=;
 b=XDtPc1Xv+5yA63t7WAgf/szTTxK9tpyokZjiHeh7lir9cJcxuiX/PzmTRYiNp5PNvflz+LEBfDbpZGVDqLBerlCiO+6JMV7rg68JaihjcatxICVWtlGNfNQyDq6aC+EFMK41U21QB0tFtn9oYzpuiQuNpXg8D/6HGxB4z62nyR5S1StmqfodIneg38yL+zO6x05Z/WwZPrlRzMdOkaw6M79JPfbt8kHt92aV2KoDtoyqEhwAVZ/l2GUhlmaflmNnfH7nO0ep3gKTXhAZWpikWIjwkWcik1zvhY+dTInSpnYvUBucF8466XxQFlemgbcjAWLkM3i2f4TQv657qO+gqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:36:04 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:36:04 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	andriy.shevchenko@linux.intel.com,
	kuninori.morimoto.gx@renesas.com,
	nichen@iscas.ac.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: ak4458 & ak5558: disable regulator if error
Date: Tue,  2 Dec 2025 16:35:33 +0800
Message-Id: <20251202083535.1985714-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DB9PR04MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: bef0b83a-e5f7-4406-4999-08de317dd441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XbXay2GDCYZ5zeebwm1B5RyWtAGz3nPUkyF7yCiXv7FXIaIfie4ghMUwCuog?=
 =?us-ascii?Q?J/btIhXVwCBV+GYnxY4nhP0Di5mxAt8pAWSHIx/jb8q1lwkS6scXQAi3ApBf?=
 =?us-ascii?Q?zLl5Ks4i8ycKC+K/KBPoKuW9z81pgChyI8pf2NVkaKJ9LDekVb+K3Oq5nG19?=
 =?us-ascii?Q?ii7sKzQZA8eaCu4np0lNE407ToWq76o7JXvlpGSnujvh57Bj9MpKfAOURGOg?=
 =?us-ascii?Q?KYtU9LZYVu2LEo6DI9pP+HSet8EVyoj0CUtJ4EYIm+7syPHM1sB/COVnb1XQ?=
 =?us-ascii?Q?pgep86fIlwN5LfEgT+fhcwcw4GFo5jdtYd63uxbrF8HDEi4rKRNhEq2AGxMq?=
 =?us-ascii?Q?FBUxlBeYM2l3rBMHV1oDzV5ElntkOLVjFJc0Frpa2T/G5EaVWE3Pii9tfhLt?=
 =?us-ascii?Q?N5tm9u51siVZpSR9CYPFjPMzafPt/Bwdq3RzmRkTTloehZfUF62XdRm2WGd0?=
 =?us-ascii?Q?4nWp87bEyh+JmC6inkl40Q5NMzbt5qqgBA/kaTNEtNdR8r0lEm0SrI77AiDp?=
 =?us-ascii?Q?ZV4959fjYcqFZR60+XipQGs07GazTU74iVom+ejpjpydoE9F44DRLN/uaUKm?=
 =?us-ascii?Q?QmuQcZD1m3x/tnNlGGH5deK9f1pfjvTVC7HsFjbcAmgi7/Wzcmvx4N9XKjw6?=
 =?us-ascii?Q?uim427uPBh3a9RbN8Xm4g4MwzcssTV7LGSI8jvxsoop1e4VilcsYprDMkgzD?=
 =?us-ascii?Q?Ouw7f52QHmHoZdYRrHyFi3Ga2M3INweGr9BlkihG3ITyDNiai1tIHI6v5kVl?=
 =?us-ascii?Q?5py2flEPFAqp7R5M2YmazGl+WyMgx8BgwonyzJLekoMncWIWWdLxr2bB1kBZ?=
 =?us-ascii?Q?KfpQC8eY7pB+/t5iLKqE0mWI/pMkgmDyetrKw05Lf61AkC8ErEFN4ojZzLTN?=
 =?us-ascii?Q?uo4P9u8yJHedq3ddR1Iv/Qcwr89iiMQud0dcGPT0N5l7bxBp8H561ryXdYgQ?=
 =?us-ascii?Q?Bd004iF2ZSam/38/6cBfZNZd1lQbyXH9n0CP9NVlDac8ExxuoZpwArkoSWmY?=
 =?us-ascii?Q?XG7g3hhJhUegLIUwyC+cCRpbnLlp8FXGlBezhnSNNo33i9hDlFREAQRHqPvb?=
 =?us-ascii?Q?5rlo/5boqPCazprrgZ/ShfUGHxSiazc86vPkpmeyb7npgl58bDms4KMuJoA1?=
 =?us-ascii?Q?UJOYlFLjfH2KgicW5yoSzDvsXYaaRcGgaoDtuHxI+MnkKFEqRHgWDRyu7Ob0?=
 =?us-ascii?Q?qRVErz1ZxZICWPMGWl0FznPIqxOLUHir1P4Or1/jMNiun8wQqvZ15j4xAAiF?=
 =?us-ascii?Q?cwYRubtkLsRUPA4eGcTV/CflN5YXHKK5DjwVPmLwQphqg5uX7aMQ3WmWaBNc?=
 =?us-ascii?Q?KkUoMUScpY9/6D+qTuEIpl+X/KPUw6InnzTRbz7ocRXX4/ob61PH8wFm/wCy?=
 =?us-ascii?Q?i1LdCczxel6H7nnzjhJxUqgU/LiYLpFE0Axj3mgd4wrfB44N36vG6mVRl/AR?=
 =?us-ascii?Q?4p45+1Z2yRMwcdJ+KX9dz5UIaAdiPZI8AWCWWVMrQtyHfWal8cD8rSUp9ITH?=
 =?us-ascii?Q?e7wMN+uijN0KKN2BsjxSYJsKVADMElODWv8e3jekJ9TYI7gdh3qIso2A2w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vUnPsbA6rurIvHTrkaNOPw+aM+w7MK713rY3u4iqakhSwhcU1CN9UNl1qdUh?=
 =?us-ascii?Q?Nq435VoA1oBoDIDmhFualui7rW5iE8K0ij4ysUJ+7glYv8YYzZsM8rDs1Wyy?=
 =?us-ascii?Q?X+P+mQ/oZFOwp9PLmlSAs+J0sMvJuJDLDvRjLQr3+hET/JFkeINPTaakTA1D?=
 =?us-ascii?Q?CzFcmfcr1j3qH1DWmSwbVtuS6u8yFRPbXAowijOHZTB5yPXgKspHyWORSuMP?=
 =?us-ascii?Q?vbiLGKI9MpOCfk8ICZNjSPugFvCteM5BdaV5SjPTc9y2TDRT+KKoSxpRzu1S?=
 =?us-ascii?Q?qRLkoBiO//cBDM1LGDtFwxQVYHFy/bV6K1jQlCazJukZnBn7ESqTRSWeqAIG?=
 =?us-ascii?Q?JkELx9LsCOyd7Sd/upDkL60yI8oWb6QOVBBDktMWYTjuES4xqM11ULhghM5n?=
 =?us-ascii?Q?BWTO5bzomSCqM+TFTf5/VdMCG4e//yacEmLdwmXsfKXrMxjBTbOQuIcfX9b6?=
 =?us-ascii?Q?/k+d86yZC5igQBtWWK7cZz5WgH4mUkLOK7jBCy6GNpTUPJ/Q7NaHdBIjtFne?=
 =?us-ascii?Q?XCIkbukdMgCuG3ixrxVfJqIP0Fkh8y9Ng7PRl0CUWB6Wub9JX88+afUnLXDC?=
 =?us-ascii?Q?+bUkehWklAPyqM+PJ+1eTD7c7x52aFyAVy3gJHNVf5RsAsf4HU769YODutsN?=
 =?us-ascii?Q?AUmDrh1zoypzyw2KLz9k1qjes4+qYdgvUxjgrnUHXCb6qu6Pa1/wPPMoG4DP?=
 =?us-ascii?Q?NxdfzTdGpRqhEmnf3E3TEKESA1St7UFpMSJr0NM9EwvJyiKYGosGxOTjIkZB?=
 =?us-ascii?Q?UUom7JXWSuQpVrPdbGu1NsuBnqPpH2R4N+k0/ul0LaW0Vclg0b9+ixPd7pmd?=
 =?us-ascii?Q?w6hbhOLWxHt01srbWfggMkg4iSmfhnHHiJk/KARdMZiXKKgVFCBZtde2YaIj?=
 =?us-ascii?Q?NinyxumG9NN6E4l3qZN0LTH8FwTmanx2e+7QvsZbtKj5RqNmDXnhhpWx2h0r?=
 =?us-ascii?Q?AfESZx7ZfZBRgcZs4oT+L/SpUNRNdNcBPyfrTSGykZMPRr/yLfOwFQqRlLF1?=
 =?us-ascii?Q?FloyQZZirqdZ1f7NQohTGXI1Udi7rZ2iLg3Sf6W5AfkPwtu70ZqV2NktjfqF?=
 =?us-ascii?Q?JuEg64Q/ZivBnRNIKYRcDMAGugd8zDpgLM+G3SlOlUEac6U1YG2YWj2XSysD?=
 =?us-ascii?Q?LEWKhGt8wW0O94/2e68jrJxQ9wTc1hpILlyqkNwf7U92rI6Pw+IDK9PoOi0c?=
 =?us-ascii?Q?Ygksbx4uXJr2P6MBbyDAhsjqG5NyllV5F7vdeCxteJFt5z3yo37hofZAu8eS?=
 =?us-ascii?Q?T6/IWPZd7+QpCBDd4gsN3gWmZHKEcCAZ7m2CnHp5UxE1KmsKf6EWGeqxDe+2?=
 =?us-ascii?Q?QLVVDa20TjeIYiQMdPGpksKdF0THCFG/Py6F8VuwR540n+Jypj+oEn3pBsuc?=
 =?us-ascii?Q?NFJpgy4PCw/Z8cdcoW/kM3pHGW+08cM2nQ60XpyM2QT4/Dm9fk/B1OYydxNS?=
 =?us-ascii?Q?WoVHXGYwgWwdG86Dy/jjeVnH60/I/O0SIjApfT4IkSb6/U8WV2oZETUBpZoS?=
 =?us-ascii?Q?4gLC0uIrKS6fVKixb+SxTfr4N4nneb4LcPSBRLcXeHjZsVy4js4Jh8VDRW81?=
 =?us-ascii?Q?ItrqT1xTar45jmebfFYvHV0kqOOZIH2zHN2GOa8k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef0b83a-e5f7-4406-4999-08de317dd441
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:36:03.9470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9donggE1X38+DtKkFDjKuguZWbYYEJvMORip4zUrLOonDFwuFtB2dJs2usuT2Vt8BHkuZVikboRyUbevJKbuSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

Disable regulator when error happens to balance the reference count.

Shengjiu Wang (2):
  ASoC: ak4458: Disable regulator when error happens
  ASoC: ak5558: Disable regulator when error happens

 sound/soc/codecs/ak4458.c | 9 ++++++++-
 sound/soc/codecs/ak5558.c | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.34.1

