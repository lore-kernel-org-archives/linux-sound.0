Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D9357CE8
	for <linux-sound@vger.kernel.org>; Sat,  1 Aug 2026 02:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785550156; cv=fail; b=N6VYJRy21XOoz3W2aMo646QxY507aFsESc2pKbcBOHOvKxmX0//s2sqF2cP44FSEdLEhblv+TQOMsC2Uh1eIQiqmeiNdQGEz2dTzZboTJ0dLtDyWPIJ3IAr4grYfD/qJo1Ts2IT2zpRmm7EGqVGl9ra7HOUixAz26PcOoI8UEYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785550156; c=relaxed/simple;
	bh=3WscANFHUat+wyNKJUZi+YCtqs8KkHbLuFLG5wn0pgo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a7EnEXS2n292DFyworzWCmvVufu7MO9JhOr9EFY4xQtbi/wT/V80TASgj5UCjEr7Oo922yDMldlCBf2r2b/EsEL10T0++Wu6sbnaT8PgBtnlnGTfynnW+B6h1N8qx3pp2xaUZ7C0LcyJSoUKPzvlddpygH45hMr26lzneGGXQhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XRqCau/2; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QNhh6Q91; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XRqCau/2";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QNhh6Q91"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0LAf916560;
	Fri, 31 Jul 2026 21:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=SQ4l1f4pUEYqdtAToU6+rCEepGGxdZOEvHauVqwqM
	Zs=; b=XRqCau/2B4AHAHr5cD2bT+BxSiH5ShzBdp0Tg2KEf5DJkz7yD9YDDb5AZ
	UFNZvVN5Fv651oZvEZRSgxfEXcBVOindUWgVfWFSsycoITAtvOCvMzSc115o4g3w
	sXhSKJ/IqRXZjEnF7sNURrWTR2I1TLRaZY1aXVbTg+2io84ilc1PXEItBuPCiXtD
	jY05SgKdH+UB9duJdK5PDr/5COuxhQk3LiBaZ1pM/nwwC7JbNVoSYr4gDHcVBmGm
	AtvfRipuaOMX8PcSqETVHjpxPwF6JaugPFDj098n9g16bIshfZ1BPtdWl5xcihWi
	QIzYwuTVxo5p/tosWmApOzbop3x4Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fru8kvbfq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 21:08:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe+pYp1wijdK3xvr6iw7T46CICm/gyePAU3M6E35gL566gAvYgV6SuUyOGyacxtT3QLNfJtNxJE80uzYJDL0Kp+lqfKDNNtUJV5uzF80En/giyHQ5FK+1fEjOd2L5DAGVbSqsBsn58jY+21u/9CXKkZwUS3vu4qcu2gjvlagZLcDHqpov//G2EGvrQDTEz2eEfje5mo4CjogsFL/re7nq2IskRT89REYjZBOL528WtUsbPEW3aJCeOgZyu+rCTSzkg8zeIQ1zgah2T07r+V3rX38a8Xa1pjIZrjTQ6ed17j39mgUAWu0jbBu299Oc2F+TTW1BY63BQtuvkUO2EDH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQ4l1f4pUEYqdtAToU6+rCEepGGxdZOEvHauVqwqMZs=;
 b=NEAIihDwE9qSJcvWLXi6TsJD5NnNKqMtmpzvbNcMn/RqqlpUmxAbybGEJVYfuUFE60hiy/MQvfLQMHgsbNhQk+fztHXScbg6Cfz+0/mYR+i2+xt4a9VPhow6/E6iDlhkhPWRWA8Yn25XiOTixdfCdTYrAXSHvgeqi+/SuzV/Q/MR/fzy9sX9xay/0eGMEFNOXz9+snOZ+Uh2UiKhPAQJUZr7eusnK1rAxpPVUOabLKszG7NaRY74PXEl5Cbt4o0q56vCfApII48YJKi1nAdcPCPqWUFcvFH0WfFnIvZfAwNJgaxdSpByJAjDsOMkPsdNZ/9YNL0IIKOO7lQVw116pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQ4l1f4pUEYqdtAToU6+rCEepGGxdZOEvHauVqwqMZs=;
 b=QNhh6Q915E4YrXec2mDrjDQkvYR5ZRWZcQ/FhC4fIwlHqAjGK06uqUXZb5po/dlxyxlF532ofqEA6LVYUEiQKDIXbW8p5/z+tiWg4katfW0ge9hWb9vglILOIsnB6a6p63BzS8lt/S5PUOLG2a/ca98hHy5QNzN2e+J6Mgk8C50=
Received: from SJ0PR03CA0262.namprd03.prod.outlook.com (2603:10b6:a03:3a0::27)
 by BY5PR10MB4340.namprd10.prod.outlook.com (2603:10b6:a03:210::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 02:08:35 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::57) by SJ0PR03CA0262.outlook.office365.com
 (2603:10b6:a03:3a0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Sat, 1
 Aug 2026 02:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Sat, 1 Aug 2026 02:08:33 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:08:32 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:08:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 31 Jul 2026 21:08:32 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.253])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67128PhL2329859;
	Fri, 31 Jul 2026 21:08:29 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1 2/3] ASoC: tas2781: add capture profile control and capture dapm event
Date: Sat, 1 Aug 2026 10:08:20 +0800
Message-ID: <20260801020821.2016-2-shenghao-ding@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|BY5PR10MB4340:EE_
X-MS-Office365-Filtering-Correlation-Id: e2383888-712c-48b2-dcd4-08deef71ca2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	laeoyBH0dD4JQG2VUnErbVu8Re8FPs6m7zLEnwBjWACR52d0CWDt7rc5XFJckfUKMBhlKWhdpzUY5u5ke2iN/husjMcUPtmIS5OrITC6udZZVpMv3GnRYZkHf2zYwr5e6DectGCX2Lfj/Bqs6LLlzVx5YusB3Lz2qu5sv8+AWBKohwmMC1RJytbTvVc7YPGdJTpHMiUN215E5A3Pi80umYdXt6Gxg/LVIPWIpQhwazFSfX+3rHhgO+Fggu92a/xzPKs/t2GCeqr1MKKEby68yDzy94DGE9FGl/QjqES1u2IXa3ccJe+stek8crUXmGAT0p+jfa0S8xltQf1eXOESoANi2SAu/+OcKjgkURvkrbfl4xLC0F14S+ePrmb1cuTb27NKC4Q4ERDSJjo839ZClZNS2LMWwbnkJtO+MLJygv1P2vzIi8DiDgtVGVkw1wwxBP9cbizwNw+B4K3Sku7C6keBxOC/qxNHwRQth6vyzxEtZgUarm1tU7Lw8V/KeHcwnqzPqH1h6Bp8UGfo2unU9UfhN7RvXFMo1fvcR01/cTATdCDBXuhImkVMsjgiQWb8z9ncxa+iezLdwIkYCbxR0BkN5r8kaXp72uDBQn1ysL28tpevaNoM79WUTfWsuH65w27VpCvyTKBPykR3S7UGEFLd7r56Bqj+rvGmt2nZd4lNxCwS++x3gifkiMNJ/WDlL5MO2uC/lBYa0e8VMRlSiQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	puFZHs1FcBQC9hbSVYxYq41eWcthKcluDGccxcoRC87ScGfkKQ9KgJYarDbq/xGxQb/UThTzllZDnOEluWG6CxqloWm80NbAc+xdW3LtSDDbxly0JzP50lC4me0QuXx0LONCES1KIwl0N5b1fJ8FXWYKillQpBeYatKO9LLAUU3G7Dsbkwwl+rpc+Af0hlruFOUtoCyv2Bw0v5fMhlEiXTRx1lqdwlfTT0kgLthlMg6t0OooWdknYU4kvhFPJp9X5wNr0FrjS0onDzrj+A4Jbv7evkcbhCUHc1bZT0aGtmqrjz/OkFzsTCdvML4IoKGU+6wBK4QoH76NzavGUacki3jTZscs2yU51gHvpupr0IOfKCZBpNz4lVc4FxqDbB3Q5sDmcxcWxB9oAlVFO8dVFNfKjiY/HUG0sjAD7pL+/3bMYo+MDD/YpuWvanKIT9O3
X-Exchange-RoutingPolicyChecked:
	e+Qapf9UL1cJSKizWXOGe1eItDDeLx5ELs1W6S35A44YazR+u7Q/qgW9/TSgUoDlrnTRoaHVjMEk+eT4b4+VEZTqsLN7EtuJjZ5PiwXzQmgezHFwZNSklCBwBl5CsTwySMsgEAz8CVSLNigab3z84/SWjx8Rhxng8pAD9U5382RJz+ynsJN4nJdqamQyormT7I95Y3U5IJcJjUAcU9nI0VIGUNeTsV5G+RETOqQtpyAQBYd8TpmGEdzwPG1RBsmt90uBF4ZV6p0Aid7YabTK2atbZXx5HhQ1tml6Qj7UAtjauxdjjV6SMnV13IPQ/YpEX+AQ9OyVMF+yDSyN3OG8Ug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 02:08:33.4262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2383888-712c-48b2-dcd4-08deef71ca2c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4340
X-Proofpoint-GUID: TkXA_n31GB_TKY5f_OQZinASOZPekK7N
X-Authority-Analysis: v=2.4 cv=VefH+lp9 c=1 sm=1 tr=0 ts=6a6d5527 cx=c_pps
 a=26rO91Bbw6QoawbNyte6AQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=iM4NM_IVR6cD9Ymy0PcA:9
X-Proofpoint-ORIG-GUID: TkXA_n31GB_TKY5f_OQZinASOZPekK7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAxMCBTYWx0ZWRfXw0ZtY5gQcroP
 8duNAgtn2AZu19JDIIMNCbPn/fK0zwpLdtAaiT9YaKkXKyRRpkLwg1nSiwGuyWXhjI2w1exl+wV
 orMM8d27J0wGaar/U/02nGBKGlhqNBWuIYv7bs7dkzNTA0XaEpKNHbdSsjYB1sgymFlEhD3O4+w
 DZScP4vd/2IN/VIR1KOPeJnwDQNarYof+ReqXprNNIg6LPzgZHtheA8bsKcAP+UKelSmkfg3zR/
 Euas31iv4jKBDn4fSlmEhBZxZICAlpKRD1V+VpjvKxUDwVGSLK86+0zdDSFHvH6GHSqlrN3SuRw
 cGfhTpZeFzHQX6CHsn6dc6MHnrj21AvoTEBTw89+2ELOuhjlQet9/qOf/rOX+x7Zwwa8z+eQpin
 9PxskzhG7OBPtX0Kcje0MgmAmtF+8yLGOfnDvYHQ8RJV0Lhnni3dRlnUlkzGYmiZ1uwT0KlUfNH
 fL/c9Q9YXBldbWbDOQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAxMCBTYWx0ZWRfX43TcYXWxwI0F
 d0t/zpueKnrXWKXATCPtCFuCVjOvKX58JQZCsD0COQo7oQRSZat6P0GxZjM0EhFroU4FMg5022G
 /ObbDkWIJcwqr1p/8de5npdN36MqDLE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010010

Expose a new mixer control "Speaker Capture Profile Id" to user space,
so that applications can configure which profile ID should be used
for capture paths.

Add a dedicated DAPM event handler tasdevice_capture_dapm_event() that
calls tasdevice_tuning_switch() with is_cap=true, and attach it to the
ASI Capture widget. This completes the end-to-end support for PDM
microphone recording and IV data capture tuning on SmartAMP devices.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 82 +++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 01442fd57d7e..307af0d4807c 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1000,6 +1000,23 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
+static int tasdevice_set_capture_profile_id(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	int ret = 0;
+
+	if (tas_priv->rcabin.capture_profile_id !=
+		ucontrol->value.integer.value[0]) {
+		tas_priv->rcabin.capture_profile_id =
+			ucontrol->value.integer.value[0];
+		ret = 1;
+	}
+
+	return ret;
+}
+
 static int tasdevice_info_active_num(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_info *uinfo)
 {
@@ -1080,6 +1097,17 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int tasdevice_get_capture_profile_id(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = tas_priv->rcabin.capture_profile_id;
+
+	return 0;
+}
+
 static int tasdevice_get_chip_id(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
@@ -1122,6 +1150,41 @@ static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 	ret = snd_soc_add_component_controls(tas_priv->codec,
 		prof_ctrls, nr_controls < mix_index ? nr_controls : mix_index);
 
+	mix_index = 0;
+	switch (tas_priv->chip_id) {
+	case TAS2563:
+	case TAS2568:
+	case TAS2570:
+	case TAS2572:
+	case TAS2573:
+	case TAS2574:
+	case TAS2781:
+	prof_ctrls = devm_kcalloc(tas_priv->dev, nr_controls,
+		sizeof(prof_ctrls[0]), GFP_KERNEL);
+	if (!prof_ctrls) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* Create a mixer item for selecting the capture profile */
+	name = devm_kstrdup(tas_priv->dev, "Speaker Capture Profile Id",
+		GFP_KERNEL);
+	if (!name) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	prof_ctrls[mix_index].name = name;
+	prof_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	prof_ctrls[mix_index].info = tasdevice_info_profile;
+	prof_ctrls[mix_index].get = tasdevice_get_capture_profile_id;
+	prof_ctrls[mix_index].put = tasdevice_set_capture_profile_id;
+	mix_index++;
+
+	ret = snd_soc_add_component_controls(tas_priv->codec,
+		prof_ctrls, nr_controls < mix_index ? nr_controls : mix_index);
+		break;
+	}
+
 out:
 	return ret;
 }
@@ -1773,7 +1836,22 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	guard(mutex)(&tas_priv->codec_lock);
 	if (event == SND_SOC_DAPM_PRE_PMD)
 		state = 1;
-	tasdevice_tuning_switch(tas_priv, state);
+	tasdevice_tuning_switch(tas_priv, state, false);
+
+	return 0;
+}
+
+static int tasdevice_capture_dapm_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	int state = 0;
+
+	guard(mutex)(&tas_priv->codec_lock);
+	if (event == SND_SOC_DAPM_PRE_PMD)
+		state = 1;
+	tasdevice_tuning_switch(tas_priv, state, true);
 
 	return 0;
 }
@@ -1781,7 +1859,7 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT_E("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM,
-		0, 0, tasdevice_dapm_event,
+		0, 0, tasdevice_capture_dapm_event,
 		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_SPK("SPK", tasdevice_dapm_event),
 	SND_SOC_DAPM_OUTPUT("OUT"),
-- 
2.43.0

