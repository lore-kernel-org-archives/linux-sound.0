Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5762B3DBD5D;
	Tue, 24 Mar 2026 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344086; cv=fail; b=HLeMqADChTc+Me7fMsUK9a3MZTaOXljcAMKDCRp669p7S36yVkznuB/BCtuTaFL7xrZsUhP/r4ejvMfObT0e5Wj0v/zdOo5vse84hkvyJKmljnjbDsNzAgU6Xn+omstyLtQ4IejRuX8JfsAZy4n00kE0n6rD/B+soDDde5RkQ8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344086; c=relaxed/simple;
	bh=t8EXN0ATCF11a86q7XGgxXkwOfUjaqsh9Xu1W7kvYFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRljsBLtjs4Q6TGelt+shq+2oK0u7BsXr0H0utUmernwgA1QOYPcbt4kF454ZDpJCytVUlp/P6+vMuFkMntcRT2rgY2MwVd8B0Bz8iS7z2h1eOQDd3K5nOv0lfP8C9av65gGiO5IG1yQVkjci0VfWD0m8pZ1eqdBRKWU0PxJFoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hcsPB1DU; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=o4pa7vVj reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hcsPB1DU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="o4pa7vVj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O5Idxc1249061;
	Tue, 24 Mar 2026 04:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/ckeFHR3yTpDUDqKk94nG+w1n5P3nHqzsX7edOdoqFQ=; b=
	hcsPB1DU7D3Y26R28qa0t/b1d5//4kLGaCUOG4zZAvq9d4eKO9s+hj2kry3ng17p
	yn00ujYLIAqaDGbiHok9lAt9LiuaiiSF1HbmxQP27S1YULpUIeE+3dQhXCGtXUut
	s9ROB7BPADRqsFjSLNwZQioJrq0sIHnNYvk1+iF3Vb0sbm5BPgzWoMs3BwQESP1A
	V2m/St5iTugc6tmzYaDLkTtL682BMhSr45AM6z3RFIelIvnlsqoHhMG3e5zLNGdK
	NMgF5s4faBJz6XSDiUi4nr3N6C0Gf2aVoG5JQP5N+FpmhxE4HSSN2ZBkXBOoNCmx
	QUmZHJ63oDYJD47pGJVPTw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020081.outbound.protection.outlook.com [52.101.193.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfaxmy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 04:20:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfA+m8FUv2fUapZAHpAwnpRmmcLuGAk9DGsDMgK6xjL0ATjm6t04UWeJTWo+hrEnC/hA9Lubr2F6zYq/6ITyg1YR6+FhzUeyosBVvh4yJiYJJwEozRAW5FFbKOCIAZD6SJwWFNYbBevzoOwHlsHTm9FFExgtVMGarRPEILrJZD4zIvoL/AbmvRu2OaUMyE0w1ol5gdVOw1u0Gnq94UxajhN1c8fIpY8N59fbbfQdwycOOxboXcWZsUUK4opJKFgzOxur0DHdykZ3ZHP8OEVxkInupNt+OlpW+lfwM1YMNvmIRm0LRZKrzdgeAlTta/HoPyZZ+Eyc5dqpE0WKKwgr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBak0/gBzlRbLQfL+LVAR1K53pcAxnI57+g8HcGFAnM=;
 b=M0Dn+mbV1cM5G2ndxww00sqMFAN1WElgERfO4rAIL/5QATzQ0cgTXFIgEac/1qrrrFwWM1HftlTWqm1BRdsi5gp+t1o7k8bnXWmlayTuaA0Ku3iRpYf+WwaiJzeNU2lIQ5enY7+LstzsLExyEuhZ121JjbSWG2kIQtSFBQkwdkYIjNTTnDE/Nh7Z08rPksnghnC+X57P7nrElJbJqvSYW2c3aFOWeI/OkbqoxidrGRn3uW3LSC3nOGyBY15wRs7myu7Ai834efFiv7KVOS3CY/W6fEZKuoAXvEnY0+0o5Mcmk4tFuQCU86o3E62B5Ijx2ZDvOB8/jq6FHLlsiuXmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBak0/gBzlRbLQfL+LVAR1K53pcAxnI57+g8HcGFAnM=;
 b=o4pa7vVj43qkKHZ3RDTVjkZbgMidu7xNeo3h1xt81DqGfhlxiT0PR4T8UfTBn3c/KWjKBeXyjayKEn4iVt0VLiElyV0pQaAkIN8WJSbEYIrj62IErA3Nk1RY+QNp4ChO25CKTIh9kIOQxIeVzruhmW1dFXRw8U7lMWHVwYRSJIk=
Received: from BYAPR07CA0068.namprd07.prod.outlook.com (2603:10b6:a03:60::45)
 by SA0PR19MB4633.namprd19.prod.outlook.com (2603:10b6:806:c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 09:20:42 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::b5) by BYAPR07CA0068.outlook.office365.com
 (2603:10b6:a03:60::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 09:20:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Tue, 24 Mar 2026 09:20:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D386540654A;
	Tue, 24 Mar 2026 09:20:39 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B115C82024A;
	Tue, 24 Mar 2026 09:20:39 +0000 (UTC)
Date: Tue, 24 Mar 2026 09:20:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: =?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: Write init table on function status IRQ
Message-ID: <acJXZudDv8JjWrMK@opensource.cirrus.com>
References: <20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|SA0PR19MB4633:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa8130a-9408-4605-90d9-08de89869f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|18002099003|22082099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	8v2O8rT5fDPiSZoElbDvKSet65pKU8NqmjOjfmKfSpVofya5MzB/fgObhTpAppGrkZwEIXhcvPlVCpci5PhkDshvwO/yRDQRSSn0+MYtplqK1UwWRqy1M7dkTVwbENj74wrp3iVjRFD/thb6t0WHlw+YrM/ZXnTfrKhoBXBdOjmlV1s7hrHUZ6E53ZNu9zZ3xyDptGdXRMGzB7TWL9GJmbo1oGBGmREGFdjIJeeKn/SpMXgY/ZuI9rOWVdsRg9ywB1yHk/ZJP8T5zd8QzUNyutd9XyaeYjhjRJZ6Er7PyNVVwj1V1dSJgtrv9lUHONWBlZkv7F5jVf5uOZTYADSeeAjU7C+vlDzq2VgfdbaItaOgwtaW9hU41OyGLzWI3EWzt/8i1fCdcxhUbSGugv4Ydj3UaV4e9SwHhQpQAOqMeWW+VA+5aQCaiH3jJ9wC8uUMHeHARXZse7hoLsUjzRoZtVfIADoAVihs34jO5yHa8zxV1AdyF8BP46zWQKzDtpyip0r/+d/cw4J9m/v+WYHt9a3IMojH1nswfOxC2x2mwoys5+6pxPuK8/42FioBiejeuODDEitVenLoeeQ2/dRjh5MH1rzf+oRPu7nzlko5If/eCXbz6QIOu07UbnKIA5Qy74pn0B+LDre+2+Em1BZxxslS3TGSqgA4Pe9ywWmmKByoreCWKCgxzwUECNA5Cgu/YJytx5RgpuNHl/JWSUuVMX90UNP9YCNtQrRSkeA72/vGnGcDoTGl63TbzdQ/1lnl50otOqFlgkLtV+EsTCrBLA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PGa8zmYeSaYV05kUUJkiqwmh6O20LXAYCl/SXhEU44xCDqZeylIjgflSAmXULEacXulCDUZBAbCmQunlgCU0EbtZtyIWRgg5JzuxiyVC7SJrI0zQraMRG2TZjYKXGAQKjOvRdwMG6CAEln50nWqaF9LtJ1mnRuG9kdbosg/h4rV+/s4uKKrgOvKYRZb2oXguHbP+1DK3mwjhs99/k44ZK4c04WeBX6tD3ImVY8lvabJS7yZqikF72hZRDJ0TYLAgYDSNQA4MCIa/BBhtb5M4LeDBZAssPJ9bK2zUZ6TvmMO0va9TV6GmgSTe4F/t8CEislMm3LhbPUpPVzqjGIghf1CR9zA69Jtg4hKFopjgby6NJXvMUrCnBrswSdjx5zWNYoMXbHFaHe3Wv3dNVeEdINNEOByX0DWub77LIMDRb4M4wn+0OtQD2ysc3mteD3hq
X-Exchange-RoutingPolicyChecked:
	j5Iiv5PdZ8dRjbDGB9FLPHuicOG/uD+gq26Vj/ElxeWW97LC5DLHc4n2g/q7Zp/SdJuheHGTqXGAqGGDZhAUqJldVEzZLbEY5wf0JoTPsG0z00OsZhneuUUdxRChMIvehSZbq8ah0zlxj4p1iik160qGobVSfSdjFBoy2Q4lJei+SnwMMPB1u5icjefAA+QAQdAMKQY/Vl6SKjwE10k3NHiv+DWV+q/i+0XyiJLpO9wlGW74X3AsagClbWreafJY88PL6Ia95NQIzfdTHykJb8LC/28HoXPI5V/zHn2diePw44/z4p70YJI3I3Hw0YjYGEUlmQStiRkmPMWjQ+Eb1A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 09:20:41.6911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa8130a-9408-4605-90d9-08de89869f0c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4633
X-Proofpoint-GUID: jWPvjm64FE5C4dwNWHpApVmAJqnfAuMi
X-Proofpoint-ORIG-GUID: jWPvjm64FE5C4dwNWHpApVmAJqnfAuMi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NCBTYWx0ZWRfX+IMO+wGH9g6l
 975zf9shG5Qfk/4ZlPTUNxEIvgTL6dJsbmgErQkG4WEaX4w5Qxe2V8opALZyXajcprPX/zmwIk4
 x7ZZhvzzRls4hDwNW+njieUPoFMxQqY4OdKDQhnIKQd9qNsseRjLabJ7jEX773G3HywvMavu17o
 YlJKdkN0daeS9mlCsPr11PCgKS4+sT10tY4kZyOZyiY3QgXVr1ulyM28XAP9jyuDSh1fIUBAtte
 FJw/6fnkIfns+QNta96/k3JCOGnHen9vtPqy5baOxXWlslTU1vpjh6fKulCF3RDoT7V4viea2Ws
 IpVPHVsJGMbCFuDQ9NTyHVeKdmzTEn/Y3HcLOr3BQFHL75nDpdiyiDl3lv29+BDADEY38EIbgJW
 K8BovvpjyrU69i/8nKPoMo7r9ZGSrVCBJSyc7w/6PxpAImyGuGy4fqGuK7MEYR1Pa5UAK5xQ9Ld
 77gpKYMX13fw1v7NTtQ==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c2576e cx=c_pps
 a=6CsdduS81u+lxnadr1BEog==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=gCYXy7DkULGLAm4ovZAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Reason: safe

On Tue, Mar 24, 2026 at 12:03:59AM -0300, Cássio Gabriel wrote:
> The function status IRQ handler currently acknowledges
> SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION but does
> not perform the function initialization writes. Since the
> handler clears the function status register afterwards,
> the request is lost.
> 
> Use sdca_regmap_write_init() when the initialization status
> bit is reported and apply the writes through the device regmap
> stored in the IRQ data, matching the existing class-function
> boot and resume paths.

Generally speaking the init writes should have happened as part
of the device boot. What are the circumstances where you are
encountering this?

Thanks,
Charles
