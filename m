Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284E331A46
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994707; cv=none; b=pSJazlPTKyOby0MEF4oKZdDgSH6vgsYj0CWwsQ6chCJ1jO9sM9z+EGJwWoQ8H2APeF7cDELjAEUwAX3lJCDLMj1F0cZpHxq79Qk6sGOXeuT23vM1qoY4CE3Nbm3VRtaluY3VlYNSZrWcPHpmDo8l3CYqJ8nQ8+459+DMviuf1jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994707; c=relaxed/simple;
	bh=3uufymgDjrfmRs+0w3ITYF149b9XqCSZt0eWOf3mE9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwU5Crx8UuJrvqnsHY1qFTMx3flfWmcjC2QzUYAFWS9+N4yfJyQdWRtxel00R6NI95AanLK9rZhSImD9J6CgbLIQCSvAANhw8R4lEMD1eZYv6PB6d4G8Oi6V+6xCCrBW+pcFtmYIDNjht90g59SpIwLrqE9hHAojPkFUvAe6PNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxtYe28c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFMY6UtJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxtYe28c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFMY6UtJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SHcYm52793659
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ro7jAEZHtS1
	9BWp9r4OxQrpxP6WVAcio2xbYmtk4Pwo=; b=MxtYe28cwv0zkdGPJEsb6qzPoD+
	8z5CeY7J/zsfkKhIpIGl737rqTgc8Bcbz0Bv18GaLGzsaQYVh9lBh4fEi2vYRuWK
	sUCSjd6lTiDcMu5h0eE3hztsJ8+FHQESGn8RR6kap5qD0xsHgzltXScuIJUg+kLm
	nMN9bK8uBgJvhDatMg7hBt3Dk6uC0U9ADkBAOsd+Z2Xz9PSrh172ooWpRgseBO7F
	p9U573SOKtzOd2IopcqFZYLgkONp1a8u031pbKIY9EjSo1OaY5Pmrre50T9a/lbo
	SC1Je813XJXZZpvMKDpzklSEUp00IGUhHjxBr1ZCXeRGW5pX6zaohHCvcog==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1v9j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:58:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514b673c8f1so1158751cf.3
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994705; x=1780599505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro7jAEZHtS19BWp9r4OxQrpxP6WVAcio2xbYmtk4Pwo=;
        b=IFMY6UtJdynUBzu4EpbggxNvZUvnwEK5t70dpAsz7mLMkkdmojAJum52UFB5o2zAHP
         XalbiFWe2WtTzNuPhE3lgOK+u/AM9uGxeo2WUsQ6cPTkIP7k9281uHdyJlIerScclUkq
         M20CXlh+RaUO/CsEOeXTFEsAtTerNh2+xCZxUHsO9gQkLVBT/mxwLHuitetaiNJZeZg+
         l1eE7rFDI//JApBy+Yu/67n7bTqgYqKULvPufMB9ecTIZaYx/MOoehP4QHXeUqu6SFEU
         xgJm4+LDUjBYQhmAu2QvfAl2rWFd76Q/lQhrCW2EKzKekZi6XoguA9qXM/UotSv2Z6Gx
         8yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994705; x=1780599505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro7jAEZHtS19BWp9r4OxQrpxP6WVAcio2xbYmtk4Pwo=;
        b=giK0BeQ7PwP8pZpf3h5RI+tzXb+hLJyIiangsR1Be5mn+JuedKdWbRtUr5zFZU3byI
         wgHrzRgvSJRYs05zMgajzOhN9tg8IyOiEc6WMp6Kogkvrlj7jF8kzxvnYtq2rMsEfTSK
         JjVz5dcoOHaH/dhE0RPiODsyomM+7ajsDfhF/RQ2Vu6janO9nIPZkYMtFTa+zdScFoIW
         dDZOTq9b49K6BXnccGi9oETIlQNjv7tX3NmwkyrI2bfdCmNJh0lQ65Z233iyBK1c++AT
         Ofw1i+fgrmNpXlSfDWlP1nG7eSHXxi+E9tuhSEowM3GmQ2ki3a2YbBHoa4dwIvi1mNq+
         oDJw==
X-Forwarded-Encrypted: i=1; AFNElJ+CMiXihrsUjAK1TYKRCYzPWX8QzobDozhCZfGvNDZeQOcny5z/U4Q+MzV6Ogm506JgNuKU0IIdG64qRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrWFUrwE15Xf/tiJfK/9J452upLX/l/F1M2SHx7MYfH+tWqt0
	QnE8ps4b2LaYeETTFoAHDSZn0TlOzruxqU9mrUoRoKSKfERqhC2iJYPXskJ41qHUq/21VEgmSJ/
	1CQqy4jwqWyltqFdJdYgsrF1G1+bXtNRTC4OBGNpEno70tX+enBetRfDG7KWnSX0c/A==
X-Gm-Gg: Acq92OHEq9IovTVWM8pK/dBctYfRr+bv9jE446Sy6M6fHSF2rJV5n09hVqooLFVohLm
	kU0hZ/yJo0wmRs7eLpWL3o0gy9bHqzwaMCLJyDqxwv7CGT+lQ+2jQgb2L0zffNFsuXosGidEvDr
	PM7fHZEq8b26CNafBVBb88Zh+dJGrLG6jak+z1VuEnajhbQTded9g4zDQPxvOxAWFTjPO4AJSBm
	X1zjv//T4/Tg6LHlOWQZA7ZwrZbn8qyJ/Xld/OQnj8K1JWJ3lgGQue5A6HaNOpxwGdfE5+npqkS
	BPjkjMbW7mt0wATIbOvGOVQkzVbDIJJXBnpxtxETToJE9yA48Wthf/mjBQCbnqEgRVezRMqO7BA
	VWkzEeLUUCJUTcBa35ICBxNDq0Xzgz/TypeF8iucCsqQ5mNbLGsjfq8YSZ//e4tSbxn3Tcg==
X-Received: by 2002:ac8:5808:0:b0:509:3940:30ea with SMTP id d75a77b69052e-5172ce1899emr239921cf.55.1779994704840;
        Thu, 28 May 2026 11:58:24 -0700 (PDT)
X-Received: by 2002:ac8:5808:0:b0:509:3940:30ea with SMTP id d75a77b69052e-5172ce1899emr239521cf.55.1779994704324;
        Thu, 28 May 2026 11:58:24 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/6] ASoC: qcom: audioreach: use cached shared memory module IID
Date: Thu, 28 May 2026 19:58:00 +0100
Message-ID: <20260528185806.6316-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a189051 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=IKYrml1x1okdUiGWNaYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: YgN4KtwVrs9DJJhOnS4O7y28ceWRk4PW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfX/qbH+qcSFjUz
 wnT8XNKwUKswpNLv7tY0+uFHWLIVxipG6zWCAEz/TlURkjBOv4FkiNJvcVVyiGpOFMcRMdqlzLP
 PiktqSt1QhtpJ6Aplg2m/VmmqFy9DG8aH71AupxK+aeEleibo7swZgw4CqHrSPqwKtOPJ9v4Q8i
 ak0IyQ7kNLamUY0WOEuxsQKcFWJlobkSEGvzvm1aHQWQe9zUcYsfYYsRktfCI8rYxTBbXlH3suI
 6GP+8wnvD+pBD93KtU+qh+k+/ybqBmEjsmvPjjreu9OgX3mybvjx8fzCzXMr62osVoNpb+IRMGI
 TS7bWcsZPmgsX6EieRSQk/u58WR6y06uBMWFdaLaCwlshSWcFBsZt1i5+Ar2FA2pXx/kHbA9Gtl
 U0ok7L+8kmelziRazVq1izipqM9eArDmapVZN0WfXgrNkCSa4Ayt2UG7+ymnT2NVVHnzhHt9MNV
 YyReivYOBaIZPCCgwEQ==
X-Proofpoint-GUID: YgN4KtwVrs9DJJhOnS4O7y28ceWRk4PW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280191

audioreach currently calls q6apm_graph_get_rx_shmem_module_iid() to get
the shared memory module IID.

The graph already caches this value in graph->shm_iid, so use it directly
in audioreach_compr_set_param() and audioreach_shared_memory_send_eos().
This prepares for removing the helper in a later patch.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index a13f753eff98..5b73f1d81c9b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -955,7 +955,7 @@ int audioreach_compr_set_param(struct q6apm_graph *graph,
 	struct media_format *header;
 	int rc;
 	void *p;
-	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	int iid = graph->shm_iid;
 	int payload_size = sizeof(struct apm_sh_module_media_fmt_cmd);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(payload_size,
@@ -1404,7 +1404,7 @@ EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
 int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 {
 	struct data_cmd_wr_sh_mem_ep_eos *eos;
-	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	int iid = graph->shm_iid;
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*eos),
 					DATA_CMD_WR_SH_MEM_EP_EOS, 0, graph->port->id, iid);
 	if (IS_ERR(pkt))
-- 
2.53.0

