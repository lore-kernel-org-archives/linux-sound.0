Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37EE2868B4;
	Tue,  5 May 2026 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978296; cv=fail; b=K+vP60bJex4Rk/UpWGrmxnZuK4fb9AMOjeGcZl7HoYnvenc2oEd/QVf0tcvvCnU84arxzeYxK6ksjRvWy9DdI5NVvW7JSAXS3wL+R4cnETorx+ca8oxzr9Kzs9JQzt+vIb15Bfs40by6WpuRNWZ2TfO7SzUrPED4OwL+yJO9NaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978296; c=relaxed/simple;
	bh=FHop5bV0BDv9Zk3MiUEIVSV2X3Ypk8cY0lackbb6PIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bbTPNn4jWqwisHX790Anwe5TczppJpeDH+whEBndkc8Qc5J3cMY62+ps7s5V9ISZKRz2SP3razacKc9YxNgZ5ppcviUBhyGXTdgW4/73Iq2dt/8iTzW7bLFNT4fa7G6bgiN1/WliPkdKJz0N+QW87yTQpilA05A68gXxPrwOPFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DjCibcuz; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Pvi9Duzq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DjCibcuz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Pvi9Duzq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454H22F472333;
	Tue, 5 May 2026 05:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=AH/OQx4gcpmPKwAU
	3zKYxHWNQaXhdhJ7iInzg9jaiBk=; b=DjCibcuzbSwiyevm8Bgpm/M9RjLv+RdQ
	z3UYgaIs/WL7U63sgVyWvkGEZQpJt9Kz4HP1roVaQgZolkKYZ7u+Mbx1i8Zi7h6H
	TyczJtR1Wkn52e/uZMXxBpYN/VmKJojoBUMHmTXq7Jo2jsIE6H8oUQ1evq8hoXCI
	AD03k+20ytuDu1e70YAFfXEGFow+25O3u+kz9vrjMB9D6pAo0LUXkt0MXFbSmLRz
	RZRh/qNir6ccZLG+Z7C/pVfAtlkSU32hgHnBqak0TB3T9XgimcFx/SPMvyt2NrXK
	SRDrRfW+WHtufx7ZV1Sul/ChS1GzfvBipAd6VffJmfba6aXYoIxexQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022073.outbound.protection.outlook.com [40.107.200.73])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk3k7f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 05:51:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJn4ggmw+rFckumWKarAGw25mOkaWiKHjjVKuvDFZ5NJgF1Wp1JJ+KZ2x3zEKRTzGlOW9AIWH8IvAB+SQQwpCK+dhwirVwgf0V2tnnq65rb7X+tXPegSCpPBH/ZAXJd49IXa9VPF4gnr0CK0YO+5V8wjl6zRTAE1a1JfSeayuHuB5BPt+kvtFlhY7KkuxymN2/0orvQdG4BOdQuvJ7V3AtZ/OF3db82Rz3z53qAGgshxrESWfAwqAVWdC/pbhHlDcpkfIUkvSlxjo05lHpBqbxZf8nLOWWNZRL/QROMZ7T1XGChhgL6o0Cru5RktPvWZ4TmOcbuuQ7FDze9TOjzPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AH/OQx4gcpmPKwAU3zKYxHWNQaXhdhJ7iInzg9jaiBk=;
 b=yhPP/PX+5sf2pDtk8xeW1+CYSZyb4lvESyaKsWlXg4naCHRTWEVdnHgvgVYFYMR9JoHLmYRnnxzo70VuRI+x/cd0yLAQ6S5HUq6x4qxaHIMRLdHlxTYsNaPxpu8zvoGf50zZ0jYi8TjuX1cF7/t9rmbqAWai6fOLBer0EUT0a1MBJsNd5cM5w4Un83AHlWoQusNVtTBtlntSbjUzhzIjsJFHONvFNuOyPCu2nSREk297RY1DeYJSba/Vpsmdqflu81jocdEsSP3/tf3GYmuOR1UGuEWDroEmz6K5qJluC1ijEcggKB4CwUIpLZ1PtqPT6CG1Ecwvs/jOwBAvT1VKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AH/OQx4gcpmPKwAU3zKYxHWNQaXhdhJ7iInzg9jaiBk=;
 b=Pvi9DuzqvZquLXkARaKx+JF2J/NZ0fSgCItO4MrDyjTaEpXMZgEzQKjaK7WG0s9r1EtWCYVcb3mjqLRdjgcKeWuUHJK94R5cM9a6NFRU39ffx0L3Vigx9OsmzwDyxxvWWi/1c5vjy7FVJtiwD1VbAD9pWxJG54Ez98aPp06IhfY=
Received: from BYAPR05CA0093.namprd05.prod.outlook.com (2603:10b6:a03:e0::34)
 by PH0PR19MB5362.namprd19.prod.outlook.com (2603:10b6:510:f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Tue, 5 May
 2026 10:51:26 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::7a) by BYAPR05CA0093.outlook.office365.com
 (2603:10b6:a03:e0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Tue,
 5 May 2026 10:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 10:51:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3768640654A;
	Tue,  5 May 2026 10:51:24 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1E9FF82024A;
	Tue,  5 May 2026 10:51:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: wm_adsp_fw_find_test: Fix a couple of bugs
Date: Tue,  5 May 2026 11:51:21 +0100
Message-ID: <20260505105123.3539778-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH0PR19MB5362:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5ffadbaf-ea45-4386-e52a-08deaa944141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9gZoRSxiEmr7Z7BUgI46KrKzWZzwJOXS8KvafL7jRFQPyIZsdaVcvyAEu8PUr2qVSFInZvEaiY4HQEmyO2rilg5WtN11JA4BiYRVtt4lBcTrgPmcY6vqMH59/ALqMqlbphCbbo+s/zHH5POhimX+u+cTgZcCyWbY4EdyVMGr/AQaz0P3u3opqIjftsSJJ0i6D2oQKtw86MFrPQNp31Zltx8irH/SgK0AAmYshCB5Nh1Q9DtCJG8P8iAqd0GSGhaO8u0V1acL1yiNnJdFq6Ysz9h4tbHVSLtKxmTrs7f6e07SbkID6Pvf8UdP7DUh9gjn6DcjVZseIBiwnxRRJFr8UXUW4y1k2OIB6B6PlqSjkZVGevUwuMmVkdw3Ny9vbR2l2ucKTtgL+z/PWRaLKXcoAbrOzChuipwjZ3/i3q5Y4zowWav/BtKNrj/Naj5yfmRaFKK5tGFD25pEIVCoOlhg6wv7I0O3EYa1Pk9swjPYPhdK7+4w+ptZ19HNs8WA+PnOQv4eLgd+wAmvGuDoQvz+I/5n8DxWDEY5A9Yk7cO3+77psXPKzoZANQ+f600DUpMTQ4Mp9LzFWm6GkXXXEzZnqOXrWorZWiQGAEhFeqZyFBLUyw05y/MuIiWKZMuAXdaKT4FoiTraUopk8UUKJAcylbTL8ruMHs8DPZMqS4fQdgHPgdZLXpgL9n6z8WiMOijbmz82nOHOX7qwyRADD5v7kQ8udeZWSUCVBeo75InoAm8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wlaNj5FxZmBCn5cY8U+PxS5dLdPBIOPdvaW64POc3eP+Z6kWeCuKP3HOTO/LfWdpKerHWUYq54xJToX852cwonlzHLpvy099h4AHcM5CLssPIHgzvj4I14mgN6NhQXSDtdbnF0Gs5MiNtNFqJI7NQwlZ6GJcD0N7JaVJlitOjZadbG2sdZ2g1cGQVEnyCeJumLGenyxJvQc0cnSwaK7j/iVgqXIikdFKOO6wDul6wmGS4I/2favMx8JU6fFzpVBr83VZiJfMd0j8ChfLhgatoOahZ79VNz5Q9sUf42Qu4rjAXAG5VK2c/urHNduEzPN7ErG9UakOgH+r72xD/dxB6u6ey9ug1RMdhTRagO/sfr4bA8fU3vJxCsp2Bv5FFKx9Ozx70p1EqiAgFGTAA1cFyajQnNNdaWnw7KD3Ih4lw8B0bX+6VqE3MSEcbnu942PH
X-Exchange-RoutingPolicyChecked:
	RXIo6/xcVb+zeGtOjR84dkFPZZQ2KRt/vXSpJFua5wqXBUnw6tD+PvikRPy85cSjIa50mff/+YVqvlWJRsHYog6I+AQKcbvvLUC28o6h/dAQnqFCBONPETq0pKVZjCacQEdhQfuHP5mzddb07NcpyP88LN5Ggra+gyH0QXvu1kD/NBRsF8SW1Xu06o89m7yTOo+aiS0dMw6jw0ogBy//jXZnnhgYkzAOOhXkbl5G10Xb/+Pw55rUL4PToRGcWj4/8vX5ZYWU3cHoJlTdWohMO0fbWkQ5A1S/KBwIQdHGvs231XJqsQjsi+raLEn/7KMzU9vtwkoqErT7ROfQq0iMFw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:51:25.6556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffadbaf-ea45-4386-e52a-08deaa944141
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5362
X-Proofpoint-GUID: vzbBl8fzCI8Le90f8TRjbNNpJG73iist
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMCBTYWx0ZWRfX+uK2Nql6cfyg
 ADoJ+FiQV2aty8EbXCafGuOHz69apSrJrFyfyLKPbMuKyw3DEthQIe5ZKJUldXtMNBUikYmDlSC
 /tA0MYikX5CyNtSybcdoa2zIg030diGkxpUCzXkJdpRcM3IFyY2Zd1L8IKDdIv2bxMYS0owujFB
 X3/luMtFoV6xF6ZrDztOWkOjb4Qkt83ZtxRz6OjLB0gQhNkreIUB/R5WysMWX3B+s0UOfpEvrQb
 /xOP5ajR+ABms4pRpyXpQA1pVwgsTxlXDtkr/hsSlj1wkgvFoIrK2vT4bU4MzqwDAWcFKCd3RM5
 /gpcIb2xrFPq4yHGAYYzyIa5q/cTA5tXJKgkxnjeX6jQnTDtdJiujgHcAjeUAYnniWeizx6L2Cw
 17H/Q7RKxUzC2XiLsQQzE2Tc06RCiLHP3gIKMmzU1Ja6jgZp76IjkGvqQucQxQ1en7STgZEOPnc
 bLrSMfwYaIJ9+BDXopg==
X-Proofpoint-ORIG-GUID: vzbBl8fzCI8Le90f8TRjbNNpJG73iist
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69f9cbb3 cx=c_pps
 a=mhBramkM2YKFwkQI7AGxcA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IauIhTJ3hscmUiMq6icA:9
X-Proofpoint-Spam-Reason: safe

This short series fixes two bugs in wm_adsp_fw_find_test.

Richard Fitzgerald (2):
  ASoC: wm_adsp_fw_find_test: Redirect wm_adsp_release_firmware_files()
  ASoC: wm_adsp_fw_find_test: Clear searched_fw_files in find-by-index
    test

 sound/soc/codecs/wm_adsp_fw_find_test.c | 57 ++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 10 deletions(-)

-- 
2.47.3

