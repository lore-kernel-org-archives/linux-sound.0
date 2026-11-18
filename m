Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019576;
	b=V6K4OmLVGUcqUGIFLKGsHSA8RrZNlDrfOeOtGTAE2PCa66cxqgT3N3f7sO2rheeKke+G
	 Vj1Rj3KDLHE/oKuye+ZCrRiWKikyUwdloYcppC12DXEKnzUIVTHHu5kFaAciLptpaUeNJ
	 axHpZ+4FQxsWlr4SGnke8qh2cMmzKD9T04o3BMNNJt/lYW6GOeLDxHRjIf2VHY+Tt74MK
	 g0mZlZNNl/lRbgJaWtExxotK9UhL1ukM5YsEduhe1Bmdm/wHYGKuFNsZ6lX/EwXaEblmn
	 Kx0ilIZBSy8p5vyKu1jEMlXLeo9QE59u4KJmwI63+d87uQ0/LVWJu6L1Ycu24VHFKLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Reason;
	bh=qdetaVUKAzRV7T4F/oguVCvXt8lkwod+pc6aw0LH/48=;
	b=wFFVbrLFj0reIByiQ5hB3Dus7w3c3kPrM6D2kAhqWgctd11cbs1zFlNSna5wDxs0usKd
	 b3zE03beuCl7O9maw5MjEBfSz1HJByMcC+PfSOEuoi0rY76y6o9xDYHOkllfJYDMfGJlS
	 z0g9IZkBwUbS/NPS7Gu+ToKVyPenCQ/LHKGQORM99Kx53CFljH77t+sko5pGW05HrQkmp
	 /ZGZRTR5eT8+CxS02qsKYmBGazXOnj9nV61NBDKXXpGHNbiJ2Qr5argORMmeArz+gOA+A
	 O0UIKLC268SwD9hzwAlH17KzAiJJAn1g+vZI75A4Ge8JiNNzu7AubYnZvjN4IpTgvZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=jO83yg6y;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=BhvQUq9j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50060606A32C;
	Wed, 18 Nov 2026 16:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50060606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=jO83yg6y;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=BhvQUq9j
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGHBNW217490;
	Wed, 18 Nov 2026 10:32:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=qdetaVUKAzRV7T4F
	/oguVCvXt8lkwod+pc6aw0LH/48=; b=jO83yg6yQewD9DB7xkWyte7nRaygge6f
	Ag1v3MqDV6NYx+ZVbZenXDXCai7fPsNOOxNjaG/DZKZj2eR8QfBzeBch9kcy6qDj
	Gq3Bp7oEK6eJMWQJ3wKh7SYCPA5Mi7SpN7gPMEc9HdmCiwlX6CUY5536ebUBRfjY
	j3dL4SosdJ35oUe5pP/+iYV5piPu6iOvC0dM+U9LZxMKOGCx2xPAAqw47p8ExAKj
	BcE9QtN2MmfI/NPOTTVOIOMCoDwIpsP6HWkzPgpgg630FQWg50t33zL9RoPKFMIe
	YhtTSUoNF1kBYSnRaSCUobDXtcIiqFW14h8cFbqiCk76RyGclp35Ww==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023122.outbound.protection.outlook.com [40.93.201.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j0ytshdky-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 10:32:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jN8uLLDIw3XnS06+yf8pXpnVGevjsOCTVQmG5j7QfCZkzl2AO9RJiMC6ydVi7OsDau+/UfPWWPjen+vhGYFhe2lpyt56gDUZMp++ayxNIZ9huEpe4S29cdxlC+9ZD5cEp3wBdHuFXli3MCdYEkT2FfS858wrcjBEdgqmEuocWLzAmKRANfDIXlFv4I4MFxQc3XPqFTT+iYfGHrPcQvcCqZ2iPwX5lhXdWa4N8Tt/3ITVRuJJSTZYzImnaF9QCn4DruhJL+8MfQFveCiv1CA3aCnk8A7RwVJjco0t2jBfBUxiPmh7VLCmdBYwwGzjJWaB7FLjyWBn+pVszarg1voH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdetaVUKAzRV7T4F/oguVCvXt8lkwod+pc6aw0LH/48=;
 b=ZFTVAnReKCqi3USttZnY+XzLNT8K/fhToqreVprsFx60ybHc1tK6zmcgzr1eSvJAo/Xt8aDEJhdyghn2hw6zDKVkQ2vTUeLQEqiXw3pH6toMifLkwk0+S4O3bYs7KjhKIR2W94vBrjDM0wtAUqz6ihjoXOm6d0M6JCpSWyKYgqL1rc3z31TUHGBcGI7QBMWOQcXkAdBuzMu00QQWnQhxiaoPnj0LWArSl0obKdMzVo/OKmSo25Iwpi0cTJE4ySs1hdb93rqu2GnkAtRmHDuo83/4czByoqwBTX4M3vQPDayRsH3lcU/cw5nCEVT+eKLO9VYfKFKtscxMnfJnelWT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdetaVUKAzRV7T4F/oguVCvXt8lkwod+pc6aw0LH/48=;
 b=BhvQUq9jfdDzUipSpzC90nt1GjB4e7/VortRdEYqGzreuBCHziqDqQen4Zl1J5SNcZeVhYX0zJPd3zW65Kha2jO8IKOZt4mfG00neg0rw8FzcsGObAj7IXNBF3zfTUrMkGOqBrcrVU8vNipBVemdgSTjAOHjrvU+vj5bMsV9MpQ=
Received: from CYZPR19CA0013.namprd19.prod.outlook.com (2603:10b6:930:8e::23)
 by PH7PR19MB7145.namprd19.prod.outlook.com (2603:10b6:510:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:32:39 +0000
Received: from PH2PEPF00048916.namprd05.prod.outlook.com
 (2603:10b6:930:8e:cafe::5d) by CYZPR19CA0013.outlook.office365.com
 (2603:10b6:930:8e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 16:32:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH2PEPF00048916.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 18 Nov 2026 16:32:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3410E406545;
	Wed, 18 Nov 2026 16:32:36 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.156.155])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 549F482025A;
	Wed, 18 Nov 2026 16:32:34 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Date: Wed, 18 Nov 2026 10:31:23 -0600
Subject: [PATCH] ASoC: dt-bindings: cs35l45: Tidy up BPE changes
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-bpe-dt-cleanup-v1-1-a242f0cd0e8f@opensource.cirrus.com>
X-B4-Tracking: v=1; b=H4sIANrS/WoC/x3MQQqAIBBA0avErBtQg6iuEi1MxxoIE60IxLsnL
 d/i/wyJIlOCqckQ6eHEp6+QbQNm134jZFsNSqheSjngGgjtheYg7e+Aq6KuF86aUTioUYjk+P2
 H81LKB9WwMbZgAAAA
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795019554; l=12350;
 i=rriveram@opensource.cirrus.com; s=20261106; h=from:subject:message-id;
 bh=LxmQ6yz/441SM1TMu2ciKawvKnJPv2jLsRsXVBNCvpo=;
 b=QDblS+ga8NoII18FnDpo0fZx6gXDm03Yd/s5jp0nJtyhfrLYezdGthh3UlKuebYeUPk+6d/j6
 ZGHm4LMjzmGAxpK0xpOiPgWivyVFK828GYdQs7cdc70vIkZi1e+EZB+
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=k/iAEAtSPXvaWRDFupudzm6His7B7iJP1uiZ578a7Y8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048916:EE_|PH7PR19MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ddef98-a13f-4a47-62bd-08df45918ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|261021123027099003|261022075727099003|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261026121527099003|261102123227099003|261009220027099003|261009221227099003|261009223327099003|261009223027099003|18002099003|16102099003|261009221727099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JIpF//3z9NsREYUzUM1Gk/8YqSUwvK3quCbUgXRoD0xSMrivmQX3F3ssAoMQXRb9NgapX9+HldnJyN2xfWB3AzasZHjmiX4HFSxZ7fgkt445Wgnqv+Oa5Mbd7onZu6UW4erhpK8Q9d8z/awF4J1WYVEYClo/3NvVdcVeeglwLiWnmcBxdWSEqdDaWgXAsYP4aLmcdDCaK+AAP51ex93XXmG9u+IJEKyL4nWA63ZUHQiIRH/0UjIMkx/PFoZZ/YJx8bOEexSwsbb0FldpnxDBeJXweYwjFn471wLY8GekaAx06PV5II1FCmNh9bkocNKLElt+6ARGypR6I3V2FU5ZZ9d/Yqrycws7sRAWueSYdx1tlYrfXLiwnsj+9gpVX9M6ku4KV2ukvYURAupLO/jG0ILO5xykBo4OMKWfkoc+/0T/rTdH/wlvkWLpy1r7HeRTBbphL19khngsV2cWYMxYQFneCp2zAvYBku+sgParxhFwP3Yj2hneBpmK1Ngjv/IuBGo0dKJVBpbT2MmY4hq9oUUU9KLMvnmbBN9MCGpfJJ7qsC0Z7/OElGNgQl1f3OZ8z64tlyDhaVc+0yKsY7VSBc8qqO1maN7jvWtIkboKPS4abSmImXhDWXde+NyuP5C9VM7oui+Rf3aH9kXRhaqvnN0bKhpGi6RZqzZN08BNSHPJ5GPXU9/w75gNf+ViJQDSSal4kPJH0yYb/9JGIPtP1g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(261021123027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009220027099003)(261009221227099003)(261009223327099003)(261009223027099003)(18002099003)(16102099003)(261009221727099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vmoIttXoTPyqRTlsNLkhzfIRX7a9OS35qk3LKQsqIBvTLIzu0AVcTnMmW6RKPQCk5hfCITnchj2rJsrRZYSNMIzdlVniBzMxKgv9nLKG3KtByx2sWXa2YazaaE5FhpWNBy1GA+rKs8Ab5kZdFfypB1ElTYRLL86d4bd38OeFkbSEOs0Ihl8b0DeWtPOJcePfGCj6ShJgIWZu7ZqUX04tyqnMZZsv79WH+/ao/QY22JRSDEe+R8qUvcSSaJp0gUO25CJOqwTdLIrZzJUl1JDPWjdZlm9gkfd/3fjuX9EKpMhnLdvotyIfXJZENCu40bGNCZdMCQU7ensRjf4N5XB92qii4PBrNsYerU5mIQZ3TnerhaFaPv62lmcbXijWYKJa1F3tFcYZxAY/ozdNQXY7ynkFywG56YI/M4MbiXZytm5sU9HVpn+jfW6qYKssQGzW
X-Exchange-RoutingPolicyChecked:
	EsX3zyxiE6Anl8M+92WFt6RWmGwaCW04o7/8kSr+0KO96diyRdpqz6H61BMqovrdyc9ZcxOVhX7WjzaEd3N8SbtVTJgQ0D7gJJ8T4W0qhleMBceF1gFHO/H9zgsuDESeVMG2oWH6ANJJpbHNYEISLA5vSAYdILWISw5Id9GkGXnDio0woXlbS4xOD0hsXFghHEzMr/Dm29AM+XJwyvOUb7XinjvMKyTYaBWkMjQBZp7mrYKTGFISgQF6hpk7HesFsHd45ekqzLLM+4Dsw69zTEtAi0CihLtPUFD06gSoVQa6lKEQXAsrtWFMISfs8SLMep57Oc2y3LF2nxnfa8MS6A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:32:37.5287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ddef98-a13f-4a47-62bd-08df45918ecf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH2PEPF00048916.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7145
X-Proofpoint-GUID: GQ1JkbCUltsphxCagrvJ6HwZSYp-sxtz
X-Proofpoint-ORIG-GUID: GQ1JkbCUltsphxCagrvJ6HwZSYp-sxtz
X-Authority-Analysis: v=2.4 cv=V4ToQuni c=1 sm=1 tr=0 ts=6afdd32d cx=c_pps
 a=FNmKuShaFFLZE4HaRSHjWw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=62YcbaBXX_YyWOaDptQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX1/Lt0zHJgFyn
 elMAADsTBTFVTvcqNW52GFjHUVAdo0IBnvKt9L4U7kdFRYov1D+R3rSPTvF0uLnIU5n2nVWZcbo
 GYTloJUubNpYtOeh/k7S01qDd4+7Nic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX7raMQ5k8SzTy
 mkdY81n65cSGIMluAaQmhSUnQnb11pwdpsYCLSRpKCQvtUp2ZaJ1XgcKCkBuunp1nDyoV+UcGEk
 YqFVb/IaPBFA8khlCSFB3tHwYm+HReQGZIkFAmCxPKqAVZCN4n+3vEL+PyOMiWrR3vPSEad8QaE
 BSyb32lxT/eV1ezcRphZL5cVeLuc4iCJxRcABdFYC3oPOXBmpEgt06ov9OG85jOR0hcP1d55iHu
 +pefzKImFRKjUUHCU7D3CYWEGhltyeK6K3xiev1B8eAA8bIaNdygeRoSS24Zl+YD6T0aOvNO4f1
 mgA9bafNSdKYYzzes4V99Nma79G0xMA0eRhwIZkS7g3X0RyquSfpFk2+5S/Ot81tyehpBtxCVRb
 vSiWTlEgnvunsJmjYS6yQD2pw/mLzhWcjqor9DCgKJR7MnZYL2qS1mT+/volS9GFYTD6BrlL520
 NDmHh2Io8AoUWlFZ/sw==
X-Proofpoint-Spam-Reason: safe

Addresses two outstanding comments from the introduction of the BPE
properties:

- Moves allOf block to above additional/unevaluatedProps
- Drops unneeded '|' from property descriptions

Fixes: b6dda4b7698e ("ASoC: cs35l45: Adds support for brownout prevention engines")

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 244 ++++++++++-----------
 1 file changed, 122 insertions(+), 122 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 9373ce4bc3a8..b85fd1bfeac7 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -14,123 +14,6 @@ description: |
   CS35L45 is a Boosted Mono Class D Amplifier with DSP
   Speaker Protection and Adaptive Battery Management.
 
-allOf:
-  - $ref: dai-common.yaml#
-  - if:
-      required:
-        - cirrus,amplifier-bpe-enable
-    then:
-      required:
-        - cirrus,amplifier-bpe-response-mode
-        - cirrus,amplifier-bpe-thresholds-microvolt
-        - cirrus,amplifier-bpe-attack-rates
-        - cirrus,amplifier-bpe-hold-times-us
-        - cirrus,amplifier-bpe-release-rates
-    else:
-      properties:
-        cirrus,amplifier-bpe-response-mode: false
-        cirrus,amplifier-bpe-thresholds-microvolt: false
-        cirrus,amplifier-bpe-attenuation-levels-db: false
-        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
-        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
-        cirrus,amplifier-bpe-attack-rates: false
-        cirrus,amplifier-bpe-hold-times-us: false
-        cirrus,amplifier-bpe-release-rates: false
-  - if:
-      properties:
-        cirrus,amplifier-bpe-response-mode:
-          const: 0
-      required:
-        - cirrus,amplifier-bpe-response-mode
-    then:
-      required:
-        - cirrus,amplifier-bpe-attenuation-levels-db
-      properties:
-        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
-        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
-  - if:
-      properties:
-        cirrus,amplifier-bpe-response-mode:
-          const: 1
-      required:
-        - cirrus,amplifier-bpe-response-mode
-    then:
-      required:
-        - cirrus,amplifier-bpe-attenuation-levels-microvolt
-      properties:
-        cirrus,amplifier-bpe-attenuation-levels-db: false
-        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
-  - if:
-      properties:
-        cirrus,amplifier-bpe-response-mode:
-          const: 2
-      required:
-        - cirrus,amplifier-bpe-response-mode
-    then:
-      required:
-        - cirrus,amplifier-bpe-attenuation-levels-microwatt
-      properties:
-        cirrus,amplifier-bpe-attenuation-levels-db: false
-        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
-
-  - if:
-      required:
-        - cirrus,boost-bpe-enable
-    then:
-      required:
-        - cirrus,boost-bpe-output-operating-mode
-        - cirrus,boost-bpe-output-attack-rate
-        - cirrus,boost-bpe-output-release-rate
-        - cirrus,boost-bpe-battery-limits-microamp
-        - cirrus,boost-bpe-battery-thresholds-microvolt
-        - cirrus,boost-bpe-battery-attack-rates
-        - cirrus,boost-bpe-battery-hold-times-us
-        - cirrus,boost-bpe-battery-release-rates
-    else:
-      properties:
-        cirrus,boost-bpe-output-operating-mode: false
-        cirrus,boost-bpe-output-attack-rate: false
-        cirrus,boost-bpe-output-release-rate: false
-        cirrus,boost-bpe-battery-limits-microamp: false
-        cirrus,boost-bpe-battery-thresholds-microvolt: false
-        cirrus,boost-bpe-battery-attack-rates: false
-        cirrus,boost-bpe-battery-hold-times-us: false
-        cirrus,boost-bpe-battery-release-rates: false
-        cirrus,boost-bpe-inductor-release-mode: false
-        cirrus,boost-bpe-inductor-threshold-microamp: false
-        cirrus,boost-bpe-inductor-threshold-deltas-microamp: false
-        cirrus,boost-bpe-inductor-threshold-hysteresis-microamp: false
-        cirrus,boost-bpe-inductor-delay-hysteresis-us: false
-        cirrus,boost-bpe-inductor-delays-ms: false
-        cirrus,boost-bpe-inductor-attack-rates: false
-        cirrus,boost-bpe-inductor-release-rates: false
-  - if:
-      properties:
-        cirrus,boost-bpe-output-operating-mode:
-          const: 0
-      required:
-        - cirrus,boost-bpe-output-operating-mode
-    then:
-      required:
-        - cirrus,boost-bpe-inductor-release-mode
-        - cirrus,boost-bpe-inductor-threshold-microamp
-        - cirrus,boost-bpe-inductor-threshold-deltas-microamp
-        - cirrus,boost-bpe-inductor-threshold-hysteresis-microamp
-        - cirrus,boost-bpe-inductor-delay-hysteresis-us
-        - cirrus,boost-bpe-inductor-delays-ms
-        - cirrus,boost-bpe-inductor-attack-rates
-        - cirrus,boost-bpe-inductor-release-rates
-    else:
-      properties:
-        cirrus,boost-bpe-inductor-release-mode: false
-        cirrus,boost-bpe-inductor-threshold-microamp: false
-        cirrus,boost-bpe-inductor-threshold-deltas-microamp: false
-        cirrus,boost-bpe-inductor-threshold-hysteresis-microamp: false
-        cirrus,boost-bpe-inductor-delay-hysteresis-us: false
-        cirrus,boost-bpe-inductor-delays-ms: false
-        cirrus,boost-bpe-inductor-attack-rates: false
-        cirrus,boost-bpe-inductor-release-rates: false
-
 properties:
   compatible:
     enum:
@@ -434,7 +317,7 @@ properties:
       maximum: 15
 
   cirrus,amplifier-bpe-attenuation-levels-microvolt:
-    description: |
+    description:
       Amplifier BPE linear voltage audio output attenuation for levels L3,
       L2, L1, L0.
     minItems: 4
@@ -445,7 +328,7 @@ properties:
       multipleOf: 31250
 
   cirrus,amplifier-bpe-attenuation-levels-microwatt:
-    description: |
+    description:
       Amplifier BPE linear power audio output attenuation for levels L3,
       L2, L1, L0.
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -457,7 +340,7 @@ properties:
       multipleOf: 31250
 
   cirrus,amplifier-bpe-attack-rates:
-    description: |
+    description:
       Amplifier BPE attack rate register codes for levels L3, L2, L1, L0.
       Code 0 is instantaneous; codes 1 through 8 select progressively
       slower rates. The physical rate depends on the response mode.
@@ -471,7 +354,7 @@ properties:
       maximum: 8
 
   cirrus,amplifier-bpe-hold-times-us:
-    description: |
+    description:
       Amplifier BPE hold times for levels L3, L2, L1, L0. Infinite hold is
       unsupported.
     minItems: 4
@@ -481,7 +364,7 @@ properties:
              100000, 250000, 500000, 1000000, 2500000, 5000000, 10000000]
 
   cirrus,amplifier-bpe-release-rates:
-    description: |
+    description:
       Amplifier BPE release rate register codes for levels L3, L2, L1, L0.
       Code 0 is instantaneous; codes 1 through 14 select progressively
       slower rates. The physical rate depends on the response mode.
@@ -591,6 +474,123 @@ required:
   - reg
   - "#sound-dai-cells"
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      required:
+        - cirrus,amplifier-bpe-enable
+    then:
+      required:
+        - cirrus,amplifier-bpe-response-mode
+        - cirrus,amplifier-bpe-thresholds-microvolt
+        - cirrus,amplifier-bpe-attack-rates
+        - cirrus,amplifier-bpe-hold-times-us
+        - cirrus,amplifier-bpe-release-rates
+    else:
+      properties:
+        cirrus,amplifier-bpe-response-mode: false
+        cirrus,amplifier-bpe-thresholds-microvolt: false
+        cirrus,amplifier-bpe-attenuation-levels-db: false
+        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
+        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
+        cirrus,amplifier-bpe-attack-rates: false
+        cirrus,amplifier-bpe-hold-times-us: false
+        cirrus,amplifier-bpe-release-rates: false
+  - if:
+      properties:
+        cirrus,amplifier-bpe-response-mode:
+          const: 0
+      required:
+        - cirrus,amplifier-bpe-response-mode
+    then:
+      required:
+        - cirrus,amplifier-bpe-attenuation-levels-db
+      properties:
+        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
+        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
+  - if:
+      properties:
+        cirrus,amplifier-bpe-response-mode:
+          const: 1
+      required:
+        - cirrus,amplifier-bpe-response-mode
+    then:
+      required:
+        - cirrus,amplifier-bpe-attenuation-levels-microvolt
+      properties:
+        cirrus,amplifier-bpe-attenuation-levels-db: false
+        cirrus,amplifier-bpe-attenuation-levels-microwatt: false
+  - if:
+      properties:
+        cirrus,amplifier-bpe-response-mode:
+          const: 2
+      required:
+        - cirrus,amplifier-bpe-response-mode
+    then:
+      required:
+        - cirrus,amplifier-bpe-attenuation-levels-microwatt
+      properties:
+        cirrus,amplifier-bpe-attenuation-levels-db: false
+        cirrus,amplifier-bpe-attenuation-levels-microvolt: false
+
+  - if:
+      required:
+        - cirrus,boost-bpe-enable
+    then:
+      required:
+        - cirrus,boost-bpe-output-operating-mode
+        - cirrus,boost-bpe-output-attack-rate
+        - cirrus,boost-bpe-output-release-rate
+        - cirrus,boost-bpe-battery-limits-microamp
+        - cirrus,boost-bpe-battery-thresholds-microvolt
+        - cirrus,boost-bpe-battery-attack-rates
+        - cirrus,boost-bpe-battery-hold-times-us
+        - cirrus,boost-bpe-battery-release-rates
+    else:
+      properties:
+        cirrus,boost-bpe-output-operating-mode: false
+        cirrus,boost-bpe-output-attack-rate: false
+        cirrus,boost-bpe-output-release-rate: false
+        cirrus,boost-bpe-battery-limits-microamp: false
+        cirrus,boost-bpe-battery-thresholds-microvolt: false
+        cirrus,boost-bpe-battery-attack-rates: false
+        cirrus,boost-bpe-battery-hold-times-us: false
+        cirrus,boost-bpe-battery-release-rates: false
+        cirrus,boost-bpe-inductor-release-mode: false
+        cirrus,boost-bpe-inductor-threshold-microamp: false
+        cirrus,boost-bpe-inductor-threshold-deltas-microamp: false
+        cirrus,boost-bpe-inductor-threshold-hysteresis-microamp: false
+        cirrus,boost-bpe-inductor-delay-hysteresis-us: false
+        cirrus,boost-bpe-inductor-delays-ms: false
+        cirrus,boost-bpe-inductor-attack-rates: false
+        cirrus,boost-bpe-inductor-release-rates: false
+  - if:
+      properties:
+        cirrus,boost-bpe-output-operating-mode:
+          const: 0
+      required:
+        - cirrus,boost-bpe-output-operating-mode
+    then:
+      required:
+        - cirrus,boost-bpe-inductor-release-mode
+        - cirrus,boost-bpe-inductor-threshold-microamp
+        - cirrus,boost-bpe-inductor-threshold-deltas-microamp
+        - cirrus,boost-bpe-inductor-threshold-hysteresis-microamp
+        - cirrus,boost-bpe-inductor-delay-hysteresis-us
+        - cirrus,boost-bpe-inductor-delays-ms
+        - cirrus,boost-bpe-inductor-attack-rates
+        - cirrus,boost-bpe-inductor-release-rates
+    else:
+      properties:
+        cirrus,boost-bpe-inductor-release-mode: false
+        cirrus,boost-bpe-inductor-threshold-microamp: false
+        cirrus,boost-bpe-inductor-threshold-deltas-microamp: false
+        cirrus,boost-bpe-inductor-threshold-hysteresis-microamp: false
+        cirrus,boost-bpe-inductor-delay-hysteresis-us: false
+        cirrus,boost-bpe-inductor-delays-ms: false
+        cirrus,boost-bpe-inductor-attack-rates: false
+        cirrus,boost-bpe-inductor-release-rates: false
+
 unevaluatedProperties: false
 
 examples:

---
base-commit: e2aee84df35aeadadfbcdb750a3921a0cab03e46
change-id: 20261118-bpe-dt-cleanup-b2e360fdc90f

Best regards,
-- 
Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>

