Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E114C77B7
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196534; cv=none; b=gvn26fr7GsX5ouH3k/zkbzPqufL3fXMHo5kSXMQ9F71i71vBhPRZIR8MKfAvOYXRPF/eiVNdTP8EGiKjibuiQowOOV5HoTBkKBZNOR2kqgzYAOT4v2bOlihUgbYI0vIexiTtJovAsVLTqrxIrKG4ky69GmeDBjy5prEe1wrXN0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196534; c=relaxed/simple;
	bh=K/hVO6qPHgKUGTSudx4uDg+YCovP5hpQlsKCypYbQ1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Om/y9a/sYCuqPLt8HI98MKdkLevHOzeX9aXbDDoryFV10jVq7MNFBkP+3WE8t5l2isgacca/vEI/i+dPRFKOjp+rB5SII2tJvSeuEv+/KRkvQ3YRfjcsXPbvWCKfebc/pAZgiY09+1NBq/A3O2Ne6pUdVxU7mTVm8nrhnAMLD7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1ON02rr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckIh+6Ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1ON02rr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckIh+6Ew"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JARbj34130974
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 13:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0yq9S2r8Arp
	oCxn5kQzyttucSExAujLx06AGO3snZjs=; b=f1ON02rrSqP7FX1ciEogJIv0IJr
	CfSiJD3jynepNykVBF3YxXnoGnqybrL9coIsHPE2/kzbRNI7OGzL6DP6o4VSWWuR
	0QmUZrYOFeaOiJ4qZ5bGYv2F+j70VFDRMymkYvfJ3+UBF6maFsMe1jgX5OK0m8xW
	f40gTmvfhxUGGbmAzMJzU+Gy4DryRvPw9oVxN8qebXs6ZKQW52WXndF7rTVf3RZZ
	Bi2kQLGvlL0OgfGXKjGZ80qbc+yHhutZ/H23l4BmSZncnI8T9pEqdNiO6w7Px2CB
	tbCT1ywTZlUlRc/8ZUBJaT0PmDNxQlFOEwkP5A6K5v9VdHMg0NB2M1EPQMg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1hvmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 13:15:32 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95fdb64f843so4907660241.0
        for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196532; x=1779801332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yq9S2r8ArpoCxn5kQzyttucSExAujLx06AGO3snZjs=;
        b=ckIh+6Ewx/l6PToOr5Aa367R5k8BReAF8p2itYQq1oYxRdhxEVmeuti/bmXWVVOKcS
         Qlg5bxpOs+kF7UKrPwSyc5fGhVcWhF91VObzId/pliANQTTmMEtpseHNmUgYnD5qX51R
         wttNEqoF/rXcx58IeFEYoh+AOAf+qoEmhVhRdOTzbqtoqtTKUNSbmQKdP//RX+IYsGFv
         lDzcmFAkJ9L6zfkQi7LdstA2zIyy8ejWWWKhjiEFIvbEqE8SdKHtPo74VNzDbMxlJxZi
         u+cNm5mkhj534ru35Gc0TpqUeXKLYjhAInfBRlt0uGAfEWHT3gRPTCjB/dK+8d+xi7NY
         yHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196532; x=1779801332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0yq9S2r8ArpoCxn5kQzyttucSExAujLx06AGO3snZjs=;
        b=STNNx4YCSbG9fxZPfPzcFA726lLXw9VzB3PXIFnCq5p5fV/OEYLIZNcvazfgeAmnnr
         oxXVZPXLaTSlJMI/S+KVmc1f/4JhIwAXws/QLMjMXyFzmwyFUxX9pur9MfUIVIhlkVXE
         vHLYT8lgI8DGIV9cpGXCXQs8N7RqPeEW6ulyuVMBEHlXcTJrEsBdC2C1XsfTv7vfNDHY
         VGYCBLo0FIl1gWGFVSNSuVMn/bmTQe7II7an8bKUASEAHHQTxBWbHB0k0IU71MqCJpwB
         F+N4sSpp49sTjdK7FQLT13pWmHjygY+kffZoHuwqJWGcNOHQ7wdQEhDyZUfMV30aEEOA
         THqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qHAzjRLRtB3pWh1Ei4dox5zkx/hCmQfGoqLtLGKSMoqs5GOurmyNq+G7PFL7wJpVPFNyzhW4VwVN7mg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw/h44smRxGu8YWCVA+OwszV/e/VOK2rd98vbBLmvAvPcTziqa
	hQy743526DIpjwwNpjImmKGR1l+XyxzTP5b8wshNtX8Iuk30CNApJOhxu4h4Raax9hfj6vWATWB
	dKh7PFvf79gnVgdUkU5x+NYCXBa5wBXnAmblhS4U465jfRV7g7lZCzqjBQndl0LOvOQ==
X-Gm-Gg: Acq92OGTxywHncrM7TCLSDN59bCNue8fRgpNXfHIhCEl2nuH+GHmceXmLmNgszTcdDp
	A+xN4m0CVB9gwE1jh7mMkJL8KArkCRcNzwFX751LAznzaJ6g88JiM42MSs2vTDUBiXNMjmPCeLr
	7Q+N8DqBPznXqNer2MnU+vRIoUXGTtTcJBMWeujYdUTcUnFZh2qo2XlCFSlFvXP8+nUdug507uy
	ON8S5u9SdbWIUNRN5n17ashjL1eVHuDQxuI/K4S336biWvqWl9jejZW3wp6tGjvrrItvF0RAnFS
	DSsPPkIBjbPvs0/Ki0fSE/52QdJbXLgBZUVbEcoOh8z2Dko7ObX9BpCzkHlLKF2Gjlwmy8AknaQ
	FFLvLVZGLw0KEh1SdAOSwp6HjYrsTIkmEX5vCW/gdgxhZYicf3Kp2+vY=
X-Received: by 2002:a05:6122:4d0d:b0:56e:e80c:bb25 with SMTP id 71dfb90a1353d-5760c0a673cmr10979855e0c.13.1779196531848;
        Tue, 19 May 2026 06:15:31 -0700 (PDT)
X-Received: by 2002:a05:6122:4d0d:b0:56e:e80c:bb25 with SMTP id 71dfb90a1353d-5760c0a673cmr10979779e0c.13.1779196531415;
        Tue, 19 May 2026 06:15:31 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, alexey.klimov@linaro.org,
        ravi.hothi@oss.qualcomm.com, mathieu.poirier@linaro.org,
        verhaegen@google.com, andersson@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/6] ASoC: qcom: audioreach: use cached shared memory module IID
Date: Tue, 19 May 2026 13:15:22 +0000
Message-ID: <20260519131527.4002526-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c6274 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=IKYrml1x1okdUiGWNaYA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: eQxEGrg6Rl8dqq3U9Se_4fqLobQpIqff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX5y6A0RluEBf2
 EnGxjW3MZg2zMUmYctkgbxIXhiwNEdjTfuQXKkjKWiu7m8U1KEHyIFLwOi2I2HqUquBSgxaHXhh
 /FKVItyIxP2gdbeIXu0nY7MBhJbWf1pbARF6aR6+ZwSLmhYAtpbzkK3urcN1OLeoXkXQPdL/4tO
 6lRrA1Er7Vrs8QpP8teiAvrQXeVYqB5lnG1pfBMG+53T2bIN7EpUrCETK5BTs8ol3CH3MnyYoyA
 kdrE1Okhw3/Np3TXnCt1Ne4OtpeykSLQyduWg4PsGHYNrWiiMQCOtrM215OqyDAoIgcGrbUkQ6n
 b4HMPVxFSi4eP047FuG/BcyCiznOSi4kIQybubXvXAX8ZyUrOnwmawxl6+OLller8yZf5SOwR5V
 DInQTvycioYc9tep6udkNcDwwT+QhOhe/KdoKCYX3g4ti+eVgQltwZjiGwpLit/K/nFDcdBcRRy
 F5nvnfSbG9COgCPo9xw==
X-Proofpoint-ORIG-GUID: eQxEGrg6Rl8dqq3U9Se_4fqLobQpIqff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131

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
2.47.3

