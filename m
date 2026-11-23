Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795454539;
	b=fX+8Y7eLU6dVVPYBmoEKEom5DqgTAUn7ca6+ukOH6hm3/xorX1kOzjylGnM0tLsE9xyS
	 HvPfDMa9pSQ6AlOgviscGpS4VScauk0a6LHuxtUzWnllcVEMHDOUUhiQoTRHe1/fs6cIn
	 7bu1zLqPKVs1WyuNTY+O80D+sPDpAEx3GV6hgUbIkc131UfPysJaVJlec4pMEjCk2ZtwD
	 q6F7bfR6l+bKoJGHLR4Nx+R7eIqNODIrkoDhwtD4WR/dk4xIOG+XlkMlQv8xsdabG+/tk
	 t4EbeLdzkfd9m7YAcv5I2tL1ZUGvIesQeU1/uv6Qd+D8TS0KNrhteN1Q0Y1wCNV+VmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454539;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=pJ1cnd7Y+Z7WYLyVDf6VfaSTIgR0VF71nb6xAqQtdMM=;
	b=3X4u7aRwSKIUaoPLPzp3laR6Fadgmp+38eY3lvipsjlN9CM/lL8ishY+0UE6TiYeSewo
	 jucLae3Z3Klcrr9aHzQWnRdjnQFQ1Oc2M6K5mDDZc86a/eBhB3P0rNQ1ygjW1JyL+V8P6
	 m3mE4h5Lb2B8aMc1OMwsI0g+mTQMujQDfB6bX4fM3qOQ6J/IBebTSY8+xWsxswRpWZhB5
	 I/yOkipR6Mh11EvmkGICFvY90CQtvTessSQaOk7RutehtCJecUz8C5E0ehGQKQHgeMyKe
	 KNeoHKCfB8s54frP0t86sLnXsvrWWHLlwA6tpxKwCXU/T1+invD2TVvTa3P5PkjEClg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VG6DnmER;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RkAW2XfB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BCA606A333;
	Mon, 23 Nov 2026 17:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BCA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=VG6DnmER;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RkAW2XfB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGWeQF1733841;
	Mon, 23 Nov 2026 11:22:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pJ1cnd7Y+Z7WYLyVDf
	6VfaSTIgR0VF71nb6xAqQtdMM=; b=VG6DnmERyHKszGkvk45eLPbkaxo7G14kAd
	pXMHMf5ctD5d+AOJYrQU7kKj89GISbn0Twnq9TR9SzPaEzWUCJqaU/LZOONT/qpp
	3GjHGj0cZxXu0wuq23FTq3DDvMp/xI0rfBMy/9ifHgIRari+Y4Ng13947kgdLdr2
	AJfuZEvCVu7uboJYyykOoONomf/Mub9uOcU7QOqjxrFn3LxfI8a0C4QrXuWA4SFY
	3SPlBPtkESy35KGhbZbqKfSsQxbc6vXckyl1nJqWF/qoWvPJzIrCHHdUaxoEf3fl
	tuSHZmTzh2JjmIF7R78qvNd0ge53EqxiCq5kalkmj5upCl7TA13A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023122.outbound.protection.outlook.com [40.93.196.122])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j39kh2vdt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 11:22:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OP2/cINxtDakpMoIhQXhJWFpv3TDbEmYSE89xSBwl1YWMZJL2UBVC48yVhaJldWJlVTSOLTM7tZojVpByu1KQGsYsNjHeILPNNR+QTaxsylcFCsQsFsVhRiVzl8C8l1NfGO3jF5tOXmZY3sZhXTPhHW65N2h9ixW1MeryY6yeZsRM+zdYOE2oBoG8XJvb1itSwxw05c0Lsdd8v/3mgQCxF2AywIPpNSU9aCl8c2qDjtmIUL3ZqNHjn1mZJ66lCahGYX9+amDC67I9bvKOuDBwgEv0N2iZlGDKZaq1NwVojmIT1p3Rg7CBSkUoi2U2yuyBfG2nTKPuMdSejyzCM/iXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ1cnd7Y+Z7WYLyVDf6VfaSTIgR0VF71nb6xAqQtdMM=;
 b=X5DCE0WcMfNot2J6nqbvVxHFUdjwT5YKIAO0WgBNmorWuiKDmczTpzBGr8rowP4rQe7nqCRyf/fvKPuGv/aUzaBC48/V/muEN3sw4pl+qTE0PlIMNhaOlKk5XDhB4BEDXOBznIA83mlPQL2KnEohKx/L47aKwRVzSgWEbQhYT9Gruws5vA+R6DWItmam4CdtvlHtgqapV+BJEnNLA2nHd08sCP2fgJ0pmMk6+6Hkhy6sGtUtl47QcJ9FyIsoBX/mzIiQs14j5F1ctGaPwqzc8+4F7+UcWgZVZIMud7vRvb49rRT0HEz9E30Yfzwy0QeyK9oIRiw5DP5N6O8QYlpYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ1cnd7Y+Z7WYLyVDf6VfaSTIgR0VF71nb6xAqQtdMM=;
 b=RkAW2XfBRF9IxQyHQBB6pt3VsgPEcA6E4IcrHDWd34udHmq2vIu8caNDBl/aSLGoxxDpA/+fAE0vpICCMuqv5tY/J7ekJFtI46lM6oXbQVgE601cq5P755IJ8KQhr/uevy539Yijy39EEvcbDS9fdSj5CWR71Yvh3c+XabRPZSE=
Received: from MW4PR04CA0091.namprd04.prod.outlook.com (2603:10b6:303:83::6)
 by PH7PR19MB7384.namprd19.prod.outlook.com (2603:10b6:510:274::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 17:21:56 +0000
Received: from SJ1PEPF000037B5.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::57) by MW4PR04CA0091.outlook.office365.com
 (2603:10b6:303:83::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 17:21:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000037B5.mail.protection.outlook.com (10.167.244.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Mon, 23 Nov 2026 17:21:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5D5AF406543;
	Mon, 23 Nov 2026 17:21:53 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 46F67822540;
	Mon, 23 Nov 2026 17:21:53 +0000 (UTC)
Date: Mon, 23 Nov 2026 17:21:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: skip port channel mask for Output Terminals
Message-ID: <awR2ML/nYeYHrUpB@opensource.cirrus.com>
References: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261123165612.440542-1-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B5:EE_|PH7PR19MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 7447f4f8-b16c-4b55-8e13-08df498645d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|23010399003|6133799003|18002099003|16102099003|22082099003|3023799007|11063799006|56012099006|261022105027099003|261022075727099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261102123227099003|261009223027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mC1qs+0uFjxpvaYlWVQGpBKU+kceFnqVk6BKUhEatNiXP4kDMGYydyz2R++rzPKy4SpltVaYmiD7LJT3WL6xCiLPpE064OwEy0fLloT8+HlfjfCs4FAl1KxnWseQdYtH8nSUsEH9ToM7vOe3iKSE5HJmcY4MRW3p6H9hb3KRUZI2T4xCticpmt9Q6cT6dlolhG8sFF9PeFkaFV5ZEHT/dCTSOnvT+3RSJ0P24cXk7kdHuZKk62Od5Wzvx35wTtbN4n3l6VBGaylpZAHIhxh0QsUBTYOZDX9s3B/tYqHlS4ASZHF1kUQMimpSQ4jejoQrL+4VXzYxypX6X9FFSat5ussNwA5AydTKlNZY4CMj4NIVf8gsp2RFDFuG20AZCrHNRMscv0rbJ18Zwakt8fOapnt4umP71iXN4aR1uIsOgTWRMb+T4B3pZk3Jz8X7aTAhet6f/INRkFx7D5J8bs/5teuhnvOWfCnG26FCQ+PU56mO5Ix/Pka/W9gOzVMPveZjYCbxyGWILFnb6PuqQW6kVTvXDG5eWKSPlwROqEq+omdBntqA+ZbVD0HZMuEEgM1ILRxwXzIwgMcdJoIEmoNAh1EUkAyiWjtVCw9VgI2DBGiQ6Pi8Yq+QL0QEpO/0MSFU6uSH/OQL/ji7nDwfTLuh8+8tU+Ebk97qQngoOkGN7Eqn2fIrTKqWhcCkI4uLZ+W6H3qmbz+Sc1bRGrr5yl298w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(23010399003)(6133799003)(18002099003)(16102099003)(22082099003)(3023799007)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nnl8nfjwKSceOuT7mm7UhQLuiUnwAloRtKMrGqilttrza+/MbtmWMDn3Gh9o8HD9edyH3AGNvuwhf5vQfEQLK1NV3iTojrGXdcEIuwPWEuMGjUGKW5PZsACn+6RlNjf+XTbXgQTV0vBlW2vACTvnoJX2qElmJvRdkSx4eash7+mp26uOoY55snsJv4+O6Uy8oBf3Sh/FlK1kZU3edwYRU8yYWuxeT4demeT0fw+kugewUU2uJfno2B4yWVhR0Noj9SACAr/Rh20z9td+j2sS+lgY2iKHVH1gj85J16df9IUAbjZm7oQH0ZdXalIt2Ulri+oILtHCLwOzaAD0aHldga3zYmeVP8UMNtm820mLwe2RlDsgIwBSsn4ANcFh+OmZMkx38VeV4Gea3uaGkG0vO7BW6p+ly7aWjXQRJ5PIyRm86NOzEimzl8rG0QM6fSTb
X-Exchange-RoutingPolicyChecked:
	YRaSDpRktf19CbWXWhE/HiFWVxnNB+ynYkoaFp7G8CiJJS/PHe6S/JYz7DSq/OMtJSTIcVlgdQayYYiMo1dTgM9yGNNcpZ0sZ/kgKrrR/Zyc88jeXUcDGhS6BYJjUBAbcbgzaEZVT9s6JvOUhIzl6jo8ObRzFYCLG7UhbYr8BTQLmTlFz/W0LradODGU8I059XEZfPEHEcNOXi6/+W8NglpUMJj2dI6cksQ7t9jwSYeYV1iWCI4H/woOQuTUhVOfX5IPRlWVGacztjk1k+fCj//G1X+9Suiw1NJChYoMelomamCmvDz9PwkPasOFe5T/1GMbx7TNomd156J/ntq63g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:21:55.2728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7447f4f8-b16c-4b55-8e13-08df498645d4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000037B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7384
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX9e9V4NEaxDdZ
 G1dEBLphH64LokFVIOtmWGcv3iacGY/qMVkD6ZaJypPw4VQcAMpigqe5vTAjIocW84a5lsw+CPr
 NSs7pD5Q9ZggufWxI2ahE2wcQXDO/lRuj+hUyrjObZv1C2lVucsl1XbLBBwxfpqUBXLcEoQHAGZ
 MO9x4GsOvuKWp9fu9mJL/gENPPFhcUU3RAjQtU50CuIybQm/De5tc3J+VAJNT0zwTDGg17GqZ3R
 kfSOa1wAe5fM1g3QxFCqaB4ylDRkQMxhpds4Cy9xbWVwfkiBufdvVX0IAuPDyRrytOoz4vcVzzI
 ylynfkiMScagJJQNxoJexH97LMuIOSeL1agQk0f4YN+Z7cbuuz6eG6bq7BrYpj0kQbmNaIjGADK
 3xhYKWI99Dw4sE4YXpuW+tCthblfwjBi6YkdJjmkM2Vt/Zpku1bW10pjpCPLm5lw/EmaEtXl1Q+
 4qJn5b88fc1homBAFQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX1WbP5ee2WssF
 Q/TgQOSsv+GwxvLjNrJo+5lG0sv2fwlRBIiPD/mWEGvTNSLyzlbS/pD00MWb/f9pbXBJhteKAwK
 TDISXPeUv9rCdGed2SP9d6eFoRCWp78=
X-Proofpoint-ORIG-GUID: WiBjkOfR0DThsJCzH174oPgOac6kx514
X-Proofpoint-GUID: WiBjkOfR0DThsJCzH174oPgOac6kx514
X-Authority-Analysis: v=2.4 cv=Ze6IpcVA c=1 sm=1 tr=0 ts=6b04763b cx=c_pps
 a=+8ozu11IBk2Dcx/W9SapsQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=lYyJfLvgaWnlJ1rghrAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 23, 2026 at 04:56:12PM +0000, Srinivas Kandagatla wrote:
> Commit 8bb24d87078f ("ASoC: SDCA: Add port constraints into
> sdca_asoc_set_constraints()") started intersecting the DAI channel
> mask with the SoundWire DP port min_ch/max_ch for both Input and
> Output Terminals, installed via snd_pcm_hw_constraint_list() from
> startup().
> 
> In DPCM dpcm_be_dai_startup() aliases be_substream->runtime to
> fe_substream->runtime, so the per-substream rule lands on the FE
> and narrows its hw_refine().
> 
> For Output Terminals the port sits below the DSP capture graph,
> which can present an FE PCM with a channel count different from
> the wire. WCD9378's headset mic is single-channel on DP2 but is
> exposed as a stereo FE capture by Qualcomm LPASS; port_ch_mask is
> 0x1 and any arecord with channels_min > 1 fails with "Slave PCM
> not usable".
> 
> Only intersect with port_ch_mask for Input Terminals and leave
> Output Terminals on the cluster mask, restoring the behaviour
> there to what it was before 8bb24d87078f.

Ah the joys of DPCM. It feels problematic that the backend
constraints are duplicated to the frontend, when a significant
part of of DPCM is that these can differ.

The "correct" fix here is probably a bit of DPCM working,
although not sure how significant that ends up being. I have not
spent a lot of time working on DPCM.

> Fixes: 8bb24d87078f ("ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/sdca/sdca_asoc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index aaa84156f20a..6e42f5262aa7 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -1645,7 +1645,14 @@ int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
>  
>  	constraints->channels.count = ARRAY_SIZE(channel_list);
>  	constraints->channels.list = channel_list;
> -	constraints->channels.mask = cluster_ch_mask & port_ch_mask;
> +	/*
> +	 * OT paths may re-channelize downstream of the port, so only
> +	 * narrow with port_ch_mask for Input Terminals.
> +	 */

If we do have to run with this for a temporary fix, this should
really have a FIXME, this should apply to both. There is no SDCA
concept that these only apply to ITs, we are just working around
DPCM here.

Apologies I probably should have CCed you on the series, I
endeavour to do so in the future. I will also try to find some
cycles over the next couple days to have a bit more of dive
into this.

Thanks,
Charles

> +	if (entity->type == SDCA_ENTITY_TYPE_IT)
> +		constraints->channels.mask = cluster_ch_mask & port_ch_mask;
> +	else
> +		constraints->channels.mask = cluster_ch_mask;
>  
>  	if (!constraints->channels.mask || !constraints->width) {
>  		dev_err(dev, "%s: no valid constraint masks channel: %#x,%#x width: %#llx\n",
> 
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> -- 
> 2.53.0
> 
