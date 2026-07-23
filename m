Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0C641D139
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 23:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784849522; cv=fail; b=igr3MESTFZIr/ynmHPQ4F/dPlPdqc0ODcH/ng1DDrisWerCWCFDFsJrEZVNhnujBOhuzYJ+HNo4mCA8+e2iCVhFBLXLg7ObVfK/hshyaa0BihpLF6ph2r+XQjv4DRfC5THJIW3IMLzhzlmqLito6nUUz9gM12fTBG4gqsBFX32A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784849522; c=relaxed/simple;
	bh=i/lJDo0IKxiuRIgPLBS88oXSejyhASn3QQhduQCII3Y=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JyUx+vKj3B4HQa9yJV36YTvlmuv4qp0Ba65jM6wVafDYC+Xebf42me8BL/6Bz7IKZ0Cj5gnlRPbq6TabaGSvALzRLwjmaiE+xTsJ6uykmMrQTKDhj/eMvPSevtsGVt8S/lx/AWj6rEDMH1YUL1kmSFwGcg/WAAPpikyewRx+s7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PL1p6JZP; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PL1p6JZP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfQI7f1l5Qp2C1kLZBhunvc86uBUacd4NAIuzVUYntu8a+arNRDa+u0oXiEc1bsZP8Nh4e7d6Hh40vXfWujsmCLNsuKF7EY28n496X1+wkxCPdCgODqoPajaIJx0SqaCWuxfh09pjEUmUlU+PANrB3HWZBaBp4vSwaMIFPq8QuuikciQ5khjAJxu4zeHItfrUA6DK2ONcwoOe/bjerZ1Cnt4uKciL1SQJWJ+npg8bZ7QHWiR0th14Ks+5EPGUXwb1n+1F/eC1pMzT1H1TcEL7ONz3uWsfD8KY0Em7eZ2Fmb+scN+hndmVLLFcu66rkVtD2BZWnFW1dlnSW1bnIVo7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bffug7sEkQ2wD5eT2pzGr/Z+irKFuKzd2f4B3HpefU=;
 b=kZtWPP49AuixjRMR4tdJVoLtuOgJ6GNBE/X4BA08pNDMZg3m4ked01DGtx9y2g3jyuJCoyfUZ/f35yGq4pBiGQ5NE5iZIsi9KtZcUQJVtrEgpg9p6KvWkq41VI6ar2f2XXLa0gqwPrmfKNsmknxqeJqqbWJO+rFWIJsgS4fFszsobtKygWZMTCwFEl4s9HjR5eWwg5QSNDLeG5NSuJ1SPVKsisijbOHITlwlpvviWXGpshUINKCwZqQXEHcY94HGBwYSPbt9dhE0tDCCrKzt+WZVVhWLZa4cZ3tXq8hE/4fq0SGN5MekXLb/YrwYaUDiuNTenmRabE+HtRz23aPVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bffug7sEkQ2wD5eT2pzGr/Z+irKFuKzd2f4B3HpefU=;
 b=PL1p6JZPX4A9Aby7JAc4v7fIFAi0+GoSoSA2tlalZ0kfIEjkXoyTjJpCYepvH71qMb1E6eRii1iiDqpM+UkHLOCUV63+E/nA723S51sUM4a8dWT8rtiCf9wDRSnoNcWPsq7RAbI3dD+H4Vyn+sBZsJKhwoLgFk/w+eAfDcgZpIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSOPR01MB12427.jpnprd01.prod.outlook.com (2603:1096:604:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 23:31:55 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 23:31:54 +0000
Message-ID: <87zezh2sgl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <linux-sound@vger.kernel.org>,
	Bard Liao
	<yung-chuan.liao@linux.intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	"Liam\
 Girdwood" <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin
 Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Subject: Re: [PATCH v5 07/12] ASoC: intel: avs: probes: use snd_soc_register_component()
In-Reply-To: <58f7f20f-6a70-47a7-8aed-05c5676baf25@intel.com>
References: <87y0f2rz8l.wl-kuninori.morimoto.gx@renesas.com>
	<87o6fyrz7h.wl-kuninori.morimoto.gx@renesas.com>
	<58f7f20f-6a70-47a7-8aed-05c5676baf25@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 23:31:54 +0000
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSOPR01MB12427:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ac425b-c784-4a7f-c6c4-08dee91294a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	o+vY4F6MBbtSZPQOz/MdECqm92UBc2kYdMU9K8GiievsZBmUaymsCc6EkQrTk/TVhAx0fJlnHVc5uB5w0JGwkj5jTHUUS0T5ug4Swn5NrqQv0BJo2QyTnJqy2US9NywS2Cn3GzQppntVkuwFTrZb415VQX59gEY1di/si16ComIrLBX1O0lyEdSTHzS84xSA4vXb2rdZAq4bGkmcJlKfGECzj4nA+OsIaRF+o0CKE7SH4xUzFeJz94EKZlMDvOtlpaQfxDxt7Paaz7UAtAkj+ETEEvHVpK4m86VnrV+UjXEtkCtAf10M5TIH+kdn3Z36kKTl/hxwiOIoadIspITfRPTL+Oy0qxIdOeA1clTJRlDw6pQLSIMtCUtuJosNTTuX6iWaoSrekdMOJMDZcxXsuCymkIoRR0pkPwxGQLh1ErTFCibOi0zmPnOq8LYOz/7/cFv5OdpillH0+hMlvgopv7LV7prT0nSEaGoPVb/FdckAsemiMNKISx8WrY2euIJCmK+BqZgIGXGD0qPEEXDkKqhWVvvYOt3UunuwHIbSKTCy1kyUg16kMNkyw/FVm9PKrIp28WmvMs/gbcQN2gpeZ7AlMUZMJ5RAX3gPEuiIIBWRFMstxjTSCFXw3dXpcnPJS8RfAYYgiF0CtHD1qxBeXDhLor0QVPgH0cT/zIeq1N4j+NkfwtQQ2pneBnmxRG6+f1SUYJeYxTfb8GHQJ14KuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?STe6pbot3ATVbVWyRtQt/XVzrPrOFjRTVDY6g2CMglhquUnrKg1IU9JpatQB?=
 =?us-ascii?Q?mW+j3LAQI25+v0vWAGfs4uVAF4USDd+5b1oo99QACfb/VD1dWzk63GR9Gmkz?=
 =?us-ascii?Q?hk8hFF00bIIiwYLQjgISOj/rdO9G2cDFXYLVFmJQUGz/WAA+3QX6RNOUyaGK?=
 =?us-ascii?Q?ABTciPajslBdvCjSdOWVe4c1jNGa4h0UKEayMtup/DVjNminaJpMTVE6bpyz?=
 =?us-ascii?Q?QAB9SYeoZa5pEoIspp/qeU/Wk/csUZ6H6afzLUQ3FkjaBImYX8gmSrPXgoun?=
 =?us-ascii?Q?OSSBPzUOgWuPEag/m5MhbWHj/W7d70nXOWIbEkdBPHCa+Qa9lMEraLypIhSw?=
 =?us-ascii?Q?AIuGE1koKbVG+wtc39lsNABDyoqlovwZbNmBscS3WqfamCAzo85oMIRVSPHh?=
 =?us-ascii?Q?cKEK23thJQTkXCyCC5O3qTkm19ee/0iPglDmtcko4yoDTGH1G44rS2g6mHQM?=
 =?us-ascii?Q?Zfai/5x8yNry4gwMJjvDMhG94K0NjRK0Zn20VEBnD2ZcUYbWc85OmydBtqX7?=
 =?us-ascii?Q?rRUFG9vY7S7NXMnqjpBOvjWjvENNqPjbPCZoWLBVT5LRp2uURz/78vRiYkQ5?=
 =?us-ascii?Q?BWb+5B9A9CCILhh/fqs0i1sFEHT93l28AxQk/RQPC9ypFB5+0ULZm8CPyFRl?=
 =?us-ascii?Q?XUYV3UJEMDvZOTvMV3WSGITkhRVN28j1aOiTBKzMzCVDRxAWzYuFSfQoNrdx?=
 =?us-ascii?Q?mm4QIKb0BUcNA3VN98BqXKC24gjXJhBaOrR3JoLZITrc54YTg0mhAhZlRwk7?=
 =?us-ascii?Q?hMe8GYjH16DHsmHgsAShWCYsRWqxdUFawOkUb2eQfDaA/xcGXwbQlA/H9DNl?=
 =?us-ascii?Q?cc2MK1IHWyf0eiV7dZabYX2ywe45fu6LPo21InMPWrSKaOidFVQeSQDxfjfN?=
 =?us-ascii?Q?CQiNVwX3x4l8ZQGDH8imMK5rUlroTSCoZ2w9LJsmOpxcwH5PLwOtKguy68Ab?=
 =?us-ascii?Q?tqJoIp/HzKKXbo+fhVkngfRPjk8SAFv3rDjKInvyxKO9jpBBT4WOYJmt2d4F?=
 =?us-ascii?Q?avdkmy+xKXg97poAmE1CxQUZgJ8qGovPOLp+mXc8XMSdNP/GZrfxf1R4buY8?=
 =?us-ascii?Q?xk88eDY01E7F29excptYWWdOqC9fPhruePVEdCp8nU/JGJpmYmTXfNLbrW6z?=
 =?us-ascii?Q?zyEdMI4J9/xcNeZuLPN3VBJ5PVVdOIPT31zTSCW9oHOc9rsDHc+8N95Gn877?=
 =?us-ascii?Q?McT67HZ2Tcmt6qQJfxGZdpIfgh6hd9nQXE7QUg1wYu8U4xvm9KfJwSvQQK4b?=
 =?us-ascii?Q?HlW1hOkmTYaCS1VajdcQC9xH2PkwE+fDZ737xk2xJDaAK2EserVT/JL/gZou?=
 =?us-ascii?Q?rnvuy9rL1zbFnRal08Og2mjk6OhbsW7Ab9AxNoX0sA2i+QN9NUL7WyfKbuBL?=
 =?us-ascii?Q?OSxwo+3QtKcabW+7IcOd5GMO7rDkgbshC//8n2w4TfVV3Xnv2wujVKKwwneK?=
 =?us-ascii?Q?9cRGHWag9tVqBXYPh5e+hOBvuz3/SeohJcg7gW3+cJabxcdLw/0tLzZDesjU?=
 =?us-ascii?Q?+GfD/NghfJslF+M8+7+i15aYUVOuVrpXqVFLoAzM6DQZhWzAXmE2L0usxjvX?=
 =?us-ascii?Q?acJgb2+8BPtL07e28oyKcyWOe9H6chx7gTyVZ5yclSEtVQSc0BQGJdVMsfgs?=
 =?us-ascii?Q?8QfhWZc8xGa79PCIwemrQXMoqvsq385wIL3hAgkYv7H4Oi33h9UzXtTaePa+?=
 =?us-ascii?Q?SnJ2Dc1YX8V1D4Ru/dJmFI0It/fvTAGtZ+5agj+31nFTP4k6T13nTOevH9UQ?=
 =?us-ascii?Q?s3asTFOc5Idb3ldDDHaFPvXk4KuQbKx5Ty/7JDyfdc4Tm73dj257?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ac425b-c784-4a7f-c6c4-08dee91294a7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 23:31:54.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IgEObtwUFQ7g4gHYXqQihljZ+UBzJYFDEwLJ7xgJdJhD2M7AYroX9ubVaJq6AsILeRrkKciZdFXgsw/ErVSFc7is6JhXLNE6ZUTf4pi0BtVtRPfXN6SmG1X0Tk8m/Jz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12427


Hi Cezary

Thank you for your review

> > It is calling snd_soc_component_initialize() / snd_soc_add_component().
> > We can now use snd_soc_register_component() instead.
> Noticed it only just now, why is "probes" change split away from 6/12? 
> That's just a nitpick, not a blocker.

I have found each "snd_soc_add_component()", and replaced them 1-by-1.
I thought [06/12] and [07/12] are independent.
But I can merge them into one if it is necessary. Please let me know.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
