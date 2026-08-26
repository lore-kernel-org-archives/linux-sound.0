Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC41346AC0;
	Wed, 26 Aug 2026 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787729968; cv=fail; b=j8Qd8nfO63BThTxAWliSrbOtXNXjJPca9ffSPNRL9Qk0DKO1JAaCvBzSDDpb24B3dL9jRo3D1hmhCdQAaM7y/HdNHqklOhET0NVQY+dwBuFIa4Br0POVbfcoAn+wUYXjZkhdrI3KzJDg+KrhPNair3Zcaf4BmxYIj/V+OhFfp24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787729968; c=relaxed/simple;
	bh=EHrWoueXIS/vHQ1QuFQ3HvccCaIZHtrrVA8Uc2/MgNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DKjGZa0LPzEP4k4u3vgROIqL9Bap2O2SpvooAdcTeWdUrf33pZxCUHveVPy+oiINgoty18MiCqc5fkmQ8h/4xCqZJb+S0PpV8Ke8Z9f6CbneEfPfHTIqexgUkSvRwXc6REMwKjrs9x8fnWxl8zCzhljCg/fvqZjbhepcCw84PAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wQnTdftq; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wQnTdftq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R43JFKtg+0kQ3PULyOr6D7g/UNPBoezR4WGU48rTaw+cL/S5cKjfKDvNFe5YJc6fRK1boUHwTAAxcPSEMwLmCPbilFIu6sE6/L7Km7UoFx+MMu0tzXVe63QjpJ77J6BZwDbLX5rnRVSJJvxlk3TFRcYa4mfOq1ZujH8fw9PiCV1Mot6XtNC6obxw1CvaepDkca7ohkFIWnicMBD0GAbfiDwcuBNEyEzaJTptwGCMw/dagKYTZ9chfggL4IixFTgy5tNLuhXJAylDvNBzqOkkHG0RfXoG+k3qGvSTV4Y6SaFMGUXXzzvmRvVSogr8uBE4bjK3pPo8Z+yvVWW3IRIW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHrWoueXIS/vHQ1QuFQ3HvccCaIZHtrrVA8Uc2/MgNA=;
 b=GVYCtfepRzGNArya8yneoVi1KAgucnXMZXI/BTqAGugjTGkCH5arLTOKvTnm8v7ZOFmHzzR65kmpDitgWaKlOqEIwY8+YrTdL2ir0Y1KBmTq4wM1wSDrISnKR6AjDsvHvcNw+ds5t57YPjetcyUrKLZU7qDh/g0H9j2B7kL3GOIlCHHYxsBaRvPevXQvm2FqycSP673rHO+YBy6ji11E77IHuApIWxzwVk6Qx/uUTuxK32OnvOzOtidbLZpgdqGOhgsKqZ+F0DpnK3B8GreWJpjFlLz+b6CivNnLv47RP/M506KcTwaawt9FPfY1oMWN7Tk0KOGgt9FIxUwZHQwvbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHrWoueXIS/vHQ1QuFQ3HvccCaIZHtrrVA8Uc2/MgNA=;
 b=wQnTdftq7Q05wwII8HDuMrJEGx0GW2nr6MX+8f3nHi4y7RbSZqQniGTf/b0qr74N2jszCUhqF085SAOgo/WU38cQuQY1f/p40DpuMcIpUvb1LtSI0Tlx0+N8yaJipESAzXSpfxKOFaafLnLgNIvefVIMGSOUgjOmokfXJ7r5LugapaIzjOZgYSAfJVk4JX2agV1pR2W6VwIqMD9pjSVfoSAaSUY3CuZalOjYAlQ+4yiByEIEcs9uFQUvMEbSmg33w/FKZxo5ZdGcEg6NUMCavWaq3Z8gl826vyQH535aCJs9k+dfm887qwSrhfcotmHbfeFS4gwDhLn4kfA3umhKVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by GV4PR04MB11425.eurprd04.prod.outlook.com
 (2603:10a6:150:299::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 07:39:21 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Wed, 26 Aug 2026
 07:39:21 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: stefanghetu9@gmail.com
Cc: Xiubo.Lee@gmail.com,
	broonie@kernel.org,
	festevam@gmail.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	shengjiu.wang@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ASoC: fsl_micfil: balance mclk enable/disable
Date: Wed, 26 Aug 2026 16:39:11 +0900
Message-ID: <20260826073912.1265526-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260822115959.74496-1-stefanghetu9@gmail.com>
References: <20260822115959.74496-1-stefanghetu9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|GV4PR04MB11425:EE_
X-MS-Office365-Filtering-Correlation-Id: 2860b0df-c0f7-4fd3-5dc3-08df0345242a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|366016|7416014|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C7WID26mUx+3s3HW5G5KB+KhS0AYksnAD1Tox4E1GVIfilM4frVZfrmgQ8ATEo0XEc5FIFiPZqpD8walyZKiIv4sTqnD90iDV7+XbDxG2ARnLrfKSxsD6E8dcD38mZDN33jrLaE1MkgTP9OSZhCEzBbMEsgu62dkFpAnBqoVEG5vtOBD02w4jZato4t9dmSsuL0TITQb91u539I+oOi/BiaeR84hXuEfmYq+jB13eHyfKQLR/ilQkH7cHn/v0bK+paW5WAOIVQRkr+iIg9e6BmGJ2CNID2iqigkCnvvJBKOkQpMJ0WKaiKz7uyI1cfbD99KryrOaKESmGjlEDiHps4FboDMtncsDcx1kaAsI9Zh9FEo4MyUBpgoyuPADiYM2v7WP/LoEWNfqm/lkQqHiY6e+c5T15S5p8EezCMsLlZ9AXVCTVcdLPUknWjgxGfZHeTKDIJc8iT29qMoWEvTEvZybDeJJLkGRcpRaBs9jhacp2Nm9P9oAYUVXhuFYKVUUBisATOXYaDJhAftWXWun0Sa0apqBZmnH2+Va27nepCWmVpSma4dbUQsU6AwBN0nIH5yn5DTWDtRViXZHI8lLOIMLFfmak2lXG4r1sHKGyxHe5hLG07TVJ4TlsxNVdQTro1MvAO5oGDItFZKNM4yzjtpPp5APyahvBtveWeYCWbw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(366016)(7416014)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2M2VXJ1aWtKWmI1dUVzVjF2OUNjTVVXcEFsaTd0MEZyemNUT3R5TnhiU0Ir?=
 =?utf-8?B?cExuWGhSeERSeUJ0VExaTnlxZUNzeVlNamRqWEpUbndFQWtZZzFkYTRxbnRz?=
 =?utf-8?B?c1pBMWllNThyTVBRT0cyMW1nN2pYRXZzMmlBd1BQYmF3TzhHWDdHZm5DYXpL?=
 =?utf-8?B?dnFxcU1BUkxScDI4Z3dXQ0l2M1lzSDlkcmEybktRYzR3RDlhZUZwNXhvdm1E?=
 =?utf-8?B?b2dQYzhyOGZhUG1ocmhQZVFvaTdGeDBsSDJ1S2Jzbi9TeG1oMWN3clMrNTdn?=
 =?utf-8?B?SC85RGtxTGRHODM4RFpma0ordjlRaG1EdEdsTzgxWTVEZFVxUG5WcVRXOTVB?=
 =?utf-8?B?WkdmVEQ1NDRDZ1dGdDRpbzJXSUE2UGtna0ZrQWlROWEzRXBGWEcvWjFubmxI?=
 =?utf-8?B?WWM1LzFPd2N5SmMxU1RoVjBTdXc4b0llRi9zZGxzeis2eVdoQSsyQk01MCtG?=
 =?utf-8?B?V0NLdTdvQSs1VWdLWWhZQ3ZGdC95OXAxSkZNTVNYZUZnME8xakZmOXM2Zzg5?=
 =?utf-8?B?ek1NaWtTSm5xWWx2VDQwQnBrQ0hhZms1QnFUZkJMTFpQMGM3MTlvaFRnZGVM?=
 =?utf-8?B?ZlV3UkFUTThUZUpJVnNvZ1NRQjFwQUtaRkkyVEpXd0pOQXlQd3VDcWlOUThR?=
 =?utf-8?B?T0paR0J1SGZYRGtTQWFjQ0hielozdGUwSUYwTDF0ZzRyOEFMc3RUMjFIei94?=
 =?utf-8?B?RTJRWlFEaDRIY1krUWpUYUIvK2huNVpVS0xMZlY1Qlp5SWlVcDdqWERiRHo0?=
 =?utf-8?B?UTJZcEQxbjh1Y2YyMGQvLzJCaDFCck1tS3Q3TUpWd0VYdkhZcFdGVzlpdWRV?=
 =?utf-8?B?U1plUGgycHhGTmRSUHN2RUNnN2tOQ1hQMmQ2aEdPeE9KMmxycHRmSkFSc0Jr?=
 =?utf-8?B?Q1g2ZVpReDhXOGY3UzVQc1RZL01wOFhKcktRRmhpa2g4emRoamwrUFZjdmRS?=
 =?utf-8?B?TFIrbklCLzliRk5jeDZ6VTloMUsxeGhHS2xySWEvcHhIKysrSVZzZTI3eFZn?=
 =?utf-8?B?eklmcThIZFNNM2lyeUxPYWZiajVFY2FPZ3hWNUoyUVYvVndmZ0U5VHFreE1a?=
 =?utf-8?B?RXVpTUpxNThKU0lLMHJEMWtuUC95aExsejhlOExoMTVGUEE3Y2dJNTdWU1dy?=
 =?utf-8?B?cWxjdzdqdnJNenEvUmlZMTBESnBuWW02YmNCZ0I5Z3dxOFZUMEJOVThDd083?=
 =?utf-8?B?YUpHOXR4ZDZ6OHJWMmhRdUg1OThYbURlOEp4OVNvWHdoSDhQTGJMblBHeGcw?=
 =?utf-8?B?VUZqSmxYMUw5SSszaHdIVGkvUHRBOGZ3aFRlT29BeGhpMk9tZkN2TDJBNk44?=
 =?utf-8?B?RWdzVzExWmtEakF1bitLR0U1Y3I3NTNzYlNkUkZONVcyM0NCZ2VvMHgzeGZ2?=
 =?utf-8?B?L25EekliYUxMb2MrQkRKMENQQU41MFUwYk9wdXk0L3kwTVdGSGhLbXZ3aXhB?=
 =?utf-8?B?RVZzSFJDdWwvYnFvMFlEczB0NThyc1MyRlo1WDM5QzVPMlgvNjRLL0J1ejZR?=
 =?utf-8?B?WmpBR2N0L0JhSGx4UWQ3TEtxMFpUMDZ6NTVBZWtxcXpEeUdvVHFZeHUxQ3R5?=
 =?utf-8?B?ODZmQzdvdVFPWkhaQ0E4MnFVbVU1d2xSTEFFdjJFTkgrM0xNUWxFWlNJUHB0?=
 =?utf-8?B?WitudVMyOXp0em5UNTRTL0JGT1JLd2JVS2ZGSW1tQzZSTnQ3c1BHS2JsMi9k?=
 =?utf-8?B?U2hDdWg2aWtLck10UTBIdEtFV0JGc1FGYzFMV2tqVmY4NmVteVBid21nVTQ0?=
 =?utf-8?B?UE1vcHlRck9lUU1NNWQ5OWJhYlJnclRNUllwbUZ2SUhIY2NEdi83eFBFRmZG?=
 =?utf-8?B?VlBIOHYyZkJsN3FqZmg4VHBxUnhyRFY0M2RJd25BVHl0RjRPNU1sOVRqaFdq?=
 =?utf-8?B?c1B4d2JNMmtFeTBoV0RFRlg4MWoyY21ieEZpeUI2QjlkWTFLaTVYeWVPMVF0?=
 =?utf-8?B?Z3l0aEg2SHN3Wk1kZlgxU1JCbGVYOHJKek9JL3laQ211SHJveWwvb3BHTk9o?=
 =?utf-8?B?NUUvMmpqRU14d2ExZUtseVVsMDc5c2hReDBwYmFXb2ZXUUhXY0swWWpNZnZs?=
 =?utf-8?B?QWVGTVpKd2hhMEhab2d2R0FONFpBT1VXZVBqb2JpVlNKV1c3b1hDR1lLUEU4?=
 =?utf-8?B?Vk5WZTRDcG13YTZDcGM0RjdRVmdjblBVckdNcWV6SUUrWU81VVE3RjQyaUsz?=
 =?utf-8?B?dW55bGgwSTBmRXpOK1B0ckRhRUU1WCtzZlBveXkyUVF3U0VLSkZtWGNUMEdl?=
 =?utf-8?B?ZU5ObmhmbFRiQ3NQOGY4eTNpdXc2RjQ3aGEwNGd0RUtPM3FIdFMyVGF2L3RD?=
 =?utf-8?B?SkR4aHJOVm1jUWxCa3VEMW5Ya3BoanZ3SlR3VWQyVUFaV05oSmlDcEFsOW9u?=
 =?utf-8?Q?vvG//G5Iy+fLo7Vvy06lNxXcou63ucKfrjQVZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2860b0df-c0f7-4fd3-5dc3-08df0345242a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 07:39:21.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZeWGfO0x7yVPXDA+r6l29WWdl5MFmVNriuUgwDbiieKxTYahc8TlX4Zt4eCQ/1YzMsfHKX9eBv30H/cw0hnIhH+Gi3uackRZBFXMvz5laSIblLVnXI+1o8TpBGHcJcz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11425

> Fixes: b47024dc624b ("ASoC: fsl_micfil: Add mclk enable flag")
>
> Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>

Nit: please drop the blank line between the Fixes and Signed-off-by
tags. With that fixed:

Reviewed-by: Chancel Liu <chancel.liu@nxp.com>

Regards,
Chancel Liu
