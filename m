Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772983B38B9
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749575; cv=none; b=QDBAAe/yVsprdtFAz96UY5dSqH7m6MUa/jtdILZ2APlGpbIV96uQMui4qqczUheHyWUxSKxgdbisjPe+w0JhlWwlYHRn7h7Ztf3+5V/i5HUOPw0rDL4H58K7nTxuVa9qT8qB0c52s0pUn5eUQzypQmr/jxgbpHw/UmRIsIQaXDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749575; c=relaxed/simple;
	bh=vh5KIaHQcsvsGTIdhKFA4r19rfxCoAw/feb3ERfGRg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dhRpEQ7qTkK6b0PZt7c/J698xwrfIsEbnrTwibGJ+Q/mc0eEx9oaon2Mq6Oh0Qzin6Ac0FNxk3C9jSBDQLlg2tyhBE2HFNd+XIyzmU+nDTwjYvJMnIPryVu4RouvIDz5o76Jpmq+glFcH1JX9W1oV/DrfdimXXzzRqhO4hlhQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xq5uT8J1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOti3RSN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xq5uT8J1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOti3RSN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E56hGw828270
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 09:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=L/gWGxAxU8XUOeT0G9p8NJEU7jkU0jYtw+L
	tJ0jNbWo=; b=Xq5uT8J1HxWrmqqlvA4c+n6DhrKJzqtxcFw2VfiX63g/ftxFdPe
	IxRsn4vpudE+0vK2q3YdOKky86jZ5gpnaXciCtJfMO/HSxEOFQcdP1OEl8uBu+SX
	srfvso0F/oxNGwN5frGFkrye0SM1djiKB6929OH7UbfCAjqD5PYhPhR2qYLuksgX
	20v17hHuxPPW26gl7JVOH7wvUpZ63pyyGPQTcW0n04MEptFyX864LqR5/mE60hqy
	TG8n6Qrzfx7FkWE9bqSHkrb0+Y37hcKY9f3EfYKQySzBDUgrwlHyrcA1Cqa2kJIc
	IFFAICc4kv+GpSVtwkyJfw7wOmCW06NXNbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7gu5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 09:06:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51650041428so2338711cf.3
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778749572; x=1779354372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/gWGxAxU8XUOeT0G9p8NJEU7jkU0jYtw+LtJ0jNbWo=;
        b=JOti3RSNUunE13fGhAYsseYUHV6MHpn3XazZiskPxeDSLy9+q1BaRfiMx52/pgj8mA
         FejgGlu+oCaR8jIvB3/DumbjmskeQPDkO1ppB5vK1MumKfb2TOZlwIjdZ7pU1SIRLuMs
         RpG7U7WfVdLY1wUleIkbZrZK5tbWMq5H3Se6GXBhbS4CKimX90/WOJDGR3t9ll1vsqBy
         0kcpnGmS0ljoikyeSljbtVMjbz/6xOPV8u4euuhsXuPO8mlNK8mqCHy7vnFgDZh3Lqo2
         bBfj2XZ2t4PqT5GMJfkgXJ7HDMdSmpCgFmRVYk3Fckr/ikXLYBQ/WtvhLPC1o59nFZ37
         DCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749572; x=1779354372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/gWGxAxU8XUOeT0G9p8NJEU7jkU0jYtw+LtJ0jNbWo=;
        b=UCdPL5WdIZorU1mztIrt5guG1JuMlLc5e7/NHa2fFfRFf9UH38tNlbncNJzGOc/kW8
         CeBGHCQ1wrG8btkFUVWn/yz7GI9IuIBazy6KPlOM0IuQtlFoU7ykKmcfUyyFsNlWakqv
         jpj70hLPPNInKifozBsUpNemyfy1LIB3YIlK9Q/sNseel0Xi24pslz87XvL+c9+7ptCA
         eHcFnnSzlOu4wFwa8egzFk/eRs+O3BSus14F3TSonotzKcPzDLmngk8Zyk64vbA5Abxe
         SP09DBq0BW8fUeclzvTXljdEDQMuoZKvrOii+Ja3uXcue+xXYtHMl65DA+Wm/giZYMjP
         3M1w==
X-Forwarded-Encrypted: i=1; AFNElJ9b2WAsqfdVykb27nEFi4rUYR8e8TQ4/igYcUAXNd48zXko1QskWt9hQ4ZJ4c7B0ScOtzkFo+2bI1uAzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMv4Pk3Z8iBj7x3zzTSNhcz4L9J9O5jFpO77L8G1dtynzg+RXC
	dMzFs6SDhntFeXC+nQKBfj5C59SdTYPG46Avpn1Eg7pLyhf0NE00AwyBpAdFjNbg8gBjQNZ9pJn
	2aYx7MhmCdH7GpJAE3M92G/MYp3B+/y+5NvywS8lAvtPEVggXgmdxJdRfeg3pabalw3xG8TU6MQ
	==
X-Gm-Gg: Acq92OH96u4l7QMIU5yfsmGa3YNpIwS+xxY4fc/AqRjGyvGC8nBa7NDAlAT9LWsdYYZ
	8hLqe5y8FWBZnZvSUyMNL/qCsDyQ4LYNY644CsYD1QU9kGDP/sPYFoDelg2xnL9Uc97QYE+XEqi
	7CcFEe32FlddCrvkPkKeVS1gNSfW6jmHamfYFLkMThKtlV6z3/1w3NChf/CX/3bQiPX1Q9T+sp2
	FyhM2HamPY2ozQl5tkKjb3FDTrDAnN9BzjdOf25lV5vnf8C+zK6Cd+4QF4Y+4eBy5l6AKlNU/DG
	XfqGOkjAba/xeUdW3UompoNti7mCIEp4H9p3hVFEwbCiGVb7wkwhCaNGldjSWHsBW2zWwAHD72x
	FLFZuSaPg3YclXcaVtpa00Ji3lxx4gy8LG6xa2jlLyg7TX3DglBml4Ec=
X-Received: by 2002:a05:622a:4c6:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5162fe69df5mr85994701cf.20.1778749571750;
        Thu, 14 May 2026 02:06:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4c6:b0:50d:91e3:b668 with SMTP id d75a77b69052e-5162fe69df5mr85994301cf.20.1778749571289;
        Thu, 14 May 2026 02:06:11 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm5516099f8f.13.2026.05.14.02.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:06:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM buffers
Date: Thu, 14 May 2026 09:06:07 +0000
Message-ID: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DGCTnoI8TBDxcHpnuyzcIiLd_zsDEoB_
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a059084 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=lkiG6VF1Dg0u3OGlhKAA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: DGCTnoI8TBDxcHpnuyzcIiLd_zsDEoB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MCBTYWx0ZWRfXy7Pp7c7iNVxz
 c0wcNPtaEkdSb0RB2Qbr37g9xYIPrgEKOePuuJYua9R3GzvieNLO8I3sEC0YrWWvX4faKw1qa3+
 5jMONTEV6oWgtXqh+TUaNGWwllw3cmiIVYwBmvVPI3f6SMozH5P+Gr1FAzn7VE9OaL9T3rFfv8i
 zb1ltl+j2jKgorPhEOnUDZeQ2BYc6DQw3K8jk5DyCnP4skBN9l6KNS3al8mFI89MyipwK0AwHMK
 L5lt+lk+Vpp8tXiEmYWytxATCOp0EOYdS6b0aJ0nOwD5nQQfJ187TQV1vNWee+xx3kIwUSzXJbf
 i0OU33vdRIaJ5+CuX82DCcOUjaQc2bhR0wzs5psNAApVGmHIznHwd1Gtlj3zV8ijmApsrO/z7Mq
 /jgVoC4ieRQXnJH5xv1XGA8GR48l2TJ8c5kagEWHD6PZqP1kwtIpjiLQa5ae5sr2WEJv+hcaslK
 +o6nirXWnQjRZmjGCXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140090

Some Old DSP firmware versions use 32-bit address arithmetic and size for
validating the PCM buffer address range. If a buffer is allocated near
the top of the 32-bit address space, arithmetic calculations involving
the end address can overflow and fail checks.

Work around this by increasing the preallocated PCM buffer size by one
page. The DSP is still passed the usable buffer size, excluding the extra
page, which prevents the firmware from seeing an end address that crosses
the 32-bit boundary.

This was not hit before because PCM buffer allocation and DSP-side
mapping happened at different points, and the size mapped on the DSP was
usually nperiods * period_size. Therefore the mapped size was unlikely to
match the full preallocated buffer size exactly, although the issue was
still possible. With early buffer mapping on the DSP, the full
preallocated buffer is mapped during PCM creation, making the failure
reproducible at boot.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Cc: Stable@vger.kernel.org
Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Closes: https://lore.kernel.org/all/7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz/
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index ede19fdea6e9..3a1be41df096 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -497,7 +497,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 {
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_pcm *pcm = rtd->pcm;
-	int size = BUFFER_BYTES_MAX;
+	/*
+	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
+	 * address arithmetic can overflow when the buffer is placed near the
+	 * end of the addressable range.
+	 */
+	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
 	int graph_id, ret;
 	struct snd_pcm_substream *substream;
 
-- 
2.47.3

