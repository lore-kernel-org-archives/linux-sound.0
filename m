Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90D13C3C0D
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751030; cv=none; b=b0zWgZOXGC6cqE0zj2a9D4S4b/EymJFGf1wHIwsMK7Oe89lVcsrumykxVRk7vNyCOhPgi1Jf9tUFx0i1YW1KkidCKLRHMFTNFFIrldKkRYr7rxyZ4XzQBvOXOfW20HcRUtd5pfxSOoISxQY0s4eRICX9ShqdM3aHXsKFLJdmjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751030; c=relaxed/simple;
	bh=nqRqIi+jvufKkw75OxFFSCYXELMLBnMO78Nq940C9n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bs4HXiY+unP2cztaZdqNCKDWXyCyK1dnladCdBN2hBwEufHfMQU5tf7biUItOP/ec/u/bK9Jt2PgzwqU4zDA38Sa8pCO9Gt/wzxSkvZ+yVNX6HF0Am6jdVwxhIj4yd9v6KlyX90g56Ki8kNvusFualEKZjCM/RnMjRfqpFvxMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmO/sj3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yra8BTXl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmO/sj3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yra8BTXl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HAk28C254384
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=; b=XmO/sj3t3Y3Lk9eB
	q3EfuwwWyzi7OEkdbG87Wn2GB1KSu5TYuX0k03qktPRxopfm3zmhxao/7ZIMwmn1
	Pdcu/ajsEv8IDALv94CQKFzuwRHHt8Jtd2xG24EBUjbDqQEerzx4U/8MJRn3ws8K
	tHrUQuBWudy5Hi/zV1M1Yn7GMVRQF8/4/LSwzWBOSzbBotYJS/4I1gYKm98x5Hng
	PZBe3lXNqHfIlb5O0sDRmyptu12tm8Z0eSFCJXjoSPyoyg/1weNgksTJ/B27HFTu
	AOPiIFQI1FIYfrg7HatQ5ajf4DeXDNdRjmov/baKi/uAR7CLIbj0djzmkPa0fT08
	qJ9wFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8gb9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd84943c76so489487285a.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751027; x=1774355827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=;
        b=Yra8BTXl9NP9j1dD094nWGqa1wiTabUkf0CrOdi/obi1uidQIbL5flDwwXWCE0lzAz
         p52l6qouqdv5A3ZBY6SZEyXcf7ZuBm09QY/Y3zjHV8E7NukQl29/v5shLiMdJP/KU5So
         lB09avh08aQvdIWapaWfWmcW5IlEV21SsoHH34BDYf9vrgCGVvlImNFoLZWCDtZE3stE
         mucXcdT0TnR2W41RFaXgOUwXp10ASvaHlf/zYW+SxSpW6ZwAzxgewqeTCdRZ4wluj/Qv
         aQ+SHF8HuCWNkhv/61uPd5okEPh40EPNdos4FPh8PJqe6JUR3Ff5g+tzeR72A/i5oGbn
         mhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751027; x=1774355827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=;
        b=PIg8pe/sYdhuc/kZn72WqwpEVfwJP9u7NkQ2YJGi9lOZMUjHp8CKOXhlKLLXJIBMwY
         xI+dhmQZgbkct5h4aAtDXV1A8m6DHA0WhZ6QlvQ0xR8DG3WlUr3+kmJ5NY3H0vS/wa/z
         Zmn4hlAdarrpLRnQr/KxzKIfJ2kMY+7Cx+S3yVG1g8JoLN837PVQkvsKz6NE50aqt/Q6
         Q+ZDYj6aN8PGROupYOEphaegPvjvuqTrLnel5hekmuuKWabATXrMHkMleERdRIKKTAcD
         8HTWZSHrr93oDXlqTWTCKLJD2pfl0jpTm7+NqshlvEU44lPcBrxOEYEe7U5XQRNM1dQh
         dzYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOuRkwEbcOvphGuHnHraWxhscfU87eg7O0r+NQQ/fNHL43wLK7rctfmaCZwh3gl9x9ZTrcj1hAjZ4mkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzExC9gpGch7JNXHPtXStbqDIhFtTLRz81Y480Nvqo7XCd6aILz
	1uH+hwdl/Npz25E8LDIh0EOJ605ZSm4JKA4x1u3J1A00uu9ZUsv3NaQKXU0vcSgizt1AN8AXOya
	6lJn9fRPtd2nWregXwaymai+2cyteeAmlkxx2zfuwD076xNn5kFEpWiZIt0vtvjHYww==
X-Gm-Gg: ATEYQzz6axCeYsNQAXXLnpT68nxgG9rLMS0g9Q00Aif4wEA+8n37h6voADiECLghXWD
	hmSPyjl3PfQi+ROKhLB3YnRz+obAmapIRjzoKn8f5c027EZIYnUeS6U4hcO0pOMoLaxiO0LU5aN
	dju5aHsko4cnwo3kZVBRR3zmbb3dJxjgSVtPnFYhLOlbciiifxrlvVeYYO7utWCWHyNemXyZA30
	g0Rs0nfaPpbYFPf4633aCMRXk+NPcUig2+tkaCz/QeXdXmnGaUTxv1Bpau2DGUYPk3t3LtDbkJo
	NaLZ3/RIctCyZQoDmzmkL7cYCbH7TJBMwPU2jYFO+GvHI/DOLS7CIRzoJnpSezO9la3b9MKVC/7
	VGdaRIwyky60rNq5CT/ZBreX01S3mUzMHchZwvk3FtXTW
X-Received: by 2002:a05:620a:488d:b0:8cd:8fb8:7ddf with SMTP id af79cd13be357-8cde13519c3mr367925885a.16.1773751026936;
        Tue, 17 Mar 2026 05:37:06 -0700 (PDT)
X-Received: by 2002:a05:620a:488d:b0:8cd:8fb8:7ddf with SMTP id af79cd13be357-8cde13519c3mr367920785a.16.1773751026419;
        Tue, 17 Mar 2026 05:37:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:51 +0100
Subject: [PATCH v3 2/5] remoteproc: mtk_scp: Constify buffer passed to
 scp_send_ipi()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-2-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nqRqIi+jvufKkw75OxFFSCYXELMLBnMO78Nq940C9n8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUroFKSbIBB5RlA3YpmmRSHYAPZ+GgxIjOsmC
 QsYaMdWGFWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6AAKCRDBN2bmhouD
 12hlD/0YnDGdPlpE0996CUjdK6S6A5CItE03o44wrGUyTdx/aJRs22HNSeJ6/pyD/SmdfXhWvTB
 KLWAKrIHpmKelvllJxz33HEocqtPs5NwMHYWhvgc5mQyTMV1NHG8kLJtaWou8HjOLA2ACwlxUmA
 hBK/v12MZcH86zSZE8fTbI7d6JiJ/CmXZ+TQA1oYo1Hbw/1Vbhjcr1wFxfIlWW2lhyhcLYRpLSm
 eFnjaGHQB8dkSsgkc7TP1jIHbtzhbvG/IQSNct/hnN04YE0UDmSkQhus4GLBs4xq4uHoWcYocIW
 nPZ13IczlU8xGR/z+nyex6QI9+GeMW/luu2wlDj6fdva7aYkKboUXCf5YS8IzINRV/RNUBgVu1x
 Arpt/ozO6wmnbV/EH8tPZA/UqM3ALN3TALJzBcZDfwNgSvJFIVbKEwC7RGZVJ4lr90cql2RJx9h
 Ny6lZtwQh39CyomEJ1rudS6EzgzpOu+fOIYWFTQ6a9vEuySpjI7wMln+UjS1KKCirFKOIYML1Bi
 nwUtYVqJ0USwP/nrzswexqDRQzPQbKwX7n0s7kCaTL9Fs7o/L1nvbTwELOsC9i93GDUjiYHJdmb
 YNp5/JPGO6sst9r/IrxugsSGSqNfovrLb6XXM6hU8wFEtWwvatS44GStvbDGVDIsKACdfSXCPZq
 gQdux+rBFoXhBdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: D5xCFyil8o_1yp7-bRjpf4n-dMHEaZ2e
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b94af4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: D5xCFyil8o_1yp7-bRjpf4n-dMHEaZ2e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX0Xla4ufI/Vfl
 6Hmw9WZrd1wH7CMcO5Knl6Puy9wRHp38CrVlY4FXVvIED/k+FRMnvwTel8p8NTIX6ffg/n1fHSi
 EbzLl5NwFzPjUD+KvfP69SeSPkvp/5tnAk5ezKXXLpC6SqmHNmbcXGCWA+ovnzvu+wPasDruz1T
 SwwjZfwH+GNNs3cToH0Q0Bfmq4FAQIId7uh15MQBptdwavjq3GUIMfVtcB5IP6nNyJBP0fdC5Hy
 Kl9FQEhrAR5TATEerdMVID2KcAvUHQ8A4fqNhnxwncSw3C2dRb20bBw8CIWIQ1/2DRoHkX68YZm
 QC4BGWr1t0wU4rphdhm+Ly6/X8qoQtj9PQ23EWQ9jH/Fzes5GNTspFtHsJvqBItCaiBcQnsja5N
 wrtzmMosgVdLvtbAXvbnC+xFTnBFz26LLGAzoJn8k+it+MNcAAQ+SZHkaAr+Lo6Ax4Xf6/KI4QC
 KvjstA095rid2UoN3gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index bb6f6a16d895..85a74c9ec521 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1078,7 +1078,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.51.0

