Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79E034BA3C
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 02:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759804431; cv=none; b=oE+pSm0J0kNa+nEDgU3iOgUwuE57rs6yRQEjbLDtMgu1D1ZOM4ryzPIugXbUUcOG/+duA6Ijc0f/3i64LhEj6rCOhTqvGjLC2O8HqKnQ1+i4bdhWWsKlZwZHcuwSc2Sbo4qaeJlDhpoDaeaYDqzyVsVCFqQnihsfXWk4B2IJXco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759804431; c=relaxed/simple;
	bh=Dlcnn7y3HlTxqYtAbXosZmFmnaZZi+s6TuVywlg5AaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LQbisYtNLTSHg5WHJfBvRP8N3D6A0rLyJm5ChEZwrxneA5YqV3sEZgvnsjFmme90+fkWnhh3/ATVGIm24zjQ8CMGx+Io1DnUmxBkE6zwZ2g0BeGSpjRSHk5OuZQkkxAfEZRsPL7wxVY/SJMwW9e4qBnzCBfS5Mob7wbW2244xyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bcd63eLL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bcd63eLL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FVEXo002205
	for <linux-sound@vger.kernel.org>; Tue, 7 Oct 2025 02:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7XSY4z7nlmBoPCLNtNQ+8rowUkAIu3i0gAH
	G6gd+0F4=; b=Bcd63eLLddyDJ6CXgrewHmny6+WzK8fp1RTQ/Aeio+5ycL19ssl
	GQEwaFgE9GXFYQfpfkd4E7a1N9+ncetEynzvVfMM2Y1rS+nrIqKvycmsnfdWqAsv
	wosf7clUQAVKyjUgHHkPQ0e4AGU//v6AfBr90z5m3DC5tVt31nh38WFHEsiF1owB
	+nzcykzvi148ojVoJLYJASL+HkT/z0oopKMvf+fyFteuSSXfRSmJZZ8khrRVMqBL
	tzGx3BAzTvQ5H1mu1CaqrTBLEjyH/ItrEybhNkeJRHp6rq38+pqNmy/ARBbZWSNm
	mkpJd886vbRDEcVHf5PdEAp0oocBXneNiww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1nqx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 02:33:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-277f0ea6ee6so72368305ad.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 19:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759804427; x=1760409227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XSY4z7nlmBoPCLNtNQ+8rowUkAIu3i0gAHG6gd+0F4=;
        b=CqnjptpjWY5otK1bPJM7FQbjenX+wPj1yD7HDwEXNsFk8xgDD6eCpSZ/WhBUsUKt/e
         OMcG8KzUzA5hTR1b5mzdgjGD1BvJ9uxDNKkA8DGbib6MUh4NKNa6HhK0CHVDuE3N/zQH
         VT9CrgBfg9uOtVUP6udGt9kO274DRXA/EO5ACsrgHrR0zgzZCjXwW4UOUfnxZ3dl0pSV
         zTS0zybu6loSCitZgqoT4f8sltEnyrayhFrM2u8bLdvvYgQlMT3AOp0qgKq84PCcjPYs
         c8EX4UUpolzz/UwMpg1y/+cL3sEhvDklnICD7f+RqCLBkIZIl27b1uIXCKKSsJ5nUBzm
         6bag==
X-Gm-Message-State: AOJu0YwT15S7Po4zC7o/1V5gj5Rz0DlDLyH3hgik6wy12lFql5zWEYJw
	qQUuy+xhMr+D1FvAiXYmjZqOwfytbru9jfsTK4BvfnZAj66nf5bBRHyWw839OmbP8ZEyYDUz6dA
	Gyzbgio8/VOLVoCRzkkRpXG4TsGmsK2vU5HvJlpvks5+MhtcaMMVU0ulxFRkgjtXjtQ==
X-Gm-Gg: ASbGncu1m2RzfPJqCmU04Qm1bZSahIDqiNNDKZAKhiWt3Ks25d0RaUNGoJ2obRecDR/
	WZJNstomnaYNeAvgt6a8wn58NLhNvRX0K2N/E7pc7P2erXcFDrgvbvTErq5JKMAAk+su4H7+TDM
	70nf/mwCF54OUhf1pQ0UKKn8MZJgPjKnQ6YX9atVqpx93txJ8RT0bQYI+jofPd7QZ7n69UNYsNK
	pVliuYjMu0tQ7S6tbREFWmJZDvOUqBkSK5JKSJ7iqvYpLqQ2zPt2s/1SqwmWwc6l2vMO/wAXCh7
	1F2xDu7VnQqSJaxNxQR8FduQGCSVTJDnZ91p4qWIluk5UeSqPWpQsYSM5igr3eeHrJ2aOJ0tUd5
	bHOuKtQ==
X-Received: by 2002:a17:903:3504:b0:24a:fab6:d15a with SMTP id d9443c01a7336-28e9a5665f8mr169858305ad.20.1759804426908;
        Mon, 06 Oct 2025 19:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiig/p1KQze92yCEITwhtnQai6O3T2aDxdUHjAMcQsNgWMdH7TrKomEar5i3ANE9//H9BSuw==
X-Received: by 2002:a17:903:3504:b0:24a:fab6:d15a with SMTP id d9443c01a7336-28e9a5665f8mr169857945ad.20.1759804426362;
        Mon, 06 Oct 2025 19:33:46 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1ba25asm147726755ad.87.2025.10.06.19.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:33:46 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH v1] ASoC: soc-pcm: Fix mute and unmute control for non-dynamic DAI links
Date: Tue,  7 Oct 2025 08:03:25 +0530
Message-Id: <20251007023325.853640-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BH-hC1EzhXi5wLuBnGTVzJjqenP1ybcL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX6vOku6j9Atuq
 n3ih+YvLCGMOYGFozrHkU7QSAWlO21cGEhZvKkjn0pY1ORDqYf/CnPPBuvoTxKtgwpAYkJ4ApUp
 CmzkYCXYl5jSN4nwhUg9bGeaeENPcw5oYfiKBYeMuytZAKXyatqNMDNpimNk8JR6eOKIYKCoXHW
 kklUREuwIK9ynXLAq0OcNG1a63+AoDZHLJxZFShfqeNj4zgntMdL/Tf0ajIWb6Gt+Ev8mWDPs/H
 uB951GAhaReg/l+Ess/n9Bvm6ZC+4yM7KSZ8/yPEbdoiVVRdaPRnecbuyPrumQFtOsnH7Q8ve/v
 98fy0Tn1N+Wr/If7lzWQ5znTmjOpqu0FbjXXZTBeOGWp+AFPssWS9MLHGV3PLtZoi4u+s5ep5gS
 d95zSZXZ5zvmOhG1af3Ofyyc30XdPg==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e47c0b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3uxOjINHiGvl1vUfC3YA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: BH-hC1EzhXi5wLuBnGTVzJjqenP1ybcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

In setups where the same codec DAI is reused across multiple DAI
links, mute controls via `snd_soc_dai_digital_mute()` is skipped for
non-dynamic links. The trigger operations are not invoked when
`dai_link->dynamic == 0`, and mute controls is currently conditioned
only on `snd_soc_dai_mute_is_ctrled_at_trigger()`. This patch ensures
that mute and unmute is applied explicitly for non-dynamic links.

Fixes: f0220575e65a ("ASoC: soc-dai: add flag to mute and unmute stream during trigger")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/soc-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2c21fd528afd..4ed829b49bc2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -949,7 +949,7 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 			SND_SOC_DAPM_STREAM_START);
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
+		if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai) || !rtd->dai_link->dynamic)
 			snd_soc_dai_digital_mute(dai, 0, substream->stream);
 	}
 
@@ -1007,7 +1007,7 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 			soc_pcm_set_dai_params(dai, NULL);
 
 		if (snd_soc_dai_stream_active(dai, substream->stream) == 1) {
-			if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
+			if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai) || !rtd->dai_link->dynamic)
 				snd_soc_dai_digital_mute(dai, 1, substream->stream);
 		}
 	}
-- 
2.34.1

