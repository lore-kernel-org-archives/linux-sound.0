Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172697;
	b=GMLhaV4aGZLKbIMaPwv2zVi9CE2HaJV7W7LaFESNjR0DYTP3iOXY4bmar3WNiUFN1zLz
	 3qrW0W+VDvkcg3hzd57NIf2nzMPbTqBsxk3IlK9boPdQ8W6aB2G+uNHRUGCh1GxmNdMKZ
	 nLJV1u00aOGfyKnFLm4VdxxB+93Kc7qrP7T8wu1VZpJlqTwyXfmJDCq8pl15hlBK0wn95
	 5j2IuPAarg+kFbvXMOaj0vQW1+msdMesofnoI98AB5YLFqaFiWtv7++vv/usNjL1OYeWO
	 tWHmfs8KET3yeDVnaIVKFzKtuRCyg+ycLzTjogjwxjeBsq9QdbRGJ+27YVj57G8sx1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172697;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=42F+BKhssca/iZHJJRJgQl2M6JraEfyGsv89xu130Qs=;
	b=1wbJYgaod7lX9B4Lof2rH6p4NbQvtMjqqN+ijLhDHU/L7xh1Y5jHb5ab6ljAbHe6oIkf
	 VLWk49GuLBP4FOqlO/asl4lzb9JekQ1bDA0GO/UVwqIKnJaGHVPJkP2ZfMIgZhXhRJ3OU
	 IfEAdsqMNeSc8etwdI7skv0Us1JEwRA9qYJnhGgjRvr3T9nSw7LbBsK5vVUeMkbKAxm3/
	 vyIp4gGnLRpt4omMYkg0NfsH3LMoqoQJSUGoIzFdlv+D5y74GkM9ilBVcooPtNWEcxhbf
	 RdyoPZj0/HabBIR7ZfMCACX6bIyZBh5aQ7KqMIQ+o70zy4QoccuzyVSnS6lso7KLYFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=qvuepRDl;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=k4Nmyn+K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCCC606A320;
	Fri, 20 Nov 2026 11:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCCC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=qvuepRDl;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=k4Nmyn+K
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAidXq2615927;
	Fri, 20 Nov 2026 05:04:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=42F+BKhssca/iZHJJRJgQl2M6JraEfyGsv89xu130Qs=; b=
	qvuepRDlfZkv5fqQRRF73C/KoVgWLAZ9FxNdZfbliduTUI2Fw2P1szT6uWXfvQJs
	emYdik9BDuoVjhgOjLtgvP0dVwrIsVCmm4thFpjYh6qf7Q0DEVA8lfKjJTiBwkUd
	qM2FwJeUNPpSs/fdrFzQnH3WR4nabFW8AdwQPrgyaHL1Du4gPkEMjhbQs+YjnI2u
	d4+aqcpkduUwjIKfz32wcXHaeZiYL8wrOBSg8sxxKih03SciKa+SveootOpKYKas
	3PwW0E5K7LqPmr9OZuMLdJDGNSPxSOOk2j1aijHtleQn0kNHFGmtm40Dy3ofEj9o
	TflYLz+9GeqaBYG82nRwgg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021112.outbound.protection.outlook.com [52.101.52.112])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j24prhep4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 05:04:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFlVtKXchzJsKFa+t6frzP/f69bUxgi6nAIMvSN8A48xdORaHqbCzUMqtpw44aAC50Ul387oFLa6TYct1HkEioZswL6qDe5Q2P4WMx2xOcWyTWchXCHN4emEgmaVICz9Scr1T/Nxp3d13dMDMwRB+CVx4fZcFyC4bDncrf0Ltr50iW+4K9/yOxTo/z2OD82QAPt9QvrlZ9TW5sQh2LT1dAKVdSPk5tSvSC2Vx3Wll/xt0h4v0xFk//xiuhLEGe2vbKt+eYr3wjeBBrvxpaoYuTJ54HszeTclv1kXsa3KcfAbqpktDlQG8GQ0ovlI1v6sAXpLs2OMCfOhtf7oQrrENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42F+BKhssca/iZHJJRJgQl2M6JraEfyGsv89xu130Qs=;
 b=T1j+Nl6CrwoCPDIVDwciE8dkt4GDMfFPK22Ee6RMwRq0sELqEfEVGwmiC/JWf9iiSjVOkpxJLEnuDhHFwseXXI/uIdBVFGQGI/IBicY55hFk7ay0JnsoEZeyrDNg1QQ56nCteJVyL+PcR/vbstBniaIwlAar5cSGen7oAN1HhKWnzY9jI6ByEQHmxWqRKsGkh/aLPIzW+gQfow6t1S3AD6ivHbU3ujwXSdPfBIMVW81B5oEQqQ8Z/7z1arZc/cLIkV+yoVRn3Puh6KCsj+vfxXeLLo/FtdMHXlznnZ9xR/3pPK0SmP3JQ/Om2mMkbDrNKvdiJhkfmEPkpSZE5GFoHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42F+BKhssca/iZHJJRJgQl2M6JraEfyGsv89xu130Qs=;
 b=k4Nmyn+KYdLFG7xsLSuQIXdAMH5+9wDscG7AIKMIccGBLrxATtUFUvn0yGQc1L/xtRnsAqzGxnPozchQ3wYt49MT6dg+yZMXY4u3TGucuVd1en96lwXWLuFiIwOHBfnXhoBjEAwEMn+pMGpCjljFnBo9Qagkx1uQo1S6J0h46ys=
Received: from CH5P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::29)
 by SJ0PR19MB4447.namprd19.prod.outlook.com (2603:10b6:a03:284::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 11:04:45 +0000
Received: from DS2PEPF00007108.namprd05.prod.outlook.com
 (2603:10b6:610:1f2:cafe::2c) by CH5P221CA0005.outlook.office365.com
 (2603:10b6:610:1f2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:04:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00007108.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 11:04:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5C998406558;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 346E4822546;
	Fri, 20 Nov 2026 11:04:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/4] ASoC: cs35l56: Add test that probe() doesn't write SDW mux registers
Date: Fri, 20 Nov 2026 11:04:41 +0000
Message-ID: <20261120110441.2163567-5-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00007108:EE_|SJ0PR19MB4447:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7ed51f12-dd88-4cc9-777c-08df46f614e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|30052699003|61400799027|36860700016|82310400026|261022075727099003|11063799006|261026140227099003|261009223027099003|261021121427099003|261102123227099003|10067099003|261026121527099003|261022105027099003|56012099006|261028144727099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	IZ8l8ADL27tcu+zZvSuCm2If0h/FpuLox4gv910TyD59Ffhfe815Eb1e7IBW/7z3CNqkQ2WA7LTfwzsMSC/V4aWX8ol++u18tJuK3qfIfzRbHo1zXlEQgGmx2/hYoGc0K2oUwO+awp3X/bbguy6E2LjTSMMZVjyRJKqxSnX6CHwVNWPuJnqIKdoZEmGaWWSkfu9+GhmlClHciDnCIQL339V8b9Cm+vt1nOtlXbyIqOl0T+hr1KfmbLHHIoTI3epUALldhED5Bl3Hbx1ojJQcyfdYaHYWnAEthROk3HEBU6npAcslUXidSRuTv+kQKtUilBzr3TYxtZq8wtGMg67ZbVQcLcpE4jsVfRbcORV9ina31XT1ZLwzHrjMxtWN2jvpASNUBdh9LBYOgDBQZPZGTPZqYkdAGFMKMVEOsax5A6etHh2Ufw3kwiEcXRlw7Q38TdqZjORkejB1162dfihVIHdJjCt0JLwmg+QNN5rhrGxdVH3PyYmPMs3EyRUNqH+6gYKkerUeXiEh8YLgEXke5EIOSxM4CAlyft5oKRmfJv99RnE6eo1gAiUax4NKtCa9l0zRSmy2BcgVm/sbrLmt1odnwlgFSTKDIcHFU1XtSf0IPZCG2CSaz4k3WznwtN62DSjcLkt7uUtvSCU8cVknwjcBBpwvChxfWDTYWvdP6SHi0+mJqVljE8BtUa1BSexfsz6+iN0u2OrCuvSaYsq/rw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(30052699003)(61400799027)(36860700016)(82310400026)(261022075727099003)(11063799006)(261026140227099003)(261009223027099003)(261021121427099003)(261102123227099003)(10067099003)(261026121527099003)(261022105027099003)(56012099006)(261028144727099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RLGBalYtoxHYLd/rfwCi7zrIxgJVVe5M9UIFKS/sd1izS7kx0kXZZJHIVCHjIEYHS1jwP1TC1B0YjaYA+5m+E9WtuVu+PDrEWdHouF1+rQkGKNKzE3hnl2UZnN2wg3erYwwWjtK6jZ2d2AEKeHNxxL6Z7v6gwUe5lw+DeK6935n+fgsdjE+A5qrEw4le6Xg2kkOfeL9ccUQTGjanTLZMVL+HLLnVTVHk5dHyNt79WOz+qcQ9kDWJ1U8B4CUIYpnV3jlUUpRqPhefWvbc6jGGLiYTLcLai6UHwk8ibvE75AcJszrunvp4plk0qXAuv0VGarGJHJASaPURpluaxOL3YVm0vThPJ5DuOK4h9o4vbe+LEgmaHuQqnw05TIHWyehxDAgumTJNpIXeLl/jvA0H5k/ts48+TPLwxK5gWJG0cXLa4dBZaajAx4VGnEGIx0TI
X-Exchange-RoutingPolicyChecked:
	DtDcE4Gh40zVnpPaSrYugeNnMcQ8/4LTt2sez9XOsENgwisAjeCVP5zZ26Xt9FMfGcKWp91dGQcoFUZfEfnWwsTiVsciQw5e8cK3qv2isNca9BxModN9d/dT77eqDIGD2M7aFvGU5BhphZ6MeFtVjANqWGkitHrMjomQyYG6CGdwWqrrvJ58TXyETJW5nwm3nSS21ypOIuvw7ZApEojV/VZwlriNLCjsKjfyjl0iIRXA7Q09a7JbKmvJgMoDPek3tS6pRkTy5OL6p1ka0YKWxQtKU7zI2i78/gugSJAEbNElKTY9jzV9sM72ltCNd6rwiN1bgAThWVPaLvL93n418g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:04:43.3871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed51f12-dd88-4cc9-777c-08df46f614e7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00007108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4447
X-Proofpoint-GUID: HIhtiXAjvpgcxsKWV9f6ntwPGYEKhF99
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX3StYo5Q0Gsiy
 9Bihny4muOXmKejg604IIU5sC1yQzguToFiFWOrlaS8LOmnBymf0M1P+QFgvWDmQCgoW7o0ZUni
 IpkaQn0+qi5MjqV3Q9gJf0l3anw1jpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX1MCFrxApmylx
 VzvEywfBbfil0Y8oZkWZLuL8t0eJpA9WB+vjTqoOjybiVYHnZDgwjs1n9P5EZLYsZc5KP3n5Qry
 quFej+QkzkxhNZlS4ObXuRz/Ad/uUO/l0XFpCQiosDDcOnOn/hpqA9C2sGeYHgLjfZLYXWJiM9G
 SbQi6t27w9Y5xdoooJTWA0XvncPlac7dpN5nkNXcVTubQf0/M0483vd0ZakWCfQmqQwO5EJ3eG6
 p4Q4SRcAOPg4kQkgA7UCSA8JqrwKpXoSiPf4GcW+L6DecE/W0J1pRLwQCRUGjKO8XadIajF+oVn
 bvhjyKcXrnsx0+DVJXw36ZTPRYACR6z8nSkHnbx9IfOOudfh/LEbX88tBUYR+J0W76dvlsNooR1
 v783Bc/PDGviIqyY0bhU3ygk9saLTtrCdtlB/W/tnkzjFKYXa8qgjLceQkcajVK7kA5y7h8p2iU
 KbR+qAIHGZkWrXJcUIQ==
X-Authority-Analysis: v=2.4 cv=afr0Dhot c=1 sm=1 tr=0 ts=6b002952 cx=c_pps
 a=mSR/hpqHDdeL9wXJcf1Q7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=yhNiKUgXxidkoSnXdJ0A:9
X-Proofpoint-ORIG-GUID: HIhtiXAjvpgcxsKWV9f6ntwPGYEKhF99
X-Proofpoint-Spam-Reason: safe

The driver cannot assume that it owns control of the
CS35L56_SWIRE_DP3_CH?_INPUT registers so it must not do anything
during probe() or component_probe() that could result in a write
to these registers. Add a test case for this.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-test.c | 84 +++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/sound/soc/codecs/cs35l56-test.c b/sound/soc/codecs/cs35l56-test.c
index b422d19ba0b2..362da30b949e 100644
--- a/sound/soc/codecs/cs35l56-test.c
+++ b/sound/soc/codecs/cs35l56-test.c
@@ -63,6 +63,7 @@ struct cs35l56_test_priv {
 
 	bool asp_config_regs_written;
 	bool asp_mixer_regs_written;
+	bool sdw_mux_regs_written;
 };
 
 struct cs35l56_test_param {
@@ -124,6 +125,11 @@ static const struct range cs35l56_test_asp_mixer_registers_range = {
 	.end = CS35L56_ASP1TX4_INPUT,
 };
 
+static const struct range cs35l56_test_sdw_mux_registers_range = {
+	.start = CS35L56_SWIRE_DP3_CH1_INPUT,
+	.end = CS35L56_SWIRE_DP3_CH4_INPUT,
+};
+
 static int cs35l56_test_mock_registers_read(void *context,
 					    const void *reg_buf, size_t reg_size,
 					    void *val_buf, size_t val_size)
@@ -200,6 +206,9 @@ static int cs35l56_test_mock_registers_write(void *context, const void *data, si
 	if (range_overlaps(&addr_range, &cs35l56_test_asp_mixer_registers_range))
 		priv->asp_mixer_regs_written = true;
 
+	if (range_overlaps(&addr_range, &cs35l56_test_sdw_mux_registers_range))
+		priv->sdw_mux_regs_written = true;
+
 	for (i = 0; i < count; i += sizeof(u32)) {
 		val = get_unaligned_be32(buf + i);
 		ret = regmap_write(priv->registers, reg + i, val);
@@ -929,6 +938,79 @@ static void cs35l56_test_component_probe_omits_asp(struct kunit *test)
 	KUNIT_EXPECT_FALSE(test, priv->asp_mixer_regs_written);
 }
 
+/*
+ * Probing the component must not write the SoundWire TX mux registers,
+ * either directly or through a subsequent regcache_sync().
+ */
+static void cs35l56_test_component_probe_omits_sdw_mux(struct kunit *test)
+{
+	struct cs35l56_test_priv *priv = test->priv;
+	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
+	struct snd_soc_card *card = cs35l56->component->card;
+	struct snd_soc_aux_dev *aux;
+	struct faux_device *card_dev;
+
+	cs35l56_test_create_mock_supplies(test);
+	cs35l56_test_create_mock_device_registers(test);
+
+	KUNIT_ASSERT_NOT_NULL(test, priv->regmap_config);
+	cs35l56->base.regmap = devm_regmap_init(cs35l56->base.dev,
+						&cs35l56_test_mock_registers_client_regmap_bus,
+						test, priv->regmap_config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cs35l56->base.regmap);
+
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_common_probe(cs35l56, 0));
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, cs35l56_remove_wrapper, cs35l56));
+
+	/* Prevent real dsp_work */
+	INIT_WORK(&cs35l56->dsp_work, cs35l56_test_dummy_dsp_work);
+
+	/* Simulate first attachment and re-attachment after the soft reset. */
+	regcache_cache_only(cs35l56->base.regmap, false);
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_init(cs35l56));
+	KUNIT_ASSERT_EQ(test, 0, cs35l56_init(cs35l56));
+	KUNIT_ASSERT_TRUE(test, cs35l56->base.init_done);
+	flush_work(&cs35l56->component_register_work);
+	KUNIT_ASSERT_TRUE(test, cs35l56->component_registered);
+
+	card_dev = faux_device_create("cs35l56_test_card", NULL, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, card_dev);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, faux_device_destroy_wrapper, card_dev));
+
+	/* Bind as an auxiliary component so the ASP DAI is never probed. */
+	aux = kunit_kzalloc(test, sizeof(*aux), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, aux);
+	aux->dlc.name = dev_name(cs35l56->base.dev);
+	card->name = "cs35l56-test";
+	card->dev = &card_dev->dev;
+	card->owner = THIS_MODULE;
+	card->aux_dev = aux;
+	card->num_aux_devs = 1;
+	KUNIT_ASSERT_EQ(test, 0, snd_soc_register_card(card));
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, snd_soc_unregister_card_wrapper, card));
+	KUNIT_ASSERT_TRUE(test, card->instantiated);
+	KUNIT_EXPECT_FALSE(test, priv->sdw_mux_regs_written);
+
+	/*
+	 * Flush cache to ensure there aren't cached values for the SoundWire muxes.
+	 * The first case without regcache_mark_dirty() tests flushing when
+	 * hardware registers have not reset, and requires a dummy write to
+	 * the cache to make it dirty.
+	 */
+	regcache_cache_only(cs35l56->base.regmap, true);
+	KUNIT_ASSERT_EQ(test, 0, regmap_write(cs35l56->base.regmap,
+					      CS35L56_DSP_VIRTUAL1_MBOX_1, 0));
+	regcache_cache_only(cs35l56->base.regmap, false);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
+	regcache_mark_dirty(cs35l56->base.regmap);
+	KUNIT_ASSERT_EQ(test, 0, regcache_sync(cs35l56->base.regmap));
+
+	KUNIT_EXPECT_FALSE(test, priv->sdw_mux_regs_written);
+}
+
 static int cs35l56_test_case_init_common(struct kunit *test)
 {
 	struct cs35l56_test_priv *priv;
@@ -1233,6 +1315,8 @@ static struct kunit_case cs35l56_test_cases_soundwire[] = {
 	KUNIT_CASE(cs35l56_test_set_fw_name_preserves_spkid_without_onchip_gpios),
 	KUNIT_CASE_PARAM(cs35l56_test_component_probe_omits_asp,
 			 cs35l56_test_type_rev_all_gen_params),
+	KUNIT_CASE_PARAM(cs35l56_test_component_probe_omits_sdw_mux,
+			 cs35l56_test_type_rev_all_gen_params),
 
 	{ } /* terminator */
 };
-- 
2.47.3

