Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4FB3C0A1F
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417423; cv=none; b=DiJ8ezDFdjfvZMkSR1r1DgsouglMXSOiTJj5qwUf/vG3jm+CCUExBzbeDsQER/YAi1+WErmnyGu9GeKX3pDICaTCzSZVIMIl6D0RQReojn5E5KYwhcSoWWHtDTZ1n9xMTSlS7qBzlWJPdCB012gMZ9K+W0pJBSnJlmE1wEyaFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417423; c=relaxed/simple;
	bh=4Fy3CSL54gYiCJmKa8oBEYbszLGnUYvil/68csoAwjM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ofgCrPzRFhaKupzcU6kYz3V90gSfYI4QaRrFlG4IPNWQKGZc75wm2JSrrgBhWLApsFhijhFu815TJE3kykFNAdPc5VYaRMOn77z7mjYSx1rqNvRwJKxpKJcsr3gkUcco8PKaaMvRYydlFBDFNYqbus7L9qXjH3AwJ1CTFJAIcVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGV5bNOS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPBOKwEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGV5bNOS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPBOKwEw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dprt3243524
	for <linux-sound@vger.kernel.org>; Tue, 7 Jul 2026 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3Od4HG/qLTjM/UZgFQkeX
	wBKwUP2ZxKlymNqAxPTAI=; b=pGV5bNOSYr0658vj0hejsZGYbFz3gTqotQ/+nu
	j+fd/p3w2Gz4tEqlpbVIMG7GSu3KCaJfeiqjAo1wqYf6ISbC1hIKiRQIC5btk7V0
	5hphU9w/yqhXWBAuLkzQk30Zv+f882BjHaolF9KGtNauocU9mpl1VQkYS5x0GKc9
	/mv8++RAXnOg6yL6238JvYnqndJa4PXtdoR3eCF90ChNJXgBg4OL/nNlGjCYAf8E
	C9uSmUCEVXQy93XOJ2WUrnxH6uPdBYtOnpN2aHx/C8kKTuFnViYdLed7069zlMyh
	ZBnfNoBjG3GYItuK4nenNv36Yva2EwTbvsaZnLO3y5jrQNPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11rj9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 09:43:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9a700dc0eso34811565ad.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783417419; x=1784022219; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3Od4HG/qLTjM/UZgFQkeXwBKwUP2ZxKlymNqAxPTAI=;
        b=QPBOKwEwfyDZIJfDKFE3leppyiCX0hZiLucjskIl/sKLPwSVrLWFV5rRYaoytHR0/S
         7WIZBydUX85kiOHpk2jKr1esEu5JZb6c3Rw1rJsII5FhC1HCXbb006111SS18puKOwWg
         4YawERgp9EEdjyGT6ZpXnI4Dp46+jnlgqHrZdz0yLucMlVZ021j2RUU3vLTfaDXHinoe
         TmL7MUwLHfg6WtYbELirpXez6UUq+Q7qSzKKmTiaD1vZVYgjn5FOEHtiM6DLNeR/Pa0r
         Hl/zAJh0FuzlqBPHiqCazCgkpmyV0IXlOAtLAPg5FNRZKYLgc0Zb0qgeU0Djnc9cXBdv
         lfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783417419; x=1784022219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3Od4HG/qLTjM/UZgFQkeXwBKwUP2ZxKlymNqAxPTAI=;
        b=fIHXlp486+yDu8Qu4no00tSSCiqBRvaKIucC5AVuC1ZFL8L7oxD5/GbvT53mk7sHQn
         uaZy5ED3AAfo7XRb/iFlheq0vVl49qWo+XDhdEcEBJC21wLm4Pcx0tmmcJ9Rq4cPQszY
         7h9qofHsMeKwS8GKAiEJrbNdJ3qATdnyLVvbIqhfi2l9ZntYEnQ71weM2ECQW9ik8VE7
         zJ+6eV+jhUPvE1CkFvj5UeTjLZ/l0hSaHUVimpXIzGbaa/k+TwfFo8WmNSQjvKBoIM/F
         YdevAHahLFbQfxoVGX+au4DyovIWybHJFwH2uytYP+5KoVmCeUmA16az/RfV8dbMGhhE
         jeeA==
X-Gm-Message-State: AOJu0Yx6qEMO36NPit23nfe2wDHR+EFP6+tU/QRlxR+QGNc7jbaqONT2
	1ISvWEYMak9Dd+1zxh8oL0lUei7AlFsGVuMNsVUIkJYpccExWtHBI7FUoYHTXlsArM5a8m5sela
	Jo0NFXECb6njej50Fngot0/lca2X9caxaUrLF+IV1cipqeGMxV82ET6bJGBBUORF/ew==
X-Gm-Gg: AfdE7ckoBER2rRKUAyDNjwqlRSmUwp1PiQ3ysaXtjpRcKqgzgNfDXZwSy5WdSA4QvKN
	vZM1+KB/YLoaldUKrdbT3wx/bHTG3H3BSieA3TvKdg9+XT/tbtNEu7xZV2yn1MMw7XCEYmstg8j
	+iCaphEV9f3568IMgw88mAdwoi0tNb8BdtizlPK40Gb9REwBbf2g9FxKVAV+A5QOKAkT4n5eW4w
	HrDlUpdbdfU/tKu7vAjazhGFPLyW4+42lsbzPfoDzVD9FBd6WOvaTXkPjWXosilEVMFlzsx7joY
	EqEXhBhW+VXTtdvzbdkZeIm/YJ3CbNlsf4yC62SGqPpD6b3ystBYq4aFy+Ro3DHcvV5NHrlikAL
	8BW73bc89jyhnJ4o+zBXpt8VIt8YjFbfl7bwtIV0=
X-Received: by 2002:a17:902:c409:b0:2c7:ef3b:e17f with SMTP id d9443c01a7336-2ccbf04dbb3mr46390775ad.36.1783417418814;
        Tue, 07 Jul 2026 02:43:38 -0700 (PDT)
X-Received: by 2002:a17:902:c409:b0:2c7:ef3b:e17f with SMTP id d9443c01a7336-2ccbf04dbb3mr46390595ad.36.1783417418344;
        Tue, 07 Jul 2026 02:43:38 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm8422075ad.77.2026.07.07.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:43:38 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Subject: [PATCH v2 0/3] ASoC: codecs: lpass-{tx,rx}-macro: switch to PM
 clock framework
Date: Tue, 07 Jul 2026 15:13:10 +0530
Message-Id: <20260707-xo-sd-codec-tx-rx-v2-0-f61b4622f97f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAC7KTGoC/32Nyw6CMBREf4V07SWllYeu/A/Dot4WqRGqvYXUE
 P7dgns3k5xk5szCyHhriJ2zhXkzW7JuTCAOGcNejXcDVidmgouK11xCdEAa0GmDECL4CKdjKRs
 lsFJFw9Lu5U1n4+68tj+m6fYwGDbR1ugtBec/++lcbL1//rkADkpiVzWylFLXF0eUvyf1RDcMe
 QrWruv6BXfh0X7LAAAA
X-Change-ID: 20260703-xo-sd-codec-tx-rx-94538a2c6a18
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cca4b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QJ97XWDbBAP2W4fLZ08A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 9LX42WqDBwuMUfuG8MRCimskJlPEVudI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfXwktoptwdzvFf
 eyuQ6mgEkyNmABf6H4QFGGZ9Z1Np9mbQjIQns/cRWeX0GlYrFanmwR/1oD/ADDOXIEpFCdcWUov
 a+vBHqQlmU+wyQyeN0Nk0XP1vjONxls=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NCBTYWx0ZWRfX0KS+A0Are9SS
 k792ivnmmojQ76Dl9bypPk07l4BPeDA/JjskRq+d5zI2W1T4kbjqDkPRswW3rldrWYN7Zs0bXNn
 7GiFlthp8f696p7wZANMAiLwzvTjBS+lIUaLbVE3ZKus5GTJh6zHcDGP9Qorg6hXWy8WSdGCZGM
 dHy05xZBS5caem4vc/z+gmr0UQt3TlIGVMbWYHyoVhu9146K1bA0dDT4u7PNJMKoD2imf/TBNLo
 1ENymUbHQ0m5F3lD9Zz+/cYLexpL7p5sQZcLIbceTFSN1IELXtMeJbXLymcMp6ZS32RaU1fqBbs
 uqSURT6vr8u7ENol/ZEdKWWTZBe/6EUq2jBV+wbtifefN3+26JHJgqsjFVZnARSisYUMTetYE1F
 YBm7dWtnoKLDrxqTxoMvQlLJrPsg5mdPFNm/2teN7NxUHj/GRjxbbn3K2u8qzaM9OLyZQdKygRi
 pQjks7NOyYELnDtys8A==
X-Proofpoint-ORIG-GUID: 9LX42WqDBwuMUfuG8MRCimskJlPEVudI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070094

Convert the LPASS TX and RX macro codec drivers to runtime PM clock
management using the PM clock framework, completing the LPASS macro PM
clock migration started with the WSA/VA macros [1].

The conversion follows the same pattern established in the WSA/VA series:
- PM clocks created and populated from DT via devm_pm_clk_create() +
  of_pm_clk_add_clks(), inlined in probe (no helper wrapper).
- Runtime PM enabled via devm_pm_runtime_enable() with 100 ms autosuspend.
- runtime_suspend: regcache_cache_only first, pm_clk_suspend, then
  regcache_mark_dirty only on success; rollback on failure.
- runtime_resume: pm_clk_resume with regcache unwind, regcache_sync with
  full unwind on failure.
- SWR clock gate prepare/unprepare routed through pm_runtime_resume_and_get
  / pm_runtime_put_autosuspend.
- Probe error paths tightened with dev_warn on PM put failures.
- Empty remove callbacks dropped (devm handles cleanup).
- PM_CLK Kconfig dependency added.

Patch 3 adds clk_set_rate() return value checking as suggested by Konrad.

Changes since v1:
- Dropped unnecessary NULL checks on npl before clk_set_rate() — clk APIs
  handle NULL pointers gracefully (Konrad).
- Added patch 3/3 to check clk_set_rate() return values (Konrad).

[1] https://lore.kernel.org/linux-arm-msm/20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com/

---
Ajay Kumar Nandam (3):
      ASoC: codecs: lpass-tx-macro: switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-rx-macro: switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-{tx,rx}-macro: check clk_set_rate() return value

 sound/soc/codecs/Kconfig          |   2 +
 sound/soc/codecs/lpass-rx-macro.c | 116 +++++++++++++++----------------------
 sound/soc/codecs/lpass-tx-macro.c | 117 +++++++++++++++++---------------------
 3 files changed, 98 insertions(+), 137 deletions(-)
---
base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
change-id: 20260703-xo-sd-codec-tx-rx-94538a2c6a18

Best regards,
--  
Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

