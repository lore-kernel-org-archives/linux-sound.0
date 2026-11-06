Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943823;
	b=mfLsfRQUCkO/99t+VotHLrD5umU2hKn4W5oPjLWQ9wy/pVK8svD8u0eJWCI89rSKAZVc
	 p0BbWaEbwEeQ4qkg3RpsdiwFzmsmwrBdTwChfiPjEf4RlVzaSeCJD5T3MFUf8Fwj8zZzK
	 F8CXIyuzmf446cGoxnCUadXmK4yq1/lKdpHEnShdOYx4G0bMFtGpNyjdS8oyFsxTM1sq8
	 0SU+hhjUBfj6Vm4Au9YlQ5i7Y0B+8LqonlSrgwVk3IOfWOml/3hfDuz9IoYhJYjYcTSGD
	 5kl4kl1UkBAxZDyzej+IN6MrnxEonuk1mollrpJZeKFO6WlYkHKua0x7xZEP88mHaQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
	b=dxPnxLXqPjn/U44k0fqqcYwZb1Zws7DTqoJEgX3wbM1Yr+DzmJAwR+RL1KyPxwH8ZnPS
	 r/320zl/kzAgBAt8ajiofxXkOfwnaNmVwheZcv5/peAtuBs/imcLE0bzLA8XNVJhAhMSa
	 xXqLNL7epM1vbEpFXRu+fgrw4xtKfiqKjwJnluUeFQvEqmweFiYtHDlFSh6YHJUOaBjlL
	 yVCXhy0yKS1xtJc/fS+8xKMxoVimthqbdmnxY4VdneLQi9OddsSayaJzvnH3wZTpavgic
	 pqj5eEd2qlbGK2TMUuqCJ40H3eMO/cfL6IFxcrTJIL3wgo2OIoNgcQ00/8sSCHWmXGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LpF4AnT9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xlx8mvRQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A64E606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 05:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A64E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LpF4AnT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xlx8mvRQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xuXN3775367
	for <linux-sound@vger.kernel.org>; Fri, 6 Nov 2026 05:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5
	p8HUJucI=; b=LpF4AnT9qfz4uoICQQnJbcr+VttSjVrZKi03KtqPSrsPeQLU07q
	BZvVdUdbMpQPaLKJYa5lfVRAcOxpo+uka74U9fSNLxM5Q5xRvAo6hNGnIwg49zoX
	m1r1udMMaM323hPKhiuQ7ObhFIVr72rZY/JeNe1MJAU5HaV+UBhp6hSGxY7tWdFu
	JlV89MTS51CMf+NZjrlhzwrhbRnyp6n0Y2EfHb9g2cnldvc/zlqwmBnIDeVV7Ytx
	E0tj6N0JPetvkHrOMM4640DZKAJaS1uQu4IY7DI3Ezt6RSVJoYfQuXzh3OBq1lor
	1np9rwBN9I9kFJqxEWLKZvTyoqUPzwj0JWQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9s4q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 05:43:37 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a88d53c7a6so3239247b3.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 21:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793943816; x=1794548616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
        b=Xlx8mvRQaD6ABKZa16oTBupzF5Akjkkh1XR2v2JcpXC7ODruaO8hi+C9yOf4bkbXsu
         8pq12jh9fJ82ocW+Hy39Goo9sGnd35jbE9QgABNtBV3Kd5HrO1ntmlYdIWr3Z6rvOlOT
         bR0cZ97ENEr7SrcTjuKOXFsU/lLsb3M/RzliWz7vlj5h/H2EZghMPur6ofqjLkSWWgyg
         QbgeIkn+7zBio72hCi8Jgxrqi5uQEU23oturoE8TQGhAS5M9ZqqgVkXpufQ2unsGbX2x
         ODF6BurWBJEw0CAEZ8nis0d9stTJIIkt9wVx2OuAenzZ+/tHRAMmSwq7Nr5JFLq/+XkJ
         Iv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943816; x=1794548616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLZ2qq0SMM/jpN1DQFJySBn7gK2jN8dBcZ5p8HUJucI=;
        b=RZjZ/tsXZrvFV3AtVK3SBR/pH5WkDaUEGbOwriZEj62BTT7ghh1XZuIJIyuKWbdjxm
         osMaShWTw+cMNWQTQAL232+ZwKZMHPVgpJVH3ry7DQ68HZ6bSZimuxKN/zsYPyp+EnJq
         oQ2IGE2PQ2B8xHwpEeqXHlo9W014bKUIaPQkF5LrWzTpDCVff57gVC/tIlxpsb+NFllu
         WKPhBGPWAhhiFyTTX3jwbm1bDjDXTphr41HNKb2OFJRZ5NJ+vkLSaNThf0cMaOqoBsuL
         IXP+RyRjibVoCaMOLlXPf1GsvjpV5zVXyJj6Ymgr8b/2Or212zd02Ao1JoAkPhblrBlD
         rbog==
X-Forwarded-Encrypted: i=1; AL+hErEJ+Fbk0Dt1JE3zjI2Aa0eDQ94Vp5gHJzR2g8lTx6rfG73tqlJNmxGAWvUKTB2hjGj8svL07jaF6KsjHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8A0SdXtjrOC29Lm0BW3lfLjupPwcJ51R0SJKD0EqLqjeladw/O
	On0fhXGQNKikrggr2+N1a+wPPgvfp8hnAHmL2zyWqKBNRpv5QjqH8ilF4qd7Fy4ctuN8A00sY/C
	5W5KdAJHlHorhkRFRxABXL9PM2nT+6C3GjVCHGAA37oOFZkNzzbH2ewTAL5kmO83CpQ==
X-Gm-Gg: AYBFou3oITvcMFodHAj8CUrP+eoxFNOdQEFA8wTeyUZxl7fnxyM/+jaFC8n2tUvydzg
	bjyaoZPOi+Mu4ZdZhdh0NUKSqhYn4EwBBdJRgD+vizMk4/EGjbjeDTo9gNJWAjKGbk2FVrZ2Sbr
	C99JpQ1l3iu+Puql6iInrkeodvOdW9ESAQsJteviW4vQeI5Ls0kmhHzxLFStHJ6AGZHJPMsBPQT
	slooSPXWMj0M+6HvWzS+rKTQggn+9A4JHL4IdVPqZa3/c4CW3VRViEuw13fsyGcelfZCirpe2u0
	N+PCYeF+nyMsTsTGmnv3jtEA84S3yeehiJdL0TC8vvRXyuVds1tzROnbEyC6UNJlF5+jiIVoNcl
	txxqc0Sz7nCy0WJTCCIbsaxlKmIM7whHQ3QZn+aISRqFlCELlSusNcw/4GD/atSlZac8CCi9aFm
	TFLHlcoD+0NrTL5nAboNwkbccSQZhvX82JZQ==
X-Received: by 2002:a05:690c:f86:b0:8b2:aea2:64c5 with SMTP id 00721157ae682-8b341b11f7amr7066277b3.96.1793943816268;
        Thu, 05 Nov 2026 21:43:36 -0800 (PST)
X-Received: by 2002:a05:690c:f86:b0:8b2:aea2:64c5 with SMTP id 00721157ae682-8b341b11f7amr7066117b3.96.1793943815822;
        Thu, 05 Nov 2026 21:43:35 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f884790sm12162267b3.41.2026.11.05.21.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:43:35 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fix the x1e80100 card after an ADSP restart
Date: Fri,  6 Nov 2026 00:43:31 -0500
Message-ID: <20261106054333.2748248-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX44YFkTCBxdiz
 roFvwmQ1edwLcN9Dqi46q9WNTNW5sGfVdqqbdvB9D8T8pDeTeYaheyxCHOQLtqpVMFSaZr4zRhO
 KanTE1uytFaw1RwCYbYWwcE18Z6CXYU=
X-Proofpoint-GUID: P7ZMwOnX80xhJiQNm59EAszJpBssqcPZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMiBTYWx0ZWRfX+72q2pP1oWyN
 2YtZyF2BmH1hJx9sGmUX+IUQ+KyfD3oKUS/JKptSh8hcB3fD2yIg7oBS5WmeOhPM+DbDLB5pgL+
 xMgBZp4RKGp35vh9NOojjyS7SbY2fUMnZREHVsIRz5UWSgIyBjyXwmZINX5i6QgVA3qpSk+6Zwz
 3SVszp9yAw3QYmgq6bl7TLni+z1jybwz7oU1OrLMGspFbDwothLF27/1Xer5n4US3Y21uJvkAUs
 DxA6B1UF//6lHTCvZC+TT9zVVLM+QxwR+v0VtSGFEEZgdoR7v91ppAUX7XrSJ1dou2Nw3OFGGqP
 TDXyqFxbhV8NhfOUAW5tmgWK2rvwoaXJlU/eKL8yqBEMBC7L0kGb7TBFZzmUTIZOG8j2uXGuZOG
 F8hq7dY5cCtW444ylyZeyaTezNrgdYhrIk7x9QJARXV14356XLW61c4zvEkZ6U9Fd/ioLKtfqoU
 HpKmV/qWLud0n2KrUjg==
X-Proofpoint-ORIG-GUID: P7ZMwOnX80xhJiQNm59EAszJpBssqcPZ
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed6909 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ahqmK09zdcNxaaV6BQIA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060022

On Qualcomm boards an ADSP restart unbinds and rebinds the LPASS pin
controller, the SoundWire controllers and the codecs, and the card binds
again once they are back. On the Hamoa IoT EVK two things break on that
path: the DAI link names point at the SoundWire controllers' freed
strings, and the headset jack is never recreated.

The speakers also need Abel's reset-gpio parent fix [1] and the
gpiolib-shared follow-up [2].

Tested on the Hamoa IoT EVK on next-20261103: ADSP crash idle and
during playback, the card comes back with its controls, the headset
jack and working playback.

[1] https://lore.kernel.org/r/20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261106052851.2741296-1-tyler.baker@oss.qualcomm.com

Tyler Baker (2):
  ASoC: soc-core: copy the DAI link names into the card
  ASoC: qcom: x1e80100: recreate the headset jack on card rebind

 sound/soc/qcom/x1e80100.c | 18 ++++++++++++++++++
 sound/soc/soc-core.c      | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.47.3

