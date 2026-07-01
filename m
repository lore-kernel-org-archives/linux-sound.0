Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E23B813E
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934228; cv=none; b=H/Xz0ye1xWkFLJsaBqPisDxZEOOA8gW6HTM6hi7hhP+oiliO7pKqiJMPlC/ygfhLQhPjraVzjW0cYCgo2Pot6yumGW285ayLAZ+XhVriu8qEwm/qs5AagI94O4wXItMjwhVsqAVJjN2u3jZ8kN7CLQJs4JmjamKX2iwnErUbKSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934228; c=relaxed/simple;
	bh=H1tWqWH7f7OQkZEAmqyHzljV+KmSOWJG4Cq1nkdT3/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPOU0QpTwihLhMCCnmnYE2NN9qdYm7Kf0HtblNEVHcD3KSvE5q8Ea7PRB0uyWQbGmbBDBwmdWzVgraDDcnw0VIHM1X5Hq0pg7UxxdGg7/DGr12uGc3QBPMvlzDoRKxt9dN+9eLgnfn1cFyPZd2IBzt7rJJY1BCupxDVfU492Jns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0n4zwP/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heHfJ8BR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0n4zwP/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heHfJ8BR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmWh61712802
	for <linux-sound@vger.kernel.org>; Wed, 1 Jul 2026 19:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rdkpfR+9Aob
	jzCSwvABnZN2AM7OvMcx6SeOAFBF+rQ0=; b=Y0n4zwP/8mL5g3Z43mdK1TWv07I
	AGwpMbtrnJGb0LuEY2T42shD3uofnYLez/IJoKFjxRk7g2cp70Cy3J5OTnp76aEa
	jFizmIM016M/So3nEBKlP1kyDXME6WPnas37EK29ZivTlWhY0p80+NsxmtH6B/n2
	jA9uvDq5b5PHafEO1tQkY6B9d2tQ53tkpMnssBoJGEBdmO5AoSNBP4zNTeLN78Ka
	rCbp3Gjadkx3VObCrrWxrDqHPqGFBD7nwT9op67/1aBbE9pbBHwZbnG1vWh+2yL/
	lPSGDHTUUZuK/gD6znpj9m/InEeX+HpbT+h5XiXDiVE9P5A1Nv5KbdQgK9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd2btb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 19:30:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5939so135754985a.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 12:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782934224; x=1783539024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdkpfR+9AobjzCSwvABnZN2AM7OvMcx6SeOAFBF+rQ0=;
        b=heHfJ8BRB5T2KqZ8IDDkcT3W0NHGgcoueuSVRE5kweBvACA/X+4IH0eVpZ5itibw/x
         TLkU8ctW2piHuEx5K/a2H1f9nzUThwbEwZkz3MtfEzTazHPNFnhxRcXjf625Axnw1R/U
         sLrKq6HOqeNw2RkcHjQBfAjTQxNaO8yZu4PNJDYfTX6zRF7FGPAvLl9/1JW2SkYxb8HH
         fI//uOVr6BFfHvSCvd3wmXgg6+QUGeA2JoWXviE5Cscvi1dOwrLuMT/7ThAvwXx/JRNL
         fJ00LJC1rpmidq2QdWUPTcQx8tzadXPY8mHFPamJX/KKpPb+kaeRDx41rUfysnNU0jna
         qQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934224; x=1783539024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rdkpfR+9AobjzCSwvABnZN2AM7OvMcx6SeOAFBF+rQ0=;
        b=YYvNFgBa4dM1glOnoPK2L+Jwv4viZRGmyy101aNBxeDnZfja6nFBDev/eViwtxDymI
         7Hnd0NpUb7YXNEHOGQjIw+/CZpMm1Brmi5z6fnAhxbhWN/9O8bSq4yjhn0g13/nGbvpV
         6+Ze3SP/vtZwl9n+CoXYkp7ld72AsdLzKyZegS6Cpsz6Ac7gIa5vPlsJPqp2bffUXCCW
         6lzo6gF6wWor8WBnQqg8V/uLOE7HZZKbSvCNso+RQ8LKKK1YQ3cykuSoXdVKX5xKzIgT
         mLJ1SHXMd0wNIxbDteGX3ngblqlM2pSSU9wMKASj3MCZKTH2s4WGMVx4Q8Bu8SBEQOI+
         tmbw==
X-Forwarded-Encrypted: i=1; AFNElJ/gewMVzKburw84kObsEmaiNTnbZlz7aflLpLVgl+WXkMc4YoTLadcPlgxlisFlyKYKpNIoyDY+Pjjqlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpn4+oBnhzVdntBpREGN0NmmwDY5OZIom7RsOHDe5u02HV3Ebb
	GpnslFWA+wjCvyBkBwZ3dPc5YD/OnNlyhl8V7kVJqCl/OaXBL/xYQqYo32gc/kmvJmlOZDUhlIq
	+5oTl/Jf9Fmgl/RIWMie/bhwHnivnKMe8VjHQNzRuPRy0iVNxE5aqPx/0A6azTkkWOQ==
X-Gm-Gg: AfdE7cnLg7nGePPZAGojZQQ/mSB/8KhLqIITrvZ9yedD2/8XJJLYJsWX/padhNH+b1l
	YKVUZX9GsvCMGsZz3qEKPI+V6ZhHEhDwNyuNDjW24yVLMuylUhaqOiwCrxKkIQdTMbzZma95TcS
	C2PpcKGRnfF8fnQrn66re0eqtdbuzu/V0mNapaWPCiHzgPIVv1Lw71eO3eu3KBqkle7yK3I20rD
	aXHcdn5hBe7dBLKlCgNZGrdzbnomtTo/kyPGhPHkdmLHLmp2XMTZ4tlr+vyKMlD1waiqf99V9cs
	atuNc/okfsH3eJCZMQ+gFmtHa9dnVoD/7hmRfqjLnUwUfa7y4sw8rFVnV8Cy6dm6dw9wlGHnfAX
	1NWIIZofzk1y+QjhOEOCupmLf
X-Received: by 2002:a05:620a:29d0:b0:92e:7181:efef with SMTP id af79cd13be357-92e7852bcf5mr437634985a.67.1782934224196;
        Wed, 01 Jul 2026 12:30:24 -0700 (PDT)
X-Received: by 2002:a05:620a:29d0:b0:92e:7181:efef with SMTP id af79cd13be357-92e7852bcf5mr437610785a.67.1782934222276;
        Wed, 01 Jul 2026 12:30:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef11338sm78261885e9.1.2026.07.01.12.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:30:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: vkoul@kernel.org
Cc: srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        sashiko-bot <sashiko-bot@kernel.org>
Subject: [PATCH 2/2] soundwire: qcom: Allocate sruntime array dynamically
Date: Wed,  1 Jul 2026 20:30:06 +0100
Message-ID: <20260701193006.4113-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260701193006.4113-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a456ad1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UtTtXjrgFGKwB5H3BscA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gU8Db_pQjBRDouzOur3IeGat44It6XXQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfX+iuSVYEZO3zI
 lLO8VIH+D1uu9XRMCHHNSD+ASfc15OLbi7mo+Wr8jmv4H/K0Pq8PBm6MlYML7LNIFiHfyyUSt6N
 e+aBDDH4PZQ4Y3G830G/KgjDGAC9Ln0=
X-Proofpoint-GUID: gU8Db_pQjBRDouzOur3IeGat44It6XXQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwOCBTYWx0ZWRfXwVtSB6+qIilP
 5NhjOAZn/lO928g8qX/9H9MRUlI9QYOxz7p+I4lFBH+ewcvUIe2/RpQY3Fo7jdw7o8Hr05Y5Vk7
 fsBxFFvnXPUdVme4Ojly2TUrppIukk9st0yuADK3bzmWU/Du6zoGDueADyb9fcPbyICrVgSWQi2
 K+iePLIHPe0fTKHCL1yOpDKHAF7cyDhLGWCB4Qalyhz00PiuplTVDLL6Yi8ZNXC+iItozbRLZW7
 MPUnjuXmr4NhzmSA3xX2hZ5yB4S53z3Vkz+9J3pVIWi47RxRX3uO0UmvmYepazsW/ip4IwBoghU
 oOwz+e9lboYUKLYjBXl/ntLYEVc9oXK5idWGVKqbnan5X0ZFLk/e4mVPsuHFrkNwJO7m4ZwNcl+
 7VArh73SLUVHUmVPzQUdpWHRAL+6nPs+Dp/CX/1l2h0OD8nyFWcOCXVSRE8RZMcQL7U0w6KVO1C
 f9fxGs9VnXBQ9InTxjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010208

Instead of sizing sruntime[] with a hardcoded SWRM_MAX_DAIS constant,
allocate it at probe time once the actual port count is known from
hardware.  This removes the need to keep the constant in sync with
dt-binding limits and naturally supports any future port count increase.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Assisted-by: Claude Sonnet 4.6
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b288218f64b4..603f228f46b5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -134,7 +134,6 @@
 #define TIMEOUT_MS						100
 #define QCOM_SWRM_MAX_RD_LEN					0x1
 #define DEFAULT_CLK_FREQ					9600000
-#define SWRM_MAX_DAIS						0xF
 #define SWR_INVALID_PARAM					0xFF
 #define SWR_HSTOP_MAX_VAL					0xF
 #define SWR_HSTART_MIN_VAL					0x0
@@ -215,7 +214,7 @@ struct qcom_swrm_ctrl {
 	u8 wcmd_id;
 	/* Port numbers are 1 - 14 */
 	struct qcom_swrm_port_config *pconfig;
-	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
+	struct sdw_stream_runtime **sruntime;
 	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
 	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
@@ -1384,6 +1383,10 @@ static int qcom_swrm_register_dais(struct qcom_swrm_ctrl *ctrl)
 	struct device *dev = ctrl->dev;
 	int i;
 
+	ctrl->sruntime = devm_kcalloc(dev, num_dais, sizeof(*ctrl->sruntime), GFP_KERNEL);
+	if (!ctrl->sruntime)
+		return -ENOMEM;
+
 	/* PDM dais are only tested for now */
 	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
 	if (!dais)
-- 
2.53.0

