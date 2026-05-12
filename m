Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A10353EF7;
	Tue, 12 May 2026 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581911; cv=fail; b=iFKbRmjiD3aulsKU42hnAdA4yTTLTj0ir+ySCtEYR9NTxeIRRt96pzZAmz/2537vSiXx/e19Dj1sYBPQTcQ7q0qAba59WlFeFJ3A8IPPXuT7pzGlxpAjEuzO9JGA22SiW744d+Xbp8w0q8via14zfHkog+dlK2Ub+5SMC7K2Qi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581911; c=relaxed/simple;
	bh=Jy+gN/1H9Gg4Ws6+LYupPSLv9AdWIM1+z6H5izGOtLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NdSl0TejjwRUg1KN40xdwFPFE/saET7ng1gtvUMlXAQzJGgCX6MI/476Ah3N0NUdFxpTxaTZcNQEp9ArQMSOBXdzW1MmNykjq1860WzUbs8XnIGi21lXsyr5xf47uIpMFm/uywLV4clmwWX26DRn1w3WHcq4cJZaa253KUTfEkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FLZRV4wU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wwSX6r1+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FLZRV4wU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wwSX6r1+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpnw1493060;
	Tue, 12 May 2026 05:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=aXowwOgYUl8I6jRGhLTnQC4A324d4sRxYLv21pvYwLw=; b=
	FLZRV4wU82M06OOgqXVH30TlJr+v1nL1MswnkWUijXh92Jq5c35DfxSLQp6R98tE
	IO2w4I9WR6zGAm4t8+bdJKBoxqfNv2WhnnnwO/SyHmFvw+76PzjOvsjdAplKyi/F
	/bk+W6xBOs3U9bVPYyWxiAwrWrGOBTzNmjKjSIOR5B7BUdnzivq1aH5EMEi88NzB
	OWAyhvoL+JdJ2R7cHPl8gO5dqMmDLZkRPIk3BvQ8kptrlBd2F6ugesRLmiNlNOij
	QPJp5/ILBUPBhRTb2BiGHEra49yaxeewzi/Dc3ah2OHpN9gRiyGh73+kzlyXm+zv
	6UG79CLY263KLAHV7RUQBw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021113.outbound.protection.outlook.com [40.107.208.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2XTveA8LAIDvFriPtvLm05FRjZe72iGBzgrT08nEdrle8Q+eMJ3T/EIXnHnIjmWSc5GnC4dw3yYmV7MqMnKaIwDFbxGCwxsNUGnWvW1wVKymXp/2Zzt1y6XPF7cDRkqbUQPfTqelZ+Kx0nFBIQzA9PNT7GHXa7KpWhOKviVtGP2uePkQdjUZO93B28J7dtj15YKXDsW5k834U4aT1VZZLJy95N0oq2nClfNQ04KkS1NhUUq4YT4wdD0sudOKHufklm3YWThIf2P4aoEn4Vvy13IRP/KY9LhaCQkdb7UUXHd6HucHvVtCaj6xtqkFq05XxfwqzwODeFhrWwpjSjtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXowwOgYUl8I6jRGhLTnQC4A324d4sRxYLv21pvYwLw=;
 b=fcGWiyrJItOFlnhTSqa98cr3BxwRdCuQk4knutx4xJwSKgnygvHOHEUwcxGldEe/tLf+mde9xgX1yhvVTYPhiCC9XmeKurJq/hto0clq0Vb69ICgHGnd85LPPDdmoworv0zRpazrqftmhTU1uTApDmjogSRDGu3JcR+FhEXv6BY18ARjYLM00h4lFLEI7Kf/7flGbTutY2eMh/QtSgGeTBy6jWDB7TWEKiMyQzh32HKQaWW5yF95NP7JfOQfYr/tWcSVKPfKxbbu8NnVVEj5A1SNMoc7kAAhLkWdAlfOpnQNhPFFv32wY/qBY7QLjChSO9dMpACzrFm0y4SmS2XdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXowwOgYUl8I6jRGhLTnQC4A324d4sRxYLv21pvYwLw=;
 b=wwSX6r1+QFvfUyH2te1lNs7NIn7c2FEMtNesYqs2b9XubkgVZK6TjKCYjBz8WOAgx5IrROtcnUS27RJWsXlcyBcZ0m9R3bzM1OVN2Xn79kgl3jZ+7HlWSA2tP/p9OwJr4EPBap8OyXdykRd+pyHS9UyYpWpUxkSBEB6BeQBP8QM=
Received: from CY5PR17CA0040.namprd17.prod.outlook.com (2603:10b6:930:12::34)
 by CO6PR19MB4817.namprd19.prod.outlook.com (2603:10b6:5:346::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:31:07 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:12:cafe::6f) by CY5PR17CA0040.outlook.office365.com
 (2603:10b6:930:12::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7FF5E40655A;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4862E822550;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 05/18] ASoC: max98373: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:09 +0100
Message-ID: <20260512103022.1154645-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|CO6PR19MB4817:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5cba213c-dfd4-4bd3-b90a-08deb01192f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|61400799027|56012099003|22082099003|18002099003|16102099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	DXp4EpzJalOSue6GPzTRc7n2CKHas4FRrqxC18FDGPKlAEpB9sFQHWEprxCQeKsDm8HS5ougv0IN3eAvx3CJP5L3gBExkgJHnKe+ma4bi9y1Ylh9RlivI//wM1BA9qDI1AbDYjarVJO92Yam1pryDDEi3c68W5lzR3vN+tydc3Gr1t5h9SEPrbkfEOmNnLfBJBi4uQp2GTmwLfZild3Wvac4wfSaL6DtbpH+XPNZsGl76Kjnd9C+u2K7JRdgCoxMeBYuhD+VLx4lTuxFCFYgxi20JvtXkJExg40KKJ31NlWtobz8vBJtw7Wupc/Q+ia1GRSf1V8KGpK2GVgfMN3khnMYLMh9JnG4UfnzCQN/JrA6CWjJKUsC09Fgo7xDdVZJlo/EtYIyk4qoNZzDcqpXqErpIR2GRLcOKgKSfdtmTiyM/LuW9brqZGnWtFZKlwz3FdZuxNa3erHmXIes3zYXeprcGdoI3Ptnlokw0smWN4LFo81Xq7mg6XDh926B+JUBz2PBzffyTbVtGK8CGv9g4DOmtwyQ1mmb2mlHkARx2S5PGzvrVGnqIMXiSsePozhUmxAhGiZp5c/UNMH3QtU6tEyeZ/c/I6L/8Wz4yy7lLYFOr97lwnqW4M20Zycl8yFZQTl8f1CLMTGeWdXOWqB0dMFX7dhsSYGiEsoX8dsrI6P7qHMSNCJoeth4rJNmeOmGIChsHAIiJ53ymcgvimkcEPvcEucQ84JvPVpTE1goi78=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(61400799027)(56012099003)(22082099003)(18002099003)(16102099003)(3023799003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dwWmRxjYMVlN8a6UM4KilOyNtxX1W50rcYi0U4Md1MkojICRYhcxtXjmumYTrXwWcB1M+n0pAcgsgPYeHCBPVLHFjum4d2kij+fN3/dN2IIim3gIi/fqBXh1I3YZFwPjYQWLk+B+C9AhIcpM7muXbtHHmOVqeKblOypOwrRN4F2zknibv/qHtMNkd8vZlPGvhgzob1lU/q1PlOnpcPVsYSvZI714YGZxwwybhTcaVw6uO4/SuPGZo0GCpIUIy7s12AykY6qsNP23zvgdOl+KjOX3NZJgdLIG2ZNOfby3rlm5cl6lsxa/s9BkkCe0JJjPVl1VTflE2I9GDsLFUSPXtBjY4rscahXUKsRQHz36u2PQ487KKDDRpGLae06Nb2rPidscze5CD2Gkx8sGmE8eHmVZ5LYFfv2dRpYyneovVxAcxSJP3q39L0m/p6p7Yky5
X-Exchange-RoutingPolicyChecked:
	ZbpuGLxjtacLC0uz5xT9/WzLnrDktJdHGCD4qaujbBpuJ8sb9oTuUAPP3IKk+6J7iAZOVKsUhaDB09GLeimqHzYrorgDlQ/jY3dB0Zrl7L6Ecdb7Ppdt0QU0wnlhiUOIyu0QRRmBUvbqR511L6XhL5em6sPg2+H8rFrzODQAC+6MYOXSPAqhopqddjn1E6ohoCoQs4lFncpG4U3DMuEOs3ITTPduf3KOSi2QIv7BbVEhKnF1NeWmlc1rxqRh8kpkVYVSEd2+lcsPLzxYSI2ls4xn/J/T6T2ECvFmFLWguIAsBo47rh14dILRTGYxFK1JsTDJnNul8TcX6KS4EXfWjw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:05.6984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cba213c-dfd4-4bd3-b90a-08deb01192f7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4817
X-Proofpoint-GUID: ud96uWenz0kHw-0QenLl4TjxQXLDbZs9
X-Proofpoint-ORIG-GUID: ud96uWenz0kHw-0QenLl4TjxQXLDbZs9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX9iPCIuNXmkJH
 2PFei/Kn0L+p/AIwMHZEprQDI9PS+5UuX7KGLIHLY+U+x0AUbwFvsdx+6/2kz/mdJVrm/l6AudJ
 VujWK9Hx68cv8z70yrFDH8RH2sRryWbwThVwAE799ukBheKBk/MhwlMbKdryuW2Xpm3U0uWvlYG
 Z/k21xX/fvHLc3bEZZqYJYjzpG5WZcGfrm2/X0nZRuKf5wbALe0jyfr5owYvTZREyIt9JQ32KIA
 mHXk4O4Q0J5UOorsOTv/yy8ZuL5cJQqIgbnCrPL1InNWICBx/IT4d9ehw4n43/hWgICziCVu+kC
 XCeocUZqLZTQ6aq2K/FXn9TtYZJgmifBmpDkvUqaKE+C6NSUM61n1wqC7/tRv/kpsVXSyeC74Le
 9/ytAiWeq2upEhewtnYkJTpErlH8YB+KglOG/OJlW6TagTOKRO/Hi+cXwYDpDLHddqvLZUqzs/O
 yWNgQUu1BDckzmvV/2g==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a030174 cx=c_pps
 a=f+3zdzEv7nFEBFh6qWwLEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=b3l-KXf1wl6CWbw1ZukA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/max98373-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 16673440218cb..6829fa07c9ecb 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -266,25 +266,15 @@ static int max98373_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!max98373->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(MAX98373_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, MAX98373_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(max98373->regmap, false);
 	regcache_sync(max98373->regmap);
 
-- 
2.47.3

