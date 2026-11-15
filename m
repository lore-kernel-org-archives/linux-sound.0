Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712865;
	b=dlc7XmGkJMGrAZJrxyG3YXaqerJCF3IcDAkxug9kSVw9vudgU7X/oh5/5vx8GPBTG5s2
	 BhISXtXxQD3GSklyoxc91Qnh1AOeU0rp/XJ0+cdQk4wYENr76sMQGmnlbRA+f+o2YoqAK
	 LSv+6XMzJNeb85r6QBrxDLih3hV3EwQ+L1GNsBErfHbmCc3hJAlQZCkyADB/VkfQd9Vny
	 JTeks5gAEYcBhrLP//5U7tSPw/XjjucJ/ZtGgku+qxEde/n5J16Otey/N/r+XB7fT3Be+
	 VSFtWLL2tDgAzY773NS6JmvCUnQ5dKljLP7rqCXuMuK+BWt6BY7STwQRgAHi1NPYdbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=07srFXNiwuqa3od0r4PhGGeGV/JNplyEKyJ7iLXoLJw=;
	b=BFtS4HgFgrDoehu6kTQSzy4dzgvLpSJuH8KO9dlSMWRGgcFIduZnL4pLxQ9/9rO/x/i7
	 ZOEKoUOyqWKvL/M59+NfKaZLOnQbtEjVb5HSD2Tqm6KeYuwEvcvyUm5TGyGF8Ar2LLu5b
	 HqI0wyEYWljEJ/c7r+rzIMzbwMB5HC32l1bCPemQDDsd2SCjsbZjf1rPbkhcRFbXWS/1t
	 i6BL1dIWXri6USykYiHpxb515F1Ox2BZ2iXK++eQCSYtppxxp1YjH8UxQvbdeO9bDpzsN
	 6cRwVt9JeeQdXDWJ5MO6VoeNA/5Crb2XuUOXnIrvwkFyAx1a5uBAeXJmVhhugV5sN8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jCCnJ5d+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyoZa204;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8AB606A334
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8AB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jCCnJ5d+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NyoZa204
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF0w0aK1358929
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=07srFXNiwuq
	a3od0r4PhGGeGV/JNplyEKyJ7iLXoLJw=; b=jCCnJ5d+lVbJnsPUKi26d0KGfte
	+w4m2BcgbA3pljTnRw3U6qnrrIoyW8xTneR1zBMB/UxDD7Js3vAF1MK0gNbvdGvF
	zY2BxD+yFv8asHfh02EoBkZo5RAuLMZ3jmoZAAdlx8wmuz20RhcL3ffn8J/FSf2P
	NK1mwDXyoqGTyPs7sEVRVbImX7awIde5awQ5ZsakerA7neGH5ll3Pi/usIgfCVdQ
	0QPFgrqvu3IUhKb+ebgdnSIYyZavqb1YyueJOK7I1CNrHT9cjpOJAbzSBYZdpSTh
	n+mJVdBbsNMvweNJNvk7EwOJr5sv0uhEOhQyab6AImOTjt9Xu9O0ssyqu4g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk226un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:21:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so3090258eec.0
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 19:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794712863; x=1795317663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07srFXNiwuqa3od0r4PhGGeGV/JNplyEKyJ7iLXoLJw=;
        b=NyoZa204tHakLiahiW9XoUftNRT2h+DfBhIacV0g2HLiII4TDXmOZ2+YAwGUU3Ciru
         zzdL+ZSD7gQiwKTK53INv/U+hVwF3hN0UhKtG94LA/kD59YPvaUsdroUE2fluMTuc5Ca
         K1tWpkEgxK/r68L7lK2Ibzzgvstu+EVHlOzeIuC5ttQEHs5y9o5Pmw1kHc3vYnPmjQ5k
         XR6LZCqZxC/uBoqutKVba0UItaFjiF3emaFs6Nd/xmZkqWdihlZHjnbHb0CugTryKCW9
         xx+nzrpaHdx1HIUTcVC2LK1LTUh9758C8X3uFBkqMOKpHVBR5lpZbyh+dOzikzBPWHHl
         RscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712863; x=1795317663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=07srFXNiwuqa3od0r4PhGGeGV/JNplyEKyJ7iLXoLJw=;
        b=1n2vbvWJDOeOKk21j1C5uWuj8i2jesf13lR5hjoQEGET7HgiEILyAVDYLFmPCol3bc
         HVge2vH9vNYITCF7SGb/Pi14WtZgLDUzbwZvd+KsOBGuJ5aX14gWQuFRa4JGeaYs7zNB
         OvJ5gps5QIbXEgiLu/sAZlJfmZUYa0cuPUYc1QGQeshws8pgVkuUXEIac8nrBCVe9YOu
         vGU7GEpyLXu3+14x7zX/UiiroAJhGUEIIS7zauK3S8RIRCrGINbrbFHY/1obZQ209Xz0
         MYSXxTt1bQHkyaLoPTff5Nt3AehrRt8KZiZPlHLKy+XR4mr7x3Zx3qndqBFWlqH2A+to
         QTeQ==
X-Forwarded-Encrypted: i=1; AL+hErGI5SiJ0DI6VOPz22xZ7PLculKX9EYtOZtwTn5aekA7DbWqkKGwaOS5MRtcymOmbUXvdIi19XSRgfLJUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9M8kFv+Z48khowj0+lyH/whaN0GKXSZmt/OY7rmkMAFr4dCgyQ
	XuZMAyySEeEbZUJImnRyscPGnMWzj777WTOC1QSnxHaEleKPxfMiGYJy4tXuAABp6z/xKChBjGq
	uL5nP+Ik3KVV5Ko8ZE70uainfdXpgFLcTqBNvr3Pafro//2655e2mNiAVwKSVZa1T0O/dSFTb9i
	/k
X-Gm-Gg: AYBFou1gdMqBVARho9ps4IeJGW7yns5vB5oGt5V0aDGN+SuwTkcrYVulSZzXxhrt9f0
	/GW3CIQ6yP3Cpu/ietVPC9CQIBAP8EJNZB7ksTurmlY00/QeNQ/jSGTDWAH/Wd++9jIMSn3N+p6
	IOUe6EAtHSDTXc4JxzNAmIvM8c1cgu2wyMuxYFjgX3GcICieXv9haBW18tR/ayBTLHbEengpPAY
	1r/UnzGMfj5R9sqzgNG+0nVKQvzFIgBQbAOcZDkqE+idiCayP7N7wsF0E6a+lAo46p/NBRKeyS3
	zPQQhOip1Biuz5FtK8827ywYFEuHZpW2qtnfsTD/7j4knGD5xQ40NvLJh1ViX/HOzMWmuR6vQI/
	d3P4LXOKNhr5wEg1v60rbyKbuAZjVzn9L/5M7Dg4CbpH6bAPD0h47XcqJ4nD9OiGh58knRhYDPS
	oSqy5tHmYyspuu9yJr1O3ijZEBFEU5sFdU
X-Received: by 2002:a05:7022:3a87:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b503055284mr7231673c88.1.1794712862869;
        Sat, 14 Nov 2026 19:21:02 -0800 (PST)
X-Received: by 2002:a05:7022:3a87:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b503055284mr7231637c88.1.1794712862153;
        Sat, 14 Nov 2026 19:21:02 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm21300791c88.14.2026.11.14.19.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:21:01 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] ASoC: qcom: q6apm: Wait for SPF to be ready before registering
Date: Sun, 15 Nov 2026 11:20:25 +0800
Message-ID: <20261115032027.414953-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
References: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IzSVyrIok1hwr_ViGLC-JfQw5K3tT908
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af9251f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jCUHPVBPsCGQFQZixyAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfX4QAUkh9ZdY5/
 qUJUOjWUBjvXHIWvksNjIxhB6xlPAp/fvx37uCwxmJ/4aTExQ4IA0gdhUR+FUitYGo22FJ+ZxmT
 T2evTi0jIHX9u1t0gYMJ3rRfiPqz1unBy0gGw2su4okS8GgBXJSvhv1vv3gJmTDR42O1DM+Pnon
 dW85JCYL+6ElWM+r9y2JmmCt0BaXTGXGpR0WmHQFHU91u4qnH2Qlwnyje6kE8mg8PhcZp1WPtcC
 q7vVx4VFViy/agoD+BawQWqUd+sZK3XAmrhu4NZoU/lbfewNkVY1uRC4ztqiyVJALeW2tqH47rh
 B+p+xvU/PIZ5laM1VDhICFCK5/bM6PJNNkYM6v2rU/Qc2XrWMVdTpTztnBYy7y8qgF7eNIe4AX5
 anwk10zpl4qfvzodqyntp3/hqxTxUM6YdckWLqzAOPm1uBR+B87dkExHiM57df1ztL0fI48RG8I
 Lq20WEXtTkD0Wx2LCpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfXwVidVyMJxNej
 6am80rCn7sheeh+LhUhVlOGgJ1S/tNtIs9BWpwlNMuWcHixGp2XjoaVCA8DbVfYlmvU179ssc/e
 SAUtWYMmOSCZmikahsQSF00VEc/s1tc=
X-Proofpoint-GUID: IzSVyrIok1hwr_ViGLC-JfQw5K3tT908
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150013

apm_probe() sends APM_CMD_GET_SPF_STATE once and ignores the result.
At cold boot this is harmless: module loading and PDR lookup delay the
probe by tens of milliseconds after the DSP is up, so SPF is listening
by the time the command is sent.

After an ADSP restart, everything is already loaded and PDR reports the
audio PD up at once. The GPR service is added about 0.5 ms after the
remoteproc reports the DSP up, and SPF drops a command sent that early
without replying:

  remoteproc remoteproc0: remote processor adsp is now up
  qcom,apr ...: Adding APR/GPR dev: gprsvc:service:2:1
  qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode

Once the q6apm component is registered, a sound card whose other
components are still bound can bind right away, inside apm_probe(), and
issue APM_CMD_SHARED_MEM_MAP_REGIONS before SPF can handle it. The map
times out and the card fails to come up:

  qcom-apm gprsvc:service:2:1: CMD timeout for [100100c] opcode

Poll GET_SPF_STATE before registering the component. Simply retrying
q6apm_get_apm_state() is not enough: it goes through
audioreach_send_cmd_sync(), whose 5 second timeout makes every dropped
command stall the probe, and the card with it, for 5 seconds. Instead,
send the command directly and wait only 100 ms for the reply, for up to
5 seconds in total, which is the worst case of the single command sent
before. A timed out try is retried at once, while a "not ready" reply
or a send failure backs off for 100 ms first. On Nord, SPF answers
within 100-200 ms of the restart. If it still does not answer, warn and
carry on as before rather than failing the probe.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 50 +++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 4cb597d737b1..e7ba6bc93142 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -26,6 +26,8 @@ struct apm_graph_mgmt_cmd {
 } __packed;
 
 #define APM_GRAPH_MGMT_PSIZE(p, n) ALIGN(struct_size(p, sub_graph_id_list, n), 8)
+#define Q6APM_SPF_POLL_MS	100
+#define Q6APM_SPF_READY_MS	5000
 
 static struct q6apm *g_apm;
 
@@ -154,6 +156,47 @@ static int q6apm_get_apm_state(struct q6apm *apm)
 	return apm->state;
 }
 
+/*
+ * Right after the DSP boots, the SPF drops commands without replying. Poll
+ * GET_SPF_STATE with a short timeout per try instead of the 5 s one of
+ * q6apm_send_cmd_sync(), so a dropped command does not stall the probe.
+ */
+static bool q6apm_wait_spf_ready(struct q6apm *apm)
+{
+	unsigned long timeout = jiffies + msecs_to_jiffies(Q6APM_SPF_READY_MS);
+	gpr_device_t *gdev = apm->gdev;
+
+	do {
+		struct gpr_pkt *pkt __free(kfree) =
+			audioreach_alloc_apm_cmd_pkt(0, APM_CMD_GET_SPF_STATE, 0);
+		long rc;
+
+		if (IS_ERR(pkt))
+			return false;
+
+		pkt->hdr.dest_domain = audioreach_gpr_dest_domain(gdev);
+
+		mutex_lock(&apm->lock);
+		apm->result.opcode = 0;
+		apm->state = 0;
+		rc = gpr_send_pkt(gdev, pkt);
+		if (rc >= 0)
+			rc = wait_event_timeout(apm->wait,
+					apm->result.opcode == APM_CMD_RSP_GET_SPF_STATE,
+					msecs_to_jiffies(Q6APM_SPF_POLL_MS));
+		mutex_unlock(&apm->lock);
+
+		if (apm->state)
+			return true;
+
+		/* A timeout has already waited, anything else backs off */
+		if (rc)
+			msleep(Q6APM_SPF_POLL_MS);
+	} while (time_before(jiffies, timeout));
+
+	return false;
+}
+
 bool q6apm_is_adsp_ready(void)
 {
 	if (g_apm)
@@ -906,7 +949,12 @@ static int apm_probe(gpr_device_t *gdev)
 	dev_set_drvdata(dev, apm);
 	g_apm = apm;
 
-	q6apm_get_apm_state(apm);
+	/*
+	 * Once the component is registered a card can bind and send commands
+	 * at once, so wait for the SPF first.
+	 */
+	if (!q6apm_wait_spf_ready(apm))
+		dev_warn(dev, "SPF not ready\n");
 
 	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
-- 
2.43.0

