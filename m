Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39D386574;
	Tue, 14 Apr 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153189; cv=fail; b=eg2+L3mOgmytHO9niOXh95q4P74qTEn4c+EYXOSPCCvrHUochwSCk8T59DVWqKazjGloYD/hTDpuf+phwNXF7g7bs/64z+bO6YZDb9br+6FFevsmdKhtjwKfpUEnpo8TA5vzYHXCjkJ25GR1b2pV80FEFH6LEsxSSW0W0wlLT7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153189; c=relaxed/simple;
	bh=0SsNzYC/oU9DkMhYgksAT0GwgrpkPFtsbdy0MTbxzr8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QG4g5MAvQXRB1ZvvMo0Qs+Vmn1o9EnSNnQJrID4E+XUhCmqq0pX0g1Q8eWRHunG4sSHqh//yLCxP7yetXGJbH2Y2MZ1OhsoG2ccaoRIsouNz4XvwBcfECA/TN7GfC2YQxbf+D1y+YW63AuSV0hzU6WgRAxY0Egcak+Yp0g6RiIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=toUSfWj0; arc=fail smtp.client-ip=52.101.48.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="toUSfWj0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4JqA1A9R0J+q5hqC/7dPj8rv+ioBJxfcgEw5uZU7ynVmuQpeKBiN6PllW5Xmq0s0alXjawgu74QKdoduHqWS2S9MzbEB6FksSHVB8x7cSDz+mrfyDzqR3mHN8FVg8ndQ0f1zYDzETLqNhV9K4rW2/FEBVcAX8uD+y54UalgQTZrDsDDjrlQokwZSu4rlEy6iXJ1ycs5JusIHUy6no/IUO1oupi7TIEcJfzgJBu+FoRjPvVNzoFLhH3pTsZzu21MhMsfO8/V2AXGVyuLoF1KEUteguKNv9ge5wtHkNI2cB3pArTP4hDpFQFCDQ1Byy66xhvuKInemTtHHYGfEwhtHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmzqKXN/bsU54SW2AMPdaZavBB1MKBbXsCXCRcWUdng=;
 b=imdwscpJuyEDyKP/bCQZGZ1gqvR0nPWq8rQ1jIJW4aYxieQt5UmcmuaK0xgX7K1pfZn6jG+mfD0ojwWbVF+QqGDBTplQvrFKREKEetf1R6VGoCtQ9lu0lTwmkB0tDP/ng3EGxBl952idMiS1uFcTE4gVMm5+TC25jpgdPICUWDyhWE17M994yPx7YjLMmhHqcNvs/tv8hKHi+Wqd4oin0J/KhhBdKlJi0mugp8PUVN0P8d/lF0QdtwzAT3y/gVI8cl/R343tpO62lxyeABXl0h3PpujZK9iAx6y1w8xJjtsKiUoDqcOiVcZxbHk6+icVXRCv1SL+NRKFpH9NimwE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmzqKXN/bsU54SW2AMPdaZavBB1MKBbXsCXCRcWUdng=;
 b=toUSfWj07sn9pjCSFKZ5GKvOcsgaw7xjojA2hyTDiKNHo8i7xA8qw1kSb622o5qczy/QeEMsjYRrEixoTuGeNJGJKWF7WRhF2ZtgNSbwUVIskQOEyhxKIeGvZYMte8rdH4TaPU+y1hdY91l105dyRs+vpLKr0/VTJyAaGqtxTyQ=
Received: from SA1P222CA0048.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::23)
 by DS7PR10MB5117.namprd10.prod.outlook.com (2603:10b6:5:3a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 07:53:03 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:2d0:cafe::20) by SA1P222CA0048.outlook.office365.com
 (2603:10b6:806:2d0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 07:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 07:53:03 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 02:53:01 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Apr
 2026 02:53:01 -0500
Received: from DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe]) by
 DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe%7]) with mapi id
 15.02.2562.020; Tue, 14 Apr 2026 02:53:01 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de"
	<tiwai@suse.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "13916275206@139.com"
	<13916275206@139.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "Yi, Ken" <k-yi@ti.com>, "Lo, Henry"
	<henry.lo@ti.com>, "Chen, Robin" <robinchen@ti.com>, "Wang, Will"
	<will-wang@ti.com>, "jim.shil@goertek.com" <jim.shil@goertek.com>,
	"toastcheng@google.com" <toastcheng@google.com>, "chinkaiting@google.com"
	<chinkaiting@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add
 TAS5832 support
Thread-Topic: [EXTERNAL] Re: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add
 TAS5832 support
Thread-Index: AQHcy7G5aC0N0vFlO0alfVyP0ejCm7XedCgA//+7iUE=
Date: Tue, 14 Apr 2026 07:53:01 +0000
Message-ID: <1007c8b9c0464df2bcade184713e105b@ti.com>
References: <20260414015441.2439-1-baojun.xu@ti.com>,<20260414-zippy-caterpillar-from-lemuria-7d70ac@quoll>
In-Reply-To: <20260414-zippy-caterpillar-from-lemuria-7d70ac@quoll>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DS7PR10MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e9020e-53cf-4ee6-de69-08de99fadb3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pogvjJLI/qdMITq/W1ykPvl1kJcp1yjABhkuW/b0/ndSTEqRv8DyCagEmngcnYWGu1Q63apzAsG7yp1GZmv6NCrulGroGwfdstFkLKzO31Og5Cg2mxbkAsITqasIXYG9TTPR+ux/kN+2EpfTfdBbNkj0ElJF6huQqHlV/0i0H9YRuhXk09mjMt5cguduDOxUQKIWO9Yn7EEIlVShGqi7chh7lpEjiDWWmqDsuVZc9XzpD0ITNKr04Ow4rFebpL4SV/8oFv7kjLaPlBuCPGtgG0hY7bJt5Q5a6UNrKFOAinJdHb733WEHW989FS2TzXJOdMhF4uoXjB/VRB8Yiu1z8NNM99hKtXhRZ08P8gPjkYD1rMX1x8KdJbr2LjZ5ozztimWf9UOVGQVzQk//QrgqDnP/8jNdlepisv+1tasgJ1l3JWF+jUmidgn/D1igo0x278ou//5XeH3FcHgJL55MjFC8zJr1vXdH4fu1lGnOxgQJQjDLG2u3O3+NU4Nfk8Pu8x99goWkR3QxIUVmLRzyyeZtbNQHeyiCPFx23P0nAmb3Feca/xZOrNixG5wiTZDeOTSkJsL1D6c4jy/sUzDjMTqzEvYpy7z6gbadRen81y6C7bP17qZt6+s6tttsWuMF6PLj6Q7ByZ3Bwy//3UyoRAteue5VPOqFSG3UepLjRFlmRv0TSzIGdjOA78ZrNza/sv8zTt73+OcWNiOUP+X29n9hEi8BG/IuJDFixfaE2Mlj38g1uxdzD9WcVT0Cz0BgmmpGjmfqllFrzedKJXpFBA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zGexp8nMeurC5Bki0/ly/Rl4oup+OmMkBNdAkWJ6SDPjWn9MFPMWSYnydLyCyLpwCSgKTKN/wWUAKm+oIiZ9gr29YcbF3+/wlJtx630H9E7OPjoNvnVkuRYl+DAKVrttfx6uzSbqD+MrXeCDcRBQvADd0YwdijpRIfI9L8ccoCQT2uVsA7MHkOF+ooQPH6TufZ7a+B4QZP2cmvaFFb15j5N0ChnO8HhHxBUTdQST8AusR8/R1kVUm1XZwryKd9dsPmScgHBj0ZR8uXoMDc9J/UdK/FnBmVZpkorqi/A12FL8AXtA5+GZN/6aM0AAydS+qDzFcqHlBalCFhGSW/eo53EW4iLq+/NqdthKv+dEiO6rb9OjddrLjgDBia1KQFH1g7p4A81s2WVvMZdR74N6G53j/6o6wc5DA/u65vy2Y9sz3nU0k5heGC+CfXdyODgr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 07:53:03.1322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e9020e-53cf-4ee6-de69-08de99fadb3b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5117

> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 14 April 2026 14:56
> To: Xu, Baojun
>=20
> On Tue, Apr 14, 2026 at 09:54:40AM +0800, Baojun Xu wrote:
> > TAS5832 is in same family with TAS5827/28/30.
> >=20
> > Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> > ---
> > v2:
> >  - No update.
> > ---
>=20
> So you are going to just ignore review?

This patch was reviewed by Krzysztof Kozlowski <krzysztof.kozlowski@oss.qua=
lcomm.com>.
I has resend the patch with reviewed tag, please ignore this email.

>=20
> Best regards,
> Krzysztof
>=20
>=20
Best Regards
Jim
