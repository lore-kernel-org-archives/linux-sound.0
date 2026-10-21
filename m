Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792592509;
	b=iBB2W5Bw/5rMuE9Z+RbqB7NVlIgv7vu1KdHOv/nB4NYnKTuwNK7hTesTYZ055EDLWHy+
	 e2nUXU9XDDYa9uLrJkRJ+mLgqPeCElI4iwEsHiOtsDefIPRWMPO7gY7NV6m2KuVAal2So
	 Ltebfo1OG5fE4c/IIyxAd4XKggAPGRRBwPHb3jqe/pHRY5OzHhpNSjtbg7fno1SKQDhRz
	 6e5R+Ybrwx6Ssni7OxwN56cdrcj+Q1K/DgoUhCrXINhxFbMPpyQyLATR0KUj6BN2mhTTu
	 jZOzzN1sjHJLpZ8esop0rIGwzL7dqC28Md/IJi6ELzMaE5OgmTZFMIiSvzbYwnY/5LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592509;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=jlp1vzsBXsIWRzljlq9XVKUUIOKlpfIV9Mzi5qSiLg8=;
	b=vfaei3hNQx+x7QgGogoW6PDd5Wf+412s4mbdJE70wbWpp429ZZcSC8qnIzUwGzPt+DFh
	 jaHNbjnZwjHyBS54zCwNOKCF3fC8T9x4yaNszmHXE1GQbDTOPzRq/6SEEw0skzLwJOTuB
	 trKlZfjgtWraG/IzG4i5o2COA1esQIbWeP+Lbrzj5mJSYBUH2kdN7NWEw6usCd6XCuVTP
	 Kj823FbuStcI8D0eUVXV5f8OU/TkA5hc6c4t4jgwzZ9tAm/I6+2WE6jHXOXl/T0xfk3u8
	 iRF12W+YBpNALCGbpJahEuN/3dVyWjMXQ6zU/MXMc+FxKxATuWVVYe5aPeOzf0yxlNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=q0by1dcz;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=L4uQAbkk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEB2606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 14:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DEB2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=q0by1dcz;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=L4uQAbkk
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFAQj323569;
	Wed, 21 Oct 2026 09:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=jlp1vzsBXsIWRzljlq
	9XVKUUIOKlpfIV9Mzi5qSiLg8=; b=q0by1dczfii177x6tT9V/b1DKiCliU5FPl
	9c0+FVAzAic5znxohLoCcBzWDqEJ+Zz8jUKwV0Cnh+AV8q2Ys9lW0oGEifmXM82u
	smzqt26Szw/LSvDdSjObMN1W0rikWaIn6w6YfoFh7uH5LOqk4kY2qqRyVYl99Yrl
	rWaFRqF1/1814EKPQqip/h5tcj7B3/CMIaRvfUTyMBVpsFvTrAZWj04TpKtA+yVN
	8NFLLfEkIcC0bYE8cUt4P8K7XC1RA3uio2UhIRxg61UHDkJn48GU1b4V7ihOzcR1
	C+Qg2pcAXF4Aj4zpFTITo0WIeIBJkATpmczi1ju2wb1s7jNbQAeA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020073.outbound.protection.outlook.com [52.101.193.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw5b2ue4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 09:21:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYJuK8dEUK6DNl6NhvHxvHoQADIOXybHBD7wRN+Jjku+gpZz+bpEicFJXV6q39czkVm78Bo3kKZlm8LPdYf9vvUmKvpvQAGOMQ0U0Ij/wWym0HgB56GzeQplSq4OClfRZiksPEAC1z2+DKaD7YQCmX7vpjTDz3ezu2cD/9koEBgGoPI867z56rnuKeG+dhAKvI6Wk/XxjibpS1r+emsz1505Z88L27N9Itj5vkC5B0UKh0LKglCfBActxrXnFKEU8WTOUZsfoECJ7qDdv5np2THm0GBqcicb17M5OFUW2ahxbFTS6p8pnIdGclEQsBEO9JXuQonf4xCOCi6cwJbh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlp1vzsBXsIWRzljlq9XVKUUIOKlpfIV9Mzi5qSiLg8=;
 b=aYVTcIAILJWZBhIEDQ9U8ivmJSKIUoEczTi+5C/rKJmOHyYhJsg8dbtvEBU6JxHrCm70dP1aprquOQGjc46PAtv6xnFUufLb2Mx7ayTqUaSq3uWhMj+goQyDKGVok6wyOR1sKIjFRSAEDQJU5NW13Z6GSKp50pFEKONmROcva/DKml3YoG9qijLDLDCo3YMVJOz9bf1HkKk6qVhUg3uYpmj/SRjic+uzrE8o8Vjjf6ohDg3OMxThlHIx5Ki5cYIOKgCLJuMYixZxmWPByzDsCXOp/3OKoouesEQdh6SRPZPhRA+vowX1ZpZHc1Mb5ETGnMmEbt++Dl9T/rmjvinAhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlp1vzsBXsIWRzljlq9XVKUUIOKlpfIV9Mzi5qSiLg8=;
 b=L4uQAbkkNTuMNsYBiQWA37YP450d8AElw3JfYlkgrnENQbBmZFADbBI12ctLchqEMX8ouZELdDWGEBKCDz+54m5+qQ5wbPfDArSf4M1iHgRnFVgtJUjkTepRf6uqxXqlIl23sUnx/zMFGbhy5Nm9L6D+yeo6uUBRzs61Y+ebg8A=
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by PH7PR19MB5677.namprd19.prod.outlook.com (2603:10b6:510:1e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 14:21:18 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::64) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 14:21:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Wed, 21 Oct 2026 14:21:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 80751406540;
	Wed, 21 Oct 2026 14:21:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 665E982024C;
	Wed, 21 Oct 2026 14:21:16 +0000 (UTC)
Date: Wed, 21 Oct 2026 15:21:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Simon Shields <simon@lineageos.org>,
        Artur Weber <aweber.kernel@gmail.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: wm8994: don't lose the AIF clock ratio when
 staying at 32kHz SYSCLK
Message-ID: <atjKWwDJiSC7K8UV@opensource.cirrus.com>
References: <20261021101750.3297770-1-m.szyprowski@samsung.com>
 <CGME20261021101816eucas1p11dafbfaefa1ca53c6518adcc14322931@eucas1p1.samsung.com>
 <20261021101750.3297770-3-m.szyprowski@samsung.com>
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
In-Reply-To: <20261021101750.3297770-3-m.szyprowski@samsung.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|PH7PR19MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 621a6b39-e219-496e-7047-08df2f7e9297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|23010399003|6133799003|10067099003|18002099003|16102099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	afQtD2x/7jYRJ4/w53WPtNAhkPUOoB+r7fR+IbamcBBsWf6h6c0+UaSrnZsw6WgWmJjdY9sdBxx5+hKgs6wQFEXjqC2jRjn7swkYXZe0HyvDBPvoygm3G2wxeKI1GAqNbD/NcOce2E3VKKWpM2QOU7WtEbjB2shU2E3zPSIiWMR7bvJYhD383d0QDFTl7JSeU/lZoyLXpi/J8SA9jkBcX4C1DOThTJu0FdlMjTitOatw/IrURC3B2oCZdQyCHAueBKQ+vbxXThbrWRYz0ZNvx15xhxlJpKmDdAH9JtB+V/rgjdPUBdWoJGYdoss5KggD/UW6TG/AVbDfw7VOAHixAmCouO/vxz5RriKTXHOl0OATuvvc+erbbWdcaPO+HJpPe14ou76azFKcap0PPKWc9sk2aU9UFONiSxpMGmyOyeuHW2Ggk37PEU7NWbmwb92U3Froj0NpFJrOGpH54knTm83/TQ35qHksBsP28awxuj+cUWkuHreKKCjEhA3De5X0xQFZr/8YIzqVvhnNcnaUuCL+R8tw4FBCx3UiK9oi6kaNAps+zoHN06eU6zZIS1XlMtyV1g7KE0JepO0pQi0JvKv4DIJ21cqf4EyLKrSmc6aTa+FCjor6CyxQjexTpc+0FZ1AG0SqQsQXxU/amhseF0/H6Ic+CTCag8x5VNXZXQBT9YvySa/OlUC03BbGpndruKXs9odVZhriVFg1D9C+GQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(16102099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IX79Hxp/M8IpEhTReS79PZ3TKFBE6cu2vZ4YH9N8Cb3XMM4Ss8nnooDLbA0ACFOJHM3jpzx7Rhb7+OETRgF6fz33jVFrv2I3fQ/Rhf/A9l9KQjKOipXYt+Z2cBb0xtPWb+McEgnfrQR248gfrNxg4fSGX3WNrtw86/pQXp2pdKdX6FwlFonbplq2tp8tvnzplZGBw5BHl6b6tUHaZQYZdQCwtpFqtYmH4Hwbl83QuYzTei2bEYSihVJ7vljIoo55ehrc8DJVcsigaUr9rKvammmcZh/a6kLvgqzdkgPerlQfNPJqt0tyViHX0TcAu0qziN0B3O5JHyvXJ8oTn6/GFuKm44DYtDlIckC1kmMogKbss4OanHibUmnybv24OpkRkXLaH8xGlnnza8fFI5NVYtikfSJ3NWFAHsJovWUftet4EPBVyNK8KCEpsWtIAFyv
X-Exchange-RoutingPolicyChecked:
	smuSel2XjMzFrNdG4D3eeE2Hd3Ys1YX+A8r/zf8WYOknyGTnDd4sDCSO5nOLJT1rgtq5Owr1wef01mhIxs7xwuyyH1/4fhZ5UA78KpZj9ZCFNWM4Ca/CnI7vWu7iuiYIEtct+7c+9gURPZma/Ot0pDiCIxhxomN6icEAkVU/6sjf0AEO9Z04VkubqM+e8FEpM4I6vwe5kwtNEKff/RGeVHFb1dPMKu/tH1qzo3q8VNOEO8sEPSlGFrybHuD684ohCGNMFCrB1UZKXIJKhDb90MLw9MSbzAVhwPIY15okn9GbxZtAreIXnE+sJvHYEj58B6YVvujjXUIupkgx7DXLLw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:21:17.8514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 621a6b39-e219-496e-7047-08df2f7e9297
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5677
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfX0FOoqbKn1o53
 RJMca52GZJ+IMPrixf3FrHvBgySrTw9KcbbK6W7pstAEpOv711KyF8ohTdEc2GCh7IyavHPAM76
 EXDdFOK3MDV83PS1J8B6cGkBvmuTIII=
X-Proofpoint-GUID: ZsPTrolYkrPizanL7S4TOzjRBNfaBaMv
X-Authority-Analysis: v=2.4 cv=HOlWhYtv c=1 sm=1 tr=0 ts=6ad8ca69 cx=c_pps
 a=hYl96Wf80w8BVcyCAtmm4A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=hD80L64hAAAA:8 a=w1d2syhTAAAA:8 a=KS6BOHWGQHvtCe3Cv64A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: ZsPTrolYkrPizanL7S4TOzjRBNfaBaMv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NiBTYWx0ZWRfXxjy/VYnpJz1d
 Z/dzbUl3sJq7Uwry9eRtQ/r5SLmzIu8JCrci1PmowRmGSZ8DsJMqYAY3SEtAPe2aIqXlpaBz1jM
 kPjOSmveQ4Oa7riZaXkeE1qcbfz6nF9Coe5d2EB7zdagZxh4f5gX1e8GtoHYNGuds0Og0y3ifBA
 /FcMBVnSEdvGA1gAMc4WA/VjDkN3pYriTJHH/goGBBPRTbQO787/IhYk3pMmTVlBD/HbFafKI05
 4IqQjx4jCiaGhfcckC3tZ8Tih9+87YHamk+2zdVBFgsM1woTGn8kUZKZ7F8y2mfTQZINa6f7SRt
 rn9GqBGXtmqOwpWxngkHFgtYTqie2lupx5aGSKMHo0wnFEdX9Bc6Z4lUUROrs9e+Wt8+Q+nLaC4
 qrcaeO/o+3449AwLzmg5jyK/72bhdVWGJQMEQm7sSRhSJt+O6BNhS3Sr64dDixJBRKJcGxvJj6y
 o7+5fde0nKlLfro7hVA==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 21, 2026 at 12:17:43PM +0200, Marek Szyprowski wrote:
> When SYSCLK drops below 50kHz, the AIFnCLK rate ratio is saved and
> temporarily lowered to 128fs for accessory detection, then restored
> once SYSCLK gets fast enough again. The ratio is however saved again
> on each clock reconfiguration done while SYSCLK is still slow, which
> overwrites the original ratio with the 128fs one.
> 
> This happens on the Exynos4412 Trats2 board, which set MCLK2 as SYSCLK
> twice during the card probe and then configure FLL1 while still running
> from MCLK2. Once SYSCLK is switched to FLL1, the 128fs ratio is
> "restored", so AIF1 is left configured for 48kHz at 128fs while being
> clocked at 256fs. If any digital path is powered up before a stream
> reconfigures the AIF, the codec raises FIFO error interrupts every
> 10ms, flooding the kernel log:
> 
>  wm8994-codec wm8994-codec: FIFO error
> 
> Save the original ratio only when entering the low SYSCLK mode. While
> at it, move the code duplicated in _wm8994_set_fll() and
> wm8994_set_dai_sysclk() to a common helper.
> 
> Fixes: 6730049a4763 ("ASoC: wm8994: Lower AIFnCLK divisor when dropping to 32kHz")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
