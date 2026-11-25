Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603123;
	b=Z4vHtwWa20L5LiBxs5eyzThuPUXroxdSwM1XSFJuccCwJqjezTUj9txshUsvXC0Zz8ym
	 GKnLZWh3Ly01p2aTq3iDn++CL2vGx6xwPIicUxzKiNcm/ptBuvLyvq1PVaMLval0KPlSM
	 3VKm/o1qaPhdZ7Yc0Ey5UVNW6+Zso3XlKeT60V9Exg4c8uTP25c2W1HvLZb5/JRJiP9MD
	 m/qktblL18bVe0OihiD/2kUkHy3HOCzvh9JAEWgN3yNajmbPzHV1kwrXHrynm21wX+uwk
	 Uhca/xUeYnklxHg8CxA0hYcPYQILM+Eu1FGMmgIBjwEKyu43vavr6bXQDCrN4/0YNkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eTwWZXXsA8sfWLPJeXEIuB+J1DXSH/HPKwJH7dP5T7s=;
	b=OTvmUM2nnqCplBqmm+CD1QkdBqA9ARHWTSu2jbyzjb9AyGCDECFB/qwnhFPjQT3pPdA3
	 UJYKCsDsxOO9uqo2XRMULZ9VhP4LrIeIvcsTb/qcYFU450pLx+VByTMaDtEfm5a3vPVu8
	 tmVhSW/3f+wDY2ZFa36X42Itt5Y4sWgypYA7lcF4VA7JBTMdlAYJPN/KsCZmq9VEgvwmR
	 r5oXwG3Bmdc8NxhMWm35RQSMG02qbZ/ABiHnbhUKGyYSRo5tL8mVoKwhtAlXPmJ2HpE0H
	 wHdldxEqCYPYnt3mAp2qcezK3JOAdcSCKV5rIUyMHDjiMBsjRaDR4pNbHe2FkxMDNrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7+WBgFl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IFVR+n02;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EFE606A327
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16EFE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7+WBgFl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IFVR+n02
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTZW4034159
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eTwWZXXsA8s
	fWLPJeXEIuB+J1DXSH/HPKwJH7dP5T7s=; b=E7+WBgFl7QqyXoi2GSPSiak9HHG
	JmAJhFoLtsp0nyh0gIAB1TXYJCJWDbMWuAfGKW2bYqveP4tnDVlQx8WwFEee0cSp
	EjA+0xXheel8LQ8WxCnjgs2fPl/1OI8v0KcOj3pSmwwrVDnolFEkp2/E+XCCoYzJ
	VqWfiR4EYEnwPZ7taH+AehCUZJRE6eGESqcvb5och13AQA405TX3NjmiUAKuqAw8
	p99XZCYQOaTOlzy3a6AUGpwEAG0BbVwKtJv5FIj5LAvbZAKDHKF6xrzGW/bO09Q4
	cYcHHhP7YVL+t6aRF9+sppmRzGfyobKFXf0aw7Wa+6Mgu4xY1HmRHxE4eKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjb18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 10:38:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso767943485a.3
        for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 02:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603121; x=1796207921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTwWZXXsA8sfWLPJeXEIuB+J1DXSH/HPKwJH7dP5T7s=;
        b=IFVR+n02FmmVcEfO3yrAy5tRkHtnSKbmPQqwhL2o5/bmJUWe50ZdkHT55lTy4pWd04
         i9sIrnUlSVojG2YCNcDIsMUkb/heeGl5bBDGf76/By4ziTEHGZ6gxK6fCpgHqK8bLjpq
         Jx6mSH3N8U1k84O7oISbW58k9jyR/+qhfo9lebKpauAcqX6V7zfLbnrkyT0JMI/GQ7aG
         ubjs4A2gu41Ht4djGBqXf9P/7r/fQdcyp2vM4F1wQfcFh92az3YjNu6cupkMJ0lX8muA
         jQ5nq047RI4LOJORH3b2h+ydZgVxjpA6iESY+uTrrgyWRpUkzpttsRAnseRDdxyj0O9i
         nxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603121; x=1796207921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eTwWZXXsA8sfWLPJeXEIuB+J1DXSH/HPKwJH7dP5T7s=;
        b=C853LysnQea4eF/kXE7E4dbOB0nDYpxQ2sBy1saDjrNqGZJC/ttILZvh961TzfSjOX
         C0Rr/kQiA9TQDuJm+kcxmKSscMsCXUEYSGy37brJe6PdwC+O7Nj6IPy9Z+NRt1HhJHxT
         C3oHx80NmdLyb5VCsq8VxdHRfaSQTBE7zl79Iylq1zMJ0bVlgccCDqlj5B3WYzoimlh5
         BSaomolB7sSK+MRIAblcA4IiXMP42XKYoJTqYGqP/nlJ4LdW+QS/H1YiHgyLC4XSle/0
         4NJpjhd5vwGvWULTsmAGdvPEKLY/LD0sAVzzEhdDA2YLTiQ0zVTUOKVHLaRks20TYx85
         bUxg==
X-Forwarded-Encrypted: i=1; AL+hErGD5tugOxkh6R0v64v/iZqzrqHJr9627HqZTQyTSX/+KqmEdfCofchYf06sY5vkswNAPZTo//blcWcuig==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cEh8d4kgvjhD+FSPVjtPA8dGUxCn3+tDbcjbxJkWG8Y9snXkm
	cKF4FXAbMH/uBUd7aGHF57uoHIju0cC0m6/7igGJp58IIX+F/rCcRCQzrqLYmtTGYiqb60GCeLG
	6jDbWsDgEm/wxF+gDDtGg7vCPO37cwVJS6PhWCgqh9/83KAkohAki4vs6IBGsqQFJGA==
X-Gm-Gg: AZFdTZeYzHxqgvjnr2tsiZfYXEWRuFxjKGbP/psQcBqnYSv5KeECODUL21he1W0zoUR
	VCDwD1p9+QZNFXMP/QpXCQTvMX5AMSe1xWmP/urZ2MiBwsK9GQA2wzLWAcnORj9kg4dmWMb37Oq
	rDW2+jyJ9dOQe4YEEcHJ8eeGeOmqa0Y0EZeeQAW4PsgBVkWc8Lyl1YzXRpOfMfA2JbOnMS51oS7
	02mQexHXMuXtrt/ToyukHy5InLWupWUouHaTaCsGb8kNDWflAWSmVg0GRYrMeYC/D4TZ/Bnpkyn
	vzwwuK50CfXhSJlnhSnsL3pUJSAvBNnmb27+75cqTBOI4jbk340tzOI43x9dy/x6vKJLPy0WR48
	BwacvjuVm85wj9/zxXaqUp7pt59fGMCvkoW8+lGRMZNtwZqABbjLVKiFcrhETsmeM
X-Received: by 2002:a05:620a:4454:b0:93f:18ba:bf78 with SMTP id af79cd13be357-949bab1bf42mr3200296585a.69.1795603121353;
        Wed, 25 Nov 2026 02:38:41 -0800 (PST)
X-Received: by 2002:a05:620a:4454:b0:93f:18ba:bf78 with SMTP id af79cd13be357-949bab1bf42mr3200293085a.69.1795603120866;
        Wed, 25 Nov 2026 02:38:40 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:39 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] soundwire: qcom: fan out broadcasts on multi-master primary
Date: Wed, 25 Nov 2026 10:38:24 +0000
Message-ID: <20261125103825.936939-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX6G/mxvSsaiQV
 vtfWOE33/ZOmHK5aI6vV8GdGc/kXKVd/vOxWH0aVWgRq/wMv4fKhMGSW0r3bxI6+R2uzrer4WCh
 OZxo40WcwrTKy7zzLfU8i7eVkHe9QwM=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06bab2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=C5vFQG-OgLC0A6jr8SIA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX9+DLvDvDTf3L
 qWYiqMXK6tLV7MlSU2U6lLSGhgEQz2MDor90OLaeZR3Q79/usnXp0WtrEvmeIB0mLQ6eG+r1C1T
 ZJWR9mVwucytX67bpAuRDIK3dPXNYYMrOkxINLgSPTPfCaD1Ta/1RNhOtoBNQjDxQGlL5Mus6wT
 xuK5n6t8eo7xGdqYZMjpPwwHQ7HPKC725yfcm768ScZD+lQhI68fRgIvRKire2oGkz0Tdy7j7/+
 vPnD93kRK1pxVR/NMLtZ2gTEOkPWMNnNSSZO3DdZT0V0CA5fkaJVF9+x4y92b7367lgC3hQo8Hn
 a4LQnf2LykiPW73y/o27zBJU8/cULe99LKJNNS39ANgJU3h355jFXh12UJ/qT84uFTM8+EGgSkt
 InMykn1aNhMpFSiBFlnGQ7GSN6PaIy6CS5fUhzjgIE1AU5GSjCDjFtrSpYK3M/GLvvARUAO2jtd
 RWKj3G1stTloGenD7ig==
X-Proofpoint-ORIG-GUID: WcRZpAfjlTI99UVszypB-mtyZz72fAw0
X-Proofpoint-GUID: WcRZpAfjlTI99UVszypB-mtyZz72fAw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

The primary's HW does not signal SPECIAL_CMD_ID_FINISHED for
broadcasts on the shared frame. Any SCP_FrameCtrl update sent that
way is lost, and following unicast reads to the slave time out.

Fan broadcasts out to per-slave unicasts on the primary. This is
spec-equivalent to a SoundWire broadcast (which writes every attached
slave) and avoids the broken path.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b29e2aec4ae3..e0392f3cda34 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1102,6 +1102,34 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	int ret, i, len;
 
+	/*
+	 * HW never asserts SPECIAL_CMD_ID_FINISHED for broadcasts here;
+	 * fan out to a unicast per enumerated slave.
+	 */
+	if (ctrl->mm_role == QCOM_SWRM_MM_PRIMARY && msg->dev_num == SDW_BROADCAST_DEV_NUM &&
+	    (msg->addr == SDW_SCP_FRAMECTRL_B0 ||
+	     msg->addr == SDW_SCP_FRAMECTRL_B1)) {
+		struct sdw_slave *slave;
+		enum sdw_command_response resp;
+		u16 orig_dev_num = msg->dev_num;
+
+		list_for_each_entry(slave, &bus->slaves, node) {
+			if (slave->dev_num == SDW_ENUM_DEV_NUM ||
+			    slave->dev_num >= SDW_BROADCAST_DEV_NUM)
+				continue;
+
+			msg->dev_num = slave->dev_num;
+			resp = qcom_swrm_xfer_msg(bus, msg);
+			if (resp != SDW_CMD_OK) {
+				msg->dev_num = orig_dev_num;
+				return resp;
+			}
+		}
+
+		msg->dev_num = orig_dev_num;
+		return SDW_CMD_OK;
+	}
+
 	if (msg->page) {
 		if (ctrl->page1_cache[msg->dev_num] != msg->addr_page1) {
 			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page1,
-- 
2.53.0

