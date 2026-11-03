Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717814;
	b=UiGcwh6LTlNJuKXDBwvreksyJqwbqvBl0MPoHJ4taWp5j3rcKTCyppoEYDoFOUx8K1+m
	 SWvtkYDoLm/y3uTTB0r5vHf/e1vm5RvRVi2JYGg0DAxiKceheTTrFFGLvX6NZHmHuGGlV
	 MG+MtTsjeuG8WBuPJylIt+8LPq9QWUKAHAYb1qknT9v45D2uos7whlBdt7aUtf6DqTQ7C
	 lLOR+wcvkKWugLBB9f/6fm7++U4JRIzoYTu3bCnOVTOkyacpbgB92uGH/pt83w9TsNgiu
	 keGSWo/ImSO+lNpju9qrueUIRMYC++a7flelTzVzqzL3OplbtHFq7cDtEcIMeehiIyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lnK9cNxarT5IGLjO8Msq2uGG6ZCud5JN62cvdJDIdoo=;
	b=C2kh2XtoHxuGt4WehgrAyV3izGotqezQOm+3VKdPJ9s17xfZMpnPRtqdWeTFNpLCl030
	 D3zb6fcjkJ9+ByYnInvRyhnFABK+kJrUvueDOA0pTNpOOdjyvgxzLpxFIXg2tRhtzacWz
	 jhYKqF782D1BgsUyBb9RsnBnyRoHWVKX9ebt9/ujdZPe4wB3/pDwFFsDsHWyaiF1kwCgM
	 87sU6iqBR2nG+tru0D4NQsNWUzXU6A46PE2IwMaa/kmL5RgRT+gdKgWfytHPNfaQdsvXh
	 Nw1hVAf4evNo6PyECpXI81nSpYpxxB6cfgimPsXpMNUW2PokdtGfHXxgiVfO84yp+qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgcP0nU1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl2hQRud;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53906606B276
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53906606B276
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgcP0nU1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl2hQRud
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA0nF2001414
	for <linux-sound@vger.kernel.org>; Tue, 3 Nov 2026 14:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lnK9cNxarT5IGLjO8Msq2uGG6ZCud5JN62c
	vdJDIdoo=; b=fgcP0nU1jYJOP9wnLSJ34pDx907ZC1KadQBycUzKNOL38aWFkHl
	9AwVzOB9WKo7VtkLDmPXG5LftKj2c4jdG4v54ZSUOYWpKJ4Oe704CVM8jWgIFUsS
	5oVhwbdCM679WxADjh394ffo6u7Nv48JwUtmxDU2qGzA7Bn3gXU61il69ZdnpteY
	2ZoUy7CDKqsxrHWuCaLTKObIxCkReBrBjqoCnG+fC+sn/Eiu//iAbUgIflAmcBMd
	H1GPciAPWXK0SQnznRJ026FoEz6J1WAAF0PPJKl/H+BiEj5BwsX8T2jc7j0vEaRl
	ll6MyU+GQE9IEpxmMbV0bSENyDk3WyR98gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5jbbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 14:56:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so142142885a.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 06:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793717812; x=1794322612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lnK9cNxarT5IGLjO8Msq2uGG6ZCud5JN62cvdJDIdoo=;
        b=Cl2hQRudG44CLbQhV9AoPOrhHOfg+SsOhDFBhML143IfTBBukzEQCRApoilq6GEOvE
         /iqhAh2Oib0UOqldKQgvHYDmNlwausVNx7biEHIi4Mu78foGrYGZpI1L1ST4B41u9/ck
         HzGCy9FCpNFlKipGn+PwQdnzbIxUKZ0LWtnt3MJXLhRJ4arW2/Y8wDDtWoulzPkHDNkz
         qkeIa/R0Z8MW4iGy30McrbfkUqVDu5rg69hHfikFKT7aomjbxTsldcYH5PCCyejIANqf
         M8AjHgvJob4H7YTdrbAP93N/Do+HXnhJjXtjlNw670zLS24AUc07rvdD0B3oyH33iUWv
         BPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717812; x=1794322612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnK9cNxarT5IGLjO8Msq2uGG6ZCud5JN62cvdJDIdoo=;
        b=KGFFH27w8prfiLWnV+yrrVjSA52oIAr7OY5dc9hlBDs7kRqu82n6qZBKUW8mZP1Xqn
         VeLebU9lVPhuPsmureKq0J9RvYYRT1cYZN5/KkXhUacYwm5RZTRdPlU/3bYUPiwPKuAF
         jnNP+UIi1urmFlneD1KdRtiKm6ksbh/lWsEMyH4NdcdvvN1P4XxhyOL0QNnFwQWhSRdc
         z+ZUVvdNNlpl2DFrn3AORNWn7tUF0CU2y9+EF6lih1V3nD+u/ceIx2uDzElFJvOtmi1+
         F7TY4mcPK/2HJwzwTY0i9B0NuHMexQBy/X0kpGEkd21Y7oeViUZLMjrR6mqXPJeRMHmf
         RAfA==
X-Forwarded-Encrypted: i=1; AKwUvBwhJ11xzsDfsFjqNWWz2dbr1/AuAGGLOgKSeRAIkHF6JqFCLS7Ka7mjRLFr5FytXDkAXU93+csc/U4Gfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HmwHZEHycaKcYeuZOe2beIyaCI+/C0nq9KHQfk8Tqs+AI1ZHW
	e+SsvR/6ONn410OSwBcWITJ1UknJ5OhLpIUZmcO24TVsbL6fA2NYhZWMfA0gLiFy7Wpycpd0KoI
	cFjsSJ1NQH9bpm/aBHf0yf3uDJPy1ubwHgIgIyLdi1Ed897FeoXfPhoiBkUHeR3EuCA==
X-Gm-Gg: AYBFou3N3xxpqRJix8EqLR/MwBmVteYiURxoERpFMX1RHYGjrd3JRy3XlzCz0MKqEts
	DivJobkZdfC1ooqZew148kB6jQXgvsAU9L4sH+1DW/iyIeVJAMWzKKa88FK2eyBkBiBAEMXqMJg
	9SQ7OhDorVcshoNyq/mYujuUT5D6wyU4ULVTA2KRdW+JyD4Fls2u5DqlArmUB2RVqYogLls4MKf
	lwW319zkfHvVxzxcAZldP2T6WPN1vyV9lgikNAwpNeg07WfJvHih/FA/jVbv9+PKNllSVx9cdpQ
	4yrNcpzJsvrBrGitBnvkaPaMryKJGhgBQdhpRVESz40Pm7bU3pXO3d5mfMWQnp3f0Kqi7LLhLlK
	I5pgtTp7/snfJCch0W6cxKyrI5QCSzAwg48sXFj274oge6R1BM7cF+jK+BTmOUg==
X-Received: by 2002:a05:620a:4492:b0:945:c430:1c09 with SMTP id af79cd13be357-945c4301ff5mr454832685a.37.1793717812318;
        Tue, 03 Nov 2026 06:56:52 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:945:c430:1c09 with SMTP id af79cd13be357-945c4301ff5mr454829185a.37.1793717811835;
        Tue, 03 Nov 2026 06:56:51 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebdbsm69772645e9.3.2026.11.03.06.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:56:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/3] soc: qcom: apr: Reject packets with header size larger than packet size
Date: Tue,  3 Nov 2026 15:56:36 +0100
Message-ID: <20261103145635.309032-4-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2138; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=brLsQ5FQCOSS/Rl7j7/iKzfxezF6HgBn+lqAUQwMLds=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6fYjmScZL4nxD57jA2v88TZxblr6T0YGtq7sA
 h9mP/aUo8eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaun2IwAKCRDBN2bmhouD
 13OKD/9Ad96aCWnLc/po7LE6/YPWAeZodb6j+Zy18EtgTINbWBYIC076NLO08VzuSB5jIrvUv96
 6+MVbhfr/5oHhoofW4UAIbpwNBHlnIZ8PWUuqUrxLPTpZIAvONta5cfU4cDUFXXx7ggSEeO0TSQ
 ygk4dRmpQWcTyjRcTADWh/ofjxPMvqQClD9dX05LHB8xHUQHSSNGkHAEBONqXrqepN5UWjj9rpT
 1KDJ1d9rmziFo68O0OnEaYctHrOUoAvJzMfjFR7w5sL7ThwkdTjaFDSdVkdRbAnK8arT4bmyAn8
 IZY+3MGLy7Gox4DMD1SuUbrEhHitkb4s0Jvu6RYFjv9PUFwrWhu9SKwkVv5Kdvs+5emskJ+yTsy
 QwwUvx/4jPdUJykQde+ihkaB5T2cKcIc8wTWtmAiFNHhWMqkzp3/y4uEndgxlBWsqj0cT3TS49g
 jvClAr05/HJKR60ffJpGRi1lRh8iT0qcOeyKpuByAhRkTsxkobPXQhzWU/HmqkmThIZ+YWlIjfT
 MTX2q/3AbFpMWyNDnCRaHMX7AZUjByPFWsjsP6b3jsDS349C+CyV8IXbFLK5P3xwXRsXVYFvJ+A
 S2mDfJWuKnQ37OlzGqMBWt9Y468sjqbzeLUEY2Fqpn6wfTTLIxn8/NQMzOTMSBIvbGbD8Eq6mIe U8jbaVAvX3YgLbQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: I5sbB2-WpstnEpSekMFA71kEHTvW8EU6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfX+VDwFs9BJvOE
 J/+Nif7C3492y6301zO2wx4/rjlqc5oxaMngJk76rPHEtLKF2vx9f5tRXAHzUx5OlMgABQmw+Vs
 QxBaA3hpteySTVLyizg07G3527D6Otg=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9f635 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fiEMaWzmfHqX7dR_b_IA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: I5sbB2-WpstnEpSekMFA71kEHTvW8EU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OSBTYWx0ZWRfXzD84AxMFLF9r
 OC2O58G2EobY1QaMUD43LIwvQDzSi9m+o0h+EWDWjzI0aw9lZLZyVu4i+1VTPhnMDrtGxUcZ6kF
 tmREY9e6Zzu8EkprIoaZppLFxNI/Eia3en1cIkhDmSkSDhZskNoDzp9gZtBSbvHEA4PZ2g7SO9p
 1cGJsx5tS/Yd7Itp8nQguCFWBZzn+UGOZ8Z4g2Y2/4pWalQXyckmqhEY5MDRR2f3ttrUOb6RfEb
 8j1+064YvePLw5aqGqpfLuQvasc7BWF0+BTMf+aNXrw/3QEBkras+IXYDmEDbf4bGIKXizK6PC7
 UVdvWQdMPZNNHqyV8g4/DH8kc87udTpqBq/ZS7kNxHYP88+uKX5Zi69rstCvIxm8nQD5qt70muU
 cDBvoYGYKlNtqKAzLDJVWIoa/ih+e19dlwo46LrMAUfLAg+VrikcFnbX+6ccaIqdRjc2uwXtbfw
 r/bbGYJWHGftL5LwTbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030059

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

Changes in v3:
1. None, resending because I threaded it wrongly.

Changes in v2:
1. Test for <=, because hdr==pkt size still would leave the response
   payload uninitialized.
---
 drivers/soc/qcom/apr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 2d5645ff9919..e303562526d4 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -210,7 +210,8 @@ static int apr_do_rx_callback(struct packet_router *apr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < APR_HDR_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size <= hdr_size) {
 		dev_err(apr->dev, "APR: Wrong packet size\n");
 		return -EINVAL;
 	}
@@ -280,7 +281,8 @@ static int gpr_do_rx_callback(struct packet_router *gpr, struct apr_rx_buf *abuf
 		return -EINVAL;
 	}
 
-	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len) {
+	if (hdr->pkt_size < GPR_PKT_HEADER_BYTE_SIZE || hdr->pkt_size != len ||
+	    hdr->pkt_size <= hdr_size * 4) {
 		dev_err(gpr->dev, "GPR: Wrong packet size\n");
 		return -EINVAL;
 	}
-- 
2.53.0

