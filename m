Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB0E367292;
	Tue, 21 Jul 2026 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644642; cv=fail; b=i63qPs5rvpijos0c3wwJRsLcU6tP7b7ZImWtoZmIEAbLE9TH9FFMwjRIp71/kdtlvkLF634+vhxIsdtSwF5C2IF873Bs9B+RIPrp7FlbJ1RIZ5hbk3KTnUv43kSsB7vTr+ZLFjaeKg94z5roqWOX8E0wfKh3LgZgn4K6em9hPto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644642; c=relaxed/simple;
	bh=D3TYXuC20ll3f1n0APOEhJL2Ao4LW2DaoxCIy47oK9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOEaCBXiSIHZQVnrhmXmJ1fYF4vwtgLJYgVn+rp/Gu9mREjfrQLM+wpVjdBHUGWi9ObrUdS6SJAFEF5FHPYzw5PRRkFv+T1mvQYBmr7dJpBISat8EuXIbMzydJ2Q4qDX7NpabKjf8SkVpWGQC6u1znlwNOTPgT2D8jJUfc5EGvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JydfiOrm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jjoDEZrx; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JydfiOrm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jjoDEZrx"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LEbBgR669055;
	Tue, 21 Jul 2026 09:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=KF7dH2A0chLqrS8UcTXrnDr42ScwwZX/5SpxIvu1BV8=; b=
	JydfiOrmOXTIbplG7IK0nboCwVWe5abHj47iwBt/ThGBx1gdT8cltdW2ExizONwW
	glK7n4gkS2yuKEcDIokm0gvB1b20RlRAGnZ7IgQ2z70xo/ZuPCnlUB+6JBQkROmy
	+kO8p3ai3GBxDpuQXHoHP64E9h/x5cAqiYb7Ks1CRfGAXtyWMMk8nWtRBrygtJqB
	TPFwVeeoqM2qH7NmBJ/inpJHABJjk/X1GfK/sZPSfsHx50+GAkOaw4Wcz683IHKa
	amhGow7fS6umsh+bUyRMkettyjhTYbxNukpoC6tQv7B5KLmU/R2dSLPp2BKtuV/a
	K+MphxdBwzlj+NG1hE2oQw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020097.outbound.protection.outlook.com [52.101.56.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wfc7cb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 09:37:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6PkmRq0EanZcg9ltTJpcXSeL1H5IltenBScEsPE0DjnNjJ/5iIPD/EV78wt8dEivYFbX37eUKHhIpvucvvvaiNBVpcfMamW2astpd58F6gIAaUxu1wGhBjnqEHCzP2du1KosyPICGWeCKVkMGKAAPU5Pe5Rc/JLvE3pNjh0wDjF52ilyZf9Y1YcqI3SBREiikqxbB0pijPaVAE6pnEhdqIbyuYFmIkjUdKRujGsN1T6qSGEC2eouYQ5n3O0RnhZkxQfIqUcsKHevQgsBuy++7vUVdLl1Uy8cTn7tznVzuHYYhYyRA3iXiFBvz/rkJ3D9il+FBxX6B7vYiRra6OdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF7dH2A0chLqrS8UcTXrnDr42ScwwZX/5SpxIvu1BV8=;
 b=VCyD68Dd2Iy3zs91eDvyt6M2fANpR8O3lWq5snWMh2nqshq76mWYJ+GD4ObzaZTFB6m1UhNa+An2/rLx48Jn1Ao13Pjw6aP0E/jx44mKRbZwToENvuDAHQyKE9K/JT0wsD5oCX5OhbxInk6/jcve91tqSueMcwEzdCqsVPXbMFma47lhnF/Pb1Xq/VtP3Z7n/aPnxiI/MYzqQbY4uW5+EZ9vCJ04VOHXVkn8EBA6GtkcjE4AnYkBiETLbwhIO5RXkrP3M5VhLRxRBgDBC5R44h2CUbnyZlBTU2pDm+M+EYPSYytVVHyYKOs99XqHhva8NT1DyYGkcqK+W1HGXsopZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF7dH2A0chLqrS8UcTXrnDr42ScwwZX/5SpxIvu1BV8=;
 b=jjoDEZrx5MsiOHPcS1suy0p7oP+ZYZ8YeMtcOlwcz8FRaHY2N6I+6/0q3VxXO/SXXeVLgBELztLzacPbCl+dHWaCAKHw8PHgNPLV/7cng9jzUXvbQ+MtykoT4GdUJClkmIvRPf9QXFhan3+8Tlf0NtectJTs+4rs62H/reSbDfo=
Received: from SJ0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:a03:33e::8)
 by SA1PR19MB4989.namprd19.prod.outlook.com (2603:10b6:806:1a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:36:42 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::3d) by SJ0PR03CA0033.outlook.office365.com
 (2603:10b6:a03:33e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 14:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Tue, 21 Jul 2026 14:36:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DD0BD406545;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B5C5182254E;
	Tue, 21 Jul 2026 14:36:39 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 3/7] ASoC: SDCA: Remove devm from primary IRQ cleanup
Date: Tue, 21 Jul 2026 15:36:32 +0100
Message-ID: <20260721143636.361814-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SA1PR19MB4989:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 83cf21d7-8df7-4d6f-01cd-08dee7357af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|36860700016|82310400026|376014|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	miUbS6ZhWH6sWvrF2/wyJ3W2c7eYKwAStck+ZrwyOMN1m+N4SHNve7ggEZPqNLAPCaRqZcmmIgq5A1JsbnuHRLZMoPgDUBz+qAggQky2JNZn+2n4OKBlQMdJUgoOZ0cdtj+T7bCe6hrcqVX+P0E+20Kf+Y43N9+K8T6ReWaJ0ia/yRygNgIwyQUFsYoB2ZNPxk5G3OLb2MpaMcx5sTBpSJnHTC6ipu15EZofdoBGPiZYo0JJYvtMsu2ehYJ3iAnw62Xx2HpB0qcqfrekL9Q28yaDyyRNoeXAxf+58ckmEzJ6/ZOIK7ONQGfNkyU4XUzrNSCJja0NRJ9cIaXsih2OHqVBnMpo8ynxxIyE9BmoOehWkT18T+9ag/04AEUXn+Ls/V2r+xVuBym7IHUJJI0sVGflemCDnPN+aI3Enh8QjHIJFVI27+MhrkcgnwslMXYu/wLBgQnwFS4gR8usbD4hP2/173+EoMqFNvKtH6dhG2FGTvE86wiEZusA0ZyBIEuf4STsZYP+txB9f9ZGj5AYzS3FohEt0+PQ9twC1nTaCr5ApjKaA6k0jEWK5L5hDXIzBZq/0MSvEFOWqlpgywnueFqOJ5kJz2bDb0j+3Pme5Sby3j/gh4s6d0/vX1fNy0uAZQmP8NjRJueTKlTziLh/Eppgqi7VUwL06qZIF/XDuoqMSMGEVCqkN5oBPqShd4/QyBY8Pb51yFO0XOEOosG1vg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(36860700016)(82310400026)(376014)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4teFdmCUwusZE5h3fwEEl9VX1BtuTz/KexfOhaNZqkh7wDxR+YiUd+Hm07qrF4MuTIlG3JeBYw0bggs4FxAjSXVZRKxHigXPbgKW5O0K78wE6GLjGgPOrfR/xFqZEM73WaOI5iNUowvMoCDmsqs3z0JcbkmoSobLo0veKhO1cB5gA49lmzsr2EDyR3w414u2eGKZ0blMzr4kHlcJU0dVCqD7gpc2epm9mpg50WZdpfP//uhDaU6zRdA2maDTsoYVPlHOCN//Si5Gqr72IN5U6v/kF7GsaZk1Qt0+Z9h2wpR1D0EttSOqYAA9uuWUGb2K/2bf2dhmVxnjGD7YFJMzlqqQr9PADAAlmOV/XM+wY0redb5UwyM549Vz8Y0wKe6AkC7MFVNzb9gOLd3HN3boYL878h4eLR5fZSf1sW2LkuKCjPeYjylqUE/09J8F3nUF
X-Exchange-RoutingPolicyChecked:
	S/GUKKHhHNkgofZWw/ctVlPAdmreFdgckpzBy0Wx62AQvxI0kFnGA57dO6eoTac5TLow/pK+2ABER+jxDPOxiKHBTFnnH2iLoaTkAdGqejYZW74OdMAb5pXi02aDjigDvxaFftzO4c3dgJtwAIddU3Xz+dlYi35H+hQBP+w9N/+6icNJkPMYvuaOuD383SHqn+b15v79ghRXouu2SujM1aqYoh+fiaZzz+fFSy7wdtMYB7FeALmTg5jdIs8jvPw5hZYgsvVQGGYwvZxLlGL7/+By8UpdZXhsb+MBHebOSs9IGXRVQCxV8wOulfAG0cyPOKYI4hELw+p2ab6TaDAe6w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:36:41.2335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cf21d7-8df7-4d6f-01cd-08dee7357af8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB4989
X-Proofpoint-ORIG-GUID: 2MUJucz7Kt8jBWPh4-kGdCIFJ5_tVa8x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NCBTYWx0ZWRfXyw9eGeem5Xn9
 +H61iuQtZNZyNz5YukQR3Z1pwvxBKB98TmUfNJwE9nrh0VdWETyQIk+Fiz6sLMCWSkY0aJch9zv
 RShMFFs+nS/UlY12BvGYepgiXT8n9MM=
X-Proofpoint-GUID: 2MUJucz7Kt8jBWPh4-kGdCIFJ5_tVa8x
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a5f8412 cx=c_pps
 a=ydgU9ZzZ8ygNmgwE1kSFDg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=3S7zaM6fbALVu3JDtX8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NCBTYWx0ZWRfXxEa/gdtJ9CJw
 quy6hxeyZAazW223VRhqOLJ9wktc7P99BLVL4S+xkNstHJ5XUzwiTdtXIh7gdYTnVmW1R11DMC4
 gItBDwXkjH4r0ginFaWK9vrx9MJNF2136Kck3+uttmnEf5zYbLaNP6unYaNmILhby4cooUa+iqQ
 fXolW/ao1RvaUw2o9bpX4Jf/rd4AxwJ/wde+0x+g7qTfvXH1anGw/usARZq0hl8MMlFjyvE4Fik
 ZO0HaAq0D8vzYPqne1MMKCEz2vUjMCVRI5NmQ06GwKzwZ3TNfWcK3tmZOsClGiV0sTQTz8bM1rT
 fWAIxGqRbRcFd4OIVr6ABXcD+jLLNka196Jo0rql6c/NfH0ysQqB4QRhHf+9kEISpCn+3LFZPSo
 Q8jE9L5Vl151FuD3ywZwR0KQMaBlOZ5Sg6oP+sIvshxVymPj24aZTYIPU0fy7GorPGQ9Ug0nEhA
 HcpW6isahewsIFljJ7Q==
X-Proofpoint-Spam-Reason: safe

To provide greater flexibility on when the IRQs are requested for
client drivers don't use devm for the primary IRQ request/cleanup
helper functions.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v3.

 include/sound/sdca_fdl.h         |  2 ++
 include/sound/sdca_interrupts.h  |  2 ++
 include/sound/sdca_jack.h        |  2 ++
 sound/soc/sdca/sdca_fdl.c        | 13 +++++++++++--
 sound/soc/sdca/sdca_interrupts.c |  8 ++++++++
 sound/soc/sdca/sdca_jack.c       | 13 +++++++++++--
 6 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/include/sound/sdca_fdl.h b/include/sound/sdca_fdl.h
index fbaf4b384c8af..dc33927b82bde 100644
--- a/include/sound/sdca_fdl.h
+++ b/include/sound/sdca_fdl.h
@@ -67,6 +67,8 @@ struct fdl_state {
 #if IS_ENABLED(CONFIG_SND_SOC_SDCA_FDL)
 
 int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt);
+void sdca_fdl_free_state(struct sdca_interrupt *interrupt);
+
 int sdca_fdl_process(struct sdca_interrupt *interrupt);
 int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
 		  struct sdca_interrupt_info *info);
diff --git a/include/sound/sdca_interrupts.h b/include/sound/sdca_interrupts.h
index 38c6c58c2cc78..8a44c19e917ce 100644
--- a/include/sound/sdca_interrupts.h
+++ b/include/sound/sdca_interrupts.h
@@ -31,6 +31,7 @@ struct sdca_function_data;
  * @entity: Pointer to the Entity that the interrupt is associated with.
  * @control: Pointer to the Control that the interrupt is associated with.
  * @priv: Pointer to private data for use by the handler.
+ * @free_priv: Pointer to a function that can be used to free the priv data.
  * @irq: IRQ number allocated to this interrupt, also used internally to track
  * the IRQ being assigned.
  * @early_request: Flag to indicate this IRQ was requested at bus probe time.
@@ -47,6 +48,7 @@ struct sdca_interrupt {
 	struct sdca_control *control;
 
 	void *priv;
+	void (*free_priv)(struct sdca_interrupt *interrupt);
 
 	int irq;
 	bool early_request;
diff --git a/include/sound/sdca_jack.h b/include/sound/sdca_jack.h
index 181541f0f4d8c..59de40b7d7d01 100644
--- a/include/sound/sdca_jack.h
+++ b/include/sound/sdca_jack.h
@@ -28,6 +28,8 @@ struct jack_state {
 };
 
 int sdca_jack_alloc_state(struct sdca_interrupt *interrupt);
+void sdca_jack_free_state(struct sdca_interrupt *interrupt);
+
 int sdca_jack_process(struct sdca_interrupt *interrupt);
 int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *jack);
 int sdca_jack_report(struct sdca_interrupt *interrupt);
diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 994821a6df617..82e09d960c127 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -481,10 +481,9 @@ EXPORT_SYMBOL_NS_GPL(sdca_fdl_process, "SND_SOC_SDCA");
  */
 int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 {
-	struct device *dev = interrupt->dev;
 	struct fdl_state *fdl_state;
 
-	fdl_state = devm_kzalloc(dev, sizeof(*fdl_state), GFP_KERNEL);
+	fdl_state = kzalloc_obj(*fdl_state);
 	if (!fdl_state)
 		return -ENOMEM;
 
@@ -499,3 +498,13 @@ int sdca_fdl_alloc_state(struct sdca_interrupt *interrupt)
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(sdca_fdl_alloc_state, "SND_SOC_SDCA");
+
+/**
+ * sdca_fdl_free_state - free state for an FDL interrupt
+ * @interrupt: SDCA interrupt structure.
+ */
+void sdca_fdl_free_state(struct sdca_interrupt *interrupt)
+{
+	kfree(interrupt->priv);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_fdl_free_state, "SND_SOC_SDCA");
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index d86884a89c405..cd2c5d49bb95b 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -457,6 +457,7 @@ int sdca_irq_populate_early(struct device *dev, struct regmap *regmap,
 					return ret;
 
 				interrupt->early_request = true;
+				interrupt->free_priv = sdca_fdl_free_state;
 
 				ret = sdca_fdl_alloc_state(interrupt);
 				if (ret)
@@ -530,6 +531,8 @@ int sdca_irq_populate(struct sdca_function_data *function,
 				handler = function_status_handler;
 				break;
 			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
+				interrupt->free_priv = sdca_jack_free_state;
+
 				ret = sdca_jack_alloc_state(interrupt);
 				if (ret)
 					return ret;
@@ -537,6 +540,8 @@ int sdca_irq_populate(struct sdca_function_data *function,
 				handler = detected_mode_handler;
 				break;
 			case SDCA_CTL_TYPE_S(XU, FDL_CURRENTOWNER):
+				interrupt->free_priv = sdca_fdl_free_state;
+
 				ret = sdca_fdl_alloc_state(interrupt);
 				if (ret)
 					return ret;
@@ -584,6 +589,9 @@ static void sdca_irq_cleanup_flags(struct device *dev,
 
 		sdca_irq_free_locked(dev, info, i, interrupt->name, interrupt);
 
+		if (interrupt->free_priv)
+			interrupt->free_priv(interrupt);
+
 		kfree(interrupt->name);
 	}
 }
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index ae9636622a840..ffa8709649248 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -132,10 +132,9 @@ EXPORT_SYMBOL_NS_GPL(sdca_jack_process, "SND_SOC_SDCA");
  */
 int sdca_jack_alloc_state(struct sdca_interrupt *interrupt)
 {
-	struct device *dev = interrupt->dev;
 	struct jack_state *jack_state;
 
-	jack_state = devm_kzalloc(dev, sizeof(*jack_state), GFP_KERNEL);
+	jack_state = kzalloc_obj(*jack_state);
 	if (!jack_state)
 		return -ENOMEM;
 
@@ -145,6 +144,16 @@ int sdca_jack_alloc_state(struct sdca_interrupt *interrupt)
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_alloc_state, "SND_SOC_SDCA");
 
+/**
+ * sdca_jack_free_state - free state for a jack interrupt
+ * @interrupt: SDCA interrupt structure.
+ */
+void sdca_jack_free_state(struct sdca_interrupt *interrupt)
+{
+	kfree(interrupt->priv);
+}
+EXPORT_SYMBOL_NS_GPL(sdca_jack_free_state, "SND_SOC_SDCA");
+
 static int type_get_mask(enum sdca_terminal_type type)
 {
 	switch (type) {
-- 
2.47.3

