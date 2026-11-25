Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607514;
	b=OOwfczAjrDhOhD7DwyYLa8/rqM5Odl77es//XeAt+YD+afQHczL0I3Rl683ty1TQxJzG
	 nkJz2FgRjio6cBbo52bc1Qi9SJObjV0S1zoQ9QT7CwkVLV8XdPj4lMsvHYxRAtUWnWSJS
	 AJAeZ7u1R/AB0ZgO8CwH0ccqopDVaU5uiVm+50cHpXVw+JCmPFLJEKmco5evTraA2CEqJ
	 qWB1a8S3GRnReKnQUFsFWBRVWZ8d5muFhNWpIpsu0mfkNYLVmmMnrIZuECA190bK4p+hq
	 GRWlrbuvJpCLznrSbSlD785FmaOg/ZMSqdLuGCl19fpg7CDz5OdHfecfVrYcpeccLrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607514;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=R3ity6isQp1nc7bd4H1GLvc9vsm3freGT2zdYQ8kLzo=;
	b=qBzsE4Ypvu33RKRVlsJoQ8ZXgjmtnc/3SxB5nyHRBvzOql7db7XwzbugQkayTHe2xVGz
	 ZgSmgqVPGdkQD/ZgM9MjcW0dAB96MyYsH39cSX3X/WDX2ADb8+zLzuxqqBu6/acq5AtD+
	 R5bOKzdc8nD9z8XOc/kiVVxiKU4/DG/lO8G+zslh6tm8BuufO94Lmy8J7vxhXPELzdcgR
	 lwySqEtD/B3snanFFOhYqkCBVwvGiK77TqWzW4KZO8BRd8+BD8XcCBWngug8RVKVEo1KA
	 Zen8jBU/ICLdseN90RNybZmDw/gq5aqGqJC+KHWXVL/aU2y1Xo5GUDewq5uni44q8vQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Eewu1mzF;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=h4Of80gW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A7E606A331;
	Wed, 25 Nov 2026 11:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A7E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Eewu1mzF;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=h4Of80gW
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APBhVLA102388;
	Wed, 25 Nov 2026 05:51:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=R3ity6isQp1nc7bd4H1GLvc9vsm3freGT2zdYQ8kLzo=; b=
	Eewu1mzFqzyOhl+cM11wHrcLn4acgwWFR681EFFYhVOLDtJuh2/AQomUQGpGaFyk
	v9QvoMCfYxYiJ1CUpvgC+mqyk5Ce5t+kCgoGezefjYVecfVrZtQfUgozViDRtqh4
	W7Vx96n/SkWN/FdUXYxyTuzgUKEAggIPA34JqlcBonTsnWyaERaTDPJkjlnJRruq
	M839fDp6CLqEFW07tz93f7R2qSq4wYQaPx8efVDSk43921wr4QZoRh0CFYvx+3DC
	SnZT36DJQ1JNzsYkb0DJb8bwJPs7zdHFSKFN/crRyL9fuuqYBW8GcgXLkWRQ3y9S
	qccg5oB6XietWiOftwDYJA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020117.outbound.protection.outlook.com [52.101.56.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jajsk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 05:51:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHsH+hwdidRERPptL/grsazTjTYx79hSlpuQcJu5KYKxd8KgEFKEHrBCQZmKAz2Iu3v/458olcwfucmE0KGz1RjwHfcR4leZE5nhz9LmscTkoG/2dpGpeoY8msZDgeDbNrpQAxgBSxr6rL78749d6wxjksdG3yPXDSMz5sukq2Cw1Rs2XPbYSzeHsgAfS2DHqKpHtAz4RUNWUK2/XzEBTeciUGyahfU4TM3mTW09OKBdWpP3NIh9snuX4hbg9AHYzqjc16pjMLlnwqlrvAnX3KK5zpQ+lc1+mbTrsUii/tZST74virkyu8XWozaK9pnlLRJdV/oO/HRG38uCsnJ3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3ity6isQp1nc7bd4H1GLvc9vsm3freGT2zdYQ8kLzo=;
 b=wQoGNfMpV5kZzH+bgU52J35m/btmFl/E0e9+ttw1gpfske7/WskJS46kQcb33o+sn3RhDnZle6KkMlDfao/ac3w12oLen3U1QNW1Tzg7sLpxlnMFMNKOPBlP612TXsK/O5X+pbBl3oN8zDlFqFdcK1HRG8cKiqmG1Kb5ivdwLwYjDkxS4jOZSUX3yZRvGn6Bt8ypPxJiqxydcG2GFqAKIEE8B1WpYLbQuJpjlsfUbsPym6fw1NG7yV2edlntuSVgL71aLeASc95LQoKtB8uqTC0Gssw4QAA2moSEOzqoTkEdFM+hCRWJsCkzPql0HnaYBCRTg1U6vvDFmmPLDj+JXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3ity6isQp1nc7bd4H1GLvc9vsm3freGT2zdYQ8kLzo=;
 b=h4Of80gWdF9vKJj/2Ezpmm8ig5zonbDxP2N/tZdZ0fd7rCGe4GfixNbfeOdFU6czYsrlglqBBp0Qib+vTwVDp+spQcoV2yLR9y0+v9a/972QF5qOHC3jlDlORAqxwRkq8y6egmdQ7ToDiBwLa1kmmyFFwcJmFlzMJQ1hRsq2X0U=
Received: from CH2PR18CA0013.namprd18.prod.outlook.com (2603:10b6:610:4f::23)
 by IA4PR19MB362648.namprd19.prod.outlook.com (2603:10b6:207:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 11:51:37 +0000
Received: from CH7PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:610:4f:cafe::33) by CH2PR18CA0013.outlook.office365.com
 (2603:10b6:610:4f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 11:51:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH7PEPF00000016.mail.protection.outlook.com (10.167.244.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.0
 via Frontend Transport; Wed, 25 Nov 2026 11:51:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5D97840655D;
	Wed, 25 Nov 2026 11:51:35 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2C39A822542;
	Wed, 25 Nov 2026 11:51:35 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 5/7] ALSA: hda/cs35l41: Remove support for alternative firmware types
Date: Wed, 25 Nov 2026 11:50:47 +0000
Message-ID: <20261125115124.9130-6-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
References: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH7PEPF00000016:EE_|IA4PR19MB362648:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 752e1e71-be19-4835-2dc8-08df4aea7613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|61400799027|82310400026|10067099003|56012099006|11063799006|261022075727099003|261022105027099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|16102099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MuTCDOqT5LYdrLgEVsEuCriqThgSdOGLQ90mdUbni+p+QpoeVg+7p7/PLwcfQgUG/7eCqOtvnkZxXJHzGhB9N9Guwv+SOZJ+vrUWqgLM5XRFmsjU24FTmJvhFrlF3NxHAYnKFQOc3FTqDBCqHESjjmRZcEQ5c2kJZetc6USaDOQ6baugjjg4Lkkm9f6nmoV79kaaJFDDAc78tyfUvIiQ6SV9OciLJeVI+LJk/8oY2YsLNP3mR5m2v3CRSGzKog3cLvBrdDuXMzZdY7lRd1VOcpvxTUi//0+EAsWJr1KAuNtgqHCjEcy0XJyMT4XKfQk2DxQ3j9YlgFz8ZwSUjJryyTRFhCyu1Jl2rN8yo3folA373fh6S9ejWstJOmNvkG+fA1My4RtCUfbbU6p4Gf5Q0yOYN5c3DN44fIic/WEJUwajwJkN5Pprk71If2VRSC7O1BvovjLMXj7duws83yr90FsJkqxGFFuZJ6wuFfzX/I1p0Liz5qLO62K36+JLwTpyP+wa5A3ynOsLMSRWujoOghBFpalGdFJa92bQS8eU2Ub2OhSR3xm+h1BPW8rIGLWll7waDKhFrZr3HQFgzCMTZkKxUeVx5f1e39zUeLAS6Hpsr2TJ1Bq4omjDhml7UDvVGtJqo6XMAwtYlraYJ7APuiiW1TDXy02+Op49006qmEXXsZIWUrIhrfcqtNKoH5smSrbh+/MhlpU2RvElEP2+1g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(61400799027)(82310400026)(10067099003)(56012099006)(11063799006)(261022075727099003)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(16102099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aPoRv5oZ59yxiFhqfeJwP1Es+gVK06xqzuhTQbg0SGod9DPRmbvVAqEKOgFsMV5tF69extrlvGdWat/fNkEpp7Lkm6jiO9pAbrU839FNUK8305dhJs2n0J4sXThm4PoGILmaK6V7dgsnn6/QC34frraWMuEFtFCEnOweVv+KMNziz/bMForjtQdrHeDWnIhjXGRGKqAvnQ275Sv0xcGyU8hARr1p2AJptfnJHpehnUGH43jSz8CrPLdO9w1aJ6KG8/mECYR090zIstKqS3q1VBKIr8IFK5CTeEJguk02Q0ajN2qyEvSiSUliVopsA46QPKyy6vttA78zdiOhGqVDkH89rwiTXsFjL4sdBYcFbVkj9sAso10l8quIMo08B0VnVNtVztnKV7aQdD0+c51R8c9gkQY+mVZk0bRoQDBF21gc4BoQm6dMj+rGMJsqfIwk
X-Exchange-RoutingPolicyChecked:
	XcvPSdl0ajv+thj9E38MqPCdgiep4LE2IvY6lSPJOhij8TR1YR8m4CPWGZQeauDlVtk+I6381JruoYjpGDd8bfoI+V2VGuKIltnVvX7TEoUtA1Wd0qwCAPrAGBI6WIUi9Nb9m3TDmINwGasw6u3iZwMcAfs7UW1Xt9xqIKLDe/nUg6ml+UvUpVp4vqk8KD0chBGQvMeJIvx+pl8EisHxHzO9VgZMhaRFFPIpbqd0oylPebjys5AI7NmWObfiJ2thadeBrKhfx/XFynzrg/Au7Kvdv3DisX2Ym80+Ohl7OHciug6RxrlAzLZ5u6xh5XtnpllNwOA3rEKOJST0JATDMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:51:37.1303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 752e1e71-be19-4835-2dc8-08df4aea7613
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH7PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR19MB362648
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX3QemYoGmM0Rp
 Zt4YhJxLiT5rj+eGeWrdwtYhas94HNZqNCTRycvFYMdHD9AkXVUd1lke8O86S9yckxiYb2Hclgd
 mWjPv16VaQ2XBgR7MVOQJo0GcN2yXI/aZx7omr9DyidZHoPd3TEyyrG2CFSyGmGK4fn2Rvu/BDA
 pdhiuEkwuCckff1ZA5IIgMQPpVZzSpjtR6Jh06WNNljNK93XuBZUyCtGSin+ipMBi/RJTX0iWdL
 qYFgjXNOtmJqbuZzy7UBBlLG5ad/rdJSgPFTZ13oGoujArVLpAyoZ8+m33rOZM7Cv5hio596W99
 m4NpY+QsSSNeEq7taVOHhUlm3c6GLdK/Y2rRSS0WA93aH/2xjJV/jgjMW7cO+7OCqmy5lpJP3R6
 7NFH8FErhfVU8UmGSgvxcuWs5aAdoOEvpQj9fKbC5slBezROgTVQSz9m0JQMi8xv1vschfQn6hf
 Ul5X4CwWGPAU1//89KQ==
X-Proofpoint-GUID: e7zso4MUirmtrhK1J6RQ-qSNDWdJSPhQ
X-Proofpoint-ORIG-GUID: e7zso4MUirmtrhK1J6RQ-qSNDWdJSPhQ
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b06cbcd cx=c_pps
 a=v6Z6meDQFn3ji2zknzBGMg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=pVWxiN6LJ3DPxKXD4osA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX3AC0UDkq89QV
 gmfS0Qfp2OfSawpqutx/TFWl+hl/qO8ZyAJI9ARX9ILmAnpEmUUv7P1f2P2RpJ7k1JlbgY4C1ro
 gZriomapNP6d8X2u2mEVZWU5mhZDIBM=
X-Proofpoint-Spam-Reason: safe

Originally the driver has support for loading alternative firmware
types. However, whilst it could load alternative types, only speaker
protection was ever actually supported in the driver.

Remove this support to ensure that the firmware type is fixed.
This is preparing the driver to make proper use of firmware caching in
later commits.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 86 ++--------------------
 sound/hda/codecs/side-codecs/cs35l41_hda.h |  2 -
 2 files changed, 8 insertions(+), 80 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index b30f000dab71..2c6efd07df80 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -37,6 +37,7 @@
 #define CS35L41_DSM_GET_MUTE		5
 #define CS35L41_NOTIFY_EVENT		0x91
 #define CS35L41_TUNING_SIG		0x109A4A35
+#define CS35L41_HDA_FW_ID		"spk-prot"
 
 enum cs35l41_tuning_param_types {
 	TUNING_PARAM_GAIN,
@@ -73,21 +74,6 @@ static const struct cirrus_amp_cal_controls cs35l41_calibration_controls = {
 	.checksum =	CAL_CHECKSUM_DSP_CTL_NAME,
 };
 
-enum cs35l41_hda_fw_id {
-	CS35L41_HDA_FW_SPK_PROT,
-	CS35L41_HDA_FW_SPK_CALI,
-	CS35L41_HDA_FW_SPK_DIAG,
-	CS35L41_HDA_FW_MISC,
-	CS35L41_HDA_NUM_FW
-};
-
-static const char * const cs35l41_hda_fw_ids[CS35L41_HDA_NUM_FW] = {
-	[CS35L41_HDA_FW_SPK_PROT] = "spk-prot",
-	[CS35L41_HDA_FW_SPK_CALI] = "spk-cali",
-	[CS35L41_HDA_FW_SPK_DIAG] = "spk-diag",
-	[CS35L41_HDA_FW_MISC] =     "misc",
-};
-
 static bool firmware_autostart = 1;
 module_param(firmware_autostart, bool, 0444);
 MODULE_PARM_DESC(firmware_autostart, "Allow automatic firmware download on boot"
@@ -173,24 +159,19 @@ static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 	*firmware = NULL;
 	if (spkid > -1 && ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d-%s.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      ssid, spkid, amp_name, filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, ssid, spkid, amp_name, filetype);
 	else if (spkid > -1 && ssid)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      ssid, spkid, filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, ssid, spkid, filetype);
 	else if (ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      ssid, amp_name, filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, ssid, amp_name, filetype);
 	else if (ssid)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      ssid, filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, ssid, filetype);
 	else
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, filetype);
 
 	if (*filename == NULL)
 		return -ENOMEM;
@@ -589,7 +570,7 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 	}
 
 	ret = cs_dsp_power_up(dsp, wmfw_firmware, wmfw_filename, coeff_firmware, coeff_filename,
-			      cs35l41_hda_fw_ids[cs35l41->firmware_type]);
+			      CS35L41_HDA_FW_ID);
 	if (ret) {
 		cs35l41_set_default_tuning_params(cs35l41);
 		return ret;
@@ -1248,7 +1229,7 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 	}
 
 	dev_info(cs35l41->dev, "Firmware Loaded - Type: %s, Gain: %d\n",
-		 cs35l41_hda_fw_ids[cs35l41->firmware_type], cs35l41->tuning_gain);
+		 CS35L41_HDA_FW_ID, cs35l41->tuning_gain);
 
 	return 0;
 
@@ -1330,38 +1311,6 @@ static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static int cs35l41_fw_type_ctl_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
-{
-	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
-
-	ucontrol->value.enumerated.item[0] = cs35l41->firmware_type;
-
-	return 0;
-}
-
-static int cs35l41_fw_type_ctl_put(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
-{
-	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
-
-	if (ucontrol->value.enumerated.item[0] < CS35L41_HDA_NUM_FW) {
-		if (cs35l41->firmware_type != ucontrol->value.enumerated.item[0]) {
-			cs35l41->firmware_type = ucontrol->value.enumerated.item[0];
-			return 1;
-		} else {
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-
-static int cs35l41_fw_type_ctl_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
-{
-	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(cs35l41_hda_fw_ids), cs35l41_hda_fw_ids);
-}
-
 static void cs35l41_remove_controls(struct cs35l41_hda *cs35l41)
 {
 	if (!cs35l41->codec)
@@ -1372,9 +1321,6 @@ static void cs35l41_remove_controls(struct cs35l41_hda *cs35l41)
 
 	snd_ctl_remove(cs35l41->codec->card, cs35l41->fw_load_ctl);
 	cs35l41->fw_load_ctl = NULL;
-
-	snd_ctl_remove(cs35l41->codec->card, cs35l41->fw_type_ctl);
-	cs35l41->fw_type_ctl = NULL;
 }
 
 static int cs35l41_add_control(struct cs35l41_hda *cs35l41,
@@ -1401,16 +1347,8 @@ static int cs35l41_add_control(struct cs35l41_hda *cs35l41,
 
 static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 {
-	char fw_type_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	char fw_load_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	char mute_override_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	struct snd_kcontrol_new fw_type_ctl = {
-		.name = fw_type_ctl_name,
-		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-		.info = cs35l41_fw_type_ctl_info,
-		.get = cs35l41_fw_type_ctl_get,
-		.put = cs35l41_fw_type_ctl_put,
-	};
 	struct snd_kcontrol_new fw_load_ctl = {
 		.name = fw_load_ctl_name,
 		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
@@ -1427,17 +1365,11 @@ static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 	};
 	int ret;
 
-	scnprintf(fw_type_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s DSP1 Firmware Type",
-		  cs35l41->amp_name);
 	scnprintf(fw_load_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s DSP1 Firmware Load",
 		  cs35l41->amp_name);
 	scnprintf(mute_override_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s Forced Mute Status",
 		  cs35l41->amp_name);
 
-	ret = cs35l41_add_control(cs35l41, &fw_type_ctl, &cs35l41->fw_type_ctl);
-	if (ret)
-		goto err;
-
 	ret = cs35l41_add_control(cs35l41, &fw_load_ctl, &cs35l41->fw_load_ctl);
 	if (ret)
 		goto err;
@@ -1537,8 +1469,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
-	cs35l41->firmware_type = CS35L41_HDA_FW_SPK_PROT;
-
 	if (firmware_autostart) {
 		dev_dbg(cs35l41->dev, "Firmware Autostart.\n");
 		cs35l41->request_fw_load = true;
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.h b/sound/hda/codecs/side-codecs/cs35l41_hda.h
index 56ec07c0bb74..6fea4b2ad0ac 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.h
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.h
@@ -73,11 +73,9 @@ struct cs35l41_hda {
 	unsigned volatile long irq_errors;
 	const char *amp_name;
 	const char *acpi_subsystem_id;
-	int firmware_type;
 	int speaker_id;
 	struct mutex fw_mutex;
 	struct work_struct fw_load_work;
-	struct snd_kcontrol *fw_type_ctl;
 	struct snd_kcontrol *fw_load_ctl;
 	struct snd_kcontrol *mute_override_ctl;
 
-- 
2.43.0

