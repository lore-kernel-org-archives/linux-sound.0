Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E835385D8A
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647765; cv=fail; b=fBHIdzDZzUPt1b+prI84Z/WqL5t6pLDyH7aqAX1FGyhv3zp9TP+y5NQrfrFvDsV7x4p1IHqhJSrQJfH+P/jWqCNh3lrIn9sB28ln/77QNUErMEOSO9iY8ssiSz7RGCjMip9AZaXWsJhExPNW0BezY+e20Zxreo/hif4wKtBgnTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647765; c=relaxed/simple;
	bh=cx3b8bjNbGxGtIMG99mx51JKhiMyAvrd0jx8PFJZ/qM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X4MmrJqOpPxY11/y1ajlE9jMHF8hJ4RvIg8Dc2TIOePMACk7WT0w6eliUwJw3uPA/IgMqIkaba8RsBIAuE7Ol1ceDpvQrgyhfnYye8ROfjrCIKfM9OaEXrbci8bVNfDJogwDNjWoQVPTF1bo8b196tr8haCRMnz9rTu9EBfwXhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=h8Vb/7hG; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=GhEOORow; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="h8Vb/7hG";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="GhEOORow"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68T0jPuq3849436;
	Mon, 28 Sep 2026 21:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cx3b8bjNbGxGtIMG99mx51JKhiMyAvrd0jx8PFJZ/
	qM=; b=h8Vb/7hG2jC3jvgkb/qC5f4IaJgos7r3C2Svd2CER2WXrS65lqJ8aqSen
	/fUhim4meY2R0xuBayFqlg57HI+LWirOUmd+BtuJ/jaSAnQIc1ndrkUoBqFuLoMR
	FqCpyhBLA1k38Nn+vyL9C+5z8QFiFlJh+tiLojnU3EZAwqlEByCWUGJArrZWPbqE
	QIwZWz/oe4GKL1HhsXf/ePSUr3s6NXZzzTBul6Vm/DEIz3tt9sPo10PF/KCK94Hx
	MZNp+zU6H6IznuALgjQp2cGJ0KtUljd8Ab6uGlEzWhngXQUukIltivmame/SlHHw
	0+Fyss11LsfQx7o4yWAyO8Tweo7Jw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j68k7f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 21:08:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXjEkESNpL2UbM9jUpOKHHncPtJPMip8SNoIx94bw7A2jLBHrSgz4OuwRrjC0zqIZ4aJVBhTanleKa2N6fMZT04XCtdXWzdYDGYBNx/e6jGcAT2SKoGc12559XGmnWvbq5PWAhHvY1B26Aq+BXu7sxXMAX4jfAricoVhGr5FC+B5L5c0Ln7FF6DwfdXg3gyG8Q/JJm3uNdFvdPNhw3mZ2ByPgQHONJuX4jUtglbt6nPSt9hbfvlv78H9ivjhV3VA1R9tvzb1HdBjzT6IuItNLFHnMRIOpu9q5t6f+dx2+PVNmO9o+ylRSzXAOvI+qAQk+ZX7rbA0GqQ8R9+PG4FBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx3b8bjNbGxGtIMG99mx51JKhiMyAvrd0jx8PFJZ/qM=;
 b=KYgGRmDQcYwYxc6yE2G4Xqff68zIGq4LS5bWgekO4rd/3wENgKzAr9Aw1xqgp0CqmK5sZS1xb/9K4ULaxsHEsMNha5ztQTAS2fAN3rcHY6P2AYRdlmTZuyrrTO3xwYw/gQdp2Yam8gNFfKqj9jQkHmnN0vwYg8XTmmtqnonqWKjW2rjx1WCFIN4LkeZIMsftaDSTFcmo6VjlH/AiqvHV5weVt1JpEXqEJP8CzjXwMy2Of9yCDjG3lo8kkUUwRM4fFOJB/pRYPEtL+Yy/odDJpd9ItrEuXPDtjiwVCf1DLx85TK+kaYGOnnAJ99Vw5brAuja60QXUnE0AEwQVXk/8mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx3b8bjNbGxGtIMG99mx51JKhiMyAvrd0jx8PFJZ/qM=;
 b=GhEOORowkafHwg5/cFI01QZM5FPgbpJagjmz8sLEl5H/NQi4qOBATa3JQ5w7gV8jAOL3EYoWRBUABI6UQ3AVKJg5V3cyxKyhkjopG0FEa1KInJZ7Rm09Cy9hYQjYWTtZmjTFZDcmO07frV3AEbn51lx50G1MyTY8lB8D4NoQ7ek=
Received: from SJ0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:a03:33c::27)
 by CY8PR10MB7123.namprd10.prod.outlook.com (2603:10b6:930:74::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 02:08:52 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:33c:cafe::48) by SJ0PR03CA0142.outlook.office365.com
 (2603:10b6:a03:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Tue,
 29 Sep 2026 02:08:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Tue, 29 Sep 2026 02:08:50 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 21:08:42 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 21:08:42 -0500
Received: from DLEE208.ent.ti.com ([fe80::eccb:3d12:9ac:a479]) by
 DLEE208.ent.ti.com ([fe80::eccb:3d12:9ac:a479%20]) with mapi id
 15.02.2562.045; Mon, 28 Sep 2026 21:08:41 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "tiwai@suse.de" <tiwai@suse.de>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "Xu, Baojun" <baojun.xu@ti.com>, "Lu,
 Kevin(CAAH)" <k-lu@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] ASoC: tas2781: Add TAS2573 calibration
 support
Thread-Topic: [EXTERNAL] Re: [PATCH v3] ASoC: tas2781: Add TAS2573 calibration
 support
Thread-Index: AQHdRM1YyUPMuwt5Iku8JSQ+DyujZLbQP1wAgBSlCKA=
Date: Tue, 29 Sep 2026 02:08:41 +0000
Message-ID: <e409dd4b8fb94b93ba7d2c0bbd0d5b9f@ti.com>
References: <20260915044735.1305-1-shenghao-ding@ti.com>
 <178949457658.151760.15632737262810659230.b4-ty@b4>
In-Reply-To: <178949457658.151760.15632737262810659230.b4-ty@b4>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|CY8PR10MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5e5e2d-af4c-4b87-f727-08df1dce9ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|13003099007|4133799003|4143699003|3023799007|10067099003|260925021311599003|260925021911599003|260925022911599003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J2CmcPuOzs/VQOk9B2kSFlzy/ICncGL3ZPuX40iLErKWhU0Lyij6YDNCcEXvN45xY5+lCBj7HWqzly+TT6XDv+BhKy06nefSjz2p1emCYK7BbovTuSpj3BDCT9zRR9XkbWDEc4ru0rLSQQb4ZXNR1jqJW64iQJjOjAa0T9pIHaqgdqF0yJwPp0SlGw3zXamWhO6HP5qyDUxZfTUCoWxa8342j9fxR0Wgmzobw2aMgzkm15oxMc/0D464FNqiIlL39OoX4aJePCXOe2mHTyshBSDGb0wVNbyzWGV5q5+q9KRnvOJqcdKfSr/uE1RKA8vwcKqI8C6c2nwe3AukEJ8yrrLhHhnlpZh/kOhyLvIR+VwGzDyjzMwsPEQHmGlZ71zuPM2eLw1aE+Gi8UTkni908jtYGMeVg9BMK+AdTjUzTkpWJ8pLTYfME3EDYyrq1vRv/QbZKUK/CI3Il6mvHItmQaGiMddWxylO86+YaPIGe7CG/sF8VOU5pOKi5XmipOnvQUv/Q/jgNQyaV6TWRWYe1RIj1K72E0wXQI/bJiHtEzuolRQJQY/qVZ5eHHjoQO6lJBmrlkPZ+WQXPnw/Jwinj7z7M4pnDCH8w5mGz5/2wrsTCPjlDkzRTSOS/pOHERGdi1YQp9VHnN9qk+BVNsv98g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(13003099007)(4133799003)(4143699003)(3023799007)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QfI1qMCEkPDZ64OUH5Ee+7fTFSkLOWrfr/2jnuIsiimS0xi/jIPd3/XJvmdEEqUnahxnB3+Ke8l9pVtqdbuv6ftf7GHgrOnjuXMgVXyckTjOTP8DGkU9QuU/DUrY9ABW+q6NeVk3t8doJuscYvOu6Cy/IEfnSR7QI3tQMsd+lQlKOlu0dy3+sPSr8bQSXR8S17+VVSCY7mF3H2WcTkGdwSxhJVinPYgauQbVQulUGYpnVZA4uZpPZIyC3j99xtC/Eyrl3unDd6bfo76XqzWAC9BlBQ6AhY1QUgdLVFhvHv0OlRVhfgp0nG1AyNr2+f1IIEqhfYlhAo5lM44jUIN9ANM34QVnwwRC+4kFoqSc+SI9tX3EQGFKO+WBFbjBdbB+AzduTD8BIOLGUwiwyTxZfYJv1f3OlsZ4OJLgjPIpqOEIQj+oaS0XmvVBuzrSM0Up
X-Exchange-RoutingPolicyChecked:
	bKHIZjtjMZxMUoWhLwKAQ/pUDkiEoPNYTuBbdAqcbrV1s2rYq1F31cYs1VHg5XM2tYTy7RR6PLPo6ut/pm9L7iV9SxJqmMXnFqr6zTkmbq/yQ+sByG86udsLS9SzL4mO6crvI/cZBANKeZsgde5LHKJh2umEOup4e0dNV3X8SeLBUWPX71Qi50HTPkamY3U2ombWF5lepE2401hKaRVcOXYnn5YcIMNbIMDq3QRltTQNndafVY4RYE02qqLi43GXExcxgUiPY/TtO8WgVDVH5ztQ0Q+/SKO9PoUegT1p9PNlCU6tcl2Z16KtmX1kcLyfMsGExG+5+xWPeTxsDjLMiA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 02:08:50.7316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5e5e2d-af4c-4b87-f727-08df1dce9ade
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7123
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAwOCBTYWx0ZWRfX8fyzQD1gUzJ/
 8Cq+cfDXeEtRRhjxunEsKLqI0KhX5JdEQc9z+2ZMPt+/bF3XGcVQQJaGY/cne18yWGBDSw4jRrS
 imVH1GzNcA5w0JLlBnFpoM3gKEZv3J0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAwOCBTYWx0ZWRfX52xrp+Ldvztd
 oPfcYi8TpLJyQHrhDdwtl8H5Hh6bmtX1TRkTSakT3w2chTUCIDUXwuRp7Q6wWPyC8F6pciQPiCR
 +g5lh19RfRxliTB6VGiLxP7s06zLysCTHDy17tsKUfqHStn+7XPc/1lFoRqXsTmmprUPJDTJ5xw
 82sTcZ9bVmGE3KxibJEd5sehcx4PZauZ5cGsnE0uX2MRDuj5J5OKual4tXqRnLJOK7PVL0n5zd8
 s1U0FMjdH5ZyLwiXJteJpFh8JVcs0qBM/aLWMjBagYTmXXVZakTMSlb/vEgKDJPnK+Xpzt5W40v
 1v3ycK86XcJcExDiDmU/OMiN7WVCytWAHOn9RBcwKzKVn+CQdzB1xQDaaznTd2hj5+GDqdOltgq
 Zgh6wZhDO9k28WFsEzPf0x7tCzO5S8Z4MWemd+NNb8KBeCU78nikBOpDJucUzKYVzPyazZvJNT4
 33bTv8SyUl1SW984MQA==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abb1db9 cx=c_pps
 a=Szpykk5hBk3mC7HHiWFpbQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=7jFbmWnvWP8A:10
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=uherdBYGAAAA:8 a=sozttTNsAAAA:8 a=59-QbVjxAAAA:8
 a=pGLkceISAAAA:8 a=RpNjiQI2AAAA:8 a=lPnpjV2aYKy_EGDrGTYA:9 a=PRpDppDLrCsA:10
 a=QEXdDO2ut3YA:10 a=IGXNCFnflQ0gJHagSJzg:22
X-Proofpoint-GUID: knNbyS2dI7hRvZo5O0GQgADp2ybK53r3
X-Proofpoint-ORIG-GUID: knNbyS2dI7hRvZo5O0GQgADp2ybK53r3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290008

SGkgQnJvd25pZSwgDQpIb3BlIHlvdSBhcmUgaGF2aW5nIGEgZ29vZCB3ZWVrLiANCg0KRm9sbG93
aW5nIHVwIG9uIHRoZSBBU29DIHRhczI3ODEgcGF0Y2ggdGhhdCB3YXMgYXBwbGllZCB0byB5b3Vy
IGZvci03LjQgYnJhbmNoIG9uIDIwMjYtMDktMTU6IA0KYEFTb0M6IHRhczI3ODE6IEFkZCBUQVMy
NTczIGNhbGlicmF0aW9uIHN1cHBvcnRgDQogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icm9vbmll
L3NvdW5kL2MvZDFhNzNhZDIxZjk2IA0KDQpXZSBoYXZlIGJlZW4gdHJhY2tpbmcgaXRzIHByb2dy
ZXNzIGJ1dCBoYXZlIG5vdCBvYnNlcnZlZCBpdCBzaG93aW5nIHVwIGluIGxpbnV4LW5leHQgYWZ0
ZXIgdGhlIA0KdXN1YWwgMjQtaG91ciB3aW5kb3csIG5vciBoYXMgaXQgYmVlbiBwaWNrZWQgdXAg
aW4gdGhlIGN1cnJlbnQgbWFpbmxpbmUgbWVyZ2Ugd2luZG93IHNvIGZhci4gDQpXZSB3b3VsZCBs
aWtlIHRvIGNoZWNrIGlmIHRoZXJlIGFyZSBhbnkgdW5yZXNvbHZlZCB0ZXN0IGZhaWx1cmVzLCBy
ZWdyZXNzaW9ucyBvciBvdGhlciBjb25jZXJucyANCndlIHNob3VsZCBmb2xsb3cgdXAgb24sIHRv
IGhlbHAgZ2V0IHRoaXMgcGF0Y2ggbWVyZ2VkIHNtb290aGx5LiANCg0KUGxlYXNlIGxldCB1cyBr
bm93IGlmIGFueSByZXZpc2VkIHZlcnNpb24gb3IgYWRkaXRpb25hbCBmaXggcGF0Y2ggaXMgbmVl
ZGVkIGZyb20gb3VyIHNpZGUuIA0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgd29yayEgDQpSZWdh
cmRzLA0KU2hlbmdoYW8gRGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBT
ZXB0ZW1iZXIgMTYsIDIwMjYgMTo1MCBBTQ0KPiBUbzogRGluZywgU2hlbmdoYW8gPHNoZW5naGFv
LWRpbmdAdGkuY29tPg0KPiBDYzogdGl3YWlAc3VzZS5kZTsgMTM5MTYyNzUyMDZAMTM5LmNvbTsg
cGVyZXhAcGVyZXguY3o7DQo+IGxnaXJkd29vZEBnbWFpbC5jb207IGxpbnV4LXNvdW5kQHZnZXIu
a2VybmVsLm9yZzsgWHUsIEJhb2p1bg0KPiA8YmFvanVuLnh1QHRpLmNvbT47IEx1LCBLZXZpbihD
QUFIKSA8ay1sdUB0aS5jb20+DQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRDSCB2M10g
QVNvQzogdGFzMjc4MTogQWRkIFRBUzI1NzMgY2FsaWJyYXRpb24NCj4gc3VwcG9ydA0KPiANCj4g
T24gVHVlLCAxNSBTZXAgMjAyNiAxMjrigIo0NzrigIozNSArMDgwMCwgU2hlbmdoYW8gRGluZyB3
cm90ZTogPiBBU29DOiB0YXMyNzgxOg0KPiBBZGQgVEFTMjU3MyBjYWxpYnJhdGlvbiBzdXBwb3J0
IEFwcGxpZWQgdG8NCj4gaHR0cHM64oCKLy91cmxkZWZlbnNlLuKAimNvbS92My9fX2h0dHBzOuKA
ii8vZ2l0LuKAimtlcm5lbC7igIpvcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0DQo+IC9icm9v
bmllL3NvdW5kLuKAimdpdF9fOyEhRzN2SyFSMHNlNGdPbHh6NHBueWVZcEpjMUNpdEptVEpYNlZV
M2RwelFWUzhrVg0KPiBhaUF4SlVjYlVHQVpSUnFVRFVjMC10VFlYa3RMWXM1bThDMFZTR2okDQo+
IFpqUWNtUVJZRnBmcHRCYW5uZXJTdGFydA0KPiBUaGlzIG1lc3NhZ2Ugd2FzIHNlbnQgZnJvbSBv
dXRzaWRlIG9mIFRleGFzIEluc3RydW1lbnRzLg0KPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc291cmNlIG9mIHRoaXMNCj4g
ZW1haWwgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPGh0dHBzOi8vdXMtcGhpc2hh
bGFybS0NCj4gZXd0LnByb29mcG9pbnQuY29tL0VXVC92MS9HM3ZLIXV0ZHFQZmFPVnV3N3FxYUVf
SEtBSEJDNnRfX0RHbC0NCj4gcENGd2UwZ0tqYmtkLQ0KPiBHQWJEelR1N0d0WlFRenRXcF95VkQ1
RnJCY0ZwZnlIUU9KZ093MDZxbU80dFIxVE5JYTdKOU1LVGtBJD4NCj4gUmVwb3J0IFN1c3BpY2lv
dXMNCj4gDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCj4gT24gVHVlLCAxNSBTZXAgMjAyNiAx
Mjo0NzozNSArMDgwMCwgU2hlbmdoYW8gRGluZyB3cm90ZToNCj4gPiBBU29DOiB0YXMyNzgxOiBB
ZGQgVEFTMjU3MyBjYWxpYnJhdGlvbiBzdXBwb3J0DQo+IA0KPiBBcHBsaWVkIHRvDQo+IA0KPiAN
Cj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2INCj4gcm9vbmllL3NvdW5kLmdpdF9fOyEhRzN2SyFSMHNl
NGdPbHh6NHBueWVZcEpjMUNpdEptVEpYNlZVM2RwelFWUzhrVmFpDQo+IEF4SlVjYlVHQVpSUnFV
RFVjMC10VFlYa3RMWXM1bThDMFZTR2okIGZvci03LjQNCj4gDQo+IFRoYW5rcyENCj4gDQo+IFsx
LzFdIEFTb0M6IHRhczI3ODE6IEFkZCBUQVMyNTczIGNhbGlicmF0aW9uIHN1cHBvcnQNCj4gDQo+
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdC5rZXJuZWwub3JnL2Jyb29u
aWUvc291bmQvYy9kMWE3M2FkDQo+IDIxZjk2X187ISFHM3ZLIVIwc2U0Z09seHo0cG55ZVlwSmMx
Q2l0Sm1USlg2VlUzZHB6UVZTOGtWYWlBeEpVY2JVR0ENCj4gWlJScVVEVWMwLXRUWVhrdExZczVt
MHp5TzVqTiQNCj4gDQo+IEFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJl
IGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4dCB0cmVlDQo+ICh1c3VhbGx5IHNvbWV0aW1l
IGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51cyBkdXJpbmcgdGhlIG5leHQN
Cj4gbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBidWcgZml4KSwgaG93ZXZlciBp
ZiBwcm9ibGVtcyBhcmUgZGlzY292ZXJlZA0KPiB0aGVuIHRoZSBwYXRjaCBtYXkgYmUgZHJvcHBl
ZCBvciByZXZlcnRlZC4NCj4gDQo+IFlvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWlscyByZXN1bHRp
bmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcgYW5kDQo+IHJldmlldyBvZiB0aGUg
dHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5kIHNl
bmQNCj4gZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUgcmVw
b3J0ZWQgaWYgbmVlZGVkLg0KPiANCj4gSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlv
dSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleSBzaG91bGQNCj4gYmUgc2VudCBh
cyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nIHBhdGNo
ZXMgd2lsbCBub3QgYmUNCj4gcmVwbGFjZWQuDQo+IA0KPiBQbGVhc2UgYWRkIGFueSByZWxldmFu
dCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nIHRvIHRoaXMN
Cj4gbWFpbC4NCj4gDQo+IFRoYW5rcywNCj4gTWFyaw0KDQo=
