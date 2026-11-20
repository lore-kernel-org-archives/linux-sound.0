Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172703;
	b=D8JuZeXTXJAlMDcptSVRZmTNoD8xK18X9EkKnfdPudf9kIlhT3sg0g6ZiXf8+35ByPaN
	 BbPnt/Z6kifDFhPzEe5DGAfvkopTxpnSdAezO2+4QfH109JSkvQOYLNX6tZIzyL4kXKok
	 QtU+GiSWWN+mIjG9y/DX2YtgfBAoTybqYCF5+mlATHqP47kflIT3s9mWs43SxJg6n/Kx+
	 itTuJUtfhmsNsmzk8KM0Kupm6XM03GMFKIK12kekyXymWguNxO6E6dYbMxg5+TxJsEmeO
	 nX9zfcllBg72k+i1ljd6NaNev7IGQloAKleVkCQw1AUElrYojfHpjNu6yAsN00m/Kag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172703;
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
	bh=WRRmbsbXLBi/SZUnYd+AafmhDFcRohqww8E4TKNYhyg=;
	b=kbSUgJ7EXLZuhEZrzuLhOS/QINdh8RDSdE3LTAW5fRLyDqJitF/tAzebf2Ry2jonirUq
	 JJ288+fC5h/mXB8p2TUYWu++ZMS/n8LEr0Q0nD6kyNsvAoUIYkJ8uq3752lQodt7KGqK/
	 zLi7SPTDNu+93P8lZWYmGbPvKS9OC5Gj/ulSH/9KIhTBme4G4CUc3+MYAgb+t6VAOQdS9
	 6wYoah+qynuPZmjbEIJxFHmU2+HehuHJYioqaArZ+JCMADuJrYmt8UnclfFNOAlGqWkXy
	 lwocR6dkngCyyU0NxsWOZB19T6VzCfJWJRgjGdlwJzRLQsZaErHZWlbYgAL2C8qslkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Qtq3xt+8;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=zrGTD+hx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C060A2614;
	Fri, 20 Nov 2026 11:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1C060A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Qtq3xt+8;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=zrGTD+hx
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7TLEb065740;
	Fri, 20 Nov 2026 05:04:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WRRmbsbXLBi/SZUnYd+AafmhDFcRohqww8E4TKNYhyg=; b=
	Qtq3xt+8kDD4ZtO8200TFuYzwOHSJmvR9zsi7ulxc9PFItWo9yHhea1RPTa1aLa6
	ZO4gQNCGIQ3msnRUC5oTrhrevvdRqmv0aDQT3d3oLA6BEP8qESe9E5x49r/WHxRB
	auFHZWAps0DG9gmgzaU5mh3KEQCRxw1/hPgTm5kyk36zQVAvfQJvJy79PJVMRAfK
	VKX5tcDFpBXsyIwxONY7/4oVuNhtyuz9Y+gUpbqvqfyt7+R91Z4XKoNsfLyv6Kto
	KjoKCn11hqsh9JaQ1UfofezWMk3iM25gJYwqwAnfsLtfp+7HXrLzB3rWMW/7OYdI
	Eae+UsbIOqCNmzHwWlU24A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021074.outbound.protection.outlook.com [52.101.52.74])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mhtqt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 05:04:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4VzYvsPIu+6OgWY2ySmMjJdAViLcWYVCGS5ilt8zt9QP3S0tgeyCbcb4Zy8+vuhQURZFEAAlila3ioitrtt6A/lHdGDfjQYbfTIKskHEgax8jGSUsaCkOep/tWiocwMvfalwCcPkRm6eU2dw42J0a2KT4OCSHpj6sAcBkZJFTBNqxqYnjRRu31dHpNihr+JfQxdDVZ1G3Db07D8Pg33nac5vlsJMbH+XKE0oKZw1tP9FhwrubLEq1Hz20nbdYWgZMi+IX0RpAVcw2X/S7HZf17/KPlXv0VcEk1hPnWhbZdkt6g0gi+adMXx5dV94obgl47XCLbJnY7duKPFhfae6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRRmbsbXLBi/SZUnYd+AafmhDFcRohqww8E4TKNYhyg=;
 b=FZRp8VVkcUIvTJEG6H4ltQ/v3CmLFSgJrVVLIq8kIRWLs3FCMFSb1oXCqxImmxjo8c9NF7q+X7w4HfEoeQATzD7wkfooUv4GFbt6lcyqSY4r/RdtNnLxwQzoblEr8ZA/qTLdda/yinxMQsq7MbHa0cdTPI09Hty90N+Rej7caDHI2MwZSRI1ucuqRVOQLqebCkR6qsLHHRht++iqi8xyfonPCTwdviblqZ6hQ+zu1beGyhXj6lUuMa2whGk3VWIzisXvN188sF5T2QBGVl1ei+y2+BfCIDpxtHAqns1FAl9SOoBf/DlWHM37qJU0kUfAv5u5hyCncMbMiaaIGXDFdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRRmbsbXLBi/SZUnYd+AafmhDFcRohqww8E4TKNYhyg=;
 b=zrGTD+hxTeN0c4NcDPCiafbsRSXL4Xr8Eym4SDGIC7LnIyNS/2MhR6Jnjb0aBx5fHXve2EfJKiY9XMRUofr6hRBO3oanmg5aO0n0mqIDFLsluTWsdTlyFqiNDW7RggdlsCtl1nxso7qATLvzvYAQowrdEux/jmuDKIs0CZGFr04=
Received: from PH3PEPF000040A9.namprd05.prod.outlook.com (2603:10b6:518:1::4b)
 by SJ2PR19MB8273.namprd19.prod.outlook.com (2603:10b6:a03:558::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:04:45 +0000
Received: from PH3PEPF00059616.namprd05.prod.outlook.com
 (2a01:111:f403:c95d::1) by PH3PEPF000040A9.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3 via Frontend Transport; Fri, 20
 Nov 2026 11:04:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 PH3PEPF00059616.mail.protection.outlook.com (10.167.243.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 11:04:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4985F406545;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 20547822542;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/4] ASoC: cs35l56: Remove SDW1 TX source controls and widgets
Date: Fri, 20 Nov 2026 11:04:38 +0000
Message-ID: <20261120110441.2163567-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120110441.2163567-1-rf@opensource.cirrus.com>
References: <20261120110441.2163567-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF00059616:EE_|SJ2PR19MB8273:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cd434b36-fb0d-451c-5ce1-08df46f61505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|82310400026|11063799006|10067099003|5023799004|261021123027099003|56012099006|261022105027099003|261026140227099003|261022075727099003|261021121427099003|261026121527099003|261028144727099003|261102123227099003|261102130727099003|261009223027099003|16102099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	UYhkLA6OvzIYlSWAF8so0Gaw/A0vS8sdZD9GrtzR6WXrBlqua9wDAM0wHhxJqP8UFILueimpm6OcNlUUp4utxFYwSw9lRcBqtkwS4+Z55FHiMzvO3qaKDEzCXLlqZA6rNTxV7Yx7NbHkkk2DcIUDGtizF9l0Mbs7sbQicS4Uczl7mWq1QSDdF4USJjYTEqZDVYJB8XCI+faSp2UHeqoJ5238fObkYwU6hrg897XTKv++n/bg2G85EFoZAs7OEJu+nGEzEG9zmrFAkbQpPhGlNqTjgsRlidzuBHXkKVFiwOZI0+joIjzbdd6wJy3IXhwrc3Uaxx2umhnl74LVl16QBMY0KpWWQfZ70G+7uZTUHJrRNy0bugWa8msWEe/zXKjibKBA0KTYZgqIeicD3iO9PSX5liK9xi/bm11fB71QwmJU4HR0p40hM5mP0nmsmzO4pES/zG3moSO3jB4zw7J1T0J1iD7rWrLiOqVBSyXMPpiB9H86cP2zXKghIaO9ku6IrNSPYb9qNYqpXJMvJrHCl+mpTkvfjGo+7DK46N4aXEG+eydPEbewrgLi2u5DzsidkU7tHwtWFAph5O0UATp/VQZ4P1d0/pbh4ZRDlX6iBs5+OGCP3bobf0k2bAXb0eVBh6iyRdKuNJKCYHOlQLGsa19SpYLkngjrNNn9t1aygw6h8tnaFmK7gdYo7uKCBUgAz0iENcQj0ACCyo/PjrxTGg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(82310400026)(11063799006)(10067099003)(5023799004)(261021123027099003)(56012099006)(261022105027099003)(261026140227099003)(261022075727099003)(261021121427099003)(261026121527099003)(261028144727099003)(261102123227099003)(261102130727099003)(261009223027099003)(16102099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A50X+jL6tZ0ePRetQsxdOZmSby6Z/W43P/aaiYCik3ldnyBtw0AzQn1wldRqJ3Xod1KpdPxrSSbAC5CWRlwLqbCEN39JPTvKXgIFRJBFPs+SOdnqPMaMS3FKBx70qHQQpjNKzTbAYf/cGiYPoHe9ZdajSDpBXLuScLS02q/TGbj1Gu8zls8JWBnwZilsyetEYr8gSjlOyKckgU/guKmDVDKv6/qjgI4pVeAMpSrFGOGEH1pPvm81PnM4icceBM5xFw7k1e8bPA6JlQVJiM81RroOlM9Rohi4moP0KaGZ+Csrz4BwPrICpofzSirTF4LjeslqtYQK6o9BBmPtAGgEWiCGenFAzxMd0mpQFzRcROn6soBuGGLXGMX4SYoHid8aZxcgKN2iERJQB9uhpHcD/D1ie3qpkxSTqysfOd2QnqH+oB55YduKQ9137vl/pE25
X-Exchange-RoutingPolicyChecked:
	PdO+upn2NWanTwkZCNuFdjnOabFsdKWc/UwrJAcwnmGtGBb1qL9n5AAHDR+drLDljA7ooRoVA/nhw7Dv0jOLX8iB9Ogm+X6l342jJ37Yw1+UbS1fUCwbOV2fx09CS1ITd70dLoVxUpgeDVRGAZr/ie9jfOdjb1IHC/jE+QItXSXGD+RxwwQT2EvEs+VqOmofTrj6Teytg4xVfRY9LFopjIYo6B8FaIgzZajYBuhNELGQGCCQssCUJpmlCOkGcoRJZ2F1DiqCP2Jd/3XrlcFvhVN/EbuVXsIAepykcCsGU7IrIoFcIpAhGRvJeI2vKSZww+wQkuL4VTokfdIkx7kynA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:04:43.5321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd434b36-fb0d-451c-5ce1-08df46f61505
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-PH3PEPF00059616.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8273
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX7L/0hi5AcuWJ
 K9cHGoVVtfbdLgBChB13r3MChifRSMmBTXyyZSRyiPPwOyYVhbfVGjF5qK93JWzO9QnV+j3M1Ji
 US2qFEnFFbzkTIEfXpavfu+h3iUHdpugXJLmzQTRg04+ui0Bu5zC7uaNQ/BrbM8jtBcLd499djs
 FVR2ohJpZfRycAetHYwIy1pJTWwZ671InOipdbCmQ38P8OkwUPZqV7ijvCmN430z7EHnSXbwBOo
 ow9TAXgjKP1V8ty5yUfqCtRQUkk/BiJzSmuSy1uey0levLkbtN6sMDyM5zhMge9I30GslTv/PeW
 z9Q4NE5j1lMAPuMmmkFww4rP+Ix5WKSy17Vu+yCXsMhh0HBuxGkl+yNFF/2Ol31OivSvKjEWKYe
 FQLTWWltX/K4p1uND3sgiaazQESrq7zsYWMQRsyHYt0Ny90V6jZ8Fr3mFrX23iwWI7e1HJ3poZG
 8X11xPYbQNzwVfWXIQg==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b002952 cx=c_pps
 a=b/aSlx19e507fu+kRueGxg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=xy_9i6YtUklqkaMNc2IA:9
X-Proofpoint-ORIG-GUID: M_-J3C3drLxhAjYvLVIf5iGSGAv_S0U-
X-Proofpoint-GUID: M_-J3C3drLxhAjYvLVIf5iGSGAv_S0U-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX5Dfi+51s6WRp
 jkkX2e47vMBO+UklM292WKsyFxGk+eOAJh87zGx5LnJcDGF3tPAl9UpCfjxo/E5MuiySsEBFEp/
 0FSxny1zM5l5itbWZ59rzSIKgiYAXOY=
X-Proofpoint-Spam-Reason: safe

Remove the ALSA controls and mux widgets for the SDW1 capture DAI.
Connect this DAI to a dummy siggen source like the OT25 DAI. This is to
allow DP3 to be used for its intended purpose as the SDCA companion amp
output.

The implementation of this DAI was incorrect. It provided a capture DAI
for the SoundWire DP3 port. But DP4 (OT25 DAI) is the port for feedback
to the host.

The DP3 port is used for SDCA companion amp (OT127) and the mixer source
registers are owned by the firmware. The driver should not be writing to
them.

Nothing has ever used these ALSA controls so they can safely be removed.
The incorrect use of DP3 as the feedback to the host has already been
fixed in these commits:

commit 86c8360c97f6 ("ASoC: cs35l56: Add DAI for SDCA OT25 stream")
commit 4b7f393a01f8 ("ASoC: sdw_utils: Switch CS35L56/57/62/63 to use
OT25 DAI")

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 16 ----------
 sound/soc/codecs/cs35l56.c        | 51 ++-----------------------------
 2 files changed, 2 insertions(+), 65 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 4d76f1777927..073f7bdd3b0d 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -49,14 +49,6 @@ int cs35l56_set_asp_defaults(struct cs35l56_base *cs35l56_base)
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_asp_defaults, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_sequence cs35l56_patch[] = {
-	/*
-	 * Firmware can change these to non-defaults to satisfy SDCA.
-	 * Ensure that they are at known defaults.
-	 */
-	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
-	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
-	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
-	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
 	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
 };
 
@@ -105,10 +97,6 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_default cs35l56_reg_defaults[] = {
-	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
-	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
-	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
-	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
 	{ CS35L56_IRQ1_MASK_1,			0x83ffffff },
 	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
 	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
@@ -121,10 +109,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 };
 
 static const struct reg_default cs35l63_reg_defaults[] = {
-	{ CS35L56_SWIRE_DP3_CH1_INPUT,		0x00000018 },
-	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
-	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
-	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
 	{ CS35L56_IRQ1_MASK_1,			0x8003ffff },
 	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
 	{ CS35L56_IRQ1_MASK_4,			0xe0ffffff },
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 30835dc56006..acb202559dff 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -267,42 +267,6 @@ static const struct snd_kcontrol_new asp1_tx4_mux =
 	SOC_DAPM_ENUM_EXT("ASP1TX4 SRC", cs35l56_asp1tx4_enum,
 			  cs35l56_asp_tx_get, cs35l56_asp_tx_put);
 
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx1_enum,
-				CS35L56_SWIRE_DP3_CH1_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx1_mux =
-	SOC_DAPM_ENUM("SDW1TX1 SRC", cs35l56_sdw1tx1_enum);
-
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx2_enum,
-				CS35L56_SWIRE_DP3_CH2_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx2_mux =
-	SOC_DAPM_ENUM("SDW1TX2 SRC", cs35l56_sdw1tx2_enum);
-
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx3_enum,
-				CS35L56_SWIRE_DP3_CH3_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx3_mux =
-	SOC_DAPM_ENUM("SDW1TX3 SRC", cs35l56_sdw1tx3_enum);
-
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx4_enum,
-				CS35L56_SWIRE_DP3_CH4_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx4_mux =
-	SOC_DAPM_ENUM("SDW1TX4 SRC", cs35l56_sdw1tx4_enum);
-
 static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol, int event)
 {
@@ -407,11 +371,6 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("ASP1 TX3 Source", SND_SOC_NOPM, 0, 0, &asp1_tx3_mux),
 	SND_SOC_DAPM_MUX("ASP1 TX4 Source", SND_SOC_NOPM, 0, 0, &asp1_tx4_mux),
 
-	SND_SOC_DAPM_MUX("SDW1 TX1 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx1_mux),
-	SND_SOC_DAPM_MUX("SDW1 TX2 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx2_mux),
-	SND_SOC_DAPM_MUX("SDW1 TX3 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx3_mux),
-	SND_SOC_DAPM_MUX("SDW1 TX4 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx4_mux),
-
 	SND_SOC_DAPM_SIGGEN("VMON ADC"),
 	SND_SOC_DAPM_SIGGEN("IMON ADC"),
 	SND_SOC_DAPM_SIGGEN("ERRVOL ADC"),
@@ -420,6 +379,7 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_SIGGEN("VBSTMON ADC"),
 	SND_SOC_DAPM_SIGGEN("TEMPMON ADC"),
 	SND_SOC_DAPM_SIGGEN("OT25 Reference"),
+	SND_SOC_DAPM_SIGGEN("OT127 Source"),
 
 	SND_SOC_DAPM_INPUT("Calibrate"),
 };
@@ -476,14 +436,7 @@ static const struct snd_soc_dapm_route cs35l56_audio_map[] = {
 	{ "ASP1 Capture", NULL, "ASP1TX3" },
 	{ "ASP1 Capture", NULL, "ASP1TX4" },
 
-	CS35L56_SRC_ROUTE("SDW1 TX1")
-	CS35L56_SRC_ROUTE("SDW1 TX2")
-	CS35L56_SRC_ROUTE("SDW1 TX3")
-	CS35L56_SRC_ROUTE("SDW1 TX4")
-	{ "SDW1 Capture", NULL, "SDW1 TX1 Source" },
-	{ "SDW1 Capture", NULL, "SDW1 TX2 Source" },
-	{ "SDW1 Capture", NULL, "SDW1 TX3 Source" },
-	{ "SDW1 Capture", NULL, "SDW1 TX4 Source" },
+	{ "SDW1 Capture", NULL, "OT127 Source" },
 
 	{ "OT25", NULL, "OT25 Reference" },
 };
-- 
2.47.3

