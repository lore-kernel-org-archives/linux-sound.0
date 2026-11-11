Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412124;
	b=HFETkR0w+xDcs/laaYXE/DztDJM4BW/rd/cx0vmylX/PRNcaylHiWbxJ8FYhVQxL903C
	 2JTYKdZ5N2ojd8EQOHyD8eG3Ifbc0G/jJOdeR/bTafVbq/5qMIVdUHq8v2L+MN9Iascj1
	 LvkfSxNUX+7hYO9wqhQZfyQjEAVZNR4XgxH5hcobJdonK2ExVbULKN12Zc/GZXV9Lg4mF
	 7OOo7q8XMJmYuOCOyGtrVjhzKD0P5fBacQ+Rj+SSdzk/HQxY70UQdlMBK6fbondg1LvBW
	 cr9OhjpSEnVRb6S7m5AvGLpPo/ezWxTy96QXuVyQWhUEuQ2bpBCi48eqVs+OaFPN9VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412124;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oIOn9ZgIitq8IB+N4dvHxQI2qHOL1PucgxaeCui0jMQ=;
	b=S5BRqxrx4Qy5erI1QKhlNxP0+QdUStw6H0W2KgBXxm8IEq/tBiZo7RTllQ/AxEikjDmT
	 KGIWtfNbXlUsuKzBm8Un/osaqYurY/NStlvNoEpGyBkdahVSTQonQKHxSAhz6jW3YSvas
	 uiO11vMkRURixnD5uCUseO+1amxI7WaDabe52Ug0v+aXofCra1ZT01RPcHapWvUJCUmUn
	 d61axDGdXZ6eERNeXqxrFHwEscO/Gmf1S+f/+DmIMmLBD/8dy3LHWqWFQq4ME4bFS9T8b
	 50jQCUHkpD+slsp6ZAvg09i58xJ5qjiwc+TkX6XIKaPUSgTKtuLwRq3TuuBUVZc+5oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=KsDpcSqB;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=hieEUJnw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.139.77
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5186606A33A
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 15:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5186606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=KsDpcSqB;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=hieEUJnw
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1iwu409507;
	Wed, 11 Nov 2026 10:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=oIOn9ZgIitq8IB+N4dvHxQI2qHOL1PucgxaeCui0jMQ=; b=KsDpcSq
	B4wFgD49kkWjxvaQDzKx2J5AGIJVABoTa4vNjzgUzA0uzZN3lm6r1JM3J1ppn6ya
	3whvY9PhaAmaOFmoIiTjCM+ApZYClm5mPBQlzQN5XuV9FoDrIa8V71NZRDEEl/wv
	qtff+JgfW7TsnuTX3fHJGWrmvxnTJQpD+D+4I1gUpY+pmybgfCjGm93vN4bVkvKt
	UZS+j25HTjDHf+Ye856gXaEMaWwR7OoPgQl4qymxaty8hVOAab0h7UULVRQL3I+5
	q0mEy9t1dy/4YYUKCb81n8zjscjZ+oQoOpb5nGo6IFLnmod1cHqnRFwHv4K0SqrF
	S7viyqX1dIfg8VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=oIOn9
	ZgIitq8IB+N4dvHxQI2qHOL1PucgxaeCui0jMQ=; b=hieEUJnwTvpNHZK4aVpLv
	eoKKyfVSI1S8n3XBdJResEyYuHwxJXwuEm51N20LXBalbwNvkdEOapFvK9/ICOWf
	NDRUtJR9MKB7HQby116QaK6mh8kh0VJuKbAimHNsIj9fPcM1LZjKOgQYU+ABeKK6
	jeRC78rFtpq9x6sF4ZJD4DTENLbcDGxEJphetFhSU4E54c6YYd67n4VUXt6vbiP2
	7DQEwYjzEAtuHkc594AEyQiDmO9JTI8yaK3o2W/UkZLl6ioruxz48W9kfdLRg0WW
	ODqaDCONxyqcUZbXL27Jpqvkn/1XoMP08qoGGieObnltNku1wOyGHH2GmECEwhBv
	w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hvqu917q9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 10:48:37 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+tqKh8ltEYYI5H7Gci2ewHCK9S9zLS6Zi4eLuL74tw1N9DvRR95ocmzPWwo3cJ5WPrvu/zG0UiNOxhTY1rNwcX7NPdRl7E16bn5NtNMkagMjosxW2LHxD9/YL7Jb3GoNV7ggJhoM+FsliHjLgmNbuMyLPh4krCkmnsXuaE8uvUAt27jsBAaElQ9lA2cqsD/HwlbR4pIfRti3yXJJUzItYemExD4sDewdMfCbMZO305RWKkzriMjRxLCG6ZUv2HUHZwgBpCW41if0LwBDQdKFxLWWDT8tF5qmUXlFuoAF20W5LgNhwYLts/GkbWJZpjZUirg0yDiuIZZ+MnXAiTgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIOn9ZgIitq8IB+N4dvHxQI2qHOL1PucgxaeCui0jMQ=;
 b=oY4uRgzIYKMZ+nSrRs3Fzy2HN7H066jg+dqAPP6vAWWXRaT3kYXo6hEdBqE9GugmbaB9eVF5U2/0YN9oZ3D/NrS45x2j4VhzZ6oAWCTriMYSAdaY8Tv/DRNwh0wnkidHOaMRyS4aYx113OqSToHRr9JP2XLJ+zVj1SVDFDok796nsmdgUP+4m39bQg1q3lu/xjdFFViDBxfJIZL78Yt+ZQZ7rEySiODd8zzfgClIoOQKiZuqDCZgy6KvWxG26GcKvCGD9/Eu9Q3X0TOFyKa3Li8fMY13PQpDOuUpF0rzlSYOzYXoxpjPgfdTZYnU4pU/nAszX+jdTB4RmZ35NRaK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from BN9PR03MB5977.namprd03.prod.outlook.com (2603:10b6:408:132::11)
 by LV3PR03MB7480.namprd03.prod.outlook.com (2603:10b6:408:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 15:48:36 +0000
Received: from BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3]) by BN9PR03MB5977.namprd03.prod.outlook.com
 ([fe80::9687:b756:5de3:28f3%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 15:48:36 +0000
Date: Wed, 11 Nov 2026 16:48:33 +0100
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 20/20] ASoC: soc-component: add
 snd_soc_component_device_link_{add/del}()
Message-ID: <avSOS9R3lo_YKUKc@analog.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87fqx9mf64.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fqx9mf64.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: CPBP307CA0007.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::10) To BN9PR03MB5977.namprd03.prod.outlook.com
 (2603:10b6:408:132::11)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:EE_|LV3PR03MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4ef97f-3008-4afe-d822-08df400b3f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|261102123227099003|56012099006|11063799006|261021121427099003|261009223027099003|261021123027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	o9YiS5Jlnrz4ryfZZBUfrpMwxlLCXOZR6MMZGLJrdbLaRcxTkMakJMTa0Ksr8HKEhB9fDo/RX0PoFHjS/s4Tx/8QhkuUwljxNaM30agn5sgv89R4d8CzIKCnOnKM4VlsuwJ2SsaCVvZqCrIFDqReryZkJNHq/Ejw8TkIzP4JmI72vG9QgAGRZmUAifpTXPQSNu7QyF8sGFWaeEADIgUi3lgLdif3uzkpbvkjwG09wCrXVY0Vh5ukiBRyIu9bWTreQvM3XwGxkTXWXcAfneF8O4ePboXt7FEIZ5ULkKhvu3iDxqp9l0XhciE4l9DwTrMTn+an9ac2tzY0TQE2mBW6TFLKzTAVCL3wkOh5QCYATku98FEsoZbPffrtoF7PIR3vVTDUrexbICOvUJaZondhyv8wz8gABURsUBzU+SgM2/LFikW6W6A98kw+kT7MMZsX9SegNXjduMgkfsTy1g3lnQc435V7rrtXiQNJDtXqGyLuBxPbW0zmY80CuOAXdPuMlWUV1N4331DqagK8owa5QO2fdonStQvTPXVad85yZ20J2T5WdfWZuyCTeXPb48UiKiyvSAogKJYFmnAZ1BOcohMWTYWrR1c0/TYG48kv8sq+rsJMD8uqoNGBz3tJP2g1bJSVF7pA2mlMgb96gL953r1NQ/K6Jluo06JHB9i0nKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB5977.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(261102123227099003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(261021123027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVJrYmR4anFyVXRDSkc1UFVmQTd0T3N1aGxyVWFwajExV21tL0tnMGVqTTRs?=
 =?utf-8?B?SHZEaklTb2N5eS9EZXZPS0M5U2cxVjVnU09xMG9HMkRGajlzRWIwUklpK2RG?=
 =?utf-8?B?NDdYVEhzUHRCbktpVzFnYnpUbkl0NHNNUWt3ZzV5MGxoLzZYWk9vUVFzZHM0?=
 =?utf-8?B?RWlrV3hESHYza2N3RUVEaWxncyt1UTlibzFwQ240T3lXTkpHVTBKUSs0dk54?=
 =?utf-8?B?Mi9PbGQ3MXV0anUxZHFMd3NGaENvWVRhYnFvQVN5YWI1NTZCbm83S0FlbENy?=
 =?utf-8?B?TWtkNU9OSnVRckF1UXg0b1R0RnhwV2J5VmxaelUxOEkwMXRkWC9JMEJUSlFC?=
 =?utf-8?B?Q2Q4U0VINXlsU0d0S1pGR3YwenR3YU1sY29RTTRLMTFFZVdjekxSQUpEcXdW?=
 =?utf-8?B?K05mTWhnZzZ3cmtZRURBMkFkbnEzcnFUWXNkODd4ZmdUdE5tdXcwc1dZVU5L?=
 =?utf-8?B?L0NJeW5yc2JIc0pId1k2TitETnkwSHVQdkZXbnVKYnkyUlBrRHovajNYeWcr?=
 =?utf-8?B?RTcyL2Y1ZnlYNUg1T1dsNTRTQWRYMk51T1g4MzVrYUlYVHYxZVVVdUZueTBK?=
 =?utf-8?B?ZWJzRnlHSitnZVRid0xxTjVZSm5xV3MyS2wzcXlWcnVnbXFKUitmQy94bTJT?=
 =?utf-8?B?a1lFQmUzTFlJNE16ZTRZTjZuckQ1QmJ6YVVyNHlBM1RQcWFHaEtlbXc1TWtL?=
 =?utf-8?B?T0R6cDF4empKbmg2Yzl3Y3dMbVNvVU54UFg2ZG9ETHAyVGxqOE1yRklKbjFl?=
 =?utf-8?B?Tll1ZWRtWEJ1WUxrazN1R1hBdWNUV1RBYmZTcFFGZjFVVmJSa0NRQTFBbzU3?=
 =?utf-8?B?ZGhUWHY2VC9kRjl0NUlrRFA5azFiNzJFRC9lTStUb1d5dHpzQ1NsUVdrTFBC?=
 =?utf-8?B?YkYvYnJuUmQ1ckZ6VW9VbEtQQzRrZWM5bllpRU9KeUUxbENFaU5nOE1rUG9G?=
 =?utf-8?B?ME04aWF6cHpOcUcyNERlT25pR1FzNkg4K21STEdrWHNobTNoQ3pnVXJabW40?=
 =?utf-8?B?Nk1wY3JpemQxYTV6cE9nZmhrVkFaeFZHR004b3B6ci82MDY4Y3RHQW84ZzBt?=
 =?utf-8?B?S0grUHpnYUNsb3QzLzgzZXRJTDRaUE41eHFpR2hUNHI4aFE3Y2hReDhvUmZH?=
 =?utf-8?B?TUNBVnJuMFNsaUpmZmFFZE9OeE1VODIrWFZ1anNsOEkvQWtES21pd1NCT0pU?=
 =?utf-8?B?WHNKd0I0MHZyVnVreDFmakp1UGNtOUdmV1ZpR1V3OWpOclhvVVFmdVlvYjYx?=
 =?utf-8?B?ODgwQkpOVVNoVTF6dEhJajlKWW1MSW1IWVlDOXp6QWhOY0VIZUVsUzVQWkRY?=
 =?utf-8?B?aTJnS2ZNL0hMMXJMUks0aUJHS00veTJjQS9HeU42Q0swOFo0Qm1ldFZubU1E?=
 =?utf-8?B?dzI0UUMzV0lpSmxFMmU4N0lPTmFVR1pnWXliN2Z4eFhteXNvMFNZOTJMUDdp?=
 =?utf-8?B?VVBaMFp6eWpCbDNrK1J2ZlIvRXVZSS95R0o1NWxJallJaXpPQWxQYklCd1Uy?=
 =?utf-8?B?cVpQWkFXbTIwLzR4TExIdkJBa0R3ckdVYlhibDVzRmRsK3FwVkliTjZ3MlFI?=
 =?utf-8?B?dmlZY202QlpDaTFJcWU5a2V3NTdoUGRyOTQ2ZmVpSmt2STZteTA5RUtPbTMz?=
 =?utf-8?B?bGNpdWIrL2tCOFlhcVRRMnExMm1icHhEcDA1Zk1iREx4VFNsbklpM3FiMXI1?=
 =?utf-8?B?UlZka296S3R2SWV3WjQyRUVlRFVxNkZ2RVZlM2g3TDNvUVlaS0ZOVzNiTVBl?=
 =?utf-8?B?UG1WaXZDK0Fra204S2t4Wkx0YldGMDE0eVN4WUFJbExSWFVsbjFhM2U5c3gy?=
 =?utf-8?B?MGZwck5iYmRMNk56MkRiczRIUDRReHRRbjJRbCtMRysrc20wTFRsTnZ6cjNx?=
 =?utf-8?B?KzZ2OE9VRklnMGNlVnhuUWE5MHVaeDZiUGhibEF4VGFscDFUSHdWWEl1YUdt?=
 =?utf-8?B?RUZjUkNIWUtFNTRrYXkwNHhLbnBucHozakxmSEhHelRpS3Y1WnY4OWRhZG40?=
 =?utf-8?B?WjJMV0dHUW5aVGJwUVFHMG96YS8zekVNZVJGUzdvalk2VGdCWC9EV3dLYzVI?=
 =?utf-8?B?L0FiRFMxcWxrS0JDeFpWUldxWGVkTW5aWmlYcnBsN1RhdjJnT0hQakpvK2NW?=
 =?utf-8?B?YW5SeVZCNzZvdS9IY0k5MllnanlVSmVNOXhiT0NhWUJWdk1qR3dZRVBpRFdC?=
 =?utf-8?B?UGM2YXdMV3dqQnNncmJ0d2tMQmVhYXYrRzdObkM1L1kyMDI5L2FqTEVKMjJh?=
 =?utf-8?B?K1hnMjd3T3NWL2dQby9mRzFxd2NCcHlqWHRYckNCSVBmcEVrTUZXdW5pWDZM?=
 =?utf-8?B?aUJuRlZYbjgyNFluTzFxNnk4UTN3Nlp2RUV6SGY2cU4yMmE2Q0MyZz09?=
X-Exchange-RoutingPolicyChecked:
	J0xlKBJvbZY5tjAzpi1vINudC14nRRAeYhWL3txhC/z7HwP49szCTqary7ujJP1yhrLGOi9rjqd1/IZ3CigvQijdhDdXdkBy8Qg0ALDeyRJ5zf5ZuEp5NjeMmF/wyKaDZ6HQpm4zrWrRDB5BM09255Htp7MQBxT7EGO1DqYyZtvrd4wlI4xD3mqPToh2HP+32eDblVSaNan/UkCqV5rjUaok8zlTFXHUjZ2Jibobd3gaY05jEUVv9vKg2uAzwmSVLwJ1sF9r/CYDo+6pwd0lpyFdn2L1lViJMwsLcLyOzOMRFeCB3wU9HresaOYQvrP5cDp2GfDozqoVZpIZZ7+Rhg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4ef97f-3008-4afe-d822-08df400b3f6c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB5977.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 15:48:36.3665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33Sc6Zc4h1NPPG0+FWkx0rm/jQ77TcbQfn6PoewpRORq/QwoPG2sAsLSlZykQIKLhaz9Il1Ie5xLHc5/e/DWGfhFcBnylBrUYMYIy5cm7gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7480
X-Proofpoint-GUID: ejIFGMrKh0ygFgmBoaQJrkV4pq-2xJsZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX2uGWxBCYT+fa
 8/kkhAw/b+9nK+a/Px4pOIacZCYiF5Kk6lWzfBUho8jLBXzZnANInqQaLcK3dz7zLX5PzFO4CFB
 71Rcaxzt85xgbfWRF0iTlGiSmqjJwEYf8iAKjWd9syrQd//QBqxS
X-Proofpoint-ORIG-GUID: ejIFGMrKh0ygFgmBoaQJrkV4pq-2xJsZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX5mtIWZWudHiT
 kgcimXAgjuqJ5CmBQ7hENU0l/a4ViCGNrNxZpDmYHBAZoCLUYheZAkGzPcz169WUkOG1QlA8a09
 YbC95kB4NjkC1NkTXIaXVMDkHJQPMC0Cu9/OAGfiAVmevuCoMIQzJRMYl2ydxbeykC9SAmPMBSK
 5sGnBR7VKaJ9FpYXW7x9DohBr/7x56++0zNTWZKTttxEVBlaYSzi1NS04Mqxk3npfn1Qf9UzRlo
 DkxXPGMKDEAqDpO8Nh7ZWVtDdwCcSCPPBpRhbBiOJTsPBvrX6lkP0bcWWD9QWhizwgZquzeXfGB
 NW7drSZNsBcXhKcBeZH1tyDO65ydw3TPc5MIgsUwGS4hZZqicl0G6lNIJHMJYS3LGJambMX11My
 /OugyECwEcF6gFC7yGOh9FrFhreiM5LajnOda2DH11ZUNNZGAoC1cqfnxikM9tAM3w3RgV/mwLL
 VEoB+2wcTzLMzCx5bTw==
X-Authority-Analysis: v=2.4 cv=fcc4WEQF c=1 sm=1 tr=0 ts=6af48e55 cx=c_pps
 a=KwZW/a2w+sB+hZzDdQVeig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=_xF0M8GitKh1NRSYBSgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Tue, Nov 10, 2026 at 05:25:07AM +0000, Kuninori Morimoto wrote:
> struct snd_soc_component will be capsuled soon, its member will not be
> able to access from non soc-component.c.
> 
> This patch adds snd_soc_component_device_link_{add/del}() to handle
> Component device_link.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  sound/soc/soc-card.c      | 22 ++++------------------
>  sound/soc/soc-component.c | 28 ++++++++++++++++++++++++++++
>  sound/soc/soc-internal.h  |  2 ++
>  3 files changed, 34 insertions(+), 18 deletions(-)
