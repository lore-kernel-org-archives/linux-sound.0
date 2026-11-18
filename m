Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995880;
	b=RlzBBMo5SqvaJEslG5RlkACPcHmmpdzRnrG8ktSnfVv6/IPAlE1ywnXqbthWWDYP5y7F
	 NZ3bMM1uKfSzjn4Qak4D0rDX98sEubPSjzjPUN3GM9K+u1ng6ku8f9qLiM2yn6oLDUtaW
	 3svbg48M9qELwo0pAlRy278bGTEYPSb0uN5hOwnR6fIwniOCl6+usesg0jgUprIem5kY6
	 oXgrPD5wJy2BWfOAkrxmnOlLskQsHeCnEiLdoiNgE8C28ldmOOZ1tzW0LVeQIlR4ofaB2
	 u1h+l4dhz7JQOFcRrgaGgnWqwk9aQ+1kja5t13JsUtZwyPxCZjxM4gEji3fKZtiHuuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995880;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Reason;
	bh=aXPqbGcu2/2PjgGv+NO/sR3kYnwxu0K6dq4Ahp1QXvE=;
	b=wIMf6D7TGkdgQ1QrP5W0vEL5LtUIUwXqVnsHm3SHd9bLi/1kyGNYjllyi59UNw6P502M
	 6mfz8rm0+CbH7IqzeNxm1rYDGmVOXA7jveuNnwR53wh2CCXK/xjOYuJubrR96GFQ7Kjim
	 HgU5+dIlyyS7akv2fygEwJ0VY9T7Ip6Rggzw2aDPoWJdXqoTKwltGsAqOlpCSJ/S8kL8x
	 EjfFoaruCWROH/A7h1vktcTy16a8KDihdzScp3A4sK2DDddn2xdMwdTrpQCsBtpHbwpld
	 VnSYTIhyuQDKC5kOMn2oHMHG7EK7cDXpKv6jJ/584uniVRoad03jitN+V1vQkDrK4pA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iFeJzjWQ;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Yc2LNnkr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CB8606A33F;
	Wed, 18 Nov 2026 09:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CB8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=iFeJzjWQ;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Yc2LNnkr
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI92SxJ3663318;
	Wed, 18 Nov 2026 03:57:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=aXPqbGcu2/2PjgGv+N
	O/sR3kYnwxu0K6dq4Ahp1QXvE=; b=iFeJzjWQ+izeQpLP59QGqFQ+roQUL7LRPT
	0ebu0TqU8o/sPl58JyzgiGyYxtygfEmvo6pDp3GOX4iBLr/i03g9pttNUphgyElt
	SeNoYBYBiFSTI9xtluSzZwWMaSiKFhk5btHnxySIuzra/GJ8w39NKhEtD1JrObJW
	M2/BvdVvH1DrdG1gm5YRG9fwtYt5CpDzjg7JWFGTBbNsXS+lF0abtI6/TXjll8zo
	H5DdUgXRnq6M94i1+McKuN3yWfbvwY8tBznCAXZxjILkSV8AyVGfXycNeWj4AEyf
	orBL01anmDADXFCiSIrpPwwBXCEPxFIz5fXLrIYTT6wJFYMcsCaQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021085.outbound.protection.outlook.com [52.101.52.85])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j0ytsgn6e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 03:57:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NryEuN+jew0rac6sZj1DFSxHFSbYwHWn3EUAPXXcC4IZVcbjgcDmhoLPx4z0Z19iLwZtOQQCWEl8khM9+HeMW/BjspF17cVUrC+ecAKwjoBGfEWYl2L6dN4I7CZcovv19sPn1QTURiupUQ04wFYx9cw2KVmdymyOCTNLejmcu2WGEKaIpTxG7Qo13d52eoEj9WCDQowUYL+W0eAJ20g/OXp9dS/8OpKoIYnCbseESX0y+wBbNrzyXFjVU9Hjj82GzOFzMd4aZu6+Au96VGahRijzcnY00d/62NU2Nafg7l2x2Ew8fuP3WQiYgD/lmOjRfRDblSElZVUj+oGdJRujww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXPqbGcu2/2PjgGv+NO/sR3kYnwxu0K6dq4Ahp1QXvE=;
 b=iCq3Zm7405rvVKzdp5niz4jaCVSQ6fTdjc+M79dNrrlxkcXeXmiSDe/yW2AbrPuDOyVFDx48+AluY8HQsYdCarwrSlQyPamWxLsdXQKVPHAD8Pksxzwrsa9coICBqGAzw7ReOf9fDSxA3qlcT2SjY2gycYl25aBSSJamQ01o6pYUKeNtaon1py6mgKN4aXAI8CGWDXb8rOFveddYsu5T9mqBm5PEsGxBuvf6YH8RTfZ7FALWug0d0Q96l/dRg2CzWKQYq8CdmoUKJrjR9TlzWE2pVwCOspHRyt3MZiSfB9YpYP1PqdCrfJkVMDKdITolBe5u26LTDZxEaXtf6ipqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXPqbGcu2/2PjgGv+NO/sR3kYnwxu0K6dq4Ahp1QXvE=;
 b=Yc2LNnkr9jItxvP8kEYBzXvCGRRIYG4ktD3cFyd9AZg3rFLs6DsrfWO//X/QktdaFYtVK+iDz4AF187VTxodh/s0wsK7fhreszco8vxwt0NLWHb47klXXCyj/1sgGMI64CT9tSTRBN193DZWVAsVJxc3lcXEV4ywF387uGWQImM=
Received: from CH0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:610:b0::8)
 by IA3PR19MB8639.namprd19.prod.outlook.com (2603:10b6:208:524::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 09:57:39 +0000
Received: from CH2PEPF000166C9.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::72) by CH0PR03CA0003.outlook.office365.com
 (2603:10b6:610:b0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Wed,
 18 Nov 2026 09:57:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF000166C9.mail.protection.outlook.com (10.167.244.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 18 Nov 2026 09:57:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D375E406540;
	Wed, 18 Nov 2026 09:57:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B03B182025A;
	Wed, 18 Nov 2026 09:57:36 +0000 (UTC)
Date: Wed, 18 Nov 2026 09:57:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: broonie@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42xx8: Restore cache-only mode on resume failure
Message-ID: <av12j1WTLf0zFi5y@opensource.cirrus.com>
References: <31EF1D727C977B5E+20261118082325.3915977-1-tuhaowen@uniontech.com>
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
In-Reply-To: <31EF1D727C977B5E+20261118082325.3915977-1-tuhaowen@uniontech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C9:EE_|IA3PR19MB8639:EE_
X-MS-Office365-Filtering-Correlation-Id: a61ae482-5259-42ef-86ad-08df455a60dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|61400799027|36860700016|376014|261026140227099003|261026121527099003|261028144727099003|261022105027099003|56012099006|11063799006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	EtaQ3CFiJxEUo3qzDwENpTh810f9YstrDIeVZ2CQXay59BRCabd3uhKNnzs7pFgVVN9J5Bg/XRkUFsgU/ta7M3HEpADIHRhPPBkhiIjCOGnTer4NqnujfVsvsbC8wi3Ko9G8P2vySa1XAJmjT/JUkUGMwvR5WKEXdZMw3BJOjXnzqSz4WB+FM5u9bNBPq341dta2htvfFtWd2Rb0chtAhnCwQzNml2dFRgKOL0awtb3AiXZ+YmG647aTpmM2EQATLW/kjztQcGdBZLR+y0hLNWtIaqxRIJCLxT45kDKc9bHBJ7V+7PDN1Y5+xlkAYHdkMKAusG+Xd/5qj780ulM65gg6aPKdEbSoN4DPDR9KL/y94jHzieiVvlo/3UXwGUdi6HLxgvGYwrcks9ruseOfeKSJ/0ioPSefWfBAFFulcH4dWnALfseAkRMFnJO19mHC7D03eZI57kdY1F5NmZJF2ypfmAAFapKApCs4fJpVkNY4kzgnDUbeaLDaAZsG8kpxDbYBhDYBm9+nD0FY/z7JLpIdW3xr61Q5SQa2ljyEhfmcn1LNRm2wE6jldW6OnE/wSEB17Xut16sPO7lEJiLbglgOGHxOh90Jalzjgj7UTZ25PXIqzpsnHZk59GumZ/xvmGkI9ipNoVc6oR2kGi2SiA09Y/DhCGNTaaoP/Ac25kQoZMRCnDx4WOAz+LhUS3PJ6Z5y+hGQbpaNYSbFNaT67A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(61400799027)(36860700016)(376014)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cQ9Z297QJuWVZl17Cz1heXB0P7eEiV3+EskWmvSEoI/7WF+kG95QKgmPOdDkwUtbo+H1eoAJgo3qA5w00wdy6LESmWhKy43fUktTx2J1jAN+jvgE8dZF1xey1a38Hqd22miAtk45xj9UG1jFKooTvlsDVuJt2+LUKnWI/7xuXwRENeI7SjxXwuIq4o7WApSifpLiBWIUmKWJpa9ZLg29AvuIJXB8y6l9+4P+wcJbjsRRmk2A9XrWMAP0Gr5soY7qv2+0CrIicLiOupFNXNdoUQMVpTlVisPXRINVFLDAt14DraH6WySVrJFXGVzSUlrI99FBhv6SYve8uIbP1+NwBkePt99F8w0qGi1zKYeputrwRFvyWZHeL+o97MupMZ4gyP0L7OnGmgVLsV7ko23MxbqjdZU2YtAna1jSC8oGiaCEcC8L440VVtTMj2cQ3ZKJ
X-Exchange-RoutingPolicyChecked:
	nqZgfWXL+4pA7cJNKffg7girv9/elsdygyMt+toxsBHyQGfRmrUdj//A8KMIuZCGtfQGJnZXEoD7d9ZojiusqlMiBOtsizRpJmja62eq0erN0w37nsbCYNwHy3FnmWY4zJX9Hz63WzVWzy4uIz7JeI3udNUL5275a9Arb0G66ngzAwObW9mzefSacBkfL6N6Imqpd1Drgr1ai3X6lErWYNkYzajl3qs5e662kEWAkv50azj4K+YGdOdp1Um3UYIGhKKS5AVL+IxyUp4g8vMZODbY7AVZNooePVnvBasSGW9TaRVpknAFYqAHzmphM1Z8NszzarLTBxtNRH2F5cU3oQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 09:57:38.2030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a61ae482-5259-42ef-86ad-08df455a60dd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF000166C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8639
X-Proofpoint-GUID: OMYFwgs6C3Na4aIMmqnRzyDUby8sPn6k
X-Proofpoint-ORIG-GUID: OMYFwgs6C3Na4aIMmqnRzyDUby8sPn6k
X-Authority-Analysis: v=2.4 cv=V4ToQuni c=1 sm=1 tr=0 ts=6afd7696 cx=c_pps
 a=GzbtWuAz25DTP0J0usuZ9g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=iHwBjlyiAAAA:8 a=w1d2syhTAAAA:8 a=f-sxUjWA-dorNNIuO58A:9 a=CjuIK1q_8ugA:10
 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfXyUZ8xkg4NwIS
 amlxopBZKgxTyhFI1YxPVlGCe3OIV1smE34SyncwY3BTZp/yH7aSkWUCGw/8soSZqoXwlnsRY0u
 Tfo6RecqBZ2GP1hn7OP2T4lXWb7Fj80=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOSBTYWx0ZWRfX0n7BB2r8tOw6
 1tFVPi2FvIDtCWhJV2S8rfHTv+ZB7Lq/wxbHWz+U1heanU8iQHAuW+k8kQM2sQJGLLgpJy0lzy/
 GEG93tG88MHpf8owd8iEGNfD2GIUmT6ah8jdgHEBcpXzQF3j1FglVSZWOnjHEirP6ab0ie/H8wm
 sSsYdBkEn3hHNVAjzMtv9yKX2dskGkFVb9aVEhmYJxGEsGTFrd495+x4EwsOVnDTGvLm9ht+2hC
 tueARNkOuQhX6Qc30/FHT23jI0NqfynMFOv9HqWXdqxZc1jTkRITh+rywfxzrfUL/eUS/bN5t48
 3KrrXtTlqT79MR9rDUjOUPJ/e43Y4vsfnmEfmNY0LnXdfNJCEWW8HehaKRm3iKoNHf/7bZ1w8rM
 GC+z5TP3pbvtXJwM6i9WUoXV15hflA+UbmiehbEfWJo2YdLwfYCxSVr9oIptn84nwLAFe/XzjFy
 UJ2gS1Ef4qn1IxB0W3Q==
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 18, 2026 at 04:23:24PM +0800, Haowen Tu wrote:
> The runtime resume callback leaves cache-only mode before synchronizing
> the register cache. If regcache_sync() fails, it disables the supplies and
> clock but leaves cache-only mode disabled. Subsequent register accesses
> can therefore reach the unpowered device instead of using the cache.
> 
> Restore cache-only mode before disabling the supplies on a cache sync
> failure, as the runtime suspend callback does before powering down.
> 
> Fixes: 0c516b4ff85c ("ASoC: cs42xx8: Add codec driver support for CS42448/CS42888")
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
