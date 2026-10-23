Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792749454;
	b=tvDfUHrNbTLXlDAtqGap3nKJDuNuy7qEoT67PEQCUpExeCib3aoHCnUVQ8027mbcCCav
	 kcZe2/PRkkqmFRht6hVD7P9JMTRs0W915f7JNCOZfRZSxV29mF1mt7Z2P3eAlwpeqODD1
	 KdD8uoZSLyN1EukFGSmfo0VQfFl9RtTvmnnijVfxFNNaPKm4gISp31KAU9w2FMLuaL2s2
	 Zw2+aK5tzsYEllA9Zs8OT61ZUopDVRPujaKjvb+c7fCA8KoJQo8FRpD0bCPHA4FsmELoM
	 B8458i6B/Jl++2f6SBOEaVsfh6qiPwPMAyNF1WA7U8uZxl/BV2de8uQmaPy7xfj+QnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=uXEtuCCtpLfGx9kuYw9nOPCSzpzANE9DJDrKIA1Des8=;
	b=f+h/UB3XC38ujbTjxOAqNzwJ1vdiCgcWLtY8Ao9Qj2trG8vM3vMmfsfLZ37zG62YZLss
	 Hxd73NpqwjZdAIXskL5EG7YdurudWgX1s1qpfHIxLH7VHo/U9cXyrlo2nADGzKIK7VAdt
	 eXneAMmpdaiO95cMS5xe+iknImD+uB2hQyjAStsNVoSbaZVjS6/skSRlJmdGuYVTAkvW2
	 zWduyvIpJQnFbYJdGa3IqK8NZS60pUpyupiLI1wrGgOePMKqpAueEiOouSIXXAQrjN5/3
	 ZCtSpKx0Z4X3VxQdd7AjJYBfa/5ZgAmbggm7giWFnzR5JyHWEyqkQX1/oqMZQCnszsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HE+h3JTM;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=hvKQdwmm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC17E606A31B
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 09:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC17E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HE+h3JTM;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=hvKQdwmm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N8wQEA308929;
	Fri, 23 Oct 2026 04:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=uXEtuCCtpLfGx9kuYw
	9nOPCSzpzANE9DJDrKIA1Des8=; b=HE+h3JTMB7lG9FbBPpbdjsOgaINIVnFY+K
	UElrSQDJ/memGKl1Oj9HgjjJriN1l/GfVzqG2SwV6Gxmae2FmqcFGzu3fNsJUegz
	WGUiSILYF2yhJDx3vdO0yGyxolRyjMJNPZaCb6zN2EC/woBxHuuUExN9vk6bOTU8
	y9dm/Fy9y1adz9heVNVlUMiMk4t1EnluBrfriTOQR5VQXZZJSkTpw2PsA+BQM24U
	LsTim7JSNMu/pMznPk52H2AbRcpC8v3dy1Udg9UyzjhkTLp6x+WP9R8V59Xrziil
	XkP1d5kqJ21OfXhAtEva9QYRgJtWUHG6do12T7LBMr9NR+SugNew==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020122.outbound.protection.outlook.com [52.101.193.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hf9809yva-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 04:57:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFTNNmN+clUxgtLrFj7PKO3Kh6DFu2DpaVa0Q5uOztp0YDNjSb1WWl8dFBbcE3KohLjgtUXnly9SZ4z0PAAE6F1FxTyaXsI5lnjiWt/6BW6HGQSpK5jxc3v+A0J8nzV6+gsIvfqS4rv1sqd2mZVXmA1ox+iQGu7eUBkw1qrj4Wa8b55JNiLZ5a/zGFDAM75F7zHESkKjkY2kNia9fO9zBa5zZWCHOhpxxot/VMOQxTdWBicPmxyh8cw3wzhsFC9gTV+NVT/ctI722hr5qI40ohsThz1wzrd+hxe1ITe0uVth+CLoMCnFiDYqpbKKIdEx/ophL705vrisRcRkDZ7DNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXEtuCCtpLfGx9kuYw9nOPCSzpzANE9DJDrKIA1Des8=;
 b=Xhgo8k8qD9p3TpTTGn4spHHOvCGlxDZC/6frE9JT09+Tb/qvgkDa6SFVaUqoIMYMonXWEK5rXWyZIaNSQlXefeygBevZOX9Of8Qgt23l8quH8nD1DrhEtRZKJrOjoiifPW5hhhJX6btt63vKp8I3blNn2j+wTU7raBHRX1OlPm8ib+wcAyDhS5lZTuwg6DogP4IEtKMsDnOR4/JIXS3gndlul3Sl3ajzBWyLZ+k66PsVUbnEincsEsJkDD3eVEV/I+ipdtGDU45ZQCrEvk55L/YilNAmwEXdVnuIjRv1+QHGtijGdwIhXPH41s8UpAPvjugL2oNR9qLgnytw7t6Y6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXEtuCCtpLfGx9kuYw9nOPCSzpzANE9DJDrKIA1Des8=;
 b=hvKQdwmmOrN5at4H79LIiHIhcLZUwaz+Tmw2Z04gC0IvpSk5+081TlEDo4HzvMjKNQAKx7Egip7HSEo88m6PZahNu+J3+hWi8LgMM9wSid9kUdlzhSq7teNfIP/udue6+sJuNJhSG42H0w+YjyTt+JZtZqD/BkIiLWeCjn31LLw=
Received: from PH8PR02CA0037.namprd02.prod.outlook.com (2603:10b6:510:2da::35)
 by BLAPR19MB4514.namprd19.prod.outlook.com (2603:10b6:208:285::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Fri, 23 Oct
 2026 09:57:25 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::54) by PH8PR02CA0037.outlook.office365.com
 (2603:10b6:510:2da::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 09:57:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 23 Oct 2026 09:57:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3EB7C406540;
	Fri, 23 Oct 2026 09:57:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1C11282024C;
	Fri, 23 Oct 2026 09:57:22 +0000 (UTC)
Date: Fri, 23 Oct 2026 10:57:21 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH RFC] ASoC: cs43130: Take the frame layout from
 set_tdm_slot
Message-ID: <atsvgeFtiSW709k9@opensource.cirrus.com>
References: <20261023081457.44579-1-olivier@mgcrea.io>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023081457.44579-1-olivier@mgcrea.io>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|BLAPR19MB4514:EE_
X-MS-Office365-Filtering-Correlation-Id: 31dbf992-bc01-4dd7-031e-08df30ec09a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|61400799027|36860700016|376014|261021121427099003|10067099003|261021123027099003|261022105027099003|56012099006|261009223027099003|11063799006|260925021911599003|261021135927099003|18002099003|260925021311599003|16102099003|260925022911599003|22082099003;
X-Microsoft-Antispam-Message-Info:
	44qHHk/2uYl90YqVWBcY5Jeo6G7sEMvA3zVzBQi56Wzl6DH4u4FYLC2U2RpYsD4fC5bqwOOKc5W7A33zyOQFANQ02zEmcTLv4M2+FdrUWr42j8G031SF2dEz/7eZU/teVgTEC5gK/RnXirKHmTE7a+R52omxU/dx/CB3h4oNJR3ccRnXTvSF7DyesZaogeboHc/r3YADIcWhuvOk7/gJsJGdnvRzypc6abh1wk8rHR2bGLvj+hTO8BJkCXwYDM/SwyLY6J6EFfG3LauDJfFqMQz8TLEzS6N4JfcyNxU91DzZHJz2PF2OToXREPMegMoJRcv7IJrlTlLjTKnubUoy25YZGFbha97BqftvJAqed2Zt1nHbiYh9CaUse9HbGvsEulkZ+0aJ58GyhxBvB5JFQJkNOz2HXByDB3rRHCzRAnhssHihBJSthLWdfI5iNuVAXkyIHTx7hYjC3TYn0P8EJn0lKoLdULOohK/nA6lrZm+ooBrTPivJnD2GtN2wIRPx6whG/GKj3cwH4CmiS3cCLd6FwKrY0nCzUG+AKfodJ2XtxMxt91TxyIK6ozOdp28G+zIY5dKvMeDR+99issg42pqCU48d0WdNujUqfeONBYyz8EhDhhLKXsCl94Z53qjeHlmt82pJLLIvSLktN+D3ApCZB8QySTdUzsD8XEFR3SWH59/IgglCzQHqanepnNsYnF4D0U0+OvLx75XoWcfwjQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(61400799027)(36860700016)(376014)(261021121427099003)(10067099003)(261021123027099003)(261022105027099003)(56012099006)(261009223027099003)(11063799006)(260925021911599003)(261021135927099003)(18002099003)(260925021311599003)(16102099003)(260925022911599003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7tl23XmXExqEcbrTeT9J5LIggqTBP+GIGtsdYRY8UemrgCRgdtmTji3eCKgIQPDUc8b8hw0p2Y/6CZZyBOmdJtzyVymcwpAQsFZy0XCRzN54FGGC3oW2Ni7Ezz48N/0pV8UUnwaRXEn+TLOLNuIRxYRywEaDMrTgI1CgX/BgRLBYn7LZYCp8ELPe+QvF+DODBenDVL6j60zYsoAo/VjEhj5H9k3Pc7pTB8eQLTL19cFc92z6ofUj77pFsih0HYbgl/lojB1WC8Fc8i0Nk0F0yF9AWi8UZ9xefCslqSB+yF0TQsEuRlk/u/6U8w8/uI0lhJ+hcb8SWGZZn18S6XWRQMJfHN4apbX1Kwhs1YKeVQ8Zl/cC1kuqvRyjvQcuYhK8WiBYW3ZU0fsBLSrEWgTVoDSjApyiHiSB6mJuvUfuwNxi5n1XBzAGK3G87jPRqlk3
X-Exchange-RoutingPolicyChecked:
	IXndbPXpeOkCMRPPkdyDTxtidjQcTc8mguvGIBTkBm/Q7LbG+8sawtP7vqFCVzuE7fCoFVJ4/bIpCM0RDi8SaHwGx0jzQMphkDhPV2pD4SJKQKZUqqVl8sBCrlXHJMrC340h5e/WAAw1sxxMWhNBQw9Dz8cvJ8qHjFnRLugKmTF5ZuNSBPTwlin0yi/S8eL1CSxtSBbAYY7jTNnxcQDjsXnbc6LehIhHDu5IMQCp0EaDAhYsMPNfQXY1EXWC3KE+FAyjocDNLEzSRxzduKEaaYqh5E1dY/fP3RfvlckaECMMnmY0rM293uUh2mPyMG2ZWVd19+yvAGfJkHp4xh6zfg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:57:23.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31dbf992-bc01-4dd7-031e-08df30ec09a6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4514
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX9kjwSUQyesZi
 WTnkXtmFq1paACWDqYOHujbHDBZFW2Y4+owuVK/psVtV9z/rqb190mnvaFSPq/aSj5t+rlC3Oyu
 xjNswi8TFpUdYKMGm3ITPU+Z9GxXqDk=
X-Authority-Analysis: v=2.4 cv=Er5HPicA c=1 sm=1 tr=0 ts=6adb2f8a cx=c_pps
 a=PcTxMsyy24f1mGF745e4bA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=L0KLt61N9Dpbe4lsOlMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: NsKR2ksqbAYki3S9ys-tnXh5ExeHxYrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX9p7koJKOnaIL
 28JiqtOTEw0dSTi61PZDWoP4xQqrrK2VM5alAiW4+4IKx+PK3byWtMmTY5jafPloDZZwPKdDnB/
 Iw9xaD8/9MDLS/mndRaez2bflntIt0/aKP1PFcXDWaLJscmUlaD6io2IBkhZ8gjfFq+kim5D0Pz
 7tPvRK+mVBiuGWNt1DrtcDVV5UzAZwqf06VtzeZokFcz2+l8PB55QQQNEhE8mkB2TZL9FQSQmSm
 0A3owBNHImj1cXcMAsWRbdxUrLUeQguvI/99xIj4N4aS5a4hXfKj154A1yuDastXCjznlYwZVu+
 13D0/GvBX/Vm17QggJIZ2piHQeTmLG0OYKS8QPZ4HdNoD06w7XnnXcYNM527eGpm65q205pVwUM
 t9HEoaa4M3bi0gXgTeJqNGVhAtXbNFCIHdduYc7qQMKzznHRMa/IiSFhSKhVEavu+EGw5RZM2Fu
 D0EtZ5OkPc6YQqzSE0g==
X-Proofpoint-GUID: NsKR2ksqbAYki3S9ys-tnXh5ExeHxYrv
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 23, 2026 at 10:14:57AM +0200, Olivier Louvignes wrote:
> hw_params() derives the slot width from the frequency given to the DAI's
> set_sysclk(), which it takes for SCLK. Generic cards pass MCLK there: the
> simple-audio-card of a HiBy R1 (Ingenic X1600 as I2S master, 64 bit
> clocks per frame, mclk-fs = 512) hands over 22.5792 MHz, so the driver
> sets up 256-bit slots for a 44.1 kHz stream and the CS43131 plays white
> noise.
> 
> Add a set_tdm_slot() callback so the card can say the layout instead:
> two slots of 16 to 32 bits. When set, it takes precedence over the width
> derived from set_sysclk(); zero slots go back to deriving it.
> 
> Tested on a HiBy R1, on v7.3, with dai-tdm-slot-num = <2> and
> dai-tdm-slot-width = <32> on the codec node.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> RFC because the way to set the layout is a choice: set_tdm_slot() is what
> simple-audio-card can express from the device tree (dai-tdm-slot-num and
> dai-tdm-slot-width on the codec node), without a board-specific machine
> driver. I would also be fine with the codec deriving the layout from
> the sample width, or from a bclk ratio set with set_bclk_ratio(), if you
> prefer one of those.

Adding TDM support to cs43130 seems fine, so more than happy to
work through the patch to add that.

However, using it to work around the machine driver setting the
wrong clocks feels kinda fragile. I feel like a more robust
solution might be to have the machine driver not call the
set_sysclk callbacks, then I think the code in the codec driver
already does what you want.

From a quick poke around the generic machine driver stuff it
looks like it keys all the set_sysclk stuff off mclk-fs, is that
needed on the host side or could you just skip setting that and
avoid needing to do the tdm workaround?

> Tested on v7.3 on a HiBy R1; build-tested on 734bef548a96 (v7.3-7363).
> Only the CS43131 is covered, as PCM at 44.1 and 48 kHz.
> 
>  sound/soc/codecs/cs43130.c | 50 ++++++++++++++++++++++++++++++--------
>  sound/soc/codecs/cs43130.h |  1 +
>  2 files changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
> index 48d88dad4ceb..8450794654c6 100644
> --- a/sound/soc/codecs/cs43130.c
> +++ b/sound/soc/codecs/cs43130.c
> @@ -952,18 +952,24 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
>  		break;
>  	}
>  
> -	if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
> -		/* Calculate SCLK in master mode if unassigned */
> -		sclk = params_rate(params) * bitwidth_dai *
> -		       params_channels(params);
> +	if (cs43130->dais[dai->id].slot_width) {
> +		/* The slot width set with set_tdm_slot() */
> +		bitwidth_sclk = cs43130->dais[dai->id].slot_width;
> +	} else {
> +		if (!sclk && cs43130->dais[dai->id].dai_mode == SND_SOC_DAIFMT_CBP_CFP)
> +			/* Calculate SCLK in master mode if unassigned */
> +			sclk = params_rate(params) * bitwidth_dai *
> +			       params_channels(params);
> +
> +		if (!sclk) {
> +			/* at this point, SCLK must be set */
> +			dev_err(cs43130->dev, "SCLK freq is not set\n");
> +			return -EINVAL;
> +		}
>  
> -	if (!sclk) {
> -		/* at this point, SCLK must be set */
> -		dev_err(cs43130->dev, "SCLK freq is not set\n");
> -		return -EINVAL;
> +		bitwidth_sclk = (sclk / params_rate(params)) /
> +				params_channels(params);
>  	}
> -
> -	bitwidth_sclk = (sclk / params_rate(params)) / params_channels(params);
>  	if (bitwidth_sclk < bitwidth_dai) {
>  		dev_err(cs43130->dev, "Format not supported: SCLK freq is too low\n");
>  		return -EINVAL;
> @@ -1609,12 +1615,36 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
>  	return 0;
>  }
>  
> +/*
> + * Sets the frame layout directly: two slots of slot_width bits, which then
> + * takes precedence over the layout derived from the set_sysclk() frequency.
> + * Generic sound cards pass MCLK to set_sysclk(), not SCLK. Zero slots go
> + * back to the derived layout.
> + */
> +static int cs43130_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
> +				unsigned int rx_mask, int slots, int slot_width)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
> +
> +	if (!slots) {
> +		cs43130->dais[dai->id].slot_width = 0;
> +		return 0;
> +	}
> +	if (slots != 2 || slot_width < 16 || slot_width > 32)
> +		return -EINVAL;

If we are adding the set TDM callback we might as well add full
support looks like it should be pretty simple for cs43130. The
positions are set pretty intuitively in cs43130_set_sp_fmt(),
so just need to save the slot numbers and swap them in for the
params_channels() stuff. But at the very least if we are adding
partial support we should check the masks == 0x3 here as well.

Thanks,
Charles
