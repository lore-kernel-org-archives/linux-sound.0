Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1A944C644
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116540; cv=none; b=ohue85rnps3n4rLskK+YKTFbREwqFvafDi4I8XQIpCbHPWypInwABvwaucnx5EQ+lLO6oxeqIXN6ATA2h15kWqV5q4nTkbCboHkNlC0cUA5mnuiXOOOF8+0iQEqCaiYS476Ew5oeaHcgWgjZVwF8cEnnppL4OF+QhuD09jC12vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116540; c=relaxed/simple;
	bh=hQW+zdN9L13i1jyldCVRrfULGZ9qpe14prmnJtneBSI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IW24PHBXjeqsq/RHPmXcdvqO0yuNpaoRRJKZNzttYqi2ObJoLZ7G6T7zhL1r2KvijoV9SjfLo8gEld4ZZBl0y3HezOckP2jhMvmMgelNyVr//WczCY7b/PM9TE7ep7IeLea+sE2vSeO5fOgZ3+ykTwRxuMwOH0O4HxYwzv4RNXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/vKs3Kl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=doTWL/o4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/vKs3Kl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="doTWL/o4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcq633339245
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XEunTC2/bQHTMImEtBUTho
	Ace5fUIhWoLhhWeTNqzww=; b=a/vKs3Kl6BKYvKjK267rbMPqVmsLFZyZAy2C7o
	x+bH71ovXjO5AUQjyZkU+4IqaoB+t57QCbf6exuwMdoCbp32vXzF3nZEq/HpBBEU
	kfHx+uG/IucHVkTgnGwcyjJyravZ8jhArgWQHtNBJhgdgrBELuGuFmB/vzArPEZg
	iJ5K6v2+KH8u54UyZFKKLgoQ85A8BNzpj78pLtZeMKr1GjYgRmA1wWGyDbmpCXx/
	B7uBPuzSuLbitrvOwU1EObMFfl/cOOaSQEBsqnyRWl2VvuhxqOP1AzB1AEn4a0Tm
	mogP5ePEv5pAwFcxiYltcPMPWtQSOXECaskCaV6YGgQVy4Lw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mkhmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 11:55:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so7304919a91.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 04:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784116536; x=1784721336; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XEunTC2/bQHTMImEtBUThoAce5fUIhWoLhhWeTNqzww=;
        b=doTWL/o4dcw8ssTv1pj0EgN9WB+rQy40HeVLqJMbqkJnTnF2qRFGGWc5uNY6Fztvcf
         bN0cn0OlJ2QugB3EuGso/YpPfN5+HMzQ8ZwqYoPitzpl2qzoigNJJ1rtvpcC7hdqELue
         HqGm6oVtuE5+I0XbUIqTuL1P6BgboT+tRlIt7wF2uuyd7sB5vIBxMGNdozGbSq3XUROT
         taXKxWRFnDIOqYN7HAsu3LwJ7w0I36XNrmaNO7yjwo4WoTqWJ8TXk6NYAtxIzi0vcBVb
         uDDaDIw92pcV7gYla8utNm9mkSCJVWtQXZ2CPe+iJV952PqiKJFjYG1Pz5g3ULz5um1X
         u42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116536; x=1784721336;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XEunTC2/bQHTMImEtBUThoAce5fUIhWoLhhWeTNqzww=;
        b=cbpZy3kqLTBx5UVBmTlnIoI6ajzPqu5t+JYqHMruulyLXhMKiu4CMAOXOiDC8/2BR2
         q2xYzV99v74cbQo3Qqyc+S/vikMakLy+GOxBaftEWh+DlXp9vr39txuvHWjY55Y8eS4Y
         emWOGCiV2XDQkl+/t1de9N30jRNcqmqDn9fC6CZq7p18UPOBCfVZOHFq7Z2wIgIgJmjd
         4p6bG6dc6/kLrgXwTcMMt9Ww7gDA0ZB3LB0Mb+fdSbr8vMndj+SssU3diS0Ht9CjyCu6
         Jx3HADKHOkBsRE2XWrcA+6cUGFpPOwwSxI2zX19PKiPjAIhieM7oN5sCxAXhmoi8JhGu
         8Exw==
X-Gm-Message-State: AOJu0Yz1uMbMpULgCN6t7Wuho+PjtyJVysBkGBvI1oIDl8njZzf7p/sX
	ibdlPKF9keB+Qvy7iXjLslUUvzLaD48tuD7pr5X4JIIlfsN7gFQyNWHm85z/r9IsmabqoCO4ZTS
	/lkgT6eYdoXDFGteJfB1xA3KQL6xCp9TSOHatRY11divdmdy6gpoTVVSdJfI7wQCT7Q==
X-Gm-Gg: AfdE7cngDN/ZPTs8EdP8udlyDr3d2+K9g5WNxWV3pPpU8jlBnXf9+FNM0UOg1QaoPar
	hFnu9sx6vH2Rc6y/Fy13zI89/jObDhUgKS4Efv8EyMO/GspLD6C8Vvw/W9CUVnViXqt5Xhyue55
	r2Rla/52CQFeW2ATvsv+XhwIu9C3k+pEKQfrhYM5PqN/Dp1MGxK2yVtLyAp4hVZI42FW1hC8dAc
	sLHoQHJmdxECld9CEoGAhq+l3T9s7fY3fBVzJCGQwFEQk6lx5J96VAoa5hU2csX51EtQa4l4JVd
	GxZMFn41JvtgeCcWuJiafjKniQjOm3QnGyi96VWvaT6CanqUFW1bC7VszZ5qtOLZMIn9TD2ZTOd
	0knZ23FjpBYNkAIeKeEWykMdhaFKHZhh5dlEb8HA=
X-Received: by 2002:a17:90b:1c88:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e2a088fe2mr2315299a91.38.1784116536451;
        Wed, 15 Jul 2026 04:55:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1c88:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e2a088fe2mr2315286a91.38.1784116535999;
        Wed, 15 Jul 2026 04:55:35 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5326c0sm870683eec.11.2026.07.15.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:55:35 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 0/2] ASoC: codecs: lpass-{wsa,va}-macro: check
 clk_set_rate() return value
Date: Wed, 15 Jul 2026 17:25:12 +0530
Message-Id: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v2-0-16ca64c2b929@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACB1V2oC/42OQQ6CMBREr0K69pMWoURX3sOwKOVXqkC1v1QM4
 e4CXsDNJC+ZvJmZEXqLxM7JzDxGS9YNK2SHhOlWDTcE26zMMp5JXooCJgfUgHYNaniTgqhAdw8
 gDOBVQBBGSiVzIYv6xFbL06Ox075wrX5MY31HHTbt1mgtBec/+4Uott7/a1EAB8N1KY7G8DrHi
 yNKX6PqtOv7dA1WLcvyBUyx1L/nAAAA
X-Change-ID: 20260715-xo-sd-codec-wsa-va-clk-set-rate-1f66a64165b9
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfXxJ+VMb+b8ECw
 GSJJxpZW2jkB2Vzs6qIKJArP+mpGZ4goApyz5ZyV6o+EQgWm1yGhT18Bcf3Pd2E9HZ5IjQJ2j1t
 wqW7GCp16KAUVMOfqvsX4tHPyNAWYnj3nKDP5XwEo/Fx1X742Lcp7WVSKbbhccoNRGtHg9I1CzP
 F1d/2FRiffytNJuUOGs/cuGoVM6wBhFYFdcTbQRmu6nf0blIZtGe9af4o119DHlh/0po0bFVPEz
 Xppuzqj/PznlAupe3TmilvFvPlzareSA4Fn+vfV3T+6OMZG6dl6MqZSD4cloPEkELX4uyBqRZ0L
 9JwVpGgI0QdLtQ0MInSvwQ4ojMUdwMgVH22CUrdlBPs7NkjdCUI+/lB6AOUVVgPGHazBs9JTsb6
 Ie87UGxGCfaTCMuCodovO8up1bOMHwKKSS8iL4ihr/2WZJzvwUnMh+fmdt7LqHVr0n1dzpO9sKL
 LAqNpthG61JESCYfLww==
X-Proofpoint-ORIG-GUID: Vs5DOBpwA7AxG2TvgWnucsqeVrCr-Agj
X-Proofpoint-GUID: Vs5DOBpwA7AxG2TvgWnucsqeVrCr-Agj
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a577539 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=2hB6ode7iKseogbFr_UA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExOCBTYWx0ZWRfX0K7U/Qf0+wX8
 kcuBKSSvd2BbdTvfOr4Z7AS1dE//UPn4If4N15e0L7A2MCEDaD2ukHD8AY5/8s87rfCdLMi7YVk
 c3UO8MyJ3uwupiE80kMljGg7F25mSDk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150118

clk_set_rate() returns 0 on success or a negative errno on failure but
the WSA and VA macro probe functions are ignoring it. This series adds
return value checking and bails out of probe on failure.

This mirrors the same fix already posted for the TX and RX macros [1].

[1] https://lore.kernel.org/all/20260707-xo-sd-codec-tx-rx-v2-3-f61b4622f97f@oss.qualcomm.com/

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
Changes in v2:
- Use present tense in commit messages
- Carry Reviewed-by tag from Konrad
- Link to v1: https://patch.msgid.link/20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com

---
Ajay Kumar Nandam (2):
      ASoC: codecs: lpass-wsa-macro: check clk_set_rate() return value
      ASoC: codecs: lpass-va-macro: check clk_set_rate() return value

 sound/soc/codecs/lpass-va-macro.c  | 8 ++++++--
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-xo-sd-codec-wsa-va-clk-set-rate-1f66a64165b9

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

