Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4CE3E276A
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485569; cv=fail; b=uiJuiDbGU99yEVQggQYfjYodR16yZA/0hJ2IJVFV4UEdgx7ye/ri5FiMOqA9jGiyfgbGuhVE/zSqbKaRcEAsSDsr0uIppj7z0WjoKWyBgL4d4X3kfW7zTreDqHzPf1+H1RqYiMN0TLWSLtunjBTTpA+iygNdNq5ZA1q8vOKZvPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485569; c=relaxed/simple;
	bh=YZgktMpl6nv8Vhfsy4bOmpqkMrqYaJmP4mkxgCWV9PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jk33/LrsEdMN8heCfFzkALS5/dIA1MFjvDn9XjF04KZ4RLtxh6XfnXOl0hWx+XJ5GgpIUa1IH5qA/tc+aq0MGkHNQN7CoQb9MhtwR4Xi2yXQAKdF53hS3odl9uR+hT9H3X337zIwTPWIi+om5d1jEsXs8CX8GeI1SI9XrcI92Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=hhzMeoAR; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="hhzMeoAR"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFHWig851017;
	Tue, 15 Sep 2026 11:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=JDnjl
	aPTZyL81rCvJmFU0d+pMpCz1eGVW31aCvG/qok=; b=hhzMeoAR8nLMszMri6EgM
	3cc0PG1meBZhSTZ1ccSyEcer6U8zwCUy3hnhkJBVYfyir6skXKhmJK8SNa6nuSVl
	ToyIG3efs97HQWpgbCy1xbieaOzsZGwKorUzkaUjM7I6GRltfxYbfRbfYyiLF8S/
	FJsgaX6oTAs4i2JKIS6cCzp/XAR+6jGPqYIHsKpRucmy8bZUXRQIn1mITjoTQCki
	1XKTQMjAHYUEW9GShZgkf81f8QOKSLa3xu3D940YMs7GSBHp3N5oDhDa6XdDKszs
	gGt43xmK96ZQdSZ1nOLVVTcYn9EVk4vmAluKh2Uvn6z5VZUf4DnSEIcHAgBCmqkQ
	A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012043.outbound.protection.outlook.com [40.93.195.43])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gq452sp2n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 11:19:21 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkIAMZmOQSumz2wDEFdBDQvVNod4i5U1MPG1+QN68cn768e2v/MRPQCx24YZ5VLsOEcwHzlNoeT5owbk9pPRAxgyxmzCmkkegqFQ7uicw+OWJ/1oFy8pKzWsLPvBEwAF2REmfjMScFYTtvFlzibY9ayfE/cqwhZffUn+Vb8rzMnwIPt8K4Tgzs1BOfZit7EObDKmlPXwBNsoHOe3dDBpB5lrS3KbkCDuxb5auxwB11+466pTygmeu+qjO6PvZsZ9Yxshjx0XxFXN8a5CucFIKQfUm1nYods2/JbCMqlKNlw/XQ5J2lCQ6VN4tgwl3kMGACTlIoRcuOO5Ai7waOAbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDnjlaPTZyL81rCvJmFU0d+pMpCz1eGVW31aCvG/qok=;
 b=QR9uD8vR7Bhr1cj9vofanpzGbkYFbnL8F5BieY6lcaMew/m0xJSfBUZ++Qdb4p0jPF8acxetHibXhwClb0WHZsfc2mgBiYhSibC97V1cTKIEaeYK1cpZhqHlzDyxVI2ldNQAa9hdOnD34oqp8RkUbr2pm+zOEiSz6QoPFRqQkXwaVBJ74rWcJk5hOgdfXjmyp+pWfLmamNI5DWpLRTwcnKNTrOh/Pwb1lZ1sCrrkrFG4bieoLcLcha2bLrlrNV1CU2UCkf0qqBguRQ2c5ANe3XJrHF1tzalvF7fe5o0/PSE1lXkTuvewsVQmJgxe4r+nDq5V4Ys4c6EkXztZI0nqOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by MW4PR03MB6443.namprd03.prod.outlook.com (2603:10b6:303:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:19:18 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:19:16 +0000
Date: Tue, 15 Sep 2026 17:19:12 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 10/10] ASoC: soc-dai: add snd_soc_dai_get_bclk()
Message-ID: <aqlfShZgud7jIeAJ@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87cxugli2d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cxugli2d.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4P195CA0033.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::20) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|MW4PR03MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 896241eb-edf5-4a0e-493f-08df133cb4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FcoQdZXTZox1dTf09zxKJvwrOL60g3+mwYX9LxQbA7IfM8ZgOtIw/akBi0VPhedLLiO4YVx/L/Qc8cytkGWy3gEjmEUb70NdnDdBckrVVztIYGQsF+fSFK+1Pv7Tr6KgXJ0rkAP+QAHkCIgN2sNaPCzgn+inxS+//lZb8o4TiOuO9Pr8/5IKsC78DRTFFgkYWoJrAkv8vJ04DtdaBoywAMk2lFIWyde+H2L/L1GAaV7VfsisTJcA1GHxTrGNqLbP0DngiI15dt9bSExTk3axxb714/KlX9Tx3e0gITNkgb6x25uZ5C0v26RQGb/RRh2X+qVnNjJZCcUwHkdvBKpH90uxdRf7HJonH4RaLluaOuANRTRGM8hMfNNFNcZqXm+/BDH1FcuSr2O4YlRoRBsAIV7j31JQ2LbC5Nyl8VJatTza22eBZA7Oxnh1JM1eqEdmOao+p4RnUprAtXSKo0fH3ZzD7AckcjiarV50fLsEsFYfS/eUUYl4UVgd4WhT6yzrcoNF9KxHEXYf6/gFrs0kpTaclb4SHZ5cul3T77VVjt3WcUUIL6q2mIhHA7hokdV4SH7BHv2jkNf+08m3/YcQoN25lpzZfhElGmNo5NM9YLWciyZA3/Wu5tcQaR+G0rBR/Cu8DYK4fSssCOK688tmM12ONZ1xZ6g90H8r7/AwAZ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVFHUnhyU2xZTk1PS3RXb01vRC82eU5XUkdPSEdXWjFjaE1KUmRvMVUvTTI1?=
 =?utf-8?B?N0xma3I0YjhuVk1NZ2RlRnBydUFzSWE3TGhNbVZ6ZEJZZ25VaUV3NmMvRlV0?=
 =?utf-8?B?RkwvS1AxL282a3hBNWdtT1QzSjcvVHk3WTkxM0VuMjk5TFo1MG9lT2hWcm15?=
 =?utf-8?B?aloxQXFjVHk0Y3RMOTJ2MUZIUWNLcEpmZDB4WjZ0dEJZZzNrQ0pFMFcxTU5r?=
 =?utf-8?B?V1k0ZjJMRkUxUldrdkt3eXFnMGJFRHRkYlhWM3FLTlliMjVwYW43dlhMMXhh?=
 =?utf-8?B?a09SakJpMUoxZjlMbm4zN2YyeVJSYy9QTmF6N0JLcUx1K2lHUXFrZ1ppWWFy?=
 =?utf-8?B?STJhUFlrUGM4MTJ4V0lzL1pmeGdPMDlVcEVvcWoxK1QvN29Ha25zZTI1K0xF?=
 =?utf-8?B?MGhwa0VJL3FFNXU4WjkySUk4U3pNekJCQ1VBcjBiQyt6WFVnajFFVGV4T1Nn?=
 =?utf-8?B?ZFlrWXRvQUF1SkpLN3g5enVzTXQxUWhpSmRJVVdKaE1ZQmFrUzlvV0l1Y3Br?=
 =?utf-8?B?TDUrWEpmZXdGSjYxeFV2b2RpTTI1V2I4RVhoZWw1RERMZlZmMTEyRWJBUnBG?=
 =?utf-8?B?VXUybnF0UTREeWwyOGxoZEF5S2oxekVyck8wU2tuK2tFU2FtTXhwY0lSOSs3?=
 =?utf-8?B?MDNPTEV3eS84b2NmSEJLa0NxbmE2bmlqbUFXV0FjQ0ExbXAwRmMyM1ZmNWFU?=
 =?utf-8?B?QWRiNU1zZ0J1dGQzOFdOVXZJTU0yWmtXWTE1d0JrOUkvR053K29YMTRpcmN4?=
 =?utf-8?B?Tmo0Z214NXc2b1RpNWRHaUdJM0ZHUC9yeVVMeEE1WEdYeDZtUkx1dDJhL1VY?=
 =?utf-8?B?dDNKY2NQbktMam9qNE85ZjZEUTJjUmc5NmZ6TGNGVGVKVzlLYzBCSnpmQVJG?=
 =?utf-8?B?UGxWclh6cVNWUm9KVFpJemE3ZkQ1RlpwQUdXTEVFRmk2MTFmMi9RZ3ZCTTVn?=
 =?utf-8?B?dXlZZ3RBeVg5cHJaSWlIRis5QjZHM0MyYkJVRW9jTlVGaXp2NjROWXdZRE9u?=
 =?utf-8?B?S0dURmt4akR0SjRLWk16SEx1cWlKMjdtdjE2aElZTjlNS1JtTUVIYjA4R1RD?=
 =?utf-8?B?ajdoSUF4QzZjWkMzWkpwbzdrQTNnNFppU25sak1mWnN6UHJ4KzA1TEtKRlVH?=
 =?utf-8?B?MU1aMlZTb25OZExCVit1cDAwc0RaeGdia2xJUElvRC9DRk5JLzNSTnd6K2hv?=
 =?utf-8?B?S1MxcW9ud1FVVGZqc2tPSXFPTGRwc1RqMUdUbXJXTm9sMEdyUTNvb2pLV1Bw?=
 =?utf-8?B?TURYb3cwUFY4c2lKWnNDdTk3RXp2MVBheVBnMGNHc1ppTFVGcFVEMTlQY1Yx?=
 =?utf-8?B?UThKL1FXR0FuUkQrbkRSQ0orM09CUXFwNTV5L0NHRDBiQ2YxTFUvZytaMnBz?=
 =?utf-8?B?N1g3dnpqYkY2ZUlBVnUzc1ppcFVXcjJ2bElZMjZDd2gxV2JGZFBtUmlvZndI?=
 =?utf-8?B?cWV2L0ZWalVZMG5tUC94OFF5bWlvU1lCTkxvb3NUbVZQSVNKVVB4RHFZUURC?=
 =?utf-8?B?WkRSM1VKMU1pWGc5ZzNNdk16YTJwN3kzMXRpbnZIYWFjZWNZMDdWeHk2Y0tz?=
 =?utf-8?B?R1Q3TUJsZ21mNzFGbmZjaGhOUFdOZk5SaTc5eWRianZwcXoxNDhNV2Q3OWs3?=
 =?utf-8?B?YWlFb3hKa0lzajBha0ZLMEdmTGdnUVRmVS96M0ZJaTdOc1NYS2VTRURtTjZY?=
 =?utf-8?B?M0wzQ3c4cTlRdmNuTUFFdThvNDRnOUw3bVp1dk1nRUxNY1UxUGtxNVVObXQ0?=
 =?utf-8?B?M05nMjByc1dRYWd5alUxa0hkMlZkZFZ5ZEcrcnRBc05QNS9QYkIrblV5OUNx?=
 =?utf-8?B?YXRjamYzTU8vMEJMeWNGUlhZSld4YzRoRE00RVhvODRQcldrSGRNUHVzZUsy?=
 =?utf-8?B?cDdxd0MxOHNvQWx6SU5ncDdWZ1ozTlorODJOWjlvQ1dMaE5hd1RIUkRoYUJ6?=
 =?utf-8?B?eW1odUIvc3pTb3FGVFEvYmMyaGlWUnczbzJ6QkJqdjhQcnA2TjBacGVYaU92?=
 =?utf-8?B?NGFCYVhqYmVzZmdXTnh4SWl1cDV0Yi9jaXdOT2RIRTgycXZDRVJIaXN4M2xn?=
 =?utf-8?B?a1NTdVpxUEN2WUdMV29CWHFrdHAzVFhKdU5udVBrWTlKc09FLzhhMUlVaEpr?=
 =?utf-8?B?Kzk2Vi9uZ2RZVnJwQ2hNRW5Fd3FZRlF6aW41aHJYRXhlb2pFbElISnVSUzlZ?=
 =?utf-8?B?cDB1bUhLZHZEYkZ2YmJsaEp2Qi9PcWtvOVc1dHp1TGNYRFBqMS9nNEM1MERn?=
 =?utf-8?B?Wmg5SFlvK2Q0dFJhR2VOTW8rUUFuOGlpOUI0QTNLY1BPZkxTQk03WERrR0x1?=
 =?utf-8?B?cmxvY0Z5ZHI1V1BjdlU5Lzc4QmQ2OUhWUUE5QWpZMC9HbUs5S2N5Zz09?=
X-Exchange-RoutingPolicyChecked:
	VcfSR3zGdJN9kiK9AvbOcvp+GuOuMClDAmAFm7cOiDPrsQplXk2ckPzpQoEyGKNIsGwz6gqSwlHmCkrtkqhSavJM2gd2/sjSsVaRInGOsasx39+RIs6jWqJZjebi3bf3KIwoByNN9kFP3nBRu622h6Syz/w3CY0UdRQ9532bTEIMFCximFnJNDfCI4a9HTljtXPoh8ACFntEWNfqteya8gOV8etE7vxHeJBTzZdQWwMkrv3Qrda7u/uL85J7vTZDsAfc0vF+PwE5R9eoiLACxWQtY0vH2Rqe4Cxy+AOIc6XFsdmjIaakTTT6pGj6JZTHagvxZmTmUkgQjlXXLdljtg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896241eb-edf5-4a0e-493f-08df133cb4a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:19:16.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nAhYXN4wTmh7vlU5R8ubFBZXrwdduvSlsGGoo2tnBBJvRtWnVaNDjS/VYvQdQzSmUhXLZEU3DzKKXwzItB6z5YNBNhTr0yY937t3tMe1c8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6443
X-Proofpoint-GUID: IegDbdyL5tM2WfwETsUezyAlTXypLZQY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIyMyBTYWx0ZWRfX2ODpI80dWoqY
 CmsHzZYGhaidAM1v0+rO2abPfSEyPLK4nMwtehMDxoctas7z4E9/i0MQsbFcMrrfdP0XMED9d1/
 f5fmk0FxFXLhk11x15DuK4SB44lzjxIS98/qEG+5dCoTTsCvKfW+
X-Proofpoint-ORIG-GUID: IegDbdyL5tM2WfwETsUezyAlTXypLZQY
X-Authority-Analysis: v=2.4 cv=ZrB4uN7G c=1 sm=1 tr=0 ts=6aa961f9 cx=c_pps
 a=EsAf7Oic3mfDXMJ3krB2BA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=gAnH3GRIAAAA:8 a=yC-0_ovQAAAA:8 a=MRFtkMzNmj0GfpWu9FIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIyMyBTYWx0ZWRfXzl0uj15mijjS
 1l3ZPST3VKcbZv4N+588Z7rNUL3G6Ibam9MRqew09CVgInwkMGQTPLwhEuYQ9Te2T/3XJOz1pm0
 JT+FkJ8yzzao94pzRNvIkGC3sDLB2iZpkU0shcg5J9e8TTRnHFwT1ENfs+mlJwBQRNhtXLcxPEI
 pZcCbmpMPnV9FYGG1KqM2YGjC2cUkjKTbpZ9uDaoq3XrZb6nKnasv29UYBIPxc8pihP9OtN4vxb
 4vzydX0DT617U/aUJSiNYpPEXTd2vg+LrHkSKlBiprDoqI3nTE9BZLypyGSkP11hC/hnOcIevEr
 +OlhbccclU1Snpm4lyftoLqVg1N01xZwU/mom+gpbQCDMOiQMmhwxff+mREmyvgvtwupMzCWfEm
 AxEDIHOabDqlCZfYpVRVVDY9ppS4jswQAZODCgCRDtAZpiVDYJHXN1PUok+Cou0UbqBLvAUe9tR
 DmpmKgnloRCzX5SAVIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150223

On Mon, Sep 14, 2026 at 01:47:55AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. DAI priv has been mainly referred from SoundWire driver.

^ Stale copy-paste from previous patch?

I guess you will fix it in v2, so you can add:

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> Let's add snd_soc_dai_get_bclk() for internal use.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-dai.c      |  8 ++++++++
>  sound/soc/soc-internal.h |  1 +
>  sound/soc/soc-pcm.c      | 23 +++++++++++++++++------
>  3 files changed, 26 insertions(+), 6 deletions(-)
[...]
