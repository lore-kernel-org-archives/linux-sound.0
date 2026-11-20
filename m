Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795191137;
	b=Ax+ZAr1glmJ25/UrjDSe7+YboRkH06JpHVZuzXV+US2zUauoBoB23I7H5pz/lPv3iIwn
	 BrFQ5XcY6yIjv7dcFq2bTzZ4HaEV1fh8PV3ucufLJ7OHreyvRbqycnKLbgdFWBuSpMJhn
	 O+KYxY+zjRuX7XWG8nESlhtaI3gJydsA9P3nzryQM82y9ZnEs5fHKxXOXEJ/W92ipgGR4
	 BcutzVHjlYAESVBdUyi8BFiEKpi4MWQcpL+rqV4m7br5ZzwgkNy4QxzO+VWuD2A3BVTGn
	 4uNbMpn8tCqaEkRkgddZ+SXP30VQ8Ri+7WkfxcDa0OZ/YJ2wWY8Za9SknZNDSROHfEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191137;
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
	bh=HjoibbXoKZefkqN/Yr08T4hhlHeqBqw7C0f/toxLA1M=;
	b=DBhIE+aVKC5ADY6J1HrKp9gMZ3NWyOA8LNuXakA7gVG/eBIJ9KRuukvynxAVWr2Y8cNI
	 VaxopTfXq920eK+FAcJA4je7Sie4s5wwTeL2TexdX2D6A1EzCdRrYbApnda292x35po/p
	 IzulLnv/y1/IkW9iegb5DiLNE/a3RCEDtGqKi+CGuS+seGYkdDOAh7WGyW9CqVwiJ11WH
	 uTJVcEi5Sz0KumY1v8KWRyDsby4MzDP0HcRmjB7UO53RvVFFzL6bJbe+GSspxRf/Wb2H9
	 RUKDuQpQ7/tU/UTev5sPUfmUo1KAKh02BuR2EF9yBOBLXLH8lQ3ZxTYOeFKm+GCHPiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bGi9BaRX;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pNelZVOT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C22606A334;
	Fri, 20 Nov 2026 16:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C22606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bGi9BaRX;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=pNelZVOT
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKFll7E918391;
	Fri, 20 Nov 2026 10:11:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=HjoibbXoKZefkqN/Yr08T4hhlHeqBqw7C0f/toxLA1M=; b=
	bGi9BaRXF8h0tgK2+HMT3T8Zq9xe16MoLP4SDE88USwr2KMXnR5fG6jKc3sx5Z/1
	cZeaDaUfmHHwRmR/HVJivCHUkdmu76/r/nznFi/WcCO0JtI6PV8iFyA9XuOxQ3UT
	yKuwXaNpmFWooM8aSdnFs41KPR4Y7IlKL1ProVJ5GRhs2+jkKjUMvrAjdplb6AjI
	Gss4khekoHV4OeIq+RetbuECG0Zt0yM5ClMDYFgmfpOumMHdGYClY1rTEaegcHgM
	gbqcSeQsthoyBNIygVDc7BZ5TzVzARMY9uI/ite7VL7H/x/Nbv8ByxlZyjGhOYpq
	Z2xPYUOpefyFZX589EB7bg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020129.outbound.protection.outlook.com [52.101.46.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4j242mjb3w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:11:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XM+ABTtKMdwQKjfamgEyMxMs1QU8oQ++rnbonNtI4TXG4NvAccHMPdWpDrVgnjpzjuqYRLSlvWVLUvaAGfVmYYlajYUSMOEub7FNdCj4EP5yYIfe1r4sW8S3sTBfXTe3NMX/5HSdfchstraL1M+vGWqrVPZmBRO9hSsIaxBZak7GqaZzD+hA1teeQovu8W7CV9VW9bs7Lls9t9fzWAlAcWPSs/V73H6GLIfRoCyE10BaNS0+Ey4elMO07Avv3ZrGjkldwQqeyNZYrwXHYFby8BJOplIyL7du0NhYHjKUy8pbmKMLFzko2SUJNAeiJ/M9Q1wLNGqEeDqSC5xqIMnqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjoibbXoKZefkqN/Yr08T4hhlHeqBqw7C0f/toxLA1M=;
 b=IHFmB6OSjypJehxOaA/BE6Lr1CLhIRAXPza4xIN+y0luPLuzyw1u/6rUkGQerSQY/OaKNd4HIdq6LtuGzi2wkIWuJ/1EiPElAlKXhW6C0Scc7FQPVkbgf2/w3EHtPF/A3X/gFc//8jdofe7Lyw83HKMjyNO8PVOEcTe8Ha7TSsrab4BHU1mPYHjvFvt3oRrjc1pZfFMTGeE55ZNaCnWUwJay+pWdDzWFHtDO6zNUmgwmwI3R21CyxAylEafpp9tFhKJkrCj7ZYD8wJ1IlJheGUODVBFuYeBBwAqSmO1uO4zYOlwzuRARhbTo/Wp6UK/uTEehVB3XRbiyOrOksE7Yjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjoibbXoKZefkqN/Yr08T4hhlHeqBqw7C0f/toxLA1M=;
 b=pNelZVOTdfvo/yJ3/BUboEEqORlGGRab8dRfcLqgxfap0XwpscYAzcI/WYGRXXCnlyQwWZpHmUGvNdmxorcRysEqs2T7tck7draNKjD44VLMZZ39Hc5BAa+y9QrbpKkjBAT22EhiE0RjLuz0dX1lv7ZleDDLjcKSzLMN1rE4Jgk=
Received: from MW3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:303:2b::20)
 by PH3PPF72AAE353B.namprd19.prod.outlook.com (2603:10b6:518:1::c2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:11:51 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::67) by MW3PR05CA0015.outlook.office365.com
 (2603:10b6:303:2b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.2 via Frontend Transport; Fri, 20
 Nov 2026 16:11:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 16:11:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DCD93406559;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id ADBEB822544;
	Fri, 20 Nov 2026 16:11:46 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 5/7] ALSA: hda/cs35l41: Remove support for alternative firmware types
Date: Fri, 20 Nov 2026 16:10:51 +0000
Message-ID: <20261120161136.157593-6-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|PH3PPF72AAE353B:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbbe0203-ea77-4902-b360-08df4720fbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|61400799027|82310400026|261022105027099003|10067099003|261022075727099003|11063799006|56012099006|261009223027099003|261021123027099003|261102123227099003|261021121427099003|261028144727099003|261026121527099003|261026140227099003|18002099003|22082099003|16102099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YucznPZ0TzqRH25EU2WtLkLV2oN5x2c3LzkxMdXmyeAC7shkP9Y82jxV8D+1L0OTGbnE5MHkCSnQEZ0fzbvUSDlLooZjBN1zxBIrwYiBJh2ksZbACb7pelHeJrYNXiwgv+i96TtF7NkY/HqQ1E2jpBYPEUQ33vdA6M2CcbcvCP6wV29J7tV58F8Xag8Dfe1GYO7D5B+QSk6GD0V3voflKrdIzdQYADmmT35ZA73wOXKWiDyX5FBnL+T7y0KJ8ukGPW4NpF8ezgq6fRZ3E0vSErnP9RpK1zCGmdMh9qQqq/eBYGJ+t/yYN7rlJ8hJW/7wxTkAGRarNo7lfC2/sOfyhkr3vd1pLEFZyYG26S6jS6RFsOSBCziGwL5NggISshb+gnfd5Y7E0tEWHLzVfLL7tVm0voMb/Rtnv3gqNmLzolMeYwqyDMXYx98ECN+aMrA2r+YWlx1cg4d+G7sRimiwywPO+OJCYEeaO2eqrkYvYN91V7NTRZz/Kw5ZlnZa6k+4kL9tkQ4QlGVD+7F4+qMK1Ju89KiKTpP0uA+mW+TOGxxtgiY7xK+0PauQGRzPOQ7wK37EYLwc42IGXjgvzdkb2b6O8Mz3PWMpcte2HdMa8Ss/Xv5DJ+b9ELsYSGp0G601uqIreLOiLyxKsIOSKC0H+hOmwWM+QnFQcquxeK8/4R/rR16mIvzBTUd1RVkC9aifCok8HAeqjrfNsFzfpOrwOw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(61400799027)(82310400026)(261022105027099003)(10067099003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261102123227099003)(261021121427099003)(261028144727099003)(261026121527099003)(261026140227099003)(18002099003)(22082099003)(16102099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hebYClIb9TafTvlLj83KhcMtXvbLMS2kVJyW7c9cc7NExh4IXgLwNzFNAODUm+0opq2hgLCyIv4+2pv88hla/oTsasQcGrgnDdJ3KPiFZVeYLwVotmxA1exJ36mcYhwmPZnpOAmCALgr0+QwgyERG1OBCUiknpPESW3rgthvniTNqzedOAqFuaFp18DUD6KFMOC8sqhADzItuLJusV3KbVT7/eULol3xS3ZNLQRKE9nKxwwq79dMp52Y+UlhU7Z/DK4s7v4GUI7skg0cBwrC4K/uU3hIz+gQLOSCPedBI72xO2Eij/6y2Fh7kuEUVuDRpFjA4ytha4ht10N/f54F2PHNG0B4YuyVZQfoCqZLT/khtzzIEW1OwnwHR5dQERV9RugsEqcLG8Wm7GxtULGZsSMmRN+S/Ht1NXtRBc9WKc4DdWgZW3vfTIgUrZFojJRu
X-Exchange-RoutingPolicyChecked:
	bgP1gI0FnJvmgcOqTsBMGVVusZe9/85lk+q5xMcevw/4CgtoDL3xZRAp/syapqyw+MxTVASe3oh4U6VRb7Gl4AKUkB/gDiku5aY+/btz28XolFcj7C49i5BDJVccahEQuxkY78KLDQkLbtSZ9yo+kMm0TQlfHoUuyAHdndegPPHDzodP0MA3X5Isf70YulNmJ15F9M3f9y2BEYvVZyQIbHW/ukfnYy1ojXv1vgEIgk/VuMklhXa4+w4hO/nUaCsf9VmtP9Ei7MCfB4EGUEtPhScw3VcQ4AqlxeE7nKREK4GillLvcGMzwo7pa9JPrS6+HyYUXTqevuL7B+ehqTsQzQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:11:49.6573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbe0203-ea77-4902-b360-08df4720fbd8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF72AAE353B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX5bfas8DBlMi/
 biOcUj50e00+xcgvG0Ue3a/fzbq1PG0Tm41D2IqUAXwcaL7UcXl0qdO6cSe9oe4bwra/HNa5Z/4
 Uy7BsQCJEjSCllk+LUKFaA2HkpP+IOTWoC9BN1a4guB9EZtvXBqjMeaUerEFJx9oIsvZsvUK4tp
 xrY92dDLOG7n7FJmB+tAeJBpCdp2CNeZz0LV/xdK/28DC4BPDE8PCbZkR64pi7Huytuiv5VNkBi
 weOOIRR4ByyTp+wWFCdj2oUecJWMANuf5HQ5NsrbDkey5D+t5iFL6qxzo81at8njsf07TuWgOa0
 jXp7xsiPG83gtvOqHYU+d36HxNfR3SwV7rjOVOqgQD/LWv1xJWOwcEleOnbmj6g2Yo7oJZMKTcQ
 vgT5iXj26zBbzBJUwPk02Xm90+jxrEAsxUWB/h6XJ/qNunBS+k/5zWQuHmNM4il1U7SIGmMyolH
 OCH6hrD/PXdUzyWXblg==
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6b00714c cx=c_pps
 a=h3k+fpqimRfUez0hfxQzig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=pVWxiN6LJ3DPxKXD4osA:9
X-Proofpoint-ORIG-GUID: 2zij9mqqZr1lSLNP_-L6qZTnlKgTvc-y
X-Proofpoint-GUID: 2zij9mqqZr1lSLNP_-L6qZTnlKgTvc-y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfXwWFJxLN7EmOK
 YFnvWUTS0ArmnL3l3JCL3BJG6LF6xOofxuuv8cYvfQBQ6LX3GcK5ThmYA9IIwWedSW2ehAwu2YE
 N6W4e3XUJA5nCln9VCY7vEjj+/tOmYY=
X-Proofpoint-Spam-Reason: safe

Originally the driver has support for loading alternative firmware
types. However, whilst it could load alternative types, only speaker
protection was ever actually supported in the driver.

Remove this support to ensure that the firmware type is fixed.
This is preparing the driver to make proper use of firmware caching in
later commits.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l41_hda.c | 86 ++--------------------
 sound/hda/codecs/side-codecs/cs35l41_hda.h |  2 -
 2 files changed, 8 insertions(+), 80 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codecs/side-codecs/cs35l41_hda.c
index 1a192749c7b0..a0e2e0c5addf 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c
@@ -37,6 +37,7 @@
 #define CS35L41_DSM_GET_MUTE		5
 #define CS35L41_NOTIFY_EVENT		0x91
 #define CS35L41_TUNING_SIG		0x109A4A35
+#define CS35L41_HDA_FW_ID		"spk-prot"
 
 enum cs35l41_tuning_param_types {
 	TUNING_PARAM_GAIN,
@@ -73,21 +74,6 @@ static const struct cirrus_amp_cal_controls cs35l41_calibration_controls = {
 	.checksum =	CAL_CHECKSUM_DSP_CTL_NAME,
 };
 
-enum cs35l41_hda_fw_id {
-	CS35L41_HDA_FW_SPK_PROT,
-	CS35L41_HDA_FW_SPK_CALI,
-	CS35L41_HDA_FW_SPK_DIAG,
-	CS35L41_HDA_FW_MISC,
-	CS35L41_HDA_NUM_FW
-};
-
-static const char * const cs35l41_hda_fw_ids[CS35L41_HDA_NUM_FW] = {
-	[CS35L41_HDA_FW_SPK_PROT] = "spk-prot",
-	[CS35L41_HDA_FW_SPK_CALI] = "spk-cali",
-	[CS35L41_HDA_FW_SPK_DIAG] = "spk-diag",
-	[CS35L41_HDA_FW_MISC] =     "misc",
-};
-
 static bool firmware_autostart = 1;
 module_param(firmware_autostart, bool, 0444);
 MODULE_PARM_DESC(firmware_autostart, "Allow automatic firmware download on boot"
@@ -173,24 +159,19 @@ static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 	*firmware = NULL;
 	if (spkid > -1 && ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d-%s.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      ssid, spkid, amp_name, filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, ssid, spkid, amp_name, filetype);
 	else if (spkid > -1 && ssid)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      ssid, spkid, filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, ssid, spkid, filetype);
 	else if (ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      ssid, amp_name, filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, ssid, amp_name, filetype);
 	else if (ssid)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      ssid, filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, ssid, filetype);
 	else
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
-				      filetype);
+				      dsp_name, CS35L41_HDA_FW_ID, filetype);
 
 	if (*filename == NULL)
 		return -ENOMEM;
@@ -589,7 +570,7 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 	}
 
 	ret = cs_dsp_power_up(dsp, wmfw_firmware, wmfw_filename, coeff_firmware, coeff_filename,
-			      cs35l41_hda_fw_ids[cs35l41->firmware_type]);
+			      CS35L41_HDA_FW_ID);
 	if (ret) {
 		cs35l41_set_default_tuning_params(cs35l41);
 		return ret;
@@ -1237,7 +1218,7 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 	}
 
 	dev_info(cs35l41->dev, "Firmware Loaded - Type: %s, Gain: %d\n",
-		 cs35l41_hda_fw_ids[cs35l41->firmware_type], cs35l41->tuning_gain);
+		 CS35L41_HDA_FW_ID, cs35l41->tuning_gain);
 
 	return 0;
 
@@ -1319,38 +1300,6 @@ static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static int cs35l41_fw_type_ctl_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
-{
-	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
-
-	ucontrol->value.enumerated.item[0] = cs35l41->firmware_type;
-
-	return 0;
-}
-
-static int cs35l41_fw_type_ctl_put(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
-{
-	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
-
-	if (ucontrol->value.enumerated.item[0] < CS35L41_HDA_NUM_FW) {
-		if (cs35l41->firmware_type != ucontrol->value.enumerated.item[0]) {
-			cs35l41->firmware_type = ucontrol->value.enumerated.item[0];
-			return 1;
-		} else {
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-
-static int cs35l41_fw_type_ctl_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
-{
-	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(cs35l41_hda_fw_ids), cs35l41_hda_fw_ids);
-}
-
 static void cs35l41_remove_controls(struct cs35l41_hda *cs35l41)
 {
 	if (!cs35l41->codec)
@@ -1361,9 +1310,6 @@ static void cs35l41_remove_controls(struct cs35l41_hda *cs35l41)
 
 	snd_ctl_remove(cs35l41->codec->card, cs35l41->fw_load_ctl);
 	cs35l41->fw_load_ctl = NULL;
-
-	snd_ctl_remove(cs35l41->codec->card, cs35l41->fw_type_ctl);
-	cs35l41->fw_type_ctl = NULL;
 }
 
 static int cs35l41_add_control(struct cs35l41_hda *cs35l41,
@@ -1390,16 +1336,8 @@ static int cs35l41_add_control(struct cs35l41_hda *cs35l41,
 
 static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 {
-	char fw_type_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	char fw_load_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	char mute_override_ctl_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	struct snd_kcontrol_new fw_type_ctl = {
-		.name = fw_type_ctl_name,
-		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-		.info = cs35l41_fw_type_ctl_info,
-		.get = cs35l41_fw_type_ctl_get,
-		.put = cs35l41_fw_type_ctl_put,
-	};
 	struct snd_kcontrol_new fw_load_ctl = {
 		.name = fw_load_ctl_name,
 		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
@@ -1416,17 +1354,11 @@ static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
 	};
 	int ret;
 
-	scnprintf(fw_type_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s DSP1 Firmware Type",
-		  cs35l41->amp_name);
 	scnprintf(fw_load_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s DSP1 Firmware Load",
 		  cs35l41->amp_name);
 	scnprintf(mute_override_ctl_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s Forced Mute Status",
 		  cs35l41->amp_name);
 
-	ret = cs35l41_add_control(cs35l41, &fw_type_ctl, &cs35l41->fw_type_ctl);
-	if (ret)
-		goto err;
-
 	ret = cs35l41_add_control(cs35l41, &fw_load_ctl, &cs35l41->fw_load_ctl);
 	if (ret)
 		goto err;
@@ -1526,8 +1458,6 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
-	cs35l41->firmware_type = CS35L41_HDA_FW_SPK_PROT;
-
 	if (firmware_autostart) {
 		dev_dbg(cs35l41->dev, "Firmware Autostart.\n");
 		cs35l41->request_fw_load = true;
diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.h b/sound/hda/codecs/side-codecs/cs35l41_hda.h
index 56ec07c0bb74..6fea4b2ad0ac 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda.h
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda.h
@@ -73,11 +73,9 @@ struct cs35l41_hda {
 	unsigned volatile long irq_errors;
 	const char *amp_name;
 	const char *acpi_subsystem_id;
-	int firmware_type;
 	int speaker_id;
 	struct mutex fw_mutex;
 	struct work_struct fw_load_work;
-	struct snd_kcontrol *fw_type_ctl;
 	struct snd_kcontrol *fw_load_ctl;
 	struct snd_kcontrol *mute_override_ctl;
 
-- 
2.43.0

