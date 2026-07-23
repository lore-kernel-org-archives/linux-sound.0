Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D750C4307AE;
	Thu, 23 Jul 2026 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804157; cv=fail; b=dq6v2fzzYQYPJ3yH0MDEzvD7HynQTiU2lslCbEB57LpYS34M+lhZR4MOqNA/2abDZ4x9uVCsh7sHwN1s2Smm8Ry2BI0kSa3ynHOnndREdd/A93Lepi0sYV3VCf0vE6Y76hjyb+WhRvPRImNwo9la8yEoFmFd8RpCf45/WUggksY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804157; c=relaxed/simple;
	bh=QpcafNSF/qIMJf5F8Gbc4I9HZoVpUtxsRTtsyQxp7KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSajwn45xcDCYcGSIjuRilCoDTb++nSm50IzfBqFHacwUX8myCR/wVEoQQUuxaHXBOtfSwm3c5bt9lOUqwQF7fCe6xczEc0ejQcUgYMjxoWaBF++gWU8mNLCKhEh/0XnCF2D4EkGhXxZKU7uzh+1xhs1tUni3P+JUNF9mFMGaj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CeI5sFrb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FDf20OE2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CeI5sFrb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FDf20OE2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MIeEmr1315228;
	Thu, 23 Jul 2026 05:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=PnxVWtvGrl9EI0xQx6
	I/VM9QRcMGDX3RBQM9rdyNmQU=; b=CeI5sFrb6mtLQ4voVn2WpYaQQirxdbYvj5
	gLk0J/f6vQ3LinxhNZ4RC6RX/yHAAhTnpI3Y6g5wuLqWS/xE4o+PomtwFGppMYzN
	TybU/HlkCm4utsBnfNDST00EgPUgSsHxNYXZ3aeI4Wzoawt+3DuUi2S51BI99yfr
	lo5wVmFyzYSoPeXTICwj9miAMQ/asKni4FjFo+l2nfQIz9zO7wkujzf7Be7lWgZM
	LdJl66av+6ZbnnlrlA9QIN+Ubs1EIONNeYtpCTO9OZitqjt5kdzSn2FS5mi7wts5
	tDOqo7lzj745vtrzvYzbSaBhIF5rhskq5EduHevUma7OXEfjGaCw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020120.outbound.protection.outlook.com [52.101.193.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyq5rs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 05:55:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr992bvVV8GsYuebVTlRUewJ5ZhJmNJFMnHzipg55FJ2etQewY56obi1zg2UcgoQ4+7oeCCGYv8+mnAkyBCYPWOVRpu8MeRDC++HZNpZNbwGD7azrEPVPA5unYmotLOFTLeRivXna6oEGLEbxUeSCKsGzOHrmWYeNFIArXD3eQaYF9fl2MJ7hh2gvWyt0I2vZrC+VVVxzMlEFbkgjkLP1JJVLO8dg/Tn0Y46oz+dKYDVK1Uag973QiIERC1kY/nYZTnH7KMDF6loaFozA/zrHNuA2ykRjtI8T0yN+1zYb2xguO4JAlU8MjMrz0/vb9B7GZ0KRQQ6xkd96+qYGR6cWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnxVWtvGrl9EI0xQx6I/VM9QRcMGDX3RBQM9rdyNmQU=;
 b=OqZyHxE8LIWbo1EpLam4Wt2MORjgr4bW+F6wo6O/K0aMVlTNRFQ7rngxd8IexSSaXaQlVZVORrmTF5vXtzKI2o/Guqvf/5yRZcqv5QK2sGMrMHg6iIo3qmpMPc39PeVdvroof7LTjIkOuVD/OY+EpRj2zugn5++q9kZBXRO56/IodPZFrgnl5Xglqko72KtuBCJ4zIViRpXec1wSI6XJeekv63LkFkoaNHPE6cbOGyoLKRGZ8mbHxDijjlukIGVZ123Ahlv6gL0ubTpqdXTL3u6NzqH+jhxyVTFFXIvIfxYlu/6HSkOHtKXKtQeR3R/x+IuHUaovqyuRDO22chdU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnxVWtvGrl9EI0xQx6I/VM9QRcMGDX3RBQM9rdyNmQU=;
 b=FDf20OE2PC58Z3yr82VAuAkrQ+SmFrLXN70eHAKKtJYwpx+0Xh4KogUH8yNu4pzf10UaYpJLfHOPLBdCd2dsbgcOG0L+zWxu7kZBY9Y0N2C4ZSfxi3NZnHCBQHa9unNeAfWLaeISWTxtW7ijXW8nNhD5ZDZm4wYn0At44kiXreM=
Received: from CH0P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::18)
 by BLAPR19MB4321.namprd19.prod.outlook.com (2603:10b6:208:275::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:55:20 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::2a) by CH0P221CA0030.outlook.office365.com
 (2603:10b6:610:11d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend
 Transport; Thu, 23 Jul 2026 10:55:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 10:55:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F096C406541;
	Thu, 23 Jul 2026 10:55:18 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D717482024C;
	Thu, 23 Jul 2026 10:55:18 +0000 (UTC)
Date: Thu, 23 Jul 2026 11:55:17 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 6/8] ASoC: SDCA: register
 SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Message-ID: <amHzFQJQoRwyg1Hr@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722234221.884765-7-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|BLAPR19MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c1607c-c9cc-4b4d-077d-08dee8a8e3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|61400799027|23010399003|82310400026|36860700016|18002099003|22082099003|16102099003|56012099006|11063799006|4143699003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	S6f9SntoJME6L55UBnySs79CEc7MwdeYvR++rrhAQxxJr70IMp8hNjI6iF99NO3jRbVuaFoAlsSEarcZLVgC/hSsDt3EwvmZUorBMv4ky2AyPrOehZcdkQHPDJAk23ZStukd8VFfeahvtG7Ys6yT7zAnZ6tB95VW5KldSdbSFPnsoM0zXPAOK3oq0+D6wo6JjmtIt8CITK1OnM+wDb9vgSvmLR1QlEax2uBSoACjhaVBj3S757DG0lYf0wT5BbKlikqloXf77rPVpiYCVF5rNUSudceF0fq4fksAukperlPsHKM28BMb6oiVNw1Ims9OR2d6qLn7RquK4P6ZWXfi0W6wMfPReW2r+/5/GFJ8Bpv3GPIEUrMVQTD9lqQSBDvntBzwF/eMdleR18DmlFS3F5nRRKXvbx/kpG+oKZWlrzvRt7/ujwq7UZGTjqke/gRBTYqNH+wQopE3nte5EJz5IzPQETlN4adpNQCUTGZabEijNXzLlAhNaAQg4HcVWBN8lMleEBXEzZUR1CMxg2azUowKYkz7aeqF6EYRP0N2bTqbLsG5IzpvyaxzVMr598agBmKNwbvdETSGbeLZfVgKHpuhOz64PGvZVcKIuVSHefcT7r8CjjxC2JpIxnU56Pz4BLtWxkapMPVzF2RENhCBe49nR/xl9dgEOql56tZaOYF6pfA6gTNnE0+GThM5EvU08gBs6iHvQlm68nDUXLKv/Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(18002099003)(22082099003)(16102099003)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ajSnmxzMivMMkIDRp/CmCj11EGyiGJ9GKRAV94feZnfdSHaYix+3q2Htp5XxqpJh5o5wQNYj75Ql2cIhzb0HK63ROBWec6LfjUA7SxYuY5M1E+IyI7eL4PmdjnRKPh7RNCBgdVM4el/noWB1R2s2jBhphepGUdwQREwBh05VdSc9rQvF9Kd+f2ugO+lNDUPaFu0HX4gQPYZEXvw70qgckV8dWjf3VpnVLjfBTQwAhERLyq7EH/A+HhGZOHABgj+cbPjyf800hfziWzpcrsVs3piVq3fr8S7+0Qg8Za2XvZVMILqN54LTEloERv0S8Jp1B+DjJRSAsDtqGuS0Fqg/uaBMh8z0ak9q8PL9OH73RxA9JRVoPfZoNkmCsgJe62Q/uUqjlXNzmLCD+MUwBHS772zkiRLy78MZ+dj55rJKanSqpXOaVsQCyMu66MwikrTL
X-Exchange-RoutingPolicyChecked:
	FMqvwEvEpVxhvhyD2Q4kGYo/Z3AvavtWtKLKCGTbhR9BX9uQB1+361HCYfeoJ7VNthn0AkG8O7suwO/sVfQmqHXu5AstiZEJuRfu3XLCe4wNH8dTwqeCg3vsIBw90sXOA0Xoi/CFEIqg+8lXgUyCSVGUhGv6M7d5bJGGLYVGsA1Lhm4DYYmhAgEc72Q3rw65Mhd7aySLczqwY+ZRKzZ0yuP2I+ADoHMylSXrvIWqEM872wuqEdXdcJK/czZXTh4Wuq/WzROqfe+ELwg6+bfkJgD2kH8C8zneVjoaS4MFvZHa/f/seMtsSQlFNWUbSHxpl+J7kra63Tx73qwoaDT1PQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:55:20.3706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c1607c-c9cc-4b4d-077d-08dee8a8e3bb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4321
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfX9jihnHERIRfS
 XIypETLjswTzdYLWmVgysm1eLgjJy6TY2ygwPQMXa7SVW+FuY2NmBdruRxF3CAd/AvA0DbNDgqd
 ruDbJpqMnEgHufBSz3M/YicjypPgTEY=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a61f31c cx=c_pps
 a=nzD6lsumb8VjuwgLTHIrqA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=3NbesoVscLy7lqdQkJ0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNyBTYWx0ZWRfX5n5CrL9aG638
 ab1+EbpjB6DoDV9rvAk+D2YuMFQx5RJg1ISLQbFdLVSOdkB5gtmdILEfF5uNIjdcHRcfUoJfOTi
 1Hq8R7dN0TcRJ23mTSiPB9JQk/mm7+6v/Na6W2OkHjrOdqNLKknV/KmfkvymGx18oJrx3kvZdah
 mPCcLb72DFucEESEasONFxyMPQYBhLtEbUjtgukDjohmiC12M2QUnd/Yy/dD1qtYi3WAkScscab
 IRS05zk5TZ4l5BOh9hh37TBfy/qavhqd/Z+31AN3O3tCfsuzaf4kh6IGgB4pbRiPk3reSABdmQa
 SMdkHBnh/bTAOP30L55ScG02JmFUsGqEoh5ITTsNaYKFp2/I+Hk/XPJCYr1thS2U1YbWJk6Ragg
 Urj3FORJZMoA/YCcduWTxGeWu/lJWyGxQQowCOjVG6doPBk1mxI7qwljpWzO68DCq6SujAzUR+h
 7SJuR6TP7IS94QL7O+w==
X-Proofpoint-ORIG-GUID: Cwvd9OU01V7WHtQWagV0IFU6lo6DL7MR
X-Proofpoint-GUID: Cwvd9OU01V7WHtQWagV0IFU6lo6DL7MR
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 23, 2026 at 12:42:16AM +0100, Srinivas Kandagatla wrote:
> Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
> auxiliary id table so a SimpleJack auxdev is bound and enumerated as
> an ASoC component.  Wire set_jack for this function type so the machine
> driver can register an ASoC jack against it.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Yeah this patch looks fine, we can merge this one now, whilst we
work through the rest.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
