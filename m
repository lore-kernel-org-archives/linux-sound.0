Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086423D7D82
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479790; cv=fail; b=fzZVPTAzprce1u0Wu69x0NTPYbUD8ddHTP6sMuw0CMzmQ8Rodmc29tkgYCKH7Dz/dzEvZ5jBU7a9VS7/4LhFAy4S3wtCbhtyzC/el8M51PHR0O6JJJylZBUf4rSzpjRTSzGhvcMgLDssddbCfYwfhuudq7YwxbZKi4GjeYAayWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479790; c=relaxed/simple;
	bh=0adFTij74a7xSXAURizW4p96k1UetdA8XiEW0YGcpac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jCXC2klDMXhgMHNrsr29p+vrkjTO9vT2RsVjq3SgygRrYeE2MKd1BhdL+B6j8RccqInn7mxWDckPSnMXoy7iiBL07NkLv3Zka+i2Ygt9U9QqLWD8zaHqKwQJOHabS4S8loUV6Szx7jne+D4kBfMOGfz6/ETzRDZPkPtDVnQpo2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=EpgMxDUs; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="EpgMxDUs"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FCxQJc2679769;
	Tue, 15 Sep 2026 09:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM; bh=mVoNcvlnj45fs9rwOWb5EpgejYhYv
	dabO4p7NWRz4dc=; b=EpgMxDUsavvhcSzmbyKVPfY37RT1pQRNdoBkqyD7NUmtI
	rZ2snLzJhxNtoTBsz5jOjeH31ZBpZ8w581LugsIaa0N3prxQ95V/ihjXFyvKQd1+
	A3y7K01X1sdSJLWSjXOOzZurfOSp+2qHAy+4n5CitLStpxmvDQmU4A7xOojSTDDD
	D7hIBerdtS+LoSSZmFyAiReS65Eq9JhqTPUS5yzyQG9x9QUxq9PxVfcrjME0nr/G
	A9g0h6+FTpQFl2QyJmGSVoUb6XYxib5WmwmGNS5w/D/G2ISBXlJXsLigiOcc405c
	jT+KIeQgAj2ot/liZYCEwbEmFlNZbLzomGqoTUwoA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010002.outbound.protection.outlook.com [52.101.193.2])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gpu6pjwkp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 09:42:50 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtvFHZ/fZD60+C8eLUIF2vHCrgDFbSk8srG4niaiL7q1sWOkKW88o+CYqRy93I7aIi2PVUC46gHgmLQLvNtkCdDnGSQZ+Z32SdRf0HZL4/3zQkiV/JFhqbUGJzqgiyunMBpz0mCrsdHvn7R7XGAP1G0GdcOzkE78b2r5B8YTjCtVVN/Y0f4a/LKZaQjZUQQZOI4ecYNzRlkPwPu16NwbIP/X7E96W+nJrB1WiLM9YXrmsBQYlTz7XZq++0gXtTamBSwtZ07XSXgW8yrhIyO1P1JeYgBX46SlCN2S5DAWkH+cfda+WbKDch4YE5gcAHb7wW7PHN8/70LuvMQue9E4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVoNcvlnj45fs9rwOWb5EpgejYhYvdabO4p7NWRz4dc=;
 b=W7FcDf08xgeyw3yrKawfAq8RIKNjeca4mh/Z9o+HuVpWgvGh4t95DFCO5ketPn8GNqmqhcl49BReoDfA2Nr+uZ3sMtxgf7xrTY37jrJ+j9pmhJxKKWLf5pBB19iPpF++Et9eLA8aT1wMyv0vhzc3likwCr0/utPn3OlCShrfH04AgV8N3xutfbbxAhehyYxUXFKibkWGe/jVMh/xDPX9WkdtMjFtIyMaksxVWly5LAJej8DWfeShRoz0KD38Sgg6n3Qaukps/svEGYddwkd9E+P/PqGkGMIB5u0pGLIZL5s6e3qb7JpIKg8ZvQGmCcZYDbf5sQqk2G4cPIiMHqJ+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by SN7PR03MB7230.namprd03.prod.outlook.com (2603:10b6:806:2e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 13:42:46 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 13:42:46 +0000
Date: Tue, 15 Sep 2026 15:42:41 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/10] ASoC: soc-dai: rename snd_soc_dai_stream_active()
Message-ID: <aqke4IixnU_L9osp@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87h5jsli4y.wl-kuninori.morimoto.gx@renesas.com>
 <aqiS7yz4IIYzU6ml@analog.com>
 <874ifrrsy5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874ifrrsy5.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: VI4PEPF0000015E.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::86a) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|SN7PR03MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: e51fdb48-fbf0-4904-baa2-08df132f38ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SU40MzsUR5pG2zAXK59yg/5KEJcBHjd0pu4rbBzRubZwiRR/GnP7Rvf4c1Yk/Z/X9AlhFP+FQi9mrg9mxCCnBvgeVPQQVfG4nnJzsoVh89FW2eW3pR7V3qnZ/+WUnURoR8Mr0N54IXYITpirlObWeTy9x4suViC+qmWLAq0dePnrbwOi/kwMvQYutadb1wLGg4U4f8fKn2RW6AvDzcSEqciCKTQi7ic8sPLBeMr96XvIjfgtbKr1TPJntL/Bd6GYAI1BW6X17Y0SJAA6pb/PUjZNvdJUV5lBEMCosnMHTWgmbH0U5VFDAYcV5TakueGjcxNPxTi26zLqR9m8n2OgT9uZa601BDhsnTBUQBFTy3a6lot2BFLI4yv4HvSWlgbAcDFASPdjZPzdlnusZGl9BhElhuNtkFKTQKII/pwE6GX/dJ3XVdZzB7OWFL9udk6dml0Ea8bS+/LG4RXwaRwrTGd1ef3HmxKWzXqXwqAhuOXRCumDNo6lK7veQH8dzvya0jtb+RiX2q2OBILpbxJ92rAs7QafNyOEUZaRyTGuio5CxwYhSonKgujB7X2fMp8QbiFvoIZ3F1JbHeJ7x14mLXlZ+phIR27XK5EnX77IADoJhJRCL0QA7nbndYP7yzlrwCkrIwePld/KUnbp5PAPQEnrzI20eW9csLL3sjqQMBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjlVWDNsQ2tQT1NKekJoV0t4ZFhJR1JWU3RRbEFMRHpNTGtxdW14VlQzQmFy?=
 =?utf-8?B?L3VsWVpHUERoVE1TOHJ6NE13NzdxczhybDZsUndoZkExaHBBV0J0bWd1UGRn?=
 =?utf-8?B?RHh5WVlGNkx1dkI2NDg4dVRNRFJ0YkVhNWx4TGhrdmN4MmYvMkthMXdORUw4?=
 =?utf-8?B?Y01HYlZZY04vUU0vWUJUYTFSa1U1NUpSSGVRU1VyejQzUHU2d21FeUZhTG1N?=
 =?utf-8?B?SER5M1BxREpEZVQ1empzR0hXZ29KQXEyOExLd2dXbXNLRjlMaXFscXhCMkFF?=
 =?utf-8?B?bWs2L0FMbEpsSHd1M1ZSNFcwTlM3dkJEYlhoUjA4UDVaUFpMeFFIaEdjVDQr?=
 =?utf-8?B?V1p2SzFFYjdrRXNhL245VHE0Q2VJaHFkOTFtUzE3dkhiYTdoWFdka253SG5N?=
 =?utf-8?B?OGNBQzN6WHJRMGFjNjRLRkt2M1NkTndyZkx0MzA5aU1tbzBXYmZPQTNUU09k?=
 =?utf-8?B?Z0tsMHZIL1NqNHhnR1QzNFY4VGJKcFF4T2tKc1VQamNqSUFOUy93SlVoUVBo?=
 =?utf-8?B?T2pPYnN3b3AzT0tKN3FKbmU3TWhTRVFTMmFpaWVSakEvR2RNVk1MbTdpaXBM?=
 =?utf-8?B?RzZHM3pvUjFuR2J6TWM0QnpkYjl4Qzl1UlNtOEtFMjYzWXdKUDhmOUgxaXR6?=
 =?utf-8?B?Q2tFbnRtUGtRUU8rK3VITE5Dc2ppdXM2cW5nS3RhNjZOZ25uWFY3ZFpwWStp?=
 =?utf-8?B?a2FnbGRYc2JkQ1RYVWJTVUN4djQwT01CbUpEby8yOGxCb2RpbFI5ZHVxS0F0?=
 =?utf-8?B?Y1hxbXVWTWVxTFVNTzN1Y0pkdDJlMmY2RnRwdWxEK3lVMDNmYlVPeFA3QkZw?=
 =?utf-8?B?SVhaU2xiOE1kWk5paHJrakhQWFEzSHlBYmx3TnlGVFlMSjlJc1cvcklYaE05?=
 =?utf-8?B?ckJzZVg0K3JsSVJxUUhRcThKUkc3MWhoNk1CWk43c2NmK3IxNzlxTXAxTUxT?=
 =?utf-8?B?dXArd0V0WmJOVmJKSllLS3JXRC9Sb2Ywa2QwT0ovd2lqcUg3Q3VVem9aMGcz?=
 =?utf-8?B?MUZ4cXRVV3gvc1lYUzIvYWdTd25SQVlwRGNQaTBHTk15bGhKWmFkL2ZCTC9o?=
 =?utf-8?B?TmVJYStBaUhGczVPQisrUkYzbWoyUXl3ZkdXVFJhTyt3bjJJZGRDSEZYYkFv?=
 =?utf-8?B?WDI0RU5mdWlGdXBGOEMreXppMmNJR3psanp4YlYya0g0YkFWTVI5c25qMmVi?=
 =?utf-8?B?MS80WGUyM2FGcnJUNm41OXlkcno2UFFxd3lXNGdET3dod1JLNEFZcUFTeHJp?=
 =?utf-8?B?TktRSkdyM01YaWplc2JOL0ZLc24vVDR4QUxXVXQ2T3hqcS9nLzRaVkpZRjk4?=
 =?utf-8?B?VDJ2bGJZa1dWbE5LbFlOUUxGc1AzSkNINXcyU085Rkl1WUlVMFRSZzJsOFho?=
 =?utf-8?B?aSsvQi9uMFJjaDhIZlowWDJ4cDhTM2F1ZzRSSjNONXE1RVNOQlJTUExycHRh?=
 =?utf-8?B?dFVtSk1hblJ0Y0xvMUFpK09QVEhRbVJTTmVrLzBhM0VrdFFqWGlra1FkTnQy?=
 =?utf-8?B?bUwxdXdBcXhVcHpSVjhyVDllY1p5MC91bDNKZjlmRW9paTVXZ1Z5OTI2czRo?=
 =?utf-8?B?Z0pubXpXL05lQ21jSXBQZjZkcXRhN3MxVnA1dVA0TDkreXcrU2FWNE1Ha1FT?=
 =?utf-8?B?YXJhczZTbHFUQjFuVjVZcnNmYzB3S002MkZFVldDT2xlOXE0eHh5OTZUY3NZ?=
 =?utf-8?B?WUxjL2dlREU3UklVbXk2OHI0ekFsTnIxSEVmZjhra3kwb0ZXdDJjeVVjN0hl?=
 =?utf-8?B?RWVXRzBISmRKWHRnVENKYkVEbFdNc1EzSFhWQ3lBOVAwWjltZ08rQXdhRGVD?=
 =?utf-8?B?ODZ4TWJjYTFaZGZaNFJveFlsaTR6eUp6TjYrQTk1cWJPRSt5NktjNXZ6L2FT?=
 =?utf-8?B?VjZoM01ZZkFaVzBhaVh1QTVzRFJMUEJ1c2t2ZWpJNzRnOTFvcjFybHdHOU1K?=
 =?utf-8?B?ZklaK3pQRjlBR3ZrUXAwc0ZVc3ZBYUxSSXZoQmpGbmpkOFM4WU9XNEQ0bVRm?=
 =?utf-8?B?bXlVdkhHTWgvZ1dKSUVnVUtCV2s0TG5GM3NnNnRZWkVXOFJIMVRwcWc0Qkk4?=
 =?utf-8?B?UDk2SjJGV05iSU5sN1Nnd2tFcmdxTzRUKzBHSXNLSWgvSFl5WEh1cWtCdzBT?=
 =?utf-8?B?UjFXNnJXZXdBN2x4TXg1Z1NCT1lZd2EweFNiZW1sYzZTdEU0ZnUybEJIOVNs?=
 =?utf-8?B?YThmR1ZJRGtEWEhrNk44TUc4TGFIeG5KOWpRYjBCbXRiQVo3S3BobjVtNStO?=
 =?utf-8?B?eG9OMWNkTVNYY3dId0d3Zm9uZEJraHdxaituRUtodVRnbVQyMms5SWpJRC8w?=
 =?utf-8?B?VmpMaHMwOUdtSDhYYjhkOWFkUWhuOUJpSHJ6aStwRVArdHZnQ3RNQT09?=
X-Exchange-RoutingPolicyChecked:
	vFiCSQHN1d3b/k7ywT1YfDT/NHv+Jm03pDbOrL8spcp/mmD+rTT9976/L2xjg4eAy1lMF5W+2Ak/Zlt31hkM3AtR7/g+jW9dWDekdcTOjqwyixUQ9j761fvrLE+d3vbUGu4JYL69YIDuZ4RszgdejDbFWXRkUODDC5PKhvMUc9X3EAUnwc0HL5ux4mmkmvmkM1LWhgJ0h5eF4Pg5fVcZbca6rmxgIPIivsDrMrDko3s6EzYFnLe1ZOk5WxrCjwCag6Qs4KDDsmS63RHcKS/Je4Nq5VZq38e+UyPJqF8UMeMO4KWgYCR+6bSxjXwmb7rS/OpMl0AQpSxd+CkPd46yEA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51fdb48-fbf0-4904-baa2-08df132f38ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 13:42:46.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USZdYUdhtI5CxWDKLS6YXyhIrGx89xR7s3/crCdCO3x74oplHyY2KPliXmgLKG0mo1Qm55NKrlYI6uSCa1dwfa483MIABRc5aKmMzrQg374=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7230
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfX13AIlRWHAWwX
 zmNqX6bR8iMmj7uuZnP00wOGoD7UISFP5yuSPX+xxUM0GFCm5JzJZNuMQQZvvSDcikiEAfgwGPh
 QsmaQ37bTP4xsH9IRRCQJnloLCbsCTNFH3UVGUYkR671zvF2Du5EuERHrFdJPWRqaqD27PlNuft
 FAm/NSuudlvzxbd7hp5ffj2CjjC+VaGuJz9UqvnCEAZMoyjFtSbY6e3Ux6JH2Q60NQwP2uqrZOR
 z4b8ekTZlfdxXxLNWefyUgR9CTdM1Rd94CbRqVb3UZw1d+Ma+4MkgStEIaiCXGrBfQ+qArWkaJR
 fJwGv7ZvkYsptaRiGbXZoMxUJC6x1t//Osay37N2roNYgC0fLwvZ4kPhRVJtGmrR7/HbUEv4ojE
 8LJQ7uUm0Xn4Emjtk+n/Z9TtvAtsYpcrYfts7JLmF3SjVlulPsb86YiAZ06a7HVIz19nnlpzCdE
 3SB21Ybax1GZijyuMMw==
X-Proofpoint-ORIG-GUID: ux3AgDGXP9XUH3JnOIDYtBRALWI_wmJN
X-Authority-Analysis: v=2.4 cv=M8rYuCws c=1 sm=1 tr=0 ts=6aa94b5a cx=c_pps
 a=NtDnjKqRhcbz7rYDj/0C3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=8NStrvr5n8KhyGwasgwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ux3AgDGXP9XUH3JnOIDYtBRALWI_wmJN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE5OSBTYWx0ZWRfXxxZBlnQxg5j2
 pFvR0m/xr+APdEGfzjrfnOIZIKMG7IwKDzo7oyIhVTvH6xUA6eDrZS7ntk1v5IogBEtJIDXpwkl
 tDwU8/w97b6OktrYCz1Opy1hJ/J8HDQLHk/3pOHqhTakYeIcNZBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150199

On Tue, Sep 15, 2026 at 05:20:50AM +0000, Kuninori Morimoto wrote:
> 
> Hi Alvin
> 
> Thank you for your review
> 
> > Normally I read a function like snd_soc_dai_steam_active(x, y) to mean
> > "is stream y of dai x active"? We also have snd_soc_dai_stream_valid()
> > which has similar semantics.
> > 
> > OTOH snd_soc_dai_active_stream() sounds like "what's the active stream
> > of the DAI?" (which of course doesn't make sense; could be that both or
> > neither are active).
> > 
> > I sense you're trying to "namespace" all the dai->stream[dir].active
> > logic under functions named snd_soc_dai_active_xxx(), which is
> > understandable, but don't you think the following is cleaner?
> > 
> > snd_soc_dai_action()          <=>   similar to snd_soc_runtime_action()
> > snd_soc_dai_active()          <=>   is (any) DAI stream active?
> > snd_soc_dai_stream_active()   <=>   is (given) DAI stream active?
> 
> Yeah, agree.
> This is maybe because of my English-skill, but "active" / "action" are
> makes it more confusable / non-intuitive.

I agree _active() <=> _action() is not an obvious relationship. But the
_action() form is just an internal thing to avoid code duplication in
snd_soc_runtime_activate()/deactivate():


   snd_soc_runtime_activate()               snd_soc_runtime_deactivate()
            |                                           |
            +----------------------+--------------------+
                                   |
                                   v
                           snd_soc_runtime_action()
                                   |
            +----------------------+--------------------+
            |                                           |
            v                                           v
(A) snd_soc_dai_action(+1)                    snd_soc_dai_action(-1)
              `-> snd_soc_dai_activate()                `-> snd_soc_dai_deactivate()
                  component->active++;                      component->active--;
        or                                          or
(B) snd_soc_component_action(+1) *            snd_soc_component_action(-1) *
              `-> component->active++;                  `-> component->active--;
                           

[*] snd_soc_component_action() doesn't exist yet but I guess it will if
    you proceed with your series this way.

(B) this path is only relevant for PLATFORM components associated with
    the runtime, all CPU/CODEC components' active update go via path (A)


Since it's internal, I wouldn't care too much about the naming. It could
also be snd_soc_dai_active_update(dai, +/-1). Or maybe _push/_pop? But
even as a native English speaker, I think _action() is quite fine.

> 
> How about this ?
> 
> 	snd_soc_dai_stream_count()		(= snd_soc_dai_active_stream())
> 	snd_soc_dai_stream_count_update()	(= snd_soc_dai_active_action())
> 
> 	snd_soc_dai_count()			(= snd_soc_dai_active())
> 	// no _count_update()
> 
> Not only DAI, but Component/runtime too
> 
> 	snd_soc_component_count()		(= snd_soc_component_active())
> 	snd_soc_component_count_update()	(= snd_soc_component_active_action())
> 
> 	// no _count()
> 	snd_soc_runtime_count_update()		(= snd_soc_runtime_action())
> 
> Then, we want to rename .active to .count

I would look at it more from the API consumer side, since naming can
confuse driver authors.

Most users of snd_soc_dai_active() just treat it as a boolean. By
changing it from "active" to "count", we would be advertising the
internal reference counter, which suggests to the author that he/she
should maybe care about it. I don't think drivers should care about it
though. Especially for more niche things like DPCM, the reference
counter value can be surprising.

There's a few cases where the actual integer value of
snd_soc_dai_active() is tested, but they all seem a bit wrong to me.

What I mean to say is, maybe better to keep the consumer API the same
(snd_soc_dai_active()), and instead consider whether it can be removed
from the public API altogether later on? I think when you are done with
your series it will make it much easier to analyze the codebase and see
what can be simplified!

...

Just a few observations on this snd_soc_dai_active() stuff to explain
what I mean.

As best as I can tell, it's a marker saying that the DAI's .startup op
has been called successfully. If it goes from nonzero to zero, then it's
guaranteed that .shutdown has also been called. Nonzero is also
equivalent to PCM .open having been called, except for codec2codec where
there's no PCM.

snd_soc_component_active() always follows snd_soc_dai_active(). That is,
the following condition is always true:

  !!snd_soc_component_active(dai->component) == !!snd_soc_dai_active(dai)

snd_soc_dai_active() is interesting for drivers' DAI ops. It's used as a
guard sometimes in .startup/shutdown to check if substream-independent
work has been done already. Another common pattern is to guard against
.set_sysclk if a substream is already active [codecs/arizona.c].

snd_soc_component_active() is interesting for components drivers' power
management. You see it being checked in .suspend/resume component
ops. I'm not sure if that's actually necessary?

Personally I always found it surprising that DAI .startup can get called
multiple times on the same substream. (I think this is just a DPCM
thing though?) Unlike .hw_params, here is no new info to act on I think.
So maybe the core can guarantee balanced calls of .startup/.shutdown
per-substream, and the guards can be removed. Equally for .set_sysclk,
it's mostly the machine driver's fault if it does that when the PCM is
open. Along the same lines, maybe the core can help here.

Some of the substream-independent work of DAI drivers' .startup/shutdown
probably belong in the component_driver .open/close ops instead. This
would also remove a few of the guards.

Just some thoughts here. I know we were only talking about naming and
don't mean to derail things. But if you have some input then feel free
to share!

Kind regards,
Alvin
