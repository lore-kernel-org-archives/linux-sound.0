Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DB033B6C6
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870080; cv=none; b=Dzq9ri3yjsSMHjO/eSTX58E2jCI4KjOIIP3VSUmQIb9G8aCveDhkTq3T48Kv3kjabXEPmHvbYET2LJgOfsx8UYpOpAHghVLK38XWEbL1cjv6bPC//Ao9XT2R/hx4iylOCYw3IQvKJYTJUMBM4yQAtB9etvyWbNByMx4fsvP4M8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870080; c=relaxed/simple;
	bh=oEkIhNKWtLpHdr8wqnNeYG4kHYWQ5Gh5zUBeJNZTPnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILFNqBKroLmQhXtadbQJLl2L1FLjWpeexL4wfy2jU27Sy2a4SEHibTBvoPe8+2C17VBk2a1XKWekMmEcQD2dnFG6OTSkwDcuwvQOQCeu/jLDY5dBldKeASbMT/r3II8RNbw1wdcvMdCuVhsB4GgG+dtRF5evueM6gdflCf86gVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajQ603iN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSx9yM0/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajQ603iN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSx9yM0/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYcYj322188
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I3U7Vm1CHB5
	FgP0u4G05ZUf+1Mwffl62vHgDE0f0D1k=; b=ajQ603iNcCJMVr/s1juL4ITQR/f
	IlSFdAgEi++wCaIXPzNRZHKB/GBsDdzkSX0pNUr1rPsm3bsTES+9kdcLfbDBZRPA
	AS2ciCMahzoxwE9SexzBUFWmzWF12TcARL+oQPHqLdUPQl2NPk+Cxh+y/qsDXlF4
	coqqJP+aiQ345v9WK7YwEyq9XMyyxS0uu7c5EcQzqP1vIZs3kS8jTXjyxV4Ubj7k
	bsHBQrNaT+KG0J7OCNuIuppv0LsxI2D2PMIWRJ2RTdFIUqxSGrJNX/Km2wlju9jz
	TrhQBgXGaGX4Tcgl/VgWSJdNkhNqZdPDYEnFgCfRDM37dQhQRA2KKW1Ojqg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y1e5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so6958526985a.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870077; x=1772474877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3U7Vm1CHB5FgP0u4G05ZUf+1Mwffl62vHgDE0f0D1k=;
        b=iSx9yM0/wmYVpKVQFUiUn9iZ3mycjlaBJ6c/INVLTbxmlgMpAdRL1NQoin5IHRV5Mu
         2qLp8/VIFD1bNM+Ia4H7I1KP2FZdJb4brkibx7EwCV/GpiiwmKTygMUC6j/8TBitjmh4
         Ws79M8XRFQdqnLID5Cuvc1qmlNuuDSOq/99kl8Aaf0PIhHkuhHR7dYQv9nrkVLHZ13Bt
         WuW84xnDFb3p9HXmibqqYyX8NUUkw0ZdZv8sIMaBlVbxAwd5pJcbx8x+e2XlkBgRrcAI
         EewBxAXSLt/rUi+T7hT8np50FBPGfDMaWpn3biVbA7evPipBZs3aGNwuuIzg8Nco/Ypm
         wWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870077; x=1772474877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3U7Vm1CHB5FgP0u4G05ZUf+1Mwffl62vHgDE0f0D1k=;
        b=CSRDfDNpz33/xc/3LorfaXk+IG2CwdqFbCKGDReTXlNF97HddpJjh4C+x7N+66qgv4
         rtIoFEdRM0YaHZMO2/zO5qgCCBKOod0ex0135Sz6/tlXxWt/E2p0uCY1emjJTrG/P1AB
         RssvejIJuk+IhhA3K/6TM2xtq6IBqSSqUuGq8mcBk3PEmC1+I9Kl1lyCXdZmp2U6tzRs
         +oXXiUF2n6Zc/R38XAKUfMbDkBsphj25dC69KI3+pKgpi94n3ACZJIk9cTONiDbKoAfZ
         Qe9Hu4AMkB5WIeviU+ZI7+JeOgs4aRjFKyHpfQA04sBshBRmGEWv7JDUxrhOcN7rf5qF
         8ZWg==
X-Forwarded-Encrypted: i=1; AJvYcCV7OO5QXkByOau71TuxBDapQrbS/Mb34CWbSHKMKX/C98xD4XSId1NonIFjVNIH7tBL7kS7za2vlyC7Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy66Fx0O6Rgn2MyAv7LISNZ3IhZLVjgNKWxPYhmp71agIY9gst
	SCkFGfV05RKPBwgh9I6cmEKxQP5jAA49ZxD8Utn9Gvd6WlMlQ/yEQbuFtt/vQub5eRIdGWhPccd
	7We7zIsp8NJoYlo0c2irnBLXNoaDE6ralWQyQHTf/Hv2sr/OlMkWlEoubKOpg1GM12A==
X-Gm-Gg: AZuq6aKXw7MX6dnS5ptM7gviqU9RT3i0kJzpiAbgOkOVtOdt/Weu0YKAwkSQOQxVzIT
	VBVe434xoOePK7XJjogJHNm5mfxx+cVU7qMjOE9WVa4LRTKNz6En5ri3K0feC5hjLWpYp/g9hEz
	kQQxZuxK1NznEcEWJ6gI6Urt3eD+J3KAWcGsh7D0iVU/+Y0TheaaHuwyAU4b4CoLt32oBQs4sOq
	el1NkqZlZNsRtvv6pSpKo7wR4Nb6CDR15KXeEMGODeKD/rDitaOpax3CAOsRxth+2/S/zzZndQG
	lQYDJm/E/JXQvO22YtGGp3zPOSg8cgYAM4F78z53ZueZTCdFCvU0OOYPPpnAEJFU5qMwN516usm
	YKUrUGIXRaP8nwi5zXGt0cRRQklobcZq9ZRKZGMZ1VdSgHcLyQWSyLUg=
X-Received: by 2002:a05:620a:319a:b0:8c6:a7c8:de5d with SMTP id af79cd13be357-8cb8ca6e71dmr1179963085a.37.1771870077097;
        Mon, 23 Feb 2026 10:07:57 -0800 (PST)
X-Received: by 2002:a05:620a:319a:b0:8c6:a7c8:de5d with SMTP id af79cd13be357-8cb8ca6e71dmr1179957185a.37.1771870076615;
        Mon, 23 Feb 2026 10:07:56 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 01/14] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Mon, 23 Feb 2026 18:07:27 +0000
Message-ID: <20260223180740.444311-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX/9PEzXChVQ/5
 5oJSxuCaSDdm2fhZicXrqnzquVLi7J9U2WoJPruHAppHsSNV7liuXu7azAFLvbx22YSZvT0Al4H
 iUGk+dsJ7YfKVKO1xkE2YjA4+N5GbBV1/tp5bpRipnxApoFAPmi8/iJXf/0wieLwcf0sjg4uHbW
 8RoBosaceN9HMUtn9Q1+cfCQ0923fz03dmtV8LblckxTwFfqW2r9M4KlyLB4HTgZNGmmJVHc1tv
 l3V8115NT7PgbWd5sto5wg7ZFTI0A82M20sH5jP1NM1cWZDim/MZduqguMmBA/hjqjLbKvEb2uH
 HMMAIBq5NdhxX5k+35/VateALO1FLlzND5t9Bs36KVZf/yPbPR272isICLZ2ez4LWTZFnGBQRlf
 bHRqBgVtAbM6gzgNwBsPVMI0wxwGA10AAZBQfB3envLv1836ZgFH2bOUx7ZziOnGxYbfb9oCAy3
 e+TxDgpHLPNOr0pEk4Q==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c977d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=V_9xLtwMS8rYbOKIGWYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: aAKhC4JCV3v26PLg4DrIfGCQrZ508LJ7
X-Proofpoint-ORIG-GUID: aAKhC4JCV3v26PLg4DrIfGCQrZ508LJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

q6apm component registers dais dynamically from ASoC toplology, which
are allocated using device managed version apis. Allocating both
component and dynamic dais using managed version could lead to incorrect
free ordering, dai will be freed while component still holding references
to it.

Fix this issue by moving component to unmanged version so that the dai pointers
are only freeded after the component is removed.

==================================================================
BUG: KASAN: slab-use-after-free in snd_soc_del_component_unlocked+0x3d4/0x400 [snd_soc_core]
Read of size 8 at addr ffff00084493a6e8 by task kworker/u48:0/3426
Tainted: [W]=WARN
Hardware name: LENOVO 21N2ZC5PUS/21N2ZC5PUS, BIOS N42ET57W (1.31 ) 08/08/2024
Workqueue: pdr_notifier_wq pdr_notifier_work [pdr_interface]
Call trace:
 show_stack+0x28/0x7c (C)
 dump_stack_lvl+0x60/0x80
 print_report+0x160/0x4b4
 kasan_report+0xac/0xfc
 __asan_report_load8_noabort+0x20/0x34
 snd_soc_del_component_unlocked+0x3d4/0x400 [snd_soc_core]
 snd_soc_unregister_component_by_driver+0x50/0x88 [snd_soc_core]
 devm_component_release+0x30/0x5c [snd_soc_core]
 devres_release_all+0x13c/0x210
 device_unbind_cleanup+0x20/0x190
 device_release_driver_internal+0x350/0x468
 device_release_driver+0x18/0x30
 bus_remove_device+0x1a0/0x35c
 device_del+0x314/0x7f0
 device_unregister+0x20/0xbc
 apr_remove_device+0x5c/0x7c [apr]
 device_for_each_child+0xd8/0x160
 apr_pd_status+0x7c/0xa8 [apr]
 pdr_notifier_work+0x114/0x240 [pdr_interface]
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Allocated by task 77:
 kasan_save_stack+0x40/0x68
 kasan_save_track+0x20/0x40
 kasan_save_alloc_info+0x44/0x58
 __kasan_kmalloc+0xbc/0xdc
 __kmalloc_node_track_caller_noprof+0x1f4/0x620
 devm_kmalloc+0x7c/0x1c8
 snd_soc_register_dai+0x50/0x4f0 [snd_soc_core]
 soc_tplg_pcm_elems_load+0x55c/0x1eb8 [snd_soc_core]
 snd_soc_tplg_component_load+0x4f8/0xb60 [snd_soc_core]
 audioreach_tplg_init+0x124/0x1fc [snd_q6apm]
 q6apm_audio_probe+0x10/0x1c [snd_q6apm]
 snd_soc_component_probe+0x5c/0x118 [snd_soc_core]
 soc_probe_component+0x44c/0xaf0 [snd_soc_core]
 snd_soc_bind_card+0xad0/0x2370 [snd_soc_core]
 snd_soc_register_card+0x3b0/0x4c0 [snd_soc_core]
 devm_snd_soc_register_card+0x50/0xc8 [snd_soc_core]
 x1e80100_platform_probe+0x208/0x368 [snd_soc_x1e80100]
 platform_probe+0xc0/0x188
 really_probe+0x188/0x804
 __driver_probe_device+0x158/0x358
 driver_probe_device+0x60/0x190
 __device_attach_driver+0x16c/0x2a8
 bus_for_each_drv+0x100/0x194
 __device_attach+0x174/0x380
 device_initial_probe+0x14/0x20
 bus_probe_device+0x124/0x154
 deferred_probe_work_func+0x140/0x220
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Freed by task 3426:
 kasan_save_stack+0x40/0x68
 kasan_save_track+0x20/0x40
 __kasan_save_free_info+0x4c/0x80
 __kasan_slab_free+0x78/0xa0
 kfree+0x100/0x4a4
 devres_release_all+0x144/0x210
 device_unbind_cleanup+0x20/0x190
 device_release_driver_internal+0x350/0x468
 device_release_driver+0x18/0x30
 bus_remove_device+0x1a0/0x35c
 device_del+0x314/0x7f0
 device_unregister+0x20/0xbc
 apr_remove_device+0x5c/0x7c [apr]
 device_for_each_child+0xd8/0x160
 apr_pd_status+0x7c/0xa8 [apr]
 pdr_notifier_work+0x114/0x240 [pdr_interface]
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 1d5edf285793..9891e757165b 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -746,7 +746,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 	q6apm_get_apm_state(apm);
 
-	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
 		dev_err(dev, "failed to register q6apm: %d\n", ret);
 		return ret;
@@ -755,6 +755,11 @@ static int apm_probe(gpr_device_t *gdev)
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 }
 
+static void apm_remove(gpr_device_t *gdev)
+{
+	snd_soc_unregister_component(&gdev->dev);
+}
+
 struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, uint32_t mid)
 {
 	struct audioreach_graph_info *info = graph->info;
@@ -819,6 +824,7 @@ MODULE_DEVICE_TABLE(of, apm_device_id);
 
 static gpr_driver_t apm_driver = {
 	.probe = apm_probe,
+	.remove = apm_remove,
 	.gpr_callback = apm_callback,
 	.driver = {
 		.name = "qcom-apm",
-- 
2.47.3

