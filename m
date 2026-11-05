Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877077;
	b=rnPG5HEE6XG2z8ACMwxm1dfeeiikQpAyOAw5UEUg4HyMqwenK7QTZx1Pf3dHTaJnJxEB
	 mQtlDpcURy3AG9reN7wFeBo4K5OE8Umya1mTrbArZUfJ9oI1cTT4POTzjurj/6ASv3Gk0
	 QrJfaKcRoJ1jQYvd28DVR1XWIbEjGQSW5DjCt9sIMXKZgQiFbwekmBHNU7ytkh5sGkOYB
	 uiISuEXVC+e2dEB3ZGHshCxLHM96GVILVAvp/AaSiwN9T3VAwAQee5eDMWbNaKHA7rIpB
	 dlIa3JCea7ujRQsp3rfbvfaSq/h6kEPoSqKqnLL8ocSmaIL7LyIOXQEdxSfj1Q6KZ2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1OJRD81mFwvYHvL4ipmbVdlvEccfOcqryzIVSzhKaH8=;
	b=hNdrHqI/sFEkBaaZNionvK9UsxbPUZWhwVCw5fDIiWbx6Zq1RUlg0FrO0qBswHHk7tFF
	 Yd8h5TH6IQGzLJ9irsw5pbJeEr06qz9+Ekr8bcZHBt5UWo3HA2YvYvZf4lhxm+4E0864Q
	 VQJ2qQHVol7rUO5iydWlHp9N+x0VjDXFyvqjaqhcubPblySzsJ4iJAvjcwTGfC+ibSNzl
	 toQ/PMZHJoSd7NV0WLCs2bjEbMEKQ7zZ2WKv5BuqrqjswSwZxtE/NW5OF93lMMm+3Efpn
	 +UO20J8iOq9TJI70aOwvhJkt3PYb/IkVg9lyq7t5+iLLep+detoSJ7QAMq9LXmRjObQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UFJ5t5pI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2lkbzII;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442DD606A32C
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 11:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 442DD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UFJ5t5pI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2lkbzII
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3LWj3193490
	for <linux-sound@vger.kernel.org>; Thu, 5 Nov 2026 11:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1OJRD81mFwvYHvL4ipmbVd
	lvEccfOcqryzIVSzhKaH8=; b=UFJ5t5pIzl+lwd4pX13xw6VXWbLaSb9Rn0vcSj
	olEr6DSfbroeTS+U/lkAMnSzEnrXXirtAfQWp29lZajI2v/w2nllQQGDtXXQ72JY
	nMYQvU2sG5myJ8JmAzCAADHQHLiIPTxDODtN4XjvZ1cdx1h5S571asikNmAas8AK
	/cDCfw4H+DqO6OkosqiMnPh0DULoYOpwGH23mkPXp/hBV80YtMJbtmsy7uSqroa1
	p3JV2iGYSvAxO/w4IoQKmzLjBvYhO6Ixt0mndP8IiS1ZqT8YAOLMngl48H924V6H
	QGrcJO4hrk3stjfYeNXxTTWVabIWaNjsbLcPK6LKf90DnfBQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdr10c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 11:11:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so1033816a12.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 03:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877076; x=1794481876; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1OJRD81mFwvYHvL4ipmbVdlvEccfOcqryzIVSzhKaH8=;
        b=F2lkbzIInSnMvyhUZZTLl1owrZAXcaO0tva0Kd0WB5JfeiDjwCD29UXbGd63TZbRGP
         hd6ivQbU8sTLbyQoijWUuzDW4CGGMf6DNjWsRrl1A0dp9PJgH5EEYl0w/s+aNwA1N40Z
         Lo/m4F7wOMTTm3dQrZpzeWwRJaiGKcULfxnujOmWTD6OSLDb8vgACTQOH6amj0UUaRGt
         3tTPrmDxdrmXUlykJRmt2gb6UgCD1bhMWBLbO8L6O++KOrIXVRmikjH4B34OYtW2qAZs
         dIV0pGaHAbQwAUx1YuRjE5gqKwxhfo6f46i+HZrcc8q5vV77VgfrWyfM7sXXFH40e9VK
         jHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877076; x=1794481876;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1OJRD81mFwvYHvL4ipmbVdlvEccfOcqryzIVSzhKaH8=;
        b=eev1jcDHN+tGIPIiJ17DTtbsE3Ue2wdS9QqiGh7/FH34Yy/5+pJlGEE2KtPkVXonP1
         pFbvcjlR+GFIkgEMK+W4tpoLKynmh2Z+JgZ3nNjdAyj0/tVLvpz5aVRdrI2FdS1EPb6S
         bs4yFa4ir7ZZ3g/+Fnubkv2AMbhafX/FfDA0pZxy3fz22+RKH3GksubKe1C9Kj6oOeLz
         +my31U3h1kIrJYyv1mKwR9G7RnAgzekqIe//1Vuqv0JBSAqrI2hdfZt8m29gPPQ9VzZI
         HEMTeYmrTA2WO6TjOQR49MghF+O4MgObLNN9/pye7Y1ANPXCdz1gescUyYmc6qU7E8BK
         rLeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY3veuUxtc4/n01w8BEq3Bw6xvLw8td83TKprA37SFktTX4SRB/4N7coh7mb9cjm2viHYUaACUcBo+dw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7MIeif+7y4uIzH0RZj7DgQlwS3PNWHStJQ15v5ZvXfLnP4cAU
	BjeVcQaUPvcUS5EJN1d/c7ou5YYsyW5UFzUtfoNTCxlTOxu+MuuvWT9e3qNHYZuI1tozPocnMGg
	dLDpRJAUEnUtcK8my30iT7Wpl8wKtIP8KwjCZYQlJH8zCFinOybiJ5jF7vvdN2cn0RA==
X-Gm-Gg: AYBFou1RcEbHlfi1uCFiq5w42+UY2aUUXMBlRs2dp7zwRxp3JPi9dA9nbe/v+MX72sL
	OBF6P4sRojUlc/78l55utHECgBQaO7W/S+7zjQov1Hv989rmdJYkNSp8sQaW0tLgtYEeN9VbGhW
	T7+G/yqe1RLQt7td/U9SqE8hafA0xp/abuMwRz1prxk2pIyASC72XEQYi/NuASXBCCeheC4dH1n
	o1VVGgzGW8pUBEfBwHz9+x6ccyFhxk1JX9bYjT8EsBgLpzNH4qOk6yezsajvmeclXpyzcX0MY+3
	wPxBNOvTUEra98bDVeVehRhVnQHi2dD+eKJWom38KfECP56pVEKpu8vHOBSknhQ83GeMv+YOou+
	4tzwyA8lwdOv8IaH8Oe3X57rxOvRE24xep6lBHu7N8fpi5rCV1RByrn/5by7XXCOkAhsf+5dmUM
	IUGXNeIJCN
X-Received: by 2002:a17:90b:390f:b0:3b0:a4bf:b90 with SMTP id 98e67ed59e1d1-3b0a4bf0bb0mr2982063a91.20.1793877075563;
        Thu, 05 Nov 2026 03:11:15 -0800 (PST)
X-Received: by 2002:a17:90b:390f:b0:3b0:a4bf:b90 with SMTP id 98e67ed59e1d1-3b0a4bf0bb0mr2982013a91.20.1793877074889;
        Thu, 05 Nov 2026 03:11:14 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31a3efasm3384737a91.9.2026.11.05.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:14 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v2 0/2] soundwire: qcom: Restore and fix set_channel_map
 support for SWR master
Date: Thu, 05 Nov 2026 16:40:41 +0530
Message-Id: <20261105-soundwire_channel_map-v2-0-5efe2021552a@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFk7GoC/yWNSw7CMAxEr4K8JlGTlvBZcQ9UoTR1qYE0ELd8h
 Hp3EtiMNOPnmQ8wRkKG3eIDER/EFIZk9HIBrrfDCQW1yYMutFGqWAkO09A+KeIx3we8Hr29CSy
 7ptpoV1SugfR7i9jR69d7gIeG+p/x1JzRjbkwUz3xGOL7N56gzOadwuitqpQpS7kxZrUWSvjQW
 +9tK6PtSHJv6bIPzPI+2asL3sskUM/z/AWnYd/50QAAAA==
X-Change-ID: 20261105-soundwire_channel_map-e3fb482c04cb
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877069; l=2402;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=yEk84d9YWCKTyA/doCJLWy1unHQD/uGC5BtKbmJpAvk=;
 b=LpzV9+AxRvewjKFdBk6/ANHs37a5BeDXsqi08bauApJyiX5GVoFW8Ymuh1jndLllACP/mibzA
 vhuCTyO+/C5BzYCaeSoi1T3RJkAWhMBfdOhk6K3eLN1q3d6touYWtH9
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec6454 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iox4zFpeAAAA:8
 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=ry3R8fqGuPX2O_Zx3tQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XaHoXRu6beBs5geQWah2BRFhQPhlXZzx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXzzztR1bSSz+z
 IH2A+Sd+OHmREH2uSmA9x1uQqTBWl+HQo6bYaHz5GyPp4n7bK2j02VJsf9VvB8pHHacL1GMLnAp
 tP9BQHF1/nmBNe7HpIhloGdinFQNyRM=
X-Proofpoint-GUID: XaHoXRu6beBs5geQWah2BRFhQPhlXZzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX7YYG1j/6g37S
 /xswXFyswexYlDEV0AYDHBR2JhFnZtJxj2NMnzp02PNsBp1MytURVR48lsBLbuF9rhOGcBE0gqn
 r6SLcW0fCN6BvdKynTCClRb+db233JANEFXqzbREQybPX+QeCJ3s3Vo8NipoCSSU6elojAtPTNx
 Hhgi6ChXpPeM8594pWYe//kBO5tVM6zg8asXiu4JjDzJbTp2thRRbqAzdpZ9Uqzpx3Ai6hpb0pd
 ckIFxMF0WWhyCBVUgHbaj6cTbe2/n2VIuoOn2MbytyQtp0IPCDU8ldTZAZQ7X9T9Ojr9jtjVmYk
 Taoh8QswJDVgkXaDASAZR+/SY/5zThNuFQ1Hv4ueylBYwC5h58tJxwlVQeNurvobPCmNQd0cK66
 ZEbspvlWe8IuUIGSEGyl0UJgUxDTrgWgSjy3n0a3dOpa9HERDMkRtxlwDg78Fupa7LCyRomgs+x
 y4VV1S790L4/TAqZyoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

The original support for set_channel_map in the Qualcomm SoundWire master
commit 7796c97df6b1 ("soundwire: qcom: Add set_channel_map api support")
was reverted due to multiple issues reported on sdm845 board, including
kernel crashes and data structure corruption. The root causes included
incorrect port indexing, array size mismatches, and improper handling
of TX/RX channel information. This series reintroduces set_channel_map
support with a corrected and safer implementation, and fixes the sdm845
machine driver to avoid misuse ofthe API.

Add a robust qcom_swrm_set_channel_map() implementation that stores
per-port TX/RX channel masks safely under controller lock. Ensure the
configuration is only applied to valid ports and does not corrupt memory
or overwrite unrelated data. Preserve existing behavior for ports that do
not use set_channel_map, by falling back to the default SoundWire stream
configuration. Fix the sdm845 machine driver to avoid applying SLIMbus
channel maps to SoundWire DAIs.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v2:
- Removed the set_stream hack from the SDM845 machine driver.
- Link to v1: https://lore.kernel.org/all/20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com/

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
cc: Yongqin Liu <yongqin.liu@linaro.org>
cc: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Mohammad Rafi Shaik (2):
      ASoC: qcom: sdm845: apply the SLIMbus channel map to wcd934x only
      soundwire: qcom: Add set_channel_map support to SWR master DAI

 drivers/soundwire/qcom.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/sdm845.c  | 16 ++++++++++++++
 2 files changed, 70 insertions(+)
---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-soundwire_channel_map-e3fb482c04cb

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

