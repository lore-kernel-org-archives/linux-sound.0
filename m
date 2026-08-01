Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB0481DD
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 02:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785550155; cv=fail; b=PyOCH1/nWFqKdFH0QdWpRu8nWwXxQrIt1XxQzU3j78QXuX8mdzQoG0XhjHpHp8mo6L322hbdebxV+zSSJH+w6Kvm/OXl6IYeyBcissh8XqLskb4T2UJV9vMvA1mrGkbQYohBKg0W2gvTX3vbYDgqSXTXiC/QS5gOXZNGl+NknIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785550155; c=relaxed/simple;
	bh=60H0upS3v9n/azS9aGei9PJ8DQlF9Lh7ero2ZYMGhGQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sr0oTZx8WC0d07W6eQN3oAzzRk/AXJXLr3a5zsrT5FMufqWREs3/o8zc9J7dkv9c6ouEi642V3ycRYGNbVj2YMQT85RNOaIuprnqXHqdE4jMuZDAiYEHiBdDTJ332iRkmZJoaiKFsssFjvKvJWMz26fDA/36Jd0CQPswPgMdlwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=k9ZwJS6A; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=n0HjvVzD; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="k9ZwJS6A";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n0HjvVzD"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66VLxrPB1043863;
	Fri, 31 Jul 2026 21:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kxQwKA6QDsOFgA+3lJcGitjE7BqAVdWGqeGgO4KU1
	Xs=; b=k9ZwJS6AWYpvmZ/YgeTDKDwWcdSJ7AGtHmSg3NbdTRozZ/cBcisGc/N24
	BiEpxs36DlFm/sg1CGI/DfHMr147WPl3O1oWWCKKhtzZpDL7T7ua0cWlQCEO/IfK
	ZaGRvkImdIMM1i1hLqUnH+daSyFewwl/MZV72CwfMttjQYsJ6Z5v8zbix03MIGE9
	PIC1oCeiotEDYbP7CbyKJD6HH0ULbM5Uhv7FXOFH+W0Fqp4dYDvi3P3jmgt0BRz9
	R0jCvjKHldX461vBSXVHl9OqKJRlUnzqwjB4K6jpJq28lNUyXpjFUSMhIPjpLBA0
	rlldMZ6rMht0bmsqFc11ImdLT1Ekg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fruny47xh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 21:08:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3yeaTJkJ/8sVmhwMFRCI5E/Qtwu0+nEoO2E2s5dw6P0hdD1W1oDds39KKMFIuh8CKHx5NSSvVxwgMrrC8S2TNNGkUtnILhgenn/901zZH2c968N95DSEtMhu4FietRz9nCsMvhpEcWXX/WR/nQ6bGV8TLypJTaWTYUOCWViB03FpvWwDQvfaPQukzNSaoyYy8DqBTzlhB8agekabQGIkEY3zsBzk6nQYXgrUcMB/rluXbqioWAnsFtiRjSs9dpVSCZEc8xBx6s/l/O67iMU55sZHzondNzbjqi3L49cloXGTgbqVu7HFyC2jMwxfLyiCZjismKd5b8ITDNh7Y34gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxQwKA6QDsOFgA+3lJcGitjE7BqAVdWGqeGgO4KU1Xs=;
 b=wc2YHBI4lCiiE7XrlbaYYpThqdZUUFOMmIrmMkOgLEK+UG2NnYvja4zt+xHca+8+TJdIC8N5tkpdSUd8Mv8L2CL8Y0Xvq+woYc0mKMozwg+e3ycsTuxr6CADUfcQxgZlydAvSAFPwZL5ssv7hzpyA0aPaSuf+Ie9gDyT2dMKJdDFVpNsudwSuOyCfbmM6cSE/mwRNHXE5y7Gs8WMMIVrzAG/IfUGBO6GJQbhQjD5jzFeSwrLsYjOMLqN61em/UCr/BnDvvpznfX2f4/ZxVpImM5TsGeRQ0NWl1wCxUvNkrkmkwpMKb+qOGq+AiovRhB3DAmHVbFC1l89bh6reZVfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxQwKA6QDsOFgA+3lJcGitjE7BqAVdWGqeGgO4KU1Xs=;
 b=n0HjvVzDVGRgG8AcUOmOyoFW9W7v5Hz7M0Lf/xAiTHYMMPSqH8Bt0xOGAZGN1DFtN3PwYh8mdwlOPVVWmEha/O3M1f07InSPL0z9bAgz5luIRvqq/fGfYvjxhZZjz0FO/pn0tXb2bgZvoltt782377db1JKwD5idiONLHxSbiMc=
Received: from IA4P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::11)
 by SJ0PR10MB7692.namprd10.prod.outlook.com (2603:10b6:a03:51a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Sat, 1 Aug
 2026 02:08:40 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:208:558:cafe::41) by IA4P220CA0011.outlook.office365.com
 (2603:10b6:208:558::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Sat, 1
 Aug 2026 02:08:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Sat, 1 Aug 2026 02:08:38 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:08:37 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:08:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 31 Jul 2026 21:08:37 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.253])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67128PhM2329859;
	Fri, 31 Jul 2026 21:08:33 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1 3/3] ASoC: tas2781: implement is_cap logic and update all existing callers
Date: Sat, 1 Aug 2026 10:08:21 +0800
Message-ID: <20260801020821.2016-3-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260801020821.2016-1-shenghao-ding@ti.com>
References: <20260801020821.2016-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|SJ0PR10MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: 513b38c5-0238-49d4-7ab7-08deef71cd6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PWeNU0Q7WdT7kBCRVsZBxE2k+mDAGuf11tyBQw/adMMZ91fpbsufLa495F++qX8ZSkTFgqLaJ1JMI5xb/yePR5OY/kK0/fmkyzWvcZoPMC0YcgHxTY4zd8Jc0+2XB/LjA0PwnzWSyGKR598MDwO7f9jeQSw+oE6M1sho3iBSh+PvQDv9NUlbOQFm+PPR0qPONceAmhksvK+OVWogbgZtZhlV4SAJPfOVhbV6EfgbkT6ATmj2RwiuzMvBAWX3NkvOHupVX4qHnlBFz1PG+WeG5WwuNSwvJBj0ar/ib4grmCEk5SOX54tMMgKElUjaCrQt5q03rBqTY56T43SknWXnXWxAHnqAAFh3ALEN7GWUokoqZlu/4VeKXXGS/ShDhAaMnkbrU4GP3jE6cwSGBkQtnE5BBgorGjbFQQha7KB0O8cFrs3Wh6y8HVU6R1+vvM0u05p3YrBRBJbPC8nHIS5k6NlLienJRFQ27b0mWFwY/w9cHjEjhmThhbS31R8bTlKQ8Ifgx5O6Jiu1G4DWyRQLVfviZnWC84ZeW0tUcjisVyTIkqLrjGeITa9TqHfJHcbtKRDgWk46u/m7WTA1uobwsl+OBP0zTkU5G7GaDhi2FfwNwYPV3dbPVkQPgOKn0G0g4GFocK9nkDfU6qbsobUfpLhiNWs54v83FPioD2JxZ/6YY3sW4kKtP5OhcWUmrYegSgGFnJdBGt1V379xIgSyXw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pwO4e6T5Vl+WklMWUFuRpMRH74iZbHvnqqGvVL/LI8NpHm/W1gXq29wM/5v5PSiYjVY7FBMoHgG3H7KWagt4yIT6h8bVlRYM1l4FeYX9GNEoJ7MoRI7jfK65nTPCojvfIrndDok8eO1fyzB/qV4G+XyPczmtEODJixE2pncTSaC5XgESaEK8hGc39/kWYG+K/QHV24vJnSaQcqfNMseW0KwlsMArtV+aIqmtXMQ4re9G8jww1X1qhkmsB9PDtup7YpywUYGbmTt5VUzlBVDkdUL5CAjTZED3N3jaeXdxdWbV4ZYROLeHiY453CQXgXzlpJjeNMJqh0xs9Qbd5+4pumSYeRC6/EFOq5nojKFJqE0g1eCFWicOMf/35uN3BGTl+Q9q6ZDAImAW3ADVCEh3WsV5a3vDEWLCibGD6VWb7LeKacP1wsqD7aZ9V8IV2jLs
X-Exchange-RoutingPolicyChecked:
	npjKDMrdXdM9ojVZ05Xz+FBCpzz1Hrec79kJImqttNdMOtpihH74Yzdrw2Tt2Srh3ry6RefyZ5P9ivGNzLncgwDNQsOA0CZZtKVn6wndbQwg4rDwxFP8nqZKLR2WgkRMCFSg+geXGcf/tB3O/2cJ0OeAxCaw2MGzI3NUTyNk0kOs6fdvZuCK6z6KScM9w5pjjwAPnrhwZiKTmXUuZaI5JDfZ4ChS4jowXExnOxdAEBpOjGJUNqTEPNnHQFebCdmNVbtGh+d5j28m8fq7wAf0oE2xQVKi240TDnLXxZBJtRRb3+YIBRACapgXDFk24urh1RXK50z1gFlW5WrXado69A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 02:08:38.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 513b38c5-0238-49d4-7ab7-08deef71cd6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB7692
X-Proofpoint-GUID: AEM_vsaEnaCIlMQlQMhhQYa_fAcP-J2y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAxMCBTYWx0ZWRfX6skMRoxKDqHB
 kkMCg72oMC9YVncl1hb6GRPr45GdqKApc76HU1RmSsmWw1IbCjuusIvom2AQN1NvyduiC22vcob
 3y30xkt1Tr1a3bTFAtHtohZn+FIpnFw=
X-Proofpoint-ORIG-GUID: AEM_vsaEnaCIlMQlQMhhQYa_fAcP-J2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAxMCBTYWx0ZWRfXwgoXKoQiLSMB
 ydPEXvU/cZkaUPgNhUo7eYBWIBB+VUULpqANbLje987+8QqR+cVcrLBz2oSwThZaWswThHCGhij
 uXSThi7XYRgzmvgGLVWYuHxro7d99BsbEcLgBqi743BYa+UXyM74Lg+/mPEqGYUIefl4B78fWM8
 s3zhLBel6suZgfpdrXS6D/vChc+TEOvDnKySzv3aVgeFm8DsXToJZUZdM67xAeBGQAThQdeszj+
 rUKrdin6Y5cdM79R3/iS2zSselIhZT6cGgM6c5nFnXz8o22ut267ba/14+M9Cny1KT+qdhhvcwf
 k4m11mmly21Jx4O0t9nBSK5TlelNAtc0sngKHOe/bSeZFIgB3Y3tlAw4m7N8xfiVm/gceLfWwtT
 MS8KIwYnOLkIsGs7A5gZkH6P9+VKkqGhDpaoCqtdGBRc8B/ssoBgPh8BGYOlMBghMd91R/k2UHi
 aNg4wV7MGITK+5xT9VA==
X-Authority-Analysis: v=2.4 cv=Db0nbPtW c=1 sm=1 tr=0 ts=6a6d552d cx=c_pps
 a=bquUzJqYOqw1EpBvECFzMQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=Z1QfH3X8vcsLbcNVGnkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010010

Update the implementation of tasdevice_tuning_switch() to select
capture_profile_id instead of profile_cfg_id when is_cap is true.

Convert all existing callers across HDA I2C, HDA SPI and ASoC paths
to pass 'false' as the new is_cap argument, so that the original
playback behaviour is completely preserved and there is no user-visible
behaviour change at this stage.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 10 +++++-----
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 12 ++++++------
 sound/soc/codecs/tas2781-fmwlib.c              |  6 +++---
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 624db967f17b..8b08b35b1dde 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -173,13 +173,13 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 	case HDA_GEN_PCM_ACT_OPEN:
 		pm_runtime_get_sync(dev);
 		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
-			tasdevice_tuning_switch(tas_hda->priv, 0);
+			tasdevice_tuning_switch(tas_hda->priv, 0, false);
 			tas_hda->priv->playback_started = true;
 		}
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
 		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
-			tasdevice_tuning_switch(tas_hda->priv, 1);
+			tasdevice_tuning_switch(tas_hda->priv, 1, false);
 			tas_hda->priv->playback_started = false;
 		}
 
@@ -722,7 +722,7 @@ static int tas2781_runtime_suspend(struct device *dev)
 	 * Stop the playback if it's unused.
 	 */
 	if (tas_hda->priv->playback_started) {
-		tasdevice_tuning_switch(tas_hda->priv, 1);
+		tasdevice_tuning_switch(tas_hda->priv, 1, false);
 		tas_hda->priv->playback_started = false;
 	}
 
@@ -752,7 +752,7 @@ static int tas2781_system_suspend(struct device *dev)
 
 	/* Shutdown chip before system suspend */
 	if (tas_hda->priv->playback_started)
-		tasdevice_tuning_switch(tas_hda->priv, 1);
+		tasdevice_tuning_switch(tas_hda->priv, 1, false);
 
 	/*
 	 * Reset GPIO may be shared, so cannot reset here.
@@ -785,7 +785,7 @@ static int tas2781_system_resume(struct device *dev)
 			TASDEVICE_BIN_BLK_PRE_POWER_UP);
 
 	if (tas_hda->priv->playback_started)
-		tasdevice_tuning_switch(tas_hda->priv, 0);
+		tasdevice_tuning_switch(tas_hda->priv, 0, false);
 
 	return 0;
 }
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 4899ea372798..e05f12a0c8bb 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -399,11 +399,11 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_get_sync(dev);
 		guard(mutex)(&tas_priv->codec_lock);
 		if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)
-			tasdevice_tuning_switch(tas_hda->priv, 0);
+			tasdevice_tuning_switch(tas_hda->priv, 0, false);
 	} else if (action == HDA_GEN_PCM_ACT_CLOSE) {
 		guard(mutex)(&tas_priv->codec_lock);
 		if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)
-			tasdevice_tuning_switch(tas_priv, 1);
+			tasdevice_tuning_switch(tas_priv, 1, false);
 		pm_runtime_put_autosuspend(dev);
 	}
 }
@@ -847,7 +847,7 @@ static int tas2781_runtime_suspend(struct device *dev)
 
 	if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK
 		&& tas_priv->playback_started)
-		tasdevice_tuning_switch(tas_priv, 1);
+		tasdevice_tuning_switch(tas_priv, 1, false);
 
 	tas_priv->tasdevice[tas_priv->index].cur_book = -1;
 	tas_priv->tasdevice[tas_priv->index].cur_conf = -1;
@@ -864,7 +864,7 @@ static int tas2781_runtime_resume(struct device *dev)
 
 	if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK
 		&& tas_priv->playback_started)
-		tasdevice_tuning_switch(tas_priv, 0);
+		tasdevice_tuning_switch(tas_priv, 0, false);
 
 	return 0;
 }
@@ -882,7 +882,7 @@ static int tas2781_system_suspend(struct device *dev)
 	/* Shutdown chip before system suspend */
 	if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK
 		&& tas_priv->playback_started)
-		tasdevice_tuning_switch(tas_priv, 1);
+		tasdevice_tuning_switch(tas_priv, 1, false);
 
 	return 0;
 }
@@ -917,7 +917,7 @@ static int tas2781_system_resume(struct device *dev)
 		tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
 		if (tas_priv->playback_started)
-			tasdevice_tuning_switch(tas_priv, 0);
+			tasdevice_tuning_switch(tas_priv, 0, false);
 	}
 
 	return ret;
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index dcbeb9618195..11d1c2ac865b 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2797,11 +2797,12 @@ int tasdevice_prmg_load(void *context, int prm_no)
 }
 EXPORT_SYMBOL_NS_GPL(tasdevice_prmg_load, "SND_SOC_TAS2781_FMWLIB");
 
-void tasdevice_tuning_switch(void *context, int state)
+void tasdevice_tuning_switch(void *context, int state, bool is_cap)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;
 	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
-	int profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
+	int profile_cfg_id = is_cap ? tas_priv->rcabin.capture_profile_id :
+				tas_priv->rcabin.profile_cfg_id;
 
 	/*
 	 * Only RCA-based Playback can still work with no dsp program running
@@ -2818,7 +2819,6 @@ void tasdevice_tuning_switch(void *context, int state)
 	if (state == 0) {
 		if (tas_fmw && tas_priv->cur_prog < tas_fmw->nr_programs) {
 			/* dsp mode or tuning mode */
-			profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
 			tasdevice_select_tuningprm_cfg(tas_priv,
 				tas_priv->cur_prog, tas_priv->cur_conf,
 				profile_cfg_id);
-- 
2.43.0

