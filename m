Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9C27A107;
	Mon, 23 Feb 2026 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860070; cv=fail; b=LDkT9eos56oHGnaLibmi2mMCNfuTFjB3MxuUjVHYFTz8fxd1XEoczHtOpTDBANiS+4QxFUcglwXdl1FTzNzQj+o9PMHa071A60E1oTRJejfdjjPvuiGZwPobI13pGiQHPOcPYr7GPEzbnQyNu38mbEeWSE7uOu0kRv9o/U4dKzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860070; c=relaxed/simple;
	bh=fELHmuaSOIhRvkWtPiSHz/RuPsTRWqUiQY/ZkqmK70g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBkp0SZNYERfwJ0GIZeuJlIbgvconLMq15D5G5lVDF6zQ6zdmAA1+dXGNOIe+uv+BoW+YYhPviHYsPXNwUeNhN9dkqGdDxH/rdQY/gbVuAXT/kJkHTtVb/DfvRgLMSfN+IkQv0cl5FVQ0anI8shPPyqOlaE3VGwzij8mOYYy47k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g4GuENIL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jWNcT+PE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g4GuENIL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jWNcT+PE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NF9QVY1991874;
	Mon, 23 Feb 2026 09:20:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=HvJDEMwISG8CVW7fFcNaiUDzmK9OWMLl8GpMcarTSTI=; b=
	g4GuENILdXTYFn7Lc+V+cLrp3Dc80p2bbpqzMzD3vvglQecEP/IrNJcNOKoSDQwm
	xZmHs18WJeK/dGe+l7mN/8mzBfdvKCKio4TNb0wza4lbEtO/TLXbwK8VVhpVJOq0
	WqQqDkCquFUJz6xnqB6+kgT2uDHCXvVhg0yf0HNKgYFCLBShSCQKiu6yovD1qkds
	YYVnLR0keCVg1InCXRg4LeYL+KvQt6t9YJDMAKLW/2S6MiR7rTu5UgOlOOR9xAXV
	LjfJte4NTTSAtgvKmu/lgQ8u/lnzOlCZW2H1yhPbkW8iM9/S4KbmlHjCF+4KZqeL
	+JIWR+p9si3omTYORUXwfQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020075.outbound.protection.outlook.com [40.93.198.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019nte-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:20:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C24cM49Xkrt0X14eqLM79M7t1HOSiqtLKynA/h4LilXg/19Bf/y6cuzDAgdQrdRaMuWE6H5IhbZUHG27CC2IBbS41pmg2wPSGK2OXp52sXOU7PB73AKVGMPmCP+syS0AWMdDlNg/9JEn0YNDXKI3In687u6ILMeO5unpXHDIUdtws4rjeKk0RFPa/pyX5iirAlSD/kiFIhq0CQkC2KRZN/QEq1Ao9uRXRBznbn/nU0MNSynnjl8865pdTMU5Xjfdd/zUS7ajDPwzw3XmgSWJCm2dABHz8g/XqkP4TxRC8bf89IvTrhdnDZI/PorWrscoZ32BPQ1HnamkBxi+atFkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvJDEMwISG8CVW7fFcNaiUDzmK9OWMLl8GpMcarTSTI=;
 b=D5xXFnfyr0Ibc5RKFMsCa33wzDa5wmTuP9nspmZbucW1a+7VR8ApWoExUnekOKfAWl04j3RCDZp1XVSkxJKv9hSBSv1QlVXQgyYZrBB8fw5Kd7KMFPyuuhDPXTtUXy0W5IASzbsCSAC1r/VMdzwWJOmc3k1ndk7gmCq3xoW8ZJMh4594VndktDeclJDMMLGkuv69Z39SuxPkFQUXiEId9mpcr9pTzNXDTq8VjEU/IsG9yBCMzg+ISde4/I2VH29lDisOcWn4/m/MJnOeSkzlCRwfZAcqi+rB6g8vEw2a4gbr7kQVmllTteLSxPnRmLoYZywk90wWr16afTZB3l9Sgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvJDEMwISG8CVW7fFcNaiUDzmK9OWMLl8GpMcarTSTI=;
 b=jWNcT+PECQdmDVKUdl1ly1jvtlKiIAu9lMJo5RecpgtaYHKlB1Ch9V6Kbsvw1lR9j+b3O/i4L+jhE5EujsaqUCmq6F1jghbVB368CcSYFEfZjJ3wr6JM2605e0E93Wk76jDSP9CQ0FAYt3hSkXxFBdC0GU77LrUwNdtrKmjYlvA=
Received: from BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::29)
 by DS4PPF95A59408C.namprd19.prod.outlook.com (2603:10b6:f:fc00::a34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 15:20:47 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::92) by BL1P221CA0016.outlook.office365.com
 (2603:10b6:208:2c5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 15:20:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 15:20:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 48154406542;
	Mon, 23 Feb 2026 15:20:45 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3915282024B;
	Mon, 23 Feb 2026 15:20:45 +0000 (UTC)
Message-ID: <01a60ebb-7478-4738-8094-c88d0d808170@opensource.cirrus.com>
Date: Mon, 23 Feb 2026 15:20:44 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] soundwire: bus: demote UNATTACHED state warnings to
 dev_dbg()
To: Cole Leavitt <cole@unwrap.rs>, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev, ckeepax@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217233533.4716-1-cole@unwrap.rs>
 <20260218180210.9263-1-cole@unwrap.rs>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260218180210.9263-1-cole@unwrap.rs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|DS4PPF95A59408C:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6200dc-f315-4a3e-f201-08de72ef1e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YndkUW9Eb0dDMjY1NjJWdUZ0UTFWMHBZcSsycmNvRmk5dE5jemwrV2o4d1pp?=
 =?utf-8?B?WHNwejZwbTVTbEttWmJCRW04YU9ZT3FSZEs2ZmQyUjhUeHU4TjlKQk84dk9a?=
 =?utf-8?B?Y0RuemlLdG1nY3NYVUlHQ0R4K01YeTF2REhQTTdnUVllNjNmNno5d2JQNXBJ?=
 =?utf-8?B?RTFuYWlBTkFlMk5uNGM0QjFxUkpCS2NPQkVOQzBXNFk3cU9nT0NYMVBkTUpt?=
 =?utf-8?B?TG1zUWtMTGxadThNRkNhQ29tOG1EaUxxYnhVY0dZaXRlbmk0QlhhZkpHTCtM?=
 =?utf-8?B?L3NPK29mUXhFajN3VVpIWGo5akd1UWNObXFLUWR2eU94MDJjbWorcitmTkh1?=
 =?utf-8?B?em1qY1JYOXYxWVN4c0sxUWljcGZzOU94Zkp2eW00TDJDTzBzak82eXdHU0FN?=
 =?utf-8?B?NDJCQ3c3UFpWbGtsd051TkM3UVRJenV3emNaTW1abjV2K1VoM1Q2MXpKS2Zv?=
 =?utf-8?B?K2lSZUd2bVNxSTgzZ0NiRm9yeFh2L3NaYU4va2NUUzFtbXVPc3dvM280ZWVN?=
 =?utf-8?B?aFlDQlYwK21jdHhiNUlQb0lWM1JOR1U2NlZJWHpFMUl2STRwdjhpZFZSZFVY?=
 =?utf-8?B?MjFTbFJ6aEdDS3lPZVBXTDVSdXd1eTRlbjNVbi9oU1Brdy9YTGNLTDlBeWxU?=
 =?utf-8?B?dzJRV29uY2wvdUZ6eW1kWWVLR2IzYll5VW5oVHl6WW8rUWZtclo3bmh6cVVJ?=
 =?utf-8?B?K2lQUzNXOGZKdDdhVnBteHBQYnZRWXBWekpDZEFQWXg2eFR6VFBxdStZbXVn?=
 =?utf-8?B?RGpmL1NoL1VJc2gzR0psQTl3Q2ZzNnZ0S0dMa3pLbzB4MzE0dGZEbzZlRm10?=
 =?utf-8?B?YVJGeVdBSHNiOEMvZkpqc2RHUGJabUdBaXZWTkZ3OGx5amxKMUNsOGpTZ3Vl?=
 =?utf-8?B?a1E0dUQzMkNZU0hPZk0vMjlZdlkzMXRYYlkwMXF4bFh4N1BxVitIQkwraE9n?=
 =?utf-8?B?dGRVYUI2cTA3WFhRc3NVMUhNWVBBVXhETXVSUlBpU3pybTlnazFjMC9QUUo0?=
 =?utf-8?B?RmRlS2RubjhQMXlIUlFoQkpzbEZCa3UzeDRybUhWZHdhUnlwWDIzWG0zcDh0?=
 =?utf-8?B?ajIyOGtsVmlHaXhEbEhhbEtYaUFjUFdIRXg5VjRwS0lJMmFBNTB1RlZUcVhS?=
 =?utf-8?B?cXJkWEM3VGx4ellNNHpXMHFsSGFVK1ZzL1c0eFg2WTB2TmsxRmdBc0FUTjkz?=
 =?utf-8?B?QzhMQllzYzBaQk1zWVNqZmNadnZxdTJVMlJOK1ZxOENuazVTNGJpdmtjUGRP?=
 =?utf-8?B?NVVIa0RYbzBBdGlsSXpPK05qcG1uVDVpQ25sWW9iSWxaeXlDTUxkWGplSTBY?=
 =?utf-8?B?cnZUK2orUnpzSGdSNEovWWRNZ1NydWYyRHFqbG5keUl5Q1hWUlMzaUlPUTQ5?=
 =?utf-8?B?L2tXaG1GamxhcWFGM1JlTnI3RzdGOWFDKzJzNjZ1cFQ0Zzk5TFNod0hRNGlw?=
 =?utf-8?B?RUUyODV1NUk1QWZNQnplZ0F2L0RIOTNLQldqeXM0TEZuOWExc3ZOUnlkSjYx?=
 =?utf-8?B?VS8rSjZGSGhXODJ1OGthRmJkYzk0L3FyVlNrYk5jV2pXK1l1bjkrV2p3NXln?=
 =?utf-8?B?elVJRlFuS3NOSGRXZUx6NUJwOUU1Ym1KeDllUUdUWGdWNkZEcVRQL0NDUitj?=
 =?utf-8?B?d0ZxU2h5b2hrVndoK3FaQVZHM0YrZ1pYQWV0SWk2S2trY0x0TmJjRGZFbmtz?=
 =?utf-8?B?eUxuemVGdUhOT3VvZjBsZGxDSXEzd0pKMmN0OEh1SlF0MzNmemZqMEN3NE1H?=
 =?utf-8?B?ZVl3cFdOTVVSQWpOQmtIazFtMEhqdG9jS1V3c2RJWkxyMExWaWQyc1Q5SEpK?=
 =?utf-8?B?V3VJZXY4a1RFak1RSkpYRmlpdG9hd0w2VnplWHAvYUg5UEdaeHFLRTBmaTdK?=
 =?utf-8?B?eEtVZXlNcWhod2xIWXBsY3FXUVNqQ0U3dk1maXFmeEhhb2VDN1E4TUQ5STV5?=
 =?utf-8?B?bU5FeTh5bjg1eE5naE56S3lHU0lsRjY0MWNPczhiTzJwVXJXTzhzRzc4dmRj?=
 =?utf-8?B?WmU1d0JUU1JteCtIdmFVR0hLUkZyM0FGaEdYMVdNOThIcTF4ZEZzWitNbUww?=
 =?utf-8?B?WlcyditHVkVNM1dVY1JBKzJtNXY1cHZvbE85Ny9RVVA0ZGlEL0R2UzRXY1JF?=
 =?utf-8?B?TEZ5MVpIaDFZUVZHM2FZdklrNmdwTFNCdS93Y1o0Tit3eXdMa2lxOGEzS2Fw?=
 =?utf-8?B?RGprTjIyNUhtOHVOLzFyOGk2bVJtbWZNdWtvVVQ2K0Q2cFBldEgzMGlmNGdD?=
 =?utf-8?B?Y3ZMTHFxV0RHNTIydGkwaTg2WDZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O9f8ZnnxHM+1EoIG1NhLIhm+tlFtuRafWp/5LdVbnCJVij+nMMI0T8qAuttxGPFfdzZD2scIV7oALYqJMzZL/aZO31CzTtEg6rSn2zvQ6FchkIdWOjWgsftKphrKaHFCqwolHjeeo+tmVtdbpxFtS5tP34F4/6JgVZnfU+pfEspiuxIU6S14Swub14YY85+Q0RrH+qAwORaZYEIxSe5zDRN3H9CR86ADxT5C2AflDCCIgNJRv3zMcgFeXNaChLFoe3DUFS7eVdId5xpHtfNxlrPh8S/hvEMnonXPriWUP9CEw9sryQVgtGQXCSzW9FbguRe4Tk/iT3DiL1T8fOZvb+JQJoWFvLznJKbqWhQdRP4lfFqvc2y++5ytAnRKFUaPKphAGHA10CgnCfW8Z7HivQdb1d80GPE/uAoCR4Emytu2d4OUcxQQViZdqFD3U9mo
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:20:46.5582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6200dc-f315-4a3e-f201-08de72ef1e7f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF95A59408C
X-Proofpoint-ORIG-GUID: mA-zir6s3ynl7jFl9BYJPiAnhhQBVg-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzMSBTYWx0ZWRfX1GcPRVtfDnGx
 kYTl5IgzHNWXMSesuzwyNJLWydPV7zCWsszJY0EWzQDPHybGy4q8Lsab2CuXg5qqsDRW6oXShXV
 vNVqbFnEOJNYCOV4MSa8T5gKNCAOLz9LvPFnjd8ERLyTW0o9M2T83lXU7Z17Se+Zc7vVifz2M2C
 2uKwsDdDXj+rEe3YVY8B1JTvsKGDu07tTpKI0Qik1i3O2OwUdxTSnHKotk0Q/Je58fFQYm6H5SL
 pBrP4JrniWeCo1VNkhFk370z9y9IV5bhpBafNTPwUZjhcwhank4U8mCLxeocPKMD75WWRNbxfWy
 QDcTX3Wr2c0+GgCFqAle9SsL+VLcek0FY8t5bW1IlfzuAhf7lBUh8V8JVE5qhK3gwCEQmPVWPkw
 04ltH6jGCUFazyvPKucQYR9XO9TuN0sEuLwKGEJ1LMvpIcx6RteRihHDPqcv48aMZBZVxztBPwF
 NosNITbeesbSRNQFSsA==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c7056 cx=c_pps
 a=ST2n4ODNysMJ8B86qD7aiQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=PgrOx_AxJjJ6jRYnNjoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: mA-zir6s3ynl7jFl9BYJPiAnhhQBVg-M
X-Proofpoint-Spam-Reason: safe

On 18/02/2026 6:02 pm, Cole Leavitt wrote:
> The dev_warn() messages in sdw_handle_slave_status() for UNATTACHED
> transitions were added in commit d1b328557058 ("soundwire: bus: add
> dev_warn() messages to track UNATTACHED devices") to debug attachment
> failures with dynamic debug enabled.
> 
> These warnings fire during normal operation -- for example when a codec
> driver triggers a hardware reset after firmware download, causing the
> device to momentarily go UNATTACHED before re-attaching -- producing
> misleading noise on every boot.
> 
> Demote the messages to dev_dbg() so they remain available via dynamic
> debug for diagnosing real attachment failures without alarming users
> during expected initialization sequences.
> 
> Fixes: d1b328557058 ("soundwire: bus: add dev_warn() messages to track UNATTACHED devices")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
