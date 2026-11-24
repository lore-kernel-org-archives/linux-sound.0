Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517860;
	b=0ytV2XXEqTG2LUyBC7CUQsADgc5QnutSpfB6DJYmEWqH//EDAFkfE0QKPsiFL0GVVvBV
	 aEC8suC+Qi6hayEXPx7Csjik3ip24Dk2u9uJhwBbbj6z8clVOICch+2iSMLpT90V0G36T
	 ukQRjiaskS55gToP4vu/tPK3zi5KyOxEdLPo9R4+u6zg5KFukjKt4tXfwniLiZO4Yx/x2
	 HlXx5tHDx0XOoon7XwmdMXggrTO454ihQ44IpYBoh5PgGsSNuQw90fki2EhAdKjHYgCYg
	 TnkkEdRawHafNwM59Q/Oy+nOGG9dQi3OSgHAbcQ/A3kb+1Umvm154o+rHipozSLmfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=auc42BJEaWMmihKFeDgYpiXHyZqs50ziW3ERaD2VW6s=;
	b=y8V/LBInvLh5ump3M4a2r9e/HV91xXzYjLgWW50ow+zd3xe7JgOhlfTScoxYrFJb6xeE
	 NdyXssQrDsra4YP1naScETm8xs0ztEysWWrjwMCZq/4R5Ibq4w/7cNIn13Nx+ZKkqpyNt
	 2hR02kWnUbOJZ+BfyTSck+9G7YWYpJwmVwwzuROhYDK5BrOJ1r08mwMQ/f8+Zpysy1OzS
	 8pZKNjGUL0eFLViYlK3p3Nyw3fFi+SHv+ACW6yObIIELBvR9SliKECzRnk/d73vwHGsI/
	 kXZh1MStlDHC5gJrkc2l9i0dx8kKjtJ0x4Q/3jr4zoW/vgDBu/DOe212dy1EViKlHvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JFBNPUUw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVAr2OzA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA95606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA95606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JFBNPUUw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IVAr2OzA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuaTa3299622
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=auc42BJEaWMmihKFeDgYpi
	XHyZqs50ziW3ERaD2VW6s=; b=JFBNPUUwbPZ8q6fy+dKPV/yRYIKb6cTUpQ70Yj
	1+JS3CcdWJrR5+ry1WZTu3Aeiu+C46i5xmJbi03SWbuMlMozQm86qjlEnjDpz0VN
	RR9nL0Ru2NtYuGVR5d9+qwpUKquPLqhiprXP/ISM26Xtc/HJRoJC41rPhxlws2D+
	bcLhqivABLnG4jfTSq+eG+t4CxlV51RmxLONanGU9HyqyVGwIsDxscxpG2gj0rxm
	lAwqula+KWx6ArOKwcdstDR0+3nicRrZPrKflbNiPwLpjhuPEjcYfHcQOwj8ra7w
	cI5M9fh/I0nSDjF8GVfeh6VuePb+RL+MRkltgQc/qEAHzXKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy12c4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so762481785a.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 02:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517859; x=1796122659; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=auc42BJEaWMmihKFeDgYpiXHyZqs50ziW3ERaD2VW6s=;
        b=IVAr2OzAspDJvETpQfk5BD/xHkVqzr+hgv4AWFHVeXHbAuFxUrjJaE+HRy07eLkIAn
         /FW0Dra2G2jg1vHaT35UAb365CiEGDlW/zkkb4RNuEWJUXIk46TyZD0g2RbPEroKoXi+
         +k5f54kmyXNMz5tcljqhihfjxXq8+A7RwxOyRyyHFBZ8xC7ofRShqCXdgebDX39Le2ub
         nNzW2KfJZ3juthn7ylroE6Maswz2WlWA5hB73znFb9+PfGaC8+py68T7mh7hR2fyx2i6
         b2Ncst71XVZwn7BZXThjbSSmet7dNZ3kf8EucXx81U78lCJGJKyEVVv21Xi56nPJVyy8
         y4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517859; x=1796122659;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auc42BJEaWMmihKFeDgYpiXHyZqs50ziW3ERaD2VW6s=;
        b=HZSpt0rV+gSTJcdu9yDlNTIUz95iNJD1+Vuq6+DyBGoi1DMQXVjl9cCPsM7Q4yLMZ+
         CatSdbrlBIPX0cE6M0F5QJ6243bX7W+LW60W0ovW67QiClXh8hYn+7HP5k8FxReS+Dn8
         gBGK5ZtHW39eAfXX1P3cih3NP5zWxyLteio2Ht9XF6eMYTg6JiuciVphtzw+cp3UjlSA
         XhE15qMssAYnp39ezUvU6/ZoiS+6/ThNIo0fnuldzUWgq2ErAzcunm0dZxF5wWbo6s+q
         7kA+QqfClJ5a2wjwJd/rmucuDMGeHFxORP+AL9cL/IRYCpm5nHV8TRF2H15dfSiEPu0v
         t9Xw==
X-Forwarded-Encrypted: i=1; AL+hErG5TcYrAb7p/1LpP+CLn4pzsHW4SJgL3eDSvE2IE3Wc8waHVyq9l6ZfOTC/LsGXArvLxEe2X3sXXctpUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BnPnHZzDl9xAs2vf01Nep21lTZA+NBMGWDiqTNxfIPgUoaWcl
	LGYBx8JB6sNB8t4XJbD4S3rSj5sOzKhjeqM97jXg4qhi/xLHetqXeafkRY3WMkmvJEJnk6B8QOU
	DV0HILv8TdKyZdpr9HgcaH1GydjP1xfY4DSenNhV0wa9hpsIRghdCrm5ODvAYVJRs3A==
X-Gm-Gg: AZFdTZf5JNQR+unkyPCxCLGlCdBaiK+c7Ivxez9ylfWXjclJ6FxmEIkZfqkJGJmA9Jq
	sifwoei6+xOWFoxdpVJ7F+uEX6kKFxP+4F4OTyi5S+pbBGh5qkYt0HKQ27wcHdNXdx3KbYwpPfQ
	94vfuvOLelRcaIJyxQnkLlh2nmx6lTCyUTCAh0Cafx/PyvNEF5NHXMqLhuiLOBjJzwUPLqVj0dA
	WKnthbDQ444sLmeoshkVxMM4MHlho6vhRdWGzeKoz9L62bHnk645rsCuLUspmFjCj0s//uMgvA6
	o6Wm5vEDzFzzgpmV/aYzKmy450riygkBDLkFiLSsMWTJDbWL+GJ5R4fldKittXlBmM92MW2I4H0
	cJUHRZRe2EnhQ3XkULKVoXOt0C6mZxChrXnVd2jkR2jA1H1g2gokvsZ7Y
X-Received: by 2002:a05:620a:130d:b0:939:4a44:5f99 with SMTP id af79cd13be357-949ba80f3f4mr2303396385a.10.1795517858432;
        Tue, 24 Nov 2026 02:57:38 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:939:4a44:5f99 with SMTP id af79cd13be357-949ba80f3f4mr2303390785a.10.1795517857693;
        Tue, 24 Nov 2026 02:57:37 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm612415085e9.11.2026.11.24.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:57:37 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/4] ASoC: qcom: x1e80100: allow WSA channel map
 override
Date: Tue, 24 Nov 2026 12:57:21 +0200
Message-Id: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJFtBWsC/52OQQ6CMBBFr2K6dsxMgQKuvIdxUcqoNUCVCmoId
 7fVxJUb3Uzykv/n/Ul47i17sV5MoufReuu6AOlyIcxRdwcGWwcWEqXCXKZQpeDd0NVwMa6FO3G
 BhAi6adwNBtNCrHXcQKvPkFUlm0rmJldKhJfnnvf2/tJtd2/2Q3Vic42OmDhaf3X947VnlDH3p
 3qUgCCNTgzJDJGKjfN+dRl0E8rtKhwRF4zJx0GE2Y+OJDpKRqUoIcr2XxzzPD8BwO3xDGUBAAA
 =
X-Change-ID: 20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-5b9ecb27c766
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3653;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MOgs7YG4ruA3tDRUQ7U6OSBmjD5bI4hrkXA8wIvpeBs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBW2bSAHelPr9if67Tta1QNvX3xASk/pwIb0W4
 P8Q8br0hC6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawVtmwAKCRAbX0TJAJUV
 VhKMD/9cMclJFQFft9n117auJ8w8xrk3Bf0Uj8f7QpJF56cNA0yra9BYdGC1i+fVAhwlU4mE7yg
 kAp119Qx95o9OLulNi4GHZED9kySHcw4P9qCyo1izi8YntKhhgV3EdN0508cxh84XFVjF51YIuV
 IoiN5VGcdaTefE40ZxnpocfwRaJAbU/CXTtJF0peJj/T0E/BALETxmBSyfbES18b75QhVSgJhm9
 /nPG6Vu/uEXR4nxhvRj/q5wJjifEte8jJMKn12wqHwePEQO8UG2GU3AGZvPxG0I0z2ZbyvSwEIK
 FaVzOgYa6CiFYsMJuQkOJKVzmGoQTukj/J1DwltL3SK4XqIiBsIKIeF1grsMJsk0+HCII+NuhGe
 XjtKSody+acfyxXH+8XCZa2sV9DV80oJZmpVdOZ0/IT2rRDwTPJpFMYuO8sRkQ4u+Ix0YoRl2C3
 JkRI+HsvmHCRbzr4tzyiB8Vry+7HPWqzAE0BUguyMqj1kMJNfEOQ7Yjr3y2aFxQ/dzhwAg1oeMd
 a0rTNjBPu9Y/AAIvPBFY62MUpU5pUyukBTpctqPGSYfX3vgbEcYS/dMr6l120SihckhPRmtVADd
 4fc5AALp73vz8VZvsBF8mVEmNIcNlVNPk7wS0yhpAqF92NsWvtXLjjYw30B6rxf2v2HdOmymC93
 pgIXmg2Tc/KzHXw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: x0Gs088hoX2fpIn7UAWrBVxQ_MXkF9xD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX6Bf3Tli/Bulj
 wpTiGGCJ0fc8cGSKVLYNi8qgt6s5nT9bfYqFA37hBcUE6jfAZpyBqlVGX7ku5IJhNddTVn++V4O
 0BrKCKYd12VQhbUP7PS9YiPjy4MbXrU=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b056da3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=HTOn0Lkp7EGU9drfIt0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX0LxbOS/yVvh8
 dd5oCuRluiF1knAAL1zbgEBQLO4Tiex5sgzxytIAW2kPnSz54pUaYYXkWojntzqNtmAPgypDprx
 UyzGdpfOIW0p/CKZRqEcGgOmwaGXvG76p13Bd3fhP6POCcVaevZWTl5oL2Ho1Qd2u16RUqJcaBR
 cdiNk5PICfU2t4UWWPMlotvDXq9fBKLlX0UY455jj2YhnpR7Noyu2VqzRSIHF5bR4OvxlwYfv1U
 Bh2rB+El0TKGcyixoOdJDuIPdBwaJX9ukt1tOuj3BWvzCAXHdSGMYJZxTvR7xyPWCK8mTCNy0sE
 At1lVoEfNkwikqiVwbBnqI2NWgI/Yx0Uuso3vzDo+QNO6Snscava+y2cx5iyjy1tnOWTv1tp7v+
 MkeIUDlkUzvIDyTAtM7MP1GKy91oxTvRTNkrMnFo7Ww+CLrNFSiOtRUW1S6+0zfTwa7HiHkmQCQ
 klZfcwvM83yN5vCuMWQ==
X-Proofpoint-GUID: x0Gs088hoX2fpIn7UAWrBVxQ_MXkF9xD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

The x1e80100 machine driver currently derives the WSA RX slot map only
from the runtime channel count and programs that map unconditionally in
.prepare(). This means userspace cannot override the speaker channel map
from UCM.

Add a small ALSA core helper to register channel map controls under a
custom name (so the WSA maps are not confused with the DP/HDMI
"Playback Channel Map" controls on the same card), a common helper to
translate SNDRV_CHMAP_* positions into Q6 PCM_CHANNEL_* slots, and
writable "WSA Playback Channel Map" / "WSA2 Playback Channel Map"
controls on the WSA backend PCMs in the x1e80100 machine driver.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Rebased on next-20261123.
- Report the default channel map for the last prepared channel count
  until userspace selects one, instead of zeros (Mark)
- Refuse channel map writes while the backend is prepared, since the
  map only takes effect at prepare time (Mark)
- New patch: advertise writable chmap controls as
  SNDRV_CTL_TLVT_CHMAP_VAR in the ALSA core TLV callback (Mark)
- Apply the selected map only when it describes exactly the prepared
  channel count and reject maps with unset positions in the middle
  (Sashiko)
- Snapshot the map under a lock in prepare (Sashiko)
- Not addressed: AudioReach still rejects more than four channels, so
  six-channel WSA playback needs separate work there (Sashiko)
- Link to v3: https://patch.msgid.link/20261105-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v3-0-29e06613115f@oss.qualcomm.com

Prepared with help from an LLM-based assistant.

Changes in v3:
- Rebased on next-20261105.
- Switch to the approach suggested by Srini on v1: add
  snd_pcm_add_named_chmap_ctls() to the ALSA core and register the WSA
  channel map controls on the backend PCMs from late_probe, instead of
  card-level mixer controls with a hand-rolled TLV callback. The v2
  claim that no_pcm backend links have no PCM instance was wrong; they
  get an internal PCM from soc_new_pcm().
- Use a per-WSA-port index for the stored channel map instead of
  indexing by AFE port.
- Link to v2: https://patch.msgid.link/20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v2-0-2ca3c1250018@oss.qualcomm.com

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
- Link to v1: https://patch.msgid.link/20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com

---
Abel Vesa (3):
      ALSA: pcm: Report writable chmap controls as variable
      ASoC: qcom: common: Add SNDRV channel map to Q6 slot helper
      ASoC: qcom: x1e80100: Allow userspace WSA RX chmap override

Srinivas Kandagatla (1):
      ALSA: pcm: Add snd_pcm_add_named_chmap_ctls() for custom control names

 include/sound/pcm.h       |   6 ++
 sound/core/pcm_lib.c      |  54 +++++++---
 sound/soc/qcom/common.c   |  30 ++++++
 sound/soc/qcom/common.h   |   1 +
 sound/soc/qcom/x1e80100.c | 246 +++++++++++++++++++++++++++++++++++++++++-----
 5 files changed, 302 insertions(+), 35 deletions(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20260724-b4-sound-qcom-x1e80100-allow-ucm-channel-map-5b9ecb27c766

Best regards,
--  

Abel

