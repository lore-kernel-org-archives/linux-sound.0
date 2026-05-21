Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818123C6A5C;
	Thu, 21 May 2026 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364470; cv=fail; b=SSeWPZakdUVf/GP76jwF/9wJ639UiOPGQt90jkQ9hUBnaZWF8fBZu4KmjzwjhCVj5c22noUolOrCRRblj5JrvMFfHFCxLUvTE/RqAsn1i2YyEfvD7EJGSn+Y/FHU5qt1Kacb2Z6SQft1x/ofvWdeRti/CBdMu4jhxTLIZemFhLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364470; c=relaxed/simple;
	bh=/5SJKNKhXtvN58ZdzECVXXZzD59qexhs1BzBunyn9M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kq4Leg0D7STTJwKq7BUZV8k2Tt4MWA14CyD5W6n4dK8Ee6Z6WCU3DZbnN+MXHcZqkWbqQ2lqVGS53WmOSGxjCRoXvkIMQ3us2A+0UTctaJE1LeBzg4yXpaQFJ6CZlhwIIgNcG/aUBOAxFLXdwmIaNXO9RiB/pMKMaBhCZfjG5p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MM6msbnf; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=J7hkd8Au; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MM6msbnf";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="J7hkd8Au"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5j7P82907624;
	Thu, 21 May 2026 06:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=GAhzFxsVFqDyqgKq
	A5YxWrtMLcn5W1o9UChPGixN2ZI=; b=MM6msbnfRKSEYNkQ+2j5tLxuZOQPUJoN
	Y7BxQOPW3HSaF4LSbDCsLu7wHI7Ftm6fTzit3/PA/O7HErEHWV8kVHPKaTiUKVi4
	tFB2OkPXeuFUKOB3+eLJSbDu5TspYi11AWTQwZGRDgJMICN/h1gc9xy2UjXec6Xu
	0h48qQ+8f2LvPAYVbkZMXjl0uvXWDP/OWAW54ji7nKdyErt/ZPil/LgBCG9DKwNq
	PDXPi9dsW5hTnghafB8x3DuHljAHijTZOkC/4Ve8N51ImmIAye8S9ATst2ibpP6m
	ymWpnL4kf2ien8pX9kTnBnrJW4lpDX1ydXTwXNUHsU6k76O4VISyZQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022127.outbound.protection.outlook.com [40.107.209.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1jahr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 06:54:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwEi+VP2OusKnwC70Qf6Xq6PkDNadPhkmsaabiiYR76SRE7PUh0dyb0ZrQXFEZbPSW3g++LQAeFjsLzPBjnxtwyvHZzp/Erri/t5hngagdqxTFKJ3akpjXQCyn2YYeDFL9xirhTKWuNaK87tt87945wRetYd4bTjeIbPbGYJZ/69UDsxpc68jkmDs9S04m56mrvU1vXVIEKit+re5RefXt/r/nzsuAF3lG1VwRD/ymJ+0KTxsqN68SAKpD7Y9JQ6BbhXL/GokaIXkKh2LMgc69lZ/CXc+V1iefJP0AATPNS0sLKceCnHPues8iOMoIvwi8jaDamuYBC4Yps/811g4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAhzFxsVFqDyqgKqA5YxWrtMLcn5W1o9UChPGixN2ZI=;
 b=XipHr3yxn4HvrW1Yq5EJo+jaCSQavZvyfljGkd/ICYI/OeI/gDJ1Enjg09kvriGU4d1ApiRJx+d9k63lmAcJImqJRTGKQ8IIIEqpdAqucfQ3hT6GwRXG+dBZaHxJvul4nfMRfPZo6Ami7+1RA0o02YMpwypTcyR0cr8gzUrijJ+0Fw9lL8uXhpg7u9qWw+Y/XurMaqjV23RmNegEozQHs9J6grFQRAHzffIOS7xG8M5DgtorJpo37IwzmenICnUaE9wQvg3AzDT1sY1huHe14kou+znuP1fBFHFe1fXKsam50INXBh3lWQVBT6gV1Hg0XBnI6dowDdYtw6HCdMkRfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAhzFxsVFqDyqgKqA5YxWrtMLcn5W1o9UChPGixN2ZI=;
 b=J7hkd8Auwh5kslzg4C7YX/QVDCC8PJJzHxnGdYXaiVD6CXwdf5I62yNWDjiweliVk9iMofND2p/wLqQrgOsgpk8hH1oZ38utnpM5iTlaWo+u4j9yd5aUEwalmOpj3ZTpkeYzjGkpYJntPk2scbMSw/BaM1F3VmNPWiHO4sDO5Qo=
Received: from SA9PR13CA0038.namprd13.prod.outlook.com (2603:10b6:806:22::13)
 by DM4PR19MB5812.namprd19.prod.outlook.com (2603:10b6:8:67::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Thu, 21 May 2026 11:54:22 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::9a) by SA9PR13CA0038.outlook.office365.com
 (2603:10b6:806:22::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.13 via Frontend Transport; Thu, 21
 May 2026 11:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 11:54:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 727BE406540;
	Thu, 21 May 2026 11:54:20 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 61A2B820244;
	Thu, 21 May 2026 11:54:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 0/3] ASoC: cs35l56: Replace open-coded SoundWire regmap with generic regmap-sdw
Date: Thu, 21 May 2026 12:54:17 +0100
Message-ID: <20260521115420.978616-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|DM4PR19MB5812:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3cc8d40-c096-4bfd-54b6-08deb72fb277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|18002099003|16102099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	WwVN/EalohUO1VSCBy/zbb0pnXg7saT0EKvZ+kQshPy8PPXx50wsbYPBP7Y8fJhjeK2ROO5YUG8peMo59VTBSnQy947UCrMFqfajyVz/m6gk/htOLpMiI1eMOM/AzTu5JLBfvHHtrL6Lcye0iWRK9RqzVqrYtYkHwxJQJYZFCp93AhJMjW6C49DhTjtds+oqg+1ulk/4IkehurMvEoxFrmDy53pqkQVEmhQVLpI4zvpQQVzfuwAfoijIst/PMXib1bYGTzdmDbOqSKoMAmT+zsyCaR+otQ51qkIcFayRzq8kzHetGi0MClawd/a38OhndDLXjGss0IFXCbAinGksE9v/HmF2WczovgDW5fEEyWFpWEGO6iv+Vvaj2lle4CuDOGDwBNuxRs8oXznPk+wrelCsOhsi58PQlBgst8roO1YI6Xig7vKBDbm6yopiYsEztrESpFPj/GMQiPXQ4Kl4UHhc3/tgI8mtoe8WlJSIAuKI1GAqWYJCK0tcxMJyGg9a4Q/uFb+yARb7pBkQTJC47PO2d9UnVVFtWP256mm7zZYBQSOPCpAmh3ETGuKMiZsrITzcms4a25mxPS+i6bk7FIGRmp/6fJeEzfWLOaSVNxAXieXuivcUoSFxN6jPFkTYSw3Zgqh2vvEp64kUL10+bH7PuQG7tjNksYDj9n+CtRBvqCSInWRc3/6FR3aGyS8fJhZpsq9pbTgLqa0wR7jdOBLJs5tToZKmYzaZppAkgVk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(18002099003)(16102099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0oO04Uv38EEzxA58lUxlG14kQuf0J+VQWkDxL3Ftu9DXUoZfn5vhX99e0BW+eAuWzWYkuBvs+4/Ar0ZCu6C0dUfCg5+ZYSVVEfcvfsN4XBnrnkd1jgjpBCeSEVbTvIllkMlAkHnQuE3tW6mzRXp/6O+Of2R930DZ+zpjcuAhH9BG4Tu6zhhyDlmV5yH2y1+ufmU5s7dk5rTM8roc6bcSUoxg/Dndh7vAPV0dBexmUtb8apSaePp318UHR4rQcU0GrBGzLLE81zRrvhQBIkCqiYIVSXJwTh+J9NdbKx4/dUU4WsuwUAIK1jQcruG37Qm2nO/C03nLMEFkcm5R+rTQ83PqQqcxAs9mEHy+Zw7KJbmrDEcRpeoqsHpIKZZzY7izTI1RQLKbMBsFiCEYY4e2Ukpg3vK61079FoPxMGlBCqEJNFkeuTzqNYwIXYgsTqJF
X-Exchange-RoutingPolicyChecked:
	PnAuBZcoYXAH/H8mBzqYe7Q7AJMKKnQGhuC+a0dLaUDBbYr/XoUlc9jMFZ43ReerlfWRW8uzC/A+NQvOoGUVvvAnz4AQDduC9p9Oekssly9/sQ61t+jnKBM0X2Dazw0NfdBuV6bvyo13rQWW54YEERn4gw8HKTTg3C+poPGtAImYwK0bw9Rueno8mBZ7kzCznwKuKCvie+Ooi49U62/SHRWn6JOE4uySCGyHXH+/E1VYIDjI6+7VNwUNqUzGs1YxnOs8e8Yk1Tgs1sjrOI/ebII9keP5+YbvlrC5XDBib8dAvzw7646mil+iHkqQGzy5oqcCkb8rIdl/nI04FXEJLA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:54:21.5907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cc8d40-c096-4bfd-54b6-08deb72fb277
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5812
X-Proofpoint-ORIG-GUID: dKU7YMgMHiiKe6C0-z7AuZBickhmaYCt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExOSBTYWx0ZWRfXwLWak5jwu/YJ
 Ii23FMIA5lypoWioPxMSP0d4h54hEDmxVCSiXjM/bKUDa0FKkemkOYNLjshg74K5WOTw49kOn9W
 G78Zsw+paWWPWuqwaoP8vdnuhkiE/x+1ZJaFv22sbS/PPVFPem3gAqnL4rU3ALgV6bj12wwHz3v
 QGdjwOZIGffWBYP1s7NrexLUyspnWvXLJq3RgvGRipQIjGSFhIB/INx9fNJ7U3kxTpatPnF0ElU
 qlZw3+MWip29qr66TXr4JecwWT/PG2neOo0DoSj34/jRDvzPHr7qrVEk+nMakd5lskc9SQMPNBt
 cqGLwEZNu5EnLkCpZzjoEyfYjfxL8pVY1Y3Wh980Cds1nIrvy7+69bgHbWerfwAJguI/y+8sKad
 04MKPpcC8w+gQe5QmLfrOYYkYGj/e/h+84VOrOpBwlIPbWlNsC5Se137H6wlI2a1vdzsptlx6oY
 gCieZvq7Do7y6/c9zdQ==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0ef272 cx=c_pps
 a=2p4Im4Y1RcQvwJl7Z3FgyA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=oIzJ7xBV_i8kBRW9MZwA:9
X-Proofpoint-GUID: dKU7YMgMHiiKe6C0-z7AuZBickhmaYCt
X-Proofpoint-Spam-Reason: safe

This series replaces the entirely custom SoundWire regmap with the generic
regmap-sdw. The reasons for doing this are:

- Avoid code duplication
- Avoid effort of keeping custom implementation up-to-date
- Prepare for supporting BRA

Changes in V4:
- In patch #1 moved dereference of regmap_config after it has been
  checked for not-NULL.

Changes in V3:
- Change cs35l56-shared-test KUnit test to handle the offset addresses
  passed into its mock regmap bus.

Changes in V2:
- Select REGMAP_SOUNDWIRE

Richard Fitzgerald (3):
  ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
  ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
  ASoC: cs35l56: Use standard SoundWire regmap implementation

 sound/soc/codecs/Kconfig               |   2 +-
 sound/soc/codecs/cs35l56-sdw.c         | 137 +++++++++----------------
 sound/soc/codecs/cs35l56-shared-test.c |   6 ++
 sound/soc/codecs/cs35l56-shared.c      |   2 +
 sound/soc/codecs/cs35l56.h             |   1 +
 5 files changed, 59 insertions(+), 89 deletions(-)

-- 
2.47.3

