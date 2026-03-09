Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0E43624B2
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039105; cv=none; b=XSke7+igSvCePVIRmHmASvwQvcpq77jD8malkhD/am5RZNOyUeetgEMXhK9e2asLjHr2o/qcZamGf+TyM1BU9FpcWEuqWtuj0p5a/3XSr+ZWNKBdpueazsi4140zWrrOzhT/R6a0xyuiYWc5Q6lVM80o+j7h1CGv548BQM5LYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039105; c=relaxed/simple;
	bh=8xebNSAbJUskVVac7rNorJvuDpnXHbFrlQJGj+Tdu08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNeVpVs0wSmaCr8sQEpzo29lFSPEUgkHK/O5lNbPdMUR9yUo93NsW3oJOUQ7OBjcSXUxCMpgDlQxntWGJ9A6uZBayzrVmIYM7h01opcxIYicYmsCkVoG0ceFabPMWfeJ7NFCoNmODXMO2amboxO/UQctz1bq2TcOkcyVbwI6zMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USv2pCQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b7GAiNtu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USv2pCQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b7GAiNtu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MxOAK196574
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IH7tu4cejEh
	a0Z5gHxKrQArAxI79sxkumwMn24DAosQ=; b=USv2pCQNKZ1FU0drBus7k88pVQD
	F87RcUk/74tOSD/V0K25R8kFlTs4uqJZqURK/iB6VSEpsA5cOugHzlhzRaJozsug
	2RWJODEneFEgUnmqxAiyl7QjaUPAux8XIgpoWN6m4BdythyJOzaR69zLiVq5bhJA
	QTUAQwK90NYPlO8lHUw8GIBdIMZ57Yha6EdLdoQMPYZ7koXmmY/7t8KhYgHsiADd
	CBdyB4Ukz4f1vzoIxyb8045aPwkLBeeoNmf3v7M9OJHfBFtJbLDrxYc/IZP1gyK+
	xpxk+I9s8RFx0PgWJrBYkTyxrUVuo36vgicgbFTERIudCHqal5e7LAYHftg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vc659-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50920055f0aso15839381cf.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039102; x=1773643902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IH7tu4cejEha0Z5gHxKrQArAxI79sxkumwMn24DAosQ=;
        b=b7GAiNtuR76QQ2wPScWFX9zPSkq58wdsCaAwe8txsXhph3y3ezAdBOiY52Xj5VfCIa
         rt67VtR8IJRDrNabVfXMi0KN0Cp6EpvgPrml5xDL8NrdSDzoER3SzOalJuANJ4M9GoEA
         s34gH4Q+KhzW5DHYYzgzNXY4rihCToYfFUuNePgm6zuDV0ESSi2i9hVyrDxDg67PWm4N
         pTaKDxiNs6BdYhm3Kf0XtTqVEtWuNt+SXXSb8nRJhJ/47Hi9RjQSZWDlA9L85BTIxr1a
         8r1inO7sb1W56NsDYFBHOlGaorm2UiATirAArxnUQfMsA57dQs972RaKQqDukGDobie2
         Glfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039102; x=1773643902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IH7tu4cejEha0Z5gHxKrQArAxI79sxkumwMn24DAosQ=;
        b=k54mt6svJpjjBxmLmrsStvu0lbx/yDNhHz3+dNVtwctcVcWiT71P+l4hWWIuP05+o3
         ZYcVvBS1HF4rlQqOCjgF6+TpLMAq8DVPcIQUE6fiZiCGU1EsI2VEqGkyGjHU9WMYNSfa
         YA5QqQ5bOvGHKkt2qpFkHPqu1fqKivdZVt0x5PKiR6TnAuU1QZ4+gLLsmXov+KVmf2l8
         +G20W8musywv3HleCghiRUH9s1T1lIvSqu6ama8K9JND4OH1TN/vZlvnee9xR3VPMDHo
         mYK/1ptt1f87bvFm9FwKS7t6yIbKbk0Xo+BbUgWlC2J7sem2gpJ6lzh4k1OG1rsYD4ns
         dQPw==
X-Forwarded-Encrypted: i=1; AJvYcCUgyLS+YTeimy8uR6xXjkPIZjj9u8sxLtlKkOnV7iv37W6Sil59pmIh983hr2CAl0sz6/MIXF/OzKxAsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFLqP0LagiPdu2S10VGqPkGzIZgTCBiTNqtw9C6zoaQbRqSa27
	Tu+uC/V25qeGuzUy1TStw6t3jeUoo8giNRLqUx+SHHzoXXbP2tDUudD0dY4olR43i9sgE6ZU+v/
	p7j3wiyMiP4YSU3Ok5uUbKz0SLlSAGitYBGOxNzL1YPVcUnUAjdB6dp5YsmsMb0O6UQ==
X-Gm-Gg: ATEYQzwdqomPPtYbIkTxClkR9rIJlg3RMHF11cByoL6xh0mWqDu4syrzZk14VjEjYsu
	u5OnnYElhOufiN6J8BuJJ25GoDnvtqPSAa1svR1LbcKzcoGJcUou1Zcgvcgd/jaOINmpFvifv7b
	S/xR2ZAylwc9RjwhytrAfaqyNSbVbM+GiOimrR4BudENDE3JGAXrzQSU/dtHo568Zb2zIVSUzmJ
	HnIsIm5DbA55Oir9/5DqBwm8qoLN77ixrY3TaHXnrgImQlKhi1ngnNRhMcctRqeYwA4mwWWEhiq
	HQflU2oPvKVihY9wfiCGoxGvKlH+NjaXegEBmwXj5bS4+AVty0jOIQj/Aqko4nDMn88lzpIQy54
	4nOEaVU3IIzisCZtXJAaE35AU1x1HKYJzIwdvNASYyWkZ8kUtGvvD1+E=
X-Received: by 2002:a05:620a:2a08:b0:8cd:8fe4:537b with SMTP id af79cd13be357-8cd8fe4584amr26011085a.37.1773039101807;
        Sun, 08 Mar 2026 23:51:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:8cd:8fe4:537b with SMTP id af79cd13be357-8cd8fe4584amr26009185a.37.1773039101369;
        Sun, 08 Mar 2026 23:51:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Mon,  9 Mar 2026 06:51:25 +0000
Message-ID: <20260309065137.949053-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HZqQmR3i7N76U1vvvd_BUTt7w8NGmKzA
X-Proofpoint-GUID: HZqQmR3i7N76U1vvvd_BUTt7w8NGmKzA
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae6dfe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ZjLH_7kMUelE1Q3ziugA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXxjK4Q0OQ7HvO
 0BCunRYklWLfN+W22A3NjZ3+JoZ9q+dw77ItzLOh2Kp/J7lZENMKx+Bqg2JVGsrBsu8MjzRuRjf
 xmi1y3DcRh+kaY/XKlCKf4UeErgAI/byyCEjGeuXcLS93B9MLU33EFdYa/ByxmvLRW0NX1pFeyN
 emBW2aKsGtyJQ5PrVeQ146rotosroCiUn1s0amR5DPV1VBjESzZ2hl3OLj9moi6VpDPjWkzbWL8
 c3OKXpt/LeBg3H27DJoBosZhnkuyF4icpogDgbyG2ftwtZ4hQybpVntcTXj83s7t+2sbHnxKH/U
 jePOySnwDmYDNWxkr2IYR1ELcApq6vZKi5MnnWUPvsZYaDodcsgPd/s4ajciA3box0EtyiEITRc
 4iGbLwYlWoB5LUeQeqnbcB57iFdNnAWeWDjPXbe9AsFVQ8QTHRTPv0s1d+R81adaonLeVMqRbKG
 F/H3PSWKQ5u4MfMXZ+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061

q6apm component registers dais dynamically from ASoC toplology, which
are allocated using device managed version apis. Allocating both
component and dynamic dais using managed version could lead to incorrect
free ordering, dai will be freed while component still holding references
to it.

Fix this issue by moving component to unmanged version so
that the dai pointers are only freeded after the component is removed.

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
index 44841fde3856..a4c662be52e0 100644
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

