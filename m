Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A33C0602
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751025; cv=none; b=GxGgKqYtDA3fsOJfGw32JMa75nHfx4FgNpuw+ytQI0XT5ozUBlX0jbPm6FLVPJzFU4dpHXPgaRXQ4bdWxrYXwqvFc8Wv1V8AZVS5sNTnwMtfS8PG1Kc498Y1jbG0Zz0doshQShLSFkF4MuvY0WtDwJ7IAqzyhaclYrmoAn2g7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751025; c=relaxed/simple;
	bh=uPJoi/qVSLB/OsiNzwPHjB8OklNRj/yykobtrrudFXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f/poKKU1CKF8fa9XempU521uylY3hX06JzVhe4B/6KuaQ3oslU2Ak0o82DhA1vXu8+vz4eOtWek3yqmXL4dIuxjKMO49kTmGUJrbt5EVNIbZ6uS90WFfFus+wQ/QyUQcV+U4P5bY4sKdrIlDOG4AVV2fM5Fa9RUr8WgjsRHQ6lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SosiWWsv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuaY6dDf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SosiWWsv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuaY6dDf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8n3gW3103092
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ndBnQOcCZwfhVbMkaVHGUI
	s+rPdGd5HI+jDlLkFWiIM=; b=SosiWWsvX0TCJ0UiWp7jkQKEKjEOfmf33l/VIb
	lyV4XXoIqslNWR6UtAlRGIMEAPH4XUHdT+vGbYWeGU/WOBQWrYBsgWVR0iE9qIau
	gxAFG7xAhVtfyoXw1Bm9wRgezf9bAJyrlGg4OyODM3LXmAGAKknS0SfG23BCiO0F
	3mvlWZhMR131ipAod2yeT3ff7iNZrfv+qD/PNErBY3bGB8e/ZS2VTEyTfb2HCeAC
	5hs1W9WM/NfSr1r8MxJgxZQ0XdrS2lkR7R7exOM+FUgX35058kigu7E8M7gM12Xq
	DnrsVvBEmv7SFIhwbM1J8Yg7j9ujhnbc+f/86LiBHGW9gYHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7brty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 12:37:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdb995a1bfso3815752085a.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751022; x=1774355822; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=;
        b=JuaY6dDfzgoAJJeEjmgWQpIpyTeSWpE5vSMSgT9UHz5wVuDDUl9uByYZck9pTCND9D
         CdjaXSyFgewkhVtp0fAi715Ao+35mmnXzuyRoi6nOJakT28T54QGYOtiADaKuEm/VBm8
         m+vtUdirWXolW7B9GqR68AEdhgwa4aKoeacwIWpy+vd/MUDUVJeXbhjk4TUFydpM0Pix
         jFvvvZKlzDJPH9NCinl49VskDbIGiRNUb03XotDJ2TXcSj8yZfRcU+5/odgGF4ZuT4MN
         vwNVu4qtktZSjlOmD/oIXBdNZM2DPAMCXz2AZnaW02g8g8Ems30XmaDrGetOD8aHJNrA
         3TRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751022; x=1774355822;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndBnQOcCZwfhVbMkaVHGUIs+rPdGd5HI+jDlLkFWiIM=;
        b=psd7tL3AIxr3Z0dBrS67vw7uddt0Yfsxx8b68GyuMrXexoFsHysye4E3b9qGGxPV+q
         2urvC+5yHwEAIcg7aM0B3i7SgDb2ay1OMD8Q/cNBlcf29QZv3AQYRalCNK17vGxN7wO5
         z0p58bL3Mdwd28HdabofuAyqufWNGnobiOpMeuATUShz5yyjIslWDr+jCVVYBeBUsDkT
         0Xv9aMo6QcvF3SAz+d6168SKDVPrgnTHwyenk+CToaVUbmWgIf2WplYdyaW5hoLFu7nu
         P768mIPOYmgV9xqWIG2Su6of06UdYlKbLeKeGNlp8P1NSDKrk75IqeIYibLIrOcZkBPR
         xdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVd7jUQ16uz9CZBXO7fS1nX4eS7+aiLX9rBRmippbaokJ5gtdYW/NTN+JYDwCF8iu4+WXsODNRlr+yYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrtfe0d/wjD+zsreLP4MQBzRIPf/CPpBy8urH4ad9ayCacsdJ
	GirGeoSnBZnJYpxIRn9OBOifn2d5k3L+d/apOo+KsuCfOp0lKAYF2liYjGizapqn/3jD0QumbTb
	xRIOj3Z7rLI6a3fLaDPrAFKJTs/FJFxmX7Sr2DDqxM403JZjYw/kgN23XdkNr4yMVfg==
X-Gm-Gg: ATEYQzzSpwW/3YUhKzUSzUHgkm8JbnS8I/bu8Tpy7jhE8P/+maQb4fXaURISRusFC4U
	rkSKdK7vyQgBeMZZ+qFUVGpRCOnu63lOQaxsvi+OpdyIpUXW2DN7o9M6lU/JmzU+Qp6CJIIi82W
	qkG2vR0USPiWwSliG1Mah8HE8sqrYKkTt0Kp9HE/UL9b/tpax0WZ4cp2RmhvzD3ES4ZcHxsH6Vs
	E2GtXDGEfb+L7gddUwPlOaolRObTRCT9S5BDleGQ7O3OOQMW5J1u79g0dq8DUMf/LWVs2zj0eY4
	wc4A+i4sHuCJ3REWWEY+HGZ/SN7yVdAerFrECtEQUgLVkJhETzz2bD5U8goilDn4k4G+GEfCWu6
	/CE+AmjQ9QR3l77W/EU1AMmtgaOzxR6KSSynMlSQfr3bV
X-Received: by 2002:a05:620a:269a:b0:8cd:9bf2:60f4 with SMTP id af79cd13be357-8cdb5b25e56mr2243337185a.47.1773751022235;
        Tue, 17 Mar 2026 05:37:02 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:8cd:9bf2:60f4 with SMTP id af79cd13be357-8cdb5b25e56mr2243330085a.47.1773751021716;
        Tue, 17 Mar 2026 05:37:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Date: Tue, 17 Mar 2026 13:36:49 +0100
Message-Id: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOFKuWkC/33NyQqDMBCA4VeRnBvJxKXLqe9ResgyaqAam7GhR
 Xz3RqE36WXgH5hvZkYYHBK7ZDMLGB05P6QoDhkznRpa5M6mZlLICqAQPIw9tZxwsNz4gSauUEK
 toNH21LB0NgZs3Hsjb/fUnaPJh8/2IcK6/YNF4IIbDWCOKJSQ5dUT5c+Xehjf93kabDWj/Dm1K
 GDPkckReC5NZfVZN3vOsixf3rvQWf8AAAA=
X-Change-ID: 20251130-rpmsg-send-const-ae216a1fbd8f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uPJoi/qVSLB/OsiNzwPHjB8OklNRj/yykobtrrudFXw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrjtOnsYsLvrm8S/FkyVJoR3M4nXv6gZd9L2
 IL+Yr/4XnuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK4wAKCRDBN2bmhouD
 16XDD/9ZiyAJQsI5shJ7BOsxUZSD8H/YUWO9siR+JgwtzJSEnr8oBBz2oXX9p5OWMLfjQemP/eE
 YD/dHx0WIDF/7PLaFPD6iK6JY/qBHZCxGwNTeyz7Oho00lFJJPCKNN4xqY0arQ2emoa9VqOJy3y
 lteojHk1k1HWHHdkyZlxh5J2uoI6ic0qULpbL5Azq20EVgyUXPVshiXNVsetacaqA0lWDI0vdQE
 bydAxp342c0y8yo4KliOksgOD7MXUxdLmTj35ZeW4AcE8zQCr9Q3uFJ9vn9uPrA4DD7L5Gkjy5a
 +TbZ++kW0K80Ll89JH5FyHq/heo1nnjKhzrcTuzZ/S4IuGibJob83j/54ANQuHDsJlaz7deg4/V
 +WOEVBwP3OxXBPuq2bLmlqDMTX1b824bQ+z4jT7jv+MFuxrwSvXbxVUxb/aZ5lqzLHE3wWAnht3
 fjtHUGnE9ttMAmXoPaQ7ZGMlina9DMNOqh1MerQleT51M4ImK7dx3r0FC1bXL7GSDjjG3GP1c/2
 yFGQ0bvtibPI/pcdCKMt5+P3rFAviIc8BEftsx5gf6WcexZbdptUfyerJ56/yzvGgqQbOlNCgMS
 8FBNqg3y4aWc1EFNBtpCEMP3JMJQFowMKfbr1/Yp+WZaTZ2Hp7QCZp0F4gMrYWy0DxBO8cAEfoK
 dZfsaMyLNAxs9UA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfXxSCtMD8GED0s
 isz0Ni0svFFwVQ19ldz71D4ls+saX92LbhsHUG2++SMA28xyTeqqveCTAFSkaFjuFvKWHJ1ow9M
 +wwm9lhgdrL8nf/1QLm9mHbOu0FncYlnS4XW9+/3gwq45dcYYTJbxghd0ek8GZ3rYtwAirPg/xS
 BiE4aOcPeKp6c1ukpbhs6KqdSXkStYm9dAJSIpEWb5Xhj0jef2aBv6uTp4SoiDnhh+cxA7LBFxX
 kaJn3mog2wXe5gub9wyDgIJpR0eDvmA0VBEJfAOEC6yYf35HP5vOk8meYrxfWRDaO6n878fCrKG
 5MYJUrbY/V/bWK4HhABZYeL38xTei8+4V8I0ZbqGLwX+t/y6hF7WghEtzaWKwBSb2jhJp5fQzCz
 d9on+/EJbljMUni+YBThuBLvDOaRSfEDNC9PuH8X70HbsGJUA9bSB6qyyvJmP6/nARG8NrjDltt
 zOrLxuXgmbuFreZ2JHg==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b94aef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BeD9WHbRS4kTi0j7Zn8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: P6cGIRBqX6mC4oadSp6afC7XDYw_pjPg
X-Proofpoint-GUID: P6cGIRBqX6mC4oadSp6afC7XDYw_pjPg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111

This got acks from Mathieu (remoteproc) and Mark (audio), so can we
funnel everything via Qualcomm remoteproc tree?

Dependencies / merging
======================
Entire patchset is one logical chain, all further patches depend on
previous ones, thus everything should be taken via same tree or shared
between trees with tags.  Probably everything should go via ASoC with
necessary acks.

Changes in v3:
- Subject fixes (Angelo)
- Tags
- Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com

Changes in v2:
- New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
- Rebase, add acks.
- Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com

Description
===========
The remoteproc and rpmsg send-like functions should not modify data
being sent, so buffer should be marked as pointer to const.  This is not
only self-documenting code but actually increases the actual safety and
clearly documents who is the owner of passed buffer.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
      remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
      rpmsg: Constify buffer passed to send API
      ASoC: qcom:: Constify GPR packet being send over GPR interface
      media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()

 .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
 drivers/remoteproc/mtk_scp.c                       |  2 +-
 drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
 drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
 drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
 drivers/rpmsg/qcom_smd.c                           | 10 +++++----
 drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
 drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
 drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
 drivers/soc/qcom/apr.c                             |  8 ++++----
 include/linux/remoteproc/mtk_scp.h                 |  2 +-
 include/linux/rpmsg.h                              | 17 +++++++--------
 include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
 include/linux/soc/qcom/apr.h                       |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
 sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
 18 files changed, 65 insertions(+), 56 deletions(-)
---
base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
change-id: 20251130-rpmsg-send-const-ae216a1fbd8f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

