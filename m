Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777812C11CB;
	Wed, 11 Mar 2026 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243307; cv=fail; b=XyD2Znyj+ZL5aOFEHhqoaLt1zPp01fZOJMXYzLklZhPjexFiWIeKAh30kGjgFUu1Jq8h4f7Clq4aEYmXA0swN+chIpMcc0HD+N0apF6r56cbcSmz3vAF0Pyv7ELnb2bTlc3yPgVj4UZggIwEZDQJSrcIxsDTU4w0fZfBRGf/m0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243307; c=relaxed/simple;
	bh=Zhdtlkm96qEewC7w2N8+mFKAzmvx8GmqKzMzImk7CWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvSqS1cBjpXj6hZ3IxJqiCf6wNadjsYFnw+vPquItUEHjVw49XBJBzFQSJN3a6KGa+puUvFWkqShwtTwEQIIx6aKIe+bJtwZ7PHYbd5zYq3I1AJET/5lnGoR+QK1vAwQQtu3ejN0GCnuKxU86l3XOnXrPGpCpoXYAzglPFxXVV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VNtf7gQu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XAJ4aIfb; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VNtf7gQu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XAJ4aIfb"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5PYeK1675314;
	Wed, 11 Mar 2026 10:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9ttCsw70yeeVrpXEjBs+Bj04kwRp78dvndf6xZxKMSo=; b=
	VNtf7gQujPzuGqup4eF+fOaJuEy5V2Wa5slLB9bxLoHExbMVqPZoeKfwAPTdsIjV
	r/gyXukP/28Bs+laj2VUdngN4vqVrp7rlu61Oreu6hR5Tb5aBNEgJVxNCe9J+lb6
	RhvL3/HJw9P/4TeR91nFyV/xx9M6DnEXrYVl1kNnNnOpTN5kgpHCUCWVllbK/BIv
	0OnEi58Pl1oRdBoFG4LPH1b4+eddeB0E8VdvbC8pF3t2p8+YcV2sqMnQTK8ag0df
	ZfEpT4hP1jKmtG0x31t2L/vCY03CNH+n6CaiVFa7Db1Ti+GpG1mQZaoXx+dYag+B
	vZ9YToaLelyVNhqCjJZ3Kg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020133.outbound.protection.outlook.com [52.101.61.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4dek5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 10:35:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7Pdid3dU07DmOiVxy5QbvvkC2UxgoTRUSw9oioD3scmVqQTE7kE3YRN2sZbxCRZ+WZ5tGukIMtfs4p29DU6tMEzYBr/LMkupaEQgHewnozhJQsGDZYMbnMVftwTlinnlseI9u+8btz1/njo/qZyhv05z2DWMmF5TG5EBeFB29ZeJ3Tp/PqjQRPO3y9skskZevzhkW/xGZH5v6s31HVPCKG5SQ1entim+07K0Ut+T8rqAziy6ATwyjzm5XBRl0YL8Fljih6fCUwhzw8p+d+K/9ilX2M1+tI3Vl9dUi+9DxNzfGQkuDrr+lCJoWFc+WvRWGKu7/ucQMr2zQKqyTIs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ttCsw70yeeVrpXEjBs+Bj04kwRp78dvndf6xZxKMSo=;
 b=TIllW5jVfT4rMqLESfDVATn1u7gQIhfQ0MEdthAZnZdPH/XG0rM7xhVJtUVcWXDSZipLIVK+AjA/D4FF3qn8ZGauOftHZtESJj40WsqkSYRFAFUByoajpUQ1X2JpfuTW7l441n6IcbLQeaqiqfmW0nytk8ufuJua/RFAT710fCZxqBCfNQ8wAQNawz6jQm5/rp16b9/h7zDIJxmMybdwvsOba+tQdPBxOi4lU5krDLpqgS4fE6MZ8NsdS2SSFilUsHlWAjgSxrLpwJXh0q+5kQnP8zjdpl+Hhe3DoCtsXY9bW8uV6rG9TaRsUt33rc5GMvvMwRolFZKugPsrhAOBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ttCsw70yeeVrpXEjBs+Bj04kwRp78dvndf6xZxKMSo=;
 b=XAJ4aIfbVpN83A7+CRHznm3hvkzhHC+TsV+B0NGAsupeLqLZgC/EOCJuLQrJNkH0IXe2aEkGpToU9Wkz++be6igFfy+AkznNKconqA5DflZBWBcHDKeebvNdbVQAqE+9otX3frsFPiB3D5zuuPi6jefpvH531NlOf/nCOIcdnbw=
Received: from BN9PR03CA0160.namprd03.prod.outlook.com (2603:10b6:408:f4::15)
 by CH2PR19MB8973.namprd19.prod.outlook.com (2603:10b6:610:27e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 15:34:56 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:f4:cafe::f9) by BN9PR03CA0160.outlook.office365.com
 (2603:10b6:408:f4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 15:34:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.1
 via Frontend Transport; Wed, 11 Mar 2026 15:34:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CD386406542;
	Wed, 11 Mar 2026 15:34:54 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BE32582024B;
	Wed, 11 Mar 2026 15:34:54 +0000 (UTC)
Message-ID: <7afba327-89b6-49c0-ba56-83da00e0d51e@opensource.cirrus.com>
Date: Wed, 11 Mar 2026 15:34:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
To: Mark Brown <broonie@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
 <80ba7c33-7949-4940-a72c-582ba749b2e7@sirena.org.uk>
 <efbbabe3-b42e-4f54-bef4-d27744f4309f@opensource.cirrus.com>
 <4976ec0c-f4d9-456e-81a9-55fcafa30b9d@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <4976ec0c-f4d9-456e-81a9-55fcafa30b9d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|CH2PR19MB8973:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f40412-bde3-44bc-9572-08de7f83bf47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|54012099003|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9SF4NxMu+CiZAlDlimSyUJ+h0OyASZj46rzZQGVqMyTVCvxqolcK3tq+NvqLVlKVssfFhZXIZXEV+a/9tS4w71ZzSCAZg8ly4koEnXozKV1dfDMkelFUwHz31eamkpwEn/XTkVJQZdXPcVsdaib7nOYU6I89HlIz+LpvHXZ1mCCPuEwYj0930xTQrBAYr+nG6tkUbMmxpVK1IyczKgFAa/MJNHbrFg+JNaszEJaNbx2c8vKwrHqe9k6xhIT2TiRxy5TFovE/YhATkwomiSJC6gxoRj6j9SbHI8PoP8Hv52ANcL+hdYbt3jeGETSuvdmhoHMbiT1vfzoT7GQ4iBrEyTLV3lgFA6NQ0R/OYNoTBCr2v7qveW/gcL+90mkzV5GAUzKapfJ+uEIXHgYw6d++neQisJQY/T8Ahv0zIpI5fPVtq7q4YSg8sbI4iOZHf0PQwaZB2LE0ihyxlsDE2q3p9BnxT3Oev4DxS3BomsBKq8RDHOD31yTZdqPpf8nVrjif8evlT/lS582xj0Aenyjqd0nXDq0fMua7GrJR/AdUh1mdrbobsy553pgvrq0Q3RgFqTdJ48KXNtU8dxYcCoLD7dnMObFwe2kuRU6JecTZfcQ5S/12uW9bT3xP6G5hQ7XSneGutaLRZ7gDay4UnGELRkl4941l/ncY84YA63KWM5bBJoOvJEEhFxxGXeCrT6uSm18ChOsyfUmNG4GVNO+8FbyHxH8W7IAJjW39dZymg7fglVEh4X1dPkHtmBSAR7EP5VMixrlpVMIe5JJfR6nv2w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(54012099003)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	orFDRC20QtwfqE0X/AtKk4nPtHpz088MOmJtDcAIZNpgCF+nTYXilrMtowp5cP56SC6WZ/CsjdNo/8DdA5mjoWdeLXSfYWo8U16exfOrEdYfTsna18avr0N1cBqX0K110avwucT58rKk7yPEzwl2KLWXiTO55Ph5i2vHAk9e3cp1JLItjuCMUmNf8q4G1Rz0nifXDG1E3SwLScD3iP0u/QBb6uBvXjJhT6yS87MeABvkBsAuSbaiqniIfgrkKQBfPidovuiegudSaNWh73OMduEgAY7zKWZoyAc3GCeKoFYFaMNApCKQ0VkaQsRLuqEeB/muDo9Tj8GMcKWP9oPCZEMzFf85j1EPf7MkKmiN63JPpCNAGzQlYl8ybxWgZwvLr3AarfCVs1zcGgR4KzljdOj97Enu3dwZdGc/yeKof2DoZBwBgVvn9iCy9amXrX3j
X-Exchange-RoutingPolicyChecked:
	P+wcE6RsLnL/ClBMYX3xDMFdI+/k0I+J1jndSBF0p2MImT7cPHg3IZ8MlFemii5A+mubdPoUyp9Eyc/6J0q/XZYqXMX5Fw/H2UBGIN7dvFmf4MemGrprn2SYVqFJ85JJthiXSCQrtFbaTgYFczQmrJKvzCfXbieJZNeGoYsmxmZ7QpsdfDM8sEKFpM1tVfYtOsgd/QZHUZlzgRezSbahoVtq5XrLu4IRB389GEVxWhDVUqarkAl7d6JcwvaI/JRhCNexk2uDWiUwAqcIsmu1iQ4nQ+9OI/PVb1doKsH5Gc/AP68EZ5YTFLn9lnjZsCYbX/pbKkId9JDoKozE1cBskw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:34:55.7546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f40412-bde3-44bc-9572-08de7f83bf47
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB8973
X-Proofpoint-ORIG-GUID: MVOKXR5n6kTGNgytkI16Sbt2RXP6xxTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzMSBTYWx0ZWRfX3KUEiOQzb80q
 YMPDf9XIQZW5nmyMaeTvVbAosiBWAeUckuYsmsCrogXQ2QDGkT8AqzVqAD23z9ZfM+Qe8lgVTdB
 Fl4vrwKYz1m2odcBu3ucSIaBAT691WQteTL9zE/VxxvWlMT+8ndfM+ON7kuJrpPVF7rNs2UN/mq
 JWc4qHVUssFZyj4MSbHsWmUu7KRCZHslGAGijVmbdbXxq2PhyYhkTDASXc/TPjW/E9DReXzqbXE
 vAf7E8LDGU/R1YAyguXG4wmgddRnANMPtItDZP3eWTDVstH9ttC5e/+T+YtmdDT3AWrOhaIVSKE
 xRRCw31/QHZmd+LtSoQtmLvaJPMmHV1iQSPAuQYPGNhTLTv7ZkJzk63umGoZNdh3hZSAWhA29RN
 sxaC7zgVyG+Hy5Npx2CN3Gg2Vu+Dz8zmleosnY7Ce5do4am4KJl7256QBvUjuHEviMMJwdmvYeN
 igjoQeiGdPnruqxP/dQ==
X-Proofpoint-GUID: MVOKXR5n6kTGNgytkI16Sbt2RXP6xxTU
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b18ba5 cx=c_pps
 a=3l++41Tsbfu3Vy6U+n14cA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=cGNWyIi5oyE51FHc1S8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 11/03/2026 3:30 pm, Mark Brown wrote:
> On Wed, Mar 11, 2026 at 03:17:16PM +0000, Richard Fitzgerald wrote:
>> On 11/03/2026 3:03 pm, Mark Brown wrote:
>>> On Wed, Mar 11, 2026 at 02:21:53PM +0000, Richard Fitzgerald wrote:
> 
>>>> +	ret = fwnode_property_read_u8(dev_fwnode(cs35l56->base.dev),
>>>> +				      "mipi-sdw-clock-stop-mode1-supported",
>>>> +				      &clock_stop_1);
>>>> +	if (ret == 0)
>>>> +		prop->clk_stop_mode1 = !!clock_stop_1;
> 
>>> Should this be using fwnode_property_read_bool()?
> 
>> No, that only reports whether the property exists (it calls
>> acpi_fwnode_property_present()).
> 
>> The property can (and usually does) exist with value 0 to disable
>> clock-stop-mode1.
> 
>> I copied the use of fwnode_property_read_u8() to read this property from
>> the implementation of sdw_slave_read_prop().
> 
> Hrm, OK - the property seems to be confusingly named and defined :(  Can
> it have any values other than 0 and 1?

It's part of the SoundWire spec. We have to follow it.

The current spec says:

mipi-sdw-clock-stop-mode1-supported
This optional Boolean Property shall indicate whether or not Clock-stop
is supported on this Device.
Integer (Boolean)
Values:
False (zero): Clock-stop mode1 is not supported on this Device.
True (nonzero): Clock-stop mode1 is supported on this Device.

