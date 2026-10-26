Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793027061;
	b=eq68I5p9UbN9/4XO5jH08fh2crlwD1yjrv6AO6ZcummN6Z0B+346UJt98JV5Y/hkwbt0
	 O01oeICqnfk8VXkuEHXZ0qAWsmIJmYzOFjTE/Nd43pUNTHzChAWWOYBMTEktsbA+ppYp4
	 BdfislA2Hkcf6CFWxcf9Y0GvMR9u/NZ5ONL8IfaBmut/CLjxGaECIzQ4pe8tV2k0OYpFq
	 Yut7M5e+Sciyne6VGRiOLVbwTBCdqQgozuszsgwSyytHQ8AelqZgkh1EJJyNYvabIA/GM
	 cQ6wrNVwpuV47OvuBakBaY+nDfsVqXtU1Cj2vG+k9XL16XN442ykswLOTcto+8Utm7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027061;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=rJ3H/Xnqz+rQ5m7e4HJqYuko/7Ur8KxC/ghbuUHHwhs=;
	b=tfFaLKpsEIH7hzBsUeejgdUUinG0d8xaa9j0SMm3Gg4Uboj63sktGi7FS688yaorQs1R
	 Z08g+J/l8pl+nMJg3VeQLv/fAS/a9tJa8Yytv/4YGRQ8wU50sD/bN/DVRcV5QVmy23hpN
	 1cYWrgIZfYkVSMIcjM8s7uEgezMPzrk7nrfmjZ7ETxyPWxq+0Jg7gPzf0eQjiqd9vrF9z
	 A4w+6u7lesb3UiCDq8K1aOAx8TsfRs10ZuN+qXCWtlfwEletT34Jnkn6kj2U7cjxuhVQ6
	 iiM4pGX4m8ashVd24Y8aPrG0cHXnepQyRwih0uqfKcVTa21+zuGhvduXwCpys4BhBmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UGDLKIEn;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=WMFIw1zO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A0606A337
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 15:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843A0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UGDLKIEn;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=WMFIw1zO
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QETZWf3621946;
	Mon, 26 Oct 2026 10:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rJ3H/Xnqz+rQ5m7e4H
	JqYuko/7Ur8KxC/ghbuUHHwhs=; b=UGDLKIEnlxY6EIOc4eTc+B+i/QFlQ8nlWf
	HjnCdWUdEdirFFhYythcFZ6OdB6TSjWbVIc2zXzkViMTNYQRAb92tJzKzCqqynNO
	YKl7kOgzBFaVRhZSCDE8LOzJZ4C7PByxwi9M1NrbpWCvYqX18LLBSdn/ydZiqVwn
	Ihw4GZ3RT4EENh3Toy5i86+q4u8NhaEaoA9MaqHUzKWht35k61kPGDDx0vrUHOGK
	jhO8rlMsTyEVmzp074zptcq9Fmsl6dFjqEgfuz+d64kBb8HPnSCf89G15sJnFFBY
	fH2ncEsf6pZauNoTz5O1QnH0/kTgkC6A/PTTj1wM5r0TgcSykcDw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021143.outbound.protection.outlook.com [52.101.52.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hgt3aab4q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 10:04:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSLVFBBq+hR1oxKH9TVl9Ngf/tXv1o2QJyAeL6IKjr0RYI87DFCnxJy8PG5pHqERaKJU6rltsgfdY2AjBC4VtJABonBKGnHbCceNKlPtTvW8HcSvM7f8WdMsT1RlHGGqeRANO+mB09bx2Pr2ezdV8ZUYDYA+1v1M03qVmGFsrRPZQBBi5Ge6dtLyAsz9fZ/BnpgayGen1N5HrXRQiJGyNA1V86exQM+smsF9fHs5DVeygn9ancIVjtAX1BtN1rVSq2PeejMA5YD1r7bbs/tTnOVZ7Seh9zktQ1fNqtCvP7YI8XH7wqkqCZy6a/QJZBlBPS0fai3ySGAv8yzNlBNStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJ3H/Xnqz+rQ5m7e4HJqYuko/7Ur8KxC/ghbuUHHwhs=;
 b=teWg4M4UkmEDrrGmb1BtFVho3RDkKe3dHjZhDC0O0W/1LU37Btd2jvXulLkH2xKoLA8D/z3kn3rl5gvvLrJneNceWcsrlxqriq0Plbw/kYGUqyZHDP4dYsHuFdweyfClTL5L2R99cFNsjwfaK9duCd3/U9HGjeHUWUgRhoZq8QBxq0IER7eBJv6BxoWW4PV7NGkyaBm12tET/lttLzyUqHGMRpGCcNklR2Tb+jkjhEWGH5AWAkl95T4GW5VqVAaQEChzR/INWmDn7iwwnqDtPaDEoMIXtQRXCNPuw93tZX+A0QiMPGIihDLk3RudRivhL2OH+bQTcETb9aNPKctLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJ3H/Xnqz+rQ5m7e4HJqYuko/7Ur8KxC/ghbuUHHwhs=;
 b=WMFIw1zOgoKSB+THBIDQQdArAfdw95kozQQ0Lnv+JZxprY7obZh8lemmBJ2R0NUecQa8IRX2HSMRHYReye6VVlQMiUhFevvD/+2yIZEc2xSAMCvbOt/+qpi5UO2pR97Fdq7nXzh4Pqm3rw46xy0WPguKshgNAJmqcG0CIG4THvk=
Received: from BN0PR04CA0037.namprd04.prod.outlook.com (2603:10b6:408:e8::12)
 by MN7PR19MB676496.namprd19.prod.outlook.com (2603:10b6:208:5f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 15:02:17 +0000
Received: from BN3PEPF00022BCE.namprd03.prod.outlook.com
 (2603:10b6:408:e8:cafe::94) by BN0PR04CA0037.outlook.office365.com
 (2603:10b6:408:e8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 15:02:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCE.mail.protection.outlook.com (10.167.248.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Mon, 26 Oct 2026 15:02:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7EC60406540;
	Mon, 26 Oct 2026 15:02:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5B480822556;
	Mon, 26 Oct 2026 15:02:14 +0000 (UTC)
Date: Mon, 26 Oct 2026 15:02:13 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/2] ASoC: cs43130: Mute the PCM path from hw_free()
 to prepare()
Message-ID: <at9rdZn3HA84d1iA@opensource.cirrus.com>
References: <20261023202941.87999-1-olivier@mgcrea.io>
 <20261023202941.87999-2-olivier@mgcrea.io>
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
In-Reply-To: <20261023202941.87999-2-olivier@mgcrea.io>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCE:EE_|MN7PR19MB676496:EE_
X-MS-Office365-Filtering-Correlation-Id: 78748764-137e-4a62-199b-08df33721faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|23010399003|261026140227099003|11063799006|4143699003|56012099006|261009221227099003|261009223027099003|261021135927099003|261021121427099003|261022105027099003|10067099003|22082099003|6133799003|16102099003|18002099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	LYQT+JIQKccBV+99gIQVgqSXd3maX/vB5Bewe4DNnA2H2tc+q4oKM+CxaYIdZxELH8qf+1E+ykRLe7PokVTtXYxzyozHLSAwwKoCXWf5adCtKsCvUqKJ6aN3mc2j0g3brsOpGn5XM9eebzxjI01TEbjzTH+kpYLIgJf055wCre0zji/TPRz0e69cEUdDC5dNQoywiihCBt83hcbscC9589XO+ld4Nt6JAWGgibft8iHdd5IweZ2UB09de9Pk8Js1gOHS63m4odaBaZLtcB91aaglwsfIOsgqr0buyoEN0cVf5VJVF7JOdyb5HobKHKNTK/uK+KQ70M0aGnSCHQtu9m/OReRmu+jUy7nTIYWXn33t0lxlN1sMHRWGmF12DmGPiPu7yGzv/c+SGNgFH0c9D5DAYpcGd4JKIuku55LaHQGBZug1hHN4MKJB1Wi3VaqhVjyW8N3kXZI6N0C0xEyX2nXedlU/R0pfcAuP6lNlrWZcO01e5/6rZ1Qcema6nvLG+c6A4y2MrpvhvSvBEvSvKswJw7gcyfJQlwHOU1SP3A44kbIY27wTN27/uNs4fUBZKxNhesjRi5eIE+tcv0aO5qRvU+/nJLdXep9PUo6ZEwzoz0nAXtFQppWKrcwzWSP2TzUrZxohC5ofa/QspvtYEaDtEn8464IWXi8WKQYbdcj9TiX57UEgUW59ih8eQHMrzfwk4cZqwDrywXP3o9/EpQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(23010399003)(261026140227099003)(11063799006)(4143699003)(56012099006)(261009221227099003)(261009223027099003)(261021135927099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(6133799003)(16102099003)(18002099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mmOgy0ts9Y9YB/IIQ983iyd/jGseqpIN9cAaJvU3bNGIljpZIgtIm3/FgtMVxd17y+q0AVbEyORMzyy1NlIPjq0V2syZhNpIeUnqdyqXXKKNVB++AiOzQfwy8rmpSWHrkNTf+PmjWnlhd1UjKBafZcwrt0UuuuE7/xajGuo1bYwKc6pszNtooy4Tnpx3pGMIr/OCiktnKU6Wm49P60Ke2B3hk6cnTNmEFoe45dqpHDCYFBOf3NzIFNRBBDdQS3KyDTc8g5i9oBCHE/BJ8r7PoAf9nSMaqFhSeBVoyC/uYHAjjyhA7aYE8iW+X71DKp/NSvnGblbXHu0QHwvs9n5tVU6XVpU94wgt3Qpq054FqobTiW2Al5N+S6JrOKTC8qCS4nX3p06QnWv5gjBcfbsa2oYDOoImowWjLay5qy/YpkChyrXPXuJRs/PWuzPD2BbI
X-Exchange-RoutingPolicyChecked:
	W+bk5UGcBkno4apzi1+8rU8YebRac5jJ/up6gOy3Zt3eu+MeUMvV8rDMk4AK9lzWiRxNQpwm4u54Lt2yP3fGSx7YNCQu9QUFLt63g73k1T/ohGbYLi7z91cdWYsxGy933Q8ig18+Lgk03I3Ue/RNVFCGteAKZlxmBf4+PJRcBW0vrr/5VssISG9Mkqm3KL8d4sdQBVToK2DB27nCtB7t7CH0PcwB+yUeh2lXFX4CweNaeMEPZtASe8dGxvQYsKBkG8hvPZP1dk7PZ2qUZCx/oEAV64NMnmfkmkuXYdXrL6TTgxD2UIxhX9RXMMxhpIA4QkW/W9n/uIXh0SdGk9r9Cg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 15:02:15.8288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78748764-137e-4a62-199b-08df33721faa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR19MB676496
X-Proofpoint-ORIG-GUID: wJNW8AI2RymzJeFqZ9N7kNDerX-uDieD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX3jgp7o80dLLA
 tgDDrwnO/Y3rvMM1FWtdQ1Y3wj0ApMyVBcNp37vTFaHdpSSmCd0kBiiUWFcWuwD+4E7nrnb86A9
 1q3I9OkSnt8m8t47c87hTtTYYNqqydc=
X-Proofpoint-GUID: wJNW8AI2RymzJeFqZ9N7kNDerX-uDieD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX/vqLwI0hcfF0
 jXMJ/4Z0zOkTW8RTa7Sr1nRPNRQfN/6smqOYMI7mQ7sP9HSrv2ioeH670dJNc0YyDb6qWbU8Ciy
 DRQ6/DyMPDS3wbF9vOzMuIJ2qp8+XuG19eXUGzX5y1cmsb6DDPtPd9YlFBYNx4LwrUpkwXwb8kB
 TwzgzUYOr7j/xovmi9wwspRDTG2h1x8BKpQhReG9jwhVkOUCy62kzYN3+FXenbyM6PxtAxF7kml
 8AEcX+MwWZylZ31dnXqwN+WWOhAAn8D/3rfWvHHR678XGfHi1TcDpan9ZMp4zsOjBf2F0mg5nkr
 8/kNvF9MUkHAUVvT760coMLQf0kzM88hkqQ+J9VehZ/0ukfKWvJez09r4aa1B6YU28/LzMX9cBR
 3Q+K9F2SIuD1Q07oZMlBWt0Rim8mOfTYpr2GymwCG7iAa5cS8YrtM2pa714upsj6VX7d0cuk07k
 EG6xADhLhLcBplcO0bg==
X-Authority-Analysis: v=2.4 cv=O/2sLx9W c=1 sm=1 tr=0 ts=6adf6be3 cx=c_pps
 a=/cdxYPoEIjFnUsMTEY5PDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=1rhmA8RM422OcZC6_icA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 23, 2026 at 10:29:41PM +0200, Olivier Louvignes wrote:
> The PCM path is unmuted when DAPM powers it up and muted again only when
> DAPM powers it down, pmdown_time after the stream closes. Meanwhile the
> DAC plays whatever its serial port carries: on a HiBy R1 (CS43131 on an
> Ingenic X1600 I2S controller), loud white noise while a stream is open
> but stopped, as when paused, and until DAPM powers down after it closes.
> 
> Add a mute_stream() op, so that ASoC mutes the path at hw_free() and
> unmutes it at prepare(). The op is not run at trigger time, since the
> codec sits on I2C.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---
> Changes in v2: rebased on broonie/sound for-next, the ops now sit next to
> .auto_selectable_formats. No other change.
> 
> Tested on v7.3 on a HiBy R1 (CS43131), by ear: no hiss while paused or
> after the stream stops. Build-tested with W=1 on for-next.
> 
>  sound/soc/codecs/cs43130.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
> index 7fb23522f081..919280711f8d 100644
> --- a/sound/soc/codecs/cs43130.c
> +++ b/sound/soc/codecs/cs43130.c
> @@ -1624,6 +1624,20 @@ static int cs43130_set_sysclk(struct snd_soc_dai *codec_dai,
>  	return 0;
>  }
>  
> +/*
> + * Mutes the PCM path from hw_free() to the next prepare(). Otherwise it stays
> + * unmuted until DAPM powers it down, pmdown_time after the stream closes, and
> + * plays what the serial port carries meanwhile: white noise on the HiBy R1.
> + */
> +static int cs43130_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
> +
> +	return regmap_update_bits(cs43130->regmap, CS43130_PCM_PATH_CTL_1,
> +				  CS43130_MUTE_MASK, mute ? CS43130_MUTE_EN : 0);
> +}

I am slightly concerned about some variants of the chips
running additional register sequences around the mute, I
was not involved in the work on this driver so little unsure
how critical those are. Would it perhaps be slightly safer to
just remove use_pmdown_time? Thereby forcing the chip to
power down immediately.

Thanks,
Charles

> +
>  static const u64 cs43130_selectable_formats =
>  	SND_SOC_POSSIBLE_DAIFMT_I2S	|
>  	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> @@ -1640,6 +1654,8 @@ static const struct snd_soc_dai_ops cs43130_pcm_ops = {
>  	.hw_free	= cs43130_hw_free,
>  	.set_sysclk	= cs43130_set_sysclk,
>  	.set_fmt	= cs43130_pcm_set_fmt,
> +	.mute_stream	= cs43130_mute_stream,
> +	.no_capture_mute = 1,
>  	.auto_selectable_formats	= &cs43130_selectable_formats,
>  	.num_auto_selectable_formats	= 1,
>  };
> -- 
> 2.39.5
> 
