Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708274;
	b=25bJBPaGpUhOQC76zd/O37FHmKTgrTH4d2lGeP0GoJv6ttcWdZCNP8wG4hY6Mf1ywUT5
	 EAwPWF/EotBsHywIJdf5f5dCwIIauPVl9Lw4ufJd3f9Y2hYG+alM+0Nfv0BbyySbx2pB8
	 IdIvhhvfP3makyEaFLxocGF19cEGG9jw8upW4e/rhQyGjRJso/85xmlQTmWc009U8tUTZ
	 GOgNq5SJrMZx/MTrXbfTkTv13WZj7DYxEnNrw4Ga8nk1cKSohYGZavgiel6NLzHcSgElP
	 CWroLysfOiDNVfdVxM8AXCBJXii/PuvjIPSGpvk4GHF5oTM4D/xiH4UPC4mMDC9YKpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708274;
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
	bh=8TGRoyUXzyK6/XUs2lz1G0wAIBmQjUkW5g8bsxMSmvQ=;
	b=mrsVNi/+K9dfcxpDs7L38S7L5Dv5hYc0OpzgcKzj9VRZonhmvffStFRgPyGWzBmp+LWE
	 RPjj4OytUA75B8DkLhKXIlWszXCKFYK80q8ud7TxbsEQ/3qAtHfOcbeUl+mJ1jXJ1feYw
	 eLa8vIPG7FT5o+hM0rxobLdmqxHaCtTrw10cmORboqVHREmjsulJteMA0ngpcgSHgx5U/
	 1QIpNVVwU4fAGaLzJWaB2a/rU/9pY7opQB/fS3M/WdwQOFSdJq52NjZGOebHzj0vWvhyV
	 datwRGtlLGkTStCG29djHYxB7+kB2Odn5YfQrZl28co17oRgsfeFaqkJg3u2m3f6JDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=P+dEoPw8;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="XXPXZB/N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C08606A31C;
	Thu, 26 Nov 2026 15:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C08606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=P+dEoPw8;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=XXPXZB/N
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFUZgM2927932;
	Thu, 26 Nov 2026 09:50:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8TGRoyUXzyK6/XUs2lz1G0wAIBmQjUkW5g8bsxMSmvQ=; b=
	P+dEoPw8ZF6l0HbDxaAzoCxxGVK3TjNyGBaDCkty1EBZ3cVNu9qAy/8zgWbXsBWc
	e0q3XJZc8mCrLHNwIBzbAeXRMXhGiAcfsDe82ghKOivWzUq+tW9a8spb/O3rD143
	/2KPIogGhJqorPPbtY56QiInc5BIUOH0Zj4e9gd0WIa2tfAb69+W/rMuiQq/Ivcz
	NhNCKOhK5sqlxTG9icuMIojHbXvxd+tbQvPPbL1tBtOyGaM+fKhLZb9v8wNlZK8j
	oJeqa5Vb8LZydbliyrvz/f2eIABsqp8NN+6KOIvCTIERldj6mPObxvX+em7kJSKi
	wqh0cFcEPSbsAJFlP6D4qA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020108.outbound.protection.outlook.com [52.101.56.108])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j519jcfmu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 09:50:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcqYOiVaWkuGsiWVeAH29aVbcilbiLhnRuRMHdm4oXV1yquH6VyG29QufGrdGdD3N3RqqSEsW4HD9uUblsuLwxVbVOy9wojUP7Ujv7V1h8OgNGDN5LdVtEuGoJ90a/khU/B7W7vpJVckJJgZCusysKGlefwSs3CgX23cArGtWPR1WPDBqwf86T10Jrx5P3j3tKLWS8UZkYI5edpvVlUZ2MOvJFtWo3DlEiRAMg7NykJYM6y6sVuuI0dcM5g8kKeDCBlyMmwXvyx2IpDpPByzvoPOTPoYEd0wB/Z5/DdTMVi4jX4bdrpbWhzHvws5YHwxj45X/LIx1MItKW8ZOb8D6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TGRoyUXzyK6/XUs2lz1G0wAIBmQjUkW5g8bsxMSmvQ=;
 b=Br+yb/iD55LwimjmgL6PJFjLjDIJ4cZKUUa2eBoLfKKqehdxwwl2TgE139X28ZaISIDhI1IswocunBdWqm/JV1SMoC898FFj6JKzAxDyphUjzuFyx6Ew0PWhyPKxnPmfNwCr5zoPdYkAxMBK5j2VLe0IC+LeBX12mygrjm1GXMjjz7jOudKmW5xfN8pR66TrNNgkLB04tv2KmEbGv2ltr5NcII3deLmDBqmHysUuWAltqH/Q6456e6pT0sVcQQ26VcacFeSVO5gLCMNHusPsy7ShGufaFA+4x6yngry+mMgqOznXLeIHbu6mQn2dHCqFDD9E4pGwwOHtdil/jGs8LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TGRoyUXzyK6/XUs2lz1G0wAIBmQjUkW5g8bsxMSmvQ=;
 b=XXPXZB/NcXPvNSuHSYUaGZdudwcH6Z9rrb2A8paP+PCUAiMC8Mhj23jAo97aawHopxMgNAM89cSWqtcPbcbY8xHIyuUeaBuPeyj8pYYO8GjhdtUQ0hir80+Ccxiv6l6TUTfNk3/DD+evpNMlwz+7zY3PnHztz/HE1Atnwj7RIGo=
Received: from PH8PR02CA0003.namprd02.prod.outlook.com (2603:10b6:510:2d0::29)
 by LV3PR19MB8348.namprd19.prod.outlook.com (2603:10b6:408:216::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 15:44:13 +0000
Received: from CY7PEPF000000EC.namprd04.prod.outlook.com
 (2603:10b6:510:2d0:cafe::1) by PH8PR02CA0003.outlook.office365.com
 (2603:10b6:510:2d0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 15:44:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY7PEPF000000EC.mail.protection.outlook.com (10.167.247.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5
 via Frontend Transport; Thu, 26 Nov 2026 15:44:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3BCD5406555;
	Thu, 26 Nov 2026 15:44:10 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 26836822542;
	Thu, 26 Nov 2026 15:44:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: cs35l56: Make SoundWire DP3 mixer registers volatile
Date: Thu, 26 Nov 2026 15:44:08 +0000
Message-ID: <20261126154409.1665214-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126154409.1665214-1-rf@opensource.cirrus.com>
References: <20261126154409.1665214-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EC:EE_|LV3PR19MB8348:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2c57478-d69f-4887-35eb-08df4bd41df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|36860700016|82310400026|10067099003|11063799006|56012099006|261022075727099003|261102123227099003|261021121427099003|261009223027099003|261026121527099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	EFGqsJeQ91Cb0lBPhjxdCH2ZDibMTa4qecFk9selpt5XpcaAeIX2oRRF+N5uOF6QGePr0q6rqRk8NOw+c/VlDB9N7svZVkRXu1kF92bdfvwZmcrCSdGvFCrzt2eqkyJZCddo+M/KCh4l3J2qSiEgeCJ6RjcFf6j4IFcdYxcuu3JzI0QmFqUyJDli5NdD7+DTuci8VJWyNEukvuCvOIXQT2t/lfzBlE60VMpSfo++758rERvll1hZisiUqwZLF2ftpMIQb2rPlKBqTr5DBx+o/RrM3KINidTDtPRNNrsSuzPzqryp+lBz65FS3oAMk6YzsqB6atf8DGqYauE+Rfx0BxzZdrXPjiTFIJSMpqzxnq/ZbW77aSzkoXyObcS5SpVTr9r7pMcj4LiTTfE2hWYCBBD1H/JvJH4VodaOgQ3yM9p1OUzaiGMRRNzLdI4LtSoTOSqZ1D7LmaLdba/3+u/GYUz2fmE0jjl9AmfFVfPUkf08asOk3AljXesmB0CPS1AaUKAA6EFicJ8tOYXzKq8WLIUpc52oHiBdVnKeVA8JI5PRMioSxgDJ83enxLWEX1/vGiimKFvaMZkqoHJzr5PekCC4bb8wsei6+5ibmCwIK98Fsw2BQMxlz9iemDpPwmOXlk8t5Cfbv6e1SlJ5dVsOJjteSvowzKR6eTOB4jUEeptQCFHA4aM+8BqSb8kocAp0Fe9FaUBhjQPZXOki6jlVxw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(261026121527099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v62bjjzxOpTIwXQeU+SziV0gQGwEl37vyLMQd3mHjx1lRLsVM4QDX/rHI0QojxVJxa03+Qc5PBAkyCHVsz6lH82ZJ+/q8/Eb7FsJ00JzyXa42CalPAGcKHR/y/KIPoAWlDxJimjBxt/LXLAqwD919kAPUKS+Cd1Q+Tdfn8A5JXshUzu7QPzzv+dQAEQaaKe6UiBrTxGMKvsUhmabfsbg5a32OV7oGHvadcsYh9hrAUkOmkfkOhHxHYCQYgSvWD0bt0mvJV9z+0+3wbxY127DvuY6BSkreDVHwxPEerYemMvjSOckEmlSR3DptYb+rZP0b8WE09aEEWP4ofiDUWLKqAIZYlCpuz6qLPJw7kGo80HBKvbh0/P6dBKzYz/p/y84gBCyClp6I4JjEdq/dILSmQn3TulvpGuQuy3/YjANFO+REY/a7BTg2Hk7bgAYGmMU
X-Exchange-RoutingPolicyChecked:
	gTcPOsycoEAtudNKl2UBUnec9D0GklHXgik6KWBcj0DpDMiouj1BuVtvX7baxiWStV/Zm7heqUoGRoyz1crRKlYTa7RnILCRJ/OC4PIXM6PEMeeWL57LjvEYF3BagD17WU+RIBwNro3VanJYK3w6bOMkqdyzyYoAWuOu1aBHjofRh2+hUhDpGOAqhxYPbfyUDovypF80FXBQLL3g7j1fbySMHQqAZ4H8CX98QFCAQ6cAX3vG8wxVgh0t19YM/SuCKbXgUVNiZwM2z7GBgJFapqgg2Z7VOYPVgl3DZF2pgAI/tCAEsS6fRKSIK0R8bzc9T1S7+XiLReWMOlOkGLf+lA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:44:11.4836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c57478-d69f-4887-35eb-08df4bd41df7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY7PEPF000000EC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8348
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX3eJiN2vZ4uMx
 Qo7d9SeNkwkjANpIwaGx8Y/ulpG9DsbaP28Gi8mrrME3e7Ho+MrbUahXUj8ruXaPo4/VGlvAew0
 J9/6Pf4qKux3K64wFeoNZVsi8WhZKVa3uu6Z8U/TkQAwj0SNd6dXmhBX1CXNiM5kpiWhKwnU9Hc
 bc09dAAMPEB9fIp46AS7kYdvwc6A85kojeGeQ4hxVnhES8GbDIwRPE1icHZ/tb9bH5objui9WXg
 oFDTWLhxli+pMOquKF2HYlkY89yA+P0xOzoBMZGv1uGp+sKqpr9NMGIUHbwh2SKuqVwuSrDvm/Z
 LoOGClduBhgX0GGvGD6FOkzusGRp6il54EcglDir4OZOLGKMWFCFxz1iErRO/pIve0noXDTGYhL
 snTMGMzgzroEiMDrAkuFD7GxRMj/rbWmE9DvSLFc/PrBakw62tsqlK6mTZqrq/3aoJ11bITH0nx
 DUV3bGa/pvBYtJMUKrg==
X-Proofpoint-GUID: iuY7P98iJtaUKlZHxlrFuAssWk7R7VIa
X-Proofpoint-ORIG-GUID: iuY7P98iJtaUKlZHxlrFuAssWk7R7VIa
X-Authority-Analysis: v=2.4 cv=Xf0cX455 c=1 sm=1 tr=0 ts=6b085563 cx=c_pps
 a=BYyRvCY9Lsi29fIAjJxbIg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=anpGAo3EtMXFN_M6ulMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MSBTYWx0ZWRfX0ayBTaizJxgs
 zEoWMogghGCBlHi8uSxjKIsOBG4T2O0KDbSRbE4zbWKd0BA7VDt1CUhIxIjS02Y3bL3AWTd9uGC
 MYzWudwoIuyoDlZM5WxMtclSkF6rovQ=
X-Proofpoint-Spam-Reason: safe

Mark the CS35L56_SWIRE_DP3_CH*_INPUT registers as volatile so that
reading them won't populate the regmap cache with a value that overwrites
the register value during a regcache_sync().

These registers are owned by the firmware so the driver must not write
to them. Previous commit f52668f474f1 ("ASoC: cs35l56: Remove SDW1 TX
source controls and widgets") removed the DAPM widgets so that the driver
does not read or write these registers. But it left the possibility that
reading the regmap through debugfs would populate the cache value and so
unintentionally overwrite them on the next regcache_sync(). Marking them
volatile prevents this.

Fixes: f52668f474f1 ("ASoC: cs35l56: Remove SDW1 TX source controls and widgets")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 34aebf81f4a4..329351de32b1 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -232,6 +232,10 @@ static bool cs35l56_common_volatile_reg(unsigned int reg)
 	case CS35L56_DACPCM2_INPUT:		   /* owned by firmware */
 	case CS35L56_DSP1RX1_INPUT:		   /* owned by firmware */
 	case CS35L56_DSP1RX2_INPUT:		   /* owned by firmware */
+	case CS35L56_SWIRE_DP3_CH1_INPUT:	   /* owned by firmware */
+	case CS35L56_SWIRE_DP3_CH2_INPUT:	   /* owned by firmware */
+	case CS35L56_SWIRE_DP3_CH3_INPUT:	   /* owned by firmware */
+	case CS35L56_SWIRE_DP3_CH4_INPUT:	   /* owned by firmware */
 	case CS35L56_IRQ1_STATUS:
 	case CS35L56_IRQ1_EINT_1 ... CS35L56_IRQ1_EINT_8:
 	case CS35L56_IRQ1_EINT_18:
-- 
2.47.3

