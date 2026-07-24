Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA8D2FF67E
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784898509; cv=none; b=YrtaVgQwfku6IvNBKE7ioI7si9UtCJOqch1oDF5ThL1sm7VgCI4qyjxZXsE4COvYoO3ddiZMJqDMLj3rhRLa9py4VkVXpeYfi/lpijTzQbwsJq3z+lqibXmqt9Wr+3bOD1QpEF9xMwl/3JVn6VWqdkfl8Yoy3Z6ePIIELtjgxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784898509; c=relaxed/simple;
	bh=A1BKoOqqX0Il6/4DF/m2pPm+LFf8QN907xhCBZWURLg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NF9knkD/Dit7zhe0kt3WmV0TY8laVQQ/i8nXuNCLjglVr1ohAahBxJz7tGcqqhSJTC5NHAatw+jEmm63u8gbvu67TjC0NuKZ7wWCHjVRYsDXzxBtpu0Z3fGxnvkhys7H/lK7pgyh+tnNdq1Wzi5f14qjgXR7FMeWNg4gQ1480/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbvTaXnc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0S7Ad+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbvTaXnc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0S7Ad+T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OCm5TH2980717
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 13:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=riWgEamynzDLFbM9De8VdF
	4Ty0Sbr1uwOeNHFEAzBro=; b=CbvTaXncgb6Q9W2TyYNk6Emw6m1uHEhBjspc10
	MKNff3w7FfRiNEPO6NEPu74xV7AIlc5Vd5b3TnIyisTRGe9ZhglWkmXZgVJCf3IB
	ilpPCpp7dgycBFQQpjhIASwRbPRj5/vYAVKN8nk2LDcKM496YA0am5op5wD3uMW0
	OvS0Oghs5mA+iaFUuKARO7Y+PrusjTvqx/1gOvvBixbbRthFaF8qKtVM4GtrTaiw
	eDaFnICVAyMFMkkyRnHpXyBtQrXriomWZ089l9K0Y1XwFpvABuqTl3qBWAbkgE5T
	pq3qSRO599PQ0WX8r240hWna7N1pJbVY/ltLxoy6i2GiWiyw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgg2a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 13:08:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d7886cdso8433081cf.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 06:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784898506; x=1785503306; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=riWgEamynzDLFbM9De8VdF4Ty0Sbr1uwOeNHFEAzBro=;
        b=V0S7Ad+TSQNDCr/asSAdEBx+Qy670iDnWjjNpUHaTB24B2aoh1qDWvyzZ2rM8UF/kr
         sDoWmWyzogvIKhMZhlJ4rL61URJN4g9aSEKhaEAXgEhRRrQUKNvJLBNdzF+EIcGtvh3y
         6Io0h8Bi6wfiQW6rtGSCPTeqJN65PM1Ejpb38/EPaqErrfwegGIde5wnQTSsNuhQ3+DB
         GwPCIK0cSUMVgScI92yNtpq/xSj3lcJtc8sHumrl2D0hsxdjHwd+4b91WBwxhgmH66g+
         8JXm2qloouiRJFFaf7Od1DAuW+54+RDTAn/5blcpSxhm4282oSRGfuH/IF+GRP3N5BDH
         4AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784898506; x=1785503306;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=riWgEamynzDLFbM9De8VdF4Ty0Sbr1uwOeNHFEAzBro=;
        b=P6yHBB+mzQHf4BfCaj2mJkFtgXULehnwawUT+vYrCSN1U8XPBhp4dmfhrP3yYLEYEc
         fovdURyf4izqitKOs3yJF9tYPNhmRcMoDa8+ZSKNogW74cwgg3pFyatgQSUKNHwu/Ddo
         Rkf2iMVN/YpKpCQGvKmZ9OL138LGWBBF7v7KjNlzGfglUwSbsF+2NYmrAktqzIONjADA
         ms6Kxbih7v+B6oH8egazmnmzwN+NWsuF4uAulg+mvDrKQLfh788LI61PwL5BQaDfsKCB
         HLrjIHJeJGzj0BcpJLvJoFcHXU1OGfnjhgwU46V2W0CYAXo+4xOtjRfbnuvz29fGyLiF
         Nm7w==
X-Gm-Message-State: AOJu0YyNVCnA7WRTTm6UwSAUo66VsviZGsYWjLcYw0QFA2t6mxDiWiZ7
	8fyv+y21fIjixUYA6HipRFyvebURFsvKy2KcDGmcaIawg8EP9tzPBVncWI7d5qc570V0Dk9d9hu
	vd19dk2Kamf2STf3gqK0PT5ch9A8OiUSDVFhxhyEXFi5sxiegPngSA/Qtb3fp+y9cNwlukQBFYw
	==
X-Gm-Gg: AR+sD13mmF6Zf+O+FviiOIovtVn3SgasrsY7wbq3sFnI+BnV7JG2sohA8Hy0mmpIiax
	Ai6CfZ/Zli1Ei5wU0/7eFc75S4Yk1PFSkaRczGJcccHZjaiQhyT8bQQ57iKIb59sp64RWr2SaxZ
	NMQf1bp7Vem9wTx6/0ONpeue9zETYraL/t4yAYUnT8CLs5enCBwsrcixqRe2mBmHGxZpkFT2gGX
	p0wLfxyf+Qvo7EgryKSuN5eX8C4+j/lGqma6GC/3fIBWpofMOcf+VJilCeu2/XHxgVivRpCaJrB
	nzysJp7PfmE4Z/ogVSeSvB+n+Qoz/uVCjjkhmNPhj8ZZj908uT0YrkE+OiPM7vf2/ZOX44hspec
	+HWykGeRh
X-Received: by 2002:a05:622a:4289:b0:517:b68a:8d84 with SMTP id d75a77b69052e-5283df3184emr68391681cf.56.1784898506226;
        Fri, 24 Jul 2026 06:08:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4289:b0:517:b68a:8d84 with SMTP id d75a77b69052e-5283df3184emr68391011cf.56.1784898505630;
        Fri, 24 Jul 2026 06:08:25 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afac1cbsm64921045e9.10.2026.07.24.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:08:24 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] ASoC: qcom: x1e80100: allow WSA channel map
 override
Date: Fri, 24 Jul 2026 16:08:17 +0300
Message-Id: <20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMFjY2oC/yXNyw7CIBCF4VdpZu0klFRQX8W4gOmoGC4VRJs0f
 XepLr/FOf8ChbPjAqdugcxvV1yKDXLXAd1NvDG6sRmkkEpoOaAdsKQaR3xSCjj3fBC9EGi8Tx+
 sFHCbRfYYzIR7e2SyUpNWCtrllPnq5l/ufPm7VPtgem0NWNcv6348sJAAAAA=
X-Change-ID: 20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-5b9ecb27c766
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=A1BKoOqqX0Il6/4DF/m2pPm+LFf8QN907xhCBZWURLg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqY2PEpUlM2h7HF9P3jwjJTlwDextLwPHnFv4Ij
 Tyglwl7NZKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamNjxAAKCRAbX0TJAJUV
 VjIFD/9dfM7RrYMI1O/N/cwukTrZ+IG1RYQseyG4F4HR1K95ORaIMPlzhx6QAr2NdEHXeR3FXYA
 shdg9FGvgsGv9/CbL2AzIIJrCYHzPHEHBcUA0yxAO+1BfHVjSOcvpvDpGUHMYOjNre8TrsczGjN
 YgMQIyyJMhLU8nuUASUsSGtuD5gAEqDBFu5EkHMrQ5cEm+fcbeBOMRbE0F4PgX5goWK9nr+KeVi
 ki834wGTPTc1SD9GYdPCQo1VbmPbEQpP5ouRxNO9wiMKyJTuzqV1/zihaYYFQUP5A0eeGpm9OXd
 HL8eEUPKPP6jT0Gf436zLPMyT4u14l7our7Sobivl87WUnfHUPIWzwA+OdC1o+s/CtU5aQfugCv
 az4eENic1WcfDAk3NoqYOiJO+VmLVRIuLfOhTacgzmvtIJtB8IThvNkafldE7wkTUYl5S8wM97+
 seQAGqV9boML39imS7lbpQV3sYqThN+YuM8jcJze9RMx9+4ArSkzla3oZIXCB870v4y6PGmOJID
 U3Kd6UEuaCue4EcoxiJ+dGKHdu1cfSETfd37xhrgjq6cGHTPU2eBRZy8m/RP49Rbf4Fe+UmuSSY
 QGnlQlNkZO5rdUrwVSC1NGyu6Ow4XMnzztbhT9L2JwHZetVy+n5995hxG+SSRb60Zw25eTNdjul
 +HvlLOiCNVl6HyQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfX73+RaOU4spTh
 ZWv89Yxlp17/FuFjXgOq+VMGy2gW/u8LcM1Yvkw+AIbeCPPwlpAOmC/C1OC6tyi5Rvk0fsizjiB
 sVtXwOUla2gCsYY4LrByMITO0CbNbrVJY4l3kQYwx9pwyCRYkM8yI6n9WjhvlATo+Si+N3WOb+j
 fIoPB9cACh335kp0cHmrHhd6eqSX9KZmh2NXhrI/e0HtcTCB5MUGmUttne3I7D51OndVigMH3yz
 L9b2rPqwVoAOImY0yzWy6+rAUAQW4tpQ0LF3jxgruNpWr2akZwRsMOzHlEJoAgJtmE524OWl8Rp
 SRbQasOOuMgFpfr0oV9SkcMxJA+e1BsTlQ+CVMumMwz+/UdwUzND/z18/gzMIWzUmYIE2uAjQ7C
 /0UTb/lX20uqsN2UM8RR4D0VTSDmc2njkHCZ0/EBLsZvLcJ0NH1bSDbdlEiMTMYLOD+x8iTl/EB
 0raz57zUNjcosGr+RJQ==
X-Proofpoint-GUID: GFUSYKA3P6ujM0jNRrIapyi0rSBtnM3R
X-Proofpoint-ORIG-GUID: GFUSYKA3P6ujM0jNRrIapyi0rSBtnM3R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExOSBTYWx0ZWRfXxgwUV9V8KDDd
 A4OEXRADkR2a24rIDdjxnhIJLK/xMXlCNa3/9wTMpUPtVtbPJKhEnPnK8ObkeqfOM4uAxz8u7qp
 weTlxWIA4J7KA3okTeKq2ekhYYihHq8=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a6363cb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HIMiOIJdItjYp9BVDdsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240119

The x1e80100 machine driver currently derives the WSA RX slot map only
from the runtime channel count and programs that map unconditionally in
.prepare(). This means userspace cannot override the speaker channel map
from UCM.

Add WSA channel-map controls backed by per-port storage in the machine
driver, then translate the selected SNDRV_CHMAP_* values into Q6
PCM_CHANNEL_* slots when preparing the WSA backend.

The WSA links are backend no_pcm links, so the channel-map controls are
registered as card-level controls. This keeps them visible to UCM before
stream startup while still preserving per-WSA-backend storage.

Sorry for the late respin.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260723.
- Return 1 from the control put callback when the map changes.
- Allow up to six WSA channels for Glymur.
- Use WSA-specific control names.
- Expose standard ALSA channel maps through TLV data.
- Move the SNDRV_CHMAP_* to Q6 PCM_CHANNEL_* conversion helper into
  qcom common code.
- Register card-level controls because the WSA backend links are no_pcm
  and have no PCM instance available at card init.
- Link to v1: https://patch.msgid.link/20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com/

---
Abel Vesa (2):
      ASoC: qcom: common: Add SNDRV channel map to Q6 slot helper
      ASoC: qcom: x1e80100: Allow userspace WSA RX chmap override

 sound/soc/qcom/common.c   |  30 ++++++++
 sound/soc/qcom/common.h   |   1 +
 sound/soc/qcom/x1e80100.c | 182 +++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 209 insertions(+), 4 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-5b9ecb27c766

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

