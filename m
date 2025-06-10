Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC41128C00F
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549468; cv=fail; b=n1ec3jSJKcldN4v0Qly1StZpMK5LUFgcvv6b31ZZnez+/C7EJqcorI1EG1IlplCY+lXSjsWCUwgOdPyBHskU1eAdCzCWq+nLxOA7zcPiYo5Btf2vochrSOcufF+mGTmgMBLk5nx3vUnSqwIPO6AV6wA9f6KKyMF0kP1OutS0ajY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549468; c=relaxed/simple;
	bh=Vj1CY8EptOQhb+Sm+MaBo3asqki9ri3elvADwnvdV5w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l8FwGBkiSE5XdhlKqk9Hp9LIlZNU49L8ClzI5wcWgBESE86XhCLStZJPeMWvzRvJhDNIJWWGzOf4L1Kk0zvCEtAX8CZGtDQ/hM/X5fomg23YJkP1Y0YHdUHcX4DRdVUlCx24ZuXp+MwF0mZZ2AnsMi9XXovYxLVLaOeTZoNcDGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WQD8n1Qs; arc=fail smtp.client-ip=40.107.223.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WQD8n1Qs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/AjieQJsJ+FoRuwFKwclcVlQO1m8Ld6oxbVlj4BoiTRj/h5kurACPFCR6jyRL0p6iY+IREUT2BGbEQXuZIf23r+qsKn2VuL9pxw9O9oKgQnZ/NEjc/4U43gYRRBCCs9jamS0cy8T7AKnMtYTHDq8SnPWkzoUUBI7CoCZy7+Z/HWhy2MKRD5PLVPg8J6BqAq4Di/bOpTD1Hf0GGRgiLYGKUdL25oAFEr4VU7Up9Yb9UJRvgoVz5QvZQOI3vrbol42swN/2RgB5oThvIG55HQM77lo94Pk2d6HN2EveK/L2yR1byOJtPbYIQdkvNiIc+KTycNI2Ucd2wZs+FW8YbsOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTF5R0XdmzyBgnxbjljWmd2jR98gIjzRHyPuANL/nvE=;
 b=s1SvdShRkdpzf4U/+gS6L2dR2r5vS4R7+/TXFRw29/P2/oZdii5yD1tjnAMgW4/+D/6zCTniErjlbmc206OvY/gKZUu35So+i9I9Q8hSz6R7EUCZgkpw7F89drcUStXQyRZwqOurerxK9R3k4YBhOxtJWbT4ujjtezdYcrjHWFt7sGJpCRLRakGK+7wDFJK+K7AhSo7CM8+o/ibzv+8W1uhl8N+AlbOfCrdDTNrzNhvopdkf93GK3dGktjO6cvtFP7SU6G5ygTZiMeD6xBAgk/Wshgf5JtDAqqvBPCmv+2cTWyNSyqtbfEV4jVxvvLheOj8pmA0//Rz4mbscbmktZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTF5R0XdmzyBgnxbjljWmd2jR98gIjzRHyPuANL/nvE=;
 b=WQD8n1Qs4rTqVB9zsmNmdWzzGdWwqODu8bVeir5o93LfOx79C8idkcMPMLB0XAMEqFUCiiFW1Uy5In8w447FAr6s9+ClAd2BZH+ggGJBXSliI8dF/NwCCvHZSpnnuK8M8Pnan77nFPa8maD3z6gWoDIVK0h/Tm+tfT6Kfa7cc7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH7PR12MB7453.namprd12.prod.outlook.com (2603:10b6:510:20a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Tue, 10 Jun
 2025 09:57:42 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 09:57:42 +0000
Message-ID: <01c72c17-d3fd-4402-942e-d4d147d70c83@amd.com>
Date: Tue, 10 Jun 2025 15:27:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/37] ASoC: amd: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Paul Cercueil <paul@crapouillou.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Michal Simek <michal.simek@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>, Nikita Shubin
 <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Keguang Zhang
 <keguang.zhang@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <877c1k8bz5.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <877c1k8bz5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::23) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH7PR12MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: 1776330c-50b6-4779-a6e0-08dda8053d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUtqYmVuU1JRQTB1M2p4R21pSDFkaDFON2F4YmZLWHJ4Z0o0b1RSWS9IRStl?=
 =?utf-8?B?YUZpbElqNXE3UTZ2SDl5TVlaUjRXQk41OXdWWEUrN0IrL0lkLzdoekFxckxP?=
 =?utf-8?B?aTFYa1piellMYWFtVVg2QnQvSWNheFFpK1lhRHVmaHRmOUdFdzhBL1BBU0FY?=
 =?utf-8?B?eEEyZmFSN3RqZld1VUFsRlpOSUNZWG1LTEVwNlF5TGZFMGNMblVYbmV3L2Yy?=
 =?utf-8?B?dVR0Z3pHT2pxcXFxQ0EvU01CUDNTbjVXVEVhWHZwVGhseUZhZWVSRGplWk5B?=
 =?utf-8?B?amp6UDFGNjFCYlg4VjNkc00vMGRtTjVHL3lTVHJvMisyQU1RVk5CVTZyNXBa?=
 =?utf-8?B?dmZsVW5yT2krTmVFcllJZWtqamtUeXV4WmxubHZQQWZzVkVtVm14TStXWTlY?=
 =?utf-8?B?eDQrMHhHQXNtNHRsZzBlejlvVHlwK1ZrNEFubFlvMmtUMlpROUVFLytFMkJy?=
 =?utf-8?B?b01NTURiSEdoRmVPZGllRE5Fc3ZvWjEraVBPWVJkMlI3aEpSYVNrZjY3YTZk?=
 =?utf-8?B?MG1HeG5leWUrZkJFb0VwVXBKV1IzSUFnNE9ESVkxUXp0MFlnMmRiZC9rR2g1?=
 =?utf-8?B?cWJ6TzFINTFFQU5hTkkrekk1dkNYYkcxMVR3NTYzVVF6SFlVY3Z0dmpUWWlD?=
 =?utf-8?B?b2xDY0ZYUEg0MTlxS1lJRS9YejBFK2N5U0kxc2JCL09KZkNOTzRqVXIrV1px?=
 =?utf-8?B?UFZzckgxc1dHR0EzZWhiNExuT2R5Z0x0MUs3TFhQblp3ZzBMOHluS3ZmQmJB?=
 =?utf-8?B?RmIrL044OWRXcnRGMjZGN285ZXV0VkUzWjZjeGhMNDl0TkFnM1pVT1U4RGVs?=
 =?utf-8?B?SWQxNWFaQXhMV0tSZHhIY1YzYnJ0OGZTR1M4Z2Y0Y0JwdFBFZjBWV2tNZEEy?=
 =?utf-8?B?anFqdkRZZGpUTGdwMzVYUzRucy9ZWlJhamJWMjZGLzJwbUZRYWVKZUJVODlk?=
 =?utf-8?B?MGhMd2RKVmpnSGZaSW5vSysybEZndXZRaVBtVDd1N292K2VQSjFjUEZEKzhQ?=
 =?utf-8?B?QnpPdVgwdkhYbW1TYVBRUE1lOGhGS0JpckdOT0h1WmRRZkRRWDRxaFh3QWk2?=
 =?utf-8?B?UTJqbWxVSUlCeXNoNHhUMWovVGxweld6Y3AzOWtJbmZJQnBxQmpJZU5zVEl0?=
 =?utf-8?B?V01XOVNXT1lVM2RQZVBSd25OYW9kQmVRc2ROWDJpMVRWL2tNMnFXeW84d0Jo?=
 =?utf-8?B?SHJNcnM1YjhMZndpVTRYNUtlSS80VjQzU0hwaWZHazdzbU9hS3EwMCtPK0ph?=
 =?utf-8?B?V3gzaEtDeEh5bDVDQWFFVXY0cDQ4VzRxeEtuN3lqQU9qckxmUllUOWZtVisx?=
 =?utf-8?B?emZYb0kzVFAvZHMwWjlmcy8zTnJsVTlFdDk4NWtPWjNtcUFKdXBWbjlDb2xt?=
 =?utf-8?B?Tm5zWGdiWE9MQzh1TzZDRG0xVmpiU1VpOURXWnFFVFVkaHo0LzQvS2xKQmdl?=
 =?utf-8?B?T0x2RnhzeXp5eWE5L2I2QmhLZks5aTJTZjE2aGhHZG90QmRtWHhBV2R4SnZE?=
 =?utf-8?B?ejNUUnZCZDN4UlgrbFAvRlFFMHdxT3NyVUx4ZnZJeHh2QjJLOXdaT0NJUk56?=
 =?utf-8?B?VXNXRFE2RWVDN0RYMFJJN2RiLzZiK2tIK1BDNGZ2THduMGhKeU1UalhVS1V5?=
 =?utf-8?B?VUpiTjdnYkliTTd6empFZFcwNEIvc2w0V1ZsWHA0VmlReUhzNlRodUJTSlIv?=
 =?utf-8?B?SGQwQlp3UnlnSzJkOSsvcnl3and6TWRIdDNwZ1hTNUJvbHp4SzA0Rm9Saldt?=
 =?utf-8?B?enoxSXBHWnoweUExN01Fdmg5RVpKNkZOT0s4amp3SVU4MzJaSUIyQ0QzRGN0?=
 =?utf-8?B?VVhJZlNxSjMxNGVTcmIrQjh5NkFHMzczVjJ5M3RIZ2VlSUU3Nm9DTTY5SFlx?=
 =?utf-8?B?UkZtNGIxS0pRVmFwV0dmNDJSVmtoUC85MW01R0MzRkVmQ0VlbVM1WTBCcC9i?=
 =?utf-8?B?b2tJWkdlaDB3V3JVS0V5QzF5OHdsNXVma2s0cGRtMlNPYXMxc0J5a3RHUWlM?=
 =?utf-8?Q?ye8qSsGuzD7Tdosd4idjYwoaW1kh4s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2p1ZDFaSzRPeUFWZ1lyWGE2OHhjWCtiRHRZUlpzU2xueS81aUF6MlI1R2lO?=
 =?utf-8?B?M2l6SmcydTJUUko3U0x1NGwrRWJYa1ltbms4UmZuQW1KcVcxeU9LNURjRFZr?=
 =?utf-8?B?djRVb3ozY0V5S28vVG1wTHNXbGovOW43N2xRbUNrQWdNTE1sUWEzb01hUEVP?=
 =?utf-8?B?YS96cEVCeEJqT2tZTG1SMXRHelVub0JibXd1VERwbTRaelo2ekVXbGtJamwr?=
 =?utf-8?B?c2llM0dxSUJDKytpWHZDOUZMM2prWk1DWEo1ajNCM0ZxOURPb0c4Y3BFd1pY?=
 =?utf-8?B?U3QvN3ltYmM1aGxSQlRMMjl2ZC8ySGhYcGNVRU1zN3phUHdOeWEzNmNrZEFj?=
 =?utf-8?B?SkdTVHFaUklqRkVGQ2xzQVBjTjhLMXhzUGx5MUZFcktieFhCZUtVa0M0aEZw?=
 =?utf-8?B?YmpPcmc3UmtRNWtpTHdkWWwyZDY2czVwQThzN3NlZzRHanJwdnEvaGNPWkxH?=
 =?utf-8?B?cHJ1Q3Q2TjdJTjMxWDFKK3orWWhaYmt1SlNaMWpIeklINEhOc2s4NG16dWdr?=
 =?utf-8?B?Vjl6b0JGbndDTDA2ZFErbzVDMUpydUFZU1ZHSUcvOHIzVmRkRUxld1lHZ3FG?=
 =?utf-8?B?Z2s3eTRkOW5qYkdpN2NUNmJOSDRhdWJ1R2NSR3RpaVhnMTJ5TWhzN2JmV2NI?=
 =?utf-8?B?MFhJdXRxbEFMUHphdFFkMkRweEtQZzhHYjZMekZXUVdybit1NnQrTkx2L2I2?=
 =?utf-8?B?YUJRL01IV1B2Vk5xQWUvRFFrQXhIbmZGdkxHQWdLcExYWU9udng5SjVvYWR3?=
 =?utf-8?B?NEVzUEYvY2N1SWw0TUFBVkpKNUMrSmhsdCtaZ3FvN1h5d2dINVExTVBSMGxt?=
 =?utf-8?B?U29OaEhHWklJeTY1aTgyNUt6K0hlcTV3dUdaa1hZcHlwRHRTZFc4Vjd6M0sw?=
 =?utf-8?B?UzM5YnpEYjYrdFJlbTNMUzl2NXhDaG4zRUhhZWF3VjMyTUZxdDliR0RndHkx?=
 =?utf-8?B?QWFkMmIzNXgrd0p6Wkx6aG9XRm84U1NHNXV5akU2emIyVWpZeDQ4T0tpSS8r?=
 =?utf-8?B?S00rL2NTRFFtdEQyK3lTT0JIUmp4NEZJSzBBd1FVZ0JIZVU1cGV3UGcwN0Jz?=
 =?utf-8?B?Z2RoU2t6dm5lV0F5YkVqY2dVcnQ3UzRWTEpDcmtpa1haZjZHdTZhZTExeDdL?=
 =?utf-8?B?SjVrT25pdmpUdk1jbytxM0NuUFBycFhweW9OSWloc0xBVFZyZFVvTDhKMWF3?=
 =?utf-8?B?Y0xpSm5KeW9JZTU1QzVJMzdramxmUldpdkJqZUF5NlVSa0duUnRNMjZoTGNJ?=
 =?utf-8?B?aUJ6T29FTnFmc1FMM1d1TzlLYndDdlZTMGtrMkloVVhaa21VYXl5YWVnaFNk?=
 =?utf-8?B?NE9aVHBjaHcySy9wZ3NnRk5hMlhLUDFaQlFOMnh0OVNlNmpMS3dzSnFDZEpm?=
 =?utf-8?B?UnUrcWlNa1pYTnRidTdqT3pSM3hmKzc3S0ZMeFNsVEtRZW55NjlZUjZ4ZDF2?=
 =?utf-8?B?RnpJakQ1dUQzRDBxS1hlYlhCL2t5Tjhadmt0NGplaSt6WVduSmVjRGFzcFIw?=
 =?utf-8?B?dUcwSXpTd2ZKRGx5cE13RlZFUUtMemQxeXM0UFRMSmljbTJ3cGR3TTVaMHcx?=
 =?utf-8?B?U3ZKbU1vdE44QUtSVnpYUWhrb1ROcURxRzZ2dlU3Z1hUTzEzamFndEdwQjAy?=
 =?utf-8?B?c1liZzlSUGdWN1lvckhnS1hTY3JHVUVCOUtLTk85WFlyQWRWQll5c1VPZ2Nt?=
 =?utf-8?B?OFRLeUlja2hZQUh1d2NRUzZNcVBLR0FYTWRaeXlpUkxXZ1hNbExucisrYWFO?=
 =?utf-8?B?NjZYSXJRUExWZWJScTVzTi9mUGtoemVYSW5iaTB3Vk4rNEZ3NjhnZFNMeS9I?=
 =?utf-8?B?L3pVSjk1d09BMm1pVytoNTFoRlU5MjdDVmR4WUo5L3FHT2MreGIvNFFGUzhH?=
 =?utf-8?B?T2lQalBuTHJKUCtvWHFjdE9WdWZ5NkNLeXBJdkh4MWUwUjZyUXdGMDlGL2lQ?=
 =?utf-8?B?R2k1VWQ5WkNMU2dTazBpUGdsQzI3TGQ5VkRSbkQ4eHYxUkhjelViaUh3SGJs?=
 =?utf-8?B?UWZmWlNMN2RtS08wZU9jZnNwclgwSlZOSEw3UkplUXp2eUw1ckwzQ29wYk5D?=
 =?utf-8?B?VHErUzU1SlQ4aHlGOGxEemRqUjRndjM3cFFkYklSTmd6d1gxWHRVNEtkZGFW?=
 =?utf-8?Q?Pv4pZYwoJNTx3ABj3xt5s1WPr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1776330c-50b6-4779-a6e0-08dda8053d52
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 09:57:41.8622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYFqsS5FU5eP0NyEtBm/wzAaGXXGlVFa3YLi3k0IFfDCWyuDfuGlZX7u3RLAzfN9LIGxuQnteniUp2pHLPUHIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7453

On 10/06/25 09:49, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
>
> Let's standardize ASoC menu
LGTM.
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/amd/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index c7daae392d746..b1c4dc95129bc 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -1,4 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +menu "ASoC support for AMD"
> +
>  config SND_SOC_AMD_ACP
>  	tristate "AMD Audio Coprocessor support"
>  	help
> @@ -185,3 +187,4 @@ config SND_SOC_AMD_PS_MACH
>            If unsure select "N".
>  
>  endif
> +endmenu

