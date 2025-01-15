Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2107.outbound.protection.outlook.com [40.107.215.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501782475C9;
	Wed, 15 Jan 2025 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736942963; cv=fail; b=lNd1Ly7yiCRII6pq427fTsMFavED6xyDNys321BxLMqLRgzZTdOx6VbTWslPYXf39M+V0uwuDfkX1dBb9frWtmoMzzhPxDLbr59qrk4sRRfPL8NFChcWQliVKuW3gJNZXMdrMw6jYIGFt8sNSPSYTMY2o+a71pQUS4AWtHlBeJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736942963; c=relaxed/simple;
	bh=hDJ0y46N4ALKAAdKpkd5Nf1BYgxubEd766XLswmpBNE=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KWDCk0UvtEWX1JVSCl7UzUPnbPCiuBi9VspPCNZ5VkUnu+J06p7w2qUGqREx5yyzmMrUJwBf8AlXPX7DL0ZGobtF1JBBuv4MZrNZPGsITqO5ZI8Nkw6nFo4+b3o2nknhKRU/luMRN2CHbu8E4ha01ju+cz2SK2fLH6bwJE+diCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=jhgOHlLk; arc=fail smtp.client-ip=40.107.215.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="jhgOHlLk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms4IK10xaGMUQBxtOuMCy0FnBagIgoRc+RaVVGNp1nuMmpg1y/vYJ7+vOam/UpANN4iO+kEOKzXvFqI1wygAySuEwRkPkNZHF5RItNspSy7Zy79QNB62+Qk0gtmsitwHZkX1y3c8+ONQfwnNtLBc2luXk6AByZJH676q8F05+2NmGervyx/uxHgJw+ClnyEBriP/NLC0fIGMnr034VoCNe1lpfUX7iHrG66KSSTSTRYYXtAPvB8a2zkfbGt9QSfYBzjXLYZUpjgYSrIxyBSQuzQAEwIf6HEp8NgXyWutg6cGoCU/eGgQNa++ZUm9XmRlpd8sR7blCQSnPt/ZqBFzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/Ofh4zGlpRsoJdspWCOf3dHzqaLgcdfbC0x7ZqCCEs=;
 b=ZAmj6o4frOtIhUqUmxoxwLjD8isxGaRSK1QT9ONrqlss0q/m4YmumQDyfsr9vCWvouK3juWndMSddKWG7gu5nJ9J7v04Sh/ZCZ3UKVc8dmw8nlncORgITr3b1p9BMA3Ve6wp1OPKxfhf4ZdF/zPC2D+/QirWVTQaO4H1tx69xKJBlmw03wYJGDeZA1SeChe+mwBlqXd1BxxLzUDMrEuspC69/ZpecgckWJGVciqEqGRqzK3HIRWxMUwzAGq/qxxx2vveXietoLYCBY4am+M9WrQimwH0o7VJ3gjKrI3Y0SR3YzWt5PfsMExlV4NqvZUW/NCUA6YtRwccwOAAorTXpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/Ofh4zGlpRsoJdspWCOf3dHzqaLgcdfbC0x7ZqCCEs=;
 b=jhgOHlLkVlM189hYIeDnHrWOjSKBQAeDDrNpMRD4BxxFJdwnkhO4XiRLBhHZjjmPryhvfFj7EvIeVJ5kf2w7cIuNJVMwrW9cxGpRj9ZEz3/NMM/bAIf+nwnRWTgl22XmgYoYcPCuS/Hqw4sMI+OdcX+eLSK0sxXLVF0NfRZJvLYLwd6D7QHOKBYV7yjzZXddQNFEmOkYPcwhNt3jXaIuBNjUcZD6KL2Q7euD/aToa0+lsabPUzM8aulm88GwW4C+SKPFt4hYu6i5E8yA32kkWmsydogo3/fo2oyzyej3kI8pd1TQeC375hu4MFJMe7tADbMFfBuJbsVJwqJEoWpbug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com (2603:1096:301:113::15)
 by SEZPR03MB7124.apcprd03.prod.outlook.com (2603:1096:101:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 12:09:15 +0000
Received: from PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d]) by PUZPR03MB7135.apcprd03.prod.outlook.com
 ([fe80::ecac:a387:36d8:144d%3]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 12:09:14 +0000
Message-ID: <b3b60ec4-ae88-4110-9839-449ee7477d9b@amlogic.com>
Date: Wed, 15 Jan 2025 20:09:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
From: Jiebing Chen <jiebing.chen@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
 <20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
 <1jwmey9451.fsf@starbuckisacylon.baylibre.com>
 <e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
 <e69cd38e-898c-4cbc-a327-14148a71c764@amlogic.com>
 <1j8qrd7aor.fsf@starbuckisacylon.baylibre.com>
 <e5055b4d-7a10-4a5e-ad85-d94c1f64eb03@amlogic.com>
 <1jr0545v8w.fsf@starbuckisacylon.baylibre.com>
 <7cf4c53c-7cd2-402c-9e31-f85767ead932@amlogic.com>
 <af4fde1c-281b-4826-a52c-a4e14727eb67@amlogic.com>
In-Reply-To: <af4fde1c-281b-4826-a52c-a4e14727eb67@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:404:f6::25) To PUZPR03MB7135.apcprd03.prod.outlook.com
 (2603:1096:301:113::15)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB7135:EE_|SEZPR03MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e498b03-161d-4e38-441a-08dd355d6db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzNWaFVxU0JoQVZXbm5QNnI4TWlIbmlocVBaeXc5empXRjMzeTZQY1YrLzZM?=
 =?utf-8?B?c0VXV1RTZm1vcDg3aGlDR1k1Nnd6TWlIQmR1WU9YZ25EN1BVaHlTV2FwNXp5?=
 =?utf-8?B?MmxORUg1SVQvc2t5Wndia1ZOQWVPTm5EOXpSSmxLQmVlSENDc1VoR2xHajh5?=
 =?utf-8?B?RExOMDNabXdSNEUxUElaMkc0UmhGUVk5aW96cmUxWEVjZy9tQXVFM2owNFRE?=
 =?utf-8?B?YnlFQ0pWNE1ZMHZiL0ZWUWhhcklCMjhHZGtiNjl5YjhvTUlEL3BQejdvSDRv?=
 =?utf-8?B?bzZRTFZXeVRJOVMvbVIxdTVDTEE4d0xIL1ZwWEVjc05GNEVaaFFHNUVTMnhD?=
 =?utf-8?B?UXpWQ0xVM2IzVHFRTzN2VENUN3BvR2gxMTY1bG1jZ1FQeWVCY2xsUFVGdERi?=
 =?utf-8?B?SVNMTXgvU0hVVno2dHlqeFV2bURHOUZDV0MvWHVHTHFRZ1hGNnBDNUY2ZUNu?=
 =?utf-8?B?WXdqNmRhSU9XcVFubjN6dW9WbnRNc0NlWUpsSzZ2UWJ4MndycHl4NHhjMUlL?=
 =?utf-8?B?TThFYm5teUc4UDFvV0dvMlM1YldrS1oxNmNac2lPWTArOUlPRThkZjUxYzlW?=
 =?utf-8?B?UjJva1Izc0N1WFNjZkVkVnc2S05TeStpM2lDNDdybFFIRE5oRFVkaGNwb1Ra?=
 =?utf-8?B?cktWOU5ydDk1WHhjTXp0WmVsVm95SWZ0d0l5ZXpkbzl0TTFISUs3ejJFMlZt?=
 =?utf-8?B?eGxQcEJ5NGduWGN1dGRNeWxWci9kU3JNQ29QKzFFVzhGRzJwUHplUTYyNmJ0?=
 =?utf-8?B?VERjb2oyd1JlQTBzaEdTMG92Y1JFZ082K1BMdkhVNXdaRGZnRXpHWEJCQWw5?=
 =?utf-8?B?c3JJZXhoRXZnRWJXc2w0WUJUMmFHOG5LRStVTXZEdXlzTlIzOFVkdWVQYzJS?=
 =?utf-8?B?ZEk4ZEVCQVNvZ01JemU3UGx3TUppQjFnc0FlZlFtcXZyN1IxcmIxUDdhL2VL?=
 =?utf-8?B?WjNvY0lyUUE0S3M2MWFGaEJZTGlDZmhMcVV2YnBJRlREMWl1VlVIVk5mR1Bh?=
 =?utf-8?B?clJKbkdNRkdjTXMzNSttTFl6aXl4b2ZENlZ6c00rcDc3b2h4cm1FNUZnM1ZX?=
 =?utf-8?B?ZWpsajZMZkY4cWNQbTl2Z1ZJZHgrcVBObHU5R004V3FwMlA4VmRmYTkzZ1Nw?=
 =?utf-8?B?eDRnS1JNVW9ka3ZQb1JCWmdwVUhOdDBoMDJ0RDRURFd4OEIxMm80cGo0blFn?=
 =?utf-8?B?S29nYjliN25NdWpqZGRmM3Q2dVhWYU93dDRHL20yaWZpQUJoR05NWHNoQ1hC?=
 =?utf-8?B?cTl5c3BJM3cxQnZBb1FleitBSHRpb1I2WUpRTkNpRHI3M2NmSGQ3RERDbDd1?=
 =?utf-8?B?Z0RrellHYm52OGFIUi9nazZrbEVDSWF0MmlkQXdIaDNoM1BRWHVnWjZDMlpN?=
 =?utf-8?B?NHcvT1oxQlp0NkdDRXY0bktZNHRrZWRnSzRKZVAwa0hqVTUxaldVWEFKaUI2?=
 =?utf-8?B?djFPTEJzSGQrNm15b0Jld2JvcDFXaGxDbUNWY1d6YndxTjRVMiswQUhUd2FZ?=
 =?utf-8?B?R0RCU0hBdkxQbHdJZkNwc0h3cWMrajQwWFdlaHFBNXVxalpXbVBJRlZiMjZl?=
 =?utf-8?B?VTNiSUhJQ3VlaGI2ZzBJRlZOQTFtQ3FKVjNVQjlwQWZNRnRINXZUQWlhZ0Iw?=
 =?utf-8?B?U3I1QUVYYU1GbDhkVjlsVjFtWHM5MmM5WGg2UDZOL0tWL2s5dU53YlJOVDBm?=
 =?utf-8?B?VXZMWFlycUk0bXpJQ3lObjlOc1RSVW5TdFZJdXQ5UVhReE15VnZHN2tVMS9l?=
 =?utf-8?B?MXplVHBWbDRCUW41b3Y2YlMreDgra3VlODlqUlJodGJwdHc0WXJlaEF2czZI?=
 =?utf-8?B?TTBVeEpFQk1yVVBWMkRSa1NRMk92czZWUW4yUENGUVNsV1ZkaWthaEdCY0k4?=
 =?utf-8?Q?02CKtMnWGZIvJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB7135.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2NUck5zWkRPTXQxa3BUekwrcjF0eWtWK2dJT2JuRU1lUG02WXdSRkEzdFg2?=
 =?utf-8?B?dmtHZllSOXlnTUpCeWw2OVU3UlY1N3FVMkVueDNyVmpmbFAwekgxYzRqSE1V?=
 =?utf-8?B?NmtvUmhUUHl3RzR0U3NOOGZMbytMblpWWlFjWUZ5VlQ3a3Z5LzdFRzhGVVN6?=
 =?utf-8?B?Mldqdk9YRXVpcHRTNlk2T1lMOXB6c0RoMGlPZy8zTHJhZVJ6cnd1Y2NVRjJQ?=
 =?utf-8?B?bXdwby9KUmlzVWpnMkNCSHhXd1Q1VE44S2M2MDNBcG4rQzR5K3JrR0p4UFpD?=
 =?utf-8?B?MjNEQm9KWjZpVmN3bThLSmtab3VVQ0VlYjBkSVZiN0VkMFptaE9jWjFyKzg4?=
 =?utf-8?B?WUE2MFlKZlEzZGdRcVJJNjhWckhUbG9qK1NPTUltTHQrZThZUE13THM0OG5r?=
 =?utf-8?B?a0doVEdlOVRIOHVISm1XVFVnb0JsWUVPZllIOUJBWkxzV2JwTFZKcnZBdWho?=
 =?utf-8?B?QWpZOWQ2emxpNkR6M0J5dnpnTGdITEFKMTFkdzFHdGRvZVRlMThpOEFSK2p4?=
 =?utf-8?B?U3VvdDlHNFBPU0hEQnFkYXg5RW9xRnVMQ0JWRUI4aEFNblhtaEJHVHdxQXNS?=
 =?utf-8?B?VVY5SHNvWUNDcndoSFpvRlMxeDJvWUI4WnVqZWFPSFJDYlhCZkhwYm04b0FV?=
 =?utf-8?B?RitqejJKNVN4L2hCcmYxR3VDT2pTZnVtWTZvbUdoZHZ5VXVEWlZ0eEswd1pL?=
 =?utf-8?B?Mk53eTNVVlRGWURGeHhUM2FaZURvcC91cVRkdFErSnlicHFhTFF0NTl4MnNy?=
 =?utf-8?B?WCs3N3hBNTloT256OW45YUpZNTFTOEJxb01mZDhKM2ZJYndsRlQ4bmRlOFk0?=
 =?utf-8?B?UGNMbVdZTHhUN1B0eEFkWHMrWngrNHlQazRGUkJtc0wxK0JCMXVyaHBpWEkv?=
 =?utf-8?B?NUw0NTVQb2ZqZlVYa0U0TmlTaC9rUE96dExyTkYvN3FDa2diSkdhdnNZK1N4?=
 =?utf-8?B?M2VPZ1FDbFNEQW9raU03eTA3ek1vVG5veW1JZHJuTlAzRjVBdEVudUpOS3B0?=
 =?utf-8?B?YUlIK3lRYXZRNG1KM2cvdnNkMUliUWFWNTR3OTdmUjlLTGFpZDd2R3V5aGlQ?=
 =?utf-8?B?dVJmTGpWNUJHcVNHQXVORGpXcnp0dGJmQ2lDSFhwSHp2T1ovczRFNTNCTVlJ?=
 =?utf-8?B?UGVteFhYV1R0S0V1SGt1SWZ4ZWd5TU9hR2Ruei8wYjZ0c3h0dkFhdFp5cVRu?=
 =?utf-8?B?YzBDcGZXL0RBc3JBMk9TV3ZSWnIrUGlvQ1VuUWdxeUhoazJQbk02cXBRSTdM?=
 =?utf-8?B?SVk4RUZPNnhOcE8rZk9vc09EWWZXaTlOT3BSZWFRTWp1TjhNRThXcGFjMS9t?=
 =?utf-8?B?VHhEek9hT2lpdTJiL3NkTkRCT2ltbVd5ZXFQc0lXVWFpMFA1QWovZHdud1lN?=
 =?utf-8?B?SlB6dTdKMXoxa0UyNHl2N1RzdkQrZWJYbU9neTMvY05UYVlCKytZM3FSMlJo?=
 =?utf-8?B?cmtETVYzdnpaWUtRMWlpZU5jSytaa3dRWlNvcUhuOTB5UjQ2TXRJd1FsdDBl?=
 =?utf-8?B?OTdKR3dvYkw5ZWs4K0tSSndPM20rMlEwVjRwOG5DN1NVVmQrVlhXcUxnM3Zx?=
 =?utf-8?B?bUVVUCt4WGxnUk9qa2lXV29YVm1IdlJaY1V2cFpuRkYzUlhOcHFaaWRjZEp2?=
 =?utf-8?B?U0VsY1dMalFHSGxTVTdaN0RKUW93TzhUNk95NVRxQWJMOHB2VkpaRkVrMWZG?=
 =?utf-8?B?QnVoVXpzR1poNDVHZ2lwaVpKd3oxVGRSVGd3OUxSQmhzVVFBejNPTjJkQVE1?=
 =?utf-8?B?QXh2bGdJR1FJVWphL0lYM0NJRStaYXZaTmVONHpWMGt4T01kM3BzZzBKcUx5?=
 =?utf-8?B?cVpheE9aTndtTzQwVXlKQk9OKzlsZlczVWxzV21IaVhSc2JiUHRZai84QUJq?=
 =?utf-8?B?Z0RsRFp6MGxNL1NhbXBsZHZKOWc5Y3pNV29ISWdITUFtaUx1NUJERFJpSFlI?=
 =?utf-8?B?OVNNTlZoMm1rSHNtc2J2aC9nTHp4cHFlNHg0c2ZFd1VSNEM0UjBtR1dDQ1Nq?=
 =?utf-8?B?dXRMVHYwdEZCS0pRbXdJMjlmK3FVL0xPM3BFbTZXR1h3bTVaL01sQURNYmhQ?=
 =?utf-8?B?RndrUEJneDJOVVppL2RaQXBsNmE0c1VPWHlIeGRJeS9uZ25Pc3lOVy95S05h?=
 =?utf-8?B?bVRXV3pidlEyRlpub3dEYzhXMEFNSXZJTjV2bzNTUmhBRTNaOHYzbFFBY0dW?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e498b03-161d-4e38-441a-08dd355d6db5
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB7135.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 12:09:14.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWhrHW03Lo2nP4nCYDBkoMtWecYImc0X61S1Q/NCUE0SU13F6UuWwUfo97rstK54oNfPmDVJYtOlC5yGz4Tp4FKnmJPgNzrorm/icFmwGZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7124


在 2025/1/15 19:47, Jiebing Chen 写道:
>
> 在 2025/1/15 18:36, Jiebing Chen 写道:
>>
>> 在 2025/1/15 16:36, Jerome Brunet 写道:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Wed 15 Jan 2025 at 10:56, Jiebing Chen <jiebing.chen@amlogic.com> 
>>> wrote:
>>>
>>>> 在 2025/1/14 22:05, Jerome Brunet 写道:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On Tue 14 Jan 2025 at 19:20, Jiebing Chen 
>>>>> <jiebing.chen@amlogic.com> wrote:
>>>>>
>>>>>>>>> +
>>>>>>>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>>>>>>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>>>>>>>> +MODULE_LICENSE("GPL");
>>>>>>>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>>>>>>>> index
>>>>>>>>> 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e03d953586648 
>>>>>>>>>
>>>>>>>>> 100644
>>>>>>>>> --- a/sound/soc/meson/t9015.c
>>>>>>>>> +++ b/sound/soc/meson/t9015.c
>>>>>>>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai = {
>>>>>>>>>                  .channels_min = 1,
>>>>>>>>>                  .channels_max = 2,
>>>>>>>>>                  .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>>> -             .formats = (SNDRV_PCM_FMTBIT_S8 |
>>>>>>>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>>>>>>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>>>>>>>> - SNDRV_PCM_FMTBIT_S24_LE),
>>>>>>>>> +             .formats = (SNDRV_PCM_FMTBIT_S16_LE |
>>>>>>>>> SNDRV_PCM_FMTBIT_S32_LE),
>>>>>>>> Again, mixed up changes with zero justification.
>>>>>>>>
>>>>>>>> This drops S8 and S16 format support for the existing SoCs 
>>>>>>>> (such as GXL)
>>>>>>>> which is known to work and add S32 support on an HW documented 
>>>>>>>> as 24bits
>>>>>>>> only. Can you explain ?
>>>>>> for g12a, sm1 etc, it is use new audio ip, GXL is old ip,
>>>>> If there are chips difference we did not know about, then you should
>>>>> introduce those difference, without breaking existing support -
>>>>> including for GXL, which is what you did IIUC.
>>>>>
>>>>>> the new ip not support 24 bit,
>>>>> Are sure about that ? that code has been there for a while.
>>>>>
>>>>> If sm1 does not support SNDRV_PCM_FMTBIT_S24_LE, you should a fix 
>>>>> up patch for
>>>>> that, with the proper "Fixes:" tag, how to reproduce the problem and
>>>>> explaining the fix.

At first I thought you said 24bit is s24_3le, becasue of the fddr can't 
get it,

so  spend a lot of time trying to explain it

I think it may be because of this difference that we are not focused on 
the same problem

yes, we support s24_le,  the internal codec also process it 24 bit of 32 
bit,

if we send valid 32bit data, it only process 24bit, discard 8 bit data, 
if this behavior should be prohibit

we will follow this rule

>>>> maybe there are some gap , we support SNDRV_PCM_FMTBIT_S24, not 
>>>> support the
>>>>
>>>> SNDRV_PCM_FMTBIT_S24_3LE,  for SNDRV_PCM_FMTBIT_S24
>>>>
>>>> it is  Signed, 24-bit (32-bit in memory), little endian , the audio 
>>>> dma
>>>> busrt is 64bit
>>> It makes absolutely no sense to discuss memory layout for the codec.
>>>
>>>> it can get the full data. we send the 32 bit data  mclk = 32bit* 
>>>> 48k *4,
>>>> use the clk to send
>>>>
>>>> the  SNDRV_PCM_FMTBIT_S24,   the hadware always send the 32bit data
>>> No it does not. It send 24 bits of data over a 32 bits physical word 
>>> with
>>> 8 bits ignored.
>>
>> The original intention, we play 32bit data from tdmout, it play 
>> error, so we add the s32_le
>>
>> for tdmouta ,it can bind Multiple codec, one codec is the internal 
>> codec,
>>
>> other is external codec, tdmout can send the data to internal codec 
>> and external codec from the output pad
>>
>> for example, tdmout send 4 ch, 2 ch is send the internal codec, 2 ch 
>> send the data pad
>>
>> it aplay error, due to the internal codec fomat parameter limiting 
>> condition
>>
>> There is a contradiction here,  Considering our internal codec can 
>> process this it, drop 8bit, 24bit valid
>>
>> therefore software can set s24_le/s32_le, still  work ok for 
>> hardware, so Multiple ch can support for internal codec and external 
>> codec
>>
>>
> add the s32_le format for the t9015.c,  it can resovle Multiple codec 
> s32_le format case,  although hardware only process 24bit of 32bit, 
> but it can't affect the acodec hardware work, it still work fine
>
> usually we add the s32_le format support, if not allow to do it, think 
> of it as a limitation, we can  remove 32bit test for it
>
>>>
>>>> so, i think we only add the SNDRV_PCM_FMTBIT_S32 base on it
>>> That's wrong if the codec does not actually use the full 32bits ... and
>>> I have clear indication that's what the codec is doing, on GXL at 
>>> least.
>>>
>>>> we think the 24 bit is the SNDRV_PCM_FMTBIT_S24_3LE, it is 24bit in 
>>>> memroy,
>>>>
>>>> due to the dma busrt 64 bit limit, it can't align the sample bit, 
>>>> if it is
>>>> 24 bit
>>> Again, memory layout makes no sense here.
>>>
>>>> so the clock configure can't 24bit clock,
>>> I disagree and this has been tested. If you have a test case showing
>>> otherwise please share it.
>>>
>>>> by the way, We discuss internally for gxl,
>>>>
>>>> it also support the SNDRV_PCM_FMTBIT_S32
>>>>
>>> Does it really ? If it is just to ignore the 8bits LSB, that not a 
>>> support.
>>>
>>>>>> usually support 16/32 bit for new audio ip , for 
>>>>>> SNDRV_PCM_FMTBIT_S24_LE,
>>>>>> it width =24, phy =32
>>>>> Yes physical of SNDRV_PCM_FMTBIT_S24_LE, so most chip supporting 
>>>>> 32 bits
>>>>> width would support this S24_LE, unless there is something odd.
>>>>>
>>>>>> it was  treated as 32 bit to send for tdm, so we can only add the 
>>>>>> S32LE
>>>>>> base on it , right ?
>>>>> You are asking me ? How am I suppose to know ?
>>>>>
>>>>>> but if the gxl not support the 32bit
>>>>> I don't see a problem with a DAC taking input on 32bits physical
>>>>> interface and ignoring some bit on processing.
>>>>>
>>>>> If that's not the case, please send a proper fix change with some 
>>>>> explanation
>>>>>
>>>>>> we need add new snd_soc_dai_driver t9015_dai_s4 ?
>>>>>>
>>>>> If I understood correctly format depends on the chip and needs to
>>>>> adjusted including for sm1.
>>>>>
>>>>>>>>>          },
>>>>>>>>>          .ops = &t9015_dai_ops,
>>>>>>>>>     };
>>>>>>>> -- Jerome
>>>>> -- 
>>>>> Jerome
>>> -- 
>>> Jerome
