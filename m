Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0890181724;
	Tue,  9 Jun 2026 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010190; cv=fail; b=qnvxt8RDG1cDQHtPpHmLtoZTzqRBSMo+jQC5TAdu7O1tz1qwfoOL42tyO7Qc8B84feDfEAZEbd90r+bGXD4oXs7cjLQvHPgEkGhv9JsdNz6oPwfgKYrEEK7/Ga4AS6azRlPOBAUvZ34d6Ncg9ow3vFCczr90wjD3JE0VZn4nLCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010190; c=relaxed/simple;
	bh=wdioys1cCSbAKrrP3ROlWXT/x0WJgrL/2DCWFyPUocI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=b43Y/Ny8mVtxedVNagIw+aIueWZ+jwA7bRecUMBU0Uvn7VQuT3PMxrvWFbqICwxVK9eKWzz/D1m+iVsiSl9ZHFCcHZ9TValavvkoSgXbGTJBNsCNTVpiiGRFcK6rKnPKRe9UD/WKDlTV7dVLCzjS6se0iPmuZ7gqZ3HJT97Lmjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BwgW0nPU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DMjezu38; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BwgW0nPU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DMjezu38"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596HXNj253610;
	Tue, 9 Jun 2026 08:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PTOZPw/FDG/2bokhRtEvyG75vNaHrK4B2JTAai58950=; b=
	BwgW0nPUnJ4JagSwcJs2Nt17KNJXOtDQBRm450HVLEw1hY01NJpiUgAkfyHocSBz
	ZbOt9KQHW6ZVdWHVlfgxeJu1QC9r8eDpQMLrcq2e91gOG+HyIC8mgWI38xN6u0wl
	eyihXnAlfqJOfodenl7NrbvKiMM3GKod7qpLSt8LV6Dii0MPun4KSskRqPUKLDpm
	UZ6iX9nfiRMkdfHlG+LoMEu7ef9EzhOUKYIiGnYHx/9L8YTDkZfUoquXfkgG/wBu
	0ObAKzFfzpb8wap6VtiyMonA+Yu0dM8afv2LBNfIqs01CtGtE5qRaltNBIRdVIdP
	TPPMjY1tSZg0X10BWQpr/g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022109.outbound.protection.outlook.com [40.93.195.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfygc700-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 08:03:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsgRY3WGpmPv8n1hJCokLSh4AxXsv0JjTVxgGwdpILHCODi/qLPjK/7vmrcGFNIVvRBdrA0Yhc+5GTbOf1ceoEke428g6bQLgbdWXUGXzAmZmc8y4MhDbOqCytYp646tAdkJ4keBzMKZtRsVksfwLza9lV2oWESpqdUOWjrEN0W9KNB9qYwUcGgv//ilNItHL3iChrKScuesaQzko888xW/7flhL4hBO9d24CZFNmFO8I5bq9uLZvV+Aqom8TPJidRbm5ZNxQ11lihMxC4KnE1wv2oMaeEeNURj7+YisbGYmvwTK0NRkFsMQo/2euAxXbEKtGfH35wdj54L7wo5WUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTOZPw/FDG/2bokhRtEvyG75vNaHrK4B2JTAai58950=;
 b=NhIBpMQaaYRdnsOjs+wSyPUnmCIG37TldnlSYETs1ckmq3qd9dWpXUF+RLIVzfKB6ZtWaDkoYapb89GlkEnS1lz4ISuBa3azw2mi3ceMAPqmac15YyDjWSHgMVOLziamyeUtLiTIZaDIIfOdCo6ihPz+HCFPYBjXLYFZ6OLfVG7UB50vAjS6kH+0THH/MmWqIhC/ysaAs10+6G21BEP9pRat4VoXHrkXkUHB/QpuxJzmjjSl2jlyjL/VrRfgxlTNGMrEJk4e4JouZWXTmccazoXNFgA1F5Td5c0Gny5V0xA7CmNyGUwHunuEBLhE4fqCPZgTFprRUuOblheZJH1v/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTOZPw/FDG/2bokhRtEvyG75vNaHrK4B2JTAai58950=;
 b=DMjezu380GeYaZQzOqscHwlQRG9vlk6VXl1s5QP4N2OiiqnmEkVLI7V07tBlufkNzeF/nKFYcnmM8yDCzlMnMdCqOYYoj3ResJKam8Mrkyws6lelsC3GIV6/whZKKeenqqgv6BdpRB7N15MTSOXAAAM0MSy2MNC4wHt1J5OqSVU=
Received: from IA1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::13)
 by CY8PR19MB6938.namprd19.prod.outlook.com (2603:10b6:930:61::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 13:03:03 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:208:464:cafe::75) by IA1P220CA0020.outlook.office365.com
 (2603:10b6:208:464::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 13:03:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 13:03:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 210B0406544;
	Tue,  9 Jun 2026 13:03:00 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1022382024A;
	Tue,  9 Jun 2026 13:03:00 +0000 (UTC)
Message-ID: <f8866e44-b1a5-4bd5-afbe-5e7615794850@opensource.cirrus.com>
Date: Tue, 9 Jun 2026 14:02:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Fix some cleanup memory leaks
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260609120738.284770-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20260609120738.284770-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|CY8PR19MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fafd862-ecbb-4a84-49e3-08dec6276f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|61400799027|16102099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Bjn9br8HqRc7cDy7nl0jfqNMn5pHvEIclu866AHgDdFzCXYvixJrSklaxLomiiJA4R6OCOY2sQ4Osn+oGlmGTSyoeNdhLCx6G4/AHHuK1KPWTJiX334pwyLRZPGrnjIeyF1xQgJV9GfgTDaQeJdcddHT92CnZyT9+tdOJZVT4dfBmtY/5bg5PnvHzF0gJ4cHpyCoHfPJKoQqME5NWg8ld5HAXFHPH4UECQCoPy1fJ0OI92TcCHuU5NL3th1S0D7CoTg6Vby9XiFmfdS45G28LBb7nLS5xBx5M6ifDbgk/ttTRkw7SGECCTL1RdCus5IDk+u0NeMAoSNDFaAjfNkvX5sSxsaSIWeUL1bG0XRNN86RV0LVk1MVWLxAoSE6GABg5lzhRahmf7/80LI3i4iwRICT4+57lP4ysLHEbvlJfiWhSHxlI7m5pD6xOaAJbOSHZWqwBqUPr9EE57c1pX+7bkwA/72SN++ysoNMVTkrphmVtw2gkRgtry5zYHwrFvO/gRfstMU1n3gSGz+IHgKrmpqKODyYke+8F3MTVEiHLHTIpsB232rfdNDq75Tplynlx13PY++Aq8GO9ugu5F51lj3XO/aRBZr+mBEUmEVZf2hQhNgYZB+5EY/nXhp9B5Aq7SbBLoT9lCm80ufiDoFf604YsGWKxF5lC/92YJr6Kp724oy5Gi6wAVF6Otx2k9XmOkDmaHMLxdzdQkTaRoeufl7Rd0scOPGTOPA1+Z4h6QM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(61400799027)(16102099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oagzJrdc3z8UZn2KDgoq6wXIjvya1oz4uD7LtILNRZN1C7Nfp2gH9kGptIfxlTbFKZXeL1eDE+gRReZV4y1AGz+hLOpdLPRi9zt1Wmwv0d+EeQZ9CaEOwbn1aYtoMVTak6kzmI6h3XsMGgibU/2+Uag5b0lb4PlLM5cEH5Ob9XM3kBagbUyKhcmfEdQKIF+Z1KzRtFBvSsFBhz6WRz3Wzrcm+XOXgabBKlQz9Cs8hRvV3QXjuL/IXB7mfnWRKNKhArgu/v05cvIr1VdAXJ2xrZ92FNWLo+8CbBKots3jAXrKcqqGb0zdzsvUjgdsG+HCI8Go/u152FGAhIfwLmCqKt8rv4NbYf/aRDjByXs0ZY7kd/j7mdLfErQgOv1jXcwIo5Wo+Z7ysZopVnbBifTFNNCvoDt8XcObbWi716YAMvA9EDMh+6KnaOG6KAedX3jD
X-Exchange-RoutingPolicyChecked:
	A9a9iOwHfGkPlW6kIMsWU0oTv9plxQrjNNGhyA79l+I+LZL1P8oOofhnB0TarUdiD5smUmJlDW0j163euRD8J65y9GS0ANB0mS/LoVP8chTvEP77kw246/wAzplfK9cXGnIum1LJ67COX+DgjpX30B0fgBZGudNoH9KZ4bMarXflIol9my4Jj6aySNfJjXuwc7L5drxlMnG7yl398rsPVMAr44ZZcmpErtiw4yYA6HfGzmQ7xJblmKjXYzZPi02Ob1S3hGoZ2WNkWH7Bmb0hZlqqVnfgX20cqkiY6USXxaT+gUoNI40K9Hcj9iGHAxcyr3s0bzJT6i65y8Vfug6UAg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:03:00.9471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fafd862-ecbb-4a84-49e3-08dec6276f9a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB6938
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a280f0a cx=c_pps
 a=o74NBiIPioXkFKZqBywf3Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=wHTs--2kB65sBGaqtNQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: lLfhUtTjU3Q10ljP44uuO4OreKv4H4lE
X-Proofpoint-ORIG-GUID: lLfhUtTjU3Q10ljP44uuO4OreKv4H4lE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNCBTYWx0ZWRfX9zQezI2WNkxQ
 hn2ooierv7jp18deDjEwiPA2VRT+eiCo4NU0hkzY14/hMkLedgKUT1ohgg6CvizlkExNQ/9DByI
 rJ4DoeT8WWl+d4tcjSDnpg4t/FZ4Qs/d3GLolaxjr8JEQ12keCZkCkeYOir+cAvn6lJzIaf4cn9
 syotiuoK+nr49SFrwI7pEee2fm7pjgpsy4y0rxXpM57qe4ozVWDy07yCI8PxZYwlrGg3uoFye7p
 3aOZBtM4jGP4vBH0VV9z0m2UjNzyda04OF6W65o05BjFkzkrUrZDsrg0IdW2/pWNSvSq9jOrtNE
 J/7AbAVJEGrB5RanzGCk7+Rya2RmkeqhqN5W9wmDCws7u+2z1YUf2kxDBideizTTS5SGRNs1W5Q
 vPTu2GJM4GdFw38zPhuZWfEJZLj+EQBpLNCSB06x7LCoI/7v7WpH2A9DFy8w4GotLVqIjZ5bzhK
 QglVpVnd91vEe8y1rxQ==
X-Proofpoint-Spam-Reason: safe

On 09/06/2026 1:07 pm, Richard Fitzgerald wrote:
> These are for-next.
> 
> They are not urgent because it only leaks memory if the driver failed to
> component_probe or is removed, which wouldn't happen in normal use.
> 
> These two patches fix some memory leaks:
> - The memory allocated by wm_adsp/cs_dsp was not freed.
> - If component_probe() failed it didn't clean up.
> 
> Richard Fitzgerald (2):
>    ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
>    ASoC: cs35l56: Cleanup if component_probe fails
> 
>   sound/soc/codecs/cs35l56.c | 20 ++++++++++++++++++--
>   sound/soc/codecs/wm_adsp.c |  7 +++++++
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
Sashiko doesn't like these, so ignore them and I'll look at its
complaints and do a V2.
