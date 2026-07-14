Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864E747D929;
	Tue, 14 Jul 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038696; cv=fail; b=Z2UBzuFUmXKELljNpGsWYj0E3mrQIlAE3ERTSoJJQ5WQsj/8NIRWrt8QAlejh7EeF3NFjlyIgL4Dceh4myEWjz3GH9/8N0Qraqg/AQwiiVpaqvR1ohwwBd2MS+b2+v5bSJdUYw4MAZyEG4PrDx76BUm5WqgXUSQvpJotS+rrLl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038696; c=relaxed/simple;
	bh=QuQg0B6B742ePX5aCeFxmucn3eRTK3JTWVtGbFffONE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OPGsjc6/fG7XjrW5dmQDUOV6yEEL3fFtGzorw3UQBpbWBAHX0ww0lhiSh2OjfA8KpZi3iQ5IMQlih8fkJlEbDrzjlhDbUseMeiz7cEUDZRBv0OmAIgPXHW3y73W3EC4EXjp79vGVIqdsuosXM8Yp/k8kSwshwOhvAZRj8ctSkqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K+tlLIFW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AwmAmrNz; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K+tlLIFW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AwmAmrNz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E5AsA12182543;
	Tue, 14 Jul 2026 09:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DwiSmy0GC5CiFACcFPb9L4FoVykbhTd+qWNXNy7kScE=; b=
	K+tlLIFW7hOcF4aCUSpZANXYefh4xz/eoOQYxk2UQwG8uVpdhu0yLPgqgkd4a/qR
	zdLaiRtKc5AOKc32GJCQlFZsAMlZ2an4gike6cp4UW9ZcuGKOii1EOJ1WDSuBDdn
	q86oFF69+hi8aOzU0OgQKEVYew+72DTF1BkQX+UyTfTkURHRn2DWhR1BzD1T2Rd+
	WLIS+lHhopMZ7WHvik0qvkxzLpPPGNtHIzAKbKCbwLX3GBPSyjl0O3Xddxt14blM
	NsA/xbzycMdGeQnEYq975e+TxrwB0pVrVNTbVhj08ZumrBuwI29j9YvW8OpHihr6
	Kkf2tkyDmx4uTMAqPCe9vQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021104.outbound.protection.outlook.com [52.101.57.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vux8x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 09:18:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCGsU4xZ45GwfpM49j3Ra5gvse1M07F9Nx/mG0QIoZ+SxHvZgHbAM70YlOiPWfE62Birf1fRwEKfht1uuCEJwjmtX0JDs7bGp9dJbRXJlDy/5YtOP7+RA5hRxBWMVYNN6V1Zc9ZWopashv7r0c9Wx7MydQx1QKSdGkhIZACUGOIHh9REqhXsdh6YWhiPd4BK6do2/0vMH1QIDsWD0YKGota5lr2+VWA48suaQJCYKS7tvtQAaSriOnbLVjLi68Fp7raiom24T4Rj5TdZ2K7ogTfFdjL7AspbgqGnyqfROy9+WJ1NyoBFBhfW95kBez01EmfoRTmZhROuAmRKALzu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwiSmy0GC5CiFACcFPb9L4FoVykbhTd+qWNXNy7kScE=;
 b=Naw3wz1bSnduv3Rdy9C/O3YH+/WBQbi/hBknB5IyFZwPgTUj30r8t4E3tRVXyRrMI0YKfSKrZTD0WqbKMKr9/PbkEp3xM60RzpKeA8EKMVWGSDDP57n8zg64IHSuUeFE+MGEXaQLTbvCPA7Nuc9n12sq9L82Nq34RwGymL27CGZAS4KosodvVaiu8+HOtWBp7ZRIcLyKUwvDtuKi2f7+CD+hMi1vujne5IdbF9l0JSRTGZ/NWVAVDU4BYqxFl036SvfyHN3fW/wb5B/BWTgQG7TKAtFyTaBqXWxtILMbn3B8oW1mvm4fAUjGcP6nVFFaZ1Wtxri8Xu+ov+wKksfsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwiSmy0GC5CiFACcFPb9L4FoVykbhTd+qWNXNy7kScE=;
 b=AwmAmrNzR1G+9OgeNGOQVA3UCIWgDHkLu3PY7uHK31RSsIkLp+FI+CCnGeOJj0+bhp/xfCW306zkEB28bT5ob1Yit4iX4t+SaEvRejEoqj6++PK9A2jjg6sl62Uw9aUcFNgQJ9Z1GMAaFcRTZv80OqiSqY4Goha7+aqig2kCx6g=
Received: from CH2PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:59::15)
 by LV3PR19MB8558.namprd19.prod.outlook.com (2603:10b6:408:272::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 14:17:58 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::7a) by CH2PR03CA0005.outlook.office365.com
 (2603:10b6:610:59::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 14:17:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Tue, 14 Jul 2026 14:17:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DA864406543;
	Tue, 14 Jul 2026 14:17:56 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BCD7982026C;
	Tue, 14 Jul 2026 14:17:56 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: Add a component fixup_controls callback
Date: Tue, 14 Jul 2026 15:17:51 +0100
Message-ID: <20260714141753.897254-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714141753.897254-1-ckeepax@opensource.cirrus.com>
References: <20260714141753.897254-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|LV3PR19MB8558:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d2a05ba0-1625-4d90-c20c-08dee1b2b470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|61400799027|30052699003|82310400026|16102099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CIW0DK64oTkY2UXxXMizx4S8XYBEB/CIAhUvpwQfLYlXvGBwyKCj9hOwXs/E6YAd90lxXUPtyYCqL8ZFnaeTF1kyaZZUw1hRMj6HX9i0WRKQbn7rs5HLr+1I16GwgIDf791RxiZUER+J4Ctf9AfNbQ0SzWZXhVz3SKORR37lxM23PqEjQGZpY4gYwi1dX0I8btmU7465sWGIZKr/7vfwYsDsOGfonAMt7CkVz0sFqqzU3pO8pNHSNcI+ddjbo6COrgSTZjpQYw6sLzJ/82E9N/Jk0AFznnw6DoJEJxrtFE7PgjZKBf3RBErtiBYHumg0MNndtfflGRjT8IBNlN5XF+ZLXrky4SVKD12LDZp2CD0FuSHnuBMs9qWqC6ega8KhFKM+KAd/1AnNtouURfD2FOJpDLqCzUC2GSOkp8R385f92x2wnQyinExABCegUtWyaO/c5lIR5+HSv8ovLjZ4xO9V2Y8gYrhaMGfFpU5j/uLw/Rny/BXvvRcRkSQv4GB/9fBMlUQ1ybdOVrnrLK+ewmnPTf/+vxodoae/HFl8qV8gG3wF8y5QR44KOvK5Co2J9TICd4QsBNI5rKrc/299gePhacryBPi/kSLdn07GO6IFUnlGWoIAMCpfmU4E40jvTp0UmWOujYVR52RK26SAGQqVR/rEFJZGibC4fizZ97pJOtqAx9dOAn4znG1i55BMVh7DyRubfuGNfKxoZw2naQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(61400799027)(30052699003)(82310400026)(16102099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ym7uVtvq3VhSYA7REyKYeX1tJKitxj/u6hpHmDlGHgdbB8qDK2K2ocUVySdBIOBE+MeeFQd7DvxAjO8ubliQjA7Mhh9WSMr9E3HYZpk58ERJV84Co7gNeZ6pIsMxh9SbKikP9yEmX8HhLaFfySxNn/1thwSV8hRpc+WrdxLBhtqQf5fAPI1eYLV5Hl5IajnPj/EIGEuAOAa4KHDzQFwaSVbqZa2m6qN62ThluT3HXmdLTO9zFLOBGy+Wq+2MFC9sVwzIgwztl52L53oOcaYD8Dm0SyxYtH8KeiMaNlPxb1l/kTFH4UwGlE2qf0UE89pLPBJZmGithmPB/XDB5T7f9PHXnC/H+JLR/K6u0d7y80bWTlHB0IKSlQmoS1yIGYNBTrgL2WAVBJ7Jvk+FG4hCDi/cL6E+Vln3x2ZBG82bRwAwdcqWSKYUMYHCtVMWjHTM
X-Exchange-RoutingPolicyChecked:
	I2UdECBS7Jb+qK93/ng8FV1iMt0mka8XM1hhwYvzkNfLnu6ZwvHF7xAKhuQCDK/g5t4P+AS9XAw8PRcUo2zeIYdi0fIqKkZvrSWZvO7VGZmPrUhfF+x4FE+dKRtM/c5Ce3SGDyaNMo9LnPPzNrRTIYgx6D/z1JDNRYHAQMNzNNz+Qd0t3nvod4roL1VyhKvCGQOf3WbzXVjbCgEAaVpZ/5+f3i3PgWOgbPTwOkpav4b8iddbSrRS/Yg5YBEES6gpxjHria2ESHeY2RDafvXR2GVuXBHZhVRwLdsFk7+eeB6dxL8t3rqVt3gI4qzeH5Stplql7+jV1GsRLyJN9AYslQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:17:57.8544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a05ba0-1625-4d90-c20c-08dee1b2b470
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8558
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a56451a cx=c_pps
 a=qAO2aVrDdLyRlaU/jZBZ7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=vcUlNS-PWQMF5VYGtFgA:9
X-Proofpoint-ORIG-GUID: WImM5j4upPR_j1qo5TbHzc-4Emt-Xb-3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0OSBTYWx0ZWRfX5gCKj4vvL7Cq
 ypVK1/6KLDRo55qY8DUyycYofBuN1+soZfMAddg1gwoIlVh7TTjnRl7XaWGitoZHpsTAAtoJ0t4
 38vIjO8HiWigSimoYAJDVXZv874CZC4=
X-Proofpoint-GUID: WImM5j4upPR_j1qo5TbHzc-4Emt-Xb-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0OSBTYWx0ZWRfXwsZflMPocm8V
 m8S678fYlbZDz8Vzz2KaxbIRfdpZ9O+PGIAJ7e7d/lbDyyMPIXYSedSMmOEpz0cwmtoPgH8K5GQ
 I/GPUMiVdjQgpQRDXx4zZ447d2TrFhNqrtj2r0RGQiiayTQa5v1eHtcmS+hpbRYN0qoguFkkXfa
 v7MJWLNWHt3ddZW/tkjir6dBsrzg0aXflCRjwxydeKU2rn8r4XgGBvfalOB7fldl9r9w/utalB2
 OfMMIQ46i9n5qiZku/G/fmrs7y+fmYK9S4ZNv3GkPdKjOJFv6zwU/oEBiHat6VUbrzFUxYBAHOa
 j9hccjMW99q3jMeEApQ9fIGGpsYX54lKLvdteRRCis/Ve/BYaPX2RK8DjKCiskV5TANy0/InZE/
 r+h2nsp2+3c7bOjkCJ01HVMhkr0JUMfxe7ka0pvl4O9+0xUmrXmWbRIGeh4Z1UOFYkW/7x/Ob22
 espXlf7aggAe0xo2EUA==
X-Proofpoint-Spam-Reason: safe

A card level fixup_controls callback was added in:

commit df4d27b19b89 ("ASoC: Introduce 'fixup_controls' card method")

This allowed the machine driver to take actions after all the
card controls have been added. However, there are times when a
codec driver would also want to do things like obtain references
to controls for later use, which requires all the controls to be
present. Add a component level fixup_controls callback, echoing
the card level option.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h |  2 ++
 sound/soc/soc-component.c     | 10 ++++++++++
 sound/soc/soc-core.c          |  5 +++++
 3 files changed, 17 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index aa423865dbe7c..4b7d7954953db 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -78,6 +78,7 @@ struct snd_soc_component_driver {
 	unsigned int num_dapm_routes;
 
 	int (*probe)(struct snd_soc_component *component);
+	int (*fixup_controls)(struct snd_soc_component *component);
 	void (*remove)(struct snd_soc_component *component);
 	int (*suspend)(struct snd_soc_component *component);
 	int (*resume)(struct snd_soc_component *component);
@@ -380,6 +381,7 @@ void snd_soc_component_suspend(struct snd_soc_component *component);
 void snd_soc_component_resume(struct snd_soc_component *component);
 int snd_soc_component_is_suspended(struct snd_soc_component *component);
 int snd_soc_component_probe(struct snd_soc_component *component);
+int snd_soc_component_fixup_controls(struct snd_soc_component *component);
 void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 21492d15833f7..2ce24513fac5d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -310,6 +310,16 @@ int snd_soc_component_probe(struct snd_soc_component *component)
 	return soc_component_ret(component, ret);
 }
 
+int snd_soc_component_fixup_controls(struct snd_soc_component *component)
+{
+	int ret = 0;
+
+	if (component->driver->fixup_controls)
+		ret = component->driver->fixup_controls(component);
+
+	return soc_component_ret(component, ret);
+}
+
 void snd_soc_component_remove(struct snd_soc_component *component)
 {
 	if (component->driver->remove)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7817beea5b3bc..44f9bb4473f55 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2162,6 +2162,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		goto probe_end;
 
 	snd_soc_dapm_new_widgets(card);
+	for_each_card_components(card, component) {
+		ret = snd_soc_component_fixup_controls(component);
+		if (ret < 0)
+			goto probe_end;
+	}
 	snd_soc_card_fixup_controls(card);
 
 	ret = snd_card_register(card->snd_card);
-- 
2.47.3

