Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793638777;
	b=xnO3T/c53iSgAhbNn073/8pgaZgOoF0aAFjfXYOwvg+Q0xCndaLKNNJi0e+mcvEEUa51
	 5FZbCv6rWP4g0YHQMXPF2r826h/LjvpHdZiB/tAj7OY6oULBrIEVKqiOCapK613O63laO
	 H5fuCGEP0aKxZukfSNeQHeiGYSUMMF2clSLFHhV7pSyTW3Yy2ohcDyg0q31uPIaRJASGL
	 L0YVLRtnBWLAeo5ag0zu4nkhtJPHXk/sexrdtkjf+OEVV3faeGh58bt1uRZCUNa1zbW6L
	 n9MB/AjVmcFuHjljM+DFK0YmS9MjipKJ6CViXbCgtjPg2tLXpjrHFVqZyYrh11NtMpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=76V/64BvOPmdh7TbjZvWPmESO/6oOp3Yt/Uz0p/s2W0=;
	b=uIKFVvsB/pTPfxQPYCWIOfWv3Fp9dSZxhqRXHeAhTbFV/ZCTgtDsiG9tNS/SbR4oveSG
	 yjLRN6c78U7cv+W91huig/ZKrhbsNbHeorGZTNu+WCQ2uFvK3et5cXo3h2PIc8ahSE/My
	 LLztPqXCQwTRhxZGUkhXxBExu54BZyr22+QJ5NcndJZjqfgyl+UIKhRekYvM+56XZ5E0P
	 iwwnTUNU5XFOzT73XcnVhcQkwv+TQE8wQhKSWFyfL+rAZEZiL3KVd2G4e7cKRaYRzSgH6
	 lNR/K9I0ecU+ampSU91w6e2/xx5Gw1Mdbn4rzDzBfewg2eykK1XiEWiIWtYRfRvBfsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=lVNgDD+J;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=v2ynLYS2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F4606EEBF
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 16:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979F4606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=lVNgDD+J;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=v2ynLYS2
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Fsa7W3202864
	for <linux-sound@vger.kernel.org>; Mon, 2 Nov 2026 10:59:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=76V/64BvOPmdh7TbjZ
	vWPmESO/6oOp3Yt/Uz0p/s2W0=; b=lVNgDD+JRGcxlzOWbBWYTfJONHftwLra+p
	v+PwTD+k81bUnWFJvSqtcPb2Lqfq1WffAF61TXLZ1fSFzrK1z019XT9NB/KIq96s
	NTUSUFgbQgG1FmZX2WngUtDJ2k9ecC142sY1ilUGKqt+ZtnR2hXI632OXeWF0C2c
	7qwH5jA5PhLZ8OjI3MVNgPlcvku49xpaQAtJE3xlGXBN7RJnDZXcKnbc1V5HJqZ/
	g+6CNA7aw3OuK2XPKLNXUNyIOjUxqUfoydrob0ZJCM/daxOWi8w3HSQJOPxVFE2o
	FoO/4HcbwqPzXv+sH68X8PKYzY6ONGXsdxYzb+iCDPrwRy2ctmUw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022109.outbound.protection.outlook.com [40.107.200.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfa686-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 10:59:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YElIhLbHMbDifIPYaTthSaSK96qbV0cqZ9WBnjNwi2zw99VqytstNXUi72bX8eFF+XN/XTsZW355Q9RUJAxwco3Knz2MsmlxS1Ou7YrkLy/a5G3akcCi8dpiz/ZrY8wKWZ69W8/2dBvxDuPEEqPdsRz8o2n+fQ0ts/KyonuFrwLv7z9C2sZhpf49yVkMcHl5of9dUsHpI1dWXskQik2PNqlu3/KKAlg9zpgxIqPJAiKpdrQX84TaUEzMsy1D485i3jdscN4HYs5A1o2X4clN3zj319RNu77qru8/QvZS9XI1fuX+JVnrVrZI/DDedaKP+05lXUaXYiU+o7xVww3KWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76V/64BvOPmdh7TbjZvWPmESO/6oOp3Yt/Uz0p/s2W0=;
 b=ntT2cB5tSlPEOxXPQY7/IwH7dGPFlz5w67ZcX2F5NssasC2DLJvApBedC9yOEi9YODR6/q1ktgi7E4jDJhQ1PLLoUZdoXdWxHHCLrWb8M9XeR9M9w6Qju6Ew8hXH48XU//yf3xxAQEwoAQQMYcKczzTUtgl5gr9g6PLe73DxSAoIButq3mukjA/E66Htr20nhTU/QcVravnG4qt3zxUh5Rd42kR/7Un8W15Vk7awX0Z9/xVXuJWEF3DD6eoLp8W7sRW9GsPdm58uL2fh6+TFfGfoSjLMeH3WSM1AByN95fvFbHCP2teug34+i3bvsZ2rpiC+6TvEdL4rCujFlkmLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76V/64BvOPmdh7TbjZvWPmESO/6oOp3Yt/Uz0p/s2W0=;
 b=v2ynLYS25HFxFHVKUL8ZvX+YUJinjjGtgbDg4KHk+f2X0aAfb7HhZwYFSZonLNittESqd02yJQ9JfTeh0VnS98rWiQyS8va0BaUk7irL7jxrC0+TUbNOMkIT/jtNsS/yhcGl67ZYYBsaW2wl727iiouCFFeqgaqXV9NRrSlo94g=
Received: from SJ0PR13CA0114.namprd13.prod.outlook.com (2603:10b6:a03:2c5::29)
 by CH3PR19MB8481.namprd19.prod.outlook.com (2603:10b6:610:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 16:59:30 +0000
Received: from CO1PEPF0001885B.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::33) by SJ0PR13CA0114.outlook.office365.com
 (2603:10b6:a03:2c5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 16:59:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF0001885B.mail.protection.outlook.com (10.167.249.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Mon, 2 Nov 2026 16:59:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 753D1406544
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 16:59:26 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 61F5E82026C
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 16:59:26 +0000 (UTC)
Date: Mon, 2 Nov 2026 16:59:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: cs42l43: Improve pop performance of the input
 power up
Message-ID: <aujBbbY58WVRBwPU@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
 <20261102155440.3995136-4-ckeepax@opensource.cirrus.com>
 <sashiko-outbox-193741@kernel.org>
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
In-Reply-To: <sashiko-outbox-193741@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF0001885B:EE_|CH3PR19MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: e65f3430-0c7e-4523-62a0-08df3902a849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|61400799027|376014|82310400026|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|4143699003|11063799006|10067099003|56012099006|18002099003|16102099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+bE2J2QmwAUPitTEi8DHjzy2ekT2oOISfPy2FKvUqABy6IRXDt4zdqNH0vtZOp4XrzkP9dVT30fR4sbHpO9UOYaHOH+rSmKzUwVazGAtyId3dCHb/EWDSJGkS/6Jf7sNfE1Tfo42w+COKVfelc6bxbvoQ7T4RCZjkXOU0THwgLGz/GCpnVxTL8bIEwllyoop90FzJewl2998Snz52NWBOIclg4EdbX2kH6CRCU1tR5cYEdoT19wenJw2S3IFg1GC9rzOZApEEnXoSJYuNUrdzy65fFQZbTfa1OL1EcpE3TJVWzBD7C4fukhR8Q3fwUe9HjhKVsVWlCXTsS53fuxYRRsQDWc/SY8hrqwUz22v5LxlF1wrzxAgNEwZPWSzXlSUuvNvH3a4siET8qob+16cIP30rBDeRFq+LEvoMczQgtuizthVWk4QTKoCpfMNvSLMNgGqAiIXxmTL+og8vhApyNf4tlO9IfHq7CbDueH61sjBdTQN6Zo9IkwDh8KNZYVuPsNMmTc0O8Xj78uTiveIrm/urimU4V3OVQ5QJeD5HuOrORVnz+3Qk+rQLG5dZ6ynwVclUgnrUy2mR3j7HlEjhP4Ct4WE7q0qYsoauNNDTCS8+OzAXQ4Ds6VRTmmol3FAmXDgw63prgxyyblVPPjcer9C17yqJu3HVHTgm/BDfL2ZuWZQj04fniP4gAIsJQkXKRAsT2p0sx5LH1MUMI6BVA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(61400799027)(376014)(82310400026)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(16102099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y2BF7sxNhY1fzxELQVmdgI8RNAjAO65+tuAEua4aRFSeyraJT7MGUOLXAc77NrRAFGGIIESvwzHvXQPrZ9wy3ttoC51x3kAH4qol2Clt/fjniyu0LkBLJRKn7YNFDWlKfMSewlO/xruYfJaxUOfCYeLf6JuqyKO9cAh5sZkiOV+kE0OETPboZaL/ys1pEtJWbM4pzRPW33AEsAI05crAl7AMmKUalyrvvv/p7al0S2ki7YtK03BDiSzBE9DkBQWs1Oenc1msVDnynX6oyG4HS0i3Q2GFq8XAP2qrtXj3sDgvCgdaBSMb2LlJ6YnvxyL3Y7ba9IG16kOrN5a7xsqN2aun3Ss2cIsevVLBRlfRwaHsV4zWboXR1Hy6jGZF2Hr8GLOh7Cjryn+0QnHKpDLhujl1kFfQMS6knFgrWOlzMXo8sIWcNghBZoLZ/s2gYoEX
X-Exchange-RoutingPolicyChecked:
	i7DZv2WAij9mpyatl3I9u97Lr9SRLCvwbN8Ph9auBmO80LXhoZX4H41eoVAz0gl0Gu67Wdy+lWuMHH1IOk4peL3qft6mkVuIHqyyGiOwhYDwmJvly7ERNo2HXM0UA5sJetKIKjMcd33EP0WWOPHumZGQjLY6/E00zF/HZ41msTHvJIGkmLMBEeAdW6YLQvZr5H9PUbKqoVyh0vVgeCpWiyjXUBTv1XQb2WodWqMPfcJDJgrrTO9lCojZvqk0L4VrzXT+g4P4Y6jiTJSSpGSsbjHlsdzw+gW6OOmKUWAva4/vpgtTLUS6MRmHxhQcDAnO3B+I/9f8HrTzA2c3jbcmvQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 16:59:28.2740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65f3430-0c7e-4523-62a0-08df3902a849
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF0001885B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8481
X-Proofpoint-GUID: 0R30Z1Wi1VovoHvmssCSJNtAli5uRCrB
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6ae8c177 cx=c_pps
 a=17coPk5t6rY28jlQAnJROQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=rNn8z84P1rVkot5tUbsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 0R30Z1Wi1VovoHvmssCSJNtAli5uRCrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2NyBTYWx0ZWRfX0jXqbfU28pDE
 z44Gy17XMNynhBgS/FEysZXJDglfAAV7nP0irqZv0y7xG730pEyz5pMKAZf9J19vxqtg8msnc8d
 JS1zfwHDH+r2PXWVf6viOOQ/dTEp0l1Pbmcyin0ew1y085c+VPjXTciRlEp2EDaTsiCFi/3ijEO
 nNuqb2mDR+GbaMSNKjNrlZHEHaO0HpMiQ3/bsz4uZEDDJQcDHI3hYF/0PHrCHHwi/IJTb16VYwO
 inAFfxms1UPCT4KAFLzhyqTgEe+l9kre205a2AvQRefA3exGd7Tw+aCfoGPbDyXsFeMBraiLwxM
 o4HbmoMYSsn4aELceWuEwNq1mMBGgr5qX1YfwKvLTS9+CW8n2cvZfV35CZqTLnEYoJ2jAzZcMDz
 veIT0Uzxb8ANlsGzlTbZqV5s3kJN40Ev2XDjHVq7iiwqYHFsyT09wqD9Y4lDTJ5ti1IcCUXBCxW
 rQM0+NvCoJ8mQK0y1QQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2NyBTYWx0ZWRfX8zuFawI6kTpO
 U7iRszCG4RieMj2zDM1Hu/GPdRImwdaZBqivh2eK9qGn5Pk+b8Tf3plmpQMDrqiK2pqNc9Z/T5J
 b+hwzDLRvARPU1YqSBphH+pZdI6kRro=
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 02, 2026 at 04:15:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] ASoC: cs42l43: swapped filter registers for ADC2 and PDM1L in cs42l43_decim_info
> - [Medium] ASoC: cs42l43: missing DAPM lock on Decimator HPF controls racing with cs42l43_mic_ev()
> - [Low] ASoC: cs42l43: missing static const on cs42l43_decim_info tables
> --
> [Severity: High]
> Are the .freg assignments for entries 1 and 2 in cs42l43_decim_info[]
> swapped?
> 
> cs42l43_mic_ev() indexes cs42l43_decim_info[] by w->shift from
> CS42L43_BLOCK_EN3:
> 
>   0: CS42L43_ADC1_EN_SHIFT       -> Decimator 1
>   1: CS42L43_ADC2_EN_SHIFT       -> Decimator 2 (.vmask uses DECIM2)
>   2: CS42L43_PDM1_DIN_L_EN_SHIFT -> Decimator 1 (.vmask uses DECIM1)
>   3: CS42L43_PDM1_DIN_R_EN_SHIFT -> Decimator 2 (.vmask uses DECIM2)
> 
> Entry 1 (ADC2, Decimator 2) sets .freg = CS42L43_DECIM_HPF_WNF_CTRL1, and
> entry 2 (PDM1L, Decimator 1) sets .freg = CS42L43_DECIM_HPF_WNF_CTRL2.
> 
> When ADC2 or PDM1L powers up individually on CS42L43, cs42l43_mic_ev()
> adjusts the HPF register of the wrong decimator channel.
> 
> Furthermore, when stereo ADC1 + ADC2 (shifts 0 and 1) or PDM1L + PDM1R
> (shifts 2 and 3) power up together in a coalesced DAPM sequence via
> dapm_seq_run_coalesced(), SND_SOC_DAPM_PRE_PMU runs for both widgets
> before SND_SOC_DAPM_POST_PMU runs for either. Because both widgets in the
> pair point info->freg to the same register, the first PRE_PMU caches the
> user setting and writes the temporary fval, and the second PRE_PMU then
> reads that temporary fval into priv->decim_cache[w->shift][1]. When
> SND_SOC_DAPM_POST_PMU runs, the second widget writes fval back to
> info->freg, permanently overwriting the user's HPF configuration while the
> other decimator channel's HPF was never adjusted.

No, on cs42l43 the ADC and PDM are muxed so both can't be powered
up together and share the same decimator control bits.

> [Severity: Low]
> This isn't a bug, but should cs42l43_decim_info[] and
> cs42l43b_decim_info[] (and the info pointer in cs42l43_mic_ev()) be
> marked static const since they are only used inside sound/soc/codecs/cs42l43.c
> and have no external declarations?

Yeah these should be static const will fixup in a v2.

> [Severity: Medium]
> Should the Decimator 1..6 HPF Switch and Decimator 1..6 HPF Corner
> Frequency controls in cs42l43_controls[] and cs42l43_b_controls[] also use
> cs42l43_dapm_get_volsw() / cs42l43_dapm_put_volsw() and
> cs42l43_dapm_get_enum() / cs42l43_dapm_put_enum() to hold the DAPM mutex?
> 
> The other controls whose register bits are cached in SND_SOC_DAPM_PRE_PMU
> and restored in SND_SOC_DAPM_POST_PMU (Decimator 1..6 Switch, Decimator
> 1..6 Ramp Up/Down, and EQ Switch) serialize kcontrol access under
> snd_soc_dapm_mutex_lock(dapm).
> 
> Because the HPF controls in cs42l43_controls[] and cs42l43_b_controls[]
> use plain SOC_SINGLE and SOC_ENUM:
> 
> 	SOC_SINGLE("Decimator 1 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL1,
> 		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
> 	...
> 	SOC_ENUM("Decimator 1 HPF Corner Frequency", cs42l43_dec1_hpf_corner),
> 
> can a userspace read or write during the 150ms msleep() window in
> cs42l43_mic_ev() observe the temporary fval override or have a newly
> written HPF setting clobbered when SND_SOC_DAPM_POST_PMU restores
> priv->decim_cache[w->shift][1]?

Yeah this is also a good shout I will move these over to the dapm
version of the helper.

Thanks,
Charles
