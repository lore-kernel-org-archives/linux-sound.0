Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82982DA76C
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 06:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780380177; cv=fail; b=MDx8S2vHqF96A+xgvwGy4w68fjirZ7nhehsmMOFtTyQnDyPlB9nGFN/mrwwoC/o9xjMeG5o3GfukSwQ2pls6kCdB6FXSkAQwExonb1AsFe0RrIawU5z4PlWt2Er+kTQ77x3pqG2cBWfgP1XNyJ0K8Ocsec1JAA5S6ueMtf9+26Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780380177; c=relaxed/simple;
	bh=fQGRRdh6tgA8OS2hriI0QDxsyOkSZciBF/XdrXUehFM=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=pzR6F4bo0/5+6FFV2MFiI8XnJPy9Vsr9qjavq7rtH3nEQ6CmrRfyDxja60lsFTx7EpVozbCHZ55WbWQOVTAkFQhb4fiV+v9ANqJP0Bcudvh0dpizEyU3b39d69uSx9BKpaymjNLoDRiDjCHiB+46Kp2tCO3k+qMOLmRvXEIE6D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=abGHZLdn; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="abGHZLdn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agM2mFU1odq/lwcjN3Ln4XHbvLOjePPM68Jm6uBUA2/jYA72G7WruJFvXgHA824hM0MiSUG+5b6bZY/TJ/2ELhy6Raqgrg+MGRIUXD+ZPej8XZHoG9c3jqN/qwjpso7AFrnInA2CZV9+EB9PEVzG7QuLFSiCOp39YrAn6kcbOe4WgFMXIwAfda3LXHW7uL1unU2Ub1w2Ue1E/wg/Yp+fR2ChD9Um0N4V0J40nUViixDClo/tekSEsa2GHzuMagsop9JHQvG7hivk+gYnnoEWfHSFAdL4q0UmewxDTv116KAExUNu5pCOp4Yw4wTMwT1qIOu4XMJNNHRevBJlHWzzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwSGCC8jGeG+2qEQdNjVaEUPvL06i3RoVXDrify0rm8=;
 b=cr1ObMhj31kFWK8Zb2xABs7blALKuoMKQLedJoTBDkNxxLxsHIcgeS2hlYm4woyUDGHbQzWmFRbpwhSQmWidTX2Yw/YXl3jR2H+dfM4v/ZYdHfjbdbi6n/W9sRnmhcN3TUipdAyRSrgYLUpymW/mS6/oDt9cdKOBc0oQqivrXfzLVAXk+VaAKHPmQ18sd20P2JQMUtTTX+rnG7H8kCdIVZjlg8ZIDfTWzCMjNp+gQoGj/wsjysWd+eZcJRoOrVh9gGhVzP7+aEu5tlZ3caCI+ihvo1HjXXqwFeIdZ6F2n6p/j0errzUe5TNYlk48wGGD3tvgBB5pImSqg9r0J77xbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwSGCC8jGeG+2qEQdNjVaEUPvL06i3RoVXDrify0rm8=;
 b=abGHZLdnh/kuHA6KuBAkAjsoZN/WbJ7pHeJpuPUygHeDrooMQj9Uv90W7xBZMRl+6EwJg95C3DMaFh9LayiTfGwPBjMfLCx0qn47CJb0MAqEmx6ekgyp4L2RCwZ6nMecSFUvXohO71K7g647X7EGUDfYHdYYS0VatI3P/jCOypc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10854.jpnprd01.prod.outlook.com (2603:1096:400:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 06:02:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 06:02:52 +0000
Message-ID: <877bohjx84.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Linux-ALSA <linux-sound@vger.kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	David Rhodes <david.rhodes@cirrus.com>
Subject: Question about component->name_prefix
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Jun 2026 06:02:51 +0000
X-ClientProxiedBy: TY4P301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10854:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bec6e8-6cfc-4aef-06a6-08dec06c94d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|56012099006|18002099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	Z99FgwTAcZeHe9sjf3Y7JQ7ag0IKMc+qr7UuG3s1H4iTXUC3lYJZ8b5OCu69vfLdk74OC94oUvJVYfCvD3kIspsTtJGXt2HRSwuprsb7dOvNAIHUKNgINSksLytxfcb+9VE1HgIcrd9w1rG6cqrt6pLJz/swnQfh3pic4pXMeT++NWBPBhIp26tgfTvxbElqJHSmWA29PPBRFIVjc50uYs4iv9OvzfvXWaTNKONTGj1HCdr1jx7iWa5VT4fVkrcsQEjR4m+Jiz2XCNYOHpaEYA+JtJIuw3RqGbrwf6fu3xLI1NvSSPjT72MPwq8q4JuRmytosLW4VnQrqITJnh0gdQc2W+jyz87UtvwteA4R2tfKFxyWbmUVRTTPsKfjVUySjaYRK9/kl6XKVGyZW9rwjrH7jLK87YrHHBCduiBfzhQG8uLmHldJ+q0ZGZjSzkDQzgcd2imxXMwNcB8H3F3rG2fY79o7qA0Jr5/v1lPQgPPmPHdztyKK44B3eSGryB6tS89XAlw+ENNmGAFK1fI7708u8GbIH4kVTVWIKgRXmvXr0cPIc/iNyVbYx9rFYlcHXMuuYs9F0PTUAMJzuC/irfWGSoFfQGH72RL+IxRxPRl396sBu5mgTe4cm/UDjdlnPk2D9UTR8NXMFc1JlBmKjJpENshxDbwR7jsGUpGbRTKEZKKZucWAjv9PzlT2FQRyQgD+XO6YLU/vxDI0L6xSl/XuPDR1ZqcwtPFnv/pj3K2BYeAtM4tL+SxSKVH1v5Dk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(56012099006)(18002099003)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nuQXsxkGGZNbaa+Wcgz13XEYB/G22G3dteeOVWgTc5DcafcmMIyij4NHnnf9?=
 =?us-ascii?Q?OdBxHkVr1gl6v0VJD3PHSrd/bROB8cd1wDntSRDtw6GoBDSjuTRto1JT1WTj?=
 =?us-ascii?Q?ayJ2Xac6sx7wodqRt5+7Qy3CchIvnKHLF32pebopjfQoR5szuSFTkb7bsGAD?=
 =?us-ascii?Q?hNTIaJMMtKntPszFLDwERP5AKk8Q7LSQ8XLSXkdYkwpLJQ1vBy0fTc+yRGg1?=
 =?us-ascii?Q?I0AS1uEeQdXLxG6w3bkWCWdefRPlAr+7umqSbkwsIRxnm8TKaapSUOCnIL5W?=
 =?us-ascii?Q?CXOezuFohR18KRL1R7T5pvu4pKYKKPso7wGX0b5TUKLpmIBfzztchxR5btAP?=
 =?us-ascii?Q?hKvn3gFfyVBOo976ga98XSRl5wnmjAT9wROxQ5PIGjU/+L1BVtBJ4Altw+st?=
 =?us-ascii?Q?E8IT0USwcnG4wFfhRLVDuvTYibynF3cr3ZCuwEc/jWiL54eeAu8rJDVHrn0j?=
 =?us-ascii?Q?2uQaQDmpp4Nh82gDV2+s0nmHJ+lehtpSP7LqkedBQCTkIaqBesZBY1ShVMis?=
 =?us-ascii?Q?JfLj9jFvolw6jeChuTr3fCsrePKVHA5C5fzhHYqeTIlZtgDDUc6qaF4Ob5ps?=
 =?us-ascii?Q?uf2tVyMTDGzTPSyuM3/VGPLLVqtLw9R3flCo2YziM6crs8uI31ST7HkN5m08?=
 =?us-ascii?Q?Bc2IY0e99gpKzNAbuAsY06/8lYxOs4JIJ3L1qshZMf4L841/hXxIAI2F9hDM?=
 =?us-ascii?Q?I/S7LgPNr3P8emW7jDlbV+CloEMnp4NBtYtwLBKbHH0Fv3Gabm9VtkiNXkSc?=
 =?us-ascii?Q?s6uZNKDo7UXegwPYcuKr+K81iKJpC/GctKfQRewI/oC2g9KH8hCqFZD76hhn?=
 =?us-ascii?Q?CbyvjT/QdOd0Z42qkaPTAkiMulIQAGFHcAN3v43F8upHGlUymajGgACQZDE9?=
 =?us-ascii?Q?dVNLyc9uS9/VKu3RDDDOOwMpwb7P+6I6NPkHiD2cn/QROajm9dg46ML/LM61?=
 =?us-ascii?Q?Yfd6GYIS1zW3dosGVHmpiyXlNyBykm4ny2EoGi3NTvndq4yCIVBYx3pl132Y?=
 =?us-ascii?Q?amXzerOdGb/pTR5BIwT/KUjRcQ2Ts5cyd3gUfsWA+hxPeaEmJmpDOTvC/LsI?=
 =?us-ascii?Q?Nx7r9QtP3L7r/2zKT8S9eIjbV91nTXJsevpubzrn/oz4H2mWs3gCAGtugnYj?=
 =?us-ascii?Q?vUXdK/bOoGurjhkiASlxUcr04NwQkjKRddanb85ra4oJTsaQfJkrhp0iw4Yc?=
 =?us-ascii?Q?sBiWcYoef54VXNeDnMNIzCHsdMyiuFn2M+58qMHQlX+vP1ujOcINZVCVPA9z?=
 =?us-ascii?Q?+PBTcdhzI4Q52MFQ6U5iigOqLynes3iF60vtFEvmTNJ6zvvu9rukGBGqPTLq?=
 =?us-ascii?Q?8ne3gnvA+JUpuYdHhmnKdL1W1af0VtjveZJyxdMwxd3aKZtSW57aiaUzKvxg?=
 =?us-ascii?Q?QwrxJpRPonwMTsRPLe8E098aSCHIcA3UtRKL/FZ9a0dz+iWV0CQoDG6qqwtp?=
 =?us-ascii?Q?/TjCipxw67tB+kQmRiVai074mk8x2ixwajD7vCdjbDnPUUyRPwnJODA8UEoj?=
 =?us-ascii?Q?1UQUNX4V/qqAzyJ////AW1CjXdy2LaRXAuuCszB/IG5KUd/Sj7U8lY3GPpmf?=
 =?us-ascii?Q?tYiESc7UrHP61qZVhnLNoR/6WbFnCQqp5Jz6A/mCDZ5LKYXfPeSH0V4AAP6b?=
 =?us-ascii?Q?OyEVE1bkie1vldXoG1oTN90/Ox4gY1RYy0FhhkMgoIT9hIP0BM1ej6GQ7coN?=
 =?us-ascii?Q?ifvohQDvvwV1gA0n13FaRMeaFNOPDuWp/agLAUQECpjrLkM09PEW5CDjboMR?=
 =?us-ascii?Q?PgZNVeGZA6DW13mWjLnV6tpv5qpI4REUs3htaWLTZgZxSp/mVmqD?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bec6e8-6cfc-4aef-06a6-08dec06c94d4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:02:52.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iixyc/Yc6woub/EMO2Util4ON0S48cBBVxWIpRDKi8H85lxR3JoxWq1sdW35duyg6B9SzF/otmbVfuQD4lbdvtfNkKnVH+6PHlO+v3PSvJ2tFuY9xbKlkEkiqIPRoiwJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10854


Hi ALSA ML
Cc Mark, Jaroslav, Richard, David

Now I'm trying to cleanup Component, and noticed that component->name_prefix.

Basically, component->name_prefix is set via snd_soc_codec_conf (A), or DT (B).

	static void soc_set_name_prefix(...)
	{
		...
		for (i = 0; i < card->num_configs; i++) {
			struct snd_soc_codec_conf *map = &card->codec_conf[i];

			...
(A)			component->name_prefix = map->name_prefix;
			...
		}
		...
		ret = of_property_read_string(of_node, "sound-name-prefix", &str);
		...
(B)		component->name_prefix = str;
	}

But below 2 drivers set it directly.

	sound/soc/codecs/wm_adsp_fw_find_test.c

		dsp->component->name_prefix = params->alsa_name;

	sound/soc/codecs/cs35l56-test.c

		cs35l56->component->name_prefix = "AMP1";

Some other driver are also using it, but is just referencing, not setting.
These are the only place that component->name_prefix is set via non-normal
method.

These are using it kunit_suite, but I'm not sure detail of it.
Is it possible to set component->name_prefix via (A) or (B) ?
Or, is it possible to set it via component driver which is not yet supported,
but if I support it. for example, like below.

	struct snd_soc_component_driver {
		...
+		const char *name_prefix;
		...
	};

	static void soc_set_name_prefix(...)
	{
		...
		for (i = 0; i < card->num_configs; i++) {
			struct snd_soc_codec_conf *map = &card->codec_conf[i];

			...
(A)			component->name_prefix = map->name_prefix;
			...
		}
		...
		ret = of_property_read_string(of_node, "sound-name-prefix", &str);
		...
(B)		component->name_prefix = str;

+		if (!component->name_prefix)
+			component->name_prefix = component->driver->name_prefix;
	}

I'm asking because I would like to capsuling Component, and don't want to
create snd_soc_component_set_name_prefix() for only them.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
