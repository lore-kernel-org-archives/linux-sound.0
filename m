Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24A4D9F69
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159935; cv=none; b=qkrZeeC1CXcAJ6xtzGTwSNi0iC945E1gCbNHfWYI93EJ49mGsonmFYsL+yIOHOYHCCn4GxiQLI6r2uFZkOFGp6mj+qJml2pcj1GPl+mbKFnxZdxo8nM+0vdoH+f+fXVjoVDRQNCifESyUNITkd7XU0uYNA3SvUlKR5AEa3xnx7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159935; c=relaxed/simple;
	bh=j7d1Iwmc1nnbCs1Z7DoVwKKeYm/LCHvrRylj1tJCeTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IY9EJtthteavaxIpunhA9V3NJY6/q360kbNx24G2Vqk3G5F0dhx4Ka1zwzt5xyEIGhhRhZDcLTxwGFoqxWtHHTfASVkhUHRZiHezlwfHUwLYfed0/DvO/PHJOAkKCeWAVPWVnyLoqmsGfO/Pitif6ZTy4l5J0Pn/K1BxVoHua9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNiA4wSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjbfvX9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNiA4wSe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjbfvX9p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5lvJ996930
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incg
	cAnnUw7Y=; b=gNiA4wSewFnl0QFVXsYWju4qBVyN8VkMqgGAuIgMzTtFntcfCeh
	/pxxPUpsyqzX0j014wgXuXsJKu+Tqlrwv3eIIDPhXt3imQe0+mVC7Enh1Yv+o1uf
	EGRdCYVe5Yo/FVmkdOsx0qZsu6IaE7cUfDXMfPlreIwaYYQQNjwotlq4XLT1T8JA
	YbtajuJgDRDoYQUak636LNlg68/2JKtarzUqZrchzD3+wLVhofCZfRO+y6i5Q9DV
	p3oP1oWWa6XgjBVqnXuC5i1sFh7VVrtPIJieEr/UdTN5inkHr2fGCIFMNyBCoE11
	hfpc0ABNAqlYH+f+qFjGrgdRMtmV6rd2QNw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjta6v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 14:12:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so13251876eec.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792159928; x=1792764728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incgcAnnUw7Y=;
        b=cjbfvX9p2hhkWrTNxZXplJXzOaET4vEY88ON9XzQkr4I5vO7As5Pci300F1rhI3s6R
         8kADFjgl8kewNr/dhm/C2SryMnCZDfUaKR7Bu9gJ3AVMLsO4tAu8FoqCMveW6mT/Yv5x
         WqgOhz5BwuvhSSUgIOlpZwgZhS1ApeMIHZHwsSDI/mpQRhnxlvwq1zGRsBvFb6sEAKfQ
         smCHVa4fokIVVNchEOvmPQh7L5hrahWHl6p9Ms4Z4OtRO6qb8/bKpAyEgXN3Nqs9Qxbv
         giCwpcW93HSGql4hHjVTSgnvn7rgcCWtzkqqOX04ecyuQj2rLJlLnPrnZMOBIY7Xa2Nh
         P9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159928; x=1792764728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UEUDS9Ziv04sArmUXGHQtb297biof8incgcAnnUw7Y=;
        b=QK+PXUqsTqNAO+Q+ssNRxjfVaqBaL7MwX3oeC+9b759g0ZwR1nBWcO+hh27tc4zPj0
         a5RSa/PlBxYLGUXII/hcA142TFSVWsswPV/FrZRCGYRaCeIXmQXB1V0ygwEV1vuqknG8
         oy7TORt9l243t0//LbauuEbdVLcamagxDuHCSi34y5cCh5tRHYuRRQ0Q94oPHW+qfmKg
         vx3NVPE0hSYoTbzjRLgGVwwLLR6KR3WeQSvTLBkGj0XwrHUY1A0DdMCONtEoUNL2hy8V
         SlaRfe1IRXTGeEkS7+TVgRc9UxVrFHTsano+pJ39E8wwjC8T1zReOiWtWQ6ocfGqraqq
         vj5g==
X-Forwarded-Encrypted: i=1; AKwUvBzyO31p7gtd6Lu3JJcwecBSSR+QCPWYfltiGlbt96taBOC5Fa0IFI3PXe3Rh6P2eyLK8U/zU8n7G+MP4A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhuko9ERQgjYkTTAoZ89xFfVJcn0xw9509iohDRaAmjxak/euj
	I4Gn3rhoXoCIwTr5dfE4rKq2XE+GnXy/4lDEBIdkrT3H63Jh61Em9BGY398dkr6FCtJT9lExtl8
	O1EbFWHXxwa9Um7sQWcyH52KkZBmCYJ2qQvk7kq4MKQywloYWu30UsyD5apRLkCKyvw==
X-Gm-Gg: AYBFou18YhBBvWDriTaDu5+g6Etm8YWxBsivDQCChKwnH841b4Ky5qZ8VDx+yMKHuLv
	4LaguTyfBZHr09HrxZEzsp1dJhEHhgPp5uE0ueTxuAkL7d5bc1zctoBdTpZJQGGiWax/18q+nLs
	bgUAn8gF5gF4enJ3Brib+cQgDf/LVMhVBDWKLAILNahNN3SLyDwY9keUc+m7KDPReDkK/Dz6au5
	e5GMKSvQxIxDk0MaR7HqxIRQzeXU+BtCyYY2Nc2RXc0j+uLzx468Z27OUwlHWg9F9967A4ecIT7
	b7SpbsorVhzLVEawUKoQTEf8w4oZeOzMslzdEk3D1qq57Vukre6vkN9LV/afHFODBAbfivIlHvj
	I9LN2u7VIuRZ4RCK+CfrJWYZAGbYg7tVJe3acytIPxQB6VnEUJt2RBjUzQGU=
X-Received: by 2002:a05:701b:2807:b0:14a:d8fe:3390 with SMTP id a92af1059eb24-18512e25175mr59608c88.32.1792159927949;
        Fri, 16 Oct 2026 07:12:07 -0700 (PDT)
X-Received: by 2002:a05:701b:2807:b0:14a:d8fe:3390 with SMTP id a92af1059eb24-18512e25175mr59585c88.32.1792159927275;
        Fri, 16 Oct 2026 07:12:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm6997682c88.1.2026.10.16.07.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:12:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] ASoC: qcom: q6apm: Fix shared memory unmap
Date: Fri, 16 Oct 2026 22:11:50 +0800
Message-ID: <20261016141153.1346219-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX9i7RTm4QGJDt
 vZkjD2b29mjFXUxboaUJj/mvTmIPqwsIATP+z/DHa27oPg8oyvejTObft7z4NO9iZT7oHN5kd5b
 KIWSfxGCDgbDsSZWRVr9s/yS2qB1Hi9HXJlwidhGR0ghlcqKNoOEy9rHgmknWjOp0VcN0oy2heQ
 XXMAURGFM/juCTPOOh7BmfoyVV+/s82XrrKy4ONp7f/MAM4nkLA4XWZZRBcwcwwYQc5YIgfxhl2
 Gq2PQpDKXIfHgnAE3+gN10BF+5YZCMysUtaVJu1UkIOehqa6oOIl7PuRJSGSCz49q/QlBVa1xOa
 VolhmFwWNLpEi4WTE5AYf9kYMQYfTY37SOkkGjXUf8oAeD11w+NWQqZCzhVVOyfcAEklg+iIlBm
 5AlJaEFiPI6YSjG3iEJKo08QioGkY+x7pUeY033uAPB/twG9CiutKhltwkDER1sBBwuSPk7YAGs
 ax07XXJAak2HP0hSQjQ==
X-Proofpoint-ORIG-GUID: cewJftnbL6_z7oi37H_rj7D8_3FAQJ9N
X-Proofpoint-GUID: cewJftnbL6_z7oi37H_rj7D8_3FAQJ9N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX/NTAk7XKciT+
 2kpQ1esIOVGMjb88VWOnwNX61w/X8Mob4EUrz5WcduPFa2qNqXULAzFjLHOT4Ldl/fFG7McF38A
 zYOP8rYmxLw8YtDcZ7B4S8hMvpetTHo=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad230b8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=jKFkqTp6JJoCw1ulDCgA:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

Since the early buffer mapping, q6apm maps a front-end's DSP buffers
once in pcm_new() and unmaps them in pcm_free(). The unmap side has a
few problems, which show up when the sound card is unbound and bound
again, e.g. by unbinding and binding any codec on the card:

- The card core removes the components before it frees the PCMs, so
  the topology and its graph info are gone by the time pcm_free()
  tries to unmap. The unmap is silently skipped, the DSP keeps the old
  mapping, and the next bind fails to create the PCM:

    qcom-apm gprsvc:service:2:1: Error (1) Processing 0x0100100c cmd
    snd-sc8280xp sound: ASoC: can't create pcm MultiMedia1 Playback :-22

- Once unmap is actually sent, every command stalls for five seconds,
  because the response handler matches on the wrong opcode:

    qcom-apm gprsvc:service:2:1: CMD timeout for [100100d] opcode

- Unmapping the position buffer clears the circular buffer's handle
  instead of its own.

Patch 1 fixes the unmap response handling, patch 2 makes the position
buffer unmap clear its own handle, and patch 3 moves the unmap to the
APM component's remove callback, before the topology is unloaded.
Patches 1 and 2 go first so that patch 3 does not introduce the five
second stalls.

Tested on Qualcomm Ride board by unbinding and binding the PCM1681
codec.

  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/unbind
  echo 0-004c > /sys/bus/i2c/drivers/pcm1681/bind

Shawn Guo (3):
  ASoC: qcom: q6apm: Fix unmap regions response handling
  ASoC: qcom: q6apm: Clear the right handle on pos buffer unmap
  ASoC: qcom: q6apm: Unmap DSP buffers before removing the topology

 sound/soc/qcom/qdsp6/q6apm.c | 49 ++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 13 deletions(-)

-- 
2.43.0

