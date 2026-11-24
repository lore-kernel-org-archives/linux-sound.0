Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517862;
	b=QX+BBsx96YUS/XX7o4IfSqgRBbGSTdrat4Wl9j/qeY+xQ9XF706qqkFH4YtMiuhPWl/r
	 Fy/qcOLfFempqeZAOL8BhEPfEWWlLWqmLbavTBExwE01kl9rSNKyRB2Gq01T5ZdzggFB+
	 +Lgk8Thvi/3Z1hb892sopZ91IzqyGU5fCM+Hl6LsdntUPYlYxktsgV25HPFQ2aZvPtmY5
	 o7wW0GO8OT38HaPnrFwbXsTr1Y4FfMUY5oLzb0ELq2GHKgxZC/KAlDw/Laqee1A6FynaK
	 7wBPCoxZ+IPfMQpum+G3vm+Y8hVVtgbbgMmoIcdllAeIkCuf0xHGo2Km1M2qLXywVEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1q4d/G5VYzExEWgcT0IaErLKeW5Zqdykt2cPRLtU17I=;
	b=UkrV92X27ChGp5ZlT5REyiPFG6PcOE29jMX0s5PExSv6JOctMACjSqhzY4QYm+nLZaFR
	 N8KU0OjX8O2n79H+njxJcWeCD6gyGf6mm7JxM7pn1mVfhNbDDlMwPKdin0plvk2yqr255
	 UZK/+M27i1QqeyPtaDZ6mMgEdSxX6edVNmMxqlVtUsEZA6ngNnUlJpcxUOY06ODBREor0
	 aEft5B7f3VhqBC4srNYt+A7T16wp4ty3gLYk7e1vti3nh/z/xE4/WqZbuffTt/nECyUer
	 ocqauHjd6F8u28EqLayIVJVEoqXNCrMk4hwRd0g4Q3Dzsr2MXmTpmBUx1OZT62YGMBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NOno1msd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyPiwO97;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7050606A333
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7050606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NOno1msd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyPiwO97
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAv3Mm1113859
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1q4d/G5VYzExEWgcT0IaErLKeW5Zqdykt2cPRLtU17I=; b=NOno1msdLzGJxmpQ
	NaHqSgq9jH3BRxzfSro4GFfkXMrmgXP6AcIVHcjrl/ThYyz1sAmUzLYbsxMApVFK
	3nlAWa67EJxOGXBWFGrXtiFQiohaGWzH+ldhB7zIWhj8UR8zFEeqDFKefgY7h8C2
	7acDwmscn1KYC/X3Q082/xxI+1OVPUF1FYn55H68PIpe2UgDgr3KT9LA7T2g1gvE
	l6fhE3IFgdLYsg4awn/y9+hHWRo7tKXZYz/xfmtuTTh/EwiZ1IZ7kowaRsA5RPo8
	G720/uK9UMX4yZOA60UxFjRWqGl/ZVpF1PbxlKPSQuY7pil4dnRPaAjXeXDGqPsZ
	SldrbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nueq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso630529985a.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 02:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517860; x=1796122660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1q4d/G5VYzExEWgcT0IaErLKeW5Zqdykt2cPRLtU17I=;
        b=EyPiwO974v7QxKRnnZL1vknJzUlS3nmo8hnnRG6Owqr4VKMaApLZnE/2w7oNRsd3L3
         gsrP7KRCdAlBsAmuagQWztEK/GANEAHGq1gQQGVOlEV5Kq4Qc84fXA16bUAMtf6gG9If
         Suy0UC9lq/jor9JKZmEc7meDRDBDg7CiZ7Ejt8g6VFUTxSIdOq1Z7nLW/02+sR9Dd6E3
         XZ83cmQRXxAlRR6jaYaH+d7gGYEUvb4NicuBRYlewi+IapY4pGtsDMvirILcqCOO6G9x
         mDSwo/YkQ95OFHrhvVRGAmHJs8Hf+lveqa1ZqQVi3s4/PX/1yithQC7PF0YEAu8xXLmn
         kLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517860; x=1796122660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1q4d/G5VYzExEWgcT0IaErLKeW5Zqdykt2cPRLtU17I=;
        b=c/GYJNq7ZhAknhj/gjBai0H/sGPzchjo4ikuXj30gRyPRws3aD3Z+q4VifB6320UJT
         AufOVZp0eS8z45Qxwan1bOsNcul6Ggib5UiNi0gasCe2bNLCPi/WVvNELozUnpSEoud/
         DxB+LV1al+Wdf5vmIlNILjqgVSddbOBWXemNBGKcqzjNug3rGUeH0FJpNzU7j3n74MjB
         TCZGAY8O1g9lgFsnlcMt6DJlKE4FNRydacBVNqkUSiS+6xsYTaOiRyl5/y9L7sQK+/WE
         tRHAOZQyDIdQ+koXVvrMx2skKwkyconlu2CGdkIsEWHzINIFMq+SGvEKTY6N2Ixlmus7
         UcvA==
X-Forwarded-Encrypted: i=1; AL+hErE4SjWPOVrB2gyA6eTjXa5A2rW5PbupDLkFaxV/PFIJZklReXjqAkSosC3JsjbyMIxZc3cRo8bNnzFDnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z86NE6hiTCUeHUGZ7Lqnl6K2OD6iDcKiro7EhqFUYJsw6gOyOHn
	+2KzSXdc/5OGGvowFV367jlLnRxGF/PgwxBgvWFs5qNcP9PcxCmkJnKjUyVhKGYtRmWlB+4akp6
	Tp84t6yPJrtvVHyyZsuI/3gCrw1CzFFJhVmib91kbngBmvfDmgadug2JfW0/foJxszg==
X-Gm-Gg: AZFdTZcL4WwLmZm7gByzDRHgB9Vw5DHL96HMns7sWPq/8/99joejWvNsChGgyhBiYF2
	hS2ifix2HN8LtJOJfjT5Yvpvna0WF6UHK+LNxlNnigPLGEKtESlzMq3UzkcwDm33aHtlTQ6xsx/
	8pkDuC1pRp3wpgCRuEz3x1drAxb6Js6OayE9aVfS7+WlWnNOb40UN9sxkqmkjQ0f7pd+F83J8Qc
	ZLIHTyBhuFdql4ISr9adyDGAHsn3ZlP54X5DgwqmTa2tRINj9G8GD2j0yIeoYBQeuD2Wa+eRiYW
	h643NiMwAY+dBo/MYcvvJ30SmJRRT9YCmVNoXBjxtJVbG8V2HG/PbWqyBnHS0SDeefcOP8xLatW
	ZeHHkOnVBzWRG9EPFP/Hsz8VMWe2ooIvbfDu+QicV03eQ86nfr1zhUw+i
X-Received: by 2002:a05:620a:29c5:b0:939:6dfa:48fd with SMTP id af79cd13be357-949ba9d921dmr2347846485a.51.1795517859968;
        Tue, 24 Nov 2026 02:57:39 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:939:6dfa:48fd with SMTP id af79cd13be357-949ba9d921dmr2347842785a.51.1795517859263;
        Tue, 24 Nov 2026 02:57:39 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm612415085e9.11.2026.11.24.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:57:38 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:57:22 +0200
Subject: [PATCH v4 1/4] ALSA: pcm: Add snd_pcm_add_named_chmap_ctls() for
 custom control names
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
Message-Id: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-1-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4766;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=hl19CYxsBNzBGsb4cx9iI3WZtG/W1FAakivGdaAzyeo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBW2c9MtJKDnNniUstTybewpVMq1wOBEtLCTau
 Q4AoO8OVCyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawVtnAAKCRAbX0TJAJUV
 VjDOEACbWOmdkkeYIuPB7d5AyUP8WDZAKuybSQRTJ/IRDzEBiljR7UulHvu4qtHEmDlRlaAIAzH
 A88ReQBoZbqB2jQeYCsRay+3EEqiz/HUiiqqE0HQm0McjX2tJmIOibosnjygQGg1zkFaKmlscG2
 yS1xBvJK3gdRuDkGUat4h9RX3lhx2WP1R3qyxvayCdc64Cz1s8i0T7Mh0BGFP+FVmMt0YjfIZse
 HxqLgutOz7AMXbs0I3tDNrcTGLdXNI41R/MdjFy6Q5sIPiSHS8JoSSIvECZKM5tlTHl/3I7rMBc
 hL0HjtGzzEsgjWJGQUxJAvudzW4Gv1TTwwWEOD1BJorPEvYYydy0GtGx9eZvsY4MU9kOjcvVH+N
 5dDXrwdZuD6Itc5OMDdJYsfNk/FH9rf65OxNhPYbanmzaEIJ49p4mZeywhH3AejW3LeB8Oq+JXB
 JTJnX7ZaZti8qnDFQtC/PCaXq9OzFQcd4FttjTJV32hU+54YPZ89jbKQTsxGIi509MxI3tqHIxP
 1QqwkjheY+1Yp9EkM0KFDpo40tHISxS5IjfIjRU/mmqm1573sggWosAokc6RDgR4+gN/z3x5wAM
 hhTicB7ps/vCeqD/KNgTlPMH2A1Ykx/x0vMdMbEl28Irz2eRMEvt801LiaYzxm8k2X59eJMhAEo
 dem/rnQFjFWZEng==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX0uYc5wKkZiWn
 gauzmb8gldFleZgDk2+1nJZBqbwEQnBV5qPuvswbzIDIhcdTFlzAwT3Vdes9cI1hz2tkPC5HVTT
 SYw7yN+saMeS6Odpy7wWkWf/oxrwNgEvbLfkWbgYyjvA42U80+fsnmcXva0QxoL6QlmgaTXE6b9
 TkkUuWTIcIoAsAW9DpDtsY8qisxLaSUh23CS4tGQsboIW/DJHgq66E88urMl6lK6YlCir02zLAR
 hyJ+k/oM3Zhfh8TByxf/hQqQv8+bS0jRbqF/etEOwfT6bQ9Wu9YNfBPsLdPXSI9o1BBh8ulLaWh
 K54W6yZ9H+o5ydslKYSg/jL+wTWRFilmpiaIF5JTnSbINzPMp7t24g0mTNrJgHEIT3e6SWdi+mN
 C9MkSDFCHdsxj0nbx0+LEUKknVmZCaCOTFO24Jv4YO4A2a/gMyYQlkJtoOIcMlXXis5WJd+lTbm
 rY8poaA5e/bFnX1Zqjg==
X-Proofpoint-GUID: -APhWXSW-A68ccKJ_9I03A-D0T4HAj9s
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b056da4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X5dxnz2IbiImVrLPgzYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -APhWXSW-A68ccKJ_9I03A-D0T4HAj9s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXxUBgUvnxIina
 yc3FdP5qh3Ifx2Lze9NnoCmh/wrkaXJSeQ98JFAcCNFCS40EPgP/fq6SNTA5ZKPGB6e4morkCx9
 EpX4yqhkxowMnRkuDopwfZHcwCZ6+Ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add snd_pcm_add_named_chmap_ctls() to allow drivers to register channel
map controls with names other than the default "Playback Channel Map"
and "Capture Channel Map".

This is useful for cards exposing several channel map controls, such as
Qualcomm machine drivers with both HDMI/DP and WSA speaker backends,
where a distinct name makes it clear to userspace which backend the
control belongs to.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 include/sound/pcm.h  |  6 ++++++
 sound/core/pcm_lib.c | 48 ++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 04f58c2ec5c6..eff01f57b45f 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1502,6 +1502,12 @@ extern const struct snd_pcm_chmap_elem snd_pcm_alt_chmaps[];
 #define SND_PCM_CHMAP_MASK_246	(SND_PCM_CHMAP_MASK_24 | (1U << 6))
 #define SND_PCM_CHMAP_MASK_2468	(SND_PCM_CHMAP_MASK_246 | (1U << 8))
 
+int snd_pcm_add_named_chmap_ctls(struct snd_pcm *pcm, int stream,
+				 const char *name,
+				 const struct snd_pcm_chmap_elem *chmap,
+				 int max_channels,
+				 unsigned long private_value,
+				 struct snd_pcm_chmap **info_ret);
 int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 			   const struct snd_pcm_chmap_elem *chmap,
 			   int max_channels,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index e13286b51858..6806b1d258f2 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2585,9 +2585,11 @@ static void pcm_chmap_ctl_private_free(struct snd_kcontrol *kcontrol)
 }
 
 /**
- * snd_pcm_add_chmap_ctls - create channel-mapping control elements
+ * snd_pcm_add_named_chmap_ctls - create channel-mapping control elements
+ *                                 with a custom name
  * @pcm: the assigned PCM instance
  * @stream: stream direction
+ * @name: the control element name
  * @chmap: channel map elements (for query)
  * @max_channels: the max number of channels for the stream
  * @private_value: the value passed to each kcontrol's private_value field
@@ -2596,11 +2598,12 @@ static void pcm_chmap_ctl_private_free(struct snd_kcontrol *kcontrol)
  * Create channel-mapping control elements assigned to the given PCM stream(s).
  * Return: Zero if successful, or a negative error value.
  */
-int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
-			   const struct snd_pcm_chmap_elem *chmap,
-			   int max_channels,
-			   unsigned long private_value,
-			   struct snd_pcm_chmap **info_ret)
+int snd_pcm_add_named_chmap_ctls(struct snd_pcm *pcm, int stream,
+				 const char *name,
+				 const struct snd_pcm_chmap_elem *chmap,
+				 int max_channels,
+				 unsigned long private_value,
+				 struct snd_pcm_chmap **info_ret)
 {
 	struct snd_pcm_chmap *info;
 	struct snd_kcontrol_new knew = {
@@ -2624,10 +2627,7 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 	info->stream = stream;
 	info->chmap = chmap;
 	info->max_channels = max_channels;
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		knew.name = "Playback Channel Map";
-	else
-		knew.name = "Capture Channel Map";
+	knew.name = name;
 	knew.device = pcm->device;
 	knew.count = pcm->streams[stream].substream_count;
 	knew.private_value = private_value;
@@ -2645,4 +2645,32 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 		*info_ret = info;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_pcm_add_named_chmap_ctls);
+
+/**
+ * snd_pcm_add_chmap_ctls - create channel-mapping control elements
+ * @pcm: the assigned PCM instance
+ * @stream: stream direction
+ * @chmap: channel map elements (for query)
+ * @max_channels: the max number of channels for the stream
+ * @private_value: the value passed to each kcontrol's private_value field
+ * @info_ret: store struct snd_pcm_chmap instance if non-NULL
+ *
+ * Create channel-mapping control elements assigned to the given PCM stream(s),
+ * using the default "Playback Channel Map" / "Capture Channel Map" names.
+ * Return: Zero if successful, or a negative error value.
+ */
+int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
+			   const struct snd_pcm_chmap_elem *chmap,
+			   int max_channels,
+			   unsigned long private_value,
+			   struct snd_pcm_chmap **info_ret)
+{
+	const char *name = stream == SNDRV_PCM_STREAM_PLAYBACK ?
+			   "Playback Channel Map" : "Capture Channel Map";
+
+	return snd_pcm_add_named_chmap_ctls(pcm, stream, name, chmap,
+					    max_channels, private_value,
+					    info_ret);
+}
 EXPORT_SYMBOL_GPL(snd_pcm_add_chmap_ctls);

-- 
2.54.0

