Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481954;
	b=sc9ulQRSK7dBnbzeghAWPDHKPMdZeeczqYMmqZiQ/m4wHNgKUvzcLW5PArBu2uNjDUFQ
	 dSRCK5vCkom4l3pbobh1JILdyXx319H8xGXI+iSvIJR40fesHZrbOrXdpQcJruOERtSsh
	 pXpJ3Q5TraS/tuuQCsm1iQuQ3AuLDfsnHW8xXOXw8iyzJZfBj/y+jYvO7UD7g5N+zND6+
	 cBBApSIYYjhYg2tiKCMeTp7sArJQasyCQ0rsFGiG615SyEEa1IurR1MCSFZNYglORwVpp
	 lg+YfSqGoaZwyWS39nChpP97ETGAPvV8A6VLVgx+oHbAgxgV9i64YZVx4O3QDHovkQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ynN8vq55KK+neFzK3sShq/gIeHmeL6EmYwvuyW4p4qg=;
	b=Hd4JSFv5VvAUsiAwej5nIwQCX3R7NNEWs/l9kWvbfC0e4u2OJz4donr1MpRhVmrnSntw
	 hqhmdzrLGn29guCxbyF7FDmb27D3yttXDK6NZF/YqnYxpokS0UOxC4pkkKV1owk3zlo5J
	 mN+FKmsPkY3vhlhw1ZcX2dhY1qnvyTiDZKgzQC2MfN7Z7BBLRGqrnpFaOBdOOcZDms82o
	 8OLvmmWEnNxhc0PwzsPmZWSaIDX6mru0ydthZvfRASwsoMBFcAGybCTf+jzaCV0xZxzA1
	 vVXx3AOesLgqtn17xHOpiNLiu7OqCay4GoGKepvTSlmysuR8q6w6z45uw3tV8mwREIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gM87Vy3x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6F6jQ+M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AFB606A31C
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0AFB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gM87Vy3x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6F6jQ+M
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tXlK3487161
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ynN8vq55KK+neFzK3sShq/gIeHmeL6EmYwv
	uyW4p4qg=; b=gM87Vy3xodCuUpfe0BXxoaEoS4/RHrfi/bxFk8plVR5l6n+QWkP
	tey6ZCTxWXTSDxQ8dW4MF631UvZAy80N6xot4i3Hwd75uO9CkQGoJkjcYVhntGHX
	NnAEqJh6t5IbrZs9Qn4JhUMgrMhGDGgenut5cfG46jMuJTRvy5/MqDIyPUEB6CaF
	9ph5CfwDEG2AG7DMyYUS3HP7ZIhmjGXEJHFAkaZEkcICo+y7z/6Cn8olCHrXybV2
	bwTyeFJ+QxFk7qYjXWDYqpApDd5C2gGrimbGEK7kAquWeyT0zQSzgCAGDzLd3xPL
	Hrw885YBFt2DJq8P/s7djan/Bb3NhgcavcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1e1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso707175185a.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481952; x=1793086752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynN8vq55KK+neFzK3sShq/gIeHmeL6EmYwvuyW4p4qg=;
        b=d6F6jQ+MCeFLSjbyxr+2L/iz1QdRgN2VJ0QcL3JoGVVDt8LB1YvPL1+kUCBU++wj0R
         xOn493TIg1mx8HXTPMwBJWz57eqHHWslavgVhk0O6c5J1jpWV6vqskBtYU50p/1KsT+q
         vX/P+RtdGJZn8EsW6q1pRi9wgJebFh7119ANbek21s9kPbFpAkutMqRddrseIj4G/d1y
         nB9E1LUVDJRWhhg2rueUyFd413CgZEEfy1sCBiCX4StBaCYoku/70V/TQzq0hwB6Hes6
         yACGRR8ZTq41Vh0eK2AqENDdX5d4JVY9sZaYpprC2/hVbK3YgL4IIuuX6XlgI4T911R1
         QxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481952; x=1793086752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ynN8vq55KK+neFzK3sShq/gIeHmeL6EmYwvuyW4p4qg=;
        b=DAmXKd3lPpIRC1krO5VBSM+QwECP5qxAupZROJFrV9rB9iiXgAxv2k/1mdgAgAgcCm
         dzWAmusYjin14CVBnTRDVPVxysNmLhqHn13rAj2GffjHR0vnQahyfft+8JJanvczg/8J
         GWCxTEZyz0t7wcvOjKKdNH1edQIPkLpoo4sB1WUXbb+d3K1aEkluted7gUYEdUmgzrRN
         u+lTz92FoxM3BDqK7lm/vzrSaqqYnzZp6MLJlnzKXu7SuFMmp4qrk6rwfwSnJ2md6hdc
         BtX5QihIAxp8HvUVivSSiSQW5QfKtbyKCpBJI4Cv2MgDedorG8qQDh2h6GsTQXVhQYQk
         mttw==
X-Forwarded-Encrypted: i=1; AKwUvBwOVUyMFtFA+UcnDZ0x4yBg0vf9VfOF3NGF31o5z1kYHEP1izQuDqNAZtmdvJkwf01yyCEYW+qDyEGrAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTWFN5i9VkAPUyRTAhnRimh9pw4Ux9DSoCFHl0jPdluUa92t37
	Z111fSbppXmPaA4sJoHblQhG0VY735yQS/jcaFugC6gIAWMNJEv8WCWHceHe5kV7tY1RI1+MjyB
	ErE22I6vZI0J/oUxkC+1oOU2yjV0UJiE8TW2ghYWGVgGOgEDH2qjEVdNL+G6zXf9F9g==
X-Gm-Gg: AYBFou2jd2KZ8Ts/g1b1h59uekMshH6oUY3l1ZAEZkVpLiaLR5J1BUzT9lFiS1H8pxA
	w3O7aesqVJWL4/F4t6+sP63QPoMKU1WZH3NEfSFy/qteXFBXm1pCBy45RQIWS3dwL7exc4Su0+a
	xrqJSIkkQxGpvPODU3ibPBnUhz0hvKaG3QHb+hf5An+9ED6dqJiMfsh4K5A/CmDn+kTyoezodTD
	4chRxmWyUf6mLPLKYnibtVy8L38pK7R9jlXBQII+DYoceWZ+r5vP1de0XMe7V3d1HfxFm0RnatA
	lnybQa2xfma0LA2kDSoqB5aD+1wmvHzziNGywDRcXYetJAspCCo4elhA5VOtsfTO+YvC3i1fwQc
	9Uj8VkvwB4SxR
X-Received: by 2002:a05:620a:444d:b0:93e:c12c:9b69 with SMTP id af79cd13be357-93f29dc8f14mr1625394585a.68.1792481952017;
        Tue, 20 Oct 2026 00:39:12 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:93e:c12c:9b69 with SMTP id af79cd13be357-93f29dc8f14mr1625375785a.68.1792481946786;
        Tue, 20 Oct 2026 00:39:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/6] ASoC: SDCA: class-driver fixes and PDM data-port support
Date: Tue, 20 Oct 2026 08:38:50 +0100
Message-ID: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad71aa1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=ZXgMDdy8QFCOA18ocHQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXwiNYbPLMcMLJ
 kw7tMprUyVh8MyrHRE0PA4QDDX8NjfX7ReS7hT0K2fzf2mJutj2X2eDy8lWSUWV1A325HU2uzt2
 llao8YKcYu/PImQM7lpmWeAHTS5QihQ=
X-Proofpoint-GUID: BcQ6eS0msO00Ix1vV-WytQWDvh_3UpmS
X-Proofpoint-ORIG-GUID: BcQ6eS0msO00Ix1vV-WytQWDvh_3UpmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX3Nafckm3lIsQ
 pFKbXCCztBWbf2bxjI8Sw0OM50lYZUbngaIkXrU6SiMB7RDEKPstItxTelJeIixHqYvJki9/y/u
 apOISMkLvcaQ8BlMA8ucSe1MQtlKETn6IxzOyh5zV1ehT4qFZFexfnp58HZreZJiptEbMb/eMOE
 blaFuF8UWvTy++hLC9HDsv8coLIKPwvIw6lCY5P/t0ZHJGtGVviq7LjGjFsfxFOMxkvWpRN9jRB
 4KBN2pf9GTkIq0oDy2b31qohIR94qJySM8ROvZscVkxSJg2eUvDZBQVnQP2mOPqz3EGc0BNENDh
 jZZeS98H2COinsDeoKOAxk2Nm5hMth7ksrz4e/ubJOH4tV8EFKbi+6p6dFHK4yT4uIglkY4iVsP
 xz19dMNxQFIkN+tjyKF2Hsjj7a+eVBgzEOZfQOplkusPy2ExCYXf4is7MW0VQ+NDTLihttRHaCW
 ya/JJmY03LMnsplVJNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

Three small fixes in the SDCA class driver (propagating a read_prop
failure, dropping an extra pm_runtime reference on probe failure, and
re-enabling the IRQ on a failed system suspend), plus three patches
that teach the SDCA class_function path to tag PDM data-port terminals
and the SoundWire core to treat PDM streams correctly.

The three fixes carry Fixes: tags and are Cc'd to stable; the PDM
support patches have no Fixes: tag as they add new behaviour rather
than fix a regression.

The three fixes were flagged during a sashiko review during WCD9378
SDCA codec driver patch review.

Merge strategy: patches 1-4 and patch 6 go via ASoC, patch 5 goes via
SoundWire. There is no compile-time dependency between the SoundWire
and ASoC changes: patch 5 can land in SoundWire while patches 1-4, 6
land in ASoC in any order. Patch 6's runtime behaviour depends on
patch 5 to work end-to-end on Qualcomm SDCA targets, but each tree
compiles and tests cleanly on its own.

Changes in v2:
- 2/6: switched from reordering pm_runtime_get_noresume() to dropping
  the extra reference on devm_pm_runtime_enable() failure, per
- Replaces v1 4/4 ("clear sconfig.bps on PDM data-port terminals")
  with v2 4-6/6:
  - Moved the PDM terminal-type check out of sdca_class_function.c
    into a new sdca_asoc_dai_is_pdm() helper, per Charles.
  - Signal PDM via sconfig.type = SDW_STREAM_PDM instead of clearing
    sconfig.bps, per Pierre-Louis Bossart (use the type field that
    already exists in struct sdw_stream_config).
  - Added a core SoundWire change that skips the bps mismatch check
    for SDW_STREAM_PDM so the slave's PCM-container-width bps and
    the master's PDM bps convention can co-exist without -EINVAL.
- v1: https://lore.kernel.org/all/[v1-cover-letter-message-id]/

Srinivas Kandagatla (6):
  ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
  ASoC: SDCA: drop pm_runtime reference on probe failure path
  ASoC: SDCA: re-enable IRQ on pm_runtime_force_suspend failure
  ASoC: SDCA: add sdca_asoc_dai_is_pdm() helper
  soundwire: stream: skip bps mismatch check for PDM streams
  ASoC: SDCA: class_function: mark PDM data-port terminals

 drivers/soundwire/stream.c           |  4 +++-
 include/sound/sdca_asoc.h            |  2 ++
 sound/soc/sdca/sdca_asoc.c           | 23 +++++++++++++++++++++++
 sound/soc/sdca/sdca_class.c          | 10 ++++++++--
 sound/soc/sdca/sdca_class_function.c |  3 +++
 5 files changed, 39 insertions(+), 3 deletions(-)


base-commit: 3d229ce89862b8e82d71a9e11d6f840ca272a6d6
-- 
2.53.0

