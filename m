Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF523AEF23
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141780; cv=none; b=JfLNFaCkRgxfGiAS7e1+xMe6OgRnySLZvZFMp6tyWxbu8GXkJuzMuX+Zw4E+Qg8psP23mKODkdYvQVtNBqwXHj1BtvReIfAUmiahpn/o9T3R8vBwuW6BnpjH4P4n6uZ88bSAa7eip8N4+A6UewjwmCcxccQSHvymz0C/Q4ih2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141780; c=relaxed/simple;
	bh=PYQfNbJhq08lhf8pSFWFUAIROg8/q1W+1h6VJZjWmOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vDQHqOaAcafBSzcFVjpldo5eXA9O97kyHTN9Tr9nppUZGaJ2w5uygULhdZjVRMW8l2BeJ7c16xRzocEiHkZ2jTtcCo8C7F5mw2POZ3K6pTk+IVHRvS+uxNyySzUOnwm4YBnl0T1Skp9iVWiPyD+e0bPhu3Al4O+GTtCc3RuINYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvghw8DN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aLpXCb0A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvghw8DN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aLpXCb0A"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8xhkO2362950
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 11:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=; b=gvghw8DNIsAi2ZOW
	rSW3aAU2unXfvpyObviRS6XiDeTA4dtbT3T8AsX+/MCVGS7NNm8/S6Kt7+zM4UHH
	KbGKQm6ax7UUTaOwTgseEP7SYCNxz3rqgTBj8u648oCj1w8Ktm06wF6HHSAAqtdV
	QQ19c+3P5HAUkoycF4YYSERRzcwPvkRAxySGr9+gl/qm1+Z8+Kk1LThEikRfiJ7B
	r/PV77TMO9kVLDtNGcg2MZvaPtq/LTufVj24bCq4kGIU65RR/UxuNofAEfxxay/m
	wDD8wQYZ+n4RYD9iqm7d4XZrQ9X3QKFsLNQWXCTT1tthpouMwJKp9qiUEvhM2csr
	fT3TkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032byhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 11:22:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50923a9bec8so21688201cf.3
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141777; x=1773746577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=;
        b=aLpXCb0AVeLwkdk0gQBcjQUuQ/mZ9vhO6suM0LclL20od+3GMDeKtm/E5OAf4z1XMP
         7ExPeeSBPM2qmWNgED8lVbcmzY3laQA6mLALdNJE1+YeAFANvLZvJ5GGDKqdfoWV9ST2
         3CTd8qJgkNuEeEjBGj0x997z9qb4BSCM1uxyD2ayXR0x4wejTp02MFDErL5tH+lMXJti
         HPTCXhNKUnDLvPTA+/zIGtzzzTqCDy8g0E6yOUKeymhrccAa8M5RlS/Lanksn4r3jWud
         UyLPSeDIV9FB+QTTxNi6E2bYaegrwKSzcXXeuYHov6zVAD22lp+KP3uZdGG6K4iy5u9I
         bw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141777; x=1773746577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=;
        b=TQTGGRvcZdJElFHagXL0y9xf0n6EvWw7EyGLjo2kH+fMaZpmNmDpy0HVofBedUk5kG
         CWdp7PJpEgs7oCb+goM9W3tRZlwgajoMSXzTGNwE+W2Ga2V7LKZT9MMSmOhtX3nz66w1
         89QD5amyhzblOFnyglj1AWNm3TPzOw5pNlO47iBDmkpAfrRNo0uRQLBY3ToFX29Alnqm
         yHKnRuQ+7/rMjBK0qXsZKjrdusivF99J7SwDMdDG6A/no+M+97G7tH6ISE3RjG5nDOa7
         C4N+nYu2TGfAbUHU8vkabuQpKJDZdlWhXY0fCEeSrl1+/lke4plaA8ybXiGp8vdnqKTS
         MCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw92yqkdnCG3reIDyrSlB0pYr+Ghc2GRRyUOhCBn1Kp+Dxj+ktvT8ntZvgPtiWdGYLxsI0jdUJHMq/qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlb/mUDrSKT7ufFt96uuM68axGM6YuoaVVKttBHAuGpwNi+W2
	mIPUr937rWwLW7TjZ9EZj9l04QPWu3qOyjdbEVU6FKvOUDh1vLKmcC8Ip1xxTBF5zAiSoTm6gwX
	yXDZaOCtLXUE92uasT398FKbSLK2Av3BbNWUlindRqHzwpurWycMc2DRqbqp2p9SQKaENcO5B+w
	==
X-Gm-Gg: ATEYQzwpfL4rnM8Veo7TFqEyv5/9WWRxN7E/YOI8+/Oe5N9eOhHv11dpyj5W//Kk9VO
	cV9UJqjEsL7k25ZcOYZNRM2d4SkDen/bpeRlClt1eU1LblH5BxepHGuuRLP9DC6FqTQ8Gu0bnuf
	UAoHCfr7o/s/jmjLu6LJNr6SF4fwIZFPF6V6CMxzrRuTAYfjTx0/CZlGYiSpmRodYB4xWo7hBZR
	K3eiR4uBO30n2DiJNVQnuu+bpEOYKd6mRX9MrbjGwtcT+HyQBDQEFOKrcwxnEIVAYSHZi+G9iG/
	Bj+pGgkJb9uOnGSgSEC0HTILiuUehdKp8j2Vbl9gj0PBuixMoQlmHS+OelHcqU112Av/wRHjVi5
	dw/4W4Xar5qvrItPv4Q8+Qt9EAxKhjcgZdw5zkJppraN3
X-Received: by 2002:a05:622a:1456:b0:509:219f:8e35 with SMTP id d75a77b69052e-509219f951amr49609811cf.42.1773141777593;
        Tue, 10 Mar 2026 04:22:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:509:219f:8e35 with SMTP id d75a77b69052e-509219f951amr49609561cf.42.1773141777135;
        Tue, 10 Mar 2026 04:22:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:39 +0100
Subject: [PATCH v2 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-5-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PYQfNbJhq08lhf8pSFWFUAIROg8/q1W+1h6VJZjWmOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8Ctq9UEeQlkwgbYOvBN1J0NS/LKB7qV4njw
 JU8skMasvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AgAKCRDBN2bmhouD
 1774D/9uW5xrt8/+RUVSYosRDY2s6mNxQs5JaiEfldKJ+p1+reJ9wftn3leur1dOdwHj/pB3F9A
 jOJIbwcWDRi4xx/mNWXP5Hv2xSEBxQOcf0sfrwWcK8LroDj6wlzCOxbOvuhxrfvltkttgQ14t03
 U3zs9fbzvPxeEASE1aWA0d3S5va6WP9xo42jJeOovTbPAY79OwFBoFeRrALnvVy6NxOerxKOeGQ
 5lBuAzESo+KyhCSJUv858+bItSk7gcTzAJspq73LPE6peIEYsHDuicNoHnJYH10E4HBS7nktFx9
 IyONmGVnKGA+eWGC4bh74oYTC1f1gj1COyvrzK2sHh6TvLIksPRy3KZBFHUFTYKc2V9n74ypweX
 mkivKhKMRyMxmsR/xoxKrOmTs6pbC5qM3bonRCgksg+e6Xa1GittEa5ta6/CJ1lF+e1TBq3jJhb
 bti70QpBkAPodaPfwDZhfmeCIdC4U4RdXkQb20tRu4H+bSE4k7c+kytacurPBtGm8w2CXCvRJyR
 KOm0hEFxtR3+n1gzbECyPMgHwj1KRsz297+3oq/56L7lZVaIq2TDOD+/T7H+LXQAa5Vds6WuxCh
 eiCnDXDKS+yIdOH5I9wBB6q/thrp3foV5UQ0aBDk/YGwhhfGRM9mErhiUyj9MpWlNRKuwsH/+C4
 d2Tmexu7aWpZaUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX2qe9V2oUmSY7
 kXFfBsv7NaRxewDg4Gp44JfX2bCAgbT3riaLHCbpbn/kHfwDi7dowgi1+Va/wvjQeP+58vRAufq
 5d2TRut6TjVjaxnPAuOwky93lRruBvlP9uJQArLRChVwAC5oalRk7PrHRL9fmvRPQezhwWoBKpt
 RVOmIMOkShsEqbfUSLSxghkR44DAkImzsfMNSWXT1bUhW8HZoTFNvxp9Pxa9ELp72ajfA/fQalX
 qp46M/S1+AMUce/82OFfAAcdT7O40AuOrOD8x7Cz8PKTX5dfMYFXUcih0G4oXHHCjfeBDV+oD6H
 CexXoJMroSngIfULs2Ec7pxY/V3OGCWhe8CHYIwhYKz6XJaJ+YDBiCp741gmmBvBFld8r1uTAUH
 xoU9MEYHGY7eD+mJOkPto+3ciRnP+DUgmgWP1k2zzK6sQfMmcoFBVB4H50cRA5a56SHKsmaaRIc
 4bFQjyhE/mMG0juWIPw==
X-Proofpoint-ORIG-GUID: XM3xCDsoVbPuHAlYdNIf7tgrifgVv5GX
X-Proofpoint-GUID: XM3xCDsoVbPuHAlYdNIf7tgrifgVv5GX
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afff12 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=07eiXoGdt8lw6NVwCNwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098

mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
pointer to const, so adjust this interface as well for increased code
safety and code readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index fae3e1ad2df7..67f3001153ae 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -163,7 +163,7 @@ void mdp_vpu_unregister(struct mdp_dev *mdp)
 }
 
 static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
-			   void *buf, unsigned int len)
+			   const void *buf, unsigned int len)
 {
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;

-- 
2.51.0

