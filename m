Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793894450;
	b=ImPGfJayIn/s5Mbonman0ha/nNKcLsattE6lDob2yx6UOtiW1S4VBvDIM2hxVEOPxN7T
	 bY8LX3b217AwZIYmz85lNT/CgitsecucDpqC46w8aymzhl2hWQ5j/VJ7VBVqYO6LuJyIG
	 rjBke2+ZbYctNoOdmQGZVikh92kvB90xSyY/v3tgumdq6SSWM5cSiOaNEvnmX7bTGVrt8
	 uzHkfP6ONtqS/c3HrqK+HDWRBQ6QbW/eYqQeFUSodqTT4hj0nAoqaOGgmejUsh6/KQVAv
	 lgfzTT2aZ4ibT0jOWE5htWxAn9TfTbrhPOxMSdLZRY1pJQf9uxjPQSgQakan8cyW+Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:References:In-Reply-To:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:Thread-Index:Content-Language:X-EOPAttributedMessage:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=aAFk8vFxihEZwiTshIzGn2wQK/NzYlKBWT5ROtf2pCk=;
	b=24+rfAA9nGZlgBCzNCpMTO7qyx84mE2BWuppcKB5iesyXOMFR7Nno84xf7iUCJznDjFK
	 sjpuWyA0wf9eSVXtQdJrO7XDVExKWnX/Dzfr775Q0a2ahPTN8i3dxEvlrJ6ynUk6kEk6j
	 qKxphG4zv8kHFBr7miAhdE94mhXTZlImNkXuLgVpinavV+2/YElmt7f9vA+v2nisU4y5i
	 h8KU/OxDMuEf0I3senAGnbQ5HcNAX+cSRmcVZPlImmNNEFoDO3Uw2/QkeBqFqU/H90GqL
	 ysl8NDxRoOgcU4WH0r7RDh15bKbJ0+KWxF7mRHnsrQBE4wjdV99WgIBhkBvkqIht18g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UQsKrYvx;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nZVlV0rB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17273606A621
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 16:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17273606A621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UQsKrYvx;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nZVlV0rB
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EgKvP1891006;
	Thu, 5 Nov 2026 10:00:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aAFk8vFxihEZwiTshIzGn2wQK/NzYlKBWT5ROtf2pCk=; b=
	UQsKrYvxDgT4+wGpggkmyNdHXPO7ir59Igp2SNxhbq5jDdg+nGikqmBwkJy9Vbey
	3w4cX0jS/LC4UzolLP1cLjk65uba0sY59X41M18KTXPeSaUUD1dYa7yOk/OfBYDs
	KDB9CiuDCbgHbIG79AVosiPWoHboETPX058GBTdW7iS2pZHnLNKvzzI6pwu22CiL
	7ItBgq/03cDe3yP2dCe46oJhpJH84j+N6HAtKLhB3MtAIF3L2TsGpCf5A7CBwWHD
	EpFQJa3h2qdrid+FQFmeJdQY8zzqQ8RanCBNfqFKWSmBVTuonFy+as42i2zTXj9T
	J38SYx5EskqgAz+yxdcf3Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020077.outbound.protection.outlook.com [52.101.85.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hrusx04ep-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 10:00:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpQDPP5m5Sccq2JGdnOWqKO6qRJAnP+MEgbn/Lt3H8uUEA/PizPedwrzsyHEUto2gwbTB8U660nhGfdR7WDBjq0LiUTiERm2W6N1XQRy3yZdqq0cChPrvbRkidLcAYCgTTBBlQxcDg3YuTnJG6/312I97ZJAMrewRznPoDy5FdiMsFXWxbUGX8GVAa2De4mUyu0g/K4XR2xtBjWVSGBxsyQw7Lf2tbemmMt2KkC7PofnG+hLcA2VcZMNHgi6as8vEbK434yuAOnUPJBsxafM2rKwXgRPVwIl5wEqF/iEu6YMdNmcEmu4ArBe6wSZ/wguOG6+cSoTL6gaci0AJNtn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAFk8vFxihEZwiTshIzGn2wQK/NzYlKBWT5ROtf2pCk=;
 b=mt6dpK/y/QGDTaxBiHokFeCMYqnU4P9/ox3VBa6yIWqHlae5rg8kw8I1WWZXZXktDUA+YKI97XCL0z58TlffmwOz03a1pvnWbWR8v5CEuVsHm4MNz8DEuqY2QBBUBAj0UrWT/GvCNRn6XosV3AgEOydzyNomgnYIPRfoLHEP18zEuFwdko4SWEJOi15OhvgWNDyt8a6lXLVABRPBfCwDhNozf5ITgW0xqv5g4eW1Nu/gxyqb4N3TlzAaKsJI/SeNC0fUixx9+cxcfQqTqOOmg+2MNgHEoSG6bVE+QWrGAEjmID5d4s5GOb9+aD6LVjTKfrjaqxoHkdH8//WZXc6fUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAFk8vFxihEZwiTshIzGn2wQK/NzYlKBWT5ROtf2pCk=;
 b=nZVlV0rBwGoHAEMnrwgqaT83P/q+xsPEikoR4Psqx5akOQU04hInaZE0/88HV74mUE07Zjn2UGDZgF2KW5PpstWf6Gj2/cR9Hcc1CDngEIAG6Woczlo1w/0yJMM8RE3jV5jKz5yhPT8Ou4kThGrD+pziUBXDiKk36qJz5etbDaY=
Received: from MW4P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::28)
 by IA3PR19MB8542.namprd19.prod.outlook.com (2603:10b6:208:51c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 16:00:25 +0000
Received: from MW3PEPF00001655.namprd21.prod.outlook.com
 (2603:10b6:303:114:cafe::8f) by MW4P222CA0023.outlook.office365.com
 (2603:10b6:303:114::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 16:00:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW3PEPF00001655.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.0
 via Frontend Transport; Thu, 5 Nov 2026 16:00:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CFF21406544;
	Thu,  5 Nov 2026 16:00:22 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.159])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 990DB82026C;
	Thu,  5 Nov 2026 16:00:22 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'Danylo Malyuta'" <danylo@malyuta.name>, <david.rhodes@cirrus.com>,
        <rf@opensource.cirrus.com>
Cc: <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <tiwai@suse.com>, <perex@perex.cz>
References: <qPs6xwraoKtrXcbKzWmB-Y16t8enjkyONsARL-2-9nSu8CG66cEcaisrghfDNENetpPfrev5kvxb5XLT7FL03FaAyQ_q9TD3K8n-4OSzEYY=@malyuta.name>
In-Reply-To: <qPs6xwraoKtrXcbKzWmB-Y16t8enjkyONsARL-2-9nSu8CG66cEcaisrghfDNENetpPfrev5kvxb5XLT7FL03FaAyQ_q9TD3K8n-4OSzEYY=@malyuta.name>
Subject: RE: [BUG] ALSA: hda/cs35l41: hibernation deadlock between fw_load_work queued at thaw and cs35l41_system_suspend_prep
Date: Thu, 5 Nov 2026 16:00:22 -0000
Message-ID: <00b101dd6d3e$c3953b40$4abfb1c0$@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLdc01suQShWfmEdHRRJYy3Po1t+LUflmmQ
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001655:EE_|IA3PR19MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: c3de3eaa-6219-40a6-540d-08df3b55e72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|16102099003|18002099003|22082099003|6133799003|10067099003|3023799007|11063799006|5023799004|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261021135927099003|261022115727099003|56012099006|261009223027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	DjbqVLXkqQqajCCCPNbWD+swQcoYE28HzY/cM9kX6DvN5Cbj2Or6AfYzjQ3Hdy4fMc95OlbPOhtWnlnIB6pK4an1smCDuDTqsBhp0YGWmkjbxgtQ6RQr5v0GgKc7ACKdvV3wMQ81m7zuLE0eRf323tX/5C2ph10jsin8gKV9xOyuebvVHKlZTEPvCX/wfOx7DpauEtuODYZUA5zmiqwqQANkuUUVGKyv2ubGG/gNaGfsEiWCrOaDXvZv5oYS9GUFDkgx5RtEsOqvpWT1dENWIC9SzJ0+Rnm+57pFH/KSOp+8rxbmlsWP/Ecv6ztAWCtS3DYh6z57lHqGhSkSjxLy3t3QZLsmcHd9VuXLRFDY5yNK0S9PxfcmXJqq5hpo/x2bACB5AXTi4aqRpSD6fcO0cxeFRfdpkkbiyO+7fRflCqjEeXw7tn+Abn7vaLYF05Sohdn7qwwZxq0ou5/Re8+E7NAmsDxb6Pk5lVR3jwPvEnAOT71YHOB9X7Q9iXDHxNWiodJ7zfR3smiF0iv6fwFUw35aonHoylH7VHff7Ch+0QXz+/oaaXIDt+i7/yrPCLG/qn3s3bSFAdlWP7BBrzsEp2QIVsGuxF8z6mulhaAxOr+qOHTk7p+hCQ281L0dZeiOWVa0RuVwd5Wp7wb6R3vLOQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(16102099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(11063799006)(5023799004)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021135927099003)(261022115727099003)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bwkeXBikvb74dBVgYx3htSEwqQVAjianMKK2OHiFRek2zJFTlCGUpNFzxbjRjHHU45Wnrjtwcfg8Jno6LLKuPbz2XjlFY2JqG1Gord5nIVctXL/IboYaioTN06PTwjOAqJV73DA3GWO99Dsx3zHShoeFqhOmVMhaXIZZirtgS9Rgm2EPcHcLGwK3eioaaKcdvBpEy3QLVSgEUDra4oZnSS9RRgeeVtBkVGOEDBpk7qZuDqX586bbRMGpernpktmxjPGuC1fVYHRLj3NUArKC3Z6e8sV8Igu3MMsINbaWYE793uSxBZ+iKvMHGgRRJIBzjXS/L0z+gz9cYN8pykMb1pHyuqKDDfMXVsVGHOsAo0Yvaz/WmsLKoCbAfnJqjMEenbjhZuaQL4ScjD4QaQcAS96Le+fIIC9RmCtSN7PXjI8OJ074yW9sLOa0w6n5HpKE
X-Exchange-RoutingPolicyChecked:
	R1oSJVWGopkBaER9SdQ23KW0QWBbOG69eecGorbDSAqXBKEecqSFSkjO65v6oCbQ+9MdwExxVirOF36tcTh28q6H3K+raALldL/ddaM1QDQv93z5iuIpA/WZCPZTu1dvQVRYupp8y/PyI5CqWxHBv+HuMU0Fwqj+sQbE4PP9cR5OX3ZfmmZrx7XiFpClJVnGm24saw5k0x9Ka0lLq3qRUu6x0B26I9W49wgg355zxsfw54pg4q8tfTk1ghtUvJ60QSGiJSMMQlvcQKihG/O6JazBMxOZEiSr/s66KPXScabeIYSYQ1kqPf8OV+Nu1uJTvSioa2wdKdLFmlqX2y9bng==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 16:00:24.3476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3de3eaa-6219-40a6-540d-08df3b55e72e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW3PEPF00001655.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8542
X-Proofpoint-GUID: AxrUtgvXqyXL898nRV0TnzYB6_N8MOQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfXwlMfV/AmnirR
 8u0QMd0mxdImAvym7lvu5EvhaNBmvaqSRK0pAE7zK9b3gGvuAC/tLIHIVX06LgZDjW15aIInDAF
 IBFS4KMk33+YTRf1VEypJBKatl1PhLS5tBydhyUcqc87NksACmsMBUzz/vmrkPdn9NnD5rewLgZ
 HA27r9PYcZYeAsBvjm02bwsBi6iMnI9k/9EVrXDNnPGq76sHgQML9wTLCcFE/VkazUpFxCaF/rE
 6AA4RkMCop+/I98FxToAP1xAGMt8rIGblzMkYnSJAF6aDJ/9hyGlv5MFRFBJ4WXpAu5zN6G+K/v
 UFjK/bvNvlugiRL0rUy2eXlyPbKuR4Na7Pb7edBS2g/QGfv+XpXw61ZUt8ZethTGeAIiqpYmvQp
 vhgTJv1R4M/3s+qzbam0cNbzWUQJ1zPRVIiPybX9mT3pbxI9ZNhxUonBB1wOEVFKped+bWjJQZ3
 vg63s+F+qvzISqryr8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfXzERm5aK0klJn
 CafUlN+0WJH3jyJsEpsJ0hvP4XNkm9qZFBQcOjBPy0bkupfaNBzcu3O9WPT2ImQcStlezAvuXgf
 Rt55ERSIjTZfIyL4dPJK7txf9b74Xig=
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6aeca81d cx=c_pps
 a=bbl9BA5qyFAQDT3iAuOISA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=Vh0SLZkRAAAA:8 a=jU4qhlNgAAAA:8 a=w1d2syhTAAAA:8
 a=iox4zFpeAAAA:8 a=Qe2RcU0kFWgtpAUNY_AA:9 a=QEXdDO2ut3YA:10
 a=COG8eBgs1KE4PjaOwrCZ:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: AxrUtgvXqyXL898nRV0TnzYB6_N8MOQK
X-Proofpoint-Spam-Reason: safe

Hi,

Please create a bugzilla ticket at the below address and CC Cirrus =
Patches (patches@opensource.cirrus.com) to it, we will investigate the =
issue as soon as we can.

https://bugzilla.kernel.org/

Please attach an acpi dump and dmesg to the ticket.

Creating a public Bugzilla allows others with the same laptop to find =
relevant information pertaining to this issue

Thanks,
Stefan

> -----Original Message-----
> From: Danylo Malyuta <danylo@malyuta.name>
> Sent: Saturday, October 31, 2026 7:27 PM
> To: david.rhodes@cirrus.com; rf@opensource.cirrus.com
> Cc: linux-sound@vger.kernel.org; patches@opensource.cirrus.com;
> tiwai@suse.com; perex@perex.cz
> Subject: [BUG] ALSA: hda/cs35l41: hibernation deadlock between
> fw_load_work queued at thaw and cs35l41_system_suspend_prep
>=20
> Hello David and Richard,
>=20
> I hope you all are doing well. I am writing to report a "hibernation =
hang" bug
> that I encountered on my ASUS ProArt PX13 HN7306WU laptop
> running Fedora Linux 44 on the 7.2.13-200.fc44.x86_64 kernel. The
> behavioral issue is that when putting the laptop to hibernate =
(systemctl
> hibernate), it would "hang" at the very end with the power button =
still lit but
> everything else off/screen dark and the computer completely =
unresponsive to
> anything but holding the power button until it shuts off. Turning back =
on, the
> saved session comes back - so everything gets saved properly, it's =
just that the
> laptop fails to shut itself off. This would happen randomly and =
rarely, in maybe
> 1 out of every 10 hibernations.
>=20
> I am not a Linux kernel wizard, so full disclosure I worked through =
Claude Opus
> 5.5 to figure out the problem. After about a week of attempts and the =
AI
> writing trace and logging logic to run during sleep/hibernation, I =
finally root
> caused the issue as being the CS35L41 driver deadlocking. The bug =
submission
> text below is fully composed by Claude, because it is beyond my linux
> experience to compose an issue report like this. The previous =
paragraph and
> this one, however, were written by me. I hope that the following is =
useful to
> you as I believe it is the first time anyone is reporting this problem =
with the
> driver. I also want to thank you all for your work maintaining the =
audio system
> and supporting the open source community.
>=20
> ------
>=20
> Hibernation (S4, platform mode) deadlocks on my laptop with two
> CS35L41 HDA amps. The image is written, then the machine hangs before
> powering off (screen black, power LED on, ~13 W) until it is forced =
off. In
> normal use this happened in about 1 in 20 hibernations. With the page =
cache
> dropped right before hibernating, it happens every time.
>=20
> System:
> - ASUS ProArt PX13 HN7306WU, BIOS HN7306WU.318 05/04/2026
> - CSC3551, two amps (i2c-CSC3551:00-cs35l41-hda.0 and .1),
>   snd_hda_scodec_cs35l41, firmware cs35l41-dsp1-spk-prot-10431ed3
>   (Fedora cirrus-audio-firmware-20261019)
> - Fedora kernel 7.2.13-200.fc44. It is tainted (OE) by the NVIDIA
>   module, which is not involved; I can retest without it.
> - Root filesystem and the hibernation swap file both on btrfs
>=20
> The relevant code is unchanged in mainline (7.3) and in sound.git =
for-next.
>=20
> What happens, from a softdog panic (soft_panic=3D1,
> panic_sys_info=3Dblocked_tasks) whose log was saved with efi-pstore:
>=20
> 1. After the hibernation image is created, the thaw runs
>    cs35l41_system_resume(), since SYSTEM_SLEEP_PM_OPS uses it for
>    .thaw too. With request_fw_load set, it queues
>    cs35l41->fw_load_work.
>=20
> 2. The image is written ("PM: Image saving done").
>=20
> 3. hibernation_platform_enter() -> dpm_suspend_start() ->
>    dpm_prepare() -> cs35l41_system_suspend_prep() blocks on
>    cs35l41->fw_mutex.
>=20
> 4. fw_mutex is held by cs35l41_fw_load_work(). It is in
>    request_firmware(), in a btrfs directory lookup, waiting for a
>    metadata read. btrfs completes metadata reads on its
>    "btrfs-endio-meta" workqueue (btrfs_simple_end_io() ->
>    btrfs_end_io_wq() in fs/btrfs/bio.c), which btrfs_init_workqueues()
>    allocates with WQ_FREEZABLE. That workqueue is frozen at this =
point,
>    so the read never completes. The btrfs-transaction thread is stuck
>    on such a read too.
>=20
> So it deadlocks whenever the firmware load at the thaw misses the =
dentry or
> page cache. Usually it doesn't, because the amps reload their firmware =
at
> every resume. But hibernate_preallocate_memory() can evict those files =
under
> memory pressure. The first logged hang was right after a large dnf =
transaction:
> setting aside the image memory took 3.2 s, against ~1.3 s in the =
hibernations
> just before.
>=20
> Timeline of the reproduced hang:
>=20
>   PM: thaw of devices complete after 784.342 msecs
>   PM: hibernation: Writing hibernation image.
>   PM: Image saving done
>   printk: Suspending console(s) (use no_console_suspend to debug)
>   softdog: Initiating panic                  <- 280 s later
>   Kernel panic - not syncing: Software Watchdog Timer expired
>=20
> The stuck tasks, trimmed (the full ~93 KB log is available):
>=20
> task:systemd-sleep   state:D stack:0     pid:66843 tgid:66843 ppid:1
>  __mutex_lock.constprop.0+0x449/0xa70
>  cs35l41_system_suspend_prep+0x31/0xb0 [snd_hda_scodec_cs35l41]
>  device_prepare+0xaf/0x270
>  dpm_prepare+0x114/0x290
>  dpm_suspend_start+0x1e/0x60
>  hibernation_platform_enter+0x5b/0x150
>  hibernate.cold+0x3a7/0x4b5
>  state_store+0x45/0x60
>  kernfs_fop_write_iter+0x178/0x200
>  vfs_write+0x281/0x560
>  ksys_write+0x7b/0x110
>  do_syscall_64+0xe2/0x570
>=20
> task:kworker/12:1    state:D stack:0     pid:28203 tgid:28203 ppid:2
> Workqueue: events cs35l41_fw_load_work [snd_hda_scodec_cs35l41]
>  io_schedule+0x46/0x70
>  bit_wait_io+0x11/0x70
>  __wait_on_bit+0x92/0xb0
>  out_of_line_wait_on_bit+0x97/0xc0
>  read_extent_buffer_pages+0x47/0x60
>  btrfs_read_extent_buffer+0x69/0xa0
>  read_block_for_search+0x201/0x3e0
>  btrfs_search_slot+0x39e/0x1210
>  btrfs_lookup_dir_item+0x8e/0xf0
>  btrfs_lookup_dentry+0x122/0x5b0
>  btrfs_lookup+0x16/0x30
>  lookup_open.isra.0+0x1c1/0x4e0
>  open_last_lookups+0x18e/0x7e0
>  path_openat+0x83/0x2a0
>  do_file_open_root+0x15a/0x230
>  file_open_root+0xb0/0x1a0
>  kernel_read_file_from_path_initns+0xcd/0x170
>  fw_get_filesystem_firmware+0x173/0x400
>  _request_firmware+0x2ba/0x3a0
>  firmware_request_nowarn+0x3d/0x60
>  cs35l41_request_firmware_file+0xea/0x360 [snd_hda_scodec_cs35l41]
>  cs35l41_request_firmware_files_spkid.constprop.0+0x39/0x160
> [snd_hda_scodec_cs35l41]
>  cs35l41_request_firmware_files.constprop.0+0xf1/0x120
> [snd_hda_scodec_cs35l41]
>  cs35l41_init_dsp+0xae/0x250 [snd_hda_scodec_cs35l41]
>  cs35l41_smart_amp+0x43/0x1f0 [snd_hda_scodec_cs35l41]
>  cs35l41_fw_load_work+0x50/0x90 [snd_hda_scodec_cs35l41]
>  process_one_work+0x19e/0x370
>  worker_thread+0x1a6/0x310
>  kthread+0xe4/0x120
>=20
> (The other amp's cs35l41_fw_load_work, kworker/12:0, has the same
> stack.)
>=20
> task:btrfs-transacti state:D stack:0     pid:621   tgid:621   ppid:2
>  io_schedule+0x46/0x70
>  bit_wait_io+0x11/0x70
>  __wait_on_bit+0x92/0xb0
>  out_of_line_wait_on_bit+0x97/0xc0
>  read_extent_buffer_pages+0x47/0x60
>  btrfs_read_extent_buffer+0x69/0xa0
>  read_block_for_search+0x201/0x3e0
>  btrfs_search_slot+0x39e/0x1210
>  btrfs_insert_empty_items+0x3a/0x80
>  alloc_reserved_tree_block+0x13f/0x370
>  run_delayed_tree_ref+0x1c5/0x2b0
>  btrfs_run_delayed_refs_for_head+0x1f3/0x3b0
>=20
> All CPUs were idle (swapper in cpuidle_enter_state), so this is a =
deadlock, not
> a lockup.
>=20
> Reproduction (hangs on the first try; I used a softdog to recover):
>=20
>   sync; echo 3 > /proc/sys/vm/drop_caches; systemctl hibernate
>=20
> Workaround, which also confirms the analysis: a systemd-sleep hook =
that
> turns the "L0 DSP1 Firmware Load" and "R0 DSP1 Firmware Load"
> controls off before a hibernation and back on after the resume. With
> request_fw_load cleared, nothing is queued at the thaw, and the same
> drop_caches test hibernates and resumes normally. The firmware reloads
> from the hook after the resume.
>=20
> As a fix, the driver could avoid loading firmware at the thaw: the =
image is
> about to be written and the system powered off, and .restore or =
.resume
> reloads it anyway. For example, separate .freeze, .thaw, .poweroff and =
.restore
> callbacks instead of SYSTEM_SLEEP_PM_OPS, with .thaw not queuing
> fw_load_work. I haven't tested this. More generally, any filesystem =
I/O started
> between the thaw and the power-off can deadlock like this when it =
misses the
> cache, at least on btrfs.
>=20
> I'm happy to test patches, and can send the full logs.
>=20
> --
> Danylo Malyuta, PhD
> https://www.malyuta.name
> https://www.linkedin.com/in/danylomalyuta/
>=20
>=20
> Sent with Proton Mail secure email.


