Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B939EF2C
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 08:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117518; cv=none; b=SFusQytUqQmPz43GmYBuhDVeKfRrhhOQCm1lwcITncfOpDedq4aRogjL0PFSCWvVEwo3xCzRCBeJDE+TqbBEMtpqTRF2esj8mXjIZPA1QjAfbdLEmDdlv1YkvECuZXdDxXMbRr+/s0IGWZ5t0wKwiixEDBtkQXs/dX5+Iv69wPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117518; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifTtPYqZigsNhBAwNZ6tbLdlpjyW2VT1FEt+TCn5bCzbAUgsRJ8J5sceSQ6hPO7NPAcbAJjup+nsWcu6znjeJfVTiXTh/zNmenDGVM9Se/AwMAmqgvGMPhATGVTRRC31rIbXZmoKOLwm11qaJOj1vhW8E2+r5GmfMtAQ4RmEMQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2CJgvEX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnUwAMFG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2CJgvEX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnUwAMFG"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VeI2091382
	for <linux-sound@vger.kernel.org>; Thu, 2 Apr 2026 08:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=o2CJgvEXFlDAM78P3JlO5bj6CSZ
	JGVyZPVgT0KM8TRI3yramwtPzr/PeboGhBO8Xt+HgJqCL9pNP+TbZYsNNlwH8V1+
	ooPQNWINa0QJiyQqYnSPPI+PWspiEgco8V5W0uP5prAMy9PiESWJcbHTnmlnZnpP
	TbwBeFphZ4qEoNvZOMmvI3gfmTBk8QVoJyT1F6xRZIp1dmhWBTtlJ1cj7DxfBWA7
	cQOJtKImTNA2419MkOckvkcJQ0z1xhgwBq6oAMjvfEJVE3KsYb3PWRJqynHNxnGW
	3CogiXB3haozVtW6AE9ByGTKGXyn04EUrMkcIS3N5UIXTj4SngSbg66kh/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8nfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 08:11:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd722c1a69so150352885a.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117504; x=1775722304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=GnUwAMFG60Deb4W8zk1nOZTQPmtoAPMfjwmboTeniOuCUCB7MhBbn/2z9uPafbRDuM
         mPwbo1/To1qEukqNqa7lhjbygaoM8c9BNyHPSV1uZLQDS2ca4NknNcJlXYqUjuYws89g
         PpoEmXLj8kwgDPQqyL57J1rK8JFuOlJyWU0JSqakM4Oux9nX/3ti2noHZgVRa9BsZEKr
         o55BYgZpwV2khYiNULxM0N2AAY9A+miYPXTZXK7ghcksnGE3eReXB36UyeC9DR85llvv
         ZpSZeHN4ZXwWOnm6P6ecAFtfYrYvvJhEWESTkydHbkZai3l9oGdMJIIkhTUt6GTgtU7x
         LDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117504; x=1775722304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=onU0AAnKEMK8avCLFpZLwq9GQdP5ltyxRy8bzpLg5b+8pfvAEL4snX79klRqtQL+Wc
         iPcFdk6CpjUimM8uLXMuHhSKz9crikPhEI6rAEcgPt+5QOnfAocANMCkEE0WzATv2P7K
         40xdfznalRS6zPdcY+2eWAUsEsa0C4Q6QmAYkNi7f8GdD4BoNhN8LvXosT7e3xTs1tx4
         T0CudRcJ8t1DBAHx1IHc/cFTS3egkP3BJM0Th6CpiMe7G2ncqmEYKPM3rDRqboVNeqS4
         9Q+/yhzg71L4VqikOoQ0k1RjnUjVIv23uWDkthPSsvJo/EukwgV3uU4Jqd/KfYdpQX7U
         ni3w==
X-Forwarded-Encrypted: i=1; AJvYcCW303dLIws+meAotaRL1SvE2BUM4SULjb41R9x2keybii7NMpC7epMjAUH1zPchyLOAVhDh2hCKQrFZqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKNiTKfKDiVVX7hb7k0UdVnQW1hGHj3Qf/X4Up2XJw8OnDaOil
	mk8xRBFgZf3yAC/dpYSx2djC3c8XnApa9fxL+WOcZbkv5SrwI3iH7hxWRhXDQmgC16g+XYExIlH
	5IoLAXW3uZtYwzJEzOHbl8fHNf/45vR/achrRx6QZe0qVxk3OrJO7NzncECaCaWvOxA==
X-Gm-Gg: ATEYQzyIzKlGt4PcgVCXoIOebIELsbaZEuNVYZHPrFi6KQNeWcrxG4f+PY9m/VVPDZI
	q/ihuuKBi0v9btt1gz+GKxiHlyIC1f3r5mf3lyWoK1KicX8ZMvkEKkx2i378peyrThLgzgHmNeb
	xcvx2a9j7MwWEwjPgrFCRCipK+QgVbbU1z/UKLmUG1TZgwZcLqFkVvVrhlFFkyA8raLUatRf9dg
	mjSCFA3E+TIH4HrixJEpU+6J/uaqr4689sten/pGk4Ov1hm7wTMP6HDCb1aKK2g75oeh8td0k/X
	c2cNYDP6pm26fXD8Se6EmFGZXh4L7IEIHZ+gK/el7s/OmM3V4A7K3DZICyZG3OQcL0y9XiAYjac
	cshTuvvlL132KthdV8WvVZ4FPmvizn/pxeRnYlWYc6b3u1fNLwGP5dQc=
X-Received: by 2002:a05:620a:2552:b0:8cf:cf7b:7f1b with SMTP id af79cd13be357-8d1b5c19039mr996184185a.52.1775117503637;
        Thu, 02 Apr 2026 01:11:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:8cf:cf7b:7f1b with SMTP id af79cd13be357-8d1b5c19039mr996181585a.52.1775117503217;
        Thu, 02 Apr 2026 01:11:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:42 -0700 (PDT)
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
Subject: [PATCH v9 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Thu,  2 Apr 2026 08:11:15 +0000
Message-ID: <20260402081118.348071-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfXztSnegTCGR3P
 ZV31WMTmiHoBDfztA7M0bpboMKm85QbNkLOrTMlFhaTiF42a3iYwzxZfHZkLDwAXjWsyq27FHVo
 yE0N1mQYIxmms3g0oHwxzjZIGcr+Clz0uIwmtj0Q+r+c0eneU+rgKXQgKayQrzkf7pMQXNgSx2B
 R+zV5M7SuGLuvQR7YAKbmDhwx2Ke/FxV4BFzk22bZKjq5sl0FDm9ikYFphF1pFHE7f/e+u42nKS
 rsYnxjVnzxj9Qr+WY3j8QrsUCYxnBY5oLtX7p7C9X3Iiyy9z8G/chYKuuOXy4E2tWG503GcfuMT
 TbJNPmVnYH6w7NCNsxC0HCOxXvEhrClI3jUzGqB4U9IGeEOZqVHKfrkcXyPrJUA2pUUgGcai2R3
 CTFspfdaCMzbWpz2EBjNOwLtpaLGH/BTkzgWZe/PrH1Tz9bOTCbTVz+lxWjyqanLc5NAA2Pa3h2
 DmMWY1jA7RM39q7MpxQ==
X-Proofpoint-GUID: X5Jv9dJ4GYgBhptiwoq-ltQkTVrFGEhI
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce24c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: X5Jv9dJ4GYgBhptiwoq-ltQkTVrFGEhI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020072

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ba64117b8cfe..87f6db12003e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3

