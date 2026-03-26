Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFC3BED76;
	Thu, 26 Mar 2026 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520221; cv=fail; b=alYh4y2OAZxss5zl9GRSthZLi3vx4GS5eLLNePAs5Y5oiHUo72BJJ8Ht7GOGZXZVlvTyu0Os5qui8GKU8T08BIvFy9k6wka+ZpXigFEfFUvnamkFO6zdXuUPaoYp8Ff2Yxzz7eaQxnDoaUfiseJzpOy9oFszBFnX6jz86PrOEj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520221; c=relaxed/simple;
	bh=pilb8s7sbnTuPU3s47Rx4++qZFsWYQt5pudEJh8t9Xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaUMlWoE+Ma9OS6kaP9eV9SdP8JLHpXIIzyT5LdVS61Uar/DP2RLu7iVwG+Smc/vmkvh4U0lDTVrs/ZLztmYGp/lHTxLo1vgP4difcDt8crrXdU80SCs6GsosheOXsco/OqGEQ+nQOYJXZITiyE7ppx+6S3QPOl5P8KTLW/gB4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Jro1yn5T; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=F1yUTa5E; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Jro1yn5T";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="F1yUTa5E"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5kKs03543812;
	Thu, 26 Mar 2026 05:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=MC+K5eyau6pv/iua21dxCN4GJA9v5VbCflo5B8Gabds=; b=
	Jro1yn5TsvMWiuhzz8SVCC9aR1uzuFfn7HZ6796JWkjsILAhcKCN7Lh9mm6iZq2G
	au3eS/f5+1IUNcEgGevq7S9j6t9C6z6+pXsFGXjkWVdJp9xaFZUbEycVzaLVxJeN
	pyHpVQfrBKlage0fcXtS9UUjcvLc505fPx5hcQ59d76Sptq/nUN/o2VT9LFjCDNK
	OLgtrm9t9pObYuzpfk4xI/pZs4CvRKZ8BGIJEqqj6kygfuUjx9pbQrB/N4148taE
	XjPxnAOEIBLWab7AAB4Swy4ridONcU/exqRAifN//UBwjqfL6Fq14zJ8bSo3EBKl
	f8LmlpXib+5eLOhB53jPkw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020127.outbound.protection.outlook.com [52.101.201.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d1rqxx9st-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 05:16:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tn7ZdrnsHr8Gf78Ty85SvZKCshPFms2eAi9UayVr6MVgHUo82xyF5yH/z374Nn0lDZ9UGxCZzOpTP1RKRMks71kmbGA09O+ngVRR5YyASZ9l6+1uWQ7NSov1+1l/vpBgpEIuszDubFQxBsm/K9K4oIir+2BZ6+uzqPoCDFObaAznBPIWE/AnhXD0YitbA1j88dBrnBuW1CmBVJdE1ISXphEwtTNikw8dJRLmewiBwubK1jvtQRq2I9XZF2nwAl5bjbtMRy3riLhQa81IGq5vVX/759+fSwRKV0SaMIE6aUieawBcl4nuksd+E74ZTSA6/r+dE89Ziz7tPkhCHTlK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MC+K5eyau6pv/iua21dxCN4GJA9v5VbCflo5B8Gabds=;
 b=Mh5cYNrxMXDoVDYF46j/3hEWWXthF1bM2TCKRH4X90iU6rWAH56ulZUYb6rBYlS/UAw/yw3SXXwx1KvmRwL+UdS8xcbQ9+jKnINYos6EBAA3T7Zvs7U6br4UwrMJ3s5UULASBcJvMOxtxGM40npUR9UpcAl6/RmXk87H1z/Yxw6wE1t52uXJwEsdCD4jpdAYKIvfK80QFswKymhTdKTETu6BunoJvhdXuhvGLFTNpWNmflHOCUIHiYHcIId69royjprulzk9gVu9AJGNCOMKaRts4xdLV3EA/uN7QrQp1HvUWzIAfwy1PCigDyrueK1s92MS3PzAIAca5PvjBBcBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MC+K5eyau6pv/iua21dxCN4GJA9v5VbCflo5B8Gabds=;
 b=F1yUTa5EKMmei6TyIkFosMd/2KZbuM5wr/BMI+/rQvl5Ios0PM89CByTcthM6/I1IbGeCmNtoaHTWqWnlOt/bOp1GKbkBBxqucfPzjiRqepLBixlVuv+C4GljI4Eyj989a89YDBG3xqrwRP5qc/JOZQfba9Fo0JMe75Grv7mrl0=
Received: from SJ0PR13CA0195.namprd13.prod.outlook.com (2603:10b6:a03:2c3::20)
 by CH3PR19MB7188.namprd19.prod.outlook.com (2603:10b6:610:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 10:16:49 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::fb) by SJ0PR13CA0195.outlook.office365.com
 (2603:10b6:a03:2c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 10:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 26 Mar 2026 10:16:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6E0D440654A;
	Thu, 26 Mar 2026 10:16:47 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6080882024A;
	Thu, 26 Mar 2026 10:16:47 +0000 (UTC)
Message-ID: <99f88e55-ea07-4b19-a0b8-73fb22c2c3ca@opensource.cirrus.com>
Date: Thu, 26 Mar 2026 10:16:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: cs35l56: Allow factory calibration through
 ALSA controls
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260325170841.1405368-1-rf@opensource.cirrus.com>
 <20260325170841.1405368-3-rf@opensource.cirrus.com>
 <6e2d8ded-00ce-4148-bd93-aded513b9f30@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <6e2d8ded-00ce-4148-bd93-aded513b9f30@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|CH3PR19MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eec734f-42f5-4005-568c-08de8b20cae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|18002099003|16102099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Mr9ZaJLYb9gykOKc1C8hYOrBxPaEH7QMrPBTgM+phNL9sVPDoz8Qy/+5FDiyJK9ZKHoskm0tFL4d/HoFwncCgBU8CWZEpt00rhkutDphc10l2fUUOQOJEskwIzSx3SLG//968m3KW1fRGEOR8cXSMXQZlLKCdpgJNhzKNBoFVkPuEjcFOjHWvFdiFzSRc5dZOZwp7VTFhgsXBmjAjBe0e9xQXw+97kSS564lR8cyNPFfdogS83v5LXlNBKjCh6+yFu+ALo1hh3Aik/bTf2LAsP9vQI/NuwV3LiGWuLi6mxKibkaTl/02XzKyIWhcpfaqTDsqCxIwh2fi4wm2GjofXssPSQA5BhEm+Twsf+Q7wJ4sr9zxfEaBhBGtcrfLzBAsumCPQ5DwLQzCF7tnu+TytfENRVAtQQJ1KiMRrNhiuh/y0L9J0VU0gJDBZYKjBMJtPdVLK/Ccj0RrtvSbRav9RXRICd32T5IyaE9QLHP1o5DlOho+UxxJMlAcqa/rKNVD2AGAt6kBJzXo0SGY0cjB1bJB/4eCk1Opt+wiHfmmnTrH4vkZ69WYlXSo0APYsK+FH76p/XQvObStX6W8eqpI0gR68Z1oVB5Aq1FGYIN9oW3j8TSvNTNpKIyNRlOwC0VLBuwLaQANZxdSPfQPCsfKGyagh/bcpPC2uNdy8gd2Y1icoWY2XjJiypnqgVtUqa5Z+0L8B42usvfCGRIAcgynU6EL4mgfZEQK7h5pcnLHzvodCBO7iQl8/YSO2WBCD8suW8A9azrCTooD9XPnoTHICA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(18002099003)(16102099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yYt1Qn2YRn+dfQWqtbTLbq/gUXaKh5+yR6rJG7w/Wtig8K2UhxPIs+MVqSCyrxjZAxui0E75MFBHxe3qJxTQFdXxnGUo5gsxNUfSLwVC0WXN8OpzHRC3miaNRPC9Q23IljBvocN/UwHH4KD+brsWtjYBUiE5GBMz6iGh0YaUou0Y2E3LEtJ/LqMVFycWUQEXgiPoX7JTb8PO1XDFf5m7xmVTzC3n5ZHTU3WwlRpeJRtx7g1YGb7nWrvhSE8Z/V+JjJWiUG6TTBwLPxPuki8hItEdhYtnHsuscO3nqvz7BX57wr9BfgR8Zw3ZahQGXsA1RIsHv8goqYXOhQAbsVeadRzeW71PqWuTJAsXyRe+LzFEwhxabRpSVFAsmfknxNofqLrLWf5X217eYdgoy3vtUWjr0QdK9CQL4i/fqc2IXWSAcLo13p/bAXA3QXL46HwM
X-Exchange-RoutingPolicyChecked:
	YaOYjxBd5bU56dMKAS6v4maabP+tXo2YnB9v63jMcJjIQXlzJazlOoxuEPgX6AT0guvvlA0YvaSBpEkn43xm/0zozWe/TkjDA/+VdX1TNqUEtSzui6cSXy4BtxpO9CbcmD9nxLmJKCf0wJyszJa3Vz32ptGpjnqIxJFDIYtCR1uUbh9rZ/Nq+aqEt88qoktK4eaOAeIaSxNVSVaOK2FjJ1xisPmY8smwAORR3YGRSzyBlflrf3vd6Xh+HTTrBZ2sPaAbLvnxl/ej0Vxi3+rklzoAk/NNvv9/22zXOBjg3K4GcuOa7bDQHI0U2imY2Wlx1HZmfzxLREBjobS89RFabQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 10:16:48.9228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eec734f-42f5-4005-568c-08de8b20cae9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7188
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MSBTYWx0ZWRfX80769EOio3CT
 MdqBL6O+IJbOQ3EOeY7y99o94OVVDNaGDG8LAGYi4xkusoAXcTpfLz0OD/mxMGZ67CLUOJ8KFTz
 4VTU2KuPWTC12TuaRiQaGX1A/8W42I1+p04TP9zoRMLD8Tdn8glDMiZrth/PVUmX6HjkMV+qSsp
 0z5Sv2qQgvrjuQVdpX3eHm0/DyuUX7zI+g2C28JzffEBZKsm95jW3gVnaot2D6AhAZYL/HEbOTu
 vxTVsCvpB7vYinb12fU2sAP8MkTSLQj8lW+ZWuR6cHZz64akvLjWc3V7IClgIkSOdPrCefLY7Jr
 JNx5jpy4ujCfSZ1wqTsYhW3mokxfAwMrouY8nT4gonuCo8t+FDdtHJgkvNRM0+bb3IakjDKNHeT
 VAyxSTOFLgtjm1yy+nDr1+bGXNDSL7NzjCi6rxaoI3cP9Q5M+C9O2mkoxFvwFkhj9sMBlFjbbmN
 1UV7u5rA7NNWm5oAo/g==
X-Authority-Analysis: v=2.4 cv=DKiCIiNb c=1 sm=1 tr=0 ts=69c50799 cx=c_pps
 a=PudVcg9mnr0bxBTXJVVJTw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=cOLmr0QijxD75BRH2P4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: LL5c_3g_UIeaMmFzXHoF0P-3nV2DWVbc
X-Proofpoint-GUID: LL5c_3g_UIeaMmFzXHoF0P-3nV2DWVbc
X-Proofpoint-Spam-Reason: safe

On 25/03/2026 5:53 pm, Mark Brown wrote:
> On Wed, Mar 25, 2026 at 05:08:41PM +0000, Richard Fitzgerald wrote:
>> Add support for using ALSA controls to trigger a factory calibration.
>> This is protected by a new Kconfig option so that it is only available
>> if explicitly enabled in the kernel. By default it is not enabled.
> 
>> Factory calibration is normally done through debugfs files.
>> Google have requested that factory calibration can be performed by
>> repair shops. These repair shops only have access to the standard
>> "user" kernel, which does not include debugfs.
> 
> AFAICT this doesn't have an EFI write command like the debugfs code does
> (when you write "store_uefi").  I don't mind, just wanted to double
> check that this is desirable?
> 

That's correct. The Google devices don't have EFI storage, they will
use the CAL_DATA_RB control to extract the calibration data to save it
in their own persistent storage.
