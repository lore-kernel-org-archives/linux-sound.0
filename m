Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795169549;
	b=1JAPZ64Tj0Qf5dSPCIWRnFoI+kELhW/+M0B7B8V8Pzn4QDxxUiBqqJAYH8pZMU4Fl4+X
	 BRMlCu02W8OniHUMu535w9eypboHw/vbSgwRuTQlMf3uFnEaP2aFiG3r2FLpVpgU7BFWP
	 e0TGFHBJ/UDQdkH/buk9rXGhu17y89Y3VIRA9hII54eH9UKM3x9wzM3kFiKpCDLTuoQqN
	 4t4/Gr0b/fzZkN9/PNHUzTSSIrZ0+cxlCmw7iABq0cCnd0Sv4qEy2yoqlsNJStW+XP+jk
	 TizWiB+j/5gJHYRHU5E5uu1S+qRiLte4qyny3Cw3MEpAwTfysTSSDyZmLbLs6OX4VhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169549;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=Ne6vQ6dHo0/nLVZJuEvAV2RaJAZfzTFdrRmlofoyzBI=;
	b=JDf3Y6NEkbLItjAF1CxIvuZ1OGnKHwNCELDcWWp7f+zbkan1OTUvBD8OP5vOu30XXp+w
	 sF6PHsqyQ+36P47V/I+FkeM9OUgvLi8n/AUsSo+wdzc3gP1ymUj41IRgQ3ynPHefIxf6Y
	 0JZGkstn6YJ7woIwGxpTpqK4uAORUVvoTFWNkvQsk9U6wrjh0Aq1RnAg3qiwLfWpQTmEH
	 3tS1hjwAD7QbrLdjop6R+tfXx55woAvIoAuvvVi76MSGI/FouYZKN8qjchG96GFu5f9kq
	 xCOkVC0rabPT1F1w99ErD9BGDj5R44IdrmclmKkblK8ywMm0ApyJB9XYDSxMQQ24EcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MedVIs1O;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=EmSNeVac;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F311606A326
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F311606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MedVIs1O;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=EmSNeVac
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK8ZkJX2405614;
	Fri, 20 Nov 2026 04:11:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Ne6vQ6dHo0/nLVZJuE
	vAV2RaJAZfzTFdrRmlofoyzBI=; b=MedVIs1OIdUsmsA4zDC3dO4s7LEXMvOeAB
	sRfNiheXUjozuind9KFWxteBiCXYyBO8mvxpVKRK4L9hLbwXFbXjdSId51bwwm09
	cNii+MMBemoHtisgzseR7bJ6ipoU2tNQR/QCWdbBe+UfJQdXwaX07YbNhHDn1BwT
	EUmVeMTtxOChWmeroVtjme0+HRKPhp6j4lfGZaDof7cQwjzuT9F5zZiJMudcZZwF
	VDOqLxgTJIuz/N8FoP5exr7D0uaua3hCtKUyj11pWtBGaCOt1SGIWhjqWX58SvrM
	mQlO3cAnLRjVMBubF3JdimhYX3ruZIEcYnENUUTDHfekK5Kj+VIA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023086.outbound.protection.outlook.com [40.93.196.86])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j24prhcx0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 04:11:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ceUcAWpAkX2Ds18iK2o7KnzI5q6F61f3aJeoItmNbj8yXf8ev2sk+pTyVpAELblWMU4/zTt7t4RL4+0AXYwQ8tMWlxeXTl4d0zeeIYkw7OMaH1F5kijP6H34o+80SZ4PrctKvDRuWcoHWbnxjRfmZL+yhfVhYfOIRvLoqiEL2Q4Si6N/5gMuNpkuIoSblji4wJmpvBkINF0s07TtTUXhtrYKurRI257wL9UETpKRg/y1lxpWsrku+T1VeF9YFkbX5+3KNNpcprg5JGW8m5WFsh5g14qrOxTWIx4iCDTb0WrTlWFHCcdKvc0UWi9aFaMjGtxDZL7a/UUlAbRGed6HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne6vQ6dHo0/nLVZJuEvAV2RaJAZfzTFdrRmlofoyzBI=;
 b=lZi0GIu04z+QBpxYVdGNSfWdcJ5OZlrP7Bk9qXjvBlligdBs5VacHYZnfnmrh48Y6nETIf9yO6JZSGDwpmEejvjF//XmDaIuQMc5fY9M+Raqcm/QeeQdh6TVIMO97CtwReHsWmBRmCRBDU4hyeYNGNA6GnFNOwabZlPGye2/wPlcX/VhIxFWKX5rpIiaG41H1gQQVAQEWB316zhyssKNemMmyVL7jGsla+RIQ5cza4u7c7Xh5Jw4CId6yM5GQ3516xuL4MUUeRMpVD5vZCAKFVumZ6Gv34EAYMXvWw1klmgSYqIb/StkptltB8+88JS61rWHvFYqWdJ0cW1QZwex4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne6vQ6dHo0/nLVZJuEvAV2RaJAZfzTFdrRmlofoyzBI=;
 b=EmSNeVaccvY9orNesdlJ1HphXeA1STOgrnFcDgR31qygiV1jX1x0Zu9/78n8c3zOFyFsoQPPtT22h8pu15myB3xfrc59qRIuozNa/dV9pbPFzs3AGz1I72nh8H52OXLiEPdo0P52p0GNE+D2MZiShS5ZYM2D3jVNWWxoJ9SvFN0=
Received: from CY8P220CA0031.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::17)
 by LV0PR19MB980943.namprd19.prod.outlook.com (2603:10b6:408:607::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 10:11:47 +0000
Received: from CY5PEPF00000E81.namprd05.prod.outlook.com
 (2603:10b6:930:47:cafe::37) by CY8P220CA0031.outlook.office365.com
 (2603:10b6:930:47::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 10:11:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E81.mail.protection.outlook.com (10.167.247.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 10:11:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 798F1406545;
	Fri, 20 Nov 2026 10:11:44 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 586FC82024C;
	Fri, 20 Nov 2026 10:11:44 +0000 (UTC)
Date: Fri, 20 Nov 2026 10:11:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rafael Diniz <rafael@riseup.net>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: wm8731: power the converters together, activate
 the interface last
Message-ID: <awAc35H1iSr7fk5Z@opensource.cirrus.com>
References: <20261120080825.2078162-1-rafael@riseup.net>
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
In-Reply-To: <20261120080825.2078162-1-rafael@riseup.net>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E81:EE_|LV0PR19MB980943:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d101855-16ef-4e9f-0656-08df46eeaf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|36860700016|82310400026|261022105027099003|10067099003|261022075727099003|261021135927099003|11063799006|56012099006|261009223027099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lTmDcPT4bk52Hv9YvhJ0sv7PjqVzW6sc64i3kdMb21tGpff7f4ktyRZYF1CxEpcAoVP3rrBvpgPe34IBbi+dgRz+fQkkk3R0mXMYK0M+6gAKancdmzLp8QCSEeU/i+RR25/pcw9AlKlOetukDJCFY0AQuqW041CS/M1h0NQHhYH/V1zEiZDQ/wmtYuPAo6l/esr2mqbeRnfatXcGvd+S6F4C8TxeLdIapB0eqjsL8LjHHGJrqi/BNSa41t6kUAassCBAH7LdyD1y4NyuSMnTdqUP0gKE/5wYbHIPCjHtwQgbwppfPAqaz5Ld1swETn/ndxFgtoTLCjUK+rxUE+2AmFTa+oRJn3Dw0yoqdGCyKEWSvEWv7Rwt1TT6lnZ9V4EdpMhv4jiG2WLxGjXHAtJm+UIihbK/1ZVsDxrqY9Ccj/J04iLJzku/8T28nLM70/XKH4xL8ts7mqs2kBNncAR52MoeulX0umIGzt8wzMeIOBk1EAyAmyVIq3V6KkcAGXKhbk/SP7GoPX8TTxHtTht+L4p4wpsdW/bVwxt94E37MRIMZCfIUqwsX2GnmnIE8NfXR7JN2kh1fg4Nujolr1um3AYyr54SnG6t2iT97zkuK5rcn8IM50EhArEmGpt1c9PMJbvwGIhHcmv42gtimp5r06WpeQRyyyptD7ZshykEQZ0MGRPxlK5ftuJCL/FKycNo83dqwUV1Yir7wstdo3/G4A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(36860700016)(82310400026)(261022105027099003)(10067099003)(261022075727099003)(261021135927099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dQjwTziGqBe/pQC3TFmUF+u9NCa3TP2vqDl9hvuJxBGP9hS4P37FvOBw/KfhGiiDDvGo/lp5H2z+Qy30TCPe4gYV3KUNP9q3V4cwOzj6p2g5nShy8uGJMDiUS4gh1RzAb00K2GvT1MmXpUZQI7AEr21XpPNbA9yYmizc4S8lYzHjQyvE2lGZm5w2BN55PswPnHdoxc57q7LSxfj9KwGaUHKGTwu9zUEr6o/3tcsLULKfRHKaxirOXMMmTr2aQpJ+ngcnqW5Gdrhw2u3NQwZ4Ey0WaMEXam04n24Gv+gPF3mo5tbx3s1gEkbV85bOrG7URg+6z9zMwJsc4JGynw5+A3YLj3UWEljELQYgI8//CZZJfzowIPtyl8H3OprqOUz9Nl26TrVgjZ5pP4qY6CUOUHuvDK3sK42NYTATaX7UEccFtUzfsxpiXn/YflB0tnjs
X-Exchange-RoutingPolicyChecked:
	CnGdawmTQb0tALbhS77M58+F9vElVMo2AcK3m1wpj4BP/NHBNpkWYyQ+o+DHcu738H/N5mcOt54DGlePPJ3x6EIZOWGaNqCO0nh8AgNqgWvFEZbvlJLawq8sRExlengHtUwKzKFo/WqunDY2cHOl+12uB1XEutwWFy8NSkHHJpZ+mBQVlzsEaJ2kLVmfCNMZRBrvxXO9ZjDr/uf91PVCz8gJltA3Eq5ugL3x/JmyNKAnH5oBRK8UpE07RwbcKC7b5XK8sY1BSbBdBWI+AtQMjn0zxmv3axGHmwVoPvvIzuz3WnTchxNN/Rg6gXw/nIevrujXh+RcnlVxAW/P46FkMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:11:46.1166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d101855-16ef-4e9f-0656-08df46eeaf1f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E81.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB980943
X-Proofpoint-GUID: C64wlMT-Q5SzUv9lZrZUWUIYkNHWchck
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX/rfz2eKUk8EG
 izgYREyqmgUzT0f0yKuqZJoCyagmJSnD/OaxmtlZSQSUOI6OUhdmqNqUelBKFc51ovJmheqMITk
 02uH9XnUHebgdnKDW4tHiyfx9QKnKtk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfXw6fY1a25AVA4
 NQxf10ELqyZ7uL9gh5DQM4whLBEe5sd80EtoIUs10Qv+w2v3+I9KVjStUeFxqWdYT6gynVZr0UL
 ciRd0oOtyWoZmkVC1CZsFm/jL2p9h/bPn2Fmbv60KEt6tb2xtK8vVVX5+cuU1Metg9vWcqirnpJ
 3Jm8QBDYswmnS1ckXrT5pCD331qliOha2qeXHDjNfLCxabMToZ5PHd7gbwdr1FJdsi5nChDevZd
 ed2p+JiWOK1fEDOzI4PyJZsUiHwfnj8B7NmtMxBLoRwETBAHArlpTjw3/vpHQA/m3jM7Srw8OQV
 9LshXNjuV6EJiQgrdFI68To1eW7/7DyiJzouz34LTF7VZrFV0BTVk50e03GvGbjIwNfGFFnc5lO
 vWrGP/K3zE5Lz52qND6Q0RoWh1z/ya1hS8TuKCzlu5hUKIhGDbt1eAutjP29gZ2V9U36nQ+Kncg
 hiGqa/ylQ+MYa/L3gyg==
X-Authority-Analysis: v=2.4 cv=afr0Dhot c=1 sm=1 tr=0 ts=6b001ce7 cx=c_pps
 a=0ygdBYYpfQySzMJeDTx3GQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=FjqZrYnWMEpu27vJjIEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: C64wlMT-Q5SzUv9lZrZUWUIYkNHWchck
X-Proofpoint-Spam-Reason: safe

On Fri, Nov 20, 2026 at 08:07:55AM +0000, Rafael Diniz wrote:
> With the codec as clock provider at 96 kHz from a 12 MHz crystal (USB
> mode), as on the AudioInjector stereo card for the Raspberry Pi, about
> one capture start in five then leaves the ADC delivering its DC offset
> and noise at their usual levels but no signal, until the interface is
> deactivated and activated again.  Both orders reproduce it on a running
> codec over I2C: the driver's start order (interface active, then ADC and
> line input powered up) went deaf in 1 of 8 trials, and powering the ADC
> and line input down and up under an active interface in 2 of 8.

Shame, but yeah this isn't uncommon for things with an equivalent
to this "ACTIVE" bit to get upset if stuff is changed whilst it
is on. And the power impact of this solution is probably better
than glitching active streams if a new one is opened.

> +#define WM8731_PWR_CONVERTERS (WM8731_PWR_LINEINPD | WM8731_PWR_ADCPD | WM8731_PWR_DACPD)
> +
> +static int wm8731_converters_event(struct snd_soc_dapm_widget *w,
> +				   struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +
> +	snd_soc_component_update_bits(component, WM8731_ACTIVE,
> +				      WM8731_ACTIVE_ACTIVE, 0);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		snd_soc_component_update_bits(component, WM8731_PWR,
> +					      WM8731_PWR_CONVERTERS, 0);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		snd_soc_component_update_bits(component, WM8731_PWR,
> +					      WM8731_PWR_CONVERTERS,
> +					      WM8731_PWR_CONVERTERS);
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int wm8731_interface_event(struct snd_soc_dapm_widget *w,
> +				  struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	unsigned int pwr = snd_soc_component_read(component, WM8731_PWR);
> +
> +	if (event == SND_SOC_DAPM_POST_PMU && !(pwr & WM8731_PWR_CONVERTERS))
> +		snd_soc_component_update_bits(component, WM8731_ACTIVE,
> +					      WM8731_ACTIVE_ACTIVE,
> +					      WM8731_ACTIVE_ACTIVE);
> +	return 0;
> +}
> +
>  static const struct snd_soc_dapm_widget wm8731_dapm_widgets[] = {
> -SND_SOC_DAPM_SUPPLY("ACTIVE",WM8731_ACTIVE, 0, 0, NULL, 0),
> +SND_SOC_DAPM_POST("Interface", wm8731_interface_event),

Would it be slightly neater to use an OUT_DRV widget instead?
The wm8731 doesn't have any of the widgets that run after it (nor
is it likely to acquire any) and it would allow for a slightly
more symmetrical handling of the ACTIVE bit rather than splitting
it across two widgets.

> +	/*
> +	 * One sample rate and word length serve both directions.  While the
> +	 * interface is active (the other direction running) its clocking is
> +	 * not rewritten: the same settings are kept, others are refused.
> +	 */
> +	if (snd_soc_component_read(component, WM8731_ACTIVE) & WM8731_ACTIVE_ACTIVE) {
> +		if (snd_soc_component_read(component, WM8731_SRATE) != srate ||
> +		    snd_soc_component_read(component, WM8731_IFACE) != iface) {
> +			dev_err(component->dev,
> +				"interface active at other settings: %d Hz, %d bits refused\n",
> +				params_rate(params), params_width(params));
> +			return -EBUSY;
> +		}
> +		return 0;
> +	}

Should symmetric_rate not cover the SRATE case? And would adding
setting symmetric_sample_bits fix the bit depth? Probably be
nicer to split this into two patches, one for the power issues,
one for this stuff. Better to have one patch per logic change.

Thanks,
Charles
