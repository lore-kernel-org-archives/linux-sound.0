Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93A3BE645
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479851; cv=fail; b=Tsp5M8OILc7aRYxpOWCU/5WGRvH1zFpm7vD8i9eFYdZN41Gmt5MZAnJ5na4hEh6mcnr/gYztmV9NQbqawFOHMvKEroWFmpDqjLA3LOScYnPacoXeAj6bb04x/3UIbdBs1Ew8Lu6f0+U0gPF1G6BsWtDLJsTzOpI9ewub5em41NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479851; c=relaxed/simple;
	bh=iwq2i0TR+OiST3VSj6G0Y9WcuONc3WWeShFMQTUiL1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s6uYKaIsNU7gJogffh3SXGaTy86Sg1fEhxFmzKqBrL89ZTWTKJBiTWqj5ac0yAd6MaaD/7fAYAbe58ntmKugxQtDlf9AZO5MkahK7c8GhcLs5oV0oj2MDS9HnV4u+bbp1fWu4QaxvQ/ASAi6H71NKsdVyJJmDMGf6lOmD2jnHSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZPXB/p7K; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZPXB/p7K"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxPSm1690562;
	Tue, 15 Sep 2026 09:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=7xVHK
	q9TrCa5YI5GMWxdWZndV3lqdvjdxVx7RiHQ82E=; b=ZPXB/p7KKoWY7fGBo1p4s
	ArbTvdd+LmyaaBnywgYXp6l3GWr00ZiSMSjaZ0vR3S/Y95t2chnel2rSnyxaD9Nv
	dgObTENQA3MdvUriYU/vlb0nB6m1/xUzGMGz3R+MM6Hn83iFBy1vYX20Bo1cZjA1
	x98Uc3IG+rM9IY5V0OWgwlZmq6KWoeuhKot08tpyd6fYxd1BU2oAvjSL7UWi8dc8
	COEZvgW5iPNn459r53W2WSWo1oP7FTWpbVdDH+iWGzPbJAdDDP6LBN4QY5zhXiCI
	hFBS2gW/yhvEYidswy/R+9lgCEcftfIivzCeJnPBpPa9MivCGx+oqRggoQjXuod7
	A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gq5rjged2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:44:02 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I485ov5811wGMtx6Ty0S3S2Q2cL3ObjVC/6g1E5SRRzcsbXjfqLeZdCitMgw6+1ctn14D15dTXIztTt7JBRYgttyVnKFx9xJQHCKelcaleq7aTlcfcaP5PlueJPcZ9KD/WBZcNVUD7prAY/DgpFWKba2ICh4Imc3dmG7/X1xBM0tX5HWA96yoBwnj6FsbkuGLWHvDPHPmKoxBO8bkHH2n1jGiwiykclgK5/YmZN0+yZ9pw4BMgnmp6H6FGsvdKuxztBXGNffZSsMqVswjkCPbjEjpdK/uOuVDwkS2Ob2Mcy/dPECg7fWEleaPowsSWDx876XOYFn5kwBRXqd1zi1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xVHKq9TrCa5YI5GMWxdWZndV3lqdvjdxVx7RiHQ82E=;
 b=d66fZNZhbPaxyl+d+VOS0z3ySgF1BAh3fzmH6p1AlnJBvCo+UkzN8YTMM6QHAYTeU5+VRcDtMGrG8cLENBbnjbS576bXPn4UGnU9wif8t6opBfwhvvgMktZiEGzZWXzKpgpfcvj+p7oAektfvVLoC8B00vRQAlfOly07yxiHUdR/JY2VPGK+dmm1aUKO8f9O9oY6pZF8V6G5OXEc2LuUKK0zz6VCN3wqHSx9dxFJu0TITte4mijsiYKspiPTfBb7IVF6kIxnWcV7D1K4Luo8MDAFIsJiQZs/QR3s5ka/JfxW6eKmu05DLfy3rO5AaoJk/aOxpeD4nzjyRmXHkSBIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by SN7PR03MB7230.namprd03.prod.outlook.com (2603:10b6:806:2e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 13:43:57 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 13:43:57 +0000
Date: Tue, 15 Sep 2026 15:43:53 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/10] ASoC: soc-dai: add snd_soc_dai_id()
Message-ID: <aqlLeP4Q0MX2hLgb@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87pkyglia1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pkyglia1.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4P251CA0001.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::19) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|SN7PR03MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 126bd034-214c-4486-df40-08df132f6375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qVyrLNbJ5SnWtIgcFLNGqabRYfQ7jJYp8Di59A9TOgNGrEV9ozzLmrbt3MLjv5xfR70HL1K89x7gLoeTF1O/MlYdKObxTRE3L/ZDi97hiAsz1//xH9ErA2bpg0E53kztEKNSOMecFNMsFzigoQanY8A9+OUrOGXhjz4w2tdIfF3jMbwpVxoHTTdMZNap5iqEC1cc9B93wpBZYfHwGmqfaMzl9rOLzzTIpnXQMLuxqCLT+EeO+HWLbSoVcvqDxuO1+HMlTGhxWfnxpgx6bUFxNwEG4WB7pgE3Op4nt7GoVcLNWfYTEkgJxw3usBJq5L18twZEevgSLDxpLLCJQ45XNseb9ELPBzs+kqUNtKP2c63m8PlDbvmT6m2qm2f9HkV3hYD/atbQYsQSohW+zZnBJHqLm1Dpgbg7HVcjxbHsOOQodHc26holtuTBMMzUuIPJu1f77CzmTruwYNuKJbI2CAKeZFaKQDwH/g6FFBExrclQh/t1fTFmiIX7596XAoC5cF2WEAEFFnUiQm/JXYcgKzf1c93T24MkFlVfe/ks0YSAZQB4Gk2te4t0FFfyF4l7f1ZRxtcSQaA+Oyd+1/j1E0YbY7ECdJ85YpH+x1JHfn2XnUmBHKgLRz+mDkKuqm0g+ROn9Tcsq8k/UudBA+V+YQItqY6TLCgcOV0UpadYLTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm13QW9YMHlvbDVhdTBaUHhybXJQQloyUXJuNlNYR2F4VUx2dWlPRXhvMFEy?=
 =?utf-8?B?Nm1pTENxRTBRbG1Ha1hGdEE5WXZ0aU9wVVhuVDBWZ05XWW5jODU1K3BZbjRE?=
 =?utf-8?B?UjNuVTV0TEZ1TGFYTkxEYXMyYTNITjZDVkRwUE1lY0tSZ2dMVmIyTHJHN1R3?=
 =?utf-8?B?RVZSaE0zWXlONUNCTm0vVDU3VEF3MGMrRkRINVlNdE9iMDkzZzJpMVR1WUlv?=
 =?utf-8?B?WjFSOU9oZGJZSThZVmZ0RFVMMUVFOTRoUC9yVHRQQ0E1aXhqN1FJQ1VTS0t3?=
 =?utf-8?B?czc3cy9MbVZCRkhJaGcva2cvaFBwbllkYU9kbHNFTVByTDNkOFEvVW9HakVi?=
 =?utf-8?B?WHVVa2FqbzU4dGFIRjErZjRNWDQ3cC9HbzJLY2NScFVJeU4vOFdXU2VBU0R4?=
 =?utf-8?B?aGlMZHErUkRUd2p3Nk9WWTk0c2lYWFA5UWhVVkpvNHNqZS9LRkFXM0xNcGhR?=
 =?utf-8?B?ZlBhbFdpZ3hvSE00T0dIY0gxMUtQKy9Kb25LZUNmNTFzdEIxVjlib3ptMzh5?=
 =?utf-8?B?QjVGZm95TzZGYjBVS1NKYld5ZXdUM3N1ZGVUVHlCb21XTEdRc1NML2ZKVm1E?=
 =?utf-8?B?TG11VkVrVGR3VTJTNU5XVmVBcGx6VnF5RzN0VmtHdDFhNERXY0xGWVl5ZGha?=
 =?utf-8?B?bXN5b05KOUFXRUNHQzkzWDB6QU95aTFSSXBhNE92Z2hZMmgyMWRVZTNQdGUv?=
 =?utf-8?B?dGNJVWk4TGZkVDF4VjA1RUQ2ZWk4VXhRT2VSRnU2dXh3Zk41eUYzZ0dwUnFO?=
 =?utf-8?B?ODYxaXZlSlNGa0pvbHQ3dlk2ZEcwVkV2NzExQ0o4MkZEYnRmdGh3VkI0OVlu?=
 =?utf-8?B?MTl3M2VhOFpweXBPOW5McGc4d0xsenlVYVJDcjFGc1pTdGZoZmdEZEc3NWhQ?=
 =?utf-8?B?RHhYcFNjTGExNVJUUUVoNExLRVJkMzFqREtGRGdXRXZBT240UU04eDdyVGta?=
 =?utf-8?B?U1hRT2ppSW1JbGxGdFV5QmJ6SThKUEVMN2FyeUI3N09FZW4rNGpkRDU1RWtJ?=
 =?utf-8?B?S2JUSFVUZzJzT1dxT3Bmc29nM2MvY3VSanFsSXhpNis1bFNmWVVPK2hPRXBk?=
 =?utf-8?B?NUxhVDNoOTR1RmdrbUROQ05jTG9aS1ZkMjFZMEFmZ0k0WmFxS1Q2Um1CRmlG?=
 =?utf-8?B?Vm9PYjFCaUpRUWRzSWNhWVZ1OW56MHlmOHJQZFdwcE1mMS9MSVlReWhUbk80?=
 =?utf-8?B?Zm1HZnRXYjVyYmRzQ3RmbUhZcnc2c3Q0Q3hUb2RIZXMySVdMTHljdVhTYVBW?=
 =?utf-8?B?OGlkZ09DUEJnZHlEUEVaR0pmMmoxZjJrMjhLbENNZU1lVFJvL2dGZWM0V2Fw?=
 =?utf-8?B?bFU2aFV3WERVdUZVMkg3YTFUVXFrVE02QzZyb0IvR1RWaW8vMGtuQU04VzNF?=
 =?utf-8?B?OWgwOXl3UVpEWVB1NE9CcW8wLzJvQ0wxMEZHL2JRZ25xVC96cmNMRFdrMkpo?=
 =?utf-8?B?SmliT3FlZ2xKVHRmdHVOVE9oY2xCZkZFb0lWS1U0c0kvRUllVHJJY1NaaHAv?=
 =?utf-8?B?TUo2NldpRVMyRTF4bmxOSlg5bFoyY2hwcnczdmorVVdyRzhHOG0rbVZEMkVn?=
 =?utf-8?B?ZlNrMjlhK1k2RXpWaG42Q3RxRmR1M1BZalp2WEVFbU56dnBnMENxMm8yay9C?=
 =?utf-8?B?dzBldkRvdVNPdHlmSkNqaTZsY0p3Vng4dC9MRXB4ZUZ1d3BhZHVIV3FvbUFq?=
 =?utf-8?B?alRQb2VaUlZxVG9EV0M3dEJuT29aWXpQb2RIdUk3ZUhQTnlaZzJFYk1ORDVT?=
 =?utf-8?B?NEtodEt1RW5Ya0xxZXViVzBtdUtnK0ZDNTNoVDhlQzBhZlV1RkZRN2MzWTNF?=
 =?utf-8?B?a2xIQVFuUVJQbjd5bDN5aWFRMGlCREVFTkhkby9qdVNYZ3FGV3NGOHladHBq?=
 =?utf-8?B?UzRiYTdtdXhaYzZ0RDNVQ1lEaWpJUlZBQzA2QnQ4bUtab21NNEUvelJZdnMw?=
 =?utf-8?B?OThnV1VkaDRRaUMyTUt4dXV0YkZVa3kxQVU0Vkk2SjhLL2c3b21TTmFkS1hk?=
 =?utf-8?B?YllMajFFTy9Vdy9MaExzV2JEUzBJOXptTFRkL3VBNy9zWWNLdy85WG1uV3Mr?=
 =?utf-8?B?Z25sTS9xNWhpV3dncU44RkhkbC8zWE1JK1ZnM3hmY3MxQys0TVRlOS92dnBM?=
 =?utf-8?B?K1o1cWsvRHgzSEhaTjNhRElXdER0dlRWWHRaU0Rid3FaV1QrbDNDaEtBZ3Mx?=
 =?utf-8?B?Yll2cVdJaENkR3ozYURMQVN6V2xsK0hHbmtsbUVjeStXQnBGaDFNMW84cEdI?=
 =?utf-8?B?MTlnZi9IT2dmbmJxalRIMEU0NTR0aWFPNU9uTGQvZ1hjd05ZYVhQUWluSWxH?=
 =?utf-8?B?dXJvVTBXL0FWWERjNlBMZEhVd3haeFdBZllwb2s3NHh2R2tRa05BQT09?=
X-Exchange-RoutingPolicyChecked:
	5Zny23L7IvgBR5qc/h7mbR2LnIHYaaYZ6bQgwHfE6zSgssEpqbX7wiGW/kixWo4h4bQX7CU7UNqM2xWNkEOrcxZML5ByLBb4WnsZ3H/uy7v/WXmui9fxtAyEtP8wnvgv1liwTIgVdoKr77PdgXcK3z7ezAhss9eMyLtPz1Em98x/WdTxriX4zSeDhjagvx9yHMhmxOkxenLaeKpkvdlqLeSrhmmRV6aq90A3dAkGG2x3Gsuj1ynCZmLQc+Y85+uL5CC4IcUEG2q1HxUB/52PAVE/tDTi4DiGqIxbN0sK3sElk0iJQ5zwP0OWxVOIKSko1stTOiCwWU8hEFCcP8j7hw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126bd034-214c-4486-df40-08df132f6375
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:43:57.2162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDeWoi9SsXJv62ZLI6EZs+Y2mhqT0eYgwO+kDcKAo/ub6tuHceqMG6Xd1nSNPHXPlCFJSae6zE1foUvZvKCIjpavY79smzRmCw3FE4M+GK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7230
X-Proofpoint-GUID: OGDOb_k9LUxt1VivtCXB6G4ZhYk_A2tO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfXxkKq5sNkM+Ud
 PnFT5NxBdCgNHzlc0ZR6+vJmK5kptIy6Rz+7IHXTsFW5MuTOkYAw3jEYULar+PRCF/F4Ec/iXuO
 /xeyAP8N/+jFasONXQsr0dGES8O/PjnpSh9hcV920DVqp0mbwMdz
X-Proofpoint-ORIG-GUID: OGDOb_k9LUxt1VivtCXB6G4ZhYk_A2tO
X-Authority-Analysis: v=2.4 cv=Q4ZHcI2a c=1 sm=1 tr=0 ts=6aa94ba2 cx=c_pps
 a=WaebrhBVOVZn7IYqRlctMQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=WqTBSSSdvf6OmJ_7tFEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfX16NLzw/dUMX5
 Ngk/tmXkPtOT3++A9VxWq0NIUkqAzNXUY2NhpOg1HvcDkzVimeRKBujMHFt3XzOg/HXmKSBjxTf
 XYZBug+Lm9U1XZQmpGtb9LV2x0hMz9TSPBn4EsOuF4rvJP2WwvLIGV9W2d55bQTJnQyFObTqoB0
 JwMzbZ40gANWXm9hrcrGVqMvkwZ6ypt3SeEsaH9jvg2fbxWaUdt/OxOsBK/NoJ7W0UVtVMzZQ7K
 jXPJ7i0Rw9SGEyeP2TLmVKh2/M3TpUM9aJGArsBf1nyk43HhoSXPVUxt22efXRFe2bpWdD0lh8A
 gskl8UYmG3vhdVHRTWHOdiMAoalHKEblJr29X7ZLb8Vw6H7C2bc1lvs5NVSTlrYdlwoLFBxUsWo
 kI7F0a7vunQzi5XnmKR6eLZho7fcV+CI8KwytqHvSs4ZiZ7OL+B/HV8ChwBsSvvQKq4fwIsLew2
 xx5LIqrZxF4hPsaCpEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150199

On Mon, Sep 14, 2026 at 01:43:18AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. add snd_soc_dai_id() to get ID from DAI.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
