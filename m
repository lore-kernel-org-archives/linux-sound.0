Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE483CC314
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479882; cv=fail; b=pwMLAMA8TYO7VmX9KNi4ugBcRYVlikHvyMZrvmn0BIWcFGWZsXqlqtqH1JWGNJkVoPSNGshObHzJxoQDmVnkIj2I3LlA1cxag2RlKvCUqdWNRyKOu9VWLWCsrNPDbnwPUK/sBI4Fg6dO2Mfefnn0UDS/9A4OXSg/F5Q7E6IdJcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479882; c=relaxed/simple;
	bh=BtN8F6A97Awmk904lpakwYH4QjYfRCLO1GMLyYF7tlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p86tRyBTIEQ+gkM6LePeXn76FjRTWR1P7gA+JSMukeuTn3Rt5KonOPNs1eQJCwvgc8nAeOk153h6H7MO9NysCtWtGmvYrF2wzQU5HMud6bHkvfgHQXooNaZazOi7YDLO8Drz6PQnceol2PXW4HlGuaTffQ8Ku16oKu2UTcuofFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UjLIHMoQ; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="UjLIHMoQ"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxb6p4162378;
	Tue, 15 Sep 2026 09:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=hh3ab
	VOl/ZwVKMvEn0pVV2XRvK6bbGAa8lVKn5QTd9M=; b=UjLIHMoQjZsckpVcu47Jm
	HgY3PBq9AmnTtWwO3pF2LqKh7/pKGdj8+OP+py0lsqpJyr/TtGYwmzAG75+jfruV
	S9GCd7/JukvUv5sNNxJVCo8dthEYAGqpebnB1kAGQ2I0tzC5kTfXpg0AWW1qcgaj
	+VkMgyVEIlBk0CsNvOpCR8KSz7fSR6gfiz1kULdtVxn3jahtn508juGxIY6QZFWk
	uy9s2hVW1/rTO6+V/Vbq6VIB+PXArrb5Ih9zhZNhXRYuKKV3f8hhwXakut0tjTNd
	9bKWE6Qcj/ARZnEdOdd6zQXX+g7PTDX/p3Y9bWcJKcQawnpPwcSt9OssgD8TPN/W
	Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gq4v9gvjq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:44:22 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5OF0tKfrawIsEeJ8Eilhw1rzF6f8b7oqvp10FxjvuMO/vpzuhRsvSXIn01UKmgSsCpRjXWIl8BMF4o4URnboKGf8HCzZdP/0bOYO01hPZQOOKA5+4XOoLPeXtNwce+qUyrVHSgVsJAMSKMCcdORJ9/y6q18th3Y58DzoXQtGbSDOUCJUg3Jst8UFqWm+3dbaxIXIMdVutiWK3CgtS9zYjx0ZrlEqGIKIPp30O5nghk6ou8ExLjo06jK9b/x4h+sVKdt7H4ngWxy6DEM4Y+L9+mxGK1VZ+b3/Q3bDaZNMWpxGLxCuqxBldN1ypPu6A3FwQkNYIwrKG915CWqWDeArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh3abVOl/ZwVKMvEn0pVV2XRvK6bbGAa8lVKn5QTd9M=;
 b=aB6AyAJbKbjlBVD4x6ER3X247t8whTobzlSjERCVrf5FNuAMvB+e8S1vbsMROgckyYMWdtp4RwIxGSAsMXjejP5vdkJq0wDHrlRGA9hp22xDO8SPj3i0sXl7ESqsySP/VTqorxjUD/jA37nBZfl7+0ZzqXM2aguq8BgF21Uh0SmNuN9kvt7qrUr22n8fBXE3NcjG048Gue4LC4DEaesJIsXgW7ZI6v5XPfFj1LznYHQ+82qe/nZAzNhOO3EnA4+mClJKMtrsMNEzWaNB6ZeVc637jMLBhS2AIoWa9hhI1aHEWY8WBuaBzJ6XbKRnMB6g6Jr2Y2xCX4ZDDHcxM4LZ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by SN7PR03MB7230.namprd03.prod.outlook.com (2603:10b6:806:2e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 13:44:21 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 13:44:21 +0000
Date: Tue, 15 Sep 2026 15:44:18 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/10] ASoC: soc-dai: add snd_soc_dai_to_component()
Message-ID: <aqlLqroddOcG3SBR@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87o6e0li9q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6e0li9q.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AM8P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::32) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|SN7PR03MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 1266f8d4-2b7a-4ec6-ccfd-08df132f724b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AJm3Opx77qEBaAALfFDsmPmnyKU12xMncYw4ZqfxuGOhSaL3o386c20smu9nXqiketlRXGpG7oMFwpJGWsdXEt0PkVr8oFc/dSrcFV6kZvBPaoCXunSSytS4ZeTsf04Iy9k8U9xvKg1lcKW/Ic+yq8X8BvVsuOTTVomrggJRCMbSV9LvX9ArzvZQji0u8MPby7Ok9r+0xg57Y2Gdzz9vsUcDk5U8sCHflHXO0NRBLeahFVTZpUaOy/EGGPix7eoFGUKWUw0KXbCJ1NE/W7eUUeRt1JA6PN1Jp9ioUrc1zZwuKi0CzSs2xrtrwkcQRrGTJsnm6pa6bvdTLMwj6tKfQ6Sqoi2RikIkiVf6LTWfHlG/WjPHSTgqml/GZKwQ8FZTIgahXLvCxbnV3kRYTLmEMCS9xAamL0u2kmtE7NqXY/G5B2dW8Jtiy2IZNwKBLd5UYf9fzNhR3jsKlLklYKUTXxdUC0ymHDsPGSZEI+X1qGh8p5jbCuaJLEYD0GpETs7pyYBzr63j1RsiYrNGNvrPouI0osmFSsdZRwSoLhOAwNEn+L+xY3KW6UxbZdXpWUEz6/QaENjrOMxiDsG8nz+vGHbrCd5MlPzcffyEfnqu8YX45PhK2aPDlJjSORCbV0vJNWqxNn+4VXTKS2ouo98Q2uxuml2roo3LEcFPWFEj4B8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUxLM1dkVGNRdjhEWEQ5bUFLbUpzRXhQZEErQnVZQWlQWGQ0Nnp2UDBCQ0Ni?=
 =?utf-8?B?ZkVQUEhWcGtZNXdVTlBvZFVzTkhqRTd0ejRhcmp2ZjExZk1ndUNZZy9CNnZY?=
 =?utf-8?B?WUcva2NZQWlCYUtSc3IzU2tMbjR0SDNPeWRHNmJlYmFKd0lYWVhlT2YycjV6?=
 =?utf-8?B?Nm15N3djS2V2UzhGTm54dlgxVHNLY1UzWkJ4bVRiTUt0YmVGVXVBdVZzVjhz?=
 =?utf-8?B?WnJDK1BmNjhWempTTFVYbkJUd1BucS80R3J4OENnaEttTEFCKzJ5UGxwM1JV?=
 =?utf-8?B?ZW11VzBFeUxoOTFIa3ZPYTNhOVhLUkdhNmhVNmtyVFcxaTVFajB3VlVCMzZr?=
 =?utf-8?B?ZTRyNlBBbmdieXBSd2VTb0JuNTBzcU9vamI2U1NaUjhHN1pJT1lSUXgwOWZK?=
 =?utf-8?B?UU1Gb2lyNEZ3Q2RpTGI0SnRad2gxaHMwZ2RZNmxOcjVFS1F6STNueWVabHJW?=
 =?utf-8?B?Uk9tKzlpL3R1RnFaK0gvYWpIYjJUYVNPTDB1c1hOdGZ6V0ZiUjBZdjJDNkZM?=
 =?utf-8?B?OFBneHpDbFdNekNoK0pqNVRJaHdmSTZmamtsRnU5QTRxRCtzT3FNZ1o0TEt2?=
 =?utf-8?B?RUNtYmIxM0REdzJuZXl0WVVMQWhvQW5CU1hENXhNMnp3YlVHazJBbVA5WUxC?=
 =?utf-8?B?T3Q0blJUYnZmUFRGMnY5bE9lUnRsYmdrZ29iN0R4ODNqWjAybm5sZEtGRkZN?=
 =?utf-8?B?YUowbnQ4UmFyTmNJZWZxUzAycW5yNXpNSlpOdmMxRWlhUHZYM0RvT2FXMVMy?=
 =?utf-8?B?WWl0YitIK3A3RDM5VDFlc08vQ25jM2lGNkg2L3NKYlNMR2lJZCttQ0crSGlH?=
 =?utf-8?B?a3VNZHpXR1A5bURQZ1Jmb0xDVW4vT3lST2ZJSnZQSmgxSnRTUElwMTBtMU1B?=
 =?utf-8?B?Y3MwWC8xdFZVMlZ5eG9YdTJCVDEwTU96TWsrM0NwMDRoQ0JqNDBYNDNET0NV?=
 =?utf-8?B?cmtoMEF3MEVFdmNLemM5WS9qUGcySWQ3ZTNVUVJPM2FQWUZ5NVRkQ1hLeUsx?=
 =?utf-8?B?QmpRVmdabnUxNlpmcGRuVDZhdDAxWlJkeG1EQk0vdXdLbkt1SE80QXB4c3BO?=
 =?utf-8?B?R2F6bXB5RmZiTitBbk4zMElyVW5JdG9abk1CaE92Vm9KRGdWa28vUnVJRUdB?=
 =?utf-8?B?SStmZVIxY3dWaXNBSk9na1RyT1dBZDQ4bzVYNmxVVXpPUzdzbWtFY0Y1c09k?=
 =?utf-8?B?WmNQNWhvMXVJblVheGNjeFAwcllmTlZSYUNxeis3YVNNeGdhbWdCOFhzMW1M?=
 =?utf-8?B?dHJFR0EzWGtEb3I2WUpJOTcwdXJRaHR1dUVjUVNVbTlEUEZ4b0FGc3NNSEdD?=
 =?utf-8?B?R0poQjhXWFZmWU9xNXh5VU5xbU9LZHpZZGNVaW0rVk9TbXN3VUIxQmZoaUkw?=
 =?utf-8?B?aFpybDVuNFpKVGQzY1dHd3lFMXVsa2poTWMxTGtNcS9RQnpTeEZETnUvVVBm?=
 =?utf-8?B?MmhrUGI0c3VFQjVDQ0FRVmY5MGVWeFFWRWd4anQrMDlHendBMjNMMGQyc0Vn?=
 =?utf-8?B?R3NQUThIWFZ3czdJOUVDS2lOMzZxZFBkNlk2ZXdlUVlQT3RFUFRPampPL3Vv?=
 =?utf-8?B?NUh2K20zK3ZCeG1KLzk1TitpbEloMXVOYjhNNGpjcXlHQjdVakJhUTF2VHlD?=
 =?utf-8?B?WWJYZ09oYmR2RnFlZEhqTHNtdkw0SXVTZS9uN0tFdXNQeFpaaklDaU1zSHF1?=
 =?utf-8?B?TGRiM2Y0YVBjOGMvczdsSWJLNkV4WTlJSmdSRzJsL3FERGRoVkRLYTR3Ulp0?=
 =?utf-8?B?WEpOT2N4MnU3ak5WNFAxNE9zWmNySzN3STdLTXdMckVtOWRTN1RqNXFmNERC?=
 =?utf-8?B?ZlFISzUwYitxQUZWSnBaRUJLN2hXSU5RVy9FcFg1QWoxdkdnTnU5ZU5Gd1Mx?=
 =?utf-8?B?aU1XeVZhUUVQaHBhZUk0MUkza05rSFAvcENiWm1UYzVuNnRCVW92Q255QWdL?=
 =?utf-8?B?aGRJY042U1RmMFl2UTE4R2ZQelNOdGJ1N1I5VWJwbnZJamwvOFZQRzU1a3Iw?=
 =?utf-8?B?MFRoa2pVMU1ZSEhXM3VVaHBpSEo4amo2eHBjSmlxSWhlM1ZjTlg1SkYyWXdI?=
 =?utf-8?B?ZE56eVBkYVVFMmZFc2FoNDMyci81bXo5K2g5ZVh0cGdPem5GVWpCdTcwV25U?=
 =?utf-8?B?Tk9WQ293UVIyalZBaVNtd2ROazU3ZnQrN2FabkRVbDlNQzBQSzBIaGdacW03?=
 =?utf-8?B?aDI4OTJPQjhhZWxUR082YzZidlVlUjV2RUVXWGVtUjE4NGVkWFlVQXcybGt3?=
 =?utf-8?B?eHQvMWxlemd6K3BhMHV5ZDJQTUhzTXE3RDRWMTVERmViK3NISnpqS2hQNlZm?=
 =?utf-8?B?RXZNVndndU8xUDZLcjhVU1VPK1FQeDBPUDhON00xS1o4eTMwTWo4Zz09?=
X-Exchange-RoutingPolicyChecked:
	TcZt8I/+U+CtMuU/atkKrAnzx/Shhx8vAaDRvFWL79vZIu6FGqukq+zvVgTHNlZRKDAkZX0A7imPg+ABAvtPqeM21qgtxh1qs2dWFLysWU1WZiW5NPOFPl8dDqhcz9WkqBWJVdg3oDdUaNed/NjMJzDOjFDr7LQV5Wuuh5G2G0jrHXAO1GhCgJ4PPqmC/Ody6ouu6KMC/46POJ8uFeQDOq01ISJIdA7hl2i2/HKA9X6RagUELMozeVkwhQDUP66QrqkY6V0Y/S5nRjWV4v5T6m+u2pQ437lv7wlgzEUdqjKy8GRLl81BQewdh6UPOE5D5vW1MwXPdPW5rOI+vCr6OA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1266f8d4-2b7a-4ec6-ccfd-08df132f724b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:44:21.4100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjRSNT2nUlFpvu28MiUB0vluSqdi5euz4l+OaX0IEu7NfN6vPlRRZpvf4cKPlcTXhWQN+Adw8QzcSEcN1IACuLf0YtjSXZgpokIZghmfN6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7230
X-Authority-Analysis: v=2.4 cv=JekpPkKV c=1 sm=1 tr=0 ts=6aa94bb6 cx=c_pps
 a=25083kmBgh9d5ln0vqlIEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=WqTBSSSdvf6OmJ_7tFEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfX5XkukF68Ldrn
 3ExKZ2HAcUEGbsiOE7jF/7dxJC+c+SdwbYKfhYCQjGc2p0jb/mrHkMMOjA3weM39EIyZGZrIytk
 sUePL4JDzSp6gc2yN2AZEz1PrpCM8zveyyqCK3c0LUYK3IX9CU/3qJm8nlw7w1yZ6aYapc7hYMa
 A40plZpVi63894ZtT0Qxkb0Cgq8C1oFcwyzA/xvo1t7RzU44RbNgUwLsb5jogfP2lWEXfT2l/D7
 P/f0r7OwLGY2U95QojFLau8NGBiu6+aP/9aVhaJoZNUcoFpFX2iHh1UcYIK7Qkl/HeLiUHhL1qI
 /lbjmD7bMJmqCUJhETGWqKUr+SP0bj2CF/adWoItmgA2ccPRe/P9jGH0vq4Pzm65TLvdkVU7cam
 H8fnq5887eUhhWAAdtgJizqaWWjA5ci5RPWwKLfQ5D8KLldVtq4zMMGRtpUxL9edbFoUG33GNZV
 VZeukxR85DRYnGLuU9g==
X-Proofpoint-GUID: ijiLam2Zoi9PRyP62UTx3Wf0SqESooot
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfX2omaXLYOhR/k
 NYHcfccChpMwpHuSg8g+kBi2jAPuAfpLT/NHW0tt/bp2KcjCht/Ev8WDlEuyeX16VdtLWgItdcA
 gLAG+AbYnA1EA47kelf7fhelEHnXplINmxK2nxlnO81Uu0IO8EjE
X-Proofpoint-ORIG-GUID: ijiLam2Zoi9PRyP62UTx3Wf0SqESooot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150199

On Mon, Sep 14, 2026 at 01:43:29AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. add snd_soc_dai_to_component() to get component from DAI.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
