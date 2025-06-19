Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023125.outbound.protection.outlook.com [52.101.127.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC06195B1A
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750298966; cv=fail; b=gIyFEGnudu8lp+wnyNHKGNcpQGtMpJ6pMUwQuPpq7Ndu0+ejhQC+psr0EzvWP9ZKuFyaDbcOkr7g3D6OUV8Da5CFUVy78N65O2odEsT+8y8WccTf4ZIlu2fHzLtQ0fXEN8LP+lbi+pFocrt7Ju/LY8MIlOEL64/um51kEh31iCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750298966; c=relaxed/simple;
	bh=uhs6PEYzfu7lCOuuv5QhrXwCg8ktYemZmmg63/4pzLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYPY2mXrqcOUnyTui6ahb2//lv0JXpFI93pGd7iRA5KH16RwrhfhgiBwy0IcyALg69f5uT152YDLi0M44O0zYkgXjivguNjoBWVFBIxBDFxRzB2F77TiDxWxZgvy/pyvCkjvYE9ml8ilxplomrhexi+Lt9nsSDCCRg7qSOomwbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWwYQTGh00AUBOONMftJOGbwK7VusJTtW4sY4WE1iAIyh6kez0DuUbqptxhZcN5EdzOaclJe7u+0ryDU2B2pwBA2Zwgipi4DLr3coXRuXvBePLkSzi9DecfQ3kubr24hUcruIq7g5xGIDUwfSuFv6Gf1iT/o9NfXh7+iiDeoBd0m6h3YvaJnEbWfNQz4+2t3OA4uVSOf7C3uaRjn4s/Oj1gxniXnMkeWdugWXIbo1eqr1gpODeTe+QcZCvWo/R+JylhmcORU0ygdAir2WmJmZIUkJ5Xe/XW6La257tBSV1XcX6gHHkd6fuLWxm+iUczqXVYiOA2YdVFdIzuUgSbVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqPPXyZo1T13FHGl/PnA8msANpuoca9ZhYyR8KaST88=;
 b=gEE7SwU5ckSFMOndTWeoKF56BdkJyGJIuvEzHUhh0rXLzZ3Q46JFu36ojTvy1yWlyrsYBmq1upbhY8MAonnyUrRMhY7rypgKFtOPY+n1M8QI+Yh06uIgkyO+buNEyeeegBHdMSed8Wd0K6a6qBhAIqHK9iaV+ZQm2nlQgL1A2PFq4a+OvomTT0cN0nKRpqIu1zRKcss3lxVf74WctA89iTSO4VRU2spPg/1fmK/29Pn0I0WvWprbb2ArW33HDuP6ekTXAlybRBUBCFMoeKb9dowzAQkqfT3S39W8tkyNID+rdIp52iVWGL9CCf9e6IxEuJ4nitoRtkWcPskQ1Ouw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=canonical.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR01CA0141.jpnprd01.prod.outlook.com (2603:1096:404:2d::33)
 by TYSPR06MB7019.apcprd06.prod.outlook.com (2603:1096:400:46a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 02:09:18 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:404:2d:cafe::66) by TYAPR01CA0141.outlook.office365.com
 (2603:1096:404:2d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 02:09:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 02:09:17 +0000
Received: from localhost.localdomain (unknown [172.18.64.15])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id F343640A5A13;
	Thu, 19 Jun 2025 10:09:12 +0800 (CST)
From: joakim.zhang@cixtech.com
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH V1 2/4] ALSA: hda: add no_pin_sense_update flag for jack detection
Date: Thu, 19 Jun 2025 10:08:42 +0800
Message-ID: <20250619020844.2974160-3-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|TYSPR06MB7019:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a3550e2f-5aef-445d-397c-08ddaed64bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MCN4nSJKl8A+ARTbRnTrNyAdDrDFWfkZG/nu//eey1U2P4UeSW1f+MpXmKt9?=
 =?us-ascii?Q?cKRCg1O9BuyocOkW+ANtzxKUcLwQyPpFbQG3PHX7o7crOaapsci2aHy5LnN0?=
 =?us-ascii?Q?X+mcnpmx+cFFFlHdru3PKj+G+J8I8KMP4FsXxPkvUhTBFiJbW6Ixe3tt7yR7?=
 =?us-ascii?Q?BKGC5UQC/kMTEJAE+3atPwfhQaaD2SCnpmKfl33Tf6i1ihL5VUoAlldbJ5lG?=
 =?us-ascii?Q?eiQG+jnW4kvmtBglPtCXLl9+si87CbhnH4kRB3So7stAz+QvF7o4MqszG9LF?=
 =?us-ascii?Q?EDuxyEELNN6KxZhgyZOvxyJohRQ1vlEWPZ4/uNbfIcAiJoM9+H99Qz1+NqaV?=
 =?us-ascii?Q?DAQl2U5nIjUsyIY3DHifYVHyKKXVcFbSu8BI5QJ1CPYwnA9VsUT6K8FPeZ1p?=
 =?us-ascii?Q?KM2h5OTYcDuDIoa4ub+GtIzga7Th6dzsfbmpNK7MblRwYWKMePKdLY/Xyoxn?=
 =?us-ascii?Q?yVvOhUpqAF3SEFMDVZQUc191sS0F9opcjCj1KWsYacri8rj1+HvJ/AhTJ9cb?=
 =?us-ascii?Q?TpKzKQSPOdu+vv/CClaZidVjWNs9nkOzf12+VCNztlU70eZOH0TOX2eQKcCi?=
 =?us-ascii?Q?VidxnWP4Gmvm+pNWnYyuhRigv7nHC5lllcEPPg4CplYTt2TRGw7ZeIgQkTnb?=
 =?us-ascii?Q?F7xjv4TdIiFWXr7cvxrQx/WYu2Nr+GP/KJyzZbbro7sqMY/b21UL05KuYMtP?=
 =?us-ascii?Q?MKgNFtrCS9DuL8JWLfJk+5gNml/0QZX8sUntQKSPI3JuD59pahQtSif6tiEP?=
 =?us-ascii?Q?1LdHf/WY2g74IfQkGE5/1DWCJGJdOAaXAbK0WFu4MYD1U0sRMc4e9vIYgvyw?=
 =?us-ascii?Q?/EzkFARuUP2CIGiRxDeWe3qcFI0MX54YaHMxuAT57omWYgSWWpiU49jBzQt4?=
 =?us-ascii?Q?+jcyFM9RC1IYQEiEmD+jpcjrU5vntcpBaMNYe9fXq4Wlw77H+9A971BRWbQ5?=
 =?us-ascii?Q?SeE9nyJJKIMgoV8MkerIV2WR9aSI5DH2FQF+pM8rwRHMwVwGZ/EQ1Ylw9TKn?=
 =?us-ascii?Q?C1R0D/5TB6nRzxErtfM5shED1eGpDElHrEDUfSd7UBQqnUt844C+68SZ7J3p?=
 =?us-ascii?Q?fsdw37//Hwv31DC37gABggl2yXoh7uJmeIV8lZz2+wJSr2x4K834IalhXyE5?=
 =?us-ascii?Q?6GQdpRZU/jXql6NI9X6MhSI6ydnkxg9pvzy3fnXDLJXSnxiKptkhmFTco+LG?=
 =?us-ascii?Q?oyq2fkepff2qq02rb2jhHRwiehp6PpO1j6iHE1h2TYdGr/Uk6Vruc8yNdNKK?=
 =?us-ascii?Q?JwhMyFIc16CnnVOVC+CB8py/Hgvp42M615OxMVWv26Tpidf/cdJLaCxAqCdt?=
 =?us-ascii?Q?pfGNH6t5jdnY28UvKjwmNdEMlRYBMdSUFP4zgi0NUK36u8lhJleuE7Y6IrZ3?=
 =?us-ascii?Q?0sXaE2mmiY6Dz8w/0WYq4ojiCY0ULU0ZZcEokbfLb69p1jqZWanFsz1OHVQV?=
 =?us-ascii?Q?1kLK3FVBA4putIsY4UtlNWS1VTXnKJxmyNMqeQrarBxyFMuHHnZynE7yOWeV?=
 =?us-ascii?Q?zV1M07PEIIX7OOnvZfk4YisDK+BknY7hAmKy?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 02:09:17.2417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3550e2f-5aef-445d-397c-08ddaed64bdb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7019

From: Joakim Zhang <joakim.zhang@cixtech.com>

snd_hda_jack_detect_* functions should be called when want to
detect then report jack status immediately, however it now called
from other points such as patch_ops.init which just want to
judge if the device is attached and no report behaviour.

Let take corner case into account:
1) device is de-attached before suspended, old pin sense is not present
2) attach the device when device in suspended
3) when codec resume back and the device is attached, it will update
   pin sense as present from codec init function (patch_ops.init),
   when it tries to read pin sense from jackpoll delayed work,
   the old pin sense would be present (but actaully it is not present),
   and the new pin sense also is present, so decides no changes, cause
   the device cannot be detected.

Add no_pin_sense_update flag to control if we need update the pin
sense when read the hardware pin sense.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 include/sound/hda_codec.h   |  1 +
 sound/pci/hda/hda_generic.c | 11 +++++++++--
 sound/pci/hda/hda_jack.c    |  2 +-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index c1fe6290d04d..c850a4487e87 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -257,6 +257,7 @@ struct hda_codec {
 	unsigned int forced_resume:1; /* forced resume for jack */
 	unsigned int no_stream_clean_at_suspend:1; /* do not clean streams at suspend */
 	unsigned int ctl_dev_id:1; /* old control element id build behaviour */
+	unsigned int no_pin_sense_update:1; /* don't update pin sense when read pin sense */
 
 	unsigned long power_on_acct;
 	unsigned long power_off_acct;
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index b34d84fedcc8..18c184a63dde 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -4378,8 +4378,11 @@ static bool detect_jacks(struct hda_codec *codec, int num_pins, const hda_nid_t
 		/* don't detect pins retasked as inputs */
 		if (snd_hda_codec_get_pin_target(codec, nid) & AC_PINCTL_IN_EN)
 			continue;
+
+		codec->no_pin_sense_update = 1;
 		if (snd_hda_jack_detect_state(codec, nid) == HDA_JACK_PRESENT)
 			present = true;
+		codec->no_pin_sense_update = 0;
 	}
 	return present;
 }
@@ -4569,7 +4572,7 @@ void snd_hda_gen_mic_autoswitch(struct hda_codec *codec,
 				struct hda_jack_callback *jack)
 {
 	struct hda_gen_spec *spec = codec->spec;
-	int i;
+	int present, i;
 
 	if (!spec->auto_mic)
 		return;
@@ -4579,7 +4582,11 @@ void snd_hda_gen_mic_autoswitch(struct hda_codec *codec,
 		/* don't detect pins retasked as outputs */
 		if (snd_hda_codec_get_pin_target(codec, pin) & AC_PINCTL_OUT_EN)
 			continue;
-		if (snd_hda_jack_detect_state(codec, pin) == HDA_JACK_PRESENT) {
+
+		codec->no_pin_sense_update = 1;
+		present = snd_hda_jack_detect_state(codec, pin);
+		codec->no_pin_sense_update = 0;
+		if (present == HDA_JACK_PRESENT) {
 			mux_select(codec, 0, spec->am_entry[i].idx);
 			return;
 		}
diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index 7d7786df60ea..dc8b9c7f229b 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -254,7 +254,7 @@ u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
 	struct hda_jack_tbl *jack =
 		snd_hda_jack_tbl_get_mst(codec, nid, dev_id);
-	if (jack) {
+	if (jack && !codec->no_pin_sense_update) {
 		jack_detect_update(codec, jack);
 		return jack->pin_sense;
 	}
-- 
2.49.0

