Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB953EC6B9;
	Tue, 21 Jul 2026 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644629; cv=fail; b=qDjn4VoRinQ5MXhgN6p2YZDeop8aSFh6Q7ihpwdYt+1RVAICecv/T9nwG3CAHNr3kgBL6kiDxzZrBbVdaFAjspMho1PuK/Bhizus0jronHMiBqE7SqbJO5KGmKG6dTv+MAzQdkHuQWfNQGc0snmDHxHasxCcsilQbWssEyFfVu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644629; c=relaxed/simple;
	bh=lYtve7JwYhjQT60sY3DhPM16mn0tlWCdyZ5qTu71b5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aCSxJfFn904z41U2HGsiJrVYzKISaXL7NAPwUCN3XZa8hJpS0BH2C1zNfOcPUgWjE/MiS3xdHF9DMLTQIN4sHYJr4SsbZ42wRbuhWfejYpX6fUUfI/G3h/sAUvuCDfGUfapF8nTlJyAOoslA1fUcUYlvv/9VRkwDEbCJRK2Ym/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WfD85Ddk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=coZm4ZKw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WfD85Ddk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="coZm4ZKw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L5J3dD1828547;
	Tue, 21 Jul 2026 09:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qp8QiXiUD4MGh4mViI2FEmFzoqRM/egn+1UXCJZgbRk=; b=
	WfD85DdkoVw/042pHPdfl7n+mn2uz2giK4ez2Gee2Pnm6gQLxci+twg9WxeFBQbG
	I3rYI8/LAR3Q3RgfZ4TnJsRinte/HU5hUa2Aq9mvivuQjrok+3x/OfNzIDNbTlvs
	gGfWUJVCPuR9d+Q9DQFNbg03pGkrhq0FxWR67hvhzuKEmSOphIQdQpU1Wma7Wf2D
	lgRM9BAASsylvWUtwuQO9MTsS1fsd+ses6MPTltDyq8DtWwZl7yZGzdMiAcSpugr
	b/zuws5qN3jRITIavUc22Al9ZCgNvuWcfsO63OSu2Y6FB+Ro6SMngfeQ0sfm20sV
	QIOlqyuAYBoXnXFX6Z1KxQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020118.outbound.protection.outlook.com [40.93.198.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vym7n6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 09:36:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXcC/QE+/Y9gjR3y514oBDq2VupgyLEQAZrkLo2j3y3PHuRaVGgS+nWnuyhjKVEhEYt99PzI6YzJK7xH7M0eID905SWCQ/k0Gjq0lml5tDvCJYhx44sql4UaxL1EDEEORZ7G0KeFyN0BJv/Hu8js045YrOiMQe6VuOpglYhniSYNreRADlnfsLBPQUNUVDfI418lj+/veT4AkL5lbuQc9GhSEj1avyBuiCztBkIfmME8H1zdU4SterB0bW9Y2ypP6bhtiFNvmKPuECONPbpVNDbJFJUWKw8vhtW9kAqcqQHgRr/u4wdE92vqfq1ZQAPlhnFAcj5d47yyHU/5Vvvb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp8QiXiUD4MGh4mViI2FEmFzoqRM/egn+1UXCJZgbRk=;
 b=QbQBYE2LFkbqR2jPEjKF4X2OFRBmLEnM4RxJnB1U3c7AglkbjSNIOcSaKZa4RjKHFACwKbkztQVGlBOyPKyz84Uk6zfxiwUz1CYg9ULIbD1f0RVBP9w7ZvsWmCFfPoB9UiwmTU4Oi7N1mQZ3JYAOMjvhFks70VyFTHp5y998TW/1ocWw44seZfcC4oPfnUp9KeoeE/nqEoCyoDgIMvXeKhka8NLukfa2SUrLeXj7zX5MSGm3B4gejSQ7cUMg7StUgTuTg9aRiNEvjoRPCDcqb24ZBZPLYYyd70OKmmHBlWcQd5YUH8FKzE5vRc0Gb950+VHynaTskn49+SDvDIaD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp8QiXiUD4MGh4mViI2FEmFzoqRM/egn+1UXCJZgbRk=;
 b=coZm4ZKwgKfQbriaIqqv6KuO1jZKgQPR2whUYRvvFODdHPPjBXRLoIgqthZlVZrO+f66fN8sQYr7GFGWq3qwqXUTshDCtJATwRa6boTbpjGk+bAXX0e4G+bEzvOFDAO4pjb0JIwISpNl4kZOuQGt0A80WNOzpXBlwXfHtp2ShQA=
Received: from MN0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:52f::10)
 by LV8PR19MB8496.namprd19.prod.outlook.com (2603:10b6:408:200::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 14:36:43 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:208:52f:cafe::69) by MN0PR03CA0004.outlook.office365.com
 (2603:10b6:208:52f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 14:36:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 14:36:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E47C8406558;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C1504822555;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 7/7] ASoC: SDCA: Move kcontrol search out of IRQ
Date: Tue, 21 Jul 2026 15:36:36 +0100
Message-ID: <20260721143636.361814-8-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
References: <20260721143636.361814-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|LV8PR19MB8496:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ff806e71-f149-49a2-dbfc-08dee7357c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|61400799027|376014|56012099006|11063799006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	eoXOwmvyfF+5pkbGvOG74CN8i6059id9tP9J5KihS+d23YDSYfqRGpcXbL4zYUb4ddQA3dAxx/4kjhz11clFtwM2+wzf6ZiCaxt/xFLGUgA+NLap9aRbGe9rf20r+N7y2dll4W7Sd+kbyZbhZscg2jroW+C0t9dfkRU/61xM5pAfxw0yArTbhfWiMsbBbl+psAN6Pm/fo7RoNolycyGN9RIjjsRmYm9ZWFpBXdFfbIXAC8Ub+Isucb/rm8uNZe/FnDiy0yEKsG0pso8KM2V9k/Yes30stESrHgih/2fl65dnLy8Qz0Sykbq9w83KfGOT0KoVs03FQVx2cNek8/seFIoiU7vAUs+HFtKgWUQ3YRyXN3WN+wMoVNGGZhTkz9vk5/UbDrdKkKnbzAXjMBsMo2xuWGeTGFRCO6MfXDN3mJbdSXiYGACzRu5sFIb9SLzP/KBMEdQXCQ0UcqlPxdmVQWqhAqe8hVgwBBLui7PgzfTZtVLCh2jMplKfxwusOFBWnx85YT9CW5Cs1/xQWOYQw4W0xKX2JVAC5qVhFqmJMSz+wooL9JyES5i6UlSJpmXIHS6unKggSNmUjS2hUT2Dnjwsqpy+7ShEgylk/DZMpkZCjOZdCdrzcf/q80eYeTXjKFNC37xLau2N/ky4pP8W9XJaI5W4nkCknEacH5w4+R3I41dXACk4+cxZbCTSRqMBcig6AXaF86sEZh4IRXrRpA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(61400799027)(376014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LN0w3cqE+i+fDZk7Er6eWg+fX/CPvWMJpYIZpbdSbuajCpHFsuAk0C7mwCcqiXXN+mZWxpmLdULjL8vtQrwnaWcz/B7W9/LJ3y+rnGK75ui9GjwZxA+0LHI/fMyawtBcV2u/FEj9ckDwz3DFjx9h3oRxl8El7WZa8CtM3BhVoSTbyGyPb6v+QBvo/VPQyEBHNezr1qk7Eip5AUMkdHXl/HFIkBh51gHl65LmRYPmiDbsWGgM6NB+O47ez8Hhse9ZCZzz2UnmgQFwfEOLubC+lVDmN0N1Px0x1c8Zy/0P0gzH/ltKQVfp0/01pjW9dX/KnA/w+ZX/kWvd4WoSRN2DvtDMQqzXzypRXXrEVKS9JYt4/EeFPqUvsFSaj2/+8qs9fnTEqtoim1mz76oGHZEN+Qd0iQ9lBhAkOJvyeJ/7wP7W0KHGECgxuZ/ho1Ra64/m
X-Exchange-RoutingPolicyChecked:
	QxYchnCtD5n75B21zRpIANAlMOHZ/uev6Tk/NZdSFyMauKYKnAqgg5yWPwlPRQbIv2fSs94EeRPBavYOQAnfSZhf9A7Jw79M4FCZDMm1dDIrmHLLCEDD+xnua3jUn7HCOE2zpeKc75JHWMnmwQaCI8O2AqomURiQn3Kmm/uX0xT2lxCgw01a6dVBABpiEUsMX/G/CzIP/rCWNrlE7YHrjqMJSpD/+DcpTBQr9WBlmnhUnif5QkLngG2h0q/hgrY97buNX2GkicffAHjhHAN3YAv780ZxhgYpRr0uxY7davyQ7lRf64epfmcp3oHMwYgMpBvCXSmWZmYnCEPXGgb1Zw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:36:43.2150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff806e71-f149-49a2-dbfc-08dee7357c15
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8496
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfX/L4guJoDfwlU
 MOpoT7uHEtRiVGFyvbBjCwT1xCzBqOkn6gB5wIyGdZ6dWQ7x8U2CiiyY5bS9/g+0wA/aIHZB+R+
 ZGY1pNbjrFmoey56b74T0y6Brhaztjc=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a5f8402 cx=c_pps
 a=LryC7IEqKcSdoWktnkYnkA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=37KK_tL0TpI7OPApReIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MyBTYWx0ZWRfXxMe2hM+d7FFK
 UKD+HV2ySpxAQX2SuKSgTSFGRdFeLUTjlbHZGL/zEmbdnACADnhwz9aIQ5FSySD+0SakWZ0AExI
 tmRFgmaVAbyCXCNYvn2WddB+ULKvYRsf16/iEUgMK2Ik1BntGk+Z2/2JEl02uxzUUdoM96g+Y7n
 THXw2DG/xwqs8Xl5OHUU3DpgSxCFaYAiZT81gp5UVOY/Odk4ZW7M36JryCQHf8mDkoGPKbfwDVY
 FVjQqB/HRe95T4QJybmEfbYF21fy2YAzpRwd7/p2u2M0fOTqQdEaBOqqcfriDDJXrVGp2g2V2Xi
 ZZASjTLGWDrcqzOH4xcZmnNtyDwcSDYpwCKhJsuWrM4Zj0f5Uw43meU/dToTWW9WAn3XCMYA+Eq
 9UZOd7uISiQPLLLODSEwWl3fbHemxvoltvbbwfCl44ecsW3B54S5DjXB/cWP/i5jSkhL2T2gEUs
 nRJMBm624yjqmrQ3JgA==
X-Proofpoint-ORIG-GUID: GAlNzAV4Rxfm8FBfz3aojyL7N48uPBGU
X-Proofpoint-GUID: GAlNzAV4Rxfm8FBfz3aojyL7N48uPBGU
X-Proofpoint-Spam-Reason: safe

Now that the IRQs are always registered after all the ALSA
controls are created it is possible to search for the control
at the point the IRQ is requested. Move the control search out
of the IRQ handler and do it at IRQ request time.

This also fixes a potential issue when the card was torn down
and reprobed without destroying the codec device, the kctl
pointer stored by the IRQ handler would not be updated to the
new control on the second probe.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v3.

 include/sound/sdca_jack.h        |  1 +
 sound/soc/sdca/sdca_interrupts.c | 12 +++++++++
 sound/soc/sdca/sdca_jack.c       | 43 +++++++++++++++++++-------------
 3 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/include/sound/sdca_jack.h b/include/sound/sdca_jack.h
index 59de40b7d7d01..871ba2d8146a3 100644
--- a/include/sound/sdca_jack.h
+++ b/include/sound/sdca_jack.h
@@ -28,6 +28,7 @@ struct jack_state {
 };
 
 int sdca_jack_alloc_state(struct sdca_interrupt *interrupt);
+int sdca_jack_init_state(struct sdca_interrupt *interrupt);
 void sdca_jack_free_state(struct sdca_interrupt *interrupt);
 
 int sdca_jack_process(struct sdca_interrupt *interrupt);
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 6f0d8c0fe622d..42fbd3af8a754 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -521,6 +521,8 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 	for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
 		struct sdca_interrupt *interrupt = &info->irqs[i];
+		struct sdca_control *control = interrupt->control;
+		struct sdca_entity *entity = interrupt->entity;
 		int irq;
 
 		if (interrupt->function != function || interrupt->irq)
@@ -528,6 +530,16 @@ int sdca_irq_populate(struct sdca_function_data *function,
 
 		interrupt->component = component;
 
+		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
+		case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+			ret = sdca_jack_init_state(interrupt);
+			if (ret)
+				return ret;
+			break;
+		default:
+			break;
+		}
+
 		irq = interrupt->control->interrupt_position;
 		ret = sdca_irq_request_locked(dev, info, irq, interrupt->name,
 					      interrupt->handler, interrupt);
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index 3c84d17244a28..73f8067906a90 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -47,23 +47,6 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 	guard(rwsem_write)(rwsem);
 
-	if (!kctl) {
-		const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
-							   interrupt->entity->label,
-							   SDCA_CTL_SELECTED_MODE_NAME);
-
-		if (!name)
-			return -ENOMEM;
-
-		kctl = snd_soc_component_get_kcontrol(component, name);
-		if (!kctl) {
-			dev_err(dev, "control not found: %s\n", name);
-			return -ENODEV;
-		}
-
-		state->kctl = kctl;
-	}
-
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
 			   interrupt->control->sel, 0);
 
@@ -148,6 +131,32 @@ void sdca_jack_free_state(struct sdca_interrupt *interrupt)
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_free_state, "SND_SOC_SDCA");
 
+/**
+ * sdca_jack_init_state - Initialise transient state for a jack interrupt
+ * @interrupt: SDCA interrupt structure.
+ *
+ * Return: Zero on success or a negative error code.
+ */
+int sdca_jack_init_state(struct sdca_interrupt *interrupt)
+{
+	struct jack_state *jack_state = interrupt->priv;
+	const char *name __free(kfree) = kasprintf(GFP_KERNEL, "%s %s",
+						   interrupt->entity->label,
+						   SDCA_CTL_SELECTED_MODE_NAME);
+
+	if (!name)
+		return -ENOMEM;
+
+	jack_state->kctl = snd_soc_component_get_kcontrol(interrupt->component, name);
+	if (!jack_state->kctl) {
+		dev_err(interrupt->dev, "control not found: %s\n", name);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sdca_jack_init_state, "SND_SOC_SDCA");
+
 static int type_get_mask(enum sdca_terminal_type type)
 {
 	switch (type) {
-- 
2.47.3

