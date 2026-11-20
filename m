Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191132;
	b=VttLKY3xH1sMsunJEBRAG2o+Q7/XvhvUSzOTeK9Qy5u17OR8ru3M+0xjfe5+pJkA3TxG
	 5xbrP2mr5+QfJSPfAjfIyDXNt2sa0lULxHKQ3hsV3jC3JDz8HDWOLj2pGTiZFOxtIQHVh
	 GfdgMCup46qaDSwRIxB6V9f+1vkaLhliIpuA3c7Mlg/YfMYohM+nslF+F0p3QTmlfImXG
	 KXdce2aOdfXCMZuT74Lz9UiSdVFhC/cCBl6/WOjEe+A2U/poer1977Iz5uVCBZwhjYiX6
	 U8KewTLRtdr6eq+Lo72dcm/GpjAVGcZc28inQhJJ2OASyyUf9+HOG/fDRi9Bpjs/Ffg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191132;
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
	bh=kdZP1tjNtt6g4G4XeQgxymioQW+OvBtVyq4rMJlU0Nw=;
	b=QZfMaePZZxx5/DIei5Q6q9a0v5dnYoZP6x6HkXCoeH12JD7XvZyrvcRPwoevF4oyMdRn
	 r1VbXzKYnz1CH1cbobEs9Bvdx5kNRgC0SLAvtgxRuM8ADvcpjvT9bYUB8sGET8SjJYpuB
	 36pob8Ff6Cps2dqjozQE6Uwf/q0wJHGclB7xXJAvxppfEVzIMelPI4odK7huukbKdfI4S
	 W8ZRS1HkzEz3QyuUE5tmse+46ha8VXSvTu3/F+cOfOtPQt+YC9xDWyoFCcHl8dbkWVHid
	 Dgr1opF5UgrNvSBm6GqARmkU90OCx2oJ9AALPkTfP/Xuzdv/5Fcr9CSsGq3knWYQ0Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VEPYx2pD;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=hBe3I5Im;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C4606A33C;
	Fri, 20 Nov 2026 16:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401C4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VEPYx2pD;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=hBe3I5Im
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFqo4Q927894;
	Fri, 20 Nov 2026 10:11:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kdZP1tjNtt6g4G4XeQgxymioQW+OvBtVyq4rMJlU0Nw=; b=
	VEPYx2pDRz8apdwXEYADE2rbT16jfXinOSH8bqVq8AM1xSCjGoIXQ3g7qRO6J4ms
	tZUfGqDumKvgIPxQ+cWwWW4aHzDBaLL8SRdISYpxorjWPe4cihYX3ZdynN9/Qmc/
	U8R7HaHoOcK1fssV1voduNxT5Z2hyMCrNjXodqXiaGcL3AOzYeZ4JvO0qrs7pvJ4
	7xK7cohpmbSoHSDT0T1PM/uyphHEWWr5U9fQLPw2GsCZi6IihsFJoAElokI6v5kb
	imYSoiTDBmgqTcaVX22OJOiRAtOKH8WS5JeuicYZWsp1vWGUvV7sJJYRqLPp1iZH
	XSZJPlq7Rx8JYUgpqgEvAw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020132.outbound.protection.outlook.com [52.101.56.132])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjb3t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:11:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfaTD7mDd49KOhXDJYuMtDIiVPM29Jl0kTyB34G/x/M1/pgxPcWk+2SLqNTlAb+Wy/zLt3tjBL6hs74X0QkXYzywSRRvOIRvRL4zK5JIbA1fIBlcih7Q3tG4Ur2YQCAZXv9sImpbHjBt4s0ea2jGIYuzX0wB8FmLA6fwdzgdwa8bRD5og7YXkGYp9FR3G9w5YIYkbKsZDczYeYhYJVuFYLKWYAlOQaRQPjD90JH92Os06OH+gI/KqCDm823TJ28GiPdheZByKClzA9d39R1y5y7BZdMQNj+wukBa9ZApP3SIOxnW5mtcAvIrWPVdCM/7zlOmw9dYlW4E0pj+VRYxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdZP1tjNtt6g4G4XeQgxymioQW+OvBtVyq4rMJlU0Nw=;
 b=T8qzxIMrRguLSe2Ouh6Au54Inh+6DwgBNJb31nF/ov6q8zKOi3ZLzHyn9VWjR6MMFnHdiDBH3jpmlqjVWhp09loqoFpyMxpFxB261Lwg61VqZLm6rnPuKvbRC9qylOeqM4b1BfSfqqnZG27/WxkO6ACSh+6NZPGBvXpAkSOUgKksgCu2+70Vob/pb1hQvpe/liAJ3O8umhMx9esQDSs0ouJiP+kiLWeyIwJyLmyX311LMQNlTGMg5aMcoYwGp9mTE6lIrm9JjjA53RO98zsmhUladYkdR31LgtkdQPCDS6ZTrKsHeUplKZoxZmdyp5ihHSvslK0j9X7egZ5JHNjgRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdZP1tjNtt6g4G4XeQgxymioQW+OvBtVyq4rMJlU0Nw=;
 b=hBe3I5ImtnckZTGjncvCCzt24uFFp2BCxjouyaGHKXJ2i7ETsGrHJufxfCiTCf2zELij2aOmHMhaGKCm8GSJeQGxEI6n4vrwrAAK14X57fO5ZCCB9LXnShNNiJ1f5wCjn6wzUPrlbF5GHr6V2+FZiQbFK0dIDU1uw81YLJ3escw=
Received: from BN9PR03CA0796.namprd03.prod.outlook.com (2603:10b6:408:13f::21)
 by DS2PR19MB479429.namprd19.prod.outlook.com (2603:10b6:8:402::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:11:50 +0000
Received: from BN3PEPF00022BCF.namprd03.prod.outlook.com
 (2603:10b6:408:13f:cafe::ae) by BN9PR03CA0796.outlook.office365.com
 (2603:10b6:408:13f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 20 Nov 2026 16:11:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCF.mail.protection.outlook.com (10.167.248.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:11:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1FE6C40655A;
	Fri, 20 Nov 2026 16:11:47 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E4C17822542;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 6/7] ALSA: hda/cs35l41: Store filenames of successfully loaded firmware and tunings
Date: Fri, 20 Nov 2026 16:10:52 +0000
Message-ID: <20261120161136.157593-7-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCF:EE_|DS2PR19MB479429:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 80384345-526e-4e9d-5767-08df4720fb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022075727099003|261028144727099003|261022105027099003|261026121527099003|261026140227099003|22082099003|18002099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4rJEcy6AOOyP6ctuDS2mBlRCQMrCNBZ7UJkcj/0+rxQTy5UfA1tr3CjxBF+gPO5V4mbLEMuEs479mfkfzYi2hqnEQkNgVI9HLn6wdgDwX6Ml7rAcJHZkfIBvA8NjYqr0T+FxmtA5XnudYVxN/zwtStBmaioXIq1lsySfFvWAMqvfn2/wx/37gOK3cKQo/wYriuqJ3uPMP4lg0jFVOfxtfIeOGFc611iGhE9qPHxrbptCtQzuL9+HGgxRQeSkULNkrqYepxfFeKDj409PF0e2qc6iL4L8aIY7c5VWwVz5tibGxE3DGMKJETfHPASOHAVlETGoId9OM5VVw6d/io/nGYLJIWyiREi7KG+VBbcohMtCGZ0oVnDJ5rR1DL695BZbAlDfgPStzxvexGhHh3dBDrY+yBOqmFoLgSStRsjngoRYF+kquwLw4aN/xl8pVPw2Ikl0JFcakQrDKq32eofvz5e0FrdCnYu281/Y7G00T3udQG1KIEyMDc1rj69tduuDd1XmK8kYRCc1YQVrej0PNQ1K6pSZia9LCQRJS0ln3kTAqESLs5E9lOMdtiKM2H0fXBfPpz3w+SfrVy2SnNxRgtY31YHJV0OM2M+9hZaskCKUAVumz3IFB9a9WguAnErcTtl6LMEq4C+IxAAKqNJ5hRL+cV6UFUWSsD66/+0XHfzT5cNJBGKTc9qIaYW+W74aaRItR6bx8souSJgq7pKZpA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022075727099003)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Tpp1W5QZ8LegXJdEe/IXH4ENobHVadkYUGj9BuQMT+p4AsEY6bh16fk2Wmjco/tR7Hng4uxD3kd/moBfoSKMTaINpIs90b1dZmFTE9B4f7T7m6Pud4Ak5RY2tCFCbxeejWtppvqQu2k5S+LgvAla5Ie/GfDBHIMKtwzQ3rM+5nSkftAi5MySxYRVMM7T0aWOkdd26MuRDPT0rYzRsnpwkzFyk/TevdOmodBxC6XIdb0tYLAsQZjJ1qYYSAjuUYn6nmCp8WReVJ7Q954yusU0SnRYqbDZ3pKCwLktLQ4pOzclqN0WNGXUI9c88aZl9D3/pNyxQF22pIWo5nrpEYPYnuHOwr1NVFvw0o5Ua1caxUm70SiHoWLs/MAo+qfoFE7/vcC9X6urRBlezuG8bvaaHOEgR0VmB+ZsVdbq1r55cz+LeMyYiYdoz/AGI2CNqMhG
X-Exchange-RoutingPolicyChecked:
	TlX0mq5WMljuJhfyjPKRFkSUzRHxwG/8AmSLopcGTVRK4TfEWY2I5FaYhoe+eEqkkhKrxJDMUObASjSdZXjlzWzBCdRHox+2ocYf8X4cO0h54uedB0zKiMfzMjmVGbQ2uBoZTRZF3oAYAsTn3AMXek/vy20nnbAIE+XcOCxQ8UPFuY+3K2TmtefP/BV3/B0GzJwUdRsLWYR90CoXyG7Ak6fwIVlnS+VEZrkCAUELxNhe82s9Wq9i3gUktbT9Bp4AVXkWs9cZ9Lqw4CGwjdpX1G4pCYVH3v9pnMcaGEWWKCcl5sSxKfO45WPty+sKrKC4MtlvHjt7jHH6TT3G2WwLlw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:11:49.2302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80384345-526e-4e9d-5767-08df4720fb88
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB479429
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX4ebHOJgHUex3
 SdYPCTYANA4aiLsjtMtjJftZ/4KAE4Ot25V6266IvLPkfGVuM32zdVvvkZLfFITI8n/J/Y+fDSb
 atajIVe+qZtb9PdICvuasFlktNqn9jMnGnrGZ0CMFjn8iY+wTR/VWCJNZgipvw8bXfWZIef5j1J
 x+4g7VaoMN8r2e7qpcIuAg3JBwG/qf7dMJtl3Wx9fSNUEA2v1JBOM/UrZqO4Yj7Qad8jIXQAHLs
 ux163G3IFvvjKKkVNEc7jiE2r28iffwFFFQfqu+oCCt+OpC71NXPcztXLhpFiowb4UkivFuVuf2
 48igk1BkfEE3p9eOY157KzRsdCqeCbV7fhIy7jlT5hMy4daMDP1iogw4VAi8t02klWK7C6iBVxq
 QzRxREWqmDE0cKlT5D4W3IH7JMgaszaTGVURc5BkM7/xKTBz7MDOcrwc68Uxtpr3xPj7m67c3OV
 UR/juktERg19np2zhbQ==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b00714b cx=c_pps
 a=oUxzVdbD+1nmh9QGDDwSmQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=A7nQKJpAKfRNLE_fIZoA:9
X-Proofpoint-ORIG-GUID: mFXvp68F3Lzu7gwJQ2j3yQXncqHJ1OqU
X-Proofpoint-GUID: mFXvp68F3Lzu7gwJQ2j3yQXncqHJ1OqU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX0CP7VQLWZboP
 B1AtfSCYJ3DzhtNAA7LxRFXXfQYpBY39BxUAesM9FrNCt7fBWgXSciqjhPVotuI5CUn+LMBuBU/
 YrRho8Nk3MlQr/V+bKKBmi8r8DQRrrQ=
X-Proofpoint-Spam-Reason: safe

When the CS35L41 HDA driver loads firmware, it typically loops through
possible filenames, requesting each and stopping when it finds a valid
file.

Since firmware is sometimes reloaded - such as during system resume,
it loops through the possible filenames each time. However, since the
filename will never change, we can store the filename when we
successfully load the firmware for the first time, and reuse it later.

This ensures that the only firmware files requested by the driver in
system resume are the same as the ones cached during suspend, since
only successfully requested firmware files are cached. This prevents
unnecessary file access during resume - if a cached firmware is
requested, the cached file is used, eliminating any potential blocking
calls to the filesystem.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 47 +++++++++++++++++-----
 sound/hda/codecs/side-codecs/cs35l41_hda.h |  3 ++
 2 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index a0e2e0c5addf..6f4b2088c5fe 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -142,6 +142,7 @@ static int cs35l41_request_tuning_param_file(struct cs35l41_hda *cs35l41, char *
 		dev_dbg(cs35l41->dev, "Failed to request '%s'\n", *filename);
 		kfree(*filename);
 		*filename = NULL;
+		cs35l41->skip_tuning_params = true;
 	}
 
 	return ret;
@@ -308,6 +309,7 @@ static int cs35l41_fallback_firmware_file(struct cs35l41_hda *cs35l41,
 	if (ret) {
 		release_firmware(*wmfw_firmware);
 		kfree(*wmfw_filename);
+		*wmfw_filename = NULL;
 		goto err;
 	}
 	return 0;
@@ -325,6 +327,25 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 {
 	int ret;
 
+	if (*wmfw_filename) {
+		ret = firmware_request_nowarn(wmfw_firmware, *wmfw_filename, cs35l41->dev);
+		if (ret != 0) {
+			dev_err(cs35l41->dev, "Failed to request known file '%s'\n",
+				*wmfw_filename);
+			return ret;
+		}
+		if (*coeff_filename) {
+			ret = firmware_request_nowarn(coeff_firmware, *coeff_filename,
+						      cs35l41->dev);
+			if (ret != 0) {
+				dev_err(cs35l41->dev, "Failed to request known file '%s'\n",
+					*coeff_filename);
+				return ret;
+			}
+		}
+		return 0;
+	}
+
 	if (cs35l41->speaker_id > -1) {
 		ret = cs35l41_request_firmware_files_spkid(cs35l41, wmfw_firmware, wmfw_filename,
 							   coeff_firmware, coeff_filename);
@@ -374,6 +395,7 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 coeff_err:
 	release_firmware(*wmfw_firmware);
 	kfree(*wmfw_filename);
+	*wmfw_filename = NULL;
 fallback:
 	return cs35l41_fallback_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
 					      coeff_firmware, coeff_filename);
@@ -514,6 +536,9 @@ static int cs35l41_load_tuning_params(struct cs35l41_hda *cs35l41, char *tuning_
 	char *tuning_param_filename __free(kfree) = NULL;
 	int ret;
 
+	if (cs35l41->skip_tuning_params)
+		return 0;
+
 	ret = cs35l41_request_tuning_param_file(cs35l41, tuning_filename, &tuning_param_file,
 						&tuning_param_filename, cs35l41->acpi_subsystem_id);
 	if (ret) {
@@ -538,8 +563,6 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 	const struct firmware *coeff_firmware __free(firmware) = NULL;
 	const struct firmware *wmfw_firmware __free(firmware) = NULL;
 	struct cs_dsp *dsp = &cs35l41->cs_dsp;
-	char *coeff_filename __free(kfree) = NULL;
-	char *wmfw_filename __free(kfree) = NULL;
 	int ret;
 
 	if (!cs35l41->halo_initialized) {
@@ -554,23 +577,23 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 
 	cs35l41_set_default_tuning_params(cs35l41);
 
-	ret = cs35l41_request_firmware_files(cs35l41, &wmfw_firmware, &wmfw_filename,
-					     &coeff_firmware, &coeff_filename);
+	ret = cs35l41_request_firmware_files(cs35l41, &wmfw_firmware, &cs35l41->wmfw_filename,
+					     &coeff_firmware, &cs35l41->coeff_filename);
 	if (ret < 0)
 		return ret;
 
-	dev_dbg(cs35l41->dev, "Loading WMFW Firmware: %s\n", wmfw_filename);
-	if (coeff_filename) {
-		dev_dbg(cs35l41->dev, "Loading Coefficient File: %s\n", coeff_filename);
-		ret = cs35l41_load_tuning_params(cs35l41, coeff_filename);
+	dev_dbg(cs35l41->dev, "Loading WMFW Firmware: %s\n", cs35l41->wmfw_filename);
+	if (cs35l41->coeff_filename) {
+		dev_dbg(cs35l41->dev, "Loading Coefficient File: %s\n", cs35l41->coeff_filename);
+		ret = cs35l41_load_tuning_params(cs35l41, cs35l41->coeff_filename);
 		if (ret)
 			dev_warn(cs35l41->dev, "Unable to load Tuning Parameters: %d\n", ret);
 	} else {
 		dev_warn(cs35l41->dev, "No Coefficient File available.\n");
 	}
 
-	ret = cs_dsp_power_up(dsp, wmfw_firmware, wmfw_filename, coeff_firmware, coeff_filename,
-			      CS35L41_HDA_FW_ID);
+	ret = cs_dsp_power_up(dsp, wmfw_firmware, cs35l41->wmfw_filename, coeff_firmware,
+			      cs35l41->coeff_filename, CS35L41_HDA_FW_ID);
 	if (ret) {
 		cs35l41_set_default_tuning_params(cs35l41);
 		return ret;
@@ -600,6 +623,10 @@ static void cs35l41_remove_dsp(struct cs35l41_hda *cs35l41)
 	cs35l41_shutdown_dsp(cs35l41);
 	cs_dsp_remove(dsp);
 	cs35l41->halo_initialized = false;
+	kfree(cs35l41->wmfw_filename);
+	kfree(cs35l41->coeff_filename);
+	cs35l41->wmfw_filename = NULL;
+	cs35l41->coeff_filename = NULL;
 }
 
 /* Protection release cycle to get the speaker out of Safe-Mode */
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.h b/sound/hda/codecs/side-codecs/cs35l41_hda.h
index 6fea4b2ad0ac..64ee70c31a43 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.h
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.h
@@ -93,7 +93,10 @@ struct cs35l41_hda {
 	unsigned int tuning_gain;
 	struct cirrus_amp_cal_data cal_data;
 	bool cal_data_valid;
+	bool skip_tuning_params;
 
+	char *coeff_filename;
+	char *wmfw_filename;
 };
 
 enum halo_state {
-- 
2.43.0

