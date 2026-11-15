Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712867;
	b=E37P0mlPmkege5hdgLeMk7agm3OlA+t+T5MpJ8IrJy8zy1IItUe0ufmwAVwHUxyjVQRs
	 Lp3ecobTdTyMR1uti/hO1TtiYDUJj1vQ0aAkTTW8uS3PaZVphE6TfJySC3tq1m525Gnh3
	 zntKj50xXSRadLhWSgPG8YfrNfVarFkkdgxqng3v1zSCCyrgsnaPZuieOsdW8QTtgz7Xm
	 l2iHSYjfy+IYuwUxOmpW0OrXUn3lBuNTxzR3WH7mV/V9ifVv9Vh1YEt28IKUfLqLffqXN
	 VMBbeY7BS5TFrAFEge8+c5jSAg37cFMOJNoAvqprgQ9sbR/pFVWmp5kZluZIObwd6nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
	b=Hyg2zlSjR3lprdFmarpgieKCi+Mn8FV0FUE+kyFoN7WimizkyxY9HgOcJTcf8aHcjrcJ
	 f/AOU+L6c4fWM9PGp53UY51hR7x3J54iSkTvz7TXGx7mkRDRdNzltVxBAjzs7/ixixWB0
	 isVnaYfX90e7k/u50Qyx81W3uhY2E4hUf/u5eSonMFWMYgJQ95WbwhJoP4u5bThcw7Is1
	 Xqcqt2EgVgkNOF5ahcQXh3mwIBHsH/dfndMGr5B+eaorOIolrSKf92HNRTnVGO9VYjMQQ
	 2rB25xBpZfE9+8cCgtLGcoo99jsXpmRVO0LHdKYRKdBNV0D4RE/SOU/F039RBDAihrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZGiqkMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aagYIyVj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0905F606A32D
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0905F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TZGiqkMm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aagYIyVj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF0xO6U1294166
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSp
	zOZqoDXE=; b=TZGiqkMmHeGm4yVAh4UduXar2iwqTnsWa3pMjlOyaAc6awINfja
	aoX6R6itDGStu4vGIePEUd2bNdmXJdebKvgZ0CBcLi6vkedBaR79iq7s3s5jux7G
	6MmX5OEeMQASrtk4JsjL1n1m811Grw+DHonv0VL+tGBinfN/fj/N9x7qLZE/jEiB
	XZhEV7FuJBol4fiPAQCYV5jMkIdO5HWUBNUTfVhWyMwAOH56f52eHCMXRwkZFr89
	o5G8KxAM6i4KnK5mTv8Xaijjp1R9zMWM5NvTQ6gO44Fc6C+VXosv8yTISoy9No+l
	OGd+KU/1ISXwSa17rBsInbFiAoHZWyM5Y3w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjt9ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:20:59 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so1202426c88.1
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 19:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794712859; x=1795317659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
        b=aagYIyVjyJLc0oDXsoXVUAnrcNsPPLdm1AMM3JLcX74sHr3MyUZPvazc4sNeFMnObZ
         jQ3p0LKVzs3FT882ObGz+kTRl6PvzdqrB9wuTc7IqyMHiOe9poC6H1QCtIGwIjuvTV53
         NZmOnmbO3xp8O7eixttg13Al95Qb5ZLaA4nA0yEzIDv6sRXdVNGNX29TeDmMvEHRG101
         j1YIuvu0R6NYkhLbgXC+mIHAJkYwc4GjDxTKL2Ya5/5+g/NhSdDFpNNskg6Zma+OKeNJ
         xaxiTjfNxmF30b8/1JrqFGxn1L0GOe9Zhpv7uzAHvgBPm4T4BhJXrDg0t+N5BPOIKiTN
         D09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712859; x=1795317659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNBfBA9zirQU8vE2N4UQfu33IQyHSAKzuSpzOZqoDXE=;
        b=uGy/EdZ9dc/owe8Bv0Z+vr2wVo+dBXUrLih3WAYTOrGbsTL02bzJZlQdDvdFb34LXj
         /nqf4yXjbQ+HWhq3YZE02rf/UsNxxhCIbVDsgkp8Dhl4VgoTBG/4DbcOoaPgy4JrUrAU
         Vwcd5+aCN9toNHjmzhnvNM4/sQBng2Y9z34HePFJu9T51GNZyIulN5xv7s0OazWmq2fv
         WuqZ3JNyxq/lqmDHgTUNhh3GdB2LQVcs71saaidqhq3JMgwo33lBAYLnAdlBNASLJzvY
         s5kODEKe+/p5BFgc9JQlx1fPvo0neChC0A1eZcrN8Ljw0ebfWJWIf7GsUtp9LBigokWg
         f3Fg==
X-Forwarded-Encrypted: i=1; AL+hErEe6+DfjXlEs2Q7CXcAgN9TB6+yThxnjgXxbIqhAbUow/kY9RS5ibhU11HHNZq61Z+Ucsh96tsC4MLy5A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rqekZdAhzNtvtBopKS0d/xJbS/YyiXY+cMtjw9tWIP8CTxzus
	LB2dA+rrlVmRdAZVSvmu31xkx/I3HrAaLQpMRvpkLbx9ZhZvgJEcYGadehXj9PFouWwpUB2hrzJ
	YJzw7IwHVO14uoaDwqdzcvlos6E/7Sw4dG9WiLsHqdXlNRhkEXdMeRnCDdht8QAh0pA==
X-Gm-Gg: AYBFou0eJu/V1934eh1z8rYyzyOiekCHrWURLjeKTNaU5n/iO4KjW8Q6QNsqB5G1yof
	dAkDypRjxXEHRPjy9sTvAqUu5Z6cDgbQejSyZ0lZ4QmtXFOOGEhFVrMXn5ESS+YLkHWMKWZhRl1
	ipAtZPJVyNzuLYV8QUjcJZbEydxazAd99aD+AZMD8itXTDe7pNkPJVZBj+0Ak58nAyct18reFc3
	KcMXBLkPxlYexUk7txBgGN46qu0Bzwv/7OymNzI4EM7ye+bCV3Cx6njPgxO8zn8petp04TooB0M
	fgaFSk8YrE00Yv8p2AQr6Cik5CVAL5zu+90V3P+o45SS1rViOPSAjb8f6zk1rPB8hlADQdFLfFs
	xjewGn2G/fmrmUwrfsnl5Bjd/MHc1wSO6Txr1ENMLs70TYHuH1Sf033ZmeWebfIdIySRnfJsM6h
	uM/fkRFbAtu0OiWcoeFxQzdd9rs29DRQu/
X-Received: by 2002:a05:701b:21c3:b0:196:e2d0:129 with SMTP id a92af1059eb24-1b50308b464mr6379932c88.2.1794712859081;
        Sat, 14 Nov 2026 19:20:59 -0800 (PST)
X-Received: by 2002:a05:701b:21c3:b0:196:e2d0:129 with SMTP id a92af1059eb24-1b50308b464mr6379913c88.2.1794712858434;
        Sat, 14 Nov 2026 19:20:58 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm21300791c88.14.2026.11.14.19.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:20:58 -0800 (PST)
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
Subject: [PATCH 0/3] ASoC: qcom: qdsp6: Fix audio after an ADSP restart
Date: Sun, 15 Nov 2026 11:20:24 +0800
Message-ID: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfXz1um7tE3/v01
 7gha0yPFcECi/lE6hpMmVjmgNVnt1xQSyHu6JQDncpaMwEk2Oe3kZlvv53vYaEh8jYTCUugWO5W
 EnLeqFDAwRQBylJWgtZrDgkm/RhNNacRLUKPNyFif0TLNlVmff+d9BEkxs7QfKq8+M+A52cCdbb
 lmCTtwjB62eBHcYxq8wzyv5fU7cZvEeE3kEPqyZQggdf2ma4asjUAuCpEZ7AT2LQuRO0TmjrEch
 QxemRAXioiezIUxa9JXxzgLHMXYQyMdxbmLJqHbL8ahZaItoOCbzxDew3zh1mmMlAQo0g/dBWNp
 DWZSyt2/SHzFwNSk62lWbrOAkugCPNjCPgxhkXu2FXLYYcXX5laTO+ps2HhGUmglUz5xexc2RV7
 BipVsk04wwCKN/hQgfDH627ggmzp4lh3EsokQ4Hwlp+rp8Vk6U4c9mDCJucI4rGxBX1YVhp6UYl
 jrcpUrV5Mlma/rfcnTg==
X-Proofpoint-ORIG-GUID: pSZpTPiN0IY8th7pcyMN3TlbTskBt6we
X-Proofpoint-GUID: pSZpTPiN0IY8th7pcyMN3TlbTskBt6we
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfX76tPPmlLHJcP
 OhlNV2cGf3mDIxOIhFdZA1UjISGmPA1DlxtSC1PygpiMjysrewHN1j4jAUTwiNHkORSMuc+lzPY
 ZKgxXRiqdxeSl1V5g9xF44mbSmQxphY=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af9251b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=G7n33azJLpTFfIg68gsA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150013

On Qualcomm Nord, audio does not come back after an ADSP restart
(echo stop/start > /sys/class/remoteproc/remoteproc0/state). There are
two separate problems:

 - The sound card takes 5 seconds to come back. The q6apm GPR service
   probes about 0.5 ms after remoteproc reports the DSP up, which is
   too early for SPF. SPF drops the command without replying, and
   apm_probe() waits out the 5 second command timeout before the card
   can bind. If the card binds earlier than that, its shared memory map
   times out and the card fails to come up.

 - Once the card is back, playback fails:

     pcm1681 0-004c: Failed to enable sck: -6

   The q6prm clock controller is a child of the q6prm GPR device, so it
   is unregistered when the DSP stops. Its consumers stay bound, and
   their clk handles are left pointing at clk_nodrv_ops. In addition,
   the DSP forgets every clock request and vote when it stops, so
   clocks that consumers held prepared across the restart are no
   longer running.

Patch 1 polls SPF with a short per-command timeout before q6apm
registers its component.

Patch 2 makes q6dsp-lpass-clocks track prepared clocks, and adds
q6dsp_clock_dsp_down()/q6dsp_clock_dsp_up() so the DSP service driver
can mark them lost and request them again. On its own, it does not
change behaviour.

Patch 3 makes q6prm keep the clock controller device across DSP
restarts, parented to the remoteproc platform device, and calls the
new helpers from its probe and remove functions. No DT or binding
changes are needed.

Shawn Guo (3):
  ASoC: qcom: q6apm: Wait for SPF to be ready before registering
  ASoC: qcom: q6dsp-lpass-clocks: Restore clocks after a DSP restart
  ASoC: qcom: q6prm: Keep the clock controller across DSP restarts

 sound/soc/qcom/Kconfig                    |   1 +
 sound/soc/qcom/qdsp6/q6apm.c              |  50 +++++-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 147 ++++++++++++++---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h |   2 +
 sound/soc/qcom/qdsp6/q6prm.c              | 190 ++++++++++++++++++++--
 5 files changed, 350 insertions(+), 40 deletions(-)

-- 
2.43.0

