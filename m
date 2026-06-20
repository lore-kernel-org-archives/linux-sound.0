Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456E3148C5;
	Sat, 20 Jun 2026 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781953391; cv=fail; b=N8j1v5LOJLzCDQDTxtMpPNwHqmyZzBKEtvG++Z4ziEiZPq/BzcF0cS+jnKPir+EGxCXZLtNpQYzWBbbSP7K+HjgjMOo4CkC7dAXtFwRW4p1Iu/GSgRtazluUpekGSpnliH7tw7J2OI7rwWef+s1rchY3c6DrFnCdMlLtF8b2X/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781953391; c=relaxed/simple;
	bh=ry+1jDzY6CQ1t/L+NAoXsDbzsmhs/Nw/tT7hBnhQHzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ug1cQtVwrsi5F0sZa2aYImzjTBbC+4wBpJPONBR0nn6G/biEBv9mJCttR9ee92etGO/BoHf1TcvSgwkD1zoAnwunuuVQU3/iQ7Z9l329ADmlvX86mmzGP58dyYIcvZebVUe2RPkawlVRnDXeWhz5DjIOq5dJentTSgwc5WizOQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fuDtnGUE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bfD/iAUz; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fuDtnGUE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bfD/iAUz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KAx9hm2878933;
	Sat, 20 Jun 2026 06:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=LQpF92yY+D5fh5qMYMYjNO0tlfmEWdIaJZCb+wIDMQ4=; b=
	fuDtnGUEVuEuRsc6tM6sRqjxX1DAyCOceKJKrVzpq0S8Pv5o6XV3tPLzywVtvYZo
	TxnLXS7kS+VVPmBiVV+Sos3EMwPvwreqzVO3Enn5nGq4jTotExJ+L2Evi2LsNGCB
	07V8dEIVkYATRPv9wQGnzNMMdRC02aEKCJk+uvjD4YcTQMw+n0NTGWpa79dEK5Ya
	s/T7Kzkd+f69PWd0w0rDKfvs4pQovlr+lMZgZDEcpaupbFjmFw9RZ/kz1vhQ4hA+
	/4EEyy3vDWdtJxyR0LlYkyeMzcljjavmUI/bPPpteuVISNV4iJnQiEI6XpKGu8yd
	lGM4WEjDWYYB70ENNxpV1g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022120.outbound.protection.outlook.com [52.101.48.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jg3v9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 06:02:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoG/rsjFGfSS9DMAplmfwO9G9FUaVeIJUvOK0K+KykrhPFKjIjviYuu8dhZFADWiK4Q5rslggZbQPESDepDgLnZTADEmU2R0vjQrLKAbTErlwOh8iEwAhuR4Ebvm1Vl2RN4TUTjp8a1i3WKb9nlEGI6XAhtTgxw4GzxR7KzfscVKYEi+a/K+Kx+vnCWdQ8an/B8/BV4DkwStxoTyYN9iqnQJKmE3GNWQapbANOu8xSlgV6SUCBzSQMjWcju1hY537t9VKtKmWoFW1wNV9kfpIIIypglJc+Rq4zW185By6YdsYhzUnPiEZQ+BRawModoxoJaxAuoxpMQEjvE37Dj1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQpF92yY+D5fh5qMYMYjNO0tlfmEWdIaJZCb+wIDMQ4=;
 b=aBZdkiWecK3jBETJvvYuQf2Dqk5n/BHs7xnWVmFQHH4mGsnzYOftnVNmGP7bjMe5xjsy53q+5zsupwB2YfAR4aQ/sbvzog5D6aXKVIf6CTtRNmq78kLqsuHb2Z3vWRB8YgKeQqw0/hdfjN59f80nyTY9/VUBF9i6b7uldLKtFoGG4CnJE4WW1xs0ptteZpNPvQ0scIV18nOH59Lxe5yVbDwp1CcRNtNKCIVamUN7BK9xlrsIHd/Zemxv5d/AO4IBJLaKTWkXAeVn/MSmCemjU94Xe4hA73jMR+d1wMFvoA5XWZuEDFNEgmZHJlPM+AfZsNO6SAXbZuCrSFa5+5Ao0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQpF92yY+D5fh5qMYMYjNO0tlfmEWdIaJZCb+wIDMQ4=;
 b=bfD/iAUz3RfP+ZL1rvG6WS8mZKI9eQWHyKJaai88dIoPIokRVfj+ISkx/r2eEGvJAldCTxp9burfgd0kAIjirWeeizsqzw3DT0rpKfmAZxCN8KuxUqu0queGSdmiUJuApQ6fJ1W2VBpTWS2j9pB1q3w3odKQgdgpoOkjEv3kslo=
Received: from PH0PR07CA0096.namprd07.prod.outlook.com (2603:10b6:510:4::11)
 by IA0PPFE001973C9.namprd19.prod.outlook.com (2603:10b6:20f:fc04::cd6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 11:02:44 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:510:4:cafe::40) by PH0PR07CA0096.outlook.office365.com
 (2603:10b6:510:4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.16 via Frontend Transport; Sat,
 20 Jun 2026 11:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Sat, 20 Jun 2026 11:02:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5B30740654E;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3E2E4822542;
	Sat, 20 Jun 2026 11:02:41 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, arnd@arndb.de
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, zhangyi@everest-semi.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/5] ASoC: es9356: Add back local call to sdw_show_ping_status()
Date: Sat, 20 Jun 2026 12:02:34 +0100
Message-ID: <20260620110237.2684234-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
References: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|IA0PPFE001973C9:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0247826f-d293-4989-fce6-08decebb73ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|61400799027|36860700016|82310400026|18002099003|22082099003|11063799006|56012099006|16102099003;
X-Microsoft-Antispam-Message-Info:
	AcRlDz3CLsGPEHiUPMG7mj3N+MhaGoE9HO+oH31vh17yW4ICwElDEi+ZiTFOifFbPdjgb/A/UnQpVDqRNBAj19tkm9cxFgzBeYQUCcYZlYBwD+aeRkTPPc2xCSPTSYfHmbyWhH0VzUwljfWaOmFop+62gPhgQezWx1n0lHuE1oVrIjn0zF7DoKWg1GtY+4OdotJiWJiyyHlVnCZmZIM9ll9fnlRYIu8ca9wHymPOR3+LSBQVIM7u9nluuJla+rqJy9PidGY4ZzWMBqD6qyq6o3rQc0JF5sHxxJLpks7fv7oVxQOf68Xx3TbmsjbGVhDSUu9VqmSIQ9LwssGlZNp9sf5Vp29M/nHa3PTAyaNd7O+QY0gSRJt9WJUCVKJco24FNP9azbedCdja1cYpDwNiJZrK6WGh/ri662hiVjPCLzJsmU3eFs/N/CMGp6oaEvHd3dxgIF6S+JAVdxIAfw7vL0rTVt6tRY+lL4n/yASh/9a02MXce68MN/ON/kVNG9qegeOMyzwzzx1eR7MHrGb6aVg96paH0pHAyf+rq3qoiKxJpTmip0XMUscqQkJmWK2SHFEW8C55jCEDoBIlfQZ3w9ChxF/sebv+GcDPvceEd1+TOiWCCrtEIAjPgaJw6xfh4EPDC1kZcKYdElvvj90SfMBr1UPK0274Nm36OATwcJ5t7dxjMLAw6Vzie12QaENP/mZ6A47tqrJhphzIh4fDbQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(61400799027)(36860700016)(82310400026)(18002099003)(22082099003)(11063799006)(56012099006)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jr5cTHbuT+13288GfxIXTrkSfT82vXHpkS4xfnvm2EP4LGtNYs1JqpRJlLT7PSFjOPEVOnXALK8ZJMInuP0qF/ZY1Lbb4C5YlUheE88B6mTRbpc4xzqotYmf6wKXJN2iURTeScwsbzqV7LGaO31lSpMjcf7zdsb4c6hHCxKUB9yV2Soh3Ut0+/myr0QEnbwc7c732oWhfkXMlnsVt2gXASlwstNPoUVfQpoclNZ6MWDpiK55DFCzSlWvF+YB92fKMzshf5soOorayzSFln/I8l+5hHfGs+KXzObP73eNSxMH3j/GhzLlgpVF0ic8RQPeONmsRzZ5t8Tie+hCfkP95b0W10wt3HCd/27IZ1YuOxxiFAYcFzwTiGfRB2vWTXz4OJx0XO16cXXWXbCwrL8QImBtP7Y9ZoXRrLtZGUlJfEcIn0G445pabftEAYd0HFeZ
X-Exchange-RoutingPolicyChecked:
	lQcaE3HOR++MSKnZGEcu8jaySM+7HNuRvpMeg/FMKBJ1W4AWXIF4Cz1nKC0+Pc/1Ntp5jmQVDeyUKnDr7F5sWyi9GtydN7LvNBO/H9Q6E3tBHtUxq2qki9nuByyONZrHSaxSIRXgCXl5YB3r/9CB/oUnsE7tGTQHAAqOdqEyqxPynjmRqH+inBk/AXXe3ZyFFJqr781lYvDHwq2vzJwFN6RBEy8r3AKwh0Goa1jrkWkUto1MzvC0iAnyYr3nl9ExCj0siv/nUuFNgybadQYRDWp9SRxfCY3excRrW065lp6+qSoEN22zLg5SL2kgawv6DCz0U+EkOYkM5hIOjMzUHA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 11:02:42.9693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0247826f-d293-4989-fce6-08decebb73ef
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFE001973C9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfX5T+gIZu8oxvz
 YUZ4NRI+Fq7Dmop+Y8MrW1K3MZ3uTUSGG86D6yWPzDYRjSzSyXwyCk1GVwlzEFPiOdCq8Yt+3j0
 bt0x8qsRbh9XF37jQOb9KGtPjwy5auJq0P/mSiNJuERmjdZXWDdBdd2p9ax38LLqcdkNviR43V2
 FhK6XkiWkG30C2Y6+O/NUUEQXQc/VsGW42ZyNlcwfnB8dgZ8ObbZOjRx0VToaNiK0FTLbwbFzg0
 42OWecRL2G0scEI1bYldtp/FxhTnbxbKCYsEn4b+e3R6aDdA9x2B7MT9dmaHgOwcVzqvbfYnteP
 YLH9hMc7EzdtAo5W7uRap5n042llOxL1KQiGEMGShtlLgXcTMRJ23mVbAy/L849X0S9gUhTPapd
 OGpCOvlqjGRIHHpeYeD6VWxfA7IzuEqRdWLq64aOAmg1qc0fHpAkEhFDlHrWhj2TNK3yOY3cSIX
 rvqy4I/BtXZk6BlEeEw==
X-Proofpoint-ORIG-GUID: M1lGMGk1iF0-FXY9KvzI5aAYKePDz0hr
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a367358 cx=c_pps
 a=MceEdFpa07MrPAxPau0EtA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=CebecAEAWOMkVcYaXRAA:9
X-Proofpoint-GUID: M1lGMGk1iF0-FXY9KvzI5aAYKePDz0hr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDEwOSBTYWx0ZWRfX7heSmnHna2bJ
 nplKk7QkdRdaUwlR6e5DDrMaBHoBGxTjzPjrwl8bppI0lML0bOfppkYXV2lfnofVTEbThyfx4RJ
 wFGytildVg8tLPUr0iulur2tupNc3Ms=
X-Proofpoint-Spam-Reason: safe

As the core no longer calls this debug helper add it back to the drivers
that originally called it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/es9356.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 670e918b56a46..8db81d5746240 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -1111,8 +1111,10 @@ static int es9356_sdca_dev_resume(struct device *dev)
 		es9356->disable_irq = false;
 
 	ret = sdw_slave_wait_for_init(slave, es9356_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(es9356->regmap, false);
 	regcache_sync(es9356->regmap);
-- 
2.47.3

