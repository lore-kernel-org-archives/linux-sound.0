Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAC43BED30;
	Mon,  8 Jun 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914528; cv=fail; b=Nvf05Lz7hvTeTWOYhSKgUijAZpZrjy3VBDxrbT4VZtD12Xrz32fVHbHppP1ZIRk1AJTFRaatyy+i15CSlSj1QqulWdiR2vGH8r+tBxfsFSGdzJAhfwa6J79YagCQPicLILsuxAGlChD1bdUsd87Xe7rEbs4OR3Pu4MQfXqhFmRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914528; c=relaxed/simple;
	bh=BKZmcb/x1JZ3+rJOoJjOOWRW+ciqLO7y3XNeRxxKgHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqLRIycf/ziMq/5e+GSnBZcae3oBGH/Y0W4b8VUY4R3APvbGDMXeu7IiKtnU9y6RedA0Lt80ot1jZVk/d7leJly2PlV+Har4L8x7wJkxk2Wo6XPnlbrh6yqx5/wK2gqxK+NQY9IA7EXp+YO+gxzGatWgth8bVdmN290FrysWMhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IUlHPap5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hfbMg3Jc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IUlHPap5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hfbMg3Jc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6584jQEY3653579;
	Mon, 8 Jun 2026 05:27:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IAniKAUuyJ22AVVC7OG6sesznAaN5hPXKTXse/16U/4=; b=
	IUlHPap5Pq8mlBBTKpfRunYnt44sJWmUfbCfJHOYm/QbVZJ1rKJrNdjpplIl+JtE
	qeqZCCh6uHd5grAXf5QuOE18Z/iHDyt8OUwt+3v221DOOOcvHSHVvVyM+3jbg3PZ
	kA8ZrajudWk4mXKfF3caMgKmDirgt88Nx3PiFPLtElylKrn+wA7mD5A0WqbkJWmF
	rYtuAlmOJIVUlvcyrBewRVkLJrwa94BK0dgJFjoFhvu2eit41TasP18fiSIb/fct
	od2n4RWHZNfO10B5dGQp84vs5afK7Bbkl3JOwAOZW3L8HZRO3Soo7yXMFWsD5GZ4
	T49zPzaPOKqEzRcg7u+nkg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020124.outbound.protection.outlook.com [52.101.46.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0a8qb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6n0h1tvAbVLcve0rw+S7P9hQNk20ZbmKxGFj/SBKgnjefER+j8Xf2Ub0YottlDrnV5r9J75ZN1Egkeza+Z3pv2X9y0zoYcMwRXqWB7BUQ3sRRm/s2mRtJ0/WMXuEuinq/HlhaNzckT0aEdbxu8bslRvHYsTOJH9Li5oWCKCle1aSqTgwxIJfIZmDQWNJY8c/zJn+ygVUAiNMKyt7r/hvplZV57BlEuzP74g5jjimXbYAEhS4ocMDYi5ogEVxc11Rf6vMfp0M3bPSViH/VsaiXSe1qwZXhLDTPCV81HnyDfFYcuYBGhI0fd5mbALKO/uvqpRlldilOk/YBXvcNW/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAniKAUuyJ22AVVC7OG6sesznAaN5hPXKTXse/16U/4=;
 b=dEeZ0rU6rpU/SBhQdRJaGsisLAac1zwCWGeNgcpnzQqK56AsHO7t34hKpC6+0R375Qn7BMQNi1rjeQZk6YfWQ8fIrvgJgCIzKrIZtfw7EaXZkGfY44A9T94E9KGMYSg7+N8y53vgDHRMW0nPv2VwDmLSoMeaUC6/l6JaJP8skIrUF6k4VxZlcPJXlEwauHSYyld6SLYmy/2qh78HU3NLYnKb+ToMZQqJ+kFXH3k+z6hVHHrrPvmXfwWSHmtHDVV/E5x7lHLR7TphjrJhwcBmYayPQ/W8j0Uohx7fM0xcon5y4xnEKxXQRLF49eFaHZ+sKU0agQnGK+wwdUqMGzMqQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAniKAUuyJ22AVVC7OG6sesznAaN5hPXKTXse/16U/4=;
 b=hfbMg3JcOmPHF+3cOn7VWWA41vtjZp9pr6k7qXdyRpkZeZ1Oo8JUpHDwZG1jE/oj/fFHPZ/qMLh5urHtv8ayBW65yN+bqXc7w3fXlSeH7bisMAfHDBhySKWOrLLqpAfOnLisdlkBoozuNBZTZ2/NRN1mlC6V/5NjwhOZtzP9reo=
Received: from MW4PR03CA0085.namprd03.prod.outlook.com (2603:10b6:303:b6::30)
 by DM6PR19MB4090.namprd19.prod.outlook.com (2603:10b6:5:249::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 8 Jun 2026
 10:27:25 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::12) by MW4PR03CA0085.outlook.office365.com
 (2603:10b6:303:b6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 10:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1114F40655E;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E98D7822546;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 07/10] ASoC: wcd938x: Use new SoundWire enumeration helper
Date: Mon,  8 Jun 2026 11:27:11 +0100
Message-ID: <20260608102714.2503120-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DM6PR19MB4090:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2eecd6b6-7e57-48cd-9388-08dec5488726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|22082099003|18002099003|16102099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	z9i/Xb7KR1mqTGegkuireLhGpA9ZmtlfBxnW5+iofuXJgk1Fv2DwfSJjrZXpDul345CgFKSAT+MLJdsdojilLpVPPg/XQS6GDbFFyMhwXMUgRVWSQfdPssGU7Vg5dAWKexuxh0y3lor8UInuknnxYcggli1+qnPO+RRYyNd75YNJTi3z9CCcSMavWx4l49dEIGE+5SXtC5qj71i5CniHcQmDXDeOtUbN7gr5322Oj16rhT0O5qS464FbLccAzRn1ivSYZaE1J/hZt396FYFnXgSsTL3rrFy823p0RofQHEXOjoL9qpbntEs6Uog8z/TEWqlIhXLNFMIprs2K9Vwx6TzrhbLE6sYIJVQiPpw4ddPH48EEFvjbmNDCOfW5Pd3zo0dxmyb9O0lUfFtDSEm6hgBjVisj2r8W04QYDVEtUe1YzuSl6zMX4Ib/oSUxkriuNTkzoi77D5uA/31LIfKmyk9jRrLrEu9MdHsFswx2lIjhAowk5VqJFV7fHlbzQscvjCZQGgW1RX8WZbf+oxnFew8RMQfmShm7EQD25KPngfLARvtY/vwqeRv3SGDThv2DkTrEc3/frHk0ovfJjW5s/uh+f7lYZPCkV5pCZHCS440H8Kc1y/0GsFtjl7s3IYRilmTHIk0Or0dUqCx6pERnQGfJqlzsXL49Kc3dj3QUIiIjEXDOGSH6HXZKufjSegA6RybvintDqpE0H+MCIvIDR4tN5ByAUGkGhWwIAATld+0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(22082099003)(18002099003)(16102099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/oXbWYH4SQbxhgJyU7E64jcpTnMXs5hcOmn7mvA4AQH0jj5KENLn0SHotp8bAyoJ7A3TPL2OlEsQbK0E7T7/W88XCy7c5SImVZYEcb6jf9wK9jcVL7JpcnFd0i5SXV+J9kKBbXQtM7sZEHpyhGvb7idWanpvQaivPz0RAS7lrW5O15XeseR5zDFwyRsdW+tytH/HfEX8T9BoQ0toeetdBmBIBtReQ4r9mvlUMq2uhx93na/nyObwmTz7xzk5hgh6YIpPyW3urGM56hrq9MRjWLkIslrnfmdNLKE4UEKSp0PtDqc15AiGEGNuxgGKWNFz55pBc3ThP8IY/K7HvARX/HGTim2k+kjvO+ngkQSS8jYvhC0aRhXzvXuACpo6oN3lJ3TT5VBj7PNY+510EVbQjudAtiOAQLAhkJYXTBAr82qV+a/XO5YC3YZUvutoF+w4
X-Exchange-RoutingPolicyChecked:
	V/cKt5/7bn3JWf9am6B6ZoLyIlA63d3jw2jyjdl2peGJhEqMWl0egg0db5PSjk/3vpueLxcJzwelJb5C6mN2KeXkqsrXln/SDgsti9h2ML6EYig12HI9HPoWtKHoAmA9K/gghJB/7/5RSrTnJAPvNObZxZOCw0YBUEpeNEK/2I/NTVeth7z8r5sRZFkCcNxUTMKPUN5C4NbteZUn9H5Gnv472cO7F4ulHKAUlSC+qSARC6oCAanHLcY+wo2bF47hH+pmC8oe5c6CXDxhiwWBlx78iq7FfeyAj/6sG8LHOTa58yzmUcV44MkW1XlsNzMVKwAr7vXZvOFbSEnGGAcrqg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:22.5739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eecd6b6-7e57-48cd-9388-08dec5488726
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4090
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a269910 cx=c_pps
 a=KzuZNAusUQo1wHVwqbxTLg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=JVHJYPckqUcmq-FxO84A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5OCBTYWx0ZWRfX/JcfWtrzR+Ig
 E6uKh5KCY5xkybOfWoWKKpLc15vZDa4VDcWVTx9h9uVX76p5E/bBk/u/57Trs6A/SvObwmCobVV
 H1oF20pXg5rxpUjpNJntgk4ZP0wiwsiqdHWz6rJeVjwZvOgL2KwASnL7uE7aSnLnMn9xtuygEow
 gG/ps9xHmIQTREM7qoHG/XWzbnj2T/gaxVhUcvMapC40GMOcrVaENglkEoKtv0cwo+QLOft2iGV
 mm6Vlb6QLog7xrKdOzFVC2iVPwd2qtOJf/tbX31prCTvyv8A3aL10PRqTvU7nvrq/rzfEnTuoI7
 QPFG8Z3VLtjHIOoLb9nzyev9xTCBMge34TZGG0EFz8+/FHT9rkySOz9UOzc0cXGLeujDt1r7QJt
 f9HmAd0KzT59oV+pp7EKllNstYxwEmtU5bIWB5N9Rexn81jxDnbY0UkGfECuM860OqU+G0PdeWV
 qOT6DY9vmUvPvieZlDA==
X-Proofpoint-ORIG-GUID: s5U0iAb5o7NcdlIQ0y9WNpM10G2_pCth
X-Proofpoint-GUID: s5U0iAb5o7NcdlIQ0y9WNpM10G2_pCth
X-Proofpoint-Spam-Reason: safe

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/codecs/wcd938x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index cb0a0bfdb6e32..c69e18667a85b 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3016,18 +3016,13 @@ static int wcd938x_irq_init(struct wcd938x_priv *wcd, struct device *dev)
 static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = wcd938x->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	unsigned int variant;
 	int ret, i;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(2000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(wcd938x->tx_sdw_dev, 2000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, wcd938x->regmap);
 
-- 
2.47.3

