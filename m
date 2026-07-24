Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CDF4156CC;
	Fri, 24 Jul 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898919; cv=fail; b=tJcr1ZGJAuq8bA00j1Pdf83cnQeyf0ywY4XivxloARAVeVO7rbQNp2shKD/7a0FoEHIdo4u+Gp4/KVRD9lFyPI18dAakm0AOoQfhL4rJjJwBQpS/Aa521KrblsHTgVnXR+ayE+MzVeL7ZfH94TqwYSoYVx+VfauuKA2pFGGmxnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898919; c=relaxed/simple;
	bh=6MGJwoYZPfp/SUJueV1+9kySdIR3aRyIM0aXUHhWcjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3+GFsvjqlnOUBen3BJI9gUOrYhtw+TTcTvw25KOUZMyiPosjsVlL7ia67I/dGoED5GLl01p55U8Ynotwyh3BOBNLoa3ao80UHLVI4b0pvS3hqd96wh4PhFEb3sTw/vr4MS03Rjltj4LOqWGNuiI3xVjTmwvugyasTS6/7GblrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qD/onX8b; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=r+HqvDZ0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qD/onX8b";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="r+HqvDZ0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5hhD72897547;
	Fri, 24 Jul 2026 08:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=HDGQMzydHDzoYI/z21
	uvyd/RurBtCZzOovyfiYeDnGI=; b=qD/onX8blQ6X/w4bfVPCH6neGhG4aQzCsJ
	Kp4SDWIbB149eyUaE3FLYHQ7ygPcx8ZVk8pCACRpOTvj+Bt6jrl9hz2Ci/saWg/S
	oyUxQqeuwAUWWTkLyNJbCogaRVa1McpnTIqkEQzSxEtiZlOgWDHV3u4N13/m4XTs
	dZxPjF3KKLcPqACngPGAiIHpNm1S3cVjNTlduCh3dMs4lexLVaQcZOIKp2il6N8H
	AcJxUqLgNfPJ1DYgI6boFc/3bHXjuzGf4EkZQ5P/Qj35R07ZpNMY8QX+pSZfGGad
	cdUh+1rIK/v5GjLutudeuMnJudpgWSRZcJihqJN6RFrFJ0qzprUw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022112.outbound.protection.outlook.com [40.107.209.112])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfgvjd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 08:14:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVeW77JzeHLWIbzUW57ThCsxXN320gBcwzai9ZVgS4m94YpA+aMR4MdLUZhtuowM+QUPvU5ZlwmciF/BCAOXCMzoL10wY06ugnJkhRuP9HGT26wcN3aReBgnsyHtSgOfVFhYEuno3vAzKgk3RgBZDpqv45IGgrtdZARn9BzbdJz0cY4jpUf/iWS1JcehhRnrmNU9XTQF8md4UenPP3ROK40oMO/oGBCmcQwS8IqzJD/FTPf4poZmlZ9ih57BKYOOyOUq/PhcWhGA7NEf6aG/96Cc9CMn9hTFo1cXIwUnVVxmR5s3U2f5lLHk5tVZyAI+NLa1WEkqsuGT3pHMLA/LXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDGQMzydHDzoYI/z21uvyd/RurBtCZzOovyfiYeDnGI=;
 b=RIdT5sYuIcsrqsTLRWpg5TPOd9n2IfSHDZ4bNGFXMbzVP501UDi6orGuvm00vWHvK8FxQIUG8zT2lZV25zHgtFlT5gRMK1+OQ0fFw62/wlaT3ZY49DDW/pYplU6KkYx1t+U87Sg4SWhqgGM44rizY7Ce10no+zGi6Swp4BiQKjW+1pGEWlhniYho9LR953yoA8mCTilKXvSM9KWYeVMwQSuxB2DN/EoxaZOTxOMCr4lMlIcddbFZs6yXmGP5A0FGLZ3pX74xLA9bIko8QexZE4IaOAYcdoSOga0dUo4WWkdWCL1dc9bjHcJMvIh6C+fDkkwVCbn4aTUkkU3FaKpJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDGQMzydHDzoYI/z21uvyd/RurBtCZzOovyfiYeDnGI=;
 b=r+HqvDZ0oCRQNtbYi/NTKfiBFt9mrM5U3RM6b78hIAGikqKLoK+2PcSUebjF/hif/dC6mx9eB5sDPChOhBqkW03fRa6ZhYHUEU+KEWdD2Ckw7EcKr9l9WDzb9GQnbD9wzyNVIFLvLv70AdMqgSTH9mMpwnSW/8QFtLfGkM7awHA=
Received: from SA1P222CA0074.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::20)
 by SA1PR19MB997342.namprd19.prod.outlook.com (2603:10b6:806:4c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 13:14:54 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::ab) by SA1P222CA0074.outlook.office365.com
 (2603:10b6:806:2c1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 13:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Fri, 24 Jul 2026 13:14:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E4288406541;
	Fri, 24 Jul 2026 13:14:51 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C9A2882024C;
	Fri, 24 Jul 2026 13:14:51 +0000 (UTC)
Date: Fri, 24 Jul 2026 14:14:50 +0100
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
Subject: Re: [RFC PATCH 1/8] ASoC: SDCA: hw_params: program upstream Input
 Terminals for OT DAI
Message-ID: <amNlSu3mcwKOmqvf@opensource.cirrus.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722234221.884765-2-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SA1PR19MB997342:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc3bc8d-3700-4d8d-a9da-08dee9858cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|61400799027|82310400026|56012099006|11063799006|4143699003|10067099003|16102099003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	D9zy7Q7iN+J/prT5wTX5aKOjpTgcOuDX6G1hUs3vRu06YbVn64ez5NdKj87hCqDQ84Dpgo3AbtZnZbPcMJjDF8H54fK83rtf51kk1/KnbE25pB/7RpAqEASFJld8LnzxR8sv5hMR0d8DrtksXe3bhM9r0aXS+VIHQgTy43nSl0HqWNGRXpuaXL7wcJWZ2eFzbkTVj2n3gY0ckmXKqbU5WOrQqyJ4PdNJC2L26pjlFpMRtMGvkHuLIMhJdBCDZCJnMRDRE5YOdBl7F25TxIc2w+rjh/7o0RN6VgOpChCBzSTgVNoK5jrsYtgrKjgDdvK2vYzjpuxNgaEMfYwfFyxD1PJV3N4j2k8Svc5UlmxPdeqTi5EI5YhpR0b/8oFfNydbhjQi5ZmBfIl6NBc4JvAR+68W0ic9lHcKH2Jq1dF2FRcMEHWUaiPndgXytc6CuDTJUMdZtHYwRk9O0X3phfa0uNBFhlkvyb5HwIRNu5pePs0aR4hAZyjLDxypxGczkqCvI/RgVWQUAhUBypR5W5ar+AwIW+81qEApRnjg68GqW3uDNhL/qbTKh34LaC+FYru4gBzXi18+g5uMDZCfCvTtXKL7yn2i37bpR6pUZh2Wu71ZTbuICEi3mSIn5ZqOcGOMABJx6t31N6tZ7PU4Y9e+la1kck0v1HAqJigRbnQusM1Usqesh/U4EkpnpU0zaf4+4mHeebjhUhwcluRzCMJb+w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(61400799027)(82310400026)(56012099006)(11063799006)(4143699003)(10067099003)(16102099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uhK+Y3wZ2/ivZKmjkM3cvjdUfLdQp/SMKgMRPo9LqHQOfI6jrOdQzS7HwYGy7Yq/tcmEKNOXVC/gVqZgb0Gz/nGxtjjOAxCk1DLIY9gYilCSUQMpkSdU1v39W4jJDkOxMgrIcFm8l2edw9uwRyK3YZ/IHbLguKOVrZHTfO6O/sTIwDD7yBS7llgDXg3CMX0ZYx8w3J0MRmhXfhWPuT1kqSdV11AiDWrxW9kewIAJ+zV2SzneKONpvqBzXFhoZ3pA7xL2W8fJAEmo7B5GvM60otvJ2W4FnL9T07CwAMerXDxNxTCAnxMtuPcHGiYfwg4muDzXv/eftgh3ACLRpFdeD43kzM1cVhvKNxRdyWSjnYJzps1Ku5/6kRT20cLz2yw2E/aFFNVB7OiTU5Q1YLBfgeEq/MqyQow801Drabw+pYnGP4Z7DedZkMYa74sDLlAw
X-Exchange-RoutingPolicyChecked:
	qvdgWOQnm0k34GYSn8kBhoYE1E8hETK+PIO3C3BGSuSaFuIx4MIgsm6e+GhOGL+gjkR5wzXbWLvmM6VtgQAHccGBtlHT2rvdST9Nm5f1q4ml3ZAoINTHby4MQpFXDlR8zoBPSkdFex4Fv8+BJA00yXgoXxOKjJQefpbzgSDDQnnpWqCDgeab7otukbG0NpZ7O+fnYJtnGIQyO1CVd0IvV97dAIRQLDEQWu6KjpKSI8fe0MqNZrBRWWoXdSYhxNhwASYiqcM4ChhXtCxBMM7XVnoF0ePAzUM4q71tu8/ZaBNZNxV5zN9AjYS+mG05L5NCEBFhRoAc6J13awMLA3Y2nQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 13:14:53.4998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc3bc8d-3700-4d8d-a9da-08dee9858cf0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB997342
X-Proofpoint-ORIG-GUID: 929vbj2YZRQjdZKy3Vt5I16QzGxjgHhb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEyMCBTYWx0ZWRfXwzzo9F6b2eUy
 cBzYw7Hu+NuuwUlTt3yBUSEuNkxeynbO29wOyFgC6Ftj7prxs37PqDX+W9PbrrnZhfTkZbWdWn/
 uWG6aOUbZW2t28QR1K0OSMBRfN4n94Y=
X-Proofpoint-GUID: 929vbj2YZRQjdZKy3Vt5I16QzGxjgHhb
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a636551 cx=c_pps
 a=JRWdLbceQoGhO7osvHke3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=cswVol7K_y8G6oM_2sQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEyMCBTYWx0ZWRfX04yUKx+X3l5P
 Wes3ung4LXarXqPhOOI3KM6R/xhs5X1rEDmondJ+mO+G/0OY+xesZ1Qq0pdT4kN2WRcukjbd+6N
 61NxRIp3Y78ZNoy+odfJqAbQtDOuxhwvffAIqP4H+8ZwvmrMs7DKX/uPVJUtqlBKg1Ne0dcR5/U
 8N1PUA0McdmYCpan8PKafzjNDck/Iszt5PaH55Q7XpsVTudSC51+ms8Lmfa+zx8jidINoiCPNwV
 NYpfAfDgbqrhaXgb1CGR5himwKPW3v805joRR1g6Ov/MByTeS201bnEfv4aitGvK1it7o8NwQ1b
 jbN25FVi33F7Mz7SsEEYwVIMwgHQM9Q6KDF0EoqfpLHYH0z+iMFxnvZfH/G0/ngVizz21Xb0rp7
 jab9LCVJi8tF1lGUVnQYEyGS1v5tFwWcdR9XSVEI5nM7mnHadqTJkenVpF9jL1t5KYMC6iNKs95
 CtW5Etme7I5SeeS5GCg==
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 23, 2026 at 12:42:11AM +0100, Srinivas Kandagatla wrote:
> For a capture stream the DAI is the Output Terminal so
> sdca_asoc_hw_params() only programs the OT itself: cluster, clock
> and Usage.  The upstream Input Terminals that actually source the
> audio never get their Usage, ClusterIndex or clock programmed, so
> the power domain comes up but no samples are produced.
> 
> Walk the source graph from the OT and program every Input Terminal
> reachable through it.

What was the thinking with respect to the units in the middle?
It's not clear to me things are quite as simple as we can copy the
cluster from the output terminal to the input terminal. Various
entities in the middle could change the cluster, such as CRUs,
MPFUs, UDMPUs. Also possibly SUs to consider too, since they
may change which ITs are actually connected at that point in time,
although potentially an argument to be made that programming the
unconnected ones would have no ill effects I guess.

Any thoughts as well on the propogation of the clock and usage.
Its a little less clear to me from the spec that they are even
intended to propogate in this fashion, although it does seem
fairly logical to me.

Thanks,
Charles
