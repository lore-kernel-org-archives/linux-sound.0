Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7A538644C;
	Mon, 23 Mar 2026 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256892; cv=fail; b=b852kiO5gvnucBR3fvXHtK/P8eWm2OryC947/Xk3Mfc8J32KOIauVu20LEtXJDN2SJ4ZnqReFqa1FMqQP8ajvOwfUd5bpghXsYNX/exKJrrRo7NkMLG0l9cBhPs7zNpmAwyszR3U+WNqauGaV9WWOy3Nqb6Bu+2z/fwNsPiyjEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256892; c=relaxed/simple;
	bh=9qUzVnO4CP6EKqiPFxduNdpV85UILPVTyRIQ812Wbiw=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=GXh9WAFpvLD0FaYY7Bm7ReBxm5sMUi/vi//VMdw+wLE86pOJL6mLnLYI25tsjRqms2KLALMZSX2bv9cQgilGZY3uhV6VIYZfdgp5d+3+JuhAb2C3H4drLsDHZVykZ0V2hbUJapf/Bz4jhNCCRtqYMbQZVMGcmlY5SzxCoG4WY04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O5tap8N4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F9Q0G5Nh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O5tap8N4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F9Q0G5Nh"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N1NKHR1718843;
	Mon, 23 Mar 2026 09:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=FFs5u/C7yfc0C7Xg
	N0mfzO3ctIxAaGxvOay/DltEsRQ=; b=O5tap8N42O/bwVMEixJvwsk+AjVmAo0j
	h4o1tH3ZZ8DYd82vznL62IfcDRg9xXAHkbkQ2rBY3mluybjKjBP03Yo+wR8DdYWG
	KoenUcDM8VYXr1/jHiNU8viAvaWhYKv/yJRzSku1KU5jWfycvWYdOmGUxEG1OLDI
	6q6X+wSj5irUukhhYKCtOpqRoRFK6HjK066jQMuv4OeYRHQS+JOAsdPGQ/Kk7xCh
	63zpx8qZ7AoxOp1q/FsLeszRDWLVBY9D5uvNtCGk2If26/F4EbqLp9eUEnvM27hM
	fZPVEMSb4VUtNqhEwpkCGNqB99Mz5PdKNEmacOd0DHGo3mOU8RpXDA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d1kfphuny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2026 09:07:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62N7LQ7D012401;
	Mon, 23 Mar 2026 09:07:50 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d1hse8jwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2026 09:07:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUS8fTbHyLN71hMCXGIZ/lVtMejIbRy4QcjkoYsXHk2vW2EWs+QIIqLU2SBmWWwFNoAkksWX+aAf2dIjCUFKKRWGMsraGc55+F6MXdBy7tq2WhZmoZgxjFT8RxofnKGTvSoUi/2Tfb5XB+y6f9dUqaUtitAAqfsPaZCogdB1eMk4PsWhtUujVpuPcVqDlex7mtcgLOziRYVsoaTxk5GqbsppBkMmJauTDrBHPJe5IA5GGPitzjkIBqP27I/ihukPHkrREv8MxsLC+dCQX+ukJje/Lk59vzMrL94cYD3btmsiAQAuhR4E/3osaCdoCJPdiA7iKEHuTlhG4JXlJpbWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFs5u/C7yfc0C7XgN0mfzO3ctIxAaGxvOay/DltEsRQ=;
 b=A3bCp18GIjCCr1dN/fnWe315ax6RrpdasynsNTiyqHqu4IQLF0NhCxp3/slyX7STYYmKNvQr8tXRuD38drEFUhqP7jc1PmIk0VOZ6dcYWjuJb61mP+xpWvHg5c2UPu38CKsCaC3p0IloGBZYVWNMO3iCfrOGDFprJ84k17nEOQvH2QIdjgdk/9e3Oka1J6zyRtg+cPZyG124hx/CBS9ZGROWG4afP1mhPrrl+qGsXPiUS2fH1QEjSCXPBTS5bSLXA+nDwKT3lI89493i6+2P6qYyruTnZyyJy2bIXsMsKLQZdgET692RIuuKN5MZP0BJPsxmka8JRBdrCnJee6Y+Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFs5u/C7yfc0C7XgN0mfzO3ctIxAaGxvOay/DltEsRQ=;
 b=F9Q0G5NhlyPBLKVy5nlvhuRumQfa2vDIxRGOCY54RZWL2d3bHPLH8UjiE5cJhFBH81IbstkyDYEg42H8g8l2ZQ4sd28sjSE3QiDoeJNdlcnoQpfpW/5siwn1075TqDmGJ/JnXptIbdkly1JEKox1k2qiFV/6Mz7RmTG8lDkM01k=
Received: from DS3PR10MB997700.namprd10.prod.outlook.com (2603:10b6:8:347::19)
 by DM3PPF743D15148.namprd10.prod.outlook.com (2603:10b6:f:fc00::c30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Mon, 23 Mar
 2026 09:07:47 +0000
Received: from DS3PR10MB997700.namprd10.prod.outlook.com
 ([fe80::4c1c:3bb:c4c9:8e7a]) by DS3PR10MB997700.namprd10.prod.outlook.com
 ([fe80::4c1c:3bb:c4c9:8e7a%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 09:07:47 +0000
Message-ID: <291bffe8-bb0e-44bb-9ecf-aa69aa93bc86@oracle.com>
Date: Mon, 23 Mar 2026 14:37:39 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: oder_chiou@realtek.com, Liam Girdwood <lgirdwood@gmail.com>,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        smatch@vger.kernel.org, Dan Carpenter <error27@gmail.com>
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: ASoC: rt* codecs: fix regmap_config.max_register off-by-one
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0071.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::22) To DS3PR10MB997700.namprd10.prod.outlook.com
 (2603:10b6:8:347::19)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR10MB997700:EE_|DM3PPF743D15148:EE_
X-MS-Office365-Filtering-Correlation-Id: e4dda4f3-b376-4f54-4ce1-08de88bba698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZNzTp0Qb31OPAz3nJQ6YYBonl3wsRJ0kvWgTNgqE8W8f088Im80CBOxv+klNpjtaHOmnHsw4/oRrWNr5R+GvsSH5Oll8gM6ZVw50YAetBiHrNoG3b7LKNJhZH98PRBq/INq1TjwiTztGwvtWWxaPGh8YFwaot/4RSBIgQWpqfPFJOHfIsM9PNoUmFMRGTC1pqQVCGhrehhhas6JYdS0rzKbRR0GsDi8hj5ZuUbO3Wzs/Vozn7dNTYhnwJBKr3AD0So/0vvZLoli9ALdIDjWdBzV0CYEed1DN/M4KuNsM0CqEP0tucsCAT5mbLgfpcbrlpVfyNmqyf7QQvTVV9PDwVyAfmXoJYQTS7/HMo1vKONPCWLnay+XQPLide5UGwYYHT9b1djujb7cC+A8ZHIn28c2m33jlpXcTUXbd1gh4Gl8etgh0rFHIF7khfY/pFr/Rnix1troKqw9lhW81HhiHlYGhLY7nMw4VNerNt4WYGuOJXD9dV4pICJ8T5x4cRl6hgb8UJ8t9k3/oDButCDfSvyFGS7l3QSb1/hBw+kQWERl5reElIU4O2gPmrGZ7OjcM5X3AQWM/A5TpyQYQJuVsTxkPmIQ11OkwdOJgwGDoGXLMKBhGknMmPupu7xYZB6ZDrAA1FVPA/OKxWvCQAV4L63eK3w7rB3yKoENsUgSKqKdIZNLW6tRBhA+o6gvTTCt/AayuEKme6Ay01hBJ+MCx7xdaYZsH4vY37fcuDy5XtfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR10MB997700.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHpYYldRSU9TNnNDTEtWbWlNV0U3eStuTDZVMDVIU1EvbE84VXZ3UkRoNVJU?=
 =?utf-8?B?dnF3VVIzYW5hUytNWW9GWFlRVXBUdHNCVEE1M3JLU2dTZ1pHNHU3ZXd4S1Fi?=
 =?utf-8?B?ZVB6YXBnTGlCcDNuMFFzTmZLc0MyZVZvbG1QVEVzd3hUREZ0K1h5cjRidVRw?=
 =?utf-8?B?c0g4QkxaUm1RbU0vWllaTjZYRkdpUk9GK1BwRk9PaStoSUgxbU4wb2MydUhi?=
 =?utf-8?B?RHErODcreUhYK3YweEgvSVROcTR4dWs1WGJ4MFE5U1RBdkFrblRCbzN2cWhQ?=
 =?utf-8?B?UFVvUWFtWDJFc3NZaWl2bCtRK1lkdVZPM1dWSlB0bnREY09IYTVFT0wwQzNr?=
 =?utf-8?B?VlpmVjMxTkpkVUQyeUNQaGFxRWtHMDhjRmUxSFllVGdWZTVpZzZLR3oxd0o3?=
 =?utf-8?B?ZDZ6RHdsMDFvbXRtaFZpSFdIQ2pKVVk2UkhJakM2c1N0U20xOEwwTC9hbnRy?=
 =?utf-8?B?RkFta2NlRUZwTmFZamtHakVOaVQyRlh2aDZkWUxJSFZybFlZRHRjbzd5cllK?=
 =?utf-8?B?cFVJOFhnbVdqR0Irb3NiSnUwbzNHSHRlWmU4eVVFZmo4c0gxYkxqT2hzZmhw?=
 =?utf-8?B?VzZUb2NPWFBQL3ZkSDE4REphYTdmRnFkNXUvaDRXUm1ocXJmV0hFaWdOSDQz?=
 =?utf-8?B?Ulo3YTY3LzdpT3cxMk84dXFVbldpcGp2NUlxUzlHeW9JNlQ5Z0JWMVVCMU1v?=
 =?utf-8?B?a2pwdkdNL1ducjBqbW9JNzBPbWY4dnBJOUlUTDhhSXg3OGN1MnVjQzFyZnRh?=
 =?utf-8?B?OEt0VTZBeW5iN0UvUmVNQjBRTUVyUWFOaTlFTlVvOWZ2TjU5UmlzSFlValBa?=
 =?utf-8?B?RnlmSi9VdXQvUittY1J2TFRRT2VIL0pTKzdscm92M2kzMjRIc2RPeE1teUlI?=
 =?utf-8?B?SDIyYmNZVlJ4aXp1cTJnYVZPb1hKbXJLbjVwQnY3N09Zc0hTWWpCRHhwOUpO?=
 =?utf-8?B?bnVHRGpGQVZBVlhubEw1K2dEcjVUcEpoa1VRbGFKeW0veFJHT1ZDTUVnZzJG?=
 =?utf-8?B?K1VJOWNGZmZtRlNWYVMzMmVNSG4wQ2xQRE5QZFNnczQxaFRMa3F6WmtCT2Rs?=
 =?utf-8?B?MkppTjNVdjZMOXhxSk1pcU45REtPNVE3ejFjL0V2MHBLeTVWMzBLejRYSU83?=
 =?utf-8?B?YzFGcnkvU2U1YUdFem9Ob3lzdEttUmVaOG5tUHpuMWgwRXc0dHdQL09FSzIx?=
 =?utf-8?B?bEUwODJocmJpQWo3ZmJqV3ZqKzB1OTFnQ0hrajczcU9wTUNjR0J4OGpiMW1O?=
 =?utf-8?B?aWxSVjVmMEJEL2MyOXRWdjkyQllxNm0ybWZCZEY0Z0F0NjRxQlJOR0lTZVNX?=
 =?utf-8?B?dXV4RDdENEZkcW9lUnJ4YmxnUTJxcC9TZ1hYMG1OVjZuSWZFR1pzMjlmRlpu?=
 =?utf-8?B?NjRhUmgzMElEaUNlVHhaN1RqY1NFR3E3WEVqLzRZNEUzeUJEM0tCK1VTZGs0?=
 =?utf-8?B?WUx0Nm5OYWowQ3RnRnplalljVXE0NzRxNjBKWG54TkVDemN3d2JYdWR0RWhV?=
 =?utf-8?B?emNnRTlZUDFxTm1vbzVCOEFCcXdPZ294b1FvUWpSU1lSMDZHWVBTVGpQU0lj?=
 =?utf-8?B?eTdVanJzSHZPaE90bjFMRTg0cU9SWm1KMzZuUDVkUUlkbk9KanlzNlNaWklO?=
 =?utf-8?B?MWRyc2h2V3oxd0JpRjViTTFyamJhN1pQK0czb2FkQTU5VHc1ZkdGZ0RNaG1v?=
 =?utf-8?B?TEdjcU1zUXJ6UlpNRHNudjNEMkZ0UVRjZFd6ODZyeVFBOXFrdmVHTzRkb3Yx?=
 =?utf-8?B?Znh3dm5JY2l2T2lla2NhaXJSM1g0azVuckhLZ09xMjR2Yyt4Mi9QNVE1aGlR?=
 =?utf-8?B?QVB5U3BCd3ZNYnc5OFNrQnUvV1NmYzJlakpnWGpBeUFqSlorT0lHVlIvckRL?=
 =?utf-8?B?eThyS3JNQnlKcmMvR2VYaWwvZlhEMUY3NHQrTktFR3FlbUhFcmtmODJjYStR?=
 =?utf-8?B?cktXdG8xK1l5RnRVcGRFaVdYQTdnTEgxdmtwOGFMQlJFc2w0N2JYczJrTDcz?=
 =?utf-8?B?VWFLeVlFUTF3Ui9MVndaRkx2WjUxSnZTVnBMWExrekF3V0VrTW1GemdvVHR5?=
 =?utf-8?B?dE11Tm9PN3Q0SHV1aENsYXdwNDhyME04WFE3ck5HcmgrMHN0SkFIeHpUc25C?=
 =?utf-8?B?QmhwTmdZWjdzZnFVWmdDSDV1dXZhbDZad1BMSVhML2t6SW5GZndKMis3b3pl?=
 =?utf-8?B?UEFVWWpQZ0g5YW9TS0xTekZkQjB3MjBnZVJNZjhjdVZ6aGoxVlA5MUt1SUtm?=
 =?utf-8?B?a3hyQitHeEJHWGoyVlc5S3gvNDVPaHg3QmdHV04vVVJUSGN0a0trSnNxM0dX?=
 =?utf-8?B?VWovMmY5RXdaKzczVFhtcktPaGlRbVNZKytVS1VoTEdOMW1zOFl4K3pOUUg1?=
 =?utf-8?Q?57HWw6diTagG+xqq3kSAKyr9Akxhtx0YQF1gM?=
X-Exchange-RoutingPolicyChecked:
	X1523tnTRMqCg0yFfq0hjilmag8SfwfEIrL1lRUe7MYDfXGUP57Wya+3s3PLas049SD4+k2VEYrPgkGIhc5Y1Y4qW7rbs+Brlu8IwtUbu/1esFT8UQIytbq3C2D0f2eiHsCT+w1JvPgUm95Z+4JttGMXSE8tFOL3BdjmQOF9+g6kyrYH/KRAdlaY1KdHy4M+ktjtU0k9QP+BttsPbSyYxFJomVRLl5INh02OZ/degOcl/dJmuyvplJJD2t5vs6R7wG/IEf1jOUTfRkOhIJn+7+JzoPPRIcONTQR1Lo9lK6qPT5MPJ9yUoty2RAyPLKZlbKFKUqGZ7bu4OZpZ6Nz3lQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LHUmOI3BVQIaT0ZOWdktYndB5pu09eZSzBiW8i0Sxezcu6uLlpG1aiLMSQ9l/kyxZszQqctEyaB0ojxYDM5RYq2MoS39gfDycqJIr6cSQQAc/Pv0SnJGTpUli6+8d/rMI6z7z/4LW+ufypG0zqDJ7Z8dJwFGbO719uuNKDxNRdBD6ffBEVFNRujLm7PbOjeettdMcQH0vTXTv49VsSeYahG/7QZSoxpDt67wrJSwD+zV2S9J7cfya5FQ/X7IW4I+gVsPo3jRI2pDp1Bx1um0f+p0PpTwydaxmVROYX2s+7C/m/3E2xhowQFlQ6uBrqZ0R3Gv/0hd8CUxriarCyUJDLPphcQu7+/gJy2nP+i6is2Z8JfIZC+xt5CBv+i6dK24thFnZ4DK6OXAwDmWVXjuz4krN8kgNiBD/mjyULQ4iO0q85jgcNPne3EwC/5pJLbGiHaou57neJ6fwrgJvQTjECdceLlFtMuRI5kvlOBEPN1mGHVU30VQ6TvrOuF9BdKgv0RzKIniU73p4vXxP4ZKDq6JefjL001qQuIMwxHum5WWzNcgYWcrj1vdxRi54lo5Emq4sWEf6KltlK8mD+Z/FgqTXVrhVBNDxDvFq73xEzc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dda4f3-b376-4f54-4ce1-08de88bba698
X-MS-Exchange-CrossTenant-AuthSource: DS3PR10MB997700.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:07:47.0245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZpeiygSpLGqlHRYNVvSFnaAvAwhMPgNIkIM9QeCEpc3CatBypf/DMK/jEqMZpW4F0EC+/Nt24y0/ZvQrShJDEFsR0Pv85S24mDkvw2ZwrMzXY7LssCM29jRLoD1K8tJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF743D15148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603230069
X-Proofpoint-GUID: 0iJVFBVSw68OLaGvNNw19cNZTDLDP_bx
X-Authority-Analysis: v=2.4 cv=VKnQXtPX c=1 sm=1 tr=0 ts=69c102e7 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=dIPpn7l_CigkC1LSca0A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12272
X-Proofpoint-ORIG-GUID: 0iJVFBVSw68OLaGvNNw19cNZTDLDP_bx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MCBTYWx0ZWRfX8NxXyBxwzVc5
 XFUzA9s3oNVFkiDxN/n8F/0WCc0/vlZyhNtVOiJ5JzaTK8xNQ7phr5a2tfzJ2UK/+I0W1ouylkc
 yTF+atfAFdqXmqNT3qGxu3jTPPRQm6mMPf+yMlybKp0jn51bhsrtTOcL5w4Aqd94MJ/8WopXvzd
 KdR3qowc9fpfVv753bxWlsLa0E8aopVT/Engt7OfejPbFtRt1EuyfLvVRx6z6rkFhT171HYdP/B
 wC4wZEUn4T2QTQKovLr4A5u1frMxGws752yoUvjtodKu5Vf97n7Sq/veT6UJxjGWGTI4Oe21exb
 Un1S/H5pXcfkRA/UYfvK21s96a9+yB4/SiT2tRwaMIXYSqCmnyAI7/adLl3djGcWQDy/TzJHe4a
 T98BHtlGKp7pzy8FalXj2zPSNubhIf0fSxddKL4i1YRjpo3fSXwBFn7fUwsjLapZpxIK12LzFzm
 lEARQP1zC3FiQNqceuQPD+f+i+eIMw8lYo5WiSwg=

Hi all,

I wanted to first share a summary of possible off-by-one bugs and 
confirm these are real fixes worth posting.

I wrote a smatch check to complain if max_register is a power of 2, and 
have reviewed the warnings. I think the below warnings are true positives.

regmap_config.max_register is inclusive (it is the highest valid 
register address), not a register count.

The drivers below currently use + 1, which allows one invalid extra 
register address.

sound/soc/codecs/rt1305.c

static const struct regmap_config rt1305_regmap = {
         .reg_bits = 8,
         .val_bits = 16,
         .max_register = RT1305_MAX_REG + 1 + (ARRAY_SIZE(rt1305_ranges) *
                                                RT1305_PR_SPACING),

Values: 0xff + 1 + (1 * 0x100) = 0x200

I think the correct value is 0xff + (1 * 0x100) = 0x1ff

There are similar issues in other
   - sound/soc/codecs/rt1305.c
   - sound/soc/codecs/rt5616.c
   - sound/soc/codecs/rt5640.c
   - sound/soc/codecs/rt5645.c
   - sound/soc/codecs/rt5651.c
   - sound/soc/codecs/rt5660.c
   - sound/soc/codecs/rt5670.c
   - sound/soc/codecs/rt5677.c

So I thought of checking here if these need fixing before making patches.

Note: these are purely based on static analysis and can't really test these.


Thanks,
Harshit
