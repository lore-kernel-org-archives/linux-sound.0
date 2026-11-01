Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555661;
	b=3x+x3QfCyqgGhr64QQ5OKe2R26wb8MX9fRA6704SXMxGaJybIn0k8crA8FS913/vXBfb
	 p9iiHcgyguy9fe1E3XHoH8MFyGWX60rSqt//RLdl+9OaZGznjW2tv3bHg15fNgeY18qfs
	 jsSQo1dGUKiWqk4rgYwUmPpXh0XS/lNXeUCRvmJrZkh/hrFdkN4dgK/QjjTZ/rpRq8C0d
	 k6Rxf1KfIpVCcpioUEz5JQMiKC4qwEys++wJ/zlveRRBEqSe28Fd5EA1XIrmcwl1wvSHl
	 7pT4L42vFWbydXFNu6aWyrMFKZBTty3wtxKnMugwIimbwvPGMiqx5QWvcByjMyNKsXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kdtmiZdTU1nXwsamLd7Szc08WcYoKl4Y081kH3kHkjY=;
	b=iqOxe+XiHTEA2hXIO9lwS1LRcuXIeg+O+QPmpFFDztfBp8mRL7GKq6wqYoGz7kgRdSz+
	 imb8X5WkFW6Bhe1abuE4oxH/xBHiKLD9BWXfnLRDV7a3rnhq30E4vZ1znSqCSFROKoudw
	 k+gzHYFpHpzn37OJZtzPdpSA3XArwrEoD2dGEHylb3sgODJFU+B1xuRxhVm++WjOWnRp6
	 B/URfshrwh1FWF9tQMmFZ6yL56XH+QemjNxWcyzEMHH9qgwikeaRE/KAfndbQsT+4ZuqW
	 s4FO0Vn1JzNiTvIriq/gSmb+EHfyiPco82Kk4vu1ddrL7Rh940uaithGYsZJuHoh9nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOMHyELc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi5g6u0w;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E303A606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 17:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E303A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOMHyELc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oi5g6u0w
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQ5sZ2043802
	for <linux-sound@vger.kernel.org>; Sun, 1 Nov 2026 17:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kdtmiZdTU1nXwsamLd7Szc08WcYoKl4Y081
	kH3kHkjY=; b=jOMHyELc7YKJrU2lbiIdQ8ccYv1sGKinrcX6pRVIoGtPQxOKdTb
	ajo2yPCyEsZ6A39YuRUua/PyVE1HSgsTC+msvcgMy6cilaXVrQMAVFoB9Bk+eF1k
	eq92zAc7d4/T/AJwx+pbwM40qKvHg0DzS/fjR5obDCft5fs9t7Q320FLeRKME+CB
	pxBlv6MlKSPQklbPtBmxwan+oZDWymKUN7AByfw/mCz5YfZ4CjlUHmjjsaXSsaHx
	mQcmFHGUbGPYlwAca078PwlIxnNtq4zcw5T9ITL55M32VRMAOqp3WlpmeTkG9m0a
	Ou7DmlNQPHyEM/8lpx0wf1wUpL9nMZfj5FQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxkw4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 17:54:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so463907885a.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 09:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555659; x=1794160459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdtmiZdTU1nXwsamLd7Szc08WcYoKl4Y081kH3kHkjY=;
        b=Oi5g6u0wMuPbL5mLRDY7c74PZ8cLNzU2KBdkGN57JzUWNpr5q7ikxRd7tpPCIV7q24
         VB1P6kBGuIQP1SE3diaQUEZvaIeicGP0vUjVguutSKgQ651+f7rGp9nLAf1lK6AcZOJS
         dkA06vCtZbfAxhxGcs3Bq20XrUdc3q4DLNDMuS5C+tL6ZNxUyX8BthbTxTG/tbVy5+WC
         DUzCorprBAY2IiTvizikDHHmI/5BRhAVgmEgkuXayJtW5KBynXa4DpA6K7fdO+u2IhJz
         zqU15DEKkp/i97YyZsPW02HVRqfvzRRQkLrAEt2PGL8hE1iQTUcpNHSEnSkrXcV9go0K
         JGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555659; x=1794160459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdtmiZdTU1nXwsamLd7Szc08WcYoKl4Y081kH3kHkjY=;
        b=eblgCDWWHsUQCQrg6OQCD+ltxCbTp/eFpEEYOOpRJ0KSgG1UyKoRR9NfJwldlBCR0g
         oE/DihQR8ljJABXo1fcnfCofxWS0UMKVqMq+iamEX+gJLyxXmdzwCVJbmeLOLBLqrq18
         hQI79qkCyBdTbdOxe2YEWfRBMkxNJZ5fpJz9nBdGuM1X6DoS5cnJxHsiWouSw1dV6kHp
         Pl1sjMLlEFY9Qo6bNcFZVZ40D89Ktw6mIGQIDWWtjE9Mj9zeDfN/VsvGu1tFco0GSS9a
         D7ia0g1EPCKR9PANvJsXpwzOtfnbEmU7dZ4TKyvtpAsE3t8z6U3QoU4oQB4MVbVGVZ7n
         +qTw==
X-Forwarded-Encrypted: i=1; AKwUvByWAqtRkmQK2ELU/00kpMuTEWtiEb7wNj0K1TW1qvp99ZezFkKujOVUm5BOg3492oF+injAWWBIne2Phw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIxov0wjgV2bcQ4sOhimtCqxjrg9KtSwIH2zjlu8ej+6/imDd+D
	fpVjeBeriiHOTeidrbOdLw79IViHrPfXrRhKqdqdWY6cwIc5oEpJvOgAntavAQavOrMFxFvgkce
	uNFqlJxGMRlViw4iVyZwLpqiSf0GYxWdfRpwoKo6x6fSCuSF58B1g8+o2r7BVaWX1rg==
X-Gm-Gg: AYBFou3FeekKygR+JOLxAzV8FzzM0fLWZg1NK9svDJUvW9oyxjEz2+iO7zaFfb/HjQ1
	kCMmMKTSOduT3Puq6u+qO6ONrhRkNWHQYoqiZiy6r5AoYmCqrXsh9GhZ2OqT4JqJ1LQ+Wdm+OKi
	hczTBgv/DAtw31BAbWH4szltWyW/VqOHFub/my2//r1YXE2IDJh6HIIdKB0ZcTELscJzxz4Pmpo
	NXhcXu9vBnpFgQw/0daK3OLPoWMsRtVjI9+GXuhsiL3HSjVB0sCQFBWFG+BhdkpVyTdEIDp3LZw
	XETs/cWiKCuCURQE6ycqdnQKT4L3evoiP6Vk8XcvI52hZT/gInG/tsNfd+dNeZznodCT7fDam6E
	jOXJmgpN6Oj8dxunfpj/Y/2ZtlunJ8peAca6J7JAStXa3AT/Dn4B61t+ewquZaw==
X-Received: by 2002:a05:620a:6848:b0:939:ff85:8067 with SMTP id af79cd13be357-94421663f42mr1273097585a.30.1793555659026;
        Sun, 01 Nov 2026 09:54:19 -0800 (PST)
X-Received: by 2002:a05:620a:6848:b0:939:ff85:8067 with SMTP id af79cd13be357-94421663f42mr1273094685a.30.1793555658425;
        Sun, 01 Nov 2026 09:54:18 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm325714735e9.5.2026.11.01.09.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:54:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Mark Brown <broonie@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] soc: qcom: apr: Reject packets with header size larger than packet size
Date: Sun,  1 Nov 2026 18:54:08 +0100
Message-ID: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=4MmiwbTe67Vae9D7Lm+Zj++XqRihN9uwcpy1QVEzwR8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq53y/r7BuYv9eK3+a8QHoZBIisHOoqo5rhSCYT
 x83EJSNlliJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaud8vwAKCRDBN2bmhouD
 1y9cEACPaj9qjm4Xgq2YAlnapjZ58AL8Ampb8QNuC8Q2em4csesDfI7RlNvwHxZkbCKKftlHP8q
 R1l8jH6moeUbMfPMFoqbtgedazQfS1q+MVgIIzgI4yRkwf/gRPK3dOEGs74dGL2/VRIqriImqm6
 ZRft9ZDOmNscRv8oSlf0cSusfzJhaY76AsT5XfhvdVxv9HHTCCwHmlQ1jqd+CJxdcXjpjdbuJ3/
 f9da1/Wqa/x77gsXo70d/5DMqX/MFjIa/zcNOS9cz06dUAXqd5P+/Xj+ccr0R9o4vzaaIeXZuo1
 +h1xXwIWbePSbuobLX9bs4kFqAXeMiXV//+c39eMpZaKEcwP/i/xo5/zX66AyvKrEoK+t9WzqV6
 lQ2NSAs6ckCdKUAO06lNAcmmk0wo5p5smBNYyoxqTA4a3HdYp0KMucFEseiIpjj4SKRbXSlO6r6
 M2CVnkiKM3i1IAS5NJ8hwuJiJ1mPhHMJXWZ8qyLyUbu6FsvjcdPtyBnazeo4FnZMBO20aGvjTOA
 8g+IkgWoTb8gHMAux6fT5SReiBGW1txvpPx1afafp6sbvTrp2Bl+VXzGl2YoiR68CnRo03I0sww
 wckAJZ/8dfTPRSGKulNus45bOrJElgXwaAZew84f6a4qsfFQTdzSCDETRQaUX3+pG1IT+Tqa7xM u1hWjU49i/JprBA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FWGCIwM9BJH5oDDbWaTKAC7FwRokwqoa
X-Proofpoint-ORIG-GUID: FWGCIwM9BJH5oDDbWaTKAC7FwRokwqoa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MSBTYWx0ZWRfX8ZRvPZnPje2/
 AZsi4tFoEVK1Csv69Ou8a0DXNxXn8mZTXzuD6Wp7TSyQ6Z/dcgU1axWVSGzsSAhubX02aIZhOB8
 ewBy+6UEUSaBtxosc4xmTRdRpii8VVw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MSBTYWx0ZWRfXzU+TCl1Mw0i1
 Gz7NJQL97655G6aWfkbpOefrcVwbS2RPhiNdOFSsLr9SmEKFDzAwqSVLLx+bpcv7nBb856Ykx6v
 ybtMCvFQx9UyzXMdHiDczfLa/FfpDhg7s2bCUA3ZdL1ieotmD+5Pgz/RtjCOkDSZN6P15RQbTfK
 m1lADgv1rtWobmJR7spdkb9L87jgVe43XO9jxyMkWMihBsuIzWuECHUeUtP9PZhmE0BrRY3t57w
 PgU+9Ru3mO34LAQ74Spb75pnJKUZ4+w2Cq8z05t0K21PLibOzsgnfuq+PU7GItRrxvwiSfzJTp5
 /S+I51za5btKnZDzeK4SvLSbykjV0uo89246YREPqFAF50BjgUaMZeWHZ2latOA+5HBTsHV8Gjh
 CDUczr4TWk07FrCtP5EuHLgMSOaS0qt5g/qsgerjZBI/HNgb5NBq8rQjlmCDUwEyOc3QJFKApg6
 6c0M0VKy/0bqN1JTmuw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae77ccb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DVh7n887_SxPlczGqH4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010071

apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
and the packet size separately, but never check that the header fits
within the packet.  Both sizes are u16, so with a malformed packet where
the header size exceeds the packet size, the subtraction computing
resp.payload_size gets promoted to int and becomes negative.

Further check "resp.payload_size > 0" would fail, leading to
resp.payload left uninitialized (stack value).  Reject such packets as
having a wrong packet size, although unlikely that firmware would
produce such packets.

Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soc/qcom/apr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 2d5645ff9919..6f29b57aaecc 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -210,7 +210,8 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size < hdr_size) {
 		dev_err(apr->dev, "APR: Wrong packet size\n");
 		return -EINVAL;
 	}
@@ -280,7 +281,8 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size < hdr_size * 4) {
 		dev_err(gpr->dev, "GPR: Wrong packet size\n");
 		return -EINVAL;
 	}
-- 
2.53.0

