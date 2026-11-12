Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794492289;
	b=3fv94F92ZpetWeHEUoT2FXaygThw4QN7Twl9qBvoVyhnlpsydxHAejF3VD74XKn/isyc
	 CxB2w24o87ILiiFhkOJRWevSVJPCHFRSzVEsNvLBATr6QPOGSyepevx6EQfv2aTt2R1nf
	 LVFT3j1FSVvRb7oe+InIi3c3pmYLKWucQzhof9wE7S/azwh2JhbHolAEy/t417wT0T5rG
	 QeMIVbrCDt6qIPoLDwfzdofaq2q7bERnnupoRhCUIMI17HEITWw+WVzlaXeNqE1MPZMNX
	 mOPsmTj0rRJnykK3C4utU5enJuxy3+wwUonx/FIhXra+tVzMryIK4tXBrreaGeIDohg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492289;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=iKwrJhjzY8A/OJMX+ekxR5Ts2EoJjSc9lGkVfx3M044=;
	b=ddmlh6jP/jyAbJyF/eqYpdHwcQTTLQzyKIQyF0ke1oXtGmYILDVn1wUWnepuXAelIjcc
	 5WY6bxVDbP68GZufahgCU0W4nj1Avhcu30o+5S6IxFNTr4b75jobPlxB8CFDBq1UDG1m3
	 GGUP/fp/27phJ3JgQbmlrRmaq6dNsPpR91d7rhpwgDJ8jC5/goEdbCXP0qCAuM0RhBCCd
	 U+ie5oir9Uk/L6GxznRGxKF2VwlesFos1k89XB1pEWAkmmsqOb964Hpw5LY008oN2hvYR
	 Ezk0GcejuNwafcStn5gn3WZ1tITteu2Vau5ytRkCIDjAoyiDCrUVD17CKzejOjaIUfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="N/fzHrIQ";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Sy4NqWqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9111C606AEA6
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 14:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9111C606AEA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=N/fzHrIQ;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Sy4NqWqs
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACDG8Ls2060562;
	Thu, 12 Nov 2026 08:04:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=iKwrJhjzY8A/OJMX+ekxR5Ts2EoJjSc9lGkVfx3M044=; b=
	N/fzHrIQ94mING7Z9Sc0Dmf/TYaSuKPnsu5LLNmch8cFEzF4WcNET8gBRqjPaOYx
	nOUniYc8/JosMnA90K3PN2R8014unheivjJvi/p9cJDfxR9pp4cFWtwCxR60D18e
	2uYvf3FWEOB1xJLsCSnN1xzwmq8qIIKnwBo9BtB9Iw5r5xeVC+7/erpHZB/fJJPI
	3wcFEh+qgXEO3zJ595w59JhyGBhp1BoE7y1GqruCVEMrBa+fKEzi3CZBimWv2aX7
	VlFH/NovAzom5iup1XIkVzp3t7pLAa+9hzJuP00QnX3o7mZCnlhTP3lwrKORDHRX
	iRxHjdR3lZ2Ini5fWHNdgg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020123.outbound.protection.outlook.com [40.93.198.123])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hwcfpg6rj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 08:04:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oix8jhwWM1XIaj5ilaJ57JXmpZbjtbGM9rNLnjBsSTUzTAzr+WHxL55nr7k1mg+shq+D2AVcCnHkzMF+nR5oFNIP5trnLnngY4aFdHKllus6wocsj7AHMNQ68RqAPB4+9jL15yJkRXMgMpFgJEc40h0JKNEHzwSnCSECIet41z8Ntv17Uk5tRAT+k309xza9757rus6skq1pDVCxHjxSLttEP22gksDQ70Ddjn1ju8q4Ksep7ZHpH4DcO9UvwC0lt16T2xWPsfdLmaSnThbwcoraoNNlmOlSdRV5R0VD03wuQy4UFLtKNRID1cattRHASvkDdWm/KABcP3oPVn5sQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKwrJhjzY8A/OJMX+ekxR5Ts2EoJjSc9lGkVfx3M044=;
 b=JXWyomly2iVZtmTz+ky1fat+UKQ1OaOR4BR94bnNh7gE06Gd5XSKuQwgbItirbVpxh+FHJGAlKvP6SyPWhJbKNLCeCk94kmjtWdFHwf+vjutXsCS6EL22pU32q6ENMxahO5kmbENEPsw9zDIKQTx/yekZDYtqgCp3hcbQoEawGOMrpbsDPMUkf/dn+PPvt6b8HFi4dFsSlBlOdFdKTjDbtesJvCkM+4XJ5M0URzwVoTQX9VjiLSi8voDWFyP/iic2t+kwT63c4B+x0F3VlmL3x+hX99okiShGgdRD8Vqnqz97n1DN2VEIGsVopV4US21vmBcKcUEm+DdOUYj+c6pLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKwrJhjzY8A/OJMX+ekxR5Ts2EoJjSc9lGkVfx3M044=;
 b=Sy4NqWqsoZo5tj1cdZOZO21Sf+UGDnwYAnqzJ3vxYkil4QQmuf+tm2DblB7LZOsLjAdlRqqAstrdopdICi7RDGNwfocxTGnXVsEgimbn6KLwhO3sRZaeGLDdqXR4wF0L12EFfmMh+pdV5xh8pnuGQICKtuwLc4FGE7dH4O/pV5w=
Received: from YT4PR01CA0466.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:d6::8)
 by DS7PR19MB6232.namprd19.prod.outlook.com (2603:10b6:8:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 14:04:31 +0000
Received: from BN3PEPF00022BC9.namprd05.prod.outlook.com
 (2603:10b6:b01:d6:cafe::1) by YT4PR01CA0466.outlook.office365.com
 (2603:10b6:b01:d6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 14:04:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BC9.mail.protection.outlook.com (10.167.248.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 12 Nov 2026 14:04:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 382BB406555;
	Thu, 12 Nov 2026 14:04:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 16B6F820273;
	Thu, 12 Nov 2026 14:04:29 +0000 (UTC)
Date: Thu, 12 Nov 2026 14:04:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: NULL ptr dereference in cs42l43/cs35l56 on Lenovo Yoga 7 Slim
 laptop
Message-ID: <avXHa+ulgn9R0hc2@opensource.cirrus.com>
References: <m31p8sx403.fsf@t19.piap.pl>
 <avRBU4NbuLEyygl3@opensource.cirrus.com>
 <avRD4MM8YLzPht/c@opensource.cirrus.com>
 <m3eccquqxs.fsf@t19.piap.pl>
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
In-Reply-To: <m3eccquqxs.fsf@t19.piap.pl>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC9:EE_|DS7PR19MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7eb3cf-9f66-4464-05b3-08df40c5df1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|82310400026|376014|23010399003|22082099003|16102099003|18002099003|261009223027099003|4143699003|11063799006|5023799004|56012099006|261022105027099003|261102123227099003|261026121527099003|261021121427099003|261026140227099003|10067099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	xdRc+3MoscZ6XRDh5KAHfdlh01vuDnjUlx6FYwaY06CXlEJXiZWcS5t8vj2EJMzIthcbgPep/piBFNCuyNA8bndLl9Y8aGnUZ0fhhzQthMSAgvX/uRzXAxoA8/3jiy7H9vSS1ZMFfmSThC01aT5Re7VAS+2CH+Gd6U8m2ka6Ohgo+PixFwIbOa6kkYVW6moU2hYIa5o6KHueSzF4VpHfjZD4uF4m0kXcjSZmvb3bU4/7XnPS+tzLI/UaMx8EY2CxBb8tf6R2vgFkwvJI4RGSh3V0GaiTIow8nPLkhlCbQVya7yXoEmKmdtLdO8Ih4EwOXXGTiGtbYgiSy7dn7o+x7Cuqm2QvUnCUmj4dHbMIxWAtO9JNL5l+s/vK5YT0IZvyJAnJg5LaXxSmzrvF4A47g/lGSj3yS6SDH2IjZw4PwtgxZSWa9Eb62QPspKhpdGbKni0ii0WkmozDpHGL7zkW5whRhHQPt8wNqFn7wk2qE0T8ffRdxYyg9f7lYxNhWKGO47pKtP+MvC1BUW4hanh5KOJVxJay4l2WmSR+ogY0iN8gd0RmEs3e982iIxz7uIAJ7bPjfTustY7QdtbHe+zVIf14wiyho6vdU18KjvmscCSMIHO7+9imGU1gneA/2VHjvvJdc/9lzbNXLwUSJgYss2WdXttVvtwl+1qE2eSieuJV3wHtL3w4P3/UjCUGLAIWURXPbLt+PKbFLLr1K/CfBA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(16102099003)(18002099003)(261009223027099003)(4143699003)(11063799006)(5023799004)(56012099006)(261022105027099003)(261102123227099003)(261026121527099003)(261021121427099003)(261026140227099003)(10067099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wJu7oXeqLVPH8ZHOBvx/KYExdb4AAZX5rJtLmvzqL2uVZXbAq5nG3eyKM0LC2nbJJzY44Q0utpHKdK0k8r3OwLiPIB3XXDKWlrzjtRATBURsgKdByiikFHGKIUtaGYHI2/Ge3v0o44KTqsU+w8GhCo6nhCaRpLgcjPys0hkpBFFWK1IHXNl3KYO53SvJePEcUBDCIGEvEmoFA4hR9AhpvySJbdBgpNiBSQMww9HbZSjhJCHd9wOH2P7L62YZsPZ8vP9O88NRMbsUJxTWyFyUfP0/6OrMmd+mS1wswlLxS1fDmw3nwmahhovEqkwZQIbipNg9dYA5yi6oo7J38evQF5tu4/xmf/OYlBnDzR7LPyc08mrjfCRvWPz6X8aM0GeG9rnyIDKaIXpAufEQwyfvzKFlYocjeXw3Oe/HJ/kPDibgxppGPoBjYfW1DCIIeOPK
X-Exchange-RoutingPolicyChecked:
	vI6sfsobLbOD4TUtap/NELBGI2IG/BK0Ggr+VNbrgnvBQ398BdaEKcpjcYLkw8QBaNoW8Vi/LNsRURfekkea0+iTlNoI6ZrS3il0OJKr/SjAw2dOZdweHyllr4sZ9zm7J4QM+OGSrGsdnEt5m7I2sPtM44PBpR7b+0csMTk87UAUVRuR5j/rZPLJTHxyrNdzCHSfJrnE4WFsWap3gOCyN+vqEKJwbz9wB3uiq1Q7c+dpsSY9NftneycV1Sd3sOKQ8D4p2bo3b+kJKNFIpM6PZvaEK75RVNcjAkPts1JVeDMxUUpAV45gzleExiPvPPO/fwSNP1PSk6aYD3eaTiqkKA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:04:30.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7eb3cf-9f66-4464-05b3-08df40c5df1e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BC9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6232
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX0JzeYER/f5Ea
 5UTN2jsRgPjRO92uQHiBaUYmLAq2V5Li7vX9ACZp3Ah3/K0vbcPt/qXqcB6szbBTCf3S1rg8g1D
 NLWhQICkqhLzpzL6kdkK5YQce9KG8fWAOmkZwcDOAfQ0k7yuDTj4uCyzQnaoOBg/4Qms9hiw06N
 oxXpb4Vv45YZvPT7Nvt6eBa67jYAhHScPDc5tTKglEXNwxC7erODTDWvlDJiPRMJUx9SvARPgWS
 ud5ZiDy1P4YDBNxSDdDqaE16HIuIanrZarLcOFlBh7sSyn0/6S/YSseXtKRZxOOPERYnB/NPLC8
 +LrKMEW3lhjgHYURmYlmTjzdg5JsDL3RSpNcxJyvlJk2Jwf3fr1Vy6fdKDTF8PdCdHWi9Lp0Q99
 5xqZQnmjbU4Zv4Kj6uFdoyvIvFUTEUcjpTtvX9LlJ0ppnE0YqTV87IpvmahDn6Vd1A/N1dqhTJr
 lO9sF6ICICPpdF1c/CA==
X-Proofpoint-GUID: q1mqc9YtHQtjdH01GV2bzGpJrFlihvU4
X-Proofpoint-ORIG-GUID: q1mqc9YtHQtjdH01GV2bzGpJrFlihvU4
X-Authority-Analysis: v=2.4 cv=Woi+otfv c=1 sm=1 tr=0 ts=6af5c775 cx=c_pps
 a=mLoR1drGahLtw5ViIJY7rA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NEAV23lmAAAA:8 a=w1d2syhTAAAA:8 a=HFQv9o1uNTTfzO5HtugA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX0djqOyiDi70U
 vc2NiXUn9GiVewXzacScW4ZoP+DUcgoJyjOcGccuomFLtoOOfjFPTFPolCbesLy0jq53ffBNUUy
 nUB7nNj9Etg/xf5zlaQAe+W4IYFN98k=
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 12, 2026 at 02:20:31PM +0100, Krzysztof Hałasa wrote:
> Charles Keepax <ckeepax@opensource.cirrus.com> writes:
> sof_sdw sof_sdw: Loaded FW: intel/sof-ipc4-tplg/sof-sdca-1amp-id2.tplg, sha256: b92f8736b0b3557c4030a3a82cd31d47a244589fa3b91ad8b3d4c469ebba27a7
> sof_sdw sof_sdw: Loaded FW: intel/sof-ipc4-tplg/sof-lnl-dmic-4ch-id3.tplg, sha256: 79bd0bb781e8e30d5594a10d7c37825fc4356b2ac63d5d444c2e485b23ccf8f5
> sof_sdw sof_sdw: Loaded FW: intel/sof-ipc4-tplg/sof-hdmi-pcm5-id5.tplg, sha256: fe798c5e0e927b7bb68349a21b50114b1832254a6f851c2e71a398710970273a
> sof_sdw sof_sdw: Failed to open topology file: intel/sof-ipc4-tplg/sof-lnl-ssp2-bt-id8.tplg, you might need to
> sof_sdw sof_sdw: download it from https://github.com/thesofproject/sof-bin/
> 
> Perhaps this? What could that mean?
> ASoC: Parent card not yet available, widget card binding deferred

I suspect it is failing because of that topology file that
failed. Such a file doesn't appear to exist in the sof repo that
I can see. I think the best next step here would be to get Intel
involved, probably the best would be to open a ticket on the sof
GitHub:

https://github.com/thesofproject/sof/issues

If you could CC myself on that as well. If possible it would
still be worth trying 7.3 as well. In theory this laptop was
confirmed as working which does suggest there is perhaps a second
regression going on here:

https://github.com/thesofproject/linux/issues/5948

Thanks,
Charles
