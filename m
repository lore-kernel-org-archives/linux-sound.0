Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC9D3B71B6
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450535; cv=fail; b=pQA1oTHfHFSsNQgmJxSV6O1TMBlYbVlgK8exoVfYIEItLdHpFZ3Y+vwJdpXab2Tt97EE8BW/x8igHactPJxcjuLgPOuF0ULRunq4mXuGSsvcGiapDSCRacJKmoFPZnRoFW0VkM9Xfmr4aOk+ZAy4qJrm76c0JnkJhHZARvLeZ7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450535; c=relaxed/simple;
	bh=ZupexRyhusrlACyi3vCDi8dwCP/PWyXreaRxRA9HYnE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LcaDU5A/+45MBoKToIqptMDMFktEhVaG1LWa3MYHP+6Qfh7rHwri0FhLRoFDgPBnM3dbGdj4imbe6bnKf2lemEFNnayMcSsWJQvveLF8+6Ft4fI7Hix3E0xfhN20I3Tp/g+lIxt1WY7c51c66C+3LB6FmaDPCrNStDFFB7ruOn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jXVsGfNg; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=erPAX8Ym; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jXVsGfNg";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="erPAX8Ym"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAKUKK1082164;
	Tue, 11 Aug 2026 07:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=MjKh3FixtnAfZ
	q0nhbdAicdcFCifbKLGTWKwXiWemOk=; b=jXVsGfNgm1VrdwEpZg04rPw/huBU8
	aG099FEBNBs4xSVwP6TCi1gaauTih9KLbJwSClEtxZco5IzMideUnCjkEVfZZZ0U
	mjqfgZEJjXtu4axO5InAEwlNRxHfeUoGFQF+i8NNFX44BUfCr5/Fe7P/FtXJr3zx
	QjPXTsWdyUXDEWRDiIFtPniFE3MCt6hdl0XHDUbEg1KGvb7+TiwF1bkK1kbaBb+M
	b6I2nMc8GvW5/46UW9wOm9K6vAWt7fZzWU2w9F7YU6OZmNBwP2J2MNX1ti7Tu6tL
	iW5/382JUYbee4WAVC+4a6j29FfkFZWcxBzGW/6hHaGex/2adqBZlLvdQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g00wn8qk9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 07:15:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3HxBKEHgEsWGLu+NIen+Lx181I86HcnWgq8XKuBi6WUcKIViPxrtvKG1WmCZdeIV4+tNf9/Ha8IiITIrdXlsPB6Yg/ClCj/K4eQ26E3KSyy6Kx0Vo+vIhw2+qXoA1HNGeVzabnRxm8EZczJ8KNVfX17qSdt0fzbzqgIH0SBmCBDvtS6hxPTqTzy+Ii/c9EfF1w6jYyiRrSJzMzjh159D6/M5YDxJ49vhDoB8/ChnSvrjhEBcIC9FpyUU9VKenXt7J9xnGU4fLiSFSLJ4fsXbn1WsQv7bdpySbaYZ/CudVLTKeVk1Z6IseVNY/MNNjrNXX8QQirBS5eXVBpze5BXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjKh3FixtnAfZq0nhbdAicdcFCifbKLGTWKwXiWemOk=;
 b=otnnVETG9rBAZMO9dj8nDXNZSvbP7h9gQ4X5lMx8JPGatX+C5d6X4qD640S8Huem9VphyeZWtgh3B02wIS1m+BZFb1hGLAq6cWhLuR0/jPHvKRP4uwKEZBnP/8FHuJHF4/gxhWEevm1JuUryRkKBCkxRfQHkLQu7lAuhPgtTmK0/cWy7qZcg22xRFonPUdQvY3LPnNVxyZ82qcE12erXaXkmCcuA2gcJa/kWzuK21ep0EF6x6bHtcOELJ7LUiks3zSff5pTtaGYqIlK81TiMzoBhjtFj0LuhIZMVfVU1dN3+HoYZauTH2ppzMAA/cQzagFByj/4BGyQ2tku1rN+Zhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjKh3FixtnAfZq0nhbdAicdcFCifbKLGTWKwXiWemOk=;
 b=erPAX8YmJotghlg0d0vKXP3UH8aEuu6dsEl5LvFTmVxHOdo2AzrlneypFcr2waqC+x0X0YA/XQlOMthsHdky5YDAGJyv59SJPefavAZd3U5MH7plcsfWMoPwAwDjUDmM0Q08wW8yGHbSCiVI6gb4PQudmOGknNuAYYpOzHEJkUg=
Received: from BY1P220CA0043.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::11)
 by IA4PR10MB8349.namprd10.prod.outlook.com (2603:10b6:208:567::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 12:15:02 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:59e:cafe::64) by BY1P220CA0043.outlook.office365.com
 (2603:10b6:a03:59e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 12:15:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 12:15:00 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 07:14:55 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 07:14:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 07:14:55 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.253])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BCEoZD135633;
	Tue, 11 Aug 2026 07:14:51 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Fix compiling warning for tasdevice_set_capture_profile_id()
Date: Tue, 11 Aug 2026 20:14:46 +0800
Message-ID: <20260811121446.1805-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA4PR10MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d86950f-9f6b-4238-5cf1-08def7a22a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ajjruu7iZo3KeYvQNE79COWI37a5IkfaE4p0VVHkASau+DcRokpTkW0N1JNzOEbEaJ4LErTZwLzg+Og28FcfuQ9GQi1ZP7VaeZgiihkOVW2DhkM6aJMEDREyzGm07xZjSNd7PkCJWZ7W3iHnqUb5cns5uzu1ZMbWjjNPuIRPwqkvQQce0UEcUDgQlTzaSNm1TObQ6OequJhx0uar231rFtlDmZKkBlLBt6heBBpFBkcTbP2u0dIA/yKOWt+KlHy3Gq6gCGSUozbmyGdRBi1m8TgfGvnAhMZHOyGbN2ehaP7zLs5ugulkGE9tHLm5SA9BWzvsQouNgpav4xiYUB2S1rjioyAUrgU5US0/3li+vU1S1JFnKcLsg9obw3MvARkPY+VLbpvvLKLkoZ6agPuvLDsVH+Ob5XedlqppUFBdsGvUa0K+ZLlOwOBth+UhlXCW508DOQwSLtnGkZtdQxZqTKgIl2mr6nIEeVtfbdepBpDzZuVekBKKNdBfpTupVc6BFBN0pOQt1UNHEaI2LZiJlYjG+yBB8Iy12fC9Q47bwh4L2sqe9e7PLvJeAhv+jeLNvXPiBOvEPC8NUvUeb96lgX1WivAdRt500++yv7OnXblq2/Dzqrq+McucmgXuvvJXOmU2nPk4ULd0EmJC8UJWmMl4f2UJN3epGwKFqCtoQ9608o96dz8RHMggrNv1XfL4U797Gb/GrnLaKo/onG9SvA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lFb5ATa80BPaeKEaCID5VXdwrqaAECuZykk9cTTwfiZpWu9j7ql8KJerECbksEBQO5jA9obk2gck6jJorSQmEf/Q0elpNv0cKbNvFcTLg04D7RFZ4z1261gkbxppPnQDWkqOCe0jv8L/5U+WvPtoeY9nfcEgkT969JB5R0g19vVw3shPmcE/PloClLRTZHFi3uuy6fx/qD5+7SzJMCIbPtaHD8hRhTEKjXWo7STZrs4cnpqVWP4F7PMZaaNQK4DZ9kyTHr37rL+lBBch/vNvo903/7rm/Cn+6zgQwOBro624l7WPbs/nG71vFNHUSK0mhlAZ8OTlM54EEK2P1Ukqe6mE5Ivj54EEPMIbawIMkEyd31vJ88NotympONggnYXKnfNky/cCEKSZy1cf84M8MZ2sKtBg75hNShn1Pjqf4LtQOl2shHLi04xdRC0mYEO4
X-Exchange-RoutingPolicyChecked:
	Eu/x8dTW9DFTgaaqrXoFWhmiMjH8SGUfV+J0IRmf+zcXpJDlvbiPD0yglYumkNBvgWQzJ3Z5uZ3oWGxov54vXwp9Sq37Gshn+nZrjTIkCBzsUT3gvhxbeoYHODxd0NBR9DjIcvGn/EPu4048sNl3ifUVcW/PkGCbNUYdAsjW8CkF67HP7wCuIsNzM/ax7E7yZZmdGKU1sB2bZHcYCU/yAPx90BixB/jHD97DeZgDwrl8yu43FdLc58pVJkI10/9Q7L/aBv2JbOPlLCegVwNXfqieIbqvzbxSTwori1K2y3ppN6h7+r+zpkKoXk6NCRbZt+egg3+z1xT6gLxAr8W3mw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:15:00.3174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d86950f-9f6b-4238-5cf1-08def7a22a96
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8349
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwMiBTYWx0ZWRfXyodfc5oJxQJi
 eCYeRFJF1ZJZhDTnkB8VHcZ5BuMw3SNokBfrv74YRaUf3kCDzQEiJevq7gisOpvUgjwQxt/YSGZ
 sINV2/nRKu28j/H7ZIOGyjZKS3FzNfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwMiBTYWx0ZWRfX+ZnB78AcDVLe
 B/acYhsoqzBpBNGgYCR9VOPuncAhCSgc8WTvLZei4XrlDIf8Up8vFCNVcEqXFW52dEsYzbcuHal
 k3LdYPB9HF2L9X8mECqiLMrQiq52svcuWRSJnTzdAjS6yctRXhWSyN89TAbE8ntR5QMx1Y6O0jZ
 N3jIfCWa9sV2wA/QXsq3fMdWhFDH5iwIV2f6Xnty8id9v7xfM03H7Mkum8kMGs/gVz/LyL3GgG+
 FE13FRxVWIzBcl2QIUIt+FN2D8oz7IqdQ2g0pDhT1wPTeVvdmrfRCxZOodawlGn+HazuIHKrz6V
 gOgygsAbNQaHjhw+Qt8xq3OF+1G8x2Mx3fG5k43tszArNBX4k0SNQi1UxdDv7vKXGZF3nWNeiuA
 Oo0R853UmPwBPRVn4iWo9GQKdKT420e1Tt/dvoQwadrLwUkRIB8parUDMJnT94J4AB3eVPrko0w
 FyAqeHPGLEgg8GekN0g==
X-Proofpoint-GUID: 7YQBTjwBCQYPwuoKkCv4euRY7EzPX-zP
X-Authority-Analysis: v=2.4 cv=cYziaHDM c=1 sm=1 tr=0 ts=6a7b124c cx=c_pps
 a=51LUNg6eRAGyxmNGkw1ZTQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=JrvzrxkUy8R4omfF7ZUA:9
X-Proofpoint-ORIG-GUID: 7YQBTjwBCQYPwuoKkCv4euRY7EzPX-zP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110102

Correct the mismatched function description, parameter names and return
value documentation in the comment block. No functional code change, only
comment and documentation update.

Fixes: 431c15610d01 ("ASoC: tas2781: add capture_profile_id field and update the tuning_switch function")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index f15ea99e9119..69091fd76c53 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1001,18 +1001,25 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 }
 
 /**
- * tasdevice_get_capture_profile_id - Report current active capture profile
- * ID to user space
- * @kcontrol: ALSA kcontrol structure passed from ALSA core
- * @ucontrol: User-space control element value buffer to write the result back
+ * tasdevice_set_capture_profile_id - Set runtime capture profile index via
+ * ALSA control
+ * @kcontrol: ALSA kcontrol handle that triggers this operation
+ * @ucontrol: User space control value carrying the new profile index
  *
- * This function ensures the returned profile ID is always clamped inside the
- * valid range advertised by the info callback, preventing accidental invalid
- * values from being exposed to applications even if internal driver state is
- * temporarily inconsistent.
+ * This mixer control handler validates the user-provided capture profile ID
+ * against the maximum valid index parsed from the loaded DSP firmware,
+ * then updates the runtime stored capture profile ID only if the new value
+ * differs from the current active one. It will immediately return -EINVAL
+ * if the submitted profile ID falls outside the valid range, including the
+ * edge case that no valid configuration blocks are detected in firmware.
  *
- * Returns 0 on successful fill of the control value, no error conditions
- * are defined for this getter callback.
+ * No actual DSP register write is performed in this handler. The updated
+ * profile ID will be applied to the hardware when the next ALSA capture
+ * stream starts up. Caller does not need to take extra codec lock here,
+ * as the ALSA control core already guarantees serialized execution.
+ *
+ * Return: 1 if profile ID value was changed, 0 if no modification needed,
+ *	   -EINVAL if the input profile ID is out of valid range
  */
 static int tasdevice_set_capture_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
-- 
2.43.0

