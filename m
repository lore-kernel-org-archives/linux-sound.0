Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F087272E56
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737139; cv=fail; b=snYG1Csl8vDXhumGBifNBpRvNwgp2Sy4Q3tbmHcMjUewcX95vM4E97IoooC44TQM6ffK9tvm2UuP1h3LzYjV3Gq0qkVGM2AfYeDmn5L1vo+rmK3hwXO7ts95dtAqQD1R+ceLDVGk1TM4ZosL9y6akcKcRVOIeid18viYiMnzLEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737139; c=relaxed/simple;
	bh=zpIz6AJUIrrsAxCRFfR5e67S2OWpnTuLUkZGsCtiq5c=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=P88RguhZc6fNOY2GUGvnSPMcc3qX2zWd1xYhgfNE2lUQOfZjV2NnJl8pT0MhZuQsUOhG6m54kb8fEryjbjtYH58uqZyp1xkzh6kUv0DRJBik2g7YlDlNw013+p8dqp9yPow+0bE0FtoZU7YC7ZrdYfRBX1/S7u8V6wRMMcGcYZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hajX0Drl; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hajX0Drl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGsA0YsFGGzAZyeR3r9IaKJ1Gxe8geF5EFBg+zkgdcEtrPPjn6+/ST6fatOC0RW3QOLY0YG6/xxYR+UaxK1CKT3d0bx7ACL4WFSUA41mZ1PCED/hkScFoF1EqJyDCHL8S2EqxcLxhd9CDgTVRCB9lexlFlCyN14imkkJ3tPpzalKunfK10QyeqAkxhABhHZfXZphRBJU0H6CsnKNYynuWDPAOJ5g4/xoEX1xBJxCadqUx7DwoXytONXJnqMCN4o7MFYCsF/ZCb0vhKnfVtPCLcUbrYLtclLnYiEE4P6a64wGBKqd6fZFjHwOVdwWixfJNxG39p1SQI+5MhCNYlXGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpIz6AJUIrrsAxCRFfR5e67S2OWpnTuLUkZGsCtiq5c=;
 b=MGGAFRSVDYNOpJPKnCDU9DynStFrCGabQQR44ngZ4pPs7pa6cVNNqoIQXMUTQwfKzP7R20Uz0IElH0T4M+wowcfMkd2EPOt9dncuMXEtC+3NspLr10fZ9VB1Kz/JY/VEIApN22ADM3yrYnXv7cACbwfp/MDOiWIms44K8k5d06La80cvsUHWUjBlCuFvuVh/o/iNi34Lt5oGFK3+CppddfGjMrh403q/08ZTnxsB5b4kWp29GBUxJ65ruj8KFDxqs89hMTiBVyKAs6hfWMZEv9s2a1r+tw1IoDuihcYbjz/dGT8lv84TYCL3g2HHXPri/zd248n3OS/cbwzm8nItWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpIz6AJUIrrsAxCRFfR5e67S2OWpnTuLUkZGsCtiq5c=;
 b=hajX0DrldTBAGezroANZblh7zwfz8w/ZC1UIYOWVnygmlLkhytExj1BOa5EwQAVn+GB7VN4lYxYayyuBrr7Z8U3xL5/4ajHZTNL/AAreE/BvjSAk/Z1dh8S2F+APUC1l9cTEtakX4RBGJX7Oa2P9ByhXuWFi5+KpoQMD7dPKPo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY4PR01MB13787.jpnprd01.prod.outlook.com (2603:1096:405:1fc::9)
 by TYRPR01MB16069.jpnprd01.prod.outlook.com (2603:1096:405:2ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 09:38:54 +0000
Received: from TY4PR01MB13787.jpnprd01.prod.outlook.com
 ([fe80::2029:7bd8:d49b:23c1]) by TY4PR01MB13787.jpnprd01.prod.outlook.com
 ([fe80::2029:7bd8:d49b:23c1%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 09:38:54 +0000
Message-ID: <87jypddxw1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [Linux Upstream Kernel Test] Release Content for 26_3Q Deliverable
In-Reply-To: <TYWPR01MB101940CD99D0BB495A79A6CD7B4AE2@TYWPR01MB10194.jpnprd01.prod.outlook.com>
References: <TYWPR01MB101940CD99D0BB495A79A6CD7B4AE2@TYWPR01MB10194.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Aug 2026 09:38:54 +0000
X-ClientProxiedBy: TYCP286CA0165.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::11) To TY4PR01MB13787.jpnprd01.prod.outlook.com
 (2603:1096:405:1fc::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB13787:EE_|TYRPR01MB16069:EE_
X-MS-Office365-Filtering-Correlation-Id: 804e4a8a-640a-46cd-a1a4-08df0355d833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|52116014|1800799024|56012099006|10067099003|22082099003|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	0JaISmqq0Wfse23HgNkVrnEdjPFNQAfhx5QhJokjKrHN2XnaeOIHWsfb5qY/g92YmwabdC90ib22Wd8BS7ExJE8CiXJyOiNYOJ7TeAox/kS7SYTJA5tGZE5qGyWFA2wC/q6n0QjdbggpmXIQPi5Lq5w9+3qJAFSLJXntohpFWWE2LDxWPHHCwhFC7BKuX5JsYNLpPuc6DaWgy6aOJo+ogPeRiEGiaPLRhELoYmNtouS35dWvWoaG73qaUO0X56Qk/EMtQM1dlSO47IxzHEWwwrig0uuxXW1+dU5BI4GohiQ8b+3RY+lwMgW/8uzsKLXEy4DHEKf7zaTUXG5P1vTThcGzwvKB7QNCHn67wY9Ffn8xnjD75XwDTRTzYF5nXMIc3OocJjom6mJiKQ6+ThGzENY4mG6Mz1S2NvKyM9LTjUq3hs1ltz7jW8KZHjJzziP3a6RVSoLZF00ryAq146diTUntxka1IsTe6jS4Ucm4LJMigyr7Lh+TgP+TlVr06/xfb7UpTMsqq+ToWNIv6T3OTh66nxESXpTjthoAHC12fXG0RoTuukJGQAaB1gAPPh484kMMFfPOQSzXkPv4RE9vQPTvncsXmmCJ2uioppy2Q9cKZFUCv2jvH8S/RRe929y15rPQ3yohR7a6EtbgYlHhTXj5z0XNhqm/wFVIR13M9omDjnuwCzj+3hT8DtRQp1suNJBD5sVFxEIQFo19i10Cdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB13787.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(52116014)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2XnbZ6Exds0dIDhy75gJT0uzGnOAccyd+13LcgpBZTPYqNU4oEZu15hjOIQR?=
 =?us-ascii?Q?SI90CoNAoiezPe+rGVxWsEc11+7p2sxwT5S8Xoy71fowldscPY4GOr7qlXEI?=
 =?us-ascii?Q?1C7jdylDDfC90m/m9d4wXlu/VPm2yGgbCNyU6DLDMvYpa/5xlL7VGJQiF9hC?=
 =?us-ascii?Q?AI6fXUYqz6AOt+UTPyX4vRcLJxOcdfem+6WLLpzJgvmmFRpuQuaQXTE+RC6x?=
 =?us-ascii?Q?hL5p4H0lJP9R7gEtrQdibI4sOyvRNCo3x3/6Hh1tLmOScaavHqSLRNoVW5q4?=
 =?us-ascii?Q?Iz316TuBuCgiKt2kZgIGIyDl82Mn0/J1a7bftJULcPmDx8ZywjCYRuZ/TZHr?=
 =?us-ascii?Q?LfPJMPf6iCOJu/zxJcF1nvpfiIRz2e7loUPPCKXiVQuSixKwSqpntsCLi1YZ?=
 =?us-ascii?Q?vfv+VRM5B9IeVayr1Ezg6ZoBoA7wH9VOnFg5SWhVRdVQUwW6qgIcKiJIDlqD?=
 =?us-ascii?Q?5Wr8PFFTFExQieCekPnRzCS1JPvszwwl+yhHFQcOEyVCuC0eiqCmvU75w201?=
 =?us-ascii?Q?sSPFCz7QA8pey2uomz8kfXmUWcRX5WHEuOTo/AFXaaVDhLdIuLeNxRoiH4hZ?=
 =?us-ascii?Q?BrUPVg4n89zHIz5OrV9PTSKwz2rFt71AK71oS/zZ4b2c+UvyD40agYbSda+1?=
 =?us-ascii?Q?wE6AF0p7iY0bdsod33rlL/eJsvmJP+sKbA9R6IisucOowVC7gpN6CNQnzOY7?=
 =?us-ascii?Q?CRSrETMNpxOMDqPFhOusyLXxRagstXwJ11aLP67rWrTk9I/2JDGzv26f7P7s?=
 =?us-ascii?Q?bjLf9lsueC/Q6wP97DeeTjee79ZUNcPiwN3jWq3zpWUBmA1GVk7NCcFB1Xu1?=
 =?us-ascii?Q?yqY0wMjwMaALQ86eKJ9qwN/xYMLE5xXq3V0G4KKlLMCmwJOFwm8Mw/CsQFxP?=
 =?us-ascii?Q?lnmKKHMaQOoJfTVEU5XGuc4ZjFI6l5gN3OW2koLJVYA6xeDB5eVZB7ywEoSs?=
 =?us-ascii?Q?38VM3IhLmP8rCBiagbJXhLxOWmjKtFRWAgb40rZypR7fhOSOI8nNzMdcwIiR?=
 =?us-ascii?Q?fcfRYT702IZC5rLlUXQXKqgFsL5/KLUWKYIi9BqAjsh8iZq6t7iihfpXcpXO?=
 =?us-ascii?Q?fNnKW5E0EGXbuPwIEYNP5AUNIgZ/BgaJHgHqvZnOIT6teiF95XeoLGq6KDmK?=
 =?us-ascii?Q?cQjnO46R+PbByIzS/Q2DJXBZvQxGUh4Kd9ZMAo5rENzLFjB8GY/qcnUnoLM3?=
 =?us-ascii?Q?qWNDSL5F6HIR1Oob8Hl46ny1heGKhe6JSxZo/zG+qJRReVrzeEkLTD4sXXrJ?=
 =?us-ascii?Q?dRtmM1BAknaRWuCKz/+uTGrMHczZfstZjom1RGia8Z5CtbuUjzvoByiDpTr/?=
 =?us-ascii?Q?c1kvYdu61/7gTQBBCKigtsH9nFXyobzIr5AVt5Y0S+cEJrdAyzaLiLpgYLKg?=
 =?us-ascii?Q?w8529WtDOacL14Hl89q/eniTBkks513zbRtSzgjl5SubwQ3ZyXVoghjYIlrA?=
 =?us-ascii?Q?w4ZzIYDyilWRLo/zsjsJYuvCmpKMjnkH2kD3CH3rrn+GeL5fW+oyycfNcl/2?=
 =?us-ascii?Q?mI0R8akgvKR5KBgw8WT6Ba0nO3YrjBS9m6H4ZC47+s+P7sIoq47KzPjsBK7U?=
 =?us-ascii?Q?nOTV0jz0bKyh83LXeeiiSfWHdBbctIHbjs2+c3RHz5FfG1SOb+kgM8wKHo1B?=
 =?us-ascii?Q?VnA69cCbKq+77aGVBfDV2EABHTWPPM0Ahkhrtx566d77dqabis0gDwT/XHL1?=
 =?us-ascii?Q?xoNKkkW4Qqron/pPCedvcUiufVBSQH3mH9eSEdzfT9wF7OOCljBSEDfyP/W0?=
 =?us-ascii?Q?NBK9sBO4HfG1ePvUpHOTzENy7W6wd2HmFd2EWq2EOyph6hWtcLrU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804e4a8a-640a-46cd-a1a4-08df0355d833
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB13787.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:38:54.6152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eyu68SA30wW8gByaTIfUutO9d/Yomy+gDEmMTZr26nGXOdnN01ASHA/W4eLRbYwxEl0Y/grTI/Pqr9JAxxxsFhdgFjd0rJLCzhf/YKa71hTlrSRqQWb/7fB0/jv9pNtk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16069


Hi Duy

> We still need your confirmation of the release content of the upcoming 26_3Q Deliverable package:
> Method: Upload file to FTP server (172.29.138.144)
> Content: 2607-2609-038_Linux(Kernel)_26_3Q

Thanks. I will check it next week.
Sorry where Can I found this ? I forgot it...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
