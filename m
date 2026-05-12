Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D044D90B6;
	Tue, 12 May 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580876; cv=fail; b=iPzuoxk8GZzrDzV1EMgKKawkKk5w/PIgMzhBvTMZ4HiPvuv5u1JpOS4V2Ak8g2hs8YmssgSyXamf/VzCKjU7fNoOI5Uc2EyNYbX7qkLvd73ncr7Gt5KTauuw4z2+hwwLbnadKR0o8g9dcMiUXjA06MY8TOmRoIqRpEzbDv1dIgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580876; c=relaxed/simple;
	bh=3wYqzm1dSnkHB/spHY9z2g80neFgdIZGK8PEPYLNl0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rC8FQI0rsojjCgEnkFyx907Zdt/hEc4OmuLfSnXjisZPA7vejfvY6sWytcGIzJ3eyGZwBvMrCr+RunDBxWv1/pJIW57YpsceWzdtWnLvSdmlfHOmUF74rnhRFanRa6ItLEz5delQPqTUet7ahD+HgZDSD98S3UQlm8Gk70R4uAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WSp5/Ai4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KfgSy0l/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WSp5/Ai4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KfgSy0l/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C7N6Ax1750921;
	Tue, 12 May 2026 05:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=lvZQTuuzSOe09vS4sp0t9zm7sredsjbb8kr6PuiJVCc=; b=
	WSp5/Ai4gGh20I6Tu6oQF5+l4xPTaHX4koDYU/i++EGyvmU+pCDIdLMUrwGM2POP
	FxvLLHvckuZNfLp/qOovpErmiFq3jG1u+Wnbhq3Yg8ISroyBBMqusgRHWmr9IoGb
	3ANUiZ3gPG31IW5DLQKBRBbTHPpmck54L145V1JtpJeik0B0W1fRB9H1O+m1TrCU
	RUpnE9Ui+DlZjeETMCMc9nKONXotBV8hfvMnWuRIGqziNqAAHwtcpgFrMSAkYq+C
	oxqv1izDpao+I8D3D8iT2Jw2tn9YUvi98AA351hk/WqcfNxtGnjeR/n8OvnVZkSD
	5AvHGiQETORqrxJlTeypKw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020082.outbound.protection.outlook.com [52.101.85.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q8e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:13:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMZXZHS8tz87WM5DCA3CZu6G9VbWEueEuqePSwt+mngXk0W1N927Ju7QmwS9aQpB+0ZfzqEIsoE7AwhU52iJomG9W8pwgpqm+rVy6yYM5oHmlbgT6geFgl9iuFZiti7xDkqajJlFUxvAi2kwFRCmF3b8Rr35xUAWWJX9krRgGn35JcboAcKyjOew6yVBwr+sS93El1MFSHriT88vQusoaLRnAcCXT+m4zU+AoXnzkwI4XrG7GT5C+y0mblIbkzryorrpaeIyEM6bIotnyN1Js87MVEdn81qL9zJQzpYMMEwzioEqhru7T0e3vLCDGYv0OUfHHXDJwzxV7/rDZkwT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvZQTuuzSOe09vS4sp0t9zm7sredsjbb8kr6PuiJVCc=;
 b=UOIQNX18j9saG42uoo/pDTfvfoP1tUgizMGu8Sdtn+odMxNBkgNKKmO+EVB2J4EngjE1NCZmw1FL03p+KkYaNMsD3dproSzNJ/QUF3dFAaqbEosIy6zrjYoy43TYy5X7iLz06GnNo5uiIS47C19HbCISD3SGgn+F8Gev2GwWXOYIGL/8pZe+IeaRZYKKNhUCwPaUwoJlW6bfUD579PR7c4uQ1d9kEu3jGR5L99eKug4bZpKEWMllic78jTch2cn7j4Pw8DvN3iKhQH6bAaaWzW28/1BQcC/yi8dusvaj9p3bbVgdui/1nTvpgTIVMlPS4cYHclMu9a//sVbsA3L75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvZQTuuzSOe09vS4sp0t9zm7sredsjbb8kr6PuiJVCc=;
 b=KfgSy0l/0zMMMdCUiRZiKncvlxjAPFOvlabIpcFB3F3Ve1Z/U21gG47NH/ANaztNfFiimaczfK8VIIcV2BWKrYzAPrxpynqpODqEYk9DMTF4F9CDv5oo3vC/BQwBoRFsl4UBt3tnIFFERzTv5ECDm8Tb9Xl1TQvYUziRzoN0gGk=
Received: from CH0PR03CA0342.namprd03.prod.outlook.com (2603:10b6:610:11a::16)
 by BLAPR19MB4531.namprd19.prod.outlook.com (2603:10b6:208:29c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:13:56 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::6e) by CH0PR03CA0342.outlook.office365.com
 (2603:10b6:610:11a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DBA9A406561;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BFB4582254A;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 11/18] ASoC: rt722: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:41 +0100
Message-ID: <20260512101348.1138044-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|BLAPR19MB4531:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d3ef5d34-da0c-44b5-9883-08deb00f2cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|22082099003|18002099003|16102099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	cAzuAJjTH0DjYtUNiSm5h5tRhhePjGb9XbEHCwANYBfYsCmcUAP8uGqdCC/DjvshHJ0IEuueJryBOiJiFuYtj0efNpz64E1NXUraI+RbnyihtQ0W8AgvgdSrNryHQjWZVDSP6kU0JMEqMl386KOOCQJkyyt7O9er+LJDLULEi5ndmQxJQjVDCDM4XQcBTDDS+ATOKcWUzoonYN9MqNIKNuRONnhVeM+aMniUMkAAFkGrnlc75rdPrelV50ASm2V7f6AOwfS1eeVmOi6hzzV1NY2lk0KE8hLG9SBvkZkl7BHtyE89eH+7K/39VwgVWvqtoYVW4+wcAAPOraDEfCYt50ZkeUmmKLzR8zgo5jV2Y3DCJutVrgXdwnQeY8GcRjXYyCt+B0WrJSQLtyZn4Yg9r1b0Hr4mWnRP7ld8y+nQmk10chAn7O7H44cEJI9a7vVNeDqMy5VK6EQ7LO+gUku8uRoMqQm0S/tehsaK9MrROrI/Tjs4pgzNrPxesnvvmXc4z67U7u7t+b7NLASqXywP5e4SqemCJ8/o7S0nb3XhHd3k4PvHydeZU5N6tn439+2lgB5Xwr0ydONz1VHtE673F9cSgsNGF0H+LPQCG1qEfYcEdaPL+tNnqRaX+FWr3v1vdczVJGidSyiMq9m78i/RsSPXDH0cvWN6UC94NddowALMU24VJzvK9ma5B7dWVasEGBeaX0+3JLhskaCQUW7rNtCa8J3fopx3/tuYqZbTuig=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(22082099003)(18002099003)(16102099003)(3023799003)(11063799003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fDnItHM0Uvz9vJeTNBDrARjceDhI2F7Fgf87CLrGDa6U7+VqvTa8F6cVgPh+gi6y0W/eU1SlNsQqkHwSFkGtMzcGg4G+lQQovLkv78arS2OmkBpI8YeKK3Ogs2NQq7jcHy/1O6YNyvj8wz43nIhxGCRcd3PHbS0x7ZuCn1wVe8G89IAlW5Ci4NF5SiSNkH0UNF153pBLH0Nfga0QFofwFZrIfFDwxRAbx7iLv1mTp02bqUnB21AsNrbzhARU7OiJaD6M8D6SOlkW9GH25lr2wYO3UqDgsP6GESXfSQvcyszcuNsVKwIRI0JcFOTEwJyz3W+b32m6cMR59kmXmL4iuRsv4mPU/m8B8tAj5QAXf/hAoitqiYhuqiyymGuIx7Scp2v+Ul2W+v+3PyOAT2mJ6W/oFCwdS4FeSZxjFzHSdpm06CFIHsj3mv9S/xyR6Jpr
X-Exchange-RoutingPolicyChecked:
	HpvWmMCtXXWMQCRuia7h36TpfYS6lBwegEtQW3+wPIPLe6LTRMqIeUNIpIGdgrP07bbCRkoUQDf/ZdA4hlTU//PYF0AhwlUh7Xid6qMOGABLqZKVaxN+gyknxfF0sGQ+0ylJcmsV1wBOBEW/fneFexVQqzBThtj9MWjTy+pvBUegvqBiH2114q6QcGvK3rDz1wVq/IA0aAmebGsa1E8oIU3xH8MSwl8VD/ciTt0Q+M5vDy8vdlCXIcdqsxDTRJ22BAOhQZ5paPMK4ybcjeidXCYFECob2RF7nj4pOLesySKu7rx2e4wdFYPJTkFs0crHRYI9q+Y2phxZMKnqeo54Tw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:55.3025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ef5d34-da0c-44b5-9883-08deb00f2cc5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4531
X-Proofpoint-GUID: tELVA9qae9_9haKe9LKc-ybcHt3NaWqF
X-Proofpoint-ORIG-GUID: tELVA9qae9_9haKe9LKc-ybcHt3NaWqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfXxzJq91MI6uUu
 qKr99IS6RYuc3iV9xCed2FDMpHMxenkEsKYZ6MxnceazbPV58/rpYg8iQLIEr5kc+TpN0Z2PUKv
 b0b8Ub+2szEJR/37DgSc6XxIYOW7D44k3BXfwnvJbwt8LkIyXpOkc3kN+9i4+M7kTPbwzpdr6pI
 6OfBXnhjnYpcF4+Lkp/Iz5IuGFrFg4J6Cwc8KonGSUtcQmmNxs643J8JDzUypzIHtzD+rThbcju
 0o+ZJQKjcCXeXvADE5IhChAcg59na1mRxKrqQR+gnVQW5VYxhga4vd7I+plWW7dAEeN30Spj3je
 v2CWW0lEbRHcfIYT3Z7ehBZEV7FdiOCz2fDIig+g68y9/y/Icqd5qyRVcfJn99tdj5KUBD9cM9C
 y77m+d70vcZgGkqwMAZKexofeuAIui9zS1bEA3oBxDSfx1bd7o7GYkKJvXGBsz3pPlqwCWsKmts
 euvKQ/5xC70z4+6BJcg==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd67 cx=c_pps
 a=NnP4WoPY/9ItU/dr56klNw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 sound/soc/codecs/rt722-sdca-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0a5b3ffa90daf..a5feba3d0c182 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -501,7 +501,7 @@ static int rt722_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt722->first_hw_init)
 		return 0;
@@ -514,20 +514,12 @@ static int rt722_sdca_dev_resume(struct device *dev)
 			rt722->disable_irq = false;
 		}
 		mutex_unlock(&rt722->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT722_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt722->regmap, false);
 	regcache_sync(rt722->regmap);
 	return 0;
-- 
2.47.3

