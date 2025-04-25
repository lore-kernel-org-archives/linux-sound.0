Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DFE28E5F2
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596703; cv=fail; b=hpfHRSUx5y8WCAoqQCWU31OQTmEtFDk4oRn1iwNiDvhGAUySzOugWBqvJ7pISXQr8uhDDuctnQMpkhfhDEKjgxQ+13ZiUYIxNmywuTa4sRt12K098oWx/gm9IY9ocVXkoiXrApuAVWamsSiifTVKpCEvFyfWKPUHhmnrGjL5TnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596703; c=relaxed/simple;
	bh=EeeLQzPBUc7NqtRXUGPQHWNQopYs0ZvjAv8qTRIQWA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIJYCY+Gu6Z9t2u8PJvkFdAnyQ4dAg+zFckoGozRzOCnDAozshK9MZ1q8phGNeE0IcLXG7fGV2b6gLnLn8JvDNjr2+yWMyWJLNFiOD+ta0wEllJtEnD2AkGaWbzfNXhhPDrgl6xV5L5e8bbmuQYXUwEZGxUJcihJVBlPNOteXhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TMlQGnI6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Sy3Qovvv; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TMlQGnI6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Sy3Qovvv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PEfElw002738;
	Fri, 25 Apr 2025 10:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=1Sr1p5I8ymjYb1OBBQ
	rYFwN56uP+epSdxRZbMV8rzio=; b=TMlQGnI69+xdDe0Z6FiakC4a76lPYg27uf
	+GkOy5lIyqx4B971M6LVhxuRiJ6Bp03uVzFmeU6fUrhI+BfJX8wT2vX73kDdFYLZ
	1rKWgVvhdR+JKFGs6BdGmWvW9buxRIOs1rSez5REj5Z1r6eQ0SywH+7MIeSica30
	m0In86ENy61cpizsioUBvoDwiYv0XxfKImsWs+UeJJ1hbFwYNyB1hLxMkKXHXgjk
	l6TamfpaZnc9hnQKVNSeF7jkGP9S3eipTPY5JAEQ3hYZgAQLPH57sYAEV1YMSQoo
	W+H8j3iSYZefoOsdevH2415ceqZe+kjj/2YVoO8Z8l1X7hPL1pEg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 468bq384eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 10:58:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rodkcKVnNa665MkzVRePXF+q569H8VNj9XSHGNOXXp9u3PtZ0A+IXr5HQ5SDl2vO+iZN9qO2aFk02NCLEVjk8ZQwhi+zJ1Ud1E1dc7lrM5Re0My5qFKcTMZshNQl2iqtLyn5exN3tAs9eMKiNd/l0zWi/31PmUKJ5FLZnujn9g9b+/yqkLGyNkNmtgOg+wuktdfQy8r26Zc4vmzZ4EP+nZk3mS3k36Y7HJoNOaAjCO1NbLk5i+5Bhyp2z2Fqhp9gzveTauyQRgAOfxEUt4St/s2opmSwllOZGVrN0L3TsZxlg0bVrPAytX1Z4sNGwEYCJaBBnNOZ7c073OA4UzM2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Sr1p5I8ymjYb1OBBQrYFwN56uP+epSdxRZbMV8rzio=;
 b=cyeLssrMqN/oMGLE/kris/IaEKdJO1uiuXzOkocQwQGu4glVnBBA7kgp0crWO9nnAj/q1fualo90+VT8agKZxMMc9RWdAEdYWLboyQ8aIQD6QnbovhSvLMX9u1grUYO095y0RSOdLcaVbrlqtAvAsvnPxeskX1hPpk+xMpAJrk8B1BOX+qOyU6ngJhcF2/KR0nButzBErhP7O6bxy0dO1yfQBgt3Cgk58DDzZ2jd7xXN+OgcO+7kBiAkoggf+ctFx5odpF9uGTuc/k8LrmBUe1Hub7skzSoxn9RAUS+J+1JeRhx4ltktY16X6xl+YFwmdmhW6doYXLm0HxjBFYtXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=renesas.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Sr1p5I8ymjYb1OBBQrYFwN56uP+epSdxRZbMV8rzio=;
 b=Sy3QovvvizFQo12wF6Hb97zzb6Qwx4NSRPR6Agfcta7yHwzYLUIPRTn7gWCeevQdIPCFBOc+F3xPQ5NZL6Moc/+oN9ZJ3sxMcGMqjR0rD5jm3IcFDqoMbWRr2iq1nQXZaZycSe4dHFcfKoUpKHbZLdHbfW0j7VSmHAyVmJ+Jkrs=
Received: from BN9PR03CA0929.namprd03.prod.outlook.com (2603:10b6:408:107::34)
 by SA1PR19MB7088.namprd19.prod.outlook.com (2603:10b6:806:2b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Fri, 25 Apr
 2025 15:58:05 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:107:cafe::f4) by BN9PR03CA0929.outlook.office365.com
 (2603:10b6:408:107::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 15:58:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.1
 via Frontend Transport; Fri, 25 Apr 2025 15:58:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3B3DA406543;
	Fri, 25 Apr 2025 15:58:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 259AC820259;
	Fri, 25 Apr 2025 15:58:03 +0000 (UTC)
Date: Fri, 25 Apr 2025 16:58:02 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: Question about conversion kcontrol to component
Message-ID: <aAuxCjJgi11NdWSd@opensource.cirrus.com>
References: <877c38dgfq.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c38dgfq.wl-kuninori.morimoto.gx@renesas.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SA1PR19MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 424d9f7c-9bb2-400a-9561-08dd8411f6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U0pIy8bxOalRV0emRSzLRATyNg8SgtrlNve4sgc4GoSfC6lOBmJSgy4tH+p6?=
 =?us-ascii?Q?ToWi7dz6sSZA6QqwtzV2Ydjlo8n3zI2ajelmvIt7GLKPgkESGwIoGT58DFid?=
 =?us-ascii?Q?V5arQ7WckDoTam6c+QCq7gmowGsXTUAiknBJ3utXhN37tlC3fhmhy7Z+UBSi?=
 =?us-ascii?Q?os1znpV6tB/0zfflt6Y5dDn6jYSsyiP3qQkxxsmdC9srh5h0HvTG6AnEVC0J?=
 =?us-ascii?Q?FtHYDOsyyLRZvq7L+Z/5FYIvuwWT6MgU82kL10zJtrdW12+wrKxac5a9coXo?=
 =?us-ascii?Q?5MY7jBrMyJck0Y9rgSJys3bd4kFX0sNNA3+TCuoQLU7IHUM+ydHo8W4hWDGr?=
 =?us-ascii?Q?quc5NXppiDJnFiePgKuZiVZAU0Kq43LnZDsYw2ljFDzxBFYSMS9cyjKovEnk?=
 =?us-ascii?Q?4ly9Aiz/+2rWLojId0HmLYJN5MZb1ovexXzUDDLMg4m8QVVPOwFfH06mLZMX?=
 =?us-ascii?Q?RVYEd1hR7Kvr74yJ1ckVohfAQ4j6eqR6swbLe/dO0oVUjX9/XLHr2dS1YEMl?=
 =?us-ascii?Q?IH+MvFcgS13DhUdKaFsG3trWTtdGcIN5/0fLVbtjHWPyj/HRP85mNhMpBMOf?=
 =?us-ascii?Q?Xxmlo2hoodp7CXusOSG73ghRsj+dy0rPqfzaTHtL99nNRyFOh/dQrqvloguZ?=
 =?us-ascii?Q?6BDJ0IAjeO59rXSaWxglP3s5DgHcnAcSh7F9f2YqWbmUq1CQjBMglLqhdwl/?=
 =?us-ascii?Q?IOZKtuzpiLNjelF3xCMwWvMsx7LrOr8ZGvrMHeToVtAuZspeI7y35mqz5tlK?=
 =?us-ascii?Q?MsXiFWSqtbCFSgzm04JfKwg7mjT4jT7OGEOhMdpotXQ66XnSUs7VF1dGy3rR?=
 =?us-ascii?Q?GwiYVdFnqYdWO2kv+Rowwh3j2UqQPcC3HyTGoTiB0rpUo/EKrsf92pxY1qZB?=
 =?us-ascii?Q?I2DsP3zqB/q4p6JOagD/OB2htKpwE9tRbrnhHEpO167IRJWLyCVAkKzUXXx9?=
 =?us-ascii?Q?50BF6+4WySR4jN/hgdYo4BhG10DoXTo7iHCkBLSgoNpK8oXHHdNeWdmVvuRb?=
 =?us-ascii?Q?OzL/kZ6f58u/2rYP/w8CYSR8WyPsN/wHQNsdlCluig8lreNPS8Kbt5PbjmBz?=
 =?us-ascii?Q?dgSTg70JeNnVCtFK+ITbqXDWA/+wJ+4pZI5P7Xuh1klPsjgaO9T6kfByV8Qp?=
 =?us-ascii?Q?TkEeC5cpgdmThYG0rc9ZDiZojfCHor8TakXBkmr89LGw3zP/38cBR1W8teJH?=
 =?us-ascii?Q?QfzGlKxxlxw1h8gvqvOPiUxhV0OF/ShKnsdwuuqx7+rbXRwKwnF8IVxkFnD6?=
 =?us-ascii?Q?bDFV5fDxlUUHx82E1nop2u0rJ2vJ2FpFhiR4eYTEfh6iONMsYyBge/wWE95P?=
 =?us-ascii?Q?Bqg5pCWQsBTGGail16WAhCckwy9CP3RXcefxPdHDy1Fkw+3cuaThGHURGMN0?=
 =?us-ascii?Q?vV/lvW/ktnnv5fq0Ody4lD9bzeIdlCwP4QAlNoJ3nfFqz/lEslZKoDxcJgdj?=
 =?us-ascii?Q?/m0Ag39bQ17FgIX8c/wJLog47Xzqczdq1d61iWmi0Mq2N8pAQ1OCAQGxhFSd?=
 =?us-ascii?Q?iwtkCRJeL34hc04a/CDo3RxMTAO/5BJUkcyZ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 15:58:04.5228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 424d9f7c-9bb2-400a-9561-08dd8411f6db
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB7088
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExMyBTYWx0ZWRfX1xFwDt3dcNZh 26d3XOYVJsKN/9jq5ffAYmNXofQB33PC4VZlV8fMmG9rERi3OSMm5GQjpzxfExBv9VoH7aoybwl sBNR0TMGT2QTeFel1bZC5EGj4npurFsJYYzSL9vNY/DuKoBVS9XKjyxPJfWmTyaaC9F+k0aOzPJ
 PlEFxLZQCY5470EZvulU63he962B0T+1jzNLyo47vuWocmh0uO0Oq8SyCZDl5DPxcK5/27sPATr jiXVYb8SQslbANyTGvbHQ25P1I1QUH1eF/a4yie63bM7iFvQWjk0SNpioUoaFhSAdi7xENxTuK+ 9gQekdkGg9kKw6B7vpKDuQ9jt9hDhEAtc0fOZxnHjOYlpEmkr+VaEY4PDLFd4UNIIFfan7gJ4mw
 y03IPBW7Y0GByABrmg56a2s92YRtCeLPCMC62LYFu5xZEh3gWTeAQRsz2gUSBINfiExQe6SE
X-Proofpoint-GUID: XA4PvZsGOoJFVFtST6R_5-CZ_OU91IMF
X-Proofpoint-ORIG-GUID: XA4PvZsGOoJFVFtST6R_5-CZ_OU91IMF
X-Authority-Analysis: v=2.4 cv=MPBgmNZl c=1 sm=1 tr=0 ts=680bb111 cx=c_pps a=ztkV8ooph0rfw1Th5QLTnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=RWc_ulEos4gA:10 a=ks2fcTP4wyGcClUs2J0A:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On Fri, Apr 25, 2025 at 04:16:10AM +0000, Kuninori Morimoto wrote:
> 
> Hi ALSA ML
> 
> I have noticed that we have similar functions
> 
> 	snd_soc_kcontrol_component()
> 	snd_soc_dapm_kcontrol_component()
> 
> Both converts snd_kcontrol to snd_soc_component.
> I wonder can we merge these ? or which we can use is case-by-case ?
> 

I think this is case-by-case snd_soc_kcontrol_component() relies on
the component being stored in private_data on the kcontrol, which is
true for all controls added through snd_soc_add_component_controls(),
but not true for DAPM controls which often use private_data for
various internal things and call snd_soc_cnew() directly.

Thanks,
Charles
