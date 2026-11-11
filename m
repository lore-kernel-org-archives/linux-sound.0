Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794393073;
	b=hFQbVo/M6E6aepY5lsD7yYwQF+1hMkPYDIbqvMX9X2y1zGP2mgu9YziZzMH9ZfwYBtzM
	 +L4GCSkKXTCVXMvTnbJoJMF/sQ7ZNE5BxKFhYXFCtU9ZOx2/dmx3/HSqDwdLIu9RqUVva
	 t5FUAFHLGNeSSLWjd8pbOJQIDik2ZIXfzzd2SgFcO2rPd8xIR2p0IRJIFxaLiMXm8z74/
	 S0+Ddjl5ktNzRkoKCiDFY6stutBdhAQy+w6PoxAcQ+CIbBCBfuZhRgLUQnr9kmjLMUQNK
	 kGIU56+IzK0LYgQ5SXNRt/Dg6WjleIxZhNnygSAWMCk/rfvqiBQfapYeEpkeWXWl+Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=a0pn9w0Nzugy9MJiqPvxGdHo4SUH6wYWMMoRfB7S0BU=;
	b=h171WiX52X0ABWomIGvpTPsdxdrxR/MBNYx4Dvku2bvPSFfMN8yInUCkj8XW9CkpvDeZ
	 6uL7RS7PMyuzaZh/k6AzQwJUCinCOqhlH9MRc+rwAFknWzDxkv1h8gwsIQE3nzvV99VYU
	 xuipc3h/eXBs85p8HejyfNNEXrU6jOWvOvbsbo+GNz1xJH68Pbqa3+oFxJw/VvefiG+Sl
	 /HUvKawd0Q8mx2xHLBXJ4xEZ/kTmRtemGayYVjDsdCjOIzVleidbXB7GWMW6F2wr7WEwl
	 /9y6lN6rBjNk/OE+qCVY6NLgGaOX/Nsnm1I8AB5YskX+ev/cvmAUJ7YiSFb4DhI2bVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Tg1EMPhO;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=V5lSXaK0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6D606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04B6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Tg1EMPhO;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=V5lSXaK0
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAOgeM3507819;
	Wed, 11 Nov 2026 04:31:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=a0pn9w0Nzugy9MJiqPvxGdHo4SUH6wYWMMoRfB7S0BU=; b=
	Tg1EMPhOW86W/FjVmzYh/rjcGHv8C/C9vMjuKXSVafRdjElxpZZ2OgNJ8+HcBdxK
	/YVcK7UqR+RHMHkd1IqLVTZ8x1WMa2hNPN2Mx1dpwsrrJGjg62L8ySpTJdyCytb7
	buqFlX5tSsTOY8YUMuYcMm1VwP6nrNq7+r3b8B6DRMVTjB+qovlmTr50K9Y1GVjE
	wfBt81MbNW0oPM8BFM9Q7trRIwsxArd01olwQmm6KyRyeExeaV2uq381VD8Y/oSL
	v353VwZOQNNeUs+UEixEd6v7bn/dkK96d8u7aTxmhI+Tdot5TdUaGdFi0/C8mcvW
	8A+4UGCDY70rF2NV9YfM6Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020102.outbound.protection.outlook.com [52.101.85.102])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hv7urs9wx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 04:31:04 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXhaJpWrkLU3p/M17XI9FO+Hn96O7D2cSdYCfNQ8nTZLZiFHOhvVOkwUbvtWvyAjjv7mYZSyGuhJr85Kbs7d9tiyAVRwudDBcj3mYUb4J/zLdI4+Q8BU0gcE8fmqGqceNJcrglm/96wnQxQJXhng6nhkGg2xaOkFW0jEqZQ7HW+PlUAcAvoSzMz9oMtun+QP805qU9ajU8/d1mtXvTebSvSXB9g+Y8ToeCCuJzBdYWInLSA8ddC/4zbDcUEv2RtNRJFCuP93Xz3g+JW+XsloRjqUGb0GQYFL7/G8izGcYcwHJNQGzFoVgQtXI3HKEtIz6r87zIyEozIOzhEVVtF0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0pn9w0Nzugy9MJiqPvxGdHo4SUH6wYWMMoRfB7S0BU=;
 b=Nn/ljkaQxlY98iqbviHFcfreugTA+dAVU+Cl3vWHUSoNtHAS26nmu7F+btCblQeAzTnfrj/3a5sMgQPChLt3LIZHnvqzLOAFk/rkMBhDj9dxQgBegfObtS1lg+ZbLsP3K8iAjZIGbiRuO1qRoQ4vQJquPtVkFOrM9ycTsuMqC3dvySDEulgOH6Ri1z60gsN7IR5VY1tL19tES/QovLZAJXOnTI757fVOj3h1T2nMEObopvoG4mk3v0mCxqWA6TCBTuhmWZXDAQ1X38TksMnrfTEV0V9DMoqtE3l/OIjkWWxvQIJ3l1M/E2F06KJnIsg6BNAaVXbS++J1v/4F8OG34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0pn9w0Nzugy9MJiqPvxGdHo4SUH6wYWMMoRfB7S0BU=;
 b=V5lSXaK0L8dvNHzpWfKpQMdECQuU8e46F+Ahr8oxGxRDl4y87AOEC1in4MwtZX2CMX3v/6m/hv+U0XYvC7T00C/kWMkzL9e04uj21vqpunDM8eHBOfow+G1IoqnLe9/vRBNlW5f/36MV1VvEngxIBKM43uEAfGzrD4YGvDvuMFQ=
Received: from DM6PR06CA0089.namprd06.prod.outlook.com (2603:10b6:5:336::22)
 by DS2PR19MB9364.namprd19.prod.outlook.com (2603:10b6:8:2d7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 10:31:00 +0000
Received: from CH7PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:5:336:cafe::81) by DM6PR06CA0089.outlook.office365.com
 (2603:10b6:5:336::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 10:31:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH7PEPF00000018.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0
 via Frontend Transport; Wed, 11 Nov 2026 10:30:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 07314406541;
	Wed, 11 Nov 2026 10:30:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DB485820273;
	Wed, 11 Nov 2026 10:30:57 +0000 (UTC)
Date: Wed, 11 Nov 2026 10:30:56 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: NULL ptr dereference in cs42l43/cs35l56 on Lenovo Yoga 7 Slim
 laptop
Message-ID: <avRD4MM8YLzPht/c@opensource.cirrus.com>
References: <m31p8sx403.fsf@t19.piap.pl>
 <avRBU4NbuLEyygl3@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avRBU4NbuLEyygl3@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000018:EE_|DS2PR19MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: 788d37b9-400c-46fe-c44a-08df3fdee0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|23010399003|36860700016|261009223027099003|10067099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|56012099006|4143699003|11063799006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c0xnEQlicUMc+OvxFCvlESt2eVnCYlhcfbWpCyMxtCLdXBXHlaqmIT50xFJhz2u7+9HG7XDTAdVB40DbOSa620iCqTclwyD03rT87LZ+T1d76nqjwlzqY5RLgnUiHeiNzYWpFZwkSNltLcZLZah9soyo0Q9efMFjS4BeE3xJKkrf0d5VPsDTSaOrr+C3HvjXfTWZAWnF6zkJ10Jn0YsC3qzyYMDLLsiZTW1Qz16mZ+mBuqsFCLE1OCXcq3uN5Hjn0h4P93ks1ZrqfGjsiRdy45C0KxcAp1VX9ZwBMRHpYvkoYSsC1p6wNAnIw4i+eXn7kftd6YDCkizyzxlMlPg7QZ+nvUXnzvRUBlgrvOKMz7IEDdgTOGnje43Ri5jeU5wKCit/DPMpoBzyplYJbASiRJZTM+yPobye3a0IFbS3zsFkuT+ojgt0TRJwFEJj3Z1CPs0mGFhmYzF1oxvIAFOyupGZm0T07L1qrT9ir39KElPah508dhUfLv+/Hv84V1NgTpmPkdwxxLPTG/3AFB18egHNW3WA3JQq/RDPiQEGqz2JxI9qtx0szEHGRR74UZ+fiXtaqRxxWOlmEPPJhvsT6tWCWmXK06+A+Kbejw39QopYaGmWqrGGhZTh3CHf1fE9
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(23010399003)(36860700016)(261009223027099003)(10067099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x0qpuWub8L6FXGbLeAO5E4aYkY/devD3pY33f539Q7wCEAB6MWbthEW8kgd7uukNCZWQqokO3fkl07MTDsgBCMht0oThZgk3TqGgDIoGxxKeD9opgGLxzv67riooWYaANy/ItmyPMDLd4Bu42M0aynYKx6D2LBJsAerIiyfA3I7PNwUqLkQvPW2WZyzjYo3SJHvDrC/dfNZgcqs6L6JUfBCgqnvhk1suzcBIdHUBvCSt/INy00qc9WkMgcKuVak9Lxi6LtmBBXijw5rltKaaGTsLE7fpO1w/FChsd0slbYXAscWRXZdn8AHQqlYno8w8b/evXEsJweXcEhvfSEMFIeP+sOlRU4VkbtKmzeymixginJIcxg0TAn+GbGoW0JQvXvAfX1ptVF6vAfLw8034nivxkCZbFi3bcKTkGEj9gNNfjLm3JteEYvRP7Og0ujt/
X-Exchange-RoutingPolicyChecked:
	g4iRutgQQEqU9+H+O4XsawOVZGkLBq47v3uDmph1qrzxURNd/9Lfq+AJRZNMIMAYVnYIE7F6+49rDO8ObmYNz1Ed6HxDb5zetnhc6IyFVHRJX50JQNTlrph/LmsnrQtzJxrFvKBMxuNm72/PBh7CqtvhjnthMXicfr/8AZSZb2oJSGLlUKAtt65PvPPaVXsBVQJ0U4fD/fwpbBFdyTd0RcUlNj6/oTyD2SAEUVzZrc9GzV/cCDKI68ixXINbAdWhytNZaxe4a2gYzqyR86T/F7kfENUyI0iVQmCV8jrxtXs3PWnKEEJV8pgkTk+hg7Gqty11VSDAM7e7KnfCyqw3Pw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:30:59.4148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 788d37b9-400c-46fe-c44a-08df3fdee0c9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH7PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9364
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MSBTYWx0ZWRfX5KhmiF3+F1MT
 j+69cE9TsGMx4qSzHUjYp7hEC1v6O2HPNAobB22GA1btRKIbv80vl3Sldx0z7CVLmERaeQdELmY
 T24djOhscss40fUMQxb3ElVqe07A/nVyuAOgC6xKO/lfPMUZNfwZIHUvGIaHQGioN3mI74l19DD
 RQy+lxTM4GCGU0o6B2Y2/PxQVl934Fq5wfr4i7/ogsGMAAKIaJqwXrQUuV6UUa4Udt9/Ue4m5uq
 /coMMgYLlkTkuk115v4kHmyB8eeK5BJ5nlj0fNKdDJbVCy3sC0JEyttKS9bACz+/x/99EATdeXO
 Zvz/Rs4d2OX3XxMEPhiiBQXOWyKQfBmed1tJyGvVrKEQHnQuubViGsGu00mht6fxhO0mm1n97AS
 SGBSZnVoLOZiKT68plks1ECclxQdm45f82IjKx/i5kFRi8Keu0kMkQKe5T/iEVH2TjDwq1WjrGP
 y/cyx/BMUWtxA/XVjoA==
X-Proofpoint-ORIG-GUID: ywEInUBAF1_zWLDMJiP1lr8Y7xMTx5Ud
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MSBTYWx0ZWRfX1lLd+kVDb1Fa
 93gHfEWDKO8em3+PVgiX+R1eUWDzeJcGNRbiVsJbuKc0yKaUl9URIHDyB4a1wsaNzu/TtJqr1Jp
 OZXqk7ApiE8p1JWTl1lrJ2ufN6MZb2c=
X-Proofpoint-GUID: ywEInUBAF1_zWLDMJiP1lr8Y7xMTx5Ud
X-Authority-Analysis: v=2.4 cv=JagpPkKV c=1 sm=1 tr=0 ts=6af443e8 cx=c_pps
 a=/HvL1LX/IhLcM0VBVohJhQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VR1promVH_wC2_DKSM4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 11, 2026 at 10:20:03AM +0000, Charles Keepax wrote:
> On Tue, Nov 10, 2026 at 01:30:52PM +0100, Krzysztof Hałasa wrote:
> > I'm trying to use some audio on a certain new laptop:
> > DMI: LENOVO 83R0/LNVNB161216, BIOS UCCN16WW 08/07/2026. Aka Yoga 7 Slim
> > 14ILL11 or something like that. Also LENOVO_MT_83R0_BU_idea_FM_Yoga
> > Slim 7 14ILL11.
> > Linux version 7.4.0-rc2+
> > Ubuntu 26.04.01 LTS.
> > Kernel config is copied from Ubuntu 26.04.01 LTS test kernel.
> > Lots of ACPI errors in dmesg.
> > 
> > Tried 7.3.something first, no NULL ptr dereferences, but it tried to
> > talk with some ghost rt711-sdca chip, and the sound didn't work either.
> > 7.2.x, there were some topology problems or something, apparently that
> > was fixed in the tree.
> 
> Not one I have seen before, could you re-try 7.3 but with this
> patch added:
> 
> commit e0cb731652a1bebf962086f17d1b7c9d060cb7d6
> soundwire: dmi-quirks: Disable ghost rt711 on Lenovo Yoga Slim 7
> 
> That should fix the ghost rt711 problem and would be good to see
> if this is a regression. Pretty sure it is but probably makes
> sense to confirm first.

Having a look around, I also found this patch:

https://lore.kernel.org/all/20261109102536.357134-1-ghidoliemanuele@gmail.com/

Which does sound like it fixes something that sounds very similar
to this problem. So trying that patch on top of v7.4-rc2 is also
probably a good idea.

Thanks,
Charles
