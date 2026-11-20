Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191142;
	b=sMAf/LmwNEfWkRnH4Xy0pEOfW8M6bvlqY3BF3WpUkRiF+ki3PDEIdWjIbo7NzXdZ2bET
	 WtNV3nFNTUl6Rw1fs4fSP6ETJvBMwDjOHvqOTMgXs+wm1d1EaJRarTz+zCVM24H1xa7Az
	 RN5vZ09nCViM6uDOKrmflafX1VpGEfWDH64SyT2wWyECZQikXFEQcIz2WSA96A2n/0Bd9
	 yfGTOTBrBLuSWND1Q2gWP/4NcbFEsXI9Kr3F6lMrEpo8II5MM/yci7r9RHyncIHJ9Yvfy
	 pQuexa+RT4kDyszcyzI9zZIwS/QGPbjaxug/9lA5y7GWS9ejqVP+w6SOUDOdodPTuaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=7j6ZOB5q+ngT0PEKYdYJP1WhtPr2P4K4HWwSKGBe/Cc=;
	b=Lu+oi2zyOfEkhefR9EkLmeoWcVxO0GX53N9xNNz8u6Ubp34JGdm+Vp0Y6mzGtlDu//U1
	 Uu3o+B27augniMTUa6y4lQCdKNibWs2jU0TUKb+PqeKGUn4NH5Ar90CBXsBP0XNsBfFTe
	 XmGv8tRNOdNpPENzvV/jcz+66Grd+21iutLTqfS21S0FkhNfnvajlFQ6FjFW1Nk+4+DB2
	 T1wIQXhATi2nLHxhdRw0MhZSfE7n9u2HeasxPLPHy5bkeI6ARPOJAur6xFJBWzuS8VaPd
	 oF/77F2bH0SVaLEa643/8o09asUeiLdKuCdsc29xc6j/tHCHA34wVCR2hqOwW/FMFAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="BMcUJd/c";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ze05+H6j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AF0606A336;
	Fri, 20 Nov 2026 16:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6AF0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=BMcUJd/c;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Ze05+H6j
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFll7I918391;
	Fri, 20 Nov 2026 10:12:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7j6ZOB5q+ngT0PEKYdYJP1WhtPr2P4K4HWwSKGBe/Cc=; b=
	BMcUJd/cG5pbS+VA8NihzJZ3cpXquwtr0qFkWIFWAIHXcSr/dncy7V1dl6jFt5F8
	07qc2AE0r2CHfyVN8PzvGsvFNpcg0H+r1yABGO5iHCcUIPR4Ki29YSk9mPfsLjj8
	tfdBCzXcEWcV+ffOEUcD+g1/nyVybNEZYAxD2k9ftk8gXbDFBrHwjbSA4n9ywXbo
	Ki8vJKzMCPv/pttCOjHELawt/fj2+iwVXvi395K/T0+2ioTtZxECOMTT2IvoL8sg
	e7Q8ejhsiFzEIWA2tDPBoSjKzknr+vYurJUtJav23BqQrq2HsMp0TvCyNumFC1ke
	AsIixdQEQW0JAYU40AOX5A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021072.outbound.protection.outlook.com [40.107.208.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjb48-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:12:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6i436hi/dVQwQM4OpejPl112q4E6ZM9VI6XpJ9BdOA+UZbdbyzhg9T7cf6Lds3haKoEYMqUBafw/gwm0ceFDik5jX2dFVWBHxPrG5NYiwcrse+Y8IrO39etqs+/mG+KlI6823RZXIMiRddUxKRmP94BTBfOGMgQ5TPtyEHg0gQ/QhtfYCLWaQFWfgMIZWa4EZDt/pN+QHs0sVH58d+Myhb6BhhrWTyWCwKbXPqfNOT+s931t9e8LiLNIi0/9H/fABuqfoAw3Y2yP9gBIsKMKjZFD1mjzk9K/orzoZzvoA8Oa7hZ8JVt6AUqKfzVyCCfWiMBOxkNCqbzvXac8TH0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j6ZOB5q+ngT0PEKYdYJP1WhtPr2P4K4HWwSKGBe/Cc=;
 b=qhNM4FOvy3uJXhsG+I1FKoz1dpc73wZzvQ5uPOtqB8mHJT4NNni3YW1smpdakoRxJiNc/maFImijPvZDv/uPjL96aLb9usL1TH61tPHMCsICludETsta6yPEhggUzrF8tle71GZnbHSH9TKIHdpcm7Q965yhzeM/P7V6FDrtDolLOs31AxqG0Slvrjxfoyo1l15DKpR5fUNtqPwwpRy9Wd9lkl5RH1xODgPxYuiPA2FTlVm3TDsX7gkEpW/zSIvLyfHBgkdIAQqFVeEVj5QyzBGVYSqDsc1INn81+ovSywU7GfsUCSKocAlWpWtjURhPzSSx25TxGOEbzBdfJRMXyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7j6ZOB5q+ngT0PEKYdYJP1WhtPr2P4K4HWwSKGBe/Cc=;
 b=Ze05+H6j7yRSNiEh7tTqaysoAcP5cxddNd4CS6HqBAsID8uC0V3Gg4f4vUXq1JQV3SYtoRe0y2URHwcmbKr7qhC4a9Stme8RvvuCBa6ln1nkfrRBVQ1otrFFnpe9PpFULA3u0c4w0WrT12aWJLwioctDRxmQ8okr5St1tPf0SBY=
Received: from MW4PR04CA0085.namprd04.prod.outlook.com (2603:10b6:303:6b::30)
 by CY2PR19MB819635.namprd19.prod.outlook.com (2603:10b6:930:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:11:51 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::a0) by MW4PR04CA0085.outlook.office365.com
 (2603:10b6:303:6b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 16:11:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:11:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 656ED40655B;
	Fri, 20 Nov 2026 16:11:47 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 27430822542;
	Fri, 20 Nov 2026 16:11:47 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 7/7] ALSA: hda/cs35l41: rework how firmware requests are queued and flushed to prevent races
Date: Fri, 20 Nov 2026 16:10:53 +0000
Message-ID: <20261120161136.157593-8-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
References: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|CY2PR19MB819635:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0bff0ad0-68fd-4515-b6a1-08df4720fc0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|18002099003|22082099003|16102099003|3023799007|11063799006|56012099006|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	q2utvcEiv0VtDIIdtNn1EhOAwfN3ZpZnr63/mstO0L8Y6MA2d4QJ8lOqJP4DS+03t25HfxWpZYfvUTINwi6oUMxxGs4AGktCnjdYOmYAkgdtA8uLferfU0U3WyxbLtaexCfbnf1+/lHPS4ZQEKfCeW+oU5GtdMcQ8sDzFvKlO1Zr4JiUJ/wT9SxIYt/m//EAU+JqQ7cie8dyOFYy0zEH2r5aymq6oZQLczCWfn0UDVtiajU7+bCY497DfoF/BMNPJzeA9gxKRk0gFfRiU41GLLYWaqBvEiIW2KzMgYlHAlqx7/0M2V3P6edIaTz89WQ5gceTPn9Irhf5+jkPRDEcp6Ei2TUmJI/pAYF5dKGVfSfgq6Lfgx0d+oY58pV3+i0Cr2766YdHOOJMCWzjpo6iLN+b6q/QLyWLBoiCTdlYPQo2nvlxXdnV1/bGXxdOonRWYJhjwm9qJ4ZxLQNPcyIbni7lbSSDY6gJXkWP/rX1Zoa2J8gA3Uv8lPDDbS8cas3CZqHZFlCaFI8CBsA3yU26mzPt/T2J/q8G1oCbjMRjhirwBxU738G6XVsClW5/s4g9t2DcIGnZrugrpzKxSA2y+MMjt4qbAl8t6dy4BMl2uh1fmlBICvpmSFVOjyaXqPjfv07G8S3TCqag3apRXJ9/1oMkY+Dkb3mWF4wJ7j4TQyHiaKbBRLm6rGucubqNYdkQe+RVBwgg90CURukCnbO89A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(18002099003)(22082099003)(16102099003)(3023799007)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	quoIA9isUwumG/AA2IhkGBpBEY6XHmvUbu1n+mg8yeECOsTAQsZuPDg2W17oZH4PMwG2bOTPr2V9F1PeVka9r2o86mLUoqAlV54GIkB+xFsI8WAWyLZFBP3qkWqm4OLIpEF8/gu9X8PMatauD46uaCp6A3GywkCAfUNWvbqx0q/0Ickv3eJ3Ohy/oaEP+dhbLansg57b2fmmy0tu/EqEe2uv9Q4I1TWE1N7RnOOKTZQ4JeLCcmEQRH1fOEVRU1vo7znGn6adBoBRHk6ujGxABMWKcQD3cIQTYyC6nXLFTNfAMyxuMxXkeW6ox+xc6vWU1uwHQjkWqcoUCDmxfcoeGghFo+7RcgSuRODv0ScBlTzejoamqGdBH6QMF5t8R8LGRTDgu3718BUO3bAob3n8cys5sZyG/m8vhD3HZ0DCoDewxo8f9ZUBBIiK+hsvKLlL
X-Exchange-RoutingPolicyChecked:
	J+Dwdc97BIqtchtF1/v/PrylrKJU0IkZeb0FSaKnaoemmfnZ1xnYnGJXBdnPrjDVMECqdqcHEBuwI9EdvcrzqVMO41WnC3k6k/3ymGowrAdVmNMx9tsUn+nrJWl9sCVyyL+f2MZYvXogkWSWdvd75XGNhWyrgScG6QB0gRvTUw/ehiZ0nuOYBLoB9cO6migvrC4QEmAQ+wLoWp0jiHnncXEIF9J+CpwckAsh+53a5T4SssZdzXMF7uuojSeg0qyPcrFWQbN2x029rE5oliVjWGpLbf2cNsSOssV8633lscBLTVF3j5eVqP/x8GcpO1ex74/F9XTa7hR81FU+7mh1lg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:11:50.0040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bff0ad0-68fd-4515-b6a1-08df4720fc0d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY2PR19MB819635
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX2XFN4LLgXhyG
 P2pE7mr/1Gi4rDSXnd6/LfapN4EI7yn25GxpV3lR1kYdEg5RhUDcFCT+mOczS1c/cFxX95NzhHN
 N2juOVFUn/01FJUcWZ702QpVguC6qVR+koXXUU0aIKut1Co694iAsR5arVQvVGHqiA3FrEbNwTi
 r5OSavP08ZIXqIBa+Mr1KsSx9TNKxK/wfuMg6pY4V88saxs9evagybCdmVNHEmtGv6cOrTyLhKI
 82V17kXGBX8X+aWza6TQR9fRFgA1jeLfxonfXtt4JHKQVoDl0VGNwHOq5vbmxQd30npcMfvg33+
 +2IUHQtLEPFmGretkMAd5v5y6DS1wznJFQLfmd8SwTdKYLu7f3077UHVJrmduQyXOHyGtOJQRx7
 De9NWZl+i+gU8hInNa1/5b8GLHes7AWcUwEebEr0bkUm8yXWnLbfASBs9ur6YWYVEpCy9aSGBtx
 y9XC86Ean/ooShXCo7g==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b007152 cx=c_pps
 a=iw7oLBvYkO7Cn1VXvgkbEg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=QZhCBxU6JqVPGuaT7xIA:9
X-Proofpoint-ORIG-GUID: gtQEG5uPHIWSXjQYJHbKzxS7BQKDL2CI
X-Proofpoint-GUID: gtQEG5uPHIWSXjQYJHbKzxS7BQKDL2CI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX2WvQMLH25B+W
 Dew8vE3f0GCuBlo02xTfw2CaHsFqNQxcKA81uT42DRsd8LWC28+rJcJJnRyX1WgH5QkoXOWvqMU
 IEmlw//OA9pAiuMivflLF4Zot6ZjzBQ=
X-Proofpoint-Spam-Reason: safe

Currently, in a small number of scenarios, the firmware on CS35L41 can
be reloaded:
- Using an ALSA control
- System Resume
- After Playback (after System Resume - if reload has not occurred)

In all these cases, the reload is done inside a work item and
scheduled on the default workqueue.

This should instead be queued on the system_freezable_wq, which ensures
that the work item is handled correctly during system suspend, where it
is not allowed to start whilst the workqueue is frozen.

There are 3 main scenarios where we need to ensure firmware load work
is flushed:
- Before System Suspend
- Before first playback after System Resume
- Error Paths

Register the driver for PM Notifications so that it can correctly flush
before suspending. Ensure any firmware work is either cancelled (if
pending) or flushed in the PM_*_PREPARE notification callbacks.
This ensures that the work item completes before any workqueues are
frozen. If the firmware load work item is still running when the
workqueue is frozen, then it would ordinarily be flushed, but may hang
on waiting for filesystem access in a call to request_firmware(), if
filesystem access requires work in a freezable workqueue itself.

Additionally, ensure that we flush the work before we start playback
after system resume. This ensures firmware is loaded before we restart
any playback after system suspend.

We also need to re-queue the firmware load in the PM_POST_* notifiers,
if the suspend was aborted before we finished suspending, but after
the PM_*_PREPARE notifier cancelled a pending firmware load.

Fixes: 88672826e2a4 ("ALSA: hda: cs35l41: Support System Suspend")

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 129 +++++++++++++++++----
 sound/hda/codecs/side-codecs/cs35l41_hda.h |   2 +
 2 files changed, 109 insertions(+), 22 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 6f4b2088c5fe..512b1a009476 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -12,6 +12,7 @@
 #include <sound/hda_codec.h>
 #include <sound/soc.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 #include <linux/spi/spi.h>
 #include <linux/vmalloc.h>
 #include "hda_local.h"
@@ -603,6 +604,38 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 	return 0;
 }
 
+static void cs35l41_fw_load_request_unlocked(struct cs35l41_hda *cs35l41)
+{
+	/* firmware request is pending */
+	if (cs35l41->fw_request_ongoing)
+		return;
+
+	/* no need to request firmware load if DSP running state matches request */
+	if (cs35l41->cs_dsp.running == cs35l41->request_fw_load)
+		return;
+
+	/* block firmware load request if suspending */
+	if (cs35l41->suspending)
+		return;
+
+	cs35l41->fw_request_ongoing = queue_work(system_freezable_wq, &cs35l41->fw_load_work);
+}
+
+static void cs35l41_fw_load_request(struct cs35l41_hda *cs35l41)
+{
+	guard(mutex)(&cs35l41->fw_mutex);
+
+	cs35l41_fw_load_request_unlocked(cs35l41);
+}
+
+static void cs35l41_fw_load_cancel_sync(struct cs35l41_hda *cs35l41)
+{
+	cancel_work_sync(&cs35l41->fw_load_work);
+
+	guard(mutex)(&cs35l41->fw_mutex);
+	cs35l41->fw_request_ongoing = false;
+}
+
 static void cs35l41_shutdown_dsp(struct cs35l41_hda *cs35l41)
 {
 	struct cs_dsp *dsp = &cs35l41->cs_dsp;
@@ -617,7 +650,7 @@ static void cs35l41_remove_dsp(struct cs35l41_hda *cs35l41)
 {
 	struct cs_dsp *dsp = &cs35l41->cs_dsp;
 
-	cancel_work_sync(&cs35l41->fw_load_work);
+	cs35l41_fw_load_cancel_sync(cs35l41);
 
 	guard(mutex)(&cs35l41->fw_mutex);
 	cs35l41_shutdown_dsp(cs35l41);
@@ -811,6 +844,7 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_get_sync(dev);
 		break;
 	case HDA_GEN_PCM_ACT_PREPARE:
+		flush_work(&cs35l41->fw_load_work);
 		scoped_guard(mutex, &cs35l41->fw_mutex) {
 			cs35l41_hda_play_start(dev);
 		}
@@ -821,14 +855,7 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		}
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
-		scoped_guard(mutex, &cs35l41->fw_mutex) {
-			if (!cs35l41->cs_dsp.running && cs35l41->request_fw_load &&
-			    !cs35l41->fw_request_ongoing) {
-				dev_info(dev, "Requesting Firmware Load after HDA_GEN_PCM_ACT_CLOSE\n");
-				cs35l41->fw_request_ongoing = true;
-				schedule_work(&cs35l41->fw_load_work);
-			}
-		}
+		cs35l41_fw_load_request(cs35l41);
 
 		/*
 		 * Playback must be finished for all amps before we start runtime suspend.
@@ -925,6 +952,45 @@ static int cs35l41_ready_for_reset(struct cs35l41_hda *cs35l41)
 	return 0;
 }
 
+static void cs35l41_set_suspending(struct cs35l41_hda *cs35l41, bool suspending)
+{
+	guard(mutex)(&cs35l41->fw_mutex);
+
+	cs35l41->suspending = suspending;
+}
+
+static int cs35l41_hda_pm_notifier(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct cs35l41_hda *cs35l41 = container_of(nb, struct cs35l41_hda, pm_notifier);
+
+	dev_dbg(cs35l41->dev, "PM notifier action: %lu\n", action);
+
+	switch (action) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_SUSPEND_PREPARE:
+	case PM_RESTORE_PREPARE:
+		cs35l41_set_suspending(cs35l41, true);
+		cs35l41_fw_load_cancel_sync(cs35l41);
+		break;
+	case PM_POST_HIBERNATION:
+	case PM_POST_SUSPEND:
+	case PM_POST_RESTORE:
+		/*
+		 * If suspending is still set, we are in the recovery path - reload firmware
+		 * after failed suspend
+		 */
+		if (cs35l41->suspending) {
+			cs35l41_set_suspending(cs35l41, false);
+			cs35l41_fw_load_request(cs35l41);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static int cs35l41_system_suspend_prep(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
@@ -980,6 +1046,7 @@ static int cs35l41_system_suspend(struct device *dev)
 		disable_irq(cs35l41->irq);
 
 	dev_dbg(cs35l41->dev, "System Suspended\n");
+	cs35l41_set_suspending(cs35l41, false);
 
 	return ret;
 }
@@ -1078,12 +1145,7 @@ static int cs35l41_system_resume(struct device *dev)
 		return ret;
 	}
 
-	guard(mutex)(&cs35l41->fw_mutex);
-
-	if (cs35l41->request_fw_load && !cs35l41->fw_request_ongoing) {
-		cs35l41->fw_request_ongoing = true;
-		schedule_work(&cs35l41->fw_load_work);
-	}
+	cs35l41_fw_load_request(cs35l41);
 
 	return 0;
 }
@@ -1320,9 +1382,11 @@ static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
 		return -EBUSY;
 	}
 
-	cs35l41->fw_request_ongoing = true;
+	guard(mutex)(&cs35l41->fw_mutex);
+
 	cs35l41->request_fw_load = ucontrol->value.integer.value[0];
-	schedule_work(&cs35l41->fw_load_work);
+
+	cs35l41_fw_load_request_unlocked(cs35l41);
 
 	return 1;
 }
@@ -1464,7 +1528,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component_parent *parent = master_data;
 	struct hda_component *comp;
-	int ret = 0;
+	int ret;
 
 	comp = hda_component_from_index(parent, cs35l41->index);
 	if (!comp)
@@ -1494,8 +1558,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		dev_dbg(cs35l41->dev, "Firmware Autostart is disabled.\n");
 	}
 
-	ret = cs35l41_create_controls(cs35l41);
-
 	comp->playback_hook = cs35l41_hda_playback_hook;
 	comp->pre_playback_hook = cs35l41_hda_pre_playback_hook;
 	comp->post_playback_hook = cs35l41_hda_post_playback_hook;
@@ -1510,9 +1572,18 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	mutex_unlock(&cs35l41->fw_mutex);
 
+	/* Create the necessary controls, do not create them under fw_mutex */
+	ret = cs35l41_create_controls(cs35l41);
+	if (ret) {
+		dev_err(cs35l41->dev, "Failed to create controls: %d\n", ret);
+		goto err;
+	}
+
 	if (!device_link_add(&cs35l41->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
 		dev_warn(dev, "Unable to create device link\n");
 
+	register_pm_notifier(&cs35l41->pm_notifier);
+
 	dev_info(cs35l41->dev,
 		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
 		 cs35l41->acpi_subsystem_id, cs35l41->hw_cfg.bst_type,
@@ -1520,6 +1591,15 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		 channel_name[cs35l41->hw_cfg.spk_pos],
 		 cs35l41->cs_dsp.running, cs35l41->speaker_id);
 
+	return 0;
+err:
+	memset(comp, 0, sizeof(*comp));
+	scoped_guard(mutex, &cs35l41->fw_mutex) {
+		cs35l41->request_fw_load = false;
+	}
+	cs35l41_fw_load_cancel_sync(cs35l41);
+	cs35l41->codec = NULL;
+
 	return ret;
 }
 
@@ -1538,7 +1618,11 @@ static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *
 		memset(comp, 0, sizeof(*comp));
 
 		cs35l41_remove_controls(cs35l41);
-		cancel_work_sync(&cs35l41->fw_load_work);
+		scoped_guard(mutex, &cs35l41->fw_mutex) {
+			cs35l41->request_fw_load = false;
+		}
+		unregister_pm_notifier(&cs35l41->pm_notifier);
+		cs35l41_fw_load_cancel_sync(cs35l41);
 		cs35l41->codec = NULL;
 	}
 }
@@ -1970,6 +2054,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	cs35l41->irq = irq;
 	cs35l41->regmap = regmap;
 	cs35l41->control_bus = control_bus;
+	cs35l41->pm_notifier.notifier_call = cs35l41_hda_pm_notifier;
 	dev_set_drvdata(dev, cs35l41);
 
 	ret = cs35l41_hda_read_acpi(cs35l41, device_name, id);
@@ -2076,7 +2161,7 @@ void cs35l41_hda_remove(struct device *dev)
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
 	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
-	cancel_work_sync(&cs35l41->fw_load_work);
+	cs35l41_fw_load_cancel_sync(cs35l41);
 
 	pm_runtime_get_sync(cs35l41->dev);
 	pm_runtime_dont_use_autosuspend(cs35l41->dev);
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.h b/sound/hda/codecs/side-codecs/cs35l41_hda.h
index 64ee70c31a43..b374836e8537 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.h
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.h
@@ -78,6 +78,8 @@ struct cs35l41_hda {
 	struct work_struct fw_load_work;
 	struct snd_kcontrol *fw_load_ctl;
 	struct snd_kcontrol *mute_override_ctl;
+	struct notifier_block pm_notifier;
+	bool suspending;
 
 	struct regmap_irq_chip_data *irq_data;
 	bool firmware_running;
-- 
2.43.0

