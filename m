Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C892DB785;
	Mon, 11 May 2026 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499783; cv=fail; b=PwtEC12ZwHTGr6J7Slsh1VTR+n8QI6OtqUnATEpcxqraIsECrHFZX9hSpSBaXvdKb7cl5mgah4kL6sJ5hmf+UriHwfRd8r4Kn+pIQ0s0f8iFFc8/kr2tKGE6lejXNyayMSDcWdeTgK/0+YlCV7cJ3eAlI+FXdgkg5tzVeq5LOCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499783; c=relaxed/simple;
	bh=ukq+Z2gdrLmJUQIStJIRUEDaNyNWPyNOxxUTJ4aU8E8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SAMQ/BTxMF3wEZpHuKmNJM8xRnjg1wR41i6CMIDyeZ04MnieCNrZwO7YJIcP3ib1FE0LV8qpg9My6vluPuxMFqGOf7XnYFcM+7N2R8rIcm30zC22jQz9XLlHVIL3PfIesdjEOvZjTTdUBY55GlusROGa73/Lfdl33ufpaQLGBi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nDG3/XqK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lYpdIhDE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nDG3/XqK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lYpdIhDE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6FuW43500451;
	Mon, 11 May 2026 06:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=9H7aNm9ZVu9thFk7
	42CK7+m0/GApj9sW+csg2e7XMxs=; b=nDG3/XqKH0YOue1OfshdZP3hq0zak8MU
	IxGKK+O0wtjqHDTTg1HctAOd3pka4fK6U6xJdEeOszwMle78aimZlm0GZh0WpATR
	zUpdRn4OoLbBFDtapPSaDTC0SMygsiSIXrsXXf2vBNoWmuXhmSE4lKndJ7gFzdq/
	F4SsE6DPlBAD7J7kmgMLXsiEPkua0NY+HhGythqevDkSEwH3SiEeSw6RdTso7Tam
	Ae6+O1javuAj2gONQgaDKFTbHn2n/dW/kJvtLVjMZ7FYfurSNZdFeLRSYZ360k2o
	N6ZzvzbEHLVbEikcVZX/u6kcbyBkN1HuzLt26BcFZNsY2Ujv0DtvKQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020119.outbound.protection.outlook.com [52.101.56.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0sx1r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 06:42:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4OeQ5GZ1g1AXKEhxr95FzcbweyL7M40RnvrzB+iasRX16wBvxtejTyxfMXAwrQsnupzY4HsKE+suzj/+okqikT8DJHGXD7oiSmXE/RNzYONwgvWfJcP/Z2pJxmNOmrJQzXmPzcoLSctngFVKOF257uQAk9raBX2OQuJ0TQrBStyzrlC17f1j0stMg6oIGJrR78IYXRcYULV+3XfLxcZJadKlXMWe+G3stdKfHMKy1wxnWZl02i1VySbZ/AuLPlldI8JKg5MNTdtFdOyu5jMOM+u4W1h/8IfO77nF/Kzy37PGsZKQ08+KlHIibZbGbe7FlJz4/Xn3/uOe2W7Mo7V6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9H7aNm9ZVu9thFk742CK7+m0/GApj9sW+csg2e7XMxs=;
 b=c8SweUPUcDliybC7NMKzPokM45XokS5SjvckV37wElzE/jQam5G4EWLFRu2W23cclC4LQcbmNSEUimoH/IUaoYOgRwqgLtbXtv0zeoidaPZGwAYvW4bxrsxB2m+5ztUM2z2/WDGLHh4VFDeGjPY0NQpQhLEkdccflMDImTTc3h6DY15KNUF7uhwbRRk+qOtv9IqBnLESRs29sRrQfkVBB36thWE953/V8Ml08+GWhjk6Y0maKq4tZdkTVO1tixMItyEwg4/EZMJcMftq8FF4sS1emnIAKmjUC+4s/+VuT+ZqVVaScCdPUiXQ7d4fRtcmYchTuzN7n/WMaqbcudRrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9H7aNm9ZVu9thFk742CK7+m0/GApj9sW+csg2e7XMxs=;
 b=lYpdIhDEys0sZCAkoqWd1W2kuZVz/23n/9/z+OtLa1egxPaGNJSlIcqAFzm/5ybRvk8S/VXduErPN3rRX5Q04+2JH/7fMBD5PMQdNMf1wxzebkXzLe5Ynpzlf/786wNBi2n/NXwomx5sCSztB/2bBQE+EA2sADoT/nxQ82loMqA=
Received: from DM6PR02CA0126.namprd02.prod.outlook.com (2603:10b6:5:1b4::28)
 by DS7PR19MB8984.namprd19.prod.outlook.com (2603:10b6:8:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 11:42:42 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com (2603:10b6:5:1b4::4)
 by DM6PR02CA0126.outlook.office365.com (2603:10b6:5:1b4::28) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23
 via Frontend Transport; Mon, 11 May 2026 11:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 11:42:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21CC240654F;
	Mon, 11 May 2026 11:42:40 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 09865820244;
	Mon, 11 May 2026 11:42:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Check for successful runtime-resume in cs35l56_dsp_work()
Date: Mon, 11 May 2026 12:42:39 +0100
Message-ID: <20260511114239.44970-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DS7PR19MB8984:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aeb40ff8-51f8-4e49-e2bf-08deaf5268fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|11063799003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NMHoTYHuYIw/9pdE44yUIr3SndvcqjtQf5WpIpCJctb16stRppOOVRGrulsAYQF3Bn+v/enBTvQJrZk1cqIK4DoCiBuOdHZfNYkPwmvuuo2rG8vmPcItTkfut+Wm5VqARXKrxJKKGM5RzIChQqBVabZsnxnfiRq02wmR/6a+diHXiZZQRx+7bO1EjejB44JsaCLrzT38Duwu2C1n1Rjcs/kGLvNRXxm1Vees4nwlzfCfN6wjyybSaDkRli5dr0UZi0EFa+Skmyzm+sJ57WBx4LvgssgYF2u0C9xBqUUTraFkTfkWK7/gzl0LiUx7etumAmkEchGBsnbXJ+a9HvbZ+9d8BFQn+X1M37WTCcw1fDyOyKCcQvL5/7WtXZ7Ve4UVnTHeUXa88tEIl9yzmIIESHswr1B1fOu1bHQhsw2p00zN2fIiZsxDitFWtTR/fV76ov9IVVHOUX5qN3bo595CXr9T8hdrFmwcacz81Og1P26cdlcoyC8/GdzlhLsNRZSsS0376btzQo8uqf/3YJHIVSIsweOJbkv/o2pEZvbE4mV7gG4nQGWImXikpB0+lJTTCsxod5WZeB+povB7hNE5Kbj/1m4MWpJeTfsmg6wxcpDNw1GaK6TlPf50oLfwt0x164MLvKubH7Qx+AGP+dDX4t03j4v+umX8o8fGGxoJo0BobgXIqoQ++0UrPKWO4BlKw1zVeBdpdY00Adz1Jb2BkhtaZiWMZe9tH/MGOnT9KyU=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(11063799003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dSVViZ8VPsj3hTgTjgTrJaGg8q9AP611enUDZIvteeQRXCj0O2wF1gecblKDf367mpP4jB4o355HNk1ra7Pg1//H+m1sDh09qE3yb/eg+MPOImx5yjq4h/D3/diqyx7OXS+qx2YDdN4m3Gr77eiLoG1vwhViRrm7Z4zpuKo4aIcLdZwanquTlqRwCb4t3W0CGhB2giTcd7NBa+g+f3KBzrkJ2vfFaQQsGll17rWrf5vgo6iEt7jckgXBMoWV9XEWu6cvv2JU/OYy/t4Cij6XnlEqskL5DSibD830YhZdaq3b4QVSxE8RZx5LGCYGOilfKWte1QXd8vPdWWmr5Ng0R34Nh52ZRP5N7EJDs+xZzzuzFoGzUIHLaleb+v3k7yAFsUWrvHK4SDpyXn5nOMmP/rczIekI8i8GDgI5YkgVWZDv+aSdsrUpjIQgtFViM5HB
X-Exchange-RoutingPolicyChecked:
	n/z7dVbiLP7xMQ9qbytqBOL4hFvDMTaGRpojP6WAdVlJg1UHnDubom/zVK1DUsT+bwpPqBhsF52vnzYJYc+qrOupw69R4Isw6P1VfMi3oG3nFAFlbMPFyyUBdI2S2WM419NcV6gitfscbAULGDpUH7kGSvRMNQsWjzoX9KCR7j89eyXlnM+67r1aRB/3SCp1k5jdgTtFg0fIxsxoTzcyCNJU57jzzZ0sBp1fgoWFNED75ikXJsW0VkRFEOLWCl94VCn3SreghIWkAEnZVJtCvvspiUmv7deR/zCGaCKVWp6dKYjNry0p56+OqB0cmCEjZV1nNDNlBe+B1WL4FIVfEw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 11:42:41.3710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb40ff8-51f8-4e49-e2bf-08deaf5268fa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8984
X-Proofpoint-GUID: xYR0GAbTmrrYLai2j6SF66AOaEyKMl_I
X-Proofpoint-ORIG-GUID: xYR0GAbTmrrYLai2j6SF66AOaEyKMl_I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzMCBTYWx0ZWRfX0sVK0OVwA5Ep
 8gocF+UYWuDj+IwtFIoO/cQEUK0P+vGjby4jyuGasOlwFs9WxGHTmrU0A79TGT1bbtCobJWZwKW
 67URc+7teF0Om/qwcsofq2mfEQJgXBw1FeIGZD4bm0Ez/8f0ZWnHenoWRtXTqzH/udedWbSNj0X
 vcxVBOn+rum91n4cdPPUcz8SWtl1fbl3dYK6wVUc9rjHv9i73XkwHIyFsvHpju2z7gOmH+/uJE+
 dB0JVp/nkYciolCH2DqGPqUkv/eGhCFkdRy0BVHRQjTfJKQRFApk1GBaOqRezjaTmF8VDGiy7Ol
 mavhWMISNG2c2/IB/1bCrYKg9gCJ8zHjjmDdj939SWlliMddOC4DGO2Q1r82/zn7tSecKhigJjX
 nHU+aPNLSSn9na6IoCZ2RGOgGBtTy+sfXEHcSgDE9z/Elbhu5kP/GhF/azKev3mSdJFCsrGZlMe
 7ONo5e68l0KbyyVM+Eg==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01c0b7 cx=c_pps
 a=TIEeaaXQjm2sgGsZDBwmrA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=nDmDTUmQT51EFLua-nAA:9
X-Proofpoint-Spam-Reason: safe

In cs35l56_dsp_work() check that the request for runtime-resume was
successful instead of assuming that it can't fail.

We may as well do this using the new PM_RUNTIME_ACQUIRE*() macros and
remove the manual pm_runtime_put_autosuspend() and associated gotos.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 849d70ca23d6..4fbbdcc87151 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -867,11 +867,16 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	if (!cs35l56->base.init_done)
 		return;
 
-	pm_runtime_get_sync(cs35l56->base.dev);
+	PM_RUNTIME_ACQUIRE(cs35l56->base.dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret) {
+		dev_err(cs35l56->base.dev, "dsp_work failed to runtime-resume: %d\n", ret);
+		return;
+	}
 
 	ret = cs35l56_read_prot_status(&cs35l56->base, &firmware_missing, &firmware_version);
 	if (ret)
-		goto err;
+		return;
 
 	/* Populate fw file qualifier with the revision and security state */
 	kfree(cs35l56->dsp.fwf_name);
@@ -887,7 +892,7 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	}
 
 	if (!cs35l56->dsp.fwf_name)
-		goto err;
+		return;
 
 	dev_dbg(cs35l56->base.dev, "DSP fwf name: '%s' system name: '%s'\n",
 		cs35l56->dsp.fwf_name, cs35l56->dsp.system_name);
@@ -905,8 +910,6 @@ static void cs35l56_dsp_work(struct work_struct *work)
 		cs35l56_patch(cs35l56, firmware_missing);
 
 	cs35l56_log_tuning(&cs35l56->base, &cs35l56->dsp.cs_dsp);
-err:
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
 
 static struct snd_soc_dapm_context *cs35l56_power_up_for_cal(struct cs35l56_private *cs35l56)
-- 
2.47.3

