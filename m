Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F33BA232
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018167; cv=none; b=BYZRb41eT94Rw6Z3uHfcjtUPYfb1apzol3kmkM5TguTwEv/roC0U+c9YkbL3hhW5qAk496G8X4TwWjkDtqeclgElRmiPaeVMrhx2fcJfuuWK6OWxT4ZQPkTNPpvYwF8uw7av9T2a8DZS5Wx8RRLbhts7FATJWoZnr/pnFxJj82c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018167; c=relaxed/simple;
	bh=ioMmjxhpKgEGbU9Q5ZhuNjYP6+vM1Ed4pEa/HmaRSl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZyLrLu16MpECTS3nA/W980tWSo++zh7nfb/UIR70D2Hn6f3xaQO7D5Cg4Koy7JU+s24xdBae2E7ryePMUXUz39prRaCy4K31HzTwHg16juJWlvFAggpyOShYyMZa9k0BN0/fxpZI+gepTqAxg/yM1uRdTEfWDkPLJvVEuZsgGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3PZlQwQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kn4HGu86; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3PZlQwQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kn4HGu86"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2Xjds331659
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NKjWGmdRv65
	20W4OaNXC1TctOioozKWeG4nDgD3XJX8=; b=o3PZlQwQO9IaP04i4zJIwMNcNc1
	edwARPEPwIoKRydap85PblMumF6blqYfYpjc2BLZP/WHvVC3XXg5qaXHdXdyytcP
	G8ki5J5AFmJqp0iYdgJzhP1y3zgDV06Myv0oQT/qhc0xTg7t5TMtfj/CxCCoKZOb
	gvAM4Ycxo3cdKOey1k68+kh1gfOP9FQAmC2QEM56eD0NKwXIfzOFUqIxGouWiuQm
	ziwXzKRcxIkYji86xrF56zrW5+OpSqrKC4Tkn1l/6ZR+ElgSVzijguUw2w4Y00Tt
	Kz+iyP1L/PEwH77EnMX98pTd8JXBWVnWm7CTRc0pX1UXiQNF8YncdE0bCoA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k083pb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 14:49:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c4169cef1so157294156d6.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Mar 2026 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018165; x=1774622965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKjWGmdRv6520W4OaNXC1TctOioozKWeG4nDgD3XJX8=;
        b=kn4HGu86d8USTYfXSr8YZ5BgVhZ+7F+Sw6yiOMBWJr81h50MZxNo5z/GT6BMIWmp3q
         X9S4wZy2DiiWMQZsPb+h8Gw7rGLF2Lv+isvHG2mn8eY8WgeASiaM06tFwss5QdH/B6st
         NgcSUDEgHbp3qTykxE/4r6JJQl9AZY9jRw8umDKSv8OxZKymlwcnHZlh7Q8BJmsnRaOt
         AUzFe2rGaSvnyw/UrT6r9eK6Kk6EJWuBplDsCkR1vb1+UJE18BqAgopa5XbfPRIRaiKb
         aELjdZKpXARkPY2AFGL2GK9QnQXTDzKtfi4Oqm1nXhPxx988ymmmoCYlLmLGC/Km8oto
         ocqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018165; x=1774622965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NKjWGmdRv6520W4OaNXC1TctOioozKWeG4nDgD3XJX8=;
        b=tAadlZkC+DviU6G1yFhX7C2Ond9n2zRKU8u71mOQ+5ZR7ZJHKNgLPjX7IdhAoHDRc9
         LK+WRYVnw9GSLl2xs8XFvR5JQc52NTs/DgGZu0rIwpE+Udztfe63yc3l/YkjlHatJ9sR
         3BAdo9OT9qJuYkN6QFa+eFxIhGZ4PM/3CF+0K0crgZjaW63Bz1FVzPyRdvf1M20jS/Tl
         qfE0903leh2v8DMYVS4rZtqyeHJUqaGiaQZdcwwzKO3YvnJac49aoRCVO5uoiJYZ9pCc
         l138cflNAux6v9f6NVZrn/vwOlJuszy/o5AOKgDy9/9Fn7vR9Xdo7sa47Y8gqaekf4ab
         3Xkw==
X-Forwarded-Encrypted: i=1; AJvYcCVAbUAhIVbFhg+3tKgQA10SLz3ZdTgnx2fpIDn5Kz7H2oIrZM3FtNSJkJ2HfXIT0wx0tkwULV/2m7VeJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWvp/KLC1cFDhq/Hj4Bz0gJIg6XyjWPc2G03CZbB2qlCFKUtni
	AweG3IoLc3+EJIRHW0+m6cIaJ2AL6sWbe2uUG8Z2jsY3z9rauEFTYzY9Q9/gjG4IijPtJWVx/9f
	Ki4p3RGj08xtapGY6PQcfzdejE6vgVs4q24jkbkBStXhrS34xXuCj2/cQW3FKG+Q0SQ==
X-Gm-Gg: ATEYQzzkmqZB0iIeRdtedetcnuvI5nXT3eMjr5ynxIsWlGNiU/hjCZCXyBVc+bOBYp6
	+w8PSq56KQsJrJy7fSJMbP9AUyCweeKvBPp2zhxLULosSgbOKyQBZcxXQJVbY6zFTeC6ptfhmlN
	1ZAsVRFbkx/yLZ8cV3GVenj6rv4tZJEHLnmlRpOKTW240xfN4e3kqZWDPAmPV2Wl8cA63erMrWB
	smsiXNVYSyEq8PnMPrJcuE/JjCXFzR8JDs+WBy5PrIeC6noG7MkhnJK5hEZCVBZpXyaq0MrX8No
	t9wd9NyLj0yJYOnYtxuyLZD+wpiAayZ9LSiE67DVy81PUJsagYwOsLJLDPdM59yC3hNWXuQ1noA
	2ZE8ObA/QkbJgg6ZO28ux5CgmTxp0/NNadrfQla1RjMVGAJQKFWXA0kk=
X-Received: by 2002:a05:622a:1b8c:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b4001b068mr19927631cf.46.1774018164481;
        Fri, 20 Mar 2026 07:49:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8c:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b4001b068mr19927011cf.46.1774018163780;
        Fri, 20 Mar 2026 07:49:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v6 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Fri, 20 Mar 2026 14:49:06 +0000
Message-ID: <20260320144918.1685838-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bd5e75 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ZjLH_7kMUelE1Q3ziugA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: d-3YIOh9SpdjAPoWJQOHsPaekYfmDvAz
X-Proofpoint-GUID: d-3YIOh9SpdjAPoWJQOHsPaekYfmDvAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX0GaVI7Asum5Q
 J+h7QOp+2YMWUAbsMpqsV162/BYVVL4xKuffO8vGsEY3gvQX9YEIloJrYuEK4Cs5LIZ0S7YP2Ue
 CzKUG616H778LQsxhL7GnQ5zyL3VbUZgZ0B8EA5f72QZGa0WpTP3ZrYxzd+bdbkxJ10ANw3Lh5L
 6Cp3v5exy86U9WS7cvfbB/DssxS24m748TTXX8H5c2ka5/rZzbFZmlQJwackZ9RJEldjCejArSJ
 mQQUXWrZ+4JKLfoysVBxfLbFCavOygYqcj2jVlvkagIWxpzvOlHwPi4d58hjffqG7Gszq+v0UHJ
 dGkirmAouYwZh23kClXOa7FNEN33B5NAoxEr9nDImQrFUlRQPpj2pOvMYcxrE75u48Vwyt21UOh
 zoW5cB27myU0H+hz2R3lzlAjyqdAwIqWSBOuA/UOqN8ViVSh21vHFqzuRha22sGBP8yY66nsGgK
 6kkv9iynXksS8o5+Zog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118

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
index 970b08c89bb3..fece0e3def23 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -747,7 +747,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 	q6apm_get_apm_state(apm);
 
-	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
 		dev_err(dev, "failed to register q6apm: %d\n", ret);
 		return ret;
@@ -756,6 +756,11 @@ static int apm_probe(gpr_device_t *gdev)
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
@@ -820,6 +825,7 @@ MODULE_DEVICE_TABLE(of, apm_device_id);
 
 static gpr_driver_t apm_driver = {
 	.probe = apm_probe,
+	.remove = apm_remove,
 	.gpr_callback = apm_callback,
 	.driver = {
 		.name = "qcom-apm",
-- 
2.47.3

